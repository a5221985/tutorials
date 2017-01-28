# Python Programming #
## Topics ##
1. Python setup
2. Variables, data types, numbers
	1. Integer vs float
3. Variables and order of operation
4. Strings Part 1 and Part 2
5. String methods Part 1 and Part 2
6. Booleans
7. Tuples, Lists, Dictionaries
8. Objects
9. Control flow Part 1 and Part 2
10. Loops (for, while)
11. Functions Part 1 and Part 2
12. Exceptions Part 1 and Part 2
13. Volume Calculator example
14. Sum of Multiples example
15. Multiplication table example

## Course Overview ##
1. Requirements:
	1. Command-line/Terminal
2. Text editor
3. Goals:
	1. Fundamental programming concepts
4. Modules
	1. Basic setup
	2. Variables and Basic Data types
		1. Numbers, words, characters, boolean
	3. Complex Data types
		1. Tules, List
		2. Mapping
	4. Control flow
		1. Making decisions
		2. Looping
		3. Functions
		4. Error handling
	5. Basic programming exercises

## Setting up Python ##
1. Download Python 3.x
2. Run the installer (Note the path)
3. Enable adding python to Path variable
4. Open CL window
5. Setting python alias in `~/.bash_profile` in mac

		alias python='python3'

6. Open python interpreter
	1. `$ python`
	2. `>>> exit()` **(M)**

7. Python code `hello.py`

		if __name__ == "__main__":
			print("hello world")

8. `python hello.py`

## Numbers ##
1. Open interpreter: `python`

		>>> 1
		1
		>>> 1 + 1
		2
		>>> 1 - 1
		0
		>>> 2 * 5
		10
		>>> 10 / 5
		2.0
		>>> -9
		-9

2. Exponent:

		>>> 5**2
		25
		>>> 5**3
		125
		
3. Mod

		>>> 10 % 3
		1
		>>> 11 % 4
		3
		>>> 8 % 4
		0

4. Finding type

		>>> type(5) **(M)**
		(class 'int')
		>>> type(5.0)
		(class 'float')

5. Type casting

		>>> float(9) **(M)**
		9.0
		>>> int(6.5)
		6

6. To force divident

		>>> 4//2
		2
		>>> 4//3.0
		1.0

7. Variables

		>>> my_var = 1
		>>> my_var
		>>> type(my_var)

8. Rules for naming variables
	1. Letters, numbers, _
	2. Can't start with number

			>>> x1 = 1
			>>> x_2 = 2
			
