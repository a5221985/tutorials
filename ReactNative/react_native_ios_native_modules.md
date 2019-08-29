# Guides (iOS) #
## Native Modules ##
1. Why do we need to write our own native modules?
	1. Used when react-native doesn't have a platform module
	2. Used when existing Objective-C, Swift or C++ code needs to be re-used
	3. Used when high performance, multi-threaded code is needed (which is currently not existing)
		1. Image processing
		2. Database
		3. Advanced applications (scientific)
4. React native is designed to support writing real native code
	1. Enables us to have access to full power of the platform
5. Not part of usual development process
6. Pre-requisites
	1. Objective-C or Swift
	2. Core libraries
		1. Foundation
		2. UIKit

### Native Module Setup ###
1. Usually distributed as npm packages
	1. They contain Xcode library project
2. Scaffolding
	1. [Native Modules Setup](https://facebook.github.io/react-native/docs/native-modules-setup)
		1. At the top of usual JS, they will include some native code per platform
			1. [npm packages guide](https://docs.npmjs.com/getting-started/publishing-npm-packages)
		2. Using [react-native-create-library](https://github.com/frostney/react-native-create-library) - Used to set up basic structure for native module

				npm install -g react-native-create-library
				react-native-create-library MyLibrary

			1. `MyLibrary` - new module name
			2. `cd MyLibrary`
				1. `npm install` - install npm package
			3. Go to react app folder (constructed using `react-native init MyApp`)
			4. Add newly built module as a dependency in `package.json`
			5. Run `npm install` to bring it along from your local npm repository
		3. React `README.md` in `MyLibrary` directory for platform-specific instructions on how to include the project

### iOS Calendar Module Example ###
1. [iOS Calendar API](https://developer.apple.com/library/mac/documentation/DataManagement/Conceptual/EventKitProgGuide/Introduction/Introduction.html)
	1. To access iOS calendar from JS
		1. It is an Objective-C class that implements `RCTBridgeModule` protocol
			1. `RCT` - abbreviation of `ReaCT`

					// CalendarManager.h
					#import <React/RCTBridgeModule.h>

					@interface CalendarManager : NSObject <RCTBridgeModule>
					@end

				1. Class must also include `RCT_EXPORT_MODULE()` macro
					1. Takes an optional argument that specifies the name the module will be accessible as in JS code
						1. If not the name will match the Objective-C class name
							1. If Objective-C class name begins with RCT, JS module name will exclude RCT prefix

									// CalendarManager.m
									#import "CalendarManager.h"

									@implementation CalendarManager

									// To export a module named CalendarManager
									RCT_EXPORT_MODULE();

									// This would name the module AwesomeCalendarManager instead
									// RCT_EXPORT_MODULE(AwesomeCalendarManager);

									@end

				2. React Native will not expose any methods of `CalendarManager` to JS unless explicitly told to do so. This is done using `RCT_EXPORT_METHOD()` macro

						#import "CalendarManager.h"
						#import <React/RCTLog.h>

						@implementation CalendarManager
		
						RCT_EXPORT_MODULE();

						RCT_EXPORT_METHOD(addEvent:(NSString) *)name location:(NSString *)location)
						{
							RCTLogInfo(@"Pretending to construct an event %@ at %@", name, location);
						}

						@end

				3. To call the method:

						import {NativeModules} from 'react-native';
						var CalendarManager = NativeModules.CalendarManager;
						CalendarManager.addEvent('Birthday Party', '4 Privet Drive, Surrey');

					1. JS method names:
						1. Name of method exported - it is native method's name upto first `:`
							1. `RCT_REMAP_METHOD()` - used to specify JS method name
								1. Used if multiple methods have same name upto first `:` and have conflicting JS names
					2. `CalendarManager` module is instantiated on Objective-C side using `[CalendarManager new]` call
						1. Return type of bridge methods is always `void`
						2. RN bridges are asynchronous
							1. The only way to pass result to JS is using:
								1. Callbacks
								2. Events

### Argument Types ###
1. `RCT_EXPORT_METHOD` - supports standard JSON object types
	1. `NSString` - String
	2. `NSInteger`, `float`, `double`, `CGFloat`, `NSNumber` - Number
	3. `BOOL`, `NSNumber` - boolean
	4. `NSArray` - array of any types from this list
	5. `NSDictionary` - object
		1. keys - strings
		2. values - any type from this list
	6. `RCTResponseSenderBlock` - function
2. [RCTConvert](https://github.com/facebook/react-native/blob/master/React/Base/RCTConvert.h)
	1. This class's types are also supported
	2. The helper functions of this class accept JSON value and map them to Objective-C type or class
3. `CalendarManager` - In this class we can pass event date to native method
	1. JS Date objects cannot be sent across the bridge
		1. Solution: Convert the date to string or number

				RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location date:(nonnull NSNumber *)secondsSinceUnixEpoch)
				{
					NSDate *date = [RCTConvert NSDate:secondsSinceUnixEpoch];
				}

			or

				RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location date:(NSString *)ISO8601DateString)
				{
					NSDate *date = [RCTConvert NSDate:ISO8601DateString];
				}

		2. We can used automatic type conversion feature (skip manual conversion)

				RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location date:(NSDate *)date)
				{
					// Date is ready to use!
				}

			1. Use it in JS as follows

					CalendarManager.addEvent(
						'Birthday Party',
						'4 Privet Drive, Surrey',
						date.getTime(),
					); // passing date as number of milliseconds since Unix epoch

				or

					CalendarManager.addEvent(
						'Birthday Party',
						'4 Privet Drive, Surrey',
						date.toISOString(),
					); // passing date as ISO-8601 string

				1. Both get converted to native `NSDate`
					1. Bad value (`Array` say) will generate 'RedBox' error message
		3. If number of arguments to `CalendarManager.addEvent` are growing (with a few of them being optional), we can use dictionary of event attributes

				#import <React/RCTConvert.h>
			
				RCT_EXPORT_METHOD(addEvent:(NSString *)name details:(NSDictionary *)details)
				{
					NSString *location = [RCTConvert] NSString:details[@"location"]];
					NSDate *time = [RCTConvert NSDate:details[@"time"]];
					...
				}

			1. From JS

					CalendarManager.addEvent('Birthday Party', {
						location: '4 Privet Drive, Surrey',
						time: date.getTime(),
						description: '...',
					});

				1. Array and Map
					1. Objective-C does not guarantee types of values in these DSs
					2. If native module is expecting array of strings, and JS calls method with array of numbers or strings, we will get `NSArray` containing mix of `NSString` and `NSNumber`
					3. `RCTConvert` provides type collections that we can use in our method declaration such as `NSStringArray` or `UIColorArray`
						1. Developer needs to check value types by individually calling `RCTConvert` helper methods

