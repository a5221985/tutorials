# Java Multithreading, Concurrency & Performance Optimization #
## Introduction ##
### Motivation & Operating Systems Fundamentals - Part 1 ###
1. Motivation - Concurrency and Parellelism
2. What threads are - Introuction to OS
3. Why we need Threads?
	1. Responsiveness
		1. Example: Waiting for customer support
			1. Late response from a person
			2. No feedback from an application
		2. We want to avoid this frustration to users
		3. Example: Online store web application
			1. Suppose a user has made a request to the application and database operation is taking a long time
			2. Second user tries to send request to the application but the application is busy and the request will not be served (might wait or fail)
		4. Solution: Multiple requests can be served simultaneously by serving each request in a separate thread
		5. Responsiveness is particularly critical in applications with a User Interface
			1. Move player - showing images, playing movie, moving mouse gives instant feedback
				1. Can be achieved by using multiple threads, with a separate thread for each task
					1. Otherwise generally very hard to achieve
			2. Achieved by multi-tasking between threads
				1. Done quickly by the OS - to give illusion that all the tasks are executing simultaneously
		6. **Concurrency = Multitasking**
			1. Note: We don't need multiple cores to achieve concurrency
				1. Can also be achieved with single core
	2. Performance - parallelism
		1. With single core: An illusion of multiple tasks executing in parallel can be created using just a single core
		2. With multiple cores we can truly run tasks completely in parallel
		3. Impact: Completing a complex task much faster
		4. Finish more work in the same period of time
		5. For high scale service -
			1. Fewer machines
			2. Less money spent on hardware
			3. More money in your pocket
	3. Caveat
		1. Multithreaded programming is fundamentally different from single threaded programming
			1. Intuition that we have with single thread might break when using multiple threads
				1. Solution: The course will lay the groundwork, and learn all the tools to become a successful multithreaded programming developer
					1. We can write highly performant and responsive applications
4. What threads are - Introduction to OS
	1. OS - loaded from disk into memory
		1. It takes over and provides an abstraction layer for us and helps us interact with hardware and CPU (focus is shifted to developing apps instead of managing hardware resources)
		2. application stays on disk first
			1. OS takes program and an instance of the program is created in memory (the instance is called a process or context)
				1. Each process is completely isolated from other processes in the system
				2. A process consists of metadata
					1. PID
					2. Files opened for reading and writing
					3. Program instructions
					4. Heap
					5. Main thread
						1. Contains
							1. Stack
							2. Instruction pointer
		3. In a multithreaded application, each thread comes with its own stack and ip
			1. All rest of the components in the process are shared by all threads
			2. Stack - it is a region of memory, where local variables are stored, and passed into functions
			3. Instruction pointer - Address of the next instruction to execute
		4. Each thread is executing a different instruction in same or different function in any given moment
			1. Hence separate instruction pointer
			2. Hence separate call stack (for function local variables and return addresses)
5. Summary
	1. Motivation for multithreading
		1. Responsiveness achieved by concurrency
		2. Performnance achieved by parallelism
	2. Threads are and what they contain
		1. Stack
		2. Instruction pointer
	3. What threads share
		1. Files
		2. Heap
		3. Code

### Operating Systems Fundamentals - Part 2 ###
1. What we learn in this lecture
	1. Context switch
		1. Each process may have one or more threads
			1. The threads are competing to get executed on the CPU (there are way more threads than the cores)
				1. OS needs to run a thread, stop it, run another thread, stop it, ...
		2. Context switch: The process of
			1. Stop thread 1
			2. Schedule thread 1 out
			3. Scheudle thread 2 in
			4. Start thread 2
			5. ...
		3. Context switch cost
			1. Context switch is not cheap, and is the price of multitasking (concurrency)
			2. Same as we humans when we multitask - takes time to focus
				1. We are not productive during the time we are interrupted and we need to switch to another task
					1. Each thread consumes resources in the CPU and memory (kernel resources)
						1. Tasks to perform during context switch
							1. Store data for one thread
							2. Restore data for another thread
		4. Key takeaways
			1. Too many threads - Thrashing, spending more time in management than real productive work (running our tasks)
			2. Threads consume less resources than processes
				1. They share a lot of resources among themselves
					1. Context switches between threads from the same process is cheaper than context switches between different processes
	2. Thread scheduling
		1. Example: Doing homework in text editor, listening to music
			1. Music player - has two threads
				1. Music - loading and playing through speakers
				2. User Interface - responds to user input (mouse clicks, keyboard buttons)
			2. Text Editor - has two threads
				1. File Saver - saves file every two seconds
				2. User Interface
		2. Suppose there is one core and 4 threads we need to decide how to schedule on the core
			1. Who runs first?
				1. Say: FCFS (fair)
					1. File Saver, Text Editor UI, Music Player, Music Player UI
						1. Problem - Long thread can cause starvation (if long thread arrived first, it will cause starvation to other threads)
							1. May cause User Interface threads being unresponsive - Bad User experience (if the UI thread is starving)
				2. Observation - UI threads are typically shorter (they just respond to a user input and update screen)
					1. Shortest Job First
						1. Problem - If many user related tasks coming all the time, we will keep scheduling only them and longer tasks may not get executed
				3. OS looks for a tradeoff
					1. OS divides time into moderately sized pieces called epocs
						1. In each epoc - OS allocates different time-slice for each thread
							1. Not all threads complete in a given epoc
					2. How to allocate time slice?
						1. Dynamic priority is calculated
						
								Dynamic Priority = Static Priority + Bonus (bonus can be negative) # for each thread
								
							1. Static Priority is set by the developer programmatically
							2. **Bonus** is adjusted by the Operating System in every epoch, for each thread
								1. If certain threads need more immediate attension, they get higher **Bonus** value
								2. Or OS will give preference to threads that did not complete in the last epochs, or did not get enough time to run - preventing starvation
	3. Threads vs Processes
		1. Multiple threads
			1. Prefer if the tasks share a lot of data
			2. Threads are much faster to instantiate and destroy
			3. Switching between threads of the same process is faster (shorter context switches)
		2. Multi-Process Architecture
			1. Security and stability (?) are of higher importance
				1. They are completely isolated from each other
				2. Unlike multiple threads where a single faulty thread can bring down the entire application (a faulty process does not bring down the entire application with multiple processes)
			2. Tasks are unrelated to each other
