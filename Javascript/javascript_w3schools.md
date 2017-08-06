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


### Converting Variables to Numbers ###
### Global Methods ###
### The `Number()` Method ###
### The `parseInt()` Method ###
### The `parseFloat()` Method ###
### Number Properties ###
### Complete JavaScript Number Reference ###

## JS Math ##
### `Math.round()` ###
### `Math.pow()` ###
### `Math.sqrt()` ###
### `Math.abs()` ###
### `Math.ceil()` ###
### `Math.floor()` ###
### `Math.sin()` ###
### `Math.cos()` ###
### `Math.min()` and `Math.max()` ###
### `Math.random()` ###
### Math Properties (Constants) ###
### Math Constructor ###
### Math Object Methods ###
### Complete Math Reference ###

## JS Random ##
### `Math.random()` ###
### JavaScript Random Integers ###
### A Proper Random Function ###

## JS Dates ##
### JavaScript Date Formats ###
### Displaying Dates ###
### Creation of Date Objects ###
### Date Methods ###
### Displaying Dates ###
### Time Zones ###

## JS Date Formats ##
### JavaScript Date Input ###
### JavaScript Date Output ###
### JavaScript ISO Dates ###
### ISO Dates (Year and Month) ###
### ISO Dates (Only Year) ###
### ISO Dates (Date-Time) ###
### Time Zones ###
### JavaScript Short Dates. ###
### WARNINGS ! ###
### JavaScript Long Dates. ###
### JavaScript Full Date ###

## JS Date Methods ##
### Date Get Methods ###
### The `getTime()` Method ###
### The `getFullYear()` Method ###
### The `getDay()` Method ###
### Date Set Methods ###
### The `setFullYear()` Method ###
### The `setDate()` Method ###
### Date Input - Parsing Dates ###
### Compare Dates ###
### UTC Date Methods ###
### Complete JavaScript Date Reference ###

## JS Arrays ##
### What is an Array? ###
### Creation of an Array ###
### Using the JavaScript Keyword `new` ###
### Access the Elements of an Array ###
### Access the Full Array ###
### Arrays are Objects ###
### Array Elements Can Be Objects ###
### Array Properties and Methods ###
### The `length` Property ###
### looping Array Elements ###
### Adding Array Elements ###
### Associative Arrays ###
### The Difference Between Arrays and Objects ###
### When to Use Arrays. When to use Objects. ###
### Avoid `new Array()` ###
### How to Recognize an Array ###

## JS Array Methods ##
### Converting Arrays to Strings ###
### Popping and Pushing ###
### Popping ###
### pushing ###
### Shifting Elements ###
### Changing Elements ###
### Deleting Elements ###
### Splicing an Array ###
### Using `splice()` to Remove Elements ###
### Merging (Concatenating) Arrays ###
### Slicing an Array ###
### Automatic `toString()` ###
### Finding Max and Min Values in an Array ###
### Sorting Arrays ###
### Complete Array Reference ###

## JS Array Sort ##
### Soring an Array ###
### Reversing an Array ###
### Numeric Sort ###
### The Compare Function ###
### Sorting an Array in Random Order ###
### Find the Highest (or Lowest) Array Value ###
### Using `Math.max()` on an Array ###
### Using `Math.min()` on an Array ###
### My Min / Max JavaScript Methods ###
### Sorting Object Arrays ###

## JS Booleans ##
### Boolean Values ###
### The `Boolean()` Function ###
### Comparisons and Conditions ###
### Everything With a "Real" Value is True ###
### Everything Without a "Real" Value is False ###
### Booleans Can be Objects ###
### Complete Boolean Reference ###

## JS Comparisons ##
### Comparison Operators ###
### How Can it be Used ###
### Logical Operators ###
### Conditional (Ternary) Operator ###
### Comparing Different Types ###

## JS Conditions ##
### Conditional Statements ###
### The `if` Statement ###
### The `else` Statement ###
### The `else if` Statement ###
### More Examples ###

## JS Switch ##
### The JavaScript Switch Statement ###
### The `break` Keyword ###
### The `default` Keyword ###
### Common Code Blocks ###

## JS Loop For ##
### JavaScript Loops ###
### Different Kinds of Loops ###
### The For Loop ###
### Statement 1 ###
### Statement 2 ###
### Stetement 3 ###
### The For/In Loop ###
### The While Loop ###

