//
//  EndPoints.swift
//  NewsApp
//
//  Created by vinsi on 11/13/18.
//  Copyright © 2018 vinsi. All rights reserved.
//
import Moya
import Foundation
enum Environment{
    case production
    case staging
    case testing
    case testingstub
}



public enum  NewsAPI{
    static let environment:Environment = .production
    static private let apiKey = "db7356aaa5fc4f7a89aaba9aec087a5a"
    
    case getTopHeadlines(forObject:TopHeadlinesRequestModel)
    case getEveryThing(forObject:EveryThingRequestModel)
    case getSources(forObject:SourcesRequestModel)
}
extension NewsAPI:TargetType{
    var environmentBaseURL:String{
        switch NewsAPI.environment {
        case .production:
            return "https://newsapi.org/v2"
        case .staging:
            return ""
        case .testingstub:
            return ""
        default:
            return ""
        }
    }
    public var baseURL: URL {
        return URL(string: environmentBaseURL)!
    }
    
    public var path: String {
        switch self {
        case .getTopHeadlines:
            return "/top-headlines"
            
        case .getEveryThing:
            return "/everything"
            
        case .getSources:
            return "/sources"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    private func addAuthKey(  param: inout [String:String]) ->[String:String]{
        param["apiKey"] = NewsAPI.apiKey
        return param
    }
    
    
    public var task: Task {
        
        switch self {
        case .getTopHeadlines(let request):
            
            var param = request.toDictionary()
            
            
            return .requestParameters(parameters:  addAuthKey(param:&param) , encoding:  URLEncoding.default)
            
        case .getEveryThing(let request):
            
            
            
            
            
            var param = request.toDictionary()
            
            return .requestParameters(parameters: addAuthKey(param:&param), encoding:  URLEncoding.default)
        case .getSources(let request):
            
            var param = request.toDictionary()
            
            return .requestParameters(parameters: addAuthKey(param:&param) , encoding:  URLEncoding.default)
            
        }
        
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}
