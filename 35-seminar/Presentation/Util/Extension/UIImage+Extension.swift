//
//  UIImageView+Extension.swift
//  35-seminar
//
//  Created by 김유림 on 10/25/24.
//

import UIKit

extension UIImage {
    static func configureImage(systemName: String, pointSize: CGFloat? = nil, symbolWeight: UIImage.SymbolWeight) -> UIImage? {
        if let pointSize = pointSize {
            let symbolConfig = UIImage.SymbolConfiguration(pointSize: pointSize, weight: symbolWeight)
            return UIImage(systemName: systemName, withConfiguration: symbolConfig)
        }
        
        let symbolConfig = UIImage.SymbolConfiguration(weight: symbolWeight)
        return UIImage(systemName: systemName, withConfiguration: symbolConfig)
    }
}
