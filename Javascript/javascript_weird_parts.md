# JavaScript Understanding the Wierd Parts #

## Getting Started ##
### Introduction and The Goal of This Course ###
### Setup ###
1. Browser with developer tools (Google chrome): [google.com/chrome](google.com/chrome)
2. Text editor (Brackets.io)

### Big Words and JavaScript ###
1. Big word alerts:
	1. Description
	2. Details

### Watching this Course in High Definition ###
### Understanding, Frameworks, and The Weird Parts ###
1. We should be able to open jQuery and uderstand it
2. Weird parts: Often most powerful and beutiful parts
3. Dangers of JavaScript

## Execution Contexts and Lexical Environments ##
### Conceptual Aside: Syntax Parsers, Execution Contexts, and Lexical Environments ###
1. Side notes but very important for the topic
	1. Conceptual aside: focus on concept that is fundamental to rest of the course
		1. Syntax parsers:
			1. A program that reads your code and determines what it does and if its grammar is valid
			2. Along the way, the engine interpreting code can do extra stuff along with translation
		2. Execution Contexts:
			1. A wrapper that help manage the code that is running
			2. There are lots of lexical environments. Which one is currently running is managed via execution contexts. It can contain things beyond what you've written in your code.
			3. Execution context contains running code + beyond what we have written
		3. Lexical Environments: (where something is written and what surrounds it)
			1. Where something sits physically in the code you write
			2. lexical: having to do with words or grammar
				1. Syntax, vocabulary
			3. Lexical environment exists in which where you write something is important
				1. Where we write the code is important

						function hello() {
							var a = 'hello world';
						}

					1. The variable `a` sits lexically inside the function `hello()`
					2. Where you see things written gives us an idea of where they are going to sit in computer's memory and how they interact with other variables, functions, ...

### Conceptual Aside: Name/Value Pairs and Objects ###
1. Name/value pairs and objects
	1. Name/value pair: It is a name which maps to a unique value
		1. The name may be defined more than once, but only can have one value in any given execution context
		2. A particular execution context (section of code that is running), a name can only exists and can be defined with one value
			1. value can be more name/value pairs
	2. Example:

			Address = '100 Main St.'

2. Object:
	1. A collection of name value pairs
	2. Simplest definition when talking about JS
	3. Example:

			Address:
				{
					Street: 'Main',
					Number: 100
					Apartment:
						{
							Floor: 3,
							Number: 301
						}
				}

		1. value can be another object (collection of name value pairs)

### Downloading Source Code for This Course ###
### The Global Environment and The Global Object ###
1. Executaion Context (Global) - wrapper that wraps currently executing code in execution context
	1. It is base execution context
	2. Two things get created automatically in Global execution context:
		1. Global Object
		2. `this` variable
2. Example:
	1. index.html

			<html>
				<head>

				</head>
				<body>
					<script src="app.js"></script>
				</body>
			</html>

	2. app.js
		1. no code
	3. Open `index.html` in chrome.
		1. Open Dev tools
		2. type `this` and run (it is defined) - it is the Window object (it is global object in browser as well)
		3. Global object: `window`
			1. It is different in Node.js
		4. Each tab/window is a different execution context
3. Global: means not inside a function
4. Example:

		var a = 'Hello World!'; // global variable

		function b() {

		} // global function

	1. `window` in Chrome DevTools
		1. The global variables and functions get attached to global object
		2. `a` prints `Hello World!`
		3. `window.a` prints `Hello World!`
5. Outer environment: null for global execution context
	1. code that is outside a function if the function body is getting executed

### The Execution Context - Creation and Hoisting ###
1. Example:

		var a = 'Hello World!';

		function b() {
			console.log('Called b!');
		}

		b();
		console.log(a);

2. Example:

		b(); // runs the function
		console.log(a); // returns 'undefined'

		var a = 'Hello World'; // If we remove this, an error is thrown instead of 'undefined' - this is called hoisting
		
		function b() {
			console.log('Called b!');
		}

3. How does it work?
	1. Execution context is created in two phases
		1. Creation phase:
			1. global object is setup in memory
			2. `this` is setup in memory
			3. A link to outer environment is created (if there is one)
			4. Sets up Memory Space for Variables and Functions "Hoisting"
				1. variables are assigned memory before code is executed and placeholder is put instead of a value
		2. Execution phase
			1. Code is executed line by line
				1. variable that is 'undefined' in phase 1 gets assigned value if there is an assignment statement

### Conceptual Aside: JavaScript and 'undefined' ###
1. JavaScript and 'undefined'
2. Example:

		var a; // if it is removed, memory is not allocated for it, else, a is set to the special value 'undefined'
		console.log(a); // undefined - it is a special internal value

		if (a === undefined) {
			console.log('a is undefined!');
		} else {
			console.log('a is defined!');
		}

		a = undefined; // Don't do this. Let undefined mean, the programmer did not set the value - helps in debugging

### The Execution Context - Code Execution ###
1. Execution phase: Second phase
2. Runs the code line by line
3. Example:

		function b() {
			console.log('Called b!');
		}

		b();

		console.log(a);

		var a = 'Hello World!';

		console.log(a);

### Conceptual Aside: Single Threaded, Synchronous Execution ###
1. Single threaded: One command at a time
	1. Under the hood of the browser, maybe not single threaded (from the perspective of programmer, JS behaves like single threaded)
	2. Synchronous: One [line of code] at a time [in order]

### Function Invocation and the Execution Stack ###
1. Invocation: Running a function (call a function)
	1. In JS, by using paranthesis `()`
	2. Example:

			function a() {
				b(); // invocation
				var c;
			}

			function b() {
				var d;
			}

			a();
			var d;

		1. First Global Execution Context gets created
		2. When interpreter encounters `a()`
			1. A new execution context gets created for `a()` and placed on top of execution stack
				1. It runs in two phases again
		3. When interpreter encounters 
			2. A new execution context gets created for `b()` and placed on top of execution stack
		4. When `b()` finishes running, it's execution context is popped off the stack
		5. Javascript executes line by line synchronously

