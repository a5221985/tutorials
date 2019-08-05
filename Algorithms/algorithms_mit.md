# Algorithms - MIT #

## Introduction to Algorithms, Fall 2011 ##
1. What's an algorithm?
	1. Computation

## Dynamic Programming ##
1. Careful brute force
2. Guessing + recursion + memoization
3. Calculates shortest paths in some DAG
4. Time - # sub-problems * time/sub-problem (treating recursive calls as Theta(1) - memoized returns are constant time)

### 5 General Steps (need not be sequential) ###
1. Define sub-problems
2. Guess (part of solution)
3. Relate sub-problem solutions
4. Recurse & memoize or build DP table bottom-up
	1. For loops or recursion have theoretically the same running time
5. Solve original problem
	1. Example 1: Fibonacci series
	2. Example 2: Shortest Paths
		1. delta_k(S, V) for v belonging to V, 0 <= k < |V|
			1. edge into v (if any)
				1. indegree(v) + 1
			2. delta_k(S,V) = min{delta_k-1(S,U) | (U,V) belongs to E}
				1. Theta(indegree(V) + 1)
			3. for k = 0,1, ..., |V| - 1: for v belongs to V:

### Parent pointers ###
1. Remember which guess was the best (works for all DP problems)
	1. Example: parent[i] = argmin(...) = best j value
		1. 0 -> parent[0] -> parent[parent[0]] -> ... (linear time)

### Problems ###
1. Subproblems for strings (sequences in general)
	1. Suffixes are subproblems (x[i:]) for all i - theta(n)
	2. Prefixes are subproblems (x[:i]) for all i - theta(n)
	3. substrings are subproblems (x[i:j]) for i <= j - theta(n^2)
2. Paranthesization
	1. Optimal evaluation of associative expression
		1. A0.A1.....An-1 (matrix muls)
			1. Subproblem - optimal evaluation of Ai...Aj-1
			2. Guess: k - Ai..Ak-1 * Ak...Aj-1
			3. Recurrence: DP(i,j) = min(DP(i,k) + DP(k,j) + cost of Ai:k * Ak:j - dimensions is sufficient for k in range(i+1, j))
			4. time = theta(n^3)
		2. DP is not shortest path in DAG
3. Edit distance (&LCS) - DNA
	1. Two strings - cheapest way to convert x into y
4. Knapsack
5. Pseudopolynomial time

