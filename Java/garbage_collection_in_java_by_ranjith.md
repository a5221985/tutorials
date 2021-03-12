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
				1. If eden space becomes full, then **small gc** (minor gc - runs in young generation) cleans up eden and moves surviving objects to survivor space (it survived a garbage collection)
			3. Survivor Space to
		2. Old (Tenured) Generation
			1. Holds objects surviving for a long time (after few survivals of gc)
				1. Example: Cache
			2. Major GC: Run throughout the heap (young and old)
				1. This might clean up the old generation objects if they become unreachable
	3. Both minor and major gcs are stop the world (minor - shorter because it is running on a small piece of memory)
		1. Major gc - entire heap is handled (can pause the application)
5. Working principle:
	1. As app runs, new objects get allocated in eden space
	2. As app runs, certain objects in eden space become unreachable
	3. When the eden space is full, allocation fails
	4. Minor gc gets run
		1. It marks all live objects as reachable
		2. The live objects are then moved to survivor space
		3. The un-reachable objects are cleaned up
	5. As app runs again, new objects get allocated in eden space
	6. Then certain objects again become unreachable
	7. When the eden space is full, allocation fails again
	8. When the eden is full, allocation fails
	9. Minor gc gets run
		1. It marks all live objects (both in eden space and survivor space) as reachable
		2. The live objects (from eden and survivor1) are moved to second survivor space
		3. Certain objects survived 2 cycles of gc but certain others survived one cycle of gc
	10. The cycle repeats (with surviving objects moving between survivor1 and survivor2 alternatively) 
	11. When a threshold (say 16) number of cycles is reached and if there are objects that survived all 16 cycles, then they are promoted to old generation space
		1. Max tenuring threshold can be set using:

				-XX:MaxTenuringThreshold
				
	12. If old generation is full (or near full),
		1. This kicks in major gc
			1. It goes over all the generations and performs mark, sweep and compacting
				1. Causes app to halt
6. Why two survovor spaces?
	1. Avoids the need to run a compacting step (which could be expensive)
		1. Moving to another survivor space automatically compacts them
7. Performance
	1. Responsiveness/ latency
		1. How quickly an application responds with the requested piece of data
			1. Examples:
				1. How quickly a desktop UI responds to an event
				2. How fast a website returns a page
				3. How fast a database query is returned
		2. Applcations that focus on responsiveness, large pause times are not acceptable. Focus is on responding in short periods of time
	2. Throughput
		1. Focuses on maximizing amount of work by an application in a specific period of time
			1. Examples of how throughput might be measured include
				1. number of transactions completed in a given time
				2. number of jobs that a batch program can complete in an hour
				3. number of database queries that can be completed in an hour
		2. High pause times are acceptable for apps that focus on throughput.
			1. High throughput apps focus on benchmarks over longer periods of time
			2. Quick response time is not a consideration
8. Garbage Collectors
	1. **Serial collector**
		1. Usually used for small heap
		2. It is a basic gc that runs in single thread (mark, sweep and compacting is done at once)
		3. It can be used for basic application
	2. **Concurrent collector**
		1. Has thread that performs GC along with app execution
			1. Thread runs along with application
		2. It does not wait for old generation to be full (no stop the world during this phase)
		3. Stops the world only during mark/ re-mark
			1. Sweeping and compacting happens in parallel to the application execution
	3. **Parallel collector**
		1. Uses multiple CPUs to perform GC
		2. Multiple threads doing mark/ sweep etc
		3. Does not kick in until heap is full/ near-full
			1. Does not run concurrently with the application
		4. Stops-the-world when it runs
9. Concurrent collector (CMS) when
	1. There is more memory (?)
	2. There is high number of CPUs (concurrency should be supported)
	3. **Application demands short pauses**
		1. Responsiveness
			1. Low latency collector (for most of web apps, financial apps)
10. Parallel collector when
	1. Less memory (?)
	2. Lesser number of CPUs (?)
	3. **Application demands high throughput and can withstand pauses**
