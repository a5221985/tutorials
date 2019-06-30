# Garbage Collector #
1. Before java, we needed to allocate and de-allocate memory
	1. `malloc()`, `realloc()`, `calloc()`
	2. `free()`
	3. `new` and `destructors`
2. If we forget, memory leaks
3. Java provides automatic memory management through a program called Garbage collector
	1. "Remove objects that are not used anymore"
		1. live object = reachable (referenced by someone else)
		2. dead object = unreachable (not referenced from anywhere)
	2. Based on following hypothesis
		1. Most objects soon become unreachable 
		2. References from 'old' objects to 'young' objects only exist in small numbers
			1. Example: cache - is probably already populated and new objects may not be added
4. Garbage collection
	1. Before we start
		1. Objects are allocated (eg: new) in the "heap" of java memory. Static members, class definitions (metadata) etc. are stored in "method area" (Permgen/Metaspace)
		2. Garbage collection is carried out by a daemon thread called "Garbage collector"
		3. We can not force gc to happen (`System.gc()`)
		4. When new allocations can not happen due to a full heap you end up with a `java.lang.OutOfMemoryError` heap space and a lot of other headaches
			1. Arrays are also objects in Java
	2. Involves:
		1. **Mark**: Starts from root node of application (main), walks the object graph, marks objects that are reachable as live.
		2. **Delete/sweep**: Delete unreachable objects
		3. **Compacting**: Compact the memory by moving around the objects and making the allocation contiguous than fragmented
	3. Generational collectors
		1. Young generation
			1. Eden space - new objects created here (Eden garden)
			2. Survivor space from
				1. If no more space in Eden space, small gc is kicked off
					1. Un-reachable objects are cleaned off
					2. reachable objects are moved here (survived gc)
			3. Survivor to
		2. Old (Tenured) generation
			1. Holds objects for a long time (cache)
				1. Major garbage collection cycle can collect this if un-reachable (major gc runs across heap - causes pauses in application)