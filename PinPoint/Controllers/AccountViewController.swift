//
//  AccountViewController.swift
//  PinPoint
//
//  Created by Javlon Usmanov on 12/15/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func cancelClicked(sender: UIButton) {
    let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("navigationController")
    self.showViewController(vc as UIViewController, sender: vc)
  }


}
