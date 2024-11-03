//
//  Week3LoginViewController.swift
//  35-seminar
//
//  Created by 김유림 on 11/2/24.
//

import UIKit

class Week3LoginViewController: UIViewController {
    
    // MARK: - Properties
    private let idTextField = UITextField()
    private let pwTextField = UITextField()
    let loginButton = UIButton()
    private let statusLabel = UILabel()
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setHierarchy()
        setConstraints()
        setAddTarget()
    }
    
    func setUI() {
        view.backgroundColor = .white
        
        idTextField.placeholder = "아이디"
        idTextField.layer.borderWidth = 1
        idTextField.layer.borderColor = UIColor.systemGray4.cgColor
        idTextField.keyboardType = .emailAddress
        
        pwTextField.placeholder = "비밀번호"
        pwTextField.layer.borderWidth = 1
        pwTextField.layer.borderColor = UIColor.systemGray4.cgColor
        
        loginButton.configureButton(configType: .filled, title: "로그인", foregroundColor: .white, backgroundColor: .tintColor)
        
        statusLabel.configureLabel(alignment: .center, color: .tintColor, size: 16, weight: .regular, numberOfLines: 0)
    }
    
    func setHierarchy() {
        [idTextField, pwTextField, loginButton, statusLabel].forEach {
            view.addSubview($0)
        }
    }
    
    func setConstraints() {
        idTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(50)
            $0.height.equalTo(40)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.horizontalEdges.height.equalTo(idTextField)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        statusLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(50)
        }
    }
    
    func updateStatusLabel(text: String) {
        statusLabel.text = text
    }
    
    func setAddTarget() {
        loginButton.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
    }
    
    @objc func tappedLoginButton() {
        guard let id = idTextField.text,
              let pw = pwTextField.text
        else {
            updateStatusLabel(text: "아이디와 비밀번호를 모두 입력하세요.")
            return
        }
        print("id: \(id), pw: \(pw)")
        LoginService.shared.login(username: id,
                               password: pw) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let token):
                updateStatusLabel(text: "로그인 성공! \ntoken: \(token)")
            case .failure(let error):
                updateStatusLabel(text: error.errorMessage)
            }
        }
    }
}
