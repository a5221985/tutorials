# JavaScript W3Schools #
## JS HOME ##
### Exmaples in Each Chapter ###
### Learn by Examples ###
### Why Study JavaScript? ###
1. It is one of three languages, all web developers must know
	1. HTML: Define content of web pages
	2. CSS: Specify layout of web pages
	3. JavaScript: to program behavior of web pages
2. JavaScript became ECMA standard (ECMA-262 - official name of standard)
3. ECMAScript - official name of JavaScript
4. [JS Versions](https://www.w3schools.com/js/js_versions.asp)

### Learning Speed ###
1. Our choice
2. Understand all Try-it-Yourself examples

### JavaScript References ###
1. W3Schools maintains complete JS reference (HTML objects, browser objects)
	1. Contains examples of all properties and methods
2. [Complete JavaScript Reference](https://www.w3schools.com/jsref/default.asp)

## JS Introduction ##
### JavaScript Can Change HTML Content ###
1. `getElementById()`:
	1. Example: find element with `id="demo"` and change content using `innerHTML` to `"Hello JavaScript"`

			document.getElementById('demo').innerHTML = 'Hello JavaScript';

2. JS accepts double quotes and single quotes

### JavaScript Can Change HTML Attributes ###
1. Example:

		<!DOCTYPE html>
		<html>
			<body>
				<h2>What Can JavaScript Do?</h2>

				<p>JavaScript can change HTML attributes.</p>

				<p>In this case JavaScript changes the src (source) attribute of an image.</p>

				<button onclick="document.getElementById('myImage').src='pic_bulbon.gif'">Turn on the light</button>

				<img id = "myImage" src="pic_bulboff.gif" style="width: 100px">

				<button onclick="document.getElementById('myImage').src='pic_bulboff.gif'">Turn off the light</button>
			</body>
		</html>

### JavaScript Can Change HTML Styles (CSS) ###
1. Example:

		document.getElementById('demo').style.fontSize = '25px';

### JavaScript Can Hide HTML Elements ###
1. Done by changing display style:

		document.getElementById('demo).style.display = 'none';

### JavaScript Can Show HTML Elements ###
1. Example:

		document.getElementById('demo').style.display = 'block';

## JS Where To ##
### The `<script>` Tag ###
1. In HTML, JavaScript script code is inserted in between `<script>` and `</script>` tags
2. Example:

		<script>
			document.getElementById('demo').innerHTML = 'My First JavaScript after some time';
		</script>

3. `type="text/javascript"` is not required because JS is the default scripting language in HTML

### JavaScript Functions and Events ###
1. `function` is a block of code that is executed when "called" for
2. Example: function can be called when **event** occurs like button click

### JavaScript `<head>` or `<body>` ###
1. Any number of scripts can be placed in HTML document
2. Scripts can be placed in `<body>` or `<head>` in HTML page

### JavaScript in `<head>` ###
1. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<script>
					function myFunction() {
						document.getElementById('demo').innerHTML = 'Paragraph changed.';
					}
				</script>
			</head>
			<body>
				<h1>A Web Page</h1>
				<p id="demo">A Paragraph</p>
				<button type="button" onclick="myFunction()">Try it</button>
			</body>
		</html>

### JavaScript in `<body>` ###
1. Example:

		<html>
			<head>
			</head>
			<body>
				<h1>A Web Page</h1>
				<p id="demo">A Paragraph</p>
				<button type="button" onclick="myFunction()">Try it</button>
				<script>
					function myFunction() {
						document.getElementById('demo').innerHTML = 'Paragraph Changed';
					}
				</script>
			</body>
		</html>

### External JavaScript ###
1. Scripts can be placed in external file: `myScript.js`
2. Example:

		function myFunction() {
			document.getElementById('demo').innerHTML = 'Paragraph changed.';
		}

3. Used when same script is used in many web pages.
4. Put the script name in `src` attribute of `<script>`
5. Example:

		<!DOCTYPE html>
		<html>
			<body>
				<script src="myScript.js"></script>
			</body>
		</html>

6. External script reference can be placed in `<head>` or `<body>`
7. Script behaves as if it was at the place where `<script>` tag is located

### External JavaScript Advantages ###
1. Advantages of placing script in external files
	1. Separates HTML and code
	2. Makes HTML and JS easier to read and maintain
	3. **Cached JS files can speed up page loads**
2. To add many scripts to one page use the following syntax:

		<script src="myScript1.js"></script>
		<script src="myScript2.js"></script>

### External References ###
1. Full URL or path relative to HTML page can be used to reference external script
2. Example:

		<script src="https://www.w3schools.com/js/myScript1.js"></script>
		<script src="/js/myScript1.js"></script> <!-- In specified folder from the root -->
		<script src="myScript1.js"></script> <!-- In same folder relative to current page -->
		<script src="js/myScript1.js"></script> <!-- In js folder under the current folder -->
		<script src="../myScript1.js"></script> <!-- In parent folder relative to current page -->
3. [HTML File Paths](https://www.w3schools.com/html/html_filepaths.asp)

## JS Output ##
### JavaScript Display Possibilities ###
1. JS can display data in following ways:
	1. Writing into HTML element using `innerHTML`
	2. Writing into HTML output using `document.write()`
	3. Writing into an alert box, using `window.alert()`
	4. Writing into the browser console, using `console.log()`

### Using `innerHTML` ###
1. `document.getElementById(id)`: used to access an element by id
	1. `innerHTML` defines the content
2. Example:

		<!DOCTYPE html>
		<html>
			<body>
				<h1>My First Web Page</h1>
				<p>My First Paragraph</p>

				<p id="demo"></p>

				<script>
					document.getElementById('demo').innerHtml = 5 + 6;
				</script>
			</body>
		</html>

### Using `document.write()` ###
1. Example:

		<!DOCTYPE html>
		<html>
			<body>
				<h1>My Web Page</h1>
				<p>My first paragraph.</p>

				<script>
					document.write(5 + 6); // Writes 11 into web page after the above content
				</script>
			</body>
		</html>

2. If `document.write()` is called after the document is fully loaded, the entire content gets replaced:

		<!DOCTYPE html>
		<html>
			<body>
				<h1>My Web Page</h1>
				<p>My first paragraph.</p>

				<button onclick="document.write(5 + 6)">Try it</button>
			</body>
		</html>

### Using `window.alert()` ###
1. Example:

		<!DOCTYPE html>
		<html>
			<body>
				<h1>My First Web Page</h1>
				<p>My first paragraph.</p>

				<script>
					window.alert(5 + 6);
				</script>
			</body>
		</html>

### Using `console.log()` ###
1. Used for debugging purpose
2. Example:

		<!DOCTYPE html>
		<html>
			<body>
				<script>
					console.log(5 + 6);
				</script>
			</body>
		</html>

## JS Syntax ##
1. Syntax: Set of rules how JS program must be constructed

### JavaScript Programs ###
1. JS statements are separated by semicolons (optional)
2. Example:

		<script>
			var x, y, z;
			x = 5;
			y = 10;
			z = x + y;
			console.log(z);
		</script>

3. JS programs are executed by web browser

### JavaScript Statements ###
1. Composition:
	1. Values, Operators, Expressions, Keywords, and Comments.

### JavaScript Values ###
1. Two types of values:
	1. Fixed values (**literals**)
	2. Variable values (**variables**)

### JavaScript Literals ###
1. Rules:
	1. Numbers are written with or without decimals
	2. Strings are written with double or single quotes

### JavaScript Variables ###
1. Variables store data values
2. `var` is used to declare variables
3. `=` assigns values to variables
4. Example:

		var x;
		x = 6;

### JavaScript Operators ###
1. Arithmetic operators are used to compute values
2. Example:

		(5 + 6) * 10;

### JavaScript Expressions ###
1. Expression: combination of values, variables and operators which computes/evaluates to a value
2. Example: `5 * 10` evaluates to `50`
3. Example: `"John" + " " + "Doe"` evaluates to `"John Doe"` 

### JavaScript Keywords ###
1. Keywords identify actions to be performed
2. Example:

		var x, y;
		x = 5 + 6;
		y = x * 10;

### JavaScript Comments ###
1. `// <comment>`
2. `/* <multi-line-comment> */`
3. Example:

		var x = 5; // I should be executed
		// var x = 6; I will not be executed

### JavaScript Identifiers ###
1. Identifiers: are names
	1. Names are used to name variables (keywords, functions, labels)
	2. Rules: First character must be letter or `_` or `$`
		1. Subsequent characters may be letters, digits, underscores or `$`
		2. Numbers cannot be first character (distinguishes identifiers from numbers)

### JavaScript is Case Sensitive ###
1. All JS identifiers are case sensitive
2. Example:

		var lastname, lastName;
		lastName = "Doe";
		lastname = "Peterson";

### JavaScript and Camel Case ###
1. Convention: Use camel case starting with lowercase letter
2. Example: `firstName`, `lastName`, `masterCard`, `interCity`

### JavaScript Character Set ###
1. JS uses Unicode charset (covers almost all characters, punctuations, symbols in the world)
2. [Complete Unicode Reference](https://www.w3schools.com/charsets/ref_html_utf8.asp)

## JS Statements ##
1. JS statements are instructions to be executed by Web browser

### JavaScript Statements ###
1. Example: The following statement tells browser to write "Hello Dolly" inside an HTML element with `id="demo"`

		document.getElemementById('demo').innerHTML = 'Hello Dolly.';

### JavaScript Programs ###
1. Program consists of many JS statements
2. JS statements are processed in the order they are written
3. Example:

		var x, y, z; // processed first
		x = 5; // processed second
		y = 6; // processed third
		z = x + y; // processed fourth
		document.getElementById('demo').innerHTML = z;

### Semicolons `;` ###
1. `;` separates JS statements (optional)
2. Multiple statments on single line must be separated by `;`s
3. Example: `a = 5; b = 6; c = a + b;`

### JavaScript White Space ###
1. JS ignores multiple spaces. Used to make the script more readable
2. Example:

		var person = "Hege";
		var person="Hege"; // same as above
3. Good practice: put spaces around operators

### JavaScript Line Length and Line Breaks ###
1. Avoid code lines longer than 80 characters for readability
2. To break a statement into multiple lines, break it after an operator
3. Example:

		document.getElementById('demo').innerHTML =
		'Hello Dolly!';

### JavaScript Code Blocks ###
1. JS statements can be grouped into code blocks inside curly braces `{...}` (define statements which must be executed together)
2. Example: JS Functions use blocks

		function myFunction() {
			document.getElementById('demo1').innerHTML = 'Hello Dolly!';
			document.getElementById('demo2').innerHTML = 'How are you?';
		}

### JavaScript Keywords ###
1. List of some of the keywords learnt in the tutorial:
	1. `break` - Terminates a switch or a loop
	2. `continue` - Jumps out of a loop and starts at the top
	3. `debugger` - Stops the execution of JS, and calls (if available) the debugging function
	4. `do... while` - Executes a block of statements, and repeats the block, while condition is true
	5. `for` - Marks a block of statements to be executed as long as condition is true
	6. `function` - Declares a function
	7. `if ... else` - Marks a block of statements to be executed depending on a condition
	8. `return` - Exits a function
	9. `switch` - Marks a block of statements to be executed, depending on different cases
	10. `try ... catch` - Implements error handling to a block of statements
	11. `var` - Declares a variable
2. Keywords cannot be used to name variables

## JS Comments ##
1. Makes JS code more readable
2. Prevents execution when testing alternative code

### Single Line Comments ###
1. Start with `//`
	1. All text after it til the end of line will be ignored
2. Example:

		// Change heading:
		document.getElementById('myH').innerHTML = 'My Page';
		// Change paragraph:
		document.getElementById('myP').innerHTML = 'My paragraph';

3. Example: To explain code

		var x = 5; // Declare x, give it the value of 5
		var y = x + 2; // Declare y, give it the value of x + 2

### Multi-line Commenst ###
1. `/* ... */`
	1. Any text between `/*` and `*/` will be ignored
2. Example:

		/*
		The code below will change
		the heading with id = "myH"
		and the paragraph with id = "myP"
		in my web page:
		*/
		document.getElementById("myH").innerHTML = "My Page";
		document.getElementById("myP").innerHTML = "My paragraph.";

3. Block comments are commonly used for formal documentation

### Using Comments to Prevent Execution ###
1. For code testing.
2. Example:

		// document.getElementById("myH").innerHTML = "My Page";
		document.getElementById("myP").innerHTML = "My paragraph.";

## JS Variables ##
### JavaScript Variables ###
1. Variables: containers for storing data values.
2. Example:

		var x = 5; // x stores the value 5
		var y = 6; // y stores the value 6
		var z = x + y; // z stores the value 11

### Much Like Algebra ###
1. It is just like in algebra
2. Example:

		var price1 = 5;
		var price2 = 6;
		var total = price1 + price2;

### JavaScript Identifiers ###
1. All JS variables must be identified with unique names (called identifiers)
2. General rules:
	1. Names can contain letters, digits, underscores, dollar signs
	2. Names must begin with a letter
	3. Names can also begin with `$` and `_`
	4. Names are case sensitive (y and Y are different variables)
	5. Reserved words (Keywords) cannot be used as names

### The Assignment Operator ###
1. `=`: assignment operator
	1. This is different from algebra because `x = x + 5` does not make sense in algebra
2. `==`: equal to operator

### JavaScript Data Types ###
1. JS variables can hold numbers or text (text values are called text strings)
2. Strings are written in single or double quotes
	1. If number is written in quotes, it is treated as string
3. Example:

		var pi = 3.14;
		var person = 'John Doe';
		var answer = 'Yes I am!';

### Declaring (Creation of) JavaScript Variables ###
1. Declared using `var` keyword
	1. `var carName` (technically the variable now has the value `undefined`)
2. To assign a value to the variable use `=`
	1. Example: `carName = 'Volvo';`
3. Assignment during declaration is allowed:
	1. `var carName = 'Volvo';`
4. Example:

		<p id="demo"></p>

		<script>
			var carName = 'Volvo';
			document.getElementById('demo').innerHTML = carName;
		</script>

### One Statement, Many Variables ###
1. Multiple variables can be declared in one statement:
2. Example:

		var person = 'John Doe', carName = 'Volvo', price = 200;

3. Example: Declaration can span multiple lines

		var person = 'John Doe',
		carName = 'Volvo',
		price = 200;

### Value = undefined ###
1. If a variable is declared without a value, it will have the value of `undefined`
2. Example: `var carName;`

### Re-Declaring JavaScript Variables ###
1. If a variable is re-declared, it will not lose it's value
2. Example: `carName` will have `Volvo` after execution of the statements

		var carName = 'Volvo';
		var carName;

### JavaScript Arithmetic ###
1. Example: `var x = 5 + 2 + 3;`
2. Example: Concatenation
	
		var x = "John" + " " + "Doe";

3. Example: `var x = "5" + 2 + 3; // 523 - Concatenation`
4. Example: `var x = 2 + 3 + "5"; // 55` 

## JS Operators ##
1. Example:

		var x = 5;		// assign the value 5 to x
		var y = 2;		// assign the value 2 to y
		var z = x + y;	// assign the value 7 to z (x + y)

### JavaScript Arithmetic Operators ###
### JavaScript Assignment Operators ###
1. `+=`
2. `-=`
3. `*=`
4. `/=`
5. `%=`

### JavaScript String Operators ###
1. `+=`: Concatenation
2. Example:

		var txt1 = 'What a very ';
		var txt2 = 'nice day';
		txt1 += txt2;

### Adding Strings and Numbers ###
1. Adding a number and string returns a string
2. Example:

		x = 5 + 5;
		y = "5" + 5;
		z = "Hello" + 5;

### JavaScript Comparison Operators ###
1. `===` equal value and equal type
2. `!==` not equal value or not equal type

### JavaScript Logical Operators ###
1. `&&`
2. `||`
3. `!`

### JavaScript Type Operators ###
1. `typeof` - returns type of a variable
2. `instanceof` - returns true if an object is an instance of an object type

### JavaScript Bitwise Operators ###
1. `~`: bitwise not (returns negative number if aplied on a positive number - ~5 is -6)
2. `^`: xor
3. `>>>`: zero fill right shift

## JS Arithmetic ##
### JavaScript Arithmetic Operators ###
### Arithmetic Operations ###
1. Operators usually work on two numbers
2. Numbers can be literals, variables or expressions (`(10 + 4) * a`)

### Operators and Operands ###
1. Numbers are called operands
2. Operation is defined by an operator
3. Increment:

		var x = 5;
		x++;
		var z = x;

### Operator Precedence ###
1. Operator precedence - order in which operations are performed in an arithmetic expression
2. Associativity - left to right if multiple operators are used usually
3. `**` - ES7 feature

### JavaScript Operator Precedence Values ###

## JS Assignment ##
### JavaScript Assignment Operators ###
1. `**=`: ES7 power operator - do not use it

### Assignment Examples ###

## JS Data Types ##
### JavaScript Data Types ###
1. JS variables can hold many data types
	1. numbers, strings, objects, ...
2. Example:
	
		var length = 16;
		var lastName = 'Johnson';
		var x = {firstName: 'John', lastName:'Doe'}

### The Concept of Data Types ###
1. Data types are used to resolve operations
2. Example: `var x = 16 + "Volvo";` is treated as `var x = "16" + "Volvo";`
3. Expressions are evaluated from left to right

### JavaScript Types are Dynamic. ###
1. JS has dynamic types
2. Same JS variables can be used to hold different data types

		var x;				// x is undefined
		var x = 5;			// x is Number
		var x = 'John';		// x is a String

### JavaScript Strings ###
1. String is a series of characters
2. Strings can be in single or double quotes
3. If single quotes need to be used inside a string, wrap the string in double quotes and vice versa
4. Example:

		var answer = "It's alright";
		var answer = "He is called 'Johnny'";
		var answer = 'He is called "Johnny"';

### JavaScript Numbers ###
1. JS has only one type of numbers.
2. Numbers can be written with or without decimals
3. Example:

		var x1 = 34.00;
		var x2 = 34;

4. Extra large or extra small numbers can be written in scientific notation:

		var y = 123e5;
		var z = 123e-5;

### JavaScript Booleans ###
1. Only two values exist `true` or `false`
2. Example:

		var x = true;
		var y = false;

### JavaScript Arrays ###
1. Arrays are written with square brackets.
	1. Items in the array are separated by commas
2. Example:

		var cars = ["Saab", "Volvo", "BMW"];

### JavaScript Objects ###
1. Written with curly braces.
2. Properties are written as name value pairs separated by commas
3. Example:

		var person = {firstName: 'John', lastName: 'Doe', age: 50, eyeColor: 'blue'};

### The `typeof` Operator ###
1. `typeof` is used to find the type of a JS variable or an expression
2. Example:

		typeof ""			// Returns "string"
		typeof "John"		// Returns "string"
		typeof "John Doe"	// Returns "string"
		typeof 0			// Returns "number"
		typeof 314			// Returns "number"
		typeof 3.14			// Returns "number"
		typeof (3)			// Returns "number"
		typeof (3 + 4)		// Returns "number"

### Primitive Data ###
1. Single simple data value with no additional properties and methods
2. `typeof` can return one of these primitive types
	1. `string`
	2. `number`
	3. `boolean`
	4. `null`
	5. `undefined`
3. Example:

		typeof "John"		// Returns "string"
		typeof 3.14			// Returns "number"
		typeof true			// Returns "boolean"
		typeof false		// Returns "false"

### Complex Data ###
1. `typeof` can return one of two complex types
	1. function
	2. object
2. Example:

		typeof [1, 2, 3, 4]				// Returns "object" (not "array") because arrays are objects
		typeof {name: 'John', age: 34}	// Returns "object"
		typeof function myFunc() {}		// Returns "function"

### Undefined ###
1. A variable without a value has the value `undefined`
2. A variable can be emptied by setting the variable to `undefined` and the type is also `undefined`

		person = undefined;

### Empty Values ###
1. An empty string `''` has both value and type
2. Example:

		var car = '';		// The value is '', the typeof is 'string'

### Null ###
1. null means 'nothing'
2. The datatype of `null` is `object` - bug
3. An object can be emptied by setting it to `null`

		var person = null; // Value is null but type is still object

### Difference Between Undefined and Null ###
1. Example:

		typeof undefined		// undefined
		typeof null				// object
		null === undefined		// false
		null == undefined		// true

## JS Functions ##
1. Function: It is a block of code designed to perform a task
	1. It is executed when invoked
2. Example:

		function myFunction(p1, p2) {
			return p1 * p2;		// The function returns the product of p1 and p2
		}

### JavaScript Function Syntax ###
1. Syntax: `function <function-name>() { ... }`
	1. `<function-name>`: can have letters, digits, underscores, `$` (same rules as variables)
	2. `(parameter1, parameter2, ...)`
2. Example:

		function name(parameter1, parameter2, parameter3) {
			code to be executed
		}

	1. Function arguments are actual values received by a function when it is invoked
	2. Inside functions, argumetns (parameters) behave as local variables

### Function Invocation ###
1. Something that invokes a function:
	1. When an event occurs (when a user clicks a button)
	2. When it is invoked (called) from JavaScript code
	3. Automatically (self invoked)

### Function Return ###
1. `return` statement stops function execution
	1. `return` will return to execute the code after invoking statement
2. If function computes a return value it is returned back to the caller
3. Example:

		var x = myFunction(4, 3);		// Function is called, return value will end up in x

		function myFunction(a, b) {
			return a * b;				// Function returns the product of a and b
		}

### Why Functions? ###
1. Code reuse: define once and use it anywhere and any number of times using different arguments to produce different results
2. Example:

		function toCelsius(fahrenheit) {
			return (5 / 9) * (fahrenheit - 32);
		}
		document.getElementById('demo').innerHTML = toCelsius(77);

### The `()` Operator Invokes the Function ###
1. `toCelsius` is function object
2. `toCelsius()` refers to function result
3. If function is accessed without `()`, function definition is returned instead of result
4. Example:

		function toCelsius(fahrenheit) {
			return (5 / 9) * (fahrenheit - 32);
		}
		document.getElementById('demo').innerHTML = toCelsius;

### Functions Used as Variable Values ###
1. Functions can be used the same way as variables (in formulas, assignments, calculations)
2. Example:

		var text = "The temperature is " + toCelsius(77) + " Celsius";

## JS Objects ##
### Real Life Objects, Properties, and Methods ###
1. car is an object
	1. properties: weight, color
	2. methods: start, stop
2. Example:

		car.name = Fiat
		car.model = 500
		car.weight = 850kg
		car.color = white
	
		car.start()
		car.drive()
		car.brake()
		car.stop()

### JavaScript Objects ###
1. Simple value assignment:
	1. `var car = 'Fiat';`
2. Objects can contain many values
	1. Example: `var car = {type: 'Fiat', model: '500', color: 'white'};`

### Object Properties ###
1. Name value pairs in JS are called properties
2. Example:

		var person = {firstName: 'John', lastName: 'Doe', age: 50, eyeColor: 'blue'};

### Object Methods ###
1. Methods are actions that can be performed on objects
2. Stored in objects as function definitions

### Object Definition ###
1. Object literal can be used to define an object
2. Example:

		var person = {
			firstName: 'John',
			lastName: 'Doe',
			age: 50,
			eyeColor: 'blue'
		};

### Accessing Object Properties ###
1. Two ways:
	1. `objectName.propertyName`
	2. `objectName['propertyName']`

### Accessing Object Methods ###
1. Syntax: `objectName.methodName();`
2. Example:

		var person = {
			firstName: 'John',
			lastName: 'Doe',
			id: 5566,
			fullName: function () {
				return this.firstName + ' ' + this.lastName;
			}
		};

		person.fullName();

### Do Not Declare Strings, Numbers, and Booleans as Objects! ###
1. Avoid the following:

		var x = new String();
		var y = new Number();
		var z = new Boolean();

	1. They complicate the code
	2. They slow down execution

## JS Scope ##
1. Scope: It is the set of variables that we have access to

### JavaScript Scope ###
1. In JS, Objects and Functions are variables.
2. Scope: It is the set of variables, objects and functions we have access to.
	1. Function scope: Scope changes inside function

### Local JavaScript Variables ###
1. Variables declared inside JS function become LOCAL to the function
	1. They have local scope (they can be accessed within the function)
2. Example:

		// code here can not use carName

		function myFunction() {
			var carName = 'Volvo';

			// code here can use carName
		}

3. Variables with same name can be used in different functions
4. Local variables get created when function starts and are deleted when function is completed

### Global JavaScript Variables ###
1. Variable declared outside function are global
2. Global variable has global scope
	1. All scripts and functions on a web page can access it
3. Example:

		var carName = 'Volvo';

		// code here can use carName

		function myFunction() {
			// code here can use carName
		}

### Automatically Global ###
1. If a variable is assigned that has not been declared, it will automatically become GLOBAL variable
2. Example:

		myFunction();

		// code here can use carName

		function myFunction() {
			carName = 'Volvo'; // fails in strict mode
		}

### Global Variables in HTML ###
1. Global scope: Complete JS environment
	1. Global scope is the window object in HTML (all global variables belong to the `window` object)
	2. Example:

			var carName = 'Volvo';

			// code here can use window.carName

### Did You Know? ###
1. Global variables or functions can overwrite window variables (or functions)
2. Any function can overwrite global variables and functions

### The Lifetime of JavaScript Variables ###
1. Lifetime starts when variable is created
2. Local variables get deleted when function is completed
3. Global variables get deleted when browser window (or tab) is closed (available to new pages loaded into same window)

### Function Arguments ###
1. Function arguments (parameters) work as local variables inside functions

## JS Events ##
1. **things** that happen to HTML elements
2. JS can react to events

### HTML Events ###
1. Event: Something that browser does or something that user does
	1. Examples:
		1. Web page has finished loading
		2. Input field has changed
		3. Button was clicked
2. JS allows us to executed code when an event occurs
3. HTML allows event handler attributes in HTML elements
4. Syntax:

		<element event="some JavaScript">

5. Example:

		<button onclick="document.getElementById('demo').innerHTML = Date()">The time is?</button>

6. Example: Changing content of it's own element

		<button onclick="this.innerHTML = Date()">This time is?</button>

7. Example: Event attributes calling functions

		<button onclick="displayDate()">The time is?</button>

### Common HTML Events ###
1. `onchange` - HTML element is changed
2. `onclick` - User clicks an HTML element
3. `onmouseover` - User moves the mouse over an HTML element
4. `onmouseout` - User moves the mouse away from an HTML element
5. `onkeydown` - User pushes a keyboard key
6. `onload` - Browser has finished loading the page
7. [W3Schools JavaScript Reference HTML DOM Events](https://www.w3schools.com/jsref/dom_obj_event.asp)

### What can JavaScript Do? ###
1. Events handlers can handle, verify user input, user actions, browser actions
	1. Things to be done when page loads
	2. Things to be done when page is closed
	3. Action to be performed when user clicks a button
	4. Content to be verified when user inputs data
	5. ...
2. Methods used to let JavaScript work with events:
	1. Event attributes can execute JS code directly
	2. Event attributes can call JS functions
	3. We can assign event handler functions to HTML elements
	4. We can prevent events from being sent or handled
	5. ...

## JS Strings ##
1. JavaScript strings are for storing and manipulating text

### JavaScript Strings ###
1. String: series of characters inside quotes.

### String Length ###
1. `length`: built in property that gives length of a string
2. Example:

		var txt = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
		var sln = txt.length;

### Special Characters ###
1. Use `\` escape character if we want to embed the same quotes that enclose the string
2. Escape special characters
	1. `\\`
	2. `\'`
	3. `\"`
	4. `\b`
	5. `\t`
	6. `\r`
	7. `\v` - vertical tab
	8. `\f`

### Breaking Long Code Lines ###
1. Break a line that is more than 80 characters at operator
2. Example:

		document.getElementById('demo').innerHTML = 'Hello Dolly!';

3. Breaking a code line within text string

		document.getElementById('demo').innerHTML = 'Hello \
		Dolly!';

	1. Not universal and browsers may not support it
4. Safer method to break string:

		document.getElementById('demo').innerHTML = 'Hello' + 
		'Dolly!';

### Strings Can be Objects ###
1. `var firstName = "John" // using string literal`
2. `var firstName = new String("John") // using string new`
3. Example:

		var x = 'John';
		var y = new String('John'); // slows down execution time, complicates code

		// typeof x will return string
		// typeof y will return object

4. `==` makes strings equal

		var x = 'John';
		var y = new String('John');

		// (x == y) is true because x and y have equal values
		// (x === y) is false because x and y have different types (string and object)
		
5. Objects cannot be compared

		var x = new String('John');
		var y = new String('John');

		// (x == y) is false because x and y are different objects
		// (x === y) is false because x and y are different objects

## JS String Methods ##
### String Methods and Properties ###
1. Primitive strings like "John Doe" cannot have properties and methods (they are not objects) but in JS primitive values have properties and methods because they are treated as objects (during execution of methods and properties)

### String Length ###
1. Example:

		var txt = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		var sln = txt.length;

### Finding a String in a String ###
1. `indexOf()` **(M)**: returns index of the first occurence of specified text in a string
2. Example:

		var str = "Please locate where 'locate' occurs!";
		var pos = str.indexOf('locate');

3. `lastIndexOf()`: Returns index of last occurene of a specified text in a string

		var str = "Please locate where 'locate' occurs!";
		var pos = str.lastIndexOf('locate');

	1. Returns -1 if text is not found
4. Both accept a second parameter as starting position for search:

		var str = "Please locate where 'locate' occurs!";
		var pos = str.indexOf('locate', 15);

### Searching for a String in a String ###
1. `search()` **(M)**

		var str = "Please locate where 'locate' occurs!";
		var pos = str.search('locate');

### Did You Notice? ###
1. Differences between `indexOf` and `search`
	1. `search` does not take second start position argument
	2. `search` can take powerful search values like regular expressions

### Extracting String Parts ###
1. Three methods:

		slice(start, end)
		substring(start, end)
		substr(start, length)

### The `slice()` Method ###
1. `slice()` **(M)** extracts part of a string and returns extracted part in new string
	1. Takes 2 parameters `start` index and `end` index
2. Example:

		var str = "Apple, Banana, Kiwi";
		var res = str.slice(7, 13);

	1. If parameter is negative, position is counted from end of the string

			var str = "Apple, Banana, Kiwi";
			var res = str.slice(-12, -6); // size -12, size - 6

	2. If second parameter is omitted, method will slice out rest of the string

			var res = str.slice(7);
			var res = str.slice(-12);

### The `substring()` Method ###
1. `substring` **(M)** is similar to `slice` but cannot accept negative parameters

		var str = "Apple, Banana, Kiwi";
		var res = str.substring(7, 13);

	1. If second parameter is omitted, `substring()` will slice out rest of the string

### The `substr()` Method ###
1. `substr` **(M)** is similar to `substring` but second parameter specifies length of extracted part

		var str = "Apple, Banana, Kiwi";
		var res = str.substr(7, 6);

	1. If parameter is negative, position is counted from end of the string

### Replacing String Content ###
1. `replace()` **(M)** - replaces specified value with another value in a string

		str = "Please visit Microsoft!";
		var n = str.replace('Microsoft', 'W3Schools'); // does not mutate the string but returns a new string with replaced text
	1. Replaces only the first match

2. To replace all matches, use regular expression with `/g` flag (global match)

		str = "Please visit Microsoft and Microsoft!";
		var n = str.replace(/Microsoft/g, 'W3Schools');

	1. Match is case sensitive
3. To replace in a case insensitive way, use regular expression with `/i` flag (insensitive)

		str = "Please visit Microsoft!";
		var n = str.replace(/MICROSOFT/i, 'W3Schools');

4. [JavaScript Regular Expressions](https://www.w3schools.com/js/js_regexp.asp)

### Converting to Upper and Lower Case ###
1. `toUpperCase()` **(M)**
2. Example:

		var text1 = "Hello World!";
		var text2 = text1.toUpperCase();

3. `toLowerCase()` **(M)** - converts string to lowercase

		var text1 = "Hello World!";
		var text2 = text1.toLowerCase();

### The `concat()` Method ###
1. `concat()` **(M)** joins two or more strings
2. Example:

		var text1 = 'Hello';
		var text2 = 'World';
		var text3 = text1.concat(' ', text2);

	1. Similar to `+` operator
		
			var text = 'Hello' + ' ' + 'World!';
			var text = "Hello".concat(' ', 'World!');

3. **All string methods return a new string and do not modify the original string**
	1. **Strings** are immutable (cannot be changed) but can be replaced

### Extracting String Characters ###
1. `charAt(<position>)` **(M)**: Returns character at a specified position
2. `charCodeAt(<position>)` **(M)**: Returns character unicode at a specified position

### The `charAt()` Method ###
1. Example:

		var str = 'HELLO WORLD';
		str.charAt(0);				// returns H

### The `charCodeAt()` Method ###
1. `charCodeAt()` **(M)** returns unicode of the character at specified position
2. Example:

		var str = 'HELLO WORLD';
		str.charCodeAt(0);			// Returns 72

### Accessing a String as an Array is Unsafe ###
1. `str[0]` - unsafe code
	1. Does not work in all browsers
	2. Makes strings look like arrays
	3. `str[0] = 'H'` does not throw any error but does not work
2. Solution: Convert string as an array

### Converting a String to an Array ###
1. `split()` **(M)** - Converts string to an array
2. Example:

		var txt = "a,b,c,d,e";	// String
		txt.split(",");			// Split on commas
		txt.split(" ");			// Split on spaces
		txt.split("|");			// Split on pipe
		txt.split();			// Returns whole string as array with only index 0
		txt.split("");			// Returns array of single characters

### Complete String Reference ###
1. [Complete JavaScript String Reference](https://www.w3schools.com/jsref/jsref_obj_string.asp)

## JS Numbers ##
1. JS has only one type of number
2. Numbers can be written with or without decimal
3. Example:

		var x = 3.14;
		var y = 3;

4. Example: Extra large or extra small numbers can be written with scientific notation:

		var x = 123e5;
		var y = 123e-5;

### JavaScript Numbers are Always 64-bit Floating Point ###
1. JS numbers are always stored as double precision floating point numbers following IEEE 754 standard.
	1. Number is stored in 64 bits
		1. Fraction in bits 0 - 51
		2. Exponent in bits 52 - 62
		3. Sign bit in bit 63

### Precision ###
1. Integers are accurate upto 15 digits

		var x = 9999999999999;	// x will be 9999999999999
		var y = 9999999999999999; // y will be 10000000000000000

2. Maximum number of decimals is 17 but floating point arithmetic is not 100% accurate

		var x = 0.2 + 0.1;		// x will be 0.30000000000000004

3. Solve the problem

		var x = (0.2 * 10 + 0.1 * 10) / 10;		// x will be 0.3

### Adding Numbers and Strings ###
1. Adding numbers gives number
2. Adding strings concatenates the strings
3. Adding a number and a string coerces number to a string and concatenates them

		var x = 10;
		var y = "20";
		var z = x + y;		// z will be 1020 (a string)

### Numeric Strings ###
1. JS will try to convert strings to numbers in numeric operations:

		var x = "100";
		var y = "10";
		var z = x / y;		// z will be 10
		var p = x * y;		// p will be 1000
		var q = x - y;		// q will be 90
		var r = x + y;		// r will be 10010 (concatenation if +)

### NaN - Not a Number ###
1. `NaN`: Reserved word - indicates not a legal number
2. Arithmetic with non-numeric string results in `NaN`

		var x = 100 / "Apple"; // x will be NaN (Not a Number)

3. If string contains numeric value, result will be a number

		var x = 100 / "10";		// x will be 10

4. `isNaN()` **(M)** - global JS function

		var x = 100 / "Apple";
		isNaN(x);		// returns true because x is Not a Number

5. If `NaN` is used in a mathematical operation, result will also be `NaN`

		var x = NaN;
		var y = 5;
		var z = x + y;		// z will be NaN

6. Concatenation of `NaN` and other strings

		var x = NaN;
		var y = "5";
		var z = x + y;		// z will be NaN5

7. Type of `NaN` is number

		typeof NaN;		// returns "number"

### Infinity ###
1. `Infinity` or `-Infinity` - Value that JS will return if we calculate a number outsite largest possible number

		var myNumber = 2;
		while (myNumber != Infinity) {		// Execute until Infinity
			myNumber = myNumber * myNumber;
		}

2. Division by 0 generates infinity

		var x = 2 / 0;		// x will be Infinity
		var y = -2 / 0;		// y will be -Infinity

3. Type of `Infinity` or `-Infinity` is number

		typeof Infinity;	// returns "number"

### Hexadecimal ###
1. If a constant is prefixed by `0x`, the constant is interpreted as a hexadecimal number

		var x = 0xFF;		// x will be 255

2. Some JS versions interpret `07` as octal version
3. JS displays numbers as base 10 decimals
4. `toString()` outputs numbers as base 16 (hex), base 8 (octal), base 2 (binary)
5. Example:

		var myNumber = 128;
		myNumber.toString(16);		// returns 80
		myNumber.toString(8);		// returns 200
		myNumber.toString(2);		// returns 10000000

### Numbers Can be Objects ###
1. Numbers can be objects

		var x = 123;
		var y = new Number(123);	// slows down execution speed and `new` complicates code

		// typeof x returns number
		// typeof y returns object

2. `==` resolves equal numbers to be equal

		var x = 500;
		var y = new Number(500);

		// (x == y) is true because x and y have equal values
		// (x === y) is false because x and y have different types

3. Worse!

		var x = new Number(500);
		var y = new Number(500);

		// (x == y) is false because objects cannot be compared
		// (x === y) is false because objects cannot be compared

## JS Number Methods ##
### Number Methods and Properties ###
1. Primitive values are not objects and they do not have properties and methods but in JS, primitive values have properties and methods (JS treats primitive values as objects when executing methods and properties)

### The `toString()` Method ###
1. `toString()` - returns a number as a string
2. All number methods can be used on any type of numbers (literals, variables, expressions)
3. Example:

		var x = 123;
		x.toString();		// returns 123 from variable x
		(123).toString();	// returns 123 from literal 123
		(100 + 23).toString();	// returns 123 from expression 100 + 23

### The `toExponential()` Method ###
1. `toExponential()` **(M)**: Returns string with number rounded and written using exponential notation
2. Example:

		var x = 9.656;
		x.toExponential(2);		// returns 9.66e+0
		x.toExponential(4);		// returns 9.6560e+0
		x.toExponential(6);		// returns 9.656000e+0

### The `toFixed()` Method ###
1. `toFixed()` **(M)** returns a string with number written with specified number of decimals

		var x = 9.656;
		x.toFixed(0);		// returns 10
		x.toFixed(2);		// returns 9.66 - good for working with money
		x.toFixed(4);		// returns 9.6560
		x.toFixed(6);		// returns 9.656000

### The `toPrecision()` Method ###
1. `toPrecision()` **(M)** returns a string with number written with specified length

		var x = 9.656;
		x.toPrecision();		// returns 9.656
		x.toPrecision(2);		// returns 9.7
		x.toPrecision(4);		// returns 9.656
		x.toPrecision(6);		// returns 9.65600

### The `valueOf()` Method ###
1. `valueOf()` **(M)** returns number as a primitive
	1. number can be primitive or object

			var x = 123;
			x.valueOf();			// returns 123 from variable x
			(123).valueOf(); 		// returns 123 from literal 123
			(100 + 23).valueOf();	// returns 123 from expression
			(new Number(123)).valueOf();

2. It is used internally by JS to convert objects into primitive values

### Converting Variables to Numbers ###
1. Three global methods to convert variables into numbers
	1. `Number()`
	2. `parseInt()`
	3. `parseFloat()`

### Global Methods ###
1. Can be used on all JS datatypes
	1. `Number()` - returns a number converted from its argument
	2. `parseFloat()` - Parses arguments and returns a floating point number
	3. `parseInt()` - Parses arguments and returns an integer

### The `Number()` Method ###
1. Examples:

		x = true;
		Number(x);		// returns 1
		x = false;
		Number(x);		// returns 0
		x = new Date();
		Number(x);		// returns 1204568027739 - number of milliseconds since 1.1.1970
		x = "10 20";
		Number(x);		// returns NaN

### The `parseInt()` Method ###
1. Parses a string and returns a whole number
2. Examples:

		parseInt("10");		// returns 10
		parseInt("10.33");	// returns 10
		parseInt("10 20 30");	// returns 10
		parseInt("10 years");	// returns 10
		parseInt("years 10");	// returns NaN

### The `parseFloat()` Method ###
1. Parses a string and returns a number. If there are spaces, only the first number is returned

		parseFloat("10");			// returns 10
		parseFloat("10.33");		// returns 10.33
		parseFloat("10 20 30");		// returns 10
		parseFloat("10 years");		// returns 10
		parseFloat("years 10");		// returns NaN

### Number Properties ###
1. `MAX_VALUE` **(M)** - returns largest number possible in JS
2. `MIN_VALUE` **(M)** - returns smallest number possible in JS
3. `NEGATIVE_INFINITY` **(M)** - negative infinity (returned on overflow)
4. `NaN` **(M)** - "Not-a-Number"
5. `POSITIVE_INFINITY` **(M)** - infinity (returned on overflow)
6. Examples:

		var x = Number.MAX_VALUE;

7. Example: Invalid

		var x = 6;
		var y = x.MAX_VALUE;	// y is undefined 

### Complete JavaScript Number Reference ###
1. [Complete JavaScript Number Reference](https://www.w3schools.com/jsref/jsref_obj_number.asp)

## JS Math ##
1. Allows us to perform mathematical operations on numbers
2. `Math.PI;	// returns 3.141592653589793`

### `Math.round()` ###
1. `Math.round(x)` **(M)** - returns value of x rounded to it's nearest integer
2. Example:

		Math.round(4.7);		// returns 5
		Math.round(4.4);		// returns 4

### `Math.pow()` ###
1. `Math.pow(x, y)` **(M)** - returns x to the power of y
2. Example:

		Math.pow(8, 2);			// returns 64

### `Math.sqrt()` ###
1. `Math.sqrt(x)` **(M)** returns square root of x
2. Example:

		Math.sqrt(64);			// returns 8

### `Math.abs()` ###
1. `Math.abs(x)` **(M)** Returns absolute value of x
2. Example:

		Math.abs(-4.7);			// returns 4.7

### `Math.ceil()` ###
1. `Math.ceil(x)` **(M)** Returns value of x rounded up to its nearest integer
2. Example:

		Math.ceil(4.4);		// returns 5

### `Math.floor()` ###
1. `Math.floor(x)` **(M)** Returns value of x rounded down to its nearest integer
2. Example:

		Math.floor(4.7);	// returns 4

### `Math.sin()` ###
1. `Math.sin(x)` **(M)** returns sine of x (given in radians)
2. Formula

		x = a * PI/180

3. Example:

		Math.sin(90 * Math.PI / 180);		// returns 1 (the sine of 90 degrees)

### `Math.cos()` ###
1. `Math.cos(x)` returns cosine of x (given in radians)
2. Example:

		Math.cos(0 * Math.PI / 180);		// returns 1 (the cos of 0 degrees)

### `Math.min()` and `Math.max()` ###
1. `Math.min(<list>)` **(M)** returns lowest value in a list of arguments
2. Example:

		Math.min(0, 150, 30, 20, -8, -200);		// returns -200
		Math.max(0, 150, 30, 20, -8, -200);		// returns 150

### `Math.random()` ###
1. `Math.random()` **(M)** returns a number between 0 and 1 (exclusive)

### Math Properties (Constants) ###
1. 8 mathematical constants
	1. `Math.E` - Euler's number
	2. `Math.PI`
	3. `Math.SQRT2` - square root of 2
	4. `Math.SQRT1_2` - square root of 1/2
	5. `Math.LN2` - natural logarithm of 2
	6. `Math.LN10` - natural logarithm of 10
	7. `Math.LOG2E` - base 2 logarithm of E
	8. `Math.LOG10E` - base 10 logarithm of E

### Math Constructor ###
1. `Math` object has no constructor. Methods and properties are static

### Math Object Methods ###
1. `abs(x)`
2. `acos(x)`
3. `asin(x)`
4. `atan(x)`
5. `atan2(y,x)` - arc tangent of quotient of its arguments
6. `ceil(x)`
7. `cos(x)`
8. `exp(x)`
9. `floor(x)`
10. `log(x)`
11. `max(x, y, z, ..., n)`
12. `min(x, y, z, ..., n)`
13. `pow(x, y)`
14. `random()`
15. `round(x)`
16. `sin(x)`
17. `sqrt(x)`
18. `tan(x)`

### Complete Math Reference ###
1. [Complete Math Object Reference](https://www.w3schools.com/jsref/jsref_obj_math.asp)

## JS Random ##
### `Math.random()` ###
1. `Math.random()` - returns a number between 0 and 1 (excluded)

### JavaScript Random Integers ###
1. `Math.floor(Math.random() * 10);		// returns a number between 0 and 9`
2. `Math.floor(Math.random() * 11);		// returns a number between 0 and 10`
3. `Math.floor(Math.random() * 100);	// returns a number between 0 and 99`
4. `Math.floor(Math.random() * 101);	// returns a number between 0 and 100`
5. `Math.floor(Math.random() * 10) + 1;	// returns a number between 1 and 10`
6. `Math.floor(Math.random() * 100) + 1;	// returns a number between 1 and 100`

### A Proper Random Function ###
1. Function definition:

		function getRndInteger(min, max) {
			return Math.floor(Math.random() * (max - min)) + min;
			// return Math.floor(Math.random() * (max - min + 1)) + min;
		}

## JS Dates ##
1. `Date` object allows us to work with dates (years, months, days, hours, minutes, seconds, and milliseconds)

### JavaScript Date Formats ###
1. Date can be written as string (`Thu Aug 10 2017 11:12:11 GMT+0530 (IST)`) or as a number `1502343731152` (milliseconds since January 1, 1970, 00:00:00)

### Displaying Dates ###
1. Example:

		<p id="demo"></p>

		<script>
			document.getElementById("demo").innerHTML = Date();
		</script>

### Creation of Date Objects ###
1. Date objects let us work with dates
2. Date has year, month, day, hour, minute, second, milliseconds
3. `new Date()` constructor
4. 4 ways of initiating date

		new Date()		// current date and time
		new Date(milliseconds)
		new Date(dateString)
		new Date(year, month, day, hours, minutes, seconds, milliseconds)

5. Example:

		<script>
			var d = new Date();
			document.getElementById("demo").innerHTML = d;
		</script>

6. Example: New date object from specified data and time

		<script>
			var d = new Date("October 13, 2014 11:13:00");
			document.getElementById("demo").innerHTML = d;
		</script>

7. Example: New date object from specified milliseconds since start date

		<script>
			var d = new Date(86400000);	// + 1 day
			document.getElementById("demo").innerHTML = d;
		</script>

8. Example: New date object from 7 numbers

		<script>
			var d = new Date(99, 5, 24, 11, 33, 30, 0);
			document.getElementById("demo").innerHTML = d;
		</script>

9. Example: Any of last 4 parameters can be omitted

		<script>
			var d = new Date(99, 5, 24);
			document.getElementById("demo").innerHTML = d;
		</script>

### Date Methods ###
1. Date methods allow us to get and set year, month, day, hour, minute, second, and milliseconds of object using either local time or UTC (universal, or GMT)

### Displaying Dates ###
1. A `Date` object when displayed in HTML, it is converted to string with `toString()` method
2. Example:

		<p id="demo"></p>

		<script>
			var d = new Date();
			document.getElementById("demo").innerHTML = d.toString();
		</script>

3. Example: Converting to UTC string

		<script>
			var d = new Date();
			document.getElementById("demo").innerHTML = d.toUTCString();
		</script>

4. Example: Converting to more readable date string

		<script>
			var d = new Date();
			document.getElementById("demo").innerHTML = d.toDateString();
		</script>

5. Date objects are static (they do not change unless refreshed)

### Time Zones ###
1. If time zone is not specified, JS uses browser's timezone
2. When getting date, JS converts result into browser's timezone
	1. If date is created in GMT and if a user browser is in central US, it is converted to CDT (Central US Daylight Time)

## JS Date Formats ##
### JavaScript Date Input ###
1. Four formats
	1. ISO Date - `2015-03-25` (strict standard in JS)
	2. Short Date - `03/25/2015`
	3. Long Date - `Mar 25 2015` or `25 Mar 2015`
	4. Full Date - `Wednesday March 25 2015`

### JavaScript Date Output ###
1. JS by default outputs dates in full text string format

### JavaScript ISO Dates ###
1. ISO 8601 - international standard for representation of dates and times
2. Syntax: `YYYY-MM-DD` - prefered JS date format
3. Example:

		var d = new Date("2015-03-25");	// 00:00:00 GMT + 0530 (IST)

	1. Computed date will be releative to time zone (Result may be March 24 or March 25)

### ISO Dates (Year and Month) ###
1. ISO dates can be written without specifying the day
2. Example:

		var d = new Date("2015-03"); // Timezone decides Feb 28 or Mar 01

### ISO Dates (Only Year) ###
1. ISO dates can be written without month and day (`YYYY`)
2. Example:

		var d = new Date("2015");	// Timezone decides December 31 or Jan 01

### ISO Dates (Date-Time) ###
1. With hours, minutes and seconds (YYYY-MM-DDTHH:MM:SSZ)
2. Example:

		var d = new Date("2015-03-25T12:00:00Z");

	1. `T` separates date and time
	2. `Z` for UTC time
	3. To modify time relative to UTC remove `Z` and add `+HH:MM` or `-HH:MM`
		1. Example:

				var d = new Date("2015-03-25T12:00:00-06:30");

	4. UTC is same as GMT
	5. If T or Z are omitted, we get different results in different browsers
		1. Assumes the time is for the browser's time zone (for chrome)
		2. Assumes we have to add or delete the offset time from the given time (for Opera)

### Time Zones ###
1. If date is set without timezone, browser time zone is used
2. If we get date without specifying timezone, result is converted to browser time zone
	1. If date/time were created in GMT, it is converted to CDT if user browses from central US

### JavaScript Short Dates. ###
1. `MM/DD/YYYY` - short date
2. Example:

		var d = new Date("03/25/2015");  // Time is 00:00:00

### WARNINGS ! ###
1. In some browsers, months or days with no leading 0s may produce error

		var d = new Date("2015-3-25");

2. Behavior of `YYYY/MM/DD` is undefined
	1. Some browsers guess the format but some return NaN

			var d = new Date("2015/03/25");

3. Behavior of `DD-MM-YYYY` is also undefined
	1. Some browsers guess the format but some return NaN

			var d = new Date("25-03-2015");

### JavaScript Long Dates. ###
1. Format: `MMM DD YYYY`

		var d = new Date("Mar 25 2015");

2. Month and day can be in any order

		var d = new Date("25 Mar 2015");

3. Month can be written in full (January) or abbreviated (Jan)

		var d = new Date("January 25 2015");

4. Commas are ignored and names are case insensitive

		var d = new Date("JANUARY, 25, 2015");

### JavaScript Full Date ###
1. Date strings in full JS format

		var d = new Date("Wed Mar 25 2015 09:56:24 GMT+0100 (W. Europe Standard Time)");

	1. Errors in Day name (`Wed`) and time parantheses (`(W. Europe Standard Time)`) are ignored

## JS Date Methods ##
1. Allows us to get and set date values (years, months, days, hours, minutes, seconds, milliseconds)

### Date Get Methods ###
1. Common methods:
	1. `getDate()` - get day as number (1-31)
	2. `getDay()` - get weekday as number (0-6)
	3. `getFullYear()` - Get four digit year (yyyy)
	4. `getHours()` - Get hour (0-23)
	5. `getMilliseconds()` - Get milliseconds (0-999)
	6. `getMinutes()` - Get minutes (0-59)
	7. `getMonth()` - Get month (0-11)
	8. `getSeconds()` - Get seconds (0-59)
	9. `getTime()` - get time (milliseconds since January 1, 1970)

### The `getTime()` Method ###
1. `getTime()` returns number of milliseconds since January 1, 1970

		<script>
			var d = new Date();
			document.getElementById("demo").innerHTML = d.getTime();
		</script>

### The `getFullYear()` Method ###
1. `getFullYear()` **(M)** returns

		<script>
			var d = new Date();
			document.getElementById('demo').innerHTML = d.getFullYear();
		</script>

### The `getDay()` Method ###
1. `getDay()` returns weekday as a number (0-6)

		<script>
			var d = new Date();
			document.getElementById('demo').innerHTML = d.getDay();
		</script>

	1. 0 - Sunday
2. It can be used to return weekday as a string

		<script>
			var d = new Date();
			var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', Thursday', 'Friday', 'Saturday'];
			document.getElementById('demo').innerHTML = days[d.getDay()];

### Date Set Methods ###
1. Set methods set part of a date
2. Common methods:
	1. `setDate()` - sets day as number (1-31)
	2. `setFullYear()` - Set year (optionally month and day)
	3. `setHours()` - Set hour (0-23)
	4. `setMilliseconds()` - Set milliseconds (0-999)
	5. `setMinutes()` - Set minutes (0-59)
	6. `setMonth()` - Set month (0-11)
	7. `setSeconds()` - Set seconds (0-59)
	8. `setTime()` - Set time (milliseconds since January 1, 1970)

### The `setFullYear()` Method ###
1. `setFullYear()` **(M)** sets date object to specific date (January 14, 2000)

		<script>
			var d = new Date();
			d.setFullYear(2020, 0, 14);
			document.getElementById('demo').innerHTML = d;
		</script>

### The `setDate()` Method ###
1. `setDate()` **(M)**

		<script>
			var d = new Date();
			d.setDate(20);
			document.getElementById('demo').innerHTML = d;
		</script>

2. We can add days in `setDate()` method

		<script>
			var d = new Date();
			d.setDate(d.getDate() + 50);
			document.getElementById('demo').innerHTML = d;
		</script>

### Date Input - Parsing Dates ###
1. `Date.parse()` **(M)** converts valid date string into milliseconds
2. Example:

		<script>
			var msec = Date.parse('March 21, 2012');
			document.getElementById('demo').innerHTML = msec;
		</script>

3. Milliseconds can be converted to a `Date` object

		<script>
			var msec = Date.parse('March 21, 2012');
			var d = new Date(msec);
			document.getElementById('demo').innerHTML = d;
		</script>

### Compare Dates ###
1. Comparison using `<`, `>`, `==`, `!=`
2. Example:

		var today, someday, text;
		today = new Date();
		someday = new Date();
		someday.setFullYear(2100, 0, 14);

		if (someday > today) P
			text = "Today is before January 14, 2100.";
		} else {
			text = "Today is after January 14, 2100.";
		}
		document.getElementById('demo').innerHTML = text;

### UTC Date Methods ###
1. `getUTCDate()` - returns UTC date
2. `getUTCDay()` - returns UTC day
3. `getUTCFullYear()` - returns UTC year
4. `getUTCHours()` - returns UTC hour
5. `getUTCMilliseconds()` - returns UTC milliseconds
6. `getUTCMinutes()` - returns UTC minutes
7. `getUTCMonth()` - returns UTC month
8. `getUTCSeconds()` - returns UTC seconds

### Complete JavaScript Date Reference ###
1. [Complete JavaScript Date Reference](https://www.w3schools.com/jsref/jsref_obj_date.asp)

## JS Arrays ##
1. JS Arrays store multiple values in a single variable
2. Example:

		var cars = ["Saab", "Volvo", "BMW"];

### What is an Array? ###
1. Array is a variable that can hold multiple values at a time
2. Values can be accessed using an index number

### Creation of an Array ###
1. Array literal:

		var array_name = [item1, item2, ...];

	1. Example:

			var array_name = ["Saab", "Volvo", "BMW"];

2. Spaces and line breaks are not important

		var cars = [
			"Saab",
			"Volvo",
			"BMW"
		];

	1. Putting , after last element makes it inconsistent across browsers (IE-8 and earlier)

### Using the JavaScript Keyword `new` ###
1. Using `new`
2. Example:

		var cars = new Array("Saab", "Volvo", "BMW");

	1. Array literal is for simplicity, readability and execution speed

### Access the Elements of an Array ###
1. Array element is referenced using an index number.
2. Example to access first element in cars:

		var name = cars[0];

3. To modify first element in cars

		var cars[0] = 'Opel';

4. Example:

		var cars = ["Saab", "Volvo", "BMW"];
		document.getElementById('demo').innerHTML = cars[0];

### Access the Full Array ###
1. Full array can be accessed by referring to array name

		var cars = ["Saab", "Volvo", "BMW"];
		document.getElementById('demo').innerHTML = cars;

### Arrays are Objects ###
1. Arrays are special type of objects.
2. `typeof` returns `object` for arrays
3. Arrays use numbers to access it's elements but objects use names to access it's members

		var person = {firstName: "John", lastName: "Doe", age: 46};
		person.firstName

### Array Elements Can Be Objects ###
1. JS variables can be objects and arrays are special type of objects
2. variables in array can be of different types
	1. Example:

			myArray[0] = Date.now;
			myArray[1] = myFunction;
			myArray[2] = myCars;

### Array Properties and Methods ###
1. Built in array properties and methods:
2. Example:

		var x = cars.length;	// The length property returns the number of elements
		var y = cars.sort();	// The sort() method sorts arrays

### The `length` Property ###
1. `length` returns length of an array (number of elements)
2. Example:

		var fruits = ["Banana", "Orange", "Apple", "Mango"];
		fruits.length;

### looping Array Elements ###
1. Use `for` loop
2. Example:

		var fruits, text, fLen, i;

		fruits = ['Banana', 'Orange', 'Apple', 'Mango'];
		fLen = fruits.length;
		text = '<ul>';
		for (i = 0; i < fLen; i++) {
			text += '<li>' + fruits[i] + '</li>';
		}

### Adding Array Elements ###
1. `push` **(M)**
2. Example:

		var fruits = ['Banana', 'Orange', 'Apple', 'Mango'];
		fruits.push('Lemon');	// adds a new element (Lemon) to fruits

3. Adding element using `length` property

		fruits[fruits.length] = 'Lemon';

4. Warning: Adding elements with high indexes adds undefined holes inside the array

		fruits[6] = 'Lemon';	// fruits[5] is undefined

### Associative Arrays ###
1. Associative arrays are hashes
2. JavaScript does not support hashes
	1. Arrays always use numbered indexes
3. Example:

		var person = [];
		person[0] = 'John';
		person[1] = 'Doe';
		person[2] = 46;
		var x = person.length;		// person.length will return 3
		var y = person[0];			// person[0] will return 'John'

4. If named indexes are used, JS will redefine array to standard object but array methods and properties will produce incorrect results
	
		var person = [];
		person['firstName'] = 'John';
		person['lastName'] = 'Doe';
		person['age'] = 46;
		var x = person.length;		// person.length will return 0
		var y = person[0];			// person[0] will return undefined
	

### The Difference Between Arrays and Objects ###
1. Arrays use numbered indexes
2. Objects use named indexes

### When to Use Arrays. When to use Objects. ###
1. JS does not support associative arrays
2. Use Objects if element names must be strings
3. Use arrays if element names must be numbers

### Avoid `new Array()` ###
1. Use `[]` instead of `new Array()`
	1. Example:

			var points = [40, 100, 1, 5, 25, 10];

2. Example: Bad

		var points = new Array(40);		// Array with 40 elements gets created!!!!

### How to Recognize an Array ###
1. `Array.isArray(fruits);` **(M)**
	1. ES5 - not supported in old browsers
2. Function:

		function isArray(x) {
			return x.constructor().toString().indexOf("Array") > -1;
		}

	1. If object prototype contains the word `Array`
3. `instanceof` **(M)**

		fruits instanceof Array;

## JS Array Methods ##
### Converting Arrays to Strings ###
1. `toString()` - converts array to string of comma separated array values
2. Example:

		var fruits = ['Banana', 'Orange', 'Apple', 'Mango'];
		document.getElementById('demo').innerHTML = fruits.toString();

3. `join()` **(M)** - joins all array elements into a string (like `toString()` but we can specify separator)
	1. Example:

			var fruits = ['Banana', 'Orange', 'Apple', 'Mango'];
			document.getElementById('demo').innerHTML = fruits.join(' * ');

### Popping and Pushing ###
1. To remove or add elements

### Popping ###
1. `pop()` **(M)** - removes last element from an array
2. Example:

		var fruits = ['Banana', 'Orange', 'Apple', 'Mango'];
		fruits.pop();		// Removes Mango and returns it

### pushing ###
1. `push()` **(M)** - adds new element to an array
2. Example:

		var fruits = ['Banana', 'Orange', 'Apple', 'Mango'];
		fruits.push('Kiwi');	// returns new array length

### Shifting Elements ###
1. `shift()` **(M)** - removes element from the beginning of an array
	1. All other elements are shifted to lower index
2. Example:

			fruits.shift();		// Removes Banana and returns it

3. `unshift()` **(M)** adds element to the beginning of an array
4. Example:

		fruits.unshift('Lemon');

### Changing Elements ###
1. `fruits[0] = 'Kiwi';`
2. `fruits[fruits.length] = 'Kiwi';`

### Deleting Elements ###
1. `delete` **(M)** - operator to delete elements
2. Example:

		delete fruits[0];	// Changes first element in fruits to undefined

### Splicing an Array ###
1. `splice()` **(M)** - used to add new elements into an array
2. Example:

		fruits.splice(2, 0, 'Lemon', 'Kiwi');

	1. 2 - position where new elements should be added
	2. 0 - how many elements should be removed
	3. 'Lemon', 'Kiwi' - elements to be added

### Using `splice()` to Remove Elements ###
1. Removed elements using `splice()`

		fruits.splice(0, 1);		// Removes the first element of fruits

### Merging (Concatenating) Arrays ###
1. `concat(<array>)` **(M)**
2. Example:

		var myGirls = ['Cecilie', 'Lone'];
		var myBoys = ['Emil', 'Tobias', 'Linus'];
		var myChildren = myGirls.concat(myBoys);

	1. Returns a new array but does not mutate existing array
3. `concat(<array1>, <array2>, ...)` **(M)**
	1. Example:

			var arr1 = ['Cecilie', 'Lone'];
			var arr2 = ['Emil', 'Tobias', 'Linus'];
			var arr3 = ['Robin', 'Morgan'];
			var myChildren = arr1.concat(arr2, arr3);

	2. Example: Concatenating array literal

			var arr1 = ['Cecilie', 'Lone'];
			var myChildren = arr1.concat(['Emil', 'Tobias', 'Linus']);

### Slicing an Array ###
1. `slice(<start-index>, <end-index> + 1)` **(M)** - slices out an array into a new array
	1. Example:

			var fruits = ['Banana', 'Orange', 'Lemon', 'Apple', 'Mango'];
			var citrus = fruits.slice(1);
			var other = fruits.slice(1, 3);	// returns ['Orange', 'Lemon']

### Automatic `toString()` ###
1. When a primitive value is expected, JS automatically converts array to a string (ex: when we output an array)
	1. Example:

			document.getElementById('demo').innerHTML = fruits;  // same as fruits.toString()

2. All JS objects have `toString()` method

### Finding Max and Min Values in an Array ###
1. No built in functions for finding highest or lowest value in an array

### Sorting Arrays ###
1. Next chapter

### Complete Array Reference ###
1. [Complete JavaScript Array Reference](https://www.w3schools.com/jsref/jsref_obj_array.asp)

## JS Array Sort ##
### Sorting an Array ###
1. `sort()` sorts an array alphabetically
2. Example:

		var fruits = ['Banana', 'Orange', 'Apple', 'Mango'];
		fruits.sort();

### Reversing an Array ###
1. `reverse()` reverses elements in an array
2. Example: Sorting an array in descending order:

		fruits.sort();
		fruits.reverse();

### Numeric Sort ###
1. `sort()` by default sorts as strings
2. For numbers, compare function can be provided

		var points = [40, 100, 1, 5, 25, 10];
		points.sort(function (a, b) { return a - b });

3. To sort an array in descending order:

		points.sort(function (a, b) { return b - a });

### The Compare Function ###
1. Purpose: to define alternative sort order
	1. It should return a negative, 0 or positive number
2. When comparing 40, 100, compare calls `function (40, 100)`
	1. `40 - 100` returns `-60` hence order is retained

### Sorting an Array in Random Order ###
1. Sorting an array in random order
2. Example:

		var points = [40, 100, 1, 5, 25, 10];
		points.sort(function (a, b) { return 0.5 - Math.random() });

### Find the Highest (or Lowest) Array Value ###
1. We can sort an array and then use index to obtain highest and lowest values

		points.sort(function (a, b) { return a - b });
		points[0];
		points[points.length - 1];

2. Sorting in descending order:

		points.sort(function (a, b) { return b - a });

### Using `Math.max()` on an Array ###
1. Get max value using `Math.max()`

		function myArrayMax(arr) {
			return Math.max.apply(null, arr);
		}

	1. `Math.max.apply([1, 2, 3])` is equivalent to `Math.max(1, 2, 3)`

### Using `Math.min()` on an Array ###
1. Get min value using `Math.min()`

		function myArrayMin(arr) {
			return Math.min.apply(null, arr);
		}

### My Min / Max JavaScript Methods ###
1. Fastest is home made method:

		function myArrayMax(arr) {
			var len = arr.length;
			var max = -Infinity;
			while (len--) {
				if (arr[len] > max) {
					max = arr[len];
				}
			}
			return max;
		}

		function myArrayMax(arr) {
			var len = arr.length;
			var min = Infinity;
			while (len --) {
				if (arr[len] < min) {
					min = arr[len];
				}
			}
		}

### Sorting Object Arrays ###
1. If arrays contain objects:

		var cars = [
			{ type: 'Volvo', year: 2016 },
			{ type: 'Saab', year: 2001 },
			{ type: 'BMW', year: 2010 }
		];

	1. Sorting:

			cars.sort(function (a, b) { return a.year - b.year });

	2. Comparing string properties

			cars.sort(function (a, b) {
				x = a.type.toLowerCase();
				y = a.type.toLowerCase();
				if (x < y) { return -1; }
				if (x > y) { return 1; }
				return 0;
			});

## JS Booleans ##
1. JS Booleans are `true` and `false`

### Boolean Values ###
### The `Boolean()` Function ###
1. `Boolean(<expression>)` **(M)**
2. Example:

		Boolean(10 > 9);
		(10 > 9);
		10 > 9;

### Comparisons and Conditions ###
1. `==`, `>`, `<`

### Everything With a "Real" Value is True ###
1. Everything with real value is true
	1. `100`, `3.14`, `-15`, `"Hello"`, `"false"`, `7 + 1 + 3.14`, `5 < 6`

### Everything Without a "Real" Value is False ###
1. `0`, `-0`, `''`, `undefined`, `null`, `false`, `NaN`
2. Examples:

		var x = 0;
		Boolean(x);		// returns false
		
		var x = -0;
		Boolean(x);		// returns false

		var x = '';
		Boolean(x);		// returns false

		var x;
		Boolean(x);		// returns false

		var x = null;
		Boolean(x);		// returns false

		var x = false;
		Boolean(x);		// returns false

		var x = 10 / "H";
		Boolean(x);		// returns false

### Booleans Can be Objects ###
1. `var y = new Boolean(false);		// typeof y returns object`
	1. Slows down execution speed
	2. `new` complicates code
2. Equal booleans are equal

		var x = false;
		var y = new Boolean(false);

		// (x == y) is true because x and y have equal values
		// (x === y) is false because x and y are of different type
	
		var x = new Boolean(false);
		var y = new Boolean(false);

		// (x == y) is false because objects cannot be compared

### Complete Boolean Reference ###
1. [Complete JavaScript Boolean Reference](https://www.w3schools.com/jsref/jsref_obj_boolean.asp)

## JS Comparisons ##
### Comparison Operators ###
1. `==`, `===`, `!=`, `!==` - not equal value or not equal type, `>`, `<`, `<=`, `>=`

### How Can it be Used ###
1. Used to take action depending on the result

		if (age < 18) text = "Too young";

### Logical Operators ###
1. `&&`, `||`, `!`

### Conditional (Ternary) Operator ###
1. `variablename = (condition) ? value1: value2`

### Comparing Different Types ###
1. Comparing data of different types may give unexpected results
	1. If string is compared with number, string is converted to number
	2. An empty string converts to 0
	3. A non numeric string converts to NaN (false)
2. Convert variables to proper types before comparison

		age = Number(age);
		if (isNaN(age)) {
			voteable = "Input is not a number";
		} else {
			voteable = (age < 18) ? "Too young" : "Old enough";
		}

## JS Conditions ##
### Conditional Statements ###
1. Used to perform different actions for different decisions
	1. `if`, `else`, `else if`, `switch`

### The `if` Statement ###

		if (condition) {
			block of code to be executed if the condition is true
		}

		if (hour < 18) {
			greeting = "Good day";
		}

### The `else` Statement ###

		if (condition) {
			block of code to be executed if the condition is true
		} else {
			block of code to be executed if the condition is false
		}

		if (hour < 18) {
			greeting = "Good day";
		} else {
			greeting = "Good evening";
		}

### The `else if` Statement ###

		if (condition1) {
			block of code to be executed if condition1 is true
		} else if (condition2) {
			block of code to be executed if condition1 is false and condition2 is true
		} else {
			block of code to be executed if condition1 and condition2 are false
		}

		if (time < 10) {
			greeting = "Good morning";
		} else if (time < 20) {
			greeting = "Good day";
		} else {
			greeting = "Good evening";
		}

### More Examples ###
1. [Random link](https://www.w3schools.com/js/tryit.asp?filename=tryjs_randomlink)

## JS Switch ##
### The JavaScript Switch Statement ###
1. Syntax:

		switch(expression) {
			case n:
				code block
				break;
			case n:
				code block
				break;
			default:
				code block
		}

	1. `expression` is evaluated once
	2. Value of `expression` is compared with values of each case
	3. If there is a match, associated block of code is executed
2. Example:

		switch (new Date().getDay()) {
			case 0:
				day = "Sunday";
				break;
			case 1:
				day = "Monday";
				break;
			case 2:
				day = "Tuesday";
				break;
			case 3:
				day = "Wednesday";
				break;
			case 4:
				day = "Thursday";
				break;
			case 5:
				day = "Friday";
				break;
			case 6:
				day = "Saturday";
		}

### The `break` Keyword ###
1. Stops execution of case testing inside the block
	1. Saves execution time because it ignores execution of rest of the code in switch block

### The `default` Keyword ###

		switch (new Date().getDay()) {
			case 6:
				text = "Today is Saturday";
				break;
			case 0:
				text = "Today is Sunday";
				break;
			default:
				text = "Looking forward to the Weekend";
		}

1. Default case can be anywhere but it must end with a break

### Common Code Blocks ###
1. Used if same code needs to be used for multiple case statements

		switch (new Date().getDay()) {
			case 4:
			case 5:
				text = "Soon it is Weekend";
				break;
			case 0:
			case 6:
				text = "It is Weekend";
				break;
			default:
				text = "Looking forward to the Weekend";
		}

## JS Loop For ##
### JavaScript Loops ###

		for (i = 0; i < cars.length; i++) {
			text += cars[i] + "<br/>";
		}

### Different Kinds of Loops ###
1. **for** - loops a number of times
2. **for/in** - loops through properties of an object
3. **while** - loops through block while a specified condition is true
4. **do/while** - loops through block while a specified condition is true

### The For Loop ###
1. Syntax:

		for (statement 1; statement 2; statement 3) {
			code block to be executed
		}

	1. statement 1: before the loop
	2. statement 2: condition for running the loop
	3. statement 3: each time after the loop

### Statement 1 ###
1. It is optional
2. Many values can be initialized here
3. It can be omitted

### Statement 2 ###
1. Used to evaluate condition
2. It is optional
3. Use `break` if there is no statement 2

### Stetement 3 ###
1. Usually increments value of initial variable
2. Can be omitted

### The For/In Loop ###
1. Loops through properties of an object

		var person = {fname: "John", lname: "Doe", age: 25};

		var text = "";
		var x;
		for (x in person) {
			text += person[x];
		}

### The While Loop ###

## JS Loop While ##
### The While Loop ###
1. Syntax:

		while (condition) {
			code block to be executed
		}

2. Example:

		while (i < 10) {
			text += 'The number is ' + i;
			i++;
		}

### The DO/While Loop ###
1. Syntax:

		do {
			code block to be executed
		} while (condition);

2. Example:

		do {
			text += 'The number is ' + i;
			i++;
		} while (i < 10);

### Comparing For and While ###

		var cars = ['BMW', 'Volvo', 'Saab', 'Ford'];
		var i = 0;
		var text = '';

		for (;cars[i];) {
			text += cars[i] + '<br/>';
			i++;
		}

		while (cars[i]) {
			text += cars[i] + '<br/>';
			i++;
		}

## JS Break ##
1. Jumps out of a loop
2. continue: jumps over one iteration in the loop

### The Break Statement ###
1. Breaks loop and continues executing code after the loop if any

		for (i = 0; i < 10; i++) {
			if (i === 3) { break; }
			text += 'The number is ' + i + '<br/>';
		}

### The Continue Statement ###
1. Breaks one iteration if a specified condition occurs and continues with next iteration in the loop

		for (i = 0; i < 10; i++) {
			if (i === 3) { continue; }
			text += 'The number is ' + i + '<br/>';
		}

### JavaScript Labels ###
1. Syntax: `<label>:` should preced a statement

		label: statement

2. continue with label or without label: can only be used to skip one loop iteration
3. break without label: only used to jump out of a loop or a switch
	1. breaks out of the labeled block
4. break with label: can be used to jump out of any code block

		{
			text += cars[0] + '<br/>';
			list: {
				text += cars[1] + '<br/>';
				text += cars[2] + '<br/>';
				break list;
				text += cars[3] + '<br/>';
			}
			text += cars[4] + '<br/>';
			text += cars[5] + '<br/>';
		}

		BMW
		Volvo
		Saab
		undefined
		undefined

## JS Type Conversion ##
1. `Number()` converts to number
2. `String()` converts to string
3. `Boolean()` converts to boolean

### JavaScript Data Types ###
1. 5 data types that can contain values
	1. string
	2. number
	3. boolean
	4. object
	5. function
2. 3 types of objects
	1. Object
	2. Date
	3. Array
3. 2 types that cannot contain values
	1. null
	2. undefined

### The `typeof` Operator ###
1. Used to find datatype of a JS variable

		typeof "John"		// Returns "string"
		typeof 3.14			// Returns "number"
		typeof NaN			// Returns "number"
		typeof false		// Returns "boolean"
		typeof [1, 2, 3, 4]	// Returns "object"
		typeof {name: 'John', age: 34}	// Returns "object"
		typeof new Date()	// Returns "object"
		typeof function () {}	// Returns "function"
		typeof myCar		// Returns "undefined"
		typeof null			// Returns "object"

### The Data Type of `typeof` ###
1. `typeof` is an operator and operators do not have any type
	1. Always returns a string containing type of operand

### The constructor Property ###
1. `constructor` property
	1. Returns constructor function for all JS variables

			"John".constructor		// returns function String() {[native code]}
			(3.14).constructor		// returns function Number() {[native code]}
			false.constructor		// returns function Boolean() {[native code]}
			[1, 2, 3, 4].constructor	// returns function Array() {[native code]}
			{name: 'John', age: 34}.constructor	// returns function Object() {[native code]}
			new Date().constructor	// returns function Date() {[native code]}
			function () {}.constructor	// returns function Function() {[native code]}

2. To check Objects:

		function isArray(myArray) {
			return myArray.constructor.toString().indexOf('Array') > -1;
		}

		function isArray(myArray) {
			return myArray.constructor === Array;
		}

		function isDate(myDate) {
			return myDate.constructor.toString().indexOf('Date') > -1;
		}

		function isDate(myDate) {
			return myDate.constructor === Date;
		}

### JavaScript Type Conversion ###
1. JavaScript variables can be converted to another data type
	1. Using JS function
	2. Automatically

### Converting Numbers to Strings ###
1. `String()` - converts numbers to strings (can take any object)
	1. can take
		1. number
		2. literal
		3. variable
		4. expression
2. Example:

		String(x);		// returns a string from a number variable x
		String(123);	// returns a string from a number variable 123
		String(100 + 23);	// returns a string from a number from an expression
		
		String([1, 2, 3]);	// returns "1,2,3"
		String(undefined);	// returns "undefined"
		String(null);		// returns "null"
		String(NaN);		// returns "NaN"

3. `toString()` does the same (it is a variable method)

		x.toString();
		(123).toString();
		(100 + 23).toString();

4. Other methods to convert numbers to strings

		x.toExponential() - returns string with number rounded and written using exponential notation
		x.toFixed() - returns string with number rounded and written with specified number of decimals
		x.toPrecision() - returns string with number written with specified length

### Converting Booleans to Strings ###
1. `String()` can convert booleans to strings

		String(true);		// returns "false"
		String(false);		// returns "true"

2. `toString()` can convert booleans to strings

		false.toString()	// returns "false"
		true.toString()		// returns "true"

### Converting Dates to Strings ###
1. `String(Date())`
2. `Date().toString()`
3. Other methods that can convert dates to strings
	1. `getDate()`
	2. `getDay()`
	3. `getFullYear()`
	4. `getHours()`
	5. `getMilliseconds()`
	6. `getMinutes()`
	7. `getMonth()`
	8. `getSeconds()`
	9. `getTime()`

### Converting Strings to Numbers ###
1. `Number(<string>)` - converts strings to numbers
2. Empty string converts to 0

		Number(' ')		// returns 0
		Number('')		// returns 0
		Number('99 88')	// returns NaN

3. Other methods that convert strings to numbers

		parseFloat()
		parseInt()

### The Unary `+` Operator ###
1. `+` can be used to convert a variable to a number
	1. If variable cannot be converted, it will return `NaN`

			var y = "5";	// y is a string
			var x = + y;	// x is a number

			var y = "John";	// y is a string
			var x = + y;	// x is a number (NaN)

### Converting Booleans to Numbers ###
1. `Number()` can convert booleans to numbers

		Number(false)		// returns 0
		Number(true)		// returns 1

### Converting Dates to Numbers ###
1. Example:

		d = new Date();
		Number(d)			// returns seconds getTime does the same

### Automatic Type Conversion ###
1. JS tries to convert value to right type

		5 + null	// returns 5 since null is converted to 0
		"5" + null	// returns "5null"
		"5" + 2		// returns "52"
		"5" - 2		// returns 3
		"5" * 2		// returns 10

### Automatic String Conversion ###
1. When an object or variable is output, `toString()` is automatically called on it

		document.getElementById('demo').innerHTML = myVar;

		// if myVar = {name: "Fjohn"}	// toString converts to "[object Object]"
		// if myVar = [1,2,3,4]			// toString converts to "1,2,3,4"
		// if myVar = new Date()		// toStirng converts to "<date>"

2. Numbers and booleans are also converted

### JavaScript Type Conversion Table ###
1. Value, Converted to Number, Converted to String, Converted to Boolean
2. "0", 0, "0", true
3. "000", 0, "000", true
4. "", 0, "", false
5. [], 0, "", true
6. [20], 20, "20", true
7. null, 0, "null", false

## JS Bitwise ##
### JavaScript Bitwise Operators ###
1. `&`, `|`, `^`, `~`, `<<` - zero fill left shift, `>>` - signed right shift, `>>>` 0 fill right shift

### Examples ###
1. Operations:
	1. 5 & 1 - 0101 & 0001 - 0001 - 1
	2. 5 | 1 - 0101 | 0001 - 0101 - 5
	3. ~ 5 - ~ 0101 - 1010 - 10
	4. 5 << 1 - 0101 - 1010 - 10
	5. 5 ^ 1 - 0101 ^ 0001 - 0100 - 4
	6. 5 >> 1 - 0101 >> 1 - 0010 - 2
	7. 5 >>> 1 - 0101 >>> 1 - 0010 - 2 

### JavaScript Uses 32 bits Bitwise Operands ###
1. JS stores numbers as 64 bits floating point numbers
2. Bitwise operations are performed on 32 bits binary numbers
	1. Numbers are first converted to 32 bit signed integers
	2. After operation, result is converted to 64 bit JS number
3. Example: ~ 5 returns -6 in JS

		5 = 00000000000000000000000000000101
		~ 5 = 11111111111111111111111111111010 = -6

### Bitwise AND ###
1. Returns 1 if both bits are 1

### Bitwise OR ###
1. Returns 1 if either bit is 1 or bother are 1

### Bitwise XOR ###
1. Returns 1 if either bit is 1 but not both

### JavaScript Bitwise AND (`&`) ###
1. Only if both bits are 1

### JavaScript Bitwise OR (`|`) ###
1. If one of the bits are 1

### JavaScript Bitwise XOR (`^`) ###
1. If bits are different

### JavaScript Bitwise NOT (`~`) ###
1. 1s compliment

### JavaScript (Zero Fill) Bitwise Left Shift (`<<`) ###
1. One or more 0 bits are pushed in from the right

### JavaScript (Sign Preserving) Bitwise Right Shift (`>>`) ###
1. Preserves sign bit

		-5 >> 1 = -3

### JavaScript (Zero Fill) Right Shift (`>>>`) ###
1. Pushes 0s from the left

### Binary Numbers ###
1. Negative numbers are 2s compliment (bitwise NOT + 1)

		00000000000000000000000000000101 = 5
		11111111111111111111111111111011 = -5
		00000000000000000000000000000110 = 6
		11111111111111111111111111111010 = -6 

### Converting Decimal to Binary ###

		function dec2bin(dec) {
			return (dec >>> 0).toString(2);
		}

### Converting Binary to Decimal ###

		function bin2dec(bin) {
			return parseInt(bin, 2).toString(10);
		}

## JS RegExp ##
1. Regular expression: sequence of characters that forms a search pattern
	1. search pattern: used for text search and text replace

### What Is a Regular Expression? ###
### Syntax ###
1. `/pattern/modifiers;`
	1. Example: `var patt = /w3schools/i;`
		1. `i` - case insensitive search

### Using String Methods ###
1. JS REs are used with string methods: `search()` and `replace()`
	1. `search()` returns position of the match
	2. `replace()` returns modified string where pattern is replaced

### Using String `search()` With a Regular Expression ###
1. Example: Case insensitive search for `w3schools` in a string

		var str = "Visit W3Schools";
		var n = str.search(/w3schools/i);

### Using String `search()` With String ###
1. Example: String as search argument

		var str = "Visit W3Schools!";
		var n = str.search("W3Schools");

### Using String `replace()` With a Regular Expression ###
1. Example: Replacement using case insensitive search

		var str = "Visit Microsoft!";
		var res = str.replace(/microsoft/i, "W3Schools");

### Using String `replace()` With a String ###
1. Example: Replacement using string

		var str = "Visit Microsoft!";
		var res = str.replace("Microsoft", "W3Schools");

### Did You Notice? ###
### Regular Expression Modifiers ###
1. `i` - case insensitive
2. `g` - global match (find all matches)
3. `m` - Perform multiline matching

### Regular Expression Patterns ###
1. Brackets: [...] - to find range of characters
	1. `[abc]` - Find any of the characters between brackets
	2. `[0-9]` - Find any of the digits between brackets
	3. `(x|y)` - Find alternatives separated by `|`
	4. `\d` - find a digit
	5. `\s` - find a whitespace character
	6. `\b` - find a match at the beginning or at the end of a word
	7. `\uxxxx` - find unicode character specified by the hexadecimal number xxxx
	8. `n+` - Matches a string that contains atleast 1 n
	9. `n*` - Matches a string that contains 0 or more occurrences of n
	10. `n?` - Matches any string that contains 0 or one occurrences of n

### Using the RegExp Object ###
1. Regular expression object has predefined properties and methods

### Using `test()` ###
1. `test()` - searches a string for a pattern and returns `true` if found or `false` otherwise
2. Example:

		var patt = /e/;
		patt.test('The best things in life are free!');

		/e/.test('The best things in life are free!');

### Using `exec()` ###
1. `exec()` - searches a string for a pattern and returns the text found
	1. If no match is found, it returns `null`

			/e/.exec("The best things in life are free!");

### Complete RegExp Reference ###
1. [Complete JavaScript RegExp Reference](https://www.w3schools.com/jsref/jsref_obj_regexp.asp)

## JS Errors ##
1. `try`, `catch`, `throw`, `finally`

### Errors Will Happen! ###
1. Example:

		<p id="demo"></p>

		<script>
			try {
				adddlert("Welcome guest!");
			} catch (err) {
				document.getElementById("demo").innerHTML = err.message;
			}
		</script>

### JavaScript try and catch ###
1. `try` defines a block of code to be tested for errors during execution
2. `catch` defines a block of code to be executed if an error occurs in try block
3. They come in pairs

		try {
			Block of code to try
		} catch (err) {
			Block of code to handle errors
		}

### JavaScript Throws Errors ###
1. When error occurs, JS will stop and generate an error message
2. An error object gets created with two properties: `name`, `message`

### The throw Statement ###
1. `throw` generates a custom error
	1. Exception can be String, Number, Boolean or Object

			throw "Too big";	// throw a text
			throw 500;			// throw a number

### Input Validation Example ###
1. Example:

		<!DOCTYPE html>
		<html>
			<body>
				<p>Please input a number between 5 and 10:</p>

				<input id="demo" type="text">
				<button type="button" onclick="myFunction()">Test Input</button>
				<p id="message"></p>

				<script>
					function myFunction() {
						var message, x;
						message = document.getElementById("message");
						message.innerHTML = "";
						x = document.getElementById("demo").value;
						try {
							if (x == "") throw "empty";
							if (isNaN(x)) throw "not a number";
							x = Number(x);
							if(x < 5) throw "too low";
							if(x > 10) throw "too high";
						} catch(err) {
							message.innerHTML = "Input is " + err;
						}
					}
				</script>
			</body>
		</html>

### HTML Validation ###
1. We can use validation rules defined in HTML attributes:

		<input id="demo" type="number" min="5" max="10" step="1">

### The finally Statement ###
1. `finally` executes code after try and catch irrespective of the results

		try {
			Block of code to try
		} catch (err) {
			Block of code to handle errors
		} finally {
			Block of code to be executed regardless of the try / catch result
		}

2. Example:

		...
		finally {
			document.getElementById('demo').innerHTML = '';
		}

### The Error Object ###
1. JS has built in error object when error occurs

### Error Object Properties ###
1. Properties of error object:
	1. name
	2. message

### Error Name Values ###
1. Six values returned by error name property
	1. `EvalError` - error has occured in `eval()` function
	2. `RangeError` - A number "out of range" has occurred
	3. `ReferenceError` - Illegal reference has occurred
	4. `SyntaxError` - Syntax error has occurred
	5. `TypeError` - Type error has occurred
	6. `URIError` - Error in `encodeURI()` has occurred

### Eval Error ###
1. Indicates an error in `eval()` function

### Range Error ###
1. Thrown when a number is outside the range of legal values
2. Example:

		var num = 1;
		try {
			num.toPrecision(500);	// A number cannot have 500 significant digits
		} catch(err) {
			document.getElementById('demo').innerHTML = err.name;
		}

### Reference Error ###
1. Thrown when a variable is referenced that has not been declared
2. Example:

		var x;
		try {
			x = y + 1;
		} catch (err) {
			document.getElementById('demo').innerHTML = err.name;
		}

### Syntax Error ###
1. Thrown when we try to evaluate code that has syntax error

		try {
			eval("alert('Hello')");		// Missing ' will produce an error
		} catch (err) {
			document.getElementById('demo').innerHTML = err.name;
		}

### Type Error ###
1. Thrown if value is outside the range of expected types

		var num = 1;
		try {
			num.toUpperCase();		// You cannot convert a number to upper case
		} catch (err) {
			document.getElementById('demo').innerHTML = err.name;
		}

### URI Error ###
1. Thrown if we use illegal characters in URI function
2. Example:

		try {
			decodeURI('%%%');	// You cannot URI decode these percent signs
		} catch (err) {
			document.getElementById('demo').innerHTML = err.name;
		}

### Non-Standard Error Object Properties ###
1. Mozilla and Microsoft specific
	1. `fileName` - Mozilla
	2. `lineNumber` - Mozilla
	3. `columnNumber` - Mozilla
	4. `stack` - Mozilla
	5. `description` - Microsoft
	6. `number` - Microsoft

## JS Debugging ##
### Code Debugging ###
1. There can be syntax errors and logical errors
2. Searching for and fixing errors in programming code is called code debugging

### JavaScript Debuggers ###
1. All modern browsers have built-in JS debugger
2. They can be turned on and off
3. We can also set breakpoints and examine values while code is executing
4. Activate debugging using F12 key and select "Console" in debugger menu

### The `console.log()` Method ###
1. `console.log()` - used to display JS values in debugger window
2. Example:

		<!DOCTYPE html>
		<html>
			<body>
				<h1>My Web Page</h1>

				<script>
					a = 5;
					b = 6;
					c = a + b;
					console.log(c);
				</script>
			</body>
		</html>

### Setting Breakpoints ###
1. At each breakpoint, JS will stop executing and lets us examine JS values
2. After examination, we can resume execution of code

### The debugger Keyword ###
1. `debugger` - stops execution of JS and calls (if available) the debugging function.
2. This has the same effect of breakpoint
3. Example:

		var x = 15 * 5;
		debugger;
		document.getElementById('demo').innerHTML = x;

### Major Browsers' Debugging Tools ###
1. Select 'Console' in debugger menu

### Chrome ###
1. Menu > Tools > developer tools > Console

### Firebox Firebug ###
1. `http://www.getfirebug.com` and install Firebug

### Internet Explorer ###
1. Menu > tools > developer tools > Console

### Opera ###
1. `http://dev.opera.com` > add Developer Console button to toolbar

### Safari Firebug ###
1. `http://safari-extensions.apple.com` - install firebug lite

### Safari Develop Menu ###
1. Safari > Preferences > Advanced
2. Check "Enable Show Develop menu in menu bar"
3. Choose "Show Error Console" in "Develop"

### Did You Know? ###
1. Debugging: Process of testing, finding, and reducing bugs (errors) in computer programs

## JS Hoisting ##
1. Logically moving declarations to the top

### JavaScript Declarations are Hoisted ###
1. In JS, a variable can be declared after it is used
2. Example:

		x = 5; // Assign 5 to x
		elem = document.getElementById('demo');	// Find an element
		elem.innerHTML = x;	// Display x in the element
		var x;	// Declare x

	1. Logically declarations are moved to the top of the current scope (top of current script or current function)

### JavaScript Initializations are Not Hoisted ###
1. Only declarations are hoisted not initializations
2. Example:

		var x = 5;	// Initialize x
	
		elem = document.getElementById('demo');	// Find an element
		elem.innerHTML = x + ' ' + y;	// Display x and y

		var y = 7;	// Initialize y

	1. `y` is undefined when displayed

### Declare Your Variables At the Top! ###
1. To avoid bugs, always declare all variables at the beginning of every scope
2. `"use strict"` - strict mode: does not allow variables to be used if they are not declared

## JS Strict Mode ##
1. `"use strict";` - defines that JS code should be executed in strict mode

### The "use strict" Directive ###
1. New in JS 1.8.5 (ECMAScript version 5)
2. It is a literal expression and is ignored by earlier versions of JS
3. Indicates that code should be executed in "strict mode"
	1. Cannot use undeclared variables
	2. Supported in
		1. IE 10
		2. Firefox 4
		3. Chrome 13
		4. Safari 5.1
		5. Opera 12

### Declaring Strict Mode ###
1. It has global scope
	1. All code in script will execute in strict mode

			"use strict";
			x = 3.14;		// This will cause an error because x is not declared

			myFunction();

			function myFunction() {
				y = 3.14;	// This will also cause an error because y is not declared
			}

2. If declared inside function it has local scope

		x = 3.14;		// This will not cause an error.
		myFunction();

		function myFunction() {
			"use strict";
			y = 3.14;		// This will cause an error
		}

### The "use strict"; Syntax ###
1. Syntax is compatible with older versions of JS
	1. Compiling a numberic literal or string literal in JS program has no side effects - compiles to non existing variable and dies

### Why Strict Mode? ###
1. Easier to write "secure" JS
2. Changes "bad syntax" into real errors
	1. Mistyping a variable name constructs a new variable - it is an error in strict mode
	2. No error feedback on assigning values to non-writeable properties
3. Strict mode:
	1. Error is thrown when:
		1. Assigning values to non-writable property
		2. Assigning values to Getter only property
		3. Assigning values to non-existing property
		4. Assigning values to non-existing variable
		5. Assigning values to non-existing object

### Not Allowed in Strict Mode ###
1. Using variable without declaring it
2. Using object without declaring it
3. Deleting a variable (or object)

		"use strict";
		var x = 3.14;
		delete x;		// This will cause an error
		
4. Deleting a function is not allowed

		"use strict";
		function x(p1, p2) {};
		delete x;		// This will cause an error

5. Duplicating a parameter name is not allowed

		"use strict";
		function x(p1, p1) {};		// This will cause an error

6. Octal numeric literals are not allowed

		"use strict";
		var x = 010;		// This will cause an error

7. Escape characters are not allowed

		"use strict";
		var x = \010;		// This will cause an error

8. Writing to a read-only property is not allowed

		"use strict";
		var obj = {};
		Object.defineProperty(obj, "x", {value: 0, writable: false});
		obj.x = 3.14;	// This will cause an error

9. Writing to a get-only property is not allowed

		"use strict";
		var obj = { get x() { return 0 } };
		obj.x = 3.14;		// This will cause an error

10. Deleting an undeletable property is not allowed

		"use strict";
		delete Object.prototype;	// This will cause an error

11. The string "eval" cannot be used as a variable

		"use strict";
		var eval = 3.14;	// This will cause an error

12. The string "arguments" cannot be used as a variable

		"use strict";
		var arguments = 3.14;	// This will cause an error

13. The with statement is not allowed:

		"use strict";
		with (Math) { x = cos(2) };	// This will cause an error

14. For security reasons, `eval()` is not allowed to build variable in the scope in which it was called:

		"use strict";
		eval ("var x = 2");
		alert (x);	// This will cause an error

15. `this` was global object in function calls like `f()` but it is undefined in strict mode

### Future Proof! ###
1. Future reserved keywords are not allowed in strict mode:
	1. `implements`
	2. `interface`
	3. `let`
	4. `package`
	5. `private`
	6. `protected`
	7. `public`
	8. `static`
	9. `yield`
2. Example:

		"use strict";
		var public = 1500;		// This will cause an error

### Watch Out! ###
1. `"use strict"` is recognized only at the beginning of script or function

## JS Style Guide ##
1. Always use same coding convention for all JS projects

### JavaScript Coding Conventions ###
1. Coding conventions - style guidelines for programming
	1. They cover:
		1. Naming and declaration rules for variables and functions
		2. Rules for the use of white space, indentation, and comments
		3. Programming practices and principles
	2. Secure quality:
		1. Improves code readability
		2. Makes code maintenance easier
2. They can be documented rules to follow or just individual coding practice
3. W3Schools code conventions

### Variable Names ###
1. **camelCase** of identifier names (variables and functions)
2. All names start with a letter
3. Examples:

		firstName = "John";
		lastName = "Doe";

		price = 19.90;
		tax = 0.20;

		fullPrice = price + (price * tax);

### Spaces Around Operators ###
1. Put spaces around operators and after commas

		var x = y + z;
		var values = ["Volvo", "Saab", "Fiat"];

### Code Indentation ###
1. Use 4 spaces for indentation of code blocks

		function toCelsius(fahrenheit) {
		    return (5 / 9) * (fahrenheit - 32);
		}

	1. Do not use tabs

### Statement Rules ###
1. Rules for simple statements:
	1. End a simple statement with a semicolon
	2. Examples:

			var values = ["Volvo", "Saab", "Fiat"];

			var person = {
			    firstName: "X",
			    lastName: "Y",
			    age: 50,
			    eyeColor: "blue"
			};

2. Rules for complex compound statements
	1. Put opening bracket at the end of first line
	2. Use one space before opening bracket
	3. Put closing bracket on new line, without leading spaces
	4. Do not end a complex statement with a semicolon
3. Examples:

		function toCelsius(fahrenheit) {
			return (5 / 9) * (fahrenheit - 32);
		}

		for (i = 0; i < 5; i++) {
			x += i;
		}

	1. Conditionals

			if (time < 20) {
				greeting = 'Good day';
			} else {
				greeting = 'Good evening';
			}

### Object Rules ###
1. General rules for object definitions
	1. Place opening bracket on same line as object name
	2. Colon plus one space between each property and its value
	3. Use quotes around string values, not around numeric values
	4. Do not add comma after last property-value pair
	5. Place closing bracket on new line without leading spaces
	6. End an object definition with a semicolon
2. Example:

		var person = {
			firstName: "X",
			lastName: "Y",
			age: 50,
			eyeColor: "blue"
		};

	1. Short objects can be written on one line

			var person = { firstName: "X", lastName: "Y", age: 50, eyeColor: "blue" };

### Line Length < 80 ###
1. Avoid lines longer than 80 characters
	1. Place to break a statement is after an operator or a comma

			document.getElementById('demo').innerHTML = 
				'Hello Dolly';

### Naming Conventions ###
1. Use same naming conventions for all code
	1. Variable and function names written in camelCase
	2. Global variables written in UPPERCASE (common)
	3. Constants written in UPPERCASE
2. Hyphens in HTML and CSS:
	1. `data-` (`data-quantity`, `data-price`)
	2. CSS uses hyphens in property-names (`font-size`)
3. JS: Don't use hyphens
4. Underscores:
	1. Used in SQL databases
	2. Used in PHP documentation
5. PascalCase:
	1. Preferred by C programmers
6. camelCase:
	1. Used by JS, jQuery, JS libraries
7. Don't start names with `$` - may conflict with JS library names 

### Loading JavaScript in HTML ###
1. External JS:

		<script src="myscript.js"></script>

### Accessing HTML Elements ###
1. Untidy HTML styles may result in JS errors

		var obj = getElementById('Demo');

		var obj = getElementById('demo');

	1. Can use same naming convention in HTML as in JS

### File Extensions ###
1. `.html` extension
2. `.css` extension
3. `.js` extension

### Use Lower Case File Names ###
1. Web servers usually are case sensitive about file names (Apache, Unix)
	1. `london.jpg` is not same as `London.jpg`
2. A few web servers are not case sensitive (Microsoft IIS)
3. Be consistent when using case (if migrating from one server to another small errors may break the website)
4. Solution: Always use lowercase filenames

### Performance ###
1. Indentations and extra spaces are not significant in small scripts.
2. Development: Prefer readability
3. Production: Should be minified

## JS Best Practices ##
1. Avoid global variables
2. Avoid new
3. Avoid `==`
4. Avoid `eval()`

### Avoid Global Variables ###
1. Minimize use of global variables
2. Includes all data types, objects, functions
	1. Global variables and functions can be overwritten by other scripts
3. Use local variables instead and use closures

### Always Declare Local Variables ###
1. All variables used in function should be declared as local variables
2. Declare local variables with `var` keyword (otherwise they become global variables)
	1. Strict mode does not allow undeclared variables

### Declarations on Top ###
1. Pull all declarations at the top of each script or function
2. Purpose:
	1. Cleaner code
	2. Single place to look for local variables
	3. Easier to avoid unwanted (implied) global variables
	4. Reduces possiblity of unwanted re-declarations
3. Example:

		// Declare at the beginning
		var firstName, lastName, price, discount, fullPrice;

		// Use later
		firstName = "John";
		lastName = "Doe";

		price = 19.90;
		discount = 0.10;

		fullPrice = price * 100 / discount;

	1. For loop variables also

			// Declare at the beginning
			var i;

			// use later
			for (i = 0; i < 5; i++) {
				// ...
			}

### Initialize Variables ###
1. Initialize when you declare them
	1. Cleaner code
	2. Single place to initialize variables
	3. Avoid undefined values

2. Examples:

		// Declare and initialize at the beginning
		var firstName = '',
			lastName = '',
			price = 0,
			discount = 0,
			fullPrice = 0,
			myArray = [],
			myObject = {};

	1. Gives an idea of intended use and intended data type

### Never Declare Number, String, or Boolean Objects ###
1. Treat numbers, strings, booleans as primitive types (not objects)
	1. Slows down execution speed if declared as objects and produces side effects
	2. Example:

			var x = 'John';
			var y = new String('John');
			(x === y) // is false because x is a string and y is an object.

### Don't Use new Object() ###
1. Use `{}` instead of `new Object()`
2. Use `''` instead of `new String()`
3. Use `0` instead of `new Number()`
4. Use `false` instead of `new Boolean()`
5. Use `[]` instead of `new Array()`
6. Use `/()/` instead of `new RegExp()`
7. Use `function () {}` instead of `new Function()`
8. Example:

		var x1 = {};
		var x2 = '';
		var x3 = 0;
		var x4 = false;
		var x5 = [];
		var x6 = /()/;
		var x7 = function () {}; 

### Beware of Automatic Type Conversions ###
1. Numbers can be converted into strings and NaN
	1. JS is loosely typed
	2. Variable can contain different data types
	3. Variable can change its data type
2. Example:

		var x = 5 + 7;	// x.valueOf() is 12, typeof x is a number
		var x = 5 + "7";	// x.valueOf() is 57, typeof x is a string
		var x = "5" + 7;	// x.valueOf() is 57, typeof x is a string
		var x = 5 - 7;		// x.valueOf() is -2, typeof x is a number
		var x = 5 - "7";	// x.valueOf() is -2, typeof x is a number
		var x = "5" - 7;	// x.valueOf() is -2, typeof x is a number
		var x = 5 - "x";	// x.valueOf() is NaN, typeof x is a number

3. Subtracting string from a string returns `NaN`

### Use === Comparison ###
1. `==` always converts (to matching types) before comparison
2. `===` forces comparison of values and type
3. Example:

		0 == '';	// true
		1 == '1';	// true
		1 == true;	// true

		0 === '';	// false
		1 === '1';	// false
		1 === true;	// false

### Use Parameter Defaults ###
1. If a function is called with missing argument, value of missing argument is `undefined`
	1. Undefined values can break the code
		1. Solution: Assign default values

				function myFunction(x, y) {
					if (y === undefined) {
						y = 0;
					}
				}

2. [Function Parameters](https://www.w3schools.com/js/js_function_parameters.asp)

### End Your Switches with Defaults ###
1. Always end switch statement with a default
2. Example:

		switch (new Date().getDay()) {
			case 0:
				day = "Sunday";
				break;
			case 1:
				day = "Monday";
				break;
			case 2:
				day = "Tuesday";
				break;
			case 3:
				day = "Wednesday";
				break;
			case 4:
				day = "Thursday";
				break;
			case 5:
				day = "Friday";
				break;
			case 6:
				day = "Saturday";
				break;
			default:
				day = "Unknown";
		}

### Avoid Using `eval()` ###
1. `eval()` **(M)** - used to run text as code
	1. It can run arbitrary code
	2. Security problem

## JS Mistakes ##
### Accidentally Using the Assignment Operator ###
1. JS programs may generate unexpected results if a programmer accidentally uses an assignment operator (=) instead of comparison
2. Example:

		var x = 0;
		if (x = 10)	// returns true

		if (x = 0)	// returns false

	1. Assignment always returns value of the assignment

### Expecting Loose Comparison ###
1. In strict comparison, data type matters
	1. Switch statements use strict comparison

			var x = 10;
			switch(x) {
				case "10": alert("Hello");		// Does not display the alert
			}

### Confusing Addition & Concatenation ###
1. `+` is used for both addition and concatenation

### Misunderstanding Floats ###
1. Programming languages have difficulties with precise floating point values

		var x = 0.1;
		var y = 0.2;
		var z = x + y;		// result in z will not be 0.3

2. Multiply and divide by 10 to resolve the issue

		var z = (x * 10 + y * 10) / 10;		// z will be 0.3

### Breaking a JavaScript String ###
1. JS allows breaking statement into two lines:

		var x =
		"Hello World!";

2. Do not break in the middle of a string
3. Use `\` to break a statement in a string

### Misplacing Semicolon ###
1. Example:

		if (x == 19);
		{
			// code block will execute no matter what
		}

### Breaking a Return Statement ###
1. Default behavior: closes statement at the end of a line

		function myFunction(a) {
			var power = 10
			return a * power
		}

### Explanation ###
1. If a statement is incomplete like `var` JS will try to complete the statement by reading the next line

### Accessing Arrays with Named Indexes ###
1. JS does not support arrays with named indexes (like hashes)
2. Arrays always use numbered indexes

		var person = [];
		person[0] = 'X';
		person[1] = 'Y';
		person[2] = 46;
		var x = person.length;		// person.length will return 3
		var y = person[0];			// person[0] will return 'John'

3. In JS, objects are named indexes
	1. If we use named index when accessing array, JS will redefine array to a standard object

			var person = [];
			person['firstName'] = 'John';
			person['lastName'] = 'Doe';
			person['age'] = x;
			var x = person.length;		// person.length will return 0
			var y = person[0];			// person[0] will return undefined

### Ending Definitions with a Comma ###
1. Trailing commas in object and array are legal in ES5

		person = { firstName: 'John', lastName: 'Doe', age: x, }
		points = [40, 100, 1, 5, 25, 10, ];

	1. `IE8` will crash because JSON does not allow trailing commas

### Undefined is Not Null ###
1. `null` is for objects
	1. An object has to be defined first for `null` or else it is undefined
2. `undefined` is for variables, properties and methods
3. To check if an object exists:

		if (myObj !== null && typeof myObj !== 'undefined')	// throws an error

		if (myObj !== 'undefined' && myObj !== null)

### Expecting Block Level Scope ###
1. JS does not construct a new scope for each code block

		for (var i = 0; i < 10; i++) {
			// some code
		}
		return i;	// visible outside code block

## JS Performance ##
1. How to speed up JS code

### Reduce Activity in Loops ###
1. Statements or assignments placed outside loop will make loop run faster

		// bad code - accesses length of array each time loop is iterated
		var i;
		for (i = 0; i < arr.length; i++)

		// better code
		var i;
		var l = arr.length;
		for (i = 0; i < l; i++)

### Reduce DOM Access ###
1. JS statements accessing HTML DOM is very slow compared to other statements
2. Solution: If accessing DOM element many times, store it in local variable

		var obj;
		obj = document.getElementById('demo');
		obj.innerHTML = 'Hello';

### Reduce DOM Size ###
1. Keep number of HTML elements in DOM small
	1. Improves page loading
	2. Speeds up rendering (page display) - especially on smaller devices
	3. Attempt to search DOM benefits from smaller DOM (`getElementsByTagName`)

### Avoid Unnecessary Variables ###
1. Do not have new variables which do not save values

		// bad code
		var fullName = firstName + ' ' + lastName;
		document.getElementById('demo').innerHTML = fullName;

		// good code
		document.getElementById('demo').innerHTML = firstName + ' ' + lastName;

### Delay JavaScript Loading ###
1. Putting script at the bottom of page body lets browser load page first
	1. While script is downloading, browser will not start any other downloads
	2. While script is downloading, parsing and rendering activity might be blocked
		1. HTML spec says browsers should not download more than two components in parallel
	3. Alternative `defer='true'` can be used in script tag
		1. The script will be executed after page has finished parsing (only for external scripts)
	4. Alternative: add script by code after page has loaded

			<script>
				window.onload = function () {
					var element = document.createElement('script');
					element.src = 'myscript.js';
					document.body.appendChild(element);
				}
			</script>

### Avoiding Using with ###
1. `with` has negative effect on speed and clutters up JS scopes
	1. Not allowed in strict mode

## JS Reserved Words ##
### JavaScript Reserved Words ###
1. Words which cannot be used as variables, labels, or function names
	1. abstract
	2. arguments
	3. await*
	4. boolean
	5. break
	6. byte
	7. case
	8. catch
	9. char
	10. class*
	11. const
	12. continue
	13. debugger
	14. default
	15. delete
	16. do
	17. double
	18. else
	19. enum*
	20. eval
	21. export*
	22. extends*
	23. false
	24. final
	25. finally
	26. float
	27. for
	28. function
	29. goto
	30. if
	31. implements
	32. import*
	33. in
	34. instanceof
	35. int
	36. interface
	37. let*
	38. long
	39. native
	40. new
	41. null
	42. package
	43. private
	44. protected
	45. public
	46. return
	47. short
	48. static
	49. super*
	50. switch
	51. synchronized
	52. this
	53. throw
	54. throws
	55. transient
	56. true
	57. try
	58. typeof
	59. var
	60. void
	61. volatile
	62. while
	63. with
	64. yield

### Removed Reserved Words ###
1. Removed from ES5/6
	1. abstract
	2. boolean
	3. byte
	4. char
	5. double
	6. final
	7. float
	8. goto
	9. int
	10. long
	11. native
	12. short
	13. synchronized
	14. throws
	15. transient
	16. volatile
2. ES5/6 does not have full support in all browsers

### JavaScript Objects, Properties, and Methods ###
1. Built in objects, properties and methods
	1. Array
	2. Date
	3. eval
	4. function
	5. hasOwnProperty
	6. Infinity
	7. isFinite
	8. inNaN
	9. isPrototypeOf
	10. length
	11. Math
	12. NaN
	13. name
	14. Number
	15. Object
	16. prototype
	17. String
	18. toString
	19. undefined
	20. valueOf

### Java Reserved Words ###
1. JS is usually used with Java.
2. Avoid some Java objects and properties as JS ids
	1. `getClass`
	2. `java`
	3. `JavaArray`
	4. `javaClass`
	5. `JavaObject`
	6. `JavaPackage`

### Other Reserved Words ###
1. Avoid the following HTML and Window objects names and properties:
	1. alert
	2. all
	3. anchor
	4. anchors
	5. area
	6. assign
	7. blur
	8. button
	9. checkbox
	10. clearInterval
	11. clearTimeout
	12. clientInformation
	13. close
	14. closed
	15. confirm
	16. constructor
	17. crypto
	18. decodeURI
	19. decodeURIComponent
	20. defaultStatus
	21. document
	22. element
	23. elements
	24. embed
	25. embeds
	26. encodeURI
	27. encodeURIComponent
	28. escape
	29. event
	30. fileUpload
	31. focus
	32. form
	33. forms
	34. frame
	35. innerHeight
	36. innerWidth
	37. layer
	38. layers
	39. link
	40. location
	41. mimeTypes
	42. navigate
	43. navigator
	44. frames
	45. frameRate
	46. hidden
	47. history
	48. image
	49. images
	50. offscreenBuffering
	51. open
	52. opener
	53. option
	54. outerHeight
	55. outerWidth
	56. packages
	57. pageXOffset
	58. pageYOffset
	59. parent
	60. parseFloat
	61. parseInt
	62. password
	63. pkcs11
	64. plugin
	65. prompt
	66. propertyIsEnum
	67. radio
	68. reset
	69. screenX
	70. screenY
	71. scroll
	72. secure
	73. select
	74. self
	75. setInterval
	76. setTimeout
	77. status
	78. submit
	79. taint
	80. text
	81. textarea
	82. top
	83. unescape
	84. untaint
	85. window

### HTML Event Handlers ###
1. Avoid using names of HTML event handlers
	1. `onblur`
	2. `onclick`
	3. `onerror`
	4. `onfocus`
	5. `onkeydown`
	6. `onkeypress`
	7. `onkeyup`
	8. `onmouseover`
	9. `onload`
	10. `onmouseup`
	11. `onmousedown`
	12. `onsubmit`

## JS Versions ##
1. Invented by Brendan Eich in 1995
2. ECMAScript is official name of JS

### ECMAScript Editions ###
1. ES1 - First edition
2. ES2 - Editorial changes only
3. ES3 - Added REs, added try/catch
4. ES4 - Never released
5. ES5 - Added "strict mode", Added JSON support
6. ES5.1 - Editorial changes
7. ES6 - Added classes and modules
8. ES7 - Added exponential operator (**), Added Array.prototype.includes

### Browser Support ###
1. ES3, ES5 - supported fully in all modern browsers
	1. IE-9 does not support ES5 "use strict"
2. ES6 - Partially supported in all modern browsers
3. ES7 - Poorly supported in all browsers

### ECMAScript Browser Implementations ###
1. V8 - Chrome (Partial Support for ES6)
2. SpiderMonkey - Firefox (Partial Support for ES6)
3. Chakra - Edge (Partial support for ES6)
4. Nitro - Safari (Partial support for ES6)
5. V8 - Opera (Partial Support for ES6)
6. V8 - Chrome 23 (Full support for ES5)
7. SpiderMonkey - Firefox 21 (Full support for ES5)
8. JavaScript 1.8.5 - Firefox 4 (Full support for ES5)
9. Nitro - Safari 6 (Full support for ES5)
10. V8 - Opera 15 (Full support for ES5)
11. Chakra - Edge 12 (Full support for ES5)
12. Chakra - IE 10 (Full support for ES5)

### JavaScript/ ECMAScript/ JScript ###
1. JS was developed for Netscape.
	1. First browser to run JS was Netscape 2 in 1996
	2. Mozilla developed JS for Firefox browser
	3. JS versions run from 1.0 to 1.8
2. ECMAScript
	1. Developed by ECMA International after organization adoped JS
	2. Verisons run from 1 to 7
3. JScript
	1. Developed by Microsoft as compatible JS language for IE.
	2. Version numbers run from 1.0 to 9.0

## JS JSON ##
1. JSON - format for storing and transporting data
	1. Used when sending data from server to webpage

### What is JSON? ###
1. JSON
	1. JavaScript Object Notation
	2. It is lightweight data interchange format
	3. It is language independent
	4. It is self describing and easy to understand
2. Derived from JavaScript object notation syntax but text only
3. Code for reading or generating JSON data can be written in any language

### JSON Example ###
1. Example:

		{
			"employees": [
				{"firstName": "John", "lastName": "Doe"},
				{"firstName": "Anna", "lastName": "Smith"},
				{"firstName": "Peter", "lastName": "Jones"}
			]
		}

### The JSON Format Evaluates to JavaScript Objects ###
1. JSON is syntactially identical to code for JS objects
2. JS program can easily convert JSON data to native JS objects

### JSON Syntax Rules ###
1. Data is in name/value pairs
2. Data is separated by commas
3. Curly braces hold objects
4. Square brackets hold arrays

### JSON Data - A Name and a Value ###
1. JSON data is written as name/value pairs (Just like JS object properties)
2. name/value pair consists of field name (in double quotes) followed by colon, followed by a value

		"firstName": "John"

	1. JSON names require double quotes but JS names do not

### JSON Objects ###
1. Written in curly braces
2. Can contain multiple name/value pairs

### JSON Arrays ###
1. Written inside brackets
2. Can contain objects
3. Example:

		"employees": [
			{"firstName": "John", "lastName": "Doe"},
			{"firstName": "Anna", "lastName": "Smith"},
			{"firstName": "Peter", "lastName": "Jones"}
		]

### Converting a JSON Text to a JavaScript Object ###
1. Common use of JSON is
	1. Read data from web server and display data in web page
2. Example:

		var text = '{ "employees" : [' +
		'{ "firstName": "John", "lastName": "Doe" },' +
		'{ "firstName": "Anna", "lastName": "Smith" },' +
		'{ "firstName": "Peter", "lastName": "Jones" }' +
		']}'

	1. Use `JSON.parse()` built in function to convert text to JS object

			var obj = JSON.parse(text);

	2. Use the JS object in the page

			<p id="demo"></p>

			<script>
				document.getElementById('demo').innerHTML = obj.employees[1].firstName + ' ' + obj.employees[1].lastName;
			</script>

# JS Forms #
## JS Forms ##
### JavaScript Form Validation ###
1. HTML form validation can be done by JS
2. Example: If a form field is empty (fname) function alerts a message and returns false to prevent form from being submitted

		function validateForm() {
			var x = document.forms["myForm"]["fname"].value;
			if (x == '') {
				alert("Name must be filled out");
				return false;
			}
		}

	1. Function can be called when the form is submitted:

			<form name="myForm" action="/action_page_post.php" onsubmit="return validateForm()" method="post">
				Name: <input type="text" name="fname">
				<input type="submit" value="submit">
			</form>

### JavaScript Can Validate Numeric Input ###
1. JS is used to validate numeric input

### Automatic HTML Form Validation ###
1. It can be automatically performed by the browser

		<form action="/action_page_post.php" method="post">
			<input type="text" name="fname" required>
			<input type="submit" value="Submit">
		</form>

	1. Does not work in IE 9 or earlier

### Data Validation ###
1. It is a process to ensure that user input is clean, correct and useful
2. Validation tasks:
	1. Has user filled in all required fields?
	2. Has user entered a valid date?
	3. Has user entered text in a numeric field?
3. Different ways of implementing validation:
	1. Server side validation: performed on web server, after input is sent to server
	2. Client side validation: performed on web browser, before input is sent to web server 

### HTML Constraint Validation ###
1. constraint validation: Introduced in new HTML
2. It is based on:
	1. Constraint validation **HTML Input Attributes**
	2. Constraint validation **CSS Pseudo Selectors**
	3. Constraint validation **DOM Properties and Methods**

### Constraint Validation HTML Input Attributes ###
1. `disabled` - Specifies that input element should be disabled
2. `max` - Specifies maximum value of an input element
3. `min` - Specifies minimum value of an input element
4. `pattern` - Specifies value pattern of input element

		<form class="" action="index.html" method="post">
			<input type="text" id="numb1" pattern="[0-9]+">
			<input type="submit">
		</form>

5. `required` - Specifies that input field requires an element
6. `type` - Specifies type of input element

### Constraint Validation CSS Pseudo Selectors ###
1. `:disabled` - selects input elements with `disabled` attribute specified
2. `:invalid` - selects input elements with invalid values
3. `:optional` - selects input elements with no "required" attribute specified
4. `:required` - selects input elements with the "required" attribute specified
5. `:valid` - selects input elements with valid values

## Forms API ##
### Constraint Validation DOM Methods ###
1. `checkValidity()` **(M)** - Returns true if an input element contains valid data
2. `setCustomValidity()` **(M)** - Sets `validationMessage` property of an input element
3. Example:

		<input id="id1" type="number" min="100" max="300" required>
		<button onclick="myFunction()">OK</button>

		<p id="demo"></p>

		<script>
			function myFunction() {
				var inpObj = document.getElementById("id1");
				if (inpObj.checkValidity() === false) {
					document.getElementById('demo').innerHTML = inpObj.validationMessage;
				}
			}
		</script>

### Constraint Validation DOM Properties ###
1. `validity` - contains boolean properties related to validity of an input element
2. `validationMessage` - contains message a browser will display when validity is false
3. `willValidate` - indicates if an input element will be validated

### Validity Properties ###
1. `validity` contains properties related to validity of data:
	1. `customError` - `true` if custom validity message is set
	2. `patternMismatch` - `true` if an element's value does not match its pattern attribute
	3. `rangeOverflow` - `true` if an element's value is greater than its max attribute
	4. `rangeUnderflow` - `true` if an element's value is less than its min attribute
	5. `stepMismatch` - `true` if an element's value is invalid per its step attribute
	6. `tooLong` - `true` if an element's value exceeds its `maxLength` attribute
	7. `typeMismatch` - `true` if an element's value is invalid per its type attribute
	8. `valueMissing` - `true` if an element (with a required attribute) has no value
	9. `valid` - `true` if an element's value is valid 

### Examples ###
1. `rangeOverflow` property:

		<input id="id1" type="number" max="100">
		<button onclick="myFunction()">OK</button>

		<p id="demo"></p>

		<script>
			function myFunction() {
				var txt = '';
				if (document.getElementById('id1').validity.rangeOverflow) {
					txt = "Value too large";
				}
				document.getElementById('demo').innerHTML = txt;
			}
		</script>

2. `rangeUnderflow` property:

		<input id="id1" type="number" min="100">
		<button onclick="myFunction()">Okay</button>

		<p id="demo"></p>

		<script>
			function myFunction() {
				var txt = '';
				if (document.getElementById('id1').validity.rangeUnderflow) {
					txt = "Value too small";
				}
				document.getElementById('demo').innerHTML = txt;
			}
		</script>

# JS Objects #
## Object Definitions ##
1. In JS almost everything is an object
	1. Booleans can be objects (if defined with `new`)
	2. Numbers can be objects (if defined with `new`)
	3. Strings can be objects (if defined with `new`)
	4. Dates are always objects
	5. Maths are always objects
	6. Regular expressions are always objects
	7. Arrays are always objects
	8. Functions are always objects
	9. Objects are always objects
2. All JS values except primitives are objects

### JavaScript Primitives ###
1. **primitive values** have no properties or methods
2. **primitive data type** is data that has primitive value
3. JS defines 5 types of primitive data types:
	1. string
	2. number
	3. boolean
	4. null
	5. undefined
4. Primitive values are immutable (hardcoded and cannot be changed)

### Objects are Variables Containing Variables ###
1. JS variables can have single values
2. JS objects can contain many values

		var person = { firstName: "John", lastName: "Doe", age: 50, eyeColor: "blue" };

### Object Properties ###
1. Named values are called properties
2. Similar to
	1. Associative arrays in PHP
	2. Dictionaries in Python
	3. Hash tables in C
	4. Hash maps in Java
	5. Hashes in Ruby and Perl

### Object Methods ###
1. Methods are actions that can be performed on objects
2. Properties: primitive values, other objects, functions
3. Method: property containing function definition

### Creation of JavaScript Object ###
1. Ways for creation of objects
	1. single object using object literal
	2. single object with the keyword new
	3. object constructor and then initiate an object of constructed type
	4. `Object.create()` (ES5)

### Using an Object Literal ###
1. An object gets defined and created with one statement
2. Object literal: list of name/value pairs inside `{}`
3. Example:

		var person = {
			firstName: 'John',
			lastName: 'Doe',
			age: x,
			eyeColor: 'whatever'
		};

### Using the JavaScript Keyword `new` ###
1. Using `new`

		var person = new Object();	// not so readable
		person.firstName = 'John';
		person.secondName = 'Doe';
		person.age = x;
		person.eyeColor = 'whatever';

### Using an Object Constructor ###
1. For creation of many objects of one type:
	1. First we need object type - done using object constructor function

			function person(first, last, age, eye) {
				this.firstName = first;
				this.lastName = last;
				this.age = age;
				this.eyeColor = eye;
			}

			var aFather = new person('John', 'Doe', 50, 'blue');
			var aMother = new person('Sally', 'Rally', 48, 'green');

### The `this` Keyword ###
1. `this` is the object that owns the JS code
	1. If used inside function, it is the value of object that owns the function
	2. If used inside an object, it is the object itself
	3. It is a substitute for new object inside object constructor
2. We cannot change the value of `this`

### Build-in JavaScript Constructors ###
1. `new` cannot be used on `Math` because it is a global object

### Did You Know? ###
1. Primitive values execute much faster than objects
2. Use literals instead of `new`

### String Objects ###
1. Strings can also be created using `new`

		firstName = new String('John');

### Number Objects ###
1. Numbers can be created as object using `new`
	
		var x = new Number(123);

### Boolean Objects ###
1. Booleans can be created as objects using `new`

		var x = new Boolean(false);

### JavaScript Objects are Mutable ###
1. Objects are mutable
2. They are addressed by reference

		var x = person;		// This will not construct a new copy of person.

	1. Changes to `x` will change `person`

			var x = person;
			x.age = 10;		// This will change both x.age and person.age

3. JS variables are not mutable but only JS objects

## Object Properties ##
1. Properties are part of JS object

### JavaScript Properties ###
1. JS object is a collection of unordered properties
2. Properties can usually be added, changed, deleted but some are read only

### Accessing JavaScript Properties ###
1. Syntax for accessing property of an object
	1. `objectName.property	// person.age`
	2. `objectName['property']	// person['age']`
	3. `objectName[expression]	// x = 'age'; person[x]` - expression must evaluate to a property name

### JavaScript for...in Loop ###
1. `for...in` loops through properties of an object
2. Syntax:

		for (variable in object) {
			code to be executed
		}

	1. Example:

			var person = { fname: 'John', lname: 'Doe', age: x };
			
			for (x in person) {
				txt += person[x];
			}


### Adding New Properties ###
1. A new property can be added by giving it a value
2. Assuming `person` object exists:

		person.nationality = 'English';

### Deleting Properties ###
1. `delete` keyword deletes property from an object - deletes both value and property
	1. `delete` has no effect on variables and functions
	2. Must not be used on pre-defined JS object properties - may crash app
2. Example:

		delete person.age;	// or delete person['age'];

### Property Attributes ###
1. Value of a property is one of it's attributes
	1. Other attributes of a property:
		1. `enumerable`
		2. `configurable`
		3. `writable` (is it readable?, is it writeable?)
			1. Allows only value attribute to be changed if the property is writable
2. ES5 has methods for getting and setting property attributes

### Prototype Properties ###
1. JS objects inherit the properties of their prototype
2. `delete` does not delete inherited properties
	1. If we delete prototype property, it will affect all objects inherited from the prototype

## Object Methods ##
### JavaScript Methods ###
1. Methods: actions that can be performed on objects
	1. Method: it is a property containing function definition

### Accessing Object Methods ###
1. Syntax:

		methodName: function () { code lines }
		objectName.methodName()

2. Example: If `fullName` is property and `fullName()` is a method

		name = person.fullName();	// executes the function
		name = person.fullName;		// returns definition of the function

### Using Built-In Methods ###
1. `toUpperCase()` - built in method of String object

		var message = "Hello world!";
		var x = message.toUpperCase();

### Adding New Methods ###
1. Adding methods is done inside constructor function:

		function person(firstName, lastName, age, eyeColor) {
			this.firstName = firstName;
			this.lastName = lastName;
			this.age = age;
			this.eyeColor = eyeColor;
			this.changeName = function (name) {
				this.lastName = name;
			};
		}

	1. `this` is substituted with the new object created using the constructor function

## Object Prototypes ##
1. Every JS object has a prototype.
	1. Prototype is also an object
	2. All JS objects inherit their properties and methods from their prototype

### JavaScript Prototypes ###
1. Objects created using object literal or using `new Object()` inherit from prototype called `Object.prototype` (It is on top of the prototype chain)
2. Objects created from `new Date()` inherit from `Date.prototype`
3. All JS objects (Date, Array, RegExp, Function, ...) inherit from `Object.prototype`

### Creation of Prototype ###
1. Use object constructor function

		function Person(first, last, age, eyecolor) {
			this.firstName = first;
			this.lastName = last;
			this.age = age;
			this.eyeColor = eyecolor;
		}

	1. `new` can be used for creation of objects from same prototype
	2. Constructor function is the prototype for Person objects

### Adding Properties and Methods to Objects ###
1. To add new properties or methods to existing object
2. To add new properties or methods to all existing objects of a given type
3. To add new properties or methods to an object prototype

### Adding a Property to an Object ###
1. Example:

		father.nationality = "English";	// new property added only to father and not to mother object or any other Person object

### Adding a Method to an Object ###
1. Example:

		father.name = function () {
			return this.firstName + " " + this.lastName;
		};

### Adding Properties to a Prototype ###
1. We cannot add new properties to Prototype as we add for objects because prototype is not an existing object

		Person.nationality = "English";		// Does not work

2. To add property to a prototype, add it to the constructor function

		function Person(first, last, age, eyecolor) {
			this.firstName = first;
			this.lastName = last;
			this.age = age;
			this.eyeColor = eyecolor;
			this.nationality = "English";
		}

	1. Prototype properties can have prototype values (default values)

### Adding Methods to a Prototype ###
1. Methods must be added to constructor function

		function Person(first, last, age, eyecolor) {
			this.firstName = first;
			this.lastName = last;
			this.age = age;
			this.eyeColor = eyecolor;
			this.name = function () { return this.firstName + " " + this.lastName; };
		}

### Using the `prototype` Prototype ###
1. `prototype` property allows us to add new properties to an existing prototype

		function Person(first, last, age, eyecolor) {
			this.firstName = first;
			this.lastName = last;
			this.age = age;
			this.eyeColor = eyecolor;
		}

		Person.prototype.nationality = "English";

2. Adding new methods to prototype:

		Person.prototype.name = function () {
			return this.firstName + ' ' + this.lastName;
		};

	1. Modify only own prototypes but not standard JS objects

# JS Functions #
## Function Definitions ##
1. Defined with `function` keyword
2. There are two types of functions definitions:
	1. Function declarations
	2. Function expressions

### Function Declarations ###
1. Syntax:

		function functionName(prameters) {
			code to be executed
		}

	1. Not executed immediately but saved for later use when invoked (called)

### Function Expressions ###
1. Function expression can be stored in a variable

		var x = function (a, b) { return a * b; };	// Anonymous function but invoked using variable name

		var z = x(4, 3);		// Used as a function

	1. `;` is used because it is part of an executable statement

### The `Function()` Constructor ###
1. `new Function(<parameters>, <definition>);` **(M)**
2. Example:

		var myFunction = new Function("a", "b", "return a * b");
		var x = myFunction(4, 3);

	1. Avoid `new` in JS most of the time

### Function Hoisting ###
1. Functions are also hoisted to the top of current scope
	1. They can be invoked before they are declared

			myFunction(5);

			function myFunction(y) {
				return y * y;
			}

### Self-Invoking Functions ###
1. Function expression executes automatically if expression is followed by `()`
	1. Function declaration cannot be self invoked
2. Add Parantheses around function expression to indicate that it is a function expression and not function declaration
3. Example:

		(function () {
			var x = "Hello!!";		// I can invoke myself
		})();

### Functions Can Be used as Values ###
1. Can be used as values:

		function myFunction(a, b) {
			return a * b;
		}

		var x = myFunction(4, 3);

2. Can be used in expressions

		function myFunction(a, b) {
			return a * b;
		}

		var x = myFunction(4, 3) * 2;

### Functions are Objects ###
1. `typeof` will return `"function"` for functions
2. Functions have both properties and methods
	1. `arguments.length` - returns number of arguments passed to the function when it was invoked

			function myFunction(a, b) {
				return arguments.length;
			}

3. `toString()` returns function as a string

		function myFunction(a, b) {
			return a * b;
		}

		var txt = myFunction.toString();

4. Method: function defined as a property to an object
5. Object constructor: function defined for creation of objects

## Function Parameters ##
1. JS function does not perform any checking on parameter values

### Function Parameters and Arguments ###
1. Parameters: names listed in function definition
2. Arguments: values passed to function

### Parameter Rules ###
1. Function definitions do not specify data types for parameters
2. Functions do not perform type checking on passed arguments
3. Functions do not check the number of arguments received

### Parameter Defaults ###
1. If function is called with missing arguments (less than declared), missing values are set to `undefined`
	1. To set default values:

			function myFunction(x, y) {
				if (y === undefined) {
					y = 0;
				}
				// ...
			}

	2. If a function is called with too many arguments, the arguments can be reached using arguments object

### The Arguments Object ###
1. `arguments` object is a built-in object of functions
	1. It contains an array of arguments used when function was called
2. Example: Finding maximum value from a list of numbers:

		x = findMax(1, 123, 500, 115, 44, 88);

		function findMax() {
			var i;
			var max = -Infinity;
			for (i = 0; i < arguments.length; i++) {
				if (arguments[i] > max) {
					max = arguments[i];
				}
			}
			return max;
		}

2. Example: Sum all input values:

		x = sumAll(1, 123, 500, 115, 44, 88);

		function sumAll() {
			var sum = 0;
			for (n in arguments) {
				sum += arguments[n];
			}
			return sum;
		}

### Arguments are Passed by Value ###
1. JS arguments are passed by value.
	1. Function knows only value and not argument's location
	2. If value is changed, original parameter's value does not change
2. Changes to arguments are not reflected outside the function

### Objects are Passed by Reference ###
1. Object references are values
	1. If function changes object property, it changes original value of the property
2. Changes to object properties are visible (reflected) outside the function

## Function Invocation ##
1. Code in JS function gets executed when something invokes it.

### Invoking a JavaScript Function ###
1. Code inside function is not executed when it is defined
2. Other terms used: call upon a function, start a function, execute a function
	1. Invocation: a JS function can be invoked without being called

### Invoking a Function as a Function ###
1. Example:

		function myFunction(a, b) {
			return a * b;
		}

		myFunction(10, 2);		// Will return 20

	1. The function does not belong to any object but to default global object (In JS there is a default global object)
		1. In HTML default global object is HTML page itself - the above function belongs to the HTML page
		2. In browser, page object is `window` - function becomes a window function

				window.myFunction(10, 2);	// same as myFunction(10, 2);

			1. Not a good practice
				1. Global variables, methods, or functions can easily result in name conflicts and bugs in global object

### The `this` Keyword ###
1. `this` is an object that owns the current code
	1. If used inside a function, it is the object that owns the function
	2. The value of `this` cannot be changed since it is not a variable

### The Global Object ###
1. If a function is called without owner object, the value of `this` is global object
2. In web browser, global object is browser window
3. Example: Returning window object

		function myFunction() {
			return this;
		}

		console.log(myFunction());

### Invoking a Function as a Method ###
1. Functions can be object methods

		var myObject = {
			firstName: "John",
			lastName: "Doe",
			fullName = function () {
				return this.firstName + " " + this.lastName;
			}
		}
		myObject.fullName();

	1. `this` is `myObject`
		1. Output the value of `this` to confirm

				...
				returnThis = function () {
					return this;
				}

### Invoking a Function with a Function Constructor ###
1. If function invocation is with `new` keyword, it is a function constructor

		// This is a function constructor
		function myFunction(arg1, arg2) {
			this.firstName = arg1;
			this.lastName = arg2;
		}

		// This constructs a new object
		var x = new myFunction("John", "Doe");
		x.firstName;		// Will return "John"

	1. New object inherits properties and methods from constructor
	2. `this` will be the new object created when function is invoked

## Function Call ##
### Functions are Object Methods ###
1. All JS functions are object methods
	1. If function is not a method of a JS object, it is a method of global object

### The JavaScript `call()` Method ###
1. `call()`: predefined JS function method
	1. It can be used to invoke a function with owner object as first argument
	2. Example:

			var person = {
				firstName: "John",
				lastName: "Doe",
				fullName: function() {
					return this.firstName + " " + this.lastName;
				}
			}

			var myObject = {
				firstName: "Mary",
				lastNaem: "Doe"
			}

			person.fullName.call(myObject);		// Will return "Mary Doe"

## Function Apply ##
### The JavaScript `apply()` Method ###
1. `apply()`: Similar to `call()` method:

		var person = {
			firstName: "John",
			lastName: "Doe",
			fullName: function () {
				return this.firstName + " " + this.lastName;
			}
		};

		var myObject = {
			firstName: "Mary",
			lastName: "Doe",
		};

		person.fullName.apply(myObject);		// Will return "Mary Doe"

### The Difference Between `call()` and `apply()` ###
1. `call()`: Takes function arguments separately
2. `apply()`: Takes function arguments as an array
	1. Example: To get maximum value from an array

			Math.max.apply(null, [1, 2, 3]);	// Will return 3

### The Value of `this` ### (?)
1. In strict mode, `this` becomes the first argument of a function even if argument is not an object
2. In non-strict mode, if first argument is `null` or `undefined`, it is replaced with global object

## Function Closures ##
1. JS variables can belong to either local or global scope
2. Global variables can be made local (private) with closures

### Global Variables ###
1. A function can access variables inside it (local scope)

		function myFunction() {
			var a = 4;
			return a * a;
		}

2. A function can also access variables defined outside it

		var a = 4;		// global variable
		function myFunction() {
			return a * a;
		}

	1. In web page, global variables belong to window object
	2. They can be used and changed by all scripts in the page (in window as well)
	3. local variable can only be used inside the function in which it is defined
		1. It is hidden from other functions and other scripting code
	4. Global and local variables with same name are different and modifying one does not affect the other
		1. Variables created without using var 

### Variable Lifetime ###
1. Global variables live as long as application lives (window, web page)
2. local variables have short lives
	1. Deleted when function is finished

### A Counter Dilemma ###
1. Requirement: If we want a counter variable for counting and should be available to all functions
2. Solution 1: Global variable `counter` and functions to increment the variable

		var counter = 0;

		function add() {
			counter += 1;
		}

		add();
		add();
		add();

		// the counter is not equal to 3

	1. `counter` should be changed only by `add` function
	2. Problem: any script on the page can change `counter` without calling `add()`
	3. If `counter` is declared inside the function, nobody will be able to change it but by calling `add()`

			function add() {
				var counter = 0;
				counter += 1;
			}

			add();
			add();
			add();

			// the counter should be 3 but it does not work

### JavaScript Nested Functions ###
1. All functions have access to global scope
2. All functions have access to scope above them
3. JS supports nested functions
	1. Nested functions have access to scope above them
		1. Example:

				function add() {
					var conter = 0;
					function plus() { counter += 1; }
					plus();
					return counter;
				}

### JavaScript Closures ###
1. Solution: Return a nested function which can increment counter that is defined in the nesting function scope

		var add = (function () {
			var counter = 0;
			return function () { return counter += 1; };
		})();

		add();
		add();
		add();

		// the counter is now 3

### Example Explained ###
1. `add` is assigned return value of self invoking function.
2. Self invoking function runs only once.
	1. It sets counte to 0 and returns the function expression
3. `add` becomes a function
	1. It can now access `counter` in parent scope
	2. This is JS closure
		1. Makes it possible for functions to have private variables
3. `counter` is protected by scope of anonymous function and can only be changed by using the `add` function
4. Closure: function having access to parent scope even after parent function has closed.

# JS HTML DOM #
## DOM Intro ##
1. JS can access and change all elements of HTML document

### The HTML DOM (Document Object Model) ###
1. HTML DOM is constructed as a tree of Objects

	![pic_htmltree.gif](pic_htmltree.gif)

2. This gives the power to JS to build dynamic HTML
	1. JS can change all HTML elements in page
	2. JS can change all HTML attributes in page
	3. JS can change all CSS styles in page
	4. JS can remove existing HTML elements and attributes
	5. JS can add new HTML elements and attributes
	6. JS can react to all existing HTML events in the page
	7. JS can construct new HTML events in the page

### What You Will Learn ###
1. How to change content of HTML elements
2. How to change style (CSS) of HTML elements
3. How to react to HTML DOM events
4. How to add and delete HTML elements

### What is the DOM? ###
1. DOM - W3C standard
2. It defines a standard for accessing documents
3. Definition: "The W3C Document Object Model (DOM) is a platform and language-neutral interface that allows programs and scripts to dynamically access and update the content, structure, and style of a document"
4. DOM standard has three different parts:
	1. Core DOM - standard model for all document types
	2. XML DOM - standard model for XML documents
	3. HTML DOM - standard model for HTML documents

### What is the HTML DOM? ###
1. HTML DOM - standard object model and programming interface for HTML
	1. Defines
		1. HTML elements as objects
		2. properties of all HTML elements
		3. methods to access all HTML elements
		4. events for all HTML elements
2. HTML DOM is a standard for how to get, change, add, or delete HTML elements

## DOM Methods ##
1. HTML DOM methods - actions that can be performed (on HTML elements)
2. HTML DOM properties - values of HTML elements that you can set or change

### The DOM Programming Interface ###
1. HTML DOM can be accessed with JS (or other programming languages)
2. In DOM all HTML elements are defined as objects
3. Programming interface: Properties and methods of each object
	1. Property: value that we can get or set (like changing content of HTML element)
	2. Method: Action we can do (line add or delete and HTML element)

### Example ###
1. Changing content of `<p>` element with `id="demo"`

		<html>
			<body>
				<p id="demo"></p>

				<script>
					document.getElementById('demo').innerHTML = "Hello World!";
				</script>
			</body>
		</html>

### The `getElementById` Method ###
1. Most common way to access an element is using id of the element

### The `innerHTML` Property ###
1. `innerHTML` - get or set content of an element

## DOM Documents ##
1. HTML DOM document object: Owner of all other objects in web page

### The HTML DOM Document Object ###
1. `document` object represents the web page
	1. If any element in web page needs to be accessed, we first access the `document` object

### Finding HTML Elements ###
1. Some methods:
	1. `document.getElementById(id)` - find an element by id
	2. `document.getElementsByTagName(name)` - Find elements by tag name
	3. `document.getElementsByClassName(name)` - Find elements by class name 

### Changing HTML Elements ###
1. `element.innerHTML = new html content`
2. `element.attribute = new value`
3. `element.setAttribute(attribute, value)`
4. `element.style.property = new style`

### Adding and Deleting Elements ###
1. `document.createElement(element)` **(M)**
2. `document.removeChild(element)` **(M)** - removes an HTML element
	1. `<node>.removeChild(<element>)`

3. `document.appendChild(element)` **(M)** - Add an HTML element
	1. `<node>.appendChild(element)`

4. `document.replaceChild(newChild, oldChild)` **(M)** - Replace an HTML element
	1. `replacedNode = <node>.replaceChild(newChild, oldChild)`
		1. `replacedNode` is `oldChild`

### Adding Events Handlers ###
1. `document.getElementById(id).onclick = function () {code}`

### Finding HTML Objects ###
1. `document.anchors` - Returns all `<a>` elements that have name attribute
2. `document.applets` - Returns all `<applet>` elements (deprecated in HTML5)
3. `document.baseURI` - Returns absolute base URI of document
4. `document.body` **(M)** - Returns `<body>` element
5. `document.cookie` **(M)** - Returns document's cookie
6. `document.doctype`
7. `document.documentElement` **(M)** - returns `<html>` element
8. `document.documentMode` - returns mode used by browser
9. `document.documentURI` - Returns URI of document
10. `document.domain` - Returns domain name of document server
11. `document.domConfig` - Obsolete. Returns DOM configuration
12. `document.embeds` - Returns all `<embed>` elements
13. `document.forms` - Returns `<form>` elements
14. `document.head` **(M)** - Returns `<head>` element
15. `document.images` - Returns all `<img>` elements
16. `document.implementation` - Returns the DOM implementation
17. `document.inputEncoding` - Returns document's encoding (character set)
18. `document.lastModified` - Returns date and time document was updated
19. `document.readyState` - Returns (loading) status of document
20. `document.referrer` - Returns URI of referrer (linking document)
21. `document.scripts` - Returns all `<script>` elements
22. `document.stringErrorChecking` - Returns if error checking is enforced
23. `document.title` **(M)** - Returns `<title>` element
24. `document.URL` - Returns complete URL of document

## DOM Elements ##
### Finding HTML Elements ###
1. Ways to find HTML elements:
	1. Finding HTML elements by id
	2. Finding HTML elements by tag name
	3. Finding HTML elements by class name
	4. Finding HTML elements by CSS selectors
	5. Finding HTML elements by HTML object collections

### Finding HTML Element by Id ###
1. Example: `id="intro"`

		var myElement = document.getElementById("intro"); // if found returns an object else returns null

### Finding HTML Elements by Tag Name ###
1. Example: Finding all `<p>` elements

		var x = document.getElementsByTagName("p");

2. Example: Finding all `<p>` elements inside an element with `id="main"`

		var x = document.getElementById("main");
		var y = x.getElementsByTagName("p");

### Finding HTML Elements by Class Name ###
1. Example: Returns list of elements with `class="intro"`

		var x = document.getElementsByClassName("intro");	// Does not work in IE8 or earlier

### Finding HTML Elements by CSS Selectors ###
1. To find elements that match a CSS selector (id,classname, types, attributes, values of attributes ...)
2. Example: `var x = document.querySelectorAll("p.intro")`

### Finding HTML Elements by HTML Object Collections ###
1. Example: find form element with `id="frm1"` in forms collection

		<form id="frm1" action="/action_page.php">
			First name: <input type="text" name="fname" value="Donald"><br>
			Last name: <input type="text" name="lname" value="Duck"><br><br>
			<input type="submit" value="submit">
		</form>
		...
		<button onclick="myFunction()">Try it</button>

		<script>
			function myFunction() {
				var x = document.forms["frm1"];
				var text = "";
				var i;
				for (i = 0; i < x.length; i++) {
					text += x.elements[i].value + "<br>";
				}
				document.getElementById("demo").innerHTML = text;
			}
		</script>

2. Objects and object collections accessible:
	1. [document.anchors](https://www.w3schools.com/js/tryit.asp?filename=tryjs_doc_anchors)
	2. [document.body](https://www.w3schools.com/js/tryit.asp?filename=tryjs_doc_body)
	3. [document.embeds](https://www.w3schools.com/js/tryit.asp?filename=tryjs_doc_embeds)
	4. [document.forms](https://www.w3schools.com/js/tryit.asp?filename=tryjs_doc_forms)
	5. [document.head](https://www.w3schools.com/js/tryit.asp?filename=tryjs_doc_head)
	6. [document.images](https://www.w3schools.com/js/tryit.asp?filename=tryjs_doc_images)
	7. [document.links](https://www.w3schools.com/js/tryit.asp?filename=tryjs_doc_links)
	8. [document.scripts](https://www.w3schools.com/js/tryit.asp?filename=tryjs_doc_scripts)
	9. [document.title](https://www.w3schools.com/js/tryit.asp?filename=tryjs_doc_title)

## DOM HTML ##
1. HTML DOM allows JS to change content of HTML elements

### Changing the HTML Output Stream ###
1. `document.write()` directly writes to HTML output stream

		<!DOCTYPE html>
		<html>
			<body>
				<script>
					document.write(Date());		// overwrites the entire document
				</script>
			</body>
		</html>

### Changing HTML Content ###
1. `innerHTML` - easiest way to modify content
2. Syntax: `document.getElementById(id).innerHTML = new HTML`

### Changing the Value of an Attribute ###
1. Syntax: `document.getElementById(id).attribute = new value`
2. Example: Changing `src` or `<img>`:

		<!DOCTYPE html>
		<html>
			<head>

			</head>
			<body>
				<img id="myImage" src="smiley.gif">
				<script>
					document.getElementById(myImage).src = "landscape.jpg";
				</script>
			</body>
		</html>

## DOM CSS ##
1. HTML DOM allows JS to change style of HTML elements

### Changing HTML Style ###
1. Syntax: `document.getElementById(id).style.property = new style`
2. Example: Changing style of `<p>`

		<html>
			<body>
				<p id="p2">Hello World!</p>
		
				<script>
					document.getElementById('p2').style.color = 'blue';
				</script>

				<p>The paragraph above was changed by a script.</p>
	
			</body>
		</html>

### Using Events ###
1. HTML DOM allows us to execute code when even occurs
2. Events are generated by browser when something happens to HTML elements
	1. An element is clicked on
	2. The page has loaded
	3. Input fields are changed
3. Example: Change style of element with `id="id1"` when user clicks a button

		<!DOCTYPE html>
		<html>
			<body>
				<h1 id="id1">My Heading 1</h1>

				<button type="button" onclick="document.getElementById('id1').style.color = 'red'">Click Me!</button>
			</body>
		</html>

### More Examples ###
1. [Visibility](https://www.w3schools.com/js/tryit.asp?filename=tryjs_visibility) - how to make an element invisible.

		document.getElementById('demo').style.visibility = 'hidden';

### HTML DOM Style Object Reference ###
1. [HTML DOM Style Object Reference](https://www.w3schools.com/jsref/dom_obj_style.asp)

## DOM Animations ##
### A Basic Web Page ###
1. Example: Start with a simple web page

		<!DOCTYPE html>
		<html>
			<body>
				<h1>My First JavaScript Animation</h1>

				<div id="animation">My animation will go here</div>

			</body>
		</html>

### Creation of an Animation Container ###
1. Add an animation container:

		<div id="container">
			<div id="animate">My animtion will go here</div>
		</div>

### Style the Elements ###
1. Container should have `style = "position: relative"`
2. Animation should have `style = "position: absolute"`
3. Example:

		#container {
			width: 400px;
			height: 400px;
			position: relative;
			background: yellow;
		}
		#animate {
			width: 50px;
			height: 50px;
			position: absolute;
			background: red;
		}

### Animation Code ###
1. Animations are done by programming gradual changes in element's style
	1. Changes are called timer
		1. If timer interval is small, animation looks continuous
2. Example:

		var id = setInterval(frame, 5);

		function frame() {
			if (/* test for finished */) {
				clearInterval(id);
			} else {
				/* code to change the element style */
			}
		}

### Creation of the Animation Using JavaScript ###
1. Example:

		<!DOCTYPE html>
		<html>
			<style>
				#container {
					width: 400px;
					height: 400px;
					position: relative;
					background: yellow;
				}
				#animate {
					width: 50px;
					height: 50px;
					position: absolute;
					background-color: red;
				}
			</style>
			<body>
				<p>
					<button onclick="myMove()">Click Me</button>
				</p>

				<div id="container">
					<div id="animate"></div>
				</div>

				<script>
					function myMove() {
						var elem = document.getElementById('animate');
						var pos = 0;
						var id = setInterval(frame, 5);
						function frame() {
							if (pos == 350) {
								clearInterval(id);
							} else {
								pos++;
								elem.style.top = pos + 'px';
								elem.style.left = pos + 'px';
							}
						}
					}
				</script>
			</body>
		</html>

## DOM Events ##
1. HTML DOM allows JS to react to HTML events

### Reacting to Events ###
1. JS can be executed when an event occurs
	1. When user clicks on HTML element
	2. Add HTML code to event attribute
		1. `onclick = Javascript`
2. Examples of HTML events:
	1. When a user clicks the mouse
	2. When a web page has loaded
	3. When an image has been loaded
	4. When the mouse moves over an element
	5. When an input field is changed
	6. When an HTML form is submitted
	7. When a user strokes a key
3. Example: 

		<!DOCTYPE html>
		<html>
			<body>
				<h1 onclick="this.innerHTML = 'Ooops!'">Click on this text!</h1>
			<body>
		</html>

4. Example: Calling a function from event handler

		<!DOCTYPE html>
		<html>
			<body>
				<h1 onclick="changeText(this)">Click on this text!</h1>
				<script>
					function changeText(id) {
						id.innerHTML = "Ooops!";
					}
				</script>
			</body>
		</html>

### HTML Event Attributes ###
1. To assign events to HTML elements, use event attributes
2. Example: `<button onclick="displayDate()">Try it</button>`

### Assign Events Using the HTML DOM ###
1. HTML DOM allows us to assign events to HTML elements using JS:

		<script>
			document.getElementById("myBtn").onclick = displayDate;
		</script>

### The onload and onunload Events ###
1. `onload` and `onunload` events are triggered when user enters or leaves a page
	1. `onload` - can be used to check visitor's browser type and browser version and load proper version of web page based on the info
		1. Example: Dealing with cookies:

				<!DOCTYPE html>
				<html>
					<body onload="checkCookies()">

						<p id="demo"></p>

						<script>
							function checkCookies() {
								var text = '';
								if (navigator.cookieEnabled == true) {
									text = 'Cookies are enabled.';
								} else {
									text = 'Cookies are not enabled';
								}
							}
							document.getElementById('demo').innerHTML = text;
						</script>
					</body>
				</html>

### The onchange Event ###
1. `onchange()` - used in combination of validation of input fields usually
2. Example:

		function upperCase() {
			var x = document.getElementById('fname');
			x.value = x.value.toUpperCase();
		}
		...
		<input type="text" id="fname" onchange="upperCase()">

### The onmouseover and onmouseout Events ###
1. `onmouseover` and `onmouseout` - can be used to trigger function when user mouses over or out of HTML element

### The onmousedown, on mouseup and onclick Events ###
1. `onmousedown`, `onmouseup`, `onclick`
	1. `onmousedown` - when mouse button is clicked
	2. `onmouseup` - when mouse button is released
	3. `onclick` - when mouse click is completed

### More Examples ###
1. [onmousedown and onmouseup](https://www.w3schools.com/js/tryit.asp?filename=tryjs_event_onmousedown)
2. [onload](https://www.w3schools.com/js/tryit.asp?filename=tryjs_event_onload)
3. [onfocus](https://www.w3schools.com/js/tryit.asp?filename=tryjs_event_onfocus)
4. [Mouse events](https://www.w3schools.com/js/tryit.asp?filename=tryjs_event_onmouse)

### HTML DOM Event Object Reference ###
1. [HTML DOM Event Object Reference](https://www.w3schools.com/jsref/dom_obj_event.asp)
	1. Mouse events:
		1. onclick
		2. oncontextmenu
		3. ondblclick
		4. onmousedown
		5. onmouseenter
		6. onmouseleave
		7. onmousemove
		8. onmouseover
		9. onmouseout
		10. onmouseup
	2. Keyboard events
		1. onkeydown
		2. onkeypress
		3. onkeyup
	3. Frame/Object events
		1. onabort
		2. onbeforeunload
		3. onerror
		4. onhashchange
		5. onload
		6. onpageshow
		7. onpagehide
		8. onresize
		9. onscroll
		10. onunload
	4. Form events:
		1. onblur
		2. onchange
		3. onfocus
		4. onfocusin
		5. onfocusout
		6. oninput
		7. oninvalid
		8. onreset
		9. onsearch
		10. onselect
		11. onsubmit
	5. Drag events
		1. ondrag
		2. ondragend
		3. ondragenter
		4. ondragleave
		5. ondragover
		6. ondragstart
		7. ondrop
	6. Clipgoard events
		1. oncopy
		2. oncut
		3. onpaste
	7. Print events
		1. onafterprint - occurs when page has started printing, or if print dialog box has been closed
		2. onbeforeprint - event occurs when a page is about to be printed
	8. Media events:
		1. onabort
		2. oncanplay
		3. oncanplaythrough
		4. ondurationchange
		5. onended
		6. onerror
		7. onloadeddata
		8. onloadedmetadata
		9. onloadstart
		10. onpause
		11. onplay
		12. onplaying
		13. onprogress
		14. onratechange
		15. onseeked
		16. onseeking
		17. onstalled
		18. onsuspend
		19. ontimeupdate
		20. onvolumechange
		21. onwaiting
	9. Animation events
		1. animationend - occurs when CSS animation has completed
		2. animationiteration - occurs when a CSS animation is repeated
		3. animationstart - occurs when CSS animation has started
	10. Transition events
		1. transitionend - occurs when CSS transition has completed
	11. Server-sent events
		1. onerror - occurs when an error occurs with event source
		2. onmessage - occurs when a message is received through the event source
		3. onopen - occurs when a connection with the event source is opened
	12. Misc Events
		1. onmessage
		2. onmousewheel - deprecated
		3. ononline
		4. onoffline
		5. onpopstate
		6. onshow
		7. onstorage
		8. ontoggle
		9. onwheel - occurs when mouse wheel rolls up or down over an element
	13. Touch Events
		1. ontouchcancel - occurs when touch is interrupted
		2. ontouchend - occurs when finger is removed from touch screen
		3. ontouchmove - occurs when finger is dragged across screen
		4. ontouchstart - occurs when finger is placed on touch screen
	14. [https://www.w3schools.com/jsref/dom_obj_event.asp](https://www.w3schools.com/jsref/dom_obj_event.asp)

## DOM Event Listener ##
### The `addEventListener()` method ###
1. Example:

		document.getElementById('myBtn').addEventListener('click', displayDate);

	1. `addEventListener` - attaches event handler to specified element
		1. It does not overwrite existing event handlers
			1. We can add multiple event handlers to one element
			2. We can add multiple event handlers to same type to one element (`click`)
		2. We can add event listeners to any DOM object including `window`
		3. Makes it easier to control how event reacts to bubbling
		4. Separates JS from HTML markup
			1. We can add event listeners even if we are not controlling the HTML markup
	2. `removeEventListener` - removes an event listener

### Syntax ###
1. `element.addEventListener(event, function, useCapture)`
	1. `event` - type of event - `click`, `mousedown`
		1. `on` prefix is removed
	2. `function` - called when event occurs
	3. `useCapture` - boolean, whether to use event bubbling or event capturing

### Add an Event Handler to an Element ###
1. Example:

		element.addEventHandler('click', function () {
			alert('Hello World!');
		});

2. Example: Referring to external named function

		element.addEventHandler('click', myFunction);
		
		function myFunction() {
			alert('Hello World!');
		}

### Add Many Event Handlers to the Same Element ###
1. Example:

		element.addEventListener('click', myFunction);
		element.addEventListener('click', mySecondFunction);

2. Example: Adding events of different types to same element

		element.addEventListener('mouseover', myFunction);
		element.addEventListener('click', mySecondFunction);
		element.addEventListener('mouseout', myThirdFunction);

### Add an Event Handler to the Window Object ###
1. `addEventListener` can add event listeners to any object that supports events (xmlHttpRequest)
2. Example:

		window.addEventListener('resize', function () {
			document.getElementById('demo').innerHTML = sometext;
		});

### Passing Parameters ###
1. When passing parameters, use anonymous function that calls specified function with parameters
2. Example:

		var p1 = 5;
		var p2 = 7;

		element.addEventListener('click', function () {
			myFunction(p1, p2);
		});

### Event Bubbling or Event Capturing? ###
1. There are two ways of event propagation in HTML DOM
	1. Bubbling
	2. Capturing
2. Event propagation:
	1. It is a way of defining element order when event occurs
3. Example: Consider a `<div>` element and a `<p>` element inside it. When user clicks on `<p>`, which element's 'click' event should be handled first?
	1. Bubbling: innermost element's event is handled first and then outer
		1. `<p>` element's click event is handled first then `<div>` element's click event
	2. Capturing: Outer most element's event is handled first and then inner
		1. `<div>` element's click event will be handled first, then `<p>` element's click event
4. We can specify the prapagation type in `addEventListener`

		addEventListener(event, function, useCapture);	// default: false - uses bubbling propagation

		document.getElementById('myDiv').addEventListener('click', myFunction, true);

### The `removeEventListener()` method ###
1. `removeEventListener()` - removes event handlers that have been attached with `addEventListener()`

		element.removeEventListener('mouseover', myFunction);

### Browser Support ###
1. `addEventListener()` - Chrome 1.0, IE 9.0, Firefox 1.0, Safari 1.0, Opera 7.0
2. `removeEventListener()` - Chrome 1.0, IE 9.0, Firefox 1.0, Safari 1.0, Opera 7.0
3. For Older browsers use `attachEvent` and `detachEvent`

		element.attachEvent(event, function);
		element.detachEvent(event, function);

4. Example:

		var x = document.getElementById('myBtn');
		if (x.addEventListener) {
			x.addEventListener('click', myFunction);	// For all major browsers, except IE 8 and earlier
		} else if (x.attachEvent) {
			x.attachEvent('onclick', myFunction);	// For IE 8 and earlier versions
		}

### HTML DOM Event Object Reference ###
1. [HTML DOM Event Object Reference](https://www.w3schools.com/jsref/dom_obj_event.asp)

## DOM Navigation ##
1. We can navigate node tree using node relationships

### DOM Nodes ###
1. According to W3C HTML DOM standard, everything in HTML document is a node
	1. Entire document is a document node
	2. Every HTML element is an element node
	3. The text inside HTML elements are text nodes
	4. Every HTML attribute is an attribute node (deprecated)
	5. All comments are comment nodes
2. All nodes in the node tree can be accessed using JS
	1. New nodes can get created
	2. Nodes can be modified
	3. Nodes can be deleted

### Node Relationships ###
1. Nodes have a hierarchical relationship with each other
2. Relationships:
	1. Top node is called root (root node)
	2. Every node has exactly one parent, except root (which has no parent)
	3. A node can have a number of children
	4. Siblings (brothers and sisters) are nodes with same parent
3. Relationships:

	![pic_navigate](pic_navigate.gif)

	1. Example:

			<html>
				<head>
					<title>DOM Tutorials</title>
				</head>
				<body>
					<h1>DOM Lesson one</h1>
					<p>Hello world!</p>
				</body>
			</html>

		1. `<html>` is root node
		2. `<head>` is first child of `<html>`
		3. `<body>` is last child of `<html>`
		4. `<title>` is a child of `<head>` node
		5. `DOM Tutorials` is text node

### Navigating Between Nodes ###
1. Node properties used to navigate between nodes:
	1. `parentNode` **(M)**
	2. `childNodes[nodenumber]` **(M)**
	3. `firstChild`
	4. `lastChild`
	5. `nextSibling`
	6. `previousSibling`

### Child Nodes and Node Values ###
1. Example: `<title id="demo">DOM Tutorial</title>` - `<title>` does not contain text but text node with value `DOM Tutorial`
	1. Value of text node can be accessed by `innerHTML` property
		1. It is same as accessing `nodeValue` property

				var myTitle = document.getElementById('demo').firstChild.nodeValue;

				var myTitle = document.getElementById('demo').childNodes[0].nodeValue;
2. Copying text from one element to another:

		<html>
			<body>
				<h1 id="id01">My Page</h1>
				<p id="id02"></p>
			
				<script>
					document.getElementById('id02').innerHTML = document.getElementById('id01').innerHTML;
				</script>
			</body>
		</html>

### InnerHTML ###
1. `innerHTML` can be used but `nodeValue` is part of tree defnition

### DOM Root Nodes ###
1. Special properties that give access to full document
	1. `document.body` - body of the document
	2. `document.documentElement` - full document
2. Example:

		<html>
			<body>
				<p>Hello World!</p>
				<div>
					<p>The DOM is very useful!</p>
					<p>This example demonstrates the <b>document.body</b> property.</p>
				</div>

				<script>
					alert(document.body.innerHTML);
					alert(document.documentElement.innerHTML);
				</script>
			</body>
		</html>

### The `nodeName` Property ###
1. `nodeName` - specifies name of a node
	1. `nodeName` is read-only
	2. `nodeName` of an element node is the same as tag name
	3. `nodeName` of attribute node is attribute name
	4. `nodeName` of text node is always `#text`
	5. `nodeName` of document node is always `#document`
2. Example:

		<h1 id="id01">My First Page</h1>
		<p id="id02"></p>

		<script>
			document.getElementById('id02').innerHTML = document.getElementById('id01').nodeName;
		</script>

### The `nodeValue` Property ###
1. `nodeValue` specifies value of node
	1. `nodeValue` for element nodes is undefined
	2. `nodeValue` for text nodes is text itself
	3. `nodeValue` for attribute nodes is attribute value

### The `nodeType` Property ###
1. `nodeType` is read only. It returns type of node

		<h1 id="id01">My First Page</h1>
		<p id="id02"></p>

		<script>
			document.getElementById('id02').innerHTML = document.getElementById('id01').nodeType;
		</script>

2. `nodeType` properties:
	1. `ELEMENT_NODE` - Type 1
	2. `ATTRIBUTE_NODE` - Type 2	(Deprecated in HTML DOM but remains in XML DOM)
	3. `TEXT_NODE` - Type 3
	4. `COMMENT_NODE` - Type 8
	5. `DOCUMENT_NODE` - Type 9
	6. `DOCUMENT_TYPE_NODE` - Type 10 - `<!DOCTYPE html>`

## DOM Nodes ##
1. Adding and removing nodes (HTML elements)

### Creation of New HTML Elements (Nodes) ###
1. Steps:
	1. Creation of new element
	2. Append it to existing element
2. Example:

		<div id="div1">
			<p id="p1">This is a paragraph.</p>
			<p id="p2">This is another paragraph.</p>
		</div>

		<script>
			var para = document.createElement('p');
			var node = document.createTextNode('This is new.');
			para.appendChild(node);

			var element = document.getElementById('div1');
			element.appendChild(para);
		</script>

### Example Explained ###
1. `var para = document.createElement('p')` - a new element gets created
2. `var node = document.createTextNode('This is a new paragraph.')` - a text node gets created with `nodeValue` as `'This is a new paragraph.'`
3. `para.appendChild(node)` - appends text node to `<p>`
4. `var element = document.getElementById('div1')` - get existing element
5. `element.appendChild(para);` - appends new element to existing element

### Creation of new HTML Elements - `insertBefore()` ###
1. `insertBefore` - 
	1. Example:

			<div id="div1">
				<p id="p1">This is a paragraph.</p>
				<p id="p2">This is another paragraph.</p>
			</div>

			<script>
				var para = document.createElement('p');
				var node = document.createTextNode('This is new.');
				para.appendChild(node);

				var element = document.getElementById('div1');
				var child = document.getElementById('p1');
				element.insertBefore(para, child);
			</script>

### Removing Existing HTML Elements ###
1. To remove an element, we must know the parent of the element
2. Example:

		<div id="div1">
			<p id="p1">This is a paragraph.</p>
			<p id="p2">This is another paragraph.</p>
		</div>

		<script>
			var parent = document.getElementById('div1');
			var child = document.getElementById('p1');
			parent.removeChild(child);
		</script>

	1. `node.remove()` - introduced in DOM 4 but poor browser support and must not be used

### Example Explained ###
1. `parent.removeChild(child);` - Removes child from parent
2. To remove a node without knowing it's parent:

		var child = document.getElementById('p1');
		child.parentNode.removeChild(child);

### Replacing HTML Elements ###
1. `replaceChild()`
2. Example:

		<div id="div1">
			<p id="p1">This is a paragraph.</p>
			<p id="p2">This is another paragraph.</p>
		</div>

		<script>
			var para = document.createElement('p');
			var node = document.createTextNode('This is new.');
			para.appendChild(node);

			var parent = document.getElementById('div1');
			var child = document.getElementById('p1');
			parent.replaceChild(para, child);
		</script>

## DOM Collections ##
### The HTMLCollection Object ###
1. `getElementsByTagName()` returns `HTMLCollection` object
2. `HTMLCollection` - array-like list of HTML elements
3. Example: `var ps = document.getElementsByTagName('p');`

### HTML HTMLCollection Length ###
1. `length` - number of elements in a collection

		var myCollection = document.getElementsByTagName('p');
		document.getElementById('demo').innerHTML = myCollection.length;

2. Used to loop through elements in a collection
3. `HTMLCollection` is not an array and we cannot use array methods like `valueOf()`, `pop()`, `push()`, `join()`

## DOM Node Lists ##
### The HTML DOM NodeList Object ###
1. `NodeList` - object, list (collection) of nodes extracted from a document
	1. Older browsers return it instead of `HTMLCollection` object for methods like `getElementsByClassName()`
	2. All browsers returns `NodeList` object for `childNodes`
	3. Most browsers returns `NodeList` object for `querySelectorAll()`
2. Example:

		var myNodeList = document.querySelectoryAll('p');
		y = myNodeList[1];

### HTML DOM Node List Length ###
1. `length` - defines number of properties in a node list
2. Example:

		var myNodeList = document.querySelectoryAll('p');
		document.getElementById('demo').innerHTML = myNodeList.length;
3. Used to loop through nodes in a node list

		var myNodeList = document.querySelectoryAll('p');
		var i;
		for (i = 0; i < myNodeList.length; i++) {
			myNodeList[i].style.backgroundColor = 'red';
		}

### The Difference Between an HTMLCollection and a NodeList ###
1. `HTMLCollection` - collection of HTML elements
	1. Can be accessed by name, id, or index number
	2. Cannot contain attribute nodes and text nodes
2. `NodeList` is collection of document nodes
	1. Can only be accessed by index number
	2. It can contain attribute nodes and text nodes

# JS Browser DOM #
## JS Window ##
1. Browser Object Model (BOM) allws JS to talk to browser

### The Browser Object Model (BOM) ###
1. No official standards for BOM
2. Modern browsers have implemented almost same methods and properties for JS interactivity.
	1. They are methods and properties of BOM

### The Window Object ###
1. Supported by all browsers
2. Represents browser's window
3. All global JS objects, functions, variables automatically become members of window object
	1. Global variables: Properties of window object
	2. Global functions: Methods of window object
3. `document` - it is a property of `window` object
	1. `window.document.getElementById('header')`

### Window Size ###
1. `window.innerHeight` - inner height of browser window (in pixels)
	1. Does not include toolbars and scrollbars
2. `window.innerWidth` - inner width of browser window (in pixels)
3. IE 8, 7, 6, 5:

		document.documentElement.clientHeight
		document.documentElement.clientWidth
		or
		document.body.clientHeight
		document.body.clientWidth

4. JS solution covering all browsers:

		var w = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;

		var h = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;

### Other Window Methods ###
1. Other methods:
	1. `window.open()` **(M)** - open a new window
	2. `window.close()` **(M)** - close current window
	3. `window.moveTo()` **(M)** - move the current window
	4. `window.resizeTo()` **(M)** - resize current window

## JS Screen ##
1. `window.screen` contains info about user's screen

### Window Screen ###
1. `window.screen` object can be used without `window` prefix
2. Properties:
	1. `screen.width`
	2. `screen.height`
	3. `screen.availWidth`
	4. `screen.availHeight`
	5. `screen.colorDepth`
	6. `screen.pixelDepth`

### Window Screen Width ###
1. `screen.width` - returns width of visitor's screen in pixels

		document.getElementById('demo').innerHTML = 'Screen Width: ' + screen.width;

### Window Screen Heidht ###
1. `screen.height` - returns height of visitor's screen in pixels

		document.getElementById('demo').innerHTML = 'Screen Height: ' + screen.height;

### Window Screen Available Width ###
1. `screen.availWidth` - returns width of visitor's screen in pixels minus interface features like Windows Taskbar

		document.getElementById('demo').innerHTML = 'Available Screen Width: ' + screen.availWidth;

### Window Screen Available Height ###
1. `screen.availHeigth` - returns height of visitor's screen in pixels minus interface features like Windows Taskbar

		document.getElementById('demo').innerHTML = 'Available Screen Height: ' + screen.availHeight;

### Window Screen Color Depth ###
1. `screen.colorDepth` - returns number of bits used to display on color
	1. 24 bit or 32 bit hardware for color resolution
	2. 16 bits: older computers
	3. 8 bits: Very old computers and cell phones
2. Example:

		document.getElementById('demo').innerHTML = 'Screen Color Depth: ' + screen.colorDepth;

### Window Screen Pixel Depth ###
1. `screen.pixelDepth` - returns pixel depth of screen (Modern columpters: colorDepth and pixelDepth are equal)
2. Example:

		document.getElementById('demo').innerHTML = 'Screen Pixel Depth: ' + screen.pixelDepth; 

## JS Location ##
1. `window.location` **(M)** - used to get current page address (URL) and to redirect browser to a new page

### Window Location ###
1. `window.location` can be written without `window` prefix
2. Examples:
	1. `window.location.href` **(M)** - returns `href` (URL) of current page
	2. `window.location.hostname` **(M)** - returns domain name of web host
	3. `window.location.pathname` **(M)** - returns path and filename of current page
	4. `window.location.protocol` **(M)** - returns web protocol used (http: or https:)
	5. `window.location.assign` **(M)** - loads new document

### Window Location Href ###
1. `window.location.href` - returns URL of current page

		document.getElementById('demo').innerHTML = 'Page location is ' + window.location.href;

### Window Location Hostname ###
1. `window.location.hostname` - returns name of internet host (of current page)

		document.getElementById('demo').innerHTML = 'Page hostname is ' + window.location.hostname;

### Window Location Pathname ###
1. `window.location.pathname` - returns pathname of current page

		document.getElementById('demo').innerHTML = 'Page path is ' + window.location.pathname;

### Window Location Protocol ###
1. `window.location.protocol` - returns web protocol of current page

		document.getElementById('demo').innerHTML = 'Page protocol is ' + window.location.protocol;

### Window Location Port ###
1. `window.location.port` - returns number of internet host port of current page

		document.getElementById('demo').innerHTML = 'Port number is ' + window.location.port; // default port number 80 for http and 443 for https are usually not displayed in most browsers

### Window Location Assign ###
1. `window.location.assign()` - loads a new document
2. Example:

		<html>
			<head>
				<script>
					function newDoc() {
						window.location.assign('https://www.w3schools.com');
					}
				</script>
			</head>
			<body>
				<input type="button" value="Load new document" onclick="newDoc()">
			</body>
		</html>

## JS History ##
1. `window.history` **(M)** contains browser's history

### Window History ###
1. There are limitations to how JS can access this object due to protect privacy of users
2. Methods (few):
	1. `history.back()` - same as back click in browser
	2. `history.forward()` - same as forward click in browser

### Window History Back ###
1. `history.back()` loads previous URL in history list
2. Example:

		<html>
			<head>
				<script>
					function goBack() {
						window.history.back();
					}
				</script>
			</head>
			<body>
				<input type="button" value="Back" onclick="goBack()">
			</body>
		</html>

### Window History Forward ###
1. `history.forward()` loads next URL in the history list
2. Example:

		<html>
			<head>
				<script>
					function goForward() {
						window.history.forward();
					}
				</script>
			</head>
			<body>
				<input type="button" value="Forward" onclick="goForward()">
			</body>
		</html>

## JS Navigator ##
1. `window.navigator` object - contains information about browser

### Window Navigator ###
1. Examples:
	1. `navigator.appName` **(M)**
	2. `navigator.appCodeName` **(M)**
	3. `navigator.platform` **(M)**

### Browser Cookies ###
1. `navigator.cookieEnabled` - true if cookies are enabled otherwise false
2. Example:

		<p id="demo"></p>

		<script>
			document.getElementById('demo').innerHTML = "cookiesEnabled is " + navigator.coolieEnabled;
		</script>

### Browser Application Name ###
1. `navigator.appName` - application name of browser
2. Example:

		<p id="demo"></p>

		<script>
			document.getElementById('demo').innerHTML = 'navigator.appName is ' + navigator.appName;	// It is "Netscape" for IE11, Chrome, Firefox and Safari
		</script>

### Browser Application Code Name ###
1. `navigator.appCodeName` - application code name of browser
2. Example:

		<p id="demo"></p>

		<script>
			document.getElementById('demo').innerHTML = 'navigator.appCodeName is ' + navigator.appCodeName;	// "Mozilla" is application code name for Chrome, Firefox, IE, Safari, and Opera
		</script>

### The Browser Engine ###
1. `navigator.product` - returns product name of browser engine
2. Example:

		<p id="demo"></p>

		<script>
			document.getElementById('demo').innerHTML = 'navigator.product is ' + navigator.product;	// Cannot be relied on
		</script>

### The Browser Version ###
1. `navigator.appVersion` **(M)** - returns version info about browser
2. Example:

		<p id="demo"></p>

		<script>
			document.getElementById('demo').innerHTML = navigator.appVersion;
		</script>

### The Browser Agent ###
1. `navigator.userAgent` **(M)** - returns user-agent header sent by browser to server
2. Example:

		<p id="demo"></p>

		<script>
			document.getElementById('demo').innerHTML = navigator.userAgent;
		</script>

### Warning !!! ###
1. Info from navigator object can be misleading. Do not use it to detect browser versions because:
	1. Different browsers can use same name
	2. Navigator data can be changed by browser owner
	3. Some browsers misidentify themselves to bypass site tests
	4. Browsers cannot report new OSs, released later than the browser

### The Browser Platform ###
1. `navigator.platform` - returns browser platform (OS)
2. Example:

		<p id="demo"></p>

		<script>
			document.getElementById('demo').innerHTML = navigator.platform;
		</script>

### The Browser Language ###
1. `navigator.language` **(M)** - returns browser's language
2. Example:

		<p id="demo"></p>

		<script>
			document.getElementById('demo').innerHTML = navigator.langauge;
		</script>

### Is The Browser Online? ###
1. `navigator.onLine` **(M)** - true if browser is online
2. Example:

		<p id="demo"></p>

		<script>
			document.getElementById('demo').innerHTML = navigator.onLine;
		</script>

### Is Java Enabled? ###
1. `navigator.javaEnabled()` **(M)** - true if Java is enabled
2. Example:

		<p id="demo"></p>
		
		<script>
			document.getElementById('demo').innerHTML = navigator.javaEnabled();
		</script>

## JS Popup Alert ##
1. Three types of popup boxes:
	1. Alert box
	2. Confirm box
	3. Prompt box

### Alert Box ###
1. Use must click `OK` to proceed

#### Syntax ####
1. `window.alert("sometext");`

### Confirm Box ###
1. Used if user has to verify or accept something
2. User has to click either `OK` or `Cancel` to proceed
	1. If user clicks `OK`, box returns true
	2. If user clicks `Cancel`, box returns false
3. Syntax: `window.confirm("sometext");`
4. Example:

		if (confirm("Press a button!") == true) {
			txt = "You pressed OK!";
		} else {
			txt = "You pressed Cancel!";
		}

### Prompt Box ###
1. Used if user must enter a value before netering a page
2. User can click on `OK` or `Cancel` to proceed after entering input value
3. If `OK` is clicked, box returns input value. If `Cancel` is clicked, box returns `null`

#### Syntax ####
1. `window.prompt("sometext", "defaultText");`
2. Example:

		var person = prompt("Please enter your name", "Harry Potter");

		if (person == null || person == "") {
			txt = "User cancelled the prompt.";
		} else {
			txt = "Hello " + person + "! How are you today?";
		}

### Line Breaks ###
1. To display line breaks inside popup box, use `\n`
2. Example:

		alert("Hello\nHow are you?");

## JS Timing ##
1. JS can be executed at time intervals - called timing events

### Timing Events ###
1. `window` object allows execution of code at specified time intervals
	1. timing events - time intervals
	2. Methods used:

			setTimeout(function, milliseconds) // executes function after waiting for specified number of milliseconds
			setInterval(function, milliseconds) // repeats execution of function after waiting for specifid number of milliseconds

### The `setTimeout()` Method ###
1. `window.setTimeout(function, milliseconds)`
	1. `function` - function that is executed
	2. `milliseconds` - number of milliseconds before execution
2. Example:

		<button onclick="setTimeout(myFunction, 3000)">Try it</button>

		<script>
			function myFunction() {
				alert('Hello');
			}
		</script>

### How to Stop the Execution? ###
1. `window.clearTimeout(timeoutVariable)` - stops execution of function specified in `setTimeout()`
	1. `timeoutVariable` - returned by `setTimeout()`

			myVar = setTimeout(function, milleseconds);
			clearTimeout(myVar);

2. Example:

		<button onclick="myVar = setTimeout(myFunction, 3000)">Try it</button>	<!-- Defines a global variable -->

		<button onclick="clearTimeout(myVar)">Stop it</button>

### The `setInterval()` Method ###
1. Syntax: `window.setInterval(function, milliseconds);`
	1. function - function to be executed
	2. milliseconds - length of time interval between each execution
2. Example:

		setInterval(myTimer, 1000);

		function myTimer() {
			var d = new Date();
			document.getElementById('demo').innerHTML = d.toLocalTimeString();
		}

### How to Stop the Execution? ###
1. Syntax: `window.clearInterval(timerVariable)`
2. Example:

		myVar = setInterval(function, milliseconds);
		clearInterval(myVar);

3. Example:

		<p id="demo"></p>

		<button onclick="clearInterval(myVar)">Stop watch</button>

		<script>
			var myVar = setIneterval(myTimer, 1000);
			function myTimer() {
				var d = new Date();
				document.getElementById("demo").innerHTML = d.toLocaleTimeString();
			}
		</script>

### More Examples ###
1. [Another simple timing](https://www.w3schools.com/js/tryit.asp?filename=tryjs_timing2)
2. [A clock created with a timing event](https://www.w3schools.com/js/tryit.asp?filename=tryjs_timing_clock)

## JS Cookies ##
1. Cookies let us store user information in web pages

### What are Cookies? ###
1. Cookies are data stored in small text files on computer
2. When web server has sent a web page to browser, connection is shut down and server forgets everything about the user
3. Utility:
	1. When user visits a web-page, name can be stored in a cookie
	2. Next time user visits the page, cookie "remembers" his name
4. Cookies are saved in name-value pairs:

		username = John Doe

5. When browser requests a web page from server, cookies belonging to page is added to request
	1. Server gets the data to "remember" information about users

### Creation of a Cookie with JavaScript ###
1. `document.cookie` **(M)** - property used for creation, reading and deleting cookies
2. Creation:

		document.cookie = "username=John Doe";

3. Adding expiry time: (Default: cookie is deleted when browser is closed)

		document.cookie = "username=John Doe; expires=Thu, 18 Dec 2013 12:00:00 UTC";

4. Specify path to which the cookie belongs to:

		document.cookie = "username=John Doe; expires=Thu, 18 Dec 2013 12:00:00 UTC; path=/";

### Read a Cookie with JavaScript ###
1. Example:

		var x = document.cookie;	// all cookies are returned in one string cookie1=value; cookie2=value; cookie3=value;

### Change a Cookie with JavaScript ###
1. Save as creation:
2. Example:

		document.cookie = "username=John Smith; expires=THu, 18 Dec 2013 12:00:00 UTC; path=/";

### Delete a Cookie with JavaScript ###
1. Set `expires` parameter to past date
2. Example:

		document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";

### The Cookie String ###
1. `document.cookie` is not a normal string
	1. When we read it, only name-value pairs are returned
	2. If we set new cookie, older cookies are not overwritten
2. To get a specific cookie, write a JS function that searches for the cookie value in cookie string

### JavaScript Cookie Example ###
1. Storing name of visitor in a cookie
	1. First time visit stores the name of visitor in a cookie
2. Next time the same visitor visits, he gets welcome page
3. Three JS functions will be used:
	1. Function to set cookie value
	2. Function to get cookie value
	3. Function to check a cookie value

### A Function to Set a Cookie ###
1. Example:

		function setCookie(cname, cvalue, exdays) {
			var d = new Date();
			d.setTime(d.getTime() + (exdays*24*60*60*1000));
			var expires = "expires=" + d.toUTCString();
			document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
		}

### A Function to Get a Cookie ###
1. Example:

		function getCookie(cname) {
			var name = cname + "=";
			var decodedCookie = decodeURIComponent(document.cookie);	// Decodes cookies to handle special characters e.g. '$'
			var ca = decodedCookie.split(';');
			for (var i = 0; i < ca.length; i++) {
				var c = ca[i];
				while (c.charAt(0) == ' ') {
					c = c.substring(1);
				}
				if (c.indexOf(name) == 0) {
					return c.substring(name.length, c.length);
				}
			}
			return "";
		}

### A Function to Check a Cookie ###
1. If cookie is set it will display a greeting.
2. If cookie is not set, it displays a prompt box asking for name of user and stores username cookie for 365 days calling `setCookie`
3. Example:

		function checkCookie() {
			var username = getCookie("username");
			if (username != "") {
				alert("Welcome again " + username);
			} else {
				username = prompt("Please enter your name:", "");
				if (username != "" && username != null) {
					setCookie("username", username, 365);
				}
			}
		}

### All Together Now ###
1. Run `checkCookie()` function when page loads

# JS AJAX #
## AJAX Intro ##
1. We can:
	1. Read data from web server - after page has loaded
	2. Update web page without reloading page
	3. Send data to web server - in background
2. Example:

		<!DOCTYPE html>
		<html>
			<body>

				<div id="demo">
					<h2>The XMLHttpRequest Object</h2>
					<button type="button" onclick="loadDoc()">Change Content</button>
				</div>

				<script>
					function loadDoc() {
						var xhttp = new XMLHttpRequest();
						xhttp.onreadystatechange = function () {
							if (this.readyState == 4 && this.status == 200) {
								document.getElementById("demo").innerHTML = this.responseText;
							}
						};
						xhttp.open("GET", "ajax_info.txt", true);
						xhttp.send();
					}
				</script>
			</body>
		</html>

### AJAX Example Explained ###
1. function requests data from a web server and displays it

### What is AJAX? ###
1. AJAX = Asynchronous JavaScript And XML
2. It is not a programming language
3. It uses a combination of 
	1. Browser built in XMLHttpRequest object (to request data from web server)
	2. JavaScript and HTML DOM (to display or use data)
4. AJAX might use XML to transport data but we can use plain text or JSON text
5. It allows web pages to be updated asynchronously by exchanging data with web server behind the scenes
	1. We can update parts of web page without reloading the page

### HOW AJAX Works ###

	![pic_ajax](pic_ajax.gif)

1. An event occurs in web page (page is loaded, button is clicked)
2. An `XMLHttpRequest` object is created in JS
3. The `XMLHttpRequest` object sends a request to a web server
4. The server processes the request
5. The server sends a response back to the web page
6. The response is read by JS
7. Proper action (like page update) is performed by JS

## AJAX XMLHttp ##
### The XMLHttpRequest Object ###
1. All modern browsers (supposedly) support `XMLHttpRequest` object
2. It is used to exchange data with web server behind the schenes
	1. Parts of web-page can be updated without reloading the entire page

### Creation of XMLHttpRequest Object ###
1. Modern browsers (Chrome, Firefox, IE7+, Edge, Safari, Opera) have built-in `XMLHttpRequest` object
2. Creation of `XMLHttpRequest` object

		variable = new XMLHttpRequest();

### Access Across Domains ###
1. For security reasons modern browsers do no allow access across domains.
	1. Both web page and XML file it tries to load must be located on same server
2. XML files must be located on own server (If server does not support CORS)

### Older Browsers (IE5 and IE6) ###
1. They use `ActiveX` object instead of `XMLHttpRequest` object

		variable = new ActiveXObject("Microsoft.XMLHTTP");

2. To handle old browsers:

		if (window.XMLHttpRequest) {
			// code for modern browsers
			xmlhttp = new XMLHttpRequest();
		} else {
			// code for old IE browsers
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}

### XMLHttpRequest Object Methods ###
1. `new XMLHttpRequest()` - Builds new `XMLHttpRequest` object
2. `abort()` - Cancels current request
3. `getAllResponseHeaders()` **(M)** - Returns header information
4. `getResponseHeader()` **(M)** - Returns specific header info
5. `open(method, url, async, user, psw)` **(M)** - Specifies request
	1. `method`: GET or POST
	2. `url`: file location
	3. `async`: `true` (asynchronous) or `false` (synchronous)
	4. `user`: optional username
	5. `psw`: optional password
6. `send()` **(M)** - sends request to server used for GET request
7. `send(string)` **(M)** - sends request to server used for POST request
8. `setRequestHeader()` **(M)** - Adds label/value pair to header to be sent

### XMLHttpRequest Object Properties ###
1. `onreadystatechange` - defines function called when `readyState` property changes
2. `readyState` **(M)** - Holds status of `XMLHttpRequest`
	1. 0 - Request not initialized
	2. 1 - Server connection established
	3. 2 - Request received
	4. 3 - Processing request
	5. 4 - Request finished and response is ready
3. `responseText` **(M)** - Returns response data as a string
4. `responseXML` **(M)** - Returns response data as XML string
5. `status` **(M)** - Status number of request
	1. 200 - "OK"
	2. 403 - "Forbidden"
	3. 404 - "Not Found"
	4. [Http Messages Reference](https://www.w3schools.com/tags/ref_httpmessages.asp)
6. `statusText` **(M)** - status text
	1. "OK"
	2. "Not Found"

## AJAX Request ##
### Send a Request To a Server ###
1. Use `open()` and `send()` methods of `XMLHttpRequest` object

		xhttp.open("GET", "ajax_info.txt", true);
		xhttp.send();

### GET or POST? ###
1. GET - simpler and faster than POST (Can be used in most cases)
2. POST - used when
	1. Cached file is not an option (update a file or database on server)
	2. Sending large amount of data to server (POST has no size limitations)
	3. Sending user input (which can contain unknown characters), POST is more robust and secure than GET

### GET Requests ###
1. To avoid chached result add unique ID to URL:

		xhttp.open('GET', 'demo_get.asp?t=' + Math.random(), true);
		xhttp.send();

2. If we want to send information using GET method, add it to URL

		xhttp.open('GET', 'demo_get2.asp?fname=Henry&lname=Ford', true);
		xhttp.send();

### POST Requests ###
1. Simple POST request:

		xhttp.open("POST", "demo_post.asp", true);
		xhttp.send();

2. To POST data, add HTTP heder with `setRequestHeader()` and specify data in `send()`

		xhttp.open('POST', 'ajax_text.asp', true);
		xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhttp.send('fname=Henry&lname=Ford');

	1. `setRequestHeader(header, value)`

### The url - A File On a Server ###
1. URL parameter of `open` is a file on server
	1. `.txt`
	2. `.xml`
	3. server script like `.asp` and `.php`

### Asynchronous - True or False? ###
1. JS does not have to wait for server response but
	1. execute other scripts while waiting for server response
	2. deal with response after response is ready

### The `onreadystatechange` Property ###
1. The function to be executed when request receives an answer can be defined in `onreadystatechange` property of `XMLHttpResponse`

### Synchronous Request ###
1. Set third parameter in `open` to false
2. No need for `onreadystatechange`

		xhttp.open('GET', 'ajax_info.txt', false);
		xhttp.send();
		document.getElementById('demo').innerHTML = xhttp.responseText;

	1. If server is busy or app is slow, app will hang or stop
	2. Developer tools may throw `InvalidAccessError` exception when it occurs

## AJAX Response ##
### The `onreadystatechange` Property ###
1. `readyState` property holds status of XMLHttpRequest
2. `onreadystatechange` - defines function to be executed when `readyState` changes
	1. Triggered 4 times one time for each change in `readyState`
3. `status` and `statusText` hold status of XMLHttpRequest object

### Using a Callback Function ###
1. Callback function - a function passed as parameter to another function
2. Design: For multiple AJAX tasks, define a callback function for each task and a fucntion for executing XMLHttpRequest

		loadDoc("url-1", myFunction1);

		loadDoc("url-2", myFunction2);

		function loadDoc(url, cFunction) {
			var xhttp;
			xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function () {
				if (readyState == 4 && status == 200) {
					cFunction(this);
				}
			};
		}

		function myFunction1(xhttp) {
			// action goes here
		}

		function myFunction2(xhttp) {
			// action goes here
		}

### Server Response Properties ###
1. `responseText` - response data as a string
2. `responseXML` - response data as XML data

### Server Response Methods ###
1. `getResponseHeader()` - returns specific header info from server resource
2. `getAllResponseHeaders()` - returns all header info from server resource

### The `responseText` Property ###
1. returns response as JS string

### The `responseXML` Property ###
1. XMLHttpRequest has built-in XML parser
2. `responseXML` property returns server response as XML DOM object
3. Parse the response as XML DOM object

		xmlDoc = xhttp.responseXML;
		txt = '';
		x = xmlDoc.getElementsByTagName("ARTIST");
		for (var i = 0; i < x.length; i++) {
			txt += x[i].childNodes[0].nodeValue + '<br/>';
		}
		document.getElementById('demo').innerHTML = txt;
		xhttp.open('GET', 'cd_catalog.xml', true);
		xhttp.send();

### The `getAllResponseHeader()` Method ###
1. `getAllResponseHeaders()` returns all header information from server response

		document.getElementById('demo').innerHTML = this.getAllResponseHeaders();

### The `getResponseHeader()` Method ###
1. `getResponseHeader()` returns specific header information from server response

		document.getElementById('demo').innerHTML = this.getResponseHeader('Last-Modified');

## AJAX XML File ##
1. AJAX can be used for interactive communication with XML file

### AJAX XML Example ###
1. Example: Fetching information from XML file with AJAX:

		<!DOCTYPE html>
		<html>
			<style>
				table, th, td {
					border: 1px solid black;
					border-collapse: collapse;
				}
				th, td {
					padding: 5px;
				}
			</style>
			<body>
				<h2>The XMLHttpRequest Object</h2>

				<button type="button" onclick="loadDoc()">Get my CD collection</button>
				<br><br>
				<table id="demo"></table>

				<script>
					function loadDoc() {
						var xhttp = new XMLHttpRequest();
						xhttp.onreadystatechange = function () {
							if (this.readyState == 4 && this.status == 200) {
								myFunction(this);
							}
						};
						xhttp.open("GET", "cd_catalog.xml", true);
						xhttp.send();
					}

					function myFuntion(xml) {
						var i;
						var xmlDoc = xml.responseXML;
						var table = "<tr><th>Artist</th><th>Title</th></tr>";
						var x = xmlDoc.getElementsByTagName("CD");
						for (i = 0; i < x.length; i++) {
							table += "<tr><td>" + x[i].getElementsByTagName("ARTIST")[0].childNodes[0].nodeValue + "</td><td>" + x[i].getElementsByTagName("TITLE")[0].childNodes[0].nodeValue + "</td></tr>";
						}
						document.getElementById("demo").innerHTML = table;
					}
				</script>
			</body>
		</html>

### Example Explained ###
### The XML File ###
1. [cd_catalog.xml](https://www.w3schools.com/js/cd_catalog.xml)

## AJAX PHP ##
### AJAX PHP Example ###


### Example Explained ###
### The PHP File - "gethint.php" ###

## AJAX ASP ##
### AJAX ASP Example ###
### Example Explained ###
### The ASP File - "gethint.asp" ###

## AJAX Database ##
1. AJAX can be used for interactive communication with a database

### AJAX Database Example ###
1. Example: When a name is selected, details are displayed

### Example Explained - The MySQL Database ###
1. Database table:
	1. **id**, **FirstName**, **LastName**, **Age**, **Hometown**, **Job**
	2. Peter, Griffin, 41, Quahog, Brewery
	3. Lois, Griffin, 40, Newport, Piano Teacher
	4. Joseph, Swanson, 39, Quahog, Police Officer
	5. Glenn, Quagmire, 41, Quahog, Pilot

### Example Explained ###
1. When a user selects a person in dropdown list, function called "showUser()" is executed.
2. Function is triggered by `onchange` event
3. Example:

		<html>
			<head>
				<script>
					function showUser(str) {
						if (str == "") {
							document.getElementById('txtHint').innerHTML = '';
							return;
						} else {
							if (window.XMLHttpRequest) {
								// code for IE7+, Firefox, Chrome, Opera, Safari
								xmlhttp = new XMLHttpRequest();
							} else {
								// code for IE6, IE5
								xmlhttp = new ActiveXObject('Microsoft.XMLHTTP');
							}
							xmlhttp.onreadystatechange = function () {
								if (this.readyState == 4 && this.status == 200) {
									document.getElementById('txtHint').innerHTML = this.responseText;
								}
							};
							xmlhttp.open('GET', 'getuser.php?q=' + str, true);
							xmlhttp.send();
						}
					}
				</script>
			</head>
			<body>
				<form>
					<select name="users" onchange="showUser(this.value)">
						<option value="">Select a person:</option>
						<option value="1">Peter Griffin</option>
						<option value="2">Lois Griffin</option>
						<option value="3">Joseph Swanson</option>
						<option value="4">Glenn Quagmire</option>
					</select>
				</form>
				<br/>
				<div id="txtHint"><b>Person info should be listed here...</b></div>
			</body>
		</html>

	1. Code explanation:
		1. If no person is selected, clear the content of text and exit the function
		2. If a person is selected,
			1. Build XMLHttpRequest object
			2. Construct the function to be executed when server response is ready
			3. Send request off to a file on server
			4. `q` contains content of dropdown list

### The PHP File ###
1. `getuser.php` runs a query against MySQL database and returns result in HTML table

		<!DOCTYPE html>
		<html>
			<head>
				<style>
					table {
						width: 100%;
						border-collapse: collapse;
					}

					table, td, th {
						border: 1px solid black;
						padding: 5px;
					}

					th { text-align: left; }
				</style>
			</head>
			<body>
				<?php
					$q = intval($_GET['q']);

					$con = mysqli_connect('127.0.0.1', 'peter', 'abc123', 'my_db');
					if (!$con) {
						die('Could no connect: ' . mysqli_error($con));
					}

					mysqli_select_db($con, "ajax_demo");
					$sql = "SELECT * FROM user WHERE id = '" . $q . "'";
					$result = mysqli_query($con, $sql);

					echo "<table
							<tr>
								<th>Firstname</th>
								<th>Lastname</th>
								<th>Age</th>
								<th>Hometown</th>
								<th>Job</th>
							</tr>";
					while ($row = mysqli_fetch_array($result)) {
						echo "<tr>";
						echo "<td>" . $row['FirstName'] . "</td>";
						echo "<td>" . $row['LastName'] . "</td>";
						echo "<td>" . $row['Age'] . "</td>";
						echo "<td>" . $row['Hometown'] . "</td>";
						echo "<td>" . $row['Job'] . "</td>";
						echo "</tr>";
					}
					echo "</table>";
					mysqli_close($con);
					?>
				</body>
			</html>

		1. PHP opens connection to MySQL server
		2. Correct person is found
		3. HTML table is created, filled with data, sent back to 'txtHint' placeholder

## AJAX Applications ##
1. Some HTML applications using XML, HTTP, DOM, and JavaScript

### The XML Document Used ###
1. [cd_catalog.xml](https://www.w3schools.com/js/cd_catalog.xml)

### Display XML Data in an HTML Table ###
1. Eample:

		<html>
			<head>
				<style>
					table, th, td {
						broder: 1px solid black;
						border-collapse: collapse;
					}
					th, td {
						padding: 5px;
					}
				</style>
			</head>
			<body>
				<button type="button" onclick="loadXMLDoc()">Get my CD collection</button>
				<br/><br/>
				<table id="demo"></table>

				<script>
					function loadXMLDoc() {
						var xmlhttp = new XMLHttpRequest();
						xmlhttp.onreadystatechange = function () {
							if (this.readyState == 4 && this.status == 200) {
								myFunction(this);
							}
						};
						xmlhttp.open('GET', 'cd_catalog.xml', true);
						xmlhttp.send();
					}

					function myFunction(xml) {
						var i;
						var xmlDoc = xml.responseXML;
						var table = '<tr><th>Artist</th><th>Title</th></tr>';
						var x = xmlDoc.getElementsByTagName('CD');
						for (i = 0; i < x.length; i++) {
							table += '<tr><td>' +
							x[i].getElementsByTagName('ARTIST')[0].childNodes[0].nodeValue +
							'</td><td>' +
							x[i].getElementsByTagName('TITLE')[0].childNodes[0].nodeValue +
							'</td></tr>';
						}
						document.getElementById('demo').innerHTML = table;
					}
				</script>
			</body>
		</html>

### Display the First CD in an HTML div Element ###
1. Display first CD element in HTML element with id="showCD":

		displayCD(0);

		function displayCD(i) {
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status = 200) {
					myFunction(this, i);
				}
			};
			xmlhttp.open("GET", "cd_catalog.xml", true);
			xmlhttp.send();
		}

		function myFunction(xml, i) {
			var xmlDoc = xml.responseXML;
			x = xmlDoc.getElementsByTagName("CD");
			document.getElementById("showCD").innerHTML = "Artist: " + x[i].getElementsByTagName("ARTIST")[0].childNodes[0].nodeValue + "<br>Title: " + x[i].getElementsByTagName("TITLE")[0].childNodes[0].nodeValue + "<br>Year: " + x[i].getElementsByTagName("YEAR")[0].childNodes[0].nodeValue;
		}

### Navigate Between the CDs ###
1. Define `next()` and `previous()`

		function next() {
			// display the next CD, unless you are on the last CD
			if (i < len - 1) {
				i++;
				displyCD(i);
			}
		}

		function previous() {
			// display the previous CD, unless you are on the first CD
			if (i > 0) {
				i--;
				displayCD(i);
			}
		}

### Show Album Information When Clicking On a CD ###
1. [Try it yourself](https://www.w3schools.com/js/tryit.asp?filename=tryjs_ajax_app)

## AJAX Examples ##
### Simple Examples ###
1. [A simple AJAX Example](https://www.w3schools.com/js/tryit.asp?filename=tryjs_ajax_first): Build a simple XMLHttpRequest and retrieve data from TXT file
2. [An AJAX example with a callback function](https://www.w3schools.com/js/tryit.asp?filename=tryjs_ajax_callback): Build a XMLHttpRequest with a callback function, and retrieve data from a TXT file
3. [Examples explained](https://www.w3schools.com/js/js_ajax_intro.asp)

### Request Header Information ###
1. [Retrieve all header information of a resource (file)](https://www.w3schools.com/js/tryit.asp?filename=tryjs_ajax_header)
2. [Retrieve specific header information of a resource (file)](https://www.w3schools.com/js/tryit.asp?filename=tryjs_ajax_lastmodified)
3. [Examples explained](https://www.w3schools.com/js/js_ajax_http_response.asp)

### Request XML Files ###
1. [Load an XML file with AJAX](https://www.w3schools.com/js/tryit.asp?filename=tryjs_ajax_xml): Build an XMLHttpRequest to retrieve data from an XML file
2. [Retrieve the content of an XML file](https://www.w3schools.com/js/tryit.asp?filename=tryjs_ajax_xml2): Build an XMLHttpRequest to retrieve data from an XML file and display the data in an HTML table
3. [Examples Explained](https://www.w3schools.com/js/js_ajax_xmlfile.asp)

### Retrieve Server Data with PHP and ASP ###
1. [Retrieve the content of a PHP file](https://www.w3schools.com/js/tryit.asp?filename=tryjs_ajax_suggest_php): How a web page can communicate with a web server while a user types characters in an input field
2. [Retrieve the content of an ASP file]()

### Retrieve Database Information ###
1. [Retrieve content from a database](https://www.w3schools.com/js/tryit.asp?filename=tryjs_ajax_database): How a web page can fetch information from a database with AJAX

### AJAX Applications ###
1. [View an XML CD catalog](https://www.w3schools.com/js/cd_catalog.xml)
2. [Display XML data in an HTML table](https://www.w3schools.com/js/tryit.asp?filename=tryjs_ajax_display_table)
3. [Show XML data inside an HTML div element](https://www.w3schools.com/js/tryit.asp?filename=tryjs_ajax_app_first)
4. [Navigate through XML nodes](https://www.w3schools.com/js/tryit.asp?filename=tryjs_ajax_app_navigate)
5. [A simple CD catalog application](https://www.w3schools.com/js/tryit.asp?filename=tryjs_ajax_app)

#### Examples Explained ####
1. [Examples Explained](https://www.w3schools.com/js/js_ajax_applications.asp)


 
