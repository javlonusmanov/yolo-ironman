//
//  ViewController.swift
//  PinPoint
//
//  Created by Javlon Usmanov on 11/12/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    //UI variables
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var questList: UITableView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var popupViewButton: UIButton!
    @IBOutlet var questDropButton: UIButton!
    
    @IBAction func questDropClicked(sender: UIButton) {
        if (questList.hidden) {
        questList.hidden = false
        animator = UIDynamicAnimator(referenceView: questList)
        gravity = UIGravityBehavior(items: [questList])
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [questList])
        collision.translatesReferenceBoundsIntoBoundary = true
        collision.addBoundaryWithIdentifier("questListDropDown", fromPoint: CGPointMake(self.view.frame.origin.x, -273), toPoint: CGPointMake(self.view.frame.origin.x + self.view.frame.width, 0))
        animator.addBehavior(collision)
        }
        else {
            questList.hidden = true
        }
    }
    
    //regular variables
    let locationManager = CLLocationManager()
    var gravity:UIGravityBehavior!
    var animator:UIDynamicAnimator!
    var collision: UICollisionBehavior!
    
    
    //when the user grants or revokes location permissions.
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = false
        }}
    
    //when the location manager receives new location data.
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        if let location = locations.first as? CLLocation {
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            locationManager.stopUpdatingLocation()
        }}


    @IBAction func sideMenuButton(sender: AnyObject) {
        toggleSideMenuView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
    
        self.locationManager.requestWhenInUseAuthorization()
        
//        var object = PFObject(className: "TestClass")
//        object.addObject("Banana", forKey: "favoriteFood")
//        object.addObject("Chocolate", forKey: "favoriteIceCream")
//        object.saveEventually()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
        //requests access to the user’s location.
  
    }


}

