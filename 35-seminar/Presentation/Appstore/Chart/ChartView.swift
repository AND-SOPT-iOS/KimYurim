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
        setUI()
        setHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    override func setUI() {
        super.setUI()
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
