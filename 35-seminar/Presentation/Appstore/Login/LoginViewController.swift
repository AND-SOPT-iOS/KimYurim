//
//  LoginViewController.swift
//  35-seminar
//
//  Created by 김유림 on 11/8/24.
//

import UIKit

class LoginViewController: BaseViewController {
    
    private let loginView = LoginView()
    
    var id: String? = nil
    var pw: String? = nil
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setNavigationBar() { }
    
    override func setDelegate() {
        loginView.usernameTextField.delegate = self
    }
    
    override func setStyle() { }
    
    override func setAddTarget() {
        loginView.autoLoginCheckButton.addTarget(self, action: #selector(tappedAutoLoginButton), for: .touchUpInside)
        loginView.loginButton.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        loginView.registerButton.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
    }
    
    override func bind() {
        let username = UserDefaults.standard.string(forKey: "username") ?? ""
        let password = UserDefaults.standard.string(forKey: "password") ?? ""
        loginView.bind(username: username, password: password)
        
        // auto login
        if LoginStatus.login == true {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.conductLogin()
            }
        }
    }
    
    private func conductLogin() {
        guard let loginData: LoginDTO = loginView.returnInputs() else {
            EasyAlert.showAlert(title: "로그인 실패", message: "username과 password를 정확히 입력하세요.", vc: self)
            return
        }
        
        LoginService.shared.login(
            username: loginData.username, password: loginData.password) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let token):
                    UserDefaults.standard.set(token, forKey: "token")
                    let tabBarController = TabBarController()
                    tabBarController.modalPresentationStyle = .fullScreen
                    self.present(tabBarController, animated: true)
                case .failure(let error):
                    EasyAlert.showAlert(title: "로그인 실패", message: error.errorMessage, vc: self)
                }
            }
    }
    
    @objc func tappedAutoLoginButton() {
        LoginStatus.autoLogin = !LoginStatus.autoLogin
        loginView.updateAutoLoginCheckButton(autoLogin: LoginStatus.autoLogin)
    }
    
    @objc func tappedLoginButton() {
        LoginStatus.login = true
        print("loginStatus: \(LoginStatus.login)")
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
