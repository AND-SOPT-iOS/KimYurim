//
//  ExploreTableViewHeader.swift
//  35-seminar
//
//  Created by 김유림 on 11/6/24.
//

import UIKit

class ExploreTableViewHeader: UITableViewHeaderFooterView {
    
    // MARK: - Properties
    static let identifier = String(describing: ExploreTableViewHeader.self)
    
    private let titlelabel = TitleLabel()
    private let subTItlelabel = SubtitleLabel()
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
        subTItlelabel.text = "App Store 에디터가 직접 골랐습니다"
        allButton.configureButton(title: "모두 보기", fontSize: 17, removeContentInsets: true)
    }
    
    private func setHierarchy() {
        [titlelabel, subTItlelabel, allButton].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setConstraints() {
        titlelabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(20)
        }
        
        allButton.snp.makeConstraints {
            $0.centerY.equalTo(titlelabel)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        subTItlelabel.snp.makeConstraints {
            $0.top.equalTo(titlelabel.snp.bottom).offset(2)
            $0.leading.equalTo(titlelabel)
        }
    }
    
    func bind(section: ExploreSection) {
        switch section {
        case .essential:
            titlelabel.text = "필수 금융 앱"
            subTItlelabel.isHidden = false
        case .paid:
            titlelabel.text = "유료 순위"
            subTItlelabel.isHidden = true
        case .free:
            titlelabel.text = "무료 순위"
            subTItlelabel.isHidden = true
        }
    }
}
