//
//  FeedbackWriteView.swift
//  35-seminar
//
//  Created by 김유림 on 10/25/24.
//

import UIKit
import SnapKit

final class FeedbackWriteView: BaseView {
    
    // MARK: - Properties
    private var starCount: Int = 0
    private let textViewPlaceHolder = "리뷰(선택사항)"
    
    private let titleLabel = UILabel()
    let cancelButton = UIButton()
    let sendButton = UIButton()
    
    let tapToRateStarStackView = StarStackView()
    private let tapToRateGuideLabel = SubtitleLabel()
    
    private let feedbackStackView = UIStackView()
    private let feedbackTitleTextField = UITextField()
    let feedbackTextView = UITextView()
    
    // MARK: - Methods
    override func setDelegate() {
        tapToRateStarStackView.delegate = self
    }
    
    override func setUI() {
        super.setUI()
        
        titleLabel.configureLabel(size: 17, weight: .semibold, text: "리뷰 작성하기")
        
        cancelButton.configureButton(title: "취소", fontSize: 17, fontWeight: .medium, removeContentInsets: true)
        
        sendButton.configureButton(title: "보내기", fontSize: 17, fontWeight: .semibold, removeContentInsets: true)
        
        tapToRateGuideLabel.configureLabel(color: .secondaryLabel, size: 10, weight: .regular, text: "별점을 탭하여 평가하기")
        
        feedbackStackView.axis = .vertical
        feedbackStackView.spacing = 10
        
        feedbackTitleTextField.placeholder = "제목"
        feedbackTitleTextField.font = .systemFont(ofSize: 17, weight: .regular)
        feedbackTitleTextField.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        feedbackTextView.textContainerInset = .zero
        feedbackTextView.textContainer.lineFragmentPadding = 0
        feedbackTextView.font = .systemFont(ofSize: 17, weight: .regular)
        setTextViewPlaceholder()
    }
    
    override func setHierarchy() {
        [cancelButton, sendButton, titleLabel, tapToRateStarStackView, tapToRateGuideLabel, feedbackStackView].forEach {
            self.addSubview($0)
        }
        
        [feedbackTitleTextField, feedbackTextView].forEach {
            let border = BorderView()
            feedbackStackView.addArrangedSubview(border)
            feedbackStackView.addArrangedSubview($0)
            
            border.snp.makeConstraints {
                $0.horizontalEdges.equalToSuperview()
                $0.height.equalTo(0.4)
            }
        }
    }
    
    override func setConstraints() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(20)
        }
        
        cancelButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(titleLabel)
        }
        
        sendButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalTo(titleLabel)
        }
        
        tapToRateStarStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(180)
        }
        
        tapToRateGuideLabel.snp.makeConstraints {
            $0.top.equalTo(tapToRateStarStackView.snp.bottom).offset(2)
            $0.centerX.equalToSuperview()
        }
        
        feedbackStackView.snp.makeConstraints {
            $0.top.equalTo(tapToRateGuideLabel.snp.bottom).offset(2)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    func setTextViewPlaceholder() {
        feedbackTextView.text = textViewPlaceHolder
        feedbackTextView.textColor = .systemGray4
    }
    
    func setTextViewToWrite() {
        if feedbackTextView.text == textViewPlaceHolder {
            feedbackTextView.text = nil
            feedbackTextView.textColor = .label
        }
    }
    
    func setTextViewToEnd() {
        let isPlaceHolder = feedbackTextView.text == textViewPlaceHolder
        let isEmpty = feedbackTextView.text.isEmpty
        
        if isPlaceHolder || isEmpty {
            setTextViewPlaceholder()
        }
    }
    
    func returnFeedback() -> Feedback {
        var content = feedbackTextView.text
        if content == textViewPlaceHolder {
            content = nil
        }
        
        let feedback = Feedback(title: feedbackTitleTextField.text!,
                                author: "김유림",
                                starCount: starCount,
                                authorDate: Date(),
                                content: content,
                                developerContent: nil,
                                developerDate: nil)
        return feedback
    }
}

extension FeedbackWriteView: StarStackViewDelegate {
    func starStackView(_ view: StarStackView, newCount: Int) {
        starCount = newCount
    }
}
