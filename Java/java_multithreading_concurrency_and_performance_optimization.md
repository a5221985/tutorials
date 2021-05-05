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
	1. Give a name to thread

			thread.setName("New Worker Thread");
			
	2. We can set static priority for a thread programmatically

			thread.setPriority(Thread.MAX_PRIORITY); 
			
		1. For large programs that need better response time, this will play a major role
4. Debugging
	1. Put breakpoints
		1. Threads tab
			1. stack traces
	2. **When we hit a breakpoint, all threads freeze** (to check each thread individually)
	3. Catching unchecked exception

				...
				throw new RuntimeException("Intentional Exception");
				...

			thread.setUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() {
				@Override
				public void uncaughtException(Thread t, Throwable b) {
					System.out.println("A critical error happened in thread " + t.getName() + " the error is " + e.getMessage());
				}
			});
			
		1. If an uncaught exception gets thrown in any of the threads spawned from main thread will be caught by the handler
		2. Purpose: To clean up some of the resources or log additional data to enable us troubleshoot any issues after the fact
	 
### Threads Creation - Part 2, Thread Inheritance ###
1. What we learn in this lecture:
	1. Thread creation with java.lang.Thread
	2. Case study - interactive mutithreaded application
2. Using `Runnable` is easier and faster to code
3. Extending `Thread` class (it implements `Runnable` interface)

		public static void main(String[] args) {
			Thread thread = new NewThread();
			thread.start();
		}

		private static class NewThread extends Thread {
		
			@Override
			public void run() {
				System.out.println("Hello from " + Thread.currentThread().getName());
			}
			
		}	
		
	1. We get access to methods that are directly related to the thread

			System.out.println("Hello from " + this.getName());
			
4. Case study
	1. Example: Consider a vault where money is stored and it is locked
		1. We want to know how long it might take to guess the code and take the money (for hackers)
			1. Hackers - Brute force (threads)
			2. Police (thread) - counts upto 10 seconds and if hackers were not able to break the vault, the police will arrest them
				1. Police shows us progress of it's arrival on screen
	2. Implementation: 

			public class Main {
				public static void main(String[] args) {
					Random random = new Random();
					
					Vault vault = new Vault(random.nextInt(MAX_PASSWORD));
					
					List<Thread> threads = new ArrayList<>();
					
					threads.add(new AscendingHackerThread(vault));
					threads.add(new DescendingHackerThread(vault));
					threads.add(new PoliceThread());
					
					for (Thread thread : threads) {
						thread.start();
					}
				}
				
				private static class Vault {
					private int password;
					public Vault(int password) {
						this.password = password;
					}
					
					public boolean isCorrectPassword(int guess) {
						try {
							Thread.sleep(5);
						} catch (InterruptedException e) {
						
						}
						return this.password == guess;
					}
				}
				
				private static abstract class HackerThread extends Thread {
					protected Vault vault;
					
					public HackerThread(Vault vault) {
						this.vault = vault;
						this.setName(this.getClass().getSimpleName());
						this.setPriority(Thread.MAX_PRIORITY);
					}
					
					@Override
					public void start() {
						System.out.println("Staring thread " + this.getName());
						super.start();
					}
				}
				
				private static class AscendingHackerThread extends HackerThread {
					public AsendingHackerThread(Vault vault) {
						super(vault);
					}
					
					@Override
					public void run() {
						for (int guess = 0; guess < MAX_PASSWORD; guess++) {
							if (vault.isCorrectPassword(guess)) {
								System.out.println(this.getName() + " guessed the password " + guess);
								System.exit(0);
							}
						}
					}	
				}
				
				private static class DescendingHanderThread extends HackerThread {
					public AsendingHackerThread(Vault vault) {
						super(vault);
					}
					
					@Override
					public void run() {
						for (int guess = MAX_PASSWORD; guess >= 0; guess--) {
							if (vault.isCorrectPassword(guess)) {
								System.out.println(this.getName() + " guessed the password " + guess);
								System.exit(0);
							}
						}
					}
				}
				
				private static class DescendingHanderThread extends HackerThread {
					public AsendingHackerThread(Vault vault) {
						super(vault);
					}
					
					@Override
					public void run() {
						for (int i = 10; i >= 0; i--) {
							try {
								Thread.sleep(1000);
							} catch (InterruptedException e) {
							
							}
							System.out.println(i);
						}
						
						System.out.println("Game over for you hackers");
						System.exit(0);
					}
				}
			}
			
		1. Diagram

			![multithreading_example.png](multithreading_example.png)
			
