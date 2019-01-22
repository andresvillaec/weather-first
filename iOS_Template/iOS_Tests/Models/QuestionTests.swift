//
//  Question.swift
//  iOS_Tests
//
//  Created by Sebastian Guerrero F on 1/21/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Quick
import Nimble

@testable import iOS_Template

class QuestionTests: QuickSpec {
  
  override func spec() {
    
    describe("a question") {
      
      context("when instantiated") {
        
        var question:Question?
        
        beforeEach {
          let choices = [
            Choice(id: 1, name: "swift"),
            Choice(id: 2, name: "kotlin"),
            Choice(id: 3, name: "python")
          ]
          
          question = Question(id: 1, title: "Question title?", choices: choices)
        }
        
        it("should have the right title") {
          expect(question!.title) == "Question title?"
        }
        
        it("should have the right choices") {
          expect(question!.choices.count) == 3
          expect(question?.choices[0].name) == "swift"
          expect(question?.choices[1].name) == "kotlin"
          expect(question?.choices[2].name) == "python"
        }
      }
      
      context("should instantiate correctly from JSON") {
        
        let jsonString = stringFrom(file: "question", ofType: "json")
        
        var question: Question?
        
        beforeEach {
          question = Question(JSONString: jsonString)
        }
        
        it("id should be 1") {
          expect(question?.id) == 1
        }
        
        it("title should be: What is your favorite languaje") {
          expect(question?.title) == "What is your favorite languaje"
        }
        
        it("should have 3 choices") {
          expect(question?.choices.count) == 3
        }
        
        it("should have right choices") {
          expect(question?.choices[0].name) == "swift"
          expect(question?.choices[1].name) == "kotlin"
          expect(question?.choices[2].name) == "python"
        }
      }
    }
  }
}

