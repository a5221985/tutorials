# Python 3 #
## The Python Tutorial ##
1. Easy to learn, powerful programming language.
2. Efficient high-level data structures
3. Simple effective approach to object-oriented programming
4. Elegant syntax, dynamic typing
5. Interpreted
6. For scripting and rapid app development
7. Python interpreted and standard library are free [https://www.python.org/](https://www.python.org)
	1. Source
	2. Binaries
	3. Pointers to free third party Python modules, programs, tools, documentation
8. Can extend Python interpreter in C or C++ (others callable from C)
9. Extension language for customizable apps

### Topics ###
1. Basic concepts and features
2. Python interpreter for hands on experience
3. [Python Standard Library](https://docs.python.org/3/library/index.html#library-index): standard objects and modules
4. [Python Language Reference](https://docs.python.org/3/reference/index.html#reference-index): formal definition of language
5. [Extending and Embedding the Python Interpreter](https://docs.python.org/3/extending/index.html#extending-index), [Python/C API](https://docs.python.org/3/c-api/index.html#c-api-index): To write extensions in C or C++

### What the tutorial is lacking ###
1. Not comprehensive
2. Only noteworthy features

### What will I achieve ###
1. Read and write Python modules and programs
2. Ready to learn about Python library modules [The Python Standard Library](https://docs.python.org/3/library/index.html#library-index)

## Whetting Your Appetite ##
1. What python can do
	1. Automation of tasks
		1. Search and replace over large text files
		2. Rename and rearrange bunch of photo files in a complicated way
	2. Small custom database
	3. Specialized Gui App
	4. Simple game
	5. In traditional C/C++/Java, write/compile/test/re-compile cycle is slow
	6. Extension language
2. Why not Shell or Batch scripting?
	1. Good for moving files and changing texts but not for Gui apps or games
3. Why not C/C++/Java?
	1. Lot of development time
4. Advantages of using Python
	1. Simple to use
	2. Support for large programs
	3. More error checking than C
	4. Has very high level data types built in
		1. Flexible arrays
		2. Dictionaries
	5. Applies to much larger problem domain than Awk, Perl
	6. Program can be split into reusable modules.
	7. Has large collection of standard modules
		1. file I/O
		2. system calls
		3. sockets
		4. interfaces to gui toolkits like Tk
	8. Compact and readable programs can be written (shorter than C/C++/Java programs)
		1. Complex operations can be represented in single statements due to high level data types
		2. No brackets but only indentation
		3. No variable or argument declarations
	9. Extensible: We can add new built-in function or module to interpreter
		1. Example: perform critical operations in maximum speed
		2. Link python programs to binary libraries
		3. Can link python interpreter into application written in C

### Topics ###
1. Mechanics of using interpreter
2. Features of Python language
3. Features of Python system
	1. Expressions
	2. Statements
	3. Data types
	4. Functions
	5. Modules
	6. Exceptions
	7. User defined classes

## Using the Python Interpreter ##
### Invoking the Interpreter ###
1. Location: `/usr/local/bin/python3.6`
	1. Other locations: `/usr/local/python`
	2. Windows: `C:\Python36`
		1. `set path=%path%;C:\Python36`
2. Starting:
	
		python3.6
3. Exiting interpreter:
	1. Unix: [ctrl + D]
	2. Windows: [ctrl + Z]
	3. `quit()` **(M)**
4. Command line editing: `control + p` - beep indicates commandline editing
5. When python interpreter is called with file name, the file is executed
6. `python -c command [args]` **(M)**
7. `python -m module [args]` **(M)**: executes a module source
8. `python -i script` **(M)**: enters interactive mode after running the script

#### Argument Passing ####
1. Arguments passed are turned into a list of strings and assigned to `argv` variable in `sys` module.
2. Access the argument list using `import sys` **(M)**
	1. length of `argv` is atleast one `sys.argv[0]` is empty string.
	2. `-c` is in `sys.argv[0]`, `-m` sets `sys.argv[0]` to full name of located module.

#### Interactive Mode ####
1. `>>>` prompt
2. `...` secondary prompt

### The Interpreter and Its Environment ###
#### Source Code Encoding ####
1. Default encoding `UTF-8` - characters from other languages can be used in literals, ids and comments
2. To set encoding **(M)**
	
		# -*- coding: encoding -*-

		# -*- coding: cp-1252 -*-

3. List of encoding: [codecs](https://docs.python.org/3/library/codecs.html#module-codecs)

## An Informal Introduction to Python ##
1. `...` needs a blank line to end the multiline command
2. `# ...`: comment
	
		# this is the first comment
		spam = 1	# and this is the second comment
					# ... and now a third!
		text = "# This is not a comment because it's inside quotes."

### Using Python as a Calculator ###
1. `python` [enter]

#### Numbers ####
1. Interpreter acts like a calculator

		>>> 2 + 2
		4
		>>> 50 - 5 * 6
		20
		>>> (50 - 5 * 6) / 4
		5.0
		>>> 8 / 5 # division always returns a floating point number
		1.6

2. `int`: type of integers
3. `float`: type of numbers with fractional parts
4. `//` **(M)**: floor division - returns integer

		>>> 17 // 3
		5

5. `%`: modulus operator
6. `**`: power

		>>> 5 *** 2
		25
		>>> 2 *** 7
		128

7. `=`

		>>> width = 20
		>>> height = 5 * 9
		>>> width * height
		900

8. `n`: error
9. mixing integer and floating point numbers will convert integers into floats

		>>> 3 * 3.75 / 1.5	# 3.0 * 3.75 / 1.5
		7.5
		>>> 7 / 2.0			# 7.0 / 2.0
		3.5

10. `_` **(M)** stores last printed expression
	
		>>> tax = 12.5 / 100
		>>> price = 100.50
		>>> price * tax
		12.5625
		>>> price + _
		113.0625
		>>> round(_, 2)
		113.06
	
	1. `_ = <value>` will mask built in behavior and will be treated as a new variable

11. `Decimal`, `Fraction`: other types
12. Complex numbers: There is built in supprt (`j` **(M)** or `J` **(M)** suffix)

		>>> x = 3 + 5j
		
#### Strings ####
1. `'...'`: single quoted string
2. `"..."`: double quoted string
3. `\'`: escape character

		>>> 'spam eggs'
		'spam eggs'
		>>> 'doesn\'t'
		"doesn't"
		>>> '"Yes," he said.'
		'"Yes," he said.'
		>>> "\"Yes,\" he said."
		'"Yes," he said.'
		>>> '"Isn\'t," she said.'
		'"Isn\'t," she said.'
4. Output: string is eclosed in quotes and special characters are escaped
	1. If string contains quots, it is enclosed in double quotes
5. `print(<input>)`: produces readable output

#### Lists ####
1. list: It is a compound data type that groups other values
2. It may contain items of different type
3. Example:

		>>> squares = [1, 4, 9, 16, 25]
		>>> squares
		[1, 4, 9, 16, 25]

4. Lists can be indexed and sliced:
	
		>>> squares[0]
		>>> squares[-1]
		>>> squares[-3:]
		>>> squares[:] # returns a shallow copy of the list
		
5. Concatenation:

		>>> squares + [36, 49, 64, 81, 100]

6. Lists are mutable type

		>>> cubes = [1, 8, 27, 64, 125]
		>>> cubes[3] = 64
		
7. `append()`: to add items to the end of the list
8. Assignment to slices is possible:

		>>> letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
		>>> letters[2:5] = ['C', 'D', 'E']
		>>> letters[2:5] = []
		>>> letters[:] = [] # empty array
		
9. `len(<list>)` **(M)**

		>>> len(letters)
		
10. Nesting lists:

		>>> a = ['a', 'b', 'c']
		>>> n = [1, 2, 3]
		>>> x = [a, n]
		>>> x
		[['a', 'b', 'c'], [1, 2, 3]]
		>>> x[0]
		['a', 'b', 'c']
		>>> x[0][1]
		'b'

### First Steps Towards Programming ###
1. Example: Fibonacci series

		a, b = 0, 1
		while b < 10:
			print(b)
			a, b = b, a + b
			
	1. first line: multiple assignment
	2. last line: multiple assignment
		1. Expressions on right hand side are evaluated first before any assignment takes place
	3. `while` executes as long as the condition is true
		1. non-zero: true
		2. 0: false
		3. anything with non-zero length is true (string, list)
		4. comparison operators are same as in C
	4. body of the loop is indented: for grouping statements
		1. type tab or space for indentation
		2. Blank like indicates completion of the statement
	5. `print()` outputs value of the args given
		1. strings are printed out without quotes
		2. space is inserted between items
		
				>>> i = 256*256
				>>> print('The value of i is', i)
				The value of i is 65536
				
		3. `end='<separator>'` **(M)** used to avoid newline after output
		
				>>> a, b = 0, 1
				>>> while b < 1000:
				...		print(b, end=',')
				...		a, b = b, a + b
				...

## More Control Flow Tools ##
### `if` Statements ###
1. Example:

		if x < 0:
			x = 0
			print('Negative changed to zero')
		elif x == 0:
			print('Zero')
		elif x == 1:
			print('Single')
		else:
			print('More')

### `for` Statements ###
1. Iterates over the items of any sequence in the order that they appear in the sequence
	2. Example:
	
			words = ['cat', 'window', 'defenestrate']
			for w in words:
				print(w, len(w))
				
2. If we have to modify sequence that is being iterated, make a copy and iterate over it

		for w in words[:]:
			if len(w) > 6:
				words.insert(0, w)
				
	1. `for w in words:` would generate an infinite list

### The `range()` Function ###
1. `range(<first>, <last + 1>, <step>)`: generates arithmetic progressions
	1. `<last + 1>` is not the end of the sequence
2. Examples:

		range(10)
		range(5, 10)
		range(0, 10, 3)
		range(-10, -100, -30)
		
3. To iterate over indices of a sequence:

		a = ['Mary', 'had', 'a', 'little'. 'lamb']
		for i in range(len(a)):
			print(i, a[i])
			
4. Use `enumerate()` function instead
5. `range()` just returns successive item when we iterate over it but does not make a list (saving space)
	1. It is *iterable* (something from which functions can obtain successive items until supply is exhausted)
	
6. `list(<iterable>)`: takes iterable as an argument and generates a list

### `break` and `continue` Statements, and `else` Clauses on Loops ###
1. `break` breaks out of smallest enclosing `for` or `while` loop
2. Loop may have else clause:
	1. it is executed when
		1. loop terminates through exaustion of the list
		2. When condition becomes false (with `while`)
	2. It is not executed when
		1. loop is terminated by a `break` (else runs when no break occurs)
3. `continue`: continues with next iteration of the loop

		for num in range(2, 10):
			if num % 2 == 0:
				print('Found an even number', num)
				continue
			print('Found a number', num)

### `pass` Statements ###
1. `pass` does nothing
	1. Used when statement is required syntactically but requires no action
	
			while True:
				pass
				
			class MyEmptyClass:
				pass
				
	2. Used as place holder for function or conditional body while working with new code
	
			def initlog(*args):
				pass

### Defining Function ###
1. Writing fibonacci series to an arbitrary boundary

		def fibonacci(n):
			"""Print a Fibonacci series up to n."""
			a, b = 0, 1
			while b < n:
				print(b, end=' ')
				a, b = b, a + b
		print()
		
2. `def`: defines a function
3. Syntax: `def <function-name>(<list-of-params>):`
	1. body: must start from next line and must be indented
		1. First statement: documentation string (optional) [Documentation Strings](https://docs.python.org/3/tutorial/controlflow.html#tut-docstrings) - There are tools to automatically produce online or printed documentation
4. Execution of a function introduces a new symbol table used for local variables of the function.
	1. all variable assignments in a function store the value in local symbol table
		1. Global variables cannot be assigned a value in a function but can be referenced
	2. Variable reference:
		1. First looked up in local symbol table.
		2. If not found, looked up in local symbol tables of enclosing functions
		3. If not found, looked up in global symbol table
		4. If not found, looked up in table of built in names
	3. Parameters:
		1. introduced in local symbol table of called function when it is called
			1. Call by value (value is object reference)
	4. Function call: A new symbol table is created for each function call
5. Function definition introduces function name in the current symbol table.
	1. value of function name: type - user defined function
	2. Value of one function can be assigned to another function name which can be used as a function
	
			f = fib
			f(100)
			
6. A function that does not have a return statement returns `None`
7. Example:

		def fib2(n):
			"""Return a list containing the Fibonacci series up to n"""
			result = []
			a, b = 0, 1
			while b < n:
				result.append(b)
				a, b = b, a + b
			return result
			
		f100 = fib2(100)
		print(f100)
		
	1. `return`: returns a value from a function
		1. Without expression, the value is `None`
		2. Falling off the end of function also returns `None`
	2. `result.append(a)`: call to a method of list object `result`
		1. method: it is a function that belongs to an object
			1. Different types define different methods
			2. We can define our own methods using `Class`es
		2. `append`: adds a new element to the end of the list
			1. `result = result + [a]` but it is more efficient

### More on Defining Functions ###
1. Function can be defined with variable number of arguments
2. Three forms:
	1. Default argument values
	2. Keyword Arguments
	3. Arbitrary argument list

#### Default Argument Values ####
1. Function that can be called with fewer arguments than it is defined to allow

		def ask_ok(prompt, retires=4, reminder='Please try again!'):
			while True:
				ok = input(prompt)
				if ok in ('y', 'ye', 'yes'):
					return True
				if ok in ('n', 'no', 'nop', 'nope'):
					return False
				retries = retries - 1
				if retries < 0:
					raise ValueError('invalid user response')
				print(reminder)
				
	1. Function can be called with
		1. mandatory arguments only: `ask_ok('Do you really want to quit?')`
		2. one of the optional arguments: `ask_ok('OK to overwrite the file?', 2)`
		3. Giving all arguments: `ask_ok('OK to overwrite the file?', 2, 'Come on, only yes or no!')`
	2. `in`: used to test whether a sequence contains certain value
2. Default values are evaluated at the point of function definition in defining scope

		i = 5
		
		def f(arg=i):
			print(arg) # prints 5
			
		i = 6
		f()
		
	1. Default value is evaluated only once
		1. If same function is called over and over, only the first call gets the default value (for mutable objects like lists, dictionaries, ... the values get accumulated on subsequent calls to the same function)
		
				def f(a, L=[]): # evaluated only once when the function definition is processed
					L.append(a)
					return L
					
				print(f(1))
				print(f(2))
				print(f(3))
				
		2. If default must not be shared across multiple calls, rewrite the function as below:
		
				def f(a, L = None):
					if L is None:
						L = []
					L.append(a)
					return L

#### Keyword Arguments ####
1. Functions can be called with keyword arguments of the form `kwarg=value`

		def parrot(voltage, state='a stiff', action='voom', type='Norwegian Blue'):
			print("-- This parrot wouldn't', action, end=' ')
			print("if you put", voltage, "volts through it.")
			print("-- Lovely plumage, the", type)
			print("-- It's", state, "!")
			
		parrot(1000)
		parrot(voltage=1000)
		parrot(voltage=1000, action='VOOOOOM')
		parrot(action='VOOOOOM', voltage=1000000)
		parrot('a million', 'bereft of life', 'jump')
		parrot('a thousand', state='pushing up the daisies')
		
2. Keyword arguments must follow positional arguments:

		parrot(voltage=5.0, 'dead') # invalid
		
3. An argument must not receive a value more than once

		parrot(220, voltage=5.0) # invalid
		
4. `**keywords`: parameter that receives a dictionary containing all keyword arguments except format parameters
5. `*name`: receives a tuple containing positional arguments beyond formal parameter list (must appear before `**keywords`)

		def cheeseshop(kind, *arguments, **keywords):
			print("-- Do you have any", kind, "?")
			print("-- I'm sorry, we're all out of", kind)
			for arg in arguments:
				print(arg)
			print("-" * 40)
			for kw in keywords:
				print(kw, ":", keywords[kw])
				
		cheeseshop("Limburger", "It's very runny, sir", "It's really very, VERY runny, sir.", shopkeeper="Michael Palin", Client="John Cleese", sketch="Cheese shop Sketch")

#### Arbitrary Argument Lists ####
#### Unpacking Argument Lists ####
#### Lambda Expressions ####
#### Documentation Strings ####
#### Function Annotations ####
### Intermezzo: Coding Style ###

## Data Structures ##
### More on Lists ###
#### Using Lists as Stacks ####
#### Using Lists as Queues ####
#### List Comprehensions ####
#### Nested List Comprehensions ####
### The `del` statement ###
### Tuples and Sequences ###
### Sets ###
### Dictionaries ###
### Looping Techniques ###
### More on Conditions ###
### Comparing Sequences and Other Types ###

## Modules ##
### More on Modules ###
#### Executing modules as scripts ####
#### The Module Search Path ####
#### "Compiled" Python files ####
### Standard Modules ###
### The `dir()` ###
### Packages ###
#### Importing * From a Package ####
#### Intrapackage ####
#### Packages in Multiple Directories ####

## Input and Output ##
### Fancier Output Formatting ###
#### Old string formatting ####
### Reading and Writing Files ###
#### Methods of File Objects ####
#### Saving structured data with `json` ####

## Errors and Exceptions ##
### Syntax Errors ###
### Exceptions ###
### Handling Exceptions ###
### Raising Exceptions ###
### User-defined Exceptions ###
### Defining Clean-up Actions ###
### Predefined Clean-up Actions ###

## Classes ##
### A Word About Names and Objects ###
### Python Scopes and Namespaces ###
#### Scopes and Namespaces Example ####
### A First Look at Classes ###
#### Class Definition Syntax ####
#### Class Objects ####
#### Instance Objects ####
#### Method Objects ####
#### Class and Instance Variables ####
### Random Remarks ###
### Inheritance ###
#### Multiple Inheritance ####
### Private Variables ###
### Odds and Ends ###
### Iterators ###
### Generators ###
### Generator Expressions ###

## Brief Tour of the Standard Library ##
### Operating System Interface ###
### File Wildcards ###
### Command Line Arguments ###
### Error Output Redirection and Program Termination ###
### String Pattern Matching ###
### Mathematics ###
### Internet Access ###
### Dates and Times ###
### Performance Measurement ###
### Quality Control ###
### Batteries Included ###

## Brief Tour of the Standard Library - Part II ##
### Output Formatting ###
### Templating ###
### Working with Binary Data Record Layouts ###
### Multi-threading ###
### Logging ###
### Weak References ###
### Tools for Working with Lists ###
### Decimal Floating Point Arithmetic ###

## Virtual Environments and Packages ##
### Introduction ###
### Creation of Virtual Environments ###
### Managing Packages with pip ###

## What Now? ##

## Interactive Input Editing and History Substitution ##
### Tab Completion and History Editing ###
### Alternatives to the Interactive Interpreter ###

## Floating Point Arithmetic: Issues and Limitations ##
### Representation Error ###

## Appendix ##
### Interactive Mode ###
#### Error Handling ####
#### Executable Python Scripts ####
#### The Interactive Startup File ####
#### The Customization Modules ####