### Callbacks ###
1. Experimental section (no best practices yet)
2. Native modules support special argument - callback
	1. Usually used to give function call result to JS

			RCT_EXPORT_METHOD(findEvents:(RCTResponseSenderBlock)callback)
			{
				NSArray *events = ...
				callback(@[NSNull null], events]);
			}

		1. `RCTResponseSenderBlock` - accepts one argument
			1. Array of parameters to pass to JS callback
				1. First param - error object (usually `null` when there is no error)
				2. Rest are results of the function

						CalendarManager.findEvents((error, events) => {
							if (error) {
								console.error(error);
							} else {
								this.setState({events: events});
							}
						});

					1. A native module should invoke it's callback exactly once (it is okay to store callback and invoke later)
						1. Usually used to wrap iOS APIs that require delegates
							1. `RCTAlertManager`
						2. If callback is never invoked, memory is leaked
						3. If both `onSuccess` and `onFail` callbacks are passed, invoke only one of them
				3. To pass error-like objects to JS, use `RCTMakeError` from `RCTUtils.h`
					1. Passes Error-shaped dictionary to JS
						1. In the future, real JS `Error` object may be generated

### Promises ###
1. Simplifies code
	1. ES2016's `async/await` syntax
	2. When last parameters of bridged native methods are `RCTPromiseResolveBlock` and `RCTPromiseRejectBlock`

### Dependency Injection ###
1. Bridge initializes `RCTBridgeModules` automatically
	1. Inject dependencies if we want to instantiate our own module instances
		1. Construct a class that implements `RCTBridgeDelegate` protocol
		2. Initialize `RCTBridge` with the delegate as argument
		3. Initialize `RCTRootView` with initialized bridge

				id<RCTBridgeDelegate> moduleInitializer = [[classThatImplementsRCTBridgeDelegate alloc] init];

				RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:moduleInitializer launchOptions:nil];

				RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge moduleName:kModuleName initialProperties:nil];

