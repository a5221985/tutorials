# Advanced C Programming Course #
## Introduction ##
### Welcome to Class! ###
1. Focus - writing High Quality Code
2. Focus - intermediate/advanced concepts of C - expertise
3. Topics
	1. Storage classes
		1. auto, register, static, and extern
	2. Advanced data types
		1. typedef, variable length arrays, flexible array numbers, complex number types (c99)
	2. Type qualifiers
		1. const, volatile, and restrict (pointers)
	4. Bit manipulation
		1. Binary numbers and bits
		2. Bitwise operators (logical and shifting)
		3. Bitmasks and bitfields
	5. Advanced control flow
		1. goto, null, comma operator
		2. setjmp and longjmp
	6. More on Input and Output
		1. getchar, putchar, fgets, etc.
		2. puts, sprint, fprintf, fflush
	7. Advanced function concepts
		1. Variadic functions (variable number of arguments)
		2. Recursive functions
		3. Inline functions
	8. unions (more dynamic and flexible)
		1. overview, defining and accessing union members
	9. Advanced preprocessor concepts
		1. \#define, #pragma, #error, #, ##
		2. Conditional compilation (#ifdef, #endif, #else, #elif, #undef, etc)
			1. More portable code
			2. Eases debugging
		3. Include guards - include file only once
	10. macros
		1. overview (vs. functions, when to use)
		2. predefined macros
			1. _FILE
			2. _LINE
			3. _FUNCTION
		3. Constructing your own macros
	11. Advaced debugging and compiler flags
		1. Debugging with the pre-processor, more on gdb
		2. Core files, getting the stack trace (segmentation fault)
		3. Static analysis and profiling
			1. Valgrind
			2. Gprof
			3. ...
	12. Static libraries and shared objects
		1. Overview, creation, dynamic loading
	13. Working with larger programs
		1. Dividing your program into multiple files and compiling multiple files
			1. Includes
			2. Organization
	14. Advanced pointers
		1. Double pointers (pointers to pointers)
		2. Function pointers
		3. More on void pointers
	15. Useful C libraries
		1. The assert library
		2. general utilities library (stdlib.h) (exit, atexit, qsort, memcpy, abort)
		3. date and time functions
	16. Data structures
		1. Linked lists, stacks, queues, and trees
	17. Inter-process communication (unix based using Cygwin)
		1. Overview (message queues, shared memory, piping)
		2. Forking and signals
	18. threads (pthread (posix), not <thread.h> from c11 - not portable)
		1. Overview, constructing a thread
		2. Mutexes and semaphores
		3. thread management (multi-threading, join, detach)
	19. Networking (unix based using Cygwin)
		1. Overview (client/server model)
		2. Constructing server and client sockets
	20. Many challenges, solutions, and examples
	21. Organized around theory and many demonstrations

### Class Organization ###
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
### Quiz 10: (Quiz) ###

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
