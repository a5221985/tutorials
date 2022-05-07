# Beginning C++ Programming - From Beginner to Beyond #
## Introduction ##
### About the Course ###
1. Welcome and Introduction to the Course:
	1. About me
	2. My assumptions
	3. Your background
	4. The curriculum and Modern C++
	5. Practice!
		1. It is like playing musical instrument
		2. If frustrated, take a break and try later
	6. Please ask questions
2. Modern C++
	1. As it should be used today
3. Challenges
	1. Come up with your own problems and solve them

### Why Learn C++? ###
1. Popular:
	1. Lots of code is still written in C++
	2. Programming language popularity indexes
		1. https://www.tiobe.com/tiobe-index/
		2. https://pypl.github.io/PYPL.html
		3. https://spectrum.ieee.org/computing/software/the-2017-top-programming-languages
		4. https://redmonk.com/sogrady/2017/06/08/langugae-rankings-6-17
		5. https://www.zdnet.com/article/which-programming-languages-are-most-popular-and-what-does-that-even-mean
	3. Active community, GitHub, stack overflow
2. Relevant:
	1. Windows, Linux, Mac OSX, Photoshop, Illustrator, MySQL, MongoDB, Game engines, more...
	2. Amazon, Apple, Microsoft, PayPal, Google, Facebook, MySQL, Oracle, HP, IBM, more...
		1. Products & internal research
	3. VR, Unreal Engine, Machine Learning, Networking & Telocom, more...
		1. Engines that drive popular frameworks
3. Powerful
	1. fast, flexible, scalable, portable
	2. Procedural and Object-oriented
4. Good career opportunities
	1. C++ skills always in demand
		1. Other major languages have ways to interface with C++
	2. C++ = Salary++
		1. It is a badge of honor

### Modern C++ and the C++ Standard ###
1. Early 1970s
	1. C Programming Language (+ Unix OS)
	2. Dennis Ritchie
2. 1979
	1. Bjarne Stroustrup
	2. C with Classes
		1. Object oriented features from Simula
3. 1983
	1. Name changed to C++
4. 1989
	1. First commercial release
5. 1998
	1. C++98 Standard
6. 2003
	1. C++03 Standard
		1. Issues were fixed
7. 2011
	1. **C++11 Standard**
8. 2014
	1. **C++14 Standard**
9. 2017
	1. **C++17 Standard**
10. Classical C++:
	1. Pre C++11 Standard
11. Modern C++: (C++ today - lambdas, new ways of dealing with memory management - smart pointers, threading, ... - it is like new language + best practices & core guidelines)
	1. C++11
		1. Lots of new features
	2. C++14
		1. Smaller changes
	3. C++17
		1. Simplification
	4. Best practices
	5. Core Guidelines

### How Does All This Work? ###
1. You must tell the computer EXACTLY what to do (it is not smart)
	1. Program - like a recipe
		1. series of tasks to be executed at a specific order
			1. Very explicit instructions
2. Programming language (C++)
	1. Source code - code we write
	2. high-level - understandable by humans
	3. for humans
3. Editor - used to enter program text (like word processors)
	1. .cpp and .h files
	2. .cc and .hpp
4. Binary or other low-level representation
	1. object code
	2. for computers
5. Compiler - translates from high-level to low-level
	1. Program takes source code as input and produces object code as output
		1. If source code has errors, no object code is produced
6. Linker - links together our code with other libraries
	1. Constructs executable program
		1. code re-use
7. Testing and Debugging - Finding and fixing program errors
	1. Debug to eliminate errors
8. IDE allows us to do all the above
9. Visual:
	1. Enter Source Code
		1. file1.cpp
		2. file2.cpp
		3. file3.cpp
		4. main.cpp
	2. C++ Compiler compiles
		1. file1.obj - one for each source file
		2. file2.obj
		3. file2.obj
		4. main.obj (windows .obj, linux .o)
	3. Linker links
		1. file1.obj + file2.obj + file3.obj + main.obj + C++ standard library + other libraries => main.exe (windows)
			1. Linx & Mac - no extension
