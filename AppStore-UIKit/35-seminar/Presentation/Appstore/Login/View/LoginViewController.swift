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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conductAutoLogin()
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
        loginViewModel.autoLogin()
        
        loginViewModel.usernameBinding.bind { [weak self] username in
            guard let self = self else { return }
            loginView.usernameTextField.text = username
        }
        
        loginViewModel.passwordBinding.bind { [weak self] password in
            guard let self = self else { return }
            loginView.passwordTextField.text = password
        }
        
        loginViewModel.isAutoLogin.bind { [weak self] isAutoLogin in
            guard let self = self,
                  let isAutoLogin = isAutoLogin else { return }
            loginView.updateAutoLoginCheckButton(autoLogin: isAutoLogin)
        }
        
        loginViewModel.isLoginSuccess.bind { [weak self] isLoginSuccess in
            guard let self = self,
                  let isLoginSuccess = isLoginSuccess else { return }
            isLoginSuccess ? navigateToMainScreen() : EasyAlert.showAlert(title: "로그인 실패",
                                                                 message: loginViewModel.loginErrorMessage,
                                                                 vc: self)
        }
    }
    
    private func handleLoginInfo() -> LoginInfo? {
        guard let username = loginView.getUsername(),
              let password = loginView.getPassword(),
              !username.isEmpty, // TextField가 비어있으면 nil이 아니라 ""이기 때문에 필요.
              !password.isEmpty else {
            return nil
        }
        
        return LoginInfo(username: username, password: password)
    }
    
    private func conductLogin() {
        guard let loginInfo = handleLoginInfo() else {
            EasyAlert.showAlert(
                title: "로그인 실패",
                message: "username과 password를 정확히 입력하세요.",
                vc: self)
            return
        }
        
        loginViewModel.login(loginInfo)
    }
    
    private func conductAutoLogin() {
        if loginViewModel.isAutoLogin.value ?? false {
            conductLogin()
        }
    }
    
    private func navigateToMainScreen() {
        let tabBarController = TabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        self.present(tabBarController, animated: true)
    }
    
    @objc func tappedAutoLoginButton() {
        let autoLogin = UserDefaultsManager.fetchAutoLogin()
        UserDefaultsManager.updateAutoLogin(autoLogin: !autoLogin)
        loginViewModel.isAutoLogin.value = !autoLogin
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
