# Introduction to Algorithms #
## Algorithmic Thinking, Peak Finding ##
1. Efficient procedures for solving problems for large systems
	1. Human genome
	2. Social network - 500 Million nodes
	3. ...
2. As inputs gets larger, efficiency becomes a concern
	1. Efficient procedures for solving large scale problems
	2. Scalability - how algorithms do as inputs get larger
3. Classic data structures
	1. BSTS
	2. Hash Tables
	3. Balanced BSTs
	4. ...
4. The algorithms stood the test of time
5. Classical algorithms
	1. Sorting
	2. Matching
	3. ...
6. Real implementations in Python
	1. Figuring out if they work with large inputs or not
7. Content
	1. 8 Modules:
		1. Algorithmic Thinking
			1. Peak finding
			2. Problem Set
			3. Writing proof
		2. Sorting & Trees
			1. Binary Trees
				1. Scheduling
				2. Sorting
			2. Simulating logic network using DS
		3. Hashing
			1. Genome Comparison
				1. Human vs Rat (99%)
		4. Numerics: RSA Encryption
			1. 1000s of bits (RSA used in SSL)
				1. Prime numbers
			2. Python implementation
		5. Graphs
			1. Rubik's cube
				1. Shortest number of moves
		6. Shortest Paths: Caltech to MIT
		7. Dynamic Programming: Image Compression
		8. Advanced Topics:
			1. Complexity theory
			2. Research in Algorithms
8. Website:
	1. http://courses.csail.mit.edu/6.006
		1. Administrivia
		2. Course Overview
		3. Peak finding problem
9. Peak Finder
	1. One-dimensional version
		1. position 2 is a peak if and only if b>= a and b >= c
		2. position 9 is a peak if and only if i >= h
	2. Problem: Find a peak if it exists
	3. Straight forward algorithm
		1. Start from left
	4. Argue that any array satisfies the criterion
	5. Look at n/2 elements
		1. Worst-case complexity: Theta(n) - gives lower bound and upper bound
			1. constant times n
		2. Recursively break up using Divide and Conquer
		
				[||||||]
				
			1. If a[n/2] < a[n/2 - 1] then only look at left half 1... n/2 - 1 to look for a peak (right hand side is also fine)
			2. Else if a[n/2] < a[n/2 + 1] then look at n/2 + 1 to n for a peak
			3. Else n/2 position is a peak
		3. Write a proof
	6. Complexity: Recurrence relation for recursion algorithm
	
			T(n) = T(n/2) + Theta(1)
			
			Where T(n) is work done on input of size n
			
			T(n) = Theta(1) + ... + Theta(1) = Theta(log_2 n)
			
	7. Two-D matrix: a is a 2D-peak iff a>= b, a>= c, a >= d, a >= e
		1. Greedy ascent algorithm
		
				14 13 12
				15 9  11 17
				16 17 19 20
				
			1. 12 -> 13 -> 15 -> 16 -> 17 -> 19 -> 20
			2. Worst case - touching all elements: Theta(nm), Theta(n^2) if n == m
		
		2. Better algorithm
			1. Pick middle column j = m/2
			2. Find a 1D-peak at (i, j)
			3. Use (i, j) as a start to find a 1-D peak on row i
			4. It is incorrect though efficient
				1. 2D peak may not exist on row i
				
						  10
					14 13 12
					15  9 11 17
					16 17 19 20
					
				1. If 12 is discovered as a peak and if 14 is found, 14 is not a peak
			5. Attempt #2
				1. Pick middle column j = m/2
				2. Find global max on column j at (i, j)
				3. Compare (i, j - 1), (i, j), (i, j + 1)
				4. Pick left cols if (i, j - 1) > (i, j). Similarly for the right
				5. If (i, j) >= (i, j - 1), (i, j + 1) => (i, j) is a 2-D peak
				6. Solve the new problem with half the number of cols
				7. When you have a single column, find the global maximum and we are done
				8. Time complexity
						
					T(n, m) = T(n, m/2) + Theta(n)
					T(n, 1) = Theta(n)
					
							= Theta(n) + ... + Theta(n) = Theta(n log_2 m)

## Models of Computation, Document Distance ##
1. What is an algorithm?
2. What is an algorithm allowed to do?
3. What is time? Running time and how to measure it?
4. Random access machine
5. Pointer machine
6. Python model
7. Document distance
	1. Problem & algorithms
