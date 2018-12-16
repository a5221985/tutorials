## Components ##
### ActivityIndicator ###
1. Displays circular loading indicator
2. Example:

		import React, { Component } from 'react'
		import {
			ActivityIndicator,
			AppRegistry,
			StyleSheet,
			Text,
			View,
		} from 'react-native'

		export default class App extends Component {
			render() {
				return (
					<View style={[style.container, styles.horizontal]}>
						<ActivityIndicator size="large" color="#0000ff" />
						<ActivityIndicator size="small" color="#00ff00" />
						<ActivityIndicator size="large" color="#0000ff" />
						<ActivityIndicator size="small" color="#00ff00" />
					</View>
				)
			}
		}

		const styles = StyleSheet.create({
			container: {
				flexDirection: 'row',
				justifyContent: 'space-around',
				padding: 10
			},
		})

		AppRegistry.registerComponent('App', () => App)

#### Props ####
1. `animating`
2. `color`
3. `size`
4. `hidesWhenStopped`

#### Reference ####
##### `animating` #####
1. whether to show the indicator or hide it
	1. bool

##### `color` #####
1. foreground color of the spinner (default is gray)

##### `size` #####
1. default is `small`
2. Passing number to size prop is only supported on Android
	1. `enum('small', 'large'),,number`

##### `hidesWhenStopped` #####
1. Should indicator hide when not animating (true by default)

### Button ###
### DatePickerIOS ###
### DrawerLayoutAndroid ###
### FlatList ###
### Image ###
### InputAccessoryView ###
### KeyboardAvoidingView ###
### ListView ###
### MaskedViewIOS ###
### Modal ###
### NavigatorIOS ###
### Picker ###
### PickerIOS ###
### ProgressBarAndroid ###
### ProgressViewIOS ###
### RefreshControl ###
### SafeAreaView ###
### ScrollView ###
### SectionList ###
### SegmentedControlIOS ###
### Slider ###
### SnapshotViewIOS ###
### StatusBar ###
### Switch ###
### TabBarIOS ###
### TabBarIOS.Item ###
### Text ###
### TextInput ###
### ToolbarAndroid ###
### TouchableHighlight ###
### TouchableNativeFeedback ###
### TouchableOpacity ###
### TouchableWithoutFeedback ###
### View ###
### ViewPagerAndroid ###
### VirtualizedList ###
### WebView ###
### AccessibilityInfo ###
### ActionSheetIOS ###
### Alert ###
### AlertIOS ###
### Animated ###
### AppRegistry ###
### AppState ###
### AsyncStorage ###
### BackAndroid ###
### BackHandler ###
### CameraRoll ###
### Clipboard ###
### DatePickerAndroid ###
### Dimensions ###
### Easing ###
### Geolocation ###
### ImageEditor ###
### ImagePickerIOS ###
### ImageStore ###
### Image Style Props ###
### InteractionManager ###
### Keyboard ###
### Layout Props ###
### LayoutAnimation ###
### Linking ###
### ListViewDataSource ###
### NetInfo ###
### PanResponder ###
### PermissionsAndroid ###
### PixelRatio ###
### PushNotificationIOS ###
### Settings ###
### Shadow Props ###
### Share ###
### StatusBarIOS ###
### StyleSheet ###
### Systrace ###
### Text Style Props ###
### TimePickerAndroid ###
### ToastAndroid ###
### Transforms ###
### Vibration ###
### VibrationIOS ###
### View Style Props ###