### Functions, Context, and Variable Environments ###
1. Variable environment:
	1. Where the variables live (and how they relate to each other in memory)
	2. Example:

			function b() {
				var myVar;
			}

			function a() {
				var myVar = 2;
				b();
			}

			var myVar = 1;
			a();

		1. Global execution context is created and `myVar` is put into memory space: Variable environment is global object
			1. `var myVar = 1;` is executed and `myVar` is then assigned the value of `1`
		2. When `a` is invoked by executing `a();`, a new execution context is created and put on top of execution stack and `myVar` is then put into memory (This execution context's variable environment)
			1. `var myVar = 2;` is executed and `myVar` is then assigned the value of `2`
		3. When `b` is invoked by executing `b();`, a new execution context is created and put on top of execution stack and `myVar` is then put into memory (This execution context's variable environment)
			1. `myVar` is then assigned the value of `undefined`
2. Scope: where are we able to see the variable
3. Example:

		function b() {
			var myVar;
			console.log(myVar);
		}

		function a() {
			var myVar = 2;
			console.log(myVar);
			b();
		}

		var myVar = 1;
		console.log(myVar);
		a();

### The Scope Chain ###
1. Example:

		function b() {
			console.log(myVar); // prints 1
		}

		function a() {
			var myVar = 2;
			b();
		}

		var myVar = 1;
		a();

	1. When we request a variable, if JS does not find it in the current execution context, it uses reference to outer environment (Global execution context in this case)
		1. for both execution conexts of `a` and `b`, the reference to outer environment is to the global execution context
			1. Function `b` sits lexically on top of the global environment (at the same level as `var myVar = 1;`)
		2. The chain of references to outer environments is followed until `myVar` is found till it reaches the global execution context - this chain is called scope chain (outer environment references)
2. Example:

		function a() {
			
			function b() {
				console.log(myVar); // prints 2
			}

			var myVar = 2;
			b();
		}

		var myVar = 1;
		a();
		b(); // b was not added to global execution context's variable environment

	1. Reference to outer lexical environment refers to execution context of `a`

### Scope, ES6, and let ###
1. Scope: where a variable is available in your code
	1. And if it's truly the same variable, or a new copy
2. `let`: allows JS to use block scoping
	1. Example:

			if (a > b) {
				console.log(c); // will throw an error because execution engine even though c is in memory does not allow using c before execution of next line
				let c = true;
			}

		1. During creation phase where variable `c` is created, it is still placed in memory and set to `undefined`
			1. It is not allowed to be used until the line `let c = true;` is run during execution phase
		2. It is inside a block: It is only available only inside the block during the execution phase of the block
			1. If it is inside a loop, `let` statement will give a new variable each iteration

### What About Asynchronous Callbacks? ###
1. Asynchronous: More than one at a time
	1. a line of code might have been started, then another line of code is executed and then another line is executed while the previous lines are executing
2. JavaScript Engine:
	1. Other engines also exist along with it in browser
		1. Rendering Engine: Paints web page on the screen
		2. HTTP Request: going out and getting data
	2. JavaScript Engine has hooks to talk to Rendering Engine, HTTP request engine
	3. The engines run asynchronously inside the browser
		1. Within JavaScript engine, it is synchronous
		2. When a button is clicked, other engines run asynchronously which JavaScript code is running synchronously
3. Event Queue:
	1. A list that sits inside JS Engine
	2. It contains notification of events happening outside
		1. Event that happens outside JS Engine that needs to be notified of, is placed inside the Event Queue
		2. We can associate a function to an event to respond to it
	3. Example:
		1. HTTP request has got completed and a function is associated with it to respond to it
	4. When Execution stack is empty, JS Engine looks at the Event queue periodically and waits for something to be in it.
			1. If a Click event is in the event queue, it processes the click event by noticing that a `clickHandle()` function is defined.
			2. An execution context is created and the event is processed
	5. When callback function is executed completely, the event is removed from the event queue.
	6. When execution stack is empty, the next event in the queue is processed.
4. It is the browser, that is putting events asynchronously in the event queue but the JS code is executed line by line synchronously
5. Example:

		// long running function
		function waitThreeSeconds() {
			var ms = 3000 + new Date().getTime();
			while(new Date() < ms) {}
			console.log('finished function');
		}

		function clickHandler() {
			console.log('click event!');
		}

		// listen for the click event
		document.addEventListener('click', clickHandler);

		waitThreeSeconds();
		console.log('finished execution');

6. Run it in browser
	1. If we click while long running function is running

			finished function
			finished execution
			click event!

## Types and Operators ##
### Conceptual Aside: Types and JavaScript ###
1. Dynamic Typing: You don't tell the engine what type of data a variable holds, it figures it out while your code is running
	1. Variables can hold different types of values because it's all figured out during execution
2. Example:
	
		bool isNew = 'hello'; // an error

		// JavaScript
		var isNew = true; // no errors
		isNew = 'yup!';
		isNew = 1;

	1. JavaScript engine will determine the type on the fly

### Primitive Types ###
1. Types of data we can store in a variable
	1. Prmitive type: A type of data that represents a single value
		1. This is not an object
	2. Types:
		1. `undefined` - represents lack of existence (don't set a variable to this)
		2. `null` - represents lack of existence (we can set a variable to this)
		3. `true` or `false` - boolean
		4. Floating point number (there's always some decimals)
			1. There is only one number type (can make math weird)
		5. string - sequence of characters in single quotes or double quotes
		6. symbol (new) - Used in ES6

### Conceptual Aside: Operators ###
1. Operators: A special function that is syntactially (written) differently
	1. Generally, operators take two parameters and return one result
2. Example:

		var a = 3 + 4; // infix notation - function name sits between the parameters
		console.log(a);

	1. Syntax parser saw `+` and added the numbers (it is a function)
		1. Similar to `function +(3, 4) { ... }`
3. Example:
	
		var b = 4 - 3;
		console.log(b);

		var c = 4 > 3;
		console.log(c);

### Operator Precedence and Associativity ###
1. Operator precedence: Which operator function gets called first
	1. Functions are called in order of precedence (Higher precedence wins)
2. Associativity: What order operator functions get called in: Left-to-right or right-to-left
	1. When functions have the same precedence (example: `a + b + c`)
	2. Example:

			var a = 3 + 4 * 5; // 3 + (4 * 5)
			console.log(a);

3. [developer.mozilla.org](developer.mozilla.org)
4. Refer to PDF
5. Example: associativity is used if operators have same precedence

		var a = 2, b = 3, c = 4;
		a = b = c; // a = (b = c) -> returns value of assignment
		console.log(a);
		console.log(b);
		console.log(c);

### Operator Precedence and Associativity Table ###
1. [Link to Original table on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Operator_Precedence)

### Conceptual Aside: Coercion ###
1. Coercion: Converting a value from one type to another
	1. This happens quite often in JavaScript because it's dynamically typed
2. Example:

		var a = 'hello ' + 'world';
		var b = 1 + '2'; // 1 was coerced into a string
		console.log(a);

		var a = 1, b = '2';
		...
		console.log(a + b);

### Comparison Operators ###
1. Example:

		console.log(1 < 2 < 3); // true
		console.log(3 < 2 < 1); // true again

	1. `<` - left-to-right associativity
		1. `3 < 2` returns `false`
		2. `false < 1` returns `true`
			1. `false` is converted to number 0
			2. `0 < 1` becomes true
2. Example:

		Number('3') -> 3
		Number(false) -> 0
		Number(true) -> 1

3. `Number(undefined)` -> `NaN`
4. `Number(null)` -> `0`
5. `3 == 3` -> `true`
6. `'3' == 3` -> `true`
7. `false == 0` -> `true`
8. `null == 0` -> `false` - negative part of the language
9. `"" == 0` -> `true`
10. `... === ...` (strict equality)
	1. compares two values but does not coerce the values
	2. Examples:

			3 === 3 -> true
			'3' === '3' -> true
			'3' === 3 -> false (safe)

			var a = 0;
			var b = false;

			if (a === b) { // use this most of the time
				console.log('They are equal!');
			} else {
				console.log('Nope, not equal.');
			}

11. Refer to PDF

### Equality Comparisons Table ###
1. [Table on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Equality_comparisons_and_sameness)

### Existance and Booleans ###
1. `Boolean(undefined)` -> `false`
2. `Boolean(null)` -> `false`
3. `Boolean('')` -> `false`
4. Example:

		var a; // set to undefined
		// a = null;
		// a = '';

		// goes to internet and looks for a value
		if (a) { // a is coerced to boolean
			console.log('Something is there.');
		}

5. `Boolean(0)` -> `false`

		var a;
		a = 0;
		if (a || a === 0) {
			console.log('Something is there.');
		}

### Default Values ###
1. Example:

		function greet(name) { // name is initially set to undefined during execution context creation
			name = name || '<Your name here>'; // || returns value that is true
			console.log(name)
			console.log('Hello ' + name); // coerces undefined to string
		}

		greet('Tony');
		greet(); // No error

2. Example:

		undefined || 'hello'
		'hello' // value that can be coerced to true since Boolean('hello') returns true

### Framework Aside: Default Values ###
1. framework/library - a grouping of javascript code that performs a task and is intended to be reusable
2. Default values:
	1. Example:

			<body>
				<script src="lib1.js"></script>
				<script src="lib2.js"></script>
				<script src="app.js"></script>
			</body>

		1. lib1.js

				var libraryName = 'Lib 1';
			
		2. lib2.js

				var libraryName = 'Lib 2';

		3. app.js

				console.log(libraryName); // prints 'Lib 2' - it is treated as global variable

			1. The scripts are stacking all the libraries one below the other (the files should not collide with one another)
3. Example: lib2.js

			window.libraryName = window.libraryName || 'Lib 2'; // prints 'Lib 1', frameworks use line like these

## Objects and Functions ##
### Objects and the Dot ###
1. Objects and functions are related
2. Objects: collections of name value pairs
3. How object resides in computer memory:
	1. Object can have properties (primitive type)
		1. primitive property
		2. object property
	2. Object can have methods
		1. function method
	3. Object has an address
		1. Object has references to properties and methods
4. app.js

		var person = new Object();

		person['firstname'] = 'Tony'; // person object will get a reference to firstname property - computed member access operator
		person['lastname'] = 'Alicea';

		var firstNameProperty = 'firstname';
		
		console.log(person);
		console.log(person[firstNameProperty]);

		console.log(person.firstname); // Member access operator (similar to person.'firstname')
		console.log(person.lastname);

		person.address = new Object();
		person.address.street = '111 Main St.'; // left-to-right associativity
		person.address.city = 'New York';
		person.address.state = 'NY';

		console.log(person.address.street);
		console.log(person.address.city);
		console.log(person['address']['state']);

### Objects and Object Literals ###
1. Example:

		// var person = new Object();
		var person = {}; // object literal
		console.log(person); // empty object

		var Tony = {
			firstname: 'Tony',
			lastname: 'Alicea',
			address: {
				street: '111 Main St.',
				city: 'New York',
				state: 'NY'
			}
		}; // object but quicker to right and is treated as one line of code

		// similar to
		var person = new Object();
		person.firstname = 'Tony';
		person.lastname = 'Alicea';

	1. We can pass an object on the fly
		1. Example:

				function greet(person) {
					console.log('Hi ' + person.firstname);
				}

				greet(Tony);

				greet({ 
					firstname: 'Mary', 
					lastname: 'Doe' 
				}); // object is created on the fly

				Tony.address2 = {
					street: '333 Second St.'
				} // Under the hood, syntax does not matter but JS engine behaves the same under the hood

### Framework Aside: Faking Namespaces ###
1. namespace: a container for variables and functions
	1. Typically to keep variables and functions with the same name separate
		1. JavaScript does not need namespaces so we can fake it
2. Example:

		var greet = 'Hello!';
		var greet = 'Hola!';

		console.log(greet); // prints Hola!

3. Example: Objects that are containers

		var english = {};
		var spanish = {};

		english.greet = 'Hello!';
		spanish.greet = 'Hola!';

		console.log(english);

	1. We can have levels
		1. `english.greetings.greet` - `undefined.greet`
		2. Solution:

				english.greetings = {};
				english.greetings.greet = 'Hello!';

		3. Solution: On the fly

				var english = {
					greetings: {
						basic: 'Hello!'
					}
				};

### JSON and Object Literals ###
1. JSON: JavaScript Object Notation (inspired by Object literal)
2. Example:

		var objectLiteral = {
			firstname: 'Mary',
			isAProgrammer: true
		}

		console.log(objectLiteral);

3. JSON: - it is also a valid Object literal syntax (properties can be wrapped in quotes)
	
		{
			"firstname": "Mary",
			"isAProgrammer": true
		}

4. Converting Object to JSON

		console.log(JSON.stringify(objectLiteral));

		var jsonValue = JSON.parse('{ "firstname": "Mary", "isAProgrammer": true }');

		console.log(jsonValue);

### Functions are Objects ###
1. Functions are objects in JavaScript
	1. First class functions: Everything you can do with other types you can do with functions (objects, booleans, ...)
		1. Assign them to variables, pass them around, creation of them on the fly
2. Function resides in memory as a special type of object
	1. We can attach properties, objects and functions to functions (it is just an object)
	2. Hidden special properties:
		1. Name (optional can be anonymous)
		2. Code (lines of code written sit here)
			1. This property is invocable
3. Example:

		function greet() {
			console.log('hi');
		}

		greet.language = 'english';
		console.log(greet); // we get text that we wrote
		console.log(greet.language);

### Function Statements and Function Expressions ###
1. Expression: a unit of code that results in a value
	1. It doen't have to save to a variable
2. Example:

		var a;

	1. In console:

			a = 3; // prints 3
			1 + 2; // prints 3 - expression evaluated and returned a value
			a = { greeting: 'hi' }; // prints Object { greeting: 'hi' }

3. Statement:

		if (a === 3) {

		} // does not return a value

		function greet() {
			console.log('hi');
		} // function statement since it does not return a value

		anonymousGreet(); // Throws an error undefined is not a function

		var anonymousGreet = function () { // function expression is not hoisted
			console.log('hi');
		} // an object gets created on the fly and a variable is set to the object

	1. Address of function object is returned to a variable
		1. No name (anonymous function) - Name attribute is not given value
		2. Invocation:

				anonymousGreet();

4. Example:

		function log(a) {
			console.log(a);
		}

		log('Hello');
		log({
			greeting: 'hi'
		}); // on the fly creation of object

5. Example:

		function log(a) {
			a();
		}

		log(function() {
			console.log('hi');
		}); // because functions are objects - gives rise to functional programming

### Conceptual Aside: By Value vs By Reference ###
1. By value, By reference
2. Example:

		a -referece-> primitive value
		b = a (b -reference-> copy of primitive value) (by value - copies values into separate spots in memory)

3. Objects:

		a -reference-> Object
		b = a (or pass to a function) (by reference - variable )

	1. All objects interact by reference
4. Example:

		// by value (prmitives)
		var a = 3;
		var b;

		b = a;
		a = 2;

		console.log(a);
		console.log(b);

		// by reference (all objects (including functions))
		var c = { greeting: 'hi' };
		var d;

		d = c;
		c.greeting = 'hello'; // mutate

		console.log(c);
		console.log(d);

5. Mutate: To change something (adding or removing or changing properties)
	1. Immutable means it can't be changed
	2. Example:

			// by reference (even as parameters)
			function changeGreeting(obj) {
				obj.greeting = 'Hola'; // mutate
			}

			changeGreeting(d);
			console.log(c);
			console.log(d);

			// equals operator sets up new memory space (new address)
			c = { greeting: 'howdy' }; // c is pointing to new memory space because the object is created on the fly and did not exist in memory
			console.log(c);
			console.log(d);

### Objects, Functions, and 'this' ###
1. Each execution context has
	1. variable environment (where variables live)
	2. reference to outer environment
	3. `this` - points at different object depending on how the function is invoked
		1. Scenarios:
			1. Example:

					console.log(this); // prints Window object (points to global object)

			2. Exmaple:

					function a() {
						console.log(this); // prints Window object again (points to global object)
					}

					a();

			3. Example:

					var b = function () {
						console.log(this); // prints Window object again
					}

					b();

			4. Example:

					function a() {
						console.log(this);
						this.newvariable = 'Hello';
					}

					a();
					console.log(newvariable); // prints Hello

			5. Example:

					var c = {
						name: 'The c object',
						log: function () {
							// this.name = 'Updated c object'; // mutates
							console.log(this); // prints Object {name: "The c object" ...} - points to object that the method is attached to
						}
					}

					c.log();

			6. Example: People feel it is a bug in JS

					var c = {
						log: function () {
							this.name = 'Updated c object';
							console.log(this);

							var setname = function(newname) {
								this.name = newname; // created and added on global object!!! - this is pointing to global object
							}
							setname('Updated again! The c object');
							console.log(this);
						}
					}

				1. Solution:

						log: function() {
							var self = this;
							self.name = 'Updated c object';
							console.log(self);

							var setname = function(newname) {
								self.name = newname; // self is in the outer environment
							}

							setname('Updated again! The c object');
							console.log(self);
						}

### Conceptual Aside: Arrays - Collections of Anything ###
1. Arrays - collection of anything
2. Example:

		// var arr = new Array();
		var arr = [
			1, 
			false, 
			{
				name: 'Tony',
				address: '111 Main St.'
			},
			function(name) { // function expression, function created on the fly
				var greeting = 'Hello ';
				console.log(greeting + name);
			},
			"hello"
		];

		// arr[0]

		console.log(arr);
		arr[3](arr[2].name);

	1. Array is dynamically typed

### 'arguments' and spread ###
1. 'arguments' - keyword automatically set up by JS Engine
	1. Next version may not use
		1. Contains all the values of all parameters passed to a function
2. 'spread' - New approach
3. Arguments: The parameters you pass to a function
	1. Javascript gives you a keyword of the same name which contains them all
4. Example:

		function greet(firstname, lastname, language) {

			language = language || 'en';

			if (arguments.length === 0) {
				console.log('Missing parameters!');
				console.log('-------------');
				return;
			}

			console.log(firstname);
			console.log(lastname);
			console.log(language);
			console.log(arguments); // set up automatically - contains a list of all the values (not an array but arraylike - does not have all features of an array)
			console.log('arg 0: ' + arguments[0]);
			console.log('-------------');
		}

		greet(); // all parameters are undefined during hoisting
		greet('John');
		greet('John', 'Doe');
		greet('John', 'Doe', 'es');

5. spread:

		function greet(firstname, lastname, language, ...other) { // gets wrapped up in an array
			// ES6 function
		}

### Framework Aside: Function Overloading ###
1. function overloading (does not exist in JS) - since functions are objects
2. Example:

		function greet(firstname, lastname, language) {
			language = language || 'en';

			if (language === 'en') {
				console.log('Hello ' + firstname + ' ' + lastname);
			}

			if (language === 'es') {
				console.log('Hola ' + firstname + ' ' + lastname);
			}
		}

		function greetEnglish(firstname, lastname) {
			greet(firstname, lastname, 'en')
		}

		function greetEnglish(firstname, lastname) {
			greet(firstname, lastname, 'es')
		}

		greet('John', 'Doe', 'en');
		greet('John', 'Doe', 'es');

### Conceptual Aside: Syntax Parsers ###
1. Syntax parsers: program that reads the code and determines if it is valid and what are you trying to do.
2. It can make changes to code 

### Dangerous Aside: Automatic Semicolon Insertion ###
1. Automatic semicolon insertion
	1. Semicolons are optional in core JS (JS engine automitaclly inserts `;` if it is expected but it does not exist)
2. Rule 1: Always put semicolons
3. Example:

		function getPerson() {
			return // ; is inserted automatically at the end of return
			{
				firstname: 'Tony'
			}
		}

		console.log(getPerson()); // prints 

### Framework Aside: Whitespace ###
1. Whitespace: Invisible characters that put literal space in your written code
	1. Carriage returns, tabs, spaces
2. Example:

		var 
			// first name of the person
			firstname, 

			// last name of the person
			lastname, 

			// the language
			// can be 'en' or 'es'
			language;

		var person = {
			// the first name
			firstname: 'John',

			// the last name
			// (always required)
			lastname: 'Doe'
		}

		console.log(person);

### Immediately Invoked Functions Expressions (IIFEs) ###
1. IIFE:
2. Example:

		// function statement
		function greet(name) {
			console.log('Hello ' + name);
		}

		greet('John');

		// using a function expression
		var greetFunc = function () { // gets created during execution phase on the fly
			console.log('Hello ' + name);
		};

		greetFunc('John');

		// using an Immediately Invoked Function Expression (IIFE)
		var greeting = function(name) { // gets function object created
			// console.log('Hello ' + name);
			return 'Hello ' + name; 
		}('John'); // invokes function immediately after creation

		console.log(greeting); // contains a string

		3; // no error
		"I am a string"; // no error
		{
			name: 'John'
		}; // no error

		function (name) {
			return 'Hello ' + name;
		}; // error: unexpected token ( - syntax parser assumes this to be a statement and not a function expression

3. Standalone function expression

		var firstname = 'John';

		(function (name) {
			// return 'Hello ' + name;
			var greeting = 'Inside IIFE: Hello';
			console.log(greeting + ' ' + name);
		}(firstname)); // (...) are used only for expression - IIFE

		Alternative:

		(function (name) {
			var greeting = 'Inside IIFE: Hello';
			console.log(greeting + ' ' + name);
		})(firstname); // IIFE

### Framework Aside: IIFEs and Safe Code ###
1. Example:

		// IIFE
		(function (name) {
			var greeting = 'Hello';
			console.log(greeting + ' ' + name);
		}('John'));

	1. GlobalExecution context
	2. When function expression is encountered, function object is created
	3. When `('John')` is encountered a new execution context is created for anonymous function
	4. `greeting` goes into the funtion's execution context
2. Example: greet.js

		var greeting = 'Hola'; // does not collide with greeting in app.js - global variable

3. JS libraries use IIFE with entire code wrapped in `(function () { ... })();`
4. For access to global object

		(function(global, name)) {
			...
			global.greeting = 'Hello';
			...
		}(window, 'John'));

### Understanding Closures ###
1. Example:

		function greet(whattosay) {
			
			return function(name) {
				console.log(whattosay + ' ' + name);
			}

		}

		// greet('Hi')('Tony');

		var sayHi = greet('Hi');
		sayHi('Tony'); // After greet('Hi') got completed, the execution context is popped off. Which has caused whattosay to get lost but this still works because of closures

	1. Global execution context is created
	2. When `sayHi = greet('Hi')` is hit, a new execution context is created
	3. `whattosay` is created and assigned the value `Hi`
	4. When `return function(...)...` is hit, execution context is popped off the stack
	5. The variables and functions space in memory is cleared out using garbage collection normally
	6. But when execution context popps off, the memory space with variables and functions is still there at the moment
	7. When `sayHi(...)` is invoked a new execution context is created and `name` becomes `'Tony'`
	8. When `console.log(whattosay)` is encountered, JS engine goes up the scope chain
		1. The new execution context still has a reference to it's outer environment (to its memory space) - JS engine ensures the scope chain is intact
		2. Concept: The new execution context is closed in it's outer variables - this phenomenon is called closure
		3. closure: it is a feature of JS language

### Understanding Closures - Part 2 ###
1. Example:

		function buildFunctions() {
			var arr = [];

			for (var i = 0; i < 3; i++) {
				arr.push(
					function () {
						console.log(i);
					}
				)
			}

			return arr;
		}

		var fs = buildFunctions();

		fs[0](); // prints 3
		fs[1](); // prints 3
		fs[2](); // prints 3

	1. Global execution context is created and `buildFunction()` and `fs` exist
	2. When `buildFunctions()` is invoked, an execution context gets created and it has `i` and `arr`
		1. When we hit `return` is hit the values of `i` and `arr` are: `3` and `[f0, f1, f2]`
	3. the execution context is popped off the stack but `i` and `arr` are still in memory
	4. When `fs[0]();` is hit, an execution context gets created
		1. When `console.log(i)` is executed, JS engine goes up the scope and finds `i` and its value is `3`
	5. When `fs[1]();` is hit, an execution context gets created
		1. When `console.log(i)` is executed, JS engine goes up the scope and finds `i` and its value is `3`
	6. When `fs[2]();` is hit, an execution context gets created
		1. When `console.log(i)` is executed, JS engine goes up the scope and finds `i` and its value is `3`
	7. All three functions have same ancestor
2. Free variables: Variables that are outside the function to which the function still has access to
3. Example: ES6

		function buildFunctions2() {
			var arr = [];

			for(var i = 0; i < 3; i++) {
				let j = i; // Each time for loop is run, new variable is created
				arr.push(
					function() {
						console.log(j);
					}
				)
			}
		}

3. Example: < ES6

		function buildFunctions2() {
			var arr = [];

			for (var i = 0; i < 3; i++) {
				arr.push(
					(function(j) { // new execution context with a new j gets created
						return function() {
							console.log(j);
						}
					}(i))
				)
			}
		}

### Framework Aside: Function Factories ###
1. Function factories
	1. Example:

			function makeGreeting(language) { // language is trapped in closure
				return function(firstname, lastname) {
					if (language === 'en') {
						console.log('Hello ' + firstname + ' ' + lastname);
					}

					if (language === 'es') {
						console.log('Hello ' + firstname + ' ' + lastname);
					}
				}
			}

			var greetEnglish = makeGreeting('en'); // inner function points to language = 'en'
			var greetSpanish = makeGreeting('es'); // new execution context gets created and inner function points to language = 'es'

			greetEnglish('John', 'Doe');
			greetSpanish('John', 'Doe');

		1. Global execution context gets created which has `greetEnglish`, `greetSpanish` and `makeGreeting()`
		2. When `var greetEnglish = makeGreeting('en');` is hit, an execution context gets created and `language` is `en`
		3. When `return function(...)` is hit, a function is stored in memory and its reference is returned to `greetEnglish` and the execution context of `makeGreeting(...)` is popped out
		4. Wehn `var greetSpanish = makeGreeting('es');` is hit, an execution context gets created and it's `language` is `es`
		5. When `return function(...)` is hit, **a function is stored in memory** and its reference is returned to `greetEnglish` and the execution context of `makeGreeting(...)` is popped out
		6. When `greetEnglish(...)` is hit, a new execution context gets created with `firstname` and `lastname`
			1. The execution context points to memory space with `language` as `en`
		7. When `greetSpanish(...)` is hit, a new execution context gets created with `firstname` and `lastname`
			1. The execution context points to memory space with `language` as `es`
 		
### Closures and Callbacks ###
1. Example:

		function sayHiLater() {
			var greeting = 'Hi!';

			setTimeout(function () { // function expression
				console.log(greeting); // closure
			}, 3000); // drops an event in 
		}

		sayHiLater();

		// jQuery uses function expressions and first-class functions!
		$("button").click(function() {
			
		});

2. Callback:
	1. After the work is done, execute the callback
3. Callback function: a function you give to another function, to be run when the other function is finished
	1. Function you call (invoke) 'calls back' by calling the function you gave it when it finishes
4. Example:

		function tellMeWhenDone(callback) {
			var a = 1000;
			var b = 2000;

			callback(); // the 'callback', it runs the function I give it!
		}

		tellMeWhenDone(function() {
			console.log('I am done!');
		});

		tellMeWhenDone(function() {
			aler('I am done!');
			console.log('All done...');
		});

### `call()`, `apply()`, and `bind()` ###
1. Execution context has: variable environment, this, outer environement reference
2. All functions have access to `call`, `apply` and `bind` methods (they have to do with `this` variable)
3. Example:

		var person = {
			firstname: 'John',
			lastname: 'Doe',
			getFullName: function() {
				var fullname = this.firstname + ' ' + this.lastname;
				return fullname;
			}
		}

		var logName = function(lang1, lang2) {
			console.log('Logged: ' + this.getFullName());
		}

		var logPersonName = logName.bind(person); // this will be person object, bind() returns a new function

		logName(); // fails because `this` points to global object
		logPersonName(); // `this` points to person object

4. Example: bind()

		var logName = function(lang1, lang2) {
			console.log('Logged: ' + this.getFullName());
			console.log('Arguments: ' + lang1 + lang2);
			console.log('---------');
		}.bind(person);

		logName();

5. Example:

		var logName = function(lang1, lang2) {
			console.log('Logged: ' + this.getFullName());
			console.log('Arguments: ' + lang1 + ' ' + lang2);
			console.log('------------');
		}

		var logPersonName = logName.bind(person);

		logPersonName('en');

		logName.call(person, 'en', 'es'); // executes the function with this set to person

6. Example:

		logName.apply(person, ['en', 'es']); // arguments must be passed in an array

7. Example:
		
		(function (lang1, lang2) {
			...
		}).apply(person, ['en', 'es']);

8. Example:

		// function borrowing
		var person2 = {
			firstname: 'Jane',
			lastname: 'Doe'
		}

		console.log(person.getFullName.apply(person2));

		// function currying
		function multiply(a, b) {
			return a * b;
		}

		var multiplyByTwo = multiply.bind(this, 2); // sets permanent values to parameter(s) - a will always become 2
		console.log(multiplyByTwo(4)); // prints 2 * 4

		var multiplyByThree = multiply.bind(this, 3);
		console.log(multiplyByThree(4));

	1. Function currying: creation of a copy of a function but with some preset parameters
		1. Very useful in mathematical situations

### Functional Programming ###
1. Example:

		var arr1 = [1, 2, 3];
		console.log(arr1);

		var arr2 = [];
		for (var i = 0; i < arr1.length; i++) {
			arr2.push(arr1[i] * 2);
		} // too much code

		console.log(arr2);

		function mapForEach(arr, fn) {
			var newArr = [];

			for (var i = 0; i < arr.length; i++) {
				newArr.push(
					fn(arr[i])		
				);
			}

			return newArr;
		}

		var arr2 = mapForEach(arr1, function(item) {
			return item * 2;
		});

		var arr3 = mapForEach(arr1, function (item) {
			return item > 2;
		});
		console.log(arr3);

		var checkPastLimit = function(limiter, item) {
			return item > limiter;
		}

		var arr4 = mapForEach(arr1, checkPastLimit.bind(this, 1));
		console.log(arr4);

		var checkPastLimitSimplified = function (limiter) {
			return function (limier, item) {
				return item > limiter;
			}.bind(this, limit);
		};
 
		var arr5 = mapForEach(arr1, checkPastLimitSimplified(1));
		console.log(arr5);

	1. Avoid mutating values inside tiny functions (change them at higher level)

### Functional Programming - Part 2 ###
1. Underscore.js - library
	1. Work with arrays and collections of objects
2. Download Development Version (has comments)
	1. Or click Annotated source
3. Uses functional programming concept
4. lodash - library
	1. Extra features
	2. Works a little faster
5. Example:

		<script src="underscore.js"></script>
		<script src="app.js"></script>

	1. app.js

			var arr6 = _.map(arr1, function(item) { return item * 3 });
			console.log(arr6);

			var arr7 = _.filter([2, 3, 4, 5, 6, 7], function(item) { return item % 2 === 0; });
			console.log(arr7);

## Object-Oriented JavaScript and Prototypal Inheritance ##
### Conceptual Aside: Classical vs Prototypal Inheritance ###
1. Inheritance: One object gets access to the properties and methods of another object
2. Classical inheritance:
	1. Popular - in Java, C#
	2. Downside:
		1. Very verbose - difficult to figure out if something goes wrong
3. Prototypal inheritance:
	1. Simple
		1. Flexible, extensible, easy to understand

### Understanding the Prototype ###
1. Prototype:
	1. obj -> Prop1
		1. `obj.prop1`
2. All objects (including functions) have a `proto` type property which has a reference to an object
	1. If `proto` has `prop2`
		1. JS engine first looks for `prop2` in `obj` itself
		2. JS endine does not find it and then looks int `proto` and it finds it
3. `proto` can point to another `proto` ...
	1. It may have `prop3`
		1. `obj.prop3` (it is down the prototype chain)
4. Prototype chain: `obj` -> `proto` -> `proto`
5. Another object `obj2` can share same `proto`
	1. `obj2.prop2` - shared property
6. Example:

		var person = {
			firstname: 'Default',
			lastname: 'Default',
			getFullName: function () {
				return this.firstname + ' ' + this.lastname;
			}
		}

		var john = {
			firstname: 'John',
			lastname: 'Doe'
		}

		// Don't use this in real programming - may slow down the program
		john.__proto__ = person;
		console.log(john.getFullName()); // execution context knows which object we are originally talking about
		console.log(john.firstname); // Prints John

		var jane = {
			firstname: 'Jane'
		}

		jane.__proto__ = person;
		console.log(jane.getFullName()); // prints Jane Default

### Everything is an Object (or a primitive) ###
1. Everything that isn't primitive (functions, arrays, objects) have prototype except base object
2. Example:

		var a = {};
		var b = function() {};
		var c = [];

	1. Browser:
		1. `a.__proto__` -> `Object {}` - base object
		2. `b.__proto__` -> `function Empty() {}` - prototype of all functions
			1. Any function has this proto
			2. Example:

					b.__proto__.apply()
					b.__proto__.bind()
					b.__proto__.call()

		3. `c.__proto__` -> `[]` - empty array but has properties and methods (JS automatically sets the prototype)
		
				c.__proto__.push()

		4. `c.__proto__.__proto__` -> `Object {}` - base object
		5. `b.__proto__.__proto__` -> `Object {}` - base object

### Reflection and Extend ###
1. Reflection: An object can look at itself, listing and changing its properties and methods
2. Example:

		var person = {
			firstname: 'Default'
		}

		for (var prop in john) { // loops over all of the members of john object
			console.log(prop + ': ' + john[prop]);
		} // also prints properties of prototype

		for (var prop in john) {
			if (john.hasOwnProperty(prop)) { // reflection - look at its own metadata
				console.log(prop + ': ' + john[prop]);
			}
		}

		var jane = {
			address: '111 Main St.',
			getFormalFullName: function () {
				return this.lastname + ', ' + this.lastname;
			}
		}

		var jim = {
			getFirstName: function () {
				return firstname;
			}
		}

		_.extend(john, jane, jim); // composes/ combines the objects - takes all properties and methods of jane and jim and adds them in john - physically places properties

## Building Objects ##
### Function Constructors, 'new', and the History of JavaScript ###
1. To attract java developers, the following is used in JavaScript

		var john = new Person();

	1. JavaScript doesn't really have a class
2. Function constructors:
	1. Example:

			function Person() { // Function construtor - this is just a function
				console.log(this); // Person {}
				this.firstname = 'John';
				this.lastname = 'Doe';
				console.log('This function is invoked.');
				// return { greeting: 'i got in the way' }; // this gets returned instead of `this`
			}

			var john = new Person(); // new is an operator
			console.log(john);

			var jane = new Person();
			console.log(jane);
		
		1. When `new` is called, an empty object is created
			1. `var a = {};`
		2. Then it invokes the function
			1. Execution context generates a property `this`
			2. new changes `this` to point to the new empty object
		3. If the function does not return any value, `new` returns the new object 
	2. Example:

			function Person(firstname, lastname) {
				console.log(this);
				this.firstname = firstname;
				this.lastname = lastname;
				console.log('This function is invoked.');
			}

			var john = new Person('John', 'Doe');
			console.log(john);

			var jane = new Person('Jane', 'Doe');
			console.log(jane);

3. Function constructors: A normal function that is used to construct objects.
	1. The 'this' variable points to a new empty object, and that object is returned from the function automatically.

### Function Constructors and '.prototype' ###
1. How to set prototype of new objects?
2. Function constructor sets the prototype for us
3. JS Functions are objects with following properties:
	1. name (anonymous)
	2. code (invocable ())
	3. prototype - starts off as empty object
		1. When `new` operator is used, prototype property is used
		2. Prototype property in a function object is not the prototype of the function but it is the prototype of the object that is created if used as function constructor.
4. Example:

		function Person(firstname, lastname) {
			console.log(this);
			this.firstname = firstname;
			this.lastname = lastname;
			console.log('This function is invoked.');
		}

		Person.prototype.getFullName = function () {
			return this.firstname + ' ' + this.lastname;
		} // objects get accessed to this function

		var john = new Person('John', 'Doe');

		Person.prototype.getFormalFullName = function () { // a method can be added after object creation
			return this.lastname + ', ' + this.firstname;
		}

		console.log(john.getFormalFullName());
		console.log(john);

	1. `new` generates an empty `Person {}` object
	2. `new` sets the prototype `__proto__` of the new object to the `prototype` of the function `Person()`
5. If we add method inside `function Person(...)`, each object gets a copy of the method which eats up memory space
	1. But if we add the method to the prototype, only one copy is used by all objects

### Dangerous Aside: 'new' and functions ###
1. If we forget `new`, `undefined` is returned and variables are set to `undefined`
2. Convention: Use Capital letter to start a function constructor
	1. Linter can warn you if it sees the capital letter and no `new`

### Conceptual Aside: Built-In Function Constructors ###
1. Example:

		var a = new Number("3"); // built-in function constructor is used
		a // Prints Number {[[PrimitiveValue]]: 3}
		a.toFixed(2) // prints 3

2. Example:

		var a = new String("John")
		String.protype.<method>
		a.indexOf("o") // prints 1
		a // Prints String object a

3. Example:

		"John".length // JS Engine boxed the literal inside an object
		var a = new Date("3/1/2015")
		Date.prototype.<method>
		a

4. Example:

		String.prototype.isLengthGreaterThan = function (limit) {
			return this.length > limit;
		}

		console.log("John".isLengthGreaterThan(3)); // Primitive string was converted to String object and the method in prototype is invoked

		Number.prototype.isPositive = function () {
			return this > 0;
		}

		3.isPositive() // error. No auto boxing

### Dangerous Aside: Built-In Function Constructors ###
1. Example:

		var a = 3
		var b = new Number(3)
		a == b // coerces types - problem
		a === b // not equal

2. For dates: momentjs.com (dont use `new Date(...)`)
3. Useful scenarios:

		var c = Number("3"); // converts to primitive

### Dangerous Aside: Arrays and for..in ###
1. Example:

		Array.prototype.myCustomFeature = 'cool!';

		var arr = ['John', 'Jane', 'Jim'];

		for (var prop in arr) { // 0, 1, 2 are property names
			console.log(prop + ': ' + arr[prop]); // also prints myCustomFeature - problem
		} // iterates into prototypes

### Object.create and Pure Prototypal Inheritance ###
1. Another way for creation of objects that does not mimic other programming languages
2. Example:

		var person = {
			firstname: 'Default',
			lastname: 'Default',
			greet: function() {
				return 'Hi ' + this.firstname;
			}
		}

		var john = Object.create(person);
		john.firstname = 'John'; // overrides prototype property
		john.lastname = 'Doe';
		console.log(john);
		john.greet(); // firstname will be 'John'

	1. `Object.create(person)`: builds a new empty object and sets its prototype `__proto__` to `person` object
3. Older browser support?
	1. Use polyfill: code that adds a feature which the engine may lack (fill in the gaps)
	2. Example: 

			// polyfill
			if (!Object.create) {
				Object.create = function (o) {
					if (arguments.length > 1) {
						throw new Error('Object.create implementation' + ' only accepts the first parameter.');
					}
					function F() {}
					F.prototype = o;
					return new F();
				};
			}

			...

### ES6 and Classes ###
1. Example:

		class Person {
			constructor(firstname, lastname) {
				this.firstname = firstname;
				this.lastname = lastname
			}

			greet() {
				return 'Hi ' + firstname;
			}
		}

		var john = new Person('John', 'Doe');

	1. In other programming languages, class is not an object but a template
	2. in JS `class Person` is an object and we are building new objects from it
2. Setting prototype

		class InformalPerson extends Person { // sets `__proto__` to `Person`
			constructor(firstname, lastname) {
				super(firstname, lastname);
			}

			greet() {
				return 'Yo ' + firstname;
			}
		}

	1. This is only syntactically different but under the hood it works the same as before
3. Syntactic sugar:
	1. A different way to type something that doesn't change how it works under the hood (JS engine generates the same thing - it is still prototypal inheritance)

## Odds and Ends ##
### Initialization ###
1. Example:

		var People = [
			{
				// the 'john' object
				firstname: 'John',
				lastname: 'Doe',
				addresses: [
					'111 Main St.',
					'222 Third St.'
				]
			},
			{
				// the 'jane' object
				firstname: 'Jane',
				lastname: 'Doe',
				addresses: [
					'111 Main St.',
					'222 Third St.'
				],
				greet: function() {
					retrn 'Hello!';
				}
			}
		];

		console.log(people);

	1. Useful for setting up data (if no db)
		1. We can use it to test interface

### 'typeof', 'instanceof', and Figuring Out What Something Is ###
1. Example:

		var a = 3;
		console.log(typeof a); // what type of variable is it? number (typeof returns a string)

		var b = "Hello";
		console.log(typeof b); // string

		var c = {};
		console.log(typeof c); // object

		var d = [];
		console.log(typeof d); // weird! - object
		console.log(Object.prototype.toString.call(d)); // better!

		function Person(name) {
			this.name = name;
		}

		var e = new Person('Jane');
		console.log(typeof e);
		console.log(e instanceof Person); // If Person is in the prototype chain of e

		console.log(typeof undefined); // makes sense
		console.log(typeof null); // a bug since, like, long time... (returns object)

		var z = function() {};
		console.log(typeof z); // function

### Strict Mode ###
1. JS is flexible - lack of rules
2. Strict mode prevents errors in certain circumstances
3. Example:

		var person;
	
		persom = {};
		console.log(persom); // prints Object {} since it gets created

4. Example: Strict mode

		// "use strict";

		function logNewPerson() {
			"use strict"; // uses strict mode within the function

			var person2;
			persom2 = {};
			console.log(persom2);
		}

		var person;
		person = {};
		console.log(person);

	1. Every JS engine does not implement `use strict` the same way (they do not agree on the same rules)
5. If files are contatenated and minified, `"use strict"` applies to the whole file for all the code (problem if other files do not use the rules)

### Strict Mode Reference ###
1. [MDN Strict Mode Reference](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode)

## Examining Famous Frameworks and Libraries ##
### Learning From Other's Good Code ###
1. Open source education: frameworks that are open source
	1. Github: a good place to learn
		1. Click Explore
		2. See all
		3. Front-end JavaScript frameworks
			1. angular/angular.js
				1. src
	2. jquery.com
		1. Download: uncompressed, development jQuery
		2. View source on Github
2. Find an element that you like and read that part
3. Find the core part and read it

### Deep Dive into Source Code: jQuery - Part 1 ###
1. The most famous library is jquery
	1. We should be able to read the code
	2. We should understand it's structure
2. jQuery makes it easier to write, handles cross browser issues (Browser's are different and have their quirks)
	1. It is used to manipulate the dom
3. Example:
	1. index.html

			<html>
				...
				<body>
					<div id="main" class="container">
						<h1>People</h1>
						<ul class="people">
							<li>John Doe</li>
							<li>Jane Doe</li>
							<li>Jim Doe</li>
						</ul>
					</div>
					<script src="jquery-1.11.2.js"></script> <!-- 2.0 is not for old browsers -->
					<script src="app.js"></script>
				</body>
			</html>

	2. app.js

			var q = $("ul.people li");
			console.log(q);

		1. `__proto__` - `jQuery[0]` (has methods)
4. jQuery:
	1. IIFE
	2. pass `window` or `this` - global object

### Deep Dive into Source Code: jQuery - Part 2 ###
1. jQuery uses Sizzle as CSS selector engine
2. `init.protype = jQuery.fn;` // makes the new object's prototype same as jQuery's prototype

### Deep Dive into Source Code: jQuery - Part 3 ###
1. Example:

		var q = $("ul.people").addClass("newclass").removeClass("people");
		console.log(q);

	1. `addClass` - returns `this` (It is in the prototype - `this` points still points to the one that made the call)
	2. `removeClass` - returns `this`

2. Method chaining:
	1. Calling one method after another, and each method affects the parent object.
		1. So `obj.method1().method2()` where both methods end up with a 'this' variable pointing at `obj`
3. `window.jQuery = window.$ = jQuery;` - exposes jquery function globally

## Let's Build a Framework/ Library! ##
### Requirements ###
1. Frameworks are more complex than library usually
2. Requirements:
	1. It will be called GREETR
		1. Helps us give greetings
		2. It does it using different languages
	2. When given a first name, last name, and optional language, it generates formal and informal greetings.
	3. Support English and Spanish languages
	4. Reusable library/framework.
	5. Easy to type 'G$()' structure
	6. Supports jQuery

### Structuring Safe Code ###
1. File structure:
	1. Greeter.js
	2. index.html

			<html>
				<head>

				</head>
				<body>
					<script src="jquery-1.11.2.js"></script>
					<script src="Greeter.js"></script>
					<script src="app.js"></script>
				</body>
			</html>

	3. app.js
2. Greeter.js
	1. Write safe code and we need access to window and jquery variable

			(function (global, $) {

			}(window, jQuery));

### Our Object and Its Prototype ###
1. It should generate an object
	1. `var g = G$(firstname, lastname, language);`
	2. Implementation:

			(function (global, $) {
				var Greetr = function(firstName, lastName, language) {
					return new Greetr.init(firstName, lastName, language);
				}

				Greetr.prototype = {};

				Greetr.init = function(firstName, lastName, language) {
					var self = this;
			
					self.firstName = firstName || '';
					self.lastName = lastName || '';
					self.language = language || 'en';

					self.validate();
				}

				Greetr.init.prototype = Greetr.prototype;

				global.Greetr = global.G$ = Greetr;

			}(window, jQuery));

2. app.js

		var g = G$('John', 'Doe');
		console.log(g);

### Properties and Chainable Methods ###
1. Put methods on the prototype
2. Make variables not available to the outside world

		var supportedLangs = ['en', 'es'];
		
		var greetings = {
			en: 'Hello',
			es: 'Hola'
		};

		var formalGreetings = {
			en: 'Greetings',
			es: 'Saludos'
		};

		var logMessages = {
			en: 'Logged in',
			es: 'Inicio session'
		};

		Greetr.prototype = {
			fullName: function () {
				return this.firstName + ' ' + this.lastName;
			},
			
			validate: function () {
				if (supportedLangs.indexOf(this.language) === -1) {
					throw "Invalid language";
				}
			},

			greeting: function() {
				return greetings[this.language] + ' ' + this.firstName + '!';
			},

			formalGreeting: function () {
				return formalGreetings[this.language] + ', ' + this.fullName();
			}
			
			greet: function(formal) {
				var msg;
				
				// if undefined or null it will be coerced to 'false'
				if (formal) {
					msg = this.formalGreeting();
				}
				else {
					msg = this.greeting();
				}

				if (console) {
					console.log(msg);
				}

				// 'this' refers to the calling object at execution time
				// makes the method chainable
				return this;
			},

			log: function () {
				if (console) {
					console.log(logMessages[this.language] + ': ' + this.fullName());
				}

				return this;
			},

			setLang: function (lang) {
				this.language = lang;
				this.validate();
					
				return this;
			}
		};

		Greetr.init = function(firstName, lastName, language) {
			...
		}

3. app.js

		var g = G$('John', 'Doe');
		g.greet().setLang('es').greet(true);
		g.greet().setLang('fr').greet(true);

### Adding jQuery Support ###
1. index.html

		<html>
			<head>
		
			</head>
			<body>
				<div id="logindiv">
					<select id="lang">
						<option value="en">English</option>
						<option value="es">Spanish</option>
					</select>
					<input type="button" value="Login" id="login" />
				</div>
				<h1 id="greeting"></h1>
				<script src="jquery-1.11.2.js"></script>
				<script src="Greetr.js"></script>
				<script src="app.js"></script>
			</body>
		</html>

2. app.js

		// $('#greeting').html('greeting');

3. Greetr.js

		HTMLGreeting: function (selector, formal) {
			if (!$) {
				throw 'jQuery not loaded';
			}

			if (!selector) {
				throw 'Missing jQuery selector';
			}

			var msg;
			if (formal) {
				msg = this.formaGreeting();
			} else {
				msg = this.greeting();
			}

			$(selector).html(msg);

			return this;
		}

### Good Commenting ###
1. JS is terse so commenting is important
2. Greetr.js

		// 'new' an object

		// hidden withing the scope of the IIFE

### Let's Use Our Framework ###
1. `;(function(global, $) { ... })`
	1. If another js file is stacked above this and does not end well with a semicolon
2. app.js

		// gets a new object (the architecture allows us to not have to use the 'new' keyword here)
		var g = G$('John', 'Doe');

		...

		// let's use our object on the click of the login button
		$('#login').click(function () {

			// creation of a new 'Greetr' object (let's pretend we know the name from the login)
			var loginGrtr = G$('John', 'Doe');

			// hide the login on the screen
			$('#logindiv').hide();

			// fire off an HTML greeting, passing the '#greeting' as the selector and the chosen language, and log the welcome as well
			loginGrtr.setLang($('#lang').val()).HTMLGreeting('#greeting', true).log();
		});

3. Add languages
4. Add greeings
5. Add methods

### A Side Note ###

## BONUS Lectures ##
### TypeScript, ES6, and Transpiled Languages ###
1. Transpile:
	1. Convert the syntax of one programming language to another
	2. In this case languages that don't really ever run anywhere, but instead are processed by 'transpilers' that generate Javascript
2. TypeScript: typescriptlang.org
	1. Click play
3. traceur:
	1. ES6 transpiler
		1. Example:

				class greet {
					constructor(firstname, lastname) {
						this.firstname = firstname;
						this.lastname = lastname;
					}

					greet() {

					}
				}

### Transpiled Languages References ###
1. [Typescript](http://www.typescriptlang.org)
	1. [Try](http://www.typescriptlang.org/Playground)
2. [Traceur](https://github.com/google/traceur-compiler)
	1. [Try](https://google.github.io/traceur-compiler/demo/repl.html#)

## BONUS: Getting Ready for ECMAScript 6 ##
### Existing and Upcoming Features ###
1. `es6features`: list of features in GitHub

### ES6 Features Reference ###
1. [List of Features in ES6](https://github.com/lukehoban/es6features)

## Conclusion ##
### Learning to Love the Weird Parts ###
1. On occasions, bonus courses may be added.
2. [twitter.com/anthonypalicea](twitter.com/anthonypalicea)