## Divide & Conquer: FFT ##
1. Polynomial: A(x) = ao + a1 * x + a2 * x^2 + ... an-1 * x^(n-1)
	1. Operations on polynomials
		1. evaluations: A(x) & xo -> A(xo)
			1. O(n) -> (x^k) = x * x^(k - 1)
			2. Horner's rule:
				1. A(x) = ao + x(a1 + x(a2 + x(a3 + ....x(an-1))...) - O(n) time - # of arithmetic operations
		2. addition: A(x) & B(x) -> C(x) for all x
			1. Ck = ak + bk for all k (linear time)
		3. Multiplication: A(x) * B(x) -> C(x) for all x
			1. ao + (aob1 + boa1) * x + (aob2 + a1b1 + a2b0) * x^2 + ....
				1. ck = sigma_o_to_n(ai * b(k-i)) * x^(k)
2. Representation: 
	1. A - coefficient vector - [ai...]
	2. B - roots (every polynomial of n degree has n roots)
		1. x(x - ro)(x - r1)...(x - rn-1)
			1. No way to solve a polynomial for degree greater than 5
	3. C - Samples (xk, yk) for k = 0, 1, ..., n-1
		1. A(xk) = yk, xk's distinct
3. Matrix:
				
						Coefficients	Roots	Samples
		Evaluation		O(n)			O(n)	O(n^2)
		Addition		O(n)			inf		O(n)					
		Multiplication	O(n^2)			O(n)	O(n)

	1. Interpolation for evaluation for Samples - O(n^2)
		1. Algorithm to convert between coefficients and samples and back - O(nlogn)
			1. Fast Forier Transform - algorithm
			2. Discrete Forier Transform - mathematical
2. Matrix view:

		|1 xo xo^2 xo^3 ... xo^(n-1)| |ao| = |yo|
		|1 x1 x1^2 x1^3 ... x1^(n-1)| |a1| = |y1|
		|...						| |a2| = |y2|
		...							...		...

	1. vjk = xj^k (V - Vandermonde)
		1. coeffs -> samples = V.A (O(n^2))
		2. samples -> coeffs = V \ A
			1. Gaussian elimination - O(n^3)
			2. V^-1 . A : O(n^2)

3. Divide & conquer algorithm:
	1. Goal: A(x) for x in X
		1. Divide: Into even & odd coefficients
			1. A_even(X) = sigma_k=0_to_n/2-1 a2k x^k = <ao,a2,a4,....>
			2. A_odd(X) = sigma_k=0_to_n/2 x^k a2k+1 x^k = <a1, a3, a5, ...>
		2. Recursively compute A_even(y) & A_odd(y) for y in X^2 = {x^2 | x in X}
		3. Combine: A(x) = A_even(x^2) + x * A_odd(x^2) for x in X
	2. T(n, |X|) = 2.T(n/2, |X|) + O(n + |X|) - O(n^2)
		1. Recursion tree

				n
			n		n
				...
			n n n .... n - (2^logn = n number)

		2.  Collapsing set X if |X^2| = |X|/2 & X^2 is collapsing
			1.  Base case: |X| = 1
			2.  Options:
				1.  X^4, X = {i, -i, -1, 1}
				2.  X^8, X = {+/- sqrt(2)/2(1 + i), +/- sqrt(2)/2(1 - i), i, -i, -1, 1}

## Divide & Conquer Steps: ##
1. Divide
2. Conquer
3. Combine

## Divide & Conquer: van Emde Boas Trees ##
1. Series of improved DSs
2. Insert, Successor
3. Delete
4. Space

### Goal ###
1. maintain n elements among {0, 1, ..., u - 1} (integers in universe U) subject to Insert, Delete, Successor in O(log log u) time (u is usually 2^64 - size of words in machine)
	1. Can be done with balanced search tree like AVL tree
	2. If u = n^O(1) or n^lg(O(1))n, then lg lg u = O(lg lg n) (if u is polynomial of n)
2. Applications
	1. Network routers
		1. IP range this to this send to this port ...
			1. Given an IP address, to know the range, it is a predecessor or successor problem
3. Series of improvements to DSs
	1. Binary search on levels of tree
		1. T(k) = T(k/2) + O(1) = O(lg k)
			1. T(lg u) = T(lg u / 2) + O(1)
			2. T'(u) = T'(sqrt(u)) + O(1) = O(lg lg n)
4. Storage:
	1. bit vector = array of size u
		1. 0 - absent, 1 = present
	2. Example: 0100000001100001
		1. insert - 0 -> 1
		2. delete - 1 -> 0
		3. Successor - order u time (not good)
	4. Clusters:
		1. split universe into clusters into sqrt(u) clusters of size sqrt(u)	
			1. Insert - O(1)
			2. Successor(x) - look in x's cluster, if we don't find, we will look for next 1 bit in summary vector, look for first 1 in that cluster - O(sqrt(u))
5. if x = i sqrt(u) + j (O <= j < sqrt(u))
	1. x = 9 = 2 * 4 + 1
	2. high(x) = floor(x/sqrt(u)) - high order bits
	3. low(x) = x mod sqrt(u) - low order bits
	4. index(i, j) = i sqrt(u) + j
6. Recurse: V - size - u    v E B
	1. V.cluster[i] = size - sqrt(u)   v E B

## Binary Search Trees, BST Sort ##
1. Runway reservation system
	1. Scheduling problem
		1. An airport with a single run-way (busy)
		2. Constraints must be built into the DS
	2. Reservations for future landings
	3. Reserve requests for landings specifies landing time t
	4. Add t to the set R of landing times if no other landings are scheduled within k minutes (whether conditions based ... dynamically)
	5. Remove from set R after plane lands
2. Operations
	1. |R| = n
		1. O(lg n) time (all)
3. Example:
	1. Unsorted list/array - almost everything is linear
		1. Insert in O(1) w/o check
		2. Check takes O(n) time
	2. Sorted array:
		1. Insert in array is O(n)
			1. Finds smallest i such that R[i] >= t in O(lg n) time
			2. Compare R[i] and R[i - 1] against t in O(1) time
			3. Actual insertion requires shifting -> O(n)
	3. Sorted List:
		1. Insert is O(n) - need to traverse through the list to find the spot (worst case, the entire list)
			1. Actual insert is O(1)
	4. Heap: min/max
		1. Checking that element is <= k or >= k from t is O(n) time
4. Invarient: For all nodes x, if y is in the left subtree of X then key(y) <= key(x). If y is in the right .... key(y) >= key(x)
5. Runway allocation problem:
	1. Insert:
		
			49 79 46 41 42
			
		1. Doing binary search and inserting new element at the right (if k = 3 minutes, then element is inserted if it is atleast 3 units away from any key - cannot be reserved)
		2. h - height of the tree, then insertion w/wo check is in O(h) time
		3. Multiset - has duplicates
	2. find_min() - O(h) - go to the leftmost leaf
	3. next_larger(x) - O(h)
6. Augmented BSTs:
	1. More data than just pointers

## Amortization: Amortized Analysis ##
1. Amortization
	1. Aggregate method
	2. Accounting method
	3. Charging method
	4. Potential method
	5. Table doubling
	6. Binary counter
	7. 2-3 trees
2. Sum of all the operations cost is important
	1. The above are methods
3. Recall: Table doubling [6.006]
	1. - n items in table of size m
	2. - expected cost of O(1 + m/n)
		1. m needs to be around n
			1. If table is too small, double the size
				1. If n grows to m then double m -> m' = 2m
					1. Theta(m) work
			2. We double only log n times
				1. If n increases linearly, m double if n reaches m
					1. m, 2m, 4m, ... 2^pm
						1. We double p times -> p = log n
		2. Total cost of n insertions
			1. Theta(2^0 + 2^1 + 2^2 + ...2^log n)
				1. Theta (n)
				2. Amortized cost per operation:
					1. Theta (1) - for n operations, the average cost is n
4. Aggregate method:
	1. Do k operations
	2. Measure the cost of those operations
	3. Divide by k
		1. amortized cost per op
	4. Works for simple examples
5. General definition of amortized bounds
	1. Insertion may be one bound
	2. Delete may be one bound
	3. Assign cost for each operation (amortized) such that you preserve the sum
		1. sigma(op) amortized cost >= sigma(op) actual cost
			1. Individual cost is not important (upper bound)
	4. Example: 2-3 trees achieve O(1) worst-case per create-empty (?)
		1. O(log n*) amortized per insert
		2. 0 amortized per delete
			1. Cannot delete more elements than inserted
				1. Total cost = O(c + i log n* + d log n* ) = O(c + i lg n*) + d.0
					1. Since d <= i
		3. When we start, n is 0, insertion is constant time
		4. When n is constant, insertion is constant time
		5. When n grows, log n time
			1. n* is the maximum size over all time
6. Accounting Method:
	1. Allow an operation to store credit in bank account (>= 0 balance)
		1. Consuming time now to pay for it in the future (taking credit)
			1. For instance delete operation is log n but if we had a credit of >= log n, then deletion becomes free (in amortized sense)
			2. Insertion costs because, I am taking out coins and cost goes up (then I can use them for deletion)
	2. Allow an operation to pay for time using credit in bank
	3. Balance >= 0
		1. Let us say we are putting one coin of value log n* into the bank
			1. real cost
		2. Deletion - real cost is log n* but I am going to extract log n* coins so the total amortized cost is free (because we are not adding to the credit)
	4. O(lg n) per current n for insert
	5. 0 per delete, amortized
		1. put 1 coin worth Theta (lg n)
	6. Delete consumes 1 coin
		1. amortized cost = actual cost + deposits - withdrawal
			1. log n + log n - log n = log n (for current n)

## R1. Matrix Multiplication and the Master Theorem ##
1. Divide and Conquer
	1. Weighted interval scheduling - choose intervals that do not overlap and the combined weight is maximum
		1. Needs dynamic programming
		
				max				{ wj + WIS(Rj)} -> O(n^2): not good
				1 <= i <= n
				
			1. Sort the requests based on start time
			
					max(WIS(2, ... n), w1 + WIS(R1, ... n))
	
			2. Recursion tree

							1...n
						no/		  \yes
						2...n		R1...n
					 no/  	  \yes
					  3...n  R2...n
					  
				1. No of unique sub-problems - left branch (others are repeate)
					1. `O(nlogn) + O(n)` -> `O(nlogn)`

2. Strassen Algorithm - Matrix Multiplication
	1. T(n) = 7 T(n/2) + n^2
3. Master Theorem:
	1. 	Given a recursion: T(n) + aT(n/b) + f(n)
	
			T(n) = Theta(n^log_b a) if f(n) = O(n^c) c < log_b a (if not much work at each step)
			T(n) = Theta(n^c log^k+1 n) if f(n) + Theta(n^c log^k n) c = log_b a
			T(n) = Theta(f(n)) if f(n) = omega(n^c) c > log_b a (if too much work at each step and f(n) dominates)
					  