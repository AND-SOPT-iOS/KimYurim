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
        setButtonAction()
    }
    
    private func setButtonAction() {
        appDetailView.versionRecordButton.addTarget(self, action: #selector (tappedVersionRecordButton), for: .touchUpInside)
        
        appDetailView.feedbackSummaryAllButton.addTarget(self, action: #selector (tappedFeedbackSummaryAllButton), for: .touchUpInside)
        
        appDetailView.feedbackWriteButton.addTarget(self, action: #selector(tappedFeedbackWriteButton), for: .touchUpInside)
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
}


extension AppDetailViewController: FeedbackDelegate {
    func dataBind(feedback: Feedback) {
        appDetailView.dataBind(feedback: feedback)
    }
}
