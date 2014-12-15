//
//  ViewController.swift
//  PinPoint
//
//  Created by Javlon Usmanov on 11/12/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
  //UI variables
  @IBOutlet weak var mapView: GMSMapView!
  @IBOutlet weak var popupView: UIView!
  @IBOutlet var questDropButton: UIButton!
  @IBOutlet weak var checkinView: UIView!
  @IBOutlet weak var scrollButtonView: UIScrollView!
  @IBOutlet weak var addressLabel: UILabel!
  @IBOutlet weak var errorMessageLabel: UILabel!
  @IBOutlet weak var blurOverlay: UIView!
  
  //regular variables
  let locationManager = CLLocationManager()
  var NUMQUESTLOCATIONS = 7
  @IBAction func checkIn(sender: UIButton) {
    self.showAnimate()
  }
  @IBAction func sideMenuButton(sender: UIStoryboardSegue) {
    self.dismissViewControllerAnimated(true, completion: nil)
    addressLabel.hidden = true
  }
  @IBAction func closePopUp(sender: UIButton) {self.removeAnimate()}
  
  
  //when the user grants or revokes location permissions.
  func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
    if status == .AuthorizedWhenInUse {
      locationManager.startUpdatingLocation()
      mapView.myLocationEnabled = true
      mapView.settings.myLocationButton = true
      
    }}
  
  //when the location manager receives new location data.
  func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
    if let location = locations.first as? CLLocation {
      mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
      reverseGeocodeCoordinate(locationManager.location.coordinate)
      locationManager.stopUpdatingLocation()
    }}
  
  //every time button in scrollview is clicked, all buttons have same characteristics except geolocation
  func pressed(sender: UIButton!) {checkIn(sender)}
  
  func addLocation(sender: UIButton!) {
    var storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let secondViewController: AnyObject! = storyboard.instantiateViewControllerWithIdentifier("locationViewController")
    self.navigationController?.pushViewController(secondViewController as UIViewController, animated: true)
  }
  
  //adding 10 buttons to scroll view
  func addButton() {
    var increment:CGFloat = 0.0
        for i in 0..<NUMQUESTLOCATIONS {
      var button   = UIButton.buttonWithType(UIButtonType.System) as UIButton
      button.frame = CGRectMake(increment, 0, 43, 43)
      button.layer.cornerRadius = 5
      button.backgroundColor = UIColor.whiteColor()
      var temp: UIImage = UIImage(named: "hamenu.png")!
      button.setImage(temp, forState: UIControlState.Highlighted)
      button.addTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
      button.alpha = 0.85
      self.scrollButtonView.addSubview(button)
      increment = increment + 53.0
    }
    //this adds the "Add Location" button to the scrollview
    var addLocationButton = UIButton.buttonWithType(UIButtonType.ContactAdd) as UIButton
    addLocationButton.frame = CGRectMake(increment, 0, 43, 43)
    addLocationButton.layer.cornerRadius = 5
    addLocationButton.backgroundColor = UIColor.blackColor()
    addLocationButton.addTarget(self, action: "addLocation:", forControlEvents:   UIControlEvents.TouchUpInside)
    addLocationButton.alpha = 0.85
    self.scrollButtonView.addSubview(addLocationButton)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewSettings()
    addButton()
    getScrollViewContentSize()
    
  }
  func mapView(mapView: GMSMapView!, idleAtCameraPosition position: GMSCameraPosition!) {
    reverseGeocodeCoordinate(position.target)
  }
  
  func reverseGeocodeCoordinate(coordinate: CLLocationCoordinate2D) {
    let geocoder = GMSGeocoder()
    geocoder.reverseGeocodeCoordinate(coordinate) { response , error in
      self.addressLabel.unlock()
      if let address = response.firstResult() {
        let lines = address.lines as [String]
        self.addressLabel.text = join("\n", lines)
      }
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    //Dispose of any resources that can be recreated requests access to the user’s location.
    
  }
  
  func viewSettings() {
    self.mapView.delegate = self
    self.checkinView.layer.cornerRadius = 10
    self.locationManager.delegate = self
    self.locationManager.requestWhenInUseAuthorization()
    self.popupView.layer.shadowOffset = CGSizeMake(0.2, 0.2)
    self.popupView.layer.shadowColor = UIColor.blackColor().CGColor
    self.popupView.layer.shadowOpacity = 0.8
    self.popupView.layer.cornerRadius = 10
    self.mapView.padding = UIEdgeInsets(top: self.topLayoutGuide.length, left: 0, bottom: 112, right: 0)
    self.addressLabel.layer.cornerRadius = 5
    
  }
  
  func showAnimate() {
    self.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
    UIView.animateWithDuration(0.25, animations:{
      self.popupView.alpha = 1
      self.popupView.transform = CGAffineTransformMakeScale(1, 1)
      self.blurOverlay.alpha = 0.6
    })
    
  }
  func removeAnimate()
  {
    UIView.animateWithDuration(0.25, animations: {
      self.popupView.transform = CGAffineTransformMakeScale(1.3, 1.3)
      self.popupView.alpha = 0.0;
      self.blurOverlay.alpha = 0.0
      }, completion:{(finished : Bool)  in if (finished){self.popupView.description.toInt()}
    });
  }
  
  func getScrollViewContentSize() {
    //setting the size of scrollview dynamically, when contents of it change
    var sizeOfContent:CGFloat = 0.0
    var last:AnyObject = self.scrollButtonView.subviews.last!
    var wd:CGFloat = last.frame.origin.x + 10.0
    var ht:CGFloat = last.frame.size.height
    sizeOfContent = wd+ht
    self.scrollButtonView.contentSize = CGSizeMake(sizeOfContent, self.scrollButtonView.frame.size.height)
  }
  
  
  
}