8. What's an algorithm?
	1. computational procedure for solving a problem
	
			input -> algorithm -> output
			
		1. Algorithm is a mathematical analog of a computer program
			1. To reason about computer programs, we transform it into an algorithm
			2. To write a computer program, we first develop an algorithm and then code it
	
					program <-----> algorithm
					1. written in	pesudocode/structured English
					programming
					language)
					2. Runs on a	model of computation
					computer
					
				1. Structured English - formal language
					1. To reason about formally
	2. Model of Computation:
		1. It specifies
			1. What operations an algorithm is allowed
			2. Cost (time, ...) of each operation
				1. Add all of them to get total running time or memory
		2. Models:
			1. Random Access Machine (RAM)
				1. Random Access Memory (also RAM) - real machine
				2. Modeled by big array (to access any element it takes constant time)
				
						0		[]
						1		[]
						2		[]
						.
						.
						.
						n - 1	[]
						
				3. In Theta(1) time, can
					1. Load O(1) words
					2. Do O(1) computations on words
					3. Store O(1) words
					4. O(1) registers
						1. Locations are specified by registers
				4. Word is w bits
					1. Example: Comparison of two words is enough to determine which one is bigger (int, float, ... are not important)
						1. Comparing words is O(1) (since computations on words is done in constant time)
					2. Word should be atleast log(size of memory)
						1. Because a word should specify an index in the array
					3. What if we have giant integers
						1. How to manipulate them? Discussed later
			2. Pointer Machine
				1. Dynamically allocated objects
				2. Object has O(1) fields
				3. Field = word (e.g int) OR pointer
				4. Pointer - points to another object or null (Nil or None)
				
						val: 5			val: -1
						prev   <------- prev
						next ---------> next -----> null
						
					1. val: word
				5. We can instantiate and destroy nodes
					1. Can be implemented in RAM
						1. Pointer becomes index in giant table (C)
				6. Following pointer - O(1)
				7. Changing any of the fields - O(1)
				8. Weaker model but many data structures are built using this model
			3. Python Model
				1. It has both and we can do either one
				2. Some operations take more time (not all constant time)
				3. Lists - array
					1. L[i] = L[j] + 5 - takes constant time
				4. object - with O(1) attributes (small amount of fields)
					1. Does not apply to Dictionaries
					2. x = x.next -> O(1) time (we care only about scalability)
					3. L.append(x)
						1. We have to think in terms of how it is implemented with basic operations
							1. If we need to increase an existing array by size one, we need to allocate a new array and copy all the elements - O(n) time
								1. But Python does not implement it like that
									1. It does table doubling
										1. O(1) time - on average
					4. L = L1 + L2 (non-destructive)
					
							L = []
							for x in L1: # O(|L1|)
								L.append(x) # O(1)
							for x in L2: # O(|L2|)
								L.append(x) # O(1)
								
						1. O(|L1| + |L2|)
					5. x in L - O(n)
					6. len(L) - O(1) - counter is built in (lookup)
					7. L.sort() - O(|L| log |L|) (time to compare - O(1))
				5. Dict: D[key] = val -> O(1) (assuming key is single word)
					1. Hash Table - one of most important data structure
					2. key in D - O(1)
						1. With high probability (WHP)
						2. Use dictionary as much as possible
				6. long: L11
					1. x + y (|x| words, |y| words => O(|x| + |y|)
					2. x * y (O(|x| + |y|)^lg 3): lg 3 ~ 1.6
						1. There are faster algorithms
				7. heapq
					1. Implements heap
9 Document Distance Problem
	1. d(D1, D2) - What is it?
		1. Example: Two web pages are basically identical
			1. We can store less
		2. Example: Mirrors of Wikipedia
			1. Are they basically identical?
		3. Example: Are two problem sets cheating?
		4. Example: Web search
			1. Seach text - can be considered as a document
				1. Compared against all the documents and the ones with smallest distance is put on the top
					1. Google does something different though
	2. Document is a sequence of words
		1. Word - String of alphanumeric characters
			1. Whatever is between punctuation and whitespace are words
		2. May be they are similar if many words are common - one way only - shared words
			1. Think of a document as a vector
				1. d[w] = # occurences of w in D (non-negative)
					1. Example:
						1. D1 = "the cat"
						2. D2 = "the dog"
							1. the - x-axis
							2. cat - y-axis
							3. dog - z-axis
						3. d'(D1, D2) = D1.D2 = sigma D1[w].D2[3]
							1. Dot product - high - a lot of things common
								1. If there are million words and a lot is common
									1. It does not scale
										1. Fix: Divide by length of vectors
										
												= D1.D2/ |D1||D2|
												= arccos
												
		3. Algorithm
			1. Split document into words
			2. Compute word frequencies (how many times each word appears)
			3. Compute dot product
				1. Look at lecture notes
				2. 8 different algorithms exist actually (1MB)
					1. Version 1: 228.1 seconds
					2. Version 2: 164.7 seconds
					3. Version 3: 123.1 seconds
					4. Version 4: 71.7 seconds
					5. Version 5: 18.3 seconds
					6. Version 6: 11.5 seconds
					7. Version 7: 1.8 seconds
					8. Version 8: 0.2 seconds - can run on large inputs too
				3. Some of the above improvements are algorithmic and some of them are coding
			4. Implementation:
				1. Step 1: Run through string - if we see anything not alphanum - start a new word
					1. Another way
					
							re.findall(r'\wt', doc) # may run in exponential time
				
				1. Step 2:
					for word in doc:
						count[word] += 1 # O(|word|)
						
				1. O(sigma(|word|)) = O(|doc|) - high probability
				2. Another way:
					1. Sort the doc and get frequency - slightly slower
					
## Insertion Sort, Merge Sort ##
1. Motivation
	1. Why sorting?
		1. Phone book - names and numbers - sorted order (easy to search)
		2. Spreadsheets
		3. ...
		4. Problems that become easy once items are sorted
			1. Example: Finding a median
				1. Array A[0:n] - not sorted
					1. Sorted: B[0:n] (increasing order say)
						1. If records - provide comparison function as another input
			2. Two ways of sorting:
				1. Sort the entire list
				2. Keep list sorted as items are added
			3. Median: B[n/2]
				1. It is constant time if we already have a sorted list
			4. Binary search
				1. A[0:n] - search for a specific item
					1. Scanning takes linear time
					2. If A -> B, we can use binary search => O(log |A|)
						1. Binary search:
							1. Compare item to B[n/2]
							2. If item is equal to B[n/2] then return index
							3. If item is less than B[n/2] then search recursively in B[0:(n/2 - 1)]
							4. If item is greater than B[n/2] then search recursively in B[(n/2 + 1):n]
							5. If size of B is 1 and item is not equal to the last item, then return not found
			5. Not so obvious applications:
				1. Data compression - sort the items, represent item once and give number as its frequency
				2. Computer graphics - sorts from front to back (front one is rendered first)
					1. We can ignore the portions covered by the front layer (efficient rendering)
						1. If transparent, rendering from back to front
			6. Worthwhile to look at different sorting algorithms because they are used in many sophisticated applications
				1. Google them
					1. Cocktail sort
					2. Bitonic sort
					3. ...
				2. Different types of sorting algorithms win in different cases
2. Insertion Sort - not the best but easy
	1. For i = 1, 2, ..., n
		1. Insert A[i] in the right position into sorted array A[0:i-1]
	2. Implemented by pairwise swaps down to the correct position for the number that is initially in the position of A[i]
	3. Example:
	
			[5|2|4|6|1|3]
			
		1. key: 2
		2. swap(5, 2)
		
			[2|5|4|6|1|3]
			
		3. key: 4
		4. pairwise swaps with previous elements until it reaches the right position
		
			[2|4|5|6|1|3]
			
		5. key: 6
		7. No swaps
		8. key: 1
		9. pairwise swaps (4 swaps)
		
			[1|2|4|5|6|3]
			
		10. key: 3
		11. pairwise swaps (3 swaps)
		
			[1|2|3|4|5|6]
			
	4. Theta(n) steps in terms of key positions
		1. Worst case - Theta(n) work for each key
		
			Theta(1) + Theta(2) + ... + Theta(n-1) = Theta(n^2)
			
		2. Each step: Theta(n) swaps (compares and swaps)
			1. Compares and swaps are same cost typically
			2. If we have records
				1. Swaps might be pointer changes
				2. Comparison might be expensive (we can weigh this)
		3. Suppose compares are more expensive than swaps
			1. Concerned about Theta(n^2) comparison cost
				1. Binary search
					1. Theta(n log n)
			2. Do binary search on A[0:i - 1] which is already sorted
				1. In Theta(log i) time => Theta(n log n) (in terms of compares)
					1. Problem: If many things need to be swapped, it becomes worse
					
							Theta(n^2) for swaps
							
	5. Merge sort
		1. Divide & Conquer
		
			A
			Split into L & R
			
		2. Split until we have two elements we merge and then merge 4 elements, ....
		
				  A
				 / \
				L'  R' (sorted)
				 \ /
				merge
				
				Sorted array A'
				
		3. Merge: Two sorted arrays as input (Invarient - assumes inputs are sorted)
		
				L'    R'
				20    12
				13    11
				 7     9
				 2     1
				 
			1. Two finger algorithm
				1. Smaller of the two are put into the new array
			2. Recursion:
				1. A[0:n] -> L[0:n/2 - 1], R[n/2:n]
		4. Complexity: T(n) = C1 (divide) + 2T(n/2) (recursion) + C.n (merge)
		
					cn      cn
				   /  \
				 cn/2 cn/2  cn
				/ \    / \
		        ...
				c c ... c c cn
				
			T(n) = (1 + log n) cn = Theta(n log n)
		
		5. Merge sort - Theta(n) auxiliary space
			1. in-place sort => Theta(1) auxiliary space (good for billions or trillions
			2. In-place merge sort
				1. Theta (n log n) - much worse than regular merge sort practically (constant factor is high)
		6. Merge Sort in Python
			1. 2.2 n log n micro seconds
		7. Insertion Sort in Python
			1. 0.2 n^2 microseconds
		8. Insertion Sort in C:
			1. 0.01 n^2 microseconds

3. Merge Sort - Divide and Conquer
4. Recurrence solving - how to solve them (Divide and Conquer problems)
	1. T(n) = 2T(n/2) + cn^2
	
			cn^2         cn^2 (term dominates) - all work done here
		cn^2/4  cn^2/4   cn^2/2
		...  
		c c c .... c     cn

		= Theta(n^2)

	2. T(n) = 2T(n/2) + Theta(1)
	
				c        c
				
			c      c    2c
				...
			c ...   c   nc
			
		= Theta(n)

## Heaps and Heap Sort ##
1. Example implementation of priority queue
2. Heap sort - different from other sorts
3. Priority Queue
	1. Implements a set S of elements, each of the elements is associated with a key++
		1. Priorities are assigned to items (CRUD using priorities)
	2. Abstract Data Type
		1. Insert(S, x): insert element x into set S
		2. max(S): return element of S with the largest key
		3. extract_max(S): returns element of S with the largest key and removes it from S
		4. increase_key(S, x, k): Increase the value of x's key to new value k (update is better I think)
	3. Heap - implementation of priority queue
		1. An array visualized as a nearly complete binary tree
		
				[16|14|10|8|7|9|3|2|4|1]

							16 (1)
						   /  \
						  14   10 (3)
						 / \   / \
						8  7  9   3 (7)
					   / \ /\ /\  /\
					   
		2. Heap as a Tree
			1. Root of tree: first element (i = 1)
			2. parent(i) = i/2
			3. left(i) = 2i
			4. right(i) = 2i + 1
		3. Max-Heap property: The key of a node is >= the keys of its children
			1. Min-Heap property: The key ...
		4. We want to maintain rep invariant if we perform an operation
			1. If we run extract_max exhaustively, we get elements in sorted order
		5. How to build a max_heap from unsorted array?
			1. build_max_heap: produces a max heap from an unordered array
				1. max_heapify: Correct a single violation of the heap property in a subtree's root

## Binary Search Trees, BST Sort ##
## AVL Trees, AVL Sort ##
## Counting Sort, Radix Sort, Lower Bounds for Sorting ##
## Hashing with Chaining ##
## Table Doubling, Karp-Rabin ##
## Open Addressing, Cryptographic Hashing ##
## Integer Arithmetic, Karatsuba Multiplication ##
## Square Roots, Newton's Method ##
## Breadth-First Search (BFS) ##
## Depth-First Search (DFS), Topological Sort ##
## Single-Source Shortest Paths Problem ##
## Dijkstra ##
## Bellman-Ford ##
## Speeding up Dijkstra ##
## Dynamic Programming I: Fibonacci, Shortest Paths ##
## Dynamic Programming II: Text Justification, Blackjack ##
## DP III: Parenthesization, Edit Distance, Knapsack ##
## DP IV: Guitar Fingering, Tetris, Super Mario Bros. ##
## Computational Complexity ##
## Topics in Algorithms Research ##
## R1: Asymptotic Complexity, Peak Finding ##
## R2: Python Cost Model, Document Distance ##
## R3: Document Distance, Insertion and Merge Sort ##
## R5: Recursion Trees, Binary Search Trees ##
## R6: AVL Trees ##
## R7: Comparison Sort, Counting and Radix Sort ##
## R8: Simulation Algorithms ##
## R9: Rolling Hashes, Amortized Analysis ##
## Recitation 9b: DNA Sequence Matching ##
## R10: Quiz 1 Review ##
## R11: Principles of Algorithm Design ##
## R12: Karatsuba Multiplication, Netwon's Method ##
## R13: Breadth-First Search (BFS) ##
## R14: Depth-First Search (DFS) ##
## R15: Shortest Paths ##
## R16: Rubik's Cube, StarCraft Zero ##
## R18: Quiz 2 Review ##
## R19: Dynamic Programming: Crazy Eights, Shortest Path ##
## R20: Dynamic Programming: Blackjack ##
## R22: Dynamic Programming: Dance Dance Revolution ##
## R21: Dynamic Programming: Knapsack Problem ##
## R23: Computational Complexity ##
## R24: Final Exam Review ##