10. IDEs provide:
	1. Editor
	2. Compiler
	3. Linker
	4. Debugger
		1. Covered in the code
	5. Keep everything in sync
		1. Hooks to version control
11. IDEs: (learn many IDEs + commandline experience)
	1. CodeLite (free, cross platform and less hardware to run)
		1. Fast
	2. Code::Blocks
		1. Cross platform, Mac version is buggy
	3. NetBeans
		1. For Java code
		2. Plugin for C++ (good)
			1. Needs JRE
			2. Memory is used
	4. Eclipse
		1. Memory requirements is high
	5. CLion
		1. Jetbrains - not free (expensive)
	6. Dev-C++
		1. C/C++ Windows only
		2. Fast
	7. KDevelop
		1. Multi-language IDE
		2. Build from source for Mac
	8. Visual Studio
		1. Good
		2. Windows
			1. Mac version doesn't support C++
	9. Xcode
		1. Good for Mac only

### FAQ -- Please Read! ###

## Installation and Setup ##
### Installation and Setup Overview ###
1. Section Overview:
	1. Microsoft Windows, Mac OSX, Ubuntu Linux 18.04
		1. C++ Compiler
		2. CodeLite Integrated Development Environment (IDE)
		3. Configure CodeLite
		4. Construct a Default CodeLite Project Template
			1. For any new project (quick creation)
2. Type the program and execute to check the installation
3. Using command-line tools - if hardware doesn't support IDEs
4. Using a Web-based compiler - basic C++ program

### Installing the C++ Compiler on Windows ###
1. mingw-w64.org
	1. Click on Downloads
	2. mingw-w64-builds - Windows
	3. Sourceforge
	4. Install
		1. Installs 64 bit if OS is 64 bit or 32 bit if OS is 32 bit
		2. Install latest
		3. Architecture: x86_64
		4. Location: keep is short (copy it)
			1. Compiler tool chains have problems with cloud drives, spaces, international characters and special characters
	5. PATH variable:
		1. Control Panel > search env > Edit environment variables for your account
		2. Environment variables
			1. System Variables
				1. PATH
					1. Paste the mingw path and append /bin
					2. Move up to under system32
2. Open cmd:

		g++ --version

### Installing CodeLite on Windows ###
### Configuring CodeLite on Windows ###
### Installing the C++ Compiler on Mac OSX ###
### Installing CodeLide on Mac OSX ###
### Configuring CodeLite on Mac OSX ###
### Using the Command-Line Interface ###
### Installing CodeLite on Ubuntu Linux ###
### Constructing a Default CodeLite Project Template (All Versions) ###
### Using the Command-Line Interface on Windows ###
### Using the Command-Line Interface on Mac OSX ###
### Using the Command-Line Interface on Linux (Ubuntu) ###
### Using a Web-based C++ Compiler ###
### Using the Included Source Code Course Resources ###

## Curriculum Overview ##
### Curriculum Overview ###
### Overview of the Section Challenge Exercises ###
### Overview of the Section Quizzes ###

## Getting Started ##
### Section Overview ###
### An Overview of the CodeLite Interface ###
### Writing our First Program ###
### Building Our First Program ###
### What are Compiler Errors? ###
### What are Compiler Warnings? ###
### What are Linker Errors? ###
### What are Runtime Erros? ###
### What are Logic Errors? ###
### Section Challenge ###
### Section Challenge - Solution ###
### Quiz 1: Section 4 Quiz ###

## Structure of a C++ Program ##
### Section Overview ###
### Overview of the Structure of a C++ Program ###
### #include Preprocessor Directive ###
### Comments ###
### The main() Function ###
### Namespaces ###
### Basic Input and Output (I/O) using cin and cout ###
### Coding Exercise 1: Using cout and the Insertion Operator to Say Hi to Frank ###
### Coding Exercise 2: Using cout and the insertion operator ###
### Coding Exercise 3: Using cin and the Extraction Operator ###
### Quiz 2: Section 5 Quiz ###

