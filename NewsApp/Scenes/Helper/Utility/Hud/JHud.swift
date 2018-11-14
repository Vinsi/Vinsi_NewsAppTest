//
//  File.swift
//  NewsApp
//
//  Created by vinsi on 11/14/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation
import UIKit
import JGProgressHUD


class JHud:IHudLoading{
    var hud:JGProgressHUD?
    func showHud(inView: UIView) {
         DispatchQueue.main.async {
            
        self.hud =  JGProgressHUD(style: .dark)
        self.hud?.show(in: inView)
        }
    }
    
    func hide() {
        
        hud?.dismiss()
        hud?.removeFromSuperview()
        hud = nil
    }
    
    
}
