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
1. Navigation: User should move around different pages in the app
2. New App:
	1. `react-native init manager`
3. App description:
	1. Send schedule to employee as a text
	2. We can add employees to a list
	3. Form for editing employee
	4. Fire an employee

### App Challenges ###
1. Need to redux-ify login form
2. Need to show different screens. How to navigate?
3. Header content needs to change based on screen we're looking at
4. Each user should have their own pool of employees. How to save the data and secure
5. Need to send text message
6. Need a full screen overlay (popup). How to style it

### Just a Touch More Setup ###
1. cd `manager`
2. `npm install --save react-redux redux`
3. Root component:
	1. New `src/App.js`
	
			import React, { Component } from 'react';
			import { View, Text } from 'react-native';
			import { Provider } from 'react-redux';
			import { createStore } from 'redux';

			class App extends Component {
				render() {
					return (
						<Provider store={createStore()}>
							<View>
								<Text>
									Hello!
								</Text>
							</View>
						</Provider>
					);
				}
			}

			export default App;

4. `index.android.js`, `index.ios.js`

		import {
			AppRegistry
		} from 'react-native';

		import App from './src/App';

		AppRegistry.registerComponent('manager', () => App);

### More on Boilerplate Setup ###
1. Default Reducer:
	1. `src/reducers/index.js`

			import { combineReducers } from 'redux';

			export default combineReducers({
				banana: () => []
			});

2. App.js

		import reducers from './reducers';
		...
			<Provider store={createStore(reducers)}>

3. Firebase:
	1. `npm install --save firebase`
	2. `https://console.firebase.google.com`
		1. CREATE NEW PROJECT
			1. manager
		2. Auth
			1. Email/Password -> Enable
	3. WEB SETUP
		1. Copy the JS code
	4. App.js

			import firebase from 'firebase';

			componentWillMount() {
				<paste>
			}

		1. Change double quotes to single quotes

## Handling Data in React vs Redux ##
### Login Form in a Redux World ###
1. React works without redux.
2. We might use Redux for future increase in complexity
3. Make component as simple as possible (show a form, call action creator when a suer types or clicks a button)
4. Managing what to do with user actions is transitioned to redux
5. Flow:
	1. User does something
	2. React forwards that request to redux
	3. Redux decides whether to update it's state
	4. Push the state to react
	5. React shows new stuff

### Rebuilding the Login Form ###
1. Copy paste common directory:
	1. `src/components`
2. `src/components/loginForm.js`

		import React, { Component } from 'react';
		import { Card, CardSection, Input, Button } from './common';

		class LoginForm extends Component {
			render() {
				return (
					<Card>
						<CardSection>
							<Input
								label="Email"
								placeholder="email@gamil.com"
							/>
						</CardSection>
							
						<CardSection>
							<Input
								secureTextEntry
								label="Password"
								placeholder="password"
							/>
						</CardSection>

						<CardSection>
							<Button>
								Login
							</Button>
						</CardSection>
					</Card>
				);
			}
		}

		export default LoginForm;

3. App.js

		import LoginForm from './components/LoginForm';
		...
		return (
			<Provider ...>
				<LoginForm />
			</Provider>
		);

### Handling Form Updates with Action Creation ###
1. Full flow:
	1. User Types Something
	2. Call Action Creator with new text
	3. Action Creator returns an action
	4. Action sent to all reducers
	5. Reducer calculates new app state
	6. State sent to all components
	7. Components rerender with new state
	8. Wait for new change (Return to 1)
2. `LoginForm.js`

		onEmailChange(text) {
			
		}

		<Input
			...
			onChangeText={this.onEmailChange.bind(this)}

3. `src/actions/index.js`

		export const emailChanged = (text) => {
			return ({
				type: 'email_changed',
				payload: text
			});
		};

### Wiring up Action Creation ###
1. Turning off an ESLint rule

		{
			...
			"rules": {
				"arrow-body-style": 0
			}
		}

2. LoginForm.js

		import { connect } from 'react-redux';
		import { emailChanged } from '../actions';
		
		onEmailChange(text) {
			this.props.emailChanged(text); // passes text to the action creator
		}
		...
		export default connect(null, { emailChanged })(LoginForm);

3. `reducers/AuthReducer.js`

		const INITIAL_STATE = { email: '' };

		export default (state = INITIAL_STATE, action) => {
			switch (action.type) {
				default:
					return state;
			}	
		};

4. `reducers/index.js`

		import AuthReducer from './AuthReducer';

		...
			auth: AuthReducer
		... 

### Typed Actions ###
1. `src/actions/types.js`
	1. Contains constants for reducers and actions

			export const EMAIL_CHANGED = 'email_changed';

		1. `const` is used instead of `default` because there may be multiple

2. `actions/index.js`
		
		import { EMAIL_CHANGED } from './types';
		...
			type: EMAIL_CHANGED,
			...

