# Complete Modern C++ (C++11/14/17) #

## Start Here ##
### Introduction ###
1. Functions, types, variables
2. Deep dive into dynamic memory management
3. Class features, operator overloading, streams
4. Composition, inheritance, polymorphism
5. Templates
6. Standard template library
7. New features
	1. Rvalue References
	2. Move Semantics
	3. Non-static data member initializers
	4. Initializer lists
	5. Delegating constructors
	6. Automatic type inference
	7. Null pointer constant
	8. Range-base for
	9. Raw string literals
	10. nullptr
	11. Lambda expressions
	12. Concurrency
	13. Variadic templates
	14. Type aliases
	15. Strongly-typed enums
	16. Deleted functions
	17. Explicit virtual overrides
8. Debuggin in disassembly
9. C++ with modern C++

### Required Software ###
1. Compilers
2. Visual Studio 2015/2017/2019 community edition
3. Windows:
	1. Visual Studio 2015/2017/2019
	2. Code:Blocks - requires a separate compiler
	3. Cevelop - requires a separate compiler
	4. Eclipse CDT - requires a separate compiler (same as Cevelop)
	5. MinGW
4. Linux (Ubuntu, CentOS, etc)
	1. GNU C++ Compiler
		1. `sudo apt-get install g++`
	2. Cevelop
	3. Eclipse CDT (same as Cevelop)
5. MacOS
	1. XCode [Appstore]
	2. Cevelop
	3. Eclipse CDT (same as Cevelop)

### Visual Studio 2015 Installation ###
### Visual Studio 2017 Installation ###
### Code::Blocks Installation ###
### Cevelop Installation ###
### XCode Installation on MacOS ###
1. New C++ Project
2. Project explorer
	1. Font - Preferences > Fonts & Colors
3. New File
	1. C++ File
	2. Name: Product
		1. Check box - if header file is needed

