# React Test Utilities #
1. Importing:

		import ReactTestUtils from 'react-dom/test-utils'; // ES6
		var ReactTestUtils = require('react-dom/test-utils'); // ES5 with npm

## Overview ##
1. `ReactTestUtils` simplifies testing React components in the test framework of choice
	1. `Jest` is used in Facebook
		1. [React Tutorial](http://facebook.github.io/jest/docs/en/tutorial-react.html#content)
2. Enzyme: Testing utility release by Airbnb
	1. For assertions
	2. For manipulations
	3. For traversal of React Component's output
	4. Can be used with `Jest`
	5. [http://airbnb.io/enzyme](http://airbnb.io/enzyme/)
3. `react-testing-library`: Alternative
	1. For writing tests that use components as end users use them
	2. Works with any test runner
	3. [https://git.io/react-testing-library](https://git.io/react-testing-library)
	
### Utilities ###
1. [Simulate](https://reactjs.org/docs/test-utils.html#simulate)
2. [renderIntoDocument()](https://reactjs.org/docs/test-utils.html#renderintodocument)
3. [mockComponent()](https://reactjs.org/docs/test-utils.html#mockcomponent)
4. [isElement()](https://reactjs.org/docs/test-utils.html#iselement)
5. [isElementOfType()](https://reactjs.org/docs/test-utils.html#iselementoftype)
6. [isDOMComponent()](https://reactjs.org/docs/test-utils.html#isdomcomponent)
7. [isCompositeComponent()](https://reactjs.org/docs/test-utils.html#iscompositecomponent)
8. [isCompositeComponentWithType()](https://reactjs.org/docs/test-utils.html#iscompositecomponentwithtype)
9. [findAllInRenderedTree()](https://reactjs.org/docs/test-utils.html#findallinrenderedtree)
10. [scryRenderedDOMComponentsWithClass()](https://reactjs.org/docs/test-utils.html#scryrendereddomcomponentswithclass)
11. [findRenderedDOMComponentWithClass()](https://reactjs.org/docs/test-utils.html#findrendereddomcomponentwithclass)
12. [scryRenderedDOMComponentsWithTag()](https://reactjs.org/docs/test-utils.html#scryrendereddomcomponentswithtag)
13. [findRenderedDOMComponentWithTag()](https://reactjs.org/docs/test-utils.html#findrendereddomcomponentwithtag)
14. [scryRenderedDOMComponentsWithType()](https://reactjs.org/docs/test-utils.html#scryrenderedcomponentswithtype)
15. [findRenderedComponentWithType()](https://reactjs.org/docs/test-utils.html#findrenderedcomponentwithtype)

## Reference ##

## Shallow Redering ##
1. Lets us render component "one level deep" and assert facts about what its render method returns (don't need child components to be rendered)
	1. DOM is not required
2. [react-test-renderer/shallow](https://reactjs.org/docs/shallow-renderer.html)

## Other Utilities ##

### Simulate ###

		Simulate.{eventName}(
			element,
			[eventData]
		)
		
	1. Simulates event dispatch on a DOM node with optional `eventData` event data
	2. `Simulate` has method for every event that React understands
		1. [every event that React understands](https://reactjs.org/docs/events.html#supported-events)

### Clicking an element ###

		// <button ref={(node) => this.button = node}>...</button>
		const node = this.button;
		ReactTestUtils.Simulate.click(node);

### Changing the value of an input field and then pressing ENTER ###

## `renderIntoDocument()` ##

## `mockComponent()` ##

## `isElement()` ##

## `isElementOfType()` ##

## `isDOMComponent()` ##

## `isCompositeComponent()` ##

## `isCompositeComponentWithType()` ##

## `findAllInRenderedTree()` ##

## `scryRenderedDOMComponentsWithClass()` ##

## `findRenderedDOMComponentWithClass()` ##

## `scryRenderedDOMComponentsWithTag()` ##

## `findRenderedDOMComponentWithTag()` ##

## `scryRenderedDOMComponentsWithType()` ##

## `findRenderedDOMComponentWithType()` ##

