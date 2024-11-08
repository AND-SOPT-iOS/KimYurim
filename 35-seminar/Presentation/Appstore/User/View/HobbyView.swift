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
        tableView.rowHeight = 88
        tableView.separatorInset = .init(top: 0, left: 90, bottom: 0, right: 20)
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
