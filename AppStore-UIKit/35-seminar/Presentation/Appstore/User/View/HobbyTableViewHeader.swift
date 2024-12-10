//
//  HobbyTableViewHeader.swift
//  35-seminar
//
//  Created by 김유림 on 11/11/24.
//

import UIKit
import SnapKit

class HobbyTableViewHeader: UITableViewHeaderFooterView {
    
    // MARK: - Properties
    private let verticalStackView = UIStackView()
    private let titleLabel = UILabel()
    private let horizontalStackView = UIStackView()
    private let noLabel = UILabel()
    private let contentLabel = UILabel()
    
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
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 5
        
        titleLabel.configureLabel(color: .secondaryLabel, size: 14, weight: .medium)
        
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 10
        
        noLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        noLabel.configureLabel(color: .label, size: 17, weight: .medium, text: "no")
        
        contentLabel.configureLabel(color: .label, size: 17, weight: .medium, text: "취미", numberOfLines: 0)
    }
    
    private func setHierarchy() {
        contentView.addSubview(verticalStackView)
        
        [titleLabel, horizontalStackView].forEach {
            verticalStackView.addArrangedSubview($0)
        }
        
        [noLabel, contentLabel].forEach {
            horizontalStackView.addArrangedSubview($0)
        }
    }
    
    private func setConstraints() {
        verticalStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.height.equalTo(20)
        }
        
        noLabel.snp.makeConstraints {
            $0.size.equalTo(30)
        }
        
        contentLabel.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.width.greaterThanOrEqualTo(100)
        }
    }
    
    func bind(section: Int) {
        if section == 0 {
            titleLabel.text = "나의 취미"
            horizontalStackView.isHidden = true
        } else {
            titleLabel.text = "친구들의 취미"
            horizontalStackView.isHidden = false
        }
    }
}
