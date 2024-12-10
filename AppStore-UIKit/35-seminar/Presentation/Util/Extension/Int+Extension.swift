//
//  String+Extension.swift
//  35-seminar
//
//  Created by 김유림 on 10/30/24.
//

import Foundation

extension Int {
    func toWonString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "KRW"
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
