//
//  MainView.swift
//  35-seminar
//
//  Created by 김유림 on 10/8/24.
//

import UIKit

class MainView: UIView {

    // MARK: - Properties
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "현재 모드"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "제목을 입력해주세요."
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        return textField
    }()
    
    private let contentTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 14, weight: .light)
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 10
        return textView
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    lazy var modeButton: UIButton = {
        let button = UIButton()
        button.setTitle("전환 모드 변경", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    
    // MARK: - Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setHirarchy()
        setLayout()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setHirarchy() {
        [titleLabel, titleTextField, contentTextView, nextButton, modeButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(100)
        }
        
        titleTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.height.equalTo(50)
        }
        
        contentTextView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.top.equalTo(titleTextField.snp.bottom).offset(20)
            $0.height.equalTo(200)
        }
        
        nextButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.top.equalTo(contentTextView.snp.bottom).offset(20)
            $0.height.equalTo(50)
        }
        
        modeButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.top.equalTo(nextButton.snp.bottom).offset(20)
            $0.height.equalTo(50)
        }
    }
    
    private func setUI() {
        self.backgroundColor = .white
    }
    
    func updateTitleLabel(isNavigation: Bool) {
        if isNavigation {
            self.titleLabel.text = "현재 모드: 네비게이션"
        } else {
            self.titleLabel.text = "현재 모드: 모달"
        }
    }
}
