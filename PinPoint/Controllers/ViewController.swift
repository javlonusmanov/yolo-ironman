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
  
    //regular variables
    let locationManager = CLLocationManager()
    var maskLayer:CALayer = CALayer()
    @IBAction func checkIn(sender: UIButton) {
        self.mapView.opaque = true
        maskLayer.frame = CGRectMake(0,0, mapView.frame.width, mapView.frame.height)
        maskLayer.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.4).CGColor
        mapView.layer.mask = maskLayer
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
    
    
    //adding 10 buttons to scroll view
    func addButton() {
        var aaa:CGFloat = 0.0
        for i in 0..<11 {
            var button   = UIButton.buttonWithType(UIButtonType.System) as UIButton
            button.frame = CGRectMake(aaa, 0, 43, 43)
            button.layer.cornerRadius = 5
            button.backgroundColor = UIColor.whiteColor()
            var temp: UIImage = UIImage(named: "hamenu.png")!
            button.setImage(temp, forState: UIControlState.Highlighted)
            button.addTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
            button.alpha = 0.85
            self.scrollButtonView.addSubview(button)
            aaa = aaa + 55.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        addButton()
        // self.navigationController?.navigationBar.translucent = false

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
        //Dispose of any resources that can be recreated.
        //requests access to the user’s location.
        
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
        self.scrollButtonView.contentSize.width = 600
        self.mapView.padding = UIEdgeInsets(top: self.topLayoutGuide.length, left: 0, bottom: 112, right: 0)
        self.addressLabel.layer.cornerRadius = 5
        
    }
    
    func showAnimate() {
        self.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
        UIView.animateWithDuration(0.25, animations:{
            self.popupView.alpha = 1
            self.popupView.transform = CGAffineTransformMakeScale(1, 1)
        })
        
    }
    func removeAnimate()
    {
        self.mapView.layer.mask = nil
        UIView.animateWithDuration(0.25, animations: {
            self.popupView.transform = CGAffineTransformMakeScale(1.3, 1.3)
            self.popupView.alpha = 0.0;
            }, completion:{(finished : Bool)  in if (finished){self.popupView.description.toInt()}
        });
    }
    
    
    
}


