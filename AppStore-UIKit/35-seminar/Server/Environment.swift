//
//  Environment.swift
//  35-seminar
//
//  Created by 김유림 on 11/2/24.
//

import Foundation

enum Environment {
    static let baseURL: String = Bundle.main.infoDictionary?["BASE_URL"] as! String
}
