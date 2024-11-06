//
//  DetailViewController.swift
//  35-seminar
//
//  Created by 김유림 on 10/15/24.
//

import UIKit

class DetailViewController: BaseViewController {
    
    // MARK: - Properties
    private let detailView = DetailView()
    private let previewImages: [UIImage?] = [UIImage.tossPreview1, UIImage.tossPreview2, UIImage.tossPreview3, UIImage.tossPreview4, UIImage.tossPreview5, UIImage.tossPreview6]
    private let feedbacks = Feedback.samples
    
    // MARK: - Methods
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setStarStackViewGesture()
    }
    
    override func setDelegate() {
        // scrollView
        detailView.scrollView.delegate = self
        
        // previewCollectionView
        detailView.previewCollectionView.dataSource = self
        detailView.previewCollectionView.register(DetailPreviewCollectionViewCell.self, forCellWithReuseIdentifier: DetailPreviewCollectionViewCell.identifier)
        
        // feedbackCollectionView
        detailView.feedbackCollectionView.register(DetailFeedbackCollectionViewCell.self, forCellWithReuseIdentifier: DetailFeedbackCollectionViewCell.identifier)
        detailView.feedbackCollectionView.dataSource = self
        detailView.feedbackCollectionView.delegate = self
    }
    
    override func setAddTarget() {
        detailView.versionRecordButton.addTarget(self, action: #selector (tappedVersionRecordButton), for: .touchUpInside)
        
        detailView.feedbackSummaryAllButton.addTarget(self, action: #selector (tappedFeedbackSummaryAllButton), for: .touchUpInside)
        
        detailView.feedbackWriteButton.addTarget(self, action: #selector(tappedFeedbackWriteButton), for: .touchUpInside)
        
        detailView.descriptionMoreButton.addTarget(self, action: #selector(tappedDescriptionMoreButton), for: .touchUpInside)
    }
    
    private func setNavigationBar() {
        let iconImageView = UIImageView()
        iconImageView.clipsToBounds = true
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.image = .tossIcon
        iconImageView.layer.cornerRadius = 8
        iconImageView.layer.borderColor = UIColor.systemGray5.cgColor
        iconImageView.layer.borderWidth = 0.6
        iconImageView.snp.makeConstraints {
            $0.size.equalTo(28)
        }
        
        let rightBarButton = UIButton()
        rightBarButton.configureButton(configType: .filled,
                                       title: "열기",
                                       fontSize: 16,
                                       fontWeight: .bold,
                                       cornerStyle: .capsule,
                                       foregroundColor: .white,
                                       backgroundColor: .tintColor)
        rightBarButton.snp.makeConstraints {
            $0.width.equalTo(72)
            $0.height.equalTo(32)
        }
        
        self.navigationItem.titleView = iconImageView
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBarButton)
    }
    
    private func setStarStackViewGesture() {
        let panGesture = UIPanGestureRecognizer(target: detailView.tapToRateStarStackView, action: #selector(detailView.tapToRateStarStackView.handlePanGesture))
        detailView.tapToRateStarStackView.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: detailView.tapToRateStarStackView, action: #selector(detailView.tapToRateStarStackView.handleTapGesture))
        detailView.tapToRateStarStackView.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - objc functions
    @objc private func tappedVersionRecordButton() {
        self.navigationController?.pushViewController(VersionRecordViewController(), animated: true)
    }
    
    @objc private func tappedFeedbackSummaryAllButton() {
        self.navigationController?.pushViewController(AllFeedbackViewController(), animated: true)
    }
    
    @objc private func tappedFeedbackWriteButton() {
        let feedbackWriteVC = FeedbackWriteViewController()
        feedbackWriteVC.delegate = self
        self.present(feedbackWriteVC, animated: true)
    }
    
    @objc private func tappedDescriptionMoreButton() {
        detailView.expandDescriptionLabel()
    }
}

// MARK: - Extensions
extension DetailViewController: FeedbackDelegate {
    func dataBind(feedback: Feedback) {
        detailView.dataBind(feedback: feedback)
    }
}

extension DetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let triggerOffset: CGFloat = 80
        
        if offsetY > triggerOffset {
            navigationItem.titleView?.isHidden = false
            navigationItem.rightBarButtonItem?.isHidden = false
        } else {
            navigationItem.titleView?.isHidden = true
            navigationItem.rightBarButtonItem?.isHidden = true
        }
    }
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return previewImages.count
            
        case 1:
            return feedbacks.count
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: DetailPreviewCollectionViewCell.identifier, for: indexPath) as? DetailPreviewCollectionViewCell else { return UICollectionViewCell() }
            item.bind(image: previewImages[indexPath.item])
            return item
            
        case 1:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: DetailFeedbackCollectionViewCell.identifier, for: indexPath) as? DetailFeedbackCollectionViewCell else { return UICollectionViewCell() }
            item.dataBind(feedback: feedbacks[indexPath.item])
            return item
            
        default:
            return UICollectionViewCell()
        }
        
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1 {
            let width = CGFloat(UIScreen.main.bounds.width - 40)
            let height = CGFloat(200)
            adjustOffsetToCenter(collectionView, targetContentOffset: nil)
            return CGSize(width: width, height: height)
        }
        
        return .zero
    }
    
    // TODO: 셀을 자동으로 가운데로 위치시키는 작업 수정 필요
    // 동작이 매끄럽지 못하고, 스크롤을 계속 하다 보면 셀 구조가 이상해짐(3,3,1 -> 3,1,3)
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if scrollView.tag == 1 {
            adjustOffsetToCenter(scrollView, targetContentOffset: targetContentOffset)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.tag == 1 {
            adjustOffsetToCenter(scrollView, targetContentOffset: nil)
        }
    }
    
    private func adjustOffsetToCenter(_ scrollView: UIScrollView, targetContentOffset: UnsafeMutablePointer<CGPoint>?) {
        // 셀의 크기 및 컬렉션뷰 가운데 위치 계산
        let itemWidth = self.view.bounds.width - 40
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
