# React Testing with Jest and Enzyme - with Redux, Hooks and Context #
## Introduction to Jest, Enzyme and TDD ##
### Welcome and Introduction ###
1. Use testing to improve React code
	1. Better organization
	2. More maintainable
	3. Fewer bugs
2. Intro to Jest and Enzyme
	1. With create-react-app
	2. With app from scratch
3. Testing a simple React app
	1. Component state
	2. Component elements
4. Redux (One track) - either this or next
	1. Word game
		1. Testing connected Redux components
		2. Testing action creators and reducers
		3. Testing Redux Thunk and Axios
		4. Testing Redux Props and Action Creator Calls
			1. Ensures components calls action creators at the right time
5. Hooks and Context (another track)
	1. Word game
		1. Testing useState, useEffect and useReducer hooks
		2. Testing simple context
			1. App level state for value
		3. Testing context with embedded state
6. Course assumes you know
	1. JavaScript
	2. Basic React and Redux
		1. Hooks and Context does not use Redux
	3. Bery basic git
7. By the end of this course, you will be able to...
	1. Write unit and integration tests
	2. for React, Redux, hooks and contexts
	3. using Jest and Enzyme

### Versions used in this course ###
1. Versions used:
	1. React: 16.9.0
	2. Jest: 24.8.0
	3. Enzyme: 3.10.0
	4. Redux: 4.0.4
