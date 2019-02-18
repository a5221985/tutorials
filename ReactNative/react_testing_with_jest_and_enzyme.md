# React Testing with Jest and Enzyme #
## Introduction to Jest, Enzyme and TDD ##
### Welcome and Introduction ###
1. Topics
	1. Use testing to improve react code
		1. We can write code that is
			1. Better organized
			2. More maintainable
			3. Has fewer bugs
2. Six sections
	1. Intro to Jest and Enzyme
	2. Testing a simple React app
		1. Component state
		2. Component elements
	3. Testing connected Redux components
		1. React/Redux app
			1. Word game
	4. Testing action creators and reducers
	5. Testing Redux Thunk and Axios
	6. Testing Redux Props and Action Creator Calls
3. Pre-requisites
	1. JavaScript
	2. Basic React and Redux
	3. Very basic git
4. Goals
	1. Write unit and integration tests
		1. Define as well
		2. for react and redux
		3. using jest and enzyme

### Versions Used in this Course ###
1. `create-react-app`
	1. 1.5.2
	2. Mac OS Sierra
		1. Install watchman
		2. [https://github.com/facebook/create-react-app/issues/871](https://github.com/facebook/create-react-app/issues/871)
		3. Or see lecture on setting up jext/Enzyme from scratch
2. node 8.2.1
3. npm 5.3.0
4. react 16.3.2
5. jest 22.4.3
6. enzyme 3.3.0
7. enzyme-adapter-react-16 1.1.1
8. redux 4.0.0
9. react-redux 5.0.7
10. redux-thunk 2.2.0
11. axios 0.18.0
12. moxios 0.4.0
13. Atom
	1. Sublime
	2. VS Code
	3. vim
	4. ...

### TDD: What and Why ###
1. Write tests before writing code
2. "red-green" testing
	1. Tests fail before code is written
3. Why TDD?
	1. Usually test code manually (same effort each time - repetitively)
		1. With TDD, re-run tests "for free" after changes
			1. Tests get build as we write code
	2. Better code
		1. Better organized (plan before you code)
		2. More test-able (no re-writing code in order to test)
			1. If we wrote code first, we may need to re-factor it to write tests later
		3. Fewer bugs (caught sooner, regression testing built in)
		4. Great code coverage (testing is a part of coding)
			1. Good coverage comes for free

### Create-React-App ###
1. It is npm package for react app quickly and easily
	1. Otherwise need to configure webpack, web server
2. `create-react-app` if doesn't work, then use traditional method
	1. `npm install -g create-react-app` - always be available globally
	2. `create-react-app demo`

### Setting up Jest without create-react-app ###
1. [https://blog.usejournal.com/creating-a-react-app-from-scratch-f3c693b84658](https://blog.usejournal.com/creating-a-react-app-from-scratch-f3c693b84658)
2. `npm install --save-dev jest babel-jest`
	1. babel: used to transpile jest
3. Configuration: Put Mocks for static files that jest does not work natively
	1. Static files:
		1. images
		2. css
	2.  [https://jestjs.io/docs/en/webpack.html#handling-static-assets](https://jestjs.io/docs/en/webpack.html#handling-static-assets)
		1.  Copy config from `// package.json` to `jest.config.js`

				module.exports = {
					moduleNameMapper: {
						// ...
						"\\.(css|less)$": "identity-obj-proxy"
					}
				}

		2. New `__mocks__/fileMock.js`
			1. Copy from the site

					module.exports = 'test-file-stub';

	3. `identity-obj-proxy` returns class names instead of nothing

			npm install --save-dev identity-obj-proxy

4. `package.json`: add test script

		"scripts": {
			...
			"test": "jest --watch"
		}

5. `src/App.test.js`

		import React from 'react';
		import App from './App';

		test('renders without error', () => {

		});
			
### Demo of Jest Watch Mode ###
1. `cd demo`
2. `atom .`
3. `npm test`
4. Replace boilerplate in App.js

		<div className="App">
			<h1>Hello World</h1>
		</div>

### More about Jest Watch Mode, Test Files and Tests ###
1. Watches for changes
	1. Only since last commit (does not re-run already ran tests)
		1. `git commit -am "blabla"`
			1. Run tests and none will run
	2. `a`: runs all tests
	3. `o`: only files since last commit
2. It looks for files that end with `.test.js` and runs it - configurable
	1. Descendant directories are also considered

		test (official)
		it

	1. Both are synonymous

			test('description', () => {
				// if does not throw error, test passes but fails otherwise
				// throw new Error();
			});

### Enzyme Introduction and Setup ###
1. Used to create virtual DOM for testing
2. Allows testing without a browser
3. Uses: To see how the components render and how they respond to user input
4. Enzyme has better toolkit
	1. Search through DOM (jQuery style selectors)
	2. Simulate simple events
		1. Click element
		2. Blur element
5. Enzyme renders components only one level deep
	1. Render parent but use placeholders for children components
		1. Cleaner and quicker testing
6. Enzyme has access to props and state
	1. Manipulate values
	2. Examine/ test for values
7. Setup:
	1. Update dependencies
		1. `npm install ajv`
		2. `npm install --save-dev jest enzyme jest-enzyme enzyme-adapter-react-16`
			1. Tests enzyme which react it is
	2. `App.test.js`
		1. Remove `react-dom` import
		
				import Enzyme from 'enzyme';
				import EnzymeAdapter from 'enzyme-adapter-react-16';

				Enzyme.configure({ adapter: new EnzymeAdapter() });

8. `npm test`
	1. If problems, go to versions lecture

### Using Enzyme in a Test ###
1. `App.test.js`

		test(... {
			const wrapper = shallow(<App />)
		});

2. Enzyme Docs:
	1. Shallow rendering
		1. `debug()`: Returns dom as string

				console.log(wrapper.debug());

		2. Jest expect
			1. Jest docs
				1. Expect API

						expect(wrapper).toBeTruthy(); // If not null or undefined or empty string then it is true

						expect(wrapper).toBeFalsy();

### Types of Tests ###
1. Categories
	1. Unit tests
		1. Tests one piece (usually one function)
	2. Integration tests
		1. How multiple units work together
		2. Google: A gift unit tests vs integration tests
	3. Acceptance/ End-to-End (E2E) tests
		1. How a user would interact with the app
			1. Like selenium
2. Enzyme focuses on unit and integration tests for react and redux

### Test Behavior, not Implementation ###
1. Goal: Test behavior and not implementation
2. Do not want to re-write tests after refactor
3. Example:
	1. App keeps counter of button click count
	2. Click count is stored in component state
4. Good test
	1. Set initial state
	2. Simulate clicking a button that increments counter
	3. Check to see if counter state was incremented
5. Brittle test
	1. Set initial state
	2. Simulate clicking a button that increments counter
	3. Check to see if particular function was called
		1. Testing implementation and not behavior
6. Rule: If behavior does not change, we don't want to re-write tests
7. Another argument:
	1. Testing state is testing implementation
		1. If spec says only to display counter
			1. Skip unit, focus on integration
				1. check if counter changes

### Snapshot Testing? ###
1. Jest includes "snapshot testing"
	1. A way to freeze a component
	2. Test fails if there are any changes
		1. compares with that snapshot
2. In the course no snapshots
	1. No way to use TDD
	2. It is brittle (any change to component will break)
	3. Too easy to ignore failures and update
	4. No intent for snapshot tests
		1. Is it legitimate failure?
	5. Used alongside traditional tests

## Simple React App: Click Counter ##
### Demo and Start Click Counter App ###
1. New app

		create-react-app click-counter

2. Install enzyme

		cd click-counter
		npm install ajv
		npm install --save-dev jest jest-enzyme enzyme enzyme-adapter-react-16

### Set up Enzyme and Write Tests ###
1. Remove `react-dom`

		import Enzyme, { shallow } from 'enzyme';
		import EnzymeAdapter from 'enzyme-adapter-react-16';
		...

		Enzyme.configure({ adapter: new EnzymeAdapter() }); // using react 16

		// remove all tests

2. `npm test`
3. Write tests

		test('renders without error', () => {
			
		});

		test('renders increment button', () => {

		});

		test('renders counter display', () => {

		});

		test('counter starts at 0', () => {

		});

		test('clicing button increments counter display', () => {

		});

### Test Component Rendering ###
1. Make them red

		test('renders without error', () => {
			const wrapper = shallow(<App />);
		});

		test('renders increment button', () => {

		});

		test('renders counter display', () => {

		});

		test('counter starts at 0', () => {

		});

		test('clicing button increments counter display', () => {

		});

2. App.js: Remove all boilderplate and keep only `<div></div>`

		<div data-test=""> <!-- search for this -->
		</div>

	1. This attribute is only be there for tests (because other attributes can change)
	2. Open enzyme.js
		1. `find(selector)` - returns new shallow wrapper
			1. selector: jQuery or css syntax

3. App.test.js

		const appComponent = wrapper.find("[data-test='component-app']");
		expect(appComponent.length).toBe(1); // one element

4. App.js

		<div data-test="component-app">
		</div>

### More data-test Attribute Tests ###
1. Next test

		test('renders increment button', () => {
			const wrapper = shallow(<App />);
			const button = wrapper.find("[data-test='increment-button']");
			expect(button.length).toBe(1); // one element
		});

		test('renders increment button', () => {
			const wrapper = shallow(<App />);
			const counterDisplay = wrapper.find("[data-test='counter-display']");
			expect(counterDisplay.length).toBe(1); // one element
		});

2. App.js

		<div ...>
			<h1 data-test="counter-display">The counter is currently</h1>
			<button data-test="increment-button">Increment counter</button>
		</div>

### DRY Refactor ###
1. Factory function 

### Test Initial State ###
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
### Configure Jest Setup for non-create-react-app ###
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

## Simple Redux: success Piece of State ##
### Review of Jotto Redux State Plan ###
### Set up Redux ###
### Success State Planning ###
### `CORRECT_GUESS` action creator ###
### `successReducer` Tests ###
### `successReducer` Code ###
### Tradeoffs to Unit Testing Action Creators/ Reducers ###
### Note for those using react-redux 6 ###
### Set Up Connected Component Tests ###
### Input Component Test Organization ###
### Start setup Function for Input Component ###
### `storeFactory` Test Helper ###
### Enzyme `.div()` method ###
### Summary of Connected Component Setup and Choices ###
### Input Tests and Code for success=false ###
### Quiz! Write Input Tests and Code for success=true ###
### Simple Redux Summary ###

## Testing Redux Thunk ##
### Other Pieces of State ###
### `guessedWords` Planning ###
### Redux Thunk: What and Why ###
### Installing Redux Thunk ###
### `getLetterMatchCount` Helper Function ###
### Thunk Test Planning ###
### Set up `guessWords` Tests ###
### First Thunk Test ###
### Add `secretWordReducer` ###
### Remaining Tests ###
### Write Reducer and Action Creator ###
### Thunk Integration Testing Summary ###

## Testing Axios ##
### `secretWord` Plan ###
### `moxios`: Why and How ###
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
### `getSecretWord` call on App Mount ###
### Quiz! Tests for `guessWord` on Input Submit Click ###
### Create Input ref ###
### Write test for `guessWord` Argument ###
### Write `guessWord` Call with Argument ###
### Clear Input Box on Submit ###
### Demo of Completed App ###
### Jotto Challenges ###
### Jotto Challenge Descriptions ###

## Resources ##
### Course Resources ###
### JSDoc ###