## JS Loop While ##
### The While Loop ###
### The DO/While Loop ###
### Comparing For and While ###

## JS Break ##
### The Break Statement ###
### The Continue Statement ###
### JavaScript Labels ###

## JS Type Conversion ##
### JavaScript Data Types ###
### The `typeof` Operator ###
### The Data Type of `typeof` ###
### The constructor Property ###
### JavaScript Type Conversion ###
### Converting Numbers to Strings ###
### Converting Booleans to Strings ###
### Converting Dates to Strings ###
### Converting Strings to Numbers ###
### The Unary `+` Operator ###
### Converting Booleans to Numbers ###
### Converting Dates to Numbers ###
### Automatic Type Conversion ###
### Automatic String Conversion ###
### JavaScript Type Conversion Table ###

## JS Bitwise ##
### JavaScript Bitwise Operators ###
### Examples ###
### JavaScript Uses 32 bits Bitwise Operands ###
### Bitwise AND ###
### Bitwise OR ###
### Bitwise XOR ###
### JavaScript Bitwise AND (`&`) ###
### JavaScript Bitwise OR (`|`) ###
### JavaScript Bitwise XOR (`^`) ###
### JavaScript Bitwise NOT (`~`) ###
### JavaScript (Zero Fill) Bitwise Left Shift (`<<`) ###
### JavaScript (Sign Preserving) Bitwise Right Shift (`>>`) ###
### JavaScript (Zero Fill) Right Shift (`>>>`) ###
### Binary Numbers ###
### Converting Decimal to Binary ###
### Converting Binary to Decimal ###

## JS RegExp ##
### What Is a Regular Expression? ###
### Syntax ###
### Using String Methods ###
### Using String `search()` With a Regular Expression ###
### Using String `search()` With String ###
### Using String `replace()` With a Regular Expression ###
### Using String `replace()` With a String ###
### Did You Notice? ###
### Regular Expression Modifiers ###
### Regular Expression Patterns ###
### Using the RegExp Object ###
### Using `test()` ###
### Using `exec()` ###
### Complete RegExp Reference ###

## JS Errors ##
### Errors Will Happen! ###
### JavaScript try and catch ###
### JavaScript Throws Errors ###
### The throw Statement ###
### Input Validation Example ###
### HTML Validation ###
### The finally Statement ###
### The Error Object ###
### Error Object Properties ###
### Error Name Values ###
### Eval Error ###
### Range Error ###
### Reference Error ###
### Synatx Error ###
### Type Error ###
### URI Error ###
### Non-Standard Error Object Properties ###

## JS Debugging ##
### Code Debugging ###
### JavaScript Debuggers ###
### The `console.log()` Method ###
### Setting Breakpoints ###
### The debugger Keyword ###
### Major Browsers' Debugging Tools ###
### Chrome ###
### Firebox Firebug ###
### Internet Explorer ###
### Opera ###
### Safari Firebug ###
### Safari Develop Menu ###
### Did You Know? ###

## JS Hoisting ##
### JavaScript Declarations are Hoisted ###
### JavaScript Initializations are Not Hoisted ###
### Declare Your Variables At the Top! ###

## JS Strict Mode ##
### The "use strict" Directive ###
### Declaring Strict Mode ###
### The "use strict"; Syntax ###
### Why Strict Mode? ###
### Not Allowed in Strict Mode ###
### Future Proof! ###
### Watch Out! ###

## JS Style Guide ##
### JavaScript Coding Conventions ###
### Variable Names ###
### Spaces Around Operators ###
### Code Indentation ###
### Statement Rules ###
### Object Rules ###
### Line Length < 80 ###
### Naming Conventions ###
### Loading JavaScript in HTML ###
### Accessing HTML Elements ###
### File Extensions ###
### Use Lower Case File Names ###
### Performance ###

## JS Best Practices ##
### Avoid Global Variables ###
### Always Declare Local Variables ###
### Declarations on Top ###
### Initialize Variables ###
### Never Declare Number, String, or Boolean Objects ###
### Don't Use new Object() ###
### Beware of Automatic Type Conversions ###
### Use === Comparison ###
### Use Parameter Defaults ###
### End Your Switches with Defaults ###
### Avoid Using `eval()` ###

