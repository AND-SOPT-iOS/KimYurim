//
//  HobbyView.swift
//  35-seminar
//
//  Created by 김유림 on 11/9/24.
//

import UIKit

class HobbyView: BaseView {
    
    // MARK: - Properties
    let tableView = UITableView()
    
    // MARK: - Methods
    override func setUI() {
        super.setUI()
        tableView.rowHeight = 40
        tableView.backgroundColor = .systemGray6
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
