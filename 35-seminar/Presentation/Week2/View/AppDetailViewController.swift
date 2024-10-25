//
//  AppDetailViewController.swift
//  35-seminar
//
//  Created by 김유림 on 10/15/24.
//

import UIKit

class AppDetailViewController: UIViewController {
    
    // MARK: - Properties
    private let appDetailView = AppDetailView()
    
    // MARK: - Methods
    override func loadView() {
        view = appDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setButtonAction()
        setStarStackViewGesture()
    }
    
    private func setNavigationBar() {
        let iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.image = .tossIcon
        iconImageView.layer.cornerRadius = 8
        iconImageView.layer.borderColor = UIColor.systemGray5.cgColor
        iconImageView.layer.borderWidth = 0.6
        iconImageView.snp.makeConstraints {
            $0.size.equalTo(28)
        }
        
        let rightBarButton = appDetailView.openButton
        
        self.navigationItem.titleView = iconImageView
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBarButton)
    }
    
    private func setButtonAction() {
        appDetailView.versionRecordButton.addTarget(self, action: #selector (tappedVersionRecordButton), for: .touchUpInside)
        
        appDetailView.feedbackSummaryAllButton.addTarget(self, action: #selector (tappedFeedbackSummaryAllButton), for: .touchUpInside)
        
        appDetailView.feedbackWriteButton.addTarget(self, action: #selector(tappedFeedbackWriteButton), for: .touchUpInside)
        
        appDetailView.descriptionMoreButton.addTarget(self, action: #selector(tappedDescriptionMoreButton), for: .touchUpInside)
    }
    
    private func setStarStackViewGesture() {
        let panGesture = UIPanGestureRecognizer(target: appDetailView.tapToRateStarStackView, action: #selector(appDetailView.tapToRateStarStackView.handlePangesture))
        appDetailView.tapToRateStarStackView.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: appDetailView.tapToRateStarStackView, action: #selector(appDetailView.tapToRateStarStackView.handlePangesture))
        appDetailView.tapToRateStarStackView.addGestureRecognizer(tapGesture)
    }
    
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
        appDetailView.expandDescriptionLabel()
    }
}


extension AppDetailViewController: FeedbackDelegate {
    func dataBind(feedback: Feedback) {
        appDetailView.dataBind(feedback: feedback)
    }
}
