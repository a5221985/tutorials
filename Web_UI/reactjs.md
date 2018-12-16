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
			const videoSearch = _.debaunce((term) => {this.videoSearch(term)}, 300); // returns a function that runs only once every 300 ms even if called more frequently
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
1. Redux documentation: [reduxjs.org](reduxjs.org)
	1. Webpack
	2. Redux Router
	3. React Router
	4. Redux Promise
	5. Redux Thunk
	6. Hot reloading
	7. ...
	8. ES6

### What is Redux? ###
1. Redux is a predictable state containier for JS Apps.
	1. Traditional JS App: List of Books. If we click on a book, we get details of the book
		1. View layer
			1. List View
			2. List Item
			3. Detail View
		2. Data layer
			1. List of books
			2. Currently selected book
	2. We want to separate View from data

### More on Redux ###
1. Redux is data that is contained in the application
	1. Collection of all data that describes the app
		1. Includes hard data: List of books
		2. Meta level properties: Currently selected book
2. We centralize all app data in a single object called state
3. Examples:
	1. Counter app: + adds 1 and - decreases by 1
		1. Data: Current count
		2. View: CurrentCount, NumberChanger (+ and 1 buttons)

### Even More on Redux! ###
1. Example: Complex app:
	1. Tinder
		1. A user is shown image of another user
		2. If user likes the image, they can click Like button
			1. Opens a chatlog and they can talk to each other
		3. If user does not like the image, they can click Dislike button
		4. Users can view list of open chats
		5. Users can view individual chat
2. Design:
	1. Data:
		1. List of all users: (reviewed and not reviewed)
			1. Users (contains images and chat logs)
		2. Conversation Screen:
			1. List of current users with a conversation
		3. Swiping screen:
			1. List of users to be reviewed
			2. Currently viewed conversation (currently liking or disliking)
		4. Actual conversation screen: (for exchanging messages)
			1. Currently viewed User for image swiping
	2. View:
		1. Image Card
		2. List/Dislike Buttons
		3. ConversationList (list of open conversations)
		4. TextItem (individual message)
		5. TextList (list of chat messages)

