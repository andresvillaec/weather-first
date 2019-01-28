//
//  QuestionViewModelTests.swift
//  iOS_Tests
//
//  Created by Sebastian Guerrero F on 1/25/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Quick
import Nimble
import ReactiveSwift
import Bond
import Moya
import Swinject

@testable import iOS_Template

class QuestionViewModelTests: QuickSpec {
  override func spec() {
    var container: Container!
    var questionServiceMock: QuestionServiceMock!
    
    beforeEach {
      questionServiceMock = QuestionServiceMock()
      container = Container()
      container.register(QuestionViewModel.self) { r in
        let questionVM = QuestionViewModel()
        questionVM.questionService = questionServiceMock
        return questionVM
      }
    }
    
    describe("QuestionViewModel") {
      describe("getQuestionsFromApi") {
        it("should call getQuestions in QuestionsService") {
          let questionVM = container.resolve(QuestionViewModel.self)
          questionVM?.getQuestionsFromApi()
          expect(questionServiceMock.getQuestionsCalled) == true
        }
        
        describe("on success") {
          beforeEach {
            questionServiceMock.success = true
          }
          context("questions") {
            it("should cointain 1 question") {
              let questionVM = container.resolve(QuestionViewModel.self)
              questionVM?.getQuestionsFromApi()
              expect(questionVM?.questions.count).toEventually(equal(1))
            }
          }
        }
        
        describe("on error") {
          beforeEach {
            questionServiceMock.success = false
          }
          context("generalError") {
            it("should cointain 1 question") {
              let questionVM = container.resolve(QuestionViewModel.self)
              
              var (title, message, type):(String, String, ErrorType) = ("", "", .defaultError)
              
              questionVM?.generalError.observeNext {(errorTitle, errorMessage, errorType) in
                message = errorMessage
                title = errorTitle
                type = errorType
                }.dispose(in: self.bag)
              
              questionVM?.getQuestionsFromApi()
              
              expect(title).toEventually(equal("Error"))
              expect(message).toEventually(equal("Please try again!"))
              expect(type).toEventually(equal(.getQuestionError))
            }
          }
        }
      }
      
      describe("selectQuestion") {
        it("should set selectedQuestion") {
          let questionVM = QuestionViewModel()
          let choices = [Choice(id: 1, name: "swift"), Choice(id: 2, name: "kotlin")]
          let question = Question(id: 1, title: "New question Test", choices: choices)
          questionVM.questions.append(question)
          
          questionVM.selectQuestion(id: 1)
          
          expect(questionVM.selectedQuestion.value.id).toEventually(equal(1))
          expect(questionVM.selectedQuestion.value.title).toEventually(equal("New question Test"))
          expect(questionVM.selectedQuestion.value.choices.count).toEventually(equal(2))
          
        }
      }
    }
  }
}

class QuestionServiceMock:QuestionServiceProtocol {
  
  var getQuestionsCalled = false
  var success = true
  
  func getQuestions() -> QuestionSignalProducer {
    
    getQuestionsCalled = true
    let choices:[Choice] = []
    
    if success {
      return SignalProducer { [Question(id: 1, title: "Test", choices: choices)]}
    } else {
      return SignalProducer(error: MoyaError.requestMapping("error"))
    }
  }
}
