//
//  UIButton+Extension.swift
//  35-seminar
//
//  Created by 김유림 on 10/24/24.
//

import UIKit

enum ConfigurationType {
    case plain
    case filled
}

extension UIButton {
    func configureButton(configType: ConfigurationType = .plain,
                         title: String? = nil,
                         fontSize: CGFloat = 17,
                         fontWeight: UIFont.Weight = .regular,
                         image: UIImage? = nil,
                         symbolWeight: UIImage.SymbolWeight = .unspecified,
                         cornerStyle: UIButton.Configuration.CornerStyle? = nil,
                         foregroundColor: UIColor = .tintColor,
                         backgroundColor: UIColor = .clear,
                         removeContentInsets: Bool = false,
                         for state: UIControl.State = .normal) {
        
        var config = {
            switch configType {
            case .plain:
                return UIButton.Configuration.plain()
            case .filled:
                return UIButton.Configuration.filled()
            }
        }()
        
        if let title = title {
            let attributes: [NSAttributedString.Key: Any] = [.font : UIFont.systemFont(ofSize: fontSize, weight: fontWeight)]
            let attributedTitle = NSAttributedString(string: title, attributes: attributes)
            self.setAttributedTitle(attributedTitle, for: state)
        }
        
        if let image = image {
            let symbolConfig = UIImage.SymbolConfiguration(weight: symbolWeight)
            let configuredImage = image.withConfiguration(symbolConfig)
            config.image = configuredImage
        }
        
        if let cornerStyle = cornerStyle {
            config.cornerStyle = cornerStyle
        }
        
        config.baseForegroundColor = foregroundColor
        config.baseBackgroundColor = backgroundColor
        
        if removeContentInsets {
            config.contentInsets = .zero
        }
        
        self.configuration = config
    }
}
