//
//  NetworkManager.swift
//  iOS_Template
//
//  Created by Sebastian Guerrero F on 1/24/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import ObjectMapper

typealias QuestionPrimitiveSequence = PrimitiveSequence<SingleTrait, [Question]?>

protocol QuestionServiceProtocol {
  func getQuestions() -> QuestionPrimitiveSequence
}

class QuestionService:QuestionServiceProtocol {
  
  private let provider = MoyaProvider<NetworkManagerProvider>()
  
  func getQuestions() -> QuestionPrimitiveSequence {
      return provider.rx.request(.getQuestions)
      .filterSuccessfulStatusCodes()
      .mapJSON()
      .map { Mapper<Question>().mapArray(JSONObject: $0)}
  }
}
