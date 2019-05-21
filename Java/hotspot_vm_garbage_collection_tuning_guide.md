# HotSpot Virtual Machine Garbage Collection Tuning Guide #
## Title and Copyright Information ##

## Preface ##
1. The guide describes garbage collection methods included in Java HotSpot VM and helps determine which one is best for our needs

### Audience ###
1. Users of HotSpot VM
2. App developers of HotSpot VM
3. Sys Admins of HotSpot VM
4. Who wants to understand HotSpot VM garbage collectors
	1. Doc has analysis and solutions for common problems with GC to make app meet user's requirements

### Documentation Accessibility ###
### Related Documents ###
1. Garbage Collection: Algorithms for Automatic Dynamic Memory Management. Wiley, Chichster, July 1996. With a chapter on Distributed Garbage Collection by R. Lins. Richard Jones, Anony Hosking, and Elliot Moss.
2. The Garbage Collection Handbook: The Art of Automatic Memory Management. CRC Applied Algorithms and Data Structures. Chapman & Hall, January 2012

### Conventions ###

## Introduction to Garbage Collection Tuning ##
1. Small applets to web services on large servers use Java Platform SE
2. Java HotSpot VM provides multiple garbage collectors
	1. Each satisfies different requirements
	2. Java SE selects most appropriate garbage collector based on class of computer on which the app is run
		1. The selection may not be optimal for every app (in the platform)
	3. If we have strict performance goals/ other requirements may need to explicitly select the GC and tune certain parameters to achieve desired level of performance
3. Serial stop-the-world collector:
	1. General features
	2. Basic tuning options
4. Other collectors
	1. Specific features
5. Factors to select a collector

### What is Garbage Collector? ###
1. GC automatically manages the application's dynamic memory allocation requests
	1. Automatic dynamic memory management is performed through the following
		1. Allocates from and gives back memory to OS
		2. Hands out memory to app as it requests it
		3. Determines which parts of the memory is still in use by app
		4. Reclaims unused memory for reuse by app
2. GC employ various techniques to improve efficiency of the operations
	1. Generational scavenging in conjunction with aging to concentrate efforts on areas in heap that most likely contain lot of reclaimable memory areas
	2. Multiple threads to aggressively make operations parallel, or perform some long-running operations in background concurrent to app
	3. Try to recover larger contiguous free memory by compacting live objects

### Why Does the Choice of Garbage Collector Matter? ###
1. Purpose of GC: free app developer from manual dynamic memory management
	1. Developer doesn't have to match allocations with de-allocations
	2. Developer doesn't have to take care of the lifetimes of allocated dynamic memory
2. Advantages:
	1. Eliminates some classes of errors
3. Dis-advantages:
	1. Additional runtime overhead
4. When does choice of garbage collector matter?
	1. Some apps: Never
		1. garbage collection with pauses of modest frequency and duration is fine
	2. Many apps with large data (multiple gigabytes) and many threads and high transaction rates
		1. Choice of GC matters
