//
//  LoginViewController.swift
//  PinPoint
//
//  Created by Javlon Usmanov on 11/24/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController : UIViewController {
  @IBOutlet weak var username: UITextField!
  @IBOutlet weak var password: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    //Dispose of any resources that can be recreated.
    //requests access to the user’s location.
  
  }
  
  @IBAction func login(sender: UIButton) {
    let user = username.text
    let pass = password.text
    
    PFUser.logInWithUsernameInBackground(user, password: pass) {
      (user: PFUser!, error: NSError!) -> Void in
      if user != nil {
        // Show Main Page
        self.performSegueWithIdentifier("pinpoint", sender: self)
      } else {
        // Login Failed
        // Display Error
      }
    }
  }
  
  func login() {

  }
  
  func currentUser() {
    var current = PFUser.currentUser()
    if current != nil {
      // Show Main Page
    } else {
      // Show Login Page
    }
  }
  
  func logout() {
    PFUser.logOut()
    var current = PFUser.currentUser()
    
    currentUser()
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if (segue.identifier == "pinpoint") {
      let svc = segue.destinationViewController as ViewController
      svc.username = username.text
    }
  }
}