## JS Mistakes ##
### Accidentally Using the Assignment Operator ###
### Expecting Loose Comparison ###
### Confusing Addition & Concatenation ###
### Misunderstanding Floats ###
### Breaking a JavaScript String ###
### Misplacing Semicolon ###
### Breaking a Return Statement ###
### Explanation ###
### Accessing Arrays with Named Indexes ###
### Ending Definitions with a Comma ###
### Undefined is Not Null ###
### Expecting Block Level Scope ###

## JS Performance ##
### Reduce Activity in Loops ###
### Reduce DOM Access ###
### Reduce DOM Size ###
### Avoid Unnecessary Variables ###
### Delay JavaScript Loading ###
### Avoiding Using with ###

## JS Reserved Words ##
### JavaScript Reserved Words ###
### Removed Reserved Words ###
### JavaScript Objects, Properties, and Methods ###
### Java Reserved Words ###
### Other Reserved Words ###
### HTML Event Handlers ###

## JS Versions ##
### ECMAScript Editions ###
### Browser Support ###
### ECMAScript Browser Implementations ###
### JavaScript/ ECMAScript/ JScript ###

## JS JSON ##
### What is JSON? ###
### JSON Example ###
### The JSON Format Evaluates to JavaScript Objects ###
### JSON Syntax Rules ###
### JSON Data - A Name and a Value ###
### JSON Objects ###
### JSON Arrays ###
### Converting a JSON Text to a JavaScript Object ###

# JS Forms #
## JS Forms ##
### JavaScript Form Validation ###
### JavaScript Can Validate Numeric Input ###
### Automatic HTML Form Validation ###
### Data Validation ###
### HTML Constraint Validation ###
### Constraint Validation HTML Input Attributes ###
### Constraint Validation CSS Pseudo Selectors ###

## Forms API ##
### Constraint Validation DOM Methods ###
### Constraint Validation DOM Properties ###
### Validity Properties ###
### Examples ###

# JS Objects #
## Object Definitions ##
### JavaScript Primitives ###
### Objects are Variables Containing Variables ###
### Object Properties ###
### Object Methods ###
### Creation of JavaScript Object ###
### Using an Object Literal ###
### Using the JavaScript Keyword `new` ###
### Using an Object Constructor ###
### The `this` Keyword ###
### Build-in JavaScript Constructors ###
### Did You Know? ###
### String Objects ###
### Number Objects ###
### Boolean Objects ###
### JavaScript Objects are Mutable ###

## Object Properties ##
### JavaScript Properties ###
### Accessing JavaScript Properties ###
### JavaScript for...in Loop ###
### Adding New Properties ###
### Deleting Properties ###
### Property Attributes ###
### Prototype Properties ###

## Object Methods ##
### JavaScript Methods ###
### Accessing Object Methods ###
### Using Built-In Methods ###
### Adding New Methods ###

## Object Prototypes ##
### JavaScript Prototypes ###
### Creation of Prototype ###
### Adding Properties and Methods to Objects ###
### Adding a Property to an Object ###
### Adding a Method to an Object ###
### Adding Properties to a Prototype ###
### Adding Methods to a Prototype ###
### Using the `prototype` Prototype ###

# JS Functions #
## Function Definitions ##
### Function Declarations ###
### Function Expressions ###
### The `Function()` Constructor ###
### Function Hoisting ###
### Self-Invoking Functions ###
### Functions Can Be used as Values ###
### Functions are Objects ###

## Function Parameters ##
### Function Parameters and Arguments ###
### Parameter Rules ###
### Parameter Defaults ###
### The Arguments Object ###
### Arguments are Passed by Value ###
### Objects are Passed by Reference ###

## Function Invocation ##
### Invoking a JavaScript Function ###
### Invoking a Function as a Function ###
### The `this` Keyword ###
### The Globla Object ###
### Invoking a Function as a Method ###
### Invoking a Function with a Function Constructor ###

## Function Call ##
### Functions are Object Methods ###
### The JavaScript `call()` Method ###

## Function Apply ##
### The JavaScript `apply()` Method ###
### The Difference Between `call()` and `apply()` ###
### The Value of `this` ###

## Function Closures ##
### Global Variables ###
### Variable Lifetime ###
### A Counter Dilemma ###
### JavaScript Nested Functions ###
### JavaScript Closures ###
### Example Explained ###

# JS HTML DOM #
## DOM Intro ##
### The HTML DOM (Document Object Model) ###
### What You Will Learn ###
### What is the DOM? ###
### What is the HTML DOM? ###

