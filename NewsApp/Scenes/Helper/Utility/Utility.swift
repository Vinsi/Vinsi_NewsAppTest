//
//  File.swift
//  NewsApp
//
//  Created by vinsi on 11/14/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation
protocol IBasicUtility {
    var alert:IAlert? {get set}
    var activity:IHudLoading? {get set}
    
}
class BasicUtility:IBasicUtility{
    var alert: IAlert? = AlertMessage()
    
    var activity: IHudLoading? = JHud()
    

    
    
    
}
