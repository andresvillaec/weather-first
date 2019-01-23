//
//  ChoiceDataManager.swift
//  iOS_Tests
//
//  Created by Sebastian Guerrero F on 1/23/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Quick
import Nimble
import Swinject
import RealmSwift
@testable import iOS_Template

class ChoiceDataManagerTests: QuickSpec {
  override func spec() {
    var container: Container!
    
    beforeEach {
      container = Container()
      container.register(ChoiceDataManager.self) { r in
        let choiceDataManager = ChoiceDataManager()
        choiceDataManager.dataSource = r.resolve(Realm.self)!
        return choiceDataManager
      }
      
      container.register(Realm.self) { r in
        try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "test-Realm"))
      }
    }
    
    describe("a ChoiceEntity") {
      var choiceEntity: ChoiceEntity!
      
      beforeEach {
        let choice = Choice(id: 1, name: "swift", votes: 100)
        choiceEntity = ChoiceEntity()
        choiceEntity.initFrom(choice: choice)
      }
      
      context("on initFrom choice") {
        it("should set all attributes from choice") {
          expect(choiceEntity.id) == 1
          expect(choiceEntity.name) == "swift"
          expect(choiceEntity.votes) == 100
        }
      }
    }
    
    describe("ChoiceDataManager") {
      var choiceEntity: ChoiceEntity!
      var choice: Choice!
      
      beforeEach {
        choice = Choice(id: 1, name: "swift", votes: 300)
        choiceEntity = ChoiceEntity()
        choiceEntity.initFrom(choice: choice)
      }
      
      context("on save") {
        it("should save a choice to the database") {
          let choiceDataManager = container.resolve(ChoiceDataManager.self)
          choiceDataManager?.saveOrUpdate(object: choiceEntity)
          
          let realm = container.resolve(Realm.self)
          expect(realm?.objects(ChoiceEntity.self).count) == 1

        }
      }
    }
  }
}
