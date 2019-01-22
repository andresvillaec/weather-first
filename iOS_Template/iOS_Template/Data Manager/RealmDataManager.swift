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
  var myString:String
  
  init(name:String = "hola") {
    myString = name
  }
  
  func saveOrUpdate<T>(object: T) {
    // realm.write ...
    // print("Patito   " + "\(dataSource.configuration.inMemoryIdentifier)")
    print(myString)
  }
}
