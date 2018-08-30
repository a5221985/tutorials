# Facebook - ReactNative Documentation #
## Build native mobile apps using JavaScript and React ##
1. Build mobile apps using only JS
2. Uses same design as React
	1. Compose UI using declarative components

			import React, { Component } from 'react';
			import { Text, View } from 'react-native';

			class WhyReactNativeIsSoGreat extends Component {
				render() {
					return (
						<View>
							<Text>
								If you like React on the web, you'll like React Native.
							</Text>
							<Text>
								You just use native components like 'View' and 'Text', instead of web components like 'div' and 'span'.
							</Text>
						</View>
					);
				}
			}

## A React Native app is a real mobile app ##
1. It is not mobile web app or HTML5 app or hybrid app.
	1. Real mobile app which cannot be distinguished between app built using Objective-C or Java.
		1. Uses UI building blocks of regular iOS and Android apps
			1. Put the building blocks together using JS and React
2. Example:

		import React, { Component } from 'react';
		import { Image, ScrollView, Text } from 'react-native';

		class AwkwardScrollingImageWithText extends Component {
			render() {
				return (
					<ScrollView>
						<Image
							source={{uri: 'https://i.chzbgr.com/full/7345954048/h7E2C65F9/'}}
							style={{width: 320, height: 180}}
						/>
						<Text>
							On iOS, a React Native ScrollView uses a native UIScrollView.
							On Android, it uses a native ScrollView

							On iOS, a React Native Image uses a native UIImageView.
							On Android, it uses a native ImageView.

							React Native wraps the fundamental native components, giving you
							the performance of a native app, plus the clean design of React.
					</ScrollView>
				);
			}
		}

