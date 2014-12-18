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
  @IBOutlet var errorMessageLabel: UILabel!
  @IBOutlet var blurOverLay: UIView!
  @IBOutlet weak var questDesc: UITextField!
  @IBOutlet weak var questName: UITextField!
  
  @IBOutlet weak var createQuest: UILabel!
  
  @IBOutlet weak var addQuest: UIButton!
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.backgroundColor = UIColor.whiteColor()
    self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
    self.navigationController?.navigationBar.translucent = false;
    
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
  @IBAction func closePopupButton(sender:UIButton) {self.removeAnimate()}
  
  @IBAction func createPressed(sender: UIButton) {
    if questName.text == "" {
      var errorString = "Please enter a quest name"
      self.errorMessageLabel.text = errorString
      self.errorMessageLabel.numberOfLines = 3
      self.showAnimate()
    }
    if questDesc.text == "" {
      var errorString = "Please enter a quest description"
      self.errorMessageLabel.text = errorString
      self.errorMessageLabel.numberOfLines = 3
      self.showAnimate()
    }
    
    var user = PFUser.currentUser()
    
    var quest = PFObject(className: "Quest")
    quest["name"] = questName.text
    quest["description"] = questDesc.text
    quest["owner"] = user
    
    quest.saveInBackgroundWithTarget(nil, selector: nil)
    
    let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("viewController")
    self.showViewController(vc as UIViewController, sender: vc)
  }
  
  func showAnimate() {
    self.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
    UIView.animateWithDuration(0.25, animations:{
      self.popupView.alpha = 1
      self.popupView.transform = CGAffineTransformMakeScale(1, 1)
      self.blurOverLay.alpha = 0.6
      
    })
  }
  func removeAnimate(){
    self.view.layer.mask = nil
    UIView.animateWithDuration(0.25, animations: {
      self.popupView.transform = CGAffineTransformMakeScale(1.3, 1.3)
      self.popupView.alpha = 0.0;
      self.blurOverLay.alpha = 0.0
      }, completion:{(finished : Bool)  in if (finished){self.popupView.description.toInt()}
    });
  }
  
  override  func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    if(self.questDesc.isFirstResponder())
    {
      self.view.endEditing(true)
      
    }
    if(self.questName.isFirstResponder())
    {
      self.view.endEditing(true)
      
    }
  }

}