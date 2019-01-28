//
//  NetworkManager.swift
//  iOS_Template
//
//  Created by Sebastian Guerrero F on 1/24/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Foundation
import Moya

enum NetworkManagerProvider {
  case getQuestions
}

extension NetworkManagerProvider: TargetType {
  
  var baseURL: URL {
    return URL(string: "https://private-39572-iostemplate.apiary-mock.com")!
  }
  
  var path: String {
    switch self {
    case .getQuestions:
      return "/questions"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .getQuestions:
      return .get
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    return .requestPlain
  }
  
  var headers: [String : String]? {
    return [:]
  }
}


private extension String {
  var urlEscaped: String {
    return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
  }
  
  var utf8Encoded: Data {
    return data(using: .utf8)!
  }
}
