//
//  FeedbackWriteViewController.swift
//  35-seminar
//
//  Created by 김유림 on 10/25/24.
//

import UIKit

class FeedbackWriteViewController: UIViewController {
    
    // MARK: - Properties
    private let feedbackWriteView = FeedbackWriteView()
    
    // MARK: - Methods
    override func loadView() {
        view = feedbackWriteView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonAction()
    }
    
    private func setButtonAction() {
        feedbackWriteView.cancelButton.addTarget(self, action: #selector(tappedCancelButton), for: .touchUpInside)
    }
    
    @objc private func tappedCancelButton() {
        self.dismiss(animated: true)
    }
}
