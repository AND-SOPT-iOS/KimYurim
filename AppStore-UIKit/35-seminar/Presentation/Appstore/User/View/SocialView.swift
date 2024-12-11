//
//  UserView.swift
//  35-seminar
//
//  Created by 김유림 on 11/8/24.
//

import UIKit
import SnapKit

class SocialView: BaseView {
    // profile
    private let profileStackView = UIStackView()
    private let profileImageView = UIImageView()
    private let userLabelStackView = UIStackView()
    private let userNameLabel = UILabel()
    private let userHobbyLabel = UILabel()
    private let profileChevronImageView = UIImageView()
    let profileButton = UIButton()
    
    // hobby
    private let hobbyStackView = UIStackView()
    private let hobbyImageView = UIImageView()
    private let hobbyLabel = UILabel()
    private let hobbyChevronImageView = UIImageView()
    let hobbyButton = UIButton()
    
    override func setUI() {
        backgroundColor = .systemGray5
        setProfileUI()
        setHobbyUI()
    }
    
    private func setProfileUI() {
        profileStackView.alignment = .center
        profileStackView.axis = .horizontal
        profileStackView.backgroundColor = .systemBackground
        profileStackView.spacing = 16
        profileStackView.isLayoutMarginsRelativeArrangement = true
        profileStackView.layoutMargins = .init(top: 16, left: 16, bottom: 16, right: 16)
        profileStackView.layer.cornerRadius = 16
        
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.backgroundColor = UIColor.systemGray5
        profileImageView.tintColor = .secondaryLabel
        profileImageView.image = UIImage(systemName: "person.fill")
        profileImageView.layer.cornerRadius = 10
        
        userLabelStackView.axis = .vertical
        
        userNameLabel.configureLabel(color: .label, size: 20, weight: .medium)
        
        userHobbyLabel.configureLabel(color: .secondaryLabel, size: 16, weight: .medium)
        
        profileChevronImageView.contentMode = .scaleAspectFit
        profileChevronImageView.image = UIImage(systemName: "chevron.right")
        profileChevronImageView.tintColor = .secondaryLabel
    }
    
    private func setHobbyUI() {
        hobbyStackView.alignment = .center
        hobbyStackView.axis = .horizontal
        hobbyStackView.backgroundColor = .systemBackground
        hobbyStackView.spacing = 16
        hobbyStackView.isLayoutMarginsRelativeArrangement = true
        hobbyStackView.layoutMargins = .init(top: 10, left: 16, bottom: 10, right: 16)
        hobbyStackView.layer.cornerRadius = 16
        
        hobbyImageView.clipsToBounds = true
        hobbyImageView.contentMode = .scaleAspectFit
        hobbyImageView.tintColor = .secondaryLabel
        hobbyImageView.image = UIImage(systemName: "person.3.fill")
        
        hobbyLabel.configureLabel(size: 17, weight: .medium, text: "취미 둘러보기")
        
        hobbyChevronImageView.contentMode = .scaleAspectFit
        hobbyChevronImageView.image = UIImage(systemName: "chevron.right")
        hobbyChevronImageView.tintColor = .secondaryLabel
    }
    
    override func setHierarchy() {
        [profileStackView, profileButton, hobbyStackView, hobbyButton].forEach {
            self.addSubview($0)
        }
        
        [profileImageView, userLabelStackView, profileChevronImageView].forEach {
            profileStackView.addArrangedSubview($0)
        }
        
        [userNameLabel, userHobbyLabel].forEach {
            userLabelStackView.addArrangedSubview($0)
        }
        
        [hobbyImageView, hobbyLabel, hobbyChevronImageView].forEach {
            hobbyStackView.addArrangedSubview($0)
        }
    }
    
    override func setConstraints() {
        let profileHeight: CGFloat = 100
        let profileInset: CGFloat = 16
        
        profileStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(self.safeAreaLayoutGuide)
        }
       
        profileImageView.snp.makeConstraints {
            $0.size.equalTo(profileHeight - profileInset * 2)
        }
        
        profileChevronImageView.snp.makeConstraints {
            $0.size.equalTo(20)
        }
        
        profileButton.snp.makeConstraints {
            $0.edges.equalTo(profileStackView)
        }
        
        hobbyStackView.snp.makeConstraints {
            $0.top.equalTo(profileStackView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        hobbyImageView.snp.makeConstraints {
            $0.size.equalTo(30)
        }
        
        hobbyChevronImageView.snp.makeConstraints {
            $0.size.equalTo(20)
        }
        
        hobbyButton.snp.makeConstraints {
            $0.edges.equalTo(hobbyStackView)
        }
    }
    
    func bind(user: RegisterDTO) {
        userNameLabel.text = user.username
        userHobbyLabel.text = "취미: \(user.hobby)"
    }
}
