//
//  LoginViewModel.swift
//  35-seminar
//
//  Created by 김유림 on 12/31/24.
//

import UIKit

class LoginViewModel {
    
    let userData = UserDefaultsManager.fetchUserData()
    var isAutoLogin: ObservablePattern<Bool> = ObservablePattern(nil)
    var usernameBinding: ObservablePattern<String> = ObservablePattern(nil)
    var passwordBinding: ObservablePattern<String> = ObservablePattern(nil)
    var isLoginSuccess: ObservablePattern<Bool> = ObservablePattern(nil)
    var loginErrorMessage: String? = nil
    
    
    // MARK: - Methods
    
    init() {
        setSavedLoginInfo()
    }
    
    func setSavedLoginInfo() {
        let username = userData.username
        let password = userData.password
        
        usernameBinding.value = username
        passwordBinding.value = password
        isAutoLogin.value = userData.autoLogin
    }
    
    func autoLogin() {
        if isAutoLogin.value ?? false {
            let username = userData.username
            let password = userData.password
            let loginInfo = LoginInfo(username: username, password: password)
            
            login(loginInfo)
        }
    }
    
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
            loginErrorMessage = error.errorMessage
            isLoginSuccess.value = false
        }
    }
    
}
