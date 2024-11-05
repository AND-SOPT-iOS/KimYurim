//
//  CategoryExploreView.swift
//  35-seminar
//
//  Created by 김유림 on 11/3/24.
//

import UIKit

class CategoryExploreView: BaseView {
    // MARK: - Properties
    let tableView = UITableView()
    
    // MARK: - Methods
    private var rowHeight: CGFloat?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setDelegate() { }
    
    override func setUI() {
//        tableView.rowHeight = CGFloat(ExploreListTableViewCell.height)
    }
    
    override func setHierarchy() {
        self.addSubview(tableView)
    }
    
    override func setConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
