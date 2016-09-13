//
//  UIView+Utils.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/11/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  @IBInspectable var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    set {
      layer.cornerRadius = newValue
      layer.masksToBounds = newValue > 0
    }
  }
  @IBInspectable var borderWidth: CGFloat {
    set {
      layer.borderWidth = newValue
    }
    get {
      return layer.borderWidth
    }
  }
  @IBInspectable var borderColor: UIColor? {
    set {
      layer.borderColor = borderColor?.CGColor
    }
    get {
      return UIColor(CGColor: layer.borderColor!)
    }
  }
}