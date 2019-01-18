//
//  Environment.swift
//  laborboss
//
//  Created by Sebastian Guerrero F on 7/5/18.
//  Copyright © 2018 Devsu. All rights reserved.
//

import Foundation

public enum PlistKey:String {

}

public struct Environment {
  
  fileprivate var infoDict: [String: Any]  {
    get {
      if let dict = Bundle.main.infoDictionary {
        return dict
      }else {
        fatalError("Plist file not found")
      }
    }
  }
  
  public func configuration(_ key: PlistKey) -> String {
    switch key {
    }
  }
}
