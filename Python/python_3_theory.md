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
### First Steps Towards Programming ###
## More Control Flow Tools ##
### `if` Statements ###
### `for` Statements ###
### The `range()` Function ###
### `break` and `continue` Statements, and `else` Clauses on Loops ###
### `pass` Statements ###
### Defining Function ###
### More on Defining Functions ###
#### Default Argument Values ####
#### Keyword Arguments ####
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
