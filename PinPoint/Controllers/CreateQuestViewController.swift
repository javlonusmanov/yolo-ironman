//
//  CreateQuestViewController.swift
//  PinPoint
//
//  Created by Javlon Usmanov on 11/23/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import Foundation
import QuartzCore

class CreateQuestViewController : UIViewController {
  @IBOutlet weak var createQuestTitle: UINavigationItem!
  @IBOutlet var popupView: UIView!
  
  @IBOutlet weak var questDescription: UITextField!
  @IBOutlet weak var questName: UITextField!
  
  @IBOutlet weak var errorMsg: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.backgroundColor = UIColor.whiteColor()
    self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
    self.navigationController?.navigationBar.translucent = false;
    
    self.popupView.layer.shadowOffset = CGSizeMake(0.2, 0.2)
    self.popupView.layer.shadowColor = UIColor.blackColor().CGColor
    self.popupView.layer.shadowOpacity = 0.8
    self.popupView.layer.cornerRadius = 10
    
    NSLog(" Error Message Label:\(errorMsg)")
    
  }
  
  @IBAction func addQuestButton(sender: UIButton) {
    var questTitle: String! = ""
    var questDesc: String! = ""
    if questName.text != nil {
      questTitle = questName.text
    } else {
      errorMsg.text = "Please fill out quest name"
      NSLog("\(errorMsg)")
      self.showAnimate()
    }
    if questDescription.text != nil {
      questDesc = questDescription.text
    } else {
      errorMsg.text = "Please fill out quest description"
      NSLog("\(errorMsg)")
      self.showAnimate()
    }
    
    addQuest(questTitle, description: questDesc)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    //Dispose of any resources that can be recreated.
    //requests access to the user’s location.
    
  }
  @IBAction func closePopupButton(sender:UIButton) {self.removeAnimate()}
  
  func showAnimate() {
    self.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
    UIView.animateWithDuration(
      0.25,
      animations: {
        self.popupView.alpha = 1
        self.popupView.transform = CGAffineTransformMakeScale(1, 1)
      }
    )
  }
  
  func removeAnimate(){
    self.view.layer.mask = nil
    UIView.animateWithDuration(
      0.25,
      animations: {
        self.popupView.transform = CGAffineTransformMakeScale(1.3, 1.3)
        self.popupView.alpha = 0.0;
      },
      completion: {
        (finished : Bool) in if (finished){ self.popupView.description.toInt() }
      }
    )
  }
  
  func addQuest(title: String, description: String) {
    var quest = PFObject(className: "Quest")
    
    quest["title"] = title
    quest["description"] = description
//    quest["owner"] = PFObject(withoutDataWithClassName: "User", objectId: currentUserID)
    
    quest.saveInBackgroundWithTarget(nil, selector: nil)
    
  }
  
  
}