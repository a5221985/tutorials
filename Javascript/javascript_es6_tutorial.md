# JavaScript ES6 - Tutorial #
## Before We Get Started ##
### How to Take This Course ###
1. [https://stephengrider.github.io/JSPlaygrounds/](https://stephengrider.github.io/JSPlaygrounds/)
	1. Editor
	2. Prints results immediately
	3. Everything re-calcualted and updated
2. Similar: Babel repl - [babeljs.io](babeljs.io) - Try it out

### ES6 vs ES2015 ###
1. ECMAScript - is standard
2. JavaScript - implementation of ECMAScript standard
3. ES6 - new version of JavaScript
	1. ES2015
	2. ES2016
4. ES6 code -> Babel -> ES5 Code (safe to run in browser)
	1. Users may not have ES6 supported browser
	2. Babel transpiles ES6 code to ES5
5. Babel continued to be used because ES releases and Browser support may not catchup with each other

## The 'forEach' Helper ##
### Array Helper Methods - The Easiest Way to Write Better Code ###
1. Helpers in Array object
2. Helper methods covered
	1. `forEach`
	2. `map`
	3. `filter`
	4. `find`
	5. `every`
	6. `some`
	7. `reduce`
3. Helps with collections of data
	1. Development can be about collections
4. Stay away from for loops

### The forEach Helper ###
1. `forEach` helper
	1. ES5

			var colors = [ 'red', 'blue', 'green' ];
			
			for (var i = 0; i < colors.length; i++) {
				console.log(colors[i]);
			}
			
		1. What different ways can for loops go wrong
			1. Order of arguments
			2. Syntax
			3. More logic is stuffed into single line, the more difficult to find out what went wrong

	2. ES6

			colors.forEach(function (color) {
				console.log(color);
			});
			
		1. anonymous function called one time for every element
			1. `forEach` sends each element to iterator function (anonymous function)
		2. Why?
			1. Less code to write
			2. Less logic

### forEach Continued ###

		// Construct an array of numbers
		var numbers = [1, 2, 3, 4, 5];
		
		// Construct a variable to hold the sum
		var sum = 0;
		
		// Loop over the array, incrementing the sum variable
		numbers.forEach(function (number) {
			sum += number;
		});
		
		// print the sum variable
		sum;
		
1. We can declare a function and pass it

		function adder(number) {
			sum += number;
		}
		
		number.forEach(adder);

### Why Use forEach? ###
1. Practical use case
2. Example: Gmail
	1. Spam folder
		1. Select number of email messages
		2. Delete all selected

				emails.forEach(function (email) { // no boilerplate code
					deleteEmail(email);
				});

## The 'map' Helper ##
### The Map Helper ###
1. `map`: Most widely used
2. Traditional

		var numbers = [1, 2, 3];
		var doubledNumbers = [];
		
		for (var i = 0; i < numbers.length; i++) {
			doubledNumbers.push(numbers[i] * 2);
		}
		
		doubledNumbers;
		
	1. Why new array? Avoid mutating for large apps
3. Refactored to ES6

		var doubled = numbers.map(function (number) {
			return number * 2;
		});
		
		doubled;
		doubledNumbers;
		
	1. For each element we run iterator function and new array is returned with consolidated results

### Map Helper Continued ###
1. Example:

		var cars = [
			{ model: 'Buick', price: 'CHEAP' },
			{ model: 'Camero', price: 'expensive' }
		];
		
		var prices = cars.map(function (car) {
			return car.price;
		});
		
		prices;
		
	1. The operation is called pluck
		1. Used in Angular or React

### Where Map Is Used ###
1. Rendering list of data (facebook, ...)
2. Transform object to HTML on screen for each object

## The 'filter' Helper ##
### Selecting Needed Data with Filter ###
1. filter out products from a list

		var products = [
			{ name: 'cucumber', type: 'vegetable' },
			{ name: 'banana', type: 'fruit' },
			{ name: 'celery', type: 'vegetable' },
			{ name: 'orange', type: 'fuit' }
		];
		
		var filteredProducts = [];
		
		for (var i = 0; i < products.length; i++) {
			if (products[i].type === 'fruit') {
				filteredProducts.push(products[i]);
			}
		}
		
		filteredProducts;
		
2. ES6 Implementation
	1. element is passed to iterator function
	2. Iterator function returns a true or false value
3. Example:

		products.filter(function (product) {
			return product.type === 'fruit';
		});

### More on Filtering ###
### Choosing When to Filter ###

## The 'find' Helper ##
### Querying For Records with Find ###
### Find Continued ###
### Using Find to Search for Users ###

## The 'every' and 'some' Helper ##
### A Little Every and a Lot of Some ###
### More on Every and Some ###
### Every and Some Syntax ###
### Every and Some in Practice ###

## The 'reduce' Helper ##
### Condensing Lists with Reduce ###
### A Touch More of Reduce ###
### Ace Your Next Interview with Reduce ###

## Const/Let ##
### Variable Declarations with Const and Let ###
### What Const and Let Solve ###

## Template Strings ##
### Template Strings ###
### When to Reach for Template Strings ###

## Arrow Functions ##
### Fat Arrow Functions ###
### Advanced Use of Arrow Functions ###
### When to Use Arrow Functions ###
### When to Use Arrow Functions Continued ###

## Enhanced Object Literals ##
### Enhanced Object Literals ###
### Wondering When to Use Enhanced Literals? ###

## Default Function Arguments ##
### Specifying Default Function Arguments ###
### Use Cases of Defaulting Arguments ###

## Rest and Spread Operator ##
### Capturing Arguments with Rest and Spread ###
### The Rest on Rest and Spread ###
### Look to Use Rest and Spread in This Case ###

## Destructuring ##
### Goldmine of ES6: Destructuring ###
### Destructuring Arguments Object ###
### Destructuring Arrays ###
### Destructuring Arrays and Objects *At the Same Time* ###
### So... When to Use Destructuring? ###
### More on When to Use Destructuring ###

## Classes ##
### Instroduction to Classes ###
### Prototype Inheritance ###
### Refactoring with Classes ###
### Extending Behavior of Classes ###
### When to Use Classes ###

## Generators ##
### One Quick Thing: For...Of Loops ###
### Introduction to Generators ###
### Generators with a Short Story ###
### Anathor Step in Our Generator Story ###
### The Big Reveal on ES6 Generators ###
### A Practical Use of ES6 Generators ###
### Gelegation of Generators ###
### Delegation of Generators Continued ###
### Symbol.Iterator with Generators ###
### Complexities of Symbol.Iterator ###
### Generator with Recursion ###
### More on Generators and Recursion ###

## Promises and Fetch ##
### Code Execution in Javascript ###
### Terminology of Promises ###
### Constructing Promises ###
### Then and Catch ###
### Async Code with Promises ###
### Ajax Requests with Fetch ###
### Shortcomings of Fetch ###
### RallyCoding ###