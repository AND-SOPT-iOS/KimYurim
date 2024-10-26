//
//  AppDetailView 2.swift
//  35-seminar
//
//  Created by 김유림 on 10/25/24.
//


import UIKit
import SnapKit

protocol FeedbackDelegate: AnyObject {
    func dataBind(feedback: Feedback)
}

class AppDetailView: UIView {
    
    // MARK: - Properties
    private var feedback: Feedback?
    private let initialFeedback = Feedback(title: "김유림", author: "ISTJ", starCount: 5, authorDate: Date.form(year: 2023, month: 12, day: 20), content: "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세", developerContent: "안녕하세요, 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다.", developerDate: Date.form(year: 2024, month: 5, day: 30))
    
    let scrollView = UIScrollView()
    private let contentStackView = UIStackView()
    
    // 타이틀뷰
    private let titleView = UIView()
    private let iconImageView = UIImageView()
    private let titleLabel = TitleLabel()
    private let subtitleLabel = SubtitleLabel()
    let openButton = UIButton()
    let shareButton = UIButton()
    
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
    
    // 버전 뷰
    private let versionView = UIView()
    private let versionTitleLabel = TitleLabel()
    private let versionSubtitleLabel = SubtitleLabel()
    private let versionContentLabel = ContentLabel()
    let versionRecordButton = UIButton()
    private let versionDateLabel = SubtitleLabel()
    
    // 미리보기뷰
    private let previewView = UIView()
    private let previewTitleLabel = TitleLabel()
    private let previewImageView = UIImageView()
    private let previewDeviceImageView = UIImageView()
    private let previewDeviceLabel = SubtitleLabel()
    
    // 앱 설명 뷰
    private let descriptionView = UIView()
    private let descriptionLabel = ContentLabel()
    let descriptionMoreButton = UIButton()
    
    private let developerView = UIView()
    private let developerNameLabel = ContentLabel()
    private let developerRoleLabel = SubtitleLabel()
    private let chevronImageView = UIImageView()
    let developerButton = UIButton()
    
    // 피드백 요약 뷰
    private let feedbackSummaryView = UIView()
    private let feedbackSummaryTitleLabel = TitleLabel()
    private let feedbackSummaryAverageLabel = TitleLabel()
    private let feedbackSummarySubtitleLabel = SubtitleLabel()
    let feedbackSummaryAllButton = UIButton()
    private let feedbackSummaryStarsImageView = UIImageView()
    private let feedbackSummaryCountLabel = SubtitleLabel()
    
    // 피드백 뷰
    private let feedbackView = UIView()
    private let feedbackTapToRateStackView = UIStackView()
    private let tapToRateLabel = SubtitleLabel()
    let tapToRateStarStackView = StarStackView()
    
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
    
    let feedbackWriteButton = UIButton()
    let appSupportButton = UIButton()
    
    // MARK: - Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        feedback = initialFeedback
        setUI()
        setHierarchy()
        setConstraints()
        tapToRateStarStackView.delegate = self
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
        setVersionViewUI()
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
        
        titleLabel.configureLabel(size: 23, weight: .semibold, text: "토스")
        
        subtitleLabel.text = "금융이 쉬워진다"
        
        openButton.configureButton(configType: .filled,
                                   title: "열기",
                                   fontSize: 16,
                                   fontWeight: .bold,
                                   cornerStyle: .capsule,
                                   foregroundColor: .white,
                                   backgroundColor: .tintColor)
        
