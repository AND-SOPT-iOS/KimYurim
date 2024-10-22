//
//  StarStackView.swift
//  35-seminar
//
//  Created by 김유림 on 10/22/24.
//

import UIKit

enum StarColor {
    case tint
    case gray
    case yellow
}

class StarStackView: UIStackView {
    
    // MARK: - Properties
    private var starCount: Int = 0
    private var starColor: StarColor = .tint
    
    private let starImageView1 = UIImageView()
    private let starImageView2 = UIImageView()
    private let starImageView3 = UIImageView()
    private let starImageView4 = UIImageView()
    private let starImageView5 = UIImageView()
    
    private let starEmptyImage = UIImage(systemName: "star")
    private let starFilledImage = UIImage(systemName:"star.fill")
    
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
            case .yellow:
                imageView.tintColor = .yellow
            }
        }
    }
    
    func bind(_ starCount: Int, _ color: StarColor) {
        self.starCount = starCount
        self.starColor = color
        updateStarImage()
    }
}
