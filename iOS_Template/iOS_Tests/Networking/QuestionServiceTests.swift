//
//  QuestionServiceTests.swift
//  iOS_Tests
//
//  Created by Sebastian Guerrero F on 1/24/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Quick
import Nimble
import Moya
import ReactiveSwift
import ObjectMapper

@testable import iOS_Template

class QuestionServiceTests: QuickSpec {
  override func spec() {
    describe("QuestionService") {
      context("getQuestions") {
        context("onSuccess") {
          it("should return an array of one questions") {
            
            self.stub(requestPath: "/questions", fileName: "questions")
            
            let testQuestions = [
              Question(
                id: 1,
                title: "Favourite programming language?",
                choices: [
                  Choice(id: 1, name: "Swift", votes: 2048),
                  Choice(id: 2, name: "Python", votes: 1024),
                  Choice(id: 3, name: "Objective-C", votes: 512),
                  Choice(id: 4, name: "Ruby", votes: 256),
                  
                  ])
            ]
            
            var questions:[Question] = []
            
            let questionService = QuestionService()
            
            questionService.getQuestions().start({ (event) in
              switch event {
              case .value(let questionsResponse):
                questions = questionsResponse!
              case .failed(_):
                break
              case .completed:
                break
              case .interrupted:
                break
              }
            })
            
            expect(questions.count).toEventually(equal(testQuestions.count))
            expect(questions[0].title).toEventually(equal(testQuestions[0].title))
            expect(questions[0].choices.count).toEventually(equal(testQuestions[0].choices.count))
          }
        }
      }
    }
  }
}

