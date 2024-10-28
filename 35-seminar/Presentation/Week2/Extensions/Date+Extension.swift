//
//  Date+Extension.swift
//  35-seminar
//
//  Created by 김유림 on 10/25/24.
//

import Foundation

extension Date {
    init?(year: Int, month: Int, day: Int) {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        if let date = Calendar.current.date(from: dateComponents) {
            self = date
        } else {
            return nil
        }
    }
    
    static func formattedDate(date: Date?) -> String {
        guard let inputDate = date else { return "날짜 없음" }
        
        let currentYear = Calendar.current.component(.year, from: Date())
        let inputYear = Calendar.current.component(.year, from: inputDate)
        let yearDifference = currentYear - inputYear
        
        guard yearDifference > 0 else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "M월 d"
            return dateFormatter.string(from: inputDate)
        }
        
        return "\(yearDifference)년 전"
    }
}
