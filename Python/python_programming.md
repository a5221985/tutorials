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

## String Part 1##
		
