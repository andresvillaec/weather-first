//
//  QuestionEntityTests.swift
//  iOS_Tests
//
//  Created by Sebastian Guerrero F on 1/22/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Quick
import Nimble
import RealmSwift
import Swinject

@testable import iOS_Template

class QuestionDataManagerTests: QuickSpec {
  override func spec() {
    
    var container: Container!

    beforeEach {
      container = Container()
      container.register(QuestionDataManager.self) { r in
        let questionDataManager = QuestionDataManager()
        questionDataManager.dataSource = r.resolve(Realm.self)!
        return questionDataManager
      }
      
      container.register(Realm.self) { r in
        try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "test-Realm"))
      }
    }
    
    describe("a QuestionEntity") {
      
      var questionEntity: QuestionEntity!
      
      beforeEach {
        let choices = [
          Choice(id: 1, name: "swift"),
          Choice(id: 2, name: "kotlin"),
          Choice(id: 3, name: "python")
        ]
        let question = Question(id: 1, title: "Question title?", choices: choices)
        questionEntity = QuestionEntity()
        questionEntity.initFrom(question: question)
      }
      
      context("on initFrom question") {
        it("should set all attributes from question") {
          expect(questionEntity.title) == "Question title?"
          expect(questionEntity.choices.count) == 3
        }
      }
    }
    
    describe("QuestionDataManager") {
      var questionEntity: QuestionEntity!
      var question: Question!

      beforeEach {
        let choices = [
          Choice(id: 1, name: "swift"),
          Choice(id: 2, name: "kotlin"),
          Choice(id: 3, name: "python")
        ]
        question = Question(id: 1, title: "Question title?", choices: choices)
        questionEntity = QuestionEntity()
        questionEntity.initFrom(question: question)
      }
      
      context("on save") {
        it("should save a question to the database"){
          let questionDataManager = container.resolve(QuestionDataManager.self)
          questionDataManager?.saveOrUpdate(object: questionEntity)
          let realm = container.resolve(Realm.self)
          expect(realm?.objects(QuestionEntity.self).count) == 1
        }
      }
      
      context("on findBy title") {
        it("should return the right question") {
          let questionDataManager = container.resolve(QuestionDataManager.self)
          questionDataManager?.saveOrUpdate(object: questionEntity)
          let questionEntityResult = questionDataManager?.findBy(title:"Question title?")
          expect(questionEntityResult?.id) == 1
        }
      }
    }
  }
}


