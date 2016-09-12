//
//  QuestionsModel.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/10/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import Foundation
import ObjectMapper

struct QuestionsModel: Mappable {
  var questions: [QuestionModel]?
  init?(_ map: Map) {
  }
  mutating func mapping(map: Map) {
    questions <- map ["result"]
  }
}
