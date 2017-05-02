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
1. A function that can be called with arbitrary number of arguments can be defined.
	1. Arguments will be wrapped up in tuple when called
	2. Zero or more normal arguments may occur before the variable number of arguments
2. Example:

		def write_multiple_items(file, separator, *args):
			file.write(separator.join(args))
			
3. The variadic arguments are usually last in the list
4. Any arguments which occur after `*args` are keyword-only arguments.

		def concat(*args, sep='/'):
			return sep.join(args)

#### Unpacking Argument Lists ####
1. If arguments are already in a list or tuple, they must be unpacked for a function call requiring separate positional arguments.
2. Example:

		args = (2, 7)
		list(range(*args) # call with arguments unpacked from a list
		
3. Dictionaries can deliver keyword arguments with `**` operator

		d = {'voltage': 'four million', 'state': "bleedin' demised", 'action': 'VOOM'}
		parrot(**d)

#### Lambda Expressions ####
1. Anonymous functions can be defined using `lambda` keyword

		lambda a, b: a + b
		
2. It can be used wherever function objects are required
3. Lambda expressions can reference variables frm containing scope

		def make_incrementor(n):
			return lambda x: x + n
			
		f = make_incrementor(42)
		f(0)
		f(1)
		
4. Another use: Pass function as an argument

		pairs = [(1, 'one'), (2, 'two'), (3, 'three'), (4, 'four')]
		pairs.sort(key=lambda pair: pair[1])
		pairs

#### Documentation Strings ####
1. First line: a short summary of object's purpose
	1. No object's name or type
	2. Begins with a capital letter and ends with a period
2. Second line: Blank (if there are more lines)
3. Subsequent lines: paragraphs describing object's calling conventions and side effects
4. Tools that have to process documentation must strip indentation if required (Python does not strip indentation of multiline string literal)
	1. Whitespace equivalent to the indentation of second blank line is stripped fro the start of all lines of the string
5. Example:

		def my_function():
			"""Do nothing, but document it.
			  
			No really, it doesn't do anything.
			"""
			pass
			
		print(my_function.__doc__)
			

#### Function Annotations ####
1. Function annotations are optional metadata information about types used by user-defined functions.
2. They are stored in `__annotations__` attribute of the function as a dictionary. (No effect on any other part of the function)
3. Parameter annotations: Defined by colon after parameter name followed by an expression evaluating to the value of the annotation
4. Return annotations: Defined by `->` followed by an expression between the parameter list and the colon denoting the end of `def` statement.
5. Example:

		def f(cheeze: str, eggs: str = 'eggs') -> str:
			print('Annotations:', f.__annotations__)
			print('Arguments:', cheeze, eggs)
			return cheeze + ' and ' + eggs
			
		f('American')

### Intermezzo: Coding Style ###
1. `PEP 8`: coding style guide for python
2. Key points:
	1. Use 4-space indentation (no tabs)
	2. Wrap lines so that they don't exceed 79 characters
	3. Use blank lines to separate functions and classes, and larger blocks of code inside functions
	4. When possible, put comments on a line of their own
	5. Use docstrings
	6. Use spaces around operators and after commas, but not directly inside bracketing constructs
	
			a = f(1, 2) + g(3, 4)
			
	7. Name classes and functions consistently
		1. Use camel case for classes
		2. Use lowercase with underscores for functions and methods
		3. Use `self` as the name of the first method argument
	8. Don't use fancy encoding if code is meant to be used in international environments (Default: UTF-8 or ASCII)
	9. Don't use non ASCII characters in identifiers if there is only slightest chance people speaking a different language will read or maintain the code.

## Data Structures ##
### More on Lists ###
1. Methods of list object
	1. `list.append(x)`: Adds an item to the end of the list (`a[len(a):] = [x]`)
	2. `list.extend(iterable)`: Extend the list by appending all items from the iterable (`a[len(a):] = iterable`)
	3. `list.insert(i, x)`: Insert an item at the given position
		1. `i`: index of the element before which to insert
		2. `a.insert(0, x)`: inserts at the front of the list
		3. `a.insert(len(a), x)`: inserts at the back of the list (`a.append(x)`)
	4. `list.remove(x)`: Removes the first occurrence of x from the list. An error is thrown if there is no such item
	5. `list.pop([i])`: Removes item at the given position in the list and return it. `list.pop()`: removes and returns the last element from the list.
	6. `list.clear()`: Removes all items from the list (`del a[:]`)
	7. `list.index(x[, start[, end]])`: return index of the first item whose value is x (`ValueError` if there is no such item)
		1. `start`, `end`: limit to search to a slice of the list
			1. Index is relative to the full list only
	8. `list.count(x)`: Returns the number of times, x appears in the list
	9. `list.sort(key=None, reverse=False)`:
		1. `key`
		2. `reverse`: reverse sort?
	10. `list.copy()`: returns a shallow copy of the list `a[:]`
2. Example:

		fruits = ['orange', 'apple', 'peer', 'banana', 'kiwi', 'apple', 'banana']
		fruits.count('apple')
		fruits.count('tangerine')
		fruits.index('banana')
		fruits.index('banana', 4)
		fruits.reverse()
		fruits
		fruits.sort()
		fruits
		fruits.pop()
		
	1. `insert`, `remove` or `sort` return `None` (design principle for all mutable data structures in Python)

#### Using Lists as Stacks ####
1. `append()`: to add an item to the top of the stack
2. `pop()`: to retrieve an item from the top of the stack
3. Example:

		stack = [3, 4, 5]
		stack.append(6)
		stack.append(7)
		stack
		stack.pop()
		stack
		stack.pop()
		stack.pop()
		stack

#### Using Lists as Queues ####
1. Using lists as queues is slow (inserting and popping elements from the beginning of a list is in efficient)
2. Use `collections.deque` which has fast appends and pops from both ends:

		from collections import deque
		queue = deque(['Eric', 'John', 'Michael'])
		queue.append('Terry')
		queue.append('Graham')
		queue.popleft()
		queue.popleft()
		queue

#### List Comprehensions ####
1. It is a concise way of building lists.
	1. Example: building a new list where each element is the result of some operations applied to each member of another sequence or iterable
	2. Example: build a subsequence of elements that satisfy certain condition
2. Example: List of squares

		squares = []
		for x in range(10):
			squares.append(x ** 2)
			
		squares
		
	1. `x` exists as a side effect even after the completion of the loop
3. Creation of lists without any side effects

		squares = list(map(lambda x: x ** 2, range(10)))
		
		squares = [x ** 2 for x in range(10)] # more concise and readable
		
	1. Second statement uses list comprehension
4. List comprehension:
	1. It consists of brackets containing an expression followed by a for clause then 0 or more for or if clauses
	
			[(x, y) for x in (1, 2, 3) for y in (3, 1, 4) if x != y]
			
		1. It is equivalent to:
		
				combs = []
				for x in (1, 2, 3):
					for y in (3, 1, 4):
						if x != y:
							combs.append((x, y))
							
				combs
				
		2. It the expression is tuple, it must be paranthesized
		
				vec = [-4, -2, 0, 2, 4]
				[x * 2 for x in vec]
				[x for x in vec if x >= 0]
				[abs(x) for x in vec]
				
				freshfruit = ['   banana', '   loganberry', 'passion fruit   ']
				[weapon.strip() for weapon in freshfruit]
				
				[(x, x ** 2) for x in range(6)]
				
				# flatten a list
				vec = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
				[num for elem in vec for num in elem]
				
	2. List comprehensions can contain nested functions and complex expressions
	
			from math import pi
			[str(round(pi, i)) for i in range(1, 6)]

#### Nested List Comprehensions ####
1. Initial expression in list comprehension can be any expression including another list comprehension
2. Example:

		matrix = [
			[1, 2, 3, 4],
			[5, 6, 7, 8],
			[9, 10, 11, 12]
		]
		
		[[row[i] for row in matrix] for i in range(4)]

	1. The above is equivalent to:
	
			transpose = []
			for i in range(4):
				transpose.append([row[i] for row in matrix])
				
	2. The above in turn is:
	
			transpose = []
			for i in range(4):
				transpose_row = []
				for row in matrix:
					transpose_row = row[i]
				transpose.append(transpose_row)
				
3. Using built in functions instead of the above:
	1. `list(zip(*matrix))`
		1. `*matrix`: unpacks of into argument list

### The `del` statement ###
1. It is used to remove slices from a list or clear a list
2. Examples:

		a = [-1, 1, 66.25, 333, 333, 1234.5]
		del(a[0])
		del(a[2:4])
		del(a[:]) # clears the list
		
3. `del` can be used to delete entire variables

		del a

### Tuples and Sequences ###
1. Tuple is a sequence type
2. It consists of values separated by commas

		t = 1234, 54321, 'hello!'
		t[0]
		t
		
		u = t, (1, 2, 3, 4, 5) # tuples may be nested
		u
		
		t[0] = 8888 # tuples are immutable
		
		v = ([1, 2, 3], [3, 2, 1]) # tuples can contain mutable objects
		
	1. tuples may be enclosed in parantheses so that nested tuples are interpreted correctly
	2. tuples are immutable and often contain heterogeneous sequence of elements accessed via unpacking or indexing (attributes in the case of named tuples)
	3. Lists are mutable and their elements are usually homogeneous
2. Empty tuples:
	1. Constructed using empty pair of parantheses
	
			empty = ()
			
3. Tuples with single value: follow the value with a comma (not sufficient to enclose a single value in parantheses)

		singleton = 'hello',
		len(empty)
		len(singeton)
		singleton
		
4. Sequence Unpacking:

		x, y, z = t # t is any sequence

### Sets ###
1. Set is an unordered collection with no duplicates
2. Uses:
	1. membership testing
	2. Eliminating duplicates
	3. Perform set operations:
		1. Union
		2. Intersection
		3. Difference
		4. Symmetric difference
		
3. Use `set` or `{ ... }` for building a set
	1. Do not used `{}` for empty set but use `set()` because the former constructs an empty dictionary
4. Example:

		basket = {'apple', 'orange', 'apple', 'peer', 'orange', 'banana'}
		print(basket)
		
		'orange' in basket
		'crabgrass' in basket
		
		a = set('abracadabr')
		b = set('alacazam')
		print(a)
		print(b)
		a - b
		a | b
		a & b
		a ^ b # XOR

5. Set comprehensions are also supported

### Dictionaries ###
1. Dictionaries are indexed by keys
	1. key: it can be of any immutable type
		1. If tuples contain only strings, numbers and tuples (it cannot contain mutable objects either directly or indirectly)
2. Dictionary is an unordered set of key, value pairs (keys must be unique in a dictionary)
3. Empty dictionary:

		{}
		
4. Comma separated values inside braces: adds initial key:value pairs
5. Main operations:
	1. Storing a value with a key
	2. Retrieving a value given a key
	3. `del` can delete a key value pair
6. Retriving a value using non-existant key: error
7. Retrieving a list of keys:

		list(d.keys())
		
8. Sorted list of keys:

		sorted(d.keys())
		
9. Check if a key is in dictionary: use `in`
10. Exampe:

		tel = {'jack': 4098, 'sape': 4139}
		tel['guido'] = 4127
		tel
		tel['jack']
		
		del tel['sape']
		tel['irv'] = 4127
		tel
		
		list(tel.keys())
		
		'guido' in tel
		
		'jack' in tel
		
11. `dict()`: builds a dictionary from a sequence of key value pairs

		d = dict([('sape', 4139), ('guido', 4127), ('jack', 4098)])
		print(d)
		
12. Dictionary comprehensions are supported:

		{x: x ** 2 for x in (2, 4, 6)}
		
13. keyword arguments are supported if keys are simple strings for `dict()`

		dict(sape=4139, guido=4127, jack=4098)

### Looping Techniques ###
1. Looping through dictionary:
	1. Retrieve both key and value at the same time using `items()` method
	
			knights = {'gallahad': 'the pure', 'robin': 'the brave'}
			for k, v in knights.items():
				print(k, v)
				
2. Looping through sequence:
	1. Retrieve position index and corresponding value using `enumerate()` function
	
			for i, v in enumerate(['tic', 'tac', 'toe']):
				print(i, v)
				
3. To loop over multiple sequences at the same time, use `zip` function to pair the entries

		questions = ['name', 'quest', 'favorite color']
		answers = ['lancelot', 'the holy grail', 'blue']
		for q, a in zip(questions, answers):
			print('What is your {0}? It is {1}.'.format(q, a))
			
4. Looping over a sequence in reverse: specify sequence in the forward direction and then use `reversed()` function

		for i in reversed(range(1, 10, 2):
			print(i)
			
5. Looping over a sequence in sorted order using `sorted()` function (returns a new sorted list)

		basket = ['apple', 'orange', 'apple', 'pear', 'orange', 'banana']
		for f in sorted(set(basket)):
			print(f)
			
6. It is safer to have a new list for iterations:

		import math
		raw_data = [56.2, float('NaN'), 51.7, 55.3, 52.5, float('NaN'), 47.8]
		flitered_data = []
		for value in raw_data:
			if not math.isnan(value):
				filtered_data.append(value)
				
		filtered_data
 
### More on Conditions ###
1. `in`, `not in`: check if a value occurs or does not occur in a sequence
2. `is`, `is no`: checks if two objects are really the same objects or not (for mutable objects)
3. Comparison operators have lower priority than all numerical operators
4. Comparisons can be chained:

		a < b == c
		
5. Comparisons may be combined used boolean operators such as `and`, `or`
	1. `not` negates the outcome of boolean expressions
	2. The operators have lower priorities than comparison operators
	3. `not` has highest priority and `or` the lowest among them
	
			A and not B or C -> (A and (not B)) or C
			
6. `and` and `or` are short circuit operators:
	1. Arguments are evaluated from left to right and evaluation stops as soon as the outcome is determined
		1. If A and C are true but B is false, A and B and C does not evaluate the expression C
		2. The return value of a short circuit argument is the last evaluated argument
7. Result of a boolean expression can be assigned to a variable

		string1, string2, string3 = '', 'Trondheim', 'Hammer Dance'
		not_null = string1 or string2 or string3
		not_null # Trondeim
		
8. Note: Assignments cannot occur inside expressions (Unline in C)

### Comparing Sequences and Other Types ###
1. Sequence objects of same sequence types can be compared with each other
	1. Lexicographical ordering of comparison: first two items are compared, and if they are different, this determines the outcome
		1. If they are equal the next two items are compared
		2. Continued until either sequence is exhausted
		3. If items are sequences of the same type, the comparison is continued recursively
		4. If all items of a sequence are equal they are considered equal
	2. If a sequence is a sub-sequence of the other, the smaller sequence is the lesser one
	3. Lexicographical ordering for strings uses Unicode code point number to order individual characters
2. Examples:

		(1, 2, 3) < (1, 2, 4)
		[1, 2, 3] < [1, 2, 4]
		'ABC' < 'C' < 'Pascal' < 'Python'
		(1, 2, 3, 4) < (1, 2, 4)
		(1, 2) < (1, 2, -1)
		(1, 2, 3) == (1.0, 2.0, 3.0)
		(1, 2, ('aa', 'ab')) < (1, 2, ('abc', 'a'), 4)
		
	1. Comparison using `<` and `>` are legal if objects have appropriate comparison methods (0 equals 0.0 ...)
		1. Interpreter might raise `TypeError` otherwise

## Modules ##
1. We may want to use a handy function that we've written in several programs without copying its definition into each program.
2. module: A file which consists of definitions that can be used in a script
	1. Definition of a module can be imported into other modules or into main module (collection of variables in a script at the top level)
	2. Contains python definitions and statements
	3. file name must hava a suffix of `.py`
		1. module's name is available within the module as a string value of global variable `__name__`
3. Example: fibo.py

		# Fibonacci numbers module
		
		def fib(n):
			a, b = 0, 1
			while b < n:
				print(b, end=' ')
				a, b = b, a + b
			print()
			
		def fib2(n):
			result =[]
			a, b = 0, 1
			while b < n:
				result.append(b)
				a, b = b, a + b
			return result
			
4. Importing the module:

		import fibo
		
5. Accessing the functions:

		fibo.fib(1000)
		fibo.fib2(100)
		fibo.__name__
		
6. A function can be assigned to a local name:

		fib = fibo.fib
		fib(500)

### More on Modules ###
1. Module can contain 
	1. executable statements: intended to initialize the module
		1. executed only the first time they are encountered in `import` statement
		2. executed if file is run as a script
	2. Function definitions
2. Each module has a private symbol table used as global symbol table by all functions in the module
	1. the gobal variables of a module do not clash with the global variables of the importing script
	2. Modules global variables can be accessed using `modulename.itemname` **(M)**
3. Imported module names are placed in importing module's global symbol table
4. Importing names from a module directly:

		from fibo import fib, fib2 # module name is not introduced in local symbol table (fibo is not defined)
		fib(500)
		
		from fibo import * # imports all names defined except those beginning with `_`
		fib(500)
		
	1. Not recommended because it may introduce some unknown set of parameters and hide things defined locally
5. Each module is imported only once per interpreter session. To reload the module use `importlib.reload()`

		import importlib; importlib.reload(modulename)

#### Executing modules as scripts ####
1. When a python module is executed as a script directly, `__name__` is set to `__main__` so enter the following code at the end of the module:

		if __name__ == '__main__':
			import sys
			fib(int(sys.argv[1]))
			
	1. The code in the if statement is executed only if the module is run as the main file
2. Uses:
	1. Provide convenient user interface to the module
	2. Run a test suite

#### The Module Search Path ####
1. Interpreter first searches for a built in module with the name
2. If not found, it searches for a file named <module>.py in a list of directories given by variable `sys.path`
	1. `sys.path`:
		1. Directory containing input script (or current directory when no file is specified)
		2. `PYTHONPATH`: list of directory names (with `PATH` syntax)
		3. Installation dependent default
		4. symlinks are expanded to actual directories
3. After initialization, python programs can modify `sys.path`
4. Since the direcotry containing the script is placed at the beginning of the search path, modules in the directory will be loaded instead of those in the library with the same names

#### "Compiled" Python files ####
1. Compiled version of each module is stored in the directory `__pycache__` under the name `<module>.<version>.pyc`
	1. `<version>`: specifies the format of the compiled file (usually Python version number)
		1. Example:
		
				__pycache__/spam.cpython-33.pyc
				
	2. Allows modules of different releases and different versions of python to coexist
2. Python compares the modification date of the source file with the compiled version for recompilation if needed.
3. Compiled modules are platform independent (same library can be shared among systems with different architectures)
4. Python does not check the cache in two cases:
	1. If module is loaded directly from command line, it is always recompiled and is not stored
	2. If there is no source module
		1. If compiled module is in the source directory and if there is no source module, it may be used
5. Tips for experts:
	1. Use `-0` or `-00` on Python command line to reduce size of compiled module
		1. `-0`: removes assert statements
		2. `-00`: removes assert statements and doc strings
		3. Optimized modules have `opt -` tag
	2. Program in `.pyc` file does not run faster than that in `py` file (only loading time is less)
	3. `compileall`: generates `.pyc` files for all modules in a directory

### Standard Modules ###
1. Some modules are built into the interpreter
	1. They are not part of the core language (built into for efficiency or for primitive system calls)
	2. Example:
		1. `winreg`: module provided only on windows systems.
		2. `sys`:
			1. `sys.ps1`: primary prompt (only when in interactive mode)
			2. `sys.ps2`: secondary prompt (only when in interactive mode)
			3. `sys.path`: interpreter's search path
				1. It can be modified using standard list operations
				
						import sys
						sys.path.append('/ufs/guido/lib/python')

### The `dir()` ###
1. `dir()`: build in function
	1. Used to get the names defined by a module (variables, modules, functions)
	2. Example:
	
			import fibo, sys
			dir(fibo)
			
			dir() # defines names defined currently
	
	3. It does not list builtin functions and variables
		1. Use the following to get builtin functions and variables
		
				import builtins
				dir(builtins)

### Packages ###
1. Module `A.B` designates a submodule `B` in package `A`
2. Module names in different packages can be same
3. Consider the following hierarchical structure

		sound/
			__init__.py
			formats/
				__init__.py
				wavread.py
				wavwrite.py
				...
			effects/
				__init__.py
				echo.py
				surround.py
				reverse.py
				...
			filters/
				__init__.py
				equalizer.py
				vocoder.py
				karaoke.py
				...
				
4. When importing package, python searches through `sys.path` looking for subdirectory
	1. `__init__.py` are required:
		1. The directory will be treated as a containing package (prevents common names from being hidden that appear later in the search path)
		2. It can be empty
		3. It can contain initialization code
5. Individual modules can be loaded from the package:

		import sound.effects.echo
		
		sound.effects.echo.echofilter(...) # must be referenced with its full name
		
6. Importing without using package prefix:

		from sound.effects import echo
		
		echo.echofilter(...)
		
		from sound.effects.echo import echofilter # import the function itself
		echofilter(...)
		
7. Syntax:

		from package import item
		
	1. `item`: submodule, subpackage, name (function, class, variable)
	
8. Sequence of searching:
	1. First tests if item is defined in package
	2. If not defined, it assumes it is a module and tries to load it
	3. If not found, `ImportError` is raised
9. Another syntax:

		import item.subitem.subsubitem # each item must be a package but the last item can be module or package but cant be a name

#### Importing * From a Package ####
1. Package author can provide an index of the package
	1. `import` statement uses the following convention:
		1. If `__init__.py` defines a list named `__all__`, the list of modules is imported with the statement
		
				from package import *
				
	2. Author must update the list when new version of package is released
2. Example:

		__all__ = ['echo', 'surround', 'reverse'] # the three submodules may be imported
		
3. If `__all__` is not defined, the statement `from sound.effects import *` does not import all submodules from `sound.effects` but only `sound.effects` is imported.
	1. runs initializatoin code in `__init__.py`
	2. Imports names defined in package
		1. names defined by any submodules explicitly loaded by `__init__.py`
	3. Includes submodules of package explicitly loaded by previous `import` statements.
	4. Example:
	
			import sound.effects.echo
			import sound.effects.surround
			from sound.effects import *
			
		1. `echo` and `surround` modules are imported in the current namespace

#### Intra-package References ####
1. We can write relative imports with `from module import name` form of import
2. `.` current package
3. `..` parent package
4. Example: consider `surround` module

		from . import echo
		from .. import formats
		
5. If module has to be used as `'__main__'` module, use absolute imports

#### Packages in Multiple Directories ####
1. `__path__`: It is an attribute
	1. It is initialized as a list containing name of the directory holding package's `__init__.py` before the code in that file is executed.
	2. It can be modified (affects future searches for modules and subpackages)

## Input and Output ##
1. Data can be output in a human readable form or written to a file for future use.

### Fancier Output Formatting ###
1. `write()`: method of file object
2. `sys.stdout`: a reference to standard output file
3. Two ways to format output:
	1. do string handling ourselves
		1. string slicing and concatenation operations
			1. string type has methods to perform operations such as padding strings to given column width
	2. Use formatted string literals (`str.format()`)
	3. `string` module contains `Template` class which can be used to substitute values into strings
4. How to convert values to strings?
	1. Pass the value to either `repr()` or `str()`
		1. `repr()`: generates representations which can be read by the interpreter
		2. `str()`: generates representations which are human readable (if object does not have a human readable representation, it will return same value as `repr()`)
			1. numbers, structures (dictionaries, lists) return same values for both functions
	2. Example:
	
			s = 'Hello, world.'
			str(s)
			repr(s)
			str(1/7)
			
			x = 10 * 3.25
			y = 200 * 200
			s = 'The value of x is ' + repr(x) + ', and y is ' + repr(y) + '...'
			print(s)
			
			# The repr() of a string adds string quotes and backslashes:
			hello = 'hello, world\n'
			hellos = repr(hello)
			print(hellos)
			
			# The argument to repr() may be any Python object:
			repr((x, y, ('spam', 'eggs')))
			
5. Formatting:

		for x in range(1, 11):
			print(repr(x).rjust(2), repr(x*x).rjust(3), end=' ')
			# Note use of 'end' on previous line
			print(repr(x*x*x).rjust(4))
			
		for x in range(1, 11):
			print('{0:2d} {1:3d} {2:4d}'.format(x, x*x, x*x*x))

6. `print` always adds one space between it's arguments
7. `str.rjust()`: It is a method of string objects. It right justifies a string in a field of given width by padding it with spaces on the left.
	1. `str.ljust()`
	2. `str.center()`
	3. The methods return a new string
	4. If string is too long, it will not be truncated but returned as it is
		1. To truncate use slice operation: `x.ljust(n)[:n]
8. `str.zfill()`: pads numeric string on the left with zeros
	
		'12'.zfill(5)
		'-3.14'.zfill(7)
		'3.14159265359'.zfill(5)
		
9. `str.format()`

		print('We are the {} who say "{}!"'.format('knights', 'Ni'))
		
	1. Number in the braces indicates position of the object passted into `str.format`
	
			print('{0} and {1}'.format('spam', 'eggs'))
			print('{1} and {0}'.format('spam', 'eggs'))
			
10. If keyword arguments are used, their values are refered to by the names of the arguments respectively

		print('This {food} is {adjective}.'.format(food='spam', adjective='absolutely horrible'))
		
11. Positional and keyword arguments can be combined

		print('The story of {0}, {1}, and {other}.'.format('Bill', 'Manfred', other='Georg')
		
12. `!a`: apply ASCII
13. `!s`: apply `str()`
14. `!r`: apply `repr()`

		contents = 'eels'
		print('My hovercraft is full of {}.'.format(contents))
		print('My hovercraft is full of {!r}'.format(contents))
		
15. `:`: can be followed with field name.
	1. It allows greater control over how the value is formatted.
	
			import math
			print('The value of PI is approximately {0:.3f}.'.format(math.pi))
			
16. Passing an integer after `:` specifies minimum width of the field in characters.

		table = {'Sjoerd': 4127, 'Jack': 4098, 'Dcab': 7678}
		for name, phone in table.items():
			print('{0:10} ==> {1:10d}'.format(name, phone))
			
17. For long fromat string that will not be split up:

		table = {'Sjoerd': 4127, 'Jack': 4098, 'Dcab': 8637678}
		print('Jack: {0[Jack]:d}; Snoerd: {0[Sjoerd]:d}; Dcab: {0[Dcab]:d}'.format(table))
		
18. Passing the table as keyword arguments

		table = {'Sjoerd': 4127, 'Jack': 4098, 'Dcab': 8637678}
		print('Jack: {jack:d}; Sjoerd: {Sjoerd:d}; Dcab: {Dcab:d}'.format(**table))
			
	1. Useful in combination with built-in function `vars()` which returns dictionary containing local variables
19. See [Fromat String Syntax](https://docs.python.org/3/library/string.html#formatstrings)

#### Old string formatting ####
1. `%`: sprintf() style formatting

		import math
		print('The value of PI is approximately %5.3f.' % math.pi)
		
2. [printf-style String Formatting](https://docs.python.org/3/library/stdtypes.html#old-string-formatting)

### Reading and Writing Files ###
1. `open()`: returns a file object
	1. Syntax: `open(filename, mode)`
	2. Example:
	
			f = open('workfile', 'w')
			
		1. first argument is filename
		2. Second argument is another string containing few characters describing the way in which file will be used.
			1. `r`: read (default)
			2. `w`: write
			3. `a`: append
			4. `r+`: reading and writing
	3. Files are read and written in text mode (strings are read and written to a file) and uses a default encoding (platform dependent)
		1. `b`: If appended to the mode, opens the file in binary mode
			1. Read and write data in byte objects
	4. When reading, platform-specific line endings are converted to `\n`
	5. When writing, `\n` is converted to platform specific line endings
		1. Fine for text files but may corrupt binary files like JPEG or EXE
	
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