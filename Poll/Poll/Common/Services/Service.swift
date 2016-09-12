//
//  Service.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/9/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import Foundation
import Alamofire
class Service {
  var request: Alamofire.Request?
  class var sharedInstance: Service {
    struct Singleton {
      static let instance = Service()
    }
    return Singleton.instance
  }
  
  func apiPOSTRequest(paramethers: [String: AnyObject]?,
    completion: Completion,
    failture: Failture) {
      request = Alamofire.request(PostRouter.Create(paramethers!)).responseString {
        self.procesedData($0, completion: {
          completion($0)
          }, failture: {
          failture($0)
        })
      }
  }
  
  func apiGETRequest(completion: Completion,
    failture: Failture) {
      request = Alamofire.request(PostRouter.Get()).responseString {
        self.procesedData($0, completion: {
          completion($0)
          }, failture: {
          failture($0)
        })
      }
  }
  
  private func procesedData(response: Response<String, NSError>,
    completion: Completion,
    failture: Failture) {
      guard let JSON = response.result.value else {
        guard let error = response.result.error else {
          return
        }
        failture(error)
        return
      }
      completion(JSON)
  }
  
}
