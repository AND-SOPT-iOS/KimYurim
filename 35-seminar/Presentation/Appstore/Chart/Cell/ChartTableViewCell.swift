//
//  ChartTableViewCell.swift
//  35-seminar
//
//  Created by 김유림 on 10/26/24.
//

import UIKit
import SnapKit

final class ChartTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private var appListCellView = AppListCellView()
    private var rootVC: UIViewController? = nil
    
    // MARK: - Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setHierarchy()
        setConstraints()
        setAddTarget()
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
    
    private func setAddTarget() {
        appListCellView.coverButton.addTarget(self, action: #selector(tappedCell), for: .touchUpInside)
    }
    
    func bind(appData: App, rootVC: UIViewController) {
        appListCellView.bind(appData: appData)
        self.rootVC = rootVC
    }
    
    @objc func tappedCell() {
        let detailVC = DetailViewController()
        rootVC?.navigationController?.pushViewController(detailVC, animated: true)
    }
}

