//
//  LocalManager.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/12/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import UIKit
import ObjectMapper

class LocalManager: NSObject {
  static let kQuestionsKey = "questions"
  class var sharedInstance: LocalManager {
    struct Singleton {
      static let instance = LocalManager()
    }
    return Singleton.instance
  }
  
  var questionsSting: String? {
    set {
      let userData = NSKeyedArchiver.archivedDataWithRootObject(newValue!)
      NSUserDefaults.standardUserDefaults().setObject(userData, forKey: LocalManager.kQuestionsKey)
      
    } get {
      guard let data = NSUserDefaults.standardUserDefaults().dataForKey(LocalManager.kQuestionsKey) else {
        return String()
      }
      guard let string = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? String else {
        return String ()
      }
      return string
    }
  }
  
  var questions: QuestionsModel? {
    get {
      if questionsSting == String () {
        return QuestionsModel(JSONString: "")
      }
      
      return Mapper<QuestionsModel>().map(questionsSting)!
    }
    set {
      
      questionsSting = newValue?.toJSONString(true)
    }
    
  }
  
}
