//
//  AppDetailView.swift
//  35-seminar
//
//  Created by 김유림 on 10/15/24.
//

import UIKit

class AppDetailView: UIView {
    
    // MARK: - Properties
    private let scrollView = UIScrollView()
    private var contentView = UIStackView()
    
    // 타이틀뷰
    private let titleView = UIView()
    private let iconImageView = UIImageView()
    private let titleLabel = TitleLabel()
    private let subtitleLabel = SubtitleLabel()
    private let openButton = UIButton()
    private let shareButton = UIButton()
    
    // 요약뷰
    private let summaryView = UIView()
    // 1번칸
    private let summaryRatingView = UIView()
    private let summaryRatingTitleLabel = SubtitleLabel()
    private let summaryRatingAverageLabel = SubtitleLabel()
    private let summaryRatingStarStackView = StarStackView()
    // 2번칸
    private let summaryPrizeView = UIView()
    private let summaryPrizeTitleLabel = SubtitleLabel()
    private let summaryPrizeContentImageView = UIImageView()
    private let summaryPrizeSubtitleLabel = SubtitleLabel()
    //3번칸
    private let summaryAgeView = UIView()
    private let summaryAgeTitleLabel = SubtitleLabel()
    private let summaryAgeContentLabel = SubtitleLabel()
    private let summaryAgeSubtitleLabel = SubtitleLabel()
    
    // 업데이트뷰
    private let updateView = UIView()
    private let updateTitleLabel = TitleLabel()
    private let updateSubtitleLabel = SubtitleLabel()
    private let updateContentLabel = ContentLabel()
    
    // 미리보기뷰
    private let previewView = UIView()
    private let previewTitleLabel = TitleLabel()
    private let previewImageView = UIImageView()
    
    // 앱 설명 뷰
    private let descriptionView = UIView()
    private let descriptionLabel = ContentLabel()
    private let descriptionMoreButton = UIButton()
    
    // 피드백 요약 뷰
    private let feedbackSummaryView = UIView()
    private let feedbackSummaryTitleLabel = TitleLabel()
    private let feedbackSummaryAverageLabel = TitleLabel()
    private let feedbackSummarySubtitleLabel = SubtitleLabel()
    private let feedbackSummaryTabToRateLabel = SubtitleLabel()
    let feedbackSummaryStarStackView = UIStackView()
    
    // 피드백 뷰
    private let feedbackView = UIView()
    private let feedbackGuideLabel = ContentLabel()
    private let feedbackStarStackView = UIStackView()
    private let feedbackStarImageView = UIImageView()
    private let feedbackDateLabel = SubtitleLabel()
    private let feedbackAuthorLabel = SubtitleLabel()
    private let feedbackContentLabel = ContentLabel()
    private let feedbackDeveloperTitleLabel = ContentLabel()
    private let feedbackDeveloperContentLabel = ContentLabel()
    private let feedbackMoreButton = UIButton()
    
    
    
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
    
    // MARK: UI
    private func setUI() {
        self.backgroundColor = .systemBackground
        contentView.axis = .vertical
        contentView.spacing = 10
        setTitleViewUI()
    }
    
    private func setTitleViewUI() {
        iconImageView.image = UIImage(named: "toss_icon")
        iconImageView.clipsToBounds = true
        iconImageView.layer.cornerRadius = 20
        iconImageView.layer.borderColor = UIColor.systemGray5.cgColor
        iconImageView.layer.borderWidth = 1
        
        titleLabel.text = "토스"
        subtitleLabel.text = "금융이 쉬워진다"
        
        var openButtonConfig = UIButton.Configuration.filled()
        openButtonConfig.buttonSize = .mini
        openButtonConfig.cornerStyle = .capsule
        let attributes: [NSAttributedString.Key: Any] = [.font : UIFont.systemFont(ofSize: 17, weight: .bold)]
        let attributedTitle = NSAttributedString(string: "열기", attributes: attributes)
        openButton.configuration = openButtonConfig
        openButton.setAttributedTitle(attributedTitle, for: .normal)
        
        let symbolConfig = UIImage.SymbolConfiguration(weight: .medium)
        var shareButtonConfig = UIButton.Configuration.plain()
        shareButtonConfig.image = UIImage(systemName: "square.and.arrow.up",
                                          withConfiguration: symbolConfig)
        shareButton.configuration = shareButtonConfig
    }
    
    // TODO: summary view
    
    // TODO: update view
    
    // TODO: previewView
    
    // TODO: descriptionView
    
    // TODO: feedbackSummaryView
    
    // TODO: feedbackView
    
    
    // MARK: - Hierarchy
    private func setHierarchy() {
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [titleView, summaryView, updateView, previewView, descriptionView, feedbackSummaryView, feedbackView].forEach {
            contentView.addArrangedSubview($0)
            contentView.addArrangedSubview(BorderView())
        }
        
        setTitleViewHierarchy()
        setSummaryViewHierarchy()
        setUpdateViewHierarchy()
        
    }
    
    private func setTitleViewHierarchy() {
        [iconImageView, titleLabel, subtitleLabel, openButton, shareButton].forEach {
            titleView.addSubview($0)
        }
    }
    
    private func setSummaryViewHierarchy() {
        [summaryRatingView, summaryPrizeView, summaryAgeView].forEach {
            summaryView.addSubview($0)
        }
        
        [summaryRatingTitleLabel, summaryRatingAverageLabel, summaryRatingStarStackView].forEach {
            summaryRatingView.addSubview($0)
        }
        
        [summaryPrizeTitleLabel, summaryPrizeContentImageView, summaryPrizeSubtitleLabel].forEach {
            summaryPrizeView.addSubview($0)
        }
        
        [summaryAgeTitleLabel, summaryAgeContentLabel, summaryAgeSubtitleLabel].forEach {
            summaryAgeView.addSubview($0)
        }
    }
    
    private func setUpdateViewHierarchy() {
        [updateTitleLabel, updateSubtitleLabel, updateContentLabel].forEach {
            updateView.addSubview($0)
        }
    }
    
    // TODO: previewView
    
    // TODO: descriptionView
    
    // TODO: feedbackSummaryView
    
    // TODO: feedbackView
    
    
    // MARK: - Constraints
    private func setConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        // 타이틀뷰
        iconImageView.snp.makeConstraints {
            $0.size.equalTo(128)
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(16)
            $0.top.equalTo(iconImageView)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        
        openButton.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.bottom.equalTo(iconImageView)
            $0.width.equalTo(76)
            $0.height.equalTo(34)
        }
        
        shareButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(iconImageView)
            
        }
        
        // TODO: SummaryView
        summaryView.snp.makeConstraints {
            $0.height.equalTo(300)
        }
        
        // TODO: UpdateView
        updateView.snp.makeConstraints {
            $0.height.equalTo(300)
        }
        
        // TODO: previewView
        
        // TODO: descriptionView
        
        // TODO: feedbackSummaryView
        
        // TODO: feedbackView
    }
}
