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
    var isLoginSuccess: ObservablePattern<Bool> = ObservablePattern(nil)
    var loginErrorMessage: String? = nil
    
    
    // MARK: - Methods
    
    func login(_ loginInfo: LoginInfo) {
        LoginService.shared.login(
            username: loginInfo.username,
            password: loginInfo.password) { [weak self] result in
                guard let self = self else { return }
                handleLoginResult(result: result, loginInfo: loginInfo)
            }
    }
    
    private func handleLoginResult(result: Result<String, NetworkError>,
                                   loginInfo: LoginInfo) {
        switch result {
        case .success(let token):
            UserDefaultsManager
                .registerLoginData(loginInfo: loginInfo, token: token)
            isLoginSuccess.value = true
            
        case .failure(let error):
            let message = error.errorMessage
            isLoginSuccess.value = false
        }
    }
    
}
