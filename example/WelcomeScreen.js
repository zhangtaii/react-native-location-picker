import React, { Component } from 'react';
import {
  StyleSheet,
  Text,
  View,
  TouchableOpacity
} from 'react-native';
import reactNativeEmitter from './reactNativeEmitter';


export default class WelcomeScreen extends Component {
  constructor(props) {
    super(props);
    this.state = {
      location: null,
    }
  }

  componentWillMount() {
    this.sendLocationSubscription = reactNativeEmitter.addListener('sendLocation', (location) => {
      location && this.setState({location});
    })
  }

  componentWillUnMount() {
    this.sendLocationSubscription.remove();
  }

  onPress() {
    this.props.navigator.push({
      screen: 'example.LocationPickerScreen',
      title: 'Pick  a Location',
      backButtonTitle: "",
      passProps: {
        externalNativeScreenClass: 'RNLocationPicker',
      }
    });
  }

  render() {
    return (
      <View style={styles.container}>
        <TouchableOpacity onPress={this.onPress.bind(this)}>
          <Text style={{color: '#72c02c', fontSize: 20, fontWeight:'bold'}}>
            Click me to push Location Picker!
          </Text>
        </TouchableOpacity>
        <View style={styles.location}>
          <Text style={{color: 'black', fontSize: 15}}>
            {JSON.stringify(this.state)}
          </Text>
        </View>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  location: {
    backgroundColor: 'white',
    margin: 25
  }
});