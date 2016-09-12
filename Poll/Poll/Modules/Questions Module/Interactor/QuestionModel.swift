//
//  QuestionModel.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/10/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import Foundation
import ObjectMapper

struct QuestionModel: Mappable {
  var question: String?
  var publishedAt: String?
  var choices: [ChoiceModel]?
  
  var isAnswered: Bool = false
  var selectedChoice: UInt = 0
  init?(_ map: Map) {
  }
  mutating func mapping(map: Map) {
    question <- map["question"]
    publishedAt <- map["published_at"]
    choices <- map["choices"]
  }
  
  mutating func selectChoice (selectedChoice: UInt) {
    self.selectedChoice = selectedChoice
    isAnswered = true
  }
  
}
