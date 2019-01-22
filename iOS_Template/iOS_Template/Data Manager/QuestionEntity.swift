//
//  QuestionEntity.swift
//  iOS_Template
//
//  Created by Sebastian Guerrero F on 1/22/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Foundation
import RealmSwift

class QuestionEntity: Object {

  @objc dynamic var title = ""
  @objc dynamic var id = 0
  
  var choices = List<ChoiceEntity>()
  
  func initFrom(question: Question) {

    id = question.id
    title = question.title
    
    for choice in question.choices {
      let choiceEntity = ChoiceEntity()
      choiceEntity.initFrom(choice: choice)
      choices.append(choiceEntity)
    }
  }
  
  override static func primaryKey() -> String? {
    return "id"
  }
}
