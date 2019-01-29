//
//  QuestionsViewModel.swift
//  iOS_Template
//
//  Created by Sebastian Guerrero F on 1/25/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Foundation
import Bond
import ReactiveKit

enum ErrorType {
  case getQuestionError
  case defaultError
}

class QuestionViewModel {
  
  let questions = MutableObservableArray<Question>()
  var questionService:QuestionServiceProtocol = QuestionService()
  var selectedQuestion = Observable<Question>(Question(id: 0, title: "", choices: []))
  var questionDataManager:DataManagerProtocol = QuestionDataManager()
  
  let generalError = PublishSubject<(title:String, message:String, type:ErrorType), NoError>()
  
  func getQuestionsFromApi() {
    questionService.getQuestions().start { event in
      switch event {
      case .value(let value) :
        for questionResponse in value! {
          self.questions.append(questionResponse)
        }
        break
      case .failed(_):
        self.generalError.next((title: "Error", message: "Please try again!", type: .getQuestionError))
      default:
        break
      }
    }
  }
  
  func selectQuestion(id: Int) {
    selectedQuestion.next(questions.array.filter { $0.id == id}.first!)
  }
  
  func saveToDatabase() {
    let questionEntity = QuestionEntity()
    questionEntity.initFrom(question: selectedQuestion.value)
    questionDataManager.saveOrUpdate(object: questionEntity)
  }
}

