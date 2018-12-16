# Platform Specific Code #
1. Code reusability
2. Scenario: Separate visual components for iOS and Android
3. Ways to organize platform specific code:
	1. Using `Platform` module
	2. Using [platform-specific file extensions](https://facebook.github.io/react-native/docs/platform-specific-code#platform-specific-extensions)

4. Certain properties work only on one platform:
	1. The platform specific properties are annotated with `@platform`
		1. Badge in the website

## Platform module ##
1. React Native provides module that detects platform in which app is running.
	1. Use detection logic to implement platform specific code
		1. Used only for small parts of the component that are platform specific
		
				import {Platform, StyleSheet} from 'react-native';
				
				const styles = StyleSheet.create({
					height: Platform.OS === 'ios' ? 200 : 100,
				});
				
			1. `Platform.OS` will be `ios` when running on iOS and `android` when running on Android
		2. `Platform.select`: Given an object containing Platform.OS as keys, returns value for current platform
		
				import {Platform, StyleSheet} from 'react-native';
				
				const styles = StyleSheet.create({
					container: {
						flex: 1,
						...Platform.select({
							ios: {
								backgroundColor: 'red'
							},
							android: {
								backgroundColor: 'blue'
							}
						})
					}
				});
				
			1. `red` color on iOS
			2. `blue` color on Android
		3. The method can accept any value:
		
				const Component = Platform.select({
					ios: () => require('ComponentIOS'),
					android: () => require('ComponentAndroid'),
				})();
				
				<Component />;
				
### Detecting the android version ###
1. `Platform` module can be used to detect the android version of android platform in which the app is running

		import {Platform} from 'react-native';
		
		if (Platform.Version === 25) {
			console.log('Running on Nougat!');
		}
		
### Detecting iOS version ###
1. `Version` is a result of [UIDevice].[systemVersion] - string with current version of OS.
	1. Example: 10.3 - 10 is the major version
	
			import {Platform} from 'react-native';
			
			const majorVersionIOS = parseInt(Platform.Version, 10);
			if (majorVersionIOS <= 9) {
				console.log('Work around a change in behavior');
			}
			
## Platform Specific Extensions ##
1. React-Native will detect when a file has `.ios.` or `.android.` extension and load relevant platform file when required from other components

		BigButton.ios.js
		BigButton.android.js
		
2. Require the component as follows:

		const BigButton = require('./BigButton');
		
	1. React-Native will pick up the right file based on running platform
	
## Navigating Between Screens ##
1. Managing presentation and transition between screens is handled by navigator
2. There are different navigation components in React native
	1. [React Navigation](https://facebook.github.io/react-native/docs/navigation#react-navigation)
		1. Easy to use
			1. Stacked navigation
			2. Tabbed navigation
		2. Great configurability and flexibility when integrating with state management libraries such as [redux](https://reactnavigation.org/docs/redux-integration.html)
	2. [NavigatorIOS](https://facebook.github.io/react-native/docs/navigation#navigatorios): For iOS
		1. For native look and feel with minimal configuration
			1. It gives wrapper around `UINavigationController` class
		2. Not for android

3. For native look and feel:
	1. [native-navigation](http://airbnb.io/native-navigation/)
	2. [react-native-navigation](https://github.com/wix/react-native-navigation)
	
## React Navigation ##
1. Standalone library for setting up app screens with less code
2. Steps:
	1. Install:
	
			npm install --save react-navigation
			
	2. Build an app with home screen and profile screen
	
			import {
				createStackNavigator,
			} from 'react-navigation';
			
			const App = createStackNavigator({
				Home: { screen: HomeScreen },
				Profile: { screen: ProfileScreen }
			});
			
			export default App;
			
		1. Screen component can set navigation options
			1. header title
		2. Action creators can be used on `navigation` prop to link to other screens
		
				class HomeScreen extends React.Component {
					static navigationOption = {
						title: 'Welcome'
					};
					render() {
						const { navigate } = this.props.navigation;
						return (
							<Button
								title="Go to Jane's profile"
								onPress{() =>
									navigate('Profile', { name: 'Jane' })
								}
							/>
						);
					}
				}
				
3. Navigation routers: easy to override navigation logic, easy to integrate into redux
	1. Routers can be nested
		1. Navigation logic can be overridden for one area of app
4. Views use native components and `Animated` library
	1. 60fps animations run on native thread
	2. Customization of animations and gestures is possible
5. [React Navigation Getting Started Guide](https://reactnavigation.org/docs/getting-started.html): Complete intro to React Navigation
6. [Intro to Navigators](https://expo.io/@react-navigation/NavigationPlayground)

## NavigatorIOS ##
1. `NavigatorIOS` looks and feels like `UINavigationController`
	1. It is built on top of native component
	
			<NavigatorIOS
				initialRoute = {{
					component: MyScene,
					title: 'My Initial Scene',
					passProps: {myProp: 'foo'}
				}}
				
		1. Routes are used to represent screens with some important differences
			1. `component`: key that specifies the actual component that needs to be rendered
			2. `passProps`: props that need to be passed to the component
			3. `navigator` object is automatically passed as a prop to the component
				1. We can call `push` and `pop` as needed
		2. It leverages nattive UIKit navigation
			1. Renders navigation bar with back button and title
			
2. Example:

		import React from 'react';
		import PropTypes from 'prop-types';
		import {Button, NavigatorIOS, Text, View} from 'react-native';
		
		export default class NavigatorIOSApp extends React.Component {
			render() {
				return (
					<NavigatorIOS
						initialRoute = {{
							component: MyScene,
							title: 'My Initial Scene',
							passProps: {index: 1}
						}}
						style = {{flex: 1}}
				);
			}
		}
		
		class MyScene extends React.Component {
			static propTypes = {
				route: PropTypes.shape({
					title: PropTypes.string.isRequired
				}),
				navigator: PropTypes.object.isRequired
			};

			constructor(props, context) {
				super(props, context);
				this._onForward = this._onForward.bind(this);
			}
			
			_onForward() {
				let nextIndex = ++this.props.index;
				this.props.navigator.push({
					component: MyScene,
					title: 'Scene' + nextIndex,
					passProps: {index: nextIndex}
				})
			}
			
			render() {
				return (
					<View>
						<Text>Current Scene: {this.props.title}</Text>
						<Button
							onPress={this._onForward}
							title="Tap me to load the next scene"
					</View>
				);
			}
		}
		
	1. [Reference docs](https://facebook.github.io/react-native/docs/navigatorios)
				
## Images ##

### Static Image Resources ###
1. Unified way of managing images and other media assets in iOS and Android apps.
	1. Place static image in source code tree
	2. Reference it:
		
			<Image source={require('./my-icon.png')} />
			
2. Image name is resolved the same way JS modules are resolved
	1. Packager will look for my-icon.png in same folder as component that requires it.
		1. `my-icon.ios.png` will be picked for iOS
		2. `my-icon.android.png` will be picked for Android
		3. `xxx@2x.png` and `xxx@3x.png`: Suffixes provide images for different screen densities.
		
				.
				|- button.js
				|- img
					|- check@2x.png
					|- check@3x.png
					
			1. `button.js`:
			
					<Image source={require('./img/check.png')} />
					
				1. Packages bundles and serves image corresponding to device's screen density
					1. `check@2x.png` used on iPhone 7
					2. `check@3x.png` used on iPhone 7 Plus or Nexus 5
					3. If no image matches screen option, closest best match is selected
3. On Windows: May need to restart packager if we add new images to the project
4. Benefits:
	1. Same system on iOS and Android
	2. Images live in same folder as JS code. Components are self contianed
	3. No global namespace, i.e you don't have to worry about name collisions.
	4. Only the images that are actually used will be packaged into the app.
	5. Adding and changing images doesn't require app recompilation, just refresh the simulator
	6. Packager knows image dimensions, no need to duplicate it in code
	7. Images can be distributed via npm packages
5. `require` should have the name statically for it to work

		// GOOD
		<Image source={require('/.my-icon.png')} />;
		
		// BAD
		var icon = this.props.active ? 'my-icon-active' : 'my-icon-inactive';
		<Image source={require('./' + icon + '.png')} />;
		
		// GOOD
		var icon = this.props.active ? require('./my-icon-active.png') : require('./my-icon-inactive.png');
		<Image source={icon} />
		
	1. size (width, height) are included
	2. For scaling the image dynamically (i.e. via flex) then set manually `{ width: undefined, height: undefined }`
		

### Static Non-Image Resources ###
1. `require` can be used to include
	1. audio
	2. video
	3. document files
2. File types supported:
	1. `.mp3`
	2. `.wav`
	3. `.mp4`
	4. `.mov`
	5. `.html`
	6. `.pdf`
	7. [full list](https://github.com/facebook/react-native/blob/master/local-cli/util/Config.js#L68)
3. Other files can be added using packager config file
	1. [packager config file](https://github.com/facebook/metro/blob/master/packages/metro/src/defaults.js#L14-L44)
		1. Caveat: Videos must use absolute positioning instead of `flexGrow` (size info is not passed for non-image assets)
			1. Does not apply for videos because they are linked directly into Xcode or Assets folder for Android

### Images From Hybrid App's Resources ###
1. Hybrid apps: Some UIs in React Native, some UIs in platform code
	1. Can use images already bundled into app
		1. For images in Xcode asset catalogs or in Android drawable folder:
		
				<Image source={{uri: 'app_icon'}} style={{width: 40, height: 40}} />
				
			1. For images in Android assets folder, use `asset:/` scheme:
			
					<Image source={{uri: 'asset:/app_icon.png'}} style={{width: 40, height: 40}} />
					
	2. Caveat: No safety checks, we have ensure images are available
		1. Image dimensions must be specified
		

### Network Images ###
1. If images are not available at compile time
2. If images need to be loaded dynamically to keep binary size down
3. We need to manually specify dimensions of the image
	1. Use https for [App Transport Security](https://facebook.github.io/react-native/docs/running-on-device#app-transport-security) requirements of iOS
4. Example:

		// GOOD
		<Image source={{uri: 'https://facebook.github.io/react/logo-og.png'}} style={{width: 400, height: 400}} />
		
		// BAD
		<Image source={{uri: 'https://facebook.github.io/react/logo-og.png'}} />

#### Network Requests for Images ####
1. Specifying HTTP-Verb, Headers and Body with request:

		<image
			source={{
				uri: 'https://facebook.github.io/react/logo-og.png',
				method: 'POST',
				headers: {
					Pragma: 'no-cache'
				},
				body: 'Your Body goes here'
			}}
			style = {{width: 400, height: 400}}
		/>

### URi Data Images ###
1. If we are getting encoded image data from REST API call:
	1. Use `'data:'` uri scheme to use these images.
	2. Manually specify dimensions of the image
2. Note: This is for small and dynamic images only (icons in a list from a DB)

		// include at least width and height!
		<Image
			style= {{
				width: 51,
				height: 51,
				resizeMode: Image.resizeMode.contain
			}}
			source = {{
				uri: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADMAAAAzCAYAAAA6oTAqAAAAEXRFWHRTb2Z0d2FyZQBwbmdjcnVzaEB1SfMAAABQSURBVGje7dSxCQBACARB+2/ab8BEeQNhFi6WSYzYLYudDQYGBgYGBgYGBgYGBgYGBgZmcvDqYGBgmhivGQYGBgYGBgYGBgYGBgYGBgbmQw+P/eMrC5UTVAAAAABJRU5ErkJggg=='
			}}
		/>

#### Cache Control (iOS Only) ####
1. If we want to display an image that is already in local cache
	1. Low resolution placeholder until a higher resolution is available
	2. To display an outdated image to save bandwidth
2. `cache` source property: used to control how network layer interacts with cache
	1. `default`: use native platform's default strategy
	2. `reload`: Data from URL will be loaded from originating source
		1. Cache data should not be used to satisfy URL load request
	3. `force-cache`: Existing cached data should be used to satisfy request (no regard for it's age or expiration date)
		1. If no data in cache, data is loaded from originating source.
	4. `only-if-cached`: Existing cache data will be used to satisfy request. If no data in cache, no attempt is made to load the data from originating source (load has failed)
3. Example:

		<Image
			source = {{
				uri: 'https://facebook.github.io/react/logo-og.png',
				cache: 'only-if-cached`
			}}
			style = {{width: 400, height: 400}}
		/>
	
### Local Filesystem Images ###
1. [CameraRoll](https://facebook.github.io/react-native/docs/cameraroll): Example for using local resources that are outside of `Images.xcassets`

#### Best Camera Roll Image ####
1. iOS saves multiple sizes for same image in Camera Roll
	1. Pick the one as close as possible for performance reasons
		1. Avoid using 3268x2448 image as source for 200x200 thumbnail
			1. If there is exact match, React Native will pick that
			2. If there is no exact match, 50% bigger image is picked to avoid blur when resizing from close size.
2. This is all automated

### Why Not Automatically Size Everything? ###
1. Scenario: In browser, if size is not given, it renders a 0x0 element and then downloads the image and then renders image based on correct size.
	1. Issue: UI is going to jump all around as images load (very bad user experience)
2. React Native does not implement this.
	1. Consequences: More work for developer to know dimensions (or aspect ratio) of remote image in advance (better user experience according to facebook team)
3. Static images loaded from app bundle via `require('./my-icon.png')` can be automatically sized (dimensions are available at time of mounting)
	1. Example:
	
			{"__packager_asset":true,"uri":"my-icon.png","width":591,"height":573}
	
### Source as an object ###
1. `source` (not `src`) does not take string but object with `uri` attribute

		<Image source={{uri: 'something.jpg'}} />
		
2. It allows attaching metadata to object
	1. Example: adding actual location, size (this may change in future).
	2. If sprites need to be supported in the future
	
			{uri: ..., crop: {left: 10, top: 50, width: 20, height: 40}}
			
		1. Transparently supports spriting on existing call sites
3. On user's side: lets us annotate the object with useful attributes such as dimension of image (to compute size it's going to be displayed in)
	1. We can use it as datastructure to store more information about the image (we are free to do this)

### Background Image via Nesting ###
1. `background-image`: from web: Handled using `<ImageBackground>` component (has same props as `<Image>`)
	1. We can add children to it (layered)
2. Caveat: It is simple and it may not be useful in certain scenarios
	1. [source code](https://github.com/facebook/react-native/blob/master/Libraries/Image/ImageBackground.js)
	2. Custom component can be created when needed
3. Example:

		return (
			<ImageBackground source = {...} style = {{width: '100%', height: '100%'}}>
				<Text>Inside</Text>
			</ImageBackground>
		);
		
	1. Width and height must be specified

### iOS Border Radius Styles ###
1. iOS image component ignores the following:
	1. `borderTopLeftRadius`
	2. `borderTopRightRadius`
	3. `borderBottomLeftRadius`
	4. `borderBottomRightRadius`

### Off-thread Decoding ###
1. Image decoding can take more time than frame-worth
2. Image decoding is done in a different thread
	1. Need to handle the case when image is not downloaded yet (displaying placeholder does not require any code change)
	
## Animations ##
1. For great user experience
2. Stationary objects must overcome inertia as they start moving
3. Objects in motion have momentum and rarely come to a stop immediately
4. Animations allow us to convey physically believable motion in the display
5. Two complementary animation systems:
	1. `Animated`: for granular and interactive control of specific values
	2. `LayoutAnimation`: for animated global layout transactions

### `Animated` API ###
1. `Animated` API is used to easily and concisely express wide variety of interesting animation and interaction patterns in performant way.
	1. Based on declarative relationships between inputs and outputs with configurable transforms in between
	2. Simple `start`/`stop` methods to control time based animation execution
2. `Animated` exports four animatable component types: `View`, `Text`, `Image`, `ScrollView`. `Animated.createAnimatedComponent()` (for own components)
	1. Example: Container view that fades when it is mounted may look like this:
	
			import React from 'react';
			import { Animated, Text, View } from 'react-native';
			
			class FadeInView extends React.Component {
				state = {
					fadeAnim: new Animated.Value(0), // Initial value for opacity: 0
				}
					
				componentDidMount() {
					Animated.timing(			// Animate over time
						this.state.fadeAnim,	// The animated value to drive
						{
							toValue: 1,			// Animate to opacity: 1 (opaque)
							duration: 10000,	// Make it take a while
						}
					).start();
				}
					
				render() {
					let { fadeAnim } = this.state;
						
					return (
						<Animated.View			// Special animatable View
							style = {{
								...this.props.style,
								opacity: fadeAnim
							}}
						>
							{this.props.children}
						</Animated.View>
					);
				}
			}
			
			// You can then use your `FadeInView` in place of a `View` in your components:
			export default class App extends React.Component {
				render() {
					return (
						<View style={{flex: 1, alignItems: 'center', justifyContent: 'center'}}>
							<FadeInView style={{width: 250, height: 50, backgroundColor: 'powderblue'}}>
								<Text style={{fontSize: 28, textAlign: 'center', margin: 10}}>Fading in</Text>
							</FadeInView>
						</View>
					);
				}
			}
			
		1. `FadeInView` constructor: new `Animated.Value` called `fadeAnim` is initialized as part of `state`.
		2. Opacity property on `View` is mapped to the animated value
			1. Behind the scenes, numeric value is extracted and used to set opacity
		3. When component mounts: opacity is set to 0. An easing animation is started on `fadeAnim` animated value (updates all of its dependent mappings - opacity in this case) on each frame as value animates to final value of 1.
			1. This is done in an optimized way (better than calling `setState` and re-rendering)
		4. Further opitmization: serialize configuration and run animation on high-priority thread

#### Configuring animations ####
1. Heavily configurable
	1. Custom and pre-defined easing functions
	2. Delays
	3. Durations
	4. Decay factors
	5. Spring constants
	6. ...
2. `Animated` provides several animation types
	1. `Animated.timing()` is most common
		1. Used to animate a value over time using one of various predefined easing functions
			1. Custom function can also be used
		2. Easing function: Used to convey gradual acceleration and deceleration of objects
		3. `easeInOut` curve is default for `timing()`
			1. gradual acceleration to full speed
			2. conclusion by gradually decelerating to a stop
		4. `easing`: used to specify different easing function
		5. `duration`: custom duration
		6. `delay`: delay before animation starts
3. Example: 2 second long animation of an object that slightly backs up before moving to its final position:

		Animated.timing(this.state.xPosition, {
			toValue: 100,
			easing: Easing.back(),
			duration: 2000
		}).start();

4. [Configuration animations](https://facebook.github.io/react-native/docs/animated#configuring-animations): All config parameters supported by built-in animations

#### Composing animations ####
1. Animations can be combined and played in sequence or in parallel
	1. Sequential animations play immediately after previous animation has finished (or can start after a specified delay)
2. `Animated` API provides several methods (`sequence()`, `delay()`)
	1. Each takes an array of animations to execute and automatically calls `start()`/`stop()`
3. Example:

		Animated.sequence([
			// decay, then spring to start and twirl
			Animated.decay(position, {
			
			}),
			Animated.parallel([
				// after decay, in parallel:
				Animated.spring(position, {
					toValue: {x: 0, y: 0}, // return to start
				}),
				Animated.timing(twirl, {
					// and twirl
					toValue: 360
				})
			])
		]).start(); // start the sequence group
		
	1. If one animation is stopped, then all the animations in the group are also stopped.
		1. `Animated.parallel` has `stopTogether` option which when set to `false` disables it.
4. [Full List of Composition Methods](https://facebook.github.io/react-native/docs/animated#composing-animations)

#### Combining animated values ####
1. [Combine two animated values](https://facebook.github.io/react-native/docs/animated#combining-animated-values): Using addition, multiplication, division, modulo to make new animated values
	1. Invertion of one value by another
2. Example:

		const a = new Animated.Value(1);
		const b = Animated.divide(1, a);
		
		Animated.spring(a, {
			toValue: 2
		}).start();

#### Interpolation ####
1. A property can be run through interpolation first.
	1. Interpolation maps input ranges to output ranges
		1. Typically linear interpolation
		2. Using easing functions
	2. By default it will extrapolate curve beyond ranges given (we can also clamp the output)
2. Example: 0-1 convertion to 0-100

		value.interpolate({
			inputRange: [0, 1],
			outputRange: [0, 100]
		});
		
3. Example: `Animated.Value` going from 0 to 1, but animate the position from 150px to 0px and opacity from 0 to 1.

		style = {{
			opacity: this.state.fadeAnim, // Binds directly
			transform: [{
				translateY: this.state.fadeAnim.interpolate({
					inputRange: [0, 1],
					outputRange: [150, 0] // 0 : 150, 0.5 : 75, 1 : 0
				})
			}]
		}}
		
	1. `interpolate()` supports multiple range segments
		1. For dead zones and other handy tricks
			1. Example: Negative relationship at -300 that goes from 0 at -100, then back up to 1 at 0, and then back down to zero at 100 followed by a dead-zone that remains at 0 for everything beyond that
			
					value.interpolate({
						inputRange: [-300, -100, 0, 100, 101],
						outputRange: [300, 0, 1, 0, 0]
					});
					
				1. Output:
					1. -400 -> 450
					2. -300 -> 300
					3. -200 -> 150
					4. -100 -> 0
					5. -50 -> 0.5
					6. 0 -> 1
					7. 50 -> 0.5
					8. 100 -> 0
					9. 101 -> 0
					10. 200 -> 0
				
		2. mapping to strings is possible (for animating colors, values with units)
		
				value.interpolate({
					inputRange: [0, 360],
					outputRange: ['0deg', '360deg']
				});
				
		3. `interpolate` supports arbitrary easing functions
			1. Many are implemented in `Easing` module
		4. `interpolate` has configurable behavior:
			1. Extrapolating `outputRange`
				1. Set extrapolation:
					1. `extrapolate`
					2. `extrapolateLeft`
					3. `extrapolateRight`
				2. `extend`: default value
				3. `clamp`: used to prevent output value from exceeding `outputRange`

#### Tracking dynamic values ####
1. Set `toValue` of animation to another animated value instead of plain number
	1. Example: "Chat Heads" on Messenger on Android can be implemented with `spring()` pinned on another animated value
	2. `timing()` and `duration` of 0 for rigid tracking
	3 Using interpolations:
	
			Animated.spring(follower, {toValue: leader}).start();
			Animated.timing(opacity, {
				toValue: pan.x.interpolate({
					inputRange: [0, 300],
					outputRange: [1, 0]
				})
			}).start();
			
		1. `leader` and `follower` implemented using `Animated.ValueXY()`.
			1. `ValueXY` is handy in dealing with 2D interactions
				1. panning
				2. dragging
				3. It is a wrapper containing two `Animated.Value` instances and some helper functions that call through to them
					1. Replacement for `Value` in many cases
				4. Used to track both x and y value
	
#### Tracking gestures ####
1. Gestures: panning, scrolling, ... can be mapped directly to animated values using `Animated.event`
	1. Done with a structured map syntax so that values can be extracted from complex event objects
	2. First level, array to allow mapping across multiple args
		1. Contains nested objects
2. Example: horizontal scrolling gestures:
	1. map `event.nativeEvent.contentOffset.x` to `scrollX`
	
			onScroll = {Animated.event(
				// scrollX = e.nativeEvent.contentOffset.x
				[{ nativeEvent: {
					contentOffset: {
						x: scrollX
					}	
				}]
			)}
			
		1. `PanResponder`:
			1. Use following to extract x and y positions from `gestureState.dx` and `gestureState.dy`
				
					onPanResponderMove = {Animated.event(
						[null, // ignore the native event
						// extract dx and dy from gestureState
						// like 'pan.x = gestureState.dx, pan.y = gestureState.dy'
						{dx: pan.x, dy: pan.y}
					])}

#### Responding to the current animation value ####
1. While animating, there is no obvious way to read the current value
	1. Known only in native runtime due to optimizations
2. To run JS in response to current value,
	1. `spring.stopAnimation(callback)`: stops animation and invokes `callback` with final value. For making gesture transitions
	2. `spring.addListener(callback): invokes callback asynchronously while animation is running, providing recent value
		1. for triggering state changes (snapping a bobble to new option as user drags it closer)
			1. Larger state changes are less sensitive to a few frames of lag compared to continuous gestures like panning which need to run at 60 fps
3. `Animated` designed to be serializable (for high performance independent of normal JS event loop)
	1. Tricker to do something compared to a fully synchronous system
	2. `Animated.Value.addListener`: a way to work around the limitations
		1. Use sparingly to avoid performance implications

#### Using the native driver ####
1. 

##### Caveats #####

#### Bear in mind ####

#### Additional examples ####

### `LayoutAnimation` API ###

### Additional notes ###

#### `requestAnimationFrame` ####

#### `setNativeProps` ####