

//
//  File.swift
//  NewsApp
//
//  Created by vinsi on 11/13/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation
public  enum NewsAPIStatusCode:String,Codable {
    case apiKeyDisabled    = "apiKeyDisabled"  //- Your API key has been disabled.
    case apiKeyExhausted   = "apiKeyExhausted"  //- Your API key has no more requests available.
    case apiKeyInvalid     = "apiKeyInvalid"  //- Your API key hasn't been entered correctly. Double check it and try again.
    case apiKeyMissing     = "apiKeyMissing"  //- Your API key is missing from the request. Append it to the request with one of these methods.
    case parameterInvalid  = "parameterInvalid"  //- You've included a parameter in your request which is currently not supported. Check the message property for more details.
    case parametersMissing = "parametersMissing"  //- Required parameters are missing from the request and it cannot be completed. Check the message property for more details.
    case rateLimited       = "rateLimited"  //- You have been rate limited. Back off for a while before trying the request again.
    case sourcesTooMany    = "sourcesTooMany"  //- You have requested too many sources in a single request. Try splitting the request into 2 smaller requests.
    case sourceDoesNotExist = "sourceDoesNotExist"  //- You have requested a source which does not exist.
    case unexpectedError   = "unexpectedError"  //- This shouldn't happen, and if it does then it's our fault, not yours. Try the request again shortly.
}
public enum NewsAPIHttpResponseCode :Int {
    
   case success         = 200 // OK. The request was executed successfully.
   case badrequest      = 400 // Bad Request. The request was unacceptable, often due to a missing or misconfigured parameter.
   case unauthorized    = 401 // Unauthorized. Your API key was missing from the request, or wasn't correct.
   case tooManyRequests = 429 // Too Many Requests. You made too many requests within a window of time and have been rate limited. Back off for a while.
   case serverError     = 500
    
}
