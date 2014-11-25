//
//  LoginViewController.swift
//  PinPoint
//
//  Created by Javlon Usmanov on 11/24/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController : UIViewController {
  
  @IBOutlet weak var username: UITextField!
  @IBOutlet weak var password: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.translucent = false
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    //Dispose of any resources that can be recreated.
    //requests access to the user’s location.
    
  }
  
  @IBAction func login(sender: UIButton) {
    var user:String! = ""
    var pass: String! = ""
    if username.text != nil {user = username.text}
    else {user = ""}
    if password.text != nil {var pass: String! = password.text}
    
    let viewController: AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("viewController")
    
    let loginVC: AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("loginViewController")
    PFUser.logInWithUsernameInBackground(user, password: pass) {
      (user: PFUser!, error: NSError! ) -> Void in
      if user != nil {
        self.showViewController(viewController as UIViewController, sender: viewController)
      } else {
        NSLog("ERROR")
        self.showViewController(loginVC as UIViewController, sender: loginVC)
      }
    }
  }
  
  @IBAction func signup(sender: UIButton) {
    let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("signUpViewController")
    self.showViewController(vc as UIViewController, sender: vc)
  }
}
