//
//  LoginDTO.swift
//  35-seminar
//
//  Created by 김유림 on 11/2/24.
//

import Foundation

struct LoginDTO: Encodable {
    let username: String
    let password: String
}

struct LoginResponse: Decodable {
    struct Result: Decodable {
        let token: String
    }
    let result: Result
}
