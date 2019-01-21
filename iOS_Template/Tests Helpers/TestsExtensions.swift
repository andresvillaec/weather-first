//
//  TestsExtensions.swift
//  iOS_Template
//
//  Created by Sebastian Guerrero F on 1/21/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import XCTest
import Mockingjay

extension XCTest {
  
  public func stub(_ method: HTTPMethod = .get, requestPath: String, fileName: String) {
    let path = Bundle(for: type(of: self)).path(forResource: fileName, ofType: "json")!
    let data = NSData(contentsOfFile: path)! as Data
    stub(http(method, uri:requestPath), jsonData(data))
  }
  
  public func stub(_ method: HTTPMethod = .get, requestPath: String, error: NSError){
    stub(http(method, uri:requestPath), failure(error))
  }
  
}
