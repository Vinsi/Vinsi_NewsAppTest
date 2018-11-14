//
//  TopHeadlinesRequestModel.swift
//  NewsApp
//
//  Created by vinsi on 11/13/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation
public struct TopHeadlinesRequestModel:Codable {
        var country          :Countries?
        var q                :String?
        var sources          :String?
        var category         :Category?
        var pageSize         :Int?
        var page             :Int?
    
    
}

extension TopHeadlinesRequestModel{
    public func toDictionary()->[String:String]{
        
        var param:[String:String] = [:]
        
        
        if let  q                             =  self.q                { param["q"             ] =  q              }
        if let  sources                       =  self.sources          { param["sources"       ] =  sources        }
        if let  country                       =  self.country          { param["country"       ] =  country.rawValue        }
        if let  category                      =  self.category         { param["category"]       =  category.rawValue }
    
        if let  pageSize                      =  self.pageSize         { param["pageSize"      ] =  String(format: "%d",pageSize)       }
        if let  page                          =  self.page             { param["page"          ] =  String(format: "%d",page  )         }
        return param
    
}
}
