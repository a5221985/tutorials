# Mobile Application Architecture: React Native with Redux #

## Introduction ##
1. UI (View Layer) constitutes only a part of the app
2. Data (Model Layer) constitutes the remaining part of the app
	1. Fetches data from web servers
	2. Persists data
	3. Manages data updates to and from view layer
3. React Native: Popular UI library for mobile app development
	1. Does not have guidelines or defined patterns for managing data within an application
	2. Can be used with any framework or library
4. Flux: An architecture like MVC
	1. Provides design pattern that must be implemented by an app or library developer
	2. Unidirectional data flow: Central theme of Flux
	3. Reduction of shared mutable state
	4. Redux: Implementation of Flux architecture

## Mobile Application Architecture ##

	![redux-diagram](redux-diagram.png)
	
1. Key components, relationship among them, properties of both
2. React Native components handles app's view layer
3. Redux handles: data layer, model layer
4. Native modules: small part but important
	1. Written in native platforms (iOS/Android)
		1. Used for functionalities not available in react native

## View Layer ##
1. Has user interface and business logic of the app
2. Screen transitions are handled with navigator and container components

### Container Components ###
1. Smart components that manage flow of data to other components (presentational components)
2. Responsible for connecting to store to pass information to their child components and provide actions and callbacks for children
3. Containers should be the only components referenced in navigator routes
4. Containers should not have rendering of view
	1. It should only have composition of presentational components

### Presentational Components ###
1. Pure UI components
	1. They are concerned only in rendering views
		1. They internally use React Native UI components (TouchableOpacity, Button, ListView, Text, TextInput, Image, Animations, etc) + third party components
2. Responsible for encapsulating following into isolated components which can be re-used at multiple places in the app
	1. View creation
	2. Style
	3. Gestures
	4. Animations
3. View layer will have a collection of reusable presentation components (accelerates development of app)
4. Contained within container components
	1. Interaction is with callbacks
5. Each presentational component has its own state and styles (design principle)
	1. Customized based on properties it recieves from its parent container component
6. Certain styling properties are common across all presentational components (fonts, colors, date formate, ...)
	1. Part of common styles js files (shared by all presentational components)
7. View layer has a collection of reusable presentational components (accelerates development of app features and screens)

### Navigators ###
1. Container components handle screen transitions withing app
	1. Combination of drawer navigator, stack navigator ... must be used to achieve desired app navigation

### Common ###
1. some codes, colors, fonts, ... will be common and shared across all components.
2. They fall into below categories:
	1. Utilities:
		1. utility folder contains individual utility JS files.
			1. Files are based on group of utility functions
				1. DateUtility
				2. NetworkRequestUtility
				3. ...
			2. file contains individual function exports for each function under respective utility group
		2. Common utility files in mobile apps (more can be identified with detailed design)
			1. DateUtility: includes functions for common date formats
			2. NetworkRequestUtility: Includes common networking functions (e.g. common headers, URLs), common request body parts for building network requests
			3. NetworkResponseUtility: Includes common functions for network response parsing and filtering (similar to NetworkRequestUtility)
			4. ...
	2. Common Style Properties (Colors, Fonts, etc.):
		1. Rule of thumb - re-use components and not styles
			1. Each component will have its own styles
				1. Values of styles can be common for colors, fonts, border readius, ...
					1. Common values are kept in `CommonStyleValues.js`
						1. It has export statements for each of the values

## Redux Layer ##
1. It is data or model layer of the application

### Actions ###
1. A JS object that has `type` and optionally a `payload` data
	1. It is built by the component (Ideally by container component) - As a result of user interaction
2. Type is a constant string - reflects interaction's intent
	1. It is sufficient for reducers to deduce the effect on app state

### Reducers ###
1. It is a pure function that takes previous state and an action as input and returns the new state.
2. All app state is contained in a single store that is a large JS object
	1. Individual reducer's responsiblity is to manage smaller parts of the large app state object
	2. We can modularize the reducers to organize them into separate files and naming each reducer to correspond to key for the part of the state object it is managing

### Store ###
1. App app state is contained in a single store (single large JS object)
2. It is large data structure of key value pairs
3. Keys are used by view components to subscribe to changes to Redux store app state which is of interest to them
	1. When there is an update to app state, render cycle of respective components is triggered
4. App state is kept in dynamic storage (heap/ram) of mobile device
	1. If a user comes back to a screen already rendered, respective screen will be quickly loaded with data held in memory
		1. Dynamic data chaching achieved inherently with Redux store

### Redux-Saga (Middleware) ###
1. Redux is optimized for synchronous workflow
	1. Actions are dispatched synchronously
	2. View layer is updated accordingly
2. Exceptions: Certain operations are not done synchronously (fetching data from a server is done asynchronously)
	1. For this Redux provides a middleware
		1. Middleware is injected between dispatching of an action and its arrival at the reducer
3. Redux-Saga: most popular middleware to handle asynchronous operations in Redux
	1. It is like a separate thread in the app that's responsible for managing asynchronous operations
		1. This thread can be started, paused, and canceled from main application with normal Redux actions
	2. It has access to full Redux app state store
	3. It can dispatch redux actions
	4. Uses ES6 feature called Generators to make asynchronous flows easy to read, write, and test (they look like standard synchronous JS codes)
		
### Native Code Layer ###
1. Native modules consist of code written in Native platforms (iOS/Android) for functionalities not possible in React Native
2. It must be very thin layer (10-20%)
	1. If more, then consider app development platform choice

## Key Architecture Goals ##
1. Goals met my architecture

### Reusability ###
1. Reusability: Capability for components and subsystems to be suitable for use in other apps and in other scenarios
	1. Minimizes duplication of components and implementation time
2. To achieve maximum re-usability, architecture is built on React Native framework.
	1. Not only code but engineering skill set is reused
		1. It is based on "learn once, work anywhere" - same set of engineers are able to build apps for both platforms without the need to learn different set of technologies for each platform
			1. Quicker development cycle
			2. Reduced time-to-market
	2. Separation of container and presentational components:
		1. Enables development of reusable presentational components (can be used in multiple places in the app and also in other apps)

### Extensibility ###
1. Extensibility: Ability of a system to allow and accept significant extension of its capabilities without majorly re-writing code or making changes to basic architecture
2. To achieve extensibility in system:
	1. Redux layer is integrated to handle model layer
		1. Complete separation of model and presentation layers
			1. each can grow independently
		2. Helps maintain the overall complexity of the app
	2. Inherent capability of React and Redux design:
		1. React: system can be extended by adding plug-n-play components (as capability of system increases)
		2. Redux: allows us to add new actions and reducers (without code rewrites)

## Conclusion ##
1. Redux: Well suited, well tested and proven design
	1. Provides baseline infrastructure to build upon
	2. For iOS and Android mobile app developers who are accustomed to think in MVC or MVP design perspective, the architecture eases transition from Native development to cross-platform development