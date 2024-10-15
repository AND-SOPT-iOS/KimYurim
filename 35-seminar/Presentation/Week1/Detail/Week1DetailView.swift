//
//  DetailView.swift
//  35-seminar
//
//  Created by 김유림 on 10/10/24.
//

import UIKit

class Week1DetailView: UIView {
    
    // MARK: - Properties
    let modeLabel: UILabel = {
        let label = UILabel()
        label.text = "현재 모드"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.layer.borderColor = UIColor.gray.cgColor
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .init(white: 1, alpha: 0.1)
        label.layer.borderColor = UIColor.gray.cgColor
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤로 가기", for: .normal)
        button.backgroundColor = UIColor(named: "christmas_green")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "christmas")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.opacity = 0.5
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
        [backgroundImageView, modeLabel, titleLabel, contentLabel, backButton].forEach {
            self.addSubview($0)
        }
    }
    
    private func setLayout() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        modeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(20)
        }
        
        titleLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.top.equalTo(modeLabel.snp.bottom).offset(20)
            $0.height.equalTo(30)
        }
        
        contentLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.bottom.lessThanOrEqualTo(backButton.snp.top).offset(-20)
            $0.height.greaterThanOrEqualTo(36)
        }
        
        backButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(50)
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
    }
    
    private func setUI() {
        self.backgroundColor = .black
    }
}
