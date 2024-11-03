//
//  Week3PhotoViewController.swift
//  35-seminar
//
//  Created by 김유림 on 10/30/24.
//

import UIKit

class Week3PhotoViewController: BaseViewController {
    
    // MARK: - Properties
    private let photos = Week3Photo.samplePhotos
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setHierarchy()
        setConstraints()
    }
    
    override func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setConstraints() {
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setCollectionView() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let itemSize = (UIScreen.main.bounds.width - 4) / 3
        
        collectionViewLayout.itemSize = .init(width: itemSize, height: itemSize)
        collectionViewLayout.minimumLineSpacing = 2
        collectionViewLayout.minimumInteritemSpacing = 2
        
        collectionView.setCollectionViewLayout(collectionViewLayout, animated: true)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(Week3PhotoCollectionViewCell.self, forCellWithReuseIdentifier: Week3PhotoCollectionViewCell.identifier)
    }
}

extension Week3PhotoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(
            withReuseIdentifier: Week3PhotoCollectionViewCell.identifier,
            for: indexPath
        ) as? Week3PhotoCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        item.bind(photo: photos[indexPath.row])
        return item
    }
}

extension Week3PhotoViewController: UICollectionViewDelegate {
    
}
