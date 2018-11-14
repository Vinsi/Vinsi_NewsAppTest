//
//  File.swift
//  NewsApp
//
//  Created by vinsi on 11/14/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation
import IQKeyboardManagerSwift
import PluggableApplicationDelegate
final class IQKeyBoardApplicationService : NSObject, ApplicationService {
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        print("It has started!")
         IQKeyboardManager.shared.enable = true
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("It has entered background")
    }
}