1. Summary:
	1. `Thread` class - Encapsulates all thread related functionality
	2. Two ways to run code on a new thread
		1. Implement `Runnable` interface, and pass to a new `Thread` object
		2. Extend `Thread` class, and construct an object of that class
	3. Both ways are equally correct (our preference)

### Coding Exercise 1: Thread Creation - MultiExecutor ###

		public MultiExecutor(List<Runnable> tasks) {
        	// Complete your code here
        	for (Runnable task : tasks)
          	new Thread(task).start();
    	}

### Thread Creation - MultiExecutor Solution ###

		import java.util.ArrayList;
		import java.util.List;
		 
		public class MultiExecutor {
		    
		    private final List<Runnable> tasks;
		 
		    /*
		     * @param tasks to executed concurrently
		     */
		    public MultiExecutor(List<Runnable> tasks) {
		        this.tasks = tasks;
		    }
		 
		    /**
		     * Executes all the tasks concurrently
		     */
		    public void executeAll() {
		        List<Thread> threads = new ArrayList<>(tasks.size());
		        
		        for (Runnable task : tasks) {
		            Thread thread = new Thread(task);
		            threads.add(thread);
		        }
		        
		        for(Thread thread : threads) {
		            thread.start();
		        }
		    }
		}

## Threading Fundamentals - Thread Coordination ##
### Thread Termination & Daeomon Threads ###
1. What we learn in this lecture
	1. Thread termination (from one thread to another thread)
	2. Thread.interrupt()
	3. Daemon threads
2. Why and When we want to terminate a thread?
	1. Threads consume resources (even when thread is not doing anything)
		1. Memory and kernel resources
		2. CPU cycles and cache memory
	2. If thread finished its work, but application is still running
		1. We want to clean up thread's resources (which are being consumed by finished thread)
	3. If a thread is misbehaving, we want to stop it
		1. It might be sending requests to servers (which is not responding)
	4. By default, application will not stop as long as at least one thread is still running
		1. Even if main thread stopped running
			1. We want the ability to stop all threads gracefully before closing the application
3. `Thread.interrupt()` - Each thread object has a method called interrupt
	1. Thread A - `threadB.interrupt()` -> Thread B
		1. Sending interrupt signal to Thread B in an attempt to interrupt thread B
4. When can we interrupt a thread?
	1. If thread is executing a method that throws an `InterruptedException`
	2. If thread's code is handling the interrupt signal explicitly
5. Example:

		package thread.interrupt;
		
		public class Main {
			public static void main(String[] args) {
				Thread thread = new Thread(new BlockingTask());
				
				thread.start();
				
				thread.interrupt(); // interrupted exception gets thrown
			}
			
			private static class Blocking implements Runnable {
				@Override
				public void run() {
					try {
						Thread.sleep(500000);
					} catch (InterruptedException e) {
						System.out.println("Exiting blocking thread");
					}
				}
			}
		}
		
