//
//  FeedbackWriteViewController.swift
//  35-seminar
//
//  Created by 김유림 on 10/25/24.
//

import UIKit

class FeedbackWriteViewController: BaseViewController {
    
    // MARK: - Properties
    private let feedbackWriteView = FeedbackWriteView()
    weak var delegate: FeedbackDelegate?
    
    // MARK: - Methods
    override func loadView() {
        view = feedbackWriteView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStarStackViewGesture()
    }
    
    override func setDelegate() {
        feedbackWriteView.feedbackTextView.delegate = self
    }
    
    override func setAddTarget() {
        feedbackWriteView.cancelButton.addTarget(self, action: #selector(tappedCancelButton), for: .touchUpInside)
        
        feedbackWriteView.sendButton.addTarget(self, action: #selector(tappedSendButton), for: .touchUpInside)
    }
    
    private func setStarStackViewGesture() {
        let panGesture = UIPanGestureRecognizer(target: feedbackWriteView.tapToRateStarStackView, action: #selector(feedbackWriteView.tapToRateStarStackView.handlePanGesture))
        feedbackWriteView.tapToRateStarStackView.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: feedbackWriteView.tapToRateStarStackView, action: #selector(feedbackWriteView.tapToRateStarStackView.handlePanGesture))
        feedbackWriteView.tapToRateStarStackView.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - objc functions
    @objc private func tappedCancelButton() {
        self.dismiss(animated: true)
    }
    
    @objc private func tappedSendButton() {
        delegate?.dataBind(feedback: feedbackWriteView.returnFeedback())
        self.dismiss(animated: true)
    }
}

// MARK: - Extensions
extension FeedbackWriteViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        feedbackWriteView.setTextViewToWrite()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        feedbackWriteView.setTextViewToEnd()
    }
}
