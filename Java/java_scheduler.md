# Java Scheduler ScheduledExecutorService ScheduledThreadPoolExecutor Example #
## Java Scheduler ScheuledExecutorService ##
1. To execute a task periodically or after specific delay
2. Option 1: Timer class
	1. Drawbacks: To run multiple similar tasks in parallel, we need multiple Timer objects
		1. Overhead to system
		2. No thread pool of scheduled tasks
3. Option 2: `ScheduledThreadPoolExecutor` - implements `ScheduledExecutorService` interface
	1. Defines contract methods to schedule task with different options
		1. [Java ThreadPoolExecutor](https://www.journaldev.com/1069/threadpoolexecutor-java-thread-pool-example-executorservice)
		2. Executors also provide factory methods to construct `ScheduledThreadPoolExecutor` to specify number of threads in pool

### Java Scheduler Example ###
1. `WorkerThread.java`

		package com.journaldev.threads;

		import java.util.Date;

		public class WorkerThread implements Runnable {
			private String command;

			public WorkerThread(String s) {
				this.command = s;
			}

			@Override
			public void run() {
				System.out.println(Thread.currentThread().getName() + "Start. Time = " + new Date());
				processCommand();
				System.out.println(Thread.currentThread().getName() + "End. Time = " + new Date());
			}

			private void processCommand() {
				try {
					Thread.sleep(5000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}

			@override
			public String toString() {
				return this.command;
			}
		}

2. Execute worker thread after 10 secods delay
	1. `newScheduledThreadPool(int corePoolSize)`
		1. Returns instance of `ScheduledThreadPoolExecutor`

				public static ScheduledExecutorService newScheduledThreadPool(int corePoolSize) {
					return new ScheduledThreadPoolExecutor(corePoolSize);
				}

	2. Example: Using `ScheduledExecutorService` and `ScheduledThreadPoolExecutor`

			package com.journaldev.threads;

			import java.util.Date;
			import java.util.concurrent.Executors;
			import java.util.concurrent.ScheduledExecutorService;
			import java.util.concurrent.TimeUnit;

			public class ScheduledThreadPool {
				public static void main(String[] args) throws InterruptedException {
					ScheduledExecutorService scheduledThreadPool = Executors.newScheduledThreadPool(5);

					// schedule to run after sometime
					System.out.println("Current Time = " + new Date());

					for (int i = 0; i < 3; i++) {
						Thread.sleep(1000);
						WorkerThread worker = new WorkerThread("do heavy processing");

						scheduledThreadPool.schedule(worker, 10, TimeUnit.SECONDS);
					}

					// add some delay to let some threads spawn by scheduler
					Thread.sleep(30000);

					scheduledThreadPool.shutdown();

					while(!scheduledThreadPool.isTermintated()) {
						// wait for all tasks to finish
					}
					System.out.println("Finished all threads");
				}
			}

		1. `schedule()` - returns instance of `ScheduledFuture`
			1. It can give thread state information
			2. It can give delay time for thread
			3. Extends `Future` interface
				1. [Java Callable Future Example](https://www.journaldev.com/1090/java-callable-future-example)
3. Other methods exist to run tasks periodically 

### ScheduledExecutorService scheduleAtFixedRate(Runnable command, long initialDelay, long period, TimeUnit unit) ###
1. `scheduleAtFixedRate` - to schedule a task to run after initial delay and then with given period
	1. Time period is from start of first thread in the pool
		1. If specified period is 1s, but threads runs for 5 seconds, next thread will start executing as soon as first worker thread finishes it's execution
2. Example:

		for (int i = 0; i < 3; i++) {
			Thread.sleep(1000);
			WorkerThread worker = new WorkerThread("do heavy processing");
			// schedule task to execute at fixed rate

			scheduledThreadPool.scheduleAtFixedRate(worker, 0, 10, TimeUnit.SECONDS);
		}

### ScheduledExecutorService scheduleWithFixedDelay(Runnable command, long initialDelay, long delay, TimeUnit unit) ###
###

1. `scheduleWithFixedDelay` can be used to start periodic execution with initial delay and then execute with given delay
	1. Delay time is from time thread finishes it's execution

			for (int i = 0; i < 3; i++) {
				Thread.sleep(1000);
				WorkerThread worker = new WorkerThread("do heavy processing");

				scheduledThreadPool.scheduleWithFixedDelay(worker, 0, 1, TimeUnit.SECONDS);
			}
