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