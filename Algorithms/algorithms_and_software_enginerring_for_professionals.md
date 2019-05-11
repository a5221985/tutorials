# Algorithms and Software Engineering for Professionals #
## Introduction ##
### Introduction ###
1. Course - covers categories of algorithms, examines underlying concepts
	1. Cryptography
	2. Compiler Theory
	3. Signal Processing
	4. Data Analysis
	5. Graph Databases
2. Uses
	1. Job interviews
	2. Tests
3. Quickly grasp the question
	1. Turn it into relevant answer to show our understanding
		1. What concept is question testing?
4. The questions test understanding of critical concepts
	1. Relationship between Primes and Public/Private key Cryptography
		1. Code development is challenging though concept is simple
		2. Need strong understanding of key concepts say in Mathematics
2. Topics
	1. Iterations and Transformations on Sequence's
	2. Time complexity
	3. Counting and optimization
	4. Sorting
	5. Stacks and Queues
	6. Divisibility Operations and primes
	7. Tree based algorithms
	8. Graph algorithms
		1. Good for searching in graph databases
	9. Algorithm design
3. Refer to Course breakdown sheet

## Iterations and Transformations on Sequence's ##
### Iterations ###
1. Top level learning goals
	1. Understand iterations types (counting loops, iterators) for Java programming language
	2. Understand the issues to overcome when implementing algorithms with these types
2. Section 1
	1. Iterations
		1. Learning Objectives
			1. Loops and Nested Loops
			2. Counting in Nested Loops
			3. Java 8 Streams for Loops and Nested Loops
			4. Issues with variables in Java 8 Streams Lambda expressions
	2. Section 1 Guided Learning Tasks
		1. Factorial Example
		2. Nested Loop Count condition Example
		3. Count condition Loops with Java 8 Streams
	3. Lab 1 review questions
	4. Lab 1 practical count condition loops with Java 8 streams
	5. Lab 1 solution
3. Section 2
	1. Iterations with Java Collections
4. Example:

		int n = 10, result = 1;
		for (int j = 1; j <= n; j++)
			result = result * j;

		System.out.println("result = " + result);

	1. The process is iterative
		1. Counting loop (very efficient and fast)
	2. Recursive problems can be solved in this way
		1. Java doesn't handle recursion well
			1. Every recursion can be converted into iterative solution
5. Nested counting loop

		int n = 0;
		for (int j = 1; j <= n; j++) {
			for (int k = 1; k <= j; k++) {
				System.out.print("*");
			}
			System.out.println();
		}

6. Example:

		int j = 10;
		for ( ; j >= 0; j--) { // prints each row
			int finalJ = j; // effectively final
			IntStream.range(0, 10 - j).forEach(s -> {
				System.out.println(" ");
			});

			IntStream.range(0, 2 * j - 1).forEach(s -> {
				System.out.println("*");
				if (s == 2 * finalJ - 2) {
					System.out.println();
				}
			});
		}

7. Iterations Lab One
	1. Next

### Iterations Lab 1 Count Condition Loops with Java 8 Streams ###
1. Section 2:
	1. Iterations with Java Collections (high level wrappers)
		1. Learning Objectives
			1. Transformations on sequences for the Java Programming Language
			2. Iteration Loops for Lists, Maps and Sets
			3. Collection Iterator How to use it
			4. When to use the Iterator
	2. Section 2 Guided Learning Tasks
		1. Transformations on sequences
		2. Enhanced for loop with Lists
		3. Iterator

### Iterations with Java Collections ###


### Iterations Lab 2 LinkedList Unsafe iteration on Queues ###
### Iterations with Java Maps and Streams ###
### Iterations lab 3 Matching Pattern Sequences with Iterations Part A ###
### Iterations Lab 3 Matching Pattern Sequences with Iterations Part B ###

## Time Complexity ##
### Time Complexity ###
### Big O Specific Calculation ###
### Time Complexity Lab 1 Practical Obtain Sequence Introduction ###
### Time Complexity Lab 1 Practical Task Obtain Sequence Solutions ###
### Array Operations 1 Equilibrium Index ###
### Array Operations 2 Optimal Index ###
### Sorting Arrays ###
### Time Complexity Lab 2 Array Task with Expected Worst Case Time Complexity O(n) ###
### Space Complexity ###
### Sorting Algorithms Time and Space Complexity ###
### Common Sorting Algorithms Best and Worst Case ###
### Time Complexity Lab 3 Sorting Algorithm Efficiency ###

