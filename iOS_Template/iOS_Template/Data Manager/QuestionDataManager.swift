//
//  QuestionDataManager.swift
//  iOS_Template
//
//  Created by Sebastian Guerrero F on 1/22/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Foundation

class QuestionDataManager: RealmDataManager {
  
  func findBy(title:String) -> QuestionEntity? {
    let predicate = NSPredicate(format: "title = %@", title)
    return dataSource.objects(QuestionEntity.self).filter(predicate).first
  }
}
