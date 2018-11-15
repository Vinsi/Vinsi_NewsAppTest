//
//  File.swift
//  NewsApp
//
//  Created by vinsi on 11/14/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation
import UIKit

class AlertMessage: IAlert{
    
    
    
    
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
    
    func showMessage(text:String ,title:String ,defaultbutton: String,cancelbutton:String, callback: @escaping (Int) -> Void) {
        
        let alert = UIAlertController(title: "Alert", message: text, preferredStyle:UIAlertController.Style.alert)

       
    
            
            alert.addAction(
                UIAlertAction(title: defaultbutton, style: UIAlertAction.Style.default, handler: { action in
                    
                    callback(0)
                   
                    
                }))
           alert.addAction(
                    UIAlertAction(title: cancelbutton, style: UIAlertAction.Style.cancel, handler: { action in
                        
                        callback(1)
                        
                        
                    }))
           
       
        
            
     
        self.controller?.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
}
