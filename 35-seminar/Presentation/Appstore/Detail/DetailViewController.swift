//
//  DetailViewController.swift
//  35-seminar
//
//  Created by 김유림 on 10/15/24.
//

import UIKit

class DetailViewController: BaseViewController {
    
    // MARK: - Properties
    private let detailView = DetailView()
    
    // MARK: - Methods
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setStarStackViewGesture()
    }
    
    override func setDelegate() {
        detailView.scrollView.delegate = self
    }
    
    override func setAddTarget() {
        detailView.versionRecordButton.addTarget(self, action: #selector (tappedVersionRecordButton), for: .touchUpInside)
        
        detailView.feedbackSummaryAllButton.addTarget(self, action: #selector (tappedFeedbackSummaryAllButton), for: .touchUpInside)
        
        detailView.feedbackWriteButton.addTarget(self, action: #selector(tappedFeedbackWriteButton), for: .touchUpInside)
        
        detailView.descriptionMoreButton.addTarget(self, action: #selector(tappedDescriptionMoreButton), for: .touchUpInside)
    }
    
    private func setNavigationBar() {
        let iconImageView = UIImageView()
        iconImageView.clipsToBounds = true
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.image = .tossIcon
        iconImageView.layer.cornerRadius = 8
        iconImageView.layer.borderColor = UIColor.systemGray5.cgColor
        iconImageView.layer.borderWidth = 0.6
        iconImageView.snp.makeConstraints {
            $0.size.equalTo(28)
        }
        
        let rightBarButton = UIButton()
        rightBarButton.configureButton(configType: .filled,
                                       title: "열기",
                                       fontSize: 16,
                                       fontWeight: .bold,
                                       cornerStyle: .capsule,
                                       foregroundColor: .white,
                                       backgroundColor: .tintColor)
        rightBarButton.snp.makeConstraints {
            $0.width.equalTo(72)
            $0.height.equalTo(32)
        }
        
        self.navigationItem.titleView = iconImageView
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBarButton)
    }
    
    private func setStarStackViewGesture() {
        let panGesture = UIPanGestureRecognizer(target: detailView.tapToRateStarStackView, action: #selector(detailView.tapToRateStarStackView.handlePanGesture))
        detailView.tapToRateStarStackView.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: detailView.tapToRateStarStackView, action: #selector(detailView.tapToRateStarStackView.handleTapGesture))
        detailView.tapToRateStarStackView.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - objc functions
    @objc private func tappedVersionRecordButton() {
        self.navigationController?.pushViewController(VersionRecordViewController(), animated: true)
    }
    
    @objc private func tappedFeedbackSummaryAllButton() {
        self.navigationController?.pushViewController(AllFeedbackViewController(), animated: true)
    }
    
    @objc private func tappedFeedbackWriteButton() {
        let feedbackWriteVC = FeedbackWriteViewController()
        feedbackWriteVC.delegate = self
        self.present(feedbackWriteVC, animated: true)
    }
    
    @objc private func tappedDescriptionMoreButton() {
        detailView.expandDescriptionLabel()
    }
}

// MARK: - Extensions
extension DetailViewController: FeedbackDelegate {
    func dataBind(feedback: Feedback) {
        detailView.dataBind(feedback: feedback)
    }
}

extension DetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let triggerOffset: CGFloat = 80
        
        if offsetY > triggerOffset {
            navigationItem.titleView?.isHidden = false
            navigationItem.rightBarButtonItem?.isHidden = false
        } else {
            navigationItem.titleView?.isHidden = true
            navigationItem.rightBarButtonItem?.isHidden = true
        }
    }
}
