# Introduction to Data Structures #
1. Data Types
2. Features of data structures
3. Abstract data types

## Objectives ##
1. Understand concept of data structure
2. Distinguish between data structures and data types
3. Learn how data structures are organized in computer
4. Describe the characteristics of common types of data structures
5. Understand the concept of abstract data types
6. Describe the advantages of abstract data types

## Data structures ##
1. It is the study of various ways of organizing data in a computer so that they can be used efficiently 
2. Information is manipulated by systematic and step-by-step procedure called algorithm
3. Manipulation involves, adding, searching, deleting, rearranging data items
	1. Sorting
	2. Traversing
4. Data structures and algorithms play a complementary role in many applications
5. Data structures are used in several disciplines
	1. Operating systems
	2. Compilers
	3. Database management systems
	4. Data communications
	5. System software
6. Algorithms with data structures are used in several applications
	1. Image processing
	2. Digital signal processing
	3. Simulations
	4. Numerical computations
	5. Cryptography
	6. Data compressions
	7. Genetic studies
7. Data types
	1. All programming languages have built in data types for efficient coding of programs
	2. Two types
		1. Primitives
			1. Values and set of operations which can be performed on these values
			2. Booleans, characters, real numbers, integers
				1. Operations on Booleans
					1. AND, OR, NOT
				2. Integers
					1. Values assumed can be based on compilers
					2. Basic operations
						1. Arithmetic and comparison
			4. These data types are called atomic or irreducible
				1. Cannot be expressed in terms of any other data types
			5. Supported by underlying hardware features and compiler systems
				1. Ranges of primitive data types depend on the number of bits allocated by the compiler and hardware circuitry
					1. Integers 32 bits with one bit for sign
					2. Characters can range from 0 - 65000
			6. Operations on primitive types are often included in CPU instruction set
			7. On some systems primitive data types are implemented using software routines
				1. Floating point operations on smaller devices that do not have a floating point circuitry
					1. Reduced computation speed (factor of 100 to 1000)
			8. Primitive data types are described in a program by language specific keywords
				1. Java defines 8 primitives
					1. int - 32 bits
					2. char - 16 bits 
					3. byte
					4. short
					5. long
					6. float
					7. bool
					8. double
				2. Each data type is made up of a fixed number of bits which is independent of a particular implementation
				3. C/C++ primitives
					1. int
					2. char
					3. float
					4. double
					5. bool - C++ only (0 and 1 in C)
					6. primitive qualifiers
						1. short
						2. long
						3. signed
						4. unsigned
				5. C/C++ primitive sizes are platform dependent
				6. VB supports
					1. Integer
					2. Long
					3. Single
					4. Double
					5. Boolean
					6. Byte
					7. Primitives
						1. Dim
						2. Private
						3. Public
						4. Static
		2. Composites
			1. Complex data types are defined using combination of primitive types
			2. Examples:
				1. Arrays
					1. A collection of homogeneous data types (built in data types in many languages)
				2. Vectors
					1. Mathematical representations of arrays
						1. Java: Arrays of flexible size
				3. Strings
					1. Combinations of characters
						1. In C/C++, Ada and Pascal: string data are stored with special delimiter
							1. As an array of characters with a null character as the delimiter
						2. Fortran, VB: Support strings as primitive data types
					2. Basic operations on strings
						1. assigning
						2. joining
						3. comparing
					4. Java: Built in type of `String` class
