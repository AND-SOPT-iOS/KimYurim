//
//  ChartTableViewHeader.swift
//  35-seminar
//
//  Created by 김유림 on 11/6/24.
//

import UIKit

class ChartTableViewHeader: UITableViewHeaderFooterView {
    
    // MARK: - Properties
    static let identifier = String(describing: ChartTableViewHeader.self)
    
    private let titleLabel = UILabel()
    private let segmentControl: UISegmentedControl = {
        let segmentItems = ["유료 앱", "무료 앱"]
        let control = UISegmentedControl(items: segmentItems)
        return control
    }()
    
    // MARK: - Methods
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUI()
        setHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        titleLabel.configureLabel(color: .label, size: 34, weight: .heavy, text: "인기 차트")
        
        segmentControl.backgroundColor = .secondarySystemBackground
        segmentControl.selectedSegmentIndex = 0
        segmentControl.selectedSegmentTintColor = .lightGray
    }
    
    private func setHierarchy() {
        [titleLabel, segmentControl].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(30)
            $0.bottom.equalToSuperview().offset(-10)
        }
    }
}
