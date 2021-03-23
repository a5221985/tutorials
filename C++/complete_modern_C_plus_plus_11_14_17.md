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
1. Primitive Types
	1. Arithmetic & void
		1. Arithmetic -> Integral & floating point
			1. Integral -> bool, char, wchar_t, char16_t, char32_t, short, int, long
			2. Floating point -> float, double
		2. void -> special type used with
			1. pointers
			2. functions
2. Modifiers
	1. Some of them can be modified using modifiers
		1. signed
		2. unsigned
		3. short
		4. long
	2. Example: signed & unsigned can only be used with integrals
	3. All types can be qualified with qualifiers
		1. const
		2. volatile
		3. static
	4. All types can occupy memory and can hold a range of values
		1. Memory requirements may change with platform
			1. 16 bit platform - int might require 16 bits of mem
			2. 32 bit platform - int might require 32 bits of mem
3. Datatype Size
	1. bool - requires only one byte
	2. char - requires only one byte
	3. wchar_t - 2 bytes
	4. short - 2 bytes
	5. int - 4 bytes
	6. long - 4 bytes
	7. float - 4 bytes
	8. long long - 8 bytes
	9. double - 8 bytes
	10. long double - 8 bytes
4. Values that a type can hold is called range
5. Range can be found using C++ - using macros

		#include <climits>
		
		SHRT_MIN
		SHRT_MAX
		USHRT_MAX
		INT_MIN
		INT_MAX
		UINT_MAX
		LONG_MIN
		LONG_MAX
		ULONG_MAX
		LLONG_MAX
		LLONG_MIN
		ULLONG_MAX
		
		#include <cfloat>
		
		FLT_DECIMAL_DIG
		FLT_DIG
		FLT_EPSILON
		FLT_HAS_SUBNORM
		FLT_GUARD
		FLT_MANT_DIG
		FLT_MAX
		FLT_MAX_10_EXP
		FLT_MAX_EXP
		FLT_MIN
		FLT_MIN_10_EXP
		FLT_MIN_EXP
		FLT_NORMALIZE
		FLT_RADIX
		
6. Variable declaration
	1. Declared by specifying type followed by variable name

			int i
			float x
			
	2. Variables are also called identifiers
	3. Multiple variables can be declared with same type

			int a, b, c
			
	4. May or may not be initialized with initializer
		1. Better to initialize variables during declaration to avoid bugs
	5. Some compilers don't allow read operation from uninitialized variable
		1. An un-initialized variable will have a junk value
7. Examples:

		int i;
		std::cout << i << std::endl;
		
	1. Compilation error
8. Character:

		char ch = 'a';
		bool flag = true; // keywords
		float f = 1.283f;
		double d = 534.232;
		
		int a[5];
		
		int arr1[5] = {1, 2, 3, 4, 5};
		
	1. bool can be 0 (false) or non-zero (true)
		1. It is better to use true or false
	2. Arrays are vector type
9. Initialization of scalar and vector types requires different syntax
	1. C++11 - uniform initialization - use curly braces everywhere

			int i {1};
			int a[5] {1, 2, 3, 4, 5}; 

### Basic Input/ Output ###
1. Console I/O
	1. Two classes
		1. `std::basic_ostream` - for output
		2. `std::basic_istream` - for input
	2. Type references are provided by C++ for convenience
		1. `std::ostream`
		2. `std::istream`
	3. `std::cout` & `std::cin` are objects of `std::ostream` and `std::istream` respectively
		1. `std::cout` is for console output
			1. `<<` operator can be used for that
		3. `std::cin` is for keyboard input
			1. `>>` operator can be used for extraction of characters
	4. `iostream` - header that defines `std::cout` and `std::cin` 
	5. Multiple insertion operators can be used to insert
		1. `\n` can also be inserted
	6. Extraction operator

			int age;
			cin >> age;
			cout << "age is = " << age << endl;
			
	7. Reading a string:

			char buff[512];
			cout << "What is your name? ";
			cin >> buff;
			cout << "Your name is " << buff << endl;
			
		1. Stops reading when whitespace character is encountered
			1. To read entire line:

					cin.getline(buff, 64, '\n'); // **(M)**
					
				1. first param: buffer
				2. second param: number of characters
				3. third param: delimiter (cin stops reading when it encounters this character)

