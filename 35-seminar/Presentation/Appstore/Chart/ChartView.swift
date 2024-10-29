//
//  ChartView.swift
//  35-seminar
//
//  Created by 김유림 on 10/26/24.
//

import UIKit

class ChartView: BaseView {
    
    // MARK: - Properties
    let headerView = UITableViewHeaderFooterView()
    let tableView = UITableView()
    
    // MARK: - Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        super.setUI()
        tableView.rowHeight = 88
        tableView.separatorInset = .init(top: 0, left: 90, bottom: 0, right: 20)
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
