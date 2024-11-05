//
//  ExploreTableViewCell.swift
//  35-seminar
//
//  Created by 김유림 on 11/3/24.
//

import UIKit

class ExploreListTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = String(describing: ExploreListTableViewCell.self)
    
    private var apps: [App] = []
    private var exploreVC: UIViewController? = nil
    
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
        collectionViewLayout.itemSize = .init(width: 100, height: ExploreListCollectionViewCell.height) // 임시 크기. width는 현 시점에서 알 수 없으므로 delegate에서 다시 결정
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.minimumLineSpacing = 10
        collectionView.setCollectionViewLayout(collectionViewLayout, animated: true)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ExploreListCollectionViewCell.self, forCellWithReuseIdentifier: ExploreListCollectionViewCell.identifier)
    }
    
    private func setHierarchy() {
        self.contentView.addSubview(collectionView)
    }
    
    private func setConstraints() {
        self.collectionView.snp.remakeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func bind(apps: [App], exploreVC: UIViewController) {
        self.apps = apps
        self.exploreVC = exploreVC
        setConstraints()
    }
}

extension ExploreListTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apps.count / 3 + (apps.count % 3 == 0 ? 0 : 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = self.collectionView.dequeueReusableCell(
            withReuseIdentifier: ExploreListCollectionViewCell.identifier,
            for: indexPath
        ) as? ExploreListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let startIndex = indexPath.item * 3
        let endIndex = min(startIndex + 3, apps.count)
        
        if let exploreVC = self.exploreVC,
           startIndex < apps.count {
            item.bind(apps: Array(apps[startIndex..<endIndex]), exploreVC: exploreVC)
        }
        
        return item
    }
}

extension ExploreListTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        /// tableViewCell 높이가 유동적이므로, 컬렉션뷰의 높이를 지정해줘야 함.
        /// 한편, 위에서 collectionView.itemSize로 지정하기에는 너비를 구할 수 없으므로,
        /// TableViewCell이 init된 이후에 실행되는 Delegate에서 컬렉션뷰의 크기를 결정함.
        let itemWidth = self.contentView.layer.bounds.width - 40
        let itemHeight = CGFloat(ExploreListCollectionViewCell.height)
        adjustOffsetToCenter(collectionView, targetContentOffset: nil)
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    // TODO: 셀을 자동으로 가운데로 위치시키는 작업 수정 필요
    // 동작이 매끄럽지 못하고, 스크롤을 계속 하다 보면 셀 구조가 이상해짐(3,3,1 -> 3,1,3)
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        adjustOffsetToCenter(scrollView, targetContentOffset: targetContentOffset)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        adjustOffsetToCenter(scrollView, targetContentOffset: nil)
    }
    
    private func adjustOffsetToCenter(_ scrollView: UIScrollView, targetContentOffset: UnsafeMutablePointer<CGPoint>?) {
        // 셀의 크기 및 컬렉션뷰 가운데 위치 계산
        let itemWidth = self.contentView.bounds.width - 40
        let itemSpacing: CGFloat = 10
        let itemPlusSpacing = itemWidth + itemSpacing
        
        // 현재의 오프셋을 기준으로 가장 가까운 셀의 위치 계산
        let centerX = scrollView.contentOffset.x + scrollView.bounds.width / 2
        let page = round((centerX - itemWidth / 2) / itemPlusSpacing)
        
        // 목표 위치 계산
        let adjustedX = page * itemPlusSpacing + itemWidth / 2 - scrollView.bounds.width / 2
        
        
        // targetContentOffset이 nil이면, 스크롤 위치를 애니메이션으로 강제 이동
        if let targetContentOffset = targetContentOffset {
            targetContentOffset.pointee.x = adjustedX
        } else {
            scrollView.setContentOffset(CGPoint(x: adjustedX, y: scrollView.contentOffset.y), animated: true)
        }
    }
}
