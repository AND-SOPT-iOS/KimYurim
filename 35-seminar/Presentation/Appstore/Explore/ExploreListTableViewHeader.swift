//
//  ExploreTableViewHeader.swift
//  35-seminar
//
//  Created by 김유림 on 11/6/24.
//

import UIKit

class ExploreListTableViewHeader: UITableViewHeaderFooterView {
    
    // MARK: - Properties
    static let identifier = String(describing: ExploreListTableViewHeader.self)
    
    private let titleLabel = TitleLabel()
    private let subTItleLabel = SubtitleLabel()
    private let allButton = UIButton()
    
    // MARK: - Methods
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUI()
        setHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        subTItleLabel.text = "App Store 에디터가 직접 골랐습니다"
        allButton.configureButton(title: "모두 보기", fontSize: 17, removeContentInsets: true)
    }
    
    private func setHierarchy() {
        [titleLabel, subTItleLabel, allButton].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(20)
        }
        
        allButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        subTItleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(2)
            $0.leading.equalTo(titleLabel)
        }
    }
    
    func bind(section: ExploreSection) {
        switch section {
        case .essential:
            titleLabel.text = "필수 금융 앱"
            subTItleLabel.isHidden = false
        case .paid:
            titleLabel.text = "유료 순위"
            subTItleLabel.isHidden = true
        case .free:
            titleLabel.text = "무료 순위"
            subTItleLabel.isHidden = true
        }
    }
}
