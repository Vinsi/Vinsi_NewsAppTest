//
//  SourcesModel.swift
//  NewsApp
//
//  Created by vinsi on 11/13/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation

public struct SourcesResponseModel: Codable {
    let status: String
    let sources: [Source]
}

public struct Source: Codable {
    let id, name, description: String?
    let url: URL?
    let category: Category?
    let language:Language?
    let country: Countries?
    public init(from decoder: Decoder) throws {
        
        let dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let df = DateFormatter()
        df.dateFormat = dateFormat
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
                 id        = try values.decodeIfPresent(String.self, forKey: .id)
                 name        = try values.decodeIfPresent(String.self, forKey: .name)
          description        = try values.decodeIfPresent(String.self, forKey: .description)
          category  = try values.decodeIfPresent(Category.self, forKey: .category)
         language  = try values.decodeIfPresent(Language.self, forKey: .language)
         country  = try values.decodeIfPresent(Countries.self, forKey: .country)
        
         let surl  = try values.decodeIfPresent(String.self, forKey: .url)
     
        
        url = URL(string: surl ?? "")
    }
}

public enum Category: String, Codable {
    case business      = "business"
    case entertainment = "entertainment"
    case general       = "general"
    case health        = "health"
    case science       = "science"
    case sports        = "sports"
    case technology    = "technology"
    
    public func allValues() ->[String] {
     let items = [
       Category.business     .rawValue,
       Category.entertainment.rawValue,
       Category.general      .rawValue,
       Category.health       .rawValue,
       Category.science      .rawValue,
       Category.sports       .rawValue,
       Category.technology   .rawValue
        ]
        return items
    }
        
        
    
}