## Managing App State with Redux ##
### Putting Redux to Practice ###
1. Setup [Redux Simple Starter](https://github.com/StephenGrider/ReduxSimpleStarter) package
	1. Clone or download repository from github
	2. Run `npm install`

### Reducers ###
1. Reducer: It is a function that returns a piece of the application state
	1. We can have many reducers each returning a piece of state
		1. Example:
			1. One reducer to return list of books
			2. One reducer to return currently selected book
		2. Reducer produces value of state
			1. Value returned is assigned to a key (anything)
2. src/reducers/reducer.books.js (reducer - type of file)
	
		export default function() { // Makes this function available to other files
			return [
				{title: 'Javascript: The Good Parts'},
				{title: 'Wings of Fire' },
				{title: 'The Dark Tower' },
				{title: 'Eloquent Ruby' }
			];
		}

3. src/reducers/index.js (wires reducer to app)

		import { combineReducers } from 'redux';
		import booksReducer from './reducer_books';

		const rootReducer = combineReducers({
			books: booksReducer
		});	// maps state with reducers: each attribute key to a reducer

		export default rootReducer;

### Containers - Connecting Redux to React ###
1. `combineReducers` - tells how app state must be created
2. src/components/book_list.js

		import React, { Component } from 'react';
		
		export default class BookList extends Component {
			renderList() {
				return this.props.books.map((book) => {
					return (
						<li key={book.title} className="list-group-item">{book.title}</li>
					);
				});
			}

			render() {
				return (
					<ul className="list-group col-sm-4">
						{this.renderList()}
					</ul>
				);
			}
		}

2. ReactRedux: Library that connects React and Redux
	1. Container - React component that has a direct connection to state managed by Redux
		1. Smart component
3. src/containers/book_list.js

### Containers Continued ###
1. Most parent component that cares about a particular piece of state needs to be a container
	1. Book list cares about list of books that change
	2. Book detail cares about active book that changes
	3. App cares about rendering only

### Implementation of a Container Class ###
1. src/components/app.js

		import BookList from '../containers/book_list';

		export default ... {
			render() {
				return (
					<div>
						<BookList />
					</div>
				);
			}
		}

2. book_list.js

		import { connect } from 'react-redux';

		class BookList extends Component {
			...
		}

		function mapStateToProps(state) {	// takes app's state as argument and returns will show up as props inside of BookList
			return {
				books: state.books
			};	// object returned is set as props
		}

		export default connect(mapStateToProps)(BookList); // produces a container and exported

3. If `state` changes, container would re-render automatically
4. If `state` changes, object in state function will assign props with state

### Containers and Reducers Review ###
1. Redux constructs application state and React provides views to display the state
2. Application state is generated by reducer functions
	1. `reducer_books.js` - returns array of books
3. Reducer is added to Combine Reducer inside `index.js`
	1. Adds key `books` and value is reducer `BooksReducer`
4. Component is added `book_list.js`
	1. Promoted to a container
		1. Defined `mapStateToProps`
		2. Used connect function
5. Redux generated state object that contained list of books and mapped state as props of component
6. Component re-rendered

### Actions and Action Creators ###
1. Active book state piece changes over time (dynamic)
2. Actions and Action Creator - for changing of state
	1. Life cycle
		1. Starts with event (clicking button, hover, ajax request, page loading up (indirect))
			1. Events can call an action creator
				1. Action creator is a function that returns an action (object)
				2. Object is automatically sent to all reducers
				3. Reducers can choose to return different piece of state depending on what the action is
				4. The new piece of state gets piped into the application state
				5. Application state pumps back into React application which causes all components to re-render
		2. Example:
			1. User clicks on Book 2
			2. Action creator is called 

					function( return {
						type: BOOK_SELECTED
						book: { title: 'Book 2' }
					})

			3. Action creator returns an action (object)

					{
						type: BOOK_SELECTED
						book: { title: 'Book 2' }
					}

			4. Action is automatically sent to all reducers

					switch (action.type) {
						case BOOK_SELECTED:
							return action.book
						default:
							// I don' care about htis action, do nothing
							return currentState
					}

			5. `activeBook` property on state, set to value returned from active book reducer

					{
						activeBook: { title: 'Book2' }
						books: [ { title: 'Dark Tower' }, { title: 'Javascript' } ]
					}

			6. All reducers processed action and returned new state. New state has been assembed. Notify containers of changes to state. On notification, container re-render with new props

### Binding Action Creators ###
1. Click should trigger action creator
	1. `src/actions/index.js`

			export function selectBook (book) {
				console.log('A book has been selected:', book.title);
			}

	2. `book_list.js` - connect action creator

			...
			import { selectBook } from '../actions/index';
			import { bindActionCreators } from 'redux';	// function that makes sure action flows through reducers
			...
			// Anything returned from this function will end up as props
			// on the BookList container
			function mapDispatchToProps(dispatch) {
				// Whenever selectBook is called, the result should be passed to
				// all of our reducers
				return bindActionCreators({ selectBook: selectBook }, dispatch);
			}

			// Promote BookList from a component to a container - it needs to know
			// about this new dispatch method, selectBook. Make it available
			// as a prop.
			export default coneect(mapStateToProps, mapDispatchToProps)(BookList);

		1. dispatch: function that takes actions and passes them to all reducers

### Creation of Action ###
1. `book_list.js`
	1. Action creator can be called if a user clicks on a line item
		
			<li
				...
				onClick={ () => this.props.selectBook(book) }

2. actions/index.js

		export function selectBook(book) {
			// selectBook is an ActionCreator, it needs to return an action,
			// an object with a type property.
			return {
				type: 'BOOK_SELECTED',
				payload: book
			};
		}

	1. Every action must have a type and a payload

### Consuming Actions in Reducers ###
1. `src/reducers/reducer_active_book.js`

		// State argument is not application state, only the state
		// this reducer is responsible for
		export default function (state  = null, action) {	// ES6: React does not allow returning undefined on page load hence set to null
			switch(action.type) {
				case 'BOOK_SELECTED':
					return action.payload;
			}
			return state;
		}

	1. reducer is called when action is created
	2. State: The state that is produced by reducer flows through the reducer over and over again

			export default function (state, action) {
				state += 1;
			}

		1. state gets incremented each time action is triggered
	3. Do not mutate existing state but always return fresh object
2. `reducers/index.js`

		import activeBook from './reducer_active_book';

		const rootReducer = ... ({
			...
			activeBook: activeBook
		});

### Consuming Actions in Reducers Continued ###
1. `src/containers/book_detail.js`

		import React, { Component } from 'react';
		
		export default class BookDetail extends Component {
			render() {
				return (
					<div>Book Detail</div>
				);
			}
		}

2. `src/index.js`

		import BookDetail from '../containers/book_detail';
		...
		render() {
			return (
				<div>
					<BookList />
					<BookDetail />
				</div>
			);
		}

3. `book_detail.js`

		import { connect } from 'react-redux';
		
		class BookDetail ... {
			...
		}

		function mapStateToProps(state) {
			return {
				book: state.activeBook
			};
		}

		export default connect(mapStateToProps)(BookDetail);

### Conditional Rendering ###
1. book_detail.js

		class BookDetail extends Component {
			render() {
				if (!this.props.book) {
					return <div>Select a book to get started</div>;
				}

				return (
					<div>
						<h3>Details for:</h3>
						<div>{this.props.book.title}</div>
					</div>
				);
			}
		}
	
	1. When app first boots up, state is null
2. reducer_books.js

		{ title: 'Javascript: The Good Parts', pages: 101 },
		{ title: 'Wings of Fire', pages: 180 },
		{ title: 'The Dark Tower', pages: 85 },
		{ title: 'Eloquent Ruby', pages: 1 }

3. book_detail.js

		<div>
			...
			<div>Pages: {this.props.book.pages}</div>
		</div>

### Reducers and Actions Review ###
1. Redux manages app's state
2. State is single plain js object
3. App state is different from a component state

		this.state in component is different from Redux state

4. App state is formed by reducers
	1. `combineReducers` combines all reducers together
		1. to each key we assign 1 reducer
			1. reducer returns value of that piece of state
5. When action is dispatched, it flows through all reducers in the application
	1. Each reducer can return a different piece of state based on action received
6. Action creators are simple functions that return actions
	1. Actions are objects
		1. They have type and payload

## Intermediate Redux: Middleware ##
### App Overview and Planning ###
1. Solidify knowledge of React
2. More familiar with Redux
3. Asynchronous calls with Redux (Ajax)
4. App: Weather forecast browser
	1. Once we search and get result, it gets added as a row
	2. Line chart for Temperature, Pressure and Humidity
5. React does not make any Ajax requests
	1. Integrating a react component into our app
	2. Significant state changes
6. Boilerplate project: github.com/stephengrider
	1. `ReduxSimpleStarter`
	2. `npm install`

### Component Setup ###
1. `npm start`
2. App components:
	1. Search bar: Search input + Search button
	2. ForecastList: list of chart rows
	3. Chart
	4. App
3. src/containers/search_bar.js

		import React, { Component } from 'react';

		export default class SearchBar extends Component {
			render() {
				return (
					<form className="input-group">
						<input />
					</form>
				);
			}
		}

4. src/components/app.js

		...
		import SearchBar from '../containers/search_bar';
		...
		export default ... {
			render() {
				return (
					<div>
						<SearchBar />
					</div>
				);
			}
		}

5. src/containers/search_bar.js

		<form ...>
			<input />
			<span className="input-group-btn">
				<button type="submit" className="btn btn-secondary">Submit</button>
			</span>
		...

### Controlled Components and Binding Context ###
1. search_bar.js

		export default class ... {
			constructor(props) {
				super(props);

				this.state = { term: '' };

				this.onInputChange = this.onInputChange.bind(this);
			}

			onInputChange(event) {	// vanila JS
				console.log(event.target.value);
				this.setState({ term: event.target.valie });
			}

			onFormSubmit(event) {
				event.preventDefault(); // Don't submit the form

				// We need to go and fetch weahter data
			}

			render() {
				...
				<form onSubmit={this.onFormSubmit} ...>
				<input
					placeholder="Get a five-day forecast in your favorite cities"
					className="form-control"
					value={this.state.term}
					onChange={this.onInputChange} /> // 
				... 
			}

### Form Elements in React ###
1. `form` submits contents of form if we press enter or press button by default
2. Solution: Event handler for submit event

		onFormSubmit(event) {
			event.preventDefault();

			// We need to go and fetch weather data
		}
		...
		<form onSubmit={this.onFormSubmit} ... 

### Working with API's ###
1. API: [openweathermap.org/forecast5](openweathermap.org/forecast5)
	1. Sign up
	2. It is free
	3. Get API key
2. `actions/index.js`

		const API_KEY = '68cd6c2e7a9b16f451466d85ee4b24b0';

### Introduction to Middleware ###
1. Ajax request with Redux
	1. actions/index.js
2. Middleware: Functions that take an action, depending on action type or payload, middleware can allow action to passthrough, or manipulate the action or console log or stop it before they reach reducers
	1. Search for redux-promise npm package - middleware package for redux (to handle ajax requests)
		1. `npm install --save redux-promise`
3. `src/index.js`

		import ReduxPromise from 'redux-promise';
		...
		const createStoreWithMiddleware = applyMiddleware(ReduxPromise)(createStore);		

### Ajax Requests with Axios ###
1. actions/index.js

		...
		const ROOT_URL = `http://samples.openweathermap.org/data/2.5/forecast?appid=${API_KEY}`;
		export const FETCH_WEATHER = 'FETCH_WEAHTER';	// typos are handled at compile time

		export function fetchWeather(city) {
			const url = `${ROOT_URL}&q=${city},us`;

			return {
				type: FETCH_WEATHER
			};
		}

2. Install axios: `npm install --save axios` - for ajax request from browser. Identical to jQuery
	1. actions/index.js

			import axios from 'axios';
			...
			const request = axios.get(url);

			return (
				...
				payload: request
			);

### Redux-Promise in Practice ###
1. `search_bar.js`

		import { connect } from 'react-redux';
		import { bindActionCreators } from 'redux';
		import { fetchWeather } from '../actions/index';

		class ...{
			constructor() {
				...
				this.onFormSubmit = this.onFormSubmit.bind(this);
			}
			...
			onFormSubmit(event) {
				...
				this.props.fetchWeather(this.state.term);
				this.setState({ term: '' });
			}
		}
		...
		function mapDispatchToProps(dispatch) {
			return bindActionCreators({ fetchWeather }, dispatch);
		}

		export default connect(null, mapDispatchToProps)(SearchBar); // mapDispatchToProps is second argument and no state is maintained

### Redux-Promise Continued ###
1. src/reducers/reducer_weather.js

		export default function(state = null, action) {
			console.log('Action received', action);
			return state;
		}

2. src/reducers/index.js

		import WeatherReducer from './reducer_weather';
		...
		const ... {
			weather: WeatherReducer
		}

3. `actions/index.js`

		export function ... {
			...
			console.log('Request:', request);
			...
		}

	1. Instead of promise object being console logged, the actual response is obtained (Why?)
		1. Redux-Promise - sees action, looks at payload property. If payload is promise, it stops action and when request finishes, it dispatches new action with payload or resolved request
	2. Steps:
		1. Action flows and enters middleware
		2. Redux-Promise middleware:
			1. Checks if action has a promise as a payload
			2. If yes:
				1. Stops the action
				2. After promise resolves, a new action is created and sent to reducers
			3. If no:
				2. Let it go through
		3. Action is sent to reducers
4. Remove console.log from `reducer_weather.js` and `actions/index.js`

### Avoiding State Mutations in Reducers ###
1. `reducer_weather.js`

		import { FETCH_WEATHER } from '../actions/index';

		export default function(state = [], action) {
			switch (action.type) {
			case FETCH_WEATHER:
				return [ action.payload.data, ...state ];	// ...state - flattens the array
			}
		}

	1. `state.push(action.payload.data)` - trap
		1. do not manipulate state directly
		2. return only new instance of state
			1. `state.concat([action.payload.data]);`

### Building a List Container ###
1. `src/containers/weather_list.js`

		import React, { Component } from 'react';
		import { connect } from 'react-redux';

		class WeatherList extends Component {
			render() {
				return (
					<table className="table table-hover">
						<thead>
							<tr>
								<th>City</th>
								<th>Temperature</th>
								<th>Pressure</th>
								<th>Humidity</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				);
			}
		}

		function mapStateToProps({ weather }) { // Pulling state.weather
			return { weather };	// Instead of { weather: weather }
		}

		export default connect(mapStateToProps)(WeatherList);

2. `src/components/app.js`

		import WeatherList from '../containers/weather_list';
		...
		export ... {
			render() {
				return (
					<div>
						...
						<WeatherList />
					</div>
				);
			}
		}

### Mapping Props to a Render Helper ###
1. weather_list.js

		renderWeather(cityData) {
			const name = cityData.city.name;
			return (
				<tr key={name}>
					<td>{name}</td>
				</tr>
			);
		}
		...
		<tbody>
			{this.props.weather.map(this.renderWeather)}
		</tbody>

### Quick Note ###
1. `react-sparklines` - run `npm i --save react-sparklines@1.6.0` (not broken code)

### Adding Sparkline Charts ###
1. [React Sparklines](https://github.com/borisyankov/react-sparklines)
2. `weather_list.js`

		import { Sparklines, SparklinesLine } from 'react-sparklines';

		class ... {
			renderWeather(...) {
				...
				const temps = cityDate.list.map(weather => weather.main.temp)
				console.log(temps);

				return (
					<tr ...>
						<td>{name}</td>
						<td>
							<Sparklines height={120} width={100} data={temps}>
								<SparklinesLine color="red" />
							</Sparklines>
						</td>
					...
				);
			}
		}

3. `npm install --save react-sparklines`

### Making a Reusable Chart Component ###
1. `src/components/chart.js`

		import React from 'react';
		import { Sparklines, SparklinesLine } from 'react-sparklines';

		export default (props) => {
			return (
				<div>
					<Sparklines height={120} width={100} data={props.data}>
						<SparklinesLine color={props.color} />
					</Sparklines>
				</div>
			);
		}

2. `src/containers/weather_list.js`

		import Chart from '../components/chart';
		...
		return (
			...
			<td>
				<Chart data={temps} color="orange" />
			</td>
			...
		)

### Labeling of Units ###
1. weather_list.js

		const pressures = cityDate.list.map(weather => weather.main.pressure);
		const humidities = cityDate.list.map(weather => weather.main.humidity);
		...
		<td><Chart data={pressures} color="green" /></td>
		<td><Chart data={humidities} color="black" /></td>

2. Average line
	1. chart.js

			import _ from 'lodash';
			import { ..., SparklinesReferenceLine } from 'react-sparklines';
		
			function average(data) {
				return _.round(_.sum(data)/data.length);
			}
			...
			<SparklinesReferenceLine type="avg" />
			</Sparklines>
			<div>{average(props.data)}</div>

2. weather_list.js

		<Chart ... units="K" />
		<Chart ... units="hPa" />
		<Chart ... units="%" />
		...
		<th>Temperature (K)</th>
		<th>Pressure (hPa)</th>
		<th>Humidity (%)</th>

### Google Maps Integration ###
1. style/style.css

		td, th {
			vertical-align: middle !important;
			text-align: center !important;
		}

		.input-group {
			margin: 20px 0px;
		}

		svg {
			height: 150px;
		}

2. src/components/google_map.js

		import React, { Component } from 'react';

		class GoogleMap extends Component {
			componentDidMount() {
				new google.maps.Map(this.refs.map, {
					zoom: 12,
					center: {
						lat: this.props.lat,
						lng: this.props.lon
					}
				});
			}

			render() {
				// this.refs.map
				return <div ref="map" />;	// gets a reference to html element rendered to page - after it is rendered, we can get a direct reference to this div element
			}
		}

		export default GoogleMap;

	1. index.js has google maps api
		1. `google.maps`

### Google Maps Integration Continued ###
1. `componentDidMount()` - called soon after component is rendered to the screen
	1. `this.refs.map` - element in which map must be rendered
		1. `zoom` zoom level
		2. `center` - where we want to center the map on
2. weather_list.js

		import GoogleMap from '../components/

		renderWeather(cityData) {
			...
			const { lon, lat } = cityData.city.coord;
			...
			<td><GoogleMap lon={lon} lat={lat} /></td>
			...
		}

3. style/style.css

		...
		td:first-of-type, td:first-of-type > div {
			height: 200px;
			width: 250px;
		}
 
### Project Review ###
1. Middlewares - Redux Promise
2. Axios - Ajax requests
3. Reducers non mutation of state
4. Google Map
5. Re-usable components

## Bonus - RallyCoding ##
### Basics of Redux Thunk ###
1. Redux Thunk - Used to handle asynchronous action builders
	1. React + Redux Cycle (Synchronous)
		1. React - User clicks something
		2. Action builder is invoked
		3. Action is produced
		4. Action flows into Middleware
		5. Middleware processes action
		6. Reducers receive action
		7. Reducers produce state
		8. State flows into React
2. Asynchronous requests:
	1. Action Builder makes Asynchronous request and after receiving response builds action
	2. Thunk gives control over dispatch method
3. Example app:
	1. src/components/app.js

			import React, { Component } from 'react';
			import { connect } from 'react-redux';
			import * as actions from '../actions';

			export default class App extends Component {
				componentWillMount() {
					this.props.fetchUsers();
				}

				renderUser({id, name, email}) {
					return (
						<li className="list-group-item" key={id}>
							<span className="label label-default label-pill pull-xs-right">
								<a href={email}>{email}</a>
							</span>
							{name}
						</li>
					);
				}

				render() {
					return (
						<div>
							<h4>Email Directory</h4>
							<ul className="list-group">
								{this.props.users.map(this.renderUser)}
							</ul>
						</div>
					);
				}
			}
			...

	2. src/actions/index.js

			import axios from 'axios';

			export function fetchUsers() {
				const request = axios.get('http://jsonplaceholder.typicode.com/users');

				// Vanilla redux expects us to return an action
				return (dispatch) => {	// JS function can be returned with redux-thunk
					request.then(({data}) => {
						dispatch({ type: 'FETCH_PROFILES', payload: data })
					});
				};
			}

		1. Sequence of events:
			1. Component calls 'fetchUsers' (When component mounts)
			2. Request to API made
			3. fetchUsers returns function
			4. RT immediately calls function w/dispatch (middleware)
			5. ...time passes...
			6. Request resolves
			7. Call dispatch with action

### Combining Redux and Firebase ###
1. `ReactFire` - binding between firebase and React
	1. Injects data into React components
	2. Firebase -> ReactFire -> React <-> Redux
		1. React <-> Redux <-> Firebase
			1. Firebase injects data into Redux store which is passed to React
2. Example app: Blog post
	1. src/actions/index.js

			import _ from 'lodash';
			import {
				FETCH_POSTS,
				DELETE_POST,
				BUILD_POST
			} from './types';

			const INITIAL_POSTS = { 123: 'One Wierd Trick...', 456: 'Bet you wanted to read this' };

			export function fetchPosts() {
				return {
					type: FETCH_POSTS,
					payload: INITIAL_POSTS
				};
			}

			export function buildPost(post) {
				return {
					type: BUILD_POST,
					payload: { [_.uniqueId()]: post }
				};
			}

			export function deletePost(key) {
				return {
					type: DELETE_POST,
					payload: key
				};
			}
			

3. Redux vs Firebase:
	1. Redux:
		1. Action Builder produces Action
		2. Action Flows into Reducers
		3. Reducers Produces State
	2. Firebase:
		1. Firebase Ref
		2. 'value' event emitted by Firebase
		3. 'value' event emitted by Firebase
		4. 'value' event emitted by Firebase
		5. ...
4. Solution:
	1. Firebase triggers 'value' event
	2. Action gets generated
	3. Action sent to Reducers
	4. Reducers poduces state
	5. State is rendered
5. actions/index.js

		const Posts = new Firebase('https://fbredux.firebaseio.com');

		export function fetchPosts() {
			return dispatch => {
				Posts.on('value', snapshot => {
					dispatch({
						type: FETCH_POSTS,
						payload: snapshot.val()	// JSON representation of data loaded by firebase
					});
				});
			};
		}

		export function createPost(post) {
			return dispatch => Posts.push(post);	// Pushes to database, value event is triggered
		}

		export function deletePost(key) {
			return dispatch => Posts.child(key).remove(); // Automatically fires value event
		}

### Dynamic Forms with Redux Form ###
1. `redux-form` - validation, submission
	1. Example: Blog post
			
			Import statements
				React compoent
					Render Method
				Validation Function
				Export Statement

2. Refactoring: Remove duplicate code

		import _ from 'lodash';
		...
		const FIELDS = {
			title: {  
				type: 'input',
				label: 'Title for Post'
			},
			categories: {
				type: 'input',
				label: 'Enter some categories for this post'
			},
			content: {
				type: 'textarea',
				label: 'Post Contents'
			}
		};
		// ['title', 'categories', 'content'];

		class PostsNew extends Component {
			...
			renderField(fieldConfig, field) {
				const fieldHelper = this.props.fields[field];

				return (
					<div className={`form-group ${fieldHelper.touched && fieldHelper.invalid ? 'has-danger' : '' }`} >
						<label>{fieldConfig.label}</label>
						<fieldConfig.type type="text" className="from-control" {...fieldHelper} />
						<div className="text-help">
							{fieldHelper.touched ? fieldHelper.error : ''}
						</div>
					</div>
				);
			}

			render() {
				const { fields: { title, categories, content }, handleSubmit } = this.props;

				return (
					<form onSubmit={handleSubmit(props => this.onSubmit(props))} >
						<h3>Creation of a New Post</h3>
						{_.map(FIELDS, this.renderField.bind(this))}
						<button type="submit" className="btn btn-primary">Submit</button>
						<Link to="/" className="btn btn-danger">Cancel</Link>
					</form>
				);	
			}
		}

		function validate(values) {
			const errors = {};

			_.each(FIELDS, (type, field) => {
				if (!values[field]) {
					errors[field] = `Ender a ${field}`;
				}
			});

			return errors;
		}

		export default reduxForm({
			form: 'PostsNew',
			fields: _.keys(FIELDS),
			validate
		})(PostsNew);

	1. Decide properties to have

			validate: () => {...}

### Logicless Components with Reselect ###
1. `reselect` - library - used to compute derived or calculated state for redux project
2. Example:
	1. Structure

			Selected Posts
				A selected post
				Another selected post

			All Posts
				check box post 1
				check box post 2
				...

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