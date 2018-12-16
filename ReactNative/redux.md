# Redux #
## Read Me ##
1. Redux is a predictable state container for JS apps
2. Helps us write apps that behave consistently, run in different environments (client, server, native) and are easy to test
3. Provides good developer experience (live code editing, time traveling debugger)
4. Redux can be used with React (or any other view library)
	1. It is 2kB including dependencies

### Learn Redux ###
1. Variety of resources available for learning

#### Just the Basics ####
1. For newbies to Redux
	1. [basic tutorial in Redux docs](https://redux.js.org/basics)
	2. [Getting Started with Redux video](https://egghead.io/series/getting-started-with-redux): from Dan Abramov
		1. 
	3. [Redux Fundamentals slideshow](http://blog.isquaredsoftware.com/2018/03/presentation-reactathon-redux-fundamentals/), [list of suggested resources for learning Redux](http://blog.isquaredsoftware.com/2017/12/blogged-answers-learn-redux/): by Mark Erikson
	4. [Redux example applications](https://redux.js.org/introduction/examples): For learning by playing with code
		1. Available as separate projects in Redux repo
		2. Interactive online examples on CodeSandbox
	5. [Redux Tutorials](https://github.com/markerikson/react-redux-links/blob/master/redux-tutorials.md): Top list of tutorials
		1. [What Does Redux Do?(and when should you use it?)](https://daveceddia.com/what-does-redux-do/)
		2. [How Redux Works: A Counter-Example](https://daveceddia.com/how-does-redux-work/): Intro to basics of Redux and how to use it with React
		3. [React and Redux: An Introduction](http://jakesidsmith.com/blog/post/2017-11-18-redux-and-react-an-introduction/)
		4. [React Redux Tutorial for Beginners: Learning Redux in 2018](https://www.valentinog.com/blog/react-redux-tutorial-beginners/)
		5. [Leveling Up with React: Redux](https://css-tricks.com/learning-react-redux/): Covers Redux basics
		6. [DevGuiges: Introduction to Redux](http://devguides.io/redux/): Covers different aspects of Redux (actions, reducers, usage with React, middleware)

#### Intermediate Concepts ####
1. Working with asynchronous logic and AJAX requests
2. Connecting a UI framework like React to Redux store
3. Setting up app to use Redux

##### Topics #####
1. ["Advanced" docs section](https://redux.js.org/advanced): covers working with async logic, middleware, routing
2. ["Learning Resources"](https://redux.js.org/introduction/learning-resources): Recommended articles on a variatey of Redux-related topics
3. [Building a Simple CRUD App with React + Redux](http://www.thegreatcodeadventure.com/building-a-simple-crud-app-with-react-redux-part-1/): Series

#### Real-World Usage ####
1. Production app resources:
	1. [free "Building React Application with Idiomatic Redux" video series](https://egghead.io/courses/building-react-applications-with-idiomatic-redux): builds on first video series and covers middleware, routing, persistence
	2. [Redux FAQ](https://redux.js.org/faq): Common questions about how to use Redux
	3. [Recipes docs section](https://redux.js.org/recipes): Has information on handling derived data, testing, structuring reduce logic, reducing boilerplate
	4. ["Practical Redux" tutorial series](http://blog.isquaredsoftware.com/series/practical-redux/): Real-world intermediate and advanced techniques for working with React and Redux ([an interactive course on Educative.io](https://www.educative.io/collection/5687753853370368/5707702298738688))
	5. [React/Redux links list](https://github.com/markerikson/react-redux-links): articles on working with:
		1. [reducers and selectors](https://github.com/markerikson/react-redux-links/blob/master/redux-reducers-selectors.md)
		2. [managing side effects](https://github.com/markerikson/react-redux-links/blob/master/redux-side-effects.md)
		3. [Redux architecture and best practices](https://github.com/markerikson/react-redux-links/blob/master/redux-architecture.md)
		4. ["Ecosystem" docs page](https://redux.js.org/introduction/ecosystem): lists our recommendations
			1. [Redux addons catalog](https://github.com/markerikson/redux-ecosystem-links)
		5. [purpose-built examples and real-world applications](https://github.com/markerikson/redux-ecosystem-links/blob/master/apps-and-examples.md): to learn from actual app code bases, addons catalog list
		6. [Redux workshops through Workshop.me](https://redux.js.org/#redux-workshops): Series of workshops
			1. [Workshop Schedule](https://workshop.me/?a=mark)

#### Help and Discussion ####
1. [#redux channel](https://discord.gg/0ZcbPKXt5bZ6au5t) of [Reactiflux Discord community](http://www.reactiflux.com/):
	1. Official resource for all questions related to learning and using Redux
	2. Great place to hang out and ask questions

### Before Proceeding Further ###
2. Redux is valuable tool for organizing state
	1. Check if it is appropriate for the situation
		1. Potential benefits and tradeoffs of using it:
			1. Reasonable amount of data changing over time
			2. Need single source of truth for the state
			3. If keeping state in top-level component is no longer sufficient
3. Integration point depends on user and app
4. How Redux is used:
	1. [You Might Not Need Redux](https://medium.com/@dan_abramov/you-might-not-need-redux-be46360cf367)
	2. [The Tao of Redux, Part 1 - Implementation and Intent](http://blog.isquaredsoftware.com/2017/05/idiomatic-redux-tao-of-redux-part-1/)
	3. [The Tao of Redux, Part 2 - Practice and Philosophy](http://blog.isquaredsoftware.com/2017/05/idiomatic-redux-tao-of-redux-part-2/)

### Developer Experience ###
1. [Hot Reloading with Time Travel](https://www.youtube.com/watch?v=xsSnOQynTHs)
	1. Goal: State management library with minimal API but completely predictable behavior
		1. Redux capabilities:
			1. Logging
			2. Hot reloading
			3. Time travel
			4. Universal apps
			5. Record and replay

### Influences ###
1. Redux evolves on [Flux](http://facebook.github.io/flux/) (avoids its complexity by taking ideas from [Elm](https://github.com/evancz/elm-architecture-tutorial/))

### Installation ###
1. To install stable version:

		npm install --save redux
		
2. [access files on unpkg](https://unpkg.com/redux/): If not using npm
3. [CommonJS](http://webpack.github.io/docs/commonjs.html): Redux is consumed as these modules
	1. When `redux` is imported in [Webpack](https://webpack.js.org/), [Browserify](http://browserify.org/)
4. If not using a bundler: npm package includes precompiled production and development UMD builds in `dist` folder
	1. Can be used without bundler and compatible with popular JS module loaders and environments
		1. Use UMD build as `<script>` tag on page (or [tell Bower to install it](https://github.com/reduxjs/redux/pull/1181#issuecomment-167361975))
		2. Redux can be made available as `window.Redux` global variable
5. Redux is written in ES2015 (ES6) but compiled to ES5
	1. Babel or module bundler is not required to use Redux

#### Complementary Packages ####
1. [React Bindings](https://github.com/reduxjs/react-redux), [Developer tools](https://github.com/reduxjs/redux-devtools)

		npm install --save react-redux
		npm install --save-dev redux-devtools
		
	1. Other packages in Redux ecosystem don't provide UMD builds
		1. Use CommonJS module bundlers like Webpack and Browserify
### The Gist ###
1. Whole state of an object is stored in object tree inside single store
	1. The only way to change state is to emit an action (it is an object describing what happened)
	2. To specify how actions transform state tree, we need to write reducers
2. Example:

		import { createStore } from 'redux';
		
		/**
		* This is a reducer, a pure function with (state, action) => state signature.
		* It describes how an action transforms the state into the next state
		* 
		* The shape of the state is up to you: it can be a primitive, an array, an object,
		* or an Immutable.js data structure. The only important part is that you should
		* not mutate the state object, but return a new object if the state changes.
		* 
		* In this example, we use a `switch` statement and strings, but you can use a helper that
		* follows a different convention (such a function maps) if it makes sense for your
		* project
		*/
		function counter(state = 0, action) {
			switch (action.type) {
				case 'INCREMENT':
					return state + 1
				case 'DECREMENT':
					return state - 1
				default:
					return state
			}
		}
		
		// Create a Redux store holding the state of your app.
		// Its API is { subscribe, dispatch, getState }.
		let store = createStore(counter);
		
		// You can use subscribe() to update the UI in response to state changes.
		// Normally you'd use a view binding library (e.g. React Redux) rather than subscribe() directly.
		// However it can also be handy to persist the current state in the localStorage.
		
		store.subscribe(() =>
			console.log(store.getState());
		);
		
		// The only way to mutate the internal state is to dispatch an action.
		// The actions can be serialized, logged or stored and later replayed.
		store.dispatch({ type: 'INCREMENT' });
		// 1
		store.dispatch({ type: 'INCREMENT' });
		// 2
		store.dispatch({ type: 'DECREMENT' });
		// 1
		
3. Instead of mutating state directly, specify mutations using actions
4. Write special function called reducer that decides how every action transforms the entire app state
	1. Redux doesn't have a dispatcher or support many stores
		1. Only single store with single root reducing function
			1. If app grows, split root reducer into small reducers independently operating on different parts of state tree
				1. Similar to how there is single root component in React app but is composed out of many small components
5. The architecture scales to large and complex apps
	1. Powerful developer tools can be used because state can be traced back to actions that caused it
		1. We can record user sessions and reproduce them by just replaying every action

### Learn Redux from Its Authors ###
#### Redux Video Tutorials by Dan Abramov ####
##### Getting Started with Redux #####
1. [Getting Started with Redux](https://egghead.io/series/getting-started-with-redux)
	1. 30 videos narrated by Dan Abramov (Author of Redux)
	2. Complements basics part of docs
	3. Additional insights about 
		1. Immutability
		2. Testing
		3. Redux best practices
		4. Using Redux with React
2. Courses:
	1. [Great course on egghead.io by @dan_abramov - instead of just showing you how to use #redux, it also shows how and why redux was built!](https://twitter.com/sandrinodm/status/670548531422326785)
	2. [Plowing through @dan_abramov 'Getting Started with Redux' - its amazing how much simpler concepts get with video](https://twitter.com/chrisdhanaraj/status/670328025553219584)
	3. [This video series on Redux by @dan_abramov on @eggheadio is spectacular!](https://twitter.com/eddiezane/status/670333133242408960)
	4. [Come for the name hype. Stay for the rock solid fundamentals. (Thanks, and great job @dan_abramov and @eggheadio!](https://twitter.com/danott/status/669909126554607617)
	5. [This series of videos on Redux by @dan_abramov is repeatedly blowing my mind - gunna do some series refactoring](https://twitter.com/gelatindesign/status/669658358643892224)
	6. [What the free "Getting Started with Redux" video series](https://egghead.io/series/getting-started-with-redux)
		1. [Egghead instructors](https://egghead.io/instructors): Are open source library authors

##### Building React Applications with Idiomatic Redux #####
1. [Building React Applications with Idiomatic Redux](https://egghead.io/courses/building-react-applications-with-idiomatic-redux): Free video series by Dan Abramov (continuation of first series)
	1. Production ready techniques for React and Redux apps
	2. Advanced state management
	3. Middleware
	4. Rect Router integration
	5. Other common problems encountered while building apps for clients and customers

#### Practical Redux Course ####
1. [Practical Redux](https://www.educative.io/collection/5687753853370368/5707702298738688/): Paid interactive course by Redux co-maintainer [Mark Erikson](https://twitter.com/acemarke):
	1. How to apply the basic concepts of Redux to building something larger thant TodoMVC
	2. Real world topics:
		1. Adding Redux to Create-React-App project and configuring Hot Module Replacement for faster development
		2. Controlling UI behavior with Redux
		3. Using Redux-ORM library to manage relational data in Redux store
		4. Writing custom advanced Redux reducer logic to solve specific problems
		5. Optimizing performance of Redux-connected form inputs
		6. ...
	3. Based on ["Practical Redux" blog tutorial series](http://blog.isquaredsoftware.com/series/practical-redux/)

#### Redux Workshops ####
1. [Workshop.me](https://workshop.me/): To teach series of Redux workshops
2. [Redux Fundamentals workshop](https://workshop.me/2018-04-react-redux?a=mark):
	1. History and purpose of Redux
	2. Reducers, actions, and working with a Redux store
	3. Using Redux with React
	4. Using and writing Redux middleware
	5. Working with AJAX calls and other side effects
	6. Unit testing Redux apps
	7. Real-world Redux app structure and development

## Introduction ##
### Motivation ###
1. Requirements for single-page app have become complicated
2. State can include:
	1. server responses
	2. cached data
	3. locally created data not yet persisted to server
3. UI requirements are also complex:
	1. Managing active routes
	2. Managing selected tabs
	3. Managing spinners
	4. Managing pagination controls
	5. ...
4. We cannot understand what happens in app as we have lost control over the when, why and how of its state
	1. Non-deterministic system may give rise to hard to reproduce bugs or add new features
	2. New requirements coming frequently in front-end product development
	3. Things to handle:
		1. Optimistic updates
		2. Server-side rendering
		3. Fetching data before performing route transitions
		4. ...
	4. Too much complexity
5. React tries to solve the problem by removing both asynchrony and direct DOM manipulation
6. Redux manages the state of the data
	1. Makes state mutations predictable by imposing certain restrictions on how and when updates can happen
		1. [Three principles of Redux](https://redux.js.org/introduction/threeprinciples)

### Core Concepts ###
1. State of todo app:

		{
			todos: [{
				text: 'Eat food',
				completed: true
			}, {
				text: 'Exercise',
				completed: false
			}],
			visibilityFilter: 'SHOW_COMPLETED'
		}
		
	1. Object is like "model" but no setters (state cannot be changed arbitrarily)
2. To change state, dispatch an action
	1. Action: Plain JavaScript object that describes what happened
		1. Examples:
		
				{ type: 'ADD_TODO', text: 'Go to swimming pool' }
				{ type: 'TOGGLE_TODO', index: 1 }
				{ type: 'SET_VISIBILITY_FILTER', filter: 'SHOW_ALL' }

			1. To understand what is going on in the app
			2. Actions are like breadcrumbs of what has happened
			3. Reducer ties action to state
				1. A function that takes state and action as arguments and returns the next state of the app.
				2. Smaller functions are written to parts of the state
	2. Reducer example:
	
			function visibilityFilter(state = 'SHOW_ALL', action) {
				if (action.type === 'SET_VISIBILITY_FILTER') {
					return action.filter;
				} else {
					return state;
				}
			}
			
			function todos(state = [], action) {
				switch (action.type) {
					case 'ADD_TODO':
						return state.concat([{ text: action.type, completed: false }]);
					case 'TOGGLE_TODO':
						return state.map(
							(todo, index) =>
								action.index === index
									? { text: todo.text, completed: !todo.completed }
									: todo
						);
					default:
						return state
				}
			}
			
		1. Write another reducer that manages complete state of the app by calling those two reducers for the corresponding state keys
		
				function todoApp(state = {}, action) {
					return {
						todos: todos(state.todos, action),
						visibilityFilter: visibilityFilter(state.visibilityFilter, action)
					};
				}
				
	3. Redux comes with a few utilities to facilitate the pattern
		1. 90% of code is plain old JavaScript
				
### Three Principles ###
1. Redux can be described in three principles

#### Single source of truth ####
1. State of whole app is stored in object tree within single store
	1. State from server can be serialized and hydrated into client with no extra coding effort
	2. Single state tree makes it easier to debug or inspect an app
	3. Enables us to persist the app's state in development
		1. Faster development cycle
	4. Undo/Redo operations can be implemented (if state stored in single tree)
2. Example:

		console.log(store.getState());
		
		/* Prints
		{
			visibilityFilter: 'SHOW_ALL',
			todos: [
				{
					text: 'Consider using Redux',
					completed: true
				},
				{
					text: 'Keep all state in a single tree',
					completed: false
				}
			]
		}
		*/

#### State is read-only ####
1. The only way to change state is to emit an action (an object describing what happened)
	1. Neither views nor network callbacks write directly to state
		1. They just express an intent to transform the state
	2. State changes happen one by one in a strict order (no race conditions to watch for)
	3. Actions can be logged, serialized, stored, replayed or debugged since they are POJOs
2. Example:

		store.dispatch({
			type: 'COMPLETE_TODO',
			index: 1
		});
		
		store.dispatch({
			type: 'SET_VISIBILITY_FILTER',
			filter: 'SHOW_COMPLETED'
		});
	
#### Changes are made with pure functions ####
1. To specify how state tree is transformed by actions, we write pure reducers
	1. Reducers: Pure functions that take previous state and action, and return the next state
		1. New state object must be returned instead of mutating the previous state
	2. Start with single reducer and as app grows, split it off into smaller reducers that manage specific parts of the state tree.
	3. Reducers are just functions
		1. Order can be controlled
		2. Pass additional data
		3. Build reusable reducers for common tasks (pagination)
2. Example:

		function visibilityFilter(state = 'SHOW_ALL', action) {
			switch (action.type) {
				case 'SET_VISIBILITY_FILTER':
					return action.filter;
				default:
					return state;
			}
		}
		
		function todos(state = [], action) {
			switch (action.type) {
				case 'ADD_TODO':
					return [
						...state,
						{
							text: action.text,
							completed: false
						}
					];
				case 'COMPLETE_TODO':
					return state.map((todo, index) => {
						if (index === action.index) {
							return Object.assign({}, todo, {
								completed: true
							});
						}
					});
				default:
					return state;
			}
		}
		
		import { combineReducers, createStore } from 'redux';
		const reducer = combineReducers({ visibilityFilter, todos });
		const store = createStore(reducer);

### Prior Art ###
1. Redux is similar to some patterns and technologies but is also different

#### Flux ####
1. Redux is partially Flux implementation
2. Similarities:
	1. Model update logic is in certain layer of app ("stores" in Flux, "reducers" in Redux)
	2. Every mutation is defined as plain object called "action"
	3. `(state, action) => state`
	4. Don't mutate state in redux
		1. Use [object spread operator proposal](https://redux.js.org/recipes/usingobjectspreadoperator), [Immutable](https://facebook.github.io/immutable-js)
3. Differences:
	1. No Dispatcher in Redux
		1. Pure functions are used instead of event emitters
4. Mutating reducer logic will break time travel, record/replay, or hot reloading
	1. There wont be performance problems
		
#### Elm ####
1. Functional programming language inspired by Haskell and build by Evan Czaplicki
2. Enforces "model view update" architecture (update has the signature `(action, state) => state`)
	1. Updaters serve the same purpose as reducers in Redux
3. Characteristics:
	1. Enforced purity
	2. Static typing
	3. Out of box immutability
	4. Pattern matching
4. Elm architecture is interesting
	1. [JavaScript library playgound implementing similar ideas](https://github.com/paldepind/noname-functional-frontend-framework)
	2. [Gradual typing solution like Flow](https://github.com/reduxjs/redux/issues/290)

#### Immutable ####
1. It is JavaScript library
	1. Implements persistent data structures
	2. Performant
	3. Has idiomatic JavaScript API
2. It can be used with Redux
3. Redux doesn't care how state is stored
	1. Plain object
	2. Immutable object
	3. ...
4. Any data storage can be used that supports immutability
	1. No Backbone
	2. No cursors
5. Mechanism:
	1. State tree is read-only
	2. Use redux for updating state
	3. Subscribe to updates
6. Selectors: Used for cursors
	1. Composible getter functions

#### Baobab ####
1. Library for implementing immutable API for updating JS objects
2. Need not be used with Redux
3. It solves the problem differently

#### RxJS ####
1. Superb way to manage complexity of asynchronous apps
2. It works great with Redux
	1. A redux store can be exposed as an observable
	
			function toObservable(store) {
				return {
					subscribe({ next }) {
						const unsubscribe = store.subscribe(() => next(store.getState()))
						next(store.getState))
						return { unsubscribe }
					}
				}
			}
			
		1. Asynchronous streams can be turned into actions before feeding them to `store.dispatch()`
3. Redux is not required if we use RxJS
	1. Redux can be re-implemented in RxJS (two liner using `.scan()`)
4. Cycle: For reactive data flow
	1. Can be combined with Redux

### Learning Resources ###
1. Other resources that teach advanced concepts of Redux
2. Recommendations

#### Basic Introductions (https://redux.js.org/introduction/learningresources) ####
1. Getting started with Redux - Video Series
2. Building React Applications with Idiomatic Redux - Video Series
3. Live React: Hot Reloading and Time Travel
4. A Cartoon Guide to Redux
5. Leveling Up with React: Redux
6. An Introduction to Redux
7. Redux Tutorial
8. Redux: From Twitter Hype to Production
9. DevGuides: Introduction to Redux
	
#### Using Redux With React ####
1. `connect` function:
	1. Why Redux is Useful in React Apps
		1. Sharing data between components
		2. Hot module reloading
	2. What does Redux Do? (and when should you use it?)
	3. How Redux Works: A Counter-Example
	4. Redux and React: An Introduction

#### Project-Based Tutorials ####
1. Tutorials for Redux concepts by building projects, including larger "real-world" type apps
	1. Practical Redux
		1. Managing relational data
		2. Connecting multiple components and lists
		3. Reducer logic for features
		4. Handling forms
		5. Modal dialogs
		6. ...
	2. Building a Simple CRUD App with React + Redux
		1. Routing
		2. AJAX calls
	3. Soundcloud Client in React + Redux
		1. project setup
		2. Routing
		3. Authentication
		4. Fetching remote data
		5. Wrapping stateful library
	4. Full-Stack Redux Tutorial
	5. Getting Started with React, Redux and Immutable: a Test-Driven Tutorial
		1. Mocka + JSDOM testing configuration
	6. Redux Hero: An Intro to Redux and Reselect
		1. Game development

#### Redux Implementation ####
1. How redux works internally (miniature re-implementations)
2. Tutorials
	1. Build Yourself a Redux
		1. `connect`
		2. Middleware
	2. Connect.js explained
	3. Let's Write Redux!

#### Reducers ####
1. Taking Advantage of `combineReducers`
2. The Power of Higher-Order Reducers
3. Reducer composition with Higher Order Reducers
4. Higher Order Reducers - It just sounds scary

#### Selectors ####
1. How and why selector functions can be used to read values from state
	1. ReactCasts #8: Selectors in Redux
	2. Optimizing React Redux Application Development with Reselect
	3. Usage of Reselect in a React-Redux Application
	4. React, Reselect, and Redux

#### Normalization ####
1. Now to structure Redux store like a database for best performance
	1. Querying a Redux Store
		1. Normalization of data
		2. Selector functions
	2. Normalizing Redux Stores for Maximum Code Reuse
	3. Redux Normalizr: Improve your State Management
	4. Advanced Redux Entity Normalization

#### Middleware ####
1. How middleware work and how to write them:
	1. Exploring Redux Middlewares
		1. Small experiments
	2. Redux Middleware Tutorial
		1. `applyMiddleware`
	3. ReactCasts #6: Redux Middleware
	4. A Beginner's Guide to Redux Middleware

#### Side Effects - Basics ####
1. Asyn behavior in Redux
	1. Stacke Overflow: Dispatching Redux Actions with a Timeout
		1. Managing async behavior in Redux
			1. Inline async calls
			2. Async action creation
			3. Thunk middleware
	2. Stack Overflow: Why do we need middleware for async flow in Redux?
		1. Thunk and Async middleware
		2. Patterns for using thunk
	3. What the heck is "thunk"?
		1. General meaning and special meaning
	4. Thunks in Redux: The Basics
		1. Details of what they solve and how to use them

#### Side Effects - Advanced ####
1. Advanced tools and techniques for managing async behavior
	1. What is the right way to do asynchronous operations in Redux?
		1. Popular libraries
	2. Redux 4 Ways
		1. Thunk
		2. saga
		3. Observables
		4. Promise
	3. Idiomatic Redux: Thoughts on Thunks, Sagas, Abstractions, and Reusability
	4. JavaScript Power Tools: Redux-Saga
		1. Concepts
			1. ES6 generators
			2. Composition for concurrency
		2. Implementation
			1. Use cases
		3. Benefits
	5. Exploring Redux Sagas
	6. Taming Redux with Sagas
		1. Includes testing Saga
	7. Reactive Redux State with RxJS
		1. Reactive Programming with RxJS library
		2. Using Redux observable to fetch data
		3. Testing
	8. Using redux-observable to handle asynchronous logic in Redux
		1. thunk vs observable

#### Thinking in Redux ####
1. Deep look into Redux usage
	1. You Might Not Need Redux
	2. Idiomatic Redux: The Tao of Redux, Part 1 - Implementation and Intent
		1. Constraints
	3. Idiomatic Redux: The Tao of Redux, Part 2 - Practice and Philosophy
	4. What's So Great About Redux?
		1. Comparison to OOP and message-passing
			1. Devolution to Java-like "setter" functions
				1. Boilerplate

#### Redux Architecture ####
1. Patterns and practices for structuring larger Redux applications
	1. Avoiding Accidental Complexity When Structuring Your App State
		1. Organizing Redux store structure
	2. Redux Step by Step: A Simple and Robust Workflow for Real Life Apps:
	3. Things I Wish I Knew About Redux
		1. Tips
			1. Connecting components
			2. Selecting data
			2. app/project structure
	4. React+Redux: Tips and Best Practices for Clean, Reliable, & Maintainable Code
		1. Tips and suggestions
			1. Simple action creations
			2. Simple data manipulation in reducers
			3. Abstracting away API calls
			4. Avoiding spreading props
	5. Redux for state management in large web apps
		1. Idiomatic Redux architecture

#### Apps and Examples ####
1. React-Redux RealWorld Example: TodoMVC for the Real World
	1. Full stack app built with Redux
		1. JWT authentication
		2. CRUD
		3. Favoriting articles
		4. Following users
		5. Routing
		6. ...
	2. Project Mini-Mek
		1. Redux techniques
	3. react-redux-yelp-clone
	4. Sound-Redux
	5. Tello
		1. For managing TV shows
	6. io-808
		1. drum machine

#### Books ####
1. Redux in Action
	1. Comprehensive
	2. Basics of reducers and actions using React
	3. Complex middlewares and side effects
	4. Application structure
	5. Performance
	6. Testing
2. The Complete Redux Book
	1. Managing state in production
	2. Store enhancers
	3. Form validations

#### Courses ####
1. Modern React with Redux, by Stephen Grider (paid)
2. Redux, by Tyler McGinnis (paid)
	1. Optimistic updates
	2. Error handling
	3. Firebase
	4. CSS Modules
3. Learn Redux, by Wes Bos (free)
	1. Building photo app
#### More Resources ####
1. React-Redux Links: high quality articles, tutorials, related content for React, Redux, ES6, ...
2. Redux Ecosystem Links: Collection of Redux-related libraries, addons, utilities
3. Awesome Redux: Redux-related repositories	
	
### Ecosystem ###
1. Addons, libraries and tools are written
	1. Makes it easier to implement features and solve problems in app
2. [Redux Ecosystem Links](https://github.com/markerikson/redux-ecosystem-links): Catalog of libraries, addons, tools related to Redux
3. [React/Redux Links](https://github.com/markerikson/react-redux-links): Tutorials and useful resources for anyone learning React or Redux
4. Staff picks:
	1. Library Integration and Bindings
	2. Reducers
		1. Reducer Combination
		2. Reducer Composition
		3. Higher-Order Reducers
	3. Actions
	4. Utilities
	5. Store
		1. Change Subscriptions
		2. Batching
		3. Persistence
	6. Immutable Data
		1. Data Structures
		2. Immutable Update Utilities
		3. Immutable/Redux Interop
	7. Middleware
		1. Networks and Sockets
		2. Async Behavior
		3. Analytics
	8. Entities and Collections
	9. Component State and Encapsulation
	10. Dev Tools
		1. Debuggers and Viewers
		2. Logging
		3. Mutation Detection
	11. Testing
	12. Routing
	13. Forms
	14. Higher-Level Abstractions
	15. Community Conventions
	
#### Library Integration and Bindings ####
1. [reduxjs/react-redux](https://github.com/reduxjs/react-redux): React bindings for Redux, maintained by Redux team
2. [angular-redux/ng-redux](https://github.com/angular-redux/ng-redux): Angular 1 bindings for Redux
3. [angular-redux/store](https://github.com/angular-redux/store): Angular 2+ bindings for Redux
4. [ember-redux/ember-redux](https://github.com/ember-redux/ember-redux)
5. [glimmer-redux/glimmer-redux](https://github.com/reduxjs/redux/tree/d3809864ec31b6bb7d5205d0a6fdc0f367c62fcc/docs/introduction/glimmer-redux/glimmer-redux/README.md): Ember's Glimmer bindings
6. [tur-nr/polymer-redux](https://github.com/tur-nr/polymer-redux): Redux bindings for Polymer
7. [lastmjs/redux-store-element](https://github.com/lastmjs/redux-store-element): Redux bindings for custom elements

#### Reducers ####
##### Reducer Combination #####
1. [ryo33/combineSectionReducers](https://github.com/ryo33/combine-section-reducers): Expanded version of `combineReducers` which allows passing `state` as a third argument to all slice reducers
2. [KodersLab/topologically-combine-reducers](https://github.com/KodersLab/topologically-combine-reducers): `combineReducers` variation that allows cross-slice dependencies for ordering and data passing

		var masterReducer = topologicallyCombineReducers(
			{auth, users, todos},
			// define the dependency tree
			{ auth: ['users'], todos: ['auth'] }
		);
		
##### Reducer Composition #####
1. [acdlite/reduce-reducers](https://github.com/acdlite/reduce-reducers)

### Examples ###

## Basics ##
### Actions ###
### Reducers ###
### Store ###
### Data Flow ###
### Usage with React ###
### Example: Todo List ###

## Advanced ##
### Async Actions ###
### Async Flow ###
### Middleware ###
### Usage with React Router ###
### Example: Reddit API ###
### Next Steps ###

## Recipes ##
### Configuring Your Store ###
### Migrating to Redux ###
### Using Object Spread Operator ###
### Reducing Boilerplate ###
### Server Rendering ###
### Writing Tests ###
### Computing Derived Data ###
### Implementing Undo History ###
### Isolating Subapps ###

## Structuring Reducers ##
### Prerequisite Concepts ###
### Basic Reducer Structure ###
### Splitting Reducer Logic ###
### Refactoring Reducers Example ###
### Using combineReducers ###
### Beyond combineReducers ###
### Normalizing State Shape ###
### Updating Normalized Data ###
### Reusing Reducer Logic ###
### Immutable Update Patterns ###
### Initializing State ###

## Using Immutable JS with Redux ##

## API Reference ##
### createStore ###
### Store ###
### combineReducers ###
### applyMiddleware ###
### bindActionCreators ###
### compose ###

## Examples ##
1. [Counter Vanilla](https://redux.js.org/introduction/examples#counter-vanilla)
2. [Counter](https://redux.js.org/introduction/examples#counter)
3. [Todos](https://redux.js.org/introduction/examples#todos)
4. [Todos with Undo](https://redux.js.org/introduction/examples#todos-with-undo)
5. [TodoMVC](https://redux.js.org/introduction/examples#todomvc)
6. [Shopping Cart](https://redux.js.org/introduction/examples#shopping-cart)
7. [Tree View](https://redux.js.org/introduction/examples#tree-view)
8. [Async](https://redux.js.org/introduction/examples#async)
9. [Univeral](https://redux.js.org/introduction/examples#universal)
10. [Real World](https://redux.js.org/introduction/examples#real-world)