### Functions Basics - Part I ###
1. Functions:
	1. A function is a set of statments enclosed within a pair of {}
	2. Called as body of the function
	3. These statements define what the function does
	4. Every function has a unique name
	5. This name is used to invoke or call the function
	6. Functions are basic building blocks of C/C++ programs
2. Why Functions?
	1. If processing needs multiple lines of code and we need to repeat this processing in multiple parts of code
		1. If there is no function, the code needs to be duplicated in multiple places
	2. The functions can be re-used from other parts of code
	3. Helps avoid writing repetitive logic/ code in a program
	4. Same code can be re-used in different parts of the program through a function
	5. There's no limit to the number of times a function can be called
		1. We can call a function as many times as we want and from any part of the application
	6. Makes the code modular as the program can be divided into cohesive modules
		1. Parts are called as modules
			1. Modules work together to provide the functionality of the application
	7. Reduces the complexity of the code
3. Structure
	1. A function can accept values through parameters
	2. These can be used as input for some processing inside the function
	3. Afterwards, a function can return the result of processing as the return value
	4. Only one value can be returned
	5. Parameters and return value are optional

			<return type> <name> (<parameters>) {<body>}
			
			int Add(int, int) {}
			void Print(char ch) {}
			void Clear() {}
				void Clear(void) {} // acceptable as well
			
		1. `void` - function does not return anything
		2. Signature - name with parameter types
	6. To use a function: we need to call or invoke it
	7. If function has parameters, we need to supply corresponding arguments (not optional)
	
			int Add(int x, int y) {
				return x + y;
			}
			
		1. Funtion definition: It is name of function along with it's body
			1. In the body, certain operation is performed using the parameters
		2. Function call

				Add(3, 5);
				
			1. Arguments correspond to params of function
				1. The args are not optional
	8. Example:

			int add(int, int); // required for compiler to know the name

			int main() { // it is a function and an entry point
				int x, y;
				std::cin >> x >> y;
				int result = add(x, y); // assignment is not required
				std::cout << "Result is: " << result << std::endl;
				// use result
			}
			
			add(int x, int y) { // x and y here only have the scope of the function
				int sum = x + y;
				std::cout << "Sum is: " << sum << std::endl;
				return sum;
			}
			
		1. In C++ main should return int (returning void is non-standard)
			1. In C - it can return void
		2. main can have two params for commandline arguments

### Functions Basics - Part II ###
1. Compiler compiles from top to bottom
	1. functions have to be declared before they are used

			int add(int x, int y); // declaration or prototype
			
		1. Compiler needs the prototype in C++
			1. C compiler can compile successfully if not declared (it may not be true for all functions)
2. We don't want to write all functions in one file
	1. We can put functions in different files
		1. If we need to use the function in multiple files, we may need to put it's declaration in all the files
			1. Inconvenient
	2. Solution:
		1. Copy the definition of function into it's own file
		2. Construct a header file (which contains declaration)

				int Add(int x, int y);
				
		3. Include the header file

				#include "math.h"
				
			1. If math.cpp is included, the program might have multiple definitions of the functions
				1. Only include header files
		4. Functions that belong together and that work towards one concept will be in one cpp file
			1. Declarations will be put in one header file
				1. all io functionality in iostream
				2. all threading related functions in another .h and .cpp files
3. Example: Printing a character

		void print(char c) {
			// ...
		}
		
	1. We can put definition before it is invoked
		1. This is usually done for inline functions and function templates
4. The functions defined inside a file directly are global functions

### Overview of Debugging in Visual Studio ###
1. Debugging: F5
2. To stop the program at a location: add a breakpoint
3. Stop debugging: Shift + F5
	1. Continue: F5
4. Step into: F10
	1. Goes into the function if it encounters the function
		1. It can jump into C++ library function
5. Step over: F11
6. Viewing different types of windows
	1. Debug > Windows > Watch (only while debugging) - 4 windows
		1. We can drag the variable to the window
	2. Factorial function

			#include <iostream>
			int factorial(int x) {
				int result = 1;
				for (int i = 1; i < x; i++) {
					result *= i;
				}
				return result;
			}
			
			int main() {
				int i = 5;
				int result = factorial(5);
				std::cout << "Factorial of " << i << " is " << std::endl;
				return 0;
			}
			
		1. Start without debugging: ctrl + F5

