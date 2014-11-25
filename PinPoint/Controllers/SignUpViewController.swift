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
    
    @IBAction func cancelPressed(sender: UIButton) {
        let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("loginViewController")
        self.showViewController(vc as UIViewController, sender: vc)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}