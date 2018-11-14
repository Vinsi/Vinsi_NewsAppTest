//
//  NewsModel.swift
//  NewsApp
//
//  Created by vinsi on 11/13/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation

public enum Language :String,Codable{
    case  ar = "ar"
    case  de = "de"
    case  en = "en"
    case  es = "es"
    case  fr = "fr"
    case  he = "he"
    case  it = "it"
    case  nl = "nl"
    case  no = "no"
    case  pt = "pt"
    case  ru = "ru"
    case  se = "se"
    case  ud = "ud"
    case  zh = "zh"
    public static func allValues() ->[String] {
        let items = [
         Language.ar.rawValue,
         Language.de.rawValue,
         Language.en.rawValue,
         Language.es.rawValue,
         Language.fr.rawValue,
         Language.he.rawValue,
         Language.it.rawValue,
         Language.nl.rawValue,
         Language.no.rawValue,
         Language.pt.rawValue,
         Language.ru.rawValue,
         Language.se.rawValue,
         Language.ud.rawValue,
         Language.zh.rawValue
        ]
        return items
    }
}
public enum SortOrder:String,Codable{
    case relevancy   = "relevancy"
    case popularity  = "popularity"
    case publishedAt = "publishedAt"
    
    public static func allValues() ->[String] {
        let items = [
            
             SortOrder.relevancy  .rawValue,
             SortOrder.popularity .rawValue,
             SortOrder.publishedAt.rawValue
        ]
        return items
        
    }
}
public struct EveryThingRequestModel: Codable {
    var q                :String?
    var sources          :String?
    var domains          :String?
    var excludeDomains   :String?
    var from             :Date?
    var to               :Date?
    var language         :Language?
    var sortBy           :SortOrder?
    var pageSize         :Int?
    var page             :Int?

}
public extension EveryThingRequestModel {
    
    public func toDictionary()->[String:String]{
        
        var param:[String:String] = [:]
      
        
        if let  q                             =  self.q                { param["q"             ] =  q              }
        if let  sources                       =  self.sources          { param["sources"       ] =  sources        }
        if let  domains                       =  self.domains          { param["domains"       ] =  domains        }
        if let  excludeDomains                =  self.excludeDomains   { param["excludeDomains"] =  excludeDomains }
        if let  from                          =  self.from             {
            //2018-11-13T15:05:03Z
            let dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            let df = DateFormatter()
            df.dateFormat = dateFormat
            
            
            let datef = df.string(from: from)
            param["from"          ] =  datef
            
        }
        if let  to                            =  self.to               {
            
            let dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            let df = DateFormatter()
            df.dateFormat = dateFormat
            
            
            let dateto = df.string(from: to)
            
            param["to"            ] =  dateto
            
        }
        if let  language                      =  self.language         { param["language"      ] =  language.rawValue       }
        if let  sortBy                        =  self.sortBy           { param["sortBy"        ] =  sortBy.rawValue         }
        if let  pageSize                      =  self.pageSize         { param["pageSize"      ] =  String(format: "%d",pageSize)       }
        if let  page                          =  self.page             { param["page"          ] =  String(format: "%d",page  )         }
        return param
        
    }
}
