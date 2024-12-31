//
//  LoginViewModel.swift
//  35-seminar
//
//  Created by 김유림 on 12/31/24.
//

import UIKit

class LoginViewModel {
    
    // MARK: - Methods
    
    func login(strongSelf: UIViewController, loginData: LoginDTO) {
        LoginService.shared.login(
            username: loginData.username,
            password: loginData.password) { [weak self] result in
                guard let self = self else { return }
                handleLoginResult(strongSelf, result: result, loginData: loginData)
            }
    }
    
    private func handleLoginResult(_ strongSelf: UIViewController,
                                   result: Result<String, NetworkError>,
                                   loginData: LoginDTO) {
        switch result {
        case .success(let token):
            UserDefaultsManager
                .registerLoginData(loginData: loginData, token: token)
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
