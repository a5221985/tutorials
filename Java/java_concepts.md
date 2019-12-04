# Java Concepts #

## What is API Gateway? ##
1. Urls
	1. `/home`, `/products` - doesn't need authentication
	2. `/my-cart/get`, `/my-cart/add` - needs authentication
	3. `/product/add`, `/product/delete` - needs authorization
2. SSL Certificate - for https
	1. Change certificate every 30 or 60 days
3. The above components can be implemented in API gateway
	1. It is an entry point for API
		1. First request goes to API gateway
		2. API gateway ensures https, authentication and authorization
	2. It is a guard for any requests
4. Features
	1. Feature #1: Separate out cross cutting concerns
		1. Authentication
		2. Authorization
		3. SSL Termination
		4. DDoS protection/ Throttling
	2. Feature #2: Suppose we use microservices as follows which are consilidated into single component
		1. service 1: `/home`, `/my-cart`
		2. service 2: `/product`
	3. Feature #3: Replacing multiple client calls with single API call, also has features of reverse proxy (serving static content, caching responses)
		1. An adapter (in gateway) can make the following calls
			1. Static files (HTML, JS, CSS) - A component can exist in the gateway for this (instead of having a service) called Static Content
			2. Personalized Recommendations
			3. Trending Products - This does not change so frequently so this can be cached in Cache of the API gateway (we can give threshold time for the Cache)
			4. Discount Offers
	4. Feature #4: Routing based on headers, paths and params etc, load balancing, A/B testing, canary release
		1. Router: 
			1. If one service give low quality video (for mobile) this is chosen for mobile which is fast
			2. If another service gives high quality video (for desktop/laptop) this is chosen for other computers which is slow
		2. Load Balancer:
			1. If a service is in multiple copies (because the load is high) - round robin can be used (or some algorithm like consistent hashing)
	5. Feature #5: 
		1. If backend services are not ready for latest protocols like http-2 and Websocket, API gateway can convert from new protocol to existing protocol
		2. All requests can be monitored for performance and latencies
			1. Dashboards exist
		3. We can expose to market an API service
			1. Based on service usage, we can charge
1. Gateway Configuration
	1. In House
		1. Apache
		2. HAProxy
		3. Nginx
		4. Spring Cloud Gateway
	2. Cloud Services
		1. AWS API Gateway
		2. Azure API Gateway
		3. Google Cloud Endpoints
		4. Apigee

## Concurrency ##
### Concurrency vs Parallelism ###
1. Parallelism
	1. Example:

			public static void main(String[] args) {
				new Thread(new Runnable() { // task 1 - first thread
					@Override
					public void run() {
						processTax(user1);
					}
				}).start();
				
				new Thread(new Runnable() { // task 2 - second thread
					@Override
					public void run() {
						processTax(user2);
					}
				}).start();
				
				heavyCalculations(); // task 3 - run by main thread
			}
			
		1. If we have a 4 core processor, we can run the three tasks in parallel
			1. The tasks are not dependent on each other
	2. Parallelism is about doing lot of things at once - Rob Pike
	3. Example: `ExecutorService`

			public static void main(String[] args) {
				ExecutorService es = Executors.newFixedThreadPool(4); // thread pool
				es.submit(() -> processTax(user1));
				es.submit(() -> processTax(user2));
				
				heavyCalculations();
			}
			
	4. Ways of enabling parallelism: Java
		1. Threads - raw threads
		2. ThreadPool
			1. ExecutorService
			2. ForkJoinPool (newer)
			3. Custom ThreadPools (eg: Web Servers)
		3. **Note:** Requires > 1 CPU cores (pre-requisite for parallelism)
2. Concurrency:
	1. Example:

			public static void main(String[] args) throws InterruptedException {
				new Thread(() -> {
					if (ticketsAvailable > 0) { // task accessing shared variable
						bookTicket();
						ticketsAvailable--;
					}
				}).start();
				
				new Thread(() -> { // task accessing shared variable
					if (ticketsAvaialable > 0) {
						bookTicket();
						ticketsAvailable--;
					}
				}).start();
				
				Thread.sleep(5000);
			}	

### Java Memory Model in 10 Minutes ###
### Using Volatile vs AtomicInteger in Java Concurrency ###
### Adder and Accumulator Classes in Java 8 ###
### Understanding How ForkJoinPool Works ###
### What is a SynchronousQueue in Java? ###
### ThreadLocal in Java ###
### Phaser vs CountDownLatch vs CyclicBarrier ###
### Java Asynchronous Programming ###
### Lock's Condition Class in Java ###
### Semaphore in Java Concurrency ###
### Java ReentrantLock - Fairness, tryLock and More ###
### ReadWriteLock vs ReentrantLock ###
### Exchanger Class in Java ###
### Guava Library - Striped Locks in Java ###
### What are Coroutines (aka Java Fibers in Project Loom)? ###
### What are spinlocks? ###
### How to Detect and Resolve DeadLocks in Java ###
### Java Concurrency Interview: Implement Producer Consumer Pattern using Wait-Notify ###
### Java Concurrency Interview: Implement Scatter Gather Pattern ###
### Singleton and Double Checked Locking ###
### Race Condition vs Data Races in Java ###

## Service Mesh ##
1. What is service mesh?
	1. Concept in microservices
	2. 