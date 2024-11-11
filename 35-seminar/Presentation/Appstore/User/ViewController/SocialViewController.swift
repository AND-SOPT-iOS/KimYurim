//
//  UserViewController.swift
//  35-seminar
//
//  Created by 김유림 on 11/8/24.
//

import UIKit

class SocialViewController: BaseViewController {
    
    private let socialView = SocialView()
    private var userInfo: RegisterDTO? = nil
    
    override func loadView() {
        view = socialView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setNavigationBar() {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .semibold)]
        self.navigationItem.title = "소셜"
    }
    
    override func setAddTarget() {
        socialView.profileButton.addTarget(self, action: #selector(tappedProfileButton), for: .touchUpInside)
        
        socialView.hobbyButton.addTarget(self, action: #selector(tappedHobbyButton), for: .touchUpInside)
    }
    
    override func bind() {
        let userData = UserDefaultsManager.fetchUserData()
        
        UserService.shared.fetchUserHobby(token: userData.token) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let hobby):
                let userInfo = RegisterDTO(
                    username: userData.username,
                    password: userData.password,
                    hobby: hobby)
                
                socialView.bind(user: userInfo)
                self.userInfo = userInfo
                
            case .failure(let error):
                print("hobby 조회 에러: \(error.errorMessage)")
            }
        }
    }
    
    @objc func tappedProfileButton() {
        let userAccountVC = AccountViewController(userInfo: userInfo)
        self.navigationController?.pushViewController(userAccountVC, animated: true)
    }
    
    @objc func tappedHobbyButton() {
        let hobbyVC = HobbyViewController()
        self.navigationController?.pushViewController(hobbyVC, animated: true)
    }
}