### Exporting Constants ###
1. A native module can export constants that are immediately available to JS at runtime
	1. To communicate static data that would otherwise require round-trip through the bridge

			- (NSDictionary *)constantsToExport
			{
				return @{ @"firstDayOfTheWeek": @"Monday" };
			}

		1. JS can use this value synchronously

				console.log(CalendarManager.firstDayOfTheWeek);

			1. If we change `constantsToExport` at runtime it won't effect JS environment

### Implementing `+ requiresMainQueueSetup` ###
1. If we override `- constantsToExport` then we should also implement `+ requiresMainQueueSetup` to let RN know if module needs to be initialized on main thread
	1. Or else warning
		1. In future module may be initialized on background thread unless explicitly we out out with `+ requiresMainQueueSetup`

				+ (BOOL)requiresMainQueueSetup
				{
					return YES; // only do this if your module initialization relies on calling UIKit!
				}

			1. If module does not require access to `UIKit`, respond to `+ requiresMainQueueSetup` with `NO`

### Enum Constants ###
1. Extend `RCTConvert` to use `NS_ENUM` enums as method arguments
	1. Consider the following definition

			typedef NS_ENUM(NSInteger, UIStatusBarAnimation) {
				UIStatusBarAnimationNone,
				UIStatusBarAnimationFade,
				UIStatusBarAnimationSlide,
			};

		1. Construct class extension of `RCTConvert`

				@implementation RCTConvert (StatusBarAnimation)
					RCT_ENUM_CONVERTER(UIStatusBarAnimation, (@{ @"statusBarAnimationNone" : @(UIStatusBarAnimationNone),
						@"statusBarAnimationFade" : @(UIStatusBarAnimationFade),
						@"statusBarAnimationSlide" : @(UIStatusBarAnimationSlide)}),
					UIStatusBarAnimationNone, integerValue)
				@end

			1. Define methods and export enum constants like the following:

					- (NSDictionary *)constantsToExport
					{
						return @{ @"statusBarAnimationNone", @(UIStatusBarAnimationNone),
								@"statusBarAnimationFade" : @(UIStatusBarAnimationFade),
								@"statusBarAnimationSlide" : @(UIStatusBarAnimationSlide) };
					};

					RCT_EXPORT_METHOD(updateStatusBarAnimation:(UIStatusBarAnimation)animation completion:(RCTResponseSenderBlock)callback)

				1. Enum will be automatically unwrapped using selector provided (`integerValue`) before being passed to exported method

