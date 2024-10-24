//
//  BorderView.swift
//  35-seminar
//
//  Created by 김유림 on 10/22/24.
//

import UIKit
import SnapKit

class BorderView: UIView {
    
    // MARK: - Properties
    let grayLine = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setHierarchy()
        setConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .none
        grayLine.backgroundColor = .systemGray5
    }
    
    private func setHierarchy() {
        self.addSubview(grayLine)
    }
    
    private func setConstraints() {
        self.snp.makeConstraints {
            $0.height.equalTo(0.5)
        }
        
        grayLine.snp.makeConstraints {
            $0.height.equalTo(0.5)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.verticalEdges.equalToSuperview()
        }
    }
}
