//
//  HobbyViewController.swift
//  35-seminar
//
//  Created by 김유림 on 11/9/24.
//

import UIKit

import RxCocoa
import RxSwift

class HobbyViewController: BaseViewController {
    
    // MARK: - Properties
    private let hobbyView = HobbyView()
    private let disposeBag = DisposeBag()
    
    private let token = UserDefaultsManager.fetchUserData().token
    
    private var userHobby = BehaviorSubject<String>(value: "")
    private var hobbies = BehaviorSubject<[(Int, String)]>(value: [])
    
    private var currentUserNo = BehaviorSubject<Int>(value: 1) // 처음 요청할 유저 번호
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
    
    private func bindView() {
        // 사용자 취미 바인딩
        userHobby
            .observe(on: MainScheduler.instance) // 메인 스레드에서 처리하도록 지정(for UI 업데이트)
            .subscribe(onNext: { [weak self] hobby in
                guard let self = self else { return }
                let indexPath = [IndexPath(row: 0, section: 0)]
                self.hobbyView.tableView.reloadRows(at: indexPath, with: .automatic)
            })
            .disposed(by: disposeBag)
        
        // 취미 목록 바인딩
        hobbies
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                // TODO: insertRows로 수정
                self?.hobbyView.tableView.reloadSections(IndexSet(integer: 1), with: .automatic)
            })
            .disposed(by: disposeBag)
    }
    
    private func fetchUserHobby() {
        // 1. 옵저버블 생성
        UserService.shared.fetchUserHobby(token: token)
        
            // 2. 네트워크 통신 결과가 백그라운드 스레드에서 즉시 방출되도록 설정
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
        
            // 3. 네트워크 요청 성공으로 방출된 옵저버블을 구독 (Single의 onSuccess 클로저)
            .subscribe(onSuccess: { [weak self] hobby in
                // 4. 데이터를 BehaviorSubject인 userHobby에 전달해, userHobby를 구독하는 곳에서 연관 작업 수행
                self?.userHobby.onNext(hobby)
                
            }, onFailure: { error in
                print("hobby 조회 에러: \(error)")
            })
            .disposed(by: disposeBag)
    }
    
    private func observeLoadMore() {
        hobbyView.tableView.rx
            .didScroll
            .withUnretained(self) // self 캡쳐리스트 대신 사용
            .filter { strongSelf, _ in
                let offsetY = strongSelf.hobbyView.tableView.contentOffset.y
                let contentHeight = strongSelf.hobbyView.tableView.contentSize.height
                let height = strongSelf.hobbyView.tableView.frame.size.height
                return offsetY > contentHeight - height * 1.5 && !strongSelf.isFetching
            }
            .subscribe(onNext: { strongSelf, _ in
                strongSelf.loadMoreHobbies()
            })
            .disposed(by: disposeBag)
    }
    
    private func loadMoreHobbies() {
        guard !isFetching, hasMoreData else { return }
        isFetching = true
        
        currentUserNo
            .take(1)
            .withUnretained(self)
            .flatMapLatest { strongSelf, currentNo in // flatMapLatest로 중복 요청 방지
                let nextUserNos = (currentNo..<(currentNo + strongSelf.pageSize)).map { $0 }
                return Observable.merge(nextUserNos.map { userNo in
                    UserService.shared.fetchOtherHobby(token: strongSelf.token, no: userNo)
                        .asObservable()
                        .map { (userNo, $0) }
                        .catchAndReturn(nil)
                })
            }
            .toArray()
            .map { results -> [(Int, String)] in
                results.compactMap { $0 } // nil 값 제거
            }
            .subscribe(onSuccess: { [weak self] newHobbies in
                guard let self = self else { return }
                self.appendNewHobbies(newHobbies: newHobbies)
            }, onFailure: { [weak self] _ in
                self?.hasMoreData = false
            })
            .disposed(by: disposeBag)
    }
    
    private func appendNewHobbies(newHobbies: [(Int, String)]) {
        hobbies
            .take(1)
            .map { currentHobbies in
                let sortedNewHobbies = newHobbies.sorted { $0.0 < $1.0 }
                return currentHobbies + sortedNewHobbies
            }
            .bind(to: hobbies)
            .disposed(by: disposeBag)
        
        let nextUserNo = (try? currentUserNo.value()) ?? 1 + pageSize // TODO: 1로 옵셔널 해제 안 하도록 수정
        currentUserNo.onNext(nextUserNo)
        isFetching = false
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
            return (try? hobbies.value().count) ?? 0
        default:
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
            let hobby = (try? userHobby.value()) ?? ""
            cell.bind(no: nil, content: hobby)
        case 1:
            let hobbies = (try? hobbies.value()) ?? []
            let hobby = hobbies[indexPath.row]
            cell.bind(no: hobby.0, content: hobby.1)
        default:
            break
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
        return section == 1 ? 70 : 30
    }
}
