//
//  ViewControllerTests.swift
//  iOS_Tests
//
//  Created by Sebastian Guerrero F on 1/29/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Quick
import Nimble
import Swinject
import Cuckoo
import RxSwift

@testable import iOS_Template

class ViewControllerTests: QuickSpec {
  override func spec() {
    describe("ViewController") {
      
      var viewController:ViewController!
      var container:Container!
      var questionViewModelMock:MockQuestionViewModel!
        
      beforeEach {
        container = Container()
        questionViewModelMock = MockQuestionViewModel()
        
        Cuckoo.stub(questionViewModelMock) { mock in
          when(mock.getQuestionsFromApi()).thenDoNothing()
          when(mock.selectedQuestion.get).then({ (_) -> Variable<Question?> in
            return Variable<Question?>(nil)
          })
        }
        
        container.register(ViewController.self) { r in
          let navigationController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! UINavigationController
          let viewController = navigationController.topViewController as! ViewController
          viewController.questionViewModel = r.resolve(QuestionViewModel.self)!
          return viewController
        }
        
        container.register(QuestionViewModel.self) { r in
          let questionViewModel = questionViewModelMock
          let choices = [Choice(id: 1, name: "swift"), Choice(id: 2, name: "kotlin")]
          let question = Question(id: 1, title: "New question Test", choices: choices)
          questionViewModel!.questions.value.append(question)
          return questionViewModel!
        }
        
        viewController = container.resolve(ViewController.self)
        
      }
      
      describe("questionViewModel") {
        it("should not be nil") {
          expect(viewController?.questionViewModel).toNot(beNil())
        }
      }
      
      describe("on viewDidLoad") {
        it("should call questionViewModel getQuestionsFromApi") {
          _ = viewController?.view
          verify(questionViewModelMock, times(1)).getQuestionsFromApi()
        }
      }
      
      describe("questionsTableView") {
        beforeEach {
          _ = viewController?.view
        }

        it("should not be nil") {
          expect(viewController?.questionsTableView).toNot(beNil())
        }

        it("should have one row") {
          expect(viewController.questionsTableView.numberOfRows(inSection: 0)) == 1
        }

        describe("cell text at index 0:1") {
          it("should be New question Test") {
            expect(viewController.questionsTableView.cellForRow(at: IndexPath(row: 0, section: 0))?.textLabel?.text) == "New question Test"
          }
        }
      }
    }
  }
}

