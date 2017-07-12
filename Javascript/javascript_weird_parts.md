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

### Operator Precedence and Associativity Table ###
### Conceptual Aside: Coercion ###
### Comparison Operators ###
### Equality Comparisons Table ###
### Existance and Booleans ###
### Default Values ###
### Framework Aside: Default Values ###

## Objects and Functions ##
### Objects and the Dot ###
### Objects and Object Literals ###
### Framework Aside: Faking Namespaces ###
### JSON and Object Literals ###
### Functions are Objects ###
### Function Statements and Function Expressions ###
### Conceptual Aside: By Value vs By Reference ###
### Objects, Functions, and 'this' ###
### Conceptual Aside: Arrays - Collections of Anything ###
### 'arguments' and spread ###
### Framework Aside: Function Overloading ###
### Conceptual Aside: Syntax Parsers ###
### Dangerous Aside: Automatic Semicolon Insertion ###
### Framework Aside: Whitespace ###
### Immediately Invoked Functions Expressions (IIFEs) ###
### Framework Aside: IIFEs and Safe Code ###
### Understanding Closures ###
### Understanding Closures - Part 2 ###
### Framework Aside: Function Factories ###
### Closures and Callbacks ###
### `call()`, `apply()`, and `bind()` ###
### Functional Programming ###
### Functional Programming - Part 2 ###

## Object-Oriented JavaScript and Prototypal Inheritance ##
### Conceptual Aside: Classical vs Prototypal Inheritance ###
### Understanding the Prototype ###
### Everything is an Object (or a primitive) ###
### Reflection and Extend ###

## Building Objects ##
### Function Constructors, 'new', and the History of JavaScript ###
### Function Constructors and '.prototype' ###
### Dangerous Aside: 'new' and functions ###
### Conceptual Aside: Built-In Function Constructors ###
### Dangerous Aside: Built-In Function Constructors ###
### Dangerous Aside: Arrays and for..in ###
### Object.create and Pure Prototypal Inheritance ###
### ES6 and Classes ###

## Odds and Ends ##
### Initialization ###
### 'typeof', 'instanceof', and Figuring Out What Something Is ###
### Strict Mode ###
### Strict Mode Reference ###

## Examining Famous Frameworks and Libraries ##
### Learning From Other's Good Code ###
### Deep Dive into Source Code: jQuery - Part 1 ###
### Deep Dive into Source Code: jQuery - Part 2 ###
### Deep Dive into Source Code: jQuery - Part 3 ###

## Let's Build a Framework/ Library! ##
### Requirements ###
### Structuring Safe Code ###
### Our Object and Its Prototype ###
### Properties and Chainable Methods ###
### Adding jQuery Support ###
### Good Commenting ###
### Let's Use Our Framework ###
### A Side Note ###

## BONUS Lectures ##
### TypeScript, ES6, and Transpiled Languages ###
### Transpiled Languages References ###

## BONUS: Getting Ready for ECMAScript 6 ##
### Existing and Upcoming Features ###
### ES6 Features Reference ###

## Conclusion ##
### Learning to Love the Weird Parts ###