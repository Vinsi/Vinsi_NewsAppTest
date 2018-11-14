//
//  File.swift
//  NewsApp
//
//  Created by vinsi on 11/14/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation
public typealias messageButtonHandler =   (_ buttonIndex:Int)->Void
public protocol IAlert {
    func initialize(baseController:UIViewController)
    func showMessage(text:String ,style:Int )
    func showMessage(text:String ,title:String ,buttons: [(String,Int)],style:Int, callback:messageButtonHandler)
    
}
class AlertMessage:IAlert{
    
    
    
    
    private var controller:UIViewController? = nil
    func initialize(baseController: UIViewController) {
        self.controller = baseController
    }
    
    func showMessage(text: String, style:Int = UIAlertController.Style.alert.rawValue) {
        
        let alert = UIAlertController(title: "Alert", message: text, preferredStyle:UIAlertController.Style(rawValue: style)!)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            
            
            
        }))
        
        
        self.controller?.present(alert, animated: true, completion: nil)
    }
    
    func showMessage(text: String, title: String, buttons: [(String,Int)],style:Int, callback: (Int) -> Void) {
        
        let alert = UIAlertController(title: "Alert", message: text, preferredStyle:UIAlertController.Style(rawValue: style)!)
        
        for button in buttons {
            let (text,style) = button
            alert.addAction(
                UIAlertAction(title: text, style: UIAlertActionStyle(rawValue: style)!, handler: { action in })
            )
            
        }
        self.controller?.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
}
