//
//  ContainerViewController.swift
//  PinPoint
//
//  Created by Javlon Usmanov on 11/22/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import UIKit
import QuartzCore

enum SlideOutState {
    case BothCollapsed
    case LeftPanelExpanded
    case RightPanelExpanded
}

class ContainerViewController: UIViewController, ViewControllerDelegate {
    var viewNavigationController: UINavigationController!
    var viewController: ViewController!
    var leftViewController: SidePanelViewController?
    let mainPanelExpandedOffset: CGFloat = 80
    var currentState: SlideOutState = .BothCollapsed {
        didSet {
            let shouldShowShadow = currentState != .BothCollapsed
            showShadowForCenterViewController(shouldShowShadow)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewController = UIStoryboard.viewController()
        viewController.delegateSideView = self
        
        // wrap the centerViewController in a navigation controller, so we can push views to it
        // and display bar button items in the navigation bar
        viewNavigationController = UINavigationController(rootViewController: viewController)
        view.addSubview(viewNavigationController.view)
        addChildViewController(viewNavigationController)
        
        viewNavigationController.didMoveToParentViewController(self)
    }
    
    // MARK: CenterViewController delegate methods
    
    func toggleLeftPanel() {
        let notAlreadyExpanded = (currentState != .LeftPanelExpanded)
        
        if notAlreadyExpanded {
            addLeftPanelViewController()
        }
        
        animateLeftPanel(shouldExpand: notAlreadyExpanded)
    }
    
    func toggleRightPanel() {
    }
    
    func addLeftPanelViewController() {
        if (leftViewController == nil) {
            leftViewController = UIStoryboard.leftViewController()
            addChildSidePanelController(leftViewController!)
        }
    }
    
    func addChildSidePanelController(sidePanelController: SidePanelViewController) {
        view.insertSubview(sidePanelController.view, atIndex: 0)
        
        addChildViewController(sidePanelController)
        sidePanelController.didMoveToParentViewController(self)
    }
    
    func addRightPanelViewController() {
    }
    
    func animateLeftPanel(#shouldExpand: Bool) {
        if (shouldExpand) {
            currentState = .LeftPanelExpanded
            
            animateCenterPanelXPosition(targetPosition: CGRectGetWidth(viewNavigationController.view.frame) - mainPanelExpandedOffset)
        } else {
            animateCenterPanelXPosition(targetPosition: 0) { finished in
                self.currentState = .BothCollapsed
                
                self.leftViewController!.view.removeFromSuperview()
                self.leftViewController = nil;
            }
        }
    }
    func animateCenterPanelXPosition(#targetPosition: CGFloat, completion: ((Bool) -> Void)! = nil) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {
            self.viewNavigationController.view.frame.origin.x = targetPosition
            }, completion: completion)
    }
    
    func animateRightPanel(#shouldExpand: Bool) {
    }
    
    func showShadowForCenterViewController(shouldShowShadow: Bool) {
        if (shouldShowShadow) {
            viewNavigationController.view.layer.shadowOpacity = 0.8
        } else {
            viewNavigationController.view.layer.shadowOpacity = 0.0
        }
    }
    
    // MARK: Gesture recognizer
    
    func handlePanGesture(recognizer: UIPanGestureRecognizer) {
    }
}

private extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()) }
    
    class func leftViewController() -> SidePanelViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("leftViewController") as? SidePanelViewController
    }
    
    class func viewController() -> ViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("viewController") as? ViewController
    }
}
