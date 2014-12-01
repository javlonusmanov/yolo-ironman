//
//  SignUpViewController.swift
//  PinPoint
//
//  Created by Javlon Usmanov on 11/25/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import Foundation
import UIKit

class SignUpViewController:UIViewController {
    
    @IBOutlet var popupView: UIView!
    
    @IBAction func cancelPressed(sender: UIButton) {
        let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("loginViewController")
        self.showViewController(vc as UIViewController, sender: vc)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.popupView.layer.shadowOffset = CGSizeMake(0.2, 0.2)
        self.popupView.layer.shadowColor = UIColor.blackColor().CGColor
        self.popupView.layer.shadowOpacity = 0.8
        self.popupView.layer.cornerRadius = 10
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet var createButton: UIButton!
    @IBAction func closePopupButton(sender:UIButton) {self.removeAnimate()}
    
    @IBOutlet var popupView: UIView!
    
    @IBAction func cancelPressed(sender: UIButton) {
        let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("loginViewController")
        self.showViewController(vc as UIViewController, sender: vc)
    }
  showAnimate()
  }
  func showAnimate() {
    self.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
    UIView.animateWithDuration(0.25, animations:{
      self.popupView.alpha = 1
      self.popupView.transform = CGAffineTransformMakeScale(1, 1)
      //self.popupView.hidden = false
      
    })
=======
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.popupView.layer.shadowOffset = CGSizeMake(0.2, 0.2)
        self.popupView.layer.shadowColor = UIColor.blackColor().CGColor
        self.popupView.layer.shadowOpacity = 0.8
        self.popupView.layer.cornerRadius = 10
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet var createButton: UIButton!
    @IBAction func closePopupButton(sender:UIButton) {self.removeAnimate()}
>>>>>>> parent of 6fce31f... Added parse logic; Still need to store User ID and Quest ID as global
>>>>>>> FETCH_HEAD
    
    @IBAction func createPressed(sender: AnyObject) {
        self.showAnimate()
    }
    func showAnimate() {
        self.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
        UIView.animateWithDuration(0.25, animations:{
            self.popupView.alpha = 1
            self.popupView.transform = CGAffineTransformMakeScale(1, 1)
            //self.popupView.hidden = false
            
        })
        
    }
    func removeAnimate(){
        self.view.layer.mask = nil
        UIView.animateWithDuration(0.25, animations: {
            self.popupView.transform = CGAffineTransformMakeScale(1.3, 1.3)
            self.popupView.alpha = 0.0;
            }, completion:{(finished : Bool)  in if (finished){self.popupView.description.toInt()}
        });
    }

}