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
    ```

6. In `RNLocationPickerManager.m`, replace `#import "tacitus-Swift.h"` to `#import "<your project name>-Swift.h"`

### Usage

#### For a fully working example look [here](https://github.com/wix/react-native-wordpress-editor/tree/master/example)

First, create a placeholder screen for the location picker. The main purpose of this screen is to handle navigation events. See an example [here](https://github.com/q6112345/react-native-location-picker/blob/master/example/LocationPickerScreen.js).

> Note: Make sure your screen component has been registered with `Navigation.registerComponent` like all react-native-navigation screens need to be, [example](https://github.com/q6112345/blob/master/example/index.ios.js).

Now, to display your screen, from within one of your other app screens, push the location picker:

```js
this.props.navigator.push({
  screen: 'example.LocationPickerScreen',
  title: 'Pick  a Location',
  passProps: {
    externalNativeScreenClass: 'RNLocationPicker',
  }
});
```

### Credits

* This work is inspired from [react-native-wordpress-editor](https://github.com/wix/react-native-wordpress-editor), using it as a template.

* [LocationPicker](https://github.com/JeromeTan1997/LocationPicker) is the original library.


### License

Code in this git repo is licensed MIT.


