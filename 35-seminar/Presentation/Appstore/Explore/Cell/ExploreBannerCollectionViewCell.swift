//
//  ExploreBannerCollectionViewCell.swift
//  35-seminar
//
//  Created by 김유림 on 11/5/24.
//

import UIKit

class ExploreBannerCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = String(describing: ExploreBannerCollectionViewCell.self)
    static let height = 290
    
    private var app: App?
    private let veryLightGray = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
    
    private let stackView = UIStackView()
    private let bigLabelStackView = UIStackView()
    private let tagLabel = UILabel()
    private let bigTitleLabel = UILabel()
    private let bigSubTitleLabel = UILabel()
    
    private let bgImageView = UIImageView()
    private let titleStackView = UIStackView()
    private let infoStackView = UIStackView()
    
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let categoryLabel = UILabel()
    private let downloadButton = UIButton()
    
    // MARK: - Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        
        bigLabelStackView.axis = .vertical
        bigLabelStackView.spacing = 1
        
        tagLabel.configureLabel(color: .tintColor, size: 12, weight: .medium)
        bigTitleLabel.configureLabel(color: .label, size: 22, weight: .regular)
        bigSubTitleLabel.configureLabel(color: .secondaryLabel, size: 19, weight: .regular)
        
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.clipsToBounds = true
        bgImageView.layer.cornerRadius = 8
        bgImageView.backgroundColor = .orange
        bgImageView.tintColor = .gray
        
        infoStackView.axis = .horizontal
        infoStackView.alignment = .trailing
        infoStackView.spacing = 5
        
        titleStackView.axis = .vertical
        titleStackView.alignment = .leading
        titleStackView.distribution = .fill
        
        iconImageView.backgroundColor = .systemGray5
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.clipsToBounds = true
        iconImageView.layer.cornerRadius = 6
        iconImageView.layer.borderColor = UIColor.systemGray5.cgColor
        iconImageView.layer.borderWidth = 1
        
        titleLabel.configureLabel(color: .white, size: 15, weight: .semibold)
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        subtitleLabel.configureLabel(color: veryLightGray, size: 13, weight: .regular)
        subtitleLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
    }
    
    private func setHierarchy() {
        [stackView, iconImageView, titleStackView, downloadButton].forEach {
            self.contentView.addSubview($0)
        }
        
        [bigLabelStackView, bgImageView].forEach {
            stackView.addArrangedSubview($0)
        }
        
        [tagLabel, bigTitleLabel, bigSubTitleLabel].forEach {
            bigLabelStackView.addArrangedSubview($0)
        }
        
        [titleLabel, subtitleLabel].forEach {
            titleStackView.addArrangedSubview($0)
        }
    }
    
    private func setConstraints() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        bgImageView.snp.makeConstraints {
            $0.height.equalTo(216)
        }
        
        iconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().offset(-20)
            $0.size.equalTo(36)
        }
        
        titleStackView.snp.makeConstraints {
            $0.verticalEdges.equalTo(iconImageView)
            $0.leading.equalTo(iconImageView.snp.trailing).offset(12)
            $0.trailing.equalTo(downloadButton.snp.leading).offset(-12)
        }
        
        downloadButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalTo(iconImageView)
            $0.width.greaterThanOrEqualTo(76)
            $0.height.equalTo(32)
        }
    }
    
    func bind(appData: App) {
        self.app = appData
        tagLabel.text = appData.tag
        bigTitleLabel.text = appData.title
        bigSubTitleLabel.text = appData.subtitle
        bgImageView.image = appData.bannerImage
        iconImageView.image = appData.iconImage
        titleLabel.text = appData.title
        subtitleLabel.text = appData.subtitle
        
        // downloadButton
        let backgroundColor = veryLightGray.withAlphaComponent(0.6)
        switch appData.downloadState {
        case .installed:
            downloadButton.configureButton(configType: .filled, title: "열기", fontSize: 16, fontWeight: .bold, cornerStyle: .capsule, foregroundColor: .white, backgroundColor: backgroundColor)
            
        case .download:
            if appData.price == 0 {
                downloadButton.configureButton(configType: .filled, title: "받기", fontSize: 16, fontWeight: .bold, cornerStyle: .capsule, foregroundColor: .white, backgroundColor: backgroundColor)
            } else {
                downloadButton.configureButton(configType: .filled, title: appData.price.toWonString(), fontSize: 16, fontWeight: .bold, cornerStyle: .capsule, foregroundColor: .white, backgroundColor: backgroundColor)
            }
            
        case .redownload:
            downloadButton.configureButton(configType: .plain, systemName: "icloud.and.arrow.down", pointSize: 16, symbolWeight: .semibold, foregroundColor: .white)
            downloadButton.snp.remakeConstraints {
                $0.trailing.equalToSuperview().offset(-20)
                $0.centerY.equalTo(iconImageView)
                $0.width.equalTo(30)
                $0.height.equalTo(32)
            }
            
        case .update:
            downloadButton.configureButton(configType: .filled, title: "업데이트", fontSize: 16, fontWeight: .bold, cornerStyle: .capsule, foregroundColor: .white, backgroundColor: backgroundColor)
        }
    }
}
