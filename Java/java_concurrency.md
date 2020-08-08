# Java Concurrency #
## Using volatile vs atomic Integer in Java Concurrency ##
1. Example: boolean flag = true
	
		T1:					T2:
		
		flag = false		while (flag) {
								// processing
							}
							
	1. CPU with two cores:
		1. thread-1 runs on core-1
			1. local cache:
				1. If the following code is run, the value is only changed in local cache
				
						flag = false
						
		2. thread-2 runs on core-2
		3. There is a shared cache
	2. Fix: append `volatile` - this makes the value visible to thread-2 (
		1. Mechanism:
			1. Any changes to local cache are pushed to shared cache
			2. The local cache of other cores are refreshed with the new value
2. Example: int value = 1;

		T1:					T2:
		value++			value++
		
	1. How does it work?
		1. Thread-1 (performs two operations at lower level)
			1. Read value (=1)
			2. Add 1 and write(=2)
		2. Thread-2 (performs two operations at lower level)
			1. Read value (=1)
			2. Add 1 and write(=2)
	2. Because the threads can run in parallel, they may run in two separate cores or can run concurrently because scheduler may interleave the 4 instructions
		1. Ex:
			1. Thread-1: Read value (=1)
			2. Thread-2: Read value (=1)
			3. Thread-1: Add 1 and write (=2)
			4. Thread-2: Add 1 and write (=2)
	3. Solution: `synchronized` block

			T1:							T2:
			
			synchronized (obj) {	synchronized (obj) {
				value++;					value++;
			}							}

		1. How does it work?
			1. Thread-1: Acquire lock object `obj`
			2. Thread-2: Try to acquire lock object but fails and waits (may sleep)
			3. Thread-1: Read value (=1)
			4. Thread-1: Add 1 and write (=2)
			5. Thread-1: Release lock object `obj`
			6. Thread-2: Wakes up and tries to acquire the lock and acquires it
			7. Thread-2: Read value (=2)
			8. Thread-2: Add 1 and write (=3)
	4. Solution 2: Using `AtomicInteger` **(M)**

			AtomicInteger value = new AtomicInteger(1);
			
			T1:						T2:
			value.increment();	value.increment();
			
		1. Ensures read and write are done atomically
			1. Atomic compound operation
		2. Other operations supported:
			1. `incrementAndGet`
			2. `decrementAndGet`
			3. `addAndGet (int delta)`
			4. `compareAndSet (int expectedValue, int newValue)`
				1. compare with expected value
					1. if same then replace with newValue
					2. if different then don't do anything
3. Use cases:
	1. `volatile`: generally used for flags (booleans)
		1. If setting the value directly without checking previous value
	2. `AtomicInteger`, `AtomicLong`: Used for counters - when updated by multiple threads
	3. `AtomicReference`: May be used in `Cache`
		1. (building new cache in background and replacing atomically)
		2. Used by some internal classes (JDK classes)
		3. Non-blocking algorithms

## ThreadLocal in Java ##
1. Example:

		public class UserService {
			public static void main(String[] args) throws InterruptedException {
				new Thread(() -> {
					String birthDate = new UserService().birthDate(100);
					System.out.println(birthDate);
				}).start();
				
				new Thread(() -> {
					String birthDate = new UserService().birthDate(100);
					System.out.println(birthDate);
				});
				
				Thread.sleep(1000);
			}
			
			public String birthDate(int userId) {
				Date birthDate = birthDateFromDb(userId);
				SimpleDateFormat df = new SimpleDateFormat("yyy-MM-dd");
				return df.format(birthDate);
			}
		}
		
	1. Both threads construct `SimpleDateFormat` objects
	2. Example: 10 threads:

			public class UserService {
				public static void main(String[] args) throws InterruptedException {
					for (int i = 0; i < 10; i++) {
						int id = i;
						new Thread(() -> {
							String birthDate = new UserService2().birthDate(id);
							System.out.println(birthDate);
						}).start();
					}
					
					Thread.sleep(1000);
				}
				
				public String birthDate(int userId) {
					Date birthDate = birthDateFromDB(userId);
					SimpleDateFormat df = new SimpleDateFormat("yyy-MM-dd");
					return df.format(birthDate);
				}
			}
			
		1. Each thread constructs `SimpleDateFormat` object
	3. 1000 threads - impractical to construct 1000 threads but we can have a thread pool:

			private static ExecutorService threadPool = Executors.newFixedThreadPool(10);
			
			public static void main(String[] args) throws InterruptedException {
				for (int i = 0; i < 1000; i++) {
					int id = i;
					threadPool.submit(() -> {
						String birthDate = new UserService2().birthDate(id);
						System.out.println(birthDate);
					});
				}
				
				Thread.sleep(1000);
			}
			
		1. 1000 date format objects are created
	4. Solution: Global `SimpleDateFormat` object
		1. Problem: `SimpleDateFormat` has non thread-safe access (data integrity formats)
			1. Solution: Synchronization: `synchronized` block which locks the section
				1. Problem: Code will slow down a lot
			2. Solution: Middle ground:
				1. Each thread can have it's own `SimpleDateFormat` object - (thread specific variables)
					1. `ThreadLocal` - Per thread instances for memory efficiency and thread-safety
						1. Example:

								class ThreadSafeFormatter {
									public static ThreadLocal<SimpleDateFormat> dateFormatter = new ThreadLocal<SimpleDateFormat>() {
										@Override
										protected SimpleDateFormat initialValue() { // called the first time `get` is called
											return new SimpleDateFormat("yyy-MM-dd");
										}
										
										@Override
										public SimpleDateFormat get() {
											return super.get();
										}
									}
								}
								
								public class UserService {
									public static void main(String[] args) {
										// ....
									}
									
									public String birthDate(int userId) {
										Date birthDate = birthDateFromDB(userId);
										final SimpleDateFormat df = ThreadSafeFormatter.dateFormatter.get(); // Returns the thread specific copy of `SimpleDateFormat` object
										return df.format(birthDate);
									}
								}
								
						2. Example: Java 8 version

						
								class ThreadSafeFormatter {
									public static ThreadLocal<SimpleDateFormat> df = ThreadLocal.withInitial(() -> new SimpleDateFormat("yyy-MM-dd"));
								}
								
								...
								public String birthDate(int userId) {
									Date birthDate = birthDateFromDB(userId);
									final SimpleDateFormat df = ThreadSafeFormatter.df.get();
									return df.format(birthDate);
								}
								
2. Web server requests:

		request -> thread -[user]-> service-1 -[user]-> service-2 -[user]-> service-3 -[user]-> service-4
		
	1. Problem: passing user again and again across
		1. Solution: Store in a map once and other services can retrieve
			1. Problem: Locks are required to synchronize the access if multiple threads are trying to pull the date
				1. Solution: Use `ThreadLocal<User>` which has a copy for each thread (no synchronization required, increases performance)
					1. Implementation:

							public class UserContextHolder {
								public static ThreadLocal<User> holder = new ThreadLocal();
							}
							
							class Service1 {
								public void process() {
									User user = getUser();
									UserContextHolder.holder.set(user);
								}
							}
							
							class Service2 {
								public void process() {
									User user = UserContextHolder.holder.get(); // Thread specific user is returned
									// process user
								}
							}
							
						1. Use-case - 2: Per thread context (thread-safety + performance)
	2. Spring framework:
		1. Uses the following classes:
			1. `LocaleContextHolder`
			2. `TransactionContextHolder`
			3. `RequestContextHolder`
			4. `SecurityContextHolder`
			5. `DateTimeContextHolder`
		2. Example:

				public abstract class RequestContextHolder extends java.lang.Object // Holder class to expose the web request in the form of a thread-bound RequestAttributes object. - request is handled by a single thread
				
				public class SecurityContextHolder extends java.lang.Object // Associates a given SecurityContext with the current execution thread.
				
		3. Cleanup:

				class Service4 { // last service
					public void process() {
						// get user
						// cleanup
						UserContextHolder.holder.remove();
					}
				}
				
3. Use cases summary:
	1. Thread confinement (thread safety)
	2. Per thread object for performance
	3. Per thread context (for request flow)
4. Usage tips:
	1. Cleanup once out of scope
	2. Use local variables (as much as possible to avoid thread local)
	3. Delegate to frameworks (If using Spring - Use provided classes as above)

## Concurrency vs Parallelism ##
1. Example: 

		public static void main(String[] args) {
			new Thread(new Runnable() {
				@Override
				public void run() {
					processTax(user1);
				}
			}).start();
			
			new Thread(new Runnable() {
				@Override
				public void run() {
					processTax(user2);
				}
			}).start();
			
			heaveyCalculations();
		}
		
	1. Java 8:

			public static void main(String[] args) {
				new Thread(() -> {
					processTax(user1);
				}).start();
				
				new Thread(() -> {
					processTax(user2);
				}).start();
				
				heavyCalculations();
			}
			
		1. Scheduler: Schedules threads onto CPUs
			1. Main thread - may be Core 1
			2. Thread-1 - may be core 2
			3. Thread-2 - may be core 3
2. "Parallelism is about **doing** lot of things at once" - Rob Pike
3. Example:

		pubic static void main(String[] args) {
			ExecutorService es = Executors.newFixedThreadPool(4);
			es.submit(() -> processTax(user1));
			es.submit(() -> processTax(user2));
			
			heavyCalculations();
		}
		
4. In Java the following can be used to enable parallelism:
	1. Threads
	2. TheadPool
		1. ExecutorService
		2. ForkJoinPool
		3. Custom ThreadPools (eg: used by Web Servers)
	3. Note: Requires > 1 CPU cores
5. Concurrency:
	1. Example:

			public static void main(String[] args) throws InterruptedException {
				new Thread(() -> {
					if (ticketsAvailable > 0) { // shared variable
						bookTicket();
						ticketsAvailable--;
					}
				}).start();
				
				new Thread(() -> {
					if (ticketsAvailable > 0) {
						bookTicket();
						ticketsAvailable--;
					}
				}).start();
				
				Thread.sleep(5000);
			}
			
		1. Assume there is only one core:
			1. Scheduler interleaves threads
				1. How much time each thread gets is non deterministic (because the scheduling policy may vary with the OS and the environment)
			2. Best case:
				1. All instructions of thread-1 are run
				2. Then all instructions of thread-2 are run
			3. Another case:
				1. Thread-1: if (availableTickets > 0) - (if 1 ticket available say)
				2. Thread-2: if (avialableTickets > 0) - (if 1 ticket available say)
				3. Thread-1: bookTicket() - (books the single ticket)
				4. Thread-2: bookTicket() - (books the single ticket)
				5. Thread-1: availableTickets-- (tickets is 0)
				6. Thread-2: availableTickets-- (tickets is -1)
		2. Assume there are 4 cores:
			1. If two cores run the instructions at the same time:
				1. Still booking can happen at the same time
	2. Fix: Using locks (one solution)

			new Thread(() -> {
				lock.lock(); // locks for threads to coordinate. So that they don't step on each other.
				if (ticketsAvailable > 0) {
					bookTicket();
					ticketsAvailable--;
				}
				lock.unlock();
			}).start();
			
			new Thread(() -> {
				lock.lock();
				if (ticketsAvailable > 0) {
					bookTicket();
					ticketsAvailable--;
				}
				lock.unlock();
			}).start();
			
		1. Thread 2 (if thread 1 has locked) has to wait
	3. "Concurrency is about **dealing** with lot of things at once" - Rob Pike
		1. Concurrency is applied if there:
			1. Shared resource is to be accessed/ updated
			2. Multiple tasks need to coordinate
3. Tools to deal with concurrency:
	1. Locks/ synchronized (keyword)
	2. Atomic classes
	3. Concurrent data structures (eg: ConcurrentHashMap, BlockingQueue)
	4. CompletableFuture
	5. CountdownLatch/ Phaser/ CyclicBarrier/ Semaphore etc
4. Procedure:
	1. Split the sequential flow into independent components
	2. Use threads/threadpools to parallelize (& thus speed up)
	3. Whenever shared resource is to be updated, use concurrency tools to manage state
	4. Whenever independent components (running on threads) need to coordinate, use concurrency tools

## Java Memory Model in 10 Minutes ##
1. Out of order execution:
	1. Performance driven changes
		1. done by - Compiler, JVM or CPU - (done in such a way that the program semantics remains the same)
2. Example:

		a = 3;
		b = 2;
		a = a + 1;
		
	1. Instructions for CPU to run (hypothetical):

			Load a
			Set to 3
			Store a
			
			Load b
			Set to 2
			Store b
			
			Load a
			Set to 4
			Store a
			
	2. Example performance improvement:

			a = 3;
			a = a + 1;
			
			b = 2;
			
		1. Instructions to CPU:

				Load a
				Set to 3
				Set to 4
				Store a
				
				Load b
				Set to 2
				Store b

3. Field Visibility:
	1. Applicable in presence of multiple threads (aka concurrency)
4. Machine:

		Core1
		registers (fastest memory) (per core)
		L1 cache	(per core)
		L2 cache (shared between 2 cores)
		L3 cache (shared across cores)
		Memory
		
	1. Example:

			public class FieldVisibility {
				int x = 0;
				
				public void writeThread() {
					x = 1;
				}
				
				public void readerThread() {
					int r2 = x;
				}
			}
			
		1. writer-thread & reader-thread:

				core 1			core 2
				local cache	local cache
						shared cache	
						
			1. Let write-thread run on core-1
				1. if x = 1 is executed, it may not be seen by core 2 (because shared cache does not have the updated value)
			2. Let reader-thread run on core-2
		2. Solution: `volatile int x = 0;`
			1. pushes (flushes) x into shared cache
				1. If any core tries to load the value, it will get updated value
5. JMM - specification which guarantees visibility of fields (aka happens before) amidst reordering of instructions
	1. JVM must implement this rule
	2. Happens before relationship:
		1. Example:

				public class VolatileFieldsVisibility {
					int a = 0, b = 0, c = 0; // not volatile
					volatile int x = 0;
					
					public void writeThread() {
						a = 1;
						b = 1;
						c = 1;
						
						x = 1; // write of x
					}
					
					public void readerThread() {
						int r2 = x; // read of x
						
						int d1 = a;
						int d2 = b;
						int d3 = c;
					}
				}
				
			1. JMM ensures that any values written before volatile variable (x here) should be visible to the other thread after the volatile variable is read (x here) from the other thread
				1. Whatever happend before x should be visible after reading x
			2. This happens before is also applicable to the following: (why?)
				1. `synchronized`
				2. Locks
				3. Concurrent collections
				4. Thread operations (`join`, `start`)
				5. final fields (special behavior)
			3. Exaple: using synchronize

					public class SynchronizedFieldsVisibility {
						int a = 0, b = 0, c = 0;
						volatile int x = 0;
						
						public void writerThread() {
							a = 1;
							b = 1;
							c = 1;
							
							synchronized (this) { // should be applied on same object (if different objects are used it will not work)
								x = 1;
							}
						}
						
						public void readerThread() {
							synchronized (this) {
								int r2 = x;
							}
							
							int d1 = a;
							int d2 = b;
							int d3 = c;
						}
					}
					
				1. If we don't want to rely on the "happens before" relationship

						synchronized (this) {
							a = 1;
							b = 1;
							c = 1;
							x = 1;
						}
						...
						
						synchronized (this) {
							int r2 = x;
							int d1 = a;
							int d2 = b;
							int d3 = c;
						}
						
				2. Using lock operations:
						
						...
						Lock lock = new ReentrantLock();
						...
						lock.lock();
						a = 1;
						b = 1;
						c = 1;
						x = 1;
						lock.unlock();
						...
						lock.lock();
						int r2 = x;
						int d1 = a;
						int d2 = b;
						int d3 = c;
						lock.unlock();
						...	

## Java Asynchronous Programming ##
1. To take advantage of multi-core computer, we can have multiple parallel threads
2. In Java: Each thread created is mapped to an OS thread (Native threads aka Kernel threads)
	1. Consumes a lot of memory
		1. Limits number of active threads and threads in general
3. Another issue:
	1. If a second thread (thread-3) has to be scheduled on the same core (core-1 say)
		1. Flush local cache
		2. Put all data related to thread 3
	2. If the first thread needs to be allocated again on the same core
		1. Flush local cache
		2. Put all data related to thread 1
	3. This is a **data locality** issue
	4. **Scheduling overhead**:
		1. If 100s of thread - scheduling takes more time
4. I/O operations: (File operations, network operations)
	1. Example:

			main thread
				|
				| (with state)
				-------------->
									- Network (HTTP/ DB) (here CPU cycles are wasted)
									- File IO
				<--------------
				| Runnable
				|
				v
				
		1. Blocking thread: limits capacity to scale IO ops
			1. Too many threads which are IO intensive can block
		2. Solution: Non-blocking IO

				main thread
					|
					|
					--------------->	- HTTP - Microservices
					|					- Database
					|					- File IO
					|					|
					|					| Callback (on separate thread)
					|					|
					|					v
					v
					
			1. Example: Synchronous API:

					for (Integer id: employeeIds) {
						// Step 1: Fetch Employee details from DB
						Future<Employee> future = service.submit(new EmployeeFetcher(id));
						Employee emp = future.get(); // blocking
						
						// Step 2: Fetch Employee tax rate REST service
						Future<TaxRate> rateFuture = service.submit(new TaxRateFetcher(emp));
						TaxRate taxRate = rateFuture.get(); // blocking
						
						// Step 3: Calculate current year tax
						BigDecimal tax = calculateTax(emp, taxRate);
						
						// Step 4: Send email to employee using REST service.
						service.submit(new SendEmail(emp, tax));
					}
					
				1. for loop is blocked for each employee and for tax rate for the employee
		3. Problems:
			1. Threads are expensive & Blocking IO Ops = Limited scalability
5. **Solution: Non-blocking IO & Asynchronous API**
	1. **Asynchronous API**:
		1. Solution:

				for (Integer id: employeeIds) { // this does not stop
					CompletableFuture.supplyAsync(() -> fetchEmployee(id))
									.thenApplyAsync(employee -> fetchTaxRate(employee))
									.thenApplyAsync(taxRate -> calculateTax(taxRate))
									.thenAcceptAsync(taxValue -> sendEmail(taxValue));
				} // callback chaining (similar to JS)
				
			1. CompletableFuture is responsible for scheduling the tasks and execute the specified algorithm for all the threads
				1. Generally uses ForkJoinPool
	2. **Non-Blocking IO**: **NIO package**
		1. Buffer, Channels, Selectors
		2. Low-level API for asyncrhonous/ non-blocking IO
		3. Applicable for Files, Sockets
		4. Listener based (callbacks)

				ByteBuffer buffer = ByteBuffer.allocate(1024);
				
				Path path = Paths.get("/home/file2");
				AsynchronousFileChannel fileChannel = AsynchronousFileChannel.open(path, StandardOpenOption.READ);
				
				fileChannel.read(buffer, 0, buffer, new CompletionHandler<Integer, ByteBuffer>() { // this does not block
					@Override
					public void completed(Integer result, ByteBuffer data) { // callback
						// process data
					}
				}
				
			1. For files and sockets
			2. Works on callbacks
6. Servlet 3.0: Allows more concurrent requests
	1. There are limited number of threads in a pool (200 say) - 200 concurrent requests only
		1. To support more threads, make the servlet asynchronous

				@WebServlet(urlPatterns = {"/user"}, asyncSupported = true)
				public class UserAsyncServlet extends HttpServlet {
					@Override
					public void doGet(HttpServletRequest request, HttpServletResponse response) { // This is not blocked
						final AsyncContext context = request.startAsync();
						context.start(new Runnable() { // callback - as a Runnable
							public void run () {
								// make the network call
								ServletResponse response = context.getResponse();
								// print to the response
								context.complete();
							}
						});
					}
				}
				
			1. Run operations in a separate thread
			2. Immediately return to serve other requests

7. Servlet 3.1: Efficient thread utilization (further enhancement)

		@WebServlet(urlPatterns={"/user"}, asyncSupported=true)
		public class UserAsyncServlet_2 extends HttpServlet {
			@Override
			public void doGet(HttpServletRequest request,
									HttpServletResponse response) throws IOException {
				final AsyncContext context = request.startAsync();
				ServletInputStream input = request.getInputStream();
				input.setReadListener(new ReadListener() { // non-blocking IO
					@Override
					public void onAllDataRead() throws IOException { // callback
						// data available, process
						// write to output - non-blocking
					}
				});						
			}
		}
		
	1. When all the data is read, the callback is called
8. Spring- Reactive Programming (more readable)

		@RestController
		public class MyRestController {
			@Autowired
			private UserRepository userRepository;
			
			@GetMapping("/get/user/{id}")
			public Mono<User> getUser(@PathVariable String id) { // this call is non-blocking
				return userRepository.findUser(id); // non-blocking
				// when data is available, it is pushed to Mono, callback is executed to return the response
			}
		}
		
	1. When to use?
		1. To scale application
	2. `Mono`: Spring equivalent of future (but non-blocking)
		1. A promise is returned immediately
		2. When data is ready, it is set
9. Advantages:
	1. Efficient CPU utilization (thread handling is done by framework efficiently)
	2. Scalability/ High-throughput
	3. Data locality & less context switches
		1. Framework takes care of data locality
	4. Reactive
		1. Live/Hot source of values
		2. Backpressure
10. Issues
	1. Hard to write and reason about (non intuitive, difficult to reason about the code)
	2. CPU bound flows
	3. Hard to debug/ Stack trace
	4. Hard to write tests
	5. End-to-end async/ non-blocking required
11. What we really want?
	1. Lightweight threads
	2. Synchronous programming
12. Solution: Java Fibers:
	1. Java Fibers:
		1. Light-weight threads (not OS level threads and millions of threads can be created)
		2. Blocking operations
		3. Synchronous API
	2. If one of the threads blocks, Java Fibers switches the thread to run on limited set of OS threads

## Locks' Condition class in Java ##
1. 

## Introduction to CompletableFuture in Java 8 ##
## What are Coroutines (aka Java Fibers in Project Loom)? ##
## Java ReentrantLock - fairness, tryLock and more ##
## ReadWriteLock vs ReentrantLock ##
## What are Java Interrupts? ##
## Semaphore in Java Concurrency ##
## Java Concurrency Interview Question: How to Timeout a Thread? ##
## Java Concurrency Interview: Implement Producer Consumer pattern using wait-notify ##
## Java Concurrency Interview: Implement Scatter Gather pattern ##
## Understanding how ForkJoinPool works ##
## Phaser vs CountDownLatch vs CyclicBarrier ##
## What is a SynchronousQueue in Java? ##
## Adder and Accumulator classes in Java 8 ##
## Guava library - Striped Locks in Java ##
## How detect and resolve DeadLocks in Java ##
## Race Condition vs Data Races in Java ##
## Singleton and Double Checked Locking ##
## What are spinlocks? ##
## Exchanger class in Java ##