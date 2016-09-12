//
//  PresentingAnimator.swift
//  Merqueo
//
//  Created by John Alexandert Torres on 9/9/16.
//  Copyright © 2016 webcat. All rights reserved.
//
import UIKit
import pop

class PresentingAnimator: NSObject, UIViewControllerAnimatedTransitioning {
  
  func transitionDuration(transitionContext: protocol<UIViewControllerContextTransitioning>?) -> NSTimeInterval {
    return 0.4;
  }
  
  func animateTransition(transitionContext: protocol<UIViewControllerContextTransitioning>) {
    let fromView = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)?.view!
    fromView?.tintAdjustmentMode = .Normal
    fromView?.userInteractionEnabled = false
    
    let toView = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)?.view!
    transitionContext.containerView()?.addSubview(toView!)
    
    // toView!.center = CGPointMake(transitionContext.containerView()!.center.x, transitionContext.containerView()!.center.y);
    
    let point = toView!.center
    toView!.center = CGPointMake(point.x, 2 * point.y);
    
    let positionAnimation = POPBasicAnimation(propertyNamed: kPOPViewCenter)
    positionAnimation.toValue = NSValue(CGPoint: point)
    positionAnimation.duration = 0.4
    
    let scaleAnimation = POPBasicAnimation(propertyNamed: kPOPViewScaleXY)
    scaleAnimation.toValue = NSValue(CGSize: CGSizeMake(0.97, 0.97))
    scaleAnimation.duration = 0.1
    
    positionAnimation.completionBlock = { (animation, finished) in
      transitionContext.finishInteractiveTransition()
      
      transitionContext.completeTransition(true) }
    toView?.pop_addAnimation(positionAnimation, forKey: "positionAnimation")
    fromView?.pop_addAnimation(scaleAnimation, forKey: "scaleAnimation")
  }
}