## Counting and Optimization ##
### Counting Concepts ###
### Sliding Window Maxima and Minima ###
### Counting and Optimization Lab 1 Application of a Sliding Window ###
### Counting and Optimization Lab 1 Application of a Sliding Window Part B ###
### Counting Patterns ###
### Count Combinations ###
### Count Permutations ###
### "Counting and Optimization Lab 2 Application of Counting to Permutations" ###
### Counting Theorem for Algorithms ###
### Counting Sort ###
### Pigeonhole Sort ###
### Counting and Optimization Lab 3 Application of the Counting Theorem ###

## Sorting ##
### Sorting Concepts ###
### Implement Insertion Sort with Comparator ###
### Sorting Lab 1 Introduction ###
### Sorting Lab 1 Compute the Number of Distinct Values in Array of N Integers ###
### Breaking the Quadratic Time Barrier ###
### Implement Heap Sort ###
### Recursive Sorting Algorithms ###
### Implement Merge Sort ###
### Sorting Lab 2 Practical Optimize Subsequences ###
### Implement Radix Sort Part A ###
### Implement Radix Sort Part B ###
### Sorting Lab 3 Practical Radix Sort on String Arrays ###

## Stacks and Queues ##
### Stack Concepts ###
### Implement a Basic Stack with a Linked List ###
### Perform Simple Stack Algorithm with Reverse Polish Notation ###
### Stacks and Queues Lab 1 Application of a Stack ###
### Queue Concepts ###
### Implement a Basic Queue with a Linked List ###
### Practical Application of a Queue ###
### Stacks and Queues Lab 2 Practical Application of a Queue ###
### Parsing Concepts ###
### Implement a Simple AST Parser ###
### Stacks and Queues Lab 3 Test for Well Formed Expessions ###

## Divisibility Operations and Primes ##
### Slice Operations ###
### Implement Kadane's Algorithm ###
### Implement a Double-Slice Operation ###
### Slice Operations Lab 1 Application of a Slice Operation Part A ###
### Slice Operations Lab 1 Application of a Slice Operation Part B ###
### Divisibility Operations ###
### Implement Euclidean Algorithm (Common Factors) ###
### Implement a Test for a Prime Number ###
### Slice Operations Lab 2 Simple Peak Detection ###
### Slice Operations Lab 2 Simple Peak Detection Part B ###
### Divisibility Operations and Primes ###
### Slieving (finding prime numbers) ###
### Slice Operations Lab 3 Probabilistic Tests for Large Primes Part A ###
### Slice Operations Lab 3 Probabilistic Tests for Large Primes Part B ###

## Tree Based Algorithms ##
### Search Algorithms ###
### Implement a Binary Search ###
### Implement a Hash Table ###
### Tree Based Algorithms Lab 1 Binary Search Algorithm Optimization ###
### Binary Trees ###
### Implement a Binary Search Tree ###
### Binary Tree Recursion ###
### Tree Based Algorithm Lab 2 Extend the Binary Tree API ###
### Avl Trees ###
### Implement an Avl Tree ###
### Sub Trees and Paths ###
### Tree Based Algorithm Lab 3 Tree Traversal (Paths) ###

## Graph Algorithms ##
### Graphs Concepts ###
### Implement a Graph as a Abstract Data Type (ADT) ###
### Implement a Depth-First Search ###
### Graph Algorithms Lab 1 Path Search with DFS ###
### Graphs Search ###
### Implement a Directed Graph as an Abstract Data Type (ADT) ###
### Implement Breadth-First Search ###
### Graph Algorithms Lab 2 Breadth First Search ###
### Topological Sort ###
### Implement a Topological Sort ###
### Graph Algorithms Lab 3 Shortest Path Optimization ###
### Topological Sort ###
### Implement a Topological Sort ###
### Graph Algorithms Lab 3 Shortest Path Optimization ###

## Algorithm Design ##
### Greedy Programming Concepts ###
### Implement a Greedy Solution ###
### Algorithm Design Lab 1 Overlapping Segment Application ###
### Dynamic Programming Concepts ###
### Implement a Dynamic Solution ###
### Algorithm Design Lab 2 Optimize Stock Trades Part A ###
### Algorithm Design Lab 2 Optimize Stock Trades Part B ###
### Divide and Conquer Concepts ###
### Implement a Divide-and-Conquer Solution ###
### Algorithm Design Lab 3 Count the Unique Inversions ###

## Summary ##
### Bonus Lecture: More Interesting Stuff, Offers and Discounts ###