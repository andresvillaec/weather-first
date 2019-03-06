//
//  AppDelegate.swift
//  iOS_Template
//
//  Created by Sebastian Guerrero F on 1/18/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    let customVar = Environment().configuration(.EnvironmentName)
    print(customVar)
    
    return true
  }
  
  func setUpCrashAnalyticsService() {
    // TODO: Implement any service according to the needs of the project
  }
}

