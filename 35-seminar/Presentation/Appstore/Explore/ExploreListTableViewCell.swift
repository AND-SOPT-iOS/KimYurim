//
//  ExploreTableViewCell.swift
//  35-seminar
//
//  Created by 김유림 on 11/3/24.
//

import UIKit

enum ExploreViewType {
    case banner
    case list
}

class ExploreListTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = String(describing: ExploreListTableViewCell.self)
    private var exploreViewType: ExploreViewType?
    private var apps: [App] = []
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    // MARK: - Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setCollectionView()
        setHierarchy()
        setConstraints()
        print("tableViewCell init")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setCollectionView() {
        print("setCollectionView")
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = .init(width: 100, height: 100) // 임시 size. 실제는 UICollectionViewDelegateFlowLayout에서 결정.
        collectionViewLayout.scrollDirection = .horizontal
        
        collectionView.setCollectionViewLayout(collectionViewLayout, animated: true)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ExploreCollectionViewCell.self, forCellWithReuseIdentifier: ExploreCollectionViewCell.identifier)
    }
    
    private func setHierarchy() {
        self.contentView.addSubview(collectionView)
    }
    
    private func setConstraints() {
        guard let type = exploreViewType else { return }
        switch type {
        case .banner:
            self.collectionView.snp.makeConstraints {
                $0.edges.equalToSuperview()
                $0.width.equalToSuperview()
                $0.height.equalTo(80)
            }
            
            
        case .list:
            self.collectionView.snp.remakeConstraints {
                $0.center.equalToSuperview()
                $0.width.equalToSuperview()
                let appCell = 64
                let borderAndGap = 1 + 10
                $0.height.equalTo(appCell * 3 + borderAndGap * 2)
            }
        }
    }
    
    func bind(type: ExploreViewType, apps: [App]) {
        self.exploreViewType = type
        self.apps = apps
        setConstraints()
        layoutIfNeeded()
//        collectionView.reloadData()
    }
}

extension ExploreListTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let type = exploreViewType else { return 0 }
        switch type {
        case .banner:
            return apps.count
            
        case .list:
            return apps.count / 3 + (apps.count % 3 == 0 ? 0 : 1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = self.collectionView.dequeueReusableCell(
            withReuseIdentifier: ExploreCollectionViewCell.identifier,
            for: indexPath
        ) as? ExploreCollectionViewCell else {
            return UICollectionViewCell()
        }
        let startIndex = indexPath.item * 3
        let endIndex = min(startIndex + 3, apps.count)
        
        if startIndex < apps.count {
            item.bind(apps: Array(apps[startIndex..<endIndex]))
        }
        return item
    }
}

extension ExploreListTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        /// tableViewCell 높이가 유동적이므로, 컬렉션뷰의 높이를 지정해줘야 함.
        /// 한편, 위에서 collectionView.itemSize로 지정하기에는 너비를 구할 수 없으므로,
        /// TableViewCell이 init된 이후에 실행되는 Delegate에서 컬렉션뷰의 크기를 결정함.
        let itemWidth = self.layer.bounds.width - 40
        let itemHeight: CGFloat = {
            guard let type = exploreViewType else { return 0 }
            switch type {
            case .banner:
                return 80
                
            case .list:
                let appCell = 88
                let borderAndGap = 1 + 10
                let height = CGFloat(appCell * 3 + borderAndGap * 2)
                return height
            }
        }()
        print("delegate")
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
