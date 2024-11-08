//
//  RegisterViewController.swift
//  35-seminar
//
//  Created by 김유림 on 11/8/24.
//

import UIKit

class RegisterViewController: BaseViewController {
    
    private let registerView = RegisterView()
    override func loadView() {
        view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func setNavigationBar() { }
    
    override func setDelegate() { }
    
    override func setStyle() { }
    
    override func setAddTarget() {
        registerView.registerButton.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
    }
    
    override func bind() { }
    
    @objc func tappedRegisterButton() {
        // 1. 데이터 다 작성됐는지 확인
        guard let userData: RegisterDTO = registerView.returnInputs() else {
            EasyAlert.showAlert(title: "회원가입 실패", message: "username, password, hobby를 모두 입력하세요.", vc: self)
            return
        }
        
        UserService.shared.register(
            username: userData.username,
            password: userData.password,
            hobby: userData.hobby) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let no):
                    UserDefaults.standard.set(userData.username, forKey: "userName")
                    UserDefaults.standard.set(userData.password, forKey: "password")
                    UserDefaults.standard.set(userData.hobby, forKey: "hobby")
                    
                    EasyAlert.dismissModalAlert(title: "회원가입 성공", message: "회원가입이 완료되었습니다(no.\(no))", vc: self)
                    
                case .failure(let error):
                    EasyAlert.showAlert(title: "회원가입 실패", message: "\(error.errorMessage)", vc: self)
                }
            }
    }
    
}
