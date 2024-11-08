//
//  MyHobbyService.swift
//  35-seminar
//
//  Created by 김유림 on 11/8/24.
//

import Foundation
import Alamofire

class MyHobbyService {
    static let shared = MyHobbyService()
    init() { }
    
    func getHobby(token: String,
               completion: @escaping (Result<String, NetworkError>) -> Void) {
        
        let url = Environment.baseURL + "/user/my-hobby"
        
        let headers: HTTPHeaders = [
            "token": token
        ]
        
        AF.request(url,
                   method: .get,
                   headers: headers)
        .validate()
        .responseDecodable(of: MyHobbyResponse.self) { [weak self] response in
            guard let statusCode = response.response?.statusCode,
                  let data = response.data,
                  let _ = self else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success(let loginResponse):
                completion(.success(loginResponse.result.hobby))
            case .failure:
                let error = Network.shared.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
}
