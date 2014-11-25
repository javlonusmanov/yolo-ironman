//
//  OverLayViewController.swift
//  PinPoint
//
//  Created by Javlon Usmanov on 11/24/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import UIKit

class OverLayViewController:UIViewController {
    // create instance of our custom transition manager
    let transitionManager = OverLayTransitionManager()
    
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.transitioningDelegate = self.transitionManager
        settings()
        
    }
    @IBAction func cancelButton(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func settings() {
        self.settingButton.layer.shadowOffset = CGSizeMake(0.2, 0.2)
        self.settingButton.layer.shadowColor = UIColor.blackColor().CGColor
        self.settingButton.layer.shadowOpacity = 0.8
        self.settingButton.layer.cornerRadius = 10
        self.accountButton.layer.shadowOffset = CGSizeMake(0.2, 0.2)
        self.accountButton.layer.shadowColor = UIColor.blackColor().CGColor
        self.accountButton.layer.shadowOpacity = 0.8
        self.accountButton.layer.cornerRadius = 10
        self.logoutButton.layer.shadowOffset = CGSizeMake(0.2, 0.2)
        self.logoutButton.layer.shadowColor = UIColor.blackColor().CGColor
        self.logoutButton.layer.shadowOpacity = 0.8
        self.logoutButton.layer.cornerRadius = 10
        self.notificationButton.layer.shadowOffset = CGSizeMake(0.2, 0.2)
        self.notificationButton.layer.shadowColor = UIColor.blackColor().CGColor
        self.notificationButton.layer.shadowOpacity = 0.8
        self.notificationButton.layer.cornerRadius = 10
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}