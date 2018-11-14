//
//  AppDelegate.swift
//  NewsApp
//
//  Created by vinsi on 11/13/18.
//  Copyright © 2018 vinsi. All rights reserved.
//
import UIKit
import PluggableApplicationDelegate
@UIApplicationMain
class AppDelegate: PluggableApplicationDelegate {
    
    override var services: [ApplicationService] {
        return [
            IQKeyBoardApplicationService(),
            RootApplicationService()
            
        ]
    }
}

