//
//  UserDefaultsManager.swift
//  35-seminar
//
//  Created by 김유림 on 11/10/24.
//

import Foundation

enum UserDefaultsKeys {
    static let username = "username"
    static let password = "password"
    static let token = "token"
    static let autoLogin = "autoLogin"
}

class UserDefaultsManager {
    static func register(username: String, password: String) {
        UserDefaults.standard.set(username, forKey: UserDefaultsKeys.username)
    }
    
    static func registerLoginData(loginData: LoginDTO, token: String) {
        UserDefaults.standard.set(loginData.username, forKey: UserDefaultsKeys.username)
        UserDefaults.standard.set(loginData.password, forKey: UserDefaultsKeys.password)
        UserDefaults.standard.set(token, forKey: UserDefaultsKeys.token)
    }
    
    static func fetchUserData() -> UserData {
        let username = UserDefaults.standard.string(forKey: UserDefaultsKeys.username) ?? ""
        let password = UserDefaults.standard.string(forKey: UserDefaultsKeys.password) ?? ""
        let token = UserDefaults.standard.string(forKey: UserDefaultsKeys.token) ?? ""
        let autoLogin = UserDefaults.standard.bool(forKey: UserDefaultsKeys.autoLogin)
        
        return UserData(username: username, password: password, token: token, autoLogin: autoLogin)
    }
    
    static func fetchAutoLogin() -> Bool {
        let autoLogin = UserDefaults.standard.bool(forKey: UserDefaultsKeys.autoLogin)
        return autoLogin
    }
    
    static func updateAutoLogin(autoLogin: Bool) {
        UserDefaults.standard.set(autoLogin, forKey: UserDefaultsKeys.autoLogin)
    }
}
