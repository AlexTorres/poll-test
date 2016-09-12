//
//  EmumsAndDefs.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/9/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import Foundation

typealias Failture = NSError? -> Void
typealias Completion = AnyObject? -> Void
typealias CompletionWasSussecfull = AnyObject? -> Void

enum ConfigurationStages: String {
  case Debug, Release, Testing
}

