//
//  SubtitleLabel.swift
//  35-seminar
//
//  Created by 김유림 on 10/15/24.
//

import UIKit

class SubtitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureLabel(color: .secondaryLabel, size: 15, weight: .light)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
