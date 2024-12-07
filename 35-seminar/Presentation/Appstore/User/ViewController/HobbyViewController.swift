//
//  HobbyViewController.swift
//  35-seminar
//
//  Created by 김유림 on 11/9/24.
//

import UIKit

class HobbyViewController: BaseViewController {
    
    // MARK: - Properties
    private let hobbyView = HobbyView()
    private let appData = App.sampleApps
    
    private let token = UserDefaultsManager.fetchUserData().token
    private var userHobby: String = ""
    
    private var hobbies: [(Int,String)] = []
    private var currentUserNo = 1 // 처음 요청할 유저 번호
    private let pageSize = 30     // 한 번에 요청할 유저 수
    private var isFetching = false // 중복 요청 방지
    private var hasMoreData = true // 추가 요청 가능 여부
    
    // MARK: - Methods
    override func loadView() {
        view = hobbyView
    }
    
    override func viewDidLoad() {
        fetchUserHobby()
        loadMoreHobbies()
        super.viewDidLoad()
    }
    
    override func setNavigationBar() {
        self.navigationController?
            .navigationBar
            .titleTextAttributes = [
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .semibold)]
        self.navigationItem.title = "취미"
    }
    
    override func setDelegate() {
        hobbyView.tableView.dataSource = self
        hobbyView.tableView.delegate = self
        hobbyView.tableView.register(HobbyTableViewCell.self, forCellReuseIdentifier: HobbyTableViewCell.identifier)
        hobbyView.tableView.register(HobbyTableViewHeader.self, forHeaderFooterViewReuseIdentifier: HobbyTableViewHeader.identifier)
    }
    
    private func fetchUserHobby() {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            UserService.shared.fetchUserHobby(token: token) { result in
                switch result {
                case .success(let hobby):
                    self.userHobby = hobby
                    let indexPath = [IndexPath(row: 0, section: 0)]
                    DispatchQueue.main.async {
                        self.hobbyView.tableView.reloadRows(at: indexPath, with: .automatic)
                    }
                    
                case .failure(let error):
                    print("hobby 조회 에러: \(error.errorMessage)")
                }
            }
        }
    }
    
    func loadMoreHobbies() {
        guard !isFetching, hasMoreData else { return }
        isFetching = true
        
        let nextUserNos = (currentUserNo..<(currentUserNo + pageSize)).map { $0 }
        let dispatchGroup = DispatchGroup()
        var newHobbies: [(Int,String)] = []
        var successfulFetches = 0 // 성공적으로 요청한 개수를 기록
        
        for userNo in nextUserNos {
            dispatchGroup.enter()
            
            UserService.shared.fetchOtherHobby(token: token, no: userNo) { result in
                switch result {
                case .success(let hobby):
                    newHobbies.append((userNo, hobby))
                    successfulFetches += 1
                    
                case .failure(let error):
                    print("유저 \(userNo)의 취미를 가져오지 못했습니다. error: \(error)")
                }
                
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            self.isFetching = false
            
            if successfulFetches == 0 {
                self.hasMoreData = false // 현재 페이지에서 모든 요청이 실패하면 추가 로드를 멈춥니다.
                return
            }
            appendNewHobbies(newHobbies: newHobbies)
        }
    }
    
    private func appendNewHobbies(newHobbies: [(Int, String)]) {
        let startIndex = hobbies.count
        let sortedNewHobbies = newHobbies.sorted { $0.0 < $1.0}
        hobbies.append(contentsOf: sortedNewHobbies)
        
        let indexPaths = (startIndex..<hobbies.count).map { IndexPath(row: $0, section: 1) }
        hobbyView.tableView.insertRows(at: indexPaths, with: .automatic)
        currentUserNo += pageSize
    }
}

// MARK: - Extensions
extension HobbyViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return hobbies.count
        default :
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = hobbyView.tableView.dequeueReusableCell(
            withIdentifier: HobbyTableViewCell.identifier,
            for: indexPath
        ) as? HobbyTableViewCell else { return UITableViewCell() }
        
        switch indexPath.section {
        case 0:
            cell.bind(no: nil, content: userHobby)
            print(userHobby, "!!!!!")
        case 1:
            cell.bind(no: hobbies[indexPath.row].0, content: hobbies[indexPath.row].1)
        default:
            return cell
        }
        return cell
    }
}

extension HobbyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HobbyTableViewHeader.identifier) as? HobbyTableViewHeader else { return nil }
        
        headerView.bind(section: section)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1:
            return 70
            
        default:
            return 30
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height * 1.5 {
            loadMoreHobbies()
        }
    }
}