8. Data structures
	1. Primitive and composite data types are sufficient for solving simple problems
	2. The early computer applications depended on the built-in data types of programming languages
		1. For storage and processing
		2. Scientific and numerical problems
	3. Primitive types are not always sufficient to solve advanced problems
		1. If data have complex structural relationships
	4. Need for advanced data types arose due to the new paradigm of object oriented approach
	5. Data structures are meant to serve these needs
	6. It is a programming construct that stores a collection of data items
	7. Data structure are not just an extension of composite data types
		1. Differences
			1. Data structure encompasses primitive and composite data types
				1. Data structures
					1. Primitive Types
					2. Composite Types
					3. Relationship
				2. It may be a user defined type to serve a particular app need
			2. Data structure includes some kind of relationship among the data items
				1. Organization of data items
		2. String: Has definite order of organized characters
			1. Whether they are array of characters or built in types
	8. Classified into two types: Linear and Non-Linear
		1. Linear: Arranges data elements into a sequence (one after the other)
			1. Array
			2. Linked List
				1. Data items called nodes
				2. Each item consists of information field and link field pointing to another data item
			3. Stack
				1. Last item added to the collection is the first item to be taken of
				2. Pile of trays
				3. LIFO
			4. Queue
				1. An item can be added at one end and an existing item can be removed from the other end
				2. FIFO
		2. Non-Linear Data structures - Graph data structures
			1. Relationship among elements is hierarchical
			2. Linkage may be single or bi-directional
			3. Examples:
				1. Trees
					1. Contains information field and link field which is an address of related element in hierarchical order
					2. Types
						1. Binary trees
						2. AVL trees
						3. Splay trees
						4. Red and black trees
						5. B-trees or heaps
				2. Graphs
					1. Graph is a set of data items called vertices or nodes connected by links termed as edges or arcs
	8. Operations on data structures:
		1. Data structures provide a logical relationship among elements in a collection of data items
		2. To process elements of data structure we need some operation
		3. Basic operation involves
			1. Creation of data structure
			2. Reserve storage space for elements
			3. Deleting data structure, which removes the data items and releases the allocated storage space
		4. Other common operations
			1. Inserting
				1. Adding a data item in a specified position in data structures
			2. Sorting
				1. Arranging of data items is specific order
			3. Searching
				1. Finding an item which matches with a given key
			4. Merging
				1. Combining two sets of data items (belonging to the same data structure) with accordance to some criterion
			5. Traversing
				1. Accessing each element of a data structure atleast once
					1. Trees and graphs
					2. Also called visiting
		5. Strength of a data structure is determined by the nature and the variety of operations that can be performed on the data elements
	9. User defined data structures
		1. Stacks, queues, trees are classical general purpose data structures
		2. Some programming languages like Java provide built-in support for some of these structures
		3. We can also invent a data structure to meet the specific need of an application
			1. Called user-defined
		4. Example: To store records of 100 employees
			1. Each record has employee name, designation and salary
			2. Using C:

					struct EMP {
						char name[40];
						char title[30];
						float salary;
					};
					struct EMP employee[100];

				1. Elements can be accessed using C's pointer notation

						employee[0]->name
						employee[0]->title
						employee[0]->salary

	10. Storage structure
		1. Data structure provides logical view of the relationship among data items
		2. It describes how data items are stored in the memory cells of a computer
		3. It provides a map of how data elements are allocated memory space
		4. Elements are stored in consecutive or in disjoint storage locations
		5. Each location is identified by unique number called memory address - Following is contiguous allocation of storage space to a set of characters
			1. 1000 -> A
			2. 1001 -> B
			3. 1002 -> C
			4. 1003 -> D
		6. To access any element, address of first element is needed
			1. This structure enables rapid access of all the elements
			2. The elements can be obtained by moving to the consecutive memory cell
		7. Non-contiguous storage locations
			1. Each character is followed by the address of next linked character
				1. 2000 -> A, 2001 -> 300, 2002 -> 0
				2. 3000 -> B, 3001 -> 400, 3002 -> 0
				3. 4000 -> C, 4001 -> 100, 4002 -> 3
				4. 1003 -> D, 1004 -> 499, 1005 -> 9
				5. 4999 -> E
	11. Abstract data types
		1. Used to describe the internal organization and functionality of data structures
		2. It combines description of data structure and associated operations
		3. It has following characteristics
			1. Provides description of elements in terms of data types
			2. Defines relationship that exists among individual elements
			3. Defines all valid operations that can be performed on the elements and parameters that can be passed
			4. Specifies error conditions in particular operations if any which may be associated with the operations
		4. Example: ADT Stack
			1. Can be defined by packaging together following operations
				1. Push - Inserts an item into the stack stk
				2. Pop - Returns a data item from stack stk
				3. Peek - Returns top most element with out removing it from the stack
				4. size() - Returns number of elements currently in the stack
				5. isEmpty() - Returns true if stack is empty, and false otherwise
		5. The set of operations associated with ADT is called interface
			1. The elements of ADT data structure are minipulated through an interface
				1. A client program should send request to the ADT via an interface
		6. Implementation of operations and data items are hidden from the application program
			1. A client program cannot modify the operations not can it add new operations
		7. All built-in primitive data types are abstract data types
			1. float - basic operations can be performed
				1. We cannot add new operations (exponentiation say)
				2. We cannot enhance or shrink the set of allowed values
		8. ADT does not specify how the data structure would be coded in a particular program
		9. ADT does not specify what storage structures to be used
			1. Consecutive or disjoint locations
		10. ADTs do not provide the implementation details
			1. Implementation details are hidden from application program
				1. May be implemented using lower level data structures like an array or a linked list
		11. In a software module, ADT can be viewed as layer between application that uses it and a component that implements ADT

				Application Layer
				ADT Layer
				Implementation Layer

		12. Interface of the ADT remains the same regardless of how the operations are performed
		13. Some high level languages provide support for ADT
			1. They have built in features to implement a variety of ADT
				1. C has built-in struct type
					1. We can define user defined functions to construct and ADT
				2. C++: class construct
					1. Operators can be implemented through public methods
				3. Java: ADT can be expressed as interface
					1. Abstraction
		14. Advantages of ADT over conventional data structures
			1. ADT is reusable, robust, based on principles of OOP and Software Engineering (SE)
			2. ADT can be re-used at several places in a program or different programs
			3. ADT reduces coding efforts
			4. In ADT, implementations are hidden from the user
			5. Encapsulation ensures that data cannot be corrupted by the program
			6. Working of various integrated operations provided by ADTs cannot be tanpered with by application program
			7. ADT ensures a robust data structure
		15. ADT is based on SE concepts of coupling and cohesion
			1. Coupling property determines
				1. How strongly two separate parts of program are mutually linked together
				2. Extent to which change made in one part impacts the other parts of a software module
				3. A well designed software has a minimum coupling of program segments
				4. ADT promotes week coupling
					1. Any change in one part does not propagate to any other components of ADT
			2. Cohesion determines how well-integrated are components of a software
				1. Well designed software should have maximum cohesion
				2. ADT inherently promotes maximum cohesion
					1. An ADT components are well integrated into a single compact structure (?)

