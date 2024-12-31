//
//  LoginViewController.swift
//  35-seminar
//
//  Created by 김유림 on 11/8/24.
//

import UIKit

class LoginViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let loginView = LoginView()
    private let loginViewModel = LoginViewModel()
    
    
    // MARK: - Methods
    
    override func loadView() {
        view = loginView
    }
    
    override func setDelegate() {
        loginView.usernameTextField.delegate = self
    }
    
    override func setAddTarget() {
        loginView.autoLoginCheckButton.addTarget(self, action: #selector(tappedAutoLoginButton), for: .touchUpInside)
        loginView.loginButton.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        loginView.registerButton.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
    }
    
    override func bind() {
        // auto login
        let userData = UserDefaultsManager.fetchUserData()
        
        loginView.bind(username: userData.username,
                       password: userData.password,
                       autoLogin: userData.autoLogin)
        
        if userData.autoLogin {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.conductLogin()
            }
        }
    }
    
    private func conductLogin() {
        guard let loginData: LoginDTO = loginView.returnInputs() else {
            EasyAlert.showAlert(
                title: "로그인 실패",
                message: "username과 password를 정확히 입력하세요.",
                vc: self)
            return
        }
        
        loginViewModel.login(strongSelf: self, loginData: loginData)
    }
    
    @objc func tappedAutoLoginButton() {
        let autoLogin = UserDefaultsManager.fetchAutoLogin()
        UserDefaultsManager.updateAutoLogin(autoLogin: !autoLogin)
        loginView.updateAutoLoginCheckButton(autoLogin: !autoLogin)
    }
    
    @objc func tappedLoginButton() {
        LoginStatus.login = true
        conductLogin()
    }
    
    @objc func tappedRegisterButton() {
        let registerVC = RegisterViewController()
        self.present(registerVC, animated: true)
    }
}


// MARK: - Extensions

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: [])
            if regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil {
                return false
            }
        }
        catch {
            print("ERROR")
        }
        return true
    }
}
