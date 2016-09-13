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
  init?(_ map: Map) {
  }
  mutating func mapping(map: Map) {
    question <- map["question"]
    publishedAt <- map["published_at"]
    choices <- map["choices"]
  }
  
  var bars: [(String, Double)] {
    get {
      var array = [(String, Double)]()
      for (_, value) in choices!.enumerate() {
        array.append((value.choice!, Double(value.votes!)))
      }
      
      return array
    }
    
  }
  
  var parts: Double {
    get {
      return abs((Double(maxVotes) * 1.5) / 3)
    }
  }
  
  var maxVotes: Int {
    get {
      let maxValue = choices!.reduce(Int.min, combine: { max($0, $1.votes!) })
      return maxValue
    }
  }
  var allVotes: Int {
    get {
      return choices!.reduce(0, combine: { $0 + $1.votes! })
    }
  }
  
}
