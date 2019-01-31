//
//  Environment.swift
//  laborboss
//
//  Created by Sebastian Guerrero F on 7/5/18.
//  Copyright © 2018 Devsu. All rights reserved.
//

import Foundation

public enum PlistKey:String {
  case ServerUrl
  case ServerProtocol
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
    case .ServerUrl:
      return infoDict[PlistKey.ServerUrl.rawValue] as! String
    case .ServerProtocol:
      return infoDict[PlistKey.ServerProtocol.rawValue] as! String
    }
  }
}
