//
//  QuestionsViewModel.swift
//  iOS_Template
//
//  Created by Sebastian Guerrero F on 1/25/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Foundation
import RxSwift

enum ErrorType {
  case getQuestionError
  case defaultError
}

class QuestionViewModel {
  
  let questions:Variable<[Question]> = Variable<[Question]>([])
  var questionService:QuestionServiceProtocol = QuestionService()
  var selectedQuestion:Variable<Question?> = Variable<Question?>(nil)
  var questionDataManager:DataManagerProtocol = QuestionDataManager()
  
  let generalError = PublishSubject<(title:String, message:String, type:ErrorType)>()
  let disposeBag = DisposeBag()
  
  func getQuestionsFromApi() {
    
    questionService.getQuestions().subscribe { (event) in
      switch event {
      case .success(let something):
        self.questions.value.append(contentsOf: something!)
      case .error(_):
        self.generalError.onNext((title: "Error", message: "Please try again!", type: .getQuestionError))
      }
    }.disposed(by: disposeBag)
  }
  
  
  
  func saveToDatabase() {
    let questionEntity = QuestionEntity()
    questionEntity.initFrom(question: selectedQuestion.value!)
    questionDataManager.saveOrUpdate(object: questionEntity)
  }
}

