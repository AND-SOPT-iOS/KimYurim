//
//  ViewController.swift
//  35-seminar
//
//  Created by 김유림 on 10/5/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var isNavigation: Bool = true
    
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
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private lazy var modeButton: UIButton = {
        let button = UIButton()
        button.setTitle("전환 모드 변경", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    // MARK: - Methods
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHirarchy()
        setLayout()
        setUI()
        setAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTitleLabel()
    }
    
    private func setHirarchy() {
        [titleLabel, titleTextField, contentTextView, nextButton, modeButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
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
        view.backgroundColor = .white
    }
    
    private func updateTitleLabel() {
        if isNavigation {
            self.titleLabel.text = "전환 모드: 네비게이션"
        } else {
            self.titleLabel.text = "전환 모드: 모달"
        }
    }
    
    private func setAction() {
        nextButton.addTarget(self, action: #selector(tappedNextButton), for: .touchUpInside)
        
        modeButton.addTarget(self, action: #selector(tappedModeButton), for: .touchUpInside)
    }
    
    @objc func tappedNextButton() {
        let detailVC = DetailViewController(title: titleLabel.text ?? "")
        detailVC.dataBind(title: titleTextField.text ?? "", content: contentTextView.text ?? "" )
        
        if isNavigation {
            self.navigationController?.pushViewController(detailVC, animated: true)
        } else {
            self.present(detailVC, animated: true, completion: nil)
        }
    }
    
    @objc func tappedModeButton() {
        isNavigation = !isNavigation
        updateTitleLabel()
    }
}

