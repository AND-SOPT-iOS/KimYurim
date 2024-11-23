//
//  LoginStatus.swift
//  35-seminar
//
//  Created by 김유림 on 11/8/24.
//

import Foundation

class LoginStatus {
    // 로그인 상태 설정: 로그아웃했을 때 자동으로 홈화면으로 이동되는 것 방지
    static var login: Bool = true
    
    static var autoLogin: Bool = false
}
