# Algorithms #
## Introduction to Algorithms ##
1. Programming challenges
2. Job interviews
3. What is an algorithm?
	1. Step by step procedure for solving a computation problem
4. Differences between algorithm and program:
	1. Algorithm:
		1. Written at design time
			1. What is the procedure going to do?
			2. What is the software going to do?
		2. Domain knowledge is required
			1. Hospital staff
			2. Accounting staff
		3. Any language can be used
			1. English like
			2. Mathematical notations
				1. Preferred
			3. C language is generally used for maximum reach
		4. It is Hardware of Software independent
		5. We analyze an algorithm
	2. Program:
		1. Written at implementation time
		2. Programmer writes this
		3. Written only in a programming language
			1. Java
			2. C
			3. C++
			4. Python
		4. It is Hardware and Software dependent (OS)
			1. Linux
			2. Windows
			3. MaxOS
		5. Testing is done

## Priori Analysis and Posteriori Testing ##
1. Priori Analysis
	1. Done on algorithm
	2. Language independent
	3. Hardware independent
	4. Time & Space function
2. Posteriori Testing
	1. Done on program
		1. Memory consumption
		2. Time taken
	2. Language dependent
	3. Hardware dependent 
	4. Watch time & Bytes

## Characteristics of Algorithm ##
1. Characteristics of Algorithm
	1. Input - it takes input (0 or more inputs)
	2. Output - must generate at-least one output (at least does something)
	3. Definiteness - every statement should be unambiguous and should have single and exact meaning
		1. It should be solvable
			1. sqrt(-1) - cannot be used say it is unknown
	4. Finiteness - it must stop (not a service that runs continuously)
	5. Effectiveness - Do not write unnecessary statements in an algorithm
		1. It should do something

## How to Write and Analyze Algorithm ##
1. C language like syntax

		Algorithm swap(a, b)
		{
			temp = a;
			a = b;
			b = temp;
		}

	1. No data types
	2. Declarations are not required
2. Other symbols:

		temp := a

		Begin
			...
		End

		temp <- a

3. How to analyze an algorithm
	1. Criteria
		1. Time (algorithm must be time efficient)
			1. We get a time function
		2. Space: How much memory space is consumed
		3. Network consumption - how much data is transferred
			1. Compression?
		4. Power consumption
		5. CPU registers consumed? for handheld or embedded software
	2. Example:
		1. Time analysis - every simple statement in an algorithm it takes one unit of time
			1. swap
				1. 3 units -> f(n) = 3 -> O(1)
			2. Machine code:
				1. x = 5 * a + 6 * b
					1. 4 statements may be required (not required for most cases)
		2. Space analysis
			1. a, b, temp = 3 variables
				1. S(n) = 3 words (may be any number of bytes) -> O(1)

## Frequency Count Method ##
1. Example:

		Algorithm Sum(A, n)
		{
			S = 0;
			for (i = 0; i < n; i++)
			{
				S = S + A[i];
			}
			return S;
		}

	1. Time analysis - Frequency count method (assign one unit per statement and calculate frequency)
		1. 1 + (1 + (n + 1) + n)*1 + 1 = 2n + 4 = O(n)
	2. Space complexity
		1. A, n, S, i = n + 1 + 1 + 1 = n + 3 = O(n)
2. Example:

		Algorithm Add(A, B, n) // n x n matrices
		{
			for (i = 0; i < n; i++) // n + 1
			{
				for (j = 0; j < n; j++) // n
				{
					C[i,j] = A[i,j] + B[i,j]; // 1
				}
			}
		}

	1. T(n) = 2n^2 + 2n + 1 = O(n^2) (degree of the function)
	2. S(n) = 3n^2 + 3 = O(n^2)

3. Example:

		Algorithm Multiply(A, B, n)
		{
			for (i = 0; i < n; i++) // n + 1
			{
				for (j = 0; j < n; j++) // n (n + 1)
				{
					C[i,j] = 0; // n * n * (n + 1)
					for (k = 0; k < n; k++) // n * n * (n + 1)
					{
						C[i,j] = c[i,j] + A[i,k]*B[k,j]; // n * n * n
					}
				}
			}
		}

	1. T(n) = 2n^3 + 3n^2 + 2n + 1 = O(n^3) (degree of the polynomial)
	2. S(n) = n^2 + n^2 + n^2 + 1 + 1 + 1 + 1 = 3n^2 + 4 = O(n^2)

## Time Complexity #1 ##
1. Example:

		for (i = 0; i < n; i++) -> n + 1 (can be skipped because we want order or degree)
		{
			stmt; -> n times (how many times the statement is executing)
		}

	1. O(n)
2. Example:

		for (i = 0; i < n; i = i + 2)
		{
			stmt; -> n/2 times
		}

	2. O(n)
3. Example:

		for (i = 0; i < n; i++)
		{
			for (j = 0; j < i; j++)
			{
				stmt;
			}
		}

	1. i = 0, j = 0
	2. i = 1, j = 0
	3. i = 2, j = 1
	4. i = 3, j = 2
	5. i = n, j = n - 1
	6. T(n) = 0 + 1 + 2 + (n) = n(n + 1)/2 = O(n^2)
4. Example:

		for (i = 1; p <= n; i++)
		{
			p = p + i
		}

	1. p = 1, p = 1 + 2, p = 1 + 2 + 3, ... p = 1 + 2 + 3 + ... + k (where p <= n)
		
			1 + 2 + 3 + ... + k > n
			k(k + 1)/2 > n
			k^2 + k > 2n
			k ~ sqrt(n)

		1. O(sqrt(n))

