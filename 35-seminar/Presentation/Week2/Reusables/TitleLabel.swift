//
//  TitleLabel.swift
//  35-seminar
//
//  Created by 김유림 on 10/15/24.
//

import UIKit

class TitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureLabel(size: 22, weight: .semibold)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
