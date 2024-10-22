//
//  UILabel+Extension.swift
//  35-seminar
//
//  Created by 김유림 on 10/15/24.
//

import UIKit

extension UILabel {
    func configureLabel(alignment: NSTextAlignment = .left, color: UIColor = .label, size: CGFloat, weight: UIFont.Weight, text: String? = nil, numberOfLines: Int = 1) {
        self.textAlignment = alignment
        self.textColor = color
        self.font = .systemFont(ofSize: size, weight: weight)
        self.text = text
        self.numberOfLines = numberOfLines
    }
}
