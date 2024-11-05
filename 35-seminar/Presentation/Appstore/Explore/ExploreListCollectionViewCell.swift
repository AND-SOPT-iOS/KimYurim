//
//  ExploreCollectionViewCell.swift
//  35-seminar
//
//  Created by 김유림 on 11/3/24.
//

import UIKit
import SnapKit

class ExploreListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = String(describing: ExploreListCollectionViewCell.self)
    static let height = 266
    
    private var apps: [App] = []
    
    private let stackView = UIStackView()
    private let cell1 = AppListCellView()
    private let cell2 = AppListCellView()
    private let cell3 = AppListCellView()
    private let border1 = BorderView()
    private let border2 = BorderView()
    
    // MARK: - Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setDelegate()
        setUI()
        setHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDelegate() { }
    
    private func setUI() {
        self.backgroundColor = .systemBackground
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.spacing = 0
    }
    
    private func setHierarchy() {
        contentView.addSubview(stackView)
        
        [cell1, border1, cell2, border2, cell3].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    private func setConstraints() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        [cell1, cell2, cell3].forEach {
            $0.snp.makeConstraints {
                $0.horizontalEdges.equalToSuperview()
            }
        }
        
        [border1, border2].forEach {
            $0.snp.makeConstraints {
                $0.height.equalTo(1)
                $0.width.equalToSuperview().offset(-76)
            }
        }
    }
    
    func bind(apps: [App]) {
        self.apps = apps
        
        let cells = [cell1, cell2, cell3]
        for (i, cell) in cells.enumerated() {
            if i < apps.count {
                cell.bind(appData: apps[i])
            } else {
                cell.hideContents(hidden: true)
            }
        }
        if apps.count == 1 {
            border1.backgroundColor = .systemBackground
            border2.backgroundColor = .systemBackground
        } else if apps.count == 2 {
            border2.backgroundColor = .systemBackground
        }
    }
}