## Time Complexity Example #2 ##
1. Example:

		for (i = 1; i < n; i*2)
		{
			stmt;
		}

	1. i = 1, i = 1*2, i = 1*2*2, ... i = 2^k
		1. 2^k = n
		2. k = log(n)
		3. O(log(n))
	2. n = 8, i = 1, 2, 4, 8 (3 times)
	3. n = 10, i = 1, 2, 4, 8, 16 (4 times)
		1. ceil value is taken
2. Example:

		for (i = 0; i*i < n; i++)
		{
			stmt;
		}

	1. i = 0, 1 * 1, 2 * 2, 3 * 3, ... k * k
		1. k * k = n => k = sqrt(n)
			1. O(sqrt(n))
3. Example:

		p = 0
		for (i = 1; i < n; i = i * 2)
		{
			p++;
		}
		for (j = 1; j < p; j = j * 2)
		{
			stmt;
		}

	1. i = 1, 2, 2^2, 2^3, ... 2^k
		1. 2^k = n => k = log(n) = p
	2. j = 1, 2, 2^2, 2^3, ... , 2^r
		1. 2^r = p => r = log(p) = log(log(n))
4. Example:

		for (i = 0; i < n; i++)
		{
			for (j = 1; j < n; j = j * 2)
			{
				stmt;
			}
		}

	1. i = 0, 1, ..., n
	2. j = 1, 2^1, 2^2, ..., 2^(log(n))
		1. nlog(n)

## Time Complexity of While and if #3 ##
1. 

## Classes of functions ##
## Compare Class of Functions ##
## Asymptotic Notations Big Oh - Omega -Theta #1 ##
## Asymptotic Notations Big Oh - Omega -Theta #2 ##
## Properties of Asymptotic Notations ##
## Comparison of Functions #1 ##
## Comparison of Functions #2 ##
## Best Worst and Average Case Analysis ##
## Disjoint Sets Data Structure - Weighted Union and Collapsing Find ##
## Divide and Conquer ##
## Recurrence Relation (T(n) = T(n - 1) + 1) #1 ##
## Recurrence Relation (T(n) = T(n - 1) + n) #2 ##
## Recurrence Relation (T(n) = T(n - 1) + log n) #3 ##
## Recurrence Relation (T(n) = 2 T(n - 1) + 1) #4 ##
## Masters Theorem Decreasing Function ##
## Recurrence Relation Dividing Function T(n) = T(n/2) + 1 #1 ##
## Recurrence Relation Dividing Function T(n) = T(n/2) + n #2 ##
## Recurrence Relation Dividing Function T(n) = 2T(n/2) + n #3 ##
## Masters Theorem in Algorithms for Dividing Function #1 ##
## Examples for Master Theorem #2 ##
## Root Function (Recurrence Relation) ##
## Binary Search Iterative Method ##
## Binary Search Recursive Method ##
## Heap - Heap Sort - Heapify - Priority Queues ##
## Two Way MergeSort - Iterative Method ##
## Merge Sort Algorithm ##
## Merge Sort in-depth Analysis ##
## QuickSort Algorithm ##
## QuickSort Analysis ##
## Strassens Matrix Multiplication ##
## Greedy Method - Introduction ##
## Knapsack Problem - Greedy Method ##
## Job Sequencing with Deadlines - Greedy Method ##
## Optimal Merge Pattern - Greedy Method ##
## Huffman Coding - Greedy Method ##
## Prims and Kruskals Algorithm - Greedy Method ##
## Dijkstra Algorithm - Single Source Shortest Path - Greedy Method ##
## Principle of Optimality - Dynamic Programming Introduction ##
## MultiStage Graph - Dynamic Programming ##
## MultiStage Graph (Program) - Dynamic Programming ##
## All Pairs Shortest Path (Floyd-Warshall) - Dynamic Programming ##
## Matrix Chain Multiplication - Dynamic Programming ##
## [New] Matrix Chain Multiplication using Dynamic Programming Formula ##
## Matrix Chain Multiplication (Program) - Dynamic Programming ##
## Bellman Ford Algorithm - Single Source Shortest Path - Dynamic Programming ##
## 0/1 Knapsack - Two Methods - Dynamic Programming ##
## 0/1 Knapsack Problem - (Program) - Dynamic Programming ##
## Optimal Binary Search Tree - Dynamic Programming ##
## Optimal Binary Search Tree Successful and Unsuccessful Probablity - Dynamic Programming ##
## Traveling Salesman Problem - Dynamic Programming using Formula ##
## Reliability Design - Dynamic Programming ##
## Longest Common Subsequence (LCS) - Recursion and Dynamic Programming ##
## Graph Traversals - BFS & DFS - Breadth First Search and Depth First Search ##
## Articulation Point and Biconnected Components ##
## Introduction to Backtracking - Brute Force Approach ##
## N Queens Problem using Backtracking ##
## Sum of Subsets Problem - Backtracking ##
## Graph Coloring Problem - Backtracking ##
## Hamiltonian Cycle - Backtracking ##
## Branch and Bound Introduction ##
## Job Sequencing with Deadline - Branch and Bound ##
## 0/1 Knapsack using Branch and Bound ##
## Traveling Salesman Problem - Branch and Bound ##
## NP-Hard and NP-Complete Problems ##
## NP-Hard Graph Problem - Clique Decision Problem ##
## Knuth-Morris-Pratt KMP String Matching Algorithm ##
## Rabin-Karp String Matching Algorithm ##
## AVL Tree - Insertion and Rotations ##
## B Trees and B+ Trees. How they are useful in Databases ##
## Asymptotic Notations - Simplified ##
## Hashing Technique - Simplified ##
## Shortest Path Algorithms (Dijkstra and Bellman-Ford) - Simplified ##
## BFS DFS - Simplified ##
## Tower of Hanoi Problem - Made Easy ##
## Row-Major and Column-Major Mapping ##
## Merge Sort Algorithm - Hindi ##