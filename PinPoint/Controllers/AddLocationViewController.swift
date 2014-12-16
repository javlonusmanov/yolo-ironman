//
//  AddLocationViewController.swift
//  PinPoint
//
//  Created by Javlon Usmanov on 12/15/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import UIKit
import Foundation
import QuartzCore

class AddLocationViewController: UIViewController {
  
  @IBOutlet weak var popupView: UIView!
  @IBOutlet weak var blurOverlay: UIView!
  @IBOutlet weak var errorMessage: UILabel!
  @IBOutlet weak var name: UITextField!
  @IBOutlet weak var addrOne: UITextField!
  @IBOutlet weak var addrTwo: UITextField!
  @IBOutlet weak var city: UITextField!
  @IBOutlet weak var state: UITextField!
  @IBOutlet weak var zip: UITextField!
  
  @IBOutlet weak var addLocationLabel: UILabel!
  
  @IBAction func addButtonPressed(sender: UIButton) {
    
    if addrOne.text == "" {
      self.errorMessage.text = "Please enter an address for this location"
      self.showAnimate()
    }
    
    if name.text == "" {
      self.errorMessage.text = "Please enter a name for this location"
      self.showAnimate()
    }
    
    if city == "" {
      self.errorMessage.text = "Please enter a city"
      self.showAnimate()
    }
    
    if state == "" {
      self.errorMessage.text = "Please enter a state"
      self.showAnimate()
    }
    
    if zip == "" {
      self.errorMessage.text = "Please enter a zip code"
    }
    
    var location = PFObject(className:"Location")
    
    location["name"] = name.text
    location["addrOne"] = addrOne.text
    location["addrTwo"] = addrTwo.text
    location["city"] = city.text
    location["state"] = state.text
    location["zip"] = zip.text
    
    location.saveInBackgroundWithTarget(nil, selector: nil)
    
    let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("viewController")
    self.showViewController(vc as UIViewController, sender: vc)
  }
  
  @IBAction func closeButtonPressed(sender: UIButton) {
    self.removeAnimate()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.popupView.layer.shadowOffset = CGSizeMake(0.2, 0.2)
    self.popupView.layer.shadowColor = UIColor.blackColor().CGColor
    self.popupView.layer.shadowOpacity = 0.8
    self.popupView.layer.cornerRadius = 10
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func showAnimate() {
    self.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
    UIView.animateWithDuration(0.25, animations:{
      self.popupView.alpha = 1
      self.popupView.transform = CGAffineTransformMakeScale(1, 1)
      self.blurOverlay.alpha = 0.6
    })
    
  }
  func removeAnimate(){
    self.view.layer.mask = nil
    UIView.animateWithDuration(0.25, animations: {
      self.popupView.transform = CGAffineTransformMakeScale(1.3, 1.3)
      self.popupView.alpha = 0.0;
      self.blurOverlay.alpha = 0.0
      }, completion:{(finished : Bool)  in if (finished){self.popupView.description.toInt()}
    });
  }
  
}