3. AuthReducer.js

		import { EMAIL_CHANGED } from '../actions/types';
		...
			switch (action.type) {
				case EMAIL_CHANGED:

## Don't Mutate that State ##
### Immutable State ###
1. How reducer works:
	1. Slice of State (state.auth) + Action
	2. Reducer get both
	3. New slice of state
	4. Is newState === oldState?
	5. If yes, Guess nothing happened
	6. If no, Something changed, update!
2. Problem:
	
		const state = {}
		const newState = state // both are pointing to the same object
		newState.color = 'red';
		newState === state // always true because they are pointing to same object

### Creation of Immutable State ###
1. Do not change the state directly
2. AuthReducer.js

		case EMAIL_CHANGED:
			return { ...state, email: action.payload }; // a new object is built

	1. `email: action.payload` will override `email: ''` in `state`

3. LoginForm.js

		onEmailChange(text) {
			this.props.emailChanged(text);
		}
		...
		<CardSection>
			<Input
				...
				value={this.props.email}
			/>
		</CardSection>

		const mapStateToProps = state => {
			return {
				email: state.auth.email
			};
		};

		export default connect(mapStateToProps, ...)(...)

### More on Creation of Immutable State ###
1. LoginForm.js

		import { ..., passwordChanged } from '../actions';

		...
		<Input
			...
			value={this.props.password}
		/>

		...
		onPasswordChange(text) {
			this.props.passwordChanged(text);
		}

		<Input
			...
			onChangeText={this.onPasswordChange.bind(this)}

		const mapStateToProps = ... {
			return {
				...
				password: state.auth.password
			};
		};

		... connect(..., { ..., passwordChanged })(...);

2. `index.js`

		export const passwordChanged = (text) => {
			return {
				type: PASSWORD_CHANGED,
				payload: text
			};
		};

3. `types.js`

		export const PASSWORD_CHANGED = 'password_changed';

4. AuthReducer.js

		import { ..., PASSWORD_CHANGED } from '../actions/types';

		const INITIAL_STATE = {
			...
			password: ''
		};

		...
		case PASSWORD_CHANGED:
			return { ...state, password: action.payload };

### Synchronous vs Asynchronous Action Creation ###
1. Other properties:
	1. loading flag: boolean to show spinner
		1. start as false
		2. If request starts, it becomes true
		3. When request is complete, change it to false
	2. error: string with error message
		1. Default: empty string.
		2. If there is an error and when request completes, toss in an error message.
	3. user: user model supplied by firebase
		1. Default null
		2. Put in user model after request completes
2. Procedure:
	1. Call to action creator
	2. Action creator runs
	3. Request to firebase is made
	4. We have nothing to return!
	3. Asnchrounously request complete, we can return action
3. We need to write asynchronous action creator

### Introduction to Redux Thunk ###
1. Attempt:

		import firebase from firebase;
		...
		export const loginUser = ({ email, password }) => {
			firebase.auth().signInWithEmailAndPassword(email, password)
				.then(user => console.log(user));
		}

2. Redux Thunk: Used to handle asynchronous action creators (for any ajax requests)
	1. `npm install --save redux-thunk`

3. Default action creator rules:
	1. Action creators are functions
	2. Must return an action
	3. An action is an object with a 'type' property and optional 'payload'
4. Redux thunk: Bends action rules:
	1. Action creators are functions
	2. Must return a function
	3. This function will be called with 'dispatch' automatically
		1. dispatch manually dispatches actions

### Redux Thunk in Practice ###
1. Wiring up Redux thunk (middleware):
	1. App.js

			import { ..., ApplyMiddleware } from 'redux';
			import ReduxThunk from 'redux-thunk';
			...
			const store = createStore(reducers, {}, applyMiddleware(ReduxThunk));

			<Provider store={store}>
			...

		1. `{}` initial state
		2. `applyMiddleware`: store enhancer

	2. index.js

			export const loginUser = ... {
				return (dispatch) => {
					firebase.auth()...;
				}
			}

2. What is redux thunk doing?
	1. Action creator called
	2. Action creator returns a function
	3. Redux thunk sees that we return a function and calls it with dispatch method
	4. We do our login request
	5. wait
	6. wait
	7. Request complete, user logged in
	8. .then runs
	9. Manually Dispatch our action	

### Redux Thunk in Practice Continued ###
1. index.js

		firebase.auth()...
			.then(user => {
				dispatch({ type: 'LOGIN_USER_SUCCESS', payload: user });
			});
		}

2. AuthReducer.js

		export default (state = INITIAL_STATE, action) => {
			console.log(action);
			...
		}

3. Firebase:
	1. Auth > ADD USER
		1. test@text.com
		2. password
