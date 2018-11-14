//
//  Pager.swift
//  NewsApp
//
//  Created by vinsi on 11/13/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation
struct CurrentPage{
    var TotalItems:Int
    var ItemsPerPage:Int
    var CurrentPage:Int
    func isNextPageAvailable()->Bool{
        
        let totalpages = TotalItems / ItemsPerPage
        if CurrentPage < totalpages {
            return true
        }
        else {
            return false
        }
    
        
    }
    
    
}
protocol IPagingLoadTask{
    associatedtype content
    var callback:(_ pageno:Int)->CurrentPage { get set }
    func getTotalItemsFetched()->Int
    func task( pageno:Int,itemsPerPage:Int)
    
}
