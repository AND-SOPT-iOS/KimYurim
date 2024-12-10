//
//  Network.swift
//  35-seminar
//
//  Created by 김유림 on 11/2/24.
//

import Foundation

class Network {
    static let shared = Network()
    init() { }
    
    /// 서버의 명세서 기반으로 에러 처리를 진행해줌
    func handleStatusCode(
      _ statusCode: Int,
      data: Data
    ) -> NetworkError {
      let errorCode = decodeError(data: data)
      switch (statusCode, errorCode) {
      case (400, "00"):
        return .invalidRequest
      case (400, "01"):
        return .expressionError
      case (404, ""):
        return .invalidURL
      case (409, "00"):
        return .duplicateError
      case (500, ""):
        return .serverError
      default:
        return .unknownError
      }
    }

    func decodeError(data: Data) -> String {
      guard let errorResponse = try? JSONDecoder().decode(
        ErrorResponse.self,
        from: data
      ) else { return "" }
      return errorResponse.code
    }
}
