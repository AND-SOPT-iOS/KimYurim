//
//  UserLogin.swift
//  35-seminar
//
//  Created by 김유림 on 11/2/24.
//

import Foundation
import Alamofire

class LoginService {
    static let shared = LoginService()
    init() { }
    
    func login(username: String,
               password: String,
               completion: @escaping (Result<String, NetworkError>) -> Void) {
        
        let url = Environment.baseURL + "/login"
        let parameters = LoginDTO(username: username, password: password)
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoder: JSONParameterEncoder.default)
        .validate()
        .responseDecodable(of: LoginResponse.self) { [weak self] response in
            guard let statusCode = response.response?.statusCode,
                  let data = response.data,
                  let self = self else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success(let loginResponse):
                completion(.success(loginResponse.result.token))
            case .failure:
                let error = Network.shared.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
}
