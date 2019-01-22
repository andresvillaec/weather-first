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
  
  private(set) var id: Int
  private(set) var title: String
  private(set) var choices: [Choice]
  
  init(id:Int, title: String, choices: [Choice]) {
    self.id = id
    self.title = title
    self.choices = choices
  }
  
  convenience required init?(map:Map) {
    self.init(id: 0, title: "", choices: [])
  }
  
  func mapping(map: Map) {
    id <- map["id"]
    title <- map["title"]
    choices <- map["choices"]
  }
}

