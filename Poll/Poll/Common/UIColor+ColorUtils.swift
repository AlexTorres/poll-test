//
//  UIColor+ColorUtils.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/9/16.
//  Copyright © 2016 webcat. All rights reserved.
//


import Foundation
import UIKit

extension UIColor {
  
  class func questionBlackColor(alpha: Float) -> UIColor {
    
    return UIColor.UIColorFromRGB(0x292b36, alpha: alpha)
  }
  
  class func questionOrangeColor(alpha: Float) -> UIColor {
    
    return UIColor.UIColorFromRGB(0xf5a623, alpha: alpha)
  }
  
  class func questionGreenColor(alpha: Float) -> UIColor {
    
    return UIColor.UIColorFromRGB(0x65ae4f, alpha: alpha)
  }
  
  class func questionGrayColor(alpha: Float) -> UIColor {
    
    return UIColor.UIColorFromRGB(0xf7f7f7, alpha: alpha)
  }
  
  class func questionRedColor(alpha: Float) -> UIColor {
    return UIColor.UIColorFromRGB(0xe75b5d, alpha: alpha)
  }
  
  class func questionBorderColorGrayColor(alpha: Float) -> UIColor {
    
    return UIColor.UIColorFromRGB(0xc1c1c1, alpha: alpha)
  }
  
  class func questionCategoryTextColor(alpha: Float) -> UIColor {
    return UIColor.UIColorFromRGB(0x959595, alpha: alpha)
  }
  
  class func questionLightGrayColor(alpha: Float) -> UIColor {
    
    return UIColor.UIColorFromRGB(0xe6e6e6, alpha: alpha)
  }
  
  class func questionPlaceholderLightGrayColor(alpha: Float) -> UIColor {
    
    return UIColor.UIColorFromRGB(0xc7c7c7, alpha: alpha)
  }
  class func questionDisabledColor(alpha: Float) -> UIColor {
    return UIColor.UIColorFromRGB(0xcecece, alpha: alpha)
  }
  
  class func questionBluedColor(alpha: Float) -> UIColor {
    return UIColor.UIColorFromRGB(0x447def, alpha: alpha)
  }
    
  class func questionAlertViewBackgroundColor() -> UIColor {
       return UIColor.UIColorFromRGB(000000, alpha: 0.8)
  }
  
  class func UIColorFromRGB(rgbValue: UInt, alpha: Float) -> UIColor {
    return UIColor(
      red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
      alpha: CGFloat(alpha)
    )
  }
  
  class func stringHexColor(hexString: String) -> UIColor {
    let hex = hexString.stringByTrimmingCharactersInSet(NSCharacterSet.alphanumericCharacterSet().invertedSet)
    var int = UInt32()
    NSScanner(string: hex).scanHexInt(&int)
    let a, r, g, b: UInt32
    switch hex.characters.count {
    case 3: // RGB (12-bit)
      (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6: // RGB (24-bit)
      (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8: // ARGB (32-bit)
      (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      (a, r, g, b) = (1, 1, 1, 0)
    }
    return UIColor(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
  }
}
