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
    private var contentView = UIView()
    private let borderView = UIView()
    
    // 타이틀뷰
    private let titleView = UIView()
    private let iconImageView = UIImageView()
    private let titleLabel = TitleLabel()
    private let subtitleLabel = SubtitleLabel()
    private let openButton = UIButton()
    private let shareButton = UIButton()
    
    // 요약뷰
    private let summaryView = UIView()
    private let summaryRatingSummaryView = UIView()
    private let summaryRatingTitleLabel = SubtitleLabel()
    private let summaryRatingAverageLabel = SubtitleLabel()
    private let summaryRatingStarImageStackView = UIStackView()
    private let summaryRatingStarImageView = UIImageView()
    private let summaryPrizeSummaryView = UIView()
    private let summaryPrizeTitleLabel = SubtitleLabel()
    private let summaryPrizeContentImageView = UIImageView()
    private let summaryPrizeSubtitleLabel = SubtitleLabel()
    private let summaryAgeSummaryView = UIView()
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
    
    // 평가 및 리뷰 뷰
    private let ratingView = UIView()
    private let ratingTitleLabel = TitleLabel()
    private let ratingAverageLabel = TitleLabel()
    private let ratingSubtitleLabel = SubtitleLabel()
    private let ratingTabToRateLabel = SubtitleLabel()
    // TODO: Star rating stack
    
    private let reviewView = UIView()
    private let reviewTitleLabel = ContentLabel()
    private let reviewStarStackView = UIStackView()
    private let reviewStarImageView = UIImageView()
    private let reviewDateLabel = SubtitleLabel()
    private let reviewAuthorLabel = SubtitleLabel()
    private let reviewContentLabel = ContentLabel()
    private let reviewDeveloperTitleLabel = ContentLabel()
    private let reviewDeveloperContentLabel = ContentLabel()
    private let reviewMoreButton = UIButton()
    
    
    
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
    
    func setUI() {
        self.backgroundColor = .systemBackground
        borderView.backgroundColor = .lightGray
    }
    
    func setHierarchy() {
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [titleView, summaryView, updateView].forEach {
            contentView.addSubview($0)
        }
    }
    
    func setConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        titleView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        summaryView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        updateView.snp.makeConstraints {
            $0.top.equalTo(summaryView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(300)
            $0.bottom.equalToSuperview()
        }
    }
}
