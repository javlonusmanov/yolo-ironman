//
//  CreateQuestViewController.swift
//  PinPoint
//
//  Created by Javlon Usmanov on 11/23/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import Foundation

class CreateQuestViewController : UIViewController {
    
    @IBOutlet weak var createQuestTitle: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        self.navigationController?.navigationBar.translucent = false;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
        //requests access to the user’s location.
        
    }
}