### Java Multithreading
##### Multiple locks
1. `synchronized` acquires intrinsic lock and the other thread has to wait until the lock is released.
	1. Problem: only one lock exists and all the other threads are blocked from running other synchronized methods.
	2. Declare separate `lock<i>` objects and synchronize code blocks as follows:
	
			Object lock1 = new Object();
			
			public void method() {
				synchronized(lock1) {
					// block of code
				}
			}

##### Thread pools
1. Way of managing many threads
	1. `ExecutorService`
		1. Has a managerial thread
	2. `Executor`
	
			public class RunnerThreadPool implements Runnable {
				private int id;
				
				public RunnerThreadPool(int id) {
					this.id = id;
				}
				
				public void run() {
					System.out.println("Starting: " + id);
					
					try {
						Thread.sleep(5000);
					} catch(InterruptedException ie) {
						ie.printStackTrace();
					}
				}
				
				public static void main(String[] args) {
					ExecutorService service = Executors.newFixedThreadPool(2);
					
					for(int i = 0; i < 5; i++) {
						service.submit(new RunnerThreadPool(i));
					}
					
					service.shutdown();
					
					try {
						service.awaitTermination(1, TimeUnit.DAYS);
					} catch(InterruptedException ie) {
						ie.printStackTrace();
					}
				}
			}
			
##### CountDownLatch (Thread safe class)

##### Producer - Consumer

##### Wait and Notify

##### Semaphores
1. Used for controlling access to a resource.
2. Syntax:
	1. `Semaphore semaphore = new Semaphore(<number-of-permits>);`
		1. Initialize with initial number of permits
	2. `sem.acquire();` **(M)**
		1. If there are enough permits, continues but if there are no permits, thein waits for permits.
	3. `sem.release();` **(M)**
		1. Releases a permit which increments the number of permits of the semaphore.
	4. `sem.availablePermits();`
		1. Returns the number of permits currently available.


##### Callable and Future
1. Used to return results from thread executing method.
2. Syntax:

		ExecutorService executor = Executors.newCachedThreadPool();
		
		Future<Integer> future = executor.submit(new Callable<Integer>() {
			@Override
			public Integer call() {
				// some logic that assigns an integer value to 'var'
				return var;
			}
		});
		
		try {
			System.out.println("Return value: " + future.get());
		} catch(InterruptedException e) {
			e.printStackTrace();
		} catch(ExecutionException e) {
			e.printStackTrace();
		}
		
##### Interrupting Threads
1. 