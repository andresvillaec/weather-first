//
//  Question.swift
//  iOS_Template
//
//  Created by Sebastian Guerrero F on 1/21/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Foundation
import ObjectMapper

class Question: Mappable {
  
  private(set) var title: String
  private(set) var choices: [Choice]
  
  init(title: String, choices: [Choice]) {
    self.title = title
    self.choices = choices
  }
  
  convenience required init?(map:Map) {
    self.init(title: "", choices: [])
  }
  
  func mapping(map: Map) {
    title <- map["title"]
    choices <- map["choices"]
  }
}
