# Advanced C Programming Course #

## Introduction ##
### Welcome to Class! ###
1. Intermediate and advanced concepts
2. C for embedded systems
3. Focus on C high quality code
4. Overview:
	1. Focuses on more intermediate/advanced concepts of C
		1. To make us expert in C
	2. Enrolling in beginner class is not required
5. Topics:
	1. Storage classes
		1. auto, register, static, and extern
			1. static - variables and methods, global variables
			2. extern - share global variables amongst files
		2. advanced data types
			1. typedef, variable length arrays, flexible array numbers, complex number types (c99)
		3. type qualifiers
			1. const, volatile (access changes data or not), and restrict (pointers)
		4. bit manipulation
			1. binary numbers and bits
			2. bitwise operators (logical and shifting)
			3. bitmasks and bitfields
		5. Advanced control flow
			1. goto, null, comma operator
			2. setjmp and longjmp
		6. more on Input and Output
			1. getchar, putchar, fgets, etc.
			2. puts, sprint, fprintf, fflus (conversion functions)
		7. advanced function concepts
			1. variadic functions (variable number of arguments)
			2. recursive functions
			3. inline functions
		8. unions
			1. overview, defining and accessing union members
				1. dynamic structure
				2. Access members
		9. advanced preprocessor concepts
			1. `#define`, `#pragma`, `#error`, `#`, `##`
				1. Runs before compiler
			2. conditional compilation (`#ifdef`, `#endif`, `#else`, `#elif`, `#undef`, etc)
				1. More portable
				2. Better debugging
			3. include guards
		10. macros
			1. overview (vs. functions, when to use)
			2. predefined macros (for concatenation)
				1. _FILE
				2. _LINE
				3. _FUNCTION
			3. constructing your own macros
		11. advanced debugging and compiler flags
			1. debugging with the pre-processor, more on gdb
				1. compiler options
				2. debugging
				3. GNU Debugger:
					1. Set breakpoints (through commandline)
			2. core files, getting and stack trace
				1. Segmentation fault debugging (stack trace)
			3. static analysis and profiling
				1. valgrind
				2. gprof
		12. static libraries and shared objects
			1. overview, creation, dynamic loading (dl library - loading in runtime)
		13. working with larger programs
			1. dividing your program into multiple files and compiling multiple files
				1. Organization
		14. advanced pointers
			1. double pointers (pointers to pointers)
				1. Simulating call by reference
			2. function pointers
				1. Pointers to functions
			3. more on void pointers
		15. useful C libraries
			1. the assert library
			2. general utilities library (stdlib.h), (exit, atexit, qsort (useful), memcpy, abort)
			3. data and time functions
		16. data structures
			1. Linked lists
			2. stacks
			3. queues
			4. trees
		17. Inter-process communication (unix based using cygwin)
			1. overview (message queues, shared memory, piping)
				1. Program is process that runs on system
			2. forking and signals
				1. creation and communication between processes
				2. IPC
		18. threads (pthread (posix), not <threads.h> from c11 - not portable)
			1. Overview, constructing a thread
			2. mutexes and semaphores
			3. thread management (multi-threading, join, detach)
		19. networking (unix based using cygwin)
			1. Overview (client/server model)
			2. constructing server and client sockets
		20. many challenges, solutions, and examples
			1. Quizes as well
		21. organized around theory and many demonstrations
		22. hands on coding
	2. Course outcomes:
		1. you will be able to write advanced C programs
			1. 90 - 95% of the concepts will be known at least
		2. you will be able to write efficient, high quality C code
			1. modular
			2. low coupling
				1. Doesn't have too many dependencies
					1. Easy to find and fix bugs
		3. master the art of programming solving in programming using efficient, proven methods
		4. you will understand advanced concepts of C programming language
		5. you will have fun!

### Class Organization ###
1. Lectures are designed around explaining the why and providing the how
	1. A complete learning experience
	2. Understand the programming language as a whole
	3. Lacking in most Udemy courses
2. Powerpoint slides:
	1. a way to present abstract concepts and definitions that I am not able to demonstrate in code (as easily)
	2. Not just reading from slides!
		1. Providing insight via experience
		2. Providing thorough explanations

### The C99 Standard ###
### The C11 Standard ###

## Installing Required Software ##
### Overview ###
### Installing the C Compiler (Windows) ###
### Installing the C Compiler (Mac) ###
### Installing Code Blocks (Windows) ###
### Installing CodeLite (Windows) ###
### Installing CodeLite (Mac) ###
### Installing Visual Studio Code (Windows) ###
### Installing Visual Studio Code (Linux) ###
### Installing Visual Studio Code (Mac) ###

## Starting to Write Code ##
### Exploring the Code Blocks Environment ###
### Constructing a Project in Code Blocks ###
### Exploring the Visual Studio Code Environment ###
### Constructing a Workspace and Configuring the Compiler in Visual Studio Code ###

## Working with Larger Programs ##
### Overview ###
### Compiling Multiple Source Files from the Command Line ###
### Makefiles ###
### Communication Between Files ###
### Using Header Files Effectively ###
### Heap and Stack Memory Allocation ###

## Storage Classes ##
### Automatic Variables ###
### External ###
### Static ###
### Register ###
### Quiz 1: (Quiz) ###
### (Challenge) ###

## Advanced Data Types ##
### The #define Statement ###
### Using typedef ###
### Variable Length Arrays ###
### (Challenge) Variable Length Arrays ###
### Flexible Array Members ###
### (Challenge) Flexible Array Members ###
### Complex Number Types ###
### (Challenge) Complex Number Types ###
### Designated Initializers ###
### Quiz 2: (Quiz) ###
### (Demonstration) Challenge Solutions ###