### Sending Events to JavaScript ###
1. Native module can signal events to JS without being invoked directly
	1. Subclass `RCTEventEmitter`
	2. Implement `supportedEvents`
	3. Call `self sendEventWithName`

			// CalendarManager.h
			#import <React/RCTBridgeModule.h>
			#import <React/RCTEventEmitter.h>

			@interface CalendarManager : RCTEventEmitter <RCTBridgeModule>

			@end

			// CalendarManager.m
			#import "CalendarManager.h"

			@implementation CalendarManager
	
			RCT_EXPORT_MODULE();

			- (NSArray<NSString *> *)supportedEvents
			{
				return @[@"EventReminder"];
			}

			- (void)calendarEventReminderReceived:(NSNotification *)notification
			{
				NSString *eventName = notification.userInfo[@"name"];
				[self sendEventWithName:@"EventReminder" body:@{@"name": eventName}];
			}

			@end

		1. JS code can subscribe to the events by constructing new `NativeEventEmitter` instance around our module

				import { NativeEventEmitter, NativeModules } from 'react-native';
				const { CalendarManager } = NativeModules;

				const calendarManagerEmitter = new NativeEventEmitter(CalendarManager);

				const subscription = calendarManagerEmitter.addListener(
					'EventReminder',
					(reminder) => console.log(reminder.name)
				);
				...
				// Don't forget to unsubscribe, typically in componentWillUnmount
				subscription.remove();

			1. [RCTLocationObserver](https://github.com/facebook/react-native/blob/master/Libraries/Geolocation/RCTLocationObserver.m)

### Optimizing for Zero Listeners ###
1. Warning: If we expend resources unnecessarily by emitting an event while there are no listeners
	1. Solution: Optimize module's workload (say by unsubscribing from upstream notifications or pausing background tasks)
		1. Override the following in `RCTEventEmitter` subclass
			1. `startObserving`
			2. `stopObserving`

					@implementation CalendarManager
					{
						bool hasListeners;
					}

					// Will be called when this module's first listener is added.
					-(void)startObserving {
						hasListeners = YES;
						// Set up any upstream listeners or background tasks as necessary
					}

					// Will be called when this module's last listener is removed, or on dealloc.
					-(void)stopObserving {
						hasListeners = NO;
						// Remove upstream listeners, stop unnecessary background tasks
					}

					-(void)calendarEventReminderReceived:(NSNotification *)notification
					{
						NSString *eventName = notification.userInfo[@"name"];
						if (hasListeners) { // Only send events if anyone is listening
							[self sendEventWithName:@"EventReminder" body:@{@"name": eventName}];
						}
					}

### Exporting Swift ###
1. Swift does not have support for macros
	1. Exposing it to RN requires more setup (works relatively the same)

			// CalendarManager.swift
			
			@objc(CalendarManager)
			class CalendarManager: NSObject {
				
				@objc(addEvent:location:date:)
				func addEvent(name: String, location: String, date: NSNumber) -> void {
					// Date is ready to use!
				}

				@objc
				func constantsToExport() -> [String: Any]! {
					return ["someKey": "someValue"]
				}
			}

		1. `@objc` - modifier
			1. Class and functions are exported properly to Objective-C runtime
1. `CalendarManagerBridge.m`: Private implementation file that is used to register required info with RN bridge

		// CalendarManagerBridge.m
		#import <React/RCTBridgeModule.h>

		@interface RCT_EXTERN_MODULE(CalendarManager, NSObject)

		RCT_EXTERN_METHOD(addEvent:(NSString *)name location:(NSString *)location date:(nonnull NSNumber *)date)

		@end

	1. If we mix Swift and Objective-C

## Native UI Components ##
1. Native UI widgets
	1. Part of platform
	2. Third-party libraries
2. `ScrollView`, `TextInput` - platform components such as these are wrapped in RN but not our own components
3. Pre-requisites
	1. Familiarity with iOS programming
4. Topics
	1. Building a native UI component
		1. Implementation of a subset of existing `MapView` component available in RN library

### iOS MapView Example ###
1. Example: Adding interactive Map to the app - `MKMapView` can be used
	1. It should be made usable from JS
2. `RCTViewManager` - This is sub-classed to construct native views
	1. The subclasses are similar in function to view controllers (but are singletons - only one instance is constructed by the bridge)
	2. The subclasses expose native views to `RCTUIManager`
		1. `RCTUIManager` - delegates back to the subclasses to set and update properties of views as necessary
	3. The subclasses are typically delegates for views which send events back to JS via bridge
3. Exposing a view:
	1. Subclass `RCTViewManager` to construct a manager for our component
	2. Add `RCT_EXPORT_MODULE()` marker macro
	3. Implement `-(UIView *)view` method

			// RNTMapManager.m
			#import <MapKit/MapKit.h>

			#import <React/RCTViewManager.h>

			@interface RNTMapManager : RCTViewManager
			@end

			@implementation RNTMapManager

			RCT_EXPORT_MODULE(RNTMap)

			- (UIView *)view
			{
				return [[MKMapView alloc] init];
			}

			@end

		1. `frame` and `backgroundColor` properties must not be set on `UIView` instance exposed through `-view` method
		2. RN will overwrite values set by custom class to match JS component's layout props
			1. To have this granularity of control, wrap `UIView` instance to be styled in another `UIView` and return `UIView`
		3. `RNT` is used to prefix the class to avoid name collitions with other frameworks
			1. Apple uses 2 letter prefixes
			2. RN using `RCT`
	4. The following JS code is required to make it a usable React component

			// MapView.js

			import { requireNativeComponent } from 'react-native';

			// requireNativeComponent automatically resolves 'RNTMap' to 'RNTMapManager'
			module.exports = requireNativeComponent('RNTMap');

			// MyApp.js

			import MapView from './MapView.js';

			...

			render() {
				return <MapView style={{ flex: 1 }} />;
			}

		1. Don't forget to stretch the view (or else we'll get blank screen)

				render() {
					return <MapView style={{flex: 1}} />;
				}

			1. We cannot control from JS yet