## Unit 2: Algorithms ##
###  Overview ###
1. Formal definition of an algorithm
2. Description of different applications of algorithms in various disciplines
3. Details of different techniques for analysis of algorithms

### Objective ###
1. Understand meaning of an algorithm
2. Describe various applications of algorithms
3. Distinguishing between empirical and analytical methods of analyzing algorithms
4. Understand the use of Big-Oh notation for expressing the performance of an algorithm in terms of time and space utilization
5. Learn rules for specifying the behavior of algorithm for large data inputs

### Introduction ###
1. An algorithm is a step-by-step procedure for solving a problem
2. Algorithms are often used in many real life problems
	1. Cooking recipe
	2. In computer sciences:
		1. Algorithm has a special meaning
		2. It is defined to have the following features
			1. Algorithm must have some important data to operate on it
			2. It must produce at least one result
			3. It must terminate after finite number of steps
3. History of algorithms
	1. An efficient method for finding GCD was proposed by Euclid
	2. Systematic study of algorithms was done by Alkhawarizmi

### Algorithms ###
1. With the advent of computers, a variety of algorithms have been developed (for solving problems)
2. Examples:
	1. Searching algorithms
		1. Designed to search for a given item in large data collection
	2. Sorting algorithms
		1. Used to arrange data items in ascending or descending order (based on user specified criteria)
	3. Compression algorithms
		1. Used to reduce the size of data and program files (exchanged over the network)
		2. These are commonly used for compression of image, audio and vido data
	4. Fast fourier transform
		1. Usually used for digital signal processing
	5. Encoding algorithms
		1. Used for encryption of data (in secured transmission and exchange of data)
	6. Geometric algorithms
		1. Used for identification of geometric shapes
	7. Parsing Algorithms
		1. Designed to identify different programming constructs

