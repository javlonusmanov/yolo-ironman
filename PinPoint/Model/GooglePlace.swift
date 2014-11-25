//
//  GooglePlace.swift
//  PinPoint
//
//  Created by Javlon Usmanov on 11/12/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation

class GooglePlace {
  var username: String
  var name: String
  var address: String
  var coordinate: CLLocationCoordinate2D
  var placeType: String
  var photoReference: String?
  var photo: UIImage?
  
  var personArray: [PFObject]! = []
  
  
  init(dictionary:NSDictionary, user: String)
  {
    username = user as String
    name = dictionary["name"] as String
    address = dictionary["vicinity"] as String
    
    let location = dictionary["geometry"]?["location"] as NSDictionary
    let lat = location["lat"] as CLLocationDegrees
    let lng = location["lng"] as CLLocationDegrees
    coordinate = CLLocationCoordinate2DMake(lat, lng)
    
    if let photos = dictionary["photos"] as? NSArray {
      let photo = photos.firstObject as NSDictionary
      photoReference = photo["photo_reference"] as? NSString
    }
    if let place = dictionary["placeType"] as? String {
      placeType = dictionary["placeType"] as String
    }
    else {
      placeType = ""
    }
  }
  
  func createLocation() {
    var location = PFObject(className: "Location")
    location["name"] = self.name
    location["address"] = self.address
    location["latitude"] = self.coordinate.latitude
    location["longitude"] = self.coordinate.longitude
    location["placeType"] = self.placeType
    location["photo"] = self.photo
    location["photoReference"] = self.photoReference
    location.saveInBackgroundWithTarget(nil, selector: nil)
  }
  
  func readLocation(id: NSString) -> PFObject? {
    var readlocation: PFObject?
    var query = PFQuery(className: "Location")
    query.getObjectInBackgroundWithId(id) {
      (location: PFObject!, error: NSError!) -> Void in
      if error == nil {
        readlocation = location
      } else {
        NSLog("%@", error)
        readlocation = nil
      }
    }
    return readlocation
  }
  
  func updateLocation(dictionary: NSDictionary, id: NSString) {
    // Update Current Object
    self.name = dictionary["name"] as String
    self.address = dictionary["vicinity"] as String
    
    let location = dictionary["geometry"]?["location"] as NSDictionary
    let lat = location["lat"] as CLLocationDegrees
    let lng = location["lng"] as CLLocationDegrees
    coordinate = CLLocationCoordinate2DMake(lat, lng)
    
    if let photos = dictionary["photos"] as? NSArray {
      let photo = photos.firstObject as NSDictionary
      photoReference = photo["photo_reference"] as? NSString
    }
    if let place = dictionary["placeType"] as? String {
      placeType = dictionary["placeType"] as String
    }
    else {
      placeType = ""
    }
    
    
    // Write data to Parse
    var query = PFQuery(className: "Location")
    query.getObjectInBackgroundWithId(id) {
      (location: PFObject!, error:NSError!) -> Void in
      if error == nil {
        location["name"] = self.name
        location["address"] = self.address
        location["latitude"] = self.coordinate.latitude
        location["longitude"] = self.coordinate.longitude
        location["placeType"] = self.placeType
        location["photo"] = self.photo
        location["photoReference"] = self.photoReference
        location.saveInBackgroundWithTarget(nil, selector: nil)
      } else {
        NSLog("%@", error)
      }
    }
  }
  
  func deleteLocation(id: NSString) {
    var query = PFQuery(className: "Location")
    query.getObjectInBackgroundWithId(id) {
      (location: PFObject!, error: NSError!) -> Void in
      if error == nil {
        location.deleteInBackgroundWithTarget(nil, selector: nil)
      } else {
        NSLog("%@", error)
      }
    }
  }
  
  func addUser() {
    var query = PFUser.query()
    query.whereKey("username", equalTo: username)
  }
}