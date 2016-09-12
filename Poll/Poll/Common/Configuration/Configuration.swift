//
//  Configuration.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/9/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import Foundation
import UIKit

class Configuration {
  
  class var sharedInstance: Configuration {
    struct Singleton {
      static let instance = Configuration()
    }
    
    return Singleton.instance
  }
  
  var appWidth: CGFloat {
    get {
      let screenRect = UIScreen.mainScreen().bounds
      let screenWidth = screenRect.size.width
      
      return screenWidth
    }
  }
  
  var appHeight: CGFloat {
    get {
      let screenRect = UIScreen.mainScreen().bounds
      let screenHeight = screenRect.size.height
      
      return screenHeight
    }
  }
  
  var configuration: String {
    get {
      if NSProcessInfo.processInfo().environment["XCTestConfigurationFilePath"] != nil {
        
        return ConfigurationStages.Testing.rawValue
      }
      
      return NSBundle.mainBundle().infoDictionary![Constans.Configuration] as! String
    }
  }
  
  let path = NSBundle.mainBundle().pathForResource(Constans.Configuration, ofType: Constans.FileExtension.plist)
  
  var apiEndPoint: String {
    get {
      let configutationPlist = NSDictionary(contentsOfFile: path!)
      let configurationDictionary = configutationPlist![configuration] as! NSDictionary
      return configurationDictionary.objectForKey(Constans.API.apiKey) as! String
    }
  }
}
