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

@testable import iOS_Template

class ViewControllerTests: QuickSpec {
  override func spec() {
    describe("ViewController") {
      describe("questionsTableView") {
        it("should not be nil") {
          let sut = ViewController()
          sut.loadView()
          expect(sut.questionViewModel).toNot(beNil())
        }
      }
    }
  }
}