        shareButton.configureButton(systemName: "square.and.arrow.up",
                                    pointSize: 16,
                                    symbolWeight: .semibold)
        
    }
    
    private func setSummaryViewUI() {
        summaryStackView.axis = .horizontal
        summaryStackView.alignment = .center
        
        [summaryRatingStackView, summaryPrizeStackView, summaryAgeStackView].forEach {
            $0.axis = .vertical
            $0.alignment = .center
            $0.distribution = .equalSpacing
        }
        
        [summaryRatingTitleLabel, summaryPrizeTitleLabel, summaryAgeTitleLabel].forEach {
            $0.configureLabel(color: .secondaryLabel, size: 11, weight: .regular)
            $0.textAlignment = .center
        }
        
        [summaryRatingAverageLabel, summaryAgeLimitLabel].forEach {
            $0.configureLabel(color: .secondaryLabel, size: 22, weight: .bold)
            $0.textAlignment = .center
        }
        
        [summaryPrizeSubtitleLabel, summaryAgeSubtitleLabel].forEach {
            $0.configureLabel(color: .secondaryLabel, size: 13, weight: .regular)
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
    
    private func setVersionViewUI() {
        versionTitleLabel.text = "새로운 소식"
        versionSubtitleLabel.text = "버전 5.185.0"
        versionContentLabel.text = "• 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요."
        versionContentLabel.setLineSpacing(8)
        
        versionRecordButton.configureButton(title: "버전 기록", fontSize: 17, fontWeight: .regular, removeContentInsets: true)
        versionDateLabel.text = "3시간 전"
    }
    
    private func setPreviewViewUI() {
        previewTitleLabel.text = "미리 보기"
        
        previewImageView.image = UIImage(named: "toss_preview") // NSBundle 오류 발생
        previewImageView.contentMode = .scaleAspectFill
        previewImageView.clipsToBounds = true
        previewImageView.layer.cornerRadius = 20
        previewImageView.layer.borderColor = UIColor.systemGray5.cgColor
        previewImageView.layer.borderWidth = 1
        
        previewDeviceImageView.image = UIImage.configureImage(systemName: "iphone", symbolWeight: .regular)?.withTintColor(.secondaryLabel)
        previewDeviceImageView.contentMode = .scaleAspectFit
        
        previewDeviceLabel.configureLabel(color: .secondaryLabel, size: 13, weight: .semibold, text: "iPhone")
    }
    
    private func setDescriptionViewUI() {
        let description = """
토스뱅크, 토스증권 서비스를 이용하시려면 토스 앱 설치가 필요합니다.
        • 내 금융 현황을 한눈에, 홈•소비
        • 모든 계좌의 모든 정보를 한 곳에서, 따로 보았던 예적금, 청약, 증권, 대출 계좌의 정보를 한 곳에서 확인할 수 있어 요.
        • 얼마나 벌고 얼마나 썼을까? 한 달 동안의 수입과 소비를 시간순으로 모아볼 수 있고, 소비 분석 리포트도 제공해드 려요.
        • 카드 실적 헷갈릴 필요 없이, 실적을 충족한 카드가 무엇 인지 얼마나 더 써야 실적을 달성하는지 한눈에 확인할 수 있어요.
        • 매달 고정적으로 나가는 보험비, 생활요금, 구독료 등도 쉽게 확인할 수 있어요.
        • 평생 무료로 간편하고 안전하게, 송금
        • 송금을 자유롭게, 토스에서는 은행 상관없이 수수료가 평 생 무료에요.
        • 송금을 안전하게, 송금 전 사기계좌를 미리 조회해 안전 하게 송금할 수 있어요.
        • 송금을 간편하게, 단 한 번의 터치까지 줄였어요. 최소한 의 터치로 송금하세요.
        • 그리고 마음까지, 간단한 메시지와 이모티콘을 함께 보내 보세요.
"""
        descriptionLabel.text = description
        descriptionLabel.numberOfLines = 3
        descriptionLabel.setLineSpacing(8)
        
        descriptionMoreButton.configureButton(title: "더 보기", fontWeight: .light, removeContentInsets: true)
        
        developerNameLabel.configureLabel(color: .tintColor, size: 15, weight: .regular, text: "Viva Republica")
        
        developerRoleLabel.configureLabel(color: .secondaryLabel, size: 14, weight: .regular, text: "개발자")
        
        chevronImageView.image = UIImage(systemName: "chevron.right")
        chevronImageView.contentMode = .scaleAspectFit
        chevronImageView.tintColor = .secondaryLabel
    }
    
    private func setFeedbackSummaryViewUI() {
        feedbackSummaryTitleLabel.text = "평가 및 리뷰"
        
        feedbackSummaryAverageLabel.configureLabel(color: .label, size: 60, weight: .bold, text: "4.4")
        
        feedbackSummarySubtitleLabel.configureLabel(color: .secondaryLabel, size: 15, weight: .bold, text: "5점 만점")
        
        feedbackSummaryAllButton.configureButton(title: "모두 보기", removeContentInsets: true)
        
        feedbackSummaryStarsImageView.image = UIImage(named: "summary_stars")
        feedbackSummaryStarsImageView.contentMode = .scaleAspectFit
        
        feedbackSummaryCountLabel.text = "8.4만개의 평가"
    }
    
    private func setFeedbackViewUI() {
        feedbackTapToRateStackView.axis = .horizontal
        feedbackTapToRateStackView.spacing = 10
        
        tapToRateLabel.configureLabel(color: .secondaryLabel, size: 17, weight: .medium, text: "탭하여 평가하기:")
        tapToRateLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        tapToRateStarStackView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        tapToRateStarStackView.bind(feedback?.starCount ?? 0, .tint)
        
        feedbackBoxStackView.axis = .vertical
        feedbackBoxStackView.backgroundColor = .systemGray6
        feedbackBoxStackView.layer.cornerRadius = 10
        feedbackBoxStackView.spacing = 3
        feedbackBoxStackView.isLayoutMarginsRelativeArrangement = true
        feedbackBoxStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 18, leading: 20, bottom: 18, trailing: 20)
        
        
        [feedbackTitleStackView, feedbackSubtitleStackView].forEach {
            $0.axis = .horizontal
            $0.spacing = 10
        }
        
        feedbackTitleLabel.configureLabel(size: 15, weight: .bold, text: feedback?.title)
        
        feedbackDateLabel.configureLabel(alignment: .right, color: .secondaryLabel, size: 15, weight: .regular, text: Date.formattedDate(date: feedback?.authorDate))
        feedbackDateLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        feedbackStarStackView.bind(feedback?.starCount ?? 0, .orange)
        feedbackStarStackView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        feedbackAuthorLabel.configureLabel(alignment: .right, color: .secondaryLabel, size: 14, weight: .regular, text: feedback?.author)
        
        feedbackContentLabel.text = feedback?.content
        feedbackContentLabel.setLineSpacing(4)
        
        feedbackDeveloperTitleLabel.configureLabel(size: 15, weight: .semibold, text: "개발자 답변")
        
        feedbackDeveloperContentLabel.text = feedback?.developerContent
        feedbackDeveloperContentLabel.setLineSpacing(4)
        
        feedbackDeveloperDateLabel.configureLabel(color: .secondaryLabel, size: 15, weight: .regular, text: Date.formattedDate(date: feedback?.developerDate))
        
        [feedbackMoreButton1, feedbackMoreButton2].forEach {
            $0.configureButton(title: "더 보기", removeContentInsets: true)
        }
        
        feedbackWriteButton.configureButton(title: " 리뷰 작성", fontSize: 17, systemName: "square.and.pencil")
        
        appSupportButton.configureButton(title: " 앱 지원", fontSize: 17, systemName: "questionmark.circle")
    }
    
    // MARK: - Hierarchy
    private func setHierarchy() {
        setBaseHierarchy()
        setTitleViewHierarchy()
        setSummaryViewHierarchy()
        setVersioinViewHierarchy()
        setPreviewViewHierarchy()
        setDescriptionViewHierarchy()
        setFeedbackSummaryViewHierarchy()
        setFeedbackViewHierarchy()
    }
    
    private func setBaseHierarchy() {
        self.addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        
        [titleView, summaryStackView, versionView, previewView, descriptionView, feedbackSummaryView, feedbackView].forEach {
            let borderView = BorderView()
            contentStackView.addArrangedSubview($0)
            contentStackView.addArrangedSubview(borderView)
            borderView.snp.makeConstraints {
                $0.horizontalEdges.equalToSuperview().inset(20)
                $0.height.equalTo(0.4)
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
    
    private func setVersioinViewHierarchy() {
        [versionTitleLabel, versionSubtitleLabel, versionContentLabel, versionRecordButton, versionDateLabel].forEach {
            versionView.addSubview($0)
        }
    }
    
    private func setPreviewViewHierarchy() {
        [previewTitleLabel, previewImageView, previewDeviceImageView, previewDeviceLabel].forEach {
            previewView.addSubview($0)
        }
    }
    
    private func setDescriptionViewHierarchy() {
        [descriptionLabel, descriptionMoreButton, developerView].forEach {
            descriptionView.addSubview($0)
        }
        
        [developerNameLabel, developerRoleLabel, chevronImageView, developerButton].forEach {
            developerView.addSubview($0)
        }
    }
    
    private func setFeedbackSummaryViewHierarchy() {
        [feedbackSummaryTitleLabel, feedbackSummaryAverageLabel, feedbackSummarySubtitleLabel, feedbackSummaryAllButton, feedbackSummaryStarsImageView, feedbackSummaryCountLabel].forEach {
            feedbackSummaryView.addSubview($0)
        }
    }
    
    private func setFeedbackViewHierarchy() {
        [feedbackTapToRateStackView, feedbackBoxStackView, feedbackWriteButton, appSupportButton].forEach {
            feedbackView.addSubview($0)
        }
        
        [tapToRateLabel, tapToRateStarStackView].forEach {
            feedbackTapToRateStackView.addArrangedSubview($0)
        }
        
        [feedbackTitleStackView, feedbackSubtitleStackView, feedbackContentView, feedbackDeveloperContentView].forEach {
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
    
    // MARK: - Constraints
    private func setConstraints() {
        setBaseConstraints()
        setTitleViewConstraints()
        setSummaryViewConstraints()
        setVersionViewConstraints()
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
            $0.width.equalTo(72)
            $0.height.equalTo(32)
        }
        
        shareButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(iconImageView)
            $0.size.equalTo(32)
        }
    }
    
    private func setSummaryViewConstraints() {
        summaryStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(72)
        }
        
        [verticalBorderView1, verticalBorderView2].forEach {
            $0.snp.makeConstraints {
                $0.height.equalTo(40)
                $0.width.equalTo(0.4)
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
                $0.height.equalTo(20)
            }
        }
        
        [summaryRatingAverageLabel, summaryPrizeContentImageView, summaryAgeLimitLabel].forEach {
            $0.snp.makeConstraints {
                $0.height.equalTo(24)
                $0.horizontalEdges.equalToSuperview()
            }
        }
        
        [summaryRatingStarStackView, summaryPrizeSubtitleLabel, summaryAgeSubtitleLabel].forEach {
            $0.snp.makeConstraints {
                $0.height.equalTo(20)
                $0.horizontalEdges.equalToSuperview().inset(20)
            }
        }
    }
    
    private func setVersionViewConstraints() {
        versionView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        versionTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        versionSubtitleLabel.snp.makeConstraints {
            $0.top.equalTo(versionTitleLabel.snp.bottom).offset(5)
            $0.leading.equalTo(versionTitleLabel)
        }
        
        versionContentLabel.snp.makeConstraints {
            $0.top.equalTo(versionSubtitleLabel.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
        }
        
        versionRecordButton.snp.makeConstraints {
            $0.bottom.equalTo(versionTitleLabel)
            $0.trailing.equalToSuperview()
        }
        
        versionDateLabel.snp.makeConstraints {
            $0.bottom.equalTo(versionSubtitleLabel)
            $0.trailing.equalToSuperview()
        }
    }
    
    private func setPreviewViewConstraints() {
        previewView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        previewTitleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        previewImageView.snp.makeConstraints {
            $0.top.equalTo(previewTitleLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(500)
            $0.width.equalTo(240)
        }
        
        previewDeviceImageView.snp.makeConstraints {
            $0.top.equalTo(previewImageView.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
            $0.size.equalTo(18)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        previewDeviceLabel.snp.makeConstraints {
            $0.bottom.equalTo(previewDeviceImageView)
            $0.leading.equalTo(previewDeviceImageView.snp.trailing).offset(5)
        }
    }
    
    private func setDescriptionViewConstraints() {
        descriptionView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview().offset(10)
        }
        
        descriptionMoreButton.snp.makeConstraints {
            $0.bottom.equalTo(descriptionLabel)
            $0.trailing.equalToSuperview()
        }
        
        developerView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(30)
            $0.bottom.equalToSuperview().offset(-30)
            $0.horizontalEdges.equalToSuperview()
        }
        
        developerNameLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        developerRoleLabel.snp.makeConstraints {
            $0.top.equalTo(developerNameLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        chevronImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.size.equalTo(20)
        }
    }
    
    private func setFeedbackSummaryViewConstraints() {
        feedbackSummaryView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        feedbackSummaryTitleLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
        }
        
        feedbackSummaryAverageLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(feedbackSummaryTitleLabel.snp.bottom)
            $0.width.equalTo(100)
            $0.height.equalTo(64)
        }
        
        feedbackSummarySubtitleLabel.snp.makeConstraints {
            $0.centerX.equalTo(feedbackSummaryAverageLabel)
            $0.top.equalTo(feedbackSummaryAverageLabel.snp.bottom)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        feedbackSummaryAllButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(feedbackSummaryTitleLabel)
        }
        
        feedbackSummaryStarsImageView.snp.makeConstraints {
            $0.leading.equalTo(feedbackSummaryAverageLabel.snp.trailing).offset(20)
            $0.trailing.equalToSuperview()
            $0.verticalEdges.equalTo(feedbackSummaryAverageLabel).inset(5)
        }
        
        feedbackSummaryCountLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(feedbackSummarySubtitleLabel)
        }
    }
    
    private func setFeedbackViewConstraints() {
        feedbackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        feedbackTapToRateStackView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(28)
        }
        
        feedbackBoxStackView.snp.makeConstraints {
            $0.top.equalTo(feedbackTapToRateStackView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
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
        
        feedbackWriteButton.snp.makeConstraints {
            $0.top.equalTo(feedbackBoxStackView.snp.bottom).offset(20)
            $0.leading.equalTo(feedbackBoxStackView)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        appSupportButton.snp.makeConstraints {
            $0.top.equalTo(feedbackBoxStackView.snp.bottom).offset(20)
            $0.trailing.equalTo(feedbackBoxStackView)
        }
    }
    
    func dataBind(feedback: Feedback) {
        self.feedback = feedback
        feedbackTitleLabel.text = feedback.title
        feedbackAuthorLabel.text = feedback.author
        feedbackStarStackView.bind(feedback.starCount ?? 0, .orange)
        feedbackDateLabel.text = Date.formattedDate(date: feedback.authorDate)
        feedbackContentLabel.text = feedback.content
        feedbackDeveloperContentLabel.text = feedback.developerContent
        feedbackDeveloperDateLabel.text = Date.formattedDate(date: feedback.developerDate)
        tapToRateStarStackView.bind(feedback.starCount ?? 0, .tint)
        
        // 개발자 답변 있는지 확인
        if feedback.developerContent == nil {
            feedbackDeveloperContentView.isHidden = true
        } else {
            feedbackDeveloperContentView.isHidden = false
        }
    }
    
    func expandDescriptionLabel() {
        descriptionLabel.numberOfLines = 0
        descriptionMoreButton.isHidden = true
    }
}

extension AppDetailView: StarStackViewDelegate {
    func starStackView(_ view: StarStackView, newCount: Int) {
        feedback?.starCount = newCount
        feedbackStarStackView.bind(newCount, .orange)
    }
}
