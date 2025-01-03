//
//  LoginView.swift
//  35-seminar
//
//  Created by 김유림 on 11/8/24.
//

import UIKit

class LoginView: BaseView {
    
    // MARK: - Properties
    
    private var verticalStackView = UIStackView()
    private var iconImageView = UIImageView()
    
    var usernameTextField = UITextField()
    var passwordTextField = UITextField()
    
    private let autoLoginCheckStackView = UIStackView()
    private let autoLoginEmptyView = UIView()
    var autoLoginCheckButton = UIButton()
    private let autoLoginCheckLabel = UILabel()
    
    let loginButton = UIButton()
    let registerButton = UIButton()
    
    
    // MARK: - Methods
    
    override func setDelegate() { }
    
    override func setUI() {
        super.setUI()
        
        verticalStackView.alignment = .center
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .systemBackground
        verticalStackView.spacing = 16
        
        iconImageView.tintColor = .white
        iconImageView.image = UIImage.appstoreIcon
        iconImageView.contentMode = .scaleAspectFit
        
        usernameTextField.autocapitalizationType = .none
        usernameTextField.autocorrectionType = .no
        usernameTextField.spellCheckingType = .no
        usernameTextField.clipsToBounds = true
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.borderColor = UIColor.systemGray5.cgColor
        usernameTextField.layer.cornerRadius = 30
        usernameTextField.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        usernameTextField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0))
        usernameTextField.leftViewMode = .always
        usernameTextField.placeholder = "username"
        
        passwordTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = .no
        passwordTextField.spellCheckingType = .no
        passwordTextField.clipsToBounds = true
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.systemGray5.cgColor
        passwordTextField.layer.cornerRadius = 30
        passwordTextField.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        passwordTextField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0))
        passwordTextField.leftViewMode = .always
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textContentType = .oneTimeCode
        passwordTextField.placeholder = "password"
        
        autoLoginCheckStackView.alignment = .center
        autoLoginCheckStackView.axis = .horizontal
        autoLoginCheckStackView.spacing = 4
        
        updateAutoLoginCheckButton(autoLogin: LoginStatus.login)
        
        autoLoginCheckLabel.configureLabel(color: .secondaryLabel, size: 16, weight: .regular, text: "자동 로그인")
        
        loginButton.layer.cornerRadius = 30
        loginButton.configureButton(configType: .filled, title: "로그인", fontSize: 20, fontWeight: .medium, foregroundColor: .white, backgroundColor: .tintColor)
        
        registerButton.configureButton(title: "회원가입", fontSize: 16)
    }
    
    override func setHierarchy() {
        self.addSubview(verticalStackView)
        
        [iconImageView, usernameTextField, passwordTextField, autoLoginCheckStackView, loginButton, registerButton].forEach {
            verticalStackView.addArrangedSubview($0)
        }
        
        [autoLoginEmptyView, autoLoginCheckButton, autoLoginCheckLabel].forEach {
            autoLoginCheckStackView.addArrangedSubview($0)
        }
    }
    
    override func setConstraints() {
        verticalStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(40)
        }
        
        iconImageView.snp.makeConstraints {
            $0.size.equalTo(50)
        }
        
        usernameTextField.snp.makeConstraints {
            $0.height.equalTo(60)
            $0.horizontalEdges.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints {
            $0.height.equalTo(60)
            $0.horizontalEdges.equalToSuperview()
        }
        
        // 자동로그인 뷰: top, height, trailing, width
        autoLoginCheckStackView.snp.makeConstraints {
            $0.height.equalTo(26)
            $0.horizontalEdges.equalToSuperview()
        }
        
        autoLoginCheckButton.snp.makeConstraints {
            $0.size.equalTo(26)
        }
        
        autoLoginCheckLabel.snp.makeConstraints {
            $0.height.equalTo(26)
            $0.width.greaterThanOrEqualTo(70)
        }
        
        loginButton.snp.makeConstraints {
            $0.height.equalTo(60)
            $0.horizontalEdges.equalToSuperview()
        }
    }
    
    func updateAutoLoginCheckButton(autoLogin: Bool) {
        if autoLogin {
            autoLoginCheckButton.configureButton(systemName: "checkmark.square.fill", foregroundColor: .systemGray5)
        } else {
            autoLoginCheckButton.configureButton(systemName: "square.fill", foregroundColor: .systemGray5)
        }
    }
    
}

extension LoginView {
    
    func getUsername() -> String? {
        return usernameTextField.text
    }
    
    func getPassword() -> String? {
        return passwordTextField.text
    }
    
}
