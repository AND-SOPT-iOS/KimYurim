//
//  HobbyTableViewCell.swift
//  35-seminar
//
//  Created by 김유림 on 11/9/24.
//

import UIKit
import SnapKit

class HobbyTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private let stackView = UIStackView()
    private let noLabel = UILabel()
    private let contentLabel = UILabel()
    
    // MARK: - Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.backgroundColor = .systemBackground
        
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.spacing = 10
        
        noLabel.adjustsFontSizeToFitWidth = true
        noLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        noLabel.configureLabel(size: 17, weight: .medium)
        
        contentLabel.configureLabel(size: 17, weight: .regular, numberOfLines: 0)
    }
    
    func setHierarchy() {
        contentView.addSubview(stackView)
        
        [noLabel, contentLabel].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    func setConstraints() {
        stackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
        
        noLabel.snp.makeConstraints {
            $0.width.equalTo(30)
        }
    }
    
    func bind(no: Int?, content: String) {
        guard let no = no else {
            noLabel.isHidden = true
            contentLabel.text = content
            return
        }
        
        noLabel.isHidden = false
        noLabel.text = String(no)
        contentLabel.text = content
    }
}
