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
#### Native App Accessibility (iOS and Android) ####
#### Making Apps Accessible ####
##### Accessibility Properties #####
###### accessible (iOS, Android) ######
###### accessibilityLabel (iOS, Android) ######
###### accessibilityTraits (iOS) ######
###### accesibilityViewIsModel (iOS) ######
###### accessibilityElementsHidden (iOS) ######
###### onAccessibilityTap (iOS) ######
###### onMagicTap (iOS) ######
###### accessibilityComponentType (Android) ######
###### accessibilityLiveRegion (Android) ######
###### ImportantForAccessibility (Android) ######
##### Checking if a Screen Reader is Enabled #####
##### Sending Accessibility Events (Android) #####
#### Testing VoiceOver Support (iOS) ####

### Improving User Experience ###
#### Configure Test Inputs ####
1. Challenge: Entering text on touch screen
	1. Small screen
	2. Software keyboard
2. Solution: Configure text inputs based on what data is required
	1. Focus first field automatically
	2. Use placeholder text as example expected data format
	3. Enable or disable autocapitalization and autocorrect
	4. Choose keyboard type (e.g. email, numeric)
	5. Make sure return button focuses the next field or submits the form
3. Check `TextInput` [docs](https://facebook.github.io/react-native/docs/textinput): More config options
4. [Try it out](https://snack.expo.io/H1iGt2vSW)

#### Manage Layout When Keyboard is Visible ####
1. Software keyboard takes almost half of the screen
2. If interactive elements get covered by keyboard make sure they are accessible by using `KeyboardAvoidingView` [component](https://facebook.github.io/react-native/docs/keyboardavoidingview)
3. [Try it out](https://snack.expo.io/ryxRkwnrW)

#### Make Tappable Areas Larger ####
1. Difficult press buttons on mobile phones
2. All interactive elements are 44x44 or larger
	1. Leave enough space for element
		1. `padding`
		2. `minWidth`
		3. `minHeight`
3. Make use of style
4. Use `hitSlop` [prop](https://facebook.github.io/react-native/docs/touchablewithoutfeedback#hitslop)
5. [Try it on phone](https://snack.expo.io/rJPwCt4HZ)

#### Use Android Ripple ####
1. Material design ripple is used
	1. Gives feedback when you touch an interactable area
	2. Exposed with `TouchableNativeFeedback` [component](https://facebook.github.io/react-native/docs/touchablenativefeedback)
2. Better than opacity or highlight
3. Note: Doesn't work on iOS or Android API < 21
	1. Implement fallback logic
	2. [react-native-platform-touchable](https://github.com/react-community/react-native-platform-touchable)
4. [Try it on phone](https://snack.expo.io/SJywqe3rZ)

#### Screen Orientation Lock ####
1. Multiple screen orientations should work by default unless using `Dimensions` API
2. We can lock screen to either portrait or landscape
	1. iOS: General tab > Deployment Info section of Xcode, enable Device Orientation (iPhone must be selected from Devices menu when making changes)
	2. Android: Open AndroidManifest.xml
		1. Inside activity element, add one of

				'android:screenOrientation="portrait"'
				'android:screenOrientation="landscape"'

#### Learn More ####
1. Learn design for mobile platforms:
	1. [Material Design](https://material.io/)
	2. [Human Interface Guidelines](https://developer.apple.com/ios/human-interface-guidelines/overview/design-principles/)

### Timers ###
1. Important
2. React Native implements [browser timers](https://developer.mozilla.org/en-US/Add-ons/Code_snippets/Timers)

#### Timers ####
1. `setTimeout`, `clearTimeout`
2. `setInterval`, `clearInterval`
3. `setImmediate`, `clearImmediate`
4. `requestAnimationFrame`, `cancelAnimationFrame`
5. Explanation
	1. `requestAnimationFrame(fn)` vs `setTimeout(fn, 0)`
		1. First one fires after all frame has flushed
		2. Second one fires asap (over 1000x per second on iPhone 5S)
	2. `setImmediate`
		1. Executed at the end of current JS execution block (before sending batched response back to native)
			1. If nested, inner `setImmediate` is executed immediately without yielding to native
6. `Promise` uses `setImmediate` as its asynchronicity primitive

#### InteractionManager ####
1. For smooth feel, avoid expensive operations during interactions and animations
	1. Limitation in React Native: Only single JS execution thread
2. Solution: `InteractionManager` is used to schedule long running work is started after interactions/animations have completed
3. Example:

		InteractionManager.runAfterInteractions(() => {
			// ...long-running sychronous task...
		});
		
4. Other scheduling alternatives:
	1. `requestAnimationFrame()`: for code that animates view over time
	2. `setImmediate`/`setTimeout`/`setInterval`: run code later (may delay animations)
	3. `runAfterInteractions`: run code later, without delaying active animations
5. Interactions:
	1. Active touch
		1. `runAfterInteractions` is delayed until all touches have ended or cancelled
6. An interaction 'handle' can be built on animation start (registering of animations)
	1. Cleared upon completion

			var handle = InteractionManager.createInteractionHandle();
			// run animation... (`runAfterInteractions` tasks are queued)
			// later, on animation completion:
			InteractionManager.clearInteractionHandle(handle);
			// queued tasks run if all handles were cleared

#### TimerMixin ####
1. Problem: Timers firing after component was unmounted
	1. Solution: `TimerMixin`
		1. If included, can replace calls to `setTimeout(fn, 500)` with `this.setTimeout(fn, 500)` (prepend `this.`)
			1. Proper cleanup will be done when component unmounts
2. Library is separate

		npm i react-timer-mixin --save
		
		import TimerMixin from 'react-timer-mixin';
		
		var Component = createReactClass({
			mixins: [TimerMixin],
			componentDidMount: function () {
				this.setTimeout(() => {
					console.log('I do not leak!');
				}, 500);
			},
		});
		
3. [there is no built-in API for mixins](https://facebook.github.io/react/blog/2015/01/27/react-v0.13.0-beta-1.html#mixins): No default ES6 support
	1. Alternative: [react-mixin](https://github.com/brigand/react-mixin)

### Debugging ###
#### Enabling Keyboard Shortcuts ####
1. React Native supports keyboard shortcuts in iOS Simulator
2. Enabling
	1. Hardware menu > keyboard > check "Connect Hardware Keyboard"

#### Accessing the In-App Developer Menu ####
1. Shake device for developer menu or select "Shake Gesture" inside Hardware menu in iOS simulator
	1. Command+D (iOS simulator) on Mac OS
	2. Command+M (Android emulator) on Mac OS
2. Android: `adb shell input keyevent 82` to open dev menu (disabled in release/production builds)

#### Reloading JavaScript ####
1. Instant reloading of JS code
	1. "Reload" from Developer Menu
	2. Command+R in iOS Simulator
	3. R twice on Android emulators

##### Automatic Reloading #####
1. Reload app automatically when code changes
	1. Select "Enable Live Reload" from Developer Menu
2. [Hot Reloading](https://facebook.github.io/react-native/blog/2016/03/24/introducing-hot-reloading.html): App keeps running as and when files are injected into JS bundle automatically
	1. Run full reload if there are issues
3. Rebuild app for changes to take effect
	1. New resources added to native app's bundle (image in `Images.xcassets` on iOS or `res/drawable` on Android
	2. Modified native code (Objective-C/Swift on iOS of Java/C++ on Android)

#### In-App Errors and Warnings ####
1. Errors are displayed inside app in dev builds

##### Errors #####
1. In-app errors displayed in full screen alert with red background inside app.
	1. The screen is RedBox
	2. Use `console.error()` to manually trigger one

##### Warnings #####
1. Warnings displayed with Yello background
	1. YellowBoxes
		1. Click on alerts to show more info or dismiss
2. `console.warn()`: to trigger `YelloBox`
3. Disable YellowBoxes using

		import {YelloBox} from 'react-native';
		YellowBox.ignoreWarnings(['Warning: ...']);
		
	1. in Xcode, it can be disabled by setting `IS_TESTING` environment variable
	2. RexBoxes and YelloBoxes Automatically disabled for release

#### Chrome Developer Tools ####
1. Select "Debug JS Remotely" from Developer Menu. This opens [http://localhost8081/debugger-ui](http://localhost8081/debugger-ui)
2. **Tools** > **Developer Tools** in Chrome Menu to open [Developer Tools](https://developer.chrome.com/devtools)
	1. command + alt + I
	2. ctrl + shift + I
3. [Pause on Caught Exceptions](http://stackoverflow.com/questions/2233339/javascript-is-there-a-way-to-get-chrome-to-break-on-all-errors/17324511#17324511)
4. [Standalone version of React Developer Tools](https://facebook.github.io/react-native/docs/debugging#react-developer-tools)

##### Debugging Using a Custom JavaScript Debugger #####
1. Set `REACT_DEBUGGER` environment variable to a command that will start custom debugger
	1. Select "Debug JS Remotely" from Developer Menu
		1. Starts debugging
2. Debugger will recieve list of all project roots separated by space

		REACT_DEBUGGER="node /path/to/launchDebugger.js --port 2345 --type ReactNative"
		
	1. Command starts debugger
		1. It must be short lived process
		2. Must not produce > 200 kB output

#### React Developer Tools ####
1. [Standalone version of React Developer Tools](https://github.com/facebook/react-devtools/tree/master/packages/react-devtools)
	1. Used to debug React component hierarchy

2. Installation
		
		npm install --save-dev react-devtools
			
		yarn add -dev react-devtools
		
3. Usage

		react-devtools
		
	1. Add the following in `scripts` section in `package.json`

			"react-devtools": "react-devtools"
			
	2. Run `npm run`
	3. Supposed to connect to simulator within few seconds

##### Integration with React Native Inspector #####
1. Open in-app developer menu and choose "Show Inspector"
	1. Any UI element can be tapped and we can see info about it
2. If `react-devtools` is running, Inspector will neter special collapsed mode (DevTools is used instead as primary UI)
3. Choose "Hide Inspector" to exit

##### Inspecting Component Instances #####
1. To inspect props and state in React Components
2. Top left corner in Chrome console must say `debuggerWorker.js` in dropdown
3. Select a React component in React DevTools (we can search by name on top search box)
	1. `$r` represents the selected element
		1. It's props, state and instance properties can be inspected

#### Performance Monitor ####
1. Select "Perf Monitor" in Developer Menu to enable performance overlay

#### Debugging in Ejected Apps ####
##### Projects with Native Code Only #####
1. Only applicable to projects built with `react-native init` or with Create React Native App which have ejected.
	1. [Ejecting](https://github.com/react-community/create-react-native-app/blob/master/EJECTING.md)

#### Accessing Console Logs ####
1. Displaying console logs

		react-native log-ios
		react-native log-android
		
2. Alternative:
	1. **Debug** > **Open System Log ...** in iOS simulator
	2. `adb logcat *:S ReactNative:V ReactNativeJS:V` in terminal while Android app is running on device or emulator
3. Consle logs appear if using Create React Native App

#### Debugging on a Device with Chrome Developer Tools ####
1. Already configured if using Create React Native App
2. Open file `RCTWebSocketExecutor.m` and change **localhost** to IP address of computer, then select "Debug JS Remotely" from Developer Menu
3. Android 5.0+: [adb commandline tool](http://developer.android.com/tools/help/adb.html) to setup port forwarding from device to computer

		adb reverse tcp:8081 tcp:8081
		
	1. Alternative: "Dev Settings" from Developer Menu, update "Debug server host for device" setting to match IP address of computer

##### Debugging with [Stetho](http://facebook.github.io/stetho/) on Android #####
1. Enabling Stetho for Debug mode
	1. In `android/app/build.gradle`, add the following in `dependencies` section

			debugCompile 'com.facebook.stetho:stetho:1.5.0'
			debugCompile 'com.facebook.stetho:stetho-okhttp3:1.5.0'
			
		1. Check [http://facebook.github.io/stetho](http://facebook.github.io/stetho/) for newer version
2. Following Java classes wrap the Stetho call

		// android/app/src/release/java/com/{yourAppName}/StethoWrapper.java
		
		public class StethoWrapper {
			public static void initialize(Context context) {
				// NO_OP
			}
			
			public static void addInterceptor() {
				// NO_OP
			}
		}
		
		// android/app/src/debug/java/com/{yourAppName}/StethoWrapper.java
		public class StethoWrapper {
			public static void initialize(Context context) {
				Stetho.initializeWithDefaults(context);
			}
			public static void addInterceptor() {
				final OKHttpClient baseClient = OkHttpClientProvider.createClient();
				OkHttpClientProvider.setOkHttpClientFactory(new OkHttpClientFactory() {
					@Override
					public baseClient.newBuilder()
						.addNetworkInterceptor(new StethoInterceptor())
						.build();
				});
			}
		}
		
3. Open `android/app/src/main/java/com/{yourAppName}/MainApplication.java

		public void onCreate() {
			super.onCreate();
			
			if (BuildConfig.DEBUG) {
				StethoWrapper.initialize(this);
				StethoWrapper.addInterceptor();
			}
			
			SoLoader.init(this, /* native exopackage */ false);
		}
		
4. Open project in Android Studio and resolve any dependency issues
	1. Hover over red lines to resolve the issues
5. Run `react-native run-android`
6. In new Chrome tab, open: `chrome://inspect`
	1. Click on 'Inspect device' item next to 'Powered by Stetho'

#### Debugging Native Code ####
1. We can launch native app from Android Studio or Xcode
	1. The tools have native debugging features (setting up breakpoints ...)

### Performance ###
1. React native can achieve 60 frames per second (as opposed to Web View) and native look and feel
	1. React native is designed to take care of performance issues
		1. Developer does not have to worry about performance optimization in general
2. Problem: Few areas miss this
3. Problem: A few areas need manual intervention
4. Solution: [troubleshoot performance issues](https://facebook.github.io/react-native/docs/performance#profiling) and [common sources of problems and their suggested solutions](https://facebook.github.io/react-native/docs/performance#common-sources-of-performance-problems)

#### What you need to know about frames ####
##### UI frame rate (main thread) #####
#### Common sources of performance problems ####
##### Running in development mode (`dev=true`) #####
##### Using `console.log` statements #####
##### `ListView` initial rendering is too slow or scroll performance is bad for large lists #####
##### JS FPS plunges when re-rendering a view that hardly changes #####
##### Dropping JS thread FPS because of doing a log of work on the JavaScript thread at the same time #####
##### Moving a view on the screen (scrolling, translating, rotating) drops UI thread FPS #####
##### Animating the size of an image drops UI thread FPS #####
##### My TouchableX view isn't very responsive #####
##### Slow navigator transitions #####
#### Profiling ####
##### Profiling Android UI Performance with `systrace` #####
###### Collecting a trace ######
###### Reading the trace ######
###### Find your process ######
###### Resolving JavaScript issues ######
###### Resolving native UI Issues ######
### Unbounding + inline requires ###
#### Loading JavaScript ####
#### Inline Requires ####
##### VeryExpensive.js #####

### Gesture Responder System ###
1. GRS manages lifecycle of gestures in the app
2. Example: Touch can go through several phases as app determines what user's intention is
	1. Is touch scrolling
	2. Is touch sliding on a widget
	3. Is touch tapping
3. The intention may change during the duration of touch
4. Multiple simultaneous touches can exist
5. Touch responder system: needed to allow components to negotiate touch interactions without additional knowledge about parent or child components

##### Best Practices #####
1. For making app feel great, every action must have the following attributes
	1. Feedback/highlighting - show user what is handling their touch, and what will happen when they release the gesture
	2. Cancel-ability- when making an action, users should be able to abord it mid-touch by dragging their finger away
2. Make users comfortable while using the app
	1. No fear of making mistakes

##### TouchableHighlight and Touchable* #####
1. `Touchable` implementation for things that should be "tappable"
	1. Uses responder system and allows configuring tap interactions declaratively
2. `TouchableHighlight` can be used for button or link on web

#### Responder Lifecycle ####
1. View can be a touch responder
	1. Implement correct negotiation methods
		1. Two methods to ask view if it wants to become responder
			1. `View.props.onStartShouldSetResponder: (evt) => true,` - Does this view want to become responder on start of a touch?
			2. `View.props.onMoveShouldSetResponder: (evt) => true,` - Called for every touch move on View when it is not responder
				1. Does this view want to "claim" touch responsiveness?
2. If View returns true and attempts to become responder, one of the following will happen
	1. `View.props.onResponderGrant: (evt) => {}` - View is now responding to touch events
		1. Time to highlight and show user what is happening
	2. `View.props.onResponderReject: (evt) => {}` - Something else is the responder right now and will not release it
3. If view is responding, the following handlers can be called
	1. `View.props.onResponderMove: (evt) => {}` - User is moving their finger
	2. `View.props.onResponderRelease: (evt) => {}` - Fired at the end of the touch, ie "touchUp"
	3. `View.props.onResponderTerminationRequest: (evt) => true` - Something else wants to become responder. Should this view release the responder? Returning true allows release
	4. `View.props.onResponderTerminate: (evt) => {}` - Responder is taken from the View. (Might be by other views after a call to `onResponderTerminationRequest`) or might be taken by OS without asking (happens with control center/ notification center on iOS)
3. `evt` - synthetic event with following form:
	1. `nativeEvent`
		1. `changedTouches` - Array of all touch events that have changed since last event
		2. `identifier` - ID of touch
		3. `locationX` - X position of touch, relative to element
		4. `locationY` - Y position of touch, relative to element
		5. `pageX` - X position of touch, relative to root element
		6. `pageY` - Y position of touch, relative to root element
		7. `target` - node id of element receiving touch event
		8. `timestamp` - Time identifier for touch, useful for velocity calculation
		9. `touches` - Array of all current touches on screen

##### Capture ShouldSet Handlers #####
1. `onStartShouldSetResponder` and `onMoveShouldSetResponder` are called with bubbling pattern
	1. Deepest node is called first
		1. Deepest component will become responder when multiple Views return true for `*ShouldSetResponder` handlers
			1. Desirable in most cases - makes sure all controls and buttons are usable
2. If parent want to ensure it becomes responder:
	1. Use capture phase
		1. Before responder system bubbles up from deepest component, it will do a capture phase, firing `on*ShouldSetResponderCapture`
			1. If parent View wants to prevent child from becoming responder on touch start, it should have `onStartShouldSetResponderCapture` handler which returns true

					View.props.onStartShouldSetResponderCapture: (evt) => true,
					View.props.onMoveShouldSetResponderCapture: (evt) => true, 

##### PanResponder #####
1. Check [PanResponder](https://facebook.github.io/react-native/docs/panresponder) 

### JavaScript Environment ###
#### JavaScript Runtime ####
1. JS code will be running in two environments for ReactNative
	1. [JavaScriptCore](http://trac.webkit.org/wiki/JavaScriptCore) in most cases used by ReactNative
		1. JS engine that powers Safari
			1. In iOS, JavaScriptCore does not use JIT due to absence of writable executable memory in iOS apps
	2. Chrome: For chrome debugging
		1. JS runs within chrome
			1. Communicates with native code via WebSockets
			2. Chrome uses [V8](https://code.google.com/p/v8/) as JS engine
2. Problems: Inconsistencies may occur
	1. Other JS engines are being considered by Facebook

#### JavaScript Syntax Transformers ####
1. Syntax transformers make writing code enjoyable
	1. We can use new JS syntax without support on all interpreters
2. ReactNative ships with [Babel JavaScript Compiler](https://babeljs.io/)
	1. [Babel Documentation](https://babeljs.io/docs/plugins/#transform-plugins)
3. [Full List of React Native's Enabled Transformations](https://github.com/facebook/react-native/blob/master/babel-preset/configs/main.js#L16)
4. ES5: Reserverd Words - `promise.catch(function() { });`
5. ES6:
	1. [Arrow Functions](http://babeljs.io/docs/learn-es2015/#arrows)
		1. `onPress = {() => this.setState({ pressed: true })}`
	2. [Block Scoping](https://babeljs.io/docs/learn-es2015/#let-const)
		1. `let greeting = 'hi';`
	3. [Call spread](http://babeljs.io/docs/learn-es2015/#default-rest-spread)
		1. `Math.max(...array);`
	4. [Classes](http://babeljs.io/docs/learn-es2015/#classes)
		1. `class C extends React.Component { render() { return <View />; } }`
	5. [Constants](https://babeljs.io/docs/learn-es2015/#let-const)
		1. `const answer = 42;`
	6. [Destructuring](http://babeljs.io/docs/learn-es2015/#destructuring)
		1. `var { isActive, style } = this.props;`
	7. [for...of](http://babeljs.io/docs/learn-es2015/#destructuring)
		1. `for (var num of [1, 2, 3]) {}`
	8. [Modules](http://babeljs.io/docs/learn-es2015/#modules)
		1. `import React, { Component } from 'react';`
	9. [Computed Properties](http://babeljs.io/docs/learn-es2015/#enhanced-object-literals)
		1. `var key = 'abc'; var obj = {[key]: 10};`
	10. [Object Concise Method](http://babeljs.io/docs/learn-es2015/#enhanced-object-literals)
		1. `var obj = { method() { return 10; } };
	11. [Object Short Notation](http://babeljs.io/docs/learn-es2015/#enhanced-object-literals)
		1. `var name = 'vjeux'; var obj = { name };`
	12. [Rest Params](https://github.com/sebmarkbage/ecmascript-rest-spread)
		1. `function(type, ...args) { }`
	13. [Template Literals](http://babeljs.io/docs/learn-es2015/#template-strings)
		
			var who = 'world'; var str = `hello ${who}`;
			
6. ES8
	1. [Function Trailing Comma](https://github.com/jeffmo/es-trailing-function-commas)
		1. `function f(a, b, c) { }`
	2. [Async Functions](https://github.com/tc39/ecmascript-asyncawait)
		1. `async function doStuffAsync() { const foo = await doOtherStuffAsync(); };`
7. Stage 3
	1. [Object Spread](https://github.com/sebmarkbage/ecmascript-rest-spread)
		1. `var extended = { ...obj, a: 10 };`
8. Specific
	1. [JSX](https://reactjs.org/docs/jsx-in-depth.html)
		1. `<View style={{color: 'red'}} />`
	2. [Flow](http://flowtype.org/)
		1. `function foo(x: ?number): string {}`

#### Polyfills ####
1. Standard functions available on all supported JS runtimes
2. Browser
	1. [console.{log, warn, error, info, trace, table, group, groupEnd}](https://developer.chrome.com/devtools/docs/console-api)
	2. [CommonJS require](https://nodejs.org/docs/latest/api/modules.html)
	3. [XMLHttpRequest, fetch](https://facebook.github.io/react-native/docs/network#content)
	4. [{set, clear}{Timeout, Interval, Immediate}, {request, cancel}AnimationFrame](https://facebook.github.io/react-native/docs/timers#content)
	5. [navigator.geolocation](https://facebook.github.io/react-native/docs/geolocation#content)
3. ES6
	1. [Object.assign](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/assign)
	2. String.prototype.{[startsWith](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/startsWith), [endsWith](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/endsWith), [repeat](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/repeat), [includes](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/includes)}
	3. [Array.from](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/from)
	4. Array.prototype.{[find](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find), [findIndex](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findIndex)}
4. ES7
	1. Array.prototype.{[includes](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/includes)}
5. ES8
	1. Object.{[entries](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/entries), [values](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/values)]}
6. Specific
	1. `__DEV__`

### Direct Manipulation ###
#### `setNativeProps` with `TouchableOpacity` ####
#### Composite Components and `setNativeProps` ####
##### Forward `setNativeProps` to Child #####
#### `setNativeProps` to clear `TextInput` Value ####
#### Avoiding Conflicts with the Render Function ####
#### `setNativeProps` & `shouldComponentUpdate` ####
#### Other Native Methods ####
##### `measure(callback)` #####
##### `measureInWindow(callback)` #####
##### `measureLayout(relativeToNativeNode, onSuccess, onFail)` #####
##### `focus()` #####
##### `blur()` #####

### Color Reference ###
#### Red-green-blue ####
#### Hue-saturation-lightness ####
#### `transparent` ####
#### Named Colors ####

### Integration with Existing Apps ###
#### iOS (Objective-C) ####
##### Key Concepts #####
##### Prerequisites #####
###### Set up Directory Structure ######
###### Install JavaScript Dependencies ######
###### Install CocoaPods ######
##### Adding React Native to Your App #####
###### Command Line Tools for Xcode ######
###### Configuring CocoaPods Dependencies ######
###### Code Integration ######
###### Test Your Integration ######
###### See the Code ######
###### Now What? ######

#### iOS (Swift) ####
##### Key Concepts #####
##### Prerequisites #####
###### Set up Directory Structure ######
###### Install JavaScript Dependencies ######
###### Install CocoaPods ######
##### Adding React Native to Your App #####
###### Command Line Tools for Xcode ######
###### Configuring CocoaPods Dependencies ######
###### Code Integration ######
###### Test Your Integration ######
###### See the Code ######
###### Now What? ######

#### Android (Java) ####
##### Key Concepts #####
##### Prerequisites #####
###### Set up Directory Structure ######
###### Install JavaScript Dependencies ######
###### Install CocoaPods ######
##### Adding React Native to Your App #####
###### Command Line Tools for Xcode ######
###### Configuring CocoaPods Dependencies ######
###### Code Integration ######
###### Test Your Integration ######
###### See the Code ######
###### Now What? ######

### Building For TV Devices ###
1. TV devices support is implemented
	1. Existing React Native apps work on Apple TV and Android TV
2. Few/No changes required in JS code

#### iOS ####
1. `RNTester` app supports Apple TV
	1. `RNTester-tvOS` build target must be used

##### Build Changes #####
1. *Native Layer*: React Native Xcode projects
	1. Apple TV targets are supported (`-tvOS`)
2. *react-native init*:
	1. This command constructs Apple TV target in Xcode project
3. *JavaScript layer*: `Platform.ios.js` has Apple TV support
	1. Check it on Apple TV running

			var Platform = require('Platform');
			var running_on_tv = Platform.isTV;
			
			// If you want to be more specific and only detect devices running tvOS
			// (but no Android TV devices) you can use:
			var running_on_apple_tv = Platform.isTVOS;

##### Code Changes #####
1. *General Support for tvOS*:
	1. `TARGET_OS_TV` define wraps Apple TV specific changes
		1. Changes to suppress APIs not supported on tvOS (web views, sliders, switches, status bar, ...)
		2. Changes to support user input from TV remote/keyboard
2. *Common Codebase*: tvOS and iOS share most Objective-C and JS code
	1. Most docs for iOS apply to tvOS
3. *Access to Touchable Controls*: Native view class for Apple TV is `RCTTVView`
	1. Additional methods exist to use tvOS focus engine
	2. `Touchable` mixin:
		1. Can detect focus changes and use existing methods to style components properly and initiate proper actions when view is selected using TV remote
			1. `TouchableHighlight` and `TouchableOpacity` work
				1. `touchableHandleActivePressIn` - executed when touchable view goes into focus
				2. `touchableHandleActivePressOut` - executed when touchable view goes out of focus
				3. `touchableHandlePress` - executed when touchable view is selected by pressing "select" button on TV remote
4. *TV remote/keyboard Input*
	1. `RCTTVRemoteHandler`: native class
		1. Sets gesture recognizers for TV remote events
		2. If TV remote event occurs, the class fires notifications picked up by `RCTTVNavigationEventEmitter` (subclass of `RCTEventEmitter`)
			1. It fires JS event
				1. It is picked up by `TVEventHandler` JS Object
					1. An instance is constructed to implement custom handling of TV remote events and listen for events
	2. Example:

			var TVEventHandler = require('TVEventHandler');
			
			class Game2048 extends React.Component {
				_tvEventHandler: any;
				
				_enableTVEventHandler() {
					this._tvEventHandler = new TVEventHandler();
					this._tvEventHandler.enable(this, function (cmp, evt) {
						if (evt && evt.eventType === 'right') {
							cmp.setState({ board: cmp.state.board.move(2) });
						} else if (evt && evt.eventType === 'up') {
							cmp.setState({ board: cmp.state.board.move(1) });
						} else if (evt && evt.eventType === 'left') {
							cmp.setState({ board: cmp.state.board.move(0) });
						} else if (evt && evt.eventType === 'playPause') {
							cmp.restartGame();
						}
					});
				}
				
				_disableTVEventHandler() {
					if (this._tvEventHandler) {
						this._tvEventHandler.disable();
						delete this._tvEventHandler;
					}
				}
				
				componentDidMount() {
					this._enableTVEventHandler();
				}
				
				componentWillUnmount() {
					this._disableTVEventHandler();
				}
			}

5. *Dev Menu Support*: On simulator cmd-D brings up developer menu
	1. On Apple TV: long press on play/pause button on remote
6. *TV Remote Animations*: `RCTTVView` native code implements Apple-recommended parallax animations to help guide eye as user navigates through views
	1. Can be disabled or adjusted with new optional view properties
7. *Back Navigation with TV Remote Menu Button*:
	1. `BackHandler` component
		1. Supports back navigation of Android and Apple TV using menu button on TV remote
8. *TabBarIOS Behavior*: `TabBarIOS` component
	1. wraps native `UITabBar` API
		1. To avoid jittery rendering of tab bar on tvOS
			1. Selected tab bar item can only be set from JS on initial render
				1. User controlls it through native code afterwards
9. *Known Issues*:
	1. [ListView Scrolling](https://github.com/facebook/react-native/issues/12793)
		1. Work around: set `removeClippedSubviews` to false in `ListView` and similar components
			1. [see this PR](https://github.com/facebook/react-native/pull/12944)

#### Android ####
##### Build Changes #####
##### Code Changes #####

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

### Native Modules Setup ###
1. Usually distributed as npm packages
	1. JS + some native code is inserted into the package(s)
		1. [npm packages guide](https://docs.npmjs.com/getting-started/publishing-npm-packages)
2. [react-native-create-library](https://github.com/frostney/react-native-create-library): third party tool to setup project structure for native module

		npm install -g react-native-create-library
		react-native-create-library MyLibrary
		
	1. `MyLibrary`: name of new module
3. `cd MyLibrary`

		npm install
		
4. Go to root folder (created using `react-native init MyApp`)
	1. Add newly created module as dependency in `package.json`
	2. run `num install` to bring it along from local npm repo
5. Goto `native-modules-ios` or `native-module-android` to add code
	1. Read README.md in `MyLibrary` folder for platform specific instructions on how to include project

## Guides (iOS) ##

### Native Modules ###

### Native UI Components ###

### Linking Libraries ###

### Running On Simulator ###

### Communication between native and React Native ###

### App Extensions ###

## Guides (Android) ##
### Native Modules ###
1. If app needs access to platform API that React Native doesn't have a module for
	1. High performance multi-threaded code
		1. Image processing
		2. Database
		3. Advanced extensions
2. React Native is designed to enable writing real native code
3. Used to build native feature that React Native does not provide yet

#### Native Module Setup ####
1. Native modules - usually distributed as npm packages
	1. They also contain Android library project
2. [Native Module Setup](https://facebook.github.io/react-native/docs/native-modules-setup) - scaffolding

##### Enable Gradle #####
1. [Gradle Daemon](https://docs.gradle.org/2.9/userguide/gradle_daemon.html) - enable it for Java code changes (speeds up builds)

#### The Toast Module ####
1. Example: [Toast](http://developer.android.com/reference/android/widget/Toast.html) - construct a toast message from JS
2. Steps:
	1. Construct a native module in Java that extends `ReactContextBaseJavaModule` class and implements functionality required by JS
		1. `ToastExample.show('Awesome', ToastExample.SHORT);` - This is the requirement
			1. It displays a short toast on screen
	2. New class `ToastModule.java` inside `android/app/src/main/java/com/your-app-name/` folder with the following content

			// ToastModule.java
			
			package com.your-app-name;
			
			import android.widget.Toast;
			
			import com.facebook.react.bridge.NativeModule;
			import com.facebook.react.bridge.ReactApplicationContext;
			import com.facebook.react.bridge.ReactContext;
			import com.facebook.react.bridge.ReactContextBaseJavaModule;
			import com.facebook.react.bridge.ReactMethod;
			
			import java.util.Map;
			import java.util.HashMap;
			
			public class ToastModule extends ReactContextBaseJavaModule {
				private static final String DURATION_SHORT_KEY = "SHORT";
				private static final String DURATION_LONG_KEY = "LONG";
				
				public ToastModule(ReactApplicationContext reactContext) {
					super(reactContext);
				}
			}

##### Argument Types #####
##### Register the Module #####
#### Beyond Toasts ####
##### Callbacks #####
##### Promises #####
##### Threading #####
##### Sending Events to JavaScript #####
##### Getting Activity Result from `startActivityForResult` #####
#### Listening to LifeCycle Events ####

### Native UI Components ###
#### ImageView Example ####
#### Creation of the `ViewManager` Subclass ####
#### Implement Method `createViewInstance` ####
#### Expose View Property Setters Using `@ReactProp` (or `@ReactPropGroup`) Annotation ####
#### Register the `ViewManager` ####
#### Implement the JavaScript Module ####
#### Events ####

### Headless JS ###
#### The JS API ####
#### The Java API ####
#### Caveats ####
#### Example Usage ####

### Generating Signed APK ###
#### Generating a Signing Key ####
#### Setting Up Gradle Variables ####
#### Adding Signing Config to Your App's Gradle Config ####
#### Generating the Release APK ####
#### Testing the Release Build of Your App ####
#### Split APKs by ABI to Reduce File Size ####
#### Enabling Proguard to Reduce the Size of the APK (Optional) ####

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
1. To know if a screen reader is currently active?
2. `AccessibilityInfo` API can be used
	1. Used to query current state of screen reader
	2. Used to register notification when screen reader state changes
3. Example:

		class ScreenReaderStatusExample extends React.Component {
			state = {
				screenReaderEnabled: false,
			};

			componentDidMount() {
				AsseccibilityInfo.addEventListener(
					'change',
					this._handleScreenReaderToggled,
				);
				AccessibilityInfo.fetch().then((isEnabled) => {
					this.setState({
						screenReaderEnabled: isEnabled,					
					});
				});
			}

			componentWillUnmount() {
				AccessibilityInfo.removeEventListener(
					'change',
					this._handleScreenReaderToggled,
				);
			}	

			_handleScreenReaderToggled = (isEnabled) => {
				this.setState({
					screenReaderEnabled: isEnabled,
				});
			};

			render() {
				return (
					<View>
						<Text>
							This screen reader is{' '}
							{this.state.screenReaderEnabled ? 'enabled' : 'disabled' }.
						</Text>
					</View>
				);
			}
		}

#### Methods ####
1. `fetch`
2. `addEventListener`
3. `setAccessibilityFocus`
4. `announceForAccessibility`
5. `removeEventListener`

#### Reference ####
##### Methods #####
###### `fetch()` ######

		static fetch()

	1. Query whethr a screen reader is currently enabled
	2. Returns a promise which resolves to boolean
		1. `true` when screen reader is enabled
		2. `false` otherwise

###### `addEventListener()` ######

		static addEventListener(eventName, handler)

1. Add an event handler. Supported events
	1. `change`: Fired when state of screen reader changes
		1. Argument to event handler: boolean
			1. `true`: when screen reader is enabled
			2. `false`: otherwise
	2. `accouncementFinished`: iOS - only event.
		1. Fired when screen reader has finished making announcement
		2. Argument to event handler: dictionary with following keys
			1. `announcement`: string announced by screen reader
			2. `success`: boolean indicating whether announcement was successfully made

###### `setAccessibilityFocus()` ######

		static setAccessibilityFocus(reactTag)

1. Set accessibility focus to a React component
2. On Android this is equivalent to: `UIManager.sendAccessibilityEvent(reactTag, UIManager.AccessibilityEventTypes.typeViewFocused);`

###### `accounceForAccessibility()` ######

		static announceForAccessibility(announcement)

1. iOS-only. Post a string to be announced by screen reader

###### `removeEventListener()` ######

		static removeEventListener(eventName, handler)

1. Remove an event handler

### ActionSheetIOS ###
#### Methods ####
1. `showActionSheetWithOptions`
2. `showShareActionSheetWithOptions`

#### `showActionSheetWithOptions()` ####

		static showActionSheetWithOptions(options, callback)

1. Display iOS action sheet. `options` must contain one or more of
	1. `options` (array of strings) - list of button titles (required)
	2. `cancelButtonIndex` (int) - index of cancel button in `options`
	3. `destructiveButtonIndex` (int) - index of destructive button in `options`
	4. `title` (string) - title to show above action sheet
	5. `message` (string) - message to show below the title
	6. `tintColor` (string) - color used for non-destructive button titles

2. Callback: Takes one parameter (zero-based index of selected item)
3. Example:

		ActionSheetIOS.showActionSheetWithOptions({
			options: ['Cancel', 'Remove'],
			destructiveButtonIndex: 1,
			cancelButtonIndex: 0,
		},
		(buttonIndex) => {
			if (buttonIndex === 1) { /* destructive action */ }
		});

#### `showShareActionSheetWithOptions()` ####

		static showShareActionSheetWithOptions(options, failureCallback, successCallback)

1. Display iOS share sheet.
2. `options` should contain one or both of `message` and `url` and can additionally have `subject` or `excludedActivityTypes`:
	1. `url` (string) - URL to share
	2. `message` (string) - message to share
	3. `subject` (string) - subject for message
	4. `excludedAcitivityTypes` (array) - activities to exclude from ActionSheet
3. If `url` points to local file or base64-encoded uri, file it points to will be loaded and shared directly
	1. Applicable for
		1. images
		2. videos
		3. pdf files
		4. ...
4. `failureCallback` takes one parameter (error object)
5. Optional property: `stack` of type `string`
6. `successCallback` takes two parameters
	1. boolean value signifying success or failure
	2. string that in case of success indicates method of sharing

### Alert ###
1. Launches alert dialogue with specified title and message
2. Optional: list of buttons
	1. Tapping button will fire `onPress` callback and dismiss alert
	2. `OK`: default button
3. Works on iOS and Android (static alerts)
	1. `AlertIOS`: Shows alert that prompts user to enter something
		1. Text is common on iOS only

#### iOS ####
1. On iOS, any number of buttons can be specified
	1. Each button can have style
	2. `default`, `cancel` or `destructive`

#### Android ####
1. At most 3 buttons
	1. Neutral
	2. Negative
	3. Positive
2. If one button: positive (OK)
3. Two buttons: (Cancel, OK)
4. Three buttons - neutral, negative, positive (Later, Cancel, OK)
5. Alerts can be dismissed by typing outside alert box
	1. Event handling: optional `options` parameter
		1. `onDismiss` - property

				{ onDismiss () => {} }

6. Disabling dismiss behavior:
	1. `options` parameter with `cancelable` property set to `false`

			{ cancelable: false }

7. Example usage:

		// Works on both iOS and Android
		Alert.alert(
			'Alert Title',
			'My Alert Msg',
			[
				{text: 'Ask me later', onPress: () => console.log('Ask me later pressed')},
				{text: 'Cancel', onPress: () => console.log('Cancel Pressed'), style: 'cancel'},
				{text: 'OK', onPress: () => console.log('OK Pressed')},
			],
			{ cancelable: false }
		)

##### Methods #####
1. `alert`

		static alert(title, message?, buttons?, options?, type?)

#### Reference ####
##### Methods #####
1. `alert()`

### AlertIOS ###
1. `AlertIOS`: Has functionality to construct iOS alert dialog with a message or construct a prompt for user input
2. Example:

		AlertIOS.alert(
			'Sync Complete',
			'All your data belong to us.'
		);

3. iOS Prompt

		AlertIOS.prompt(
			'Enter a value',
			null,
			text => console.log("You entered " + text)
		);

	1. `Alert.alert` is for cross platform support
4. Methods

		alert
		prompt

5. Type definitions

		AlertType
		AlertButtonStyle
		ButtonsArray

#### Reference ####
1. `alert()`

		static alert(title: string, [message]: string, [callbackOrButtons]: ?(() => void), ButtonsArray, [type]: alertType): [object Object]

	1. Parameters:
		1. `title`: string (type) - required field
			1. Dialog's title.
			2. null or '' will hide the title
		2. `message`: string (type) - optional
			1. Message that appears below dialog's title
		3. `callbackOrButtons`: `?(() => void), ButtonsArray` - optional
			1. It is a single argument function or
				1. Called when user taps 'OK'
			2. Array of buttons
				1. Each button should include `text` key and optional `onPress` and `style` keys
					1. `style`: one of
						1. `default`
						2. `cancel`
						3. `destructive`
		4. `type`: `AlertType` - optional
			1. Deprecated, do not use
2. Example with custom buttons:

		AlertIOS.alert(
			'Update available',
			'Keep your app up to date to enjoy the latest features',
			[
				{
					text: 'Cancel',
					onPress: () => console.log('Cancel Pressed'),
					style: 'cancel',
				},
				{
					text: 'Install',
					onPress: () => console.log('Install Pressed'),
				},
			],
		);

3. `prompt()`

		static prompt(title: string, [message]: string, [callbackOrButtons]: ?((text: string) => void), ButtonsArray, [type]: AlertType, [defaultValue]: string, [keyboardType]: string): [object Object]

	1. Construct and display a prompt to enter some text
		1. `title`: `string` - required
			1. dialog's title
		2. `message`: `string` - optional
			1. optional message that appears above text input
		3. `callbackOrButtons`: `?((text: string) => void), ButtonsArray` - optional
			1. It is either single argument function or array of buttons
				1. If function: called with prompt's value when user taps 'OK'
				2. If array of button configurations: each button should include
					1. `text` key
					2. `style` (optional)
						1. `default`
						2. `cancel`
						3. `destructive`
		4. `type`: `AlertType` - optional
			1. Configures text input
			2. Input
				1. `plain-text`
				2. `secure-text`
				3. `login-password`
		5. `defaultValue`: `string` - optional
			1. Default text in text input
		6. `keyboardType`: `string` - optional
			1. keyboard type of first text field (if exists)
				1. `default`
				2. `email-address`
				3. `numeric`
				4. `phone-pad`
				5. `ascii-capable`
				6. `numbers-and-punctuation`
				7. `url`
				8. `number-pad`
				9. `name-phone-pad`
				10. `decimal-pad`
				11. `twitter`
				12. `web-search`
	2. Example:

			AlertIOS.prompt(
				
			);

### Animated ###
1. `Animated` library is designed to make animations fluid, powerful, easy to build and maintain
	1. Deals with declarative relationships between inputs and outputs
	2. Deals with configurable transforms in between
	3. Deals with simple `start`/ `stop` methods to control time-based animation execution

#### Overview ####
##### Configuring Animations #####
##### Working with Animations #####
##### Using the Native Driver #####
##### Animatable Components #####
##### Composing Animations #####
##### Combining Animated Values #####
##### Interpolation #####
##### Handling Gestures and Other Events #####
##### Methods #####
##### Properties #####

#### Reference ####
##### Methods #####
###### `decay()` ######
###### `timing()` ######
###### `spring()` ######
###### `add()` ######
###### `subtract()` ######
##### `divide()` #####
##### `multiply()` #####
##### `module()` #####
##### `diffClamp()` #####
##### `delay()` #####
##### `sequence()` #####
##### `parallel()` #####
##### `stagger()` #####
##### `loop()` #####
##### `event()` #####
##### `forkEvent()` #####
##### `unforkEvent()` #####

#### Properties ####
##### `Value` #####
##### `ValueXY` #####
##### Interpolation #####
##### `Node` #####
##### `createAnimatedComponent` #####
##### `attackNativeEvent` #####

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