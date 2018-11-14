//
//  TopHeadlineResponseModel.swift
//  NewsApp
//
//  Created by vinsi on 11/13/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation
public enum Status:String,Codable{
    case error = "error"
    case ok    = "ok"
}

public struct TopHeadlineResponseModel: Codable {
    let status: Status
    let totalResults: Int?
    let articles: [ArticleModel]?
    let code:NewsAPIStatusCode?
    let message:String?
    
    public init(from decoder: Decoder) throws {
        
 
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
         status =  try! values.decode(Status.self, forKey: .status)
         totalResults =  try? values.decode(Int.self, forKey: .totalResults)
         articles =  try values.decodeIfPresent([ArticleModel].self, forKey: .articles)
         code     =  try values.decodeIfPresent(NewsAPIStatusCode.self, forKey: .code)
         message =   try values.decodeIfPresent(String.self, forKey: .message)
        
    }
}

public struct ArticleModel: Codable {
    let source: SourceModel?
    let author: String?
    let title: String?
    let description: String?
    let url: URL?
    let urlToImage: URL?
    let publishedAt: Date?
    let content: String?
     public init(from decoder: Decoder) throws {
        
        let dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let df = DateFormatter()
        df.dateFormat = dateFormat
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        title  = try values.decodeIfPresent(String.self, forKey: .title)
        description  = try values.decodeIfPresent(String.self, forKey: .description)
        let surl  = try values.decodeIfPresent(String.self, forKey: .url)
        let surlToImage  = try values.decodeIfPresent(String.self, forKey: .urlToImage)
        
        url = URL(string: surl ?? "")
        urlToImage = URL(string: surlToImage ?? "")
        let spublishedAt  = try values.decodeIfPresent(String.self, forKey: .publishedAt)
        publishedAt      = df.date(from: spublishedAt ?? "")
        content  = try values.decodeIfPresent(String.self, forKey: .content)
          source  = try values.decodeIfPresent(SourceModel.self, forKey: .source)
}
}
public struct SourceModel: Codable {
    let id: String?
    let name: String?
}
extension TopHeadlineResponseModel {
    
    func isNextPageAvailable(currentPage:Int,itemsPerPage:Int )->Bool{
        guard let totalresults = self.totalResults else {return false}
        let totalpages =  totalresults  / itemsPerPage
        return currentPage < totalpages
        
    }
}