11. **G1 garbage collector (Garbage - first)** - [Oracle Docs](https://www.oracle.com/technetwork/tutorials/tutorials-1876574.html)
	1. Latest entry in to GC scene (officially available in 1.7 u4)
	2. It straddles young-tenured generation boundary as it divides heap into different regions and during a GC it can collect a sub-set of regions. It dynamically selects a set of regions to act as young generation in next gc cycle. Regions with most garbage (unreachable) will be collected first
	3. Features
		1. More predictable (tunable) GC pauses
		2. Low pauses with fragmentation
		3. Parallelism and concurrency together
		4. Better heap utilization
	4. GC divides heap into small regions
		1. Each region can be eden space, survivor space or tenured space
		2. Which ever region has more garbage, that region gets collected first (that is why G1)
		3. It is concurrent and parallel
		4. It works on small regions
			1. Minimal amount of pauses OR
			2. Sticks to what we want the pause to be
12. Types
	
		-->|   |-->|   |-->
		-->|-->|-->|-->|-->
		-->|   |-->|   |-->
		    gc      gc
		    
		Serial GC
		
		-->|-->|-->|-->|-->
		-->|-->|-->|-->|-->
		-->|-->|-->|-->|-->
		    gc      gc
		    
		Parallel gc
		
		-->|  |-->|->|-->
		-->|->|-->|->|-->
		-->|  |-->|->|--> concurrent sweep
		      |-->|  |-->
		      |-->|  |-->
		   mark   remark
		   
		[e][ ][ ][o][e]
		[o][e][s][ ][ ]
		[ ][s][ ][e][ ]
		[e][ ][e][ ][ ]
		[ ][e][ ][e][ ]
		
		     G1
		     
13. Selecting GC
	1. Options
		1. `-XX:+UseSerialGC` - Single threaded gc on young and old generation. To be used only on small heaps
		2. `-XX:+UseParallelGC` - Young generation uses parallel GC, Old generation uses single-threaded GC (?)
		3. `-XX:+UseParallelOldGC` - Both young and old generations have multi-threaded GC
		4. `-XX:+UseParNewGC` - Multi-threaded young generation garbage collector (only young)
		5. `-XX:+UseConcMarkSweepGC` - Enables concurrent collector. Autoenables ParNewGC by default (old generation but ParNewGC is enabled)
		6. `-XX:+UseG1GC` - Use G1
	2. Defaults: 1.6 - Parallel, 1.7 G1
14. **finalizer** - protected void finalize() throws Throwable
	1. The method gets called while an object is garbage collected
		1. Don't use it for DB connections etc...
		2. There is no guarantee on when gc happens
			1. When resources will be freed is not predictable (it could be required by something else and it might be held unnecessarily)
	2. If an object is resurrected during garbage collection
	
			this = new Instance();
			
		1. Object is re-created - not gcd
		2. finalize() method is called only once
15. Tune the Heap
	1. `-Xmsvalue` - min amount of heap allocated to program
	2. `-Xmxvalue` - max amount of heap allocated to program (def: 256m)
	3. `-XX:NewRatio=ratio` (2 means 1/3 Y + 2/3 T)
	4. `-XX:NewSize=size` (size for eden space)
	5. `-XX:MaxNewSize=size` (max size for eden space)
	6. `-XX:PermSize` (permgen size - metadata, static objects)
	7. `-XX:MaxPermSize` (permgen max size)
16. GC Logging
	1. Switches
	
			-verbose:gc
			-XX:+PrintGCDetails
			-Xloggc:gc.log
			
		1. Very useful if gc is the suspect. Use graphical tool to analyze the logs
		2. **Garbage collection log analyzer from IBM** - eclipse plugin
			1. Warnings
			2. Graphs
			3. ...
		3. `jvisualvm` with visual gc plugin - free tool that comes with
			1. **VisualGC** - plugin
		4. Not a good idea to click buttons and cause gc
			1. Better approach
				1. JHAT - Java Heap Analyzer Tool
					1. View of heap - can be used to decide what to do
		5. **Terracotta Big Memory** ([https://www.terracotta.org/](https://www.terracotta.org/)) - Ehcache
			1. Objects are managed outside the realm of heap
				1. Objects are moved outside the heap (gc does not take much time)
			2. Other tools that manage heap from outside

## Q & A ##
1. What if **to** survivor space becomes full?

	1. [https://stackoverflow.com/questions/14436183/ps-survivor-space-almost-full](https://stackoverflow.com/questions/14436183/ps-survivor-space-almost-full)
			
			Note: If the To space becomes full, the live objects from Eden or From that have not been copied to it are tenured, regardless of how many young generation collections they have survived. Any objects remaining in Eden or the From space after live objects have been copied are, by definition, not live, and they do not need to be examined.
			
		1. [Hotspot Memory Management Whitepaper](https://www.oracle.com/technetwork/java/javase/tech/memorymanagement-whitepaper-1-150020.pdf)