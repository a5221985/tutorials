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
1. 
