//
//  ChartTableViewCell.swift
//  35-seminar
//
//  Created by 김유림 on 10/26/24.
//

import UIKit
import SnapKit

class ChartTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = String(describing: ChartTableViewCell.self)
    private let appListCellView = AppListCellView()
    
    // MARK: - Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setHierarchy() {
        contentView.addSubview(appListCellView)
    }
    
    private func setConstraints() {
        appListCellView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }
    
    func bind(appData: App) {
        appListCellView.bind(appData: appData)
    }
}

