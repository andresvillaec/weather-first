//
//  NetworkManager.swift
//  iOS_Template
//
//  Created by Sebastian Guerrero F on 1/24/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Foundation
import Moya
import ReactiveSwift
import ObjectMapper

typealias QuestionSignalProducer = SignalProducer<[Question]?, MoyaError>

protocol QuestionServiceProtocol {
  func getQuestions() -> QuestionSignalProducer
}

class QuestionService:QuestionServiceProtocol {
  
  private let provider = MoyaProvider<NetworkManagerProvider>()
  
  func getQuestions() -> QuestionSignalProducer{
    
    return provider.reactive.request(.getQuestions)
      .filterSuccessfulStatusCodes()
      .mapJSON()
      .map { Mapper<Question>().mapArray(JSONObject: $0)}
  }
}
