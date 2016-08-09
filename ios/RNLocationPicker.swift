//
//  RNLocationPicker.swift
//  LocationPickerExample
//
//  Created by q6112345 on 3/8/2016.
//  Copyright © 2016 https://github.com/q6112345 All rights reserved.
//

import UIKit
import LocationPicker

var LocationDidSelectNotification: String = "LocationDidSelect";


@objc(RNLocationPicker)
class RNLocationPicker: LocationPicker, RCCExternalViewControllerProtocol {


  var colorPropNames: [String] = ["tableViewBackgroundColor",
                                  "currentLocationIconColor",
                                  "searchResultLocationIconColor",
                                  "alternativeLocationIconColor",
                                  "pinColor",
                                  "primaryTextColor",
                                  "secondaryTextColor"]

  weak var controllerDelegate: RCCViewControllerDelegate?
  func setProps(props: Dictionary<NSObject, AnyObject>?) -> Void {
    for (key, value) in props! {
      if (self.colorPropNames.contains(key as! String)) {
        let colorValue = RCTConvert.UIColor(value)
        self.setValue(colorValue, forKey: key as! String)
      } else {
        self.setValue(value, forKey: key as! String)
      }
    }

  }


  override func viewDidLoad() {
    super.addBarButtons()
    super.viewDidLoad()
  }

  override func locationDidSelect(locationItem: LocationItem) {
    let locationObject: [String:AnyObject] = ["name": locationItem.mapItem.placemark.title!,
                                              "latitude": locationItem.mapItem.placemark.coordinate.latitude,
                                              "longitude": locationItem.mapItem.placemark.coordinate.longitude]
    let nc = NSNotificationCenter.defaultCenter()
    nc.postNotificationName(LocationDidSelectNotification, object: locationObject)
  }

}
