//
//  UIImageView+Extension.swift
//  35-seminar
//
//  Created by 김유림 on 10/25/24.
//

import UIKit

extension UIImage {
    class func configureImage(systemName: String, symbolWeight: UIImage.SymbolWeight) -> UIImage? {
        let symbolConfig = UIImage.SymbolConfiguration(weight: symbolWeight)
        return UIImage(systemName: systemName, withConfiguration: symbolConfig)
    }
}
