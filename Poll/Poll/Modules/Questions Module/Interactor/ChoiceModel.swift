//
//  ChoiceModel.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/10/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import Foundation
import ObjectMapper

struct ChoiceModel: Mappable {
  var choice: String?
  var url: String?
  var votes: Int?

  
  init?(_ map: Map) {
  }
  mutating func mapping(map: Map) {
    choice <- map["choice"]
    url <- map["url"]
    votes <- map["votes"]
  }
}
