//
//  AppDetailView.swift
//  35-seminar
//
//  Created by 김유림 on 10/15/24.
//

import UIKit
import SnapKit

class AppDetailView: UIView {
    
    // MARK: - Properties
    private let scrollView = UIScrollView()
    private var contentStackView = UIStackView()
    
    // 타이틀뷰
    private let titleView = UIView()
    private let iconImageView = UIImageView()
    private let titleLabel = TitleLabel()
    private let subtitleLabel = SubtitleLabel()
    private let openButton = UIButton()
    private let shareButton = UIButton()
    
    // 요약뷰
    private let summaryStackView = UIStackView()
    private let verticalBorderView1 = BorderView()
    private let verticalBorderView2 = BorderView()
    
    // 1번칸
    private let summaryRatingStackView = UIStackView()
    private let summaryRatingTitleLabel = SubtitleLabel()
    private let summaryRatingAverageLabel = SubtitleLabel()
    private let summaryRatingStarStackView = StarStackView()
    // 2번칸
    private let summaryPrizeStackView = UIStackView()
    private let summaryPrizeTitleLabel = SubtitleLabel()
    private let summaryPrizeContentImageView = UIImageView()
    private let summaryPrizeSubtitleLabel = SubtitleLabel()
    //3번칸
    private let summaryAgeStackView = UIStackView()
    private let summaryAgeTitleLabel = SubtitleLabel()
    private let summaryAgeLimitLabel = SubtitleLabel()
    private let summaryAgeSubtitleLabel = SubtitleLabel()
    
    // 업데이트뷰
    private let updateView = UIView()
    private let updateTitleLabel = TitleLabel()
    private let updateSubtitleLabel = SubtitleLabel()
    private let updateContentLabel = ContentLabel()
    private let updateRecordButton = UIButton()
    private let updateDateLabel = SubtitleLabel()
    
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
        contentStackView.axis = .vertical
        contentStackView.spacing = 10
        