5. Amdahl's law:
	1. Parallel speedup in a given problem is limited by the sequential portion of the problem
		1. Most workloads cant be perfectly parallelized (some portion is always sequential and doesn't benefit from parallelism)
	2. 4 alternative GCs exist
		1. Except for serial GC, all others parallelize work to improve performance
6. Negligible issues when developing on small systems may become principal bottlenecks when scaling up to large systems
	1. Small improvements in reducing bottlenecks can produce large gains in performance
		1. For large systems, select GC and tune it
	2. Serial collector is adequate for small apps
		1. Heaps of upto 100 MB on modern processors
	3. Other GCs has additional overhead or complexity (price for specialized behavior)
		1. Serial GC is not a good choice if
			1. Large, heavily threaed + large memory + two or more processors
		2. Garbage-First (G1) is selected by JVM when apps are run on such server-class machines

### Supported Operating Systems in Documentation ###
1. Applies to JDK 12

## Ergonomics ##
1. It is the process by which JVM and GC heuristics, (behaviour-based heuristics) improve app performance
2. JVM provides platform-dependent default selections for GC, heap size, runtime compiler
	1. They match different types of apps
		1. Less commandline tuning
	2. Behavior-based tuning dynamically optimizes size of heap to meet specific behavior of app

### Garbage Collector, Heap, and Runtime Compiler Default Selections ###
1. Following are GC, heap size and runtime compiler default selections
	1. Garbage-First (G1) collector
	2. Max number of GC threads is limited by heap size and available CPU resources
	3. Initial heap size of 1/64 of physical memory
	4. Tiered compiler, using C1 and C2

### Behavior-Based Tuning ###
1. HotSpot VM GC can be configured to preferentially meet one of two goals
	1. max pause time and app throughput
		1. If preferred goal is met, collectors will try to maximize the other
			1. May not be met always (apps required minimum heap to hold at-least live data)
				1. preclude: prevent from happening; make impossible
				2. Other config may preclude from reaching some or all of desired goal

#### Maximum Pause-Time Goal ####
1. *pause time*: duration during which GC stops app and recovers space no longer in use
	1. `maximum pause-time` goal - to limit the longest of the pauses
		1. GC maintains
			1. Average time for pauses
				1. Taken from start of execution
				2. Weighted: More recent pauses count more heavily
			2. Variance on the average
		2. If average + variance of pause-time > maximum pause-time goal
			1. GC considers goal is not met
		3. Specified using
	
				XX:MaxGCPauseMillis=<nnn>
	
			1. It is a hint to GC that pause-time of <nnn> milliseconds or fewer is desired
				1. GC adjusts heap size and other parameters related to GC in an attempt to keep GC pauses shorter than <nnn> milliseconds
			2. Default value: Varies by GC
		4. Cons:
			1. May cause GC to occur more frequently (reduces throughput of app)
			2. In some cases may to be met

#### Throughput Goal ####
1. It is in terms of time spent collecting garbage
	1. Time spent outside GC is application time
	2. Specified as:

			-XX:GCTimeRatio=nnn

		1. Ratio of GC time to application time is 1/(1 + nnn)
		2. Example: `XX:GCTimeRatio=19` - 1/20 or 5% of total time for garbage collection
		3. Time spent on GC is total time for GC induced pauses
			1. If goal is not met, GC can increase size of heap so that time spent in app between collection pauses can be longer

#### Footprint ####
1. If the above 2 are met, GC reduces size of heap until one of the goals (invariably throughput goal) can't be met
	1. `-Xms=<nnn>` and `-Xmx=<mmm>`
		1. Min and max heap sizes that the GC can use

### Tuning Strategy ###
1. Heap size grows or shrinks to a size that supports throughput goal
	1. Strategies
		1. Maximum heap size
		2. Maximum pause-time goal
	2. Don't choose max value for heap (unless we know that app needs more heap than default max heap size)
		1. Choose throughput goal sufficient for the app
2. Change in app behavior can cause heap to grow or shrink
	1. If app starts allocating at a higher rate, heap grows to maintain same throughput
		1. If heap grows to max size and throughput goal isn't met, **max heap size is too small for throughput goal**
			1. Solution: **Set max heap size to a value close to physical memory (but should not cause swapping of the app)**
		2. Execute app again
			1. If the throughput goal isn't met, then
				1. goal for app time is too high for available memory
3. If throughput goal can be met, but pauses are too long, then
	1. select maximum pause-time goal
		1. throughput goal may not be met
		2. Choose values that are acceptable compromise for the app
4. Size of heap may oscillate
	1. GC tries to satisfy competing goals (even if app has reached steady state)
		1. Pressure to achieve throughput goal (may require larger heap size) competes with goals for maximum pause-time and minimum footprint (both may require small heap)

## Garbage Collector Implementation ##
1. Java SE shields developer from complexity of memory allocation and garbage collection
	1. Developer needs to understand some aspects of the implementation (since it is a bottleneck)
2. GC assumes how apps use objects
	1. Reflected in tunable parameters

### Generational Garbage Collection ###
1. Garbage:
	1. Object is garbage (it's memory can be reused by VM) if it can no longer be reached from any reference of any other live object in running program
2. Theoretical simple gc:
	1. iterates over every reachable object
	2. Left over objects are garbage
		1. Time taken is proportional to number of live objects
			1. This is not acceptable for large applications with lots of live data
3. HotSpot VM incorporates different GC algorithms which use a technique called **generational collection**
	1. Exploits emprically observed properties of most apps to minimize work required to reclaim unused (garbage) objects
		1. **weak generational hypothesis**: one property
			1. Most objects survive only a short period of time
				1. `Iterator` object lives only during the loop
				2. Certain objects come alive when app is initialized and live until VM exits
			2. Majority of applications have this property
				1. Efficient collection is focussing on the fact that majority of objects "die young"

### Generations ###
1. To optimize the scenario, memory is managed in **generations** (memory pools holding objects of different ages)
	1. GC occurs in each generation when the generation fills up
		1. Vast majority of objects are allocated in a pool dedicated to young objects (the **young generation**)
			1. Most object die in this pool
		2. When young generation fills up, it causes **minor collection** where only young generation is collected
			1. Garbage in other generations is not reclaimed
	2. Young generation full of dead objects is collected very quickly
	3. During each minor collection, a fraction of surviving objects from young generation are moved to the **old generation**
	4. Eventually **old generation** fills up and must be collected
		1. This results in **major collection**: entire heap is collected
			1. This cycle lasts much longer (more objects are involved)
2. Default arrangement of generations in serial collector:

		![jsgct_dt_001_armgnt_gn_new](jsgct_dt_001_armgnt_gn_new)

	1. Young
		1. Eden
		2. Survivor
		3. Survivor
		4. Virtual
	2. Old
		1. ...
		2. Virtual

### Performance Considerations ###
### Throughput and Footprint Measurement ###

## Factors Affecting Garbage Collection Performance ##
### Total Heap ###
#### Heap Options Affecting Generation Size ####
#### Conserving Dynamic Footprint by Minimizing Java Heap Size ####

### The Young Generation ###
#### Young Generation Size Options ####
#### Survivor Space Sizing ####

## Available Collectors ##
### Serial Collector ###
### Parallel Collector ###
### The Mostly Concurrent Collectors ###
### The Z Garbage Collector ###
### Selecting a Collector ###

## The Parallel Collector ##
### Number of Parallel Collector Garbage Collector Threads ###
### Arrangement of Generations in Parallel Collectors ###

## Parallel Collector Ergonomics ##
### Excessive Parallel Collector Time and OutOfMemoryError ###
### Parallel Collector Measurements ###

## The Mostly Concurrent Collectors ##
### Overhead of Mostly Concurrent Collectors ###

## Concurrent Mark Sweep (CMS) Collector ##
### Concurrent Mark Sweep Collector Performance and Structure ###
### Concurrent Mode Failure ###
### Excessive GC Time and OutOfMemoryError ###
### Concurrent Mark Sweep Collector and Floating Garbage ###
### Concurrent Mark Sweep Collector Pauses ###
### Concurrent Mark Sweep Collector Concurrent Phases ###
### Starting a Concurrent Collection Cycle ###
### Scheduling Pauses ###
### Concurrent Mark Sweep Collector Measurements ###

## Garbage-First Garbage Collector ##
### Introduction to Garbage-First Garbage Collector ###
### Enabling G1 ###
### Basic Concepts ###
#### Heap Layout ####
#### Garbage Collection Cycle ####
#### Garbage Collection Pauses and Collection Set ####

### Garbage-First Internals ###
#### Java Heap Sizing ####
##### Young-Only Phase Generation Sizing #####
##### Space-Reclamation Phase Generation Sizing #####

#### Periodic Garbage Collections ####
#### Determining Initiating Heap Occupancy ####
#### Marking ####
#### Behavior in Very Tight Heap Situations ####
#### Humongous Objects ####

### Ergonomic Defaults for G1 GC ###
### Comparison to Other Collectors ###

## Garbage-First Garbage Collector Tuning ##
### General Recommendations for G1 ###
### Moving to G1 from Other Collectors ###
### Improving G1 Performance ###
#### Observing Full Garbage Collections ####
#### Humongous Object Fragmentation ####
#### Tuning for Latency ####
##### Unusual System or Real-Time Usage #####
##### Reference Object Processing Takes Too Long #####
##### Young-Only Collections Within the Young-Only Phase Take Too Long #####
##### Mixing Collections Take Too Long #####
##### High Update RS and Scan RS Times #####

#### Tuning for Throughput ####
#### Tuning for Heap Size ####
#### Tunable Defaults ####

### The Z Garbage Collector ###
#### Setting the Heap Size ####
#### Setting Number of Concurrent GC Threads ####

### Other Considerations ###
#### Finalization and Weak, Soft, and Phantom References ####
#### Explicit Garbage Collection ####
#### Soft References ####
#### Class Metadata ####
