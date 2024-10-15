//
//  DetailViewController.swift
//  35-seminar
//
//  Created by 김유림 on 10/5/24.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "현재 모드"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let customTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .white
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    let customContentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .white
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.numberOfLines = 0
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤로 가기", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    init(title: String) {
        super.init(nibName: .none, bundle: .main)
        titleLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //   MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setHirarchy()
        setLayout()
        setUI()
        setAction()
    }

    private func setHirarchy() {
        [titleLabel, customTitleLabel, customContentLabel, backButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(100)
        }
        
        customTitleLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.height.equalTo(30)
        }
        
        customContentLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.top.equalTo(customTitleLabel.snp.bottom).offset(20)
            $0.height.greaterThanOrEqualTo(30)
        }
        
        backButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(100)
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
    }
    
    private func setUI() {
        view.backgroundColor = .green
    }
    
    private func setAction() {
        backButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
    }
    
    @objc func tappedBackButton() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func dataBind(title: String, content: String) {
        customTitleLabel.text = title
        customContentLabel.text = content
    }
}
