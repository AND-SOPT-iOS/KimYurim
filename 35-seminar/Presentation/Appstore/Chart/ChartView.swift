//
//  ChartView.swift
//  35-seminar
//
//  Created by 김유림 on 10/26/24.
//

import UIKit

class ChartView: UIView {
    
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
    
    private func setUI() {
        tableView.backgroundColor = .yellow
        
    }
    
    private func setHierarchy() {
        self.addSubview(tableView)
    }
    
    private func setConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
