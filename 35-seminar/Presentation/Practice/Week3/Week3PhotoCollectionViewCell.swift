//
//  Week3PhotoCollectionViewCell.swift
//  35-seminar
//
//  Created by 김유림 on 10/30/24.
//

import UIKit

class Week3PhotoCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = String(describing: Week3PhotoCollectionViewCell.self)
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
        
    }
    
    private func setConstraints() {
        
    }
    
    func bind(photo: Week3Photo) {
        self.photo = photo
        setUI()
    }
}
