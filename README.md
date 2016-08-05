# react-native-location-picker

React Native Wrapper for LocationPicker, a ready for use and fully customizable location picker.

### Dependencies

* [LocationPicker](https://github.com/JeromeTan1997/LocationPicker) - original  library

* [react-native-navigation](https://github.com/wix/react-native-navigation) - native navigation library for React Native (required to natively display the editor within RN)

### Installation

* Make sure your project relies on React Native >= 0.25

* Make sure your project uses **react-native-navigation** and that you've followed the **Installation** instructions [there](https://github.com/wix/react-native-navigation)

* In your RN project root run:<br>`npm install react-native-location-picker --save`

* Open your Xcode project and drag the folder `node_modules/react-native-location-picker/ios` into your project

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


