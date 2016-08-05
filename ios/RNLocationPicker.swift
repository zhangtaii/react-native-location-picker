//
//  CustomLocationPicker.swift
//  LocationPickerExample
//
//  Created by q6112345 on 3/8/2016.
//  Copyright © 2016 https://github.com/q6112345 All rights reserved.
//

import UIKit
import LocationPickerViewController

// var gActiveLocationPicker: RNLocationPicker!  = nil;
var LocationDidSelectNotification: String = "LocationDidSelect";


@objc(RNLocationPicker)
class RNLocationPicker: LocationPicker, RCCExternalViewControllerProtocol {


  weak var controllerDelegate: RCCViewControllerDelegate?
  func setProps(props: [NSObject: AnyObject]?) -> Void {
  }

//  class func getActiveInstance() -> RNLocationPicker {
//    return gActiveLocationPicker
//  }

  override func viewDidLoad() {
//    gActiveLocationPicker = self
    super.addBarButtons()
    super.viewDidLoad()
  }

  override func locationDidSelect(locationItem: LocationItem) {
    let locationObject: NSDictionary = [
      "name": locationItem.mapItem.placemark.title!,
      "latitude": locationItem.mapItem.placemark.coordinate.latitude,
      "longitude": locationItem.mapItem.placemark.coordinate.longitude
    ]
    let nc = NSNotificationCenter.defaultCenter()
    nc.postNotificationName(LocationDidSelectNotification, object: locationObject)
  }

}