### Uniform Initialization (C++11) ###
1. C++98 provided different ways to initialize types
2. Scalar types can be initialized with = or ()
3. Array types have to be initialized with {}
4. C++11 introduced uniform initialization (single syntax)
	1. Use {} to initialize all types
5. Advantages:
	1. Uniform syntax to initialize all types
	2. Forces initialization of both scalar and array types
	3. Prevents bugs when initializing incompatible types through compiler warnings/ errors
6. Example:

		int a1; // uninitialized - no default constructor to initialize
		int a2 = 0;
		std::string s1; // default constructor is invoked - automatically initializes the object
		std::string s2("C++");
		int a3(5); // this style is consistent with object initialization - direct initialization
		char d1[8]; // uninitialized
		char d2[8] = {'\0'};
		char d3[8] = {'a', 'b', 'c', 'd'}; // aggregate initialization
		char d4[8] = {"abcd"};
		
	1. Assignment is called a copy initilalization
		1. Sometimes copies of LHS are created and then copied to the LHS variables
7. Uniform initialization gives single syntax

		int b1{}; // empty braces initilizes it to default value - 0 - value initialization
		int b2(); // function declaration - most vexing parse - uniform initialization eliminates this
		int b3{5}; // Direct initialization
		char e1[8]{}; // automatically initialized to default values
		char e2[8]{"Hello"};
		
	1. Heap based objects

### Pointers ###
### Assignment ###
### Reference ###
### Assignment ###
### Reference Vs Pointer ###
### The `const` Qualifier ###
### `const` Qualifier & Compound Types ###
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

## Move Semantics ##
### L-values, R-values & R-value References (C++11) ###
### Move Semantics - Basics (C++11) ###
### Move Semantics - Implementation (C++11) ###
### Rule of 5 & 0 ###
### Copy Elision ###
### std::move Function (C++11) ###

## Operator Overloading ##
### Operator Overloading Demo Code ###
### Operator Overloading - Part I (Basics) ###
### Operator Overloading - Part II (Assignment Operator) ###
### Operator Overloading - Part III (Global Overloads) ###
### Operator Overloading - Part IV (Friend Keyword) ###
### Operator Overloading - Part V (Smart Pointer Basics) ###
### Operator Overloading - Part VI (Smart Pointer in C++11) ###
### Operator Overloading - Part VII (Rules) ###
### Type Conversions - Part I (Basics) ###
### Type Conversions - Part II (Primitive to User Type) ###
### Type Conversions - Part III (User to Primitive Type) ###
### Initilization Vs. Assignment & Member Initilization List ###

## Memory Management - Part II ##
### Smart Pointers - I ###
### Smart Pointers - II ###
### Smart Pointers - III ###
### Smart Pointers - IV ###
### Smart Pointers - V ###
### Smart Pointers - VI ###

## More C++ Goodies ##
### Enums - Part I (Basics) ###
### Enums - Part II (Scoped Enums C++11) ###
### Strings - Part I (Raw Strings) ###
### Strings - Part II (std::string) ###
### Assignment I ###
### Strings - Part III (String Streams) ###
### Assignment II ###
### Constant Expressions - constexpr (C++11) ###
### std::initilizer_list (C++11) ###
### Dynamic Array (std::vector) ###
### Assignment III ###
### Union - I ###
### Union - II ###

## Object Oriented Programming ##
### Account Hierarchy Source Code ###
### Inheritance & Composition ###
### Inheritance & Access Modifiers ###
### Project - I (Introduction) ###
### Project - II (Account & Savings Class) ###
### Assignment ###
### Project - III (C++11 Inheriting Constructors) ###
### Project - IV (Virtual Keyword) ###
### Project - V (Virtual Mechanism - 1) ###
### Project - VI (Virtual Mechanism - 1) ###
### Project - Part VIII (override & final specifier in C++11) ###
### Project - VIII (Object Slicing) ###
### Project - IX (typeid Operator) ###
### Project - Part X (dynamic_cast Operator) ###
### Abstract Class ###
### Multiple (Diamond) Inheritance ###

## Exception Handling ##
### Exception Handling - Part I (Basics) ###
### Exception Handling - Part II (Multiple Catch Blocks) ###
### Exception Handling - Part III (Stack Unwinding) ###
### Exception Handling - Part IV (Nested Exceptions) ###
### Exception Handling - Part V (Constructor & Destructor) ###
### Exception Handling - Part VI (noexcept keyword in C++11) ###

