# ES6 Essentials #
## Introducting the Course ##
### Introducing the Course ###
### Introducing the Instructor ###
### Presenting ES6 ###
### Installing a Code Editor ###
### Setting Up With Node ###
1. nodejs.org
2. Click download LTS
3. `node -v`
4. `npm -v`

### Getting the Source Code ###
1. [https://github.com/15katz/es6-tutorial](https://github.com/15Dkatz/es6-tutorial/)

## Setting Up ES6 Tools ##
### Why We Need Babel ###
1. What is a transpiler:
	1. Transpiler reads code written in one language and produces the equivalent code in another.
	2. TS has shorter code
	3. Browsers only currently have widespread support of older JS
	4. Babel: ES6 code into pre-ES6 code

### How Babel Works ###
1. babeljs.io
2. Click Try it Out
	1. Experiment:

			const a = 'es6 constant';

			{
				let a = 'another es6 variable';
			}

### Benefits of Webpack ###
1. Webpack: Allows to run an environment that hosts babel
2. github documentation:
	1. Bundler for modules
3. Benefits:
	1. It bundles modules into one .js file
	2. Comes with a dev-server

### Setting Up With Webpack ###
1. `mkdir es6`
2. `cd es6`
3. `npm init -y`
4. `npm install --save-dev webpack`
	1. installs webpack and updates package.json
5. `atom .`
6. New folder: `build`
	1. `build/index.html`

			<!DOCTYPE html>
			<html>
				<head>
					<meta charset="utf-8">
					<title>ES6</title>
				</head>
				<body>
					<script type="text/javascript" src="bundle.js"></script>
				</body>
			</html>

7. `app/index.js`

		console.log('Hello world! (from webpack)');

8. `webpack.config.js`

		module.exports = {
			entry: ['./app/index.js'],
			output: {
				path: './build',
				filename: 'bundle.js'
			}
		}

9. `package.json`

		"scripts": {
			"build": "webpack"
		}

10. `npm run build`
11. Open `index.html` in browser

### Setting Up With Webpack (extra notes) ###
1. Fixes if `npm start` does not work
	1. install webpack globally with `npm install webpack -g`
	2. Change path in `webpack.config.js` to `path: _dirname + '/build'`
	3. If above path does not work, try `path: __dirname + '/dist/js'`
	4. Clone the repo and run `npm install` and `npm start`

### Webpack-ing Babel ###
1. Adding babel to webpack
	1. `npm install babel-core babel-loader webpack-dev-server babel-preset-es2015 babel-polyfill --save-dev`
		1. `babel-core`: contains much of the logic to transpile ES6 to JavaScript
		2. `babel-loaer`: accomplishes the transformation
		3. `webpack-dev-server`: for automatic live code updates
		4. `babel-preset-es2015`: for specifying presets to convert ES6 to JS
		5. `babel-polyfill`:
			1. polyfill: code that implements a feature on web browsers that do not support the feature.
				1. Replicate an API using JavaScript (or Flash ...) if browser doesn't doesn't have it natively
				2. Shim: library that brings new API to an older environment, using only the means of that environment
				3. Fills in holes (in functionality) in many (poly) ways
				4. Unlike Shim, if you removed polyfill script, code would continue to work without any changes required in spite of the polyfill being removed.
				5. Example: `HTML5Shiv`: In IE9, by default, unknown element like `<section>` and `<nav>` would be parsed as empty elements which breaks the nesting structure and making the elements impossible to style.
					1. `HTMLShiv` calls `document.createElement('tagname')` for each of the new HTML5 elements which causes IE to parse them correctly
					2. It also has basic default styling
			2. ES6 expects to run javascript and babel to run natively on browser even if the browser does not support it
2. `webpack.config.js`
	
		module: {
			loaders: [
				{
					loader: 'babel-loader',
					test: /\.js$/
					exclude: /node_modules/
				}
			]
		},
		devServer: {
			port: 3000,
			contentBase: './build',
			inline: true
		}

3. `package.json`

		"scripts": {
			...
			"start": "webpack-dev-server"
		},
		"babel": {
			"presets": ["es2015"]
		}

4. `npm start`

### Break: Babel and Webpack ###
1. [https://github.com/15Dkatz/es6-tutorial](https://github.com/15Dkatz/es6-tutorial) - starting point for any es6 project
2. Main points:
	1. Transpiler: reads code written in one language and produces equivalent code in another
	2. Transpiler compiles es6 code into dense JavaScript code that browser interprets.
		1. Babel is a popular es6 transpiler
	3. Webpack can be used to setup an environment that transforms es6 code with babel
		1. Combines multiple modules into one js file to reduce errors and resources on client-side
		2. Shipping with a developer server, gives us live code updating for free

## Coding New ES6 Syntax ##
### Getting Help With Code ###
1. Download from [https://github.com/15Dkatz/es6-tutorial](https://github.com/15Dkatz/es6-tutorial)

### Variable Scoping with Let ###
1. `npm start`
2. `index.html`
	
		<h2>Hooray for ES6!</h2>
		...

3. `index.js`

		let a = 'hello'; //whenever we want to change a variable
		console.log(a)

		{ // can have private variables
			let salary = 90000;
			let a = 'goodbye'; // reuse is possible because it is inside a different block scope
			console.log('a inside scope', a);
			console.log(salary)
		}

		console.log(salary);

### Coding Exercise 1: Let's Scope 'lets' ###
### Constant-ly Scoping ###
1. `const`: constants - we cannot change its value afterwards

		const a = 2;
		a = 3 * 4; // syntax error

2. It only restricts re-assignment
	1. Example: if a complex array is assigned to const variable, it can still be manipulated

			const array = [1, 2, 3];
			array.push(4);
			console.log(array);

			array = [1]; // syntax error

	2. Protection if we want certain variables to stay the same throughout code
	3. It is optimizable: engine can negate using resources to track the variable for potential changes

### Quiz 2: Can we manipulate constants? ###
### Template Literals/Strings ###
1. Template literals?
	1. strings with embedded code or variables inside
	2. Allow concatenation and interpolation in a better way
2. Example: ES5

		var a = 'hello';
		var b = 'world';
		var c = a + ' ' + b;
		console.log(c);

3. Example: ES6

		let d = `hello ${b}`;
		console.log(d);

		let e = `${a} world`;
		console.log(e);

### Coding Exercise 3: Mastering Template Literals & ES6 Strings ###
### Coding Break: New ES6 Syntax ###
1. Review:
	1. Block scoping: binds variable declarations to blocks of code
	2. let replaces var in ES6
	3. const declares variable that cannot be re-assigned
	4. Template literals are strings with embedded variables or code inside
		1. They have `` with interpolated `${}`

## Operating and Destructuring ##
### Understanding the Spread Operator ###
1. Example:

		let a = [7, 8, 9];
		let b = [6, ...a, 10];
		console.log(b);

2. Pre-ES6 code:

		var b = [6].concat(a, [10]);

3. Parameters:
	
		function print(a, b, c) {
			console.log(a, b, c);
		}
		let z = [1, 2, 3];
		print(z[1], z[2], z[3]); // normal
		print(...z); // using spread operator

		function print(...z) {
			console.log(z);
		}
		print(1, 2, 3, 4, 5);

### Coding Exercise 4: Butter Spread ###
### Destructuring Assignment - Arrays ###
1. Extracting values of an array or object into separate variables
2. Example:

		let c = [100, 200];
		let a = c[0];
		let b = c[1];
		console.log(a, b);

		let [a, b] = c;
		console.log(a, b);

3. Example:

		let felloship = ["Frodo", "Gandalf", "Aragorn"];
		let [hobbit, wizard, ranger] = fellowship;
		console.log(hobbit, wizard, ranger);

4. Example:

		let c = [100, 200, 300, 400, 500];
		let [a, ...b] = c;
		console.log(a, b);

### Quiz 5: Destructuring the Fellowship (Array) ###
### Destructuring Assignment - Objects ###
1. Example:

		let wizard = {magical: true, power: 10};
		let magical = wizard.magical;
		let power = wizard.power;
		console.log(magical, power);

		let { magical, power } = wizard; // matches variable name on left and property name on the right and assigns the value
		console.log(magical, power);

		let magical = true;
		let power = 2;

		let ranger = { magical: false, power: 9 };
		let { magical, power } = ranger; // syntax error
		({ magical, power } = ranger);
		console.log(magical, power);

### Quiz 6: Destrucutring Animals (Objects) ###
### Coding Break: Operating and Destructuring ###
1. Review:
	1. es6 spread operator: spreads contents of an array or object into multiple variables. `...<array>`
	2. Destructuring assignment: to extract data from arrays or objects into separate distinct variables
	3. Array Destructuring Assignment: Assigns multiple variables from an array.
		1. `let [a, b] = c;`
	4. Object Destructuring Assignment: Assigns multiple variables from an object.
		1. `let {a, b} = c;`

## ES6 Functions and Methods ##
### Arrow Functions ###
1. They are anonymous: not have a name
2. Example:

		function blashoff() {
			console.log('3...2...1... blastoff!');
		}

		blastoff();

		setTimeout(function () {
			console.log('3...2...1... blashoff!');
		}, 1000);

		setTimeout(() => {
			console.log('3...2...1... blastoff!');
		}, 1000);

		const blastoff = () => {
			console.log('3...2...1... blastoff!');
		};

		blastoff();

### Arrow Functions Ignoring This ###
1. Benefits:
	1. They do not bind their own `this`
		1. `this` is an object that is within the function scope. Function then binds keys and values to `this` object
		2. `this` access the `this` of global scope or function wrapped around them
2. Example:
	1. Get rid of `"babel": {...}` from `package.json`
		1. enables strict mode
	2. Example:

			this.a = 25;

			let print = function() {
				this.a = 50; // in the function scope
				console.log('this.a', this.a);
			}

			print();

			let arrowPrint = () => {
				console.log('this.a in arrowPrint', this.a);
			}

			arrowPrint();

### Coding Exercise 7: Archery (Arrow Functions) ###
### Helping With the Map Method ###
1. Map function: generates an array by calling a function on each element of the array
2. Example:

		let points = [10, 20, 30];

		let addOne = (element) => {
			return element + 1;
		}

		points = points.map(addOne); // addOne is callback - called on each element

		console.log(points);

		points = points.map(element => element + 1);

		console.log(points);

### Coding Exercise 8: Scaling Maps (Map Helper Method) ###
### Filtering in ES6 ###
1. Filter method: returns an array based on another array with usually reduced size:
2. Example:

		let isPassing = (grade) => {
			return grade >= 70;
		}

		let scores = [90, 85, 67, 71, 70, 55, 92];

		// let passing = scores.filter(isPassing);
		let passing = scores.filter(element => element >= 70);

		console.log(passing);

3. Other methods:
	1. `find()`: returns a value in an array that passes a given test
	2. `forEach()`: similar to map, calls a function for each array element
	3. `reduce()`
	4. `some()`
	5. `keys()`
	6. `values()`

### Coding Exercise 9: Filtering For Stars (Filter Helper Method) ###
### Coding Break: Functions and Methods ###
1. Review:
	1. Arrow functions: shorter syntax
		1. They are anonymous
		2. They do not bind the `this` object to function scope
	2. `map` helper method calls a function on each element of an initial array
	3. `filter` calls a function on each element and optionally adds it to new array

## Modules in ES6 ##
### Exporting Values ###
1. Modules: reusable pieces of code within the system
	1. They are usually in separate files
2. `app/students.js`

		export const students = ["Harry", "Ron", "Hermoine"]; // exports variable

	1. `export`: export function, variable, ... from a module to other files

3. `app/index.js`

		import { students } from './students'; // imports variable students from students.js file
		console.lg(students);

	1. `import`: import function, variable, ... from another module or file

4. `app/students.js`

		export const total = 505;

5. `app/index.js`

		import { ..., total } from './students';
		console.log(students, total);

### Exporting Expressions and by Default ###
1. `app/calculator.js`

		const add = (x, y) => x + y;
		const multipy = (x, y) => x * y;

		export { add, multiply };
		export default multiply; // fallback for the entire module

2. `app/index.js`

		// import { add, multiply } from './calculator';
		import multiply from './calculator'; // no braces
		console.log(add(3, 5));
		console.log(multiply(3, 5));

3. `export default const multiply` - default variable is created. const and default should not be declared simultaniously
	1. `app/calculator.js`

			export default let x, y, z; // error

### Quiz 10: Exports and Imports (Modules) ###
### Break: Modules ###
1. Review:
	1. Modules: reusable pices of code that often exist in their own files
	2. Export sends functions, objects, primitive values from module to another
	3. Import receives functions, objects, or primitive values from another module
	4. `default` export is fallback or "main" value/function for a module
	5. `export default` cannot be used while declaring variables
2. `node_modules`: has modules that were built by other JS developers

## ES6 Classes ##
### Presenting Object-Oriented Programming ###
1. Objects are mapped to real world objects
2. covers encapsulation, inheritance, abstraction, ...
3. We use class[es]
4. Example:
	1. Entity class:
		1. Entities have a name, and height property
		2. Entiteis `greet()` you with "Hi, I'm <my name>! I live in middle earth."
		3. Class Entity { name, height, greet() }
	2. Hobbit class:
		1. Hobbits have a name, height and gree()
			1. Can be inherited from Entity class
		2. Class Hobbit { name, Height, greet() {"Hello! I'm <my name> from the shire!"}}

### Setting Up an ES6 Class ###
1. `app/index.js`

		class Entity {
			constructor(name, height) {
				this.name = name;
				this.height = height;
			}

			greet() {
				console.log(`Hi! I'm ${this.name} from middle earth!`);
			}
		}

		let Merry = new Entity("Merry", 4.6);
		Merry.greet();

### Quiz 11: ES6 Classes ###
### Inheritance in ES6 Classes ###
1. `app/entity.js`
	1. Move code to it

			...
			
			export default Entity;

2. `app/index.js`

		import Entity from './entity';

		class Hobbit extends Entity {
			constructor(name, height) {
				super(name, height);
			}

			greet() {
				console.log(`Hello I'am ${this.name} from the Shire!`);
			}
		}

		let Frodo = new Hobbit("Frodo Baggins", 4.5);
		console.log(Frodo);
		Frodo.greet();

### Coding Exercise 12: Inherting Powers (Class Inheritance) ###
### Break: Classes ###
1. Review:
	1. OOP models "objects" to real world objects assigning state and relevant methods to the objects
	2. Encapsulation, keeps data safe from outside of classes
	3. Inheritance is when another class extends a class which receives all behavior from base class
	4. `class` holds pertinent data and methods and also allows simple inheritance
	5. `extends`: keyword for inheriting data and behavior from base class

## Extending Upon ES6 with React ##
### JSX in ES6 ###
1. React is in ES6
2. Setup:
	1. `npm install react-dom react babel-preset-react --save-dev`
	2. `package.json`

			"babel": {
				"presets": [
					..., "react"
				]
			}

	3. `index.html`

			<body>
				<div id="root"></div> <!-- react is going to target this div and overlay rendering components on this root -->
				...
			</body>

	4. `index.js`

			import React, { Component } from 'react';
			import ReactDOM from 'react-dom';

			class App extends Component {
				render() {
					return (
						<div>React JS and JSX in action!</div>
					)
				}
			}

			ReactDOM.render(<App />, document.getElementById('root'));

### ES6 Promises and More React ###
1. API: Open weather map
	1. `openweathermap.org`: sign up
	2. Click API keys
		1. Copy the key into `const api_key = '<key>'` in `index.js`
2. `index.js`

		class App extends Component {
			constructor(props) {
				super(props);
				this.state = {
					city: 'San Francisco',
					description: ''
				}
			}

			componentDidMount() { // runs following code when component fully renders on the screen
				this.grabWeather(this.state.city);
			}

			grabWeather(city) {
				fetch(`http://api.openweathermap.org/data/2.5/weather?APPID=${api_key}&q=${city}`)
				.then(response => response.json())
				// .then(json => console.log(json));
				.then(json => {
					this.setState({description: json.weather[0].description)
				});
				// Promise handles result of an operation or function, it determines return of success or failing value
			}

			render() {
				return (
					<div>
						<h1>Weather Report for {this.state.city}!</h1>
						<h2>{this.state.description}</h2>
					</div>
				)
			}
		}

### Quiz 13: ES6 JSX and Promises ###
### Overview: Extending Upon ES6 With React ###
1. Review:
	1. React is a popular JS framework supported by Facebook that allows for web app development in es6
	2. JSX adds XML syntax to JavaScript and allows for rendering elements and components onto web app
	3. Promise: Handles result of an operation and determines if it returns a success or failure

## Concluding the Course ##
### Final Remarks ###
1. More courses:
	1. ReactJS and Redux: Code - ES6PRO
	2. React Native - ES6PRO

### Bonus Lecture: In-Depth ES6 and ES7 Course! ###
1. ES7 is out and ES8 is coming soon
2. Follow up for the course: [The Full JavaScript & ES6 Tutorial (including ES7 & React)](https://www.udemy.com/es6-in-depth/?couponCode=TEAMES6)
	1. In depth into ES6
	2. ES7
	3. Expected features in ES8
	4. Full JS review, webpack, React, ...
	5. Discount code: TEAMES6
3. Link [Find the course here](https://www.udemy.com/es6-in-depth/?couponCode=TEAMES6)
4. [Discount Link to In-Depth ES6 Course including ES7](https://www.udemy.com/es6-in-depth/?couponCode=TEAMES6)

### Be the First to Know about New Material and Courses! ###
1. [Global JS Society](https://www.facebook.com/groups/282461032187820) - Facegroup group for sharing good ES6, JS, and Coding resources