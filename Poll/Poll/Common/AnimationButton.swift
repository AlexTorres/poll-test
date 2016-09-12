//
//  AnimationButton.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/11/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import Foundation

import Foundation
import pop
import UIKit

class AnimationButton: UIButton {
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupButton()
    
  }
  func setupButton() {
    self.addTarget(self, action: #selector(AnimationButton.scaleToSmall), forControlEvents: [.TouchDown, .TouchDownRepeat])
    self.addTarget(self, action: #selector(AnimationButton.scaleAnimation), forControlEvents: .TouchUpInside)
    self.addTarget(self, action: #selector(AnimationButton.scaleToDefault), forControlEvents: .TouchDragExit)
  }
  
  func scaleToSmall() {
    let scaleAnimation = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
    scaleAnimation.toValue = NSValue(CGSize: CGSizeMake(0.95, 0.95))
    self.layer.pop_addAnimation(scaleAnimation, forKey: "layerScaleSmallAnimation")
  }
  
  func scaleAnimation() {
    let scaleAnimation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
    scaleAnimation.velocity = NSValue(CGSize: CGSizeMake(3, 3))
    scaleAnimation.toValue = NSValue(CGSize: CGSizeMake(1, 1))
    scaleAnimation.springBounciness = 18
    self.layer.pop_addAnimation(scaleAnimation, forKey: "layerScaleSpringAnimation")
  }
  
  func scaleToDefault() {
    let scaleAnimation = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
    scaleAnimation.toValue = NSValue(CGSize: CGSizeMake(1, 1))
    self.layer.pop_addAnimation(scaleAnimation, forKey: "layerScaleDefaultAnimation")
  }
  
  @IBInspectable var borderWidth: CGFloat = 0 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }
  @IBInspectable var borderColor: UIColor? {
    didSet {
      layer.borderColor = borderColor?.CGColor
    }
  }
}

