//
//  ViewController.swift
//  PostCard
//
//  Created by Javlon Usmanov on 9/13/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet var labelMessage: UILabel!
    @IBOutlet var enterNameTextField: UITextField!
    @IBOutlet var enterMessageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet var mailButton: UIButton!
    
    @IBAction func sendMessage(sender: UIButton) {
        labelMessage.hidden = false
        labelMessage.text = enterMessageTextField.text
        enterMessageTextField.text = ""
        enterMessageTextField.resignFirstResponder()
        labelMessage.textColor = UIColor.redColor()
        mailButton.setTitle("Mail Sent", forState: UIControlState.Normal)
    }
    

}

