//
//  ChartTableViewCell.swift
//  35-seminar
//
//  Created by 김유림 on 10/26/24.
//

import UIKit
import SnapKit

class ChartTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = String(describing: ChartTableViewCell.self)
    private var appData: App?
    
    private let labelHorizontalStackView = UIStackView()
    private let titleStackView = UIStackView()
    private let infoStackView = UIStackView()
    
    private let iconImageView = UIImageView()
    private let rankingLabel = UILabel()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let categoryLabel = UILabel()
    private let downloadButton = UIButton()
    
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setUI() {
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
    }
    
    private func setHierarchy() {
        [iconImageView, labelHorizontalStackView, downloadButton].forEach {
            self.addSubview($0)
        }
        
        [rankingLabel, titleStackView].forEach {
            labelHorizontalStackView.addArrangedSubview($0)
        }
        
        [titleLabel, subtitleLabel].forEach {
            titleStackView.addArrangedSubview($0)
        }
    }
    
    private func setConstraints() {
        iconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
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
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalToSuperview()
            $0.width.greaterThanOrEqualTo(76)
            $0.height.equalTo(32)
        }
    }
    
    func bind(appData: App) {
        self.appData = appData
        iconImageView.image = appData.iconImage
        rankingLabel.text = String(appData.ranking)
        titleLabel.text = appData.title
        subtitleLabel.text = appData.subtitle
        
        let price = appData.price
        switch appData.downloadState {
        case .installed:
            downloadButton.configureButton(configType: .gray, title: "열기", fontSize: 16, fontWeight: .bold, cornerStyle: .capsule)
        case .download:
            if appData.price == 0 {
                downloadButton.configureButton(configType: .gray, title: "받기", fontSize: 16, fontWeight: .bold, cornerStyle: .capsule)
            } else {
                let size: CGFloat = {
                    if price < 10000 { return 16 }
                    else if price < 100000 { return 14 }
                    else { return 11 }
                }()
                
                downloadButton.configureButton(configType: .gray, title: price.toWonString(), fontSize: size, fontWeight: .bold, cornerStyle: .capsule)
            }
        case .redownload:
            downloadButton.configureButton(configType: .plain, systemName: "icloud.and.arrow.down", pointSize: 16, symbolWeight: .semibold)
        case .update:
            downloadButton.configureButton(configType: .gray, title: "업데이트", fontSize: 16, fontWeight: .bold, cornerStyle: .capsule)
        }
    }
}