### Classification of Algorithms ###
1. Depending on the strategy for solving a particular class of problems, algorithms are classified as follows:
	1. Iterative
		1. Certain steps are repeated in loops, until the goal is achieved
		2. Example: for sorting of an array (small sets of data)
	2. Divide and conquer
		1. A given problem is fragmented into smaller sub-problems which are solved partially
		2. Recursive solution: Algorithm is terminted when further sub-division cannot be performed
		3. These are frequently used for searching and sorting problems
	2. Greedy
		1. An immediately available best solution at each step must be chosen without worrying about its effect on subsequent steps
		2. Example: To give change for 73 rupees in minimum number of currency notes, the immediate best solution would be
			1. Rs 50 + 2 * Rs 10 + Rs 2 + Re 1
			2. Start with highest denomination
		3. Useful for solving scheduling and graph theory problems
	3. Backtracking
		1. All possible solutions are explored until the end is reached and then steps are traced back (until solution is found)
		2. Useful in graph theory
		3. Common algorithms:
			1. DFS
			2. BFS

### Specification of Algorithms ###
1. Algorithms play a crucial role in manipulating data structures used in any program
2. To describe the algorithm procedure, two approaches can be used
	1. Natural language
	2. Pseudo code
3. Use of natural language
	1. English words and phrases can be used to express statements and processing steps
	2. Example: read, write, compute, set (words for I/O operations, computation and messaging values)
		1. equal to, less than, greater than (for comparison operations)
		2. add, subtract, divide, multiply (for arithmentical operations)
		3. repeat for, while, if, halt, exit (for control structures)
	3. Example: Euclid's algorithm for finding GCD of two positive integers in plain language
	
			Read positive integers n, m
			Set x to n, y to m
			Repeat steps 4-5 while x does not equal y
			If x is greater than y then set x to x - y
			If y is greater than x then set y to y - x
			Write x y

4. Use of Pseudocode
	1. Algorithms in natural language tend to be wordy and verbose (may be ambiguous as well)
	2. Pseudocode provides an alternative way of expressing algorithms
		1. It is a mixture of natural language and high level programming notation
		2. Several conventions are used to write pseudo code
	3. Notations commonly used
		1. Algorithm is identified by a name and an identification number
		2. Comments (optional) and are enclosed in square brackets
		3. Variable names are written in capital letters
		4. Assignment statement is coded using left arrow <|-
		5. Operators are identified by algebraic symbols (+, -, *, /, <, >=, !=)
		6. Input and output statements are expressed using words `read` and `write` followed by variable names or output message
		7. Control structures are described using phrases `if-then`, `if-then-else`
		8. Repititive operations are described by phrases `Repeat`, `for`, `while`, `until`
	4. Euclid's algorithm can be expressed in pseudocode as under:

			Algorithm gcd [This algorithm returns the greatest common divisor (gcd) of two positive integers]
			1. Read : N, M [Read integers N, M]
			2. X <- N; Y <- M [Assign values to x and y]
			3. Repeat steps 4 to 5 while (X != Y)
			4. if X > Y then X <- X - Y
			5. if Y > X then Y <- Y - X
			6. Write : "Greatest common divisor :", X
			7. Exit

		1. It is both human readable as well as can be translated to a high level language
		2. C++ code for the gcd algorithm:

				// GCD Algorithm
				#include <iostream.h>
		
				main() {
					int m, n, x, y;

					cin >> n;
					cin >> m;
					x = n;
					y = m;

					while(x != y) {
						if (x > y)
							x = x - y;
						else
							y = y - x;
					}
				
					cout << "Greatest common divisor :" << x;
				}

### Algorithm Analysis ###
1. Performance is measured in terms of running time and storage requirements as a function of input size
2. Algorithm that takes enormously long time but gives correct output (not useful for real time applications - need output in split seconds for instance)
3. Algorithms whose storage size increases enormously with input size cannot be implemented on small computers
4. There may be a tradeoff between time and space requirement
5. Time and space analysis are of crucial importance for efficiency of a software module
6. Time analysis uses various techniques to estimate runtime of an algorithm for a set of input values
	1. Two approaches are main
		1. Empirical
			1. Running time is measured (in real time) for different sets of input values
			2. Actual time is plotted against the input size to analyze growth rate
			3. Limitations of empirical approach
				1. It depends on the computing environment, The results vary with platforms (hardware and OS)
				2. It depends on the nature of data set. The output may not cover all possibilities
				3. It also depends on how efficiently the program has been coded (for a particular machine)
		2. Analytical
			1. The analysis uses mathematical techniques to estimate the running time
			2. It identifies time consuming crucial operations in an algorithm that contribute significantly to the overall processing time
			3. The number of key operations can be determined by analyzing the pseudocode of the algorithm
			4. For example: Consider the pseudocode for finding the largest value in an array A of size N
			5. Example:

					1. MAX <- A[1] [One access to array element]
					2. Repeat steps 3 to 4 for J <- 2 to J <- n [makes n - 1 assignments to a variable]
					3. If A[J] > MAX then [makes n - 1 comparisons]
					4. MAX <- A[J] [In worst case n - 1 assignments are made]
					5. Write MAX

				1. Total runtime is:
					1. T = T(a) (assigning) + T(g) (accessing) + T(c) (comparing) + T(b) (Branching) + T(i) (incrementing) + T(w) (writing)
					2. T = (2T(a) + 2T(g) + T(i) + T(b))N - (T(a) + T(g) + T(i) + T(w))
					3. T = kN + c, k and c being constants
			6. Algorithm is not concerned with determining the running time of a particular value of input
				1. It covers the entire range of inputs

