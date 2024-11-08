//
//  User.swift
//  35-seminar
//
//  Created by 김유림 on 11/2/24.
//

import Foundation
import Alamofire

/// 클래스는 라우터 별로 나눠줄 수 있음!
/// 라우터란 URL의 분기점. 이 클래스의 분기점은 /user 임
class UserService {
    
    static let shared = UserService()
    init() { }
    
    func register(
        username: String,
        password: String,
        hobby: String,
        completion: @escaping (Result<Int, NetworkError>) -> Void
    ) {
        
        let url = Environment.baseURL + "/user"
        
        let parameters = RegisterDTO(
            username: username,
            password: password,
            hobby: hobby
        )
        
        AF.request(
            url,
            method: .post,
            parameters: parameters,
            encoder: JSONParameterEncoder.default
        )
        .validate()
        .responseDecodable(of: RegisterResponse.self) { [weak self] response in
            guard let statusCode = response.response?.statusCode,
                  let data = response.data,
                  let _ = self else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success(let registerResponse):
                completion(.success(registerResponse.result.no))
            case .failure:
                let error = Network.shared.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
}
