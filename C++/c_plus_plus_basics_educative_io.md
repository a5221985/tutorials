# C++ Basics #
## Introduction ##
### A Bit About C++ ###
1. C++ and its various features
2. Topics:
	1. What is C++?
	2. C++ Features
		1. Platform dependent
		2. Intermediate-level language ###
		3. Object-oriented
		4. Structured
		5. Statically-typed
		6. Compiled
		7. Support-rich library
		8. Speed
		9. Multi-paradigm
		10. Pointer
		
#### What is C++? ####
1. C++ is a general-purpose object-oriented programming language
2. Developed by Bjarne Stroustrup in 1979
3. It is an extension of C
	1. We can use C++ to either code in "C style" or "object-oriented style"

#### C++ Features ####
1. Most important features
	1. Multi-paradigm
	2. Object-oriented
	3. Platform Dependent
	4. Faster Speed
	5. Intermediate-level
	6. Rich library
	7. Pointer
	8. Compiled based
	9. Structured
	10. Statically-typed

#### Platform Dependent ####
1. Program written and compiled on particular OS won't run on any other OS
	1. Example: C++ program developed and compiled in Windows will not run on macOS, Linux, or Android OS

#### Intermediate-level Language ####
1. C++ supports features of
	1. High-level programming language
	2. Low-level programming language
2. Hence it is intermediate level programming language

#### Object-oriented ####
1. C++ is OOP language
	1. OOP makes development easier by breaking complex problem into subproblems using objects

#### Structured ####
1. C++ is structured programming language
	1. Means we can divide a program into different parts using functions

#### Statically-typed ####
1. C++ is statically typed language
	1. Variable types are explicitly declared and determined at compile time

#### Compiled ####
1. C++ is compiled programming language
	1. Programs written in C++ cannot be executed without compilation

#### Support-rich Library ####
1. C++ Standard Template Library (STL) provides in-built functions
2. STL makes development faster and easier

#### Speed ####
1. Compilation and execution time of C++ is much faster than other general-purpose programming languages (how?)

#### Multi-paradigm ####
1. C++ supports different styles of programming
2. Developer can choose a programming style according to their use case

#### Pointer ####
1. Supports pointer
	1. Pointer - used to interact with memory

### The History of C++ ###
1. Bjarne Stroustrup came acroos Simula - supported object-oriented model
	1. But simula was very slow for practical use
2. Bjarne added object-oriented model in C without compromising its speed and lower-level functionality
3. Cfront - first C with classes compiler
	1. Derived from C compiler called CPre
	2. Cfront was used to translate code of "C with classes" to ordinary C
4. History:
	1. "C with classes" was implemented - 1979
	2. "C with classes" was renamed to C++ - 1983
		1. ++ is increment operator - indicating extension of C language
	3. C++ released as commercial product - 1985
	4. "Annotated C++" Reference Manual was released - 1990
	5. First ISO standard was released (C++98) - 1998
		1. ISO C++98 - international standard for C++
	6. C++03 was released (Bug fixes in C++98) - 2003
	7. C++11 was released (Major version) - 2011
	8. C++14 (Small improvement in C++11 + Bug fixes) - 2014
	9. C++17 (Major revision) - 2017
	10. C++20 being developed - 2018
5. Next: Applications of C++

### Why Use C++? ###
1. Prominance of C++ in industry
	1. Applications of C++
	2. Who's using C++?
#### Applications of C++ ####
1. Widely used in
	1. Embedded systems
	2. Browsers
	3. Graphical user interfaces
	4. Music players
	5. Video games
	6. Operating systems
	7. Compilers
	8. System drivers
	9. Databases
	10. Cloud computing
2. C++ supports Object Oriented Programming
	1. Lowers development cost by giving clear structure to program and allowing reusability of code
3. Syntax is similar to C# and Java
	1. It is easier for programmer to switch between the languages
4. It is efficient and close to machine programming
5. It is fun and simple to learn! (how?)

