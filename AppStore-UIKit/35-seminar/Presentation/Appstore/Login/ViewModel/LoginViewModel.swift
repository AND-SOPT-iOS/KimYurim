//
//  LoginViewModel.swift
//  35-seminar
//
//  Created by 김유림 on 12/31/24.
//

import UIKit

class LoginViewModel {
    
    let userData = UserDefaultsManager.fetchUserData()
    var usernameBinding: ObservablePattern<String> = ObservablePattern(nil)
    var passwordBinding: ObservablePattern<String> = ObservablePattern(nil)
    
    
    // MARK: - Methods
    
    func login(strongSelf: UIViewController, loginInfo: LoginInfo) {
        LoginService.shared.login(
            username: loginInfo.username,
            password: loginInfo.password) { [weak self] result in
                guard let self = self else { return }
                handleLoginResult(strongSelf, result: result, loginInfo: loginInfo)
            }
    }
    
    private func handleLoginResult(_ strongSelf: UIViewController,
                                   result: Result<String, NetworkError>,
                                   loginInfo: LoginInfo) {
        switch result {
        case .success(let token):
            UserDefaultsManager
                .registerLoginData(loginInfo: loginInfo, token: token)
            navigateToMainScreen(strongSelf)
            
        case .failure(let error):
            let message = error.errorMessage
            EasyAlert.showAlert(title: "로그인 실패", message: message, vc: strongSelf)
        }
    }
    
    private func navigateToMainScreen(_ strongSelf: UIViewController) {
        let tabBarController = TabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        strongSelf.present(tabBarController, animated: true)
    }
}