## DOM Methods ##
### The DOM Programming Interface ###
### Example ###
### The `getElementById` Method ###
### The `innerHTML` Property ###

## DOM Documents ##
### The HTML DOM Document Object ###
### Finding HTML Elements ###
### Changing HTML Elements ###
### Adding and Deleting Elements ###
### Adding Events Handlers ###
### Finding HTML Objects ###

## DOM Elements ##
### Finding HTML Elements ###
### Finding HTML Element by Id ###
### Finding HTML Elements by Tag Name ###
### Finding HTML Elements by Class Name ###
### Finding HTML Elements by CSS Selectos ###
### Finding HTML Elements by HTML Object Collections ###

## DOM HTML ##
### Changing the HTML Output Stream ###
### Changing HTML Content ###
### Changing the Value of an Attribute ###

## DOM CSS ##
### Changing HTML Style ###
### Using Events ###
### More Examples ###
### HTML DOM Style Object Reference ###

## DOM Animations ##
### A Basic Web Page ###
### Creation of an Animation Container ###
### Style the Elements ###
### Animation Code ###
### Creation of the Animation Using JavaScript ###

## DOM Events ##
### Reacting to Events ###
### HTML Event Attributes ###
### Assign Events Using the HTML DOM ###
### The onload and onunload Events ###
### The onchange Event ###
### The onmouseover and onmouseout Events ###
### The onmousedown, on mouseup and onclick Events ###
### More Examples ###
### HTML DOM Event Object Reference ###

## DOM Event Listener ##
### The `addEventListener()` method ###
### Syntax ###
### Add an Event Handler to an Element ###
### Add Many Event Handlers to the Same Element ###
### Add an Event Handler to the Window Object ###
### Passing Parameters ###
### Event Bubbling or Event Capturing? ###
### The `removeEventListener()` method ###
### Browser Support ###
### HTML DOM Event Object Reference ###

## DOM Navigation ##
### DOM Nodes ###
### Node Relationships ###
### Navigating Between Nodes ###
### Child Nodes and Node Values ###
### InnerHTML ###
### DOM Root Nodes ###
### The `nodeName` Property ###
### The `nodeValue` Property ###
### The `nodeType` Property ###

## DOM Nodes ##
### Creation of New HTML Elements (Nodes) ###
### Example Explained ###
### Creation of new HTML Elements - `insertBefore()` ###
### Removing Existing HTML Elements ###
### Example Explained ###
### Replacing HTML Elements ###

## DOM Collections ##
### The HTMLCollection Object ###
### HTML HTMLCollection Length ###

## DOM Node Lists ##
### The HTML DOM NodeList Object ###
### HTML DOM Node List Length ###
### The Difference Between an HTMLCollection and a NodeList ###

# JS Browser DOM #
## JS Window ##
### The Browser Object Model (BOM) ###
### The Window Object ###
### Window Size ###
### Other Window Methods ###

## JS Screen ##
### Window Screen ###
### Window Screen Width ###
### Window Screen Heidht ###
### Window Screen Available Width ###
### Window Screen Available Height ###
### Window Screen Color Depth ###
### Window Screen Pixel Depth ###

## JS Location ##
### Window Location ###
### Window Location Href ###
### Window Location Hostname ###
### Window Location Pathname ###
### Window Location Protocol ###
### Window Location Port ###
### Window Location Assign ###

## JS History ##
### Window History ###
### Window History Back ###
### Window History Forward ###

## JS Navigator ##
### Window Navigator ###
### Browser Cookies ###
### Browser Application Name ###
### Browser Application Code Name ###
### The Browser Engine ###
### The Browser Version ###
### The Browser Agent ###
### Warning !!! ###
### The Browser Platform ###
### The Browser Language ###
### Is The Browser Online? ###
### Is Java Enabled? ###

## JS Popup Alert ##
### Alert Box ###
### Confirm Box ###
### Prompt Box ###
### Line Breaks ###

## JS Timing ##
### Timing Events ###
### The `setTimeout()` Method ###
### How to Stop the Execution? ###
### The `setInternal()` Method ###
### How to Stop the Execution? ###
### More Examples ###

## JS Cookies ##
### What are Cookies? ###
### Creation of a Cookie with JavaScript ###
### Read a Cookie with JavaScript ###
### Change a Cookie with JavaScript ###
### Delete a Cookie with JavaScript ###
### The Cookie String ###
### JavaScript Cookie Example ###
### A Function to Set a Cookie ###
### A Function to Get a Cookie ###
### A Function to Check a Cookie ###
### All Together Now ###

