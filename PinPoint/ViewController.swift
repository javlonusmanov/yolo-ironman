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
    
    //regular variables
    let locationManager = CLLocationManager()
    
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
            locationManager.stopUpdatingLocation()
        }}


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