## Variables and Constants ##
### Section Overview ###
### What is a Variable? ###
### Declaring and Initializing Variables ###
### Coding Exercise 4: Declaring and Initializing Variables ###
### Global Variables ###
### C++ Built-in Primitive Types ###
### What is the Size of a Variable (sizeof) ###
### What is a Constant? ###
### Declaring and Using Constants ###
### Section Challenge ###
### Section Challenge - Solution ###
### Quiz 3: Section 06 Quiz ###

## Arrays and Vectors ##
### Section Overview ###
### What is an Array? ###
### Declaring and Initializing Arrays ###
### Accessing and Modifying Array Elements ###
### Coding Exercise 5: Declaring, Initializing and Accessing an Array ###
### Multidimensional Arrays ###
### Declaring and Initializing Vectors ###
### Accessing and Modifying Vector Elements ###
### Coding Exercise 6: Declaring, Initializing and Accessing Vectors ###
### Section Challenge ###
### Section Challenge - Solution ###
### Quiz 4: Section 07 Quiz ###

## Statements and Operators ##
### Section Overview ###
### Expressions and Statements ###
### Using Operators ###
### The Assignment Operator ###
### Arithmetic Operators ###
### Coding Exercise 7: Using the Assignment Operator ###
### Coding Exercise 8: Using the Arithmetic Operators ###
### Incerment and Decrement Operators ###
### Mixed Expressions and Conversions ###
### Testing for Equality ###
### Relational Operators ###
### Logical Operators ###
### Compound Assignment Operators ###
### Operator Precedence ###
### Coding Exercise 9: Logical Operators and Operator Precedence - Can you work? ###
### Section Challenge ###
### Section Challenge - Solution ###
### Quiz 5: Section 08 Quiz ###

## Controlling Program Flow ##
### Section Overview ###
### if Statement ###
### Coding Exercise 10: if Statement - Can you Drive? ###
### if else Statement ###
### Coding Exercise 11: if-else Statement - Can you Drive? ###
### Nested if Statements ###
### Coding Exercise 12: Nested if Statements - Can you Drive? ###
### switch-case Statement ###
### Coding Exercise 13: Switch Statement - Day of the Week ###
### Conditional Operator ###
### Looping ###
### for Looping ###
### Coding Exercise 14: For loop - Sum of Odd Integers ###
### range-based for Loop ###
### Coding Exercise 15: Using the range-based for Loop ###
### while Loop ###
### Coding Exercise 16: While Loop Exercise ###
### do While Loop ###
### continue and break ###
### Infinite Loop ###
### Nested Loops ###
### Coding Exercise 17: Nested Loops - Sum of the Product of all Pairs of Vector Elements ###
### Section Challenge ###
### Section Challenge - Solution Part 1 ###
### Section Challenge - Solution Part 2 ###
### Quiz 6: Section 09 Quiz ###

## Characters and Strings ##
### Section Overview ###
### Character Functions ###
### C-Style Strings ###
### Working with C-Style Strings ###
### Coding Exercise 18: Using C-Style Strings ###
### C++ Strings ###
### Working with C++ Strings ###
### Coding Exercise 19: Using C++ Strings - Exercise 1 ###
### Coding Exercise 20: Using C++ Strings - Exercise 2 ###
### Section Challenge - Solution ###
### Quiz 7: Section 10 Quiz ###
### Assignment 1: Challenge Assignment - Letter Pyramid ###

## Functions ##
### Section Overview ###
### What is a Function? ###
### Coding Exercise 21: Using Functions From the cmath Library ###
### Function Definition ###
### Function Prototypes ###
### Function Parameters and the Return Statement ###
### Coding Exercise 22: Functions and Prototypes - Converting Temperatures ###
### Default Argument Values ###
### Coding Exercise 23: Using Default Argument Values - Grocery List ###
### Overloading Functions ###
### Coding Exercise 24: Overloading Functions - Calculating Area ###
### Passing Arrays to Functions ###
### Coding Exercise 25: Passing Arrays to Functions - Print a Guest List ###
### Pass by Reference ###
### Coding Exercise 26: Using Pass by Reference - Print a Guest List ###
### Scopes Rules ###
### How do Function Calls Work? ###
### inline Functions ###
### Recursive Functions ###
### Coding Exercise 27: Implementing a Recursive Function - Save a Penny ###
### Section Challenge ###
### Section Challenge - Solution ###
### Quiz 8: Section 11 Quiz ###

