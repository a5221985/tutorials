# The Complete JavaScript Course #
1. Why Javascript?
	1. Powers most internet
	2. React, Angular, NodeJS
2. Problems:
	1. Confusing
3. Topics
	1. Theory
	2. Basics to complex
	3. How Javascript works behind the scenes
	4. Javascript in the browser: DOM manipulation and events
	5. Advanced Javascript: Objects and Functions
	6. Putting it all together: The Budget App Project
	7. Get ready for future: ES6/ ES2015
	8. Bonus: Coding challenges with solutions
	9. Bonus: Exam

## Setting up our Tools ##
1. [Brackets](brackets.io)
	1. Themes
	2. Extension
		1. Autosave Files on Window Blur: save on leaving app
2. Chrome
	1. View > Developer > JavaScript Console
	2. `console.log('Hello World!')`

## Section Intro ##
1. Basics
	1. Variables
	2. Data flows
	3. Functions
	4. Objects
	5. ...

## Download the Code ##
1. [https://www.udemy.com/the-complete-javascript-course/learn/v4/t/lecture/5869084](https://www.udemy.com/the-complete-javascript-course/learn/v4/t/lecture/5869084)

## Introduction to JavaScript ##
1. JavaScript is a lightweight, cross-platform, object-oriented computer programming language
	1. Lightweight: less memory usage, simple syntax
	2. Cross-platform: multiple systems
	3. Object-oriented: Based on objects
2. JavaScript is one of hte three core technologies of web development
3. JavaScript is most commonly used as a part of webpages
4. Today, JavaScript can be used in different places:
	1. Client-side: JavaScript was traditionally only used in the browser
	2. Server-side: Thanks to node.js, we can use JavaScript on the server as well
5. JavaScript is what made modern web development possible
	1. Dynamic effects and interactivity
	2. Modern and complex web applications that we can interact with

### The Role of JavaScript ###
1. HTML: COntent
	1. NOUNS: `<p></p>` means "**paragraph**"
2. CSS: Presentation (styling)
	1. ADJECTIVES: `p { color: red; }` `means "the paragraph text is **red**"
3. JS: Dynamic effects/programming
	1. Manipulation of content
	2. VERBS: `p.hide();` means **hide** the paragraph

## Getting Started with JavaScript ##
1. Open Brackets
	1. Getting Started v Open Folder > JS Basics
2. Two ways to write JS
	1. Inline script: 
		1. Inside html file
	2. External script: 
		1. Separate file
3. Inline scripting **(M)**

		<script>
			console.log('Hello World!');
		</script>	

	1. Drawback:
		1. Difficult to maintain code

4. Open the text file in Browser
	1. Inspect > Console

5. External script
	1. New File > `script.js`
	
			console.log('Hello World!');

	2. Linking

			<script src="script.js"></script>

## Variables and Data Types ##
1. script.js

		var name = 'John'; // var name = "John";
		console.log(name);

		var lastName = 'Smith'; // Camel casing
		console.log(lastName);

		var age = 26;
		console.log(age);

		var fullAge = true;
		console.log(fullAge);

2. Data types
	1. **Number**: Always floating point numbers, for decimals and integers
	2. **String**: Sequence of characters, used for text
	3. **Boolean**: Logical data type that can only be `true` or `false` **(M)**
	4. **Undefined** **(M)**: Data type of a variable which does nto have avalue yet
		1. Automatically assigned to variable that is not assigned a value yet
	5. **Null** **(M)**: Also means 'non-existent'
		1. More specific

3. Dynamic typing:
	1. Javascript figures out data type on its own and on the fly

## Variable Mutation and Type Coercion ##
1. Comments

		// single line

		/*
			multiple
			lines
		*/

2. script.js

		// Lecture: variables 2
		var name = 'John';	// var is only for declaration
		var age = 26;

		console.log(name + age);
		console.log(age + age); // adds numbers

		var job, isMarried;

		console.log(job);	// Prints 'undefined'

		job = 'teacher';
		isMarried = false;

		console.log(name + ' is a ' + age + ' years old ' + job + '. Is he married? ' + isMarried + '.');

		age = 'thirty six';
		job = 'driver';

		console.log(name + ' is a ' + age + ' years old ' + job + '. Is he married? ' + isMarried + '.');

3. Why Javscript converts to string?
	1. Type Coercion: JS Automatically converts datatypes
		1. Figures out to which type to convert and converts automatically
4. Getting data from console:

		var lastName = prompt('What is the last name?'); **(M)**
		console.log(lastName);

		alert(name + ' is a ' + age + ' years old ' + job + '. Is he married? ' + isMarried + '.');

## Operators ##
1. script

		// Lecture: operators
		var now = 2017;
		var birthYear = now - 26;
		birthYear = now - 26 * 2;

		console.log(birthYear);

2. Operator precedence
	1. [codingheros.io/resources](codingheros.io/resources)
		1. Operator precedence table
3. More

		var ageJohn = 30;
		var ageMark = 30;

		ageJohn = (3 + 5) * 4 - 6;
		console.log(ageJohn);

		ageJohn = ageMark = (3 + 5) * 4 - 6;
		console.log(ageJohn);
		console.log(ageMark);

		ageJohn++;	// adds 1 to ageJohn
		
## If / Else Statements ##
1. Code
		
		// Lecture: if/else statements
		var name = 'John';
		var age = 26;
		var isMarried = 'no';

		if (isMarried === 'yes') {
			console.log(name + ' is married!');
		} else {
			console.log(name + ' will hopefully marry soon');
		}

		isMarried = false;

		if(isMarried) {
			console.log('YES!');
		} else {
			console.log('NO!');
		}

		if(23 == '23') {
			console.log('Something to print...');
		}

2. === vs ==
	1. no type conversion is done for ===. Even the types of lhs and rhs have to match
		1. 1 === '1' is false
		2. 1 == '1' is true, does type coersion

## Boolean Logic and Switch Statement ##
1. code
		
		// Lecture: boolean logic and switch
		var age = 16;
		
		if (age < 20) {
			console.log('John is a teenager');
		} else {
			console.log('John is a man');
		}

2. Boolean logic
	1. AND (&&) -> true if all are true
	2. OR (||) -> true if one is true
	3. NOT (!) -> inverts true/false value
	4. Examples:

			var age = 16;

			age >= 20;		// false
			age < 30;		// true
			!(age < 30);	// false

			age >= 20 && age < 30;	// false
			age >= 20 || age < 30;	// true

	5. Example:

			var age = 25;

			if (age < 20) {
				console.log('John is a teenager.');
			} else if (age >= 20 && age < 30) {
				console.log('John is a young man.');
			} else {
				console.log('John is a man.');
			}

3. Switch statement

		var job = 'teacher';

		job = prompt('What does John do?');

		switch (job) {
			case 'teacher':
				console.log('John teacher kids.');
				break;
			case 'driver':
				console.log('John drives a cab in Lisbon.');
			case 'cop':
				console.log('John helps fight crime.');
				break;
			default:
				console.log('John does something else.');
		}

## Coding Challenge 1 ##
1. Challenge:

		John and a friend invented a simple game where the player with the highest value of his height (in centimeters) plus five times his age wins (what a silly game :)

		1. Create variables for the heights and ages of two friends and assign them some values
		2. Calculate their scores
		3. Decide who wins and print the winner to the console. Include the score in the string that you output to the console. Don't forget that there can be a draw (both players with the same score).
		4. EXTRA: Add a third player and now decide who wins. Hint: you will need the && operator to take the decision. If you can't solve this one, just watch the solution, it's no problem

## Solution ##
1. code

		var heightJohn = 172;
		var heightMike = 165;
		var ageJohn = 26;
		var ageMike = 29;

		var scoreJohn = heightJohn + 5 * ageJohn;
		var scoreMike = heightMike + 5 * ageMike;

		if (scoreJohn > scoreMike) {
			console.log('John wins the game with ' + scoreJohn + ' points!');
		} else if (scoreJohn < scoreMike) {
			console.log('Mike wins the game with ' + scoreMike + ' points!');
		} else {
			console.log('There is a draw.');
		}

		var heightMary = 158;
		var ageMary = 31;
		var scoreMary = heightMary + 5 * ageMary;

		if (scoreJohn > scoreMike && scoreJohn > scoreMary) {
			console.log('John wins the game with ' + scoreJohn + ' points!');
		} else if (scoreMike > scoreJohn && scoreMike > scoreMary) {
			console.log('Mike wins the game with ' + scoreMike + ' points!');
		} else if (scoreMary > scoreJohn && scoreMary > scoreMike) {
			console.log('Mary wins the game with ' + scoreMary + ' points!');
		} else {
			console.log('It\'s is a draw.');
		}

2. Console:
	1. > scoreJohn
	2. > scoreMike
	3. up arrow shows all commands

## Functions ##
1. What are functions?
	1. A peice of code that can be run many times
	2. They can take arguments and may return a result
	3. It is like a machine that takes something and return something
	4. To satisfy the principle "don't repeat yourself"
2. Code

		function calculateAge(yearOfBirth) {
			var age = 2017 - yearOfBirth;
			return age;
		}

		var ageJohn = calculateAge(1990);
		var ageMike = calculateAge(1969);
		var ageMary = calculateAge(1948);
		console.log(ageJohn);
		console.log(ageMike);
		console.log(ageMary);

		function yearsUntilRetirement(name, year) {
			var age = calculateAge(year);
			var retirement = 65 - age;

			if (retirement >= 0) {
				console.log(name + ' retires in ' + retirement + ' years.');
			} else {
				console.log(name + ' has already retired.');
			}
		}

		yearsUntilRetirement('John', 1990);
		yearsUntilRetirement('Mike', 1969);
		yearsUntilRetirement('Mary', 1948);

## Statements and Expressions ##

1. Code

		// Lecture: Statements and expressions

2. Function statement:
		
		function someFun(par) {
			// code
		}

	1. Example

			if (x === 5) {
				// do something
			}

	2. Nothing is produce value

3. Function expression:

		var someFun = function (par) {
			// code
		}

	1. Produces an outcome
	2. Examples:

			var x = 3;
			3 + 4;

## Arrays ##
1. Code

		// Lecture: Arrays
		
		var names = ['John', 'Jane', 'Mark'];
		var years = new Array(1990, 1969, 1948); **(M)**

		console.log(names);
		console.log(names[0]); // John
		names[1] = 'Ben';
		console.log(names); // ['John', 'Ben', 'Mark']

2. Mixing types in arrays

		var john = ['John', 'Smith', 1990, 'teacher', false];

		john.push('blue'); **(M)**
		console.log(john);

		john.unshift('Mr.'); **(M)**
		console.log(john);

		john.pop();
		console.log(john);

		john.shift();
		console.log(john);

		alert(john.indexOf('Smith')); **(M)**

		if (john.indexOf('designer') === -1) {
			console.log('John is NOT a teacher.');
		}
		
## Objects and Properties ##
1. Code

		// Lecture: Objects
		var john = {
			name: 'John',
			lastName: 'Smith',
			yearOfBirth: 1990,
			job: 'teacher',
			isMarried: false
		}

		console.log(john);

2. Two ways to retrieve
	1. Dot notation
		
			console.log(john.lastName);

	2. Square brackets

			console.log(john['lastName']);

3. Using variable as key

		var xyz = 'job';
		console.log(john[xyz]);

4. Data mutation

		john.lastName = 'Miller';
		john['job'] = 'programmer';

		console.log(john);

5. Another way of creation

		var jane = new Object(); **(M)**
		jane.name = 'Jane';
		jane.lastName = 'Smith';
		jane['yearOfBirth'] = 1969;
		jane['job'] = 'retired';
		jane['isMarried'] = true;

		console.log(jane);

## Objects and Methods ##
1. Code

		// Lecture: Objects and Methods
		var john = {
			name: 'John',
			lastName: 'Smith',
			yearOfBirth: 1990,
			job: 'teacher',
			isMarried: false
		};

2. Objects can have other objects, arrays or functions

		var john = {
			...
			family: ['Jane', 'Mark', 'Bob'],
			calculateAge: function () {
				return 2017 - this.yearOfBirth;
			}
		}

		console.log(john.family[2]);
		console.log(john.calculateAge());

		var age = john.calculateAge();
		john.age = age;

		console.log(john);

3. Write age in object

		var john = {
			name: 'John',
			lastName: 'Smith',
			yearOfBirth: 1990,
			job: 'teacher',
			isMarried: false,
			family: ['Jane', 'Mark', 'Bob'],
			calculateAge: function () {
				this.age = 2016 - this.yearOfBirth;
			}
		};

		john.calculateAge();
		console.log(john);

		var mike = {
			yearOfBirth: 1950,
			calculateAge: function () {
				this.age = 2016 - this.yearOfBirth;
			}
		};

		mike.calculateAge();
		console.log(mike);

## Loops and Iteration ##
1. For loop

		// Lecture: Loops
		
		for (var i = 0; i < 10; i++) {
			console.log(i);
		}

2. Looping through an array

		var names = ['John', 'Jane', 'Mary', 'Mark', 'Bob'];

		for (var i = 0; i < names.length; i++) {
			console.log(names[i]);
		}

		for (var i = names.length - 1; i >= 0; i--) {
			console.log(names[i]);
		}

2. While loop

		var i = 0;
		while (i < names.length) {
			console.log(names[i]);
			i++;
		}

3. Break, Continue

		for (var i = 1; i <= 5; i++) {
			console.log(i);

			if (i === 3) {
				break;
			}
		}

		for (var i = 1; i <= 5; i++) {
			if (i === 3) {
				continue;
			}

			console.log(i);
		}

## Coding Challenge 2 ##
1. Problem

		1. Creation of an array with some years where persons were born
		2. Creation of empty array (just [])
		3. Use a loop to fill the array with the ages of the persons
		4. Use another loop to log into the console whether each person is of full age (18 or older), as well as their age
		5. Finally, creation of a function called printFullAge which receives the vector of years as an argument, executes the steps 2., 3. and 4. and returns a vector of ture/false boolean values: ture if the person is of full age (>= 18 years) and false if not (< 18 years)
		6. Call the function with two different vectors and store the results in two variables: full_1 and full_2
		7. Example input: [1965, 2008, 1992]
		8. Example Output: [true, false, true]
		9. Hint: you can use a loop not only to read from an array, like y[i], but also to set values in an array, like y[i] = ... You can also use the specific array methods.

## Coding Challenge 2 Solution ##

## Important Note: ES5, ES6/ES2015 and ES2016
1. 1196: Changed LiveScript to JavaScript to atract Java developers but nothing to do with Java
2. 1997? ECMAScript 1 the language standard, JavaScript: the language in practice
3. 2009: ECMAScript 5 was released with lots of features
4. 2015: ECMAScript 2015 was released. biggest update (ES2015)
5. 2016: ES 2016
6. ES5 is fully supported by modern browsers, ES6 partial support in modern browsers, ES2016: poor support in modern browsers
7. ES5 Preferred:
	1. ES2015 very incomplete browser support today
	2. Almost all tutorials on web in ES5
	3. When working on old codebases, these will be written in ES5
	4. It is easier to learn ES5 and upgrade to ES6

## Section Intro ##
1. How JavaScript works behind the scenes

## How Our Code is Executed ##
1. Environment: Browser usually
	1. Node.JS web server
2. Host has a Javascript engine (program that executes Javascript code)
	1. Google V8 engine
	2. Spider monkey
	3. ...
3. Parser:
	1. Parses checks syntax
		1. Throws error if there is error
	2. Praser then constructs an Abstract Syntax Tree
	3. Abstract Syntax Tree is translated to machine code (executed by processor)
	4. Code Runs on Machine

## Execution Contexts and The Execution Stack ##
1. Execution context:
	1. A box, a container, or a wrapper which stores variables and in which a peice of our code is evaluated and executed
	2. Default execution context: Global context
		1. Code that is not inside any functions
		2. Associated with global object (window object in a browser)
			1. `lastName === window.lastName // true`
	3. Code inside functions
		1. Each function gets its own execution context

				var name = 'John';
	
				function first() {
					var a = 'Hello!';
					second();
					var x = a + name;
				}	

				function second() {
					var b = 'Hi!';
					third();
					var z = b + name;
				}

				function third() {
					var c = 'Hey!';
					var z = c + name;
				}

				first();

		2. `name`, `first()`, `second()` and `third()` definitions are in global execution context
		3. `first();` call will give rise to new Execution Context on top of Global Execution Context
		4. Execution Stack is formed and the new execution context becomes the active context in which the code is executed
			1. `a` is stored in execution context
		5. `second();` call will give rise to a new execution context and the new execution context becomes the active context
			1. `b` is stored in the new execution context
		6. `third();` will give rise to a new execution context which will become the active context
			1. `c` is stored in the new execution context
			2. `z` is stored in the new execution context
		7. When `third()` returns, the execution context is removed and the next execution context becomes active
		8. `z` is stored in the active context
		9. When `second()` returns, the execution context is popped out of execution stack and the next execution context becomes active
		10. `x` is stored in the active execution context
		11. When `first()` returns, the execution context is popped out of the stack and the global execution context becomes active

## Execution Contexts in Detail: Creation and Execution Phases and Hoisting ##
1. Execution context object
	1. Three properties
		1. Variable Object (VO): function arguments, inner variable declarations and function declarations
		2. Scope chain: contains current variable objects and variable objects of its parents
		3. "This" variable
2. How is it created?
	1. When a function is called, a new execution context is put on stop of execution stack
		1. Two phases:
			1. Creation phase
				1. Creation of VO
					1. Argument object is created, containing all arguments passed into function
					2. Code is scanned for function declarations: for each function, a property is created in Variable Object, pointing to the function (Hoisting)
					3. Code is scanned for variable declarations: for each variable, a property is created in VO, and set to `undefined` (Hoisting)
	
				2. Creation of scope chain
				3. this is determined and set
			2. Execution Phase
				1. Code of function that generated the current execution context is run line by line

## Hoisting in Practice ##
1. Code
		
		calculateAge(1965);

		function calculateAge(year) {
			console.log(2017 - year);
		}

		// Hoisting: function definition is stored in Variable Object (VO) even before execution

2. Function expressions

		retirement(1965); // errors out

		var retirement = function (year) {
			console.log()
		}	// Hoisting only works for function declarations but not for function expressions

3. Variable hoisting

		console.log(age);	// age is undefined due to hoisting
		var age = 23;	// stored in global execution context object
		console.log(age);

		console.log(bla);	// bla is not declared at all so errors out

		function foo() {
			console.log(age);	// ag is undefined
			var age = 65;	// stored in VO of foo's execution object
			console.log(age);	// 
		}

		foo();
		console.log(age);

## Scoping in Javascirpt ##
1. Scoping: Where can we access a variable or a function in Javascript
	1. Each new function gives rise to a new scope (space or environment in which variables it defines are accessible)
2. For new scope, we need new function
3. Lexical scoping: lexical - position of something
	1. function that is lexically within another function gets access to the scope of outer function
		1. Inner function gets access to variables of outer functions
	2. Example:

			var a = 'Hello!';

			function first() {
				var b = 'Hi!';
				second();

				function second() {
					var c = 'Hey!';
					console.log(a + b + c);
				}
			}

		1. `first()` has access to VO_Global + VO_l
	3. Scope chain: (direction of resolution)
		1. local scope -> parent scope -> parent scope -> ... -> Global scope
	4. During creation, each execution object gets same scope chain (?)
4. Example:

		var a = 'Hello!';
		first();

		function first() {
			var b = 'Hi!';
			second();

			function second() {
				var c = 'Hey!';
				third(); // possible because of scope chain
			}
		}

		function third() {
			var d = 'John';
			console.log(a + b + c + d); // error since b, c are not in scope chain
		}

## The 'this' Keyword ##
1. Determining and setting 'this' variable:
2. Each execution context gets a 'this' variable
3. Regular function call: 'this' points to global object (window object)
4. Method call: `this` points to object calling the method
5. `this` is assigned value when function where it is defined is called.

## The 'this' keyword in Practice ##
1. Example:

		console.log(this); // Window object
		
		calculateAge(1985);

		function calculateAge(year) {
			console.log(2017 - year);
			console.log(this); // Window object
		}

		var john = {
			name: 'John',
			yearOfBirth: 1990,
			calculateAge: function () {
				console.log(this); // john object which called the method
				console.log(2017 - this.yearOfBirth);

				function innerFunction() {
					console.log(this); // Window object (?) - it is a regular function
				}

				innerFunction();
			}
		};

		john.calculateAge();

2. Example:

		var mike = {
			name: 'Mike',
			yearOfBirth: 1984
		};

		mike.calculateAge = john.calculateAge; // method borrowing
		mike.calculateAge(); // mike object - since mike is calling the method and this is assigned a value only when the method is called

## Section Intro - DOM Manipulation and events ##
1. Download the code:

## The DOM and DOM Manipulation ##
1. DOM: Document Object Model - structured representation of an HTML document.
	1. Used to connect webpages to scripts like JavaScript
	2. It is object oriented representation
		1. For each element in html there is a corresponding object
	3. JavaScript can manipulate the DOM

## 5-Minute HTML and CSS Crash Course ##

## Projct Setup and Details ##
1. Open the project

## First DOM Access and Manipulation ##
1. What we will learn?
	1. Creation of fundamental game variables
	2. How to generate a random number
	3. How to manipulate DOM
	3. How to read from DOM
	4. How to change CSS styles
2. JS

		var scores, roundScores, activePlayer, dice;

		scores = [0, 0];
		roundScore = 0;
		activePlayer = 0; // used to read scores array

		dice = Math.floor(Math.random() * 6) + 1;
		
		// document.querySelector('#current-' + activePlayer).textContent = dice;
		document.querySelector("#current-" + activePlayer).innerHTML = '<em>' + dice + '</em>';

		var x = docuement.querySelector('#score-' + activePlayer).textContent;
		console.log(x);

		document.querySelector('.dice').style.display = 'none';

## Events and Event Handling: Rolling the Dice ##
1. Events: notifications sent to notify the code that something happened on webpage
	1. Clicking a button, resizing a window, scrolling down or pressing key
2. Event listener: function that performs action based on certain event. It waits for specific events to happen
3. How is event processed?
	1. Event is processed as soon as the execution stack is empty
	2. Message Queue: Events are put in the queue and wait to be processed
		1. When an event needs to be processed, an execution context is put on top of the Execution stack for the event handler
4. What you will learn in the lecture?
	1. How to set up an event handler
	2. What a callback function is
	3. What an anonymous function is
	4. Another way to select elements by ID
	5. How to change the image in an <img> element
5. Code

		document.getElementById('score-0').textContent = '0';
		document.getElementById('score-1').textContent = '0';
		document.getElementById('current-0').textContent = '0';
		document.getElementById('current-1').textContent = '0';

		document.querySelector('.btn-roll').addEventListener('click', function () {
			// 1. Random number
			dice = Math.floor(Math.random() + 6) + 1;
			
			//2. Display the result
			var diceDOM = document.querySelector('.dice');
			diceDOM.style.display = 'block';
			diceDOM.src = 'dice-' + dice + '.png';

			//3. Update the round score IF the rolled number was NOT a 1
		});

## Updating Scores and Changing the Active Player ##
1. What we will learn?
	1. What the ternary operator is
	2. How to add, remove and toggle HTML classes.
2. Code

			//3. Update the round score IF the rolled number was NOT a 1
			if (dice !== 1) {
				// Add score
				roundScore += dice;
				document.querySelector('#current-' + activePlayer).textContent = roundScore;
			} else {
				// Next player
				activePlayer === 0? activePlayer = 1: activePlayer = 0;
				roundScore = 0;
				
				document.getElementById('current-0').textContent = '0';
				document.getElementById('current-1').textContent = '0';

				// document.querySelector('.player-0-panel').classList.remove('active');
				// document.querySelector('.player-1-panel').classList.add('active');

				document.querySelector('.player-0-panel').classList.toggle('active');
				document.querySelector('.player-1-panel').classList.toggle('active');

				document.querySelector('.dice').style.display = 'none';
			}

## Implementing Our 'Hold' Function And The DRY Principle ##
1. What you will learn?
	1. How to use functions to correctly apply DRY principle
	2. How to think about the game logic like a programmer
2. Code

		document.querySelector('.btn-hold').addEventListener('click', function () {

				// Check if player won the game
				if (scores[activePlayer] >= 100) {
					document.querySelector('#name-' + activePlayer).textContent = 'Winner!';
					document.querySelector('.dice').style.display = 'none';
					document.querySelector('.player-' + activePlayer + '-panel').classList.add('winner');
					document.querySelector('.player-' + activePlayer + '-panel').classList.remove('active');
				} else {			
					...
					// Next Player
					nextPlayer();
				}
			}
				

		document.querySelector('.btn-hold').addEventListener('click', function () {
			// Add CURRENT score to GLOBAL score
			scores[activePlayer] += roundScore;			

			// Update the UI
			document.querySelector('#score-' + activePlayer).textContent = scores[activePlayer];

			// Check if player won the game
			nextPlayer();
		});

		function nextPlayer() {
			// Next player
				activePlayer === 0? activePlayer = 1: activePlayer = 0;
				roundScore = 0;
				
				document.getElementById('current-0').textContent = '0';
				document.getElementById('current-1').textContent = '0';

				// document.querySelector('.player-0-panel').classList.remove('active');
				// document.querySelector('.player-1-panel').classList.add('active');

				document.querySelector('.player-0-panel').classList.toggle('active');
				document.querySelector('.player-1-panel').classList.toggle('active');

				document.querySelector('.dice').style.display = 'none';
		}

## Creation of a Game Initialization Function ##
1. Code

		document.querySelector('.btn-new').addEventListener('click', init);

		function init() {
			scores = [0, 0];
			activePlayer = 0;
			roundScore = 0;

			document.querySelector('.dice').style.display = 'none';
			document.getElementById('score-0').textContent = '0';
		document.getElementById('score-1').textContent = '0';
		document.getElementById('current-0').textContent = '0';
		document.getElementById('current-1').textContent = '0';

			document.getElementById('name-0').textContent = 'Player 1';
			document.getElementById('name-1').textContent = 'Player 2';

			document.querySelector('.player-0-panel').classList.remove('winner');
			document.querySelector('.player-1-panel').classList.remove('winner');
					document.querySelector('.player-0-panel').classList.remove('active');
			document.querySelector('.player-1-panel').classList.remove('active');

			document.querySelector('.player-0-panel').classList.add('active');
		}

## Finishing Touches ##
1. What you will learn?
	1. What a state variable is, how to use it and why
2. State variable: tells the condition of a system
3. Code
		
		var ..., gamePlaying;

		document.querySelector('.btn-hold').addEventListener('click', function () {
			if (gamePlaying) {
				...
				if (scores[activePlayer] >= 100) {
					...
					gamePlaying = false;
				}
			}
		});

		document.querySelector('.btn-roll').addEventListener('click', function () {
			if (gamePlaying) {
				...
			}
		});

		function init() {
			...
			gamePlaying = true;
			...
		}

## Coding Challenge ##