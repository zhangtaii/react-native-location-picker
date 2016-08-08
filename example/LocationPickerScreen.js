import React, { Component } from 'react';
import { NativeAppEventEmitter } from 'react-native';
import reactNativeEmitter from './reactNativeEmitter';

export default class LocationPickerScreen extends Component {
  static navigatorButtons = {
    rightButtons: [
      {
        title: 'Send',
        id: 'send'
      }
    ]
  };

  constructor(props) {
    super(props);
    this.props.navigator.setOnNavigatorEvent(this.onNavigatorEvent.bind(this));
    this.state = {
      location: undefined
    }
  }

  componentWillMount() {
    this.subscription = NativeAppEventEmitter.addListener(
      'locationDidSelect',
      (location) => {
        this.setState({location});
        console.log('locationDidSelect',location);
      }
    );

  }

  componentWillUnMount() {
    this.subscription.remove();
  }


  onNavigatorEvent(event) {
    if (event.id == 'send') {
      reactNativeEmitter.emit('sendLocation', this.state.location);
      this.props.navigator.pop();
    } else if (event.id == 'close') {
      this.props.navigator.pop();

    }

  }

  /*
   This screen can be empty since all the content comes form the external view controller.
   If necessary, navigation logic, event handling and redux logic can go here
   */

  render() {
    return null;
  }
}