# JS AJAX #
## AJAX Intro ##
### AJAX Example Explained ###
### What is AJAX? ###
### HOW AJAX Works ###

## AJAX XMLHttp ##
### The XMLHttpRequest Object ###
### Creation of XMLHttpRequest Object ###
### Access Across Domains ###
### Older Browsers (IE5 and IE6) ###
### XMLHttpRequest Object Methods ###
### XMLHttpRequest Object Properties ###

## AJAX Request ##
### Send a Request To a Server ###
### GET or POST? ###
### GET Requests ###
### POST Requests ###
### The url - A File On a Server ###
### Asynchronous - True or False? ###
### The `onreadystatechange` Property ###
### Synchronous Request ###

## AJAX Response ##
### The `onreadystatechange` Property ###
### Using a Callback Function ###
### Server Response Properties ###
### Server Response Methods ###
### The `responseText` Property ###
### The `responseXML` Property ###
### The `getAllResponseHeader()` Method ###
### The `getResponseHeader()` Method ###

## AJAX XML File ##
### AJAX XML Example ###
### Example Explained ###
### The XML File ###

## AJAX PHP ##
### AJAX PHP Example ###
### Example Explained ###
### The PHP File - "gethint.php" ###

## AJAX ASP ##
### AJAX ASP Example ###
### Example Explained ###
### The ASP File - "gethint.asp" ###

## AJAX Database ##
### AJAX Database Example ###
### Example Explained - The `showCustomer()` Function ###
### The AJAX Server Page ###

## AJAX Applications ##
### The XML Document Used ###
### Display XML Data in an HTML Table ###
### Display the First CD in an HTML div Element ###
### Navigate Between the CDs ###
### Show Album Information When Clicking On a CD ###

## AJAX Examples ##
### Simple Examples ###
### Request Header Information ###
### Request XML Files ###
### Retrieve Server Data with PHP and ASP ###
### Retrieve Database Information ###
### AJAX Applications ###

# JS JSON #
## JSON Intro ##
### Exchanging Data ###
### Sending Data ###
### Receiving Data ###
### Storing Data ###
### What is JSON? ###
### Why use JSON? ###

## JSON Syntax ##
### JSON Syntax Rules ###
### JSON Data - A Name and a Value ###
### JSON - Evaluates to JavaScript Objects ###
### JSON Values ###
### JSON Uses JavaScript Syntax ###
### JavaScript Arrays as JSON ###
### JSON Files ###

## JSON vs XML ##
### JSON is Like XML Because ###
### JSON is Unline XML Because ###
### Why JSON is Better Than XML ###

## JSON Data Types ##
### Valid Data Types ###
### JSON Strings ###
### JSON Numbers ###
### JSON Objects ###
### JSON Arrays ###
### JSON Booleans ###
### JSON `null` ###

## JSON Objects ##
### Object Syntax ###
### Accessing Object Values ###
### Looping an Object ###
### Nested JSON Objects ###
### Modify Values ###
### Delete Object Properties ###

## JSON Arrays ##
### Arrays as JSON Objects ###
### Arrays in JSON Objects ###
### Accessing Array Values ###
### Looping Through an Array ###
### Nested Arrays in JSON Objects ###
### Modify Array Values ###
### Delete Array Items ###

## JSON Parse ##
### `JSON.parse()` ###
### Example - Parsing JSON ###
### JSON From the Server ###
### Array as JSON ###
### Exceptions ###
### Browser Support ###

## JSON Stringify ##
### `JSON.stringify()` ###
### Stringify a JavaScript Object ###
### Stringify a JavaScript Array ###
### Exceptions ###
### Browser Support ###

## JSON PHP ##
### The PHP File ###
### The Client JavaScript ###
### PHP Array ###
### The Client JavaScript ###
### PHP Database ###
### Loop Through the Result ###
### PHP Method = POST ###

## JSON HTML ##
### HTML Table ###
### Dynamic HTML Table ###
### HTML Drop Down List ###

## JSON JSONP ##
### JSONP Intro ###
### The Server File ###
### The JavaScript function ###
### Creation of Dynamic Script Tag ###
### Dynamic JSONP Result ###
### Callback Function ###
 
