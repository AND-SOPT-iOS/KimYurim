//
//  LoginViewController.swift
//  35-seminar
//
//  Created by 김유림 on 11/8/24.
//

import UIKit

class LoginViewController: BaseViewController {
    
    private let loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let username = UserDefaults.standard.string(forKey: UserDefaultsKeys.username) ?? ""
        let password = UserDefaults.standard.string(forKey: UserDefaultsKeys.password) ?? ""
        let autoLogin = UserDefaults.standard.bool(forKey: UserDefaultsKeys.autoLogin)
        loginView.bind(username: username, password: password, autoLogin: autoLogin)
        
        // auto login
        if autoLogin {
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
        
        LoginService.shared.login(
            username: loginData.username,
            password: loginData.password) { [weak self] result in
                guard let self = self else { return }
                handleLoginResult(result: result, loginData: loginData)
            }
    }
    
    private func handleLoginResult(result: Result<String, NetworkError>,
                                   loginData: LoginDTO) {
        switch result {
        case .success(let token):
            UserDefaults.standard.set(loginData.username, forKey: UserDefaultsKeys.username)
            UserDefaults.standard.set(loginData.password, forKey: UserDefaultsKeys.password)
            UserDefaults.standard.set(token, forKey: UserDefaultsKeys.token)
            navigateToMainScreen()
            
            case .failure(let error):
            showLoginError(message: error.errorMessage)
            }
        }
    
    private func navigateToMainScreen() {
        let tabBarController = TabBarController()
            tabBarController.modalPresentationStyle = .fullScreen
            self.present(tabBarController, animated: true)
    }
    
    private func showLoginError(message: String) {
        EasyAlert.showAlert(title: "로그인 실패", message: message, vc: self)
    }
    
    
    @objc func tappedAutoLoginButton() {
        let autoLogin = UserDefaults.standard.bool(forKey: UserDefaultsKeys.autoLogin)
        UserDefaults.standard.set(!autoLogin, forKey: UserDefaultsKeys.autoLogin)
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

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
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