2. [jotto-redux](https://github.com/flyrightsister/udemy-react-testing-projects/blob/master/jotto-redux/package-lock.json)

### TDD: What and Why ###
1. Write tests before writing code
	1. Write "shell" function (version of code enough to call tests)
	2. Write tests
	3. Tests fails
		1. "red-green" testing
			1. Tests fail before code is written
				1. Easier to write tests that pass regardless of what the code does
	4. Write code
	5. Test passes
2. Why TDD?
	1. More efficient (manual tests needs more effort and time - repetition is necessary in testing)
		1. Re-run tests "for free" after changes
			1. If we write automated tests at the end, we have not built up test suite that was run all along when the code was built
	2. Better code
		1. Better organized (plan before you code)
		2. More testable (no rewriting code for tests)
			1. Untestable code doesn't exist
		3. Fewer bugs (caught sooner, regression)
			1. All tests get run when we make a change
		4. Great code coverage
			1. It should not be the goal since it may take too much effort to get the last few % of coverage
				1. TDD usually gives excellent coverage

### create-react-app ###
1. `npm` package
	1. Generates React applications
		1. Scratch?
			1. Configuration
			2. Webpack
			3. Web server
2. Can also install project from scratch or use existing project
	1. For certain OSs we may need manual configuration
		1. Skip create-react-app and go to next lecture
3. `npx`
	1. We will be using npx with create-react-app
		1. Downloads the latest version of create-react-app templates every time
		2. Not dependent on when you last installed create-react-app
			1. `npx` will grab the latest upto date version
		3. `npx` comes with npm 5.2+ and higher
		4. If you have an older version of npm and can't upgrade
			1. Go to [https://github.com/facebook/create-react-app](https://github.com/facebook/create-react-app)
			2. Follow link "instructions for older npm versions"
	2. `npx create-react-app demo`

### Next Lecture is Optional ###
1. Next lecture is for people who cannot use `create-react-app` or who don't want it
	1. Skip the next lecture if `create-react-app` is okay

### OPTIONAL: Setting up Jest Without create-react-app ###
### Demo of Jest Watch Mode ###
1. `cd demo`
2. Open ide: `code .`
3. `npm test`
	1. Runs jest under the hood
		1. If no changes, then it does not run
			1. `App.js`
				1. Remove boiler plate:

						<div className="App">
							<h1>Learn React Testing</h1>
						</div>
						
					1. Runs tests when we save

							yarn test --no-watchman --all (works)
							yarn test --no-watchman (works)
							
4. Change to

		<div className="App">
			<h1>{title}</h1>
		</div>
		
	1. Tests fail	

### More About Jest Watch Mode, Test Files and Tests ###
1. More about Jest
	1. Watch mode
	2. How Jest tests are structured
2. Watch mode
	1. Watches for changes and re-runs tests if there are changes
		1. Only watches for changes since last commit
			1. Tests are not re-run
	2. Git already exists
	3. Quit - w (to see more)
		1. Commit to git
			1. When we run test, tests do not run (comitted)
				1. 	`a` - runs all tests
		2. If we change a file, the tests re-run
3. How does Jest know which files to run?
	1. Look for files in `src` with `.test.js`
	2. `App.test.js`
		1. Structure
			1. First: name of test
			2. Second: anonymous function
				1. If any errors are thrown, the test fails
					1. Example:

							throw new Error;
						
						1. `expect` - assertions

### Enzyme Introduction and Setup ###
1. Enzyme:
	1. Constructs virtual DOM for testing
	2. Allows testing without a browser
		1. We want to know how components render and how they respond to input
		2. `create-react-app` uses React DOM
		3. Enzyme uses React DOM
			1. Has better toolkit
				1. Search through DOM
					1. jQuery style selectors
				2. Simulate simple events
					1. Click on node in virtual dom, blur element
				3. Shallow Rendering
					1. Render components only one level deep
					2. Render parent, but use placeholders for children (wont render)
						1. Cleaner and quicker testing
					3. Example:
						1. Shallow

								<div id="word-input-form">
									<p>Input Word Here!</p>
									<InputFieldComponent /> <!- Child -->
									<SubmitButtonComponent /> <!- Child -->
								</div>
							
						1. Mount:

								<div id="word-input-form">
									<p>Input Word Here!</p>
									<div>
										<span>Enter some text</span>
										<input type="text">
									</div>
									<button type="submit">
										Submit
									</button>	
								</div>
								
				4. Enzyme provides access to component's props and state
					1. Manipulate values
					2. Examine / test for values (test them)
2. Install Enzyme
	1. Three packages - dev dependencies (only for development and not for production)
	2. `npm install --save-dev enzyme jest-enzyme enzyme-adapter-react-16` (version depends on latest)
	3. `yarn add --dev enzyme jest-enzyme enzyme-adapter-react-16`
3. Using enzyme in code:
	
		//import { render } from '@testing-library/react'; - not required
		import Enzyme from 'enzyme';
		import EnzymeAdapter from 'enzyme-adapter-react-16';
		
		...
		Enzyme.configure({ adapter: new EnzymeAdapter() }); // new instance of enzyme adapter
		
		// Remove existing test code
		
		test('renders without crashing', () => {
		}); 
		
	1. Own file which runs before each test file
	2. Adapter - tells what type of code to expect - React 16 code
	3. No error thrown, then tests pass

### Using Enzyme in a Test ###
1. Shallow:

		import Enzyme, { shallow } from 'enzyme';
		...
		test('renders without creashing', () => {
			const wrapper = shallow(<App />) // returns a shallow wrapper
		});
		
	1. Enzyme js docs:
		1. Shallow rendering:
			1. `debug()` - returns DOM as a string

					test(...) {
						...
						console.log(wrapper.debug());
						expect(wrapper).toBeTruthy(); // not null, not undefined, not empty string
						//expect(wrapper).toBeFalsy();
					});
					
				1. Mocha and Chai are used in general for expectations
				2. Jest has it's own expect API
					1. Jest main page:
						1. Docs:
							1. Expectations
								1. `toBe()`
								2. `stringContianing()`
								3. `toBeTruthy()`
								4. ...
			2. TDD: Ensures test fails first and then the code is written to ensure the failing test passes

### Types of Tests ###
1. Categories of tests
	1. Unit Tests
		1. tests one piece of code (usually one function)
			1. Very modular and narrow and isolated in scope
	2. Integration Tests
		1. How multiple units work together
			1. Google for Unit vs Integration test
	3. Acceptance / End-to-end (E2E) Tests
		1. How a user would interact with app
			1. Usually selenium or cyprus is used to check end to end (if user interaction goes to database and back again)
2. In the course:
	1. Unit and integration tests
	2. No server tests or selenium

### Testing Tradeoffs ###
1. Testing Goal #1:
	1. Easy maintainance of tests
		1. Test behavior, not implementation
			1. Ideally, do not want to re-write tests after a refactor
			2. Keep in mind when writing tests
			3. Test behavior (what the app should do)
				1. Not how app works or how app implements it
			4. Then, if implementation changes, tests remain the same
				1. Testing implementation is brittle (easily broken when app still works)
					1. If we change internals, the app should still work
	2. Feature to test
		1. App keeps counter of button click count
			1. `onClick` function for button calls `incrementCounter` function
			2. Counter display increments by one
		2. Steps;
			1. Set initial state
			2. Simulate button click
			3. Check displayed count to see that it was incremented by one
		3. Testim implementation: (not recommended)
			1. Set initial state
			2. Simulate button click
			3. Check to see if particular function was called
				1. It only tests if code is going through right stages and not the behavior that user expects
			4. Testing implementation (function name) - can change
				1. Not behavior (display update)
2. Testing Goal #2
	1. Easy diagnosis of failing tests
		1. If a test fails, we don't want to spend too much time digging through the test code or production code to see why test failed
	2. Feature to test
		1. Shopping cart for custom t-shirt
			1. Select t-shirt style
			2. Select size
			3. Select color
			4. Select number of shirts to order
			5. Type in text to put on shirt
			6. ...
			7. Add t-shirt to the cart
		2. Difficult-to-Diagnose test
			1. Test that the cart has the correct contents after the entire process
			2. Why difficult?
				1. If it fails, which step was the problem?
			3. Test failure alone doesn't tell you
				1. Need to investigate
					1. Takes more time
			4. Want efficiency in diagnosing failing tests
				1. Not spend much time diagnosing why tests fail
		3. Solution:
			1. Make it easier to diagnose
				1. After each user action
					1. Test expected internal state change
					2. or. alternatively test that a particular function was called
						1. Isn't testing state or function calls testing implementation?
							1. Yes you just told us NOT TO DO!
								1. Yes
									1. Balance/ tradeoff
										1. Granular (unit) testing leads to ...
											1. Ease of diagnosis
											2. Brittle tests
										2. Broader (integration) testing leads to...
											1. More robust tests
											2. More difficult to find out what caused the issue
												1. Easy to write but difficult to diagnose compared to unit tests
									2. Sometimes you'll optimize for ease of diagnosis
									3. Sometimes you'll optimize for less brittle tests
									4. Find your own balance between the two!
										1. You and your team will determine what works best for you

### Why There is a Snapshot Testing in this Course ###
1. Snapshot testing
	1. Feature of Jest
		1. Jest includes "snapshot testing"
			1. A way to freeze a component (at certain point in time)
			2. Test fails if there are any changes (from frozen output)
	2. No snapshots in the course
		1. No TDD is possible with snapshot
			1. We cannot construct output of component exactly and write code based on that
		2. Brittle (any change to component will break snapshot tests)
		3. Difficult to diagnose
			1. Too easy to ignore failure and update (snapshot)
				1. Without checking
	3. No test intent
		1. If there's a failure, does test still meet spec?
			1. Is it legimate failure or not? Hard to tell
				1. There is not desciption for the intent of the test for snapshot tests
	4. If used it's alongside traditional tests
		1. You'll decide what's right for you

## Simple React App: Click Counter ##
### Course Repository on Github ###
1. [Course Repository on GitHub](https://github.com/flyrightsister/udemy-react-testing-projects)

### Demo and Start Click Counter App ###
1. Using `create-react-app`
2. `create-react-app click-counter`
3. Click and count goes up
	1. One element displays count
	2. One element (button) increments count
	3. Count is kept in component state
4. Developing structures for simple app
5. Installing Enzyme: `yarn add --dev enzyme jest-enzyme enzyme-adapter-react-16`

### Set up Enzyme and Write Tests ###
1. Deprecation warnings - enzyme specific and not to worry
2. Open `App.test.js`

		// Remove react dom
		import Enzyme, { shallow } from "enzyme";
		import EnzymeAdapter from "enzyme-adapter-react-16";
		
		...
		
		Enzyme.configure({ adapter: new EnzymeAdapter() });
		
		test("renders without error", () => {
			
		});
		
		test("renders increment button", () => {
		
		});
		
		test("renders conter display", () => {
		
		});
		
		test("counter starts at 0", () => {
			
		});
		
		test("clicking button increments the counter in display", () => {
		
		});
		
	1. Must have atleast one test - Jest doesn't accept no tests

### Test Component Rendering ###
1. `App.js`
2. Class based component and state (hooks and contexts later)
3. Edit:

		import React, { Component } from 'react';
		...
		
		class App extends Component {
			render() {
				return (
					<div data-test=""></div> <!-- attribute only for test purposes and should not be change -->
				);
			}
		}
		...
		
4. Tests:

		test('renders without error', ... {
			const wrapper = shallow(<App />);
			const appComponent = wrapper.find("[data-test='component-app']"); // component-<name-of-component>
			expect(appComponent.length).toBe(1);
		});
		
	1. Open Enzyme API reference
		1. Shallow rendering:
			1. Finds every node and returns a new shallow wrapper
	2. Fixing:

			<div data-test="component-app">
			...
			</div>

### OPTIONAL: Removing data-test Attributes for Production ###
1. Remove data-test attributes from production code

		<div ...>
			<h1>App</h1>
		</div>
		
	1. `yarn start`
2. Install package:

		yarn add --dev babel-plugin-react-remove-properties
		
	1. `npm <package>` - google
	2. `npm run eject` - makes config editable by us
		1. Puts config in package.json
		2. Puts other config files in the application
	3. `git commit -m "backup"`
	4. `npm run eject`
3. Edit `package.json`

		"babel": {
			"env": {
				"production": {
					"plugins": [
						["react-remove-properties", {"properties": ["data-test"]}]
					]
				}
			},
			"presets": [
			...
			]
		}
		
	1. search `npm babel plugin react-remove-properties` - copy "env"
	2. Production build:
		1. `npm run build`
		2. `sudo npm install -g serve`
		3. `serve -s build`
		4. Open: `http://localhost:5000`
4. Review:
	1. `npm install --save-dev babel-plugin-react-remove-properties`
	2. `npm run eject`
	3. Update babel config
	4. Production build
	5. Data-test attributes are gone!

### More data-test Attribute Tests ###
1. 

### DRY Refactor ###
### Test Initial State ###
### Test Button Click ###
### Acceptance Testing and Review ###
### Click Counter Challenges ###
### Click Counter Challenge Descriptions ###

## Jotto Intro and Congrats Component ##
### Jotto App Demo ###
### Jotto App Planning ###
### Jotto App Plan of Attack ###
### Set up Jotto App and Congrats Component ###
### Congrats Component Test Setup ###
### Congrats Tests and the .text() Method ###
### Code the Congrats Component ###
### PropTypes Testing ###
### Code PropTypes and Update Tests ###
### Default Props in setup() ###
### Move Enzyme Configuration to setupTests.js ###
### OPTIONAL: Configure Jest Setup for non-create-react-app ###
### Summary of Abstractions ###
### Playing the Long Game ###

## GuessedWords Component ##
### Set up GuessedWords Component and Tests ###
### GuessedWords PropTypes and setup() ###
### Use `describe` for Context ###
### Write Tests and beforeEach for "no words guessed" ###
### Code for "no words guessed" ###
### Tests for "nonzero guessed words" ###
### Code for "nonzero guessed words" ###
### Manual Acceptance Testing ###
### Bootstrap Styling ###
### getLetterMatchCount Helper Function ###
### Choice point: Redux or Hooks/ Context? ###

## Simple Redux: Success Piece of State ##
### Review of Jotto Redux State Plan ###
### Set up Redux ###
### Success State Planning ###
### `CORRECT_GUESS` Action Creator ###
### `successReducer` Code ###
### Tradeoffs to Unit Testing Action Creators/ Reducers ###
### Set Up Connected Component Tests ###
### Input Component Test Organization ###
### Start Setup Function for Input Component ###
### `storeFactory` Test Helper ###
### Enzyme `.dive()` Method ###
### Summary of Connected Component Setup and Choices ###
### Input Tests and Code for `success=false` ###
### Quiz! Write Input Tests and Code for `success=false` ###
### Simple Redux Summary ###

## Testing Redux Thunk ##
### Other Pieces of State ###
### `guessedWords` Planning ###
### Redux Thunk: What and Why ###
### Installing Redux Thunk ###
### Thunk Test Planning ###
### Set up `guessWords` Tests ###
### First Thunk Test ###
### Add `secretWordReducer` ###
### Remaining Tests ###
### Write Reducer and Action Creator ###
### Thunk Integration Testing Summary ###

## Testing Axios ##
### `secretWord` Plan ###
### `moxips`: Why and How ###
### Set up `secretWord` Action Creator and Tests ###
### Testing Asynchronous Action Creators ###
### Write `getSecretWord` tests ###
### Write `secretWord` Action Creator and Reducer ###
### Summary: Asynchronous Action Creators and `moxios` ###

## Redux Components ##
### Testing Props and Action Creator Calls ###
### Testing Redux Props ###
### Input Redux Props ###
### Quiz! App Redux Props ###
### Approach to Testing Action Creator Calls ###
### `getSecretWord` Call on App Mount ###
### Quiz! Tests for `guessWord` Argument ###
### Write Test for `guessWord` Argument ###
### Write `guessWord` Call with Argument ###
### Clear Input Box on Submit ###
### Demo of Completed App ###
### Jotto Challenges ###
### Jotto Challenge Descriptions ###

## Hooks and Context Intro ##
### Introduction to Hooks ###
### Introduction to Context ###
### Setting up Jotto for Hooks and Context ###
### Jotto Data Flow with Hooks and Context ###
### Jotto Hooks and Context Plan of Attack ###
### Basic App Component ###
### Code Quiz! Basic Input Component ###
### Input Props ###
### Jest Mocks ###

## Testing React Hooks ##
### Prepare Input for Writing setState Tests ###
### State-Controlled Field ###
### Clear currentGuess on Submit ###
### Plan for Testing getSecertWord ###
### Test getSecretWord ###
### Code getSecertWord ###
### Intro to useEffect and How to Test with Enzyme ###
### Test getSecretWord is Called on App Mount ###
### useReducer Hook: What and Why ###
### Code useEffect and useReducer to Pass Tests ###
### Test getSecretWord Does NOT Run on App Update ###
### secretWord Prop Warning for Input ###
### Loading Spinner Planning ###
### Test Loading Spinner ###
### Code Loading Spinner ###

## Simple Context ##
### Context Implementations in this Course ###
### Language Context Planning ###
### Strings File Setup ###
### Strings Tests ###
### Code getStringByLanguage ###
### Strings Warnings ###
### LanguagePicker Component: Planning and Setup ###
### LanguagePicker Tests: Render and PropTypes ###
### LanguagePicker Icons ###
### LanguagePicker Icon Click ###
### Context Test Options ###
### Congrats Language Context Test Setup ###
### Congrats Language Context Code ###
### Code Quiz! Input Language Context ###
### Fix App Test Language Warnings ###
### GuessedWords Language Context Tests: Mocking useContext ###
### GuessedWords Language Context Code ###
### Manual Acceptance Testing ###

## Context with Embedded State ##
### Context with Embedded State ###
### Code Success Context ###
### Test Success Context ###
### Code Quiz! guessedWords Context ###
### Set up Congrats and App Components for Success Context Testing ###
### Test and Code Congrats Success Context ###
### Set up GuessedWords Component for Context Testing ###
### Test and Code GuessedWords Context in GuessedWords ###
### Review of Context with Embedded State ###
### Test and Code Input Consuming Success Context ###
### Set up Tests for Input Setting Success Context ###
### Simulating a Guess ###
### Code and Test Input Setting Success Context ###
### Set Up Test for Input Setting GuessedWords Context ###
### Test Input Setting GuessedWords Context ###
### Code Quiz! Empty GuessedWords Context ###
### Code GuessedWords Context in Input and GuessedWords ###
### Manual Acceptance Testing ###
### Jotto Challenges for Hooks and Context ###

## Resources ##
### Course Resources ###
### JSDoc ###