### Properties ###
1. To make it more usable, bride over some native properties
	1. To disable zooming and specify visible region (say)

			// RNTMapManager.m
			RCT_EXPORT_VIEW_PROPERTY(zoomEnabled, BOOL)

		1. Explicitly specify type as `BOOL`
		2. RN uses `RCTConvert` under the hood to convert data types when talking over the bridge
			1. Bad values will show "RedBox" errors
	2. To disable zooming, set the property in JS

			// MyApp.js
			<MapView zoomEnabled={false} style={{flex: 1}} />

		1. To document properties (and which values they accept) of MapView component, add wrapper component and document the interface with React `propTypes`

				// MapView.js
				import PropTypes from 'prop-types';
				import React from 'react';
				import {requireNativeComponent} from 'react-native';

				class MapView extends React.Component {
					render() {
						return <RNTMap {...this.props} />;
					}
				}

				MapView.propTypes = {
					/**
					 * A Boolean value that determines whether the user may use pinch
					 * gesture to zoom in and out of the map
					 */
					zoomEnabled: propTypes.bool,
				};

				var RNTMap = requireNativeComponent('RNTMap', MapView);

				module.exports = MapView;

			1. Wrapper component
				1. `requireNativeComponent`'s second argument is changed from `null` to `MapView` wrapper component
					1. Allows infrastructure to verify `propTypes` match native props in order to reduce chances of mismatch between Objective-C and JS code

							// RNTMapManager.m
							RCT_CUSTOM_VIEW_PROPERTY(region, MKCoordinateRegion, MKMapView)
							{
								[view setRegion:json ? [RCTConvert MKCoordinateRegion:json] : defaultView.region animated:YES];
							}

						1. `MKCoordinateRegion` - type that needs a conversion function
							1. View should animate when we set region from JS
						2. `json` - raw value that has been passed from JS
						3. `view` - variable that gives access to manager's view instance
						4. `defaultView` - used to reset property back to default value if JS sends null sentinel
			2. Any conversion function can be written for view
			3. It uses existing category of RN

					// RNTMapManager.m

					#import "RCTConvert+Mapkit.m"

					// RCTConvert+MapKit.h

					#import <MapKit/MapKit.h>
					#import <React/RCTConvert.h>
					#import <CoreLocation/CoreLocation.h>
					#import <React/RCTConvert+CoreLocation.h>

					@interface RCTConvert (Mapkit)

					+ (MKCoordinateSpan)MKCoordinateSpan:(id)json;
					+ (MKCoordinateRegion)MKCoordinateRegion:(id)json;

					@end

					@implementation RCTConvert(MapKit)

					+ (MKCoordinateSpan)MKCoordinateSpan:(id)json
					{
						json = [self NSDictionary:json];
						return (MKCoordinateSpan){
							[self CLLocationDegrees:json[@"latitudeDelta"]],
							[self CLLocationDegrees:json[@"longitudeDelta"]]
						};
					}

					+ (MKCoordinateRegion)MKCoordinateRegion:(id)json
					{
						return (MKCoordinateRegion){
							[self CLLocationCoordinate2D:json],
							[self MKCoordinateSpan:json]
						};
					}

					@end

				1. The conversion functions are desinged to safely process any JSON that JS might throw at them by displaying "RedBox" errors and returning standard initialization values when missing keys or other developer errors are encountered
				2. To finish support for `region` prop, document it in `propTypes`

						// MapView.js

						MapView.propTypes = {
							/**
							 * A Boolean value that determines whether the user may use pinch
							 * gestures to zoom in and out of the map.
							 */
							zoomEnabled: PropTypes.bool,

							/**
							 * The region to be displayed by the map.
							 * ..
							 * The region is defined by the center coordinates and the span of
							 * coordinates to display.
							 */
							region: PropTypes.shape({
							/**
							 * Coordinates for the center of the map.
							 */
							latitude: PropTypes.number.isRequired,
							longitude: PropTypes.number.isRequired,
							}),
						};

						// MyApp.js

						render() {
							var region= {
								latitude: 37.48,
								longitude: -122.16,
								latitudeDelta: 0.1,
								longitudeDetla: 0.1,
							};
							return (
								<MapView
									region={region}
									zoomEnabled={false}
									style={{ flex: 1 }}
								/>
							);
						};

					1. Shape of the region is explicit
2. If some special properties should not be part of the API for the associated React component:
	1. `Switch` has custom `onChange` handler for raw native event
	2. It exposes `onValueChange` handler property

## Linking Libraries ##
## Running On Simulator ##
### Starting the Simulator ###
1. Run the following inside project directory after RN project is initialized

		react-native-run-ios

	1. The new app should run in the iOS simulator

