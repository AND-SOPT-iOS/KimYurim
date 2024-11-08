//
//  RegisterView.swift
//  35-seminar
//
//  Created by 김유림 on 11/8/24.
//

import UIKit

class RegisterView: BaseView {
    // MARK: - Properties
    private var pageTitleLabel = UILabel()
    
    private var usernameTitleLabel = UILabel()
    private var usernameTextField = UITextField()
    
    private var pwTitleLabel = UILabel()
    private var pwTextField = UITextField()
    
    private var hobbyTitleLabel = UILabel()
    private var hobbyTextField = UITextField()
    
    var registerButton = UIButton()
    
    // MARK: - Methods
    override func setDelegate() {
        usernameTextField.delegate = self
        pwTextField.delegate = self
    }
    
    override func setUI() {
        super.setUI()
        
        pageTitleLabel.configureLabel(size: 20, weight: .bold, text: "회원 가입")
        
        usernameTitleLabel.configureLabel(size: 18, weight: .medium, text: "username")
        
        usernameTextField.autocapitalizationType = .none
        usernameTextField.autocorrectionType = .no
        usernameTextField.spellCheckingType = .no
        usernameTextField.clipsToBounds = true
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.borderColor = UIColor.systemGray5.cgColor
        usernameTextField.layer.cornerRadius = 8
        usernameTextField.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        usernameTextField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0))
        usernameTextField.leftViewMode = .always
        usernameTextField.placeholder = "username"
        
        pwTitleLabel.configureLabel(size: 18, weight: .medium, text: "password")
        
        pwTextField.autocapitalizationType = .none
        pwTextField.autocorrectionType = .no
        pwTextField.spellCheckingType = .no
        pwTextField.clipsToBounds = true
        pwTextField.layer.borderWidth = 1
        pwTextField.layer.borderColor = UIColor.systemGray5.cgColor
        pwTextField.layer.cornerRadius = 8
        pwTextField.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        pwTextField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0))
        pwTextField.leftViewMode = .always
        pwTextField.isSecureTextEntry = true
        pwTextField.textContentType = .oneTimeCode
        pwTextField.placeholder = "password"
        
        hobbyTitleLabel.configureLabel(size: 18, weight: .medium, text: "hobby")
        
        hobbyTextField.autocapitalizationType = .none
        hobbyTextField.autocorrectionType = .no
        hobbyTextField.spellCheckingType = .no
        hobbyTextField.clipsToBounds = true
        hobbyTextField.layer.borderWidth = 1
        hobbyTextField.layer.borderColor = UIColor.systemGray5.cgColor
        hobbyTextField.layer.cornerRadius = 8
        hobbyTextField.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        hobbyTextField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0))
        hobbyTextField.leftViewMode = .always
        hobbyTextField.placeholder = "hobby"
        
        registerButton.configureButton(configType: .filled, title: "가입하기", foregroundColor: .white, backgroundColor: .tintColor)
    }
    
    override func setHierarchy() {
        [pageTitleLabel, usernameTitleLabel, usernameTextField, pwTitleLabel, pwTextField, hobbyTitleLabel, hobbyTextField, registerButton].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        pageTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        usernameTitleLabel.snp.makeConstraints {
            $0.top.equalTo(pageTitleLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
            $0.width.lessThanOrEqualTo(100)
        }
        
        usernameTextField.snp.makeConstraints {
            $0.centerY.equalTo(usernameTitleLabel)
            $0.leading.equalTo(usernameTitleLabel.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }
        
        pwTitleLabel.snp.makeConstraints {
            $0.top.equalTo(usernameTitleLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
            $0.width.lessThanOrEqualTo(100)
        }
        
        pwTextField.snp.makeConstraints {
            $0.centerY.equalTo(pwTitleLabel)
            $0.leading.equalTo(pwTitleLabel.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }
        
        hobbyTitleLabel.snp.makeConstraints {
            $0.top.equalTo(pwTitleLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
            $0.width.lessThanOrEqualTo(100)
        }
        
        hobbyTextField.snp.makeConstraints {
            $0.centerY.equalTo(hobbyTitleLabel)
            $0.leading.equalTo(hobbyTitleLabel.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(hobbyTextField.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
    }
    
    func returnInputs() -> RegisterDTO? {
        guard let username = usernameTextField.text,
              let pw = pwTextField.text,
              let hobby = hobbyTextField.text,
              !username.isEmpty, // TextField가 비어있으면 nil이 아니라 ""이기 때문에 필요.
              !pw.isEmpty,
              !hobby.isEmpty
        else {
            return nil
        }
        return RegisterDTO(username: username, password: pw, hobby: hobby)
    }
}

// MARK: - Extensions
extension RegisterView: UITextFieldDelegate {
    //영문자와 숫자만 입력 가능하게
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
