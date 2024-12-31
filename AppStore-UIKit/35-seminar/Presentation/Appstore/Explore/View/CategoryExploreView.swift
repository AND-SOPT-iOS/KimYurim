//
//  CategoryExploreView.swift
//  35-seminar
//
//  Created by 김유림 on 11/3/24.
//

import UIKit

final class CategoryExploreView: BaseView {
    
    // MARK: - Properties
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    
    
    // MARK: - Methods
    
    override func setUI() {
        super.setUI()
        tableView.backgroundColor = .systemBackground
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
