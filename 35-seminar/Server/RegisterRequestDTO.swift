//
//  RegisterRequest.swift
//  35-seminar
//
//  Created by 김유림 on 11/2/24.
//

import Foundation

struct RegisterRequestDTO: Codable {
  let username: String
  let password: String
  let hobby: String
}
