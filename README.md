#### WARNING: This library is for `iOS` only, and must be used with `react-native-navigation`, I highly recommend using [react-native-google-place-picker](https://github.com/q6112345/react-native-google-place-picker) instead as its more featured(using Google's SDK), easy to setup(not dependent on `react-native-navigation`), with support for both `iOS` and `Android`.

# react-native-location-picker

React Native Wrapper for LocationPicker, a ready for use and fully customizable location picker.

<p align="left">
  <img src="https://i.imgur.com/4FyRNde.png" width="350"/>
</p>


### Dependencies

* [react-native-navigation](https://github.com/wix/react-native-navigation) - native navigation library for React Native (required to natively display the location picker within RN)

### Installation

* Make sure your project relies on React Native >= 0.25

* Make sure your project uses **react-native-navigation** and that you've followed the **Installation** instructions [there](https://github.com/wix/react-native-navigation)

1. In your RN project root run:<br>`npm install react-native-location-picker-controller --save`
2. In Xcode, in Project Navigator (left pane), right-click on the `Libraries` > `Add files to [project name]` <br> Add `./node_modules/react-native-location-picker-controller/ios/LocationPicker.xcodeproj` ([screenshots](https://facebook.github.io/react-native/docs/linking-libraries-ios.html#step-1))
3. In Xcode, in Project Navigator (left pane), click on your project (top) and select the `Build Phases` tab (right pane) <br> In the `Link Binary With Libraries` section add `LocationPicker.framework` ([screenshots](https://facebook.github.io/react-native/docs/linking-libraries-ios.html#step-2))
4. Open your Xcode project and drag  `RNLocationPicker.swift`, `RNLocationPickerManager.h`, `RNLocationPickerManager.m` from the folder `node_modules/react-native-location-picker/ios` into your project, in the dialog box let Xcode create Objective-C bridging header.([screenshot 1](https://i.imgur.com/OWfov99.png), [screenshot 2](https://i.imgur.com/jDjkusU.png))

5. Editing `<your project name>-Bridging-Header.h` to import `RCCExternalViewControllerProtocol.h` and `RCCViewController.h` for Swift to use:

    ```objc
    //
    //  Use this file to import your target's public headers that you would like to expose to Swift.
    //
    #import "RCCExternalViewControllerProtocol.h"
    #import "RCCViewController.h"
    #import "RCTConvert.h"
    ```

6. In `RNLocationPickerManager.m`, replace `#import "example-Swift.h"` to `#import "<your project name>-Swift.h"`

### Support Props(Subset of [LocationPicker](https://github.com/JeromeTan1997/LocationPicker#boolean))

#### Boolean

| Property name | Default | Target | Remark |
| ------------- |:-------:| ------ | ------ |
| allowArbitraryLocation | false | | Allows the selection of locations that did not match or exactly match search results |
| mapViewZoomEnabled | true | mapView.zoomEnabled | Whether the map view can zoom in and out |
| mapViewShowsUserLocation | true | mapView.showsUserLocation | Whether the map view shows user's location |
| mapViewScrollEnabled | true | mapView.scrollEnabled | Whether user can scroll the map view |

#### String

| Property name | Default | Target | Remark |
| ------------- |:-------:| ------ | ------ |
| currentLocationText | "Current Location" | currentLocationCell.locationNameLabel.text | The text that indicates the user's current location |
| searchBarPlaceholder | "Search for location" | searchBar.placeholder | The text that ask user to search for locations |
| locationDeniedAlertTitle | "Location access denied" | alertController.title | The text of the alert controller's title |
| locationDeniedAlertMessage | "Grant location access to use current location" | alertController.message | The text of the alert controller's message |
| locationDeniedGrantText | "Grant" | alertAction.title | The text of the alert controller's _Grant_ button |
| locationDeniedCancelText | "Cancel" | alertAction.title | The text of the alert controller's _Cancel_ button |

#### Color
* Using `processColor` to convert color, check example usage code at the end of README

* Valid color formats for `processColor` are
    - '#f0f' (#rgb)
    - '#f0fc' (#rgba)
    - '#ff00ff' (#rrggbb)
    - '#ff00ff00' (#rrggbbaa)
    - 'rgb(255, 255, 255)'
    - 'rgba(255, 255, 255, 1.0)'
    - 'hsl(360, 100%, 100%)'
    - 'hsla(360, 100%, 100%, 1.0)'
    - 'transparent'
    - 'red'
    - 0xff00ff00 (0xrrggbbaa)


| Property name | Default | Target | Remark |
| ------------- |:-------:| ------ | ------ |
| tableViewBackgroundColor | UIColor.whiteColor() | tableView.backgroundColor | The background color of the table view |
| currentLocationIconColor | UIColor(hue: 0.447, saturation: 0.731, brightness: 0.569, alpha: 1) | UIImage() | The color of the icon showed in current location cell, the icon image can be changed via property `currentLocationIconImage` |
| searchResultLocationIconColor | UIColor(hue: 0.447, saturation: 0.731, brightness: 0.569, alpha: 1) | UIImage() | The color of the icon showed in search result location cells, the icon image can be changed via property `searchResultLocationIconImage` |
| alternativeLocationIconColor | UIColor(hue: 0.447, saturation: 0.731, brightness: 0.569, alpha: 1) | UIImage() | The color of the icon showed in alternative location cells, the icon image can be changed via property 'alternativeLocationIconImage' |
| pinColor | UIColor(hue: 0.447, saturation: 0.731, brightness: 0.569, alpha: 1) | UIImage() | The color of the pin showed in the center of map view, the pin image can be changed via property `pinImage` |
| primaryTextColor | UIColor(colorLiteralRed: 0.34902, green: 0.384314, blue: 0.427451, alpha: 1) | Multiple | The text color of search bar and location name label in location cells |
| secondaryTextColor | UIColor(colorLiteralRed: 0.541176, green: 0.568627, blue: 0.584314, alpha: 1) | Multiple | The text color of location address label in location cells |

#### Number

| Property name | Default | Target | Remark |
| ------------- |:-------:| ------ | ------ |
| defaultLongitudinalDistance | Double | 1000 | Longitudinal distance of the map view shows when user select a location and before zoom in or zoom out |
| searchDistance | Double | 10000 | Distance in meters that is used to search locations |



### Usage

#### For a fully working example look [here](https://github.com/q6112345/react-native-location-picker/tree/master/example)

First, create a placeholder screen for the location picker. The main purpose of this screen is to handle navigation events. See an example [here](https://github.com/q6112345/react-native-location-picker/blob/master/example/LocationPickerScreen.js).

> Note: Make sure your screen component has been registered with `Navigation.registerComponent` like all react-native-navigation screens need to be, [example](https://github.com/q6112345/react-native-location-picker/blob/master/example/index.ios.js).

Now, to display your screen, from within one of your other app screens, push the location picker:

```js
import processColor from 'processColor';

this.props.navigator.push({
  screen: 'example.LocationPickerScreen',
  title: 'Pick  a Location',
  passProps: {
    externalNativeScreenClass: 'RNLocationPicker',
    externalNativeScreenProps: {
      currentLocationText: '当前位置',
      currentLocationIconColor: processColor('#72c02c'),
      allowArbitraryLocation: true,
      defaultLongitudinalDistance: 100,
    }
  }
});
```

### Credits

* This work is inspired from [react-native-wordpress-editor](https://github.com/wix/react-native-wordpress-editor), using it as a template.

* [LocationPicker](https://github.com/JeromeTan1997/LocationPicker) is the original library.


### License

Code in this git repo is licensed MIT.