### Specifying a Device ###
1. `--simulator` - flag used to specify a device name
	1. Default - `"iPhone X"`
	2. To run in iPhone 5s, run the following

			react-native run-ios --simulator="iPhone 5s"

		1. Name should correspond to the device name available in Xcode
		2. Run the following to check available devices

				xcrun simctl list devices

## Communication Between Native and React Native ##
1. [Integrating with Existing Apps guide](https://facebook.github.io/react-native/docs/integration-with-existing-apps) and [Native UI Components Guide](https://facebook.github.io/react-native/docs/native-components-ios) - Embedding RN in Native component and vice versa
	1. This needs communication between RN and Native components

### Introduction ###
1. RN is inspired by React - information flow is similar
	1. In React - flow in one directional
2. Hierarchy of components
	1. Each component depends on its parent and its own internal state
		1. Properties: used to pass data from parent to its children (top-down manner)
			1. If an ancestor component relies on stat of its descendant, pass down a callback to be used by descendant to update ancestor
	2. This is applicable if we build app purely within framework
		1. Properties and callbacks are sufficient
3. If mixing RN and Native components, we need cross-language mechanism to pass info between them

### Properties ###
1. Simplest way of cross-component communication
	1. Two way communication mechanism is required

#### Passing Properties from Native to React Native ####
1. To embed RN view in native component, use `RCTRootView`
	1. `RCTRootView` is a `UIView` that holds RN app
		1. It also provides an interface between native side and hosted app
2. `RCTRootView` has initializer to pass arbitrary properties down to RN app
	1. `initialProperties` - parameter - It has to be an instance of `NSDictionary`
		1. Dictionary is internally converted into a JSON object that top level JS component can reference

				NSArray *imageList = @[@"http://foo.com/bar1.png",
									   @"http://foo.com/bar2.png"];

				NSDictionary *props = @{@"images" : imageList };

				RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge moduleName:@"ImageBrowserApp" initialProperties:props];

			1. JS

					import React from 'react';
					import { AppRegistry, View, Image } from 'react-native';

					class ImageBrowserApp extends React.Component {
						renderImage(imgURI) {
							return <Image source={{uri: imgURI}} />;
						}
						render() {
							return <View>{this.props.images.map(this.renderImage)}</View>
						}
					}

					AppRegistry.registerComponent('ImageBrowserApp', () => ImageBrowserApp);

				1. `RCTRootView` provides a read-write property `appProperties`
					1. After this property is set, RN app is re-rendered with new properties
					2. Update is performed when new updated properties differ from previous ones

							NSArray *imageList = @[@"http://foo.com/bar3.png",
												   @"http://foo.com/bar4.png"];
	
							rootView.appProperties = @{@"images" : imageList};

						1. Updates must be performed on main thred (but can be performed any time)
						2. Note: Known issue - Setting `appProperties` during bridge startup, change can be lost
3. We cannot update only a few properties at a time. We need to build it in our own wrapper
	1. Note: `componentWillUpdateProps` of top level RN component will not be called after prop update.
	2. New props can be accessed in `componentDidMount`

