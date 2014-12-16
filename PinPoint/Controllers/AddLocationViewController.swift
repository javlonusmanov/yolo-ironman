//
//  AddLocationViewController.swift
//  PinPoint
//
//  Created by Javlon Usmanov on 12/15/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import UIKit

class AddLocationViewController: UIViewController {
  
  @IBOutlet weak var popupView: UIView!
  @IBOutlet weak var blurOverlay: UIView!
  @IBOutlet weak var errorMessage: UILabel!
  
  @IBAction func addButtonPressed(sender: UIButton) {
    self.showAnimate()
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
