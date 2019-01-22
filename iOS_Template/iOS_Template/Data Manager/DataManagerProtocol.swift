//
//  DataManagerProtocol.swift
//  iOS_Template
//
//  Created by Sebastian Guerrero F on 1/22/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Foundation

protocol DataManagerProtocol {
  func saveOrUpdate<T>(object:T)
}
