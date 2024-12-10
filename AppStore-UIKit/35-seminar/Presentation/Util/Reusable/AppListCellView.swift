//
//  AppCellView.swift
//  35-seminar
//
//  Created by 김유림 on 11/3/24.
//

import UIKit

final class AppListCellView: BaseView {
    
    // MARK: - Properties
    private var appData: App?
    
    private let labelHorizontalStackView = UIStackView()
    private let titleStackView = UIStackView()
    private let infoStackView = UIStackView()
    
    private let iconImageView = UIImageView()
    private let rankingLabel = UILabel()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let categoryLabel = UILabel()
    let downloadButton = UIButton()
    
    private let coverView = UIView()
    let coverButton = UIButton()
    
    // MARK: - Methods
    override func setUI() {
        labelHorizontalStackView.axis = .horizontal
        labelHorizontalStackView.alignment = .top
        labelHorizontalStackView.spacing = 16
        
        titleStackView.axis = .vertical
        titleStackView.alignment = .leading
        titleStackView.spacing = 4
        
        iconImageView.backgroundColor = .systemGray5
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.clipsToBounds = true
        iconImageView.layer.cornerRadius = 14
        iconImageView.layer.borderColor = UIColor.systemGray5.cgColor
        iconImageView.layer.borderWidth = 1
        
        rankingLabel.configureLabel(size: 17, weight: .semibold)
        rankingLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        titleLabel.configureLabel(color: .label, size: 17, weight: .regular, numberOfLines: 2)
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        subtitleLabel.configureLabel(color: .secondaryLabel, size: 14, weight: .regular, numberOfLines: 2)
        subtitleLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        coverView.backgroundColor = .systemBackground
        coverView.isHidden = true
    }
    
    override func setHierarchy() {
        [iconImageView, labelHorizontalStackView, downloadButton, coverView, coverButton].forEach {
            self.addSubview($0)
        }
        
        [rankingLabel, titleStackView].forEach {
            labelHorizontalStackView.addArrangedSubview($0)
        }
        
        [titleLabel, subtitleLabel].forEach {
            titleStackView.addArrangedSubview($0)
        }
    }
    
    override func setConstraints() {
        iconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.verticalEdges.equalToSuperview().inset(12)
            $0.size.equalTo(64)
        }
        
        labelHorizontalStackView.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(12)
            $0.trailing.equalTo(downloadButton.snp.leading).offset(-12)
            $0.centerY.equalToSuperview()
        }
        
        titleStackView.snp.makeConstraints {
            $0.height.lessThanOrEqualTo(iconImageView)
        }
        
        downloadButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.greaterThanOrEqualTo(76)
            $0.height.equalTo(32)
        }
        
        coverView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        coverButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func bind(appData: App) {
        self.appData = appData
        iconImageView.image = appData.iconImage
        rankingLabel.text = String(appData.ranking)
        titleLabel.text = appData.title
        subtitleLabel.text = appData.subtitle
        DownloadButtonFactory.shapeButton(button: downloadButton,
                                          type: appData.downloadState,
                                          price: appData.price)
    }
    
    func hideContents(hidden: Bool) {
        coverView.isHidden = !hidden
    }
}
