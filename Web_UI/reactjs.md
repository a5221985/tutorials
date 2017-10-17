# React JS and Redux #
## An Intro to React ##
### Introduction - Github Links for Project Files! ###
### Completed Projects - Github Links ###
1. [https://github.com/StephenGrider/ReduxCasts](https://github.com/StephenGrider/ReduxCasts)

### The Purpose of Boilerplate Projects ###
1. Sample application with bolierplate project
	1. No need to transpile and plumbing
		1. component_x.js
		2. React.js - library (ES6)
		3. Redux.js - library (ES6)
	2. Webpack + babel - transpile JSX + ES6 to ES5
		1. Spits out application.js

### Environment Setup ###
1. [github.com/stephengrider](github.com/stephengrider)
	1. Repositories > ReduxSimpleStarter
		1. Clone it: `git clone <link>`
2. `cd ReduxSimpleStarter`
	1. `npm install`

### Project Setup ###
1. Application: Video player
	1. Search bar
	2. Videos on right hand side (Using YouTube API)
	3. Video
	4. Video title & Video description
2. Start:
	1. `npm start`
	2. `localhost:8080`

### A Taste of JSX ###
1. Open: `atom .`
	1. `index.html`
		1. `bundle.js` - compiled single file (compiled by Webpack and babel)
	2. `Components` > `app.js`
		1. `Hello There`
	3. Delete `src`
	4. New folder `src`
		1. New file `index.js`
2. React: JS library that is used to produce HTML shown to user in browser
	1. Components (Views): Snippets of JS code that produce HTML
		1. They are nested
3. `index.html`

		// Creation of a new component. This component should produce
		// some HTML
		const App = function () {	// const - ES6 syntax
			return <div>Hi!</div>;
		};

		// Take this component's generated HTML and put it on the page

	1. `const`: declares variable
		1. `App` cannot be reassigned
	2. `<div>Hi!</div>`: JSX - dialect of JS that allows us to write what looks like HTML but behind the scenes it is JS
		1. Webpack + Babel - transpiles to JS

### More on JSX ###
1. JSX cannot be interpreted by browser
	1. The content that gets inserted when content is rendered
2. [babeljs.io](babeljs.io)
	1. Copy function and ES5 code gets generated

			"use strict";

			var App = function App() {
				return React.createElement(
					"div",
					null,
					"Hi"
				);
			};

3. Nesting:

		return <ol>
			<li>1</li>
			<li>2</li>
			<li>3</li>
		</ol>;

	1. More legible and clean

### ES6 Import Statements ###
1. Error code 1:

		// Take ...
		// ...
		React.render(App);	// React is not defined

2. JavaScript modules - code that is declared in other files

		import React from 'react';	// get library and assign it to variable React

### ReactDOM vs React ###
1. Error:
	1. ReactDOM - library to render in DOM

			import ReactDOM from 'react-dom';
			...
			ReactDOM.render(App);

### Differences Between Component Instances and Component Classes ###
1. Instantiating component before rendering
	1. `<div></div>` - calls `React.createElement`

			ReactDOM.render(<App />);	// 

### Render Targets ###
1. Second argument: Reference to existing DOM on the page

		ReactDOM.render(<App />, document.querySelector('.container'));	// Render in root component

2. Fat arrow function:

		const App = () => {	// this is different
			return <div>Hi!</div>
		}

### Component Structure ###
1. Components: (reusable)
	1. Search bar
	2. Video player + title + description
	3. Video preview (many)
	4. Video details list
	5. Master component
2. One component per file
	1. `src/components`
		1. `search_bar.js`
		2. `video_detail.js`
		3. `video_list.js`
		5. `video_list_item.js`

### Youtube Search API Signup ###
1. Figuring out components comes out of practice
2. Two step process:
	1. Register for YouTube API key
		1. `console.developers.google.com`
		2. Icon on top left
			1. API Manager
				1. Youtube Data API v3
					1. Enable API
					2. Credentials
						1. New Credentials
							1. API Key
								1. Browser Key
									1. Browser key 2
									2. Create
							2. Select and copy
		3. Code in index.js:

				...
				const API_KEY = '<key>';
				...

	2. Install package for searching
		1. Youtube API search
		2. `npm install --save youtube-api-search`

### Export Statements ###
1. Search bar:
	1. Exporting modules, classes, state
2. `search_bar.js`

		import React from 'react';

		const SerachBar = () => {
			return <input />;  // translated to React.createElement(...)
		};

		export default SearchBar;	// 

3. index.js

		import SearchBar from './components/search_bar'; // not a library
		...
		const App = () => {
			return (
				<div>
					<SearchBar />
				</div>
			);
		};

### Class-Based Components ###
1. Functional component
2. Class component: For internal record keeping, communication with other components
	1. search_bar.js

			import React from 'react';

			class SearchBar extends React.Component {
				render() {
					return <input />;
				}
			}

			export default SearchBar;

3. Cleanup:

		import React, { Component } from 'react'; // pull property Component into Component variable from react

		class SearchBar extends Component {
			render() {
				return <input />;
			}
		}

		export default SearchBar;

### Handling User Events ###
1. Handling events:
	1. Define event handler
	2. Pass event handler to element
2. search_bar.js

		class SearchBar extends Component {
			render() {
				return <input onChange={this.onInputChange} />;
			}

			onInputChange(event) {	// Handle + Element + Event
				console.log(event.target.value);  // event object is passed
				console.log(event);
			}	
		}

	1. Compact code

			render() {
				return <input onChange={event => console.log(event.target.value)};
			}

### Introduction to State ###
1. State is a JS object used to record user events
	1. Each class based component has its own state object
		1. When a component state is changed, component immediately re-renders and forces it's children to re-render
2. Initialize state: In Constructor

		class ... {
			constructor(props) {	// first method that is called automatically when a new instance of class is created
				super(props);	// calls constructor of parent class

				this.state = { term: '' };	// has properties that needs to be recorded
			}
			...
		}

### More on State ###
1. Record state
	1. Constructor is only function where state is manipulated directly
	2. Everywhere else use `this.setState(<object>)`

			render() {
				return <input onChange={event => this.setState({ term: event.target.value })} />;	// informs react and it does many things
			}

2. Why record state?

		render() {
			return (
				<div> <!-- return should return only one element -->
					<input onChange={event => this.setState({ term: event.target. value })} />
					Value of the input: {this.state.term}
				</div>
			);	
		}

### Controlled Components ###
1. Controlled field: form element whose value is set by the state

		<div>
			<input
				value={this.state.term}
				onChange={...} />	<!-- Controlled component: value changes only when state changes -->

	1. App renders an instance of SearchBar
	2. SearchBar constructor is called and state is initialized
	3. Component renders and value of input is set to retrieve value from this.state (empty initially)
	4. When user enters text, the state is changed (`setState` is called)
	5. Component re-renders and render is called again and value is set to new `this.state.term`
2. Purpose: 
	1. Set initial state
	2. Read values: `this.state.term` has the latest value
 
### Breather and Review ###


## Ajax Requests with React ##
### Youtube Search Response ###
1. Call to Youtube API
2. Downwards dataflow: The most parent component in an application should be responsible for fetching data
	1. App component

			...
			import YTSearch from 'youtube-api-search';
			...
			const API_KEY = '<key>';

			YTSearch({key: API_KEY, term: 'surfboards'}, function (data) {
				console.log(data);
			});

### Refactoring Functional Components to Class Components ###
1. index.js

		import React, { Component } from 'react';
		...
		class App extends Component {
			constructor(props) {
				super(props);

				this.state = { videos: [] };

				YTSearch({key: API_KEY, term: 'surfboards'}, (videos) => {
					this.setState({ videos });	// { videos: videos }
				});
			}

			render() {
				return (
					...
				);
			}
		}

### Props ###
1. video_list.js (no state required) (include bootstrap)

		import React from 'react';

		const VideoList = (props) => {
			return (
				<ul className="col-md-4 list-group">
					{props.videos.length}
				</ul>
			);
		};

		export default VideoList;

2. index.js

		...
		import VideoList from './components/video_list';
		...
		render() {
			return (
				...
				<VideoList videos={this.state.videos} />
			);
		}
	
	1. passing prop vidoes to video list
	2. Props arrive as argument to functional component
	3. In class based component, they are passed to `this.props`

### Building Lists with Map ###
1. video_list.js

		import VideoListItem from './video_list_item';

		const VideoList = (...) => {
			const videoItems = props.videos.map(video => {
				return <VideoListItem video={video} />
			});

			return (
				<ul ...>
					{videoItems}
				</ul>
			);
		};	

	1. map iterator:

			array.map(function (number) { return number * 2 });

2. video_list_item.js

		import React from 'react';
		import VideoListItem from './video_list_item';
		
		const VideoListItem = (props) => {
			return <li>Video</li>;
		};

		export default VideoListItem;
			

### List Item Keys ###
1. If an array of items is rendered, react assumes that we are building a list
	1. React has an optimized process to render a list
2. Key: helps update a particular element
	1. If we do not give keys to elements, react will throw the entire list and re-render the entire list
	2. Addking etag as key

			<VideoListItem key={video.etag} video={video} />

		1. Unique key for each item

### Video List Items ###
1. video_list_item.js

		const VideoListItem = ({ video }) => {
			// console.log(video);
			// const video = props.video;
			const imageUrl = video.snippet.thumbnails.default.url;

			return (
				<li className="list-group-item">
					<div className="video-list media">
						<div className="media-left">
							<img className="media-object" src={imageUrl} />
						</div>

						<div className="media-body">
							<div className="media-heading">{video.snippet.title}</div>
						</div>
					</div>
				</li>
			);
		};

### Detail Component and Template Strings ###
1. We don't need any state so using functional component
2. video_detail.js

		import React from 'react';

		const VideoDetail = ({ video }) => {
			const videoId = video.id.videoId;
			const url = `https://www.youtube.com/embed/${videoId}`;

			return (
				<div className="video-detail col-md-8">
					<div className="embed-responsive embed-responsive-16by9">
						<iframe className="embed-responsive-item" src={url}></iframe>
					</div>
					<div className="details">
						<div>{video.snippet.title}</div>
						<div>{video.snippet.description}</div>
					</div>
				</div>
			);
		};

### Handling Null Props ###
1. index.js

		...
		import VideoDetail from './components/video_detail';
		...
		render() {
			return (
				...
				<VideoDetail video={this.state.videos[0]} />
				...
			);
		}

	1. Null props - first render passes `video=Undefined`
2. video_detail.js

		const VideoDetail = ({...}) => {
			if (!video) {
				return <div>Loading...</div>;
			}
			...
		}

### Video Selection ###
1. Agax spinner should be at highest level possible
2. Selected video in state:
	1. index.js

			this.state = {
				videos: [],
				selectedVideo: null
			};
			...
			YTSearch(... {
				this.setState({
					videos: videos,
					selectedVideo: videos[0]
				});
			});
			...
			render() {
				return (
					...
					<VideoDetail video={this.state.selectedVideo} />
					<VideoList 
						onVideoSelect={selectedVideo => this.setState({selectedVideo})}
						...
				);
			}

2. video_list.js

		const videoItems = props.videos... {
			return (
				<VideoListItem
					onVideoSelect={props.onVideoSelect}
					...
			);
		}

3. video_list_item.js

		const VideoListItem = ({video, onVideoSelect}) => {
			...
			return (
				<li onClick={() => onVideoSelect(video)} ...
			);
		}

### Styling with CSS ###
1. style/style.css - automatically applies to project

		.search-bar {
			margin: 20px;
			text-align: center;
		}

		.search-bar input {
			width: 75%;
		}

		.video-item img {
			max-width: 64px;
		}

		.video-detail .details {
			margin-top: 10px;
			padding: 10px;
			border: 1px solid #ddd;
			border-radius: 4px;
		}

		.list-group-item {
			cursor: pointer;
		}

		.list-group-item:hover {
			background-color: #eee;
		}

2. search_bar.js

		<div className="search-bar"> <!-- similar to component name and one css class per component -->
			<input
				...

### Searching for Videos ###
1. index.js

		...
			this.videoSearch('surfboards');
		}

		videoSearch(term) {
			// Move the following
			YTSearch({key: API_KEY, term: term}, (videos) => {
				...
			}); 
		}

		render() {
			return (
				<div>
					<SearchBar onSearchTermChange={term => this.videoSearch(term)} />
					...
			);
		}

