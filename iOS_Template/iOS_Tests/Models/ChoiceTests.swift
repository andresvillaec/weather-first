//
//  ChoiceTests.swift
//  iOS_Tests
//
//  Created by Sebastian Guerrero F on 1/21/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Quick
import Nimble

@testable import iOS_Template

class ChoiceTests: QuickSpec {
  
  override func spec() {
    super.spec()
    
    describe("a choice") {

      context("when instantiated") {
        
        var choice:Choice?
        
        beforeEach {
          choice = Choice(id: 1, name: "swift", votes: 4)
        }

        it("should have the right name") {
          expect(choice!.name) == "swift"
        }

        it("shold have the right votes") {
          expect(choice!.votes) == 4
        }
      }
      
      context("should instantiate correctly from JSON") {
        
        let jsonString = stringFrom(file: "choice", ofType: "json")
        
        var choice: Choice?
        
        beforeEach {
          choice = Choice(JSONString: jsonString)
        }
        
        it("id should be 1") {
          expect(choice?.id) == 1
        }
        
        it("name should be swift") {
          expect(choice?.name) == "Swift"
        }
        
        it("votes should be 2048") {
          expect(choice?.votes) == 2048
        }
      }
    }
  }
}
