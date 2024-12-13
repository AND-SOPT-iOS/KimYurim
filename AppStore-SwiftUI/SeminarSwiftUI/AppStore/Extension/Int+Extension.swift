//
//  Int+Extension.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 12/13/24.
//

import Foundation

extension Int {
    func formattedToWonString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let formattedString = formatter.string(from: NSNumber(value: self)) ?? "\(self)"
        return "₩" + formattedString
    }
}
