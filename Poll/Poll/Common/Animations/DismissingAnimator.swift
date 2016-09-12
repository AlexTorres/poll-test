//
//  DismissingAnimator.swift
//  Merqueo
//
//  Created by John Alexandert Torres on 9/9/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import UIKit
import pop

class DismissingAnimator: NSObject, UIViewControllerAnimatedTransitioning {
  
  func transitionDuration(transitionContext: protocol<UIViewControllerContextTransitioning>?) -> NSTimeInterval {
    return 0.1
  }
  
  func animateTransition(transitionContext: protocol<UIViewControllerContextTransitioning>) {
    let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
    toViewController?.view.tintAdjustmentMode = .Normal
    toViewController?.view.userInteractionEnabled = true
    
    let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
    
    toViewController?.view.transform = CGAffineTransformMakeScale(0.97, 0.97)
    let offscreenAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
    offscreenAnimation.toValue = 3 * fromViewController!.view.layer.position.y;
    
    offscreenAnimation.completionBlock = { (animation, finished) in
      transitionContext.completeTransition(true) }
    
    let scaleAnimation = POPBasicAnimation(propertyNamed: kPOPViewScaleXY)
    scaleAnimation.toValue = NSValue(CGSize: CGSizeMake(1, 1))
    scaleAnimation.duration = 0.2
    
    fromViewController?.view.layer.pop_addAnimation(offscreenAnimation, forKey: "offscreenAnimation")
    toViewController?.view.pop_addAnimation(scaleAnimation, forKey: "offscreenAnimation")
  }
}