6. Example:

		public class Main {
			public static void main(String[] args) {
				Thread thread = new Thread(new LongComputationTask(new BigInteger("200000"), new BigInteger("10000000000"));

				thread.start(); // calculation will take a very long time

				thread.interrupt(); // The thread does not have any logic to handle this interrupt
			}
			
			private static class LongComputationTask implements Runnable {
				private BigInteger base;
				private BigInteger power;
				
				public LongComputationTask(BigInteger base, BigInteger power) {
					this.base = base;
					this.power = power;
				}
				
				@Override
				public void run() {
					System.out.println(base + "^" + power + " = " + pow(base, power));
				}
				
				private BigInteger pow(BigInteger base, BigInteger power) {
					BigInteger result = BigInteger.ONE;
					
					for (BigInteger i = BitInteger.ZERO; i.compareTo(power) != 0; i = i.add(BigInteger.ONE)) {
						if (Thread.currentThread().isInterrupted()) {
							System.out.println("Prematurely interrupted computation");
							return BitInteger.ZERO;
						}
						result = result.multiply(base);
					}
					
					return result;
				}
			}
		}
		
	1. Find hotspot
		1. In each iteration, check if current thread has got interrupted from the outside world
7. Daemon Threads
	1. Background threads that do not prevent the application from existing if the main thread terminates
	2. Scenario 1:
		1. Background tasks (not the main focus of the application)
			1. That should not block our application from terminating
		2. Example: File saving thread in a Text Editor (every few minutes)
			1. We don't want to wait for this thread to finish
	3. Scenario 2:
		1. Code in a worker thread is not under our control, and we do not want it to block our application from terminating
		2. Example: Worker thread that uses an external library (that might not handle interrupt signal)

				
				thread.setDaemon(true);
				// ...

				for (BigInteger i = BitInteger.ZERO; i.compareTo(power) != 0; i = i.add(BigInteger.ONE)) {
					result = result.multiply(base);
				}
				
			1. Even if main thread ends, the entire app is allowed to terminate
8. Summary:
	1. Learned how to stop threads by calling `thread.interrupt()`
	2. If method does not respond to interrupt signal by throwing `InterruptedException`, we need to check for that signal and handle it ourselves
	3. To prevent thread from blocking our app from exiting
		1. We set thread to be a daemon thread

### Quiz 3: Thread Termination & Daemon Threads ###
### Joining Threads ###
1. What we learn in the lecture
	1. Threads coordination with `Thread.join()`
	2. Case study
2. How to guarantee that the thread upon which we depend completes its work by the time we expected
	1. For full control over tasks (to run in parallel)
		1. We also want to safely and correctly aggregate results
3. Different threads run independently (of each other by default)
4. Order of execution is out of our control
	1. Example: ThreadA finishes before Thread B or other way, they might run concurrently or in parallel
5. Thread coordination - Dependency
	1. What if one thread depends on another thread?
	
			Thread A
				| Output
				|
				| Input
				v
			Thread B
			
		1. How will Thread B know that Thread A has finished computing the output (and is not accessing an intermediate or partial result)?
			1. Naive solution:
				1. Thread B runs in a loop and keeps checking if Thread A' result is ready

						void waitForThreadA() {
							while (!threadA.isFinished()) {
								// burn CPU cycles
							}
						}
						
					1. Busy wait
						1. Inefficient and wasteful

								Thread B | Thread A  | Thread B | Thread A
								Check      doing work  Check      doing work
								  ^
								  |
								  waste
								  
						2. Better solution: Thread B checks and goes to sleep (get out of the way completely), Thread A finishes work, then Thread B will wake up using the results computed by Thread A
							1. Implementation: `Thread.join()`
								1. `public final void join()`
								2. `public final void join(long millis, int nanos)`
								3. `public final void join(long millis)`
6. Example: Factorial calculation (CPU intensive task)

		public static class FactorialThread extends Thread {
			private long inputNumber;
			private BigInteger result = BigInteger.ZERO;
			private boolean isFinished = false;
			
			public FactorialThread(long inputNumber) {
				this.inputNumber = inputNumber;
			}
			
			@Override
			public void run() {
				this.result = factorial(inputNumber);
				this.isFinished = true;
			}
			
			public BigInteger factorial(long n) {
				BigInteger tempResult = BigInteger.ONE;
				
				for (long i = n; i > 0; i--) {
					tempResult = tempResult.multiply(new BigInteger(Long.toString(i)));
				}
				return tempResult;
			}
			
			public boolean isFinished() {
				return isFinished;
			}
			
			public BigInteger getResult() {
				return result;
			}
		}
		
		public class Main {
			public static void main(String[] args) {
				List<Long> inputNumbers = Arrays.asList(0L, 3435L, 35435L, 2324L, 4656L, 23L, 5556L);
				
				List<FactorialThread> threads = new ArrayList<>();
				
				for (long inputNumber : inputNumbers) {
					threads.add(new FactorialThread(inputNumber));
				}
				
				for (Thread thread : threads) {
					thread.start(); // this and checking result have a race condition
				}
				
				for (int i = 0; i < inputNumbers.size(); i++) {
					FactorialThread factorialThread = threads.get(i);
					if (factorialThread.isFinished()) {
						System.out.println("Factorial of " + inputNumbers.get(i) + " is " + factorialThread.getResult());
					} else {
						System.out.println("The calculation for " + inputNumbers.get(i) + " is still in progress");
					}
				}
			}
		}
		
	1. Race condition: Two threads race towards their goals independently (no coordination)
		1. Solution: Forcing main to wait until all factorials are finished

				for (Thread thread : threads) {
					thread.join(); // returns only when the thread has terminated
				} // all factorial calculations are guaranteed to be finished
7. What if one of the numbers is large (from a file or user input) - edge case
	1. Other calculations are ready but cannot complete
		1. Solution: How long we are willing to wait for each of the worker threads

				thread.join(2000); // 2 seconds only
				
			1. Other thread is still running (can be solved to terminate elegantly) - convert it to daemon thread
8. Thread coordination: `Thread.join()`
	1. More control over independent threads
	2. Safely collect and aggregate results
	3. Gracefully handle runaway threads using `Thread.join(timeout)`
9. Summary
	1. Do not rely on the order of execution (of other threads)
	2. Always used thread coordination (to get reliable results)
	3. Design code for worst case scenario (defensive programming)
		1. Assume that: Threads may take unreasonably long time to finish
	4. Always use `Thread.join(...)` with time limit
		1. Stop the thread if it's not done in time

### Coding Exercise 2: Multithreaded Calculation ###
### Multithreaded Calculation - Solution ###

## Performance Optimization ##
### Introduction to Performance & Optimizing for Latency - Part 1 ###
1. What we learn in this lecture
	1. Performance criteria/ definition
	2. Performance in Multithreaded applications
	3. Latency
2. Performance (This can be measured differently for different use cases and different scenarios)
	1. Use cases:
		1. High Speed Trading System
		
				Buy Request	->	|     | -> Purchase
									| App |
				Sell Request	->	|     | -> Sale
										^
										|
									Latency
									
			1. Performance measured in latency
				1. The faster the transaction is, the performant the application is considered to be
				2. Latency measured in units of time
		2. Video Player
		
				App - Frames -> TV
				      [][][]
				      
			1. Delivering all frames as fast as possible would be terrible (1000 frames per second is too fast if the movie is 120 frames per second)
				1. Solution: We want to show movie at the correct frame rate (with minimum jitter)
					1. Performance metric: precision and accuracy of frame rate
		3. Machine Learning
		
				Large Data -Data-> Machine Learning -Prediction->
				
			1. Every 24 hours, prediction must be done
				1. The more data that the system can inject into the system, the better for us
					1. Performance metric: throughput (latency or lack or jitter is not important)
3. Performance in Multithreading (General case)
	1. Latency - The time to completion of a task. Measured in time units
	2. Throughput - The amount of tasks completed in a given period. Measured in tasks/time unit
4. Improving one may not have impact on the other or may even have adverse effect on the other
5. Latency:

		<----- Task ----->
				Latency = T
				
	1. We can break the task into multiple independent tasks

			Task1|task2| | | || | TaskN
			
		1. Schedule the sub-tasks to run in parallel to each other

				Latency = T/N
				
			1. N - number of sub-tasks
	2. Theoretical reduction of latency by N = Performance improvement by a factor of N
		1. N = ?
			1. How many subtasks/ Threads to break the original task?
		2. Does breaking original task and aggregating results coming for free?
		3. Can we break any task into subtasks?
6. N = ?
	1. On a general purpose computer: N = number of cores (as close as possible)
		1. Reduction of latency can be achieved by running the sub-tasks fully in parallel
			1. This is possible only if we run them in multiple cores
	2. OS tries it's best to schedule the tasks on available cores
		1. If no other tasks are running (utilizing hardware as best as it can to give the optimal performance)
			1. If we add a single additional thread (counter productive)
				1. Reduces performance and increases the latency
					1. The additional thread pushes the other thread back and forth resulting in context switches, bad cache performance, extra memory consumption:

							core 1 <- Thread 1
							core 2 <- Thread 2
							...
							core N <- Thread N
							Idle   <- Thread N + 1
							
						1. Thread N + 1 can push any of the Thread [1..N] out and cause context switch
						2. This can get repeated for any of the threads
		2. N = ? - Notes
			1. No of threads = No of cores
				1. It is optimal only if all threads are runnable and can run without interruption
					1. No IO/blocking calls/sleep
				2. In reality, the result will be rarely optimal but we can be close to that
			2. The assumption is that nothing else is running that consumes a lot of CPU
				1. Never the case
					1. Unless we have a dedicated server
						1. OS and other processes would have a negligible impact on application threads
			3. Hyperthreading - Virtual Cores vs Physical Cores
			
										|
								Physical Core
								[HW Unit 2]
										|
					[HW Unit 1]		|	[HW Unit 2]
										|
					Virutal Core 1	|	Virtual Core 2
					
				1. A physical core can run two threads at a time (we cannot get 100% parallelism)
					1. Certain HW units are duplicated (to run the threads in parallel)
					2. Certain HW units are shared
	3. Inherent Cost of Parallelization and Aggregation
		1. Cost of breaking tasks into many & aggregating the results
			
				Breaking task into multiple tasks (calculation cost) 
				+
				Thread creation, passing tasks to threads (cost)
				+
				Time between thread.start() to thread getting scheduled (by OS and run)
				+
				Time until last thread finishes and signals (aggregation - not all tasks take the same time)
				+
				Time until the aggregating thread runs (gets signal and runs again)
				+
				Aggregation of subresults into a single artifact
				
		2. Latency vs Original Task Latency
			1. Multithreaded solution has a constant penalty we have to pay for any size of tasks
				1. The longer the heavier the task is, it is worthwhile to run in parallel
					1. Point where we need to decide is at the intersection between multithreaded solution and single threaded solution
						1. Small and trivial tasks don't do well with parallel execution
		3. Can we break any task into subtasks?
			1. No
				1. Three types of tasks
					1. Tasks that are inherently parallelizable and can be broken into sub-tasks
					2. Tasks that cannot be parallelizable
						1. We are forced to run as single thread
					3. Tasks that can be partially broken into subtasks and partially needed to be run sequentially
7. Summary:
	1. Performance can be defined in many ways depending on the use case
	2. Multithreaded applications performance criteria
		1. Latency
		2. Throughput
	3. Latency reduction by breaking the task into multiple, and running in parallel
		1. Setting expectations as to what can and cannot be achieved by this approach

### Optimizing for Latency Part 2 - Image Processing ###
1. What we learn in the lecture
	1. Image processing - sequential
	2. Image processing - multi-threaded
	3. Performance/ latency measurement
2. Digital pictures:
	1. Pixels - single color points
		1. Each pixel is represented by 4 bytes
			1. ARGB
				1. A - Alpha (transparency)
				2. R - Red
				3. G - Green
				4. B - Blue
			2. We can combine RGB to get pretty much any color
				1. If all colors are the same, we get gray (from white to black)
3. Recoloring algorithm (modular):

		public class Main {
			public static final String SOURCE_FILE = "./resources/many-flowers.jpg";
			public static final String DESTINATION_FILE = "./out/main-flowers.jpg";
		
			public static void main(String[] args) {
				BufferedImage originalImage = ImageIO.read(new File(SOURCE_FILE)); // BufferedImage - specifies pixels, color space, dimentions, convenient methods to manipulate pixels of image
				BufferedImage resultImage = new BufferedImage(originaImage.getWidth(), originalImage.getHeight(), BufferedImage.TYPE_INT_RGB);
			}
			
			public static void recolorImage(BufferedImage originalImage, BufferedImage resultImage, int leftCorder, topCorner, int width, int height) {
				for (int x = leftCorner; x < leftCorder + width && x < originalImage.getWidth(); x++) {
					for (int y = topCorner; y < topCorner + height && originalImage.getHeight(); y++) {
						recolorPixel(originalImage, resultImage, 
					}
				}
			}
			
			public static void recolorPixel(BufferedImage originalImage, BufferedImage resultImage, int x, int y) {
				int rgb = originalImage.getRGB(x, y);
				int red = getRed(rgb);
				int green = getGreen(rgb);
				int blue = getBlue(rgb);
				
				int newRed;
				int newGreen;
				int newBlue;
				
				if (isShadeOfGray(red, green, blue)) {
					newRed = Math.min(255, red + 10);
					newGreen = Math.max(0, green - 80);
					newBlue = Math.max(0, blue - 20);
				} else {
					newRed = red;
					newGreen = green;
					newBlue = blue;
				}
				
				int newRGB = constructeRGBFromColors(newRed, newGreen, newBlue);
				setRGB(resultImage, x, y, newRGB);
			}
			
			public static void setRGB(BufferedImage image, int x, int y, int rgb) {
				image.getRaster().setDataElements(x, y, image.getColorModel().getDataElements(rgb, null);
			}
			
			public static boolean isShadeOfGray(int red, int green, int blue) {
				return Math.abs(red - green) < 30 && Math.abs(red - blue) < 30 && Math.abs(green - blue) < 30; // found empirically
			}
			
			public static int constructRGBFromColors(int red, int green, int blue) {
				int rgb = 0;
				rgb |= (red << 16);
				rgb |= (green << 8);
				rgb |= blue;
				rgb |= 0xFF000000; // opaque
				return rgb;
			}
			
			public static int getRed(int rgb) {
				return ((rgb & 0x00FF0000) >> 16);
			}
			
			public static int getRed(int rgb) {
				return ((rgb & 0x0000FF00) >> 8);
			}
			
			public static int getBlue(int rgb) {
				return (rgb & 0x000000FF);
			}
		}

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