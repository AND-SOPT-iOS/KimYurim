//
//  UserAccountView.swift
//  35-seminar
//
//  Created by 김유림 on 11/11/24.
//

import UIKit

class AccountView: BaseView {
    // MARK: - Properties
    private let profileImageSize: CGFloat = 140
    
    private let profileImageView = UIImageView()
    private let nameLabel = TitleLabel()
    private let editButton = UIButton()
    private let infoView = UIView()
    private let hobbyLabel = UILabel()
    let hobbyTextField = UITextField()
    private let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    private let borderView = BorderView()
    
    // MARK: - Methods
    override func setUI() {
        self.backgroundColor = .systemGray6
        
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.backgroundColor = UIColor.systemGray5
        profileImageView.tintColor = .secondaryLabel
        profileImageView.image = UIImage(systemName: "person.fill")
        profileImageView.layer.borderColor = UIColor.systemGray3.cgColor
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.cornerRadius = profileImageSize / 2
        
        editButton.configureButton(title: "수정하기", fontSize: 17, removeContentInsets: true)
        
        infoView.backgroundColor = .systemBackground
        infoView.layer.cornerRadius = 20
        
        hobbyLabel.configureLabel(size: 17, weight: .regular, text: "취미")
        
        hobbyTextField.textColor = .secondaryLabel
        hobbyTextField.placeholder = "취미를 입력하세요."
        hobbyTextField.isEnabled = false
        
        passwordLabel.configureLabel(size: 17, weight: .regular, text: "비밀번호")
        
        passwordTextField.textColor = .secondaryLabel
        passwordTextField.placeholder = "비밀번호를 입력하세요."
        passwordTextField.isEnabled = false
    }
    
    override func setHierarchy() {
        [profileImageView, nameLabel, editButton, infoView].forEach {
            self.addSubview($0)
        }
        
        [hobbyLabel, hobbyTextField, borderView, passwordLabel, passwordTextField].forEach {
            infoView.addSubview($0)
        }
    }
    
    override func setConstraints() {
        let spacing = 16
        let infoViewInset = 20
        let infoViewVerticalInset = 10
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(profileImageSize)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        editButton.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(30)
            $0.trailing.equalTo(infoView)
        }
        
        infoView.snp.makeConstraints {
            $0.top.equalTo(editButton.snp.bottom).offset(spacing)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        hobbyLabel.snp.makeConstraints {
            $0.leading.top.equalTo(infoView).offset(infoViewInset)
            $0.width.equalTo(36)
        }
        
        hobbyTextField.snp.makeConstraints {
            $0.leading.equalTo(hobbyLabel.snp.trailing).offset(spacing)
            $0.centerY.equalTo(hobbyLabel)
            $0.trailing.equalToSuperview().offset(-infoViewInset)
        }
        
        borderView.snp.makeConstraints {
            $0.top.equalTo(hobbyLabel.snp.bottom).offset(infoViewVerticalInset)
            $0.horizontalEdges.equalToSuperview().inset(10)
            $0.height.equalTo(1)
        }
        
        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(borderView.snp.bottom).offset(infoViewVerticalInset)
            $0.leading.equalTo(hobbyLabel)
            $0.width.equalTo(66)
            $0.bottom.equalToSuperview().offset(-infoViewInset)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.leading.equalTo(passwordLabel.snp.trailing).offset(spacing)
            $0.centerY.equalTo(passwordLabel)
            $0.trailing.equalToSuperview().offset(-infoViewInset)
        }
    }
    
    func bind(editable: Bool, name: String, hobby: String, password: String) {
        hobbyTextField.isEnabled = editable
        passwordTextField.isEnabled = editable
        
        nameLabel.text = name
        hobbyTextField.text = hobby
        passwordTextField.text = password
    }
}
