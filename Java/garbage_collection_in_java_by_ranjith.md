# Garbage Collection in Java #
https://www.youtube.com/watch?v=UnaNQgzw4zY

1. Before Java
	1. Programmer had to allocate and de-allocate memory
		1. Using
			1. `malloc()`, `realloc()`, `calloc()`
			2. `free()`
			3. `new` and destructors
		2. We are responsible for freeing memory
			1. If not, it causes memory leaks
				1. Programmers need to worry about these things
	2. Java came with automatic memory management (through gc thread)
		1. Other modern languages also come with this feature
			1. It works on hypothesis
				1. Most objects soon become unreachable
					1. Objects usually are created in the context of if block or method
						1. These can be garbage collected
		2. Remove objects that are not used anymore
			1. live object = reachable (referenced by someone else)
			2. dead object = unreachabe (not referenced from anywhere)
		3. References from 'old' objects to 'young' objects only exists in small numbers
			1. Example: Cache - we don't put anything new into the cache but keep using it
	3. Live object - has a reference (from stack or heap)
2. Before we start
	1. Objects are allocated (new) in 'heap' of java memory
	2. Static members, class definitions (metadata) etc are stored in "method area" (Permgen/Metaspace)
	3. GC is carried out by a daemon thread called "Garbage collector"
	4. We can not force gc to happen (System.gc())
		1. There is no guarantee
	5. `java.lang.OutOfMemoryError` - if JVM is not able to allocate any more objects
3. Garbage Collection
	1. Mark: Starts from root node of your application (main), walks the object graph, marks objects that are reachable as live
	2. Delete/ Sweep: Delete unreachable object
	3. Compacting: Compact the memory by moving around the objects and making the allocation contiguous than fragmented
4. Generations:
	1. Java collectors are called generational collectors
		1. The collection logic depends on whether the objects are young, old, number of survivals of gc etc...
	2. Heap space:
		1. Young Generation (objects are created)
			1. Eden Space
				1. New objects are created here (`new HashMap<>()`)
			2. Survivor Space from
				1. If eden space becomes full, then small gc cleans up eden and moves surviving objects to survivor space (it survived a garbage collection)
			3. Survivro Space to
		2. Old (Tenured) Generation
			1. Holds objects surviving for a long time (after few generations of gc)
				1. Example: Cache