2. Summary
	1. Context Switches, and their impact on performance (thrashing)
	2. How thread scheduling works in the Operating System
	3. When to prefer Multithreaded over Multi-Processes architecture

## Threading Fundamentals - Thread Creation ##
### Threads Creation - Part 1, Thread Capabilities & De	bugging ###
1. What we learn in this lecture
	1. Thread creation with `java.lang.Runnable`
	2. `Thread` class capabilities
	3. Thread Debugging
2. Simple java project
	1. All threads related properties and methods are encapsulated in `Thread` class by JDK

			Thread thread = new Thread(); // It is empty by default
			
			Thread thread = new Thread (new Runnable () {
				@Override
				public void run() {
					// Code that we will run in a new thread - it is scheduled by OS
					
				}
			}); // lambda can be used
			
			System.out.println("We are in thread: " + Thread.currentThread().getName() + " before starting a new thread");
			thread.start(); // instructs JVM to construct a new thread and pass it to the OS
			System.out.println("We are in thread: " + Thread.currentThread().getName() + " after starting a new thread");
			
			Thread.sleep(10000); // it does not spin in a loop. It only instructs OS to not schedule the thread until that time passes (doesn't consume any CPU)
			
		1. Main thread is `main`
		2. New thread takes time (for scheduling by OS)
3. `Thread` class capabilities
	1. 

### Threads Creation - Part 2, Thread Inheritance ###
### Quiz 2: Thread Creation ###
### Coding Exercise 1: Thread Creation - MultExecutor ###
### Thread Creation - MultiExecutor Solution ###

## Threading Fundamentals - Thread Coordination ##
### Thread Termination & Daeomon Threads ###
### Quiz 3: Thread Termination & Daemon Threads ###
### Joining Threads ###
### Coding Exercise 2: Multithreaded Calculation ###
### Multithreaded Calculation - Solution ###

## Performance Optimization ##
### Introduction to Performance & Optimizing for Latency - Part 1 ###
### Optimizing for Latency Part 2 - Image Processing ###
### Optimizing for Throughput Part 1 ###
### Optimizing for Throughput Part 2 - HTTP Server + JMeter ###
### Quiz 4: Performance Optimization ###

## Data Sharing Between Threads ##
### Stack & Heap Memory Regions ###
### Quiz 5: Stack & Heap Memory Regions ###
### Resource Sharing & Introduction to Critical Sections ###

## The Concurrency Challenges & Solutions ##
### Critical Section & Synchronization ###
### Quiz 6: Critical Section & Synchronization ###
### Atomic Operations, Volatile & Metrics Practical Example ###
### Quiz 7: Atomic Operations, Volatile & Metrics Practical Example ###
### Coding Exercise 3: Min - Max Metrics ###
### Race Conditions & Data Races ###
### Quiz 8: Data Races ###
### Locking Strategies & Deadlocks ###
### Quiz 9: Locking Strategies & Deadlocks ###

## Advanced Locking ##
### ReentrantLock Part 1 - tryLock and interruptible Lock ###
### ReentrantLock Part 2 - User Interface Application Example ###
### Quiz 10 - ReentrantLock ###
### Reentrant Read Write Lock & Database Implementation ###
### Quiz 11 - Read-Write Locks ###
### Coding Exercise 4: Product Reviews Service ###
### Product Reviews Service - Solution ###

## Inter-Thread Communication ##
### Semaphore - Scalable Producer Consumer Implementation ###
### Quiz 12: Semaphores - Barrier ###
### Condition Variables - All purpose, Inter-Thread Communication ###
### Objects as Condition Variables - wait(), notify(), and notifyAll() ###
### Quiz 13: Condition Variables ###

## Lock-Free Algorithms, Data-Structures & Techniques ##
### Introduction to Non-Blocking, Lock Free Operations ###
### Atomic Integers & Lock Free E-Commerce ###
### Quiz 14: Lock-Free Algorithms, Data-Structures & Techniques ###
### Atomic References, Compare And Set, Lock-Free High Performance Data Structure ###

## Beyond Multithreading - Final Lecture ##
### Distributed Systems, Big Data & Performance ###
### Bonus Material - Courses Links and Coupons ###