//
//  ChoiceEntity.swift
//  iOS_Template
//
//  Created by Sebastian Guerrero F on 1/22/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Foundation
import RealmSwift

class ChoiceEntity: Object {
  
  @objc dynamic var id:Int = 0
  @objc dynamic var name:String = ""
  @objc dynamic var votes:Int = 0
  
  func initFrom(choice: Choice) {
    id = choice.id
    name = choice.name
    votes = choice.votes
  }
  
  override static func primaryKey() -> String? {
    return "id"
  }
}
