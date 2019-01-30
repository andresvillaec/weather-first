//
//  BaseDataManager.swift
//  iOS_Template
//
//  Created by Sebastian Guerrero F on 1/22/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Foundation
import RealmSwift

class RealmDataManager: DataManagerProtocol {
  
  var dataSource = try! Realm()
  
  func saveOrUpdate<T>(object: T) {
    try! dataSource.write {
      dataSource.add(object as! Object, update: true)
    }
  }
}