#### Who is using C++? ####
1. Popular systems for implementing critical part of their system
	1. Google has written some of its parts in C++
		1. Google chromium browser
		2. Google file system
	2. Bloomberg quickly provides market financial info to investors around the world
		1. Basic development environment for Bloomberg is written in C++
	3. MySQL - most frequently used open-source relational database management system - coded in C++
	4. Microsoft Windows - most parts are written in C++
	5. Adobe apps are written in C++
		1. Examples: Adobe illustrator, Adobe Photoshop, Adobe Premier
	6. C & C++ were used in programming of special effects for Star Wars
2. Next: Basics of C++

## Getting Started ##
### Your First C++ Program ###
1. "Hello, World!" program in C++
2. Topics:
	1. "Hello, World!" program
	2. Explanation
		1. "Hello, World!"
		2. <<
		3. cout
		4. ;
		
#### "Hello World!" Program ####
1. Code:

		#include <iostream>
		
		using namespace std;
		
		int main() {
			cout << "Hello, World!";
		}
		
	1. We can modify this code to print anything on console
	
#### Explanation ####
1. We write code inside `{...}`
	1. [Anatory of a "Hello World!" program](https://www.educative.io/collection/page/10370001/6619096843026432/6299398670647296)
2. Anything inside double quotes is a `string`

#### << ####
1. `<<` - insertion or output operator
	1. Takes content written on its right hand side and inserts into `cout`
	2. Operators in upcoming chapters
	
#### cout ####
1. Used to print everything sent via insertion operator onto console

#### ; ####
1. Statement - a command that programmer gives to computer
2. Every statement in C++ program ends with ;
	1. Indicates end of current statement
	2. Indicates next statement is ready to execute

### Printing Styles ###
1. How to print text in different styles on console
2. Topics:
	1. C++ output
	2. endl in C++
	
#### C++ output ####
1. We can use multiple `cout` statements in a program
2. `cout` does not add new line at the end of text

#### `endl` in C++ ####
1. Used with `cout` to add a new line after text

### C++ Comments ###
1. What and why
2. Topics:
	1. Introduction to comments
		1. Example
		2. Types
		3. Single-line comments
		4. Multi-line comments
	2. White spaces
	
#### Introduction to Comments ####
1. Comments - statements written inside source code to make it easily understandable
2. Compiler ignores comments
	1. They don't affect logic of our program
3. Comments are written for documentation of program and help other people understand our code

#### Example ####
1. If source code of a website has thousands of lines of code
	1. To repair the code, we first need to understand it
		1. It is impractical to read every line of code
			1. Solution: Comments

#### Types ####
1. In C++, we can add:
	1. Single-line comments
	2. Multi-line comments

#### Single-Line Comments ####
1. `// <comment>` - compiler ignores everything written after `//`
2. Example:

		#include <iostream>
		
		using namespace std;
		
		int main() {
			// I am a single-line comment
			// Compiler will ignore me
			// cout << "Hey"
			cout << "Hello World";
		}

#### Multi-Line Comments ####
1. Multi-line comments start with `/*` and ends with `*/`
2. Compiler will ignore anything inside `/*...*/`
3. Example:

		#include <iostream>
		
		using namespace std;
		int main() {
			/* I am a multi-line comment
			Compiler will ignore me
			cout << "Hey" */
			cout << "Hello World";
		}

	1. Add meaningful comments in source code to make it understandable

#### White Spaces ####
1. C++ compiler ignores white spaces in source code
	1. White spaces: spaces, tabs, blank lines
2. Compiler does not take blank lines, tabs, and spaces into consideration
	1. They do not impact output of the program
3. Add spaces in program to improve readability

### Challenge 1: Display Text on the Console ###
1. Challenge:
2. Topics:
	1. Problem statement
	2. Coding exercise
	
#### Problem Statement ####
1. Display the following text on the console:
	1. Hey! I am John

#### Coding Exercise ####

### Solution Review: Display Text on the Console ###
1. Topics:
	1. Solution
	2. Explanation
	
#### Solution ####
#### Explanation ####
1. `<<` - Used to print text on the console
	1. Takes text on its right-hand side and inserts it into `cout`

### Challenge 2: Display a Right-Angle Triangle ###
#### Problem Statement ####
1. Display following pattern:

		& & & & & &
		& & & & &
		& & & &
		& & &
		& &
		&

### Solution Review: Display a Right-Angle Triangle ###

### Quiz ###

## Variables and Constants ##

### Introduction to Variables ###
#### Variables ####
1. Variable is like a cabinet that can store data
2. To store something in variable, we decide on its data type
3. We give a variable a unique name
4. Each variable can store exactly one item
	1. However, the data can be changed over time
5. Quote:
	1. In terms of programming language, a variable is a location in the computer's memory where we can store data. The value of this data can be changed during the execution of a program. Each variable has a unique and meaningful name which is known as an identifier.
6. Advantage of variables:
	1. We can store data and use it later in the program
	2. We can change value of a variable during running program

### Variables in C++ ###
1. How to declare and initialize variables in C++
2. Topics:
	1. Variable declaration
	2. Variable initialization
	3. Variable declaration and initialization in one step
	4. Example program
	
#### Variable Declaration ####
1. Means we want compiler to reserve space for data with given name and type
2. Basic syntax for declaring a variable in C++:

		variable_datatype variable_name;
		
	1. Example: `int` datatype variable is used to store only integer values
3. Example:

		#include <iostream>
		
		using namespace std;
		
		int main() {
			int number;
		}
		
	1. `number` - identifier of variable that can store `int` data
4. We can declare multiple variables in a single line

		int number1, number2, number3;

#### Variable Initialization ####
1. Initialization is storing actual value in reserved space
2. Syntax for initializing a variable

		variable_datatype variable_name = variable_value;
		
3. Example:

		#include <iostream>
		
		using namespace std;
		
		int main() {
			int number;
			number = 100;
		}
		
	1. C++ is a statically typed language
		1. In statically-typed langauge variable is declared with its type before its first use

#### Variable Declaration and Initialization in One Step ####
1. We can declare a variable and assign it a value in one go.
2. Example:

		#include <iostream>
		
		using namespace std;
		
		int main() {
			int number = 100;
		}

#### Example Program ####
1. A variable can be used to keep current amount in our bank account
2. For example: We have $100 in bank account
	1. If friend transfers $20 to it, then
		1. Current amount is $120
	2. Code:
	
			#include <iostream>
			
			using namespace std;
			
			int main() {
				// Declares a variable
				int current_amount;
				// Initialize a variable
				current_amount = 100;
				// Prints the value of the current_amount
				cout << "Your current amount is: " << current_amount << endl;
				// Updates the value of current_amount
				current_amount = 120;
				// Prints the updated value of current_amount
				cout << "Your current amount is: " << current_amount << endl;
			}

### Identifiers in C++ ###
1. Topics
	1. Identifiers
	2. Rules for naming a variable
		1. Example program with valid identifiers
		2. Example program with invalid identifiers

#### Identifiers ####
1. Variable in C++ is given a unique name known as identifier
	1. Use descriptive and meaningful names for variables to make code self-explanatory

#### Rules for Naming a Variable ####
1. An identifier can only contain uppercase aplhabet (A to Z), lowercase alphabet (a to z), numbers (0 to 9), and underscore (_).
2. First letter can be alphabet or _
	1. It is not good practice to start id with _
3. First letter cannot be a number
4. Ids are case sensitive
5. Id cannot contain white space
6. Id cannot have special characters
	1. &
	2. @
	3. *
	4. !
	5. ...
7. We cannot use keywords as ids
	1. Keywords are reserved words and predefined ids in language used for specific purposes

#### Example Program with Valid Identifiers ####
1. Run following code:

		#include <iostream>
		
		using namespace std;
		
		int main() {
			int number1;
			int _number;
			int number;
		}
		
	1. Above code has valid ids

#### Example Program with Invalid Identifiers ####
1. Example:

		#include <iostream>
		
		using namespace std;
		
		int main() {
			int 1;
			int number 1;
			int return;
		}

### C++ Constants/ Literals ###
1. Topics:
	1. Constants or literals
		1. Define constants using const keyword
		2. Example program

#### Constants or Literals ####
1. Example:

		#include <iostream>
		
		using namespace std;
		
		int main() {
			int number = 10;
			cout << "Number = " << number << endl;
			number = 20;
			cout << "Number = " << number << endl;
			number = 30;
			cout << "Number = " << number << endl;
		}
		
	1. We can over-write `number` during execution
2. If we want to declare a variable whose value remains fixed throughout program execution:
	1. Constants - similar to variables except that we can't change their value during code execution (?)

#### Define Constants Using the `const` Keyword ####
1. Syntax:

		const constant_datatype constant_name = constant_value;
		
	1. constant_datatype - covered later
		1. Example: `int`
	2. A constant declared with `int` data type cannot store any other datatype

#### Example Program ####
1. Example:

		#include <iostream>
		
		using namespace std;
		
		int main() {
			const int number = 10;
			cout << "Number = " << number << endl;
			// Uncommenting the following line will result in a compiler error
			// number = 20;
		}
		
	1. In C++ constant must be initialized at the time of declaration
		1. If not error will occur

### Challenge 1: Initialize a Variable and Overwrite its Value ###
1. Topics:
	1. Problem Statement
	2. Output
	3. Coding Exercise
	
#### Problem Statement ####
1. Declare a variable: `int var`
2. Initialize `var` to `5000`
3. Print value of `var`
4. Overwrite value of `var` to `1000`
5. Print value of `var` again in new line

#### Output ####
#### Coding Exercise ####

### Challenge 2: Swap the Values of Two Variables ###
### Solution Review: Swap the Values of Two Variables ###
### Quiz ###

## Data Types and Input ##
### Data Types ###
### Primitive or Fundamental Data Types ###
### Data Type Modifiers ###
### Type-Casting ###
### String and Escape Sequences ###
### C++ User Input ###
### Challenge 1: Convert Double Value into Integer ###
### Solution Review: Convert Double Value into Integer ###
### Quiz ###

## Operators ##
### Introduction to Operators ###
### Arithmetic Operators ###
### Assignment and Compound Assignment Operator ###
### Relational Operators ###
### Logical Operators ###
### Bitwise Operators ###
### Precedence and Associativity ###
### Challenge 1: Find and Previous Alphabet ###
### Solution Review: Find the Previous Alphabet ###
### Challenge 2: Calculate Hours, Minutes, and Seconds ###
### Solution Review: Calculate Hours, Minutes, and Seconds ###
### Challenge 3: Calculate the Area of the Sphere ###
### Solution Review: Calculate the Area of the Sphere ###
### Quiz ###

## Conditional Statements ##
### Introduction to Conditional Statements ###
### If Statement ###
### If-else Statement ###
### Nested else-if Statement ####
### Switch Statement ###
### Conditional Operator ###
### Challenge 1: Find the Person with the Highest Salary ###
### Solution Review: Find the Person with the Highest Salary ###
### Challenge 2: Check if the Given Character is an Alphabet ###
### Solution Review: Check if the Given Character is an Alphabet ###
### Challenge 3: Display Day of the Week ###
### Solution Review: Display Day of the Week ###
### Quiz ###

## Loops ##
### Introduction to Loops ###
### While Loop in C++ ###
### do-while Loop ###
### for Loop ###
### Infinite Loop ###
### Nested Loop ###
### break Statement ###
### continue Statement ###
### Challenge 1: Calculate the Power of a Number ###
### Solution Review: Calculate the Power of a Number ###
### Challenge 2: Find out if the Given Number is Prime ###
### Solution Review: Find out if the Given Number is Prime ###
### Challenge 3: Convert Decimal Number to Binary ###
### Solution Review: Convert Decimal Number to Binary ###
### Challenge 4: Find out if the Given Number is a Palyndrome ###
### Solution Review: Find out if the Given Number is a Palyndrome ###
### Quiz ###

## Functions ##
### Functions in C++ ###
### Declaring a Function ###
### Defining a Function ####
### Calling a Function ###
### C++ Function Parameters ###
### Pass by Value in Functions ###
### Pass by Reference in Functions ###
### Scope of Variable ###
### Overwriting the Value of the Global Variable ###
### Function Overloading ###
### Lambda Functions ###
### Challenge 1: Convert Digits from 0 to 5 into Text ###
### Solution Review: Convert Digits from 0 to 5 into Text ###
### Challenge 2: Set the Smallest Number to -1 ###
### Solution: Set the Smallest Number to -1 ###
### Challenge 3: Design a Calculator ###
### Solution Review: Design a Calculator ###
### Quiz ###

## Recursion ##
### What is Recursion? ###
### Structure of a Recursive Program ###
### Calculating the Factorial of a Number ###
### Recursion vs Iteration ###
### Challenge 1: Calculate the Power of a Number Recursively ###
### Solution Review: Calculate the Power of a Number Recursively ###
### Challenge 2: Count the Digits in a Number Using Recursion ###
### Solution Review: Count the Digits in a Number Using Recursion ###
### Challenge 3: Calculate the nth Fibonacci Number using Recursion ###
### Solution Review: Calculate nth Fibonacci Number using Recursion ###
### Quiz ###

## Arrays ##
### Introduction to Arrays ###
### Constructing an Array ###
### Accessing an Array ###
### Arrays and Functions ###
### Constructing a Two-Dimensional Array ###
### Accessing Two-Dimensional Arrays ###
### Challenge 1: Calculate the Average Marks of a Class ###
### Solution Review: Calculate the Average Marks of a Class ###
### Challenge 2: Left Rotate Array ###
### Solution Review: Left Rotate Array ###
### Challenge 3: Sort Elements of an Array in Descending Order ###
### Solution Review: Sort Elements of an Array in Descending Order ###
### Challenge 4: Add Main Diagonal Elements in a Matrix ###
### Solution Review: Add Main Diagonal Elements in a Matrix ###
### Challenge 5: Multiply Two Matrices ###
### Solution Review: Multiply Two Matrices ###
### Quiz ###

## Pointers ##
### Computer Memory ###
### Variables and Memory ###
### Address-of Operator ###
### What is a Pointer? ###
### Dereferencing Operator ###
### References ###
### Function and Pointers ###
### Challenge 1: Calculate the Area of a Rectangle Using Pointers ###
### Solution Review: Calculate the Area of a Rectangle Using Pointers ###
### Challenge 2: Calculate the Sum and Absolute Difference ###
### Solution Review: Calculate the Sum and Absolute Difference ###
### Quiz ###

## Dynamic Memory Allocation ##
### Types of Allocation ###
### Allocation of Dynamic Memory ###
### Deallocation of Dynamic Memory ###
### Dynamic Arrays ###
### Challenge 1: Set the Odd Elements in a Dynamic Array to -1 ###
### Solution Review: Set the Odd Elements in a Dynamic Array to -1 ###
### Challenge 2: Delete an Element at a Specific Index ###
### Solution Review: Delete an Element at a Specific Index ###
### Challenge 3: Calculate Mean and Standard Deviation from Array ###
### Solution Review: Calculate Mean and Standard Deviation from Array ###
### Quiz ###

## Mini Project ##
### Mini Project 1: Grayscale to Binary Image ###

## Mini Project ##
### Hangman Game ###

## Mini Projects Solution ##
### Solution: Mini Project 1 ###
### Solution: Mini Project 2 ###

## Structures ##
### Introduction to Structures ###
### Defining Structure in C++ ###
### Declaring Structure Variables in C++ ###
### Initializing and Accessing Members of a Structure Variable in C++ ###
### Array of Structures ###
### Structure and Functions ###
### Structure and Pointers ####
### Challenge 1: Subtract Two Complex Numbers ###
### Solution Review: Subtract Two Complex Numbers ###
### Challenge 2: Calculate Overall Percentage of Student's Marks ###
### Solution Review: Calculate Overall Percentage of Student's Marks ###
### Challenge 3: Account Number of Customers with Balance < $500 ###
### Solution Review: Account Number of Customers with Balance < $500 ###
### Quiz ###