### Algorithm Growth Rates ###
1. We often need to know how running time varies with variation of input size
	1. Example how would a sorting time grow with increase in input items
2. Behavior of an algorithm for large input is called asymptotic analysis
3. Example: kN + c
	1. For large N, the constants are insignificant
	2. Thus running time of MAX algorithm asymptotically varies as N
	3. One algorithm may have better performance for small input sizes but as input size grows to a large value, the algorithm becomes slow
4. Big Oh Notation
	1. If running time varies in proportion to f(N), it is expressed as O(f(N))
	2. f(N) is called growth-rate function
	3. As capital O is used to express growth-rate, it is called Big-O notation
	4. If running time varies in proportion to N(2) we say the algorithm is O(N(2))

### Algorithm Growth Functions ###
1. Running Time, Function, Performance
2. O(Log N), Logarithm, Very good
3. O(N), Linear, Good
4. O(N log N), N-logarithm, Fair
5. O(N(2)), Quadratic, Acceptable
6. O(N(3)), Cubic, Poor
7. O(2(N)), Exponential, Bad

#### Logarithmic Algorithm ####
1. Running time varies as log N, where N is size of the problem
	1. log as base 2
2. It grows slowly, and has one of the best performances
3. If problem size increases by a factor of 1000, running time increases by 10

#### Linear Algorithm ####
1. Execution time grows in direct proportion to the size of a problem
2. Performance is rated as good
3. Algorithms based on single loop, show linear growth rate
4. Examples are: searching, deleting, and inserting operations in an array
	1. Vectors as well

#### N Log N Algorithm ####
1. N log N has high growth rate
2. Divide-and-conquer algorithms show this behavior

#### Quadratic Algorithm ####
1. Quadratic algorithm grows as square of input size
2. Problems with nested loops show quadratic behavior
3. Example: Multiplication of two N x N matrices has O(N(2)) running time
4. Quadratic algorithms have fast growth rate

