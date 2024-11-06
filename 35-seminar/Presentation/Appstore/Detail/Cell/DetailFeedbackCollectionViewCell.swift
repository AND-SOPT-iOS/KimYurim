//
//  DetailFeedbackCollectionViewCell.swift
//  35-seminar
//
//  Created by 김유림 on 11/6/24.
//

import UIKit

class DetailFeedbackCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = String(describing: DetailFeedbackCollectionViewCell.self)
    
    
    private let feedbackBoxStackView = UIStackView()
    private let feedbackTitleStackView = UIStackView()
    private let feedbackTitleLabel = ContentLabel()
    private let feedbackDateLabel = SubtitleLabel()
    
    private let feedbackSubtitleStackView = UIStackView()
    private let feedbackStarStackView = StarStackView()
    private let feedbackAuthorLabel = SubtitleLabel()
    
    private let feedbackContentView = UIView()
    private let feedbackContentLabel = ContentLabel()
    private let feedbackDeveloperTitleLabel = ContentLabel()
    private let feedbackDeveloperContentView = UIView()
    private let feedbackDeveloperContentLabel = ContentLabel()
    private let feedbackDeveloperDateLabel = SubtitleLabel()
    let feedbackMoreButton1 = UIButton()
    let feedbackMoreButton2 = UIButton()
    private let spareView = UIView()

    
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
        feedbackBoxStackView.axis = .vertical
        feedbackBoxStackView.backgroundColor = .systemGray6
        feedbackBoxStackView.distribution = .fill
        feedbackBoxStackView.layer.cornerRadius = 10
        feedbackBoxStackView.spacing = 3
        feedbackBoxStackView.isLayoutMarginsRelativeArrangement = true
        feedbackBoxStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 18, leading: 20, bottom: 18, trailing: 20)
        
        
        [feedbackTitleStackView, feedbackSubtitleStackView].forEach {
            $0.axis = .horizontal
            $0.spacing = 10
        }
        
        feedbackTitleLabel.configureLabel(size: 15, weight: .bold)
        
        feedbackDateLabel.configureLabel(alignment: .right, color: .secondaryLabel, size: 15, weight: .regular)
        feedbackDateLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        
        feedbackStarStackView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        feedbackAuthorLabel.configureLabel(alignment: .right, color: .secondaryLabel, size: 14, weight: .regular)
        
        feedbackContentLabel.setLineSpacing(4)
        
        feedbackDeveloperTitleLabel.configureLabel(size: 15, weight: .semibold, text: "개발자 답변")
        
        feedbackDeveloperContentLabel.setLineSpacing(4)
        
        feedbackDeveloperDateLabel.configureLabel(color: .secondaryLabel, size: 15, weight: .regular)
        
        [feedbackMoreButton1, feedbackMoreButton2].forEach {
            $0.configureButton(title: "더 보기", removeContentInsets: true)
        }
        
        spareView.setContentHuggingPriority(.defaultLow, for: .vertical)
    }
    
    private func setHierarchy() {
        contentView.addSubview(feedbackBoxStackView)
        
        [feedbackTitleStackView, feedbackSubtitleStackView, feedbackContentView, feedbackDeveloperContentView, spareView].forEach {
            feedbackBoxStackView.addArrangedSubview($0)
        }
        
        [feedbackTitleLabel, feedbackDateLabel].forEach {
            feedbackTitleStackView.addArrangedSubview($0)
        }
        
        [feedbackStarStackView, feedbackAuthorLabel].forEach {
            feedbackSubtitleStackView.addArrangedSubview($0)
        }
        
        [feedbackContentLabel, feedbackMoreButton1].forEach {
            feedbackContentView.addSubview($0)
        }
        
        [feedbackDeveloperTitleLabel, feedbackDeveloperDateLabel, feedbackDeveloperContentLabel, feedbackMoreButton2].forEach {
            feedbackDeveloperContentView.addSubview($0)
        }
        
    }
    
    private func setConstraints() {
        feedbackBoxStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        feedbackStarStackView.snp.makeConstraints {
            $0.height.equalTo(16)
            $0.width.equalTo(80)
        }
        
        feedbackContentLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.verticalEdges.equalToSuperview().inset(10)
        }
        
        feedbackMoreButton1.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(feedbackContentLabel)
        }
        
        feedbackDeveloperTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview().offset(5)
        }
        
        feedbackDeveloperDateLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(feedbackDeveloperTitleLabel)
        }
        
        feedbackDeveloperContentLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(feedbackDeveloperTitleLabel.snp.bottom).offset(5)
            $0.bottom.equalToSuperview()
        }
        
        feedbackMoreButton2.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(feedbackDeveloperContentLabel)
        }
        
        spareView.snp.makeConstraints {
            $0.height.greaterThanOrEqualTo(0)
        }
    }
    
    func dataBind(feedback: Feedback) {
        feedbackTitleLabel.text = feedback.title
        feedbackAuthorLabel.text = feedback.author
        feedbackStarStackView.bind(feedback.starCount, .orange)
        feedbackDateLabel.text = feedback.authorDate?.formattedDateToString()
        feedbackContentLabel.text = feedback.content
        feedbackDeveloperContentLabel.text = feedback.developerContent
        feedbackDeveloperDateLabel.text = feedback.developerDate?.formattedDateToString()
        // 개발자 답변 있는지 확인
        if feedback.developerContent == nil {
            feedbackDeveloperContentView.isHidden = true
        } else {
            feedbackDeveloperContentView.isHidden = false
        }
    }
}

// MARK: - Extensions
extension DetailFeedbackCollectionViewCell: StarStackViewDelegate {
    func starStackView(_ view: StarStackView, newCount: Int) {
        feedbackStarStackView.bind(newCount, .orange)
    }
}
