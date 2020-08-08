# Want fast C++? Know your hardware #
1. Have mental model of hardware while programming
2. Consider 2D array:
	1. Two ways to traverse
		1. Row major (how it is layed out in memory)
		2. Column major
3. Topics
	1. microbenchmarks
	2. **google benchmark library** (good)
	3. clang, gcc7, vc++14
	4. default settings, full optimisations on (-O3 and /0x, respectively)
	5. Two mac books: Core i7, Core 2 Duo
4. 2D array:
	1. wrong way is 30 - 35 (40 times sometime) slower
		1. Vector and array are better
	2. Revision of mental model:
		1. Cache in between CPU and Memory
			1. Cache misses!!!
5. Example:

		constexpr size_t size = 2 << 26;
		
		int* array = new int[size]; // 512 MB
		
		for (int i = 0; i < size; i += step)
			array[i]++;
			
	1. Memory returns cache line to cache (not one int)
	2. The gap increasing when size increases
		1. L1, L2, L3 cache misses
			1. L3 cache miss is much more expensive than L2 ...
6. Problem: How many cycles does cache miss take to satisfy the request
7. Two parts: computation speed vs cache misses
8. Time profiling:
	1. Not very useful
		1. cache misses are usually ignored (only computation speed matters here)
	2. We need to know cache misses per second
9. Solution: We need right DS and access in the right order
10. Example:
	1. If Foo and Bar are classes and we always pass both objects to functions, then put Foo and Bar together in another class (they will recide one beside the other)

			struct FooBar
			{
				Foo foo;
				Bar bar;
			};
			
			std::vector<FooBar> foobars (1000);
			
			doSomething (foobars[i]);
			
11. Temporal cache coherency
	1. word sequentially and use already fetched data before moving on
12. Jumping randomly:
	1. Lists, HashMaps
		1. Allocate nodes close to each other and re-use
	2. Example: Randomly accessing arrays
		1. This is much worse than column major
	3. Reasons:
		1. column major uses same stride each time - prefetcher (hardware)
			1. Sits between CPU and cache
			2. When it recognizes the pattern, it starts pre-fetching things (10 - 30 % speedup)
13. Accessing every Nth array element

		int* array = new int[size]; // 32 MB
		int step = 1;
		
		// init with some data...
		
		int i = 0;
		
		for (int repeat = 0; repeat < 10000; ++repeat)
		{
			array[i]++;
			i = (i + step) % size;
		}
		
	1. 256th - sudden drop
	2. 512th - sudden drop
	3. 1024th - sudden drop
		1. Cache associativity:
			1. Suppose every car has license plat
			2. parking lots:
				1. fully associative: any car goes to any parking lot
					1. Difficult to build and more hardware
					2. More circuitry
				2. Direct mapped:
					1. car ending with 2 goes only to 2
					2. car ending with 3 goes only to 3
					3. Pros:
						1. Easy to build
						2. Faster
					5. Cons:
						1. more cache misses
				3. Compromise:
					1. N-way set associative
						1. Cache is divided into sets
						2. Each set is like a direct mapped cache
		2. Example:
			1. 128 KB L2 cache
			2. 8 way associative (8-sets)
				1. 8 sets
				2. each set is 16KB
			3. 20 ints and each is 16 kb apart
				1. competing for same 8 slots (where can go)
				2. They evict each other
4. Data cache and Instruction cache
	1. Instruction cache
		1. it should not jump a lot or branch a lot
	2. Memory problem:
		1. data types cannot be anywhere in memory
			1. Every type has alignment requirement
				1. Word size:
					1. each type must be aligned to the word slot (alignof)
		2. Example:

				struct Foo
				{
					char c;
					double d;
					short s;
					int i;
				}
				
				c - - - - - - -
				d d d d d d d d
				s s - - i i i i
				
				struct Foo
				{
					char c;
					short s; // re-ordered
					int i;
					double d;
				}
				
				c - s s i i i i
				d d d d d d d d
				
			1. compiler can do this
				1. manual alignment

						struct Foo
						{
							char c;
							short s;
							int i;
							double d;
						}
						__attribute__((packed));
						
						c s s i i i i d
						d d d d d d d
						
					1. Application specific
			2. Hardware needs to decide
				1. Sometimes hardware cannot access this kind of arrangement
					
						- - - - - - - d
						d d d d d d d -
						
						read					read
						
						d d d d d d d -  + 	- - - - - - - d
						
						shift >> 8			shift << 56
						
						- d d d d d d d  + 	d - - - - - - -
						
						bitwise or
						
						d d d d d d d d
						
					1. Need to do of this
						1. If hardware doesn't do this, OS has to do which is slow
						2. Certain hardware cannot read un-aligned data
			3. Modern intel processors can do un-aligned access faster than old ones
