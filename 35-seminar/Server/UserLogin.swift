//
//  UserLogin.swift
//  35-seminar
//
//  Created by 김유림 on 11/2/24.
//

import Foundation
import Alamofire

class UserLogin {
    func login(username: String,
               password: String,
               completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        
        let url = Environment.baseURL + "/login"
        
        let parameters = LoginDTO(
            username: username,
            password: password
        )
        
        /// Request시 url, method, parameters, 인코딩 방식을 파라미터로 넘겨주어야 함.
        AF.request(url,
                   parameters: parameters,
                   encoder: JSONParameterEncoder.default
        )
        .validate()
        .response { [weak self] response in
            
            guard let statusCode = response.response?.statusCode,
                  let data = response.data,
                  let self
            else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success:
                /// 네트워크 요청이 성공적으로 진행되었을 때, escaping closure을 실행하고 bool값을 success로 넘김.
                completion(.success(true))
            case .failure:
                /// 네트워크 요청이 실패했을 때, 어떤 이유인지 파악하여 escaping closure을 실행하고 파악된 error를 넘김
                let error = Network.shared.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
}