        setTitleViewUI()
        setSummaryViewUI()
        setUpdateViewUI()
        setPreviewViewUI()
        setDescriptionViewUI()
        setFeedbackSummaryViewUI()
        setFeedbackViewUI()
    }
    
    private func setTitleViewUI() {
        iconImageView.image = UIImage(named: "toss_icon")
        iconImageView.clipsToBounds = true
        iconImageView.layer.cornerRadius = 20
        iconImageView.layer.borderColor = UIColor.systemGray5.cgColor
        iconImageView.layer.borderWidth = 1
        
        titleLabel.text = "토스"
        
        subtitleLabel.text = "금융이 쉬워진다"
        
        openButton.configureButton(configType: .filled,
                                   title: "열기",
                                   fontWeight: .bold,
                                   cornerStyle: .capsule,
                                   foregroundColor: .white,
                                   backgroundColor: .tintColor)
        
        shareButton.configureButton(image: UIImage(systemName: "square.and.arrow.up"),
                                    symbolWeight: .semibold)
        
    }
    
    private func setSummaryViewUI() {
        summaryStackView.axis = .horizontal
        summaryStackView.alignment = .center
        
        [summaryRatingStackView, summaryPrizeStackView, summaryAgeStackView].forEach {
            $0.axis = .vertical
            $0.alignment = .center
        }
        
        [summaryRatingTitleLabel, summaryPrizeTitleLabel, summaryAgeTitleLabel].forEach {
            $0.configureLabel(color: .secondaryLabel, size: 13, weight: .regular)
            $0.textAlignment = .center
        }
        
        [summaryRatingAverageLabel, summaryAgeLimitLabel].forEach {
            $0.configureLabel(color: .secondaryLabel, size: 24, weight: .bold)
            $0.textAlignment = .center
        }
        
        [summaryPrizeSubtitleLabel, summaryAgeSubtitleLabel].forEach {
            $0.configureLabel(color: .secondaryLabel, size: 15, weight: .regular)
            $0.textAlignment = .center
        }
        
        summaryRatingTitleLabel.text = "8.4만개의 평가"
        summaryRatingAverageLabel.text = "4.4"
        summaryRatingStarStackView.bind(4, .gray)
        
        summaryPrizeTitleLabel.text = "수상"
        summaryPrizeContentImageView.image = UIImage(systemName: "person")
        summaryPrizeContentImageView.tintColor = .secondaryLabel
        summaryPrizeContentImageView.contentMode = .scaleAspectFit
        summaryPrizeSubtitleLabel.text = "앱"
        
        summaryAgeTitleLabel.text = "연령"
        summaryAgeLimitLabel.text = "4+"
        summaryAgeSubtitleLabel.text = "세"
    }
    
    private func setUpdateViewUI() {
        updateTitleLabel.text = "새로운 소식"
        updateSubtitleLabel.text = "버전 5.185.0"
        updateContentLabel.text = "• 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요."
        updateContentLabel.setLineSpacing(8)
        
        updateRecordButton.configureButton(title: "버전 기록", fontSize: 19, fontWeight: .light, removeContentInsets: true)
        updateDateLabel.text = "3시간 전"
    }
    
    private func setPreviewViewUI() {
        
    }
    
    private func setDescriptionViewUI() {
        
    }
    
    private func setFeedbackSummaryViewUI() {
        
    }
    
    private func setFeedbackViewUI() {
        
    }
    
    // MARK: - Hierarchy
    private func setHierarchy() {
        setBaseHierarchy()
        setTitleViewHierarchy()
        setSummaryViewHierarchy()
        setUpdateViewHierarchy()
        setPreviewViewHierarchy()
        setDescriptionViewHierarchy()
        setFeedbackSummaryViewHierarchy()
        setFeedbackViewHierarchy()
    }
    
    private func setBaseHierarchy() {
        self.addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        
        [titleView, summaryStackView, updateView, previewView, descriptionView, feedbackSummaryView, feedbackView].forEach {
            let borderView = BorderView()
            contentStackView.addArrangedSubview($0)
            contentStackView.addArrangedSubview(borderView)
            borderView.snp.makeConstraints {
                $0.horizontalEdges.equalToSuperview().inset(20)
                $0.height.equalTo(0.5)
            }
        }
    }
    
    private func setTitleViewHierarchy() {
        [iconImageView, titleLabel, subtitleLabel, openButton, shareButton].forEach {
            titleView.addSubview($0)
        }
    }
    
    private func setSummaryViewHierarchy() {
        [summaryRatingStackView, verticalBorderView1, summaryPrizeStackView, verticalBorderView2, summaryAgeStackView].forEach {
            summaryStackView.addArrangedSubview($0)
        }
        
        [summaryRatingTitleLabel, summaryRatingAverageLabel, summaryRatingStarStackView].forEach {
            summaryRatingStackView.addArrangedSubview($0)
        }
        
        [summaryPrizeTitleLabel, summaryPrizeContentImageView, summaryPrizeSubtitleLabel].forEach {
            summaryPrizeStackView.addArrangedSubview($0)
        }
        
        [summaryAgeTitleLabel, summaryAgeLimitLabel, summaryAgeSubtitleLabel].forEach {
            summaryAgeStackView.addArrangedSubview($0)
        }
    }
    
    private func setUpdateViewHierarchy() {
        [updateTitleLabel, updateSubtitleLabel, updateContentLabel, updateRecordButton, updateDateLabel].forEach {
            updateView.addSubview($0)
        }
    }
    
    private func setPreviewViewHierarchy() {
        
    }
    
    private func setDescriptionViewHierarchy() {
        
    }
    
    private func setFeedbackSummaryViewHierarchy() {
        
    }
    
    private func setFeedbackViewHierarchy() {
        
    }
    
    // MARK: - Constraints
    private func setConstraints() {
        setBaseConstraints()
        setTitleViewConstraints()
        setSummaryViewConstraints()
        setUpdateViewConstraints()
        setPreviewViewConstraints()
        setDescriptionViewConstraints()
        setFeedbackSummaryViewConstraints()
        setFeedbackViewConstraints()
    }
    
    private func setBaseConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        contentStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
    }
    
    private func setTitleViewConstraints() {
        titleView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
        }
        
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
    }
    
    private func setSummaryViewConstraints() {
        summaryStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(84)
        }
        
        [verticalBorderView1, verticalBorderView2].forEach {
            $0.snp.makeConstraints {
                $0.height.equalTo(40)
                $0.width.equalTo(0.5)
            }
        }
        
        summaryRatingStackView.snp.makeConstraints {
            $0.height.equalToSuperview()
            $0.width.equalTo(summaryPrizeStackView)
            $0.width.equalTo(summaryAgeStackView)
        }
        
        summaryPrizeStackView.snp.makeConstraints {
            $0.height.equalToSuperview()
            $0.width.equalTo(summaryRatingStackView)
            $0.width.equalTo(summaryAgeStackView)
        }
        
        summaryAgeStackView.snp.makeConstraints {
            $0.height.equalToSuperview()
            $0.width.equalTo(summaryPrizeStackView)
            $0.width.equalTo(summaryRatingStackView)
        }
        
        [summaryRatingTitleLabel, summaryPrizeTitleLabel, summaryAgeTitleLabel].forEach {
            $0.snp.makeConstraints {
                $0.height.equalTo(30)
            }
        }
        
        [summaryRatingAverageLabel, summaryPrizeContentImageView, summaryAgeLimitLabel].forEach {
            $0.snp.makeConstraints {
                $0.height.equalTo(30)
                $0.horizontalEdges.equalToSuperview()
            }
        }
        
        [summaryRatingStarStackView, summaryPrizeSubtitleLabel, summaryAgeSubtitleLabel].forEach {
            $0.snp.makeConstraints {
                $0.height.equalTo(24)
                $0.horizontalEdges.equalToSuperview().inset(16)
            }
        }
    }
    
    private func setUpdateViewConstraints() {
        updateView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        updateTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        updateSubtitleLabel.snp.makeConstraints {
            $0.top.equalTo(updateTitleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(updateTitleLabel)
        }
        
        updateContentLabel.snp.makeConstraints {
            $0.top.equalTo(updateSubtitleLabel.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
        }
        
        updateRecordButton.snp.makeConstraints {
            $0.bottom.equalTo(updateTitleLabel)
            $0.trailing.equalToSuperview()
        }
        
        updateDateLabel.snp.makeConstraints {
            $0.bottom.equalTo(updateSubtitleLabel)
            $0.trailing.equalToSuperview()
        }
    }
    
    private func setPreviewViewConstraints() {
        
    }
    
    private func setDescriptionViewConstraints() {
        
    }
    
    private func setFeedbackSummaryViewConstraints() {
        
    }
    
    private func setFeedbackViewConstraints() {
        
    }
}