9. Reserved keywords
	1. [https://docs.python.org/3.0/reference/lexical_analysis.html#id8](https://docs.python.org/3.0/reference/lexical_analysis.html#id8)

10. Area of rectangle

		>>> width = 2
		>>> length = 4
		>>> area = width * length
		>>> area
		8
		>>> perimeter = 2*width + 2*length
		>>> perimeter
		12

11. BODMAS/PEMDAS - order of operations

		>>> x**2 + 2*x + 1
		4

## String Part 1 ##
1. Double quotes:
	1. "hello"
2. Single quotes:
	1. 'He said "Hi"'
3. Escape characters

		'it\'s
		"He said \"Hi\""
4. Triple quotes

		>>> x = """line1
		... line2
		... line3"""
		>>> x
		'line1\nline2\nline3'
		>>> print(x)
		line1
		line2
		line3

5. `x = "line1\nline2\nline3"`

		print(x)
		line1
		line2
		line3

6. `x = "yes\\no"`
7. Raw string:
	
		path = r"C:\work\tutorial" **(M)**

## String Part 2 ##
1. Concatenation

		s1 = "hello"
		s2 = "world"
		s1 + s2

2. Concatenation with number

		x = 4
		s1 + x (error)
		s1 + str(x) **(M)**

3. Multiply

		"hello " * 10
		"hello hello ..."
		
		2 * "hi"
		hihi

4. Finding if substring exists

		"e" in "hello" **(M)**
		true

		type("e" in "hello")
		bool

		"world" in "hello world" (case sensitive)

5. Characters in a string

		s = "hello"
		s[0]
		'h'

		s[1]
		'e'

		s[-1]
		'o'

		s[-2]
		'l'

6. Length

		len(s)

7. Slicing

		s = '012345'
		s[0:1]
		'0'

		s[0:2]
		'01'

		s[0:3]
		'012'

		s[1:-1]
		'1234'

		s[2:-2]
		'23'

		s[1:]
		'12345'

		s[:3]
		'012'

		s[:]
		'012345'
		
## String Method and Formatting Part 1 ##
1. Index

		s = "012345"
		s.index("12") **(M)**
		1
		
		s.index("4")
		4

		s.index("as")
		error

2. find

		s.find("asdf")
		-1

3. isdigit

		'1'.isdigit() **(M)**
		true

		"2414232".isdigit()
		true

		'324dfrw'.isdigit()
		False

		"".isdigit()
		False

4. Lower

		'AbcD'.lower() -- does not convert original string
		abcd

5. Replace (all occurances)

		'hi, name'.replace("name", "Bob")
		'hi, Bob'

		"1 1 1".replace("1", "2")

6. Strip (removes whitespace at both ends)

		"hi \n".strip() **(M)**
		"\nhi \n".lstrip() **(M)**
		"\nhi \n".rstrip() **(M)**

7. Strip with arguments

		"www.example.com".lstrip("w.")
		"www.example.com".rstrip(".com")
		"www.example.com".string("w.com")

## String Method and Formatting Part 2 ##
1. Split

		s = "1 2 3"
		s.split() -- splits according to whitespace
		['1', '2', '3']

2. Split with argument

		s = "1,2,3"
		s.split(",")
		['1', '2', '3']

		s = "1, 2, 3"
		s.split(", ")
		['1', '2', '3']

3. Starts with

		"hello".startswith("he") **(M)**

4. Ends with

		"hello".endswith("lo") **(M)**

5. case insensitive

		"Hello".lower().startswith("he")

6. Place holder

		"My name is %s" % "Ross" **(M)**

		"My %s is %s" % ("name", "Ross") **(M)**
		"My age is %d" % 31
		"My age is %f" % 31.67
		"My age is %.2f" % 31.6667

## Booleans ##
1. `True`, `False`
2. `x = True`
3. not

		not(False)
		true

		not(True)
		false

4. and

		True and True
		True

		True and False
		False

5. or

		True or False
		True

		False or False
		False

6. Non booleans that will return boolean

		1 == 1
		True

		1 == 2
		False

		'hello' == 'hello'
		True

		True == True
		True

7. Comparison operators

		1 > 2
		False

		2 >= 2
		True

		1 <= 2
		True

		'a' < 'b'
		True

		1 != 1
		False

		1 != 2
		True

		a = 1
		b = 2
		c = 3
		a == b and b == c
		False

		a == b == c **(M)**
		False

		a < b < c

## Tuples in Python ##
1. Complex data types:
	1. Aggregates simple data types
2. Tuple
	1. `(1, 2, 3)`: single entity
	2. `(1, 2.5, 'hello', True)`
	3. `(1, 2.5, 'hello', True, (1, 2))`
	4. Example

			x = (1, 2, 3)
			x[0]
			1

			x[1]
			2

3. slicing
		
		x[0:2]
		(1, 2)

4. Length of tuple

		len(x)

5. Element exists in tuple?

		1 in x
		True

		9 in x
		False

6. Single

		(1,) -- (since (1) is a mathematical expression)

7. Add tuples

		(1, 2, 3) + (4, 5)
		(1, 2, 3, 4, 5)

8. Multiply tuples

		(1, 2, 3) * 3
		(1, 2, 3, 1, 2, 3, 1, 2, 3)

9. Slicing with third argument

		x = (1, 2, 3, 4, 5 ,6)
		x[0:5:2] **(M)**
		(1, 3, 5)

		x[0:5:3]
		(1, 4)

		x[0:5:1]
		(1, 2, 3, 4, 5, 6)

10. Minimum

		min((3, 1, 5)) **(M)** -- based on less than operator

11. Maximum

		max((3, 2, 5)) **(M)**
		5

		max('a', 'c', 'b')
		c

12. How many times a value appears

		x.count(1) **(M)**

13. More types [https://docs.python.org/3/library/stdtypes.html#sequence-types-list-tuple-range](https://docs.python.org/3/library/stdtypes.html#sequence-types-list-tuple-range)

## Lists in Python ##
1. Notation `[<elements>]`

		[1, 2, 3]

2. Operations

		x = [1, 2, 3]
		x[1]
		2

		x[-1]
		3

		x[0:]
		[1, 2, 3]

		max(x)
		3

		min(x)
		1

		x + [1, 2, 3, 4]
		[1, 2, 3, 1, 2, 3, 4]

		x * 2
		[1, 2, 3, 1, 2 ,3]

		x.count(1)
		1

3. Different types

		[1, 2.5, 'a', True]

4. Difference between tuple and list
	1. tuple cannot change but list can change
5. List modifying operations

		x.append(4) **(M)**

		x.extend((10, 11)) **(M)**
		x
		[1, 2, 3, 4, 10, 11]

		x.insert(5, 0) **(M)** -- inserts 0 at position 5

		x.remove(0) **(M)** -- removes only one occurrence

		x.remove('a') -- error

		x = [1, 2, 3, 4]
		x.pop() **(M)** -- returns last element and removes it

		x = [5, 1, 7, 2]
		x.sort() **(M)**
		x
		[1, 2, 5, 7]

		x.reverse()
		[7, 5, 2, 1]

		x.clear()
		x
		[]

## Dictionary in Python ##
1. Example
	
		d
		{'John': 25, 'Mary': 28, 'Bob': 31}
		
		d['John']
		25

		d['Mary']
		28

		d['Bob']
		31

2. Syntax

		{}

		{'John': 25}
		{'John': 25, 'Mary': 28}

		d = {}
		d['Ross'] = 28

		d
		{'Ross': 28}

		d['Ross'] = 29
		d
		{'Ross': 29}

3. Checking if key exists

		'Ross' in d **(M)**

4. Remove entry

		del d['Ross'] **(M)**

5. Error if key does not exist

		d[0] -- error

6. Operations

		len(d)
		0

		d = {'x': 1, 'y': 2, 'z': 3}
		d.get('x') **(M)**
		1

		x = d.get(0)
		x	-- value is None
		print(x)
		None **(M)**
		x == None

		d.get(0, 'not there') -- second value is default value returned if 0 does not exist in d
		'not there'

		d.get('x', 123)
		1

		d.pop('x')
		1

		d.pop('a') -- error

		d.pop('a', 123)
		123

		d.setdefault('a')
		d

		d.setdefault('b', 10)
		{'a': None, 'y': 2, 'b': 10, 'z': 3}
		10

		d.setdefault('b', 100)
		10 -- value that already exists

		d1 = {'x': 1, 'y': 2}
		d2 = {'x': 100, 'z': 5}
		d1.update(d2) **(M)**

## Python Objects ##
1. In Python everything is an object
	1. Object can be of any size
2. `id(1)` **(M)**: returns the unique identity of an object
	1. C version, it is address
3. `x = y` -> both x and y point to the same object
	
		x = [];
		y = [];
		x = y
		x is y **(M)**
		true

		[1, 2, 3] == [1, 2, 3] -- (checks each element for equality)
		true

4. Immutability:
	1. Strings, Integers, Floats, Booleans, Tuples, None
	2. Mutable: Lists, Dictionaries
5. Singletons
	
		x = 1
		y = 1
		id(x)
		xxxxx
		id(y)
		xxxxx
		x is y
		True

6. Functions are also objects

		id(len)
		id(id)
		type(type(1))
		<class 'type'>

## If Statement ##
1. Make a directory `Desktop/Tutorial`
	1. `if.py`

			x = 2
			if x == 1:
				print("x is 1")
			elif x < 3:
				print("x is less than 3")
			elif x == 5:
				print("x is 5")
			elif x == 4:
				pass
			else:
				print("x is not 1")

			print("exiting")

	2. Indentation defines body of a statement
	3. `pass` empty block

## If Statement Part 2 ##
1. Complex condition `if_part2.py`

		x = 1
		y = 2

		if x == 1 and y == 2:
			print('here')

		if x == 1 or y == 3:
			print('here')

		print('exiting')

2. Shorthand methods for conditions

		x = 1

		if x:
			print('here')

		print('exiting')

	1. if x is 0, it is false else true
	2. if x is "", it is false else true
	3. if len(x) is 0, it is false else true
	4. if x is None, it is false

			x = ''

			if x:
				print('here')

			print('exiting')

## For Loop in Python ##
1. `for.py`

		for x in [1, 2, 3]:
			print(x)

		seq = 'hello'

		for x in seq:
			print(x)

		seq = (1, 2, True)
		
		for x in seq:
			print(x)

		seq = {'x': 1, 'y': 2}

		for x in seq:
			print(x)
		
2. `range([start,] [end,] step)` **(M)**
	
		for x in range(10):
			print(x)

		for x in range(1, 10)
			print(x)

		for x in range(1, 10, 2)
			print(x)

		for x in range(10, -1, -1)
			print(x)

3. Character and index `enumerate(string)` **(M)** (generates a tuple)

		for index, c in enumerate(s):
			print(c)

4. Add numbers in a string

		s = "1,2,3,100,1000"

		total = 0
		for x in s.split(','):
			total += int(x) **(M)**

		print(total)

## While Loop ##
1. `while.py`

		x = 0
		while x < 5:
			print(x)
			x += 1

2. Used usually when we don't know how many times we need to loop
3. `input(...)` **(M)**

		s = input('Enter a string: ')
		print(s)

4. Another

		while s != 'stop':
			s = input('Enter a string: ')

5. Breaking out of loop

		while s != 'stop':
			s = input('Enter a string: ')
			break

		print('exiting')

6. Continue

		while s != 'stop':
			s = input('Enter a string: ')
			continue
			print('here')

## Functions in Python Part 1 ##
1. `functions.py`

		def add(a, b):
			return a + b

		x = add(1, 2)
		print(x)

		x = add(b = 1, a = 2)
		print(x)

2. Default values

		def add(a, b = 0):
			print(a, b)
			return a + b

		x = add(3)

3. Mutable variables

		def append_zero(lst=[]):
			lst.append(0)
			return lst

		l = append_zero()
		k = append_zero()
		print(l)

		[0, 0] -> [] already created

	1. Work around

			def append_zero(lst=None):
				if lst is None:
					lst = []

				lst.append(0)
				return lst

			l = append_zero()
			k = append_zero()
			print(l)
			print(k)


## Functions in Python Part 2 ##
1. `function.py`

		def add(a, b, c):
			print(a, b, c)
			return a + b + c

		x = add(1, 2, 3)
		print(x)

		args = (1, 2, 3)
		x = add(*args)
		print(x)

		args = [1, 2, 3]
		x = add(*args)
		print(x)

		args = 'abc'
		x = add(*args)
		print(x)

	2. Slice

			args = [1,2,3,4,5,6]
			x = add(*args[-3:])
			print(x)

2. Values from dictionary

		args = {'c': 9, 'b': 0, 'a': 5}
		x = add(**args)
		print(x)

3. Any number of arguments

		def add(*numbers):
			print(numbers)
			return sum(numbers)

		x = add(1, 2, 3)
		y = add(1, 2)
		z = add()
		print(x, y, z)

4. Keyword arguments
	
		def add(*numbers, **kwargs):
			print(numbers)
			print(kwargs)
			return sum(numbers) + sum(kwargs.values())

		x = add(1, 2, 3, k=100)

5. Printing

		print(1, 2, 3, sep='')
		123

		print(1, 2, 3, sep='\n')
		1
		2
		3

		print(1, 2, 3, sep='---')
		1---2---3

		print(1, 2, 3, sep='---', end='000\n')

## Exceptions in Python ##
1. `int('abdc')`
	1. Exception
2. `'hello'[7]`
	1. String index out of range
3. `{}[0]`
	1. Exception
4. `exceptions.py`
		
		def get_user_input():
			x = input('Enter a number: ')
			x = int(x)
			return x

		get_user_input()

		def try_except():
			try:
				x = get_user_input()
				return x
			except:
				print("error")

			print('Exiting try_except')

		try_except()

		def try_except_finally():
			try:
				x = get_user_input()
				print(x)
			except:
				print("error")
			finally:
				print('finally')

			print('Exiting try_except_finally')

		try_except_finally()

		def try_finally():
			try:
				x = get_user_input()
				print(x)
			finally:
				print('finally')
			
			print('Exiting try_finally)

		try_finally()

## Exceptions in Python Part 2 ##
1. Different types of exceptions

		def multiple_excepts():
			try:
				x = get_user_input()
				print(x)
			except ValueError:
				print("ValueError")
			except KeyboardInterrupt:
				print("KeyboardInterrupt")
			
			print("Exiting multiple_excepts")

		multiple_excepts()


		def multiple_excepts_keyboard_only():
			try:
				x = get_user_input()
				print(x)
			except KeyboardInterrupt:
				print("KeyboardInterrupt")

			print("Exiting multiple_excepts_keyboard_only")

		multiple_excepts_keyboard_only()

2. Exceptions are organized in a hierarchy

		def multiple_excepts():
			try:
				x = get_user_input()
				print(x)
			except Exception:
				print("ValueError")
			except KeyboardInterrupt:
				print("KeyboardInterrupt")

			print("Exiting multiple_excepts")
	
	1. ValueError is a child of Exception

3. Assigning exception to a variable

		def exception_objects():
			try:
				x = get_user_input()
				print(x)
			except Exception as e:
				print(e)
			except KeyboardInterrupt as k:
				print(k)

			print('Exiting exception_objects')

		exception_objects()

4. Catching multiple exceptions in an except block

		def multiple_excepts():
			try:
				x = get_user_input()
				print(x)
			except (Exception, KeyboardInterrupt): **(M)**
				print("ValueError")
			except KeyboardInterrup:
				print("KeyboardInterrupt")

			print("Exiting mutliple_excepts")

		multiple_excepts()

5. Own exception

		def get_user_input():
			try:
				x = input('Enter a number: ')
				x = int(x)
				return x
			except ValueError:
				raise Exception("%s is not a number" % x)
			except KeyboardInterrupt:
				print("\nGoodbye")
				raise				--> Raises the KeyboardInterrupt exception
		
		def custom_message():
			try:
				get_user_input()
			except Exception as e:
				print(e)

## Volume Calculator in Python ##
1. volume_calculator.py
2. How does python program work?
	1. Before executing code, python sets a few special variables.
	2. If a python script is directly executed, `__name__` variable is set to the value `"__main__"`
		1. This can be used to execute the function only if the script is called directly but not otherwise
	3. If a python script is imported by another module then `__name__` will be set to the module's name 

			'''
			The program will ask the user will for the length, width and height
			of a rectangular box. The program will calculate the volume of the
			box and display the result. The program will display meaningful error
			messages and exit gracefully in all situations.
			'''

			def process_input(raw_input):
				'''
				Converts user input into a positive float.
				Raises ValueError if the input is non-numeric, or
				if the input is a negative number.
				'''
				try:
					value = float(raw_input)
				except ValueError:
					raise ValueError("%s is not a number" % raw_input)

				if value <= 0:
					raise ValueError("All dimensions must be greater than zero.")

			def get_dimensions_from_user(*names):
				output_values = []
				
				for name in names:
					raw_input = input(name + ": ")
					processed_input = process_input(raw_input)
					output_values.append(processed_input)

				return output_values

			def main():
				print('This program will calculate the volume of a rectangular box given its length, width, and height.\n')

				success = False
				try:
					length, width, height = get_dimensions_from_user('Length, 'Width', 'Height')
					success = True
				except ValueError as e:
					print(e)		
				except KeyboardInterrup:
					print("\nGoodbye.")		

				if success:
					volume = length * width * height
					print("\nThe volume of the box is %.2f." % volume)

			if __name__ == '__main__':
				main()

## Sum of Multiples in Python ##
1. sum_of_multiples.py

		'''
		The program will ask the user for a comma-separated list of positive integers. The program will output the sum of all multiples of those numbers up to 1000.
		'''

		def sum_of_multiples(numbers, max):
			total = 0

			for i in range(1, max + 1):
				for number in numbers:
					if i % number == 0:
						total += i
						break

			return total

		def validate_single_number(raw_string):
			try:
				value = int(raw_string)
			except ValueError:
				raise ValueError("%s is not an integer." % raw_string)

			if value <= 0:
				raise ValueError("All numbers must be greater than zero.")

		def process_input(raw_input):
			numbers = []
			for raw_string in raw_input.split(","):
				value = validate_single_number(raw_string)
				if value not in numbers:
					numbers.append(value)
			
			return numbers

		def get_user_input():
			raw_input = input("Enter a comma-separated list of positive integers: ")
			processed_input = process_input(raw_input)
			return processed_input

		dev main():
			success = False
			try:
				numbers = get_user_input()
				success = True
			except Exception as e:
				print(e)
			except KeyboardInterrupt:
				print("\nGoodbye.")

			if success:
				max = 1000
				result = sum_of_multiples(numbers, max)
				print("The sum of the multiples of %s up to %d is %d." \ 
						% (numbers, max, result))

		if __name__ == "__main__":
			main()

## Multiplication Table in Python ##
1. multiplication_table.py

		'''
		The program will read two positive integers from the command-line. The program will
		then generate a multiplication table with the given width and height. The columns
		of the table must be aligned.
		'''

		def create_multiplication_table(width, height):
			output = ""
			num_chars = len(str(width*height)) + 1
			for a in range(1, height + 1):
				for b in range(1, width + 1):
					product = a * b
					product_str = str(product)
					product_str = product_str.rjust(num_chars, ' ')
					output += product_str + " "
				output += "\n\n"

			return output

		def process_input(raw_input):
			try:
				value = int(raw_input)
			except ValueError:
				raise ValueError("%s is not an integer" % raw_input)

			if value <= 0:
				raise ValueError("All dimensions must be greater than zero.")

			return value
		
		def get_user_input():
			values = []
			for prompt in ('Width', 'Height'):
				raw_input = input(prompt + ": ")
				processed_input = process_input(raw_input)
				values.append(processed_input)

			return values

		def main():
			success = False
			try:
				width, height = get_user_input()
			except Exception e:
				print(e)
			except KeyboardInterrupt:
				print("\nGoodbye.")

			if success:
				output = create_multiplication_table(width, height)
				print('\n\n' + output)

		if __name__ == "__main__":
			main()
