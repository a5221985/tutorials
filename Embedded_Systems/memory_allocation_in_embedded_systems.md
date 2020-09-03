## Memory allocation in embedded systems ##
1. Embedded system has only a few K (due to space and cost)
	1. Carefully allocate and don't run out of memory
2. Dynamic memory
	1. Memory leak - allocate a memory and memory is not freed and returned to system - leads to running out of memory
	2. Out of memory conditions - test for pointer before using it
		1. Might trigger exception
	3. Fragmentation - allocating and freeing memory of different sizes
		1. Leaves holes in memory like a swiss cheese
		2. If we need 2k but we cannot allocate one chunk because it is distributed
	4. We don't know how long malloc is going to take
		1. The more fragmentation, bigger the heap, the malloc is going to take longer
		2. don't use malloc (cannot calculate worst case execution time)
3. Other ways of getting same effect as dynamic memory (allocating on the go)
	1. Pool of buffers or multiple pools of buffers
		1. They are of same size => fragmentation is not a problem
	2. Memory leaks?
	3. Out of memory conditions?