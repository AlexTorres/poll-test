//
//  PostRouter.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/10/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import Foundation
import Foundation
import Alamofire

enum PostRouter: URLRequestConvertible {
  static let baseURLString = Configuration.sharedInstance.apiEndPoint
  case Get()
  case Create([String: AnyObject])
  
  var URLRequest: NSMutableURLRequest {
    var method: Alamofire.Method {
      switch self {
      case .Get:
        return .GET
      case .Create:
        return .POST
      }
    }
    
    let url: NSURL = {
      let relativePath: String?
      switch self {
      case .Get, .Create:
        relativePath = Constans.API.APIPats.questions
      }
      
      var URL = NSURL(string: PostRouter.baseURLString)!
      if let relativePath = relativePath {
        URL = URL.URLByAppendingPathComponent(relativePath)
      }
      return URL
    }()
    
    let params: ([String: AnyObject]?) = {
      switch self {
      case .Get:
        return (nil)
      case .Create(let newPost):
        return (newPost)
      }
    }()
    
    let URLRequest = NSMutableURLRequest(URL: url)
    
    let encoding = Alamofire.ParameterEncoding.JSON
    let (encodedRequest, _) = encoding.encode(URLRequest, parameters: params)
    
    encodedRequest.HTTPMethod = method.rawValue
    
    return encodedRequest
  }
}
