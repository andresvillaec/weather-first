//
//  QuestionViewModelTests.swift
//  iOS_Tests
//
//  Created by Sebastian Guerrero F on 1/25/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Quick
import Nimble
import RxSwift
import Moya
import Swinject

@testable import iOS_Template

class QuestionViewModelTests: QuickSpec {
  override func spec() {
    var container: Container!
    var questionServiceMock: QuestionServiceMock!
    var questionDataManagerMock: QuestionDataManagerMock!
    var questionVM:QuestionViewModel!
    var disposeBag = DisposeBag()
    
    beforeEach {
      questionServiceMock = QuestionServiceMock()
      questionDataManagerMock = QuestionDataManagerMock()
      
      container = Container()
      container.register(QuestionViewModel.self) { r in
        let questionVM = QuestionViewModel()
        questionVM.questionService = questionServiceMock
        questionVM.questionDataManager = questionDataManagerMock
        return questionVM
      }
      
      questionVM = container.resolve(QuestionViewModel.self)
    }
    
    describe("QuestionViewModel") {
      describe("getQuestionsFromApi") {
        it("should call getQuestions in QuestionsService") {
          questionVM?.getQuestionsFromApi()
          expect(questionServiceMock.getQuestionsCalled) == true
        }
        
        describe("on success") {
          beforeEach {
            questionServiceMock.success = true
          }
          context("questions") {
            it("should cointain 1 question") {
              questionVM?.getQuestionsFromApi()
              expect(questionVM?.questions.value.count).toEventually(equal(1))
            }
          }
        }
        
        describe("on error") {
          beforeEach {
            questionServiceMock.success = false
          }
          context("generalError") {
            it("should produce error message") {
              var (title, message, type):(String, String, ErrorType) = ("", "", .defaultError)
              
              questionVM.generalError.subscribe { (event) in
                message = event.element?.message ?? ""
                title = event.element?.title ?? ""
                type = (event.element?.type)!
              }.disposed(by: disposeBag)
              
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
          let choices = [Choice(id: 1, name: "swift"), Choice(id: 2, name: "kotlin")]
          let question = Question(id: 1, title: "New question Test", choices: choices)
          questionVM.questions.value.append(question)
          
          questionVM.selectedQuestion.value = question
          
          expect(questionVM.selectedQuestion.value!.id).toEventually(equal(1))
          expect(questionVM.selectedQuestion.value!.title).toEventually(equal("New question Test"))
          expect(questionVM.selectedQuestion.value!.choices.count).toEventually(equal(2))
          
        }
      }
      
      describe("saveQuestion") {
        it("should call save func in the dataManager") {
          let choices = [Choice(id: 1, name: "swift"), Choice(id: 2, name: "kotlin")]
          let question = Question(id: 1, title: "New question Test", choices: choices)
          questionVM?.selectedQuestion.value = question
          questionVM?.saveToDatabase()
          expect(questionDataManagerMock.saveOrUpdateCalled) == true
        }
      }
    }
  }
}

class QuestionServiceMock:QuestionServiceProtocol {
  
  var getQuestionsCalled = false
  var success = true
  
  func getQuestions() -> QuestionPrimitiveSequence {
    
    getQuestionsCalled = true
    let choices:[Choice] = []
    
    if success {
      return PrimitiveSequence.just([Question(id: 1, title: "Test", choices: choices)])
    } else {
      return PrimitiveSequence.error( MoyaError.requestMapping("error"))
    }
  }
}

class QuestionDataManagerMock:RealmDataManager {
  
  var saveOrUpdateCalled = false
  
  override func saveOrUpdate<T>(object: T) {
    saveOrUpdateCalled = true
  }
}
