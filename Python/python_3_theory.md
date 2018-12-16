# Python 3 #
## The Python Tutorial ##
1. Easy to learn, powerful programming language.
2. Efficient high-level data structures
3. Simple effective approach to object-oriented programming
4. Elegant syntax, dynamic typing
5. Interpreted
6. For scripting and rapid app development
7. Python interpreter and standard library are free [https://www.python.org/](https://www.python.org)
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
	1. length of `argv` is atleast one `sys.argv[0]` is filename.
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

		>>> 5 ** 2
		25
		>>> 2 ** 7
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
	1. If string contains quotes, it is enclosed in double quotes
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
		2. Blank line indicates completion of the statement
	5. `print()` outputs value of the args given
		1. strings are printed out without quotes
		2. space is inserted between items
		
				>>> i = 256*256
				>>> print('The value of i is', i)
				The value of i is 65536
				
		3. `end='<separator>'` **(M)** used to avoid newline after output
		
				>>> a, b = 0, 1
				>>> while b < 1000:
				...	print(b, end=',')
				...	a, b = b, a + b
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

		def ask_ok(prompt, retries=4, reminder='Please try again!'):
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
		
4. `**keywords`: parameter that receives a dictionary containing all keyword arguments except formal parameters
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
		list(range(*args)) # call with arguments unpacked from a list
		
3. Dictionaries can deliver keyword arguments with `**` operator

		d = {'voltage': 'four million', 'state': "bleedin' demised", 'action': 'VOOM'}
		parrot(**d)

#### Lambda Expressions ####
1. Anonymous functions can be defined using `lambda` keyword

		lambda a, b: a + b
		
2. It can be used wherever function objects are required
3. Lambda expressions can reference variables from containing scope

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
	1. Whitespace equivalent to the indentation of second blank line is stripped from the start of all lines of the string
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
		1. `start`, `end`: limit search to a slice of the list
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
		queue.appendleft('Balak')
		queue.pop()
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
10. Example:

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

		for i in reversed(range(1, 10, 2)):
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
2. `is`, `is not`: checks if two objects are really the same objects or not (for mutable objects)
3. Comparison operators have lower priority than all numerical operators
4. Comparisons can be chained:

		a < b == c
		
5. Comparisons may be combined using boolean operators such as `and`, `or`
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
		
8. Note: Assignments cannot occur inside expressions (Unlike in C)

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
2. If not found, it searches for a file named `<module>.py` in a list of directories given by variable `sys.path`
	1. `sys.path`:
		1. Directory containing input script (or current directory when no file is specified)
		2. `PYTHONPATH`: list of directory names (with `PATH` syntax)
		3. Installation dependent default
		4. symlinks are expanded to actual directories
3. After initialization, python programs can modify `sys.path`
4. Since the directory containing the script is placed at the beginning of the search path, modules in the directory will be loaded instead of those in the library with the same names

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
1. `dir()`: built in function
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
	1. runs initialization code in `__init__.py`
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
		
	1. Number in the braces indicates position of the object passed into `str.format`
	
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
1. `f.read(size)` **(M)**: reads some quantity of data and returns it as a string (in text mode) or in bytes (in binary mode).
	1. `size`: optional numeric argument
		1. If omitted, or -ve, entire file is read
	2. If machine's memory is less than file size?
		1. Problem that user must take care of
	3. If end of file is reached?
		1. `''`: empty string is returned
	4. Example:
	
		f.read()
		f.read() # returns ''
	
3. `f.readline()` **(M)**: reads a single line from a file
	1. If file does not end in a newline: each line returned contains `\n` character except the last line
		1. `\n` is omitted from the last line
		2. If return value is `\n` it is returning a blank line
		3. If return value is '', it is end of the file
	2. Example:
	
			f.readline() # 'This is the first line of the file.\n'
			f.readline() # 'Second line of the file\n'
			f.readline() # ''
	
	3. Example: Looping over file object
	
			for line in f:
				print(line, end='')

4. `list(f)` **(M)**: reads all the lines into a list
5. `f.readlines()` **(M)**: reads all the lines into a list
6. `f.write(string)` **(M)**: writes contents of string to a file
	1. Returns the number of characters written
	2. Example:
	
			f.write('This is a test\n')

	3. Other types of objects must be converted to either text or binary object before writing to a file
	
			value = ('the answer', 42)
			s = str(value)
			f.write(s)
			
7. `f.tell()` **(M)**: returns integer giving file object's current position in the file
	1. Binary mode: number of bytes from the beginning of the file
	2. Text mode: an opaque number (?)
8. `f.seek(offset, from_what)` **(M)**: Changes position of the reference pointer
	1. `offset`: added to the reference point
	2. `from_what`:
		1. 0: from beginning of the file (default)
		2. 1: current position
		3. 2: end of the file
	3. Example:
	
			f = open('workfile', 'rb+')
			f.write(b'0123456789abcdef')
			f.seek(5) # Go to the 6th byte in the file
			f.read(1)
			f.seek(-3, 2) # Go to the 3rd byte before the end
			f.read(1)
		
	4. For text files (opened without `b`): seeks relative to begenning of the file are only allowed
		1. Exception: seeking to end of file `seek(0, 2)`
		2. Valid offset values: those returned from `f.tell()` or 0
			1. Other offset values produce undefined behavior
9. `f.close()` **(M)**: closes and frees up system resources
	1. Further attempt to use file object results is failure
	2. Example:
	
			f.close()
			f.read()

10. `with`: ensures file is properly closed even on exception and is shorter than `try` and `finally` block

		with open('workfile', 'r') as f:
			read_data = f.read()
		f.closed()

11. `isatty()`, `truncate()`

#### Saving structured data with `json` ####
1. Reading numbers:
	1. convert using `int('123')`
2. JSON: JavaScript Object Notation - Used instead of users writing complicated code to save data to files
	1. `json`: module takes python data hierarchies and converts to strings (serializing)
		1. deserializing: reconstructing data from string representation
		2. `json.dumps(<object>)` **(M)**: converts an object to a JSON string
		
				json.dumps([1, 'simple', 'list'])
		
		3. `json.dump(<object>, f)` **(M)**: serializes to a text file `f`
		4. `x = json.load(f)` **(M)**: decodes back to an object
	2. Serialization of arbitrary class objects: [json](https://docs.python.org/3/library/json.html#module-json)
		1. `pickle`: protocol which allows serialization of arbitrary complex Python objects.
			1. It cannot be used to communicate with applications of other languages
			2. It is insecure by default

## Errors and Exceptions ##
1. There are two kinds of errors:
	1. Syntax errors
	2. Exceptions

### Syntax Errors ###
1. Parser repeats offending line and displays an arrow pointing at earliest point in the line where the error was detected.
	1. Error is caused by or detected at token preceding the arrow
	2. File name and line number are also printed

### Exceptions ###
1. Errors detected during execution are called exceptions
	1. Last line or error message indicates what happened
	2. Type of the exception is printed as part of the message
		1. `ZeroDivisionError`
		2. `NameError`
		3. `TypeError`
2. String printed as exception type is the name of the built in exception that occured
3. Preceding part of error shows context where exception happened
4. [Built-in Exceptions](https://docs.python.org/3/library/exceptions.html#bltin-exceptions)

### Handling Exceptions ###
1. Example: asking a user for input until a valid integer is entered but allows user to interrupt the program (using ctrl + c)
	1. KeyboardInterrupt: raised when user interrupts the program using ctrl/cmd + c
	
			while True:
				try:
					x = int(input("Please enter a number: "))
					break
				except ValueError:
					print("Oops! That was no valid number. Try again...")
					
		1. First `try` clause (statement(s) between try and except) are executed
		2. If no exception occurs, the except clause is skipped and execution of `try` statement is finished
		3. If exception occurs during execution of `try` clause, rest of the clause is skipped.
			1. If its type matches exception named after `except` keyword, except clause is executed. then execution continues after the `try` statement
		4. If an exception occurs which does not match the exception named in except clause, it is passed to outer `try` statements.
			1. If no handler is found, it is an unhandled exception and execution stops with a message
2. `try` statement can have multiple `except` clauses to specify handlers for different exceptions
	1. exceptions that occur only in `try` statement are handled (not in a handler statement).
3. Multiple exceptions handler: specify as a paranthesized tuple

		except (RuntimeError, TypeError, NameError):
			pass
			
4. A class specified in `except` clause is compatible with an exception of its own type or of it's base class
	1. An except clause listing a derived class is not compatible with exception of base class
	2. Example:
	
			class B(Exception):
				pass
				
			class C(B):
				pass
				
			class D(C):
				pass
				
			for cls in [B, C, D]:
				try:
					raise cls()
				except D:
					print("D")
				except C:
					print("C")
				except B:
					print("B")
					
		1. Output: B C D
	
	3. Example:
	
			...
			for cls in [B, C, D]:
				try:
					raise cls()
				except B:
					print("B")
				except C:
					print("C")
				except D:
					print("D")
					
		1. Output: B B B (only first matching except clause is triggered)
5. Last `except` clause may omit exception name(s) (serves as wildcard)
	1. An exception can be re-raised
6. Example:

		import sys
		
		try:
			f = open('myfile.txt')
			s = f.readline()
			i = int(s.strip())
		except OSError as err:
			print("OS error: {0}".format(err))
		except ValueError:
			print("Could not convert data to an integer.")
		except:
			print("Unexpected error:", sys.exc_info()[0])
			raise
			
7. `else` clause: if present must follow all `except` clauses.
	1. Executed if `try` clause does not raise exceptions
	2. Example:
	
			for arg in sys.argv[1:]:
				try:
					f = open(arg, 'r')
				except OSError:
					print('cannot open', arg)
				else:
					print(arg, 'has', len(f.readlines()), 'lines')
					f.close()
	
	3. Purpose: to prevent accidentally catching exception that wasn't raised by code protected by `try .. except` statement
8. Exception's argument: value associated with an exception
	1. `except` clause may specify a variable after exception name.
	2. variable is bound to an exception instance with arguments stored in `<instance>.args`
	3. `__str__()`: method of exception instance which returns arguments for printing without using `.args`
	4. We can add attributes to exception before raising the exception
	
			try:
				raise Exception('spam', 'eggs')
			except Exception as inst:
				print(type(inst))
				print(inst.args)
				print(inst)
				
				x, y = inst.args
				print('x =', x)
				print('y =', y)
				
	5. Unhandled exceptions: arguments are printed as last part of the message
9. Exception handlers handle exceptions even those that occur inside functions called in `try` clause

		def this_fails():
			x = 1/0
			
		try:
			this_fails()
		except ZeroDivisionError as err:
			print('Handling run-time error:', err)

### Raising Exceptions ###
1. `raise`: forces a specified exception to occur.

		raise NameError('HaiThere')
		
	1. Argument: The exception to be raised
		1. Can be exception instance or exception class (Class that derives from `Exception`)
			1. Exception Class: shorthand (instantiation happens implicitly by calling it's constructor with no arguments)
			
					raise ValueError # Shorthand for 'raise ValueError()'
	2. To determine whether exception has occured but don't want to handle it:
	
			try:
				raise NameError('HiThere')
			except NameError:
				print('An exception flew by!')
				raise

### User-defined Exceptions ###
1. User defined exceptions should be derived from `Exception` class (directly or indirectly)
2. The classes are usually kept simple (with attributes)
3. Design for module that can raise several distinct errors:
	1. Construct a base class
	2. Construct subclasses for specific exceptions
	
			class Error(Exception):
				"""Base class for exceptions in this module."""
				pass
				
			class InputError(Error):
				"""Exception raised for errors in the input.
				
				Attributes:
					expression -- input expression in which the error occured
					message -- explanation of the error
				"""
				def __init__(self, expression, message):
					self.expression = expression
					self.message = message
					
			class TransitionError(Error):
				"""Raised when an operation attempts a state transition that's
				allowed.
				
				Attributes:
					previous -- state at beginning of transition
					next -- attempted new state
					message -- explanation of why the specific transition is not allowed
				"""
				
				def __init__(self, previous, next, message):
					self.previous = previous
					self.next = next
					self.message = message
					
		1. Naming Convention: names end with "Error"
		2. [Classes](https://docs.python.org/3/tutorial/classes.html#tut-classes)

### Defining Clean-up Actions ###
1. `finally`: for definining clean-up actions and which is executed under all circumstances
2. Example:

		try:
			raise KeyboardInterrupt
		finally:
			print('Goodbye, world!') # always executed whether exception has occured or not
			
	1. If exception has not been handled, or if exception occurs in `except` or `else` clause, it is automatically re-raised after `finally` has been executed
	2. If `try` is left using `break`, `continue` or `return`, finally is executed on the way out
3. Example:

		def divide(x, y):
			try:
				result = x / y
			except ZeroDivisionError:
				print("division by zero!")
			else:
				print("result is", result)
			finally:
				print("executing finally clause")
				
		divide(2, 1)
		divide(2, 0)
		divide("2", "1") # TypeError is not handled using `except` clause
4. Real use of finally:
	1. Release external resources (files, network connections ...)

### Predefined Clean-up Actions ###
1. Some objects define standard clean-up actions when it is no longer needed.
2. Example: Bad code

		for line in open('myfile.txt'):
			print(line, end="")
			
	1. It leaves the file open for an indeterminate amount of time after the code is finished executing
3. Example: Good code

		with open('myfile.txt') as f:
			for line in f:
				print(line, end="")
				
	1. `f` is always closed automatically
	2. Object file provided predefined clean-up action

## Classes ##
1. It is a mixture of class mechanisms in C++ and Modula-3
2. Class inheritance allows multiple base classes
3. Classes are created at runtime and can be modified further after creation
4. Built-in operators with special syntax can be redefined for class instances

### A Word About Names and Objects ###
1. Multiple names can be bound to the same object.
2. If mutable objects (lists, dictionaries ...) are involved, aliases behave like pointers
	1. Passing a pointer is cheap as compared to passing an object
	2. Function can modify the original object using the alias

### Python Scopes and Namespaces ###
1. Scope rules:
	1. namespace: mapping from names to objects
		1. Most namespaces are implemented as python dictionaries
		2. Examples: built-in names containing functions (`abs()`)
			1. built-in exception names
			2. global names in a module
			3. local names in function invocation
		3. There is no relationship between names in different namespaces
			1. Example: Two modules can have the same function name `maximize`
	2. Attribute: `z.real` - `real` is an attribute of object `z`
		1. References to names in modules are attribute references
			1. `modname.funcname`: `modname` is module object, `funcname` is attribute of it
		2. There is a straightforward mapping between the module's attributes and global names (they share the same namespace)
		3. They can be read only or writable
			1. Module attributes are writable: `modname.the_answer = 42`
			2. Writable attributes can be deleted with `del`
				1. `del modname.the_answer`: will remove `the_answer` from module `modname`
	3. Namespaces get created at different moments and have different lifetimes
		1. Namespace containing built-in names are created when Python interpreter starts up and is never deleted
		2. Global namespace for a module is created when the module definition is read in
			1. They usually last until interpreter quits
		3. `__main__`: It is a module
			1. Statements executed by top-level invocation of interpreter either read from script file or interactively, are considered part of the module
			2. They have their own global namespace
		4. built-in names live in a module called `builtins`
		5. Local namespace for a function is created when the function is called
			1. It is deleted when function returns or raises an exception that is not handled within the function
			2. Recursive invocations have their own namespaces
	4. Scope: It is a textual region of a program where a namespace is directly accessible (unqualified reference to a name attempts to find the name in the namespace)
		1. Scopes are determined statically, but used dynamically
		2. At any point in execution there are three nested scopes whose namespaces are directly accessible
			1. Innermost scope: contains local names. It is searched first
			2. Scopes of enclosing functions if any: contains non-local, but non-global names. Searched starting with nearest enclosing scope
			3. Next-to-last scope: contains current module's global names
			4. Outermost scope: contains built-in names. It is searched last
		3. Consider a name declared global: references and assignments go to the middle scope (which contains module's global names).
			1. If we want to rebind variables those found outside innermost scope:
				1. Use `nonlocal`
					1. If not, variables become read-only (cannot be written)
					2. An attempt to write to a variable will construct a new local variable in innermost scope
					3. Use `nonlocal` to indicate that particular variable lives in enclosing scope and should be rebound there
		4. Local scope:
			1. Reference is to local names in current function
			2. Outside function, local scope references namespace in global scope
		5. Class definition namespace: A new namespace in local scope
		6. global scope of a function defined in a module: it is module's namespace
	5. Namespace search (currently): done dynamically
	6. `global`: If not used, assignments to names go into innermost scope
		1. Assignments: do not copy data but just bind names to objects
		2. `del x` removes only binding of x from the namespace referenced by local scope
		3. Use `global` to indicate that particular variable lives in global scope and should be rebound in global scope
	7. localscope: All operations that introduce new names use local scope (import, function definitions bind module/function name in local scope)

#### Scopes and Namespaces Example ####
1. Example: To see how `global` and `nonlocal` affect variable binding

		def scope_test():
			def do_local():
				spam = "local spam"
				
			def do_nonlocal():
				nonlocal spam
				spam = "nonlocal spam"
				
			def do_global():
				global spam
				spam = "global spam"
				
			spam = "test spam"
			do_local()
			print("After local assignment:", spam) # test spam
			do_nonlocal()
			print("After nonlocal assignment:", spam) # nonlocal spam (changed scope_test's binding)
			do_global()
			print("After global assignment:", spam) # nonlocal spam (changed the module level binding)
			
		scope_test()
		print("In global scope:", spam) # global spam

### A First Look at Classes ###
1. Introduces new syntax, new object types, new semantics

#### Class Definition Syntax ####
1. Syntax:

		class ClassName:
			<statement-1>
			.
			.
			.
			<statement-N>
			
	1. Class definitions must be executed first
		1. Can be even placed inside `if` statement or inside a function
	2. When a class definition is entered, a new namespace gets created (used as local scope)
		1. Assignments to local variables go into this new namespace
		2. Function definitions bind the name of the new function here
2. A class definition is parsed, a class object is created.
	1. It is a wrapper around the contents of the namespace created by the class definition
	2. Original local scope (before class definition was entered) is reinstated (re-stored)
	3. Class object is bound to the original local scope to the class name (`ClassName`)

#### Class Objects ####
1. Operations supported by class objects:
	1. Attribute references
		1. `obj.name`
		2. Valid attribute names: all the names that were in class's namespace when class object was created
	2. Instantiation
2. Example:

		class MyClass:
			"""A simple example class"""
			i = 12345
			
			def f(self):
				return 'hello world'
				
	1. `MyClass.i` and `MyClass.f` (returns a function object) are valid references
	2. We can also assign values to class attributes:
	
			MyClass.i = 654321
			
	3. `__doc__`: it is an attribute that returns docstring ("A simple example class")
3. Class instantiation: It uses function notation (A parameter less function that returns a new instance of the class)

		x = MyClass() # new instance of class MyClass is created and it is assigned to local variable x
	
	1. An empty object gets created by default
4. If an object needs to be created with instance customized to a specific initial state, define special method `__init__()` **(M)**

		def __init__(self):
			self.data = []
			
	1. Class instantiation automatically invokes `__init__()` for newly created class instance
	2. If arguments are given to class instantiation operator, they are passed on to `__init__()`
	3. Example:
	
			class Complex:
				def __init__(self, realpart, imagpart):
					self.r = realpart
					self.i = imagpart
					
			x = Complex(3.0, -4.5)
			x.r, x.i

#### Instance Objects ####
1. Only operations supported by instance objects is attribute references
	1. Valid attribute names:
		1. data attributes
		2. methods
2. data attributes:
	1. They need not be declared first, they spring into existence when they are first assigned to
	2. Example: `x` is the instance of `MyClass`, following will print 16
	
			x.counter = 1
			while x.counter < 10:
				x.counter = x.counter * 2

			print(x.counter)
			del x.counter

3. method attributes:
	1. Method is a function that belongs to an object.
		1. Other types of objects can have methods as well (list has `append`, `insert`, `sort` ...)
	2. Attributes that are function objects define corresponding instance methods.
		1. `x.f` is a valid method reference, since `MyClass.f` is a function
			1. `x.f` is not the same as `MyClass.f` since the former is method object and not function object
		2. `x.i` is not a valid reference since, `MyClass.i` is not a function

#### Method Objects ####
1. `x.f()` returns 'hello world'
2. `x.f` can be stored (since it is an object) in a variable and can be called later

		xf = x.f
		while True:
			print(xf())
			
3. `x.f()` can be called without `self` argument.
	1. Since, instance object is passed as the first argument of the function.
	2. `x.f()` is equivalent to `MyClass.f(x)`
		1. Calling a method with n arguments is equivalent to calling corresponding function with method's instance as the first argument followed by the other n arguments
	3. How does it work?
		1. When instance attribute is referenced and if it is not data attribute,
			1. Class is searched
			2. If name is a valid class attribute (function object), method object is created (by packing instance object and function object found together in an abstract object (method object).
			3. If method is called with an argument list, new argument list is constructed from instance object and argument list and function object is called with new argument list

#### Class and Instance Variables ####
1. instance variables: unique to each instance
2. class variables: shared by all instances

		class Dog:
		
			kind = 'canine'	# class variable shared by all instances
			
			def __init__(self, name):
				self.name = name	# instance variable unique to each instance
				
		d = Dog('Fido')
		e = Dog('Buddy')
		
3. [A World About Names and Objects](https://docs.python.org/3/tutorial/classes.html#tut-object).
	1. If using mutable objects as class variables, they may have surprising effects
	
			class Dog:
			
				tricks = []
				
				def __init__(self, name):
					self.name = name
					
				def add_trick(self, trick):
					self.tricks.append(trick)
					
			d = Dog('Fido')
			e = Dog('Buddy')
			d.add_trick('roll over')
			e.add_trick('play dead')
			d.tricks # ['roll over', 'play dead']
			
	2. Correct design: Use instance variable instead
	
			class Dog:
			
				def __init__(self, name):
					self.name = name
					self.tricks = []
					
				def add_trick(self, trick):
					self.tricks.append(trick)
					
			d = Dog('Fido')
			e = Dog('Buddy')
			d.add_trick('roll over')
			e.add_trick('play dead')
			d.tricks # ['roll over']
			e.tricks #['play dead']

### Random Remarks ###
1. Data attributes override method attributes with the same name
	1. Use conventions to avoid name conflicts
		1. Capitalize method names
		2. Prefix data attribute names with small string (_)
		3. Verbs for methods, nouns for data attributes
2. Data attributes can be referenced by:
	1. methods
	2. Ordinary users (data hiding cannot be enforced in Python)
		1. Python implementation written in C can control access to an object if required
3. Clients can add data attributes of their own to an instance object without affecting validity of methods (name conflicts must be avoided)
4. There is no shorthand for referencing data attributes (methods) from within methods
5. First argument to a method is called `self` (convention)
	1. `self` has no special meaning
6. Function definition need not textually be enclosed in a class definition.
	1. We can assign function object to a local variable of the class as well
	
			# Function defined outside the class
			def f1(self, x, y):
				return min(x, x + y)
				
			class C:
				f = f1
				
				def g(self):
					return 'hello world'
					
				h = g
				
		1. `f`, `g`, `h` are attributes of class `C` and they refer to function objects (they are methods of instances of C as well)
		2. `h` is equivalent to `g`
7. Methods can call other methods using method attributes of `self` (which is passed as an argument)

		class Bag:
			def __init__(self):
				self.data = []
				
			def add(self, x):
				self.data.append(x)
				
			def addtwice(self, x):
				self.add(x)
				self.add(x)
				
8. Methods can reference global names as ordinary functions.
	1. Global scope of a method: it is associated with the module enclosing the method's definition (class is never used as a global scope)
	2. Uses: Functions and modules imported into global scope can be used by methods
		1. Functions and classes defined in global scope can be used by methods
		2. Class is usually defined in global scope (method may want to reference its own class)
9. `object.__class__`: class of an object

### Inheritance ###
1. Syntax:

		class DerivedClassName(BaseClassName):
			<statement-1>
			.
			.
			.
			<statement-N>
			
	1. `BaseClassName` must be defined in a scope containing derived class definition
2. Syntax 2: If base class is defined in another module

		class DerivedClassName(module.BaseClassName):
		
3. When a derived class object is constructed, the base class is remembered (for resolving attribute references)
	1. If an attribute is not found in the derived class, the search proceeds to look in the base class (applied recursively)
4. Resolution of method references:
	1. Class attribute is searched
	2. If not found, the search descends down the chain of base classes
	3. If found, method reference yields a function object
5. Derived objects can override methods of base classes
	1. A method of a base class that calls another method defined in the same base class may end up calling a method of a derived class that overrides it (all methods in Python are effectively virtual)
6. If an overriding method wants to extend the base class method:
	1. `BaseClassName.methodname(self, arguments)` **(M)** (`BaseClassName` is in global scope)
7. Built in functions:
	1. `isinstance()` **(M)**: to check an instance type: `isinstance(obj, int)` (`True` if `obj.__class__` is `int` or its derived class)
	2. `issubclass()` **(M)**: to check class inheritance: `issubclass(bool, int)` (`True` if `bool` is a subclass of `int`)

#### Multiple Inheritance ####
1. Search for attributes:
	1. Depth first, left-to-right search:
		1. If an attribute is not found in `DerivedClassName`, it is searched in `Base1`, then recursively in base classes of `Base1` and if not found there, it was searched for in `Base2`, ...
	2. Calls to `super()`:
		1. call-next-method - resolution order changes dynamically to support cooperative calls to `super()`
2. Multiple inheritance exhibits one or more diamond releationships (one of the parents can be accessed through multiple paths)
	1. Dynamic algorithm makes sure each base class is visited only once by linearizing search order to preserve left-to-right ordering specified in each class
		1. It is monotonic: class can be subclassed without affecting precedence order of its parents

### Private Variables ###
1. Private variables which are accessible only within an object does not exist in Python.
2. A convention for private variables: Prefix with underscore (`_spam`)
	1. It is treated as a non public part of the API
	2. Consider it as implementation details which is subject to change without any notice
3. Name mangling: an identifier of the form `__spam` (at least two leading underscores and at most one trailing underscore) is textually replaced with `_classname__spam` (`classname` is current class name with leading underscores stripped)
	1. Done if the identifier occurs in the definition of a class
	2. Name mangling helps sub classes override methods without breaking interclass method calls
	
			class Mapping:
				def __init__(self, iterable):
					self.items_list = []
					self.__update(iterable)
					
				def update(self, iterable):
					for item in iterable:
						self.items_list.append(item)
						
				__update = update # private copy of original update method
				
			class MappingSubclass(Mapping):
				def update(self, keys, values):
					# provides new signature for update()
					# but does not break __init__()
					for item in zip(keys, values):
						self.items_list.append(item)
						
		1. Due to mangling, it is possible to access or modify variable that is considered private
4. Code passed to `exec()` or `eval()` does not consider classname of invoking class as the current class
	1. Same restriction applies to `getattr()`, `setattr()`, and `delattr()` and `__dict__`

### Odds and Ends ###
1. Defining something similar to C "struct":

		class Employee:
			pass
			
		john = Employee() # An empty employee record
		
		# Fill the fields of the record
		john.name = 'John Doe'
		john.dept = 'computer lab'
		john.salary = 1000
		
2. If a code expects object of a particular abstract data type, then we can pass a class that emulates the methods of that data type.
	1. Example: Consider a function that formats data from file object. Then define a class with `read()` and `readline()` method. Get the data from string buffer instead of a file and pass it as argument.
3. Instance method objects also have attributes:
	1. Consider a method `m()`:
		1. `m.__self__`: reference to instance object which consists of method `m()`
		2. `m.__func__`: function object corresponding to method

### Iterators ###
1. Container objects can be looped using `for`:

		for element in [1, 2, 3]:
			print(element)
		for element in (1, 2, 3):
			print(element)
		for key in {'one': 1, 'two': 2}:
			print(key)
		for char in "123":
			print(char)
		for line in open("myfile.txt"):
			print(line, end='')

2. Behind the scenes:
	1. `for` calls `iter()` on container object.
	2. `iter()` returns an iterator object.
		1. iterator object has method `__next__()` (accesses elements one at a time)
			1. Raises `StopIteration` exception if there are no more elements (tells `for` to terminate)
3. `next()`: built in function which can be called to invoke `__next__()` method

		s = 'abc'
		it = iter(s)
		it
		next(it)
		next(it)
		next(it)
		
4. Adding iterator behavior to user defined classes:
	1. Define `__iter__()` method which returns an object which has a `__next()__` method
	2. If `__next__()` is defined in the class, `__iter__()` can return `self` (since `self` has `__next__()` method)
	3. Example:
	
			class Reverse:
				def __init__(self, data):
					self.data = data
					self.index = len(data)
					
				def __iter__(self):
					return self
					
				def __next__(self):
					if next.index == 0:
						raise StopIteration
					self.index = self.index - 1
					return self.data[self.index]
					
			rev = Reverse('spam')
			iter(rev)
			for char in rev:
				print(char)

### Generators ###
1. it is used for constructing iterators
2. They are like regular funtions but use `yield` statement when data needs to be returned.
	1. When `next()` is called on the generator, it resumes where it left off (remembers all data values and which statement was last executed)
	2. Example:
	
			def reverse(data):
				for index in range(len(data) - 1, -1, -1):
					yield data[index]
					
			for char in reverse('golf'):
				print(char)
				
3. Generators are compact because `__iter__()` and `__next()__` get created automatically
	1. local variables and execution state are automatically saved between calls (more clear than `self.index` and `self.data`)
4. When Generators terminate, they automatically raise `StopIteration` exception

### Generator Expressions ###
1. Simple generators can be coded as expressions which are similar to list comprehensions but with `()`
	1. Purpose: used when generators are required right away by enclosing function (more memory friendly than list comprehensions)
	2. Example:
	
			sum(i*i for i in range(10))
			xvec = [10, 20, 30]
			yvec = [7, 5, 3]
			sum(x*y for x, y in zip(xvec, yvec))
			
			from math import pi, sin
			sine_table = {x: sin(x * pi / 180) for x in range(0, 91)}
			
			unique_words = set('word for line in page for word in line'.split())
			
			data = 'golf'
			list(data[i] for i in range(len(data) - 1, -1, -1))

## Brief Tour of the Standard Library ##
### Operating System Interface ###
1. `os` **(M)**: module used to interact with the operating system which has functions

		import os
		os.getcwd() # Return the current working directory
		os.chdir('/server/accesslogs') # change current working directory
		os.system('mkdir today')
		
	1. Do not use `from os import *` because `os.open()` will shadow built in `open()` (used to open files)
	2. `dir(os)`, `help(os)` **(M)**
2. `shutil` **(M)**: module that makes it easy for file and directory management
	1. Provides higher level interface
	2. Examples:
			
			import shutil
			shutil.copyfile('data.db', 'archive.db')
			shutil.move('/build/executables', 'installdir')

### File Wildcards ###
1. `glob`: module used for building file `list`s from directory wildcard searches
	
		import glob
		glob.glob('*.py')

### Command Line Arguments ###
1. `sys`: module that has `argv` attribute as a list
2. Example: `python demo.py one two three`
	
		import sys
		print(sys.argv) # ['demo.py', 'one', 'two', 'three']
		
3. `getopt` **(M)**: module that processes `sys.argv` using conventions of Unix `getopt()` function
4. `argparse` **(M)**: module that provides powerful command line processing

### Error Output Redirection and Program Termination ###
1. `sys` has `stdin`, `stdout`, and `stderr` attributes.
	1. `stderr`: used to emit warnings or error messages
2. `sys.exit()` **(M)**: terminates the script

### String Pattern Matching ###
1. `re` **(M)**: module that provides regular expression tools
2. Example:

		import re
		re.findall(r'\bf[a-z]*', 'which foot or hand fell fastest') # ['foot', 'fell', 'fastest']
		re.sub(r'(\b[a-z]+) \1', r'\1', 'cat in the the hat') # 'cat in the hat'
		
3. String methods are used for simple capabilities:

		'tea for too'.replace('too', 'two') # 'tea for two'

### Mathematics ###
1. `math`: module that gives access to underlying `C` library functions for floating point math

		import math
		math.cos(math.pi / 4)
		math.log(1024, 2)
		
2. `random` **(M)**: module that provides tools for making random selections

		random.choice(['apple', 'pear', 'banana'])
		random.sample(range(100), 10)
		random.random()
		random.randrange(6)
		
3. `statistics` **(M)**: module that can calculate mean, median, variance, ... of numeric data

		import statistics
		data = [2.75, 1.75, 1.25, 0.25, 0.5, 1.25, 3.5]
		statistics.mean(data)
		statistics.median(data)
		statistics.variance(data)
		
4. SciPy project: Many other modules for numerical calculations

### Internet Access ###
1. There are modules of accessing the internet and for processing internet protocols
2. Two simple modules:
	1. `urllib.request` **(M)**
	2. `smtplib` **(M)**
3. Example: receiving data

		from urllib.request import urlopen
		with urlopen('http://tycho.usno.navy.mil/cgi-bin/timer.pl') as response:
			for line in response:
				line = line.decode('utf-8') # Decoding the binary data to text
				if 'EST' in line or 'EDT' in line: # look for Eastern Time
					print(line)
					
4. Example: sending email (mail server should be running on localhost)

		import smtplib
		server = smtplib.SMTP('localhost')
		server.sendmail('warrior@example.org', 'jceaser@example.org', 
		"""To: jceaser@example.org
		From: warrior@example.org
		
		Beware the enimies who are stronger than you.
		""")
		server.quit()

### Dates and Times ###
1. `datetime` **(M)**: module that contains classes for manipulating dates and times.
	1. Supports date and time arithmetic
	2. It is efficient in member extraction for output formatting and manipulation
	3. It supports objects that are timezone aware (?)
2. Example:

		from datetime import date
		now = date.today()
		now
		now.strftime("%m-%d-%y. %d %b %Y is a %A on the %d day of %B.")
		
		# dates support calendar arithmetic
		birthday = date(1964, 7, 31)
		age = now - birthday
		age.days
		
### Data Compression ###
1. Compression formats supported by modules:
	1. `zlib`
	2. `gzip`
	3. `bz2`
	4. `lzma`
	5. `zipfile`
	6. `tarfile`
2. Example:

		import zlib
		s = b'hitch which has which hitches wrist watch'
		len(s)
		t = zlib.compress(s)
		len(t)
		zlib.decompress(t)
		zlib.crc32(s)

### Performance Measurement ###
1. Purpose: To compare performance of different approaches to the same problem.
	1. Example: Tuple packing and unpacking vs traditional swapping.
2. `timeit`: module used to know performance

		from timeit import Timer
		Timer('t=a; a=b; b=t', 'a=1; b=2').timeit()
		Timer('a, b = b, a', 'a=1; b=2').timeit()

3. `profile`, `pstats`: modules for identifying time critical sections in larger blocks of code

### Quality Control ###
1. `doctest`: module for scanning module and validating tests embedded in docstrings
2. Writing tests: Copying and pasting call along with results into docstring

		def average(values):
			"""Computes the arithmetic mean of a list of numbers.
			
			>>> print(average([20, 30, 70]))
			40.0
			"""
			return sum(values) / len(values)
			
		import doctest
		doctest.testmod() # automatically validate the embedded tests
		
3. `unittest`: module that allows tests to be maintained in separate file

		import unittest
		
		class TestStatisticalFunctions(unitest.TestCase):
			def test_average(self):
				self.assertEqual(average([20, 30, 70]), 40.0)
				self.assertEqual(round(average([1, 5, 7]), 1), 4.3)
				with self.assertRaises(ZeroDivisionError):
					average([])
				with self.assertRaises(TypeError):
					average(20, 30, 70)
				
		unittest.main() # Calling from the command line invokes all tests

### Batteries Included ###
1. Batteries included philosophy.
	1. `xmlrpc.client` and `xmlrpc.server` modules for making remote procedure calls trivial. (No knowledge of XML is required)
	2. `email`: package that can be used for building, decoding complex message structures (attachments also).
		1. Supports internet encoding and header protocols
	3. `json`: package for parsing json.
		1. `csv`: module for reading and writing CSV files
		2. `xml.etree.ElementTree`, `xml.dom`, `xml.sax` support XML processing
	4. `sqlite3` module is wrapper for SQLite database library (slightly non standard SQL syntax)
	5. `gettext`, `locale`, `codecs` support internationalization

## Brief Tour of the Standard Library - Part II ##
1. Covers advanced modules for professional programming

### Output Formatting ###
1. `reprlib`: module (a version of `repr()`) customized for
	1. abbreviated displays of large or deeply nested containers
	
			import reprlib
			reprlib.repr(set('supercalifragilisticexpialidocious'))
			"{'a', 'c', 'd', 'e', 'f', 'g', ...}"
			
2. `pprint` **(M)**: module that offers control over printing built-in and user defined objects making it readable by interpreter (adds indentation and line breaks)

		import pprint
		t = [[[['black', 'cyan'], 'white', ['green', 'red']], [['magenta', 'yellow'], 'blue']]]
		pprint.pprint(t, width=30)
		
3. `textwrap`: module. It formats paragraphs to fit a screen width

		import textwrap
		doc = """The wrap() method is just like fill() except that it returns a list of strings instead of one big string with newlines to separate the wrapped lines."""
		print(textwrap.fill(doc, width=40))
		
4. `locale`: module. accesses database of culture specific data formats
	1. `grouping`: attribute used to format numbers with group separators (`,`)
	2. `format`: function
	
			import locale
			locale.setlocale(locale.LC_ALL, 'English_United States.1252')
			conv = locale.localeconv() # get a mapping of conventions
			x = 1234567.8
			local.format("%d", x, grouping=True)
			locale.format_string("%s%.*f", (conv['currency_symbol'], conv['frac_digits'], x), grouping=True)

### Templating ###
1. `string` module has `Template` class (end users can edit the syntax)
2. `${name}` is used for placeholder names
3. `$$` generates escaped `$`

		from string import Template
		t = Template('${village}folk send $$10 to $cause.')
		t.substitute(village='Nottingham', cause='the ditch fund')
		
	1. `substitute` raises `KeyError` when placeholder is not supplied (in dictionary or keyword argument)
		1. `safe_substitute`: use if data supplied is incomplete and placeholders must be left unchanged (if data is not passed)
		
				t = Template('Return the $item to $owner.')
				d = dict(item='unladen swallow')
				t.safe_substitute(d)
				
4. Subclass to `Template` can use custom delimiter.

		import time, os.path
		photofiles = ['img_1074.jpg', 'img_1076.jpg', 'img_1077.jpg']
		class BatchRename(Template):
			delimiter = '%'
		fmt = input('Enter rename style (%d-date %n-seqnum %f-format): ')
		t = BatchRename(fmt)
		date = time.strftime('%d%b%y')
		for i, filename in enumerate(photofiles):
			base, ext = os.path.splitext(filename)
			newname = t.substitute(d=date, n=i, f=ext)
			print('{0} --> {1}'.format(filename, newname))
			
	1. Another application: separating program logic from multiple output formats
		1. We can use templates for XML files, plain text reports, HTML web reports

### Working with Binary Data Record Layouts ###
1. `struct`: module
	1. `pack()`, `unpack()`: used for variable length binary record formats
		1. "H", "I" represent two and four byte unsigned numbers, "<" says thay are standard size and little endian byte order
		2. Looping through header infomation in zip file without using `zipfile` module
		
				import struct
				
				with open('myfile.zip', 'rb') as f:
					data = f.read()
					
				start = 0
				for i in range(3): # show the first 3 file headers
					start += 14
					fields = struct.unpack('<IIIHH', data[start:start+16])
					crc32, comp_size, uncomp_size, filenamesize, extra_size = fields
					
					start += 16
					filename = data[start:start+filenamesize]
					start += filenamesize
					extra = data[start:start+extra_size]
					print(filename, hex(crc32), comp_size, uncomp_size)
					
					start += extra_size + comp_size # skip to the next header

### Multi-threading ###
1. Usecase: Running IO in parallel with computations in another thread
2. `threading`: module

		import threading, zipfile
		
		class AsyncZip(threading.Thread):
			def __init__(self, infile, outfile):
				threading.Thread.__init__(self)
				self.infile = infile
				self.outfile = outfile
				
			def run(self):
				f = zipfile.ZipFile(self.outfile, 'w', zipfile.ZIP_DEFLATED)
				f.write(self.infile)
				f.close()
				print('Finished background zip of:', self.infile)
				
		background = AsyncZip('mydata.txt', 'myarchive.zip')
		background.start()
		print('The main program continues to run in foreground.')
		
		background.join()
		print('Main program waited until background was done.')
		
	1. Challenge: coordinating threads that share data or resources.
		1. `threading` module has synchronization primitives (locks, events, condition variables, semaphores)
			1. Difficult to reproduce errors
		2. Solution: use one thread to access resource, use `queue` module to feed the thread with requests from other threads
			1. `Queue` object makes it more manageable

### Logging ###
1. `logging` module: full features and flexible
	1. Log messages being sent to file or `sys.stderr`
	
			import logging
			logging.debug('Debug information')
			logging.info('Information message')
			logging.warning('Warning:config file %s no found', 'server.conf')
			logging.error('Error occurred')
			logging.critical('Critical error -- shutting down')
			
	2. Default: info and debug are suppressed and output sent to standard error
		1. Other options: routing messages through email, datagrams, sockets, to HTTP server
			1. Filters can select routing based on message priority: DEBUG, INFO, WARNING, ERROR, CRITICAL
2. Logging can be configured directly in Python or loaded from configuration file (for customized logging) (does not alter the application)

### Weak References ###
1. Python uses reference counting and Garbage collection to automate memory management
	1. Memory is freed after last reference is eliminated
2. Scenario: we want to track objects only for as long as they are used
	1. Problem: Tracking object creates a reference (permanent object)
	2. Solution: `weakref` module has tools to track objects without a reference getting created
		1. If an object is not needed anymore, it is removed from weakref table. A callback is also triggered for weakref objects
	3. Applications: Caching objects that are expensive for creation
	
			import weakref, gc
			class A:
				def __init__(self, value):
					self.value = value
				def __repr__(self):
					return str(self.value)
					
			a = A(10)
			d = weakref.WeakValueDictionary()
			d['primary'] = a # does not create a reference
			d['primary']
			del a # remove the one reference
			gc.collect() # run garbage collection right away
			d['primary'] # entry was automatically removed
			

### Tools for Working with Lists ###
1. `array` module has `array()` object:
	1. It is like a list that stores only homogeneous data and compactly
	2. Example: Storing array of numbers as two byte unsigned binary numbers (typecode: "H") (Instead of 16 bytes per entry in list)
	
			for array import array
			a = array('H', [4000, 10, 700, 22222])
			sum(a)
			a[1:3]
			
2. `collections`: module
	1. Provides `deque` object which is like list with faster appends and pops at left side but slower lookup in the middle
		1. Uses: Queues, breadth first searches
		
				from collections import deque
				d = deque(['task1', 'task2', 'task3'])
				d.append('task4')
				print('Handling', d.popleft())
				
				unsearched = deque([starting_node])
				def breadth_first_search(unsearched):
					node = unsearched.popleft()
					for m in gen_moves(node):
						if is_goal(m):
							return m
						unsearched.append(m)
						
3. `bisect`: module
	1. offers functions for manipulating sorted lists
	
			import bisect
			scores = [(100, 'perl'), (200, 'tcl'), (400, 'lua'), (500, 'python')]
			bisect.insort(scores, (300, 'ruby'))
			print(scores)
			
4. `heapq`: module
	1. has functions to implement heaps (based on lists)
		1. lowest value is always kept at position zero (good for apps which repeatedly access smallest lement but do not want to run full list sort)
		
				from heapq import heapify, heappop, heappush
				data = [1, 3, 5, 7, 9, 2, 4, 6, 8, 0]
				heapify(data)
				heappush(data, -5)
				[heappop(data) for i in range(3)]

### Decimal Floating Point Arithmetic ###
1. `decimal`: module:
	1. Has `Decimal` datatype used for decimal floating point arithmetic
	2. Useful for:
		1. financial apps which require exact decimal representation
		2. Control over precision
		3. Control over rounding to meet legal or regulatory requirements
		4. Tracking of significant decimal places
		5. apps where user expects results to match calculations done by hand
	3. Example:
	
			from decimal import *
			round(Decimal('0.70') * Decimal('1.05'), 2)
			round(.70 * 1.05, 2)
		
		1. `Decimal` keeps trailing 0: four place significance from two place significance of multiplicands
			1. It reproduces mathematics as done by hand
		2. Module calculations:
		
				Decimal('1.00') % Decimal('.10') # Decimal('0.00')
				1.00 % 0.10 # 0.099999999...5
				
				sum([Decimal('0.1')]*10) == Decimal('1.0') # True
				sum([0.1]*10) == 1.0 # False
				
		3. As much precision as we need
		
				getcontext().prec = 36
				Decimal(1) / Decimal(7)
				

## Virtual Environments and Packages ##
### Introduction ###
1. Applications may need a specific version of a library (obsolete version, bug fixed version)
2. If app A needs version 1.0 of a module but app B needs version 2.0.
3. Solution: Virtual environment
	1. Self contained directory tree that contains Python installation of a particular version + additional packages

### Creation of Virtual Environments ###
1. `venv`: module used for creation and management of virtual environments
2. Directory where we want to place it:

		python3 -m venv tutorial-env
		
	1. `tutorial-env` directory gets created if it does not exist
		1. Subdirectories containing copy of python interpreter, standard library, supporting files get created
		
3. Activate the virtual environment:

		source tutorial-env/bin/activate
		
4. Activating an environment will display the envrionment in command prompt

		source ~/envs/tutorial-env/bin/activate
		python3
		import sys
		sys.path
		
5. Deactivating virtual environment:

		deactivate **(M)**

### Managing Packages with pip ###
1. `pip`: It is used to install, upgrade and remove packages (package manager)
	1. Installs packages from Python package index [https://pypi.python.org/pypi](https://pypi.python.org/pypi)
		1. Visit it in web browser for packages
	2. Search package using `pip`:
	
			pip search astronomy
			
	2. Sub-commands: [Installing Python Modules](https://docs.python.org/3/installing/index.html#installing-index)
		1. `install`
		2. `uninstall`
		3. `search`
		4. `freeze`
		5. ...
	3. Installing latest version of a package:
	
			pip install novas
			
	4. Installing specific version of a package: (`<package-name>==<version>`)
	
			pip install requests==2.6.0
			
	5. Upgrade a package to the latest version:
	
			pip install --upgrade requests
			
	6. Un-installing a package:
	
			pip uninstall <package-name> [<package-name> ...]
			
	7. Display information about particular package:
	
			pip show requests
			
	8. Display list of packages installed in virtual environment:
	
			pip list
			
	9. Get list of packages installed in a format expected by `pip install`
	
			pip freeze > requirements.txt
			cat requirements.txt
			
		1. `requirements.txt` can be committed to version control and shipped with the application
		2. Users can install all required packages using the following:
		
				pip install -r requirements.txt
				
2. To make package written avialable on Python Package index: [Distributing Python Modules](https://docs.python.org/3/distributing/index.html#distributing-index)

## What Now? ##
1. [The Python Standard Library](https://docs.python.org/3/library/index.html#library-index)
	1. Complete reference material about types, functions, modules in standard library
		1. Modules for: reading Unix mailboxes, retrieve documents via HTTP, generante random numbers, parse command-line options, write CGI programs, compress data, ...
2. [Installing Python Modules](https://docs.python.org/3/installing/index.html#installing-index)
	1. How to install additional modules written by other Python users
3. [The Python Language Reference](https://docs.python.org/3/reference/index.html#reference-index)
	1. Detailed explanation of Python's syntax, semantics
4. More Python resources:
	1. [https://www.python.org](https://www.python.org)
		1. Python website
		2. Contents: Code, documentation, pointers to Python-related pages in web
	2. [https://docs.python.org](https://docs.python.org/): Fast access to Python's documentation
	3. [https://pypi.python.org/pypi](https://pypi.python.org/pypi)
		1. Python package index
			1. Index of user constructed Python modules
			2. We can register our code here (for others)
	4. [https://code.activestate.com/recipes/langs/python/](https://code.activestate.com/recipes/langs/python/)
		1. Python cookbook: collection of 
			1. code examples
			2. larger modules
			3. useful scripts
		2. Also a book form exists
	5. [http://www.pyvideo.org](http://www.pyvideo.org)
		1. Links to Python related videos from conferences and user-group meetings
	6. [https://scipy.org](https://scipy.org)
		1. Scientific Python project
			1. Modules for fast array computations and manipulations
			2. Packages for 
				1. linear algebra
				2. Fourier transforms
				3. non-linear solvers
				4. random number distributions
				5. statistical analysis
				6. ...
	7. Mailing lists: [python-list@python.org](python-list@python.org)
		1. Archives: [https://mail.python.org/pipermail/](https://mail.python.org/pipermail/)
	8. [Frequency Asked Questions](https://docs.python.org/3/faq/index.html#faq-index)
			
## Interactive Input Editing and History Substitution ##
1. [GNU Readline](https://tiswww.case.edu/php/chet/readline/rltop.html): Supports different styles and editing
	1. A few Python interpreters support editing of current input line (?) and history substitution (?)

### Tab Completion and History Editing ###
1. variable and module name completion is enabled at interpreter startup (`tab` can be used)
	1. for dotted expressions: `string.a` - evalues upto final `.` and suggests completion from attributes of the object (evaluated)
	2. executes code if `__getattr__()` method is part of the expression
2. History is saved in file `.python_history` in user directory (available in next interactive session)

### Alternatives to the Interactive Interpreter ###
1. Proper indentation should be suggested on continuation lines
2. Completion mechanism can use interpreter's symbol table
3. Check and suggest matching parantheses, quotes, ...
4. Alternative: `IPython`:
	1. Has tab comletion
	2. Object exploration
	3. Advanced history management
	4. Can be embedded into other apps
5. Alternative: `bpython`

## Floating Point Arithmetic: Issues and Limitations ##
1. Represented as base 2 (binary) fractions
2. Certain decimal fractions cannot be represented exactly as binary fractions
	1. decimal floating-point numbers are approximated by binary floating-point numbers
		1. Example: 1/3 ~ 0.3 (approximation) ~ 0.33 (better approximation) ...
			1. Value can never be 1/3 but increasingly closer
		2. Exmaple: 1/10 = 0.1 cannot be represented exactly as base 2 fraction
			
				0.0001100110011... (infinitely repeating)

3. Approximation of floats on modern machines:
	1. numerator using first 53 bits and denominator is a power of 2
	
		3602879701896397 / 2 ** 55 ~ 1/ 10
		
4. Python prints only decimal approximation to true decimal value of binary approximation (stored)
	1. Python should display the following:
	
			>>> 0.1
			0.1000000...05551115123...25 (which is the actual value stored in binary form)

	2. But python displays rounded value (0.1)
5. Multiple values share the same binary approximation:
	1. 0.1 & 0.10000000000000001 share 3602879701896397 / 2 ** 55
6. Before, Python prompt and `repr()` would choose that with 17 digits 0.10000000000000001 but now, it chooses the shortest one
7. Solution: Use string formatting to display limitted number of significant digits

		format(math.pi, '.12g') # 12 significant digits
		format(math.pi, '.2f') # 2 digits after the point
		repr(math.pi)
		
	1. The functions only round the true machine value
8. Since 0.1 is not exactly 1/10, summing three values of 0.1 may not yield 0.3
9. solution: Pre-rounding does not help

		round(.1, 1) + round(.1, 1) + round(.1, 1) == round(.3, 1)
		False
		
	1. Post-rounding helps
	
			round(.1 + .1 + .1, 10) == round(.3, 10)
			True

10. [The Perils of Floating Point](http://www.lahey.com/float.htm): More issues with floating point numbers
11. `str()` may suffice but for more finer control look into `str.format()` method's flormat specifiers [Format String Syntax](https://docs.python.org/3/library/string.html#formatstrings)
12. For exact decimal representation, try using `decimal` module
13. Exact arithmetic is also supported by `fractions` module (1/3 can be represented exactly)
14. For heavy floating point operations, use numerical python packages like SciPy
15. To know the exact value of float:

		float.as_integer_ratio()
		
	1. It can be used to reconstruct the original value losslessly
	
			x = 3.14159
			x.as_integer_ratio()
			(3537115888337719 / 1125899906842624)
	
			x == 3537115888337719 / 1125899906842624
			True
			
16. Getting hex values of floating point numbers stored in the computer:

		x.hex()
		
	1. It can be used to reconstruct float value exactly:
	
			x == float.fromhex('0x1.921f9f01b866ep+1')
			
		1. Can be used to port to different versions of python and to other languages that use the same format
17. `math.fsum()`: mitigates loss of precision during summation (tracks lost digits as values are added to total so that errors do not accumulate to affect the total)

		sum([0.1]*10) == 1.0
		False
		
		math.fsum([0.1] * 10) == 1.0
		True

### Representation Error ###
1. Refers to the fact that some decimal fractions cannot be represented accurately as binary fractions.
2. Why? 1/10 cannot be exactly represented as binary fraction
	1. Computer tries to convert 0.1 to closest fraction of the form `J/2**N` where `J` is integer containing exactly 53 bits
	2. Rewriting `J`:
	
			1 / 10 ~= J / (2 ** N)

			J ~= 2 ** N / 10
			
	3. Since `J` has exactly 53 bits, (it is `>= 2**52` but `< 2**53), the best value of `N` is 56
	
			2**52 <= 2**56 // 10 < 2**53
			True
			
	4. 56 is the only value of `N` that leaves `J` with 53 bits. The best possible value of `J` is rounded quotient
	
			q, r = divmod(2**56, 10)
			r # 6
			
	5. Since `r` is > 1/2 of 10, we can round `J` to the next value
	
			q + 1
			7205759403792794
			
	6. The best possible approximation of `1/10` in double precision is:
	
			7205759403792794 / 2 ** 56
			
	7. dividing numerator and denominator by 2 gives the following:
	
			3602879701896397 / 2 ** 55
			
		1. It is little bit larger than `1/10` (due to rounding)
		2. If we do not round it up it is < `1/10`
		
	8. Computer sees only the fraction given above but never the value of `1/10`
	
			0.1 * 2 ** 55
			
	9. We can get the value upto 55 decimal digits by multiplying the fraction by 10**55
	
			3602879701896397 * 10 ** 55 // 2 ** 55
			1000000000000000055511151231257827021181583404541015625
			
		1. Actual number stored in the computer
	10. Languages usually display upto 17 significant digits
	
			format(0.1, '.17f')
			0.10000000000000001
			
3. `fractions` and `decimal` modules: they make the above calculations easy

		from decimal import Decimal
		from fractions import Fraction
		
		Fraction.from_float(0.1)
		Fraction(3602879701896397, 36028797018963968) # 36028797018963968 = 2 ** 55
		
		(0.1).as_integer_ratio()
		(3602879701896397, 36028797018963968)
		
		Decimal.from_float(0.1)
		Decimal('0.1000000000000000055511151231257827021181583404541015625')
		
		format(Decimal.from_float(0.1), '.17')
		'0.10000000000000001'
	
## Appendix ##
### Interactive Mode ###
#### Error Handling ####
1. If error occurs,
	1. Interpreter prints error message and stack trace
	2. If input is from a file, it prints stack trace and exits with nonzero exit status
	3. If fatal (internal inconsistencies, memory has run out): exits with nonzero exit status
2. All error messages are written to standard error stream
3. When command is executing, `ctr+c` raises `KeyboardInterrupt` exception (can be handled by `try`)

#### Executable Python Scripts ####
1. To make a script executable:

		#!/usr/bin/env python3.5
		
	1. `#!` must be first two characters of the file
2. Script can be made executable as follows:

		chmod +x myscript.py
		
	1. Windows: Python installer automatically associates `.py` file to `python.exe`
		1. If `.pyw` console window is suppressed

#### The Interactive Startup File ####
1. `PYTHONSTARTUP`: environment variable that holds the name of file with start-up commands
	1. Executed when interpreter is started
	2. Works only in interactive sessions (not when script is executed)
	3. Executed in the namespace of the interactive commands
2. For running additional startup files:
	1. Add the following to global startup file
	
			os.path.isfile('.pythonrc.py'): exec(open('.pythonrc.py').read())
			
3. To use startup file in a script:

		import os
		filename = os.environ.get('PYTHONSTARTUP')
		if filename and os.path.isfile(filename):
			with open(filename) as fobj:
				startup_file = fobj.read()
			exec(startup_file)

#### The Customization Modules ####
1. Hooks for customization:
	1. `sitecustomize`
	2. `usercustomize`
2. First find user site-packages directory.

		import site
		site.getusersitepackages()
		
3. Construct a file `usercustomize.py` in the directory (put whatever you want in it)
	1. affects every python invocation (can be suppressed with `-s`)
4. `sitecustomize`: works similar to `usercustomize` but is constructed by administrator of the computer in global site-packages directory (gets imported before `usercustomize`)
	1. [site](https://docs.python.org/3/library/site.html#module-site): module
