//
//  OverLayTransitionManager.swift
//  PinPoint
//
//  Created by Javlon Usmanov on 11/24/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import UIKit

class OverLayTransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate  {
    
    private var presenting = false
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView()
        let screens : (from:UIViewController, to:UIViewController) = (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!, transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)
        let menuViewController = !self.presenting ? screens.from as OverLayViewController : screens.to as OverLayViewController
        let bottomViewController = !self.presenting ? screens.to as UIViewController : screens.from as UIViewController
        
        let menuView = menuViewController.view
        let bottomView = bottomViewController.view
        
        // prepare menu items to slide in
        if (self.presenting){
            self.offStageMenuController(menuViewController)
        }
        
        // add the both views to our view controller
        container.addSubview(bottomView)
        container.addSubview(menuView)
        
        let duration = self.transitionDuration(transitionContext)
        
        // perform the animation!
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: nil, animations: {
            if (self.presenting){self.onStageMenuController(menuViewController)}
            else {self.offStageMenuController(menuViewController)}
            }, completion: { finished in
                transitionContext.completeTransition(true)
                UIApplication.sharedApplication().keyWindow.addSubview(screens.to.view)
        })
        
    }
    
    func offStage(amount: CGFloat) -> CGAffineTransform {return CGAffineTransformMakeTranslation(amount, 0.6)}
    func offStageMenuController(menuViewController: OverLayViewController){
        menuViewController.view.alpha = 0.0
        let topRowOffset  :CGFloat = 300
        let middleRowOffset :CGFloat = 50
        
        menuViewController.settingButton.transform = self.offStage(-topRowOffset)
        menuViewController.notificationButton.transform = self.offStage(-middleRowOffset)
        menuViewController.logoutButton.transform = self.offStage(-middleRowOffset)
        menuViewController.accountButton.transform = self.offStage(topRowOffset)

    }
    func onStageMenuController(menuViewController: OverLayViewController){
        menuViewController.view.alpha = 1.0
        menuViewController.settingButton.transform = CGAffineTransformIdentity
        menuViewController.notificationButton.transform = CGAffineTransformIdentity
        menuViewController.logoutButton.transform = CGAffineTransformIdentity
        menuViewController.accountButton.transform = CGAffineTransformIdentity
    }
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {return 0.5}
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    // return the animator used when dismissing from a viewcontroller
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
    
}
