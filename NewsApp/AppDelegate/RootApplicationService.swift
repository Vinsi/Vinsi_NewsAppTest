//
//  LoggerService.swift
//  Trolley
//
//  Created by vinsi on 03/07/2018.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation
import PluggableApplicationDelegate

final class RootApplicationService: NSObject, ApplicationService {
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        print("It has started!")
        
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("It has entered background")
    }
}
