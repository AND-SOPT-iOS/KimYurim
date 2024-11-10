//
//  UserViewController.swift
//  35-seminar
//
//  Created by 김유림 on 11/8/24.
//

import UIKit

class UserViewController: BaseViewController {
    
    private let userView = UserView()
    
    override func loadView() {
        view = userView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setNavigationBar() {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .semibold)]
        self.navigationItem.title = "소셜"
    }
    
    override func setDelegate() { }
    
    override func setStyle() { }
    
    override func setAddTarget() {
        
        
        userView.hobbyButton.addTarget(self, action: #selector(tappedHobbyButton), for: .touchUpInside)
    }
    
    override func bind() {
        let username = UserDefaults.standard.string(forKey: UserDefaultsKeys.username) ?? ""
        let password = UserDefaults.standard.string(forKey: UserDefaultsKeys.password) ?? ""
        let token = UserDefaults.standard.string(forKey: UserDefaultsKeys.token) ?? ""
        
        UserService.shared.fetchUserHobby(token: token) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let hobby):
                userView.bind(user: RegisterDTO(username: username, password: password, hobby: hobby))
            case .failure(let error):
                print("hobby 조회 에러: \(error.errorMessage)")
            }
        }
    }
    
    @objc func tappedHobbyButton() {
        let hobbyVC = HobbyViewController()
        self.navigationController?.pushViewController(hobbyVC, animated: true)
    }
}