## Type Qualifiers ##
### const ###
### volatile ###
### restrict ###
### Quiz 3: (Quiz) ###

## Bit Manipulation ##
### Binary Numbers and Bits ###
### (Challenge) Binary Numbers and Bits ###
### (Demonstration) Binary Numbers and Bits ###
### Bitwise Operators (Logical) ###
### Bitwise Operators (Shifting) ###
### (Challenge) Bitwise Operators ###
### (Demonstration) Bitwise Operators ###
### Bitmasks ###
### Using Bit Operators to Pack Data ###
### (Challenge) Setting and Reading Bits ###
### (Demonstration) Setting and Reading Bits ###
### Using Bit Fields to Pack Data ###
### (Challenge) Using Bit Fields to Pack Data ###
### (Demonstration) Using Bit Fields to Pack Data ###
### Quiz 4: (Quiz) ###

## Advanced Control Flow ##
### The goto Statement ###
### (Challenge) The goto Statement ###
### The null Statement ###
### The Comma Operator ###
### setjmp and longjmp Functions ###
### (Challenge) setjmp and longjmp Functions ###
### (Demonstration) Advanced Control Flow ###
### Quiz 5: (Quiz) ###

## Input and Output ##
### Char Functions (input) ###
### Char Functions (output) ###
### (Challenge) Char Functions ###
### (Demonstration) Char Functions ###
### String Functions ###
### (Challenge) String Functions ###
### (Demonstration) String Functions ###
### Formatting Functions ###
### (Challenge) Formatting Functions ###
### (Demonstration) Formatting Functions ###
### Quiz 6: (Quiz) ###

## Advanced Function Concepts ##
### Variadic Functions ###
### va_copy ###
### (Challenge) Variadic Functions ###
### (Demonstration) Variadic Functions ###
### Recursion ###
### (Challenge) Recursion ###
### (Demonstration) Recursion ###
### Inline Functions ###
### _Noreturn Functions ###
### Quiz 7: (Quiz) ###

## Unions ##
### Overview ###
### Defining a Union ###
### Accessing Union Members ###
### (Challenge) Unions ###
### (Demonstration) Unions ###
### Quiz 8: (Quiz) ###

## The Preprocessor ##
### Overview ###
### Conditional Compilation ###
### Include Guards and #undef ###
### #pragma and #error ###
### Quiz 9: (Quiz) ###

## Macros ##
### Overview ###
### Macros vs. Functions ###
### Constructing Your Own Macros ###
### Preprocessor Operators ###
### Predefined Macros ###
### (Challenge) Macros ###
### (Demonstration) Macros ###

## Advanced Debugging, Analysis, and Compiler Options ##
### GCC Compiler Options (Part 1) ###
### GCC Compiler Options (Part 2) ###
### Debugging with the Preprocessor ###
### Debugging with gdb (Part 1) ###
### Debugging with gdb (Part 2) ###
### core files ###
### Profiling ###
### Static Analysis ###
### (Challenge) ###
### (Demonstration) ###

## Advanced Pointers ##
### Double Pointers (Pointer to a Pointer) ###
### Double Pointers (Pointer to a Pointer) Part 2 ###
### (Challenge) Double Pointers ###
### (Demonstration) Double Pointers ###
### Function Pointers ###
### (Challenge) Function Pointers ###
### (Demonstration) Function Pointers ###
### void Pointers ###

## Static Libraries and Shared Objects ##
### Overview ###
### Constructing a Static Library (archive) ###
### (Challenge) Static Library ###
### (Demonstration) Static Library ###
### Constructing a Dynamic Library (Shared Object) ###
### (Challenge) Dynamic Library ###
### (Demonstration) Dynamic Library ###
### Dynamically Loading a Shared Object ###
### (Challenge) Dynamic Loading ###
### (Demonstration) Dynamic Loading ###

## Useful C Libraries ##
### Assert ###
### General Utilities (stdlib.h) ###
### General Utilities (stdlib.h) Part 2 ###
### General Utilities (stdlib.h) Part 3 ###
### Date and Time Functions ###
### (Challenge) ###
### (Demonstration) ###
### Quiz 11: (Quiz) ###

## Data Structures ##
### Abstract Data Types ###
### Linked Lists (Overview) ###
### Linked Lists (Implementation) ###
### (Challenge) Linked Lists ###
### (Demonstration) Linked Lists ###
### Stacks (Overview) ###
### Stacks (Implementation) ###
### Queues (Overview) ###
### Queues (Implementation) ###
### Binary Trees (Overview) ###
### Binary Trees (Implementation) ###
### Quiz 12: (Quiz) ###

## Interprocess Communication and Signals ##
### Interprocess Communication ###
### Signals (Overview) ###
### Raising a Signal ###
### Handling a Signal Using the Signal Function ###
### Handling a Signal Using Sigaction ###
### The fork() System Call ###
### (Challenge) ###
### (Demonstration) ###

## Threads ##
### Overview ###
### Constructing a Thread ###
### Passing Arguments and Returning Values ###
### Common Thread Functions ###
### Thread Synchronization Concepts ###
### Mutexes ###
### Condition Variables ###
### (Challenge) ###
### (Demonstration) ###
### Quiz 13: (Quiz) ###

## Networking (Sockets) ##
### Overview ###
### The Socket API ###
### Constructing a Server Socket ###
### Constructing a Client Socket ###
### (Challenge) ###
### (Demonstration) ###

## Conclusion ##
### Course Summary ###

## Extra Information - Source Code, and Other Stuff ##
### Source Codes ###
### Bonus Lecture and Information ###
