//
//  LoginViewController.swift
//  PinPoint
//
//  Created by Javlon Usmanov on 11/24/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import UIKit
import Foundation
import QuartzCore


class LoginViewController : UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var popupView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.translucent = false
        self.popupView.layer.shadowOffset = CGSizeMake(0.2, 0.2)
        self.popupView.layer.shadowColor = UIColor.blackColor().CGColor
        self.popupView.layer.shadowOpacity = 0.8
        self.popupView.layer.cornerRadius = 10
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
        if password.text != nil {pass = password.text}
        else {pass = ""}
        NSLog("before if else")
        if user != "" {
            NSLog("if")
            //whatever you do not lose the navigation bar in the main controller
            var obj: UINavigationController = self.storyboard?.instantiateViewControllerWithIdentifier("navigationController") as UINavigationController
            self.navigationController?.navigationBarHidden = false
            self.navigationController?.pushViewController(obj, animated: true)
            self.showViewController(obj as UINavigationController, sender: obj)
        } else {
            NSLog("else")
            self.showAnimate()
        }
        
//        PFUser.logInWithUsernameInBackground(user, password: pass) {
//            (user: PFUser!, error: NSError! ) -> Void in
//            if (user != nil ){
//                NSLog("asasdasdasd")
//               
//                //let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("signUpViewController")
//                //self.showViewController(vc as UIViewController, sender: vc)
//
//            } else {
//                self.showAnimate()
//            }
//        }
    }
    
    @IBAction func closePopupButton(sender: UIButton) {self.removeAnimate()}
    
    @IBAction func signup(sender: UIButton) {
        let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("signUpViewController")
        self.showViewController(vc as UIViewController, sender: vc)
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
