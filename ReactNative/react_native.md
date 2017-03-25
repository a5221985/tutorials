# React Native #
## Dive Right In! ##
### Introduction - Course Roadmap ###
1. Trello:
	1. Install dependencies per operating system
	2. Install ESLint depending on code editor
	3. Generate a React Native project
	4. Get coding.
	5. First App
		1. Purpose of React Native
		2. Components
		3. State
		4. Props

### Roadmap to the First App ###
1. Dependencies:
	1. Depends on OS
	2. iOS and Android on Mac
2. *ESLint:
	1. For automatically catching errors in JS
	2. Installation depends on Editor

### Official Course Github Repo ###
1. [Official Course Github Repo](https://github.com/StephenGrider/ReactNativeReduxCasts)

## Got OSX? Go Here ##
### OSX Installation ###
1. Open Getting Started of React Native.
2. Installation:
	1. XCode (latest version): IDE, to build and install on mobile
		1. App store > search for xcode
		2. Open XCode	
		3. Click Install
	2. HomeBrew: Dependency management program
	3. Node/NPM: Node runs Javascript outside browser. NPM is used for installing and managing dependencies.
	4. Watchman: Watches files on hard drive and waits for them to change
		1. updates mobile app when files change
	5. RN CLI: To generate new React Native projects. Run projects in iOS or android simulator

### More on OSX Installation ###
1. HomeBrew: brew.sh
	1. Copy the link and execute in commandline
2. Node: brew install node
	1. `node -v` (Atleast v4.5)
3. watchman: `brew install watchman`
	1. `sudo chown -R "$USER":admin /usr/local`
	2. `sudo chown -R "$USER":admin /Library/Caches/Homebrew` (Optional)
	3. `sudo chown -R "$USER":admin /Users/am/Library`
4. React Native: `npm install -g react-native-cli`
5. New Project:
	1. `mkdir -p ReactNative2Workspace/prod`
	2. `cd ReactNative2Workspace/prod`
	3. `react-native init albums` **(M)**
		1. Prerequsite: Install yarn to increase speed
			
				brew update
				brew install yarn
				yarn --version

### Running in the Simulator ###
1. `cd albums`
2. `react-native run-ios`
3. Click on **albums** in iOS emulator
4. Start Android Studio and Open Emulator
5. Set the following in `~/.bash_profile`

		export ANDROID_HOME=/Users/am/Library/Android/sdk
		export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/patfrom-tools:$PATH

6. Run `source ~/.bash_profile`
7. `react-native run-android`

## Got Windows? Go Here ##
### Windows Setup of React Native ###
### Android Studio and React Native CLI Installation ###
### Emulator Creation and System Variables ###

## [Optional] ESLint Setup ##
### ESLint Setup and Overview ###
1. Detects and shows errors in code editor
2. Downside:
	1. Setup
		1. Editor specific setup
			1. Atom: Plugin - Linter (shows errors on screen)
				1. We can plugin different linters
					1. ESLint (parses JS and generates error messages)
		2. Project specific setup
			1. Configure ESLint and Rules per project basis
				1. Config: Contains rules (Since ESLint does not have any rules)
					1. We can use preset configurations

### ESLint Setup with Atom ###
1. Open project albums > index.ios.js
2. Atom > Preferences
3. Install
4. Search for `linter-eslint`
5. Install
6. Install `linter`
7. Install Rules
	1. Goto project albums
	2. `npm install --save-dev eslint-config-rallycoding`
8. Connect Atom to rules
	1. New file `.eslintrc`
		
			{
				"extends": "rallycoding"
			}

		1. Finds installed dependency
9. Reopen `index.ios.js`
	1. If you delete something, ESLint errors show up

### ESLint Setup with Sublime Text 3 ###
1. Install 'eslint' globally with NPM
	1. `npm install -g eslint` - command line tool
2. Install Package Control (package manager for sublime text 3)
	1. [packagecontrol.io/installation](packagecontrol.io/installation)
	2. Copy text
	3. Paste in View > Show console -> hit enter
3. Install a config with npm
	1. Goto project albums
	2. `npm install --save-dev eslint-config-rallycoding`
4. Add 'linter' to sublime text
	1. cmd + shift + p (command pallete)
	2. Enter install
		1. Click on Install package section
	3. Search for sublimelinter -> Click to install
5. Add 'eslint' to sublime text
	1. cmd + shift + p (command pallete)
	2. Enter install
		1. Click on Install package section
	3. Search for sublimelinter-contrib-eslint
		1. Click to install
6. Add config file to project
	1. New file `.eslintrc`
		
			{
				"extends": "rallycoding"
			}

		1. Finds installed dependency
7. Restart Sublime Text
8. Change something and save the file to see the error

### ESLint Setup with VSCode ###
1. Install VSCode (Visual Studio Code)
2. Install eslint globally
	1. `npm install -g eslint`
3. Install extension
	1. Click on **Extensions**
	2. Search for eslint
	3. Click Install
	4. Enable the extension
	5. Restart VSCode
4. Install rule set
	1. Goto project albums
	2. `npm install --save-dev eslint-config-rallycoding`
5. Add config file to project
	1. New file `.eslintrc`
		
			{
				"extends": "rallycoding"
			}

		1. Finds installed dependency

## Onwards! ##
### Project Directory Walkthrough ###
1. Folder structure
	1. Android: files for android
		1. Only low level changes
	2. iOS: files for iOS
		1. Only low level changes 
	3. node_modules: dependencies
	4. index.android.js: service entry points for android app (when app first boots up)
		1. Delete everything to start from scratch
	5. index.ios.js: service entry points for iOS app (when app first boots up)
		1. All code is here

### Getting Content on the Screen ###
1. index.android.js

		// Index.android.js - place code here for Android!!!

2. index.ios.js

		// Index.ios.js - place code in here for iOS!!!
		
		// Import a library to help create a component
		import React from 'react';
		import ReactNative from 'react-native';

		// A component (a function that returns a JSX)
		const App = () => {
			return (
				<Text>Some Text</Text>	
			);
		};
		
		// Render it to the device (place it on screen)
		ReactNative.AppRegistry.registerComponent('albums', () => App);
		
	1. Component: widget, produces text or shape on mobile device
		1. app contains many component
	2. React vs ReactNative:
		1. React:
			1. Knows how a component should behave (what functions)
			2. Knows how to take a bunch of components and make them work tegether
		2. React Native:
			1. Knows how to take the output from a component and place it on the screen (portal to mobile device get handle of mobile device)
			2. Provides default core components (image, text)
	3. `import`: ES6 syntax
		1. No file gets access to any other files global variables unless we import the library
	4. JSX: A dialect of JS. Extension to Javascript to write react native components
		1. Same symantics of HTML
		2. `<Text>Some Text</Text>`
		3. It is the only way to communicate with ReactNative
		4. babeljs.io -> try it out (Translates JSX into plain JS)
		5. JSX gets translated into React functions
	5. `() => App`: returns `App` function
	6. `albums`: app name which should match project name
	7. `() => App`: returns first component

### React vs React Native ###
### Creation of Component with JSX ###
### Registering a Component ###
### Destructuring Imports ###
1. There is no global variables
2. To get access to Text tag, use import destructuring

		import { Text, AppRegistry } from 'react-native';
		...
		AppRegistry.registerComponent('albums', () => App);

	1. Only Text property in react-native library
	2. Drop { and return(...)
3. `react-native run-ios`

### Application Outline ###
1. Albums: Header
2. Album Name, Artist Name: Card Section
3. Card
4. CardSection
5. Buy Now: CardSection

### The Header Component ###
1. React app is a series of components
2. Practice: One component per file
3. New Folder: albums/src
4. New Folder: albums/src/components
5. New File: albums/src/components/header.js

		// Import libraries for making a component
		import React from 'react'; // name for npm modules since module names are unique
		import { Text } from 'react-native';

		// Make a component
		const Header = () => {
			return <Text>Albums!</Text>; // () may not be used for single lines
		};

		// Make the component available to other parts of the app
		export default Header;
		
	1. Component Hierarchy:
		1. App (root) - first component rendered to screen (only 'root' component uses 'AppRegistry')
			1. Header (child) - export the component to other other areas
		2. Use component nesting to construct the hierarchy
			1. index.ios.js

					... // remove Text
					import { Header } from './src/components/header'; // .js is implied and relative path is required because the file can be anywhere

					<Header /> // No content in between opening and closing tags
					

### Consuming File Exports ###

## Making Great Looking Apps ##
### Styling with React Native ###
1. Styling has to be done by hand
2. All styles are placed in component file
3. header.js

		const Header = () => {
			const { textStyle } = styles;

			return <Text style={textStyle}>Albums!</Text>;
		}

		const styles = {
			textStyle: {
				fontSize: 20
			}
		};

	1. `{textStyle}` : prop

### More on Styling Components ###
1. Positioning elements
2. View tag

		import { Text, View } from 'react-native';
		...
		const Header = () => {
			const { ..., viewStyle } = styles; // destructuring

		...
			return (
				<View style={viewStyle}>
					<Text style={textStyle}>...</Text>
				</View>
			);
		};
		...
		const styles = {
			viewStyle: {
				backgroundColor: '#F8F8F8'
			},
			...
		}

	1. View: used to position elements, style elements, wrap elements ...
		1. Wrap Text tag in View

### Introduction to Flexbox ###
1. CSS Positioning technology
2. Definition: System of positioning elements inside a container
3. Example: Text tag wrt view tag
4. Properties:
	1. `justifyContent` **(M)**: positioning in the vertical direction
		1. Values: `flex-end`, `center`, `flex-start` **(M)**
	2. `alignItems` **(M)**
		1. Values: `flex-start`, `center`, `flex-end` **(M)**

### Header Styling ###
1. header.js

		viewStyle: {
			...
			justifyContent: 'center',
			alignItems: 'center',
			height: 60,
			paddingTop: 15,
			shadowColor: '#000',
			shadowOffset: { width: 0, height: 2},
			shadowOpacity: 0.2
			elevation: 2,
			position: relative
		}

### Making the Header Reusable ###
1. Refactor header to make it generic
	1. props: To pass data from Root to Child
2. Steps:
	1. Add `props` parameter to component as input
	2. Change text in Text to `{props.headerText}`

			<Text style={textStyle}>{props.headerText}</Text>

	3. Pass text to Header

			<Header headerText={'Albums'} />


## HTTP Requests with React Native ##
### Sourcing Album Data ###
1. Get a list of albums from a API
	1. [http://rallycoding.herokuapp.com/api/music_albums](http://rallycoding.herokuapp.com/api/music_albums)
2. Components:
	1. AlbumList (fetch list and render several AlbumDetail(s))
	2. AlbumDetail: to show single card
		1. Album Name
		2. Artist Name
		3. Buy Now

### List Component Boilerplate ###
1. AlbumList: Child of App component
	1. AlbumDetail: Child of AlbumList
2. New File for AlbumList:
	1. `src/components/AlbumList.js` (capital name for component file names)

			import React from 'react';
			import { View, Text } from 'react-native';

			const AlbumList = () => {
				return (
					<View>
						<Text>Album List!!!</Text>
					</View>
				);	
			};

			export default AlbumList;

3. index.ios.js

		import AlbumList from './src/components/AlbumList';
		...
		const App = () => (
			<View>
				<Header ... />
				<AlbumList />
			</View>
		);
		
	1. Rule: We cannot return multiple tages

### Class Based Components ###
1. React HTTP Request
2. Component types:
	1. Functional components: functions used to display JSX
		1. Used for presenting static data
			1. Like pipe, data goes in and JSX comes out
			2. Example: Header
		2. Can't handle fetching data
		3. Easy to write
	2. Class Based Component (for large components, add helper methods)
		1. Used for dynamic sources of data
		2. Handles any data that might change (getching data, user events, ...)
		3. Knows when it gets rendered to the device (useful for data fetching)
		4. More code to write
		5. Example:

				class Header extends Component {
					render() {
						return <Text>Hi There!</Text>
					}
				}

3. Refactor `AlbumList.js`

		import React, { Component } from 'react';

		class AlbumList extends Component {
			render() {
				return (
					...
				);
			}
		}

	1. Borrows functionality from Component
	2. Babel converts JSX to JS, generates React.createElement hence we need to import `React`
	3. `render()`: returns JSX, React-native automatically calls `render()` to rendering code

### Lifecycle Methods ###
1. Helps us decide when to fetch data and do something else
2. To decide, we need hooks (Only class based components can have hooks)
	1. class has knowledge of when it will be rendered and removed
3. Lifecycle methods:
	1. `componentWillMount()` **(M)**: automatically executed as soon as rendering happens
	
			class AlbumList extends Component {
				componentWillMount() {
					console.log('componentWillMount logging');
				}
			}

4. Debug feedback:
	1. Using built in debugger [cmd + D] -> Debug JS Remotely
	2. Right click and select Inspect > Console
	3. `debugger;` **(M)**: break point in the app
		1. Helps us inspect in the console

### Quick Note On Axios ###
1. Axios: library
	1. If compatability issues with React Native [https://www.udemy.com/the-complete-react-native-and-redux-course/learn/v4/questions/1924782](https://www.udemy.com/the-complete-react-native-and-redux-course/learn/v4/questions/1924782)
	2. Use `fetch` library if issues with Axios

### Network Requests ###
1. Install `Axios` (for http requests)
	1. `npm install --save axios`
2. Import `Axios`

		import axios from 'axios';
		...
		componentWillMount() {
			axios.get('https://rallycoding.herokuapp.com/api/music_albums')
				.then(response => console.log(response));
		}

	1. `axios.get`: returns a promise and not the data because it is asynchromous
	2. `then(...)`: executed when request completes
3. Timeline of app:
	1. React Native boots up
	2. RN decides to render 'app' to the screen
	3. App decides to render itself, Header, and AlbumList
	4. AlbumLit realizes its about to be rendered, calls componentWillMount
	5. AlbumList makes HTTP request
	6. App, AlbumList, Header appear on screen (AlbumList will be empty)
	7. ...
	8. HTTP request returns JSON data
		1. Needs re-render of AlbumList

### Component Level State ###
1. State: is how react handles changing content that is shown on screen
2. Component State:

		state = { albums: [] }

		state = {
			albums: [
				{ name: 'asdf'},
				{ name: 'ikaplpq'}
			]
		}

3. When state changes react-native will automatilly re-render the component
	1. Need enabling component level state
4. Steps:
	1. Define default/ initial state
		1. Add class level property
			
				state = { albums: [] };	// Initial base state
			
	2. When data is fetched we have to tell the component to update
		1. Change state to new state

				axios.get(...)
				.then(response => this.setState({ albums: response.data }));

			1. `this.setState()` **(M)**: automatically implemented in Component
				1. Only way to modify `state`

	3. Component uses the new state
		1. Re-render

				render() {
					console.log(this.state);
					...
				}

### More on Component Level State ###
1. Updated timeline
	1. React Native boots up
	2. RN decides to render 'app' to the screen
	3. App decides to render itself, Header, and AlbumList
	4. AlbumList gets initial state of { albums: [] }
	5. AlbumList realizes its about to be rendered, calls componentWillMount
	6. AlbumList makes HTTP request
	7. AlbumList render method is called
	8. App, AlbumList, Header appear on screen
	9. ...
	10. HTTP request returns JSON data
	11. Request handler calls 'setState'
	12. AlbumLists' render method is called
2. Rules of State
	1. Definition of state: a plain javascript object used to record and respond to user-triggered events (when user starts app, when user requests data).
	2. When we need to update what a component shows, call `this.setState`
	3. Only change state with `setState`, do not do `this.state = 123`
3. Difference between state and props
	1. props: parent to child communication
	2. state: component's internal record keeping

### Rendering a List of Components ###
1. Transform object to component
	1. Using map method
2. Method for rendering

		renderAlbums() {
			return this.state.albums.map(album => <Text>{album.title}</Text>);
		}

3. Replace <Text>... with the following

		return (
			<View>
				{this.renderAlbums()}
			</View>
		);

### Displaying Individual Albums ###
1. Add a key to the JSX tag
	1. Performance will be improved because React-Native can identify particular components to re-render

			<Text key={album.title}>{album.title}</Text>

2. ./src/components/AlbumDetail.js

		import React from 'react';
		import { View, Text } from 'react-native';

		const AlbumDetail = (props) => {
			return (
				<View>	
					<Text>{props.album.title}</Text>
				</View>
			);
		};

		export default AlbumDetail;

3. AlbumList.js

		import AlbumDetail from './AlbumDetail';
		...
		renderAlbums() {
			return this.state.albums.map(album =>
				<AlbumDetail key={album.title} album={album} />
			);
		}

	1. Remove { ... Text }

### Fantastic Reusable Components - The Card ###
1. Two methodologies
	1. One component holds sub components and styling for the entire component can be defined

			<View>
				<View>
					<Image />
					<Text />
					<Text />
				</View>
				<View>
					<Image />
				</View>
				<View>
					<Button />
				</View>
			</View>

	2. Make two reusable components which can be used

			<Card>
				<CardItem>
					<Image />
					<Text />
					<Text />
				</CardItem>
				<CardItem>
					<Image />
				</CardItem>
				<CardItem>
					<Button />
				</CardItem>
			</Card>

		1. Card has some amount of built in styling
		2. CardItem will have some amount of builtin styling
		3. Why?
			1. Separate reusable components
2. `Card.js`

		import React from 'react';
		import { View } from 'react-native';

		const Card = () => {
			return (
				<View></View>
			);
		};

		export default Card;


### Styling a Card ###
1. Styling

		<View style={styles.containerStyle}>
		</View>

		const styles = {
			containerStyle: {
				borderWidth: 1,
				borderRadius: 2,
				borderColor: '#ddd',
				borderBottomWidth: 0,
				shadowColor: '#000',
				shadowOffset: { width: 0, height: 2 },
				shadowOpacity: 0.1,
				shadowRadius: 2,
				elevation: 1,
				marginLeft: 5,
				marginRight: 5,
				marginTop: 10
			}
		};

	1. ShadowRadius: rounds up the corners of shadow

### Passing Components as Props ###
1. AlbumDetail.js

		import Card from './Card';
		...
		return (
			<Card>
				<Text>{props.album.title}</Text>
			</Card>
		);

	1. Need to tell Card how to render its child components

### Dividing Cards into Sections ###
1. src/components/CardSection.js

		import React from 'react';
		import { View } from 'react-native';

		const CardSection = (props) => {
			return (
				<View style={styles.containerStyle}>
					{props.children}
				</View>
			);
		}

		const styles = {
			containerStyle: {
				borderBottomWidth: 1,
				padding: 5,
				backgroundColor: '#fff',
				justifyContent: 'flex-start',
				flexDirection: 'row',
				borderColor: '#ddd',
				position: 'relative'
			}
		}

		export default CardSection;

2. AlbumDetail.js

		import CardSection from './CardSection';

		<Card>
			<CardSection>
				<Text>{props.album.title}</Text>
			</CardSection>
		</Card>

## Handling Component Layout ##
### Mastering Layout with Felxbox ###
1. Plan building header:
	1. Artist Image, Album Name, Artist Name
2. Using Flexbox for multiple items:
	1. `justifyContent: 'space-between'` **(M)**: equalizes spaces between items with first item at the top and last item at the bottom
	2. `justifyContent: 'space-around` **(M)**: adds space above and below the first and last items respectively

### Positioning of Elements on Mobile ###
1. Wrap image and two text tags with two separate Views.
2. Use `justifyContent: 'flex-start'`
	1. `flexDirection: column`: default: vertical positioning
	2. `flexDirection: row`: horizontal direction
3. JSX

		<CardSection>
			<View>
				<Image />
			</View>
			<View>
				<Text />
				<Text />
			</View>
		</CardSection>

4. Styling:

		Card Section styling:
		{
			flexDirection: 'row',
			justifyContent: 'flex-start'
		}

5. Text Container styling

		Text Container styling:
		{
			flexDirection: 'column',
			justifyContent: 'space-around'
		}

### More on Styling ###
1. AlbumDetail.js

		import { View, ... } from 'react-native';

		<Card>
			<CardSection>
				<View></View>
				<View style={styles.headerContentStyle}>
					<Text>{props.album.title}</Text>
					<Text>{props.album.artist}</Text>
				</View>
			</CardSection>
		</Card>

		const styles = {
			headerContentStyle: {
				flexDirection: 'column',
				justifyContent: 'space-around'
			}
		};

### Images with React Native ###
1. Adding Image thumbnails
2. AlbumDetail.js

		import { ..., Image } from 'react-native';
		...
		<Card>
			<CardSection>
				<View>
					<Image source={{ uri: props.album.thumbnail_image }} />
				</View>
				...
			</CardSection>
		</Card>

2. Destructuring:

		const AlbumDetail = ({ album }) => {
			const { title, artist, thumbnail_image } = album;

			return (
				<Card>
					<CardSection>
						<View>
							<Image source={{ uri: thumbnail_image }} />
						</View>
						<View style={styles.headerContentStyle}>
							<Text>{title}</Text>
							<Text>{artist}</Text>
						</View>
					</CardSection>
				</Card>
			);
		};

	1. In react-native, image does not expand to fill to its maximum size as in HTML
	2. Needs manual styling for size

			const styles = {
				...
				thumbnailStyle: {
					height: 50,
					width: 50
				}
			}

	3. Styling

			<Image
				style={styles.thumbnailStyle}
				...
			/>

3. Destructuring:

		const { thumbnailStyle, headerContentStyle } = styles;

		...

		<Image
			style={thumbnailStyle}
			...
		/>
		

### Displaying Album Artwork ###
1. Set margin to image container

			const { ..., image } = album;
			const {
				...
				thumbnailContainerStyle,
				headerTextStyle,
				imageStyle
			} = styles;

			<View style={thumbnailContainerStyle}>
				<Image ...
			</View>
			<View>
				<Text style={headerTextStyle}>{title}</Text>
				<Text>{artist}</Text>
			</View>
			...
		<CardSection>
			<Image 
				style={imageStyle}
				source={{ uri: image }} 
			/>
		</CardSection>

		const styles = {
			...
			headerTextStyle: {
				fontSize: 18
			}
			...
			thumbnailContainerStyle: {
				justifyContent: 'center',
				alignItems: 'center',
				marginLeft: 10,
				marginRight: 10
			},
			imageStyle: {
				height: 300,
				flex: 1,
				width: null // full width
			}
		}

### Making Content Scrollable ###
1. By default no scrolling like a browser
2. Two steps to make it scrollable:
	1. Identify scollable container
	2. Import `ScrollView`
		1. AlbumList.js

				import { ScrollView } from 'react-native';
				...
				render() {
					...
					return (
						<ScrollView>
							...
						</ScrollView>
					);
				}
		
		2. index.ios.js

				<View style={{ flex: 1 }}>
					...
				</View>

			1. `flex: 1`: expand the component to fill the entire content area of the device

### Handling User Input with Buttons ###
1. Adding button
	1. Reusable button
	2. `src/components/button.js`

			import React from 'react';
			import { Text, TouchableOpacity } from 'react-native';

			const Button = () => {
				return (
					<TouchableOpacity>
						<Text>Click me!!</Text>
					</TouchableOpacity>
				);
			};

			export default Button;

	3. AlbumDetail.js

			import Button from './Button';
			...
			<CardSection>
				<Button />
			</CardSection>

2. ReactNative Docs:
	1. Types of buttons: (based on how feedback is provided)
		1. TouchableHighlight: highlights button on press to provide feedback
		2. TouchableOpacity: fades away on press event
		3. TouchableNativeFeedback: 
		4. TouchableWithoutFeedback: no feedback on press

### Styling of Buttons with UX Considerations ###
1. Styling button (Button.js)

		const { ButtonStyle, textStyle } = styles;

		return (
			<TouchableOpacity style={buttonStyle}>
				<Text style={textStyle}>
					Click me!!!
				</Text>
			</TouchableOpacity>
		);

		const styles = {
			textStyle: {
				alignSelf: 'center',
				color: '#007aff',
				fontSize: 16,
				fontWeight: '600',
				paddingTop: 10,
				paddingBottom: 10
			},
			buttonStyle: {
				flex: 1,
				alignSelf: 'stretch',
				backgroundColor: '#fff',
				borderRadius: 5,
				borderWidth: 1,
				borderColor: '#007aff',
				marginLeft: 5,
				marginRight: 5
			}
		}

	1. `alignSelf`: align itself based on the rules of flexbox

### Responding to User Input ###
1. Button.js

		const Button = ({ onPress }) => {

			<TouchableOpacity onPress={onPress} ...>
				...
			</TouchableOpacity>

		};

	1. Add `onPress` handler

2. AlbumDetail.js

		<CardSection>
			<Button onPress={ () => console.log(title) } />
		</CardSection>

### Linking Between Mobile Apps ###
1. There is no anchor tag concept
2. ReactNative Docs:
	1. Linking API
		1. `openURL(url)`

3. AlbumDetail.js
		
		import { ..., Linking } from 'react-native';
		...
		<Button onPress={() => Linking.openURL(url)} />

4. Button.js

		const Button = ({ onPress }) => {
			...
			<TouchableOpacity onPress={onPress} ...>
			...
			</TouchableOpacity>
		};

### Setting Button Text by Props ###
1. AlbumDetail.js : Button text

		<Button onPress={() => Linking.openURL(url)>
			May Be Buy Now
		</Button>

2. Button.js

		const Button = ({ ..., children }) => {
			...
			<Text ...>
				{children}
			</Text>
			...
		}

### App Wrapup ###
1. Generated project
2. Start simulator (react-native run-ios/ run-android)
3. Components:
	1. Class based
	2. Functional
4. State
5. Prop
6. Reusable components

## Authentication with Firebase ##
### Auth App Introduction ###
1. Authentication using Firebase database
2. New project
	1. `react-native init auth`
2. App:
	1. Sign in
		1. Sign up if no account
	2. Sign Out
4. Components:
	1. Header
	2. Card
	3. CardSection
	4. LoginForm
	5. Button
5. Challenge:
	1. Enable authentication using Firebase
	2. How to integrate
	3. How to handle user input
	4. How to validate user data
	5. Show spinner when processing the input

### A Common Root Component ###
1. `cd auth`
2. `index.ios.js` and `index.android.js` use `App` file for the application and no other code
3. Delete all code from `index.ios.js` and `index.android.js`
4. New file: `src/App.js`

		import React, { Component } from 'react';
		import { View, Text } from 'react-native';

		class App extends Component {
			render() {
				return (
					<View>
						<Text>An App!</Text>
					</View>
				);
			}
		}

		export default App;

5. `index.ios.js` and `index.ios.js`

		import { AppRegistry } from 'react-native';
		import App from './src/App';

		AppRegistry.registerComponent('auth', () => App);

### Copying Reusable Components ###
1. New folders: `/src/components/common`
2. Copy the following files:
	1. Button.js
	2. Card.js
	3. CardSection.js
	4. Header.js
3. In common directory add `index.js`

		// import { Header, Button, CardSection, Card } from './components/common';
		export * from './Button'; // Imports and exports
		export * from './Card';
		export * from './CardSection';
		export * from './Header';

	1. By default `index.js` is picked up if directory is specified in import
4. Change export statements
	1. Button.js

			export { Button }; // ES6 for Button: Button

	2. Card.js

			export { Card };
	
	3. CardSection.js

			export { CardSection };

	4. Header.js

			export { Header };

5. App.js

		import { Header } from './components/common'; // Destructuring only Header

		class App extends Component {
			render() {
				...
				<Header headerText="Authentication" />
				...
			}
		}

### What is Firebase? ###
1. Firebase: oneline database that connects to app
	1. If data changes in Firebase, then App gets updated
	2. It can be used for analytics, file storage, authentication
2. Sign up for Account
	1. [firebase.google.com](firebase.google.com)
	2. Sign Up
3. Open Firebase console
4. Click **CREATE NEW PROJECT**
	1. Name: authentication
5. **Add Firebase to your web app** (Javascript App)
6. Click **Auth**
7. Click **SET UP A SIGN-IN METHOD**
	1. No OAuth support for react-native
8. Click **Email/Password**
9. Enable
10. Save

### Firebase Client Setup ###
1. NPM Module: `npm install --save firebase`
2. Firebase has a bucket for data when a project gets created
3. Connect to Firebase bucket in app.js

		import firebase from 'firebase';
		...

		class App extends Component {
			componentWillMount() {
				firebase.initializeApp({
					<paste config object here>
				}); 
			}
			...
		}

4. Click **WEB SETUP** and copy 

### Login Form Scaffolding ###
1. New file: `src/components/LoginForm.js`

		import React, { Component } from 'react';
		import { View } from 'react-native';
		import { Button, Card, CardSection } from './common';

		class LoginForm extends Component {
			render() {
				return (
					<Card>
						<CardSection />
						<CardSection />
						<CardSection>
							<Button>
								Log in
							</Button>
						</CardSection>
					</Card>
				);
			}
		}

		export default LoginForm;

2. app.js

		import LoginForm from './components/LoginForm';

		...
		<View>
			...
			<LoginForm />
		</View>


### Handling User Inputs ###
1. LoginForm.js

		import { ..., TextInput } from 'react-native';
		...
		<CardSection>
			<TextInput style={{ height: 20, width: 100 }} />
		</CardSection>

	1. <TextInput> has 0 size and 0 styling by default

### More on Handling User Inputs ###
1. Reading text from TextInput
2. LoginForm.js

		class LoginForm extends Component {
			state = { text: '' };
			...
			<TextInput
				value={this.state.text}
				onChangeText={text => this.setState({ text })}
				...
			/>

### How are Controlled Components Created? ###
1. Input cycle
	1. TextInput
	2. User types text
	3. `onChangeText` event is called
	4. 'setState' with new text
	5. Component re-renders
	6. When TextInput re-renders, we tell it that its value is 'this.state.text'
2. Text Input stays in state
	1. It has benefits

### Making Text Inputs From Scratch ###
1. Resusable Input Component:
	1. new src/components/common/Input.js

			import React from 'react';
			import { TextInput, View, Text } from 'react-native';
			
			const Input = ({ label }) => {
				return (
					<View>
						<Text>{label}</Text>
					</View>
				);
			};
		
			export { Input }; // no default but will be exportd by index.js

2. index.js

		export * from './Input';

### A Focus on Passing Props ###
1. Input.js
		
		const Input = ({ ..., value, onChangeText }) => {

			<View>
				...
				<TextInput
					value={value}
					onChangeText={onChangeText}
					style={{ height: 20, width: 100 }}
				/>
			</View>
		...

2. LoginForm.js
	1. Remove `import { TextInput } ...`
	2. Add `import { ...., Input } from './common';`

			<CardSection>
				<Input
					value={this.state.text}
					onChangeText={text => this.setState({ text })}
				/>
			</CardSection>

### Making the Input Pretty ###
1. Input.js

		...

		const Input ... => {
			const { inputStyle, labelStyle, constainerStyle } = styles;
			...
			<View style={containerStyle}>
				<Text style={labelStyle}>...</Text>
				<TextInput
					style={inputStyle}
					...
				/>
			</View>
			...
		};

		const styles = {
			inputStyle: {
				color: '#000',
				paddingRight: 5,
				paddingLeft: 5,
				fontSize: 18,
				lineHeight: 23, // in between each line of text
				flex: 2
			},
			labelStyle: {
				fontSize: 18,
				paddingLeft: 20,
				flex: 1
			},
			containerStyle: {
				height: 40,
				flex: 1,
				flexDirection: 'row',
				alignItems: 'center'
			}
		};

	1. `flex: 2`: for the sibling 2/3 rd of allocated space
	2. `flex: 1`: for the sibling 1/3 rd of allocated space
2. LoginForm.js

		<Input
			label="Email"
			...
		/>

### Wrapping up Inputs ###
1. Remove `style={ height ... }`
2. Remove autocorrection

		const Input = ({ ..., placeholder }) => {
			...
			<TextInput
				placeholder={placeholder}
				autoCorrect={false}
				...
			/>
			...

2. LoginForm.js

		state = { email: '' };

		<Input
			placeholder="user@gmail.com"
			...
			value={this.state.email}
			onChangeText={email => this.setState({ email })}

	1. `{ email }`: gets expanded to { email: email } (ES6)

### Password Inputs ###
1. LoginForm.js

		state = { ..., password: '' };
		...
		<CardSection>
			<Input
				secureTextEntry
				placeholder="password"
				label="Password"
				value={this.state.password}
				onChangeText={password => this.setState({ password })}
			/>
		</CardSection>

	1. If we not pass a prop value, it is undefined which means it will be interpreted as not required

2. Input.js

		<TextInput
			secureTextEntry={true}
			...
		
	1. `secureTextEntry={true}` can be replaced with `secureTextEntry`
	2. Prop

			const Input = ({ ..., secureTextEntry }) => {
				...
				<TextInput
					secureTextEntry={secureTextEntry}
					...
				/>
			}

## Processing Authentication Credentials ##
### Logging a User in ###
1. this.state.email, this.state.password
2. LoginForm.js

		import firebase from 'firebase';
	
		...

		onButtonPress() {
			const { email, password } = this.state;
			firebase.auth().signInWithEmailAndPassword(email, password);
		}

		<CardSection>
			<Button onPress={this.onButtonPress.bing(this)}>

			</Button>
		</CardSection>

3. Process:
	1. Sign In Attempt
		1. Success
		2. Fail
			1. Creation of an Account
				1. Success
				2. Fail
					1. Show an Error

### Error Handling ###
1. firebase.auth().... - returns a promise
2. LoginForm.js

		import { Text } from 'react-native';
		...
		state = { ..., error: '' };
		...
		firebase.auth().signInWithEmailAndPassword(email, password)
			.catch(() => {
				firebase.auth().createUserWithEmailAndPassword(email, password)
					.catch(() => {
						this.setState({ error: 'Authentication Failed.' });
					});
			});

		...
		<Text style={style.errorTextStyle}>
			{This.state.error}
		</Text>
		<CardSection>
			<Button ...>
		</CardSection>
		...
		const styles = {
			errorTextStyle: {
				fontSize: 20,
				alignSelf: 'center',
				color: 'red'
			};
		}

### More on Authentication Flow ###
1. First test with Test@test.com and password
2. Second, test with Test@test.com and pass
	1. Error gets thrown
3. Clear Authentication Failed message

		this.setState({ error: '' });
		...
		firebase.auth(...)

4. Spinner component: `components/common/Spinner.js`
	
		import React from 'react';
		import { View } from 'react-native';

		const Spinner = () => {
			return (
				<View />
			);
		};

		export { Spinner };

5. index.js

		export * from './Spinner';
		

### Creation of an Activity Spinner ###
1. Use default spinner provided by react-native
2. Spinner.js

		import { ..., ActivityIndicator } from 'react-native';

		...

		const Spinner = ({ size }) => {
			<View style={styles.spinnerStyle}>
				<AtivityInidactory size={size || 'large'} />
			</View>
		};
		...

		const styles = {
			spinnerStyle: {
				flex: 1,
				justifyContent: 'center',
				alignItems: 'center'
			}
		};
	
	1. size: large or small

### Conditional Rendering of JSX ###
1. LoginForm.js
	1. Optionally show button or spinner

			import { ..., Spinner } from './common';

			state = { ..., loading: false };
			...
			this.setState({ ..., loading: true });
			...
			renderButton() {
				if (this.state.loading) {
					return <Spinner size="small"/>;
				}

				return (
					<Button onPress={this.onButtonPress.bind(this)}>
						Log in	
					</Button>
				);
			}
			...

			<CardSection>
				{this.renderButton()}
			</CardSection>

### Clearing the Form Spinner ###
1. LoginForm.js

		firebase.auth() ...
			.then(this.onLoginSuccess.bind(this))
			.catch(() => {
				...
				.then(this.onLoginSuccess.bind(this))
				.catch(this.onLoginFail.bind(this));
			});

		onLoginFail() {
			this.setState({ error: 'Authentication Failed', loading: false });
		}

		onLoginSuccess() {
			this.setState({ 
				email: '',
				password: '',
				loading: false,
				error: ''
			});
		}

	1. `bind(this)`: since promise is returned and the method is called sometime asynchronously in the future, we need to bind the method to the object

### Handling Authentication Events ###
1. Solution 1: `onLoginSuccess()`
2. Solution 2: `firebase.auth().onAuthStateChanged()`'s method
	1. called when user signs in or signs out
3. App.js

		class App extends Component {
			state = { loggedIn: false };

			componentWillMount() {
				...
				firebase.auth().onAuthStateChanged((user) => {
					if (user) {
						this.setState({ loggedIn: true });
					} else {
						this.setState({ loggedIn: false });
					}
				});
			}

### More on Conditional Rendering ###
1. App.js

		import { ..., Button } from './common';
		...
		renderContent() {
			if (this.state.loggedIn) {
				return (
					<Button>
						Log out
					</Button>
				);
			}

			return <LoginForm />;
		}

		render() {
			return (
				<View>
					...
					{this.renderContent()}
				</View>
			);
		}

2. App.js

		import { ..., Spinner } from './component/common';
		...
		state = { loggedIn: null };
		...
		renderContent() {
			switch(this.state.loggedIn) {
				case true:
					return <Button>Log out</Button>;
				case false:
					return <LoginForm />;
				default:
					return <Spinner size="large" />;
			}
		}


### Logging a User Out and Wrapup ###
1. App.js

		case true:
			return (
				<Button onPress={() => firebase.auth().signOut()}>Log out</Button>
			);

2. Walkthrough:
	1. Firebase: Local library
		1. Initialized
	2. Different flows
	3. User input
	4. Conditional rendering
	5. Reusable, Input and Spinner components
	6. Feedback to users

## Digging Deeper with Redux ##
### App Mockup and Approach ###
1. Redux will be used:
	1. React makes it painless to build interactive UIs. Design simple views for each state in your application, and React will efficiently update and render just the right components when your data changes.
2. For rendering list which are very long (maps become slow with size)
3. Smooth animations/ transitions
4. New Project
	1. `react-native init tech_stack`

### The Basics of Redux ###
1. Redux:
	1. [stephengrider.github.io/JSPlaygrounds](stephengrider.github.io/JSPlaygrounds])
		1. Type any javascript
2. How does Redux work:
	1. Action -> Reducer -> State
		1. Action: An object that tells the reducer how to change its data
			1. Must have `type` property
	2. Store: (Reducer -> State)
		1. Reducer: A function that produces some amount of data
		2. State: App's data (value of input field, user authenticated? ...)
		3. Store: An object that holds app's Reducer and State
			1. Represent's Redux's data
3. Example:
	1. Action: Turn 'asdf' into an array of characters
	2. Reducer: If the action's type is 'split', I will take a string of characters and turn it into a list of characters
	3. State: ['a','s','d','f']

### More on Redux ###
1. Open [stephengrider.github.io/JSPlaygrounds](stephengrider.github.io/JSPlaygrounds])
2. Code
	
		const reducer = (state = [], action) => {
			if (action.type === 'split_string') {
				return action.payload.split('');
			}
		};
		
		const store = Redux.createStore(reducer);

		store.getState();

		const action = { 
			type: 'split_string', 
			payload: 'asdf' 
		};

		store.dispatch(action);

		store.getState();

	1. `type: '<string>'`: tells what to do with the payload
	2. `store.dispatch(...)`: sends action to different reducers

### Redux is Hard! ###
1. Why use Redux at all?
	1. Redux is the best tool used to scale an application to be very large with the least amount of code complexity.
	2. How?
		1. Actions give us the ability to make predictable changes to the state of app
			1. We don't modify state directly
			2. Action modifies state only in a very particular way
		2. Example: We can know for certainty that state can be either empty or an array
2. Another action:

		const reducer = (state = [], action) => {
			...
			else if (action.type === 'add_character') {
				state.push(action.payload);
				return state;
			}
			...
		}

		const action2 = {
			type: 'add_character',
			payload: 'a'
		};

		store.dispatch(action2);

		store.getState();

1. Gotcha:
	1. Do not mutate existing state but return a new object or array.

			return [ ...state, action.payload ];
		1. ...state: ES6 syntax to get all contents of `state`

### Application Boilerplate ###
1. `npm install --save redux react-redux`
2. Install ESLint
3. Open `tech_stack`
	1. new `src`
	2. New app.js

			import React from 'react';
			import { View } from 'react-native';

			const App = () => {
				return (
					<View />
				);
			};

			export default App;

4. Delete everything from `index.ios.js` and `index.android.js`
5. Code in both

		import { AppRegistry } from 'react-native';
		import App from './src/app';

		AppRegistry.registerComponent('tech_stack', () => App);

### More on Redux Boilerplate ###
1. app.js

		import { Provider } from 'react-redux';
		import { createStore } from 'redux';

			return (
				<Provider store={createStore}>
					<View />
				</Provider>
			);

	1. `Provider`: works with store (which stores states)
		1. Translates data in store into a form that is accessed by react part of app
		2. Communication glue with react (because redux was not made only for react)
			1. That is why we need `react-redux` glue
2. New `src/reducers`
3. New `src/reducers/index.js`

		import { combineReducers } from 'redux';
		
		export default combinerReducers({
			libraries: () => []
		});

	1. `() => []`: simple reducer list

4. app.js

		import reducers from './reducers';
		...
			<Providers store={createStore(reducers)}>
				...

## Back to React ##
### Rendering the Header ###
1. `src/components/common`
2. Copy all common components to common directory
3. App.js

		import { Header } from './components/common';
		...
			<Provider ...>
				<View>
					<Header headerText="Tech Stack" />
				</View>
			</Provider>

	1. `<Provider>` can have only one child component

### Reducer and State Design ###
1. A file with list will be used in the app (only for the purpose)
2. Reducers produce the app state (which is the app data)
3. Different types of Reducers:
	1. Two separate states
		1. List of libraries
		2. Currently selected library
	2. Two separate reduces:
		1. Library reducer: produces list of libraries to show to the user
			
				[
					{ id: 1, name: 'React', ... },
					{ id: 2, name: 'Redux', ... },
					...
				]
		2. Selected Reducer: keeps track of current library that is being shown to the user
			
				1


### Library List of Data ###
1. reducers/index.js (convention: one reducer per file)
2. `src/reducers/LibraryReducer.js`

		export default () => [];

3. reducers/index.js

		import LibraryReducer from './LibraryReducer';
		...
			libraries: LibraryReducer

	1. `libraries`: key (state will be: `{ libraries: [] }`)
4. `LibraryReducer.js`

		export default () => [

		];

5. `src/reducers/LibraryList.json`

		[
			{
				"id": 0,
				"title": "Webpack",
				"description": "Webpack is a module bundler. It packs CommonJs/AMD modules i. e. for the browser. Allows to split your codebase into multiple bundles, which can be loaded on demand."
			},
			{
				"id": 1,
				"title": "React",
				"description": "React makes it painless to create interactive UIs. Design simple views for each state in your application, and React will efficiently update and render just the right components when your data changes."
			},
			{
				"id": 2,
				"title": "Redux",
				"description": "Redux is a predictable state container for JavaScript apps. It helps you write applications that behave consistently, run in different environments (client, server, and native), and are easy to test."
			},
			{
				"id": 3,
				"title": "React-Redux",
				"description": "React-Redux is the official set of bindings between the React and Redux libraries. With this library you can keep your views and data in sync."
			},
			{
				"id": 4,
				"title": "Lodash",
				"description": "A modern JavaScript utility library delivering modularity, performance, & extras. Lodash is released under the MIT license & supports modern environments."
			},
			{
				"id": 5,
				"title": "Redux-Thunk",
				"description": "Redux Thunk middleware allows you to write action creators that return a function instead of an action. The thunk can be used to delay the dispatch of an action, or to dispatch only if a certain condition is met."
			},
			{
				"id": 6,
				"title": "ESLint",
				"description": "ESLint is an open source JavaScript linting utility originally created by Nicholas C. Zakas in June 2013. Code linting is a type of static analysis that is frequently used to find problematic patterns or code that doesn't adhere to certain style guidelines."
			},
			{
				"id": 7,
				"title": "Babel",
				"description": "Babel has support for the latest version of JavaScript through syntax transformers. These plugins allow you to use new syntax, right now without waiting for browser support."
			},
			{
				"id": 8,
				"title": "Axios",
				"description": "Promise based HTTP client for the browser and node.js. With Axios, you can make XMLHttpRequests from the browser or Node with the full Promise Api."
			}
		]

### JSON CopyPaste ###
### The Connect Function ###
1. LibraryReducer.js

		import data from './LibraryList.json';

		export default () => data;

2. New Component: `components/LibraryList.js`:

		import React, { Component } from 'react';

		class LibraryList extends Component {
			render() {
				return;
			}
		}

		export default LibraryList;

3. Provider wraps Store
	1. Store contains
		1. libraries
		2. selectedLibraryId
4. `Connect`: helper in react-redux library
	1. To connect a component with redux store
		1. We can get state from LibraryList component
5. LibraryList.js

		import { connect } from 'react-redux';
		...
		export default connect()(LibraryList);

	1. calls function `connect()` which returns another function we then immediately call it with `LibraryList`

### MapStateToProps with Connect ###
1. LibraryList.js

		...
		const mapStateToProps = state => {
			console.log(state);
		};

		export default connect(mapStateToProps)

	1. `state`: global state object
	2. `mapStateToProps`: maps State object properties to props of the component

2. App.js
		
		import LibraryList from './components/LibraryList';
		...
		<View>
			...
			<LibraryList />

	1. When app starts, it evaluates `libraries: LibraryReducer` and generates `state = { libraries: [...] }`

3. If an object is returned from `mapStateToProps`, it will appear in props the component `LibraryList`

		class LibraryList extends ... {
			render() {
				console.log(this.props);
				...
			}
		}

		const mapStateToProps = state => {
			return { libraries: state.libraries };
		}

### A Quick Review and Breather ###
1. When app boots up, stre gets created
2. Libraries Reducer runs and returns `libraries: []` when store is created
3. Connect requests Provider for its state
4. Connect Calls mapStateToProps with the returned state
5. mapStateToProps returns the state as props to the component

## Rendering Lists the Right Way ##
### The Theory of ListView ###
1. Traditional approach: one component per item (object)
	1. Users can see only a few items (upfront rendering of all components will make them sit in memory)
		1. Need to reduce memory footprint
			1. ListView: It is a component that finds what items are visible to the user and builds components only for visible items on the screen.
			2. When we scroll, ListView watches for items, moves the invisible component to the just visible item and sticks item into the ListView

### ListView in Practice ###
1. LibraryList.js

		import { ListView } from 'react-native';
		...
		class LibraryList ... {
			componentWillMount() {
				const ds = new ListView.DataSource({ 
					rowHasChanged: (r1, r2) => r1 !== r2 
				});

				this.dataSource = ds.cloneWithRows(this.props.libraries);
			}

			renderRow() {
				
			}

			render() {
				return (
					<ListView
						dataSource={this.dataSource}
						renderRow={this.renderRow}
					/>
				);
			}
		}

	1. `ds.cloneWithRows`: 
	2. We have to tell ListView how to render a row

### Rendering a Single Row ###
1. LibraryList.js

		import ListItem from './ListItem';
		...
		renderRow(library) {
			return <ListItem library={library} />;
		}

2. ListItem.js

		import React, { Component } from 'react';
		
		class ListItem extends Component {
			render() {

			}
		}

		export default listItem;

### Styling the List ###
1. ListItem.js

		import { Text } from 'react-native';
		import { CardSection } from './common';

		render() {
			const { titleStyle } = styles;
			
			return (
				<CardSection>
					<Text style={titleStyle}>{this.props.library.title}</Text>
				</CardSection>
			);
		}
		...
		const styles = {
			titleStyle: {
				fontSize: 18,
				paddingLeft: 15
			}
		};

3. App.js

		<View style={{ flex: 1 }}>

	1. `{{`: outer one is for JSX and inner one defines an object

### Creation of Selection Reducer ###
1. `reducers/SelectionReducer.js`

		export default () => {
			return null;
		};

	1. Initial state of app: cannot be undefined (`null` - no row selected)
2. `index.js`

		import SelectionReducer from './SelectionReducer';

		export default combineReducers({
			libraries: LibraryReducer,
			selectedLibraryId: SelectionReducer
		});

### Introducing Action Creation ###
1. How to dispatch an action in a component:
	1. Using Action Creator (JS function that generates an Action)
2. `src/actions/index.js` (Action creators container)

		export const selectLibrary = (libraryId) => {
			return {
				type: 'select_library'
				payload: libraryId
			};
		};
		

### Calling Action Creation ###
1. ListItem.js

		import { connect } from 'react-redux';
		...
		import * as actions from '../actions';
		...
		class ListItem ... {
			...
			console.log(this.props); // will contain action creator which can be called which automatically dispatches the action
			...
		}

		export default connect(null, actions)(ListItem);

	1. *: imports all Action Creator functions
	2. No default in export: when importing many things
	3. `connect(null, actions)`:
		1. `null`: no mapStateToProps
		2. `actions`: mutates action creator into special function and dispatch action to store
			1. passes the data as props to the component

### Adding a Touchable ###
1. ListItem.js

		import { ..., TouchableWithoutFeedback, View } from 'react-native';
		...

		render() {
			...
			const { id, title } = this.props.library;

			return (
				<TouchableWithoutFeedback 
					onPress={() => this.props.selectLibrary(id)}
				>
					<View>
						<CardSection>
							<Text ...>
								{title}
							...
					</View>
				</TouchableWithoutFeedback>
		);

2. SelectionReducer.js

		export default (state, action) {
			console.log(action);
			return null;
		};

### Rules of Reducers ###
1. SelectionReducer.js

		export default (state = null, action) => {
			switch (action.type) {
				case 'select_library':
					return action.payload;
				default:
					return state;
			}
		}; // state is undefined initially

### Expanding a Row ###
1. ListItem.js

		class ...

			renderDescription() {
				const { library, selectedLibraryId } = this.props;
	
				if (this.props.library.id === selectedLibraryId) {
					return (
						<Text>{library.description}</Text>
					);
				} 
			}

			render() {
				...
				<View>
					...
					</CardSection>
					{this.renderDescription()}
				...

		const mapStateToProps = state => {
			return { selectedLibraryId: state.selectedLibraryId };
		};

		export default connect(mapStateToProps, ...)(...);

### Moving Logic Out of Components ###
1. ListItem.js

		renderDescription() {
			const { ..., expanded } = this.props;
			...
			if (expanded) {
				return (
					...
				);
			}
		}

		const mapStateToProps = (state, ownProps) => {
			const expanded = state.selectedLibraryId === ownProps.library.id;
			return { expanded };
		}; // ownProps: same as this.props of component

### Animations ###
1. Styling: ListItem.js

		import { ..., LayoutAnimation } from 'react-native';
		...
		class ListItem ... {

			componentWilUpdate() {
				LayoutAnimation.spring();
			}

			return (
				<CardSection>
					<Text style={{ flex: 1 }}>
						...
					</Text>
				</CardSection>
			);

	1. Cycle:
		1. User Presses Library
		2. Action Creator
		3. Rerun Reducers
		4. mapStateToProps
		5. Components rerenders
			1. `componentWillUpdate()`: for animation
		6. View updates

### Wrapup ###
1. Redux is for many state pieces and complex apps
2. When action is displatched, the entire app will re-render

## Not Done Yet... ##
### Overview of Our Next App ###
### App Challenges ###
### Just a Touch More Setup ###
### More on Boilerplate Setup ###

## Handling Data in React vs Redux ##
### Login Form in a Redux World ###
### Rebuilding the Login Form ###
### Handling Form Updates with Action Creation ###
### Wiring up Action Creation ###
### Typed Actions ###

## Don't Mutate that State ##
### Immutable State ###
### Creation of Immutable State ###
### More on Creation of Immutable State ###
### Synchronous vs Asynchronous Action Creation ###
### Introduction to Redux Thunk ###
### Redux Thunk in Practice ###
### Redux Thunk in Practice Continued ###
### Making LoginUser More Robust ###
### Creating User Accounts ###
### Showing Error Messages ###
### A Firebase Gotcha ###
### Showing a Spinner on Loading ###

## Navigating Users Around ##
### Dealing with Navigation ###
### Navigation in the Router ###
### Addressing Styling Issues ###
### Displaying Multiple Scenes ###
### Navigating Between Routes ###
### Grouping Scens with Buckets ###
### Navigation Bar Buttons ###
### Navigating to the Employee Creation Form ###
### Building the Employee Creation Form ###
### Employee Form Actions ###
### Handling Form Updtes at the Reducer Level ###
### Dynamic Property Updates ###
### The Picker Component ###
### Pickers and Style Overrides ###

## Firebase as a Data Store ##
### Firebase JSON Schema ###
### Data Security in Firebase ###
### Creation of Records with Firebase ###
### Default Form Values ###
### Successful Data Save to Firebase ###
### Resetting Form Properties ###
### Fetching Data from Firebase ###
### Storing Data by ID ###
### Dynamic DataSource Building ###
### Transforming Objects to Arrays ###
### List Building in Employee List ###

## Code Reuse - Edit vs Create ##
### Reusing the Employee Form ###
### Creation vs Edit Forms ###
### Reusable Forms ###
### A Standalone Employee Edit Form ###
### Initializing Forms from State ###
### Updating Firebase Records ###
### Clearing Form Attributes ###
### Texting Employees ###
### Modals as a Reusable Component ###
### The Model Component Continued ###
### Styling the Modal ###
### Employee Delete Action Cration ###
### Wiring up Employee Delete ###

## Bonus! ##
### Bonus? Bonus! ###