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
    
    private let horizontalStackView = UIStackView()
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
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 15
        horizontalStackView.alignment = .center
//        horizontalStackView.distribution = .fillProportionally
        
        titleStackView.axis = .vertical
        titleStackView.spacing = 5
        
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.clipsToBounds = true
        iconImageView.layer.cornerRadius = 10
        iconImageView.layer.borderColor = UIColor.systemGray5.cgColor
        iconImageView.layer.borderWidth = 1
        iconImageView.image = appData?.iconImage
        
        rankingLabel.configureLabel(size: 16, weight: .bold, text: String(appData?.ranking ?? 0))
        rankingLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        titleLabel.configureLabel(size: 16, weight: .regular, text: appData?.title, numberOfLines: 2)
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        subtitleLabel.configureLabel(size: 14, weight: .regular, text: appData?.subtitle, numberOfLines: 2)
        
        switch appData?.downloadState {
        case .installed:
            downloadButton.configureButton(configType: .gray, title: "열기", fontSize: 17, fontWeight: .semibold, cornerStyle: .capsule)
        case .download:
            downloadButton.configureButton(configType: .gray, title: "받기", fontSize: 17, fontWeight: .semibold, cornerStyle: .capsule)
        case .redownload:
            downloadButton.configureButton(configType: .plain, systemName: "icloud.and.arrow.down", pointSize: 17, symbolWeight: .semibold)
        case .update:
            downloadButton.configureButton(configType: .gray, title: "업데이트", fontSize: 17, fontWeight: .semibold, cornerStyle: .capsule)
        case nil:
            return
        }
        downloadButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
    private func setHierarchy() {
        self.addSubview(horizontalStackView)
        
        [iconImageView, rankingLabel, titleStackView, downloadButton].forEach {
            horizontalStackView.addArrangedSubview($0)
        }
        
        [titleLabel, subtitleLabel].forEach {
            titleStackView.addArrangedSubview($0)
        }
    }
    
    private func setConstraints() {
        horizontalStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
            $0.height.equalTo(70)
        }
        
        titleStackView.snp.makeConstraints {
            $0.height.lessThanOrEqualTo(iconImageView)
            $0.centerY.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints {
            $0.size.equalTo(horizontalStackView.snp.height)
        }
        
        downloadButton.snp.makeConstraints {
            $0.width.greaterThanOrEqualTo(76)
            $0.height.equalTo(32)
            $0.centerY.equalToSuperview()
        }
    }
    
    func bind(appData: App) {
        self.appData = appData
        setUI()
    }
}

