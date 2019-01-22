//
// Created by Sebastian Guerrero F on 2019-01-21.
// Copyright (c) 2019 DEVSU. All rights reserved.
//

import Foundation
import ObjectMapper

class Choice:Mappable {
  
  private(set) var id: Int
  private(set) var name: String
  private(set) var votes: Int

  init(id: Int, name: String, votes: Int = 0) {
    self.id = id
    self.name = name
    self.votes = votes
  }
  
  convenience required init?(map: Map) {
    self.init(id: 0, name: "", votes: 0)
  }
  
  func mapping(map:Map) {
    id <- map["id"]
    name <- map["name"]
    votes <- map["votes"]
  }
}