#### Passing Properties from React Native to Native ####
1. [This article](https://facebook.github.io/react-native/docs/native-components-ios#properties) - Problem to expose properties of native components
	1. `RCT_CUSTOM_VIEW_PROPERTY` - macro that can be used in custom native component to export properties
		1. The exported properties can be used in RN as if the component was an ordinary RN component

#### Limits of Properties ####
1. Drawback of cross-language properties
	1. They do not support callbacks (used to handle bottom-up data bindings)
	2. Example: Small RN view needs to be removed from native parent view as a result of JS action
		1. This cannot be done with props (bottom-up is not possible)
	3. Alternatives
		1. [Cross-Language Callbacks](https://facebook.github.io/react-native/docs/native-modules-ios#callbacks)
			1. Not meant for passing properties
			2. Used to trigger native action from JS and handle result in JS

### Other Ways of Cross-Language Interaction (Events and Native Modules) ###
1. Sometimes properties are not enough and we need more flexibility
2. There are other communication techniques
	1. Internal communication - between JS and native layers in RN
	2. External communication - between RN and 'pure native' part of our app
3. RN enables us to perform cross-language function calls
	1. Custom native code can be executed from JS and vice-versa
		1. Depending on side we are working on, the same goal is achieved in different ways
			1. Native - Use events mechanism to schedule execution of handler function in JS
			2. RN - Call methods exported by native modules

#### Calling RN Functions from Native (events) ####
1. [Events in detail](https://facebook.github.io/react-native/docs/native-components-ios#events) - does not guarantee about execution time (event is handled in separate thread)
	1. Powerful - Allows us to change RN components without needing a reference to them
	2. Pitfalls
		1. Spaghetti-style dependencies - Events can be sent from anywhere
		2. Name collitions: Since events share namespace
			1. Cannot be detected statically (so hard to debug)
		3. Identification of RN components - If we use several instances of same RN component, to distinguish them from the perspective of our event, we may need to introduce identifiers and pass them along with events (`reactTag` - id that can be used to pass along with events)
2. `RCTViewManager` as a delegate to views - pattern used to embed native in RN
	1. Events can be sent back to JS via bridge
	2. Keeps related event calls in one place

#### Calling Native Functions from RN (native modules) ####
1. Native modules are Objective-C classes available in JS.
	1. One instance of each module (Objective-C class) is created per JS bridge
	2. The modules (classes) can export arbitrary functions and constants to React Native
		1. [Covered in detail](https://facebook.github.io/react-native/docs/native-modules-ios#content)
2. Native modules are singletons
	1. Limits the mechanism
	2. Let RN component be embedded in native view and let us say we want to update native, parent view
		1. Export a function that takes expected arguments and an id of parent native view
		2. Id can be used to retrieve a reference to parent view to update
			1. Keep a mapping from ids to native views in the module
	3. The solution is used in `RCTUIManager` (an internal RN class that manages all RN views)
3. Native modules can be used to expose existing native libraries to JS
	1. [Geolocation library](https://github.com/facebook/react-native/tree/master/Libraries/Geolocation)
		1. All native modules share the same namespace (name collisions can occur)

### Layout Computation Flow ###
1. Two layouts (RN and Native) need to be consolidated
2. Following section deals with common layout problems and addresses them

#### Layout of a Native Component Embedded in RN ####
1. [Covered in this article](https://facebook.github.io/react-native/docs/native-components-ios#styles)
	1. All native react views are subclasses of `UIView`
		1. Most style and size attributes will work like out of box

#### Layout of a RN Component Embedded in Native ####
##### React Native Content with Fixed Size #####
1. Simplest scenario
	1. RN app with fixed size - This is known to the native size
		1. Usually a full-screen RN view
			1. Or we can set `RCTRootView`'s frame for smaller root view
	2. Example: RN app 200 (logical) pixels high and width

			// SomeViewController.m

			- (void)viewDidLoad
			{
				[...]
				RCTRootView *rootView = [[RCTRootView alloc] initWidthBridge:bridge moduleName:appName initialProperties:props];
				rootView.frame = CGRectMake(0, 0, self.view.width, 200);
				[self.view addSubview:rootView];
			}

		1. With fixed size root view, we must respect its bounds on JS side
			1. Ensure RN content can be contained in fixed-size root view
				1. Use flexbox to ensure this
		2. If absolute positioning is used, React components are visible outside root view's bounds
			1. RN components are visible outside root view's bounds
				1. Example: `TouchableHighlight` will not highlight touches outside root view's bounds
		3. We can update root view's size dynamically by re-setting frame property
			1. RN will take care of content's layout

##### RN Content with Flexible Size #####
1. In some cases, we would like to render content of initially unknown size
	1. Size may be defined dynamically in JS
		1. Solutions:
			1. Wrap RN view in `ScrollView` component
				1. Guarantees content will always be available and it won't overlap with native views
			2. RN allows you to determine in JS, the size of RN app and provide it to owner of hosting `RCTRootView`
				1. Owner is responsible for re-laying out subviews and keeping the UI consinstent
					1. We can achieve this using `RCTRootView`'s flexibility modes
2. `RCTRootView` supports 4 different size flexibility modes

		// RCTRootView.h
	
		typedef NS_ENUM(NSInteger, RCTRootViewSizeFlexibility) {
			RCTRootViewSizeFlexibilityNone = 0,
			RCTRootViewSizeFlexibilityWidth,
			RCTRootViewSizeFlexibilityHeight,
			RCTRootViewSizeFlexibilityWidthAndHeight,
		};

	1. `RCTRootViewSizeFlexibilityNone` - default view
		1. Makes root view size fixed (but can be updated with `setFrame:`)
	2. Other three modes allows tracking RN content's size updates
		1. `RCTRootViewSizeFlexibilityHeight` - allows RN to measure content's height and pass info back to `RCTRootView`'s delegate
			1. Arbitrary action can be performed within delegate including setting root view's frame (so that content fits)
				1. Delegate is called when size of content has changed
					1. Warning - making dimension flexible in both JS and native leads to undefined behavior
						1. don't make top-level React component's width flexible (`flexbox`) while using `RCTRootViewSizeFlexibilityWidth` on hosting `RCTRootView`
	3. Example:

			// FlexibleSizeExampleView.m

			- (isntancetype)initWithFrame:(CGRect)frame
			{
				[...]

				_rootView = [[RCTRootView alloc] initWidthBridge:bridge moduleName:@"FlexibilityExampleApp"
				initialProperties:@{}];

				_rootView.delegate = self;
				_rootView.sizeFlexibility = RCTRootViewSizeFlexibilityHeight;
				_rootView.frame = CGRectMake(0, 0, self.frame.size.width, 0);
			}

			#pragma mark - RCTRootViewDelegate
			- (void)rootViewDidChangeIntrinsicSize:(RCTRootView *)rootView
			{
				CGRect newFrame = rootView.frame;
				newFrame.size = rootView.intrinsicContentSize;

				rootView.frame = newFrame;
			}

		1. `FlexibileSizeExampleView` - holds root view
			1. root view is created, initialized and delegate is set
				1. Delegate - handles size updates
				2. `RCTRootViewSizeFlexibilityHeight` - value of root view's size flexibility
					1. `rootViewDidChangeIntrinsicSize` will be called every time RN content changes its height
		2. Root view's width and position are set
			1. Height is set but no effect
				1. It is made RN-dependent
					1. [Full source code](https://github.com/facebook/react-native/blob/master/RNTester/RNTester/NativeExampleViews/FlexibleSizeExampleView.m)
3. Root view's size flexibility can be changed dynamically
	1. Schedules re-calculation
	2. `rootViewDidChangeIntrinsicSize` method will be called once content size is known
4. Note: RN layout calculation is performed on special thread and native UI view updates are done on main thread
	1. May cause temporary UI inconsistencies between native and RN
		1. Known issue (need to synchronize UI updates coming from different sources)
5. Note: RN does not perform layout calculations until root view becomes a subview of some other views.
	1. If we want to hide RN view until it's dimensions are known, add root view as a subview and makeit initially hidden
		1. Use `UIView`'s hidden property
	2. Change it's visibility in delegate method

## App Extensions ##
1. Lets us provide custom functionality and content outside of main app
2. [App Extension Programming Guide](https://developer.apple.com/library/content/documentation/General/Conceptual/ExtensibilityPG/index.html#//apple_ref/doc/uid/TP40014214-CH20-SW1)
	1. Explains different types of app extensions on iOS

### Memory Use in Extensions ###
1. Since these are loaded outside of regular app sandbox, they might get loaded simultaneously
2. App extensions have small memory usage limits
	1. Test the app in actual device (not simulator)
		1. Extension may not load on actual device but may load in iOS simulator
3. [Memory Use in Extensions](https://www.youtube.com/watch?v=GqXMqn6MXrM)
	1. More insight

#### Today Widget ####
1. Mem limit is 16 MB
	1. May be unreliable because the memory usage tends to be too high
		1. May lead to "Unable to Load"
2. Testing in real device may not be sufficient (Today widgets especially)
	1. Debug-configured builds are more likely to exceed memory limits
	2. Release-configure builds may not fail right away
3. Solution:
	1. [Xcode's Instruments](https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/InstrumentsUserGuide/index.html) - used to analyze real world memory usage
		1. Release-configured builds may be very close to 16 MB
			1. Example while fetching data from an API
4. [react-native-today-widget](https://github.com/matejkriz/react-native-today-widget/) - Example project that can be extended to experiment with limits of RN Today Widget

#### Other App Extensions ####
1. Other extensions may have higher memory limit than Today Widget
	1. Custom Keyboard extension (48 MB)
	2. Share Extensions (120 MB)
2. Implement the app extensions with RN (more viable)
	1. POC: [react-native-ios-share-extension](https://github.com/andrewsardone/react-native-ios-share-extension)