2. search_bar.js

		render() {
				...
				onChange={event => this.onInputChange(event.target.value)} />
			</div>
		}

		onInputChange(term) {
			this.setState({term});
			this.props.onSearchTermChange(term);
		}

### Throttling Search Term Input ###
1. lodash: library that has utility functions
	1. debounce: throttle how often function is called
	2. Installation: `npm install --save lodash`
2. index.js

		import _ from 'lodash';
		...
		render() {
			const videoSearch = _.debaunce((term) => {this.videoSearch(term), 300); // returns a function that runs only once every 300 ms even if called more frequently
			return (
				<div>
					<SearchBar onSearchTermChange={videoSearch} />
					...
			);
		}

### React Wrapup ###
1. Class is used if we want state
2. functional component: nothing changes
	1. Light and fast
3. Redux: callbacks can be reduced
	1. Handles application level state (traditionally we have component lavel state)

## Modeling Application State ##
### Forward on Redux ###
### What is Redux? ###
### More on Redux ###
### Even More on Redux! ###

## Managing App State with Redux ##
### Putting Redux to Practice ###
### Reducers ###
### Containers - Connecting Redux to React ###
### Containers Continued ###
### Implementation of a Container Class ###
### Containers and Reducers Review ###
### Actions and Action Creators ###
### Binding Action Creators ###
### Creation of Action ###
### Consuming Actions in Reducers ###
### Consuming Actions in Reducers Continued ###
### Conditional Rendering ###
### Reducers and Actions Review ###

## Intermediate Redux: Middleware ##
### App Overview and Planning ###
### Component Setup ###
### Controlled Components and Binding Context ###
### Form Elements in React ###
### Working with API's ###
### Introduction to Middleware ###
### Ajax Requests with Axios ###
### Redux-Promise in Practice ###
### Redux-Promise Continued ###
### Avoiding State Mutations in Reducers ###
### Building a List Container ###
### Mapping Props to a Render Helper ###
### Quick Note ###
### Adding Sparkline Charts ###
### Making a Reusable Chart Component ###
### Labeling of Units ###
### Google Maps Integration ###
### Google Maps Integration Continued ###
### Project Review ###

## React Router + Redux Form ##
### Important Note - No Not Skip! ###
### App Overview and Goals ###
### Exploring the Posts Api ###
### Installing React Router ###
### React Router - What is it? ###
### Setting Up React Router ###
### Route Configuration ###
### Nesting of Routes ###
### IndexRoutes with React Router ###
### Back to Redux - Index Action ###
### Catching Data with Posts Reducer ###
### Catching Data with Posts Reducer Continued ###
### Fetching Data with Lifecycle Methods ###
### Fetching Data with Lifecycle Methods Continued ###
### Creation of New Posts ###
### Navigation with the Link Component ###
### Forms and Form Submission ###
### More on Forms and Form Submission ###
### Passing Control to Redux Form ###
### CreatePost Action Creator ###
### Form Validation ###
### Form Validation Continued ###
### Navigating on Submit ###
### Posts Index ###
### Dynamic Route Params ###
### Loading Data on Render ###
### Handling Null Props ###
### Delete Action Creator ###
### Navigate on Delete ###
### ReactRouter and ReduxForm Wrapup ###

## Bonus - RallyCoding ##
### Basics of Redux Thunk ###
### Combining Redux and Firebase ###
### Dynamic Forms with Redux Form ###
### Logicless Components with Reselect ###
### Data Loading Methods with Redux ###
### Animation of React Components ###
### The Best Way to Store Redux Data ###
### Four Most Common Errors with React and Redux ###
### Modals in React and Redux Apps ###
### Deployment of React/Webpack Apps ###
### BrowserHistory in Production ###
### React Integration with 3rd Party Libraries ###
### Introducing JSPlaygrounds for Rapid Prototyping ###

## More to Come! ##
### Still want more React? ###
### React Source ###

## React Router + Redux Form ##
### Important Note ###
### App Overview and Goals ###
### Posts API ###
### Quick Note ###
### Installing React Router ###
### What React Router Does ###
### The Basics of React Router ###
### Route Design ###
### Our First Route Definition ###
### State as an Object ###
### Back to Redux - Index Action ###
### Implementing Posts Reducer ###
### Action Creation Shortcuts ###
### Rendering a List of Posts ###
### Creation of New Posts ###
### A React Router Gotcha ###
### Navigation with the Link Component ###
### Redux Form ###
### Setting Up Redux Form ###
### The Field Component ###
### Generalizing Fields ###
### Showing Errors to Users ###
### Handling Form Submittal ###
### Form and Field States ###
### Conditional Styling ###
### More on Navigation ###
### Creation of Post Action Creator ###
### Navigation Through Callbacks ###
### The Posts Show Component ###
### Receiving New Posts ###
### Selecting from OwnProps ###
### Data Dependencies ###
### Catching Records ###
### Deleting a Post ###
### Wrapup ###
### Bonus! ###