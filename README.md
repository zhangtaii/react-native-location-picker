# react-native-location-picker

React Native Wrapper for LocationPicker, a ready for use and fully customizable location picker.

> [LocationPicker](https://github.com/JeromeTan1997/LocationPicker) - original  library


<p align="left">
  <img src="https://i.imgur.com/4FyRNde.png" width="350"/>
</p>


### Dependencies

* [react-native-navigation](https://github.com/wix/react-native-navigation) - native navigation library for React Native (required to natively display the editor within RN)

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
    ```

6. In `RNLocationPickerManager.m`, replace `#import "tacitus-Swift.h"` to `#import "<your project name>-Swift.h"`

### Usage

To display your screen, from within one of your other app screens, push the editor:

```js
this.props.navigator.push({
  screen: 'example.LocationPickerScreen',
  title: 'Pick  a Location',
  passProps: {
    externalNativeScreenClass: 'RNLocationPicker',
  }
});
```

### License

Code in this git repo is licensed MIT.


