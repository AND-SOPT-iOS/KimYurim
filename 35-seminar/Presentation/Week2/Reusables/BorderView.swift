//
//  BorderView.swift
//  35-seminar
//
//  Created by 김유림 on 10/22/24.
//

import UIKit
import SnapKit

class BorderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray5
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
