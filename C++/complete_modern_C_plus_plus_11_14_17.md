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
4. Small memory footprint
5. Can run in constrained environment (e.g. limited memory, slow CPU)
6. Standard C++ code can be easily ported to multiple platforms

### First C++ Program ###
### The C++ Compilation Process ###
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