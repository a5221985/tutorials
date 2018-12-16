# Algorithm Complexity #
## Asymptotic Analysis [Lec 1 | MIT 6.046J / 18.410J Introduction to Algorithms (SMA 5503), Fall 2005](https://www.youtube.com/watch?v=JPyuH4qXLZ0) ##
1. Pre-requisites
	1. 6.042 - Math and Computer Science
	2. 6.001 - Discrete Math, Probability, Programming
2. Analysis of algorithms: Theoretical study of computer program performance and resource usage (communication, memory)
	1. What's more important than performance? Correctness, simplicity, maintainability, programmer time, stability, features (wide features than competitors), modularity (simple change requires small change), security, user-friendliness
		1. Why then study performance? correlated with user friendliness, real-time constraints, measures line between feasible and infeasible (it may not be functional), **a language to talk about program behavior (global)**, performance can be used to pay to other things (security, user-friendliness, ...) (saves resources), speed is fun
3. Example:
	1. <a1, a2, ..., an> of numbers
	2. Output: permutation <a1',a2',...,an'> such that a1'<=a2'<=...<=an'
	3. Insertion Sort:
		1. Time complexity:
			1. If the array is already sorted - least work
			2. If the array is reverse sorted - most work
			3. Depends on array size
				1. Parameterize in input size (time as function of size)
			4. Want upper bounds (no more than certain amount) - guarentee for user
4. Kinds of analysis
	1. Worst case analysis (usually)
		1. T(n) = max time on any input of size n (function and not a relation for max)
	2. Average case (sometimes)
		1. T(n) = expected time for all inputs of size n (probability of each input assumed)
			1. Assumption of a statistical distribution of inputs
				1. Equally likely (common assumption)
	3. Best case analysis (bogus) - we can cheat (slow algorithm that is fast on some input)
5. What times?
	1. Depends on computer
		1. Solution - relative speed (on same machine)
		2. Solution - absolute speed (algorithm that is better irrespective of time)
	2. Asymptotic analysis
		1. Ignores machine dependent constants
		2. Look at growth of running time (T(n)) as n -> infinity
6. Notations:
	1. Theta notation: Drop low order terms and ignore leading constants
		1. Example: 3n^3 + 90n^2 + 6046 ~ Theta(n^3)
			1. Mathematical definition? Definition in terms of sets of functions
				1. As n -> Infinity, Theta(n^2) always beats Theat(n^3) algorithm in speed
					1. It satisfies both relative and absolute speed requirements
				2. Machine dependent constants get insignificant as n -> infinity
			2. Engineering concerns: A slower algorithm may be better with reasonable size inputs than faster algorithm
6. Insertion sort analysis
	1. Worst case: When input is reverse sorted (Assumption: basic operation always takes constant amount of time)
		1. T(n) = sum_2_n(Theta * j) = Theta(n^2)
			1. For small n it is moderately fast but not at all for large n
7. Merge sort a[1...n]
	1. If n = 1, done
	2. Recursively sort A[1..[n/2]] and A[[n/2 + 1]..n]
	3. Merge the two
		1. subroutine: Compare elements between two lists and select the smaller one and put it in the array
			1. Theta(n) on n total elements
				1. T(n) = Theta(1) + 2*T([n/2]) + Theta(n)
			2. Reccurrence:
					1. T(n) = Theta(1) if n = 1, 2(T(n/2)) + Theta(n) if n > 1
						1. Recursion tree: T(n) = 2T(n/2) + cn = 2*2T(n/2^2) + 2cn + cn = ... = 2^kT(n/2^k) + 2^(k-1)cn + 2^(k-2)cn + ... + cn = 2^kp + 2^(k-1)cn + ... + cn ~ cnlog(n) + Theta(n) ~ Theta(nlog(n))
						1. Faster if > 30 elements
8. Asymptotic analysis
	1. f(n) = O(g(n)) means there are constants c > 0 and no > 0 such that 0 <= f(n) <= cg(n) for all n >= no
		1. 2n^2 = O(n^3) -> 2n^2 belongs to set O(n^3)
9. Macro convention
	1. A set in a formula represents an acronymous function in that set
		1. Ex: f(n) = n^3 + O(n^2) - means there is a fucntion h(n) = O(n^2) such that f(n) = n^3 + h(n)
	2. n^2 + O(n) = O(n^2) (= means "is" here) - asymmetric =
		1. Means for any f(n) belongs to O(n) there is an h(n) belongs to O(n^2) such that n^2 + f(n) = h(n) - = can be chained
10. Atleast time:
	1. Omega notations: Omega(g(n)) = {f(n): such that there exists constants c > 0 and no > 0 such that 0 <= g(n) <= c(f(n))
		1. sqrt(n) = Omega(log n) for sufficiently large n

## Big O Notations ##
1. Tells how well the algorithm scales
2. Example:
	1. 45n^3 + 20n^2 + 19 = 84 (n=1)
	2. 45n^3 + 20n^2 + 19 = 459 (n=2)
	3. 45n^3 + 20n^2 + 19 = 47,019 (n=10)
		1. 45n^3 = 45,000 (n=10) - 20n^2 + 19 has little effect and will have little influence as n increases
	4. O(n^3)
3. Notations:
	1. O(1) - same amount of time regardless of the size of the input
	2. O(n)
	3. O(n^2)
	4. O(log n)
4. Code example:

		public class BigONotation {
			private int[] theArray;
			private int arraySize;
			private int itemsInArray = 0;
			static long startTime;
			static long entTime;

			public static void main(String[] args) {
				BigONotation testAlgo2 = new BigONotation(100000);
				testAlgo2.generateRandomArray();

				BigONotation testAlgo3 = new BigONotation(200000);
				testAlgo3.generateRandomArray();

				BigONotation testAlgo4 = new BigONotation(300000);
				testAlgo4.generateRandomArray();
			}

			// O(1)
			public void addItemToArray(int newItem) {
				theArray[itemsInArray++] = newItem; // O(1) algorithm since array can find position in the same amount of time regardless of the size of the array
			}

			// O(n) - worst case takes time proprotional to n
			public void linearSearchForValue(int value) {
				boolean valueInArray = false;
				String indexWithValue = "";

				startTime = System.currentTimeMillis();

				for(int i = 0; i < arraySize; i++) {
					if (theArray[i] == value) {
						valueInArray = true;
						indexWithValue += i + " ";
					}
				}

				System.out.println("Value found: " + valueInArray);
				endTime = System.currentTimeMillis();
				System.out.println("Linear search took " + (endTime = startTime));
			}

			public BigONotation(int size) {
				arraySize = size;
				theArray = new int[size];
			}

			public void generateRandomArray() {
				for (int i = 0; i < arraySize; i++) {
					theArray[i] = (int) (Math.random() * 1000) + 10;
				}

				itemsInArray = arraySize - 1;
			}
		}