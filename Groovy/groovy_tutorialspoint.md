# Groovy Tutorial #

## Groovy - Home ##
1. It is an object oriented language based on Java platform
2. Latest version: 2.4
3. Fundamentals of Groovy and how to put it into practice

### Audience ###
1. Who wants to learn the basics of Groovy programming

### Prerequisites ###
1. Java (or similar OO language)

## Groovy - Overview ##
### Features of Groovy ###
1. Support for static and dynamic typing
2. Support for operator overloading
3. Native syntax for lists and associative arrays
4. Native support for regular expressions
5. Native support for various markup languages such as XML and HTML
6. Syntax is similar to Java
7. We can use Java libraries in Groovy
8. Extends `java.lang.Object`

### Official website ###
1. [http://www.groovy-lang.org/](http://www.groovy-lang.org/)

## Groovy - Environment ##
### Binary download and installation ###
1. Visit [www.groovy-lang.org/download.html](www.groovy-lang.org/download.html)
2. Goto Windows Installer section
3. Click on option to download
4. Open the installer
5. Follow the wizard
6. Run command `groovysh` from command prompt

### Installation for Mac OSX ###
1. Install sdkman:
	1. `curl -s "https://get.sdkman.io" | bash`
	2. `source "$HOME/.sdkman/bin/sdkman-init.sh"`
	3. `sdk version`
2. Install groovy:
	1. `sdk install groovy`
	2. `groovy -version`

### Gradle ###
1. `'org.codehaus.groovy:groovy:2.4.5`: include it as part of gradle build

### Maven ###

		<groupId>org.codehaus.groovy</groupId>
		<artifactId>groovy</artifactId>
		<version>2.4.5</version>

## Groovy - Basic Syntax ##
### Creation of First Hello World Program ###
1. Example:

		class Example {
			static void main(String[] args) {
				// Using a simple println statement to print output to the console
				println('Hello World!');
			}
		}

### Import Statement in Groovy ###
1. `import` imports functionality of other libraries
2. Example: `MarkupBuilder` class for generating HTML or XML markup
	
		import groovy.xml.MarkupBuilder
		dev xml = new MarkupBuilder()

3. Following libraries are automatically imported by Groovy:

		import java.lang.*
		import java.util.*
		import java.io.*
		import java.net.*

		import groovy.lang.*
		import groovy.util.*

		import java.math.BigInteger
		import java.math.BigDecimal

### Tokens in Groovy ###
1. token: keywork, identifier, string literal, symbol
	1. Example: `println("Hello World")`
		1. Token 1: `println`
		2. Token 2: `"Hello World"`

### Comments in Groovy ###
1. `// Single line comment`
2. `/* Multiline comment */`

### Semicolons ###
1. Used to distinguish between multiple statements

		class Example {
			static void main(String[] args) {
				// One can see the use of a semi-colon after each statement
				def x = 5;
				println('Hello World');
			}
		}

### Identifiers ###
1. Used to define variables, functions
	1. Start with letter, $ or _ (no number)
2. Examples:
	1. `def employeename`
	2. `def student1`
	3. `def student_name`
3. `def` defines an identifier
4. Example:

		class Example {
			static void main(String[] args) {
				// One can see the use of a semi-colon after each statement
				def x = 5;
				println('Hello World');
			}
		}

### Keywords ###
1. Special reserved words:
	1. **`as`**
	2. **`assert`**
	3. `break`
	4. `case`
	5. `catch`
	6. `class`
	7. `const`
	8. `continue`
	9. **`def`**
	10. `default`
	11. `do`
	12. `else`
	13. `enum`
	14. **`extends`**
	15. `false`
	16. `finally`
	17. `for`
	18. **`goto`**
	19. `if`
	20. `implements`
	21. `import`
	22. **`in`**
	23. `instanceof`
	24. `interface`
	25. `new`
	26. **`pull`**
	27. `package`
	28. `return`
	29. `super`
	30. `switch`
	31. `this`
	32. `throw`
	33. `throws`
	34. **`trait`**
	35. `true`
	36. `try`
	37. `while`

### Whitespaces ###
1. blanks, tabs, newline characters and comments
2. Separates one part of statement from another
3. Example:

		def x = 5;

### Literals ###
1. notation that represents fixed value in groovy
2. For
	1. integer: `12`
	2. floating-point number: `1.45`
	3. character: `'a'`
	4. string: `"string"`

## Groovy - Data Types ##
1. Variables: reserved memory locations to store values
2. Based on datatype OS allocates memory and decides waht can be stored in the reserved memory

### Built-in Data Types ###
1. Datatypes:
	1. `byte`
	2. `short`
	3. `int`
	4. `long`
	5. `float`
	6. `double`
	7. `char`
	8. `boolean`
	9. `String`

### Bound values ###
1. Ranges:
	1. `byte`: -128 to 127
	2. `short`: -32,768 to 32,767
	3. `int`: -2,147,483,648 to 2,147,483,647
	4. `long`: ...
	5. `float`: ...
	6. `double`: ... 

### Class Numeric ###
1. Wrapper types:
	1. `java.lang.Byte`
	2. `java.lang.Short`
	3. `java.lang.Integer`
	4. `java.lang.Long`
	5. `java.lang.Float`
	6. `java.lang.Double`
2. For arbitrary precision arithmetic:
	1. `java.math.BigInteger`: `30g`
		1. Immutable signed integer
	2. `java.math.BigDecimal`: `3.5g`
		1. Immutable signed decimal
3. Example:

		class Example {
			static void main(String[] args) {
				// Example of an int datatype
				int x = 5;

				// Example of a long datatype
				long y = 100L;

				// Example of a double datatype
				double b = 10.5e40;

				// Example of a BigInteger datatype
				BigInteger bi = 30g;

				// Example of a BigDecimal datatype
				BigDecimal bd = 3.5g;

				println(x);
				println(y);
				println(a);
				println(b);
				println(bi);
				println(bd);
			}
		}

## Groovy - Variables ##
1. Two ways to define:
	1. native syntax (`int x = 5`)
	2. using `def` (`def x = 5`)
2. Mandatory to declare using either syntax before using them

### Variable Declarations ###
1. Declaration tells compiler where and how much of storage to allocate
2. Example:

		class Example {
			static void main(String[] args) {
				// x is defined as a variable
				String x = "Hello";

				// The value of the variable is printed to the console
				println(x);
			}
		}

### Naming Variables ###
1. Must begin with letter or _.
2. They are case sensitive
3. Example:

		class Example {
			static void main(String[] args) {
				// Defining a variable in lowercase
				int x = 5

				// Defining a variable in uppercase
				int X = 6
				
				// Defining a variable with the underscore in it's name
				def _Name = 'Joe'

				println(x)
				println(X)
				println(_Name)
			}
		}

### Printing Variables ###
1. Example:

		class Example {
			static void main(String[] args) {
				// Initializing 2 variables
				int x = 5
				int X = 6

				// Printing the value of the variables to the console
				println('The value of x is ' + x + ' The value of X is ' + X)
			}
		}

## Groovy - Operators ##
1. Operator is a symbol that tells compiler to perform specific mathematical or logical manipulations
2. Types of operators:
	1. Arithmetic operators
	2. Relational operators
	3. Logical operators
	4. Bitwise operators
	5. Assignment operators

### Arithmetic Operators ###
1. `+`, `-`, `*`, `/`, `%`, `++`, `--`

### Relational operators ###
1. `==`, `!=`, `<`, `<=`, `>`, `>=`

### Logical Operators ###
1. `&&`, `||`, `!`

### Bitwise Operators ###
1. `&`, `|`, `^`, `~`

### Assignment operators ###
1. `+=`
2. `-=`
3. `*=`
4. `/=`
5. `%=`

### Range Operators ###
1. `min..max` **(M)**
2. Example: `def range = 0..5`

		class Example {
			static void main(String[] args) {
				def range = 5..10
				println(range)
				println(range.get(2))
			}
		}

	1. `get`: takes index

## Groovy - Loops ##
### Loop Control Statements ###
1. **While statement**
	1. Syntax:

			while(condition) {
				statement #1
				statemtnt #2
				...
			}

	2. Example:

			class Example {
				static void main(String[] args) {
					int count = 0

					while(count < 5) {
						println(count)
						count++
					}
				}
			}

2. **For Statement**
	1. Syntax:

			for(variable declaration; expression; increment) {
				statement #1
				statement #2
				...
			}

	2. Classic for statement parts:
		1. variable declaration: executed only once for entire loop
		2. expression: evaluated for each iteration of loop
		3. increment: logic for incrementing variable(s)
	3. Example:

			class Example {
				static void main(String[] args) {
					for(int i = 0; i < 5; i++) {
						println(i)
					}
				}
			}

3. **For-in Statement**
	1. Syntax:

			for(variable in range) {
				...
			}

	2. Example:

			class Example {
				static void main(String[] args) {
					int[] array = [0, 1, 2, 3];

					for(int i in array) {
						println(i);
					}
				}
			}

	3. Example:

			class Example {
				static void main(String[] args) {
					for(int i in 1..5) {
						println(i)
					}
				}
			}

	4. Example:

			class Example {
				static void main(String[] args) {
					def employee = ["Ken": 21, "John": 25, "Sally": 22]

					for(emp in Employee) {
						println(emp)
					}
				}
			}

## Groovy - Decision Making ##

## Groovy - Methods ##
### Method Parameters ###
### Default Parameters ###
### Method Return Values ###
### Instance methods ###
### Local and External Parameter Names ###
### this method for Properties ###

## Groovy - File I/O ##
### Reading files ###
### Reading the Contents of a File as an Entire String ###
### Writing to Files ###
### Getting the Size of a File ###
### Testing if a File is a Directory ###
### Creation of a Directory ###
### Deleting a File ###
### Copying files ###
### Getting Directory Contents ###

## Groovy - Optionals ##

## Groovy - Numbers ##
### Example ###
### Number Methods ###

## Groovy - Strings ##
### String Indexing ###
### Basic String Operations ###
### String Methods ###

## Groovy - Ranges ##

## Groovy - Lists ##

## Groovy - Maps ##

## Groovy - Dates & Times ##
### `Date()` ###
### `Date(long millisec)` ###

## Groovy - Regular Expressions ##

## Groovy - Exception Handling ##
### Catching Exceptions ###
### Multiple Catch Blocks ###
### Finally Block ###

## Groovy - Object Oriented ##
### getter and setter Methods ###
### Instance Methods ###
### Creation of Multiple Objects ###
### Inheritance ###
### Extends ###
### Inner Classes ###
### Abstract Classes ###
### Interfaces ###

## Groovy - Generics ##
### Generic for Collections ###
### Generalized Classes ###

## Groovy - Traits ##
### Implementing Interfaces ###
### Properties ###
### Composition of Behaviors ###
### Extending Traits ###

## Groovy - Closures ##
### Formal parameters in closures ###
### Closures and Variables ###
### Using Closures in Methods ###
### Closures in Collections and String ###
### Methods used with Closures ###

## Groovy - Annotations ##
### String Type ###
### Enum type ###
### Class type ###
### Annotation Member Values ###
### Closure Annotation Parameters ###
### Meta Annotations ###

## Groovy - XML ##
### What is XML? ###
### XML Support in Groovy ###
### XML Markup Builder ###
### XML Parsing ###

## Groovy - JMX ##
### Monitoring the JVM ###
### Monitoring Tomcat ###

## Groovy - JSON ##
### JSON Functions ###
### Parsing Data using JsonSluper ###
### JsonOutput ###

## Groovy - DSLS ##

## Groovy - Database ##
### Database Connection ###
### Creation of Database Table ###
### Insert Operation ###
### READ Operation ###
### Update Operation ###
### DELETE Operation ###
### Performing Transactions ###
### Commit Operation ###
### Rollback Operation ###
### Disconnecting Databases ###

## Groovy - Builders ##
### Swing Builder ###
### Event Handlers ###
### DOM Builder ###
### JsonBuilder ###
### NodeBuilder ###
### FileTreeBuilder ###

## Groovy - Command Line ##
### Classes and Functions ###
### Commands ###

## Groovy - Unit Testing ##
### Writing a Simple Junit Test Case ###
### The Groovy Test Suite ###

## Groovy - Template Engines ##
### Simple Templating in Strings ###
### Simple Template Engine ###
### StreamingTemplateEngine ###
### XMLTemplateEngine ###

## Groovy - Meta Object Programming ##
### Missing Properties ###
### Missing methods ###
### Metaclass ###
### Method Missing ###