## File Input & Output ##
### Raw String Literals (C++11) ###
### Introduction to Filesystem Library (C++17) (DEPRECATED) ###
### File IO - Part I (Basics) ###
### File IO - Part II (Error Handling) ###
### File IO - Part III (Copy Utility) ###
### File IO - Part IV (Character IO & Seeking) ###
### File IO - Part V (Binary IO) ###
### Assignment I ###
### Assignment II ###
### File Copy Utility Source ###

## Templates ##
### Source Code ###
### Introduction to Templates ###
### Assignment I ###
### Template Argument Deduction & Instantiation ###
### Assignment II ###
### Explicit Specialization ###
### Non-type Template Arguments ###
### Assignment III ###
### Perfect Forwarding - Part I (C++11) ###
### Perfect Forwarding - Part II (C++11) ###
### Variadic Templates - Part I (C++11) ###
### Variadic Templates - Part II (C++11) ###
### Assignment IV ###
### Class Templates ###
### Class Template Explicit Specialization - Part I ###
### Class Template Explicit Specialization - Part II ###
### Assignment V ###
### Class Template Partial Specialization ###
### Tepedef, Type Alias & Alias Templates (C++11) ###
### Type Traits (C++11) ###
### static_assert (C++11) ###

## Lambda Expressions (C++11) ##
### Lambda Expressions Source Code ###
### Callbacks Revisited - Function Pointers ###
### Callbacks - Function Objects ###
### Lambda Expressions ###
### Lambda Expressions - Internals ###
### Lambda Expressions Capture List - Part I ###
### Lambda Expressions Capture List - Part II ###
### Lambda Expressions Capture List - Part III ###
### Generalized Lambda Capture ###
### Assignment ###

## Standard Template Library ##
### Introduction ###
### std::array (C++11) ###
### std::vector ###
### std::deque ###
### std::list & std::forward_list (C++11) ###
### Sequence Containers Demo Code ###
### std::set & std::multiset ###
### std::map & std::multimap ###
### Associative Containers Demo Code ###
### Unordered Containers (C++11) - I ###
### Unordered Containers (C++11) - II ###
### std::hash (C++11) ###
### Unordered Contianers Demo Code ###
### Big O Notation & Performance of Containers ###
### Algorithms - Part I ###
### Algorithms - Part II ###
### STL Project ###

## C++ Concurrency ##
### Concurrency Source Code ###
### Concurrency Basics ###
### Thread Creation (std::thread) ###
### Passing Arguments to Threads ###
### Thread Synchronization (std::mutex) ###
### std::lock_guard ###
### std::thread Functions & std::this thread Namespace ###
### Task Based Concurrency - Part I ###
### Task Based Concurrency - Part II ###
### Launch Policies ###
### std::future Wait Functions ###
### Using std::promise ###
### Propagating Exceptions Across Threads ###

## C++17 Core Language Features ##
### Source Code Information ###
### Deprecated & Removed Features ###
### Changes ###
### Attributes ###
### Feature Test Macros ###
### if & switch With Initialization ###
### inline Variables ###
### Nested Namespaces ###
### noexcept ###
### constexpr Lambda ###
### Structured Bindings ###
### Expression Evaluation Order ###
### Mandatory Copy Elision - I ###
### Mandatory Copy Elision - II ###

## C++17 Template Features ##
### Class Template Argument Deduction (CTAD) ###
### Folding Basics ###
### Fold Expressions - Unary Folds ###
### Fold Expressions - Binary Folds ###
### Fold Expressions - Recap ###
### Type Traits Suffixes ###
### if constexpr - I ###
### if constexpr - II ###

## C++17 Standard Library Components ##
### std::optional - I ###
### std::optional - II ###
### std::optional - III ###
### std::variant - I ###
### std::variant - II ###
### std::variant - III ###
### std::any ###
### std::string_view - I ###
### std::string_view - II ###
### Filesystem - path ###
### Filesystem - directory_entry ###
### Filesystem - Directory Functions ###
### Filesystem - Permissions ###
### Parallel Algorithms - I ###
### Parallel Algorithms - II ###
### Parallel Algorithms - III ###
### BONUS LECTURE ###