#### Cubic Algorithm ####
1. Running time of a cubic algorithm varies as the cube of the problem size
2. Cubic algorithms grow very rapidly
3. Problems with three nested loops show cubic behavior
4. Traversal of a three dimensional array has running time (O(N(3))

#### Exponential Algorithm ####
1. It has running time of the order of 2^(N)
2. Grows at extremely high rate, it is not very useful (for many practical applications)
3. Comparison of growth rates of commonly used algorithm functions

		O(log N) < O(N) < O(N log N) < O(N^2) < O(N^3) < O(2^N)

### The Big-Oh Rules ###
1. Provides convenient method for expressing asymptotic behavior of an algorithm
2. When input size becomes large, we simplify Big-Oh representation using the following rules
	1. Any constants in an expression may be ignored
		1. O(N^2 + 100) = O(N^2)
			1. 100 loses significance when N becomes very large
	2. Any lower order terms may be dropped in favour of the highest order term in expression
		1. O(N^3 + 2N^2 + N) = O(N^3)
			1. Smaller order terms do not contribute as much as the highest order term when N becomes very large
	2. Multiplication constants may be ignored
		1. O(20N^3) = O(N^3)
			1. Simplified function has the same asymptotic behavior as the original function
			2. We are interested in the relative growth rate and not the absolute growth rate

### In Depth Running Time Analysis ###
1. We generally perform analysis to find maximum, average and minimum running times
	1. Best case analysis
		1. It is used to determine the minimum running time of an algorithm
		2. Execution time depends on the nature of input data
			1. One or more inputs may result in the shortest time
			2. Example: In searching problem, the most favorable input is the one which matches very first item in data collection
			3. Example: Sorting problems, best scenario is when items are already in sorted order
		3. It is of a little practical value
			1. We are more interested in knowing the maximum time required for the solution
	2. Average case analysis
		1. Done to find the average run time of an algorithm
		2. It lies somewhere between optimistic and pessimistic times
		3. Example: Searching problem - average running time would be when a data item matching with the search key lies in the middle of a data collection
		4. For most problems, we can consider input data over the entire range of input values
			1. Relies on probability theory
			2. In most cases it is difficult to determine average running time of an algorithm
			3. It is more complex
	3. Worst case analysis
		1. Determines running time for most unfavorable input
		2. It provides maximum running time for a given input
		3. Example: In searching, when item matching with search key occurs at the end of data collection
		4. This analysis yields the most pessimistic time estimate
		5. It guarantees that in all circumstances, run time would never exceed the estimated time
		6. In almost all applications, algorithm analysis is done on worst-case basis (for most unfavorable inputs)

### Space Analysis ###
1. Concerned with determining the maximum storage requirement needed to implement a particular algorithm
2. Estimates an estimate of number of bytes as function of input size
3. Variables and constants occupy fixed amount of storage, which do not depend on input size of the problem
	1. Space utilization of constants and variables is O(1)
4. Space utilization of complex data structures is estimated by counting the number of bytes for each data item
	1. Example: Array of integers of size N, requires 4N bytes
	2. Space complexity would be O(N)
5. In some applications, there is trade-off between running time and storage requirements
	1. An algorithm with small runtime may require large storage space
		1. Example: Large data file (stored in disk) can be sorted more efficiently in shorter time using large memory space
			1. Example: Data of two arrays can be merged more efficiently by using a third array

## Arrays ##
### Unit Overview ###
1. It is a fundamental data structure
2. Distinguishing characteristics of arrays
3. Basic operations commonly performed on array

### Objectives ###
1. Learn basic concepts about array data structure
2. Understand how arrays are stored in computer memory
3. Know about inserting, deleting and traversing operations that can be performed on an array
4. Learn about efficiency of basic operations
5. Explain the structure of multi-dimensional arrays and their usage
6. Understand the advantages and disadvantages

### Introduction ###
1. Array is a collection of homogeneous, ordered and finite set of elements
	1. Homogeneous: all elements must be of same type and have same structure
	2. Element types can be:
		1. Primitive: integers, characters, booleans
		2. Composite: strings, records (with several fields)
	3. Ordered means elements are organized in a sequence
		1. Each element is identified by its relative position in the collection
	4. Order property is not expressed explicitly
	5. Array is called linear data structure
	6. Finite means each array contains fixed number of elements
		1. The fixed number is called size or length of array
	7. Some typical representations of arrays (left to right)

			0 1 2 3 4 5 6 7 8 9 10 11
			v i r u s   F o u n d  !

			0  1  2 3  4  5  6 7  8  9  10 11
			78 59 4 66 34 76 6 36 45 64 2  98

			0   1   2   3   4   5   6   7   8   9   10  11
			2.0 2.4 1.8 1.5 1.2 4.8 7.3 1.0 2.2 3.1 2.2 0.5

			0		1		2		3		4		5		6		7
			ASLAM 	ZAHID	FOUZ	SYMA 	TOUSIF	ZOHRA	AHMED	MUNIR

		1. Records: Can be a collection of different fields
		2. Each element must be of same length in an array

### Accessing Arrays ###
1. Each array is identified by a unique name
2. The position of an element is identified by a variable called index
3. Range of values for index is referred to as index set
	1. Array of ten elements: first element is at index 1, range set will be 1-10
	2. If first element has index 0, as in C++, index set is of range 0-9
	3. Smallest value of index is called lower bound and largest value is called upper bound
	4. Size:

			UB - LB + 1
			UB and LB being upper and lower bounds respectively

4. Individual elements in an array are identified by array name and array index
5. In mathematical description, subscript notation is used
	1. x1, x2, x3, ..., xn
6. Programming languages uses bracket notation to represent elements of array
	1. Array elements are coded using array name followed by pair of parantheses or square brackets that enclose index value
	2. Fortran and visual basic use parantheses notation

			x(1), x(2), x(3), ..., x(n)

	3. C/C++ and Java

			x[0], x[1], x[2], ..., x[n - 1]

7. Indices are sometimes called subscripts and indexed variables are called subscripted variables

### Declaring an Array ###
1. Before an array is used in a program, it must be declared
	1. This is required by the compiler to reserve necessary space for the array on the basis of declaration
2. Rules for array declaration varies with the type of language
	1. But in general, declaration specifies
		1. array name
		2. data type
		3. optionally size
	2. Example: C/C++

			int x[100]; // array of 100 integers maximum

	3. Index set will have range 0 through 99 as follows:

			x[0], x[1], ..., x[99]

### Array Storage Structure ###
1. Storage structure represents arrangement of data elements in memory
2. Array is always stored in contiguous memory locations
3. Number of storage cells allocated depends on data type
4. Typically
	1. character: 1 byte
	2. short integer: 2 bytes
	3. long integer: 4 bytes
5. Example: Storage structure for array MARK

		1000	1002	1004	1006	1008	1010	1012	1014
		MARK[0]	MARK[1]	MARK[2]	MARK[3]	MARK[4]	MARK[5]	MARK[6]	MARK[7]

	1. First element stored at 1000
	2. Storage addresses
		1. base address: 1000 (address of first element)
	2. To compute address of jth element, the following formula is used

			Address(X[J]) = BASE ADDRESS + SIZE * J
			
		1. SIZE: number of bytes allocated to an element
		2. BASE ADDRESS: address of first element
6. Using the formula, we can access any element of the array
	1. Hence elements of an array have direct access (can be accessed rapidly thus)
	2. Only base address is enough to process elements of an array
7. Drawback: Memory allocated to an array is not released until program execution is finished.

### Array Operations ###
1. Basic operations on an array include
	1. Retrieving 
	2. Adding
	3. Deleting
	4. Inserting
2. Auxilliary operations: To determine current status of an array or obtain some information about a particular element
	1. Checking if array is full
	2. Checking if array is empty
	3. Getting index of a given element
	4. Traversing to process array elements
3. Retrieving:
	1. It is also called accessing

			Index set	0	1	2	3	4	5	6	7
			Contents	C	O	M	P	U	T	E	R
			Elements	X[0]x[1]x[2]x[3]x[4]x[5]x[6]x[7]

	2. We can retrieve using index value
	3. `MARK[J]` accesses J th element of array `MARK`
	4. Computer can directly retrieve an element (without accessing other elements of the array), accessing is very fast
	5. Since access operation is independent of the size of an array, time efficiency is O(1)
6. Adding
	1. Adding operation inserts a new element in a position specified by the index
	2. Adding operation is sometimes called assignment
	3. To move an integer n in Jth element, we write `MARK[J] = n`
	4. If array contains some data, existing element is overwritten
	5. Adding operation has time efficiency O(1)
7. Deleting
	1. Deleting operation removes an existing element with given index
	2. To delete say X[J], all elements following X[J] are moved one position to the left
		1. Element to be deleted is overwritten by element to its right
		2. X[J+1], X[J+2],... X[N-1] are shifted to the left
			1. Shifting does not reduce the size of the array
8. Inserting
	1. It adds a new element in a specified position, without replacing any of the existing elements
	2. The position is specified by index value or position relative to an existing element
		1. Element might be for instance placed before a given element
	3. The elements to the right are moved one position to the right to leave room for the new element
		1. Example if we want to insert an element before X[J], then all elements from X[J] ... X[N - 1] are moved one position to the right
		2. No new memory is allocated but only elements are re-arranged using the memory initially allocated

### Implementation of Array Operations ###
1. We can define a C++ class named Array
2. It includes methods to add, delete, and other auxiliary operations
3. Structure of class interface

		const int size = 30;		// Array can hold upto 30 elements
		class Array {
			private:
			double x [size];

			public:
			void add(double y);				// Constructor
			void del();						// add method
			void insert(double p, double y);// delete method
			int getindex(double p);			// get method
			bool isFull();					// is array full
			bool isEmpty();					// is array empty
			disp();							// print method
			~Array();						// destructor	
		}

## Array Traversing ##
1. Traversing involves accessing and processing array elements exactly once
2. It is also called visiting
3. To traverse, we set up loop with index varying from lower to upper bound
	1. In every loop cycle, elements are accessed and processed according to the requirement
	2. Examples:
		1. Finding the largest element
		2. Finding the smallest element
		3. Computing the average of all elements
		4. Printing contents of array

## Implementation of Array Traversing ##
1. C++

		class Array
		{
			Array();				// constructor
			void add(double y);		// adds an element
			double maximum();		// finds largest element
			double minimum();		// finds smallest element
			double average();		// computes average of elements
			void disp();			// prints array elements
			~Array();				// destructor
		};

2. Detailed coding is in the demonstration

## Performance of Array Operations ##
1. To remove an element, all elements to the right of the element are all shifted one position to the left
	1. If first element is deleted, there will be altogether N-1 shifts (for array of size N) 
	2. In worst case, the running time of deletion is O(N-1) or O(N)
	3. If last element is deleted, no shifting is involved
		1. Best case has running time O(1)
2. Insertion: elements are shifted in the opposite direction
	1. In worst case, running time is O(N)
3. In traversal operation, altogether N accesses are made
	1. Time efficiency of traversal is O(N)
	2. There are no best or average cases
		1. In traversal all elements are examined (visited atleast once)
4. Two dimensional arrays
	1. Groups elements into smaller sub-groups of equal size
	2. Each subgroup is in itself a small array (1D array), within the array
	3. The partitioned array is referred to as two dimensional array
	4. Example: Test scores of a group of students

			M[semesterNumber, studentNumber] = testScore

		1. It can be pictured as consisting of rows and columns 
		2. 2-D array is a collection of homogenous elements arranged into rows and columns
		3. In C/C++ MARKS[J][K] refers to element in Jth row and Kth column
			1. MARK[0][0] refers t oelement in first row and first column
	5. A 2-D array must also be declared before it is processed
		1. Declaration must have maximum number of rows and columns besides the array name and type
		2. C++

				int M[5][6];

## Storage Structure for 2-D Arrays ##
1. Elements in 2-D array are stored in contiguous memory locations
2. They may be stored row-by-row or column-by-column
	1. If elements are stored row-by-row, storage structure is called row-major
		1. Example:

				10 20
				30 40
				50 60
				70 80
				90 100

				0  1  2  3  4  5  6  7  8  9
				10 20 30 40 50 60 70 80 90 100

			1. If we know the address of the first element, we can compute the address of the rest of the elements

					Address(A[J][K]) = Base Address + SIZE * J * N + K

				Where SIZE is length of array element
					N is number of columns
		
	2. If elements are stored column-by-column, storage structure is called column major
		1. Example:

				0,0 1,0 2,0 3,0 4,0 0,1 1,1 2,1 3,1 4,1
				10  30  50  70  90  20  40  60  80  100

			1. Address

					Address(A[J][K]) = Base address + SIZE * K * M + J

				1. SIZE is length of array element
				2. M is number of rows

	3. The formulas are used by the compiler to find elements of a two dimensional array
		1. Thus compiler/runtime has direct access
		2. This is the primary reason for time efficiency for arrays as compared to other data structures

## String Arrays ##
1. 2D arrays are useful in storing and processing strings
2. String: Sequence of characters
	1. Usually stored in 1D array
		1. In C/C++, null character is used as terminating character

				M[0]	M[1]	M[2]	M[3]	M[4]	M[5]	M[6]	M[7]	M[8]
				C		O		M		P		U		T		E		R		\0

			1. String of size N is stored in an array of size N + 1
			2. We need to stored text or word (Employee name)
3. 2-D arrays provide a convenient and simple mechanism to store a set of strings

		M[0,0]	M[0,1]	M[0,2]	M[0,3]	M[0,4]	M[0,5]	M[0,6]
		F		O		U		Z		\0		\0		\0

		M[1,0]	M[1,1]	M[1,2]	M[1,3]	M[1,4]	M[1,5]	M[1,6]
		S		Y		M		A		\0		\0		\0

		M[2,0]	M[2,1]	M[2,2]	M[2,3]	M[2,4]	M[2,5]	M[2,6]
		Z		A		H		I		D		A		\0


	1. In 2D arrays, all rows must have same number of characters, storage space may be wasted if some strings have shorter lengths

## Operations on Strings ##
1. Some common useful operations: Inserting, Deleting, Searching, Sorting, Listing
			

