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

class QuestionEntityTests: QuickSpec {
  override func spec() {
    
    var container: Container!

    beforeEach {
      container = Container()
//      container.register(DataManagerProtocol.self) { _ in RealmDataManager()}
//      container.register(Realm.Configuration.self) { _ in
//        return Realm.Configuration(inMemoryIdentifier: "SwiftTest")
//      }
//      container.register(Realm.self) { r in
//        try! Realm(configuration: r.resolve(Realm.Configuration.self)!)
//      }
//      container.register(RealmDataManager.self) { r in
//        let realmDataManager = RealmDataManager()
//        realmDataManager.dataSource = try! Realm(configuration: r.resolve(Realm.Configuration.self)!)
//        return realmDataManager
//      }
      
      container.register(RealmDataManager.self) { r in
        let realmDataManager = RealmDataManager()
        realmDataManager.myString = r.resolve()
        return realmDataManager
      }
    }
    
    describe("a QuestionEntity") {
      
      context("on Save") {
        
        it("should save a question to the database"){
//          let choices = [
//            Choice(id: 1, name: "swift"),
//            Choice(id: 2, name: "kotlin"),
//            Choice(id: 3, name: "python")
//          ]
//
//          let question = Question(id: 1, title: "Question title?", choices: choices)
          
          let questionDataManager = QuestionDataManager()
          
          let questionEntity = QuestionEntity()
          
          questionDataManager.saveOrUpdate(object: questionEntity)
          
        }
      }
    }
  }
}


