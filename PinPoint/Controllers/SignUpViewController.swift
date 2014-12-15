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
  
  @IBOutlet weak var name: UITextField!
  @IBOutlet weak var username: UITextField!
  @IBOutlet weak var password: UITextField!
  @IBOutlet weak var passwordConfirm: UITextField!
  @IBOutlet weak var email: UITextField!
  @IBOutlet var popupView: UIView!
  @IBOutlet weak var cancel: UIButton!
  @IBOutlet weak var cancelCreate: UIButton!
  @IBOutlet weak var create: UIButton!
  @IBOutlet weak var errorMessageLabel: UILabel!
  @IBOutlet var blurOverlay: UIView!
  
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
  
  @IBAction func closePopupButton(sender:UIButton) {
    self.removeAnimate()
  }
  
  @IBAction func createPressed(sender: UIButton) {
    if password.text == "" {
      self.showAnimate()
    } else if passwordConfirm.text == ""{
      self.showAnimate()
    } else if password.text != passwordConfirm.text {
      self.showAnimate()
    }
    
    var user = PFUser()
    user["name"] = name.text
    user.email = email.text
    user.username = username.text
    user.password = password.text
    
    user.signUpInBackgroundWithBlock {
      (succeeded: Bool!, error: NSError!) -> Void in
      if error == nil {
        PFUser.logInWithUsernameInBackground(user.username, password: user.password) {
          (user: PFUser!, error: NSError!) -> Void in
          if user != nil {
            PFUser.becomeInBackground(user.sessionToken, {
              (user: PFUser!, error: NSError!) -> Void in
              if error != nil {
                let errorString = error.userInfo?.values.first as NSString
                self.errorMessageLabel.text = errorString
                self.showAnimate()
              } else {
                let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("navigationController")
                self.showViewController(vc as UIViewController, sender: vc)
              }
            })
          } else {
            let errorString = error.userInfo?.values.first as NSString
            self.errorMessageLabel.text = errorString
            self.showAnimate()
          }
        }
      } else {
        let errorString = error.userInfo?.values.first as NSString
        self.errorMessageLabel.text = errorString
        self.showAnimate()
      }
    }
    
  }
  func showAnimate() {
    self.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
    UIView.animateWithDuration(0.25, animations:{
      self.popupView.alpha = 1
      self.popupView.transform = CGAffineTransformMakeScale(1, 1)
      self.blurOverlay.alpha = 0.6
    })
    
  }
  func removeAnimate(){
    self.view.layer.mask = nil
    self.view.alpha = 1
    UIView.animateWithDuration(0.25, animations: {
      self.popupView.transform = CGAffineTransformMakeScale(1.3, 1.3)
      self.popupView.alpha = 0.0;
      self.blurOverlay.alpha = 0.0
      }, completion:{(finished : Bool)  in if (finished){self.popupView.description.toInt()}
    });
    
  }
  
  
  
}