# What to Learn Before a JavaScript Framework #
1. JavaScript fundamentals:
	1. Basic syntax
	2. Variables
	3. Arrays & Object Literals
	4. Events
	5. Functions, loops, conditionals
2. Modules
	1. Used to import files/pieces of code into another file. No framework without framework (allows everything to be brought together)
	2. ES6 modules, TypeScript (Angular)
	3. Parcel, Webpack & Babel
		1. To compile modules
	4. Export & Export Default
3. Classes
	1. Usually used in React & Angular
		1. Structuring a class
		2. Constructors
		3. Methods & properties
		4. Instantiation
		5. Extending classes
4. Arrow functions:
	1. Make much more compact and give advantages when it comes to scope in certain situations
		1. Looks much cleaner and less lines of code
		2. The standard in writing modern JS
		3. Scope and "lexical this"
5. Promises/ Asynchronous requests
	1. Better solution than callbacks
		1. Learn how to define and receive promises
		2. Standard `.then()` and `.catch()` syntax
		3. Async/Await is optional but recommended
		4. Learn Fetch API for making HTTP requests
6. Destructuring
	1. Unpacks values from objects and arrays. Used in frameworks and makes for cleaner and more readable code

			const { name, email } = user;
			const { name, email, address: { city } } = user;

7. Concept of components and state
	1. UIs are broken up into individual components of which have some sort of state associated with them
		1. Each component can have it's own data & state of being
		2. We also have application level state, usually implemented using a state manager like Redux, Vuex, etc
		3. Nested component (Parent & children)
		4. Can be directly inserted or used in a router
8. Spread operator
	1.  State is usually immutable, we cannot simply change it, we need to copy. Spread operator allows this
	
			const userState = {
				name: `John'
			}

			const newUserState = {
				...userState, // gives contents
				age: 30
			}

9. High order array functions
	1. Functions like `forEach()`, `map()`, `filter()` are used to iterate through and manipulate data (takes another function as parameter)
		1. `forEach()`: Basic iteration/looping
		2. `map()`: Manipulating data to construct a new array
		3. `filter()`: Used to filter certain pieces of data. Used a lot in state reducers
10. Above make it easy to learn many frameworks
