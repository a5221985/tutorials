# Performance Engineering of Software Systems #
## Introduction and Matrix Multiplication ##
1. Why we do performance engineering
2. Software properties
	1. What software properties are more important than performance?
		1. Compatibility
		2. Correctness
		3. Clarity
		4. Debuggability
		5. Functionality
		6. Maintainability
		7. Modularity
		8. Portability
		9. Reliability
		10. Robustness
		11. Testability
		12. Usability
		13. ...
3. Performance is the currency of computing. You can often "buy" needed properties with performance
	1. Sacrifice performance for easy to program
	2. Sacrifice performance for security
	3. ... (performance budget)
	4. If performance degrades too far, system becomes unusable
4. It has no intrinsic value but we can buy things we care about
5. Many programs strained the machine's resources
	1. Programs had to be planned around the machine
	2. Many programs would not "fit" without intense performance engineering
6. We need to make programs fast and readable
7. Around 2005, clock speeds plateued but densities went higher
	1. Leakage currents started to become significant when we miniaturize
		1. Introduced parallism as multicore processors
		2. To use this, we need to do parallel programming using
			1. Vector machines
			2. GPUs
			3. Speeper cache hierarchies
			4. Configurable logic on certain machines
8. Hence we need to deal with performance
9. Mention of performance for jobs is growing
10. Performance engineering is still hard
	1. A modern multicore desktop processor contains parallel-processing cores, vector units, caches, prefetchers, GPU's, hyperthreading, dynamic frequency scaling, etc. etc.
	2. How can we write software to utilize modern hardware efficiently?
11. Matrix multiplication
	1. 2.n^3 operations
		1. let n = 2^k
12. AWS c4.8xlarge Machine Specs
	1. Vector units
		1. 8 double precision including fuse multiply add
	2. L3 - LLC (Last Level Cache)
	3. 836 GFLOPS
13. Python example: Matrix Mult
	1. 4096 ~ 6 hours
	2. Is this fast?
	3. Should we expect more from our machine?
		1. 2n^3 operations = 2^37 flops
		2. Running time = 21042 seconds
			1. Peak is 836 gigaflops
			2. We have 6.25 Megaflops - 0.00075% of peak
14. Let us code in Java:
	1. ~ 2,738 seconds (same code)
		1. 46 minutes
			1. About 8.8 x faster
15. Let us code in C:
	1. Using Clang/LLVM 6.0 compiler:
		1. 1156 seconds
		2. ~ 19 minutes
	2. 0.014 % of peak
16. Python is interpreted, Java is in the middle, C is compiled to machine code
	1. Java is compiled to byte code which is then interpreted to just in time (JIT) compiled to machine code
17. Interpreters are versatile, but slow
	1. Interpreter reads, interprets, and performs each program statement and updates the machine state
	2. Interpreters can easily support high-level programming features - such as dynamic code alteration - at the cost of performance
	3. Cycle:
		1. Interpret statement
		2. Perform statement
		3. Update state
		4. Read next statement
18. JIT Compilation
	1. JIT compilers can recover some of the performance lost by interpretation
	2. When code is first executed, it is interpreted
	3. The runtime system keeps track of how often the various pieces of code are executed
	4. Whenever some piece of code executes sufficiently frequently, it gets compiled to machine code in real time
	5. Future executions of that code use the more-efficient compiled version
19. C is much closer to the metal so easier to do performance engineering
20. For example we can change the order of the loops in this program without affecting its correctness
	1. Cache localities
		1. i, k, j -> Loop order affects running time by a factor of 18
			1. Each processor reads and writes main memory in contiguous blocks, called cache lines
			2. Previously accessed cache lines are stored in a smaller memory, called a cache, that sits near the processor
			3. Cache hits - accesses to data in cache - are fast
			4. Cache misses - accesses to data not in cache - are slow
		2. Example: Matrix layout
			1. In matrix-multiplication code, matrices are laid out in memory in row-major order
				1. What does this layout imply about the performance of different loop orders? (Fortran - column major)
				2. For B - we are skipping 4096 units (poor spacial locality)
		3. Performance of different orders
			1. We can measure the effect of different access patterns using the Cachegrind cache simulator:
				1. `valgrind --tool=cachegrind ./mm`
					1. Tells Last-level-cache miss rate