## Pointers and References ##
### Section Overview ###
### What is a Pointer? ###
### Declaring Pointers ###
### Accessing the Pointer Address and Storing Address in a Pointer ###
### Dereferencing a Pointer ###
### Dynamic Memory Allocation ###
### The Relationship Between Arrays and Pointers ###
### Pointer Arithmetic ###
### Const and Pointers ###
### Passing Pointers to Functions ###
### Returning a Pointer from a Function ###
### Potential Pointer Pitfalls ###
### What is a Reference? ###
### L-Values and R-Values ###
### Using the CodeLite IDE Debugger ###
### Section Recap ###
### Section Challenge ###
### Section Challenge - Solution ###
### Quiz 9: Section 12 Quiz ###

## Operator Overloading ##
### Section Overview ###
### What is Operator Overloading? ###
### Overloading the Assignment Operator (copy) ###
### Overloading the Assignment Operator (move) ###
### Overloading Operators as Member Functions ###
### Code Exercise 34: Operator Overloading as Member Functions ###
### Overloading Operators as Global Functions ###
### Coding Exercise 35: Operator Overloading as Non-Member Functions ###
### Overloading the Stream Insertion and Extraction Operators ###
### Coding Exercise 36: Operator Overloading the Stream Insertion Operator ###
### Section Challenge ###
### Section Challenge - Solution 1 ###
### Section Challenge - Solution 2 ###
### Quiz 11: Section 14 Quiz ###

## Inheritance ##
### Section Overview ###
### What is Inheritance? ###
### Terminology and Notation ###
### Inheritance vs. Composition ###
### Deriving Classes from Existing Classes ###
### Protected Members and Class Access ###
### Constructors and Destructors ###
### Passing Arguments to Base Class Constructors ###
### Copy/Move Constructors and Operator = with Derived Classes ###
### Redefining Base Class Methods ###
### Multiple Inheritance ###
### The Updated Accounts Example ###
### Section Challenge ###
### Section Challenge - Solution ###
### Quiz 12: Section 15 Quiz ###

## Polymorphism ##
### Section Overview ###
### What is Polymorphism? ###
### Using a Base Class Pointer ###
### Virtual Functions ###
### Virtual Destructors ###
### Using the Override Specifier ###
### Using the Final Specifier ###
### Using Base Class References ###
### Pure Virtual Functions and Abstract Classes ###
### Abstract Classes as Interfaces ###
### Section Challenge ###
### Section Challenge - Solution Part 1 ###
### Section Challenge - Solution Part 2 ###
### Section Challenge - Final Solution ###
### Quiz 13: Section 16 Quiz ###

## Smart Pointers ##
### Section Overview ###
### Some Issues with Raw Pointers ###
### What is a Smart Pointer? Ownership and RAII ###
### Unique Pointers ###
### Shared Pointers ###
### Weak Pointers ###
### Custom Deleters ###
### Section Challenge 1 ###
### Section Challenge 1 - Solution ###
### Quiz 14: Section 17 Quiz ###

## Exception Handling ##
### Section Overview ###
### Basic Concepts and a Simple Example: Dividing by Zero ###
### Throwing an Exception from a Function ###
### Handling Multiple Exception ###
### Stack Unwinding and How it Works ###
### Constructing User-Defined Exception Classes ###
### Class Level Exceptions ###
### The C++ std::exception Class Hierarchy ###
### Section Challenge ###
### Section Challenge - Solution ###
### Quiz 15: Section 18 Quiz ###

