//
//  StarStackView.swift
//  35-seminar
//
//  Created by 김유림 on 10/22/24.
//

import UIKit

protocol StarStackViewDelegate: AnyObject {
    func starStackView(_ view: StarStackView, newCount: Int)
}

class StarStackView: UIStackView {
    
    // MARK: - Properties
    weak var delegate: StarStackViewDelegate?
    
    private var starCount: Int = 0
    private var starColor: StarColor = .tint
    
    private let starImageView1 = UIImageView()
    private let starImageView2 = UIImageView()
    private let starImageView3 = UIImageView()
    private let starImageView4 = UIImageView()
    private let starImageView5 = UIImageView()
    
    private let starEmptyImage = UIImage.configureImage(systemName: "star", symbolWeight: .regular)
    private let starFilledImage = UIImage.configureImage(systemName: "star.fill", symbolWeight: .regular)
    
    // MARK: - Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setHierarchy()
        updateStarImage()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.axis = .horizontal
        self.distribution = .fillEqually
        
        [starImageView1
         ,starImageView2
         ,starImageView3
         ,starImageView4
         ,starImageView5].forEach { $0.contentMode = .scaleAspectFit }
    }
    
    private func setHierarchy() {
        [starImageView1
         ,starImageView2
         ,starImageView3
         ,starImageView4
         ,starImageView5].forEach { self.addArrangedSubview($0) }
    }
    
    private func updateStarImage() {
        for (index, view) in self.arrangedSubviews.enumerated() {
            guard let imageView = view as? UIImageView else { continue }
            
            if index < starCount {
                imageView.image = starFilledImage
            } else {
                imageView.image = starEmptyImage
            }
            
            switch starColor {
            case .tint:
                imageView.tintColor = .tintColor
            case .gray:
                imageView.tintColor = .secondaryLabel
            case .orange:
                imageView.tintColor = .systemOrange
            }
        }
    }
    
    func bind(_ starCount: Int, _ color: StarColor) {
        self.starCount = starCount
        self.starColor = color
        updateStarImage()
    }
    
    // 드래그 제스처 핸들러
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: self)
        let starWidth = bounds.width / 5
        let selectedStarIndex = Int(location.x / starWidth)
        let newCount = selectedStarIndex + 1
        
        if newCount != starCount {
            starCount = newCount
            updateStarImage()
            delegate?.starStackView(self, newCount: newCount)
        }
    }
    
    // 클릭 제스처 핸들러
    @objc func handleTapGesture(_ gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: self)
        let starWidth = bounds.width / 5
        let selectedStarIndex = Int(location.x / starWidth)
        let newCount = selectedStarIndex + 1
        
        if newCount != starCount {
            starCount = newCount
            updateStarImage()
            delegate?.starStackView(self, newCount: newCount)
        }
    }
}