### Course Slides ###
1. [https://www.udemy.com/course/beg-modern-cpp/learn/lecture/8484196#content](https://www.udemy.com/course/beg-modern-cpp/learn/lecture/8484196#content)

## Basic Language Facilities ##
### What is C++? ###
1. It is a general purpose programming language
2. Object-oriented, imperative, generic
	1. Class & object
	2. imperative - c like
	3. generic - high performance code that operates on different kinds of data
3. Invented by Bjarne Stroustrup
4. Emphasis on system programming
	1. It is low level like C
5. Low-level like C, but feature-rich
	1. Features
		1. References
		2. Exception handling
		3. Function overloading
		4. Operator overloading
		5. ...

#### What is Modern C++ ####
1. Encompasses features of C++11
2. Move semantics
3. Smart pointers
	1. Pointer like objects
		1. They automatically free memory (no need to use raw pointers)
4. Automatic type inference
5. Threading
6. Lambda functions

#### ISO Standard Committee ####
1. Responsible for adding new features to C++
2. Has members from all over the world
3. Some are representativesof their companies (Microsoft, Google, IBM, etc)
	1. They propose new changes to C++ and it goes through a vote
	2. If vote gets accepted, then it becomes part of a new standard
4. Published first standard in 1998, followed by a minor revision in 2003
5. Major change in 2011, with lots of new features
	1. Made it modern and [seemed to be] well suited for large scale applications
6. 2014 added a minor change, mostly enhancements

#### Where is C++ used ####
1. All major software companies, in different domains
	1. Aerospace
	2. Finance
	3. 3D graphics
	4. ...
2. Majorly chosen for constructing high performance software (Facebook, Google, Microsoft, CERN, etc)
	1. Facebook
		1. Ads
		2. Feeds
		3. Search
		4. Open C++ libraries
	2. CERN
		1. Physics software - large hadron collider experiments
3. Operating systems, popular software, games
	1. Gaming engines - C++
		1. Unreal
		2. Cry Engine
		3. Unity

#### Why is C++ used ####
1. Used for performance, stability & portability
2. Available on almost all operating systems
3. No dependency on separate runtime
	1. Unlike Java, C# or Python
4. Small memory footprint
	1. Example: Good for systems with limited hardware capability
5. Can run in constrained environment (e.g. limited memory, slow CPU)
6. Standard C++ code can be easily ported to multiple platforms
	1. Code can be used in another platform with minimal changes
		1. Mobile - core parts can be written and ported (most of the code) to different devices
			1. Android
			2. Windows phone
			3. iOS
		2. Microsoft used the strategy to build office for different mobile platforms

### First C++ Program ###
1. Visual Studio Project Structure
	1. C++ Source files
		1. Header files
		2. Cpp files
	2. C++ source files are organized in a project
	3. Project is stored in a solution
		1. In large C++ apps, solution can have multiple projects
2. Open VS
	1. C/C++ > Line Numbers
3. New project
	1. Visual C++ > Win32 > Win32 Console application
4. Application Settings
	1. Console application
	2. Empty project
		1. Right click > New Item
			1. C++ File (.cpp)
				1. main (.cpp will be added automatically)
5. Comments
	1. Single line or multiline

			// Single line
			/*
				multiline comment
			*/
			
	2. Header file

			#include <iostream> // contains classes and header files for io
			
		1. Standard header files in cpp do not end with `.h`

				using namespace std; // namespace is a way to wrap types so that they are not accessible directly from outside and also not conflict with other names

				int main() {
					using namespace std;
					
					cout << "Hello C++"; // represents computer screen
					return 0; // goes to OS
				}
				
			1. Automatically invoked by runtime
			2. `<<` - insertion operator
				1. Multiple operators are allowed in one statement (cascading of operators)
				2. Newline: `endl` - manipulator
					1. Inserts new line
					2. Flushes output buffer (ensuring that string is immediately printed on screen)
		2. Build Solution
			1. Builds all the projects in the solution
		3. Start without debugging
6. Syntax error:
	1. Red underline
	2. Build errors are shown in Error List
		1. Double click on the message - it takes us to the line which has error
7. Fully qualified name:

		std::cout
		
	1. `::` - scope resolution operator

### The C++ Compilation Process ###
1. C++ Build Steps
	1. Steps
		1. Preprocessing - performed by preprocessor
			1. Statements beginning with # are processed
			2. Include statements get replaced with file content
				1. If headers are included
			3. Macros are expanded
		2. Compilation
			1. Code is checked for correct syntax
				1. If there are syntax errors, compiler stops and reports
					1. VS shows the errors in error window
				2. If there are no errors, the code is converted to object code
					1. Also generates .obj extension (extension is omitted on some platforms)
		3. Linking
			1. Object code is linked with standard libraries
				1. If there are no errors during linking, executable is generated
					1. It can be executed from commandline or explorer
2. Syntax error:
	1. Error list window

### Primitive Types & Variables ###
### Basic Input/ Output ###
### Functions Basics - Part I ###
### Functions Basics - Part II ###
### Overview of Debugging in Visual Studio ###
### Uniform Initialization (C++11) ###
### Pointers ###
### Assignment ###
### Reference ###
### Assignment ###
### Reference Vs Pointer ###
### The const Qualifier ###
### const Qualifier & Compound Types ###
### Assignment ###
### Automatic Type Inference (C++11) ###
### Range-Based For Loop - I (C++11) ###
### Range-Based For Loop - II (C++11) ###
### Function Overloading ###
### Default Function Arguments ###
### Inline Functions ###
### Function Pointers ###
### Namespace ###

## Memory Management - Part I ##
### Dynamic Memory Allocation - Part I (malloc function) ###
### Dynamic Memory Allocation - Part II (new operator) ###
### Dynamic Memory Allocation - Part III (new[] operator) ###
### Dynamic Memory Allocation - Part IV (2D arrays) ###
### Dynamic Memory Allocation - Source Code Only ###

## Classes & Objects ##
### Object Oriented Programming Basics ###
### Class ###
### Constructor & Destructor ###
### Structures ###
### Non-static Data Member Initializers (C++11) ###
### this Pointer ###
### Constant Member Functions ###
### Static Class Members ###
### Copy Constructor - Part I ###
### Copy Constructor - Part II ###
### Delegating Constructors (C++11) ###
### Default & Deleted Functions (C++11) ###
### L-values, R-values & R-value References (C++11) ###
### Move Semantics - Basics (C++11) ###
### Move Semantics - Implementation (C++11) ###
### Copy Elision ###
### Move Semantics - std::move Function (C++11) ###