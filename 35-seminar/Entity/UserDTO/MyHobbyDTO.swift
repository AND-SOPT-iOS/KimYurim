//
//  MyHobbyDTO.swift
//  35-seminar
//
//  Created by 김유림 on 11/8/24.
//

import Foundation

struct MyHobbyDTO: Encodable {
    let token: String
}

struct MyHobbyResponse: Decodable {
    struct Result: Decodable {
        let hobby: String
    }
    let result: Result
}