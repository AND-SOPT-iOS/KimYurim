//
//  DetailPreviewCollectionViewCell.swift
//  35-seminar
//
//  Created by 김유림 on 11/6/24.
//

import UIKit

final class DetailPreviewCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = String(describing: DetailPreviewCollectionViewCell.self)
    
    private let imageView = UIImageView()
    
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
    
    private func setUI() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.borderColor = UIColor.systemGray5.cgColor
        imageView.layer.borderWidth = 1
    }
    
    private func setHierarchy() {
        contentView.addSubview(imageView)
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func bind(image: UIImage?) {
        imageView.image = image
    }
}
