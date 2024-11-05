//
//  ExploreBannerTableViewCell.swift
//  35-seminar
//
//  Created by 김유림 on 11/5/24.
//

import UIKit

class ExploreBannerTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = String(describing: ExploreBannerTableViewCell.self)
    
    private var apps: [App] = []
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    // MARK: - Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setCollectionView()
        setHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setCollectionView() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = .init(width: 100, height: ExploreBannerCollectionViewCell.height) // 임시 크기. width는 현 시점에서 알 수 없으므로 delegate에서 다시 결정
        collectionViewLayout.scrollDirection = .horizontal
        
        collectionView.setCollectionViewLayout(collectionViewLayout, animated: true)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ExploreBannerCollectionViewCell.self, forCellWithReuseIdentifier: ExploreBannerCollectionViewCell.identifier)
    }
    
    private func setHierarchy() {
        self.contentView.addSubview(collectionView)
    }
    
    private func setConstraints() {
        self.collectionView.snp.remakeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func bind(apps: [App]) {
        self.apps = apps
        setConstraints()
    }
}

extension ExploreBannerTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = self.collectionView.dequeueReusableCell(
            withReuseIdentifier: ExploreBannerCollectionViewCell.identifier,
            for: indexPath
        ) as? ExploreBannerCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        item.bind(appData: apps[indexPath.item])
        
        return item
    }
}

extension ExploreBannerTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        /// tableViewCell 높이가 유동적이므로, 컬렉션뷰의 높이를 지정해줘야 함.
        /// 한편, 위에서 collectionView.itemSize로 지정하기에는 너비를 구할 수 없으므로,
        /// TableViewCell이 init된 이후에 실행되는 Delegate에서 컬렉션뷰의 크기를 결정함.
        let itemWidth = self.contentView.layer.bounds.width - 40
        let itemHeight = CGFloat(ExploreBannerCollectionViewCell.height)
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}
