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
        label.text = "화면 전환 실습"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let modeLabel: UILabel = {
        let label = UILabel()
        label.text = "전환 모드 :"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    lazy var modePopupButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.baseForegroundColor = .black
        config.background.strokeColor = .lightGray
        config.background.strokeWidth = 1
        config.cornerStyle = .capsule
        config.buttonSize = .mini
        
        button.configuration = config
        button.menu = modeButtonMenu
        button.showsMenuAsPrimaryAction = true
        button.changesSelectionAsPrimaryAction = true
        return button
    }()
    
    let modeButtonMenu = UIMenu(title: "전환 모드 선택",
                                children: [UIAction(title: "네비게이션", handler: { _ in print("네비게이션") }),
                                           UIAction(title: "모달", handler: { _ in print("모달") })
                                          ]
    )
    
    let titleTextField: UITextField = {
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
    
    let contentTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 16, weight: .regular)
        textView.backgroundColor = .white
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 10
        return textView
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.backgroundColor = UIColor(named: "christmas_red")
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let santaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "santa")
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        [titleLabel, modeLabel, modePopupButton, titleTextField, contentTextView, nextButton, santaImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.safeAreaLayoutGuide)
        }
        
        modeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        modePopupButton.snp.makeConstraints {
            $0.centerY.equalTo(modeLabel)
            $0.leading.equalTo(modeLabel.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(30)
        }
        
        titleTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.top.equalTo(modeLabel.snp.bottom).offset(30)
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
        
        santaImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(250)
        }
    }
    
    private func setUI() {
        self.backgroundColor = .white
    }
}