4. LoginForm.js

		import { ..., loginUser } from '../actions';
		...
		onButtonPress() {
			const { email, password } = this.props;

			this.props.loginUser({ email, password });
		}	
		...
		<Button onPress={this.onButtonPress.bind(this)}>
		...
		connect(..., {emailChanged, passwordChnged, loginUser)...;

### Making LoginUser More Robust ###
1. We can dispatch many actions using `dispatch` method
2. types.js

		export const LOGIN_USER_SUCCESS = 'login_user_success';

3. index.js

		import {  
			...,
			LOGIN_USER_SUCCESS
		} from './types';
		...
			dispatch({ type: LOGIN_USER_SUCCESS, ...});

4. AuthReducer.js

		import {
			...,
			LOGIN_USER_SUCCESS
		}
		...
		const INITIAL_STATE = {
			...,
			user: null
		}

		export default (state ...) => {
			switch (action.type) {
				...
				case LOGIN_USER_SUCCESS:
					return { ...state, user: action.payload };
				...
			}
		}

### Creating User Accounts ###
1. If authentication fails, a new account may be created.
2. index.js

		import {
			...
			LOGIN_USER_FAIL
		} from './types';

		firebase.auth()...
			.then(user => loginUserSuccess(dispatch, user))
			.catch() => {
				firebase.auth().createUserWithEmailAndPassword(email, password)
					.then(user => loginUserSuccess(dispatch, user))
					.catch(() => loginUserFail(dispatch)); 
				...
			}

		const loginUserFail = (dispatch) => {
			dispatch({ type: LOGIN_USER_FAIL });
		};

		const loginUserSuccess = (dispatch, user) => {
			dispatch({
				type: LOGIN_USER_SUCCESS,
				payload: user
			});
		};

3. types.js

		export const LOGIN_USER_FAIL = 'login_user-fail';

### Showing Error Messages ###
1. AuthReducer.js

		import {
			...
			LOGIN_USER_FAIL
		} from './types';
		...
		const INITIAL_STATE {
			...,
			error: null
		}
		...
		export default ... {
			...
			case LOGIN_USER_FAIL:
				return { ...state, error: 'Authentication Failed.', password: '' };
			...
		}

2. LoginForm.js

		import { Text } from 'react-native';
		...
		<Text style={styles.errorTextStyle}>
			{this.props.error}
		</Text>
		<CardSection>
			<Button ...>
		...

		const styles = {
			errorTextStyle: {
				fontSize: 20,
				alignSelf: 'center',
				color: 'red'
			}
		}

		const mapStateToProps = ({ auth }) => {
			const { email, password, error } = auth;
	
			return { email, password, error };
		}

### A Firebase Gotcha ###
1. AuthReducer.js

		case LOGIN_USER_SUCCESS:
			return { ...state, user: action.payload, error: '' };

2. Gotcha:
	1. AuthReducer.js

			case LOGIN_USER_SUCCESS:
				banana; // Shows Authentication Failed. on screen
				return { ...state, user: ...};

	2. Firebase assumes something went wrong with request

			.catch(error) {
				console.log(error); // runs when it hits banana
			}

### Showing a Spinner on Loading ###
1. types.js

		export const LOGIN_USER = 'login_user';

2. index.js

		return (disptch) => {
			dispatch({ type: LOGIN_USER }); // instead of START_SPINNER
			...
		}

3. AuthReducer.js

		const INITIAL_STATE = {
			...
			loading: false
		};

		export default ... => {
			...
			case LOGIN_USER:
				return { ...state, loading: true, error: '' }
			case LOGIN_USER_SUCCESS:
				return { ..., loading: false, email: '', password: '' }; // When we navigate back to the login form, the credentials are cleared out
			case LOGIN_USER_FAIL:
				return { ..., loading: false };
			...
		};

4. LoginForm.js

		import { ..., Spineer } from './common';
		...
		renderButton() {
			if (this.props.loading) {
				return <Spinner size="large" />;
			}

			return (
				<Button onPress={this.onButtonPress.bind(this)}>
					Login
				</Button>
			);
		}

		<CardSection>
			{this.renderButton()}
		</CardSection>

		const mapStateToProps = (..) => {
			const { email, password, error, loading } = auth;

			return { email, password, error, loading };
		}

5. AuthReducer.js

		case LOGIN_USER_SUCCESS:
			return { ...state, ...INITIAL_STATE, user: action.payload };

## Navigating Users Around ##
### Dealing with Navigation ###
1. There are different solutions for navigation:
	1. React Native router flux
		1. `npm install --save react-native-router-flux@3.35.0`
2. Flow:
	1. Authentication flow
	2. Main flow
3. Scene:
	1. Component that is imported from routing library
	2. Authentication flow: scene1
	3. Main flow: scene2 and scene3
	4. Props:

			<Scene
				key="login"
				component={LoginForm}
				title="Login"
				initial
			/>

		1. `key="login"`: Call `Actions.login()` to show this screen
			1. Identifies a screen
		2. `component={LoginForm}`: Show the component `LoginForm`
		3. `title="Login"`: Make a nav bar and give it a title of "Login"
				1. Built in header title
		4. `initial`: This is the first screen to show

### Navigation in the Router ###
1. `src/Router.js`

		import React from 'react';
		import { Scene, Router } from 'react-native-router-flux';
		import LoginForm from './components/LoginForm';

		const RouterComponent = () => {
			return (
				<Router>
					<Scene key="login" component={LoginForm} title="Please Login" />
				</Router>
			);
		};

		export default RouterComponent;

2. Puttin it in app:
	1. App.js

			import Router from './Router';
			...
			return (
				<Provider store={store}>
					<Router />
				</Provider>
			);

### Addressing Styling Issues ###
1. `<Router>`: Organizes scenes
2. `<Router />` in App.js
3. Navbar is customizable
4. Router.js

		<Router sceneStyle={{ paddingTop: 65 }}>
			...

	1. `sceneStyle`: applies to all scenes

### Displaying Multiple Scenes ###
1. `src/components/EmployeeList.js`

		import React, { Component } from 'react';
		import { View, Text } from 'react-native';

		class EmployeeList extends Component {
			render() {
				return (
					<View>
						<Text>Employee List</Text>
						<Text>Employee List</Text>
						<Text>Employee List</Text>
						<Text>Employee List</Text>
						<Text>Employee List</Text>
					</View>
				);
			}
		}

		export default EmployeeList;

2. Another scene:
	1. Router.js

			import EmployeeList from './components/EmployeeList';

			...
				return (
					<Router ...>
						<Scene key="login" component ... />
						<Scene key="employeeList" component={EmployeeList} title="Employees" initial />
					</Router>
				);

		1. Order of scenes will be used by default if `initial` is not specified.

### Navigating Between Routes ###
1. index.js

		import { Actions } from 'react-native-router-flux';

		const loginUserSuccess = (dispatch, user) => {
			...
			Actions.employeeList();
		}

	1. `Actions`
	2. `employeeList()`: Defined by `key="employeeList"`

### Grouping Scens with Buckets ###
1. Scene nesting:
	1. Example: Router.js

			<Scene key="auth">
				<Scene key="login" component={LoginForm} title="Login" initial />
			</Scene>

			<Scene key="main">
				<Scene component={EmployeeList} title="Your Employees" />
				<Scene component={EmployeeCreate} title="Employee" />
			</Scene>

		1. Scene bucket will have back and forward buttons for nested scenes.
2. Gotcha:
	1. index.js

			Actions.main();

### Navigation Bar Buttons ###
1. Router.js

		<Scene key="main">
			<Scene
				onRight={() => console.log('right!!!')}
				rightTitle="Add"
				...

### Navigating to the Employee Creation Form ###
1. `components/EmployeeCreate.js`

		import React, { Component } from 'react';
		import { View, Text } from 'react-native';

		class EmployeeCreate extends Component {
			render() {
				return (
					<View>
						<Text>Employee Form</Text>
					</View>
				);
			}
		}

		export default EmployeeCreate;

2. Router.js

		import EmployeeCreate from './components/EmployeeCreate';
		import { ..., Actions } from 'react-native-router-flux';
		...

		<Scene key="main">
			<Scene
				onRight={() => Actions.employeeCreate()}
				...
				initial
			/>
			<Scene key="employeeCreate" component={EmployeeCreate} title="Create Employee" />
		</Scene>

### Building the Employee Creation Form ###
1. Import reusable components:
2. EmployeeCreate.js

		import { Card, CardSection, Input, Button } from './common';
		...
			retrun (
				<Card>
					<CardSection>
						<Input
							label="Name"
							placeholder="Jane"
						/>
					</CardSection>

					<CardSection>
						<Input
							label="Phone"
							placeholder="555-555-5555"
						/>
					</CardSection>

					<CardSection>
					</CardSection>

					<CardSection>
						<Button>
							Create										</Button>
					</CardSection>
				</Card>	
			);

### Employee Form Actions ###
1. `actions/EmployeeActions.js`

		import {
			EMPLOYEE_UPDATE
		} from './types';

		export const employeeUpdate = ({ prop, value }) => {
			return {
				type: EMPLOYEE_UPDATE,
				payload: { prop, value }
			}	
		};

	1. `{ prop, value }`: object
2. types.js

		export const EMPLOYEE_UPDATE = 'employee_update';

3. `reducers/EmployeeFormReducer.js`

		import {
			EMPLOYEE_UPDATE
		} from '../actions/types';

		const INITIAL_STATE = {};

		export default (state = INITIAL_STATE, action) => {
			switch (action.type) {
				default:
					return state;
			}
		};

### Handling Form Updates at the Reducer Level ###
1. EmployeeFormReducer.js

		const INITIAL_STATE = {
			name: '',
			phone: '',
			shift: ''
		};

		switch (action.type) {
			case EMPLOYEE_UPDATE:
				// action.payload === { prop: 'name', value: 'jane' }
				return { ...state, [action.payload.prop]: action.payload.value };
			...
		}

	1. `[]`: not an array but key interpolation (key is determined at runtime)
		1. Becomes `name` for example
		2. Similar to: `newState[action.payload.prop] = action.payload.value;`
2. new `actions/AuthActions.js`: cut and paste from `index.js`
3. `index.js`

		export * from './AuthActions';
		export * from './EmployeeActions';

### Dynamic Property Updates ###
1. `reducers/index.js`

		import EmployeeFormReducer from './EmployeeFormReducer';

		export default ...({
			auth: AuthReducer,
			employeeForm: EmployeeFormReducer
		});

2. `EmployeeCreate.js`

		import { connect } from 'react-redux';
		import { employeeUpdate } from '../actions';
		...

			<Input
				label="Name"
				...
				value={this.props.name}
				onChangeText={text => this.props.employeeUpdate({ prop: 'name', value: text })}
			/>
			...
			<Input
				label="Phone"
				...
				value={this.props.phone}
				onChangeText={value => this.props.employeeUpdate({ prop: 'phone', value })} // ES6
			/>

		const mapStateToProps = (state) => {
			const { name, phone, shift } = state.employeeForm; // key
			return { name, phone, shift };
		};		

		export default connect(mapStateToProps, { employeeUpdate} )(EmployeeCreate);

### The Picker Component ###
1. API: [https://facebook.github.io/react-native/releases/next/docs/picker.html](https://facebook.github.io/react-native/releases/next/docs/picker.html)
2. Example:

		<Picker
			selectedValue={this.state.language}
			onValueChange={(lang) => this.setState({language: lang})}>
			<Picker.Item label="Java" value="java" />
			<Picker.Item label="JavaScript" value="js" />
		</Picker>

3. EmployeeCreate.js

		import { Picker } from 'react-native';
		...
		<CardSection>
			<Picker
				style={{ flex: 1 }} // default width is 0
				selectedValue={this.props.shift}
				onValueChange={value => this.props.employeeUpdate({ prop: 'shift', value })}
			>
				<Picker.Item label="Monday" value="Monday" />
				<Picker.Item label="Tuesday" value="Tuesday" />
				<Picker.Item label="Wednesday" value="Wednesday" />
				<Picker.Item label="Thursday" value="Thursday" />
				<Picker.Item label="Friday" value="Friday" />
				<Picker.Item label="Saturday" value="Saturday" />
				<Picker.Item label="Sunday" value="Sunday" />
			</Picker>
		</CardSection>

### Pickers and Style Overrides ###
1. Add a label:
	2. EmployeeCreate.js

			import { ..., Text } from 'react-native';
			...
			<CardSection style={{ flexDirection: 'column' }}> // Need to define this in the component
				<Text style={styles.pickerTextStyle}>Shift</Text>
				<Picker
					...
			</CardSection>
			...
			const styles = {
				pickerTextStyle: {
					fontSize: 18,
					paddingLeft: 20
				}
			};

2. CardSection.js

		const CardSection = (props) => {
			return (
				<View style={[styles.containerStyle, props.style]}>
					...
			);
		}

	1. `[...]`: array - `props.style` will override `styles.containerStyle`

## Firebase as a Data Store ##
### Firebase JSON Schema ###
1. Open Firebase
	1. Database (It is a JSON data store)
2. Datastructure of the data that is going to be stored:
	1. Collection of Users
		1. Each user has a collection of Employees
	2. JSON example:

			{
				"users": {
					"user 456": { employees: {} },
					"user 123": {
						"employees": {
							"employee 1": {
								"name": "Jane",
								"phone": "555-555-5555",
								"shift": "Monday"
							},
							"employee 2": {
								"name": "Jim",
								"phone": "333-333-3333",
								"shift": "Tuesday"
							}
						}
					}
				}
			}

### Data Security in Firebase ###
1. Default: If a user is authenticated, the user can access any data
2. Goto Firebase
	1. Database > Rules

			{
				"rules": {
					"users": {
						"$uid": {
							".read": "$uid === auth.uid",
							".write": "$uid === auth.uid"
						}
					}
				}
			}

	2. Click `PUBLISH`

### Creation of Records with Firebase ###
1. EmployeeCreate.js

		import { ..., employeeCreate } from '../actions';

		class ...

			onButtonPress() {
				const { name, phone, shift } = this.props;

				this.props.employeeCreate({ name, phone, shift });
			}

			<Button onPress={this.onButtonPress.bind(this))
				...

		export default connect(..., {
			...,
			employeeCreate
		})(...);

2. EmployeeActions.js

		export const employeeCreate = ({ name, phone, shift }) => {
			console.log(name, phone, shift);	
		};

	1. `shift` will not get logged since it is empty string initially.

### Default Form Values ###
1. One solution:
	
		const INITIAL_STATE = {
			shift: 'Monday'
		};

	1. Problem: Tightly coupled to the value

2. Second solution:
	1. EmployeeCreate.js
		
			ComponentWillMount() {
				// Manually call action creator manually and set default value of shift
			}

3. Third solution:
	1. EmployeeCreate.js

			onButtonPress() {
				...
				this.props.employeeCreate({ name, phone, shift: shift || 'Monday' });
			}

### Successful Data Save to Firebase ###
1. EmployeeActions.js

		import firebase from 'firebase';
		...
		export const employeeCreate = ({ name, phone, shift }) => {
			const { currentUser } = firebase.auth(); // Currently authenticated user
			firebase.database().ref(`/users/${currentUser.uid}/employees`)
			.push({ name, phone, shift });
		};

	1. `/users/userId/employees`: Find collection of users and find a key userId and find a key employees
2. Test in Firebase console

### Resetting Form Properties ###
1. Redirecting to Employee List screen
	1. Not returning an action
		1. EmployeeActions.js

				import { Actions } from 'react-native-redux-flux';

				export const employeeCreate ... {
					...
					return () => {
						firebase.database()...
							.push(...)
							.then(() => Actions.employeeList({ type: 'reset' }));
					};
				}

		1. `type: 'reset'`: don't treat it as next view but reset the entire view stack (don't display back button)
2. Clearing out the form:
	1. EmployeeAction.js

			import {
				...
				EMPLOYEE_CREATE
			} from './types';

			export const employeeCreate = ... {
				...
				return (dispatch) => {
					firebase....
					...
					.then(() => {
						dispatch({ type: EMPLOYEE_CREATE });
						...
					});
				}
			}

	2. types.js

			export const EMPLOYEE_CREATE = 'employee_create';

	3. EmployeeFormReducer.js

			case EMPLOYEE_UPDATE:
				...
			case EMPLOYEE_CREATE:
				return INITIAL_STATE;
			...

### Fetching Data from Firebase ###
1. EmployeeActions.js

		import {
			...
			EMPLOYEES_FETCH_SUCCESS
		} from './types';
		...
		export const employeesFetch = () => {
			const { currentUser } = firebase.auth();

			return (dispatch) => {
				firebase.database().ref(`/users/${currentUser.uid}/employees`)
					.on('value', snapshot => {
						dispatch({ type: EMPLOYEES_FETCH_SUCCESS, payload: snapshot.val() });
					});
			};
		};

	1. Any `value` that we get from ref, call the fat arrow function with an object that describes the data in the ref
	2. `snapshot.val()`: the actual data
	3. Anytime any data comes, the fat arrow function is called by just calling `.on` once
2. types.js

		export const EMPLOYESS_FETCH_SUCCESS = 'employees_fetch_success';

### Storing Data by ID ###
1. EmployeeList.js

		import { connect } from 'react-redux';
		import { employeesFetch } from '../actions';
		...
		class EmployeeList ...{
			componentWillMount() {
				this.props.employeesFetch();
			}
			...
		}
		export default connect(null, { employeesFetch })(EmployeeList);

2. `/reducers/EmployeeReducer.js`

		import {
			EMPLOYEES_FETCH_SUCCESS
		} from '../actions/types';

		const INITIAL_STATE = {};

		export default (state = INITIAL_STATE, action) => {
			switch (action.type) {
				case EMPLOYEES_FETCH_SUCCESS:
					console.log(action);
					return state;
				default:
					return state;
			}
		};

3. `index.js`

		import EmployeeReducer from './EmployeeReducer';

		export default combineReducers({
			...
			employees: EmployeeReducer
		});

4. Run Simulator and check the log
	1. Firebase returns an object instead of an array (easier to update)

### Dynamic DataSource Building ###
1. EmployeeList.js

		import { ListView, ... } from 'react-native';
		...
		class EmployeeList extends Component {
			componentWillMount() {
				this.props.employeesFetch(); // asynchronous

				this.creationOfDataSource(this.props);
			}

			componentWillReceiveProps(nextProps) {
				// nextProps are the next set of props that this component will be rendered with and this.props is still the old set of props

				this.creationOfDataSource(this.props);
			}

			creationOfDataSource({ employees }) {
				const ds = new ListView.DataSource({
					rowHasChanged: (r1, r2) => r1 !== r2
				});

				this.dataSource = ds.cloneWithRows(employees);
			}
		}

### Transforming Objects to Arrays ###
1. `cloneWithRows`: works only with Arrays and not objects
2. EmployeeList.js

		import _ from 'lodash';
		...
		render() {
			console.log(this.props);
			...
		}
		...
		const mapStateToProps = state => {
			const employees = _.map(state.employees, (val, uid) => {
				return { ...val, uid }; // { shift: 'Monday', name: ... id: ... }
			});

			return { employees };
		};

		export default connect(mapStateToProps, { employeesFetch })(EmployeeList);

	1. `map`: for each key value pair, run the fat arrow function
		1. `val`: user model (value)
		2. `uid`: key
	2. `{ ...val, uid }`: new object with value and key together

3. `npm install --save lodash`: helper to work with objects and arrays
4. Refresh and check the log for array of employees

### List Building in Employee List ###
1. EmployeeList.js

		import { ListView } from 'react-native';
		...
		import ListItem from './ListItem;

		renderRow(employee) {
			return <ListItem employee={employee} />;
		}

		render() {
			return (
				<ListView
					enableEmptySections
					dataSource={this.dataSource}
					renderRow={this.renderRow}
				/>
			);
		}

2. `components/ListItem.js`

		import React, { Component } from 'react';
		import { Text } from 'react-native';
		import { CardSection } from './common';

		class ListItem extends Component {
			render() {
				const { name } = this.props.employee;

				return (
					<CardSection>
						<Text style={styles.textStyle}>
							{name}
						</Text>
					</CardSection>
				);
			}
		}

		const styles = {
			titleStyle: {
				fontSize: 18,
				paddingLeft: 15
			}
		}

		export default ListItem;

## Code Reuse - Edit vs Create ##
### Reusing the Employee Form ###
1. ListItem.js

		import { Text, TouchableWithoutFeedback, View } from 'react-native';
		import { Actions } from 'react-native-router-flux';
		...
		onRowPress() {
			Actions.employeeCreate({ employee: this.props.employee }); // Additional prop is given to the method
		}
		
		render() {
			return (
				<TouchableWithoutFeedback onPress={this.onRowPress.bind(this)}>
					<View>
						<CardSection>
						...
					</View>
				</TouchableWithoutFeedback>
			):
		}

2. EmployeeCreate.js

		render() {
			console.log(this.props.employee); // We get it from EmployeeList.js
			...
		}

### Creation vs Edit Forms ###
1. Should we reuse Create form for Editing?
	1. Pros: Code sharing
	2. Cons: Added complexity due to conditional logic
2. How the form is currently working:
	1. User Navigates to create employee form
	2. EmployeeFormReducer is empty
	3. From is empty
	4. User updates values
	5. User submits form
	6. We save the data from the reducer
3. Edit case:
	1. User Navigates to edit employee form
	2. EmployeeFormReducer is empty
	3. Form is empty
	4. We have to prepopulate state in form reducer!!!
	5. User edits form - we do not change employee model (in memory)!!!
		1. If we change model in memory, it becomes dirty and we need to re-fetch from firebase
	6. User submits form
	7. We save the data from the reducer

### Reusable Forms ###
1. `components/EmployeeForm.js`

		import React, { Component } from 'react';
		import { View, Text, Picker } from 'react-native';
		import { connect } from 'react-redux';
		import { employeeUpdate } from '../actions';
		import { CardSection, Input } from './common';

		class EmployeeForm extends Component {
			render() {

			}
		}
		...
		const mapStateToProps = (state) => {
			const { name, phone, shift } = state.employeeForm;

			return { name, phone, shift };
		};

		export default connect(mapStateToProps, { employeeUpdate })(EmployeeForm);

2. Copy and paste first three card sections from EmployeeCreate.js
3. Copy and paste styles object
4. EmployeeCreate.js

		import EmployeeForm from 'EmployeeForm';
		...
		<Card>
			<EmployeeForm {...this.props} />
			...
		</Card>

### A Standalone Employee Edit Form ###
1. `components/EmployeeEdit.js`

		import React, { Component } from 'react';
		import { connect } from 'react-redux';
		import EmployeeForm from './EmployeeForm';
		import { Card, CardSection, Button } from './common';

		class EmployeeEdit extends Component {
			render() {
				return (
					<Card>
						<EmployeeForm />
						<CardSection>
							<Button>
								Save Changes
							</Button>
						</CardSection>
					</Card>
				);
			}
		}

		export default connect()(EmployeeEdit);

### Initializing Forms from State ###
1. ListItem.js

		onRowPress() {
			Actions.employeeEdit(...);
		}

2. Router.js

		import EmployeeEdit from './components/EmployeeEdit';
		...
		<Scene key="main">
			...
			<Scene key="employeeEdit" component={EmployeeEdit} title="Edit Employee" />
		</Scene>

3. EmployeeEdit.js

		import _ from 'lodash';
		import { employeeUpdate } from '../actions';
		...
		class ... {
			componentWillMount() {
				_.each(this.props.employee, (value, prop) => {
					this.props.employeeUpdate({ prop, value });
				});
			}
	
			onButtonPress() {
				const { name, phone, shift } = this.props;
				console.log(name, phone, shift);
			}
			
			render() {
			...
				<Button onPress={this.onButtonPress.bind(this)}>
			}
		}

		const mapStateToProps = (state) => {
			const { name, phone, shift } = state.employeeForm;

			return { name, phone, shift };
		};
		
		export defult connect(mapStateToProps, { employeeUpdate })(EmployeeEdit);

### Updating Firebase Records ###
1. EmployeeActions.js

		export const employeeSave = ({ name, phone, shift, id }) => {
			const { currentUser } = firebase.auth();
			return () => {
				firebase.database().ref(`/users/${currentUser.uid}/employees/${uid}`)
					.set({ name, phone, shift })
					.then(() => console.log('saved!'));
			};
		};

2. EmployeeEdit.js

		import { ..., employeeSave } from '../actions';
		...
			onButtonPress() {
				...
				this.props.employeeSave({ name, phone, shift, uid: this.props.employee.uid });
			}
		export default connect(..., {
			...
			employeeSave
		})(...);

	1. `employee`: is passed as prop

### Clearing Form Attributes ###
1. EmployeeActions.js

		import {
			...
			EMPLOYEE_SAVE_SUCCESS
		} form './types';

		return (dispatch) => {
			firebase ...
				...
				.then(() => {
					dispatch({ type: EMPLOYEE_SAVE_SUCCESS });
					Action.employeeList({ type: 'reset' });
			});
		}

2. types.js

		export const EMPLOYEE_SAVE_SUCCESS = 'employee_save_success';

3. EmployeeFormReducer.js

		import {
			...
			EMPLOYEE_SAVE_SUCCESS
		} from './types';
		...

		case EMPLOYEE_SAVE_SUCCESS:
			return INITIAL_STATE;

### Texting Employees ###
1. Open native text messaging of the device
2. `react-native-communications` (npmjs.com)
	1. We can initiate
		1. text
		2. email
		3. phone call
	2. `npm install --save react-native-communications`
3. EmployeeEdit.js

		import Communications from 'react-native-communications';
		...
		onTextPress() {
			const { phone, shift } = this.props:
			
			Communications.text(phone, `Your upcoming shift is on ${shift}`);
		}
		...
		return (
			...
			<CardSection>
				<Button onPress={this.onTextPress.bind(this)}>
					Text Schedule
				</Button>
			</CardSection>
		);

### Modals as a Reusable Component ###
1. Problem: texting does not work in iOS simulator
	1. Solution: Works on Android simulator
2. Modal: A popup on current screen:
	1. [https://facebook.github.io/react-native/docs/modal.html](https://facebook.github.io/react-native/docs/modal.html)
		
			<Modal
				animationType={"slide"}
				transparent={false}
				visible={this.state.modalVisible}
				onRequestClose={() => {alert("Modal has been closed.")}}
			>

		1. `transparent`: see through modal or not
		2. `visible`: should the modal be visible or not
		3. `onRequestClose`: required for android device
3. Reusable Modal component:
	1. `src/components/common/Confirm.js`

			import React from 'react';
			import { Text, View, Modal } from 'react-native';
			// import { CardSection, Button } form '.'; // generates a cyclical dependency which node resolves but not recommended
			import { CardSection } from './CardSection';
			import { Button } from './Button';

			const Confirm = () => {

			};

			export { Confirm }; // since it is reusable component

4. index.js

		export * from './Confirm';

### The Model Component Continued ###
1. Confirm.js

		const Confirm = ({ children, visible, onAccept, onDecline }) => {
			return (
				<Modal
					visible={visible}
					transparent
					animationType="slide"
					onRequestClose={() => {}}
				>
					<View>
						<CardSection>
							<Text>{children}</Text>
						</CardSection>

						<CardSection>
							<Button onPress={onAccept}>Yes</Button>
							<Button onPress={onDecline}>No</Button>
						</CardSection>
					</View>
				</Modal>
			);
		}

### Styling the Modal ###
1. Confirm.js

		const Confirm ... {
			const { containerStyle, textStyle, cardSectionStyle } = styles;

			<View style={containerStyle}>
				<CardSection style={cardSectionStyle}>
					<Text style={textStyle}>
	
			...
		const styles = {
			cardSectionStyle: {
				justifyContent: 'center'
			},
			textStyle: {
				flex: 1,
				fontSize: 18,
				textAlign: 'center',
				lineHeight: 40
			},
			containerStyle: {
				backgroundColor: 'rgba(0, 0, 0, 0,75)'
				position: 'relative',
				flex: 1,
				justifyContent: 'center'
			}
		}

2. EmployeeEdit.js

		import { ..., Confirm } from './common';
		...

		class ... {
			state = { showModal: false };

			<Card>
				...

				<CardSection>
					<Button onPress={() => this.setState({ showModal: !this.state.showModal })}>
						Fire Employee
					</Button>
				</CardSection>

				<Confirm
					visible={this.state.showModal}
				>
					Are you sure you want to delete this?
				</Confirm>
			</Card>

	1. We need only component level state (since it is used only in this scene)

### Employee Delete Action Creation ###
1. EmployeeEdit.js

		onAccept() {
			
		}

		onDecline() {
			this.setState({ showModal: false });
		}

		render() {
			...
			<Confirm
				...
				onAccept={this.onAccept.bind(this)}
				onDecline={this.onDecine.bind(this)}
			>

2. EmployeeAction.js

		export const employeeDelete = ({ uid }) => {
			const { currentUser } = firebase.auth();

			return () => {
				firebase.database().ref(`/users/${currentUser.uid}/employees/${uid}`)
					.remove()
					.then(() => {
						Actions.employeeList({ type: 'reset' });
					});
			};
		};

	1. `dispatch` is not required because list update is automated already

### Wiring up Employee Delete ###
1. EmployeeEdit.js

		import { ..., employeeDelete } from '../actions';
		...
			onAccept() {
				const { uid } = this.props.employee;

				this.props.employeeDelete({ uid });
			}
		...
		connect(..., {
			...
			employeeDelete
		})(...);

## Bonus! ##
### Bonus? Bonus! ###
1. ES6 Javascript: The Complete Developer's Guide: [https://www.udemy.com/javascript-es6-tutorial/?couponCode=RNCOMPLETE_10](https://www.udemy.com/javascript-es6-tutorial/?couponCode=RNCOMPLETE_10)
2. Meteor and React for Realtime Apps: [https://www.udemy.com/meteor-react-tutorial/?couponCode=RNCOMPLETE_10](https://www.udemy.com/meteor-react-tutorial/?couponCode=RNCOMPLETE_10)
3. Modern React with Redux: [https://www.udemy.com/react-redux/?couponCode=RNCOMPLETE_10](https://www.udemy.com/react-redux/?couponCode=RNCOMPLETE_10)
4. Advanced React with Redux: [https://www.udemy.com/react-redux-tutorial/?couponCode=RNCOMPLETE_10](https://www.udemy.com/react-redux-tutorial/?couponCode=RNCOMPLETE_10)