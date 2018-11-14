//
//  APISatatus.swift
//  NewsApp
//
//  Created by vinsi on 11/13/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation
public class APIStatus{
    var apiStatus:NewsAPIStatusCode? = nil
    var responseCode:NewsAPIHttpResponseCode = .success
    var statusMessage:String = "Success"
    func hasError()->Bool{
        
        if self.apiStatus != nil  {
            return true
        }
        if self.responseCode != .success  {
            return true
        }
        return false
    }
    func isSuccess()->Bool{
        return !hasError()
    }
    static func NewStatus(responsecode:NewsAPIHttpResponseCode = .success ,newsApiStatus:NewsAPIStatusCode? = nil  )->APIStatus{
        
        let status:APIStatus = APIStatus()
        status.responseCode = responsecode
        status.apiStatus    = newsApiStatus
        return status
        
    }
    static func unExpectedErrorStatus()->APIStatus{
        
        let status = APIStatus.NewStatus( newsApiStatus: NewsAPIStatusCode.unexpectedError)
        return status
    }
    static func SuccessErrorStatus()->APIStatus{
        
        let status = APIStatus.NewStatus()
        return status
    }
}
