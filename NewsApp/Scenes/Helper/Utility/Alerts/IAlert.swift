//
//  IAlert.swift
//  NewsApp
//
//  Created by vinsi on 11/14/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation
import UIKit
public typealias messageButtonHandler =   (_ buttonIndex:Int)->Void
public protocol IAlert : class  {
    func initialize(baseController:UIViewController)
    func showMessage(text:String ,style:Int )
    func showMessage(text:String ,title:String ,buttons: [(String,Int)],style:Int, callback:messageButtonHandler)
    
}

