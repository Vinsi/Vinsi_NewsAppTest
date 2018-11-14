//
//  Repository.swift
//  WeatherApp
//
//  Created by vinsi on 10/29/18.
//  Copyright © 2018 vinsi. All rights reserved.
//
import Moya

import Foundation
import CoreLocation
public protocol IRepository : class{
    func getTopHeadlines(requestObject:TopHeadlinesRequestModel,responseCallback:@escaping (_ status:APIStatus , _ response:TopHeadlineResponseModel?)->Void)
    func getEveryThing(requestObject:EveryThingRequestModel,responseCallback:@escaping (_ status:APIStatus , _ response:EveryThingResponseModel?)->Void)
    func getSources(requestObject:SourcesRequestModel,responseCallback:@escaping (_ status:APIStatus , _ response:SourcesResponseModel?)->Void)
}

public class Repository:IRepository{
    let provider = MoyaProvider<NewsAPI>(plugins:[NetworkLoggerPlugin(verbose: true)])
    public func getTopHeadlines(requestObject:TopHeadlinesRequestModel,responseCallback:@escaping (_ status:APIStatus , _ response:TopHeadlineResponseModel?)->Void) {
        
        provider.request(.getTopHeadlines(forObject: requestObject)) { result in
            
//            guard let self = self else {
//
//            responseCallback(APIStatus.unExpectedErrorStatus(),nil)
//               return
//            }
            
            // 3
            switch result {
            case .success(let response):
                do {
                    // 4
              
                    
                        let result = try response.map(TopHeadlineResponseModel.self)
                    responseCallback(APIStatus.SuccessErrorStatus(),result)
                    print(try response.mapJSON())
                } catch {
                    let stat = APIStatus.unExpectedErrorStatus()
                    stat.statusMessage = "Parse error"
                 responseCallback(stat,nil)
                }
            case .failure:
               
                  responseCallback(APIStatus.unExpectedErrorStatus(),nil)
        
            }
        }
        
    }
    
    public func getEveryThing(requestObject:EveryThingRequestModel,responseCallback:@escaping (_ status:APIStatus , _ response:EveryThingResponseModel?)->Void) {
        
        provider.request(.getEveryThing (forObject: requestObject)) { result in
            
            //            guard let self = self else {
            //
            //            responseCallback(APIStatus.unExpectedErrorStatus(),nil)
            //               return
            //            }
            
            // 3
            switch result {
            case .success(let response):
                do {
                    // 4
                    
                    
                    let result = try response.map(EveryThingResponseModel.self)
                    if result.status == Status.error{
                      let status =  APIStatus.NewStatus( newsApiStatus: result.code)
                        status.statusMessage = result.message ?? "failed"
                        
                         responseCallback( status,result)
                        return
                    }
                    // on Success
                    responseCallback(APIStatus.SuccessErrorStatus(),result)
                    print(try response.mapJSON())
                } catch {
                    let stat = APIStatus.unExpectedErrorStatus()
                    stat.statusMessage = "Parse error"
                    responseCallback(stat,nil)
                }
            case .failure:
                
                responseCallback(APIStatus.unExpectedErrorStatus(),nil)
                
            }
        }
        
    }
  public  func getSources(requestObject:SourcesRequestModel,responseCallback:@escaping (_ status:APIStatus , _ response:SourcesResponseModel?)->Void) {
        
        provider.request(.getSources (forObject: requestObject)) { result in
            
            //            guard let self = self else {
            //
            //            responseCallback(APIStatus.unExpectedErrorStatus(),nil)
            //               return
            //            }
            
            // 3
            switch result {
            case .success(let response):
                do {
                    // 4
                    
                    
                    let result = try response.map(SourcesResponseModel.self)
                    responseCallback(APIStatus.SuccessErrorStatus(),result)
                    print(try response.mapJSON())
                } catch {
                    let stat = APIStatus.unExpectedErrorStatus()
                    stat.statusMessage = "Parse error"
                    responseCallback(stat,nil)
                }
            case .failure:
                
                responseCallback(APIStatus.unExpectedErrorStatus(),nil)
                
            }
        }
        
    }
    
}
