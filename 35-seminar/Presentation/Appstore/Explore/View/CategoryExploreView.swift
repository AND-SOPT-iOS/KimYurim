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
    override func setUI() {
        tableView.separatorColor = .clear
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