## I/O and Streams ##
### Section Overview ###
### Files, Streams and I/O ###
### Stream Manipulators ###
### Stream Manipulators - boolean ###
### Stream Manipulators - integers ###
### Stream Manipulators - floating point ###
### Stream Manipulators - align and fill ###
### Section Challenge 1 ###
### Section Challenge 1 - Solution ###
### Reading from a Text File ###
### Reading from a Text File - Live Demo - Part 1 ###
### Reading from a Text File - Live Demo - Part 2 ###
### Coding Exercise 37: Reading a Text File ###
### Section Challenge 2 ###
### Section Challenge 2 - Solution ###
### Section Challenge 3 ###
### Section Challenge 3 - Solution ###
### Writing to a Text File ###
### Writing to a Text File - Live Demo ###
### Section Challenge 4 ###
### Section Challenge 4 - Solution ###
### Using String Streams ###
### File Locations with some Popular IDEs ###
### Quiz 16: Section 19 Quiz ###

## The Standard Template Library (STL) ##
### Section Overview ###
### What is the STL? ###
### Generic Programming with Macros ###
### Generic Programming with Function Templates ###
### Generic Programming with Class Tempaltes ###
### Constructing a Generic Array Template Class ###
### Introduction to STL Containers ###
### Introduction to STL Iterators ###
### Introduction to Iterators - Demo ###
### Introduction to STL Algorithms ###
### Introduction to Algorithms - Demo ###
### Sequence Container - Array ###
### Sequence Containers - Vector ###
### Sequence Containers - Deque ###
### Section Challenge 1 ###
### Section Challenge 1 - Solution ###
### Sequence Containers - List and Forwared List ###
### Section Challenge 2 ###
### Section Challenge 2 - Solution ###
### Associative Containers - Sets ###
### Associative Containers - Maps ###
### Section Challenge 3 ###
### Section Challenge 3 - Solution ###
### Container Adaptors - Stack ###
### Section Challenge 4 ###
### Section Challenge 4 - Solution ###
### Container Adaptors - Priority Queue ###
### Quiz 17: Section 20 Quiz ###

## Lambda Expressions ##
### Section Overview ###
### Motivation ###
### Structure of a Lambda Expression ###
### Stateless Lambda Expressions ###
### Stateless Lambda Expressions Demo - Part 1 ###
### Stateless Lambda Expressions Demo - Part 2 ###
### Stateful Lambda Expressions ###
### Stateful Lambda Expressions Demo - Part 1 ###
### Stateful Lambda Expressions Demo - Part 2 ###
### Lambdas and the STL ###

## Bonus Section - Using Visual Studio Code ##
### Section Overview ###
### Installing VSCode on Windows ###
### Building and Running C++ Programs with VSCode on Windows ###
### Debugging C++ Programs with VSCode on Windows ###
### Using the Course Source Code with VSCode on Windows ###
### Installing VSCode on Mac OSX ###
### Building and Running C++ Programs with VSCode on Mac OSX ###
### Debugging C++ Programs with VSCode on Mac ###
### Using the Course Source Code with VSCode on Mac ###
### Installing VSCode on Linux ###
### Building and Running C++ Programs with VSCode on Linux ###
### Debugging C++ Programs with VSCode on Linux ###
### Using the Course Source Code with VSCode on Linux ###

## Bonus Section - Enumerations ##
### Section Overview ###
### Motivation ###
### The Structure of an Enumeration ###
### Unscoped Enumeration ###
### Scoped Enumeration ###

## ARCHIVED - OLD INSTALLATION VIDEOS ##
### Installation and Setup Overview ###
### Installing the C++ Compiler on Windows ###
### Installing CodeLite on Windows ###
### Configuring CodeLite on Windows ###
### Installing the C++ Compiler on Mac OSX ###
### Installing CodeLite on Mac OSX ###
### Configuring CodeLite on Mac OSX ###
### Installing CodeLite on Ubuntu Linux ###
### Configuring CodeLite on Ubuntu Linux ###
### Constructing a Default CodeLite Project Template (All Versions) ###
### Using the Included Source Code Course Resources ###

## Extra Information - Source Code, and Other Stuff ##
### Source Code for All Sections ###

## Bonus Section - Including Slides ##
### Bonus - Course Slides and Free Programming EBook ###