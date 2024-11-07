//
//  Week3PhotoCollectionViewCell.swift
//  35-seminar
//
//  Created by 김유림 on 10/30/24.
//

import UIKit

class Week3PhotoCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    private var photo: Week3Photo?
    
    private let imageView = UIImageView()
    var likeButton = UIButton()
    
    // MARK: - Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setUI() {
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = photo?.image
        
        guard let isLiked = photo?.isLiked else { return }
        if isLiked {
            likeButton.configureButton(systemName: "heart.fill", foregroundColor: .white)
        } else {
            likeButton.configureButton(systemName: "heart", foregroundColor: .white)
        }
    }
    
    private func setHierarchy() {
        self.addSubview(imageView)
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func bind(photo: Week3Photo) {
        self.photo = photo
        setUI()
    }
}