21. Compiler Optimization
	1. Clang provides a collection of optimization switches. You can specify a switch to the compiler to ask it to optimize
		1. -O0 - Do not optimize
		2. -O1 - Optimize
		3. -O2 - Optimize even more
		4. -O3 - Optimize yet more
	2. Clang also supports optimization levels for special purposes, such as -Os, which aims to limit code size, and -Og, for debugging purposes
22. Profile guided optimizations
	1. We can figure out what the performance was and feed that back into the code compiler can be smarter about optimization
23. Use multicore: 18 cores
	1. The `cilf_for` loop allows all iterations of the loop to execute in parallel

			cilk_for (int i = 0; i < n; ++i)
				for (int k = 0; k < n; ++k)
					cilk_for(int j = 0; j < n; ++i)
						c[i][j] += A[i][k] * B[k][j];
						
		1. Compiler and runtime systems can schedule them
		2. Options:
			1. Parallel i loop - fastest - Rule of thumb: parallelize outer loops rather than inner loops
			2. Parallel j loop
			3. Parallel i and j loop
	2. Using parallel loops gets us almost 18x speedup on 18 cores! (Disclaimer: Not all code is so easy to prallelize effectively)
	3. About 5% of peek
24. Idea: Restructure the computation to reuse data in the cache as much as possible
	1. Cache misses are slow, and cache hits are fast
	2. Try to make the most of the cache by reusing the data that's already there
	3. How many memory accesses must the looping code perform to fully compute 1 row of C?
		1. 4096 x 1 = 4096 writes to C
		2. 4096 x 1 = reads from A, and
		3. 4096 x 4096 = 16,777,216 reads from B, which is
	4. How about to compute a 64 x 64 block of C?
		1. 64.64 = 4096 writes to C
		2. 64.4096 = 262144 reads from A, and
		3. 4096.64 = 262144 reads from B, or
		4. 528384 memory accesses total
	5. Tiled multiplication:

			cilk_for (int ih = 0; ih < n; ih += s)
				cilk_for (int jh = 0; jh < n; jh += s)
					for (int kh = 0; kh < n; kh += s)
						for (int il = 0; il < s; ++il)
							for (int kl = 0; kl < s; ++kl)
								for (int jl = 0; jl < s; ++jl)
									c[ih + il][jl + jl] += A[ih + il][kh + kl] * B[kh + kl][jh + jl];
									
		1. Tiling ~ 9.184 % of peak
			1. The tiled implementation performs about 62% fewer cache references and incurs 68% fewer cache misses
	6. Caches:
		1. L1-i, L1-d
		2. L2
		3. LLC (L3)
		4. Main Mem
	7. Two tuning parameters, s and t
	8. Multidimensioanl tuning optimization, can't be done with binary search
		1. Example:

				cilk_for(int ih = 0; ih < n; ih += s)
					cilk_for(int jh = 0; jh < n; jh += s)
						for (int kh = 0; kh < n; kh += s)
							for (int im = 0; im < s; im += t)
								for (int jm = 0; jm < s; jm += t)
									for (int km = 0; km < s; km += t)
										for (int il = 0; il < t; ++il)
											for (int kl = 0; kl < t; ++kl)
												for (int jl = 0; jl < t; ++jl)
													C[ih + im][jh + jm + jl] = A[ih + im + il][kh + km + kl] * B[kh + km + kl][jh + jm + jl];

25. Idea: Tile for every power of 2 simultaneously
	1. 8 multiplications of n/2 x n/2 matrixes and 1 addition of n x n matrices
		1. Recursively
	2. Example:
		1. Recursive Parallel Matrix Multiply

				void mm_dac(double *restrict C, int n_C,
								double *restrict A, int n_A,
								double *restrict B, int n_B,
								int n)
				{ // C + A * B
					assert((n & (-n)) == n);
					if (n <= 1) {
						*C += *A * *B;
					} else {
				#define X(M, r, c) (M + (r * (n_ ## M) + c) * (n/2))
					cilk_spawn mm_dac(X(C, 0, 0), n_C, X(A, 0, 0), n_A, X(B, 0, 0), n_B, n/2);
					cilk_spawn mm_dac(X(C, 0, 1), n_C, X(A, 0, 0), n_A, X(B, 0, 1), n_B, n/2);
					cilk_spawn mm_dac(X(C, 1, 0), n_C, X(A, 1, 0), n_A, X(B, 0, 0), n_B, n/2);
								mm_dac(X(C, 1, 1), n_C, X(A, 1, 0), n_A, X(B, 0, 1), n_B, n/2);
					cilk_sync;
					cilk_spawn mm_dac(X(C, 0, 0), n_C, X(A, 0, 1), n_A, X(B, 1, 0), n_B, n/2);
					cilk_spawn mm_dac(X(C, 0, 1), n_C, X(A, 0, 1), n_A, X(B, 1, 1), n_B, n/2);
					cilk_spawn mm_dac(X(C, 1, 0), n_C, X(A, 1, 1), n_A, X(B, 1, 0), n_B, n/2);
								mm_dac(X(C, 1, 1), n_C, X(A, 1, 1), n_A, X(B, 1, 1), n_B, n/2);
					cilk_sync;
					
		1. The child function call is spawned, meaning it may execute in parallel with the parent caller.
		2. Control may not pass this point until all spawned children have returned
		3. Running time: 93.93 s - about 50% slower than last version
			1. The base case is too small. We must coarsen the recursion to overcome function - call overheads
			2. Use threshold: 

					if (n <= THRESHOLD) {
						mm_base(C, n_C, A, n_A, B, n_B, n);
					} else {
						...
						
				1. Base-case size: 32
		4. ~ 12.646 % of peak
26. Vector Hardware
	1. Modern microprocessors incorporate vector hardware to process data in single-instruction stream, multiple-data stream (SIMD) fashion

					Memory and caches
				vector load/ store unit
			lane 0 | lane 1 | lane 2 | lane 3
			
			word 0 | word 1 | word 2 | word 3
					Vector Retisters
					
		1. Single instruction operates on a vector
		2. Each vector register holds multiple words of data
		3. Compiler Vectorization
			1. Clang/LLVM uses vector instrucitons automatically when compiling at optimization level -02 or higher. Clang/LLVM can be induced to produce a vectorization report as follows:

					clang -03 -std=c99 mm.c -o mm -Rpass=vector
					
				1. Many machines don't support the newest set of vector instructions, however, so the compiler uses vector instructions conservatively by default
		4. Vectorization Flags
			1. Programmers can direct the compiler to use modern vector instructions using compiler flags such as the following:
				1. `-mavx`: Use Intel AVX vector instructions
				2. `-mavx2`: Use Intel AVX2 vector instructions
				3. `-mfma`: Use fused multiply-add vector instructions
				4. `-march=<string>`: Use whatever instructions are available on the specified architecture
				5. `-march=native`: Use whatever instructions are available on the architecture of the machine doing compilation
		5. Due to restrictions on floating-point arithmetic, additional flags, such as `-ffast-math`, might be needed for these vectorization flags to have an effect
			1. Floating point multiplies are not associative (A(BC) != (AB)C)
				1. Allows compiler to do re-ordering even if they are not the same
	2. + compiler vectorization: ~ 23.486 % of peak
		1. Using flags: `-march=native -ffast-math` nearly doubles the program's performance
		2. Can we be smarter than the compiler
27. AVX Intrinsic Instructions
	1. Intel provides C-style functions, called **intrinsic instructions**, that provide direct access to hardware vector operations: [https://software.intel.com/sites/landingpage/IntrinsicGuide/](https://software.intel.com/sites/landingpage/IntrinsicGuide/)
		1. The Intel intrinsic Guide is an interatice reference tool for Intel intrinsic instructions, which are Cx style functions that provide access to many Intel Instructions - including Intel SSE, AVX, AVX-512, and more - without the need to write assembly code

				__m256i _mm256_abs_epi16 (__m256i a)
				__m256i _mm256_abs_epi32 (__m256i a)
				__m256i _mm256_abs_epi8 (__m256i a)
				__m256i _mm256_add_epi16 (__m256i a, _m256i b)
				__m256i _mm256_add_epi32 (__m256i a, _m256i b)
				__m256i _mm256_add_epi64 (__m256i a, _m256i b)
				__m256i _mm256_add_epi8 (__m256i a, _m256i b)
				__m256i _mm256_add_pd (__m256i a, _m256i b)
				__m256i _mm256_add_ps (__m256i a, _m256i b)
				__m256i _mm256_adds_epi16 (__m256i a, _m256i b)
				__m256i _mm256_adds_epi8 (__m256i a, _m256i b)
				__m256i _mm256_add_epu16 (__m256i a, _m256i b)
				...
		
28. Plus More Optimizations
	1. We can apply several more insights and performanc-engineering tricks to make this code run faster, including:
		1. Preprocessing
		2. Matrix transposition
		3. Data alignment
		4. Memory-management optimizations
		5. A clever algorithm for the base case that uses AVX intrinsic instrucitons explicity
	2. + AVX intrinsics: ~ 41.677 % of peak
29. Intel MKL - ~ 40.098 % of peak (lesser than our solution)
	1. Version 10 is competitive with Intel's professionally engineered Math Kernel Library!
		1. But Intel MKL is much more robust on other sizes
30. We don't generally see the magnitude of performance improvement we obtained for matrix multiplication
31. But in 6.172, you will learn how to print the currency of performance all by yourself
32. We are focussing on multicore performance (network performance, filesstem ... can be studied with this as the basis)

## Bentley Rules for Optimizing Work ##
1. Definition:
	1. The work of a program (on a given input) is the sum total of all the operations executed by the program
2. Optimizing work:
	1. Algorithm design can produce dramatic reductions in the amount of work it takes to solve a problem, as when a Theta(n log n) - time sort replaces a Theta(n^2) time sort
	2. Reducing the work of a program does not auto-matically reduce its running time, however, due to the complex nature of computer hardware
		1. Instruction-level prallelism (ILP)
		2. Caching
		3. Vectorization
		4. Speculation and Branch Prediction
		5. ...
	3. Nevertheless, reducing the work serves as a good heiristic for reducing overall running time
4. Book: Writing Efficient Programs - Jon Louis Bentley
	1. Techniques for reducing work for a computer program
5. New "Bentley" Rules
	1. Most of Bentley's original rules dealt with work, but some dealt with the vagaries of computer architecture three and a half decades ago
	2. We have constructed a new set of Bentley rules dealing only with work
	3. We shall discuss architecture-dependent optimizations in subsequent lectures
6. New Bentley Rules
	1. Data structures
		1. Packing and encoding
		2. Augmentation
		3. Precomputation
		4. Compile-time initialization
		5. Caching
		6. Lazy evaluation
		7. Sparsity
	2. Loops
		1. Hoisting
		2. Sentinels
		3. Loop unrolling
		4. Loop fusion
		5. Eliminating wasted iterations
	3. Logic
		1. Constant folding and propagation
		2. Common-subexpression elimination
		3. Algebraic identities
		4. Short-circuiting
		5. Order tests
		6. Constructing a fast path
		7. Combining tests
	4. Functions
		1. Inlining
		2. Tail-recursion elimination
		3. Coarsening recursion
7. Data structures:
	1. Packing and encoding
		1. The idea of packing is to store more than one data value in a machine word. The related idea of encoding is to convert data values into a representation requiring fewer bits
			1. Less memory fetches
		2. Example: Encoding dates
			1. The string "September 11, 2018" can be stored in 18 bytes - more than two double (64-bit) words- which must move whenever a date is manipulated
			2. Assuming that we only store years between 4096 B.C.E and 4096 C.E., there are about 364.25 x 8192 ~ 3 M dates, which can be encoded in |lg(3 x 10^6)| = 22 bits, easily fitting in a single (32-bit) word
			3. But determining the month of a date takes more work than with the string representation
	2. Example: Packing dates
		1. Instead, let us pack the three fields into a word:

				typedef struct {
					int year: 13;
					int month: 4;
					int day: 5;
				} date_t;
				
		2. This packed representation still only takes 22 bits, but the individual fields can be extracted much more quickly than if we had encoded the 3 M dates as sequential integers
8. Sometimes unpacking and decoding are the optimization, depending on whether more work is involved moving the data or operating on it
9. Augmentation:
	1. The idea of data-structure augmentation is to add information to a data structure to make common operations do less work (so that they are faster)
		1. Example: Appending singly linked lists
			1. Appending one list to another requires walking the length of the first list to set its null pointer to the start of the second.
				1. Augment the list with a tail pointer allows appending to operate in constant time
					1. Update the tail
10. Precomputation:
	1. The idea of precomputation is to perform calculations in advance so as to avoid doing them at "mission-critical" times
		1. Example: Binomial coefficients
			1. (n k) = n!/(k!(n - k)!)
				1. Compute the "choose" function by implementing this formulat can be expensive (lots of multiplications) and watch out for integer overflow for even modest values of n and k
					1. n! grows as O(n^n)
			2. Solution:
				1. Procompute a table of coefficients and lookup up during runtime
					1. Pascal's triangle
						1. Each element value is previous row's k - 1 th column and k th column

								int choose(int n, int k) {
									if (n < k) return 0;
									if (n == 0) return 1;
									if (k == 0) return 1;
									return choose(n - 1, k - 1) + choose(n - 1, k);
								}
								
				2. Precomputing Pascal:

						#define CHOOSE_SIZE 100
						int choose[CHOOSE_SIZE][CHOOSE_SIZE];
						
						void init_choose() {
							for (int n = 0; n < CHOOSE_SIZE; ++n) {
								choose[n][0] = 1;
								choose[n][n] = 1;
							}
							
							for (int n = 1; n < CHOOSE_SIZE; ++n) {
								choose[0][n] = 0;
								for (int k = 1; k < n; ++k) {
									choose[n][k] = choose[n - 1][k - 1] + choose[n - 1][k];
									choose[k][n] = 0; // other half is 0s
								}
							}
						}
						
					1. Now, whenever we need a binomial coefficient (less than 100), we can simply index the choose array.
				3. Compile-Time Initialization:
					1. The ideas of compile-time initialization is to store the values of constants during compilation, saving work at execution time
					2. Example:

							int choose[10][10] = {
								{ 1, .... }
								{ ... }
							};
							
				4. Compile-Time Initialization (2)
					1. Idea: Construct large static tables by metaprogramming.

							int main(int argc, const char *argv[]) {
								init_choose();
								printf("int choose[10][10] = {\n");
								for (int a = 0; a < 10; ++a) {
									printf("  {");
									for (int b = 0; b < 10; ++b) {
										printf("%3d, ", choose[a][b]);
									}
									printf("},\n");
								}
								printf("};\n");
							}
							
						1. Prints c code for declaration
11. Caching
	1. The idea of caching is to store results that have been accessed recently so that the program need not compute them again
		1. Example:

				inline double hypotenuse(double A, double B) {
					return sqrt(A*A + B*B);
				}
				
			1. sqrt is expensive in modern machines than multiplication and division
			2. Solution:

					double cached_A = 0.0;
					double cached_B = 0.0;
					double cached_h = 0.0;
					
					inline double hypotenuse(double A, double B) {
						if (A == cached_A && B == cached_B) {
							return cached_h; // previously computed
						}
						cached_A = A;
						cached_B = B;
						cached_h = sqrt(A*A + B*B);
						return cached_h;
					}
					
				1. We can make the cache larger
					1. Larger cache lookup may be expensive but overall it is better
					2. About 30% faster if cache is hit 2/3 of the time
12. Sparsity:
	1. The idea of exploiting sparsity is to avoid storing and computing on zeroes. "The fastest way to compute is not to compute at all"
		1. value + 0 = value and value * 0 = 0
		2. Example:
			1. y = M V
				1. Dense matrix-vector multiplication performs n^2 = 36 scalar multiplies, but only 14 entries are nonzero
					1. Solution: Check if one of the arguments is 0, then don't multiply
						1. Still slow because we need to check
	2. Compressed Sparse Row (CSR)
		1. rows array: number of rows + 1
			1. Stores offset into the cols array
		2. cols array: stores indices of non-zero entries in each of the rows
		3. Example:

				rows: 0 2 6 8 10 11 14
				cols: 0 4 | 1 2 4 5 | 3 5 | 0 3 | 0 | 4 3 | 4
				vals: 3 1 | 4 1 5 9 | 2 6 | 5 3 | 5 | 8 9 | 7

## Bit Hacks ##
## Assembly Language & Computer Architecture ##
## C to Assembly ##
## Multicore Programming ##
## Races and Parallelism ##
## Analysis of Multithreaded Algorithms ##
## What Compilers Can and Cannot Do ##
## Measurement and Timing ##
## Storage Allocation ##
## Parallel Storage Allocation ##
## The Cilk Runtime System ##
## Caching and Cache-Efficient Algorithms ##
## Cache-Oblivious Algorithms ##
## Nondeterministic Parallel Programming ##
## Synchronization Without Locks ##
## Domain Specific Languages and Autotuning ##
## Leiserchess Codewalk ##
## Speculative Parallelism & Leiserchess ##
## Tuning a TSP Algorithm ##
## Graph Optimization ##
## High Performance in Dynamic Languages ##