## Don't waste time recompiling ##
1. [Hot Reloading](http://facebook.github.io/react-native/blog/2016/03/24/introducing-hot-reloading.html): Reload app instantly, run new code while retaining app state

## Use native code when you need to ##
1. Can combine code written in Objective-C, Java, or Swift.
	1. If few aspects need to be optimized
2. We can build part of the app with ReactNative and part of it using native code (Example: Facebook App)

		import React, { Component } from 'react';
		import { Text, View } from 'react-native';
		import { TheGreatestComponentInTheWorld } from './your-native-code';

		class SomethingFast extends Component {
			render() {
				return (
					<View>
						<TheGreatestComponentInTheWorld />
						<Text>
							TheGreatestComponentInTheWorld could use native Objective-C, Java, or Swift - the product development process is the same.
						</Text>
					</View>
				);
			}
		}

## Who's using React Native? ##
1. Fortune 500
2. New startups
3. [React Native apps](https://facebook.github.io/react-native/showcase.html)

## Get Started ##
### Introduction ###
1. Install and build ReactNative app
2. `create-react-native-app`: No tools or configuration required (no Xcode or Android studio)
	1. Command line utility

			npm install -g create-react-native-app

3. New Project:

		create-react-native-app AwesomeProject
		cd AwsomeProject
		npm start

	1. Starts new development server

### Running your React Native application ###
1. Install Expo client app on iOS or Android
2. Connect to same wireless network as the computer
	1. Android: Scan QR code from terminal to open project
	2. iSO: follow on-screen instructions to get a link

#### Modifying your app ####
1. Open `App.js` in text editor
	1. App reloads automatically once we save changes

### Now what? ###
1. [User Guide](https://github.com/react-community/create-react-native-app/blob/master/react-native-scripts/template/README.md)
	1. Specifics about the tool
2. [Troubleshooting](https://github.com/react-community/create-react-native-app/blob/master/react-native-scripts/template/README.md#troubleshooting)

#### Running your app on a simulator or virtual device ####
1. `create-react-native-app` can run the app without development environment
2. For running on iOS simulator or Android virtual device, refer to instructions for building native code
	1. Run using following:

			npm run android
			npm run ios (macOS only)

#### Caveats ####
1. While creation of project using Create React Native App, since we don't build any native code, it is not possible to include custom native modules (beyond React Native APIs and components)
2. If required, [eject](https://github.com/react-community/create-react-native-app/blob/master/react-native-scripts/template/README.md#ejecting-from-create-react-native-app) to setup native builds
	1. Need "Building Projects with Native Code" instructions to continue working on the project
3. `create-react-native-app` configures project to use most recent React Native version supported by Expo client app
	1. [Versions supported](https://github.com/react-community/create-react-native-app/blob/master/VERSIONS.md)
1. If integrating React Native to existing project, skip Create React Native App and directly go to setting up native build environment.
	1. Select "Building Projects with Native Code" (above)
		1. Setting up native build environment for React Native

## Learn the Basics ##
1. It is like React but uses native components instead of web components as building blocks.
2. Concepts:
	1. JSX
	2. `state`
	3. `props`
	4. Native components

### Hello World ###
1. Example:

		import React, { Component } from 'react';
		import { Text, View } from 'react-native';

		export default class HelloWorldApp extends Component {
			render() {
				return (
					<View>
						<Text>Hello world!</text>
					</View>
				);
			}
		}

	1. Paste it in `App.js`

### What's going on here? ###
1. React Native ships with ES2015 support
2. Parts:
	1. `import`, `from`, `class`, `extends`: ES2015 features
		1. [Overview of 2015 features](https://babeljs.io/learn-es2015/)
	2. `<View><Text>Hello world!</Text></View>`: JSX
		1. It is syntax to embed XML within JavaScript
			1. This is reverse of templating language
				1. `<Text>`: built-in component that displays some text
				2. `<View>`: Like `<div>` or `<span>`

### Components ###
1. `HelloWorldApp` is a new `Component`
	1. When building react native app, we might build many components
		1. `render`: Function which returns some JSX to render

### This app doesn't do very much ###
1. To make app do something, need Props

## Props ##
1. Customization of creation using parameters
	1. `props`: creation parameters
2. Example: `Image` is React Native component
	1. `source`: prop used to control image
3. Code:
		
		import React, { Component } from 'react';
		import { AppRegistry, Image } from 'react-native';

		export default class Bannanas extends Component {
			render() {
				let pic = {
					uri: 'https://upload.wikimedia.org/wikipedia/commons/d/de/Bananavarieties.jpg'
				};
				return (
					<Image source={pic} style={{width: 193, height: 110}} />

				);
			}
		}

		// skip this line if using Create React Native App
		AppRegistry.registerComponent('AwesomeProject', () => Bananas);

	1. `{..}`: embeds variable `pic` into JSX
		1. Can contain any JS expression
4. Custom components can also use props
	1. Enables single component to be used in many different places with slight difference in properties
		1. `this.props` can be used in `render` function
	2. Example:

			import React, { Component } from 'react';
			import { AppRegistry, Text, View } from 'react-native';

			class Greeting extends Component {
				render() {
					return (
						<Text>Hello {this.props.name}!</Text>
					);
				}
			}

			export default class LotsOfGreetings extends Component {
				render() {
					return (
						<View style={{alignItems: 'center'}}>
							<Greeting name='Rexxar' />
							<Greeting name='Jaina' />
							<Greeting name='Valeera' />
						</View>
					);
				}
			}

			// skip this line if using Create React Native App
			AppRegistry.registerComponent('AwesomeProject', () => LotsOfGreetings);

		1. `name`: props used to customize `Greeting` component
		2. `Greeting` component is also used in JSX
			1. Custom components gives us new UI primitives
		3. `View`: Container for other components
			1. Used to control style and layout
5. With `props`, `Text`, `Image`, `View` we can build many static screens

## State ##
1. Used to change app over time (dynamic app)
2. Two types of data control a component: `props`, `state`
	1. `props`: set by parent. Fixed throughout lifetime of component
	2. `state`: holds data that changes during lifetime of component
3. Steps:
	1. Initialize `state` in constructor
	2. Use `setState` to change it
4. Example: Consider blinking text
	1. text is fixed so it is a `prop`
	2. "whether the text is on or off" changes over time - this must be kept in `state`
5. Code Example:

		import React, { Component } from 'react';
		import { AppRegistry, Text, View } from 'react-native';

		class Blink extends Component {
			constructor(props) {
				super(props);
				this.state = {isShowingText: true};

				// Toggle the state every second
				setInterval(() => {
					this.setState(previousState => {
						return { isShowingText: !previousState.isShowingText };
					});
				}, 1000);
			}

			render() {
				let display = this.state.isShowingText ? this.props.text : '';
				return (
					<Text>{display}</Text>
				);
			}
		}

		export default class BlinkApp extends Component {
			render() {
				return (
					<View>
						<Blink text='I love to blink' />
						<Blink text='Yes blinking is so great' />
						<Blink text='Why did they ever take this out of HTML' />
						<Blink text='Look at me look at me look at me' />
					</View>
				);
			} 
		}

		// skip this line if using Create React Native App
		AppRegistry.registerComponent('AwesomeProject', () => BlinkApp);

	1. State is usually set when new data arrived from the server or from user input
		1. Use [Redux](https://redux.js.org/) or [Mobx](https://mobx.js.org/) to control data flow
			1. Used instead of calling `setState` directly
	2. `setState` will make BlinkApp rerender its component
		1. Called withing Timer which re-renders every time the Timer ticks
6. [React.Component API](https://reactjs.org/docs/react-component.html#setstate)

## Style ##
1. Used to make things beautiful
2. Special language or syntax is not required in React Native. Use JS
3. All core components accept a `prop` named `style`
	1. Names and values usually match CSS (except that names are in camel casing)
		1. `backgroundColor` instead of `background-color`
4. `style` can be POJO
	1. We can also pass array of styles (last style has pecedence)
		1. Can be used to inherit styles
5. `StyleSheet.create`: Used to define several styles in one place (for complex styling)

		import React, { Component } from 'react';
		import { AppRegistry, StyleSheet, Text, View } from 'react-native';

		export default class LotsOfStyles extends Component {
			render() {
				return (
					<View style={styles.container}>
						<Text style={styles.red}>just red</Text>
						<Text style={styles.bigblue}>just bigblue</Text>
						<Text style={[styles.bigblue, styles.red]}>bigblue, then red</Text>
						<Text style={[styles.red, styles.bigblue]}>red, then bigblue</Text>
					</View>
				);
			}
		}

		const styles = StyleSheet.create({
			container: {
				flex: 1,
				backgroundColor: '#fff',
				alignItems: 'center',
				justifyContent: 'center',
			},
			bigblue: {
				color: 'blue',
				fontWeight: 'bold',
				fontSize: 30,
			},
			red: {
				color: 'red',
			},
		});

		// skip this line if using Create React Native App
		AppRegistry.registerComponent('AwesomeProject', () => LotsOfStyles);
	
	1. Patterns: Make component accept `style` prop which can be used to style subcomponents
		1. Used for cascading
6. [Text Component reference](https://facebook.github.io/react-native/docs/text)

## Height and Width ##
1. Component's height and width determine it's size on the screen

### Fixed Dimensions ###
1. Fixed `width` and `height` to style. All dimensions in React Native are unitless and represent DIP

		import React, { Component } from 'react';
		import { AppRegistry, View } from 'react-native';

		export default class FixedDimensionsBasics extends Component {
			render() {
				return (
					<View>
						<View style={{width: 50, height: 50, backgroundColor: 'powderblue'}} />
						<View style={{width: 100, height: 100, backgroundColor: 'skyblue'}} />
						<View style={{width: 150, height: 150, backgroundColor: 'steelblue'}} />
					</View>
				);
			}
		}

		// skip this line if using Create React Native App
		AppRegistry.registerComponent('AwesomeProject', () => FixedDimensionsBasics);

	1. Good if component always has to render in same size regardless of screen dimensions

### Flex Dimensions ###
1. `flex`: Used in component's style. It expands or shrinks component dynamically based on available space.
	1. `flex: 1` - fill all available space shared evenly amongst each other component with same parent
		1. Larger the value, higher the ratio of space taken compared to it's siblings
		2. Applies if parent has dimensions greater than 0
			1. If parent does not have `flex` nor have `width` and `height`, it will have dimensions of 0 and `flex` children will not be visible
2. Code example:

		import React, { Component } from 'react';
		import { AppRegistry, View } from 'react-native';

		export default class FlexDimensionsBasics extends Component {
			render() {
				return (
					// Try removing the `flex: 1` on the parent View.
					// The parent will not have dimensions, so the children can't expand.
					// What if you add `height: 300` instead of `flex: 1`?
					<View style={{flex: 1}}>
						<View style={{flex: 1, backgroundColor: 'powderblue'}} />
						<View style={{flex: 2, backgroundColor: 'skyblue'}} />
						<View style={{flex: 3, backgroundColor: 'steelblue'}} />
					</View>
				);
			}
		}

		// skip this line if using Create React Native App
		AppRegistry.registerComponent('AwesomeProject', () => FlexDimensionsBasics);

## Layout with Flexbox ##
1. Component can specify layout of its children using flexbox algorithm
	1. Flexbox is designed to provide consistent layout on different screen sizes
2. Use a combination of `flexDirection`, `alignItems` and `justifyContent` to achieve right layout
3. Exceptions as compared to CSS on web: `flexDirection` defaulting to `column` instead of `row` and `flex` only supports single number

### Flex Direction ###
1. `flexDirection` determines primary axis of its layout
	1. `row`: children are organized horizontally
	2. `colun`: children are organized vertically
2. Example:

		import React, { Component } from 'react';
		import { AppRegistry, View } from 'react-native';

		export default class FlexDirectionBasics extends Component {
			render() {
				return (
					// Try setting `flexDirection` to `column`.
					<View style={{flex: 1, flexDirection: 'row'}}>
						<View style={{width: 50, height: 50, backgroundColor: 'powderblue'}} />
						<View style={{width: 50, height: 50, backgroundColor: 'skyblue'}} />
						<View style={{width: 50, height: 50, backgroundColor: 'steelblue'}} />
					</View>
				);
			}
		}

		// skip this line if using Create React Native App
		AppRegistry.registerComponent('AwesomeProject', () => FlexDirectionBasics);

### Justify Content ###
1. `justifyContent`: Determines distribution of children along primary axis
	1. Start: `flex-start`
	2. Center: `center`
	3. End: `flex-end`
	4. Spaced: `space-around`, `space-between`, `space-evenly`
2. Example:

		import React, { Component } from 'react';
		import { AppRegistry, View } from 'react-native';

		export default class JustifyContentBasics extends Component {
			render() {
				return (
					// Try setting `justifyContent` to `center`.
					// Try setting `flexDirection` to `row`.
					<View style={{
						flex: 1,
						flexDirection: 'column',
						justifyContent: 'space-between',
					}}>
						<View style={{width: 50, height: 50, backgroundColor: 'powderblue'}} />
						<View style={{width: 50, height: 50, backgroundColor: 'skyblue'}} />
						<View style={{width: 50, height: 50, backgroundColor: 'steelblue'}} />
					</View>
				);
			}
		}

		// skip this line if using Create React Native App
		AppRegistry.registerComponent('AwesomeProject', () => JustifyContentBasics);

### Align Items ###
1. `alignItems`: Determines alignment of children along secondary axis (if primary axis is `row` then secondary axis is `column` and vice versa)
	1. `flex-start`: start
	2. `center`: center
	3. `flex-end`: end
	4. `stretch`: stretches to fill
		1. Chidren must not have a fixed dimension along secondary axis
			1. `width: 50` must be removed
2. Code example:

		import React, { Component } from 'react';
		import { AppRegistry, View } from 'react-native';

		export default class AlignItemsBasics extends Component {
			render() {
				return (
					// Try setting `alignItems` to `flex-start`.
					// Try setting `justifyContent` to `flex-end`.
					// Try setting `flexDirection` to `row`.
					<View style={{
						flex: 1,
						flexDirection: 'column',
						justifyContent: 'center',
						alignItems: 'center',
					}}>
						<View style={{width: 50, height: 50, backgroundColor: 'powderblue'}} />
						<View style={{width: 50, height: 50, backgroundColor: 'skyblue'}} />
						<View style={{width: 50, height: 50, backgroundColor: 'steelblue'}} />
					</View>
				);
			}
		}

		// skip this line if using Create React Native App
		AppRegistry.registerComponent('AwesomeProject', () => AlignItemsBasics);

### Going Deeper ###
1. [Full list of props to control layout](https://facebook.github.io/react-native/docs/layout-props)

## Handling Text Input ##
1. For user input
2. `TextInput`: Allows user to enter text
	1. `onChangeText`: prop that takes function to be called whenever text changes
	2. `onSubmitEditing`: prop that takes function to be called when text is submitted
3. Example: Translating sentences to different language

		import React, { Component } from 'react';
		import { AppRegistry, Text, TextInput, View } from 'react-native';

		export default class PizzaTranslator extends Component {
			constructor(props) {
				super(props);
				this.state = {text: ''};
			}

			render() {
				return (
					<View style={{padding: 10}}>
						<TextInput
							style={{height: 40}}
							placeholder="Type here to translate!"
							onChangeText={(text) => this.setState({text})}
						/>
						<Text style={{padding: 10, fontSize: 42}}>
							{this.state.text.split(' ').map((word) => word && 'pizza ').join(' ')}
						</Text>
					</View>
				);
			}
		}

		// skip this line if using Create React Native App
		AppRegistry.registerComponent('AwesomeProject', () => PizzaTranslator);

	1. `text` is stored in state because it changes over time
	2. Other operations:
		1. Validate text while user types
			1. [React docs on controlled components](https://reactjs.org/docs/forms.html#controlled-components)
			2. [Reference docs for TextInput](https://facebook.github.io/react-native/docs/textinput)

## Handling Touches ##
1. Combination of gestures:
	1. Tapping on button
	2. Scrolling a list
	3. Zooming on a map
2. React native has components to handle different common gestures
	1. [Comprehensive gesture responder system](https://facebook.github.io/react-native/docs/gesture-responder-system): advanced gesture recognition
		1. Most common gesture: button

### Displaying a basic button ###
1. [Button](https://facebook.github.io/react-native/docs/button): provides basic button component that renders nicely on all platforms
	1. Example:

			<Button
				onPress={() => {
					Alert.alert('You tapped the button!');
				}}
				title="Press Me"
			/>

		1. iOS: Renders blue label
		2. Android: Renders rounded rectangle
	2. Pressing button calls `onPress` function
		1. Displays popup
2. Specify `color` prop to change color of the button
3. Code example:

		import React, { Component } from 'react';
		import { Alert, AppRegistry, Button, StyleSheet, View } from 'react-native';

		export default class ButtonBasics extends Component {
			_onPressButton() {
				Alert.alert('You tapped the button!');
			}

			render() {
				return (
					<View style={styles.container}>
						<View style={styles.buttonContainer}>
							<Button
								onPress={this._onPressButton}
								title="Press Me"
							/>
						</View>
						<View style={styles.buttonContainer}>
							<Button
								onPress={this._onPressButton}
								title="Press Me"
								color="#841584"
							/>
						</View>
						<View style={styles.alternativeLayoutButtonContainer}>
							<Button
								onPress={this._onPressButton}
								title="This looks great!"
							/>
							<Button
								onPress={this._onPressButton}
								title="OK!"
								color="#811584"
							/>
						</View>
					</View>
				);
			}
		}

		const styles = StyleSheet.create({
			container: {
				flex: 1,
				justifyContent: 'center',
			},
			buttonContainer: {
				margin: 20
			},
			alternativeLayoutButtonContainer: {
				margin: 20,
				flexDirection: 'row',
				justifyContent: 'space-between'
			}
		});

		// skip this line if using Create React Native App
		AppRegistry.registerComponent('AwesomeProject', () => ButtonBasics);

### Touchables ###
1. If basic button does not look good, build own button using of of `Touchable` components
	1. They capture tapping gestures
	2. They give feedback when a gesture is recognized
2. There is no default styling
3. Types of `Touchable` components: Depends on the kind of feedback
	1. `TouchableHighlight`: For button or link on web
		1. Background is darkened when user presses down on the button
	2. `TouchableNativeFeedback`: Android
		1. Displays ink surface reaction ripples
	3. `TouchableOpacity`: Used to reduce opacity of button
		1. Background may be seen through while user is pressing the button
	4. `TouchableWithoutFeedback`: Does not display any feedback but takes tap gesture
4. To detect when a user presses and holds a view for set amount of time.
	1. `onLongPress` prop to any of `TouchableX`
5. Code example:

		import React, { Component } from 'react';
		import { Alert, AppRegistry, Platform, StyleSheet, Text, TouchableHighlight, TouchableOpacity, TouchableNativeFeedback, TouchableWithoutFeedback, View} from 'react-native';

		export default class Touchables extends Component {
			_onPressButton() {
				Alert.alert('You tapped the button!');
			}

			_onLongPressButton() {
				Alert.alert('You Long-pressed the button!');
			}

			render() {
				return (
					<View style={styles.container}>
						<TouchableHighlight onPress={this._onPressButton} underlayColor="White">
							<View style={styles.button}>
								<Text style={styles.buttonText}>TouchableHighlight</Text>
							</View>
						</TouchableHighlight>
						<TouchableOpacity onPress={this._onPressButton}>
							<View style={styles.button}>
								<Text style={styles.buttonText}>TouchableOpacity</Text>
							</View>
						</TouchableOpacity>
						<TouchableNativeFeedback
							onPress={this._onPressButton}
						>
							<View style={styles.button}>
								<Text style={styles.buttonText}>TouchableNativeFeedback</Text>
							</View>
						</TouchableNativeFeedback>
						<TouchableWithoutFeedback
							onPress={this._onPressButton}
						>
							<View style={styles.buttonText}>TouchableWithoutFeedback</Text>
							</View>
						</TouchableWithoutFeedback>
						<TouchableHighlight onPress={this._onPressButton} onLongPress={this._onLongPressButton} underlayColor="white">
							<View style={styles.button}>
								<Text style={styles.buttonText}>Touchable with Long Press</Text>
							</View>
						</TouchableHighlight>
					</View>
				);
			}
		}

		const styles = StyleSheet.create({
			container: {
				paddingTop: 60,
				alignItems: 'center'
			},
			button: {
				marginBottom: 30,
				width: 260,
				alignItems: 'center',
				backgroundColor: '#2196F3'
			},
			buttonText: {
				padding: 20,
				color: 'white'
			}
		});

		// skip this line if using Create React Native App
		AppRegistry.registerComponent('AwesomeProject', () => Touchables);

### Scrolling lists, swiping pages, and pich-to-zoom ###
1. Swipe or span: Another gesture
	1. Used to scroll through a list of items
	2. Swipe through pages
2. Done using `ScrollView`

## Using a ScrollView ##
1. `ScrollView`: generic scrolling container that can host multiple components and views
	1. Items inside need not be homogeneous
	2. We can scroll both vertically and horizontally (set `horizontal` property)
2. Example:

		import React, { Component } from 'react';
		import { AppRegistry, ScrollView, Image, Text } from 'react-native';

		export default class IScrolledDownAndWhatHappenedNextShockedMe extends Component {
			render() {
				return (
					<ScrollView>
						<Text style={{fontSize: 96}}>Scroll me plz</Text>
						<Image source={require('/react-native/img/favicon.png')} />
						<Image source={require('/react-native/img/favicon.png')} />
						<Image source={require('/react-native/img/favicon.png')} />
						<Image source={require('/react-native/img/favicon.png')} />
						<Image source={require('/react-native/img/favicon.png')} />
						<Text style={{fontSize: 96}}>If you like</Text>
						<Image source={require('/react-native/img/favicon.png')} />
						<Image source={require('/react-native/img/favicon.png')} />
						<Image source={require('/react-native/img/favicon.png')} />
						<Image source={require('/react-native/img/favicon.png')} />
						<Image source={require('/react-native/img/favicon.png')} />
						<Text style={{fontSize: 96}}>Scrolling down</Text>
						<Image source={require('/react-native/img/favicon.png')} />
						<Image source={require('/react-native/img/favicon.png')} />
						<Image source={require('/react-native/img/favicon.png')} />
						<Image source={require('/react-native/img/favicon.png')} />
						<Image source={require('/react-native/img/favicon.png')} />
						<Text style={{fontSize: 96}}>What's the best</Text>
						<Image source={require('/react-native/img/favicon.png')} />
						<Image source={require('/react-native/img/favicon.png')} />
						<Image source={require('/react-native/img/favicon.png')} />
						<Image source={require('/react-native/img/favicon.png')} />
						<Image source={require('/react-native/img/favicon.png')} />
						<Text style={{fontSize: 96}}>Framework around?</Text>
						<Image source={require('/react-native/img/favicon.png')} />
						<Image source={require('/react-native/img/favicon.png')} />
						<Image source={require('/react-native/img/favicon.png')} />
						<Image source={require('/react-native/img/favicon.png')} />
						<Image source={require('/react-native/img/favicon.png')} />
						<Text style={{fontSize: 96}}>React Native</Text>
					</ScrollView>
				);
			}
		}

		// skip these lines if using Create React Native App
		AppRegistry.registerComponent(
			'AwesomeProject',
			() => IScrollDownAndWhatHappenedNextShockedMe
		);

	1. For paging through views, we can use `pagingEnabled` props
	2. Android: Swipe horizontally between views using [ViewPagerAndroid](https://facebook.github.io/react-native/docs/viewpagerandroid)
	3. Zooming on single item is possible using `maximumZoomScale` and `minimumZoomScale` props
		1. User can use pinch and expand gestures
	4. Good for small amount of things of limited size
		1. All elements and views of `ScrollView` are rendered (even if not currently shown on screen)
	5. `FlatList`: For long list that does not fit on the screen

## Using List Views ##
1. There are many components for lists of data:
	1. `FlatList`
	2. `SectionList`
2. `FlatList`: displays scrolling list of changing, but similarly structured data
	1. Good for long lists of data (number of items might change over time)
	2. Renders elements that are currently on the screen
	3. Requires two props:
		1. `data`: Source of information for list
		2. `renderItem`: takes one item from source and returns formatted component to render
3. Example: Simple `FlatList` of hardcoded data

		import React, { Component } from 'react';
		import { AppRegistry, FlatList, StyleSheet, Text, View } from 'react-native';

		export default class FlatListBasics extends Component {
			render() {
				return (
					<View style={styles.container}>
						<FlatList
							data = {[
								{key: 'Devin'},
								{key: 'Jackson'},
								{key: 'James'},
								{key: 'Joel'},
								{key: 'John'},
								{key: 'Jillian'},
								{key: 'Jimmy'},
								{key: 'Julie'},
							]}
							renderItem={({item}) => <Text style={styles.item}>{item.key}</Text>}
						/>
					</View>
				);
			}
		}

		const styles = StyleSheet.create({
			container: {
				flex: 1,
				paddingTop: 22
			},
			item: {
				padding: 10,
				fontSize: 18,
				height: 44
			}
		});

		// skip this line if using Create React Native App
		AppRegistry.registerComponent('AwesomeProject', () => FlatListBasics);

4. To render data broken into logical sections, with section headers then use `SectionList`

		import React, { Component } from 'react';
		import { AppRegistry, SectionList, StyleSheet, Text, View } from 'react-native';

		export default class SectionListBasics extends Component {
			render() {
				return (
					<View style={styles.container}>
						<SectionList
							sections = {[
								{title: 'D', data: ['Devin']},
								{title: 'J', data: ['Jackson', 'James', 'Jillian', 'Jimmy', 'Joel', 'John', 'Julie']}
							]}
							renderItem = {({item}) => <Text style={styles.item}>{item}</Text>}
							renderSectionHeader = {({section}) => <Text style={styles.sectionHeader}>{section.title}</Text>}
							keyExtractor = {(item, index) => index}
						/>
					</View>
				);
			}
		}

		const styles = StyleSheet.create({
			container: {
				flex: 1,
				paddingTop: 22
			},
			sectionHeader: {
				paddingTop: 2,
				paddingLeft: 10,
				paddingRight: 10,
				paddingBottom: 2,
				fontSize: 14,
				fontWeight: 'bold',
				backgroundColor: 'rgba(247, 247, 247, 1.0)'
			},
			item: {
				padding: 10,
				fontSize: 18,
				height: 44
			}
		});

		// skip this line if using Create React Native App
		AppRegistry.registerComponent('AwesomeProject', () => SectionListBasics);

5. The above components are used to display data fetched from server

## Networking ##
1. Make request to REST API
2. Fetch static content from another server

### Using Fetch ###
1. [Fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API): Provided by React Native
	1. [MDN's guide to Using Fetch](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch)

#### Making requests ####
1. To fetch content from URL

		fetch('https://mywebsite.com/mydata.json');

2. Second argument (object) is used to customize HTTP request

		fetch('https://mywebsite.com/endpoint/', {
			method: 'POST',
			headers: {
				Accept: 'application/json',
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({
				firstParam: 'yourValue',
				secondParam: 'yourOtherValue'
			})
		});

	1. [Full list of properties](https://developer.mozilla.org/en-US/docs/Web/API/Request)

#### Handling the response ####
1. Networking is asynchronous operation
	1. Fetch methods return [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise) - makes it easier to write code for asynchronous operations

			function getMoviesFromApiAsync() {
				return fetch('https://facebook.github.io/react-native/movies.json')
					.then((response) => response.json())
					.then((responseJson) => {
						return responseJson.movies;
					})
					.catch((error) => {
						console.error(error);
					});
			}

2. Using ES2017 `async/await`

		async function getMoviesFromApi() {
			try {
				let response = await fetch(
					'https://facebook.github.io/react-native/movies.json'
				);
				let responseJson = await response.json();
				return responseJson.movies;
			} catch (error) {
				console.error(error);
			}
		}

	1. Ensure to catch errors returned by `fetch` or else, they will be dropped silently
3. Code example:

		import React from 'react';
		import { FlatList, ActivityIndicator, Text, View } from 'react-native';

		export default class FetchExample extends React.Component {
			
			constructor(props) {
				super(props);
				this.state = { isLoading: true }
			}

			componentDidMount() {
				return fetch('https://facebook.github.io/react-native/movies.json')
					.then((response) => response.json())
					.then((responseJson) => {
						this.setState({
							isLoading: false,
							dataSource: responseJson.movies
						}, function () {

						});
					})
					.catch((error) => {
						console.error(error);
					});
			}

			render() {
				if(this.state.isLoading) {
					return(
						<View style={{flex: 1, padding: 20}}>
							<ActivityIndicator />
						</View>
					)
				}

				return (
					<View style={{flex: 1, padding: 20}}>
						<FlatList
							data = {this.state.dataSource}
							renderItem = {({item}) => <Text>{item.title}, {item.releaseYear}</Text>}
							keyExtractor = {(item, index) => index.toString()}
						/>
					</View>
				);
			}
		}

	1. iOS will block requests not encrypted using SSL
		1. Workaround: [add an App Transport Security exception](https://facebook.github.io/react-native/docs/integration-with-existing-apps#test-your-integration)
			1. Add exceptions only for specific domains (if known)
			2. Disable ATS (if unknown)

#### Using Other Networking Libraries ####
1. `XMLHttpRequest` API is built in to React Native
	1. [frisbee](https://github.com/niftylettuce/frisbee) and [axios](https://github.com/mzabriskie/axios) can be used (which depend on it)
	2. We can directly use it
2. Code example:

		var request = new XMLHttpRequest();
		request.onreadystatechange = (e) => {
			if (request.readyState !== 4) {
				return;
			}

			if (request.status === 200) {
				console.log('success', request.responseText);
			} else {	
				console.warn('error');
			}
		};

		request.open('GET', 'https://mywebsite.com/endpoint/');
		request.send();

	1. Difference from Web: No CORS for native apps

### WebSocket Support ###
1. React Native supports [WebSockets](https://developer.mozilla.org/en-US/docs/Web/API/WebSocket) - full-duplex communication protocol over single TCP connection

		var ws = new WebSocket('ws://host.com/path');

		ws.onopen = () => {
			// connection opened
			ws.send('something'); // send a message
		};

		ws.onmessage = (e) => {
			// a message was received
			console.log(e.data);
		};

		ws.onerror = (e) => {
			// an error occurred
			console.log(e.message);
		};

		ws.onclose = (e) => {
			// connection closed
			console.log(e.code, e.reason);
		};

## More Resources ##
1. Related stuff

### Popular Libraries ###
1. [React](https://facebook.github.io/react/)
2. [Redux](http://redux.js.org/): To handle state of te app
	1. [series of videos](https://egghead.io/courses/getting-started-with-redux)
3. [Awesome React Native](http://www.awesome-react-native.com/): It is a library that does specific thing
	1. Curated list of components that has
		1. Demos
		2. Articles
		3. ...

### Examples ###
1. [Showcase](https://facebook.github.io/react-native/showcase.html)
2. [Example apps on GitHub](https://github.com/ReactNativeNews/React-Native-Apps)
3. [Detailed series of tutorials](http://makeitopen.com/): In depth examples

### Extending React Native ###
1. npm modules and open sourced on GitHub
2. Write own modules and share
3. [iOS Native modules](https://facebook.github.io/react-native/docs/native-modules-ios), [Android Native modules](https://facebook.github.io/react-native/docs/native-modules-android)
	1. Native UI components: [iOS](https://facebook.github.io/react-native/docs/native-components-ios), [Android](https://facebook.github.io/react-native/docs/native-components-android) - for extending native functionality
4. [JS.coach](https://js.coach/react-native) - pre-built components

### Development Tools ###
1. [Nuclide](https://nuclide.io/): IDE used by Facebook internally (for JS development)
	1. Debugging
	2. Inline flow support
2. [VS Code](https://code.visualstudio.com/): Popular
3. [Ignite](https://github.com/infinitered/ignite): Starter kit that uses Redux and few common UI libraries
	1. CLI to generate apps, components, containers
4. [CodePush](https://microsoft.github.io/code-push/): service from Microsoft that makes it easy to deploy live updates to your React Native app.
	1. No need for app store process to deploy little tweeks
	2. No need for own backend
5. [Expo](https://docs.expo.io/): Development environment plus application
	1. Build react native apps in expo dev env
	2. No need for Xcode or Android Studio
6. [React Developer Tools](https://facebook.github.io/react-native/docs/debugging#react-developer-tools): For debugging React and React Native apps

### Where React Native People Hang Out ###
1. [forum at discuss.reactjs.org](https://discuss.reactjs.org/): Discussion about best practices and application architecture, future or react native
2. [Reactiflux](https://discord.gg/0ZcbPKXt5bZjGY5n): React-related discussion (React-native as well)
	1. Discord is used (better than slack for open source projects)
	2. `#react-native` channel
3. [React Twitter Account](https://twitter.com/reactjs): React and React Native
	1. [Twitter account](https://twitter.com/reactnative)
	2. [Blog](https://facebook.github.io/react-native/blog/)
4. [React Native Meetups](http://www.meetup.com/topics/react-native/)
5. [React.js Conf 2017](https://www.youtube.com/playlist?list=PLb0IAmt7-GS3fZ46IGFirdqKTIxlws7e0), [React.js Conf 2016](https://www.youtube.com/playlist?list=PLb0IAmt7-GS0M8Q95RIc2lOM6nc77q1IY), [React.js Conf 2015](https://www.youtube.com/watch?list=PLb0IAmt7-GS1cbw4qonlQztYV1TAW0sCr&v=KVZ-P-ZI6W4)
6. [Dedicated React Native Conferences](http://www.awesome-react-native.com/#conferences)

## Guides ##

### Components and APIs ###
1. Built in components
2. Categories of components:
	1. [Basic Components](https://facebook.github.io/react-native/docs/components-and-apis#basic-components)
	2. [User Interface](https://facebook.github.io/react-native/docs/components-and-apis#user-interface)
	3. [List Views](https://facebook.github.io/react-native/docs/components-and-apis#list-views)
	4. [iOS-specific](https://facebook.github.io/react-native/docs/components-and-apis#ios-components-and-apis)
	5. [Android-specific](https://facebook.github.io/react-native/docs/components-and-apis#android-components-and-apis)
	6. [Others](https://facebook.github.io/react-native/docs/components-and-apis#others)
3. List of libraries: npm - [react-native](https://www.npmjs.com/search?q=react-native&page=1&ranking=optimal), [Awesome React Native](http://www.awesome-react-native.com/) - curated list

#### Basic Components ####
1. [View](https://facebook.github.io/react-native/docs/view.html):
	1. Fundamental component for building UI
2. [Text](https://facebook.github.io/react-native/docs/text.html):
	1. For displaying text
3. [Image](https://facebook.github.io/react-native/docs/image.html):
	1. For displaying images
4. [TextInput](https://facebook.github.io/react-native/docs/textinput.html):
	1. For inputting text into app via keyboard
5. [ScrollView](https://facebook.github.io/react-native/docs/scrollview.html):
	1. Scrolling container that can host multiple components and views
6. [StyleSheet](https://facebook.github.io/react-native/docs/stylesheet.html):
	1. Abstract layer similar to CSS stylesheets

#### User Interface ####
1. Common UI controls on any platform
2. Components:
	1. [Button](https://facebook.github.io/react-native/docs/button.html):
		1. for handling touches (renders nicely on any platform)
	2. [Picker](https://facebook.github.io/react-native/docs/picker.html):
		1. Native picker on iOS and Android
	3. [Slider](https://facebook.github.io/react-native/docs/slider.html):
		1. To select single value from a range of values
	4. [Switch](https://facebook.github.io/react-native/docs/switch.html):
		1. Boolean input

#### List Views ####
1. Components that render elements currently showing on screen
	1. [FlatList](https://facebook.github.io/react-native/docs/flatlist.html):
		1. For rendering performant scrollable lists
	2. [SectionList](https://facebook.github.io/react-native/docs/sectionlist.html):
		1. For sectioned list

#### iOS Components and APIs ####
1. Wrappers for commonly used UIKit classes
	1. [ActionSheetIOS](https://facebook.github.io/react-native/docs/actionsheetios.html):
		1. API to display iOS action sheet or share sheet
	2. [AlertIOS](https://facebook.github.io/react-native/docs/alertios.html):
		1. iOS alert dialog with message or prompt for user input
	3. [DatePickerIOS](https://facebook.github.io/react-native/docs/datepickerios.html)
		1. Renders date/time picker (selector) on iOS.
	4. [ImagePickerIOS](https://facebook.github.io/react-native/docs/imagepickerios.html):
		1. Renders image picker on iOS
	5. [NavigatorIOS](https://facebook.github.io/react-native/docs/navigatorios.html):
		1. Wrapper around `UINavigatorController` - to implement navigation stack
	6. [ProgressViewIOS](https://facebook.github.io/react-native/docs/progressviewios.html):
		1. Renders `UIProgressView` on iOS
	7. [PushNotificationIOS](https://facebook.github.io/react-native/docs/pushnotificationios.html):
		1. Push notifications for app
			1. Includes permission handling
			2. Includes icon badge number
	8. [SegmentedControlIOS](https://facebook.github.io/react-native/docs/segmentedcontrolios.html):
		1. Renders `UISegmentedControl` on iOS
	9. [TabBarIOS](https://facebook.github.io/react-native/docs/tabbarios.html):
		1. Renders `UITabViewController` on iOS
		2. Use with [TabBarIOS.Item](https://facebook.github.io/react-native/docs/tabbarios-item.html)

#### Android Components and APIs ####
1. Wrappers for commponly used Android classes
	1. [BackHandler](https://facebook.github.io/react-native/docs/backhandler.html)
		1. Detects hardware button presses for back navigation
	2. [DatePickerAndroid](https://facebook.github.io/react-native/docs/datepickerandroid.html):
		1. Opens standard Android date picker dialog
	3. [DrawerLayoutAndroid](https://facebook.github.io/react-native/docs/drawerlayoutandroid.html):
		1. Renders `DrawerLayout` on Android
	4. [PermissionsAndroid](https://facebook.github.io/react-native/docs/permissionsandroid.html):
		1. Provides access to permissions model introduced in Android M
	5. [ProgressBarAndroid](https://facebook.github.io/react-native/docs/progressbarandroid.html):
		1. Renders `ProgressBar` on Android
	6. [TImePickerAndroid](https://facebook.github.io/react-native/docs/timepickerandroid.html):
		1. Opens standard Android time picker dialog
	7. [ToastAndroid](https://facebook.github.io/react-native/docs/toastandroid.html):
		1. Android Toast alert
	8. [ToolbarAndroid](https://facebook.github.io/react-native/docs/toolbarandroid.html):
		1. Renders `Toolbar` on Android
	9. [ViewPagerAndroid](https://facebook.github.io/react-native/docs/viewpagerandroid.html):
		1. Container that allows to flip left and right between child views

#### Others ####
1. For certain apps
2. Components:
	1. 

### Platform Specific Code ###

### Navigating Between Screens ###

### Images ###

### Animations ###

##### Tracking dynamic values #####
1. Animated values can track other values. 
	1. `toValue` must be set to another animated value instead of plain number
		1. Example: "Chat Heads" like messenger on Android can be implemented with `spring()` pinned on another animated value
			1. `timing()` and `duration` of 0 for rigid tracking
			2. Composed with interpolations

					Animated.spring(follower, {toValue: leader}).start();
					Animated.timing(opacity, {
						toValue: pan.x.interpolate({
							inputRange: [0, 300],
							outputRange: [1, 0],
						}),
					}).start();

				1. `leader` and `follower` animated values would be implemented using `Animated.ValueXY`
					1. `ValueXY`: Good for 2D interactions (panning, dragging)
						1. Wrapper for two `Animated.Value` instances and some helper functions

##### Tracking gestures #####
1. 

##### Responding to the current animation value #####
##### Using the native driver #####
###### Caveats ######
##### Bear in mind #####
##### Additional examples #####

#### `LayoutAnimation` API ####
#### Additional notes ####
##### `requestAnimationFrame` #####
##### `setNativeProps` #####

### Accessibility ###

### Improving User Experience ###

### Timers ###

### Debugging ###

### Performance ###

### Gesture Responder System ###

### JavaScript Environment ###

### Direct Maniplulation ###

### Color Reference ###

### Integration with Existing Apps ###

### Building For TV Devices ###

### Running On Device ###
1. Good to test app on real device before releasing to users
2. Steps to release app
	1. Eject and install native code dependencies from [Getting Started guide](https://facebook.github.io/react-native/docs/getting-started)

#### Running your app on iOS devices ####
##### Plug in your device via USB #####
1. Connect iOS device to Mac using a USB to lightning cable
2. Navigate to `ios` folder in the project and open `.xcodeproj` or if using CocoaPods open `.xcworkspace` within it using Xcode

##### Configure code signing #####
##### Build and Run your app #####

#### Connecting to the development server ####
##### Troubleshooting #####

#### Building your app for production ####
##### Enable App Transport Security #####
##### Configure release scheme #####
##### Configure app to use static bundle #####
##### Build app for release #####

### Upgrading to new React Native versions ###

### Troubleshooting ###


## Guides (iOS) ##

### Native Modules ###

### Native UI Components ###

### Linking Libraries ###

### Running On Simulator ###

### Communication between native and React Native ###

### App Extensions ###


## Guides (Android) ##

### Native Modules ###

### Native UI Components ###

### Headless JS ###

### Generating Signed APK ###

### Removing Default Permissions ###


## Contributing ##
### How to Contribute ###
### What to Expect from Maintainers ###
### Building React Native from source ###
### Testing your Changes ###
### Understanding the CLI ###

## Components ##
### ActivityIndicator ###
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
### ProgressBarAndroid ###
### ProgressViewIOS ###
### SafeAreaView ###
### ScrollView ###
### SectionList ###
### SegmentedControllIOS ###
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

## APIs ##
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
### LayoutAnimations ###
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