5. Example:

		std::vector<float> v (32768);
		
		std::generate (v.begin(),
						v.end(),
						[] { return (rand() % 2) ? 1 : -1; });
		// std::sort (v.begin(), v.end());		
		return std::count_if (v.begin(),
								v.end(),
								[] (float x) { return x > 0; });
								
	1. Depends on compiler
		1. vc++14 - sorted is 6 times faster
		2. clang, gcc - same
		3. Why?
			1. Assembly
				1. vc++: jump!!!
					1. pipeline
						1. 20 stages (modern CPUs) + micro-instructions
						2. Pipeline bubbles (if nothing to do due to stall)
							1. Branch predictor:
								1. Speculatively executes next set of instructions
								2. If loops, conditions
									1. predictable
										1. Most of the time, it is right
								3. Prediction of random numbers:
									1. cannot figure out what to do
										1. audio apps: don't use conditions but use bit manipulation
				2. gcc: cmov (conditional move)
	2. Virtual function calls:
		
				struct Mammal
				{
					virtual float getSomeNumber() const noexcept { return 1.0; }
				};
				
				struct Dog : public Mammal
				{
					float getSomeNumber() const noexcept override { return 2.0; }
				};
				
				struct Cat : public Mammal
				{
					float getSomeNumber() const noexcept override { return 3.14159; }
				};
				
				std::vector<Mammal*> zoo;
				
				std::fill_n (std::back_inserter (zoo), 10000, new Mammal);
				std::fill_n (std::back_inserter (zoo), 10000, new Dog);
				std::fill_n (std::back_inserter (zoo), 10000, new Cat);
				
				// std::random_shuffle (zoo.begin(), zoo.end()); // or not!
				
				float sum = 0;
				
				for (auto* animal : zoo)
					sum += animal->getSomeNumber();
					
			1. shuffling: costs
				1. virtual functions are not the problem but additional branch to figure out which function to call
6. Caches are shared between cores
	1. Example:

			void work (std::atomic<int>& a)
			{
				for (int i = 0; i < 10000; ++i)
					a++;
			}
			
			void test()
			{
				std::atomic<int> a; a = 0;
				std::thread t1 ([&] () { work (a); });
				std::thread t2 ([&] () { work (a); });
				std::thread t3 ([&] () { work (a); });
				std::thread t4 ([&] () { work (a); });
				
				t1.join(); t2.join(); t3.join(); t4.join();
			}
			
		1. More threads we have, the slower it gets
			1. If cache is shared:
				1. If a core modifies a shared value, it is flushed to shared cache
				2. If another core wants to access, it is invalidated and fetched from shared cache
		2. Suppose 4 atomic variables exist (none is shared)
			1. Still same performance hit
				1. The 4 variables are on the same cache line!!!
					1. If we modify one variable in a cache line, the entire cache line is invalidated!!!
						1. Solution: prevent false sharing

								struct alignas (64) aligned_type
								{
									std::atomic<int> a;
								};
								
								aligned_type a, b, c, d;
								
								// &a = 0x....00
								// &b = 0x....40
								// &c = 0x....80
								// &d = 0x....c0
								
							1. aligned on different cache lines
7. Data hazard:
	1. Result of one instruction is used by another instruction
		1. Optimizer may re-order instructions
		2. Hardware may re-order isntructions as well
	2. Example:

			unsigned atoui (const char* c)
			{
				unsigned result = 0;
				
				while (*c >= '0' && *c <= '9')
					result = result * 10 + (*c - '0');
					
				return result;
			}
			
		1. every new number depends on previous
			1. This can be optimized to remove the dependency
	3. Example:

			int a[1000], b[1000], c[1000]; // filled with some values...
			
			// bad:
			
			for (int i = 0; i <= 998; ++i)
			{
				a[i] += b[i];
				b[i + 1] += c[i];
			}
			
			// better: one iteration of the loop does not depend on the previous iteration - compiler can vectorize it (SIMD - MMX, SSE, AVX, AVX2, AVX512, NEON, ...)
			a[0] += b[0];
			
			for (int i = 1; i <= 998; ++i)
			{
				b[i + 1] += c[i];
				a[i + 1] += b[i + 1];
			}
			
			b[999] += c[999];
			
		1. loop vectorization produces xmm instructions
			1. Caveat: We need to align memory to SSE register size (16 bytes to be aligned to 16 bytes boundary)
		2. Example:

				void multiplyAdd (float* buffer1, float* buffer2, float factor, size_t size)
				{
					for (size_t i = 0; i < size; ++i)
						buffer1[i] += buffer2[i] * factor;
				}
				
				void test()
				{
					const int size = 16384;
					
					auto* b1 = new float[size];
					auto* b2 = new float[size];
					
					// fill with data...
					
					multiplyAdd (b1, b2, 0.00001f, size);
					
					// multiplyAdd (b1 + 1, b2 + 2, 0.00001f, size - 2); - not aligned to simd register boundary
				}
				
			1. Compiler can vectorize
				1. New processor - ~ 20% slower
8. Example:

		float do_some_multiplications (float x)
		{
			for (int i = 0; i < 10000; ++i)
				x *= 0.999f;
				
			return x;
		}	
		
	1. x = 1.0, 1.0/0.0, 0.0/0.0, -0.0, 1e-39
		1. laste number: much slower - denormals
			1. exp: 0s
			2. fraction: non-zero
		2. In hardware it is slow
			1. Flush exp to 0s
	2. Exponent = 1111111:
		1. fraction is zero - +inf, -inf
		2. fraction is non-zero - NaNs
	3. Exponent between 1111110 and 00000001:
		1. "normal" floats with implicit leading 1
	4. Exponent = 0000000:
		1. fraction is zero - +0, -0
		2. fraction is non-zero - **denormals**
9. Conclusion: For fast C++, be nice to hardware
	1. Be conscious whether you're bound by data or computation
	2. Prefer data contiguous in memory
	3. If you can't, prefer constant strides to randomness
	4. Keep data close together in space
	5. Keep accesses to same data close together in time
	6. Avoid dependencies between successive computations
	7. Avoid dependencies between two iterations of a loop
	8. Avoid hard-to-predict branches
	9. Be aware of cache lines & alignment
	10. Minimise number of cache lines accessed by multiple threads
	11. Don't be surprised by hardware weirdness (cache associativity, denormals, ...)