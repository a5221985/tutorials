# Developer to Architect: Mastering Software Architecture #

## Introduction ##
### Introduction to Developer to Architect ###
1. How do you architect a new system?
	1. Starting with:

			Use cases
			DB Schema
			Code flow (sequence diagram)
			Class diagram
			
		1. Next step:

				user interface <-> web application <-> business service <-> database
				
			1. 3-tier or n-tier architecture
		2. Next step:
			1. Technologies and languages for implementation
				1. HTML/CSS/JS
				2. PHP
				3. Python
				4. C#
				5. Java
				6. Spring
				7. SQL
	2. We have not done any architect's job here
		1. We have never dealt with system requirements
			1. We must not just satisfy functional requirements but non-functional and system requirements (most importantly)
				1. Performance
					1. 90% of requests should be satisfied within a second
						1. To minimise latency
						2. Increase throughput
				2. Scalability
					1. System should be able to handle 1M simultaneous users
				3. Reliability
					1. How to make system resilient to failures
						1. If component has failed
						2. If data centre has failed
				4. Security
					1. How to securely transfer data
					2. How to securely store data
					3. How to authenticate and authorize
					4. What steps to take to secure our system against external and internal threats
				5. Deployment
					1. These systems are not easy to deploy (might require a lot of automation and coordination with operations team) - Due to high scalability and reliability
						1. There could be many components
						2. There could be many instances of the components
				6. Technology Stack
					1. For each layer and component
						1. Which platform or product to choose
							1. DBs
							2. Caches
							3. Queues
							4. Servers
					2. The options are chosen based on requirements of a system
						1. Performance, scalability, reliability, security, deployment requirements
					3. Products or technologies or platforms that satisfy those requirements are chosen
		2. The course is about non-functional and system requirements

## Performance ##
### Module Contents Overview ###
1. High level topics
	1. Understanding Performance
		1. Performance problems
		2. Measurement
		3. Principles
			1. The performance of a system depends on
	2. How to improve the performance of a system?
		1. Latency (How to minimize it) - Following are categories
			1. CPU - maximization
			2. Memory - minimize mem related latency
			3. Network - minimize network related latency
			4. Disk - improve utilization and minimize latency
		2. Concurrency (How to improve throughput)
			1. Locking - role played in terms of improving or degrading performance
				1. Pessimistic - where to use
				2. Optimistic - where to use
			2. Coherence - role played in terms of improving or degrading performance
		3. Caching
			1. Static Data - how to cache, challenges, how it helps us
			2. Dynamic Data - how to cache, challenges, how it helps us

### A Reference Software System for Discussing Performance ###
1. Sample System - we want to improve the performance of this system

		Web browser -SSL/TLS-> Web Application -objects-> Business App
				Pages/JSON/XML/Images
				
		Business App -Txn Data-> Database <-Report Data- Bach Processing
		
	1. Web application - accessible from web browser
	2. Web application - fetches data from a service (business application)
		1. It can be SOA
		2. It can be microservices
	3. Business application - fetches data from database
		1. Assuming database is RDBMS
	4. Back Processing - fetches data from database, processes it and puts the data back into database

### What is Performance ###
1. Performance - of software system
	1. Measure of how fast or responsive a system is under
		1. A given workload (this has to be fixed)
			1. Backend data
			2. Request volume
		2. A given hardware (this has to be fixed)
			1. Kind
			2. Capacity
	2. If we have system with huge data, that system is likely to face more performance problems compared to when we reduce the data that is there on the backend
	3. If request volume is high, the system is likely to face more performance problems
	4. This constraint is application only when we measure performance
	5. If we use superiod hardware or increase capacity of hardware
		1. Performance problems generally go away and system responds better
			1. If hardware was the reason behind any performance problems
2. Goals:
	1. Web requests
		1. How fast are we getting response
	2. Batch processing
		1. How fast the batch processes are finishing
3. Goal
	1. As we increase the workload, our performance should remain stable
		1. It should not severely degrade
			1. A little is okay (depends)
4. Hardware
	1. If we increase capacity or bring superior one
		1. System performance should improve (if it was lagging behind because of inadequate capacity or kind)

### How do Performance Problems Look Like ###
1. Performance Problems
	1. How to spot a performance problem?
	2. How does performance problem look like?
	3. How to get rid of all performance problems?
		1. We don't want them
2. Every performance problem is the result of some queue building up somewhere. (requests get queued up somewhere)
	1. Network socket queue
		1. Congestion
	2. DB IO queue
		1. Congestion
			1. A lot of requests are going to DB but it cannot respond immediately
	3. OS run queue
		1. How much CPU is available
		2. How many threads the system is able to run on the CPU(s)
		3. Congestion
			1. Too many threads
	4. ...
3. Reasons for queue build-up
	1. Inefficient slow processing
		1. Slow algorithm - inefficient code
	2. Serial resource access
		1. If only one thread needs to be executed at a time
			1. Deposit or withdraw of money
				1. All other threads should wait for the thread to finish
					1. Queue builds up
	3. Limited resource capacity
		1. Suppose we are able to execute requests in parallel
			1. We have limited number of CPUs
				1. Analogy: Traffic
					1. If we have 6 lanes instead of 2 lanes (more vehicles can pass at any given time)
4. Analogy
	1. Traffic jam
		1. There is a bottlenect somewhere - reason can be anything
5. Why is there a queue build up?
	1. Classification
6. Goal:
	1. To identify where the queue build up is happening
		1. If we can do that, we can fix the performance problem
	2. If we are architecting or building a new system
		1. We should focus on identifying the areas where this queue building can happend and try to avoid that
			1. Ensures that we have architected a system which is less likely to face any performance problems

### Performance Principles ###
1. Focus:
	1. Efficiency (improve it)
		1. Efficient Resource Utilization
			1. IO - Memory, Network, Disk
			2. CPU
		2. Efficient Logic
			1. Algorithms
			2. DB Queries
		3. Efficient Data Storage
			1. Data Structures
			2. DB Schema
		4. Caching
	2. Concurrency (increase it)
		1. Hardware
		2. Software
			1. Queueing
			2. Coherence
	3. Capacity (increase it)
2. Request types
	1. Serial requests - are processed one after another (only one request exists in the system)
		1. request goes in and response comes out
		2. Second request goes after first response
		3. ...
		4. **Efficiency is considered (single request processing)**
			1. How fast a single request gets processed in a system largely depends on the code that is executing the request
				1. Capacity: Kind of hardware
					1. We can keep this constant
			2. How efficient the code that is executing the request is governs the performance
				1. **Efficient Resource Utilization**
					1. IO, CPU
				2. **Efficient Logic** - it must use minimal amount of CPU and memory and IO (minimal work) - architect is not concerned about here
					1. Algorithms
					2. DB Queries
				3. **Efficient Data Storage**
					1. Data Structures - maps for search (instead of lists)
					2. DB Schema - indexing for search and it must be used by query
				4. **Caching** (architectural concern)
					1. It needs minimal code changes and it leads to phenomenal amount of performance improvement
			3. The above areas ensure that the response time of requests being processed serially will come down drastically (depends on efficiency)
	2. Concurrent requests - at any given time there can be multiple requests present in our system
		1. They are either processed simultaneously or serially
			1. Serial processing: Locking enforces it
		2. **We consider only concurrency and not efficiency**
		3. Concurrency is about executing multiple requests simultaneously in a system
			1. **Hardware** - It should allow our requests to be processed simultaneously
			2. **Software** - We need to code for the hardware that allows simultaneous request processing
				1. Here we don't have to be concerned about intrinsic inefficiencies within a single request (it has already been taken care of previously)
				2. Factors purely related to concurrency:
					1. **Queuing**
						1. It results from multiple requests being simultaneously present on a machine
							1. Not due to external call
						2. Blocking is because of other requests
							1. They are occupying resources (that are required by other requests and are not available)
					2. **Coherence**
	3. Capacity
		1. If we bring in better kind of hardware or increase the hardware - it can help with performance
			1. Capacity augmentation
				1. CPU
				2. Memory
				3. Disk
				4. Network
		2. Not the focus of this course
			1. Mention would be made if it can solve certain problems
				1. Identifying when this is relevant and not the other concepts (efficiency, concurrency)

### System Performance Objectives ###
1. Objectives
	1. Minimize Request-Response Latency
		1. Latency is Measured in Time Units
			1. How much time a request/ response spends within a system
				1. When it goes through, it spends time at different points in a system for processing
				2. When it goes through, it spends time waiting to be processed
			2. Total latency = wait time + processing time
				1. We are trying to minimize
					1. Wait time
					2. Processing time
		2. Depends on
			1. Wait/Idle Time
			2. Processing Time
	2. Maximize Throughput (this is our goal)
		1. Throughput is measured as Rate of Request procesing
		2. Depends on
			1. Latency - (minimizing this can increase throughput)
			2. Capacity - (increasing this can also increase throughput)
				1. This is important
2. Example: 
	1. Web-application - needs low latency
		1. Takes a request and gives response
		2. This also need throughput
	2. Batch processing - report generation say (read and write to db or file)
		1. We don't worry about request-response latency
		2. Throughput is important
3. Architect needs to learn
	1. How to bring down latency of a system - more important to focus on
		1. Capacity is next

### Performance Measurement Metrics ###
1. Metrics to measure to know the performance of a system (4 most important metrics)
	1. Latency
		1. Affects - User Experience
			1. Important
		2. Desired - As low as possible
	2. Throughput
		1. Affects - Number of users that can be supported
			1. Higher the throughput, higher the number of requests that can be supported
		2. Desired - Greater than the request rate
			1. It should be at-least higher than the peak number of users to be supported
	3. Errors (% of errors)
		1. Affects - Functional Correctness
		2. Desired - None
			1. Errors should only be related to performance - usually only timeouts
				1. Usually happens if we subject our system to very heavy workload
			2. It is not okay to have functional errors
				1. The solution cannot be used in production
	4. Resource Saturation
		1. Affects - Hardware capacity required
			1. Tells us how much capacity is completely utilized
				1. 100% CPU utilization
				2. Network is completely choked
			2. These are indications of resource saturation
			3. Unless we saturate the hardware we will not come to know if the hardware is overutilized or underutilized
				1. Based on this analysis, we can decide to whether augment the capacity or take away the capacity
		2. Desired - Efficient utilization of all system resources
		3. Tail latency - it is an indication of queuing of requests
			1. Gets worse with higher workloads
				1. Latency is key to performance exercise
				2. We need to pay attention to tail latency
					1. Y - axis - number of requests
					2. X - axis - latency
					3. Tail latency - small percentage of requests with high latency (tail through)
						1. 12000 milliseconds
						2. from 99 percentile - 1 % of requests have more than 4000 ms
							1. Every 100th request can experience a latency of more than 4000 ms (upto 12000 ms)
								1. Every 100th user might face this latency
									1. If this kind of latency for users is not acceptable, we need to pay attention to tail latency
										1. Say: 99% should be below 3000 ms
								2. Last percentile can be important to business
						3. If we increase the workload, then tail latency might become worse - more requests might shift to the right side
							1. It is worsening of performance problem
								1. Because of queuing of requests (because of other requests, they did not get queued)
						4. This measure can be a good indication of what does increase in workload do to our system
		4. Average latency hides the effects of tail latency
			1. Also measure 99 (or 99.9 - if required by business) percentile latency

### Serial Request Latency ###
1. Efficiency - related to serial request latency

### Network Transfer Latency ###
1. Two kinds of networks
	1. Browser and Web app
		1. Internet can be involved
			1. There could be multiple hops
			2. There could be multiple networks
			3. Some of the networks might not be:
				1. Fast
				2. Reliable
			4. They could be long distance in general and many networks might be involved
		2. Intranet
			1. Pretty reliable - may not be 100% reliable (better than internet)
			2. Fast (as compared to internet)
			3. Communication can be different as compared to browser to web-application
2. Sources of latency
	1. Any network is connected by wires and data phyisically travels by wires
		1. Data to reach from point A to point B - latency is involved 
			1. It is called as data transfer latency
				1. Different for internet as compared to intranet (global, regional, local network)
	2. Creation of connections
		1. TCP Connections
			1. UDP - much faster but unreliable - it is not discussed here
				1. Reliability has to be built into application
			2. Client has to first initiate a connection
				1. For that, if HTTP protocol is used - it is on top of TCP
					1. Overhead with TCP connection:
						1. Client initiates TCP connection
							1. Sends a TCP packet to server
								1. 50 ms say
						2. Server establishes connection
						3. Server sends acknowledgement to client
							1. 50 ms say
						4. Client also establishes connection, sends acknowledgement + data to server
						5. Total roundtrip time: 50 ms + 50 ms = 100 ms per connection
						6. Each subsequent request and response (if connection is already established) will take 100 ms
						7. Total communication time: 200 ms (100% overhead for connection creation)
					2. Overhead with SSL/TLS Connection
						1. Client communication will be over SSL usually
						2. Even intranet communication will be over SSL (if banking application)
						3. Steps
							1. Client initiates TCP connection (TPC SYN)
							2. Server sends acknowledgement (TCP SYN ACK)
							3. Client also sends TCP acknowledgement (TCP ACK)
							4. Client initiates SSL connection (SSL Client Hello)
							5. Server sends acknowledgement (SSL Server Hello)
							6. Client sends key (SSL Key Exchange)
							7. Server sends encyption parameters (SSL Change Cipher)
						4. Time taken for SSL connection: 300 ms
						5. Actual request/response roundtrip time
							1. 100 ms
						6. Total time: 300 ms + 100 ms = 400 ms
							1. Overhead: 300%

### Minimizing Network Transfer Latency ###
1. Approaches to address latencies
	1. Client -> Server: SSL/TLS connection over HTTP
	2. Web application -> REST API: HTTP
	3. REST API -> DB: DB specific protocol or HTTP - it is also over TCP
2. Stategy to reduce connection overhead
	1. Connection pool: Connection is created and pooled
		1. Re-using connections already created
			1. To avoid connection creation latency
				1. We cannot do anything about the latency
		2. Examples:
			1. Business application will have a connection pool for DB
			2. Web application will have a connection pool of HTTP connections to business applications
	2. Persistent Connections: External client (browser) to web application
		1. We don't have to do anything
			1. HTTP 1.1 protocol will make persistent connections
				1. The connection is not destroyed just after one call
				2. It keeps the connection for a while
					1. 5 - 6 consecutive calls - can be done over same connection (if not doing them in parallel)
				3. If client library is used for HTTP
					1. We need to ensure that client is making persistent connection
					2. example: microservices
						1. client libraries should use consistent connections
	3. **Caching**: Data transfer overhead
		1. Reduce size of data
		2. No transfer at all (avoid transfer that is not required) - cache the data
		3. Example: If HTTP service is querying DB (if data doesn't change frequently)
			1. **Data Caching**: Cache the data
		4. Example: Web app
			1. If user data needs to be stored in a session
				1. **Session Cache**: We can use session cache
		5. Browser side
			1. **Static Data Caching** - JS, images, CSS files
		6. Wherever there is an opportunity to cache data, we would cache (to avoid data transfer)
	4. **Data Format & Compression**: Efficient data formats can be used
		1. Intranet: Binary protocols can be used
			1. Instead of using HTTP - uses ASCII characters
				1. We can use RPC based protocol
					1. Examples: **gRPC**, Thrift, IIOP (old days - EJB)
				2. To make data transfer overhead minimal
				3. Cons:
					1. Reduces interoperability between applications
						1. RESTful - needs HTTP to promote inter-operability
				4. If inter-operability is not required, we can use other protocols instead of HTTP based
					1. RPC based (to overcome network data transfer related overheads)
		2. **Compression**: We should always do
			1. Server should compress the data using Zip format say
				1. It reduces size of data (reduces data transfer overhead)
				2. Cons: overhead of compression and uncompression (on client side)
			2. Client can also compress and server can uncompress
				1. Needs some CPU cycles
					1. Pros: This overhead is not that significant as compared to data transfer overhead
	5. **SSL Session Caching**
		1. If repeated SSL connection are created between client and server
			1. Data is exchanged between client and server
				1. Kinds of encryptions client supports
				2. Kinds of encryptions server supports
				3. Paremeters related to encryption (exchanged)
			2. Server can cache the parameters that client transfers to server (for server to identify the client)
				1. Server can take a shortcut to connect to client
					1. It reduces roundtrip for SSL connections
	6. If we use binary protocol for RESTful application, it will not remain a RESTful application
		1. Architecturally (technically it might be)
			1. Certain cases might not require strict RESTful applications

### Memory Access Latency ###
1. Memory Latency
	1. Finite Heap Memory
		1. Whether process is using heap or not
			1. A process can use only finite amount of heap memory
				1. Any process that tries to exceed the limit is bound to crash (problem to deal with)
		2. GC processes
			1. Java or .Net
				1. When process is about to go out of memory
					1. GC will run (aggressively)
						1. Performance will go down (may be drastically)
							1. Users might experience bad performance
	2. Large Heap Memory
		1. If a process occupies large heap memory
			1. It might be ocupying more than what is physically on the machine
		2. It might be bigger than physical memory
			1. OS might have to use hard disk to accomodate that much of extra heap memory
				1. Swapping (between physical memory and hard disk)
					1. Severely brings down the performance
		3. Even if physical memory is huge (to accomodate large heap size)
			1. Problem: Especially with those systems using GC
				1. GC has to do more work
					1. It has to sweep through large areas to clear objects no longer utilised
						1. It slows down GC algorithm
							1. Impacts performance of a system
		4. Large heap size need to be watched out for
	3. GC Algorithm
		1. Different flavors are used
			1. Each algorithms specializes for a given situation
				1. We need to identify the situation and apply appropriate GC algorithm
					1. Or else it might impact performance if dealing with large data
	4. Finite Buffer Memory - On DB side
		1. Any read/ write ops happening on DB, it happens in memory
			1. DB reads record from HDD to memory
			2. The record will be changed in memory
			3. The record is then written back to HDD
		2. Space utilization of buffer memory is critical
			1. It governs how many ops per second we can do
				1. Impacts throughput of DB
		3. If we are in shortage of buffer memory (may be due to poor memory allocation or inefficient schema)
			1. It will severly affect performance of entire system

### Minimizing Memory Access Latency ###
1. Approaches
	1. Avoid Memory Bloat
		1. Process should occupy as little memory as possible
			1. Code base
				1. If number of instructions are fewer
					1. The back and forth between ram and processor will be lesser
			2. Heap space
				1. As small as possible
					1. Lesser job for GC
					2. Chances of process going out of memory is lesser
			3. We can control the two as much as possible
				1. Unnecessary allocation
	2. Weak/ Soft References
		1. Useful where we are allocating large objects
			1. There is a chance of process going out of memory
				1. Solution: Weak or Soft References
					1. Java - this exists
						1. We can declare a reference as weak reference
							1. If runtime notices that process is running short of memory, it lets GC destroy the objects (weak references)
						2. Changes to program:
							1. It should check if the object still exists before referencing
	3. Multiple Smaller Processes
		1. This is better than one single process
			1. If a JVM process occupies huge memory (40 GB RAM say)
				1. RAM - 50 GB
			2. It is still not desirable
				1. It might be too much for GC algorithm to run efficiently
					1. GC can run really badly
		2. If we break the application into multiple processes, the work can be divided between processes
		3. Use cases:
			1. Batch process (for large amount of data)
				1. Multiple JVMs
				2. Multiple nodes
	4. Garbage Collection Algorithm
		1. many flavors are available
			1. Constantly researched and improved
		2. Broadly two kinds of GCs exist
			1. For batch processing - long pauses in-between (GC is done)
				1. GC should be efficient (good throughput)
					1. Overall time taken for GC should be as small as possible
						1. How fast the data will be processed and how soon the batch processing finishes is important (not pause times)
			2. For server processing - GC is run along with main process
				1. Pauses are small
					1. Most of the work is accomplished along with the main process
				2. Example: Server takes request and gives response
					1. If JVM pauses couple of seconds - bit performance blow
						1. Solution: GCs that run along with the application and has very low pause time
							1. Suitable
		3. There is no GC available where there is no pause at all
			1. Process is stopped from doing work
		4. There are many GCs to choose from
			1. We must choose the one appropriate for live process vs batch process
	5. Finite Buffer Memory (DB)
		1. The amount of memory allocated to buffer memory should be adequate (as large as possible)
			1. When DB is considered, it should have adequate amount of buffer memory
		2. **How the buffer memory is utilized is important**
			1. Normalization
				1. Leads to good utilization of buffer memory
				2. Used to avoid duplicate data
					1. Amount of storage for the data becomes lesser (optimal)
					2. Leads to more DB performance
				3. Denormalization:
					1. Done if there are complex joins (to speed up reads)
						1. Where there is no need to de-normalize data, it is better to keep the data normalized
							1. It saves disk space
							2. It saves memory (when loaded)
			2. Compute Over Storage
				1. A way of ensuring good utilization of buffer memory
					1. If certain data can be computed (by business logic say)
						1. We should not store it
							1. Trade-off - computation cost
								1. But might relieve database (if it is under pressure)
									1. Storage on hard disk is fine but when it is brought into memory it is unnecessary

### Disk Access Latency ###
1. Disk Latency - One of the slowest IOs (this is important to consider)
	1. Almost every component in system needs to do disk IO
		1. Example: Logging
			1. Disk penalty is not that high (?)
	2. Disk penalties are high in
		1. Web applications
			1. It needs to access web content like JS file, CSS files, image files from HDD
				1. It causes huge latency
		2. DB Disk Access
			1. Disk latency can be a challenge
				1. Data write or read is usually to and from HDD respectively

### Minimizing Disk Access Latency ###
1. Approaches
	1. Logging:
		1. Sequential IO: We write on a file
			1. It uses sequential access (not random access)
				1. Data is written one line after another sequentially
				2. Sequential IO is much faster than random IO
					1. Accessing record from DB is a random IO
						1. DB tables and records could be scattered across HDD
			2. Sequential IO is not as slow as random IO
		2. Batch IO:
			1. If we can log as much data as possible in one go, that can help in reducing context switching cost
				1. CPU needs to switch between logging and computation
					1. Efficient way: We can combile 4 logging statements into one
		3. Asynchronous Logging: Do asynchronous logging as much as possible
			1. Main thread can be involved in computation
				1. It can provide data to secondary thread and continue
					1. Main thread doesn't have to leave CPU (it can continue to occupy CPU for as much time as possible)
						1. It can make processing efficient
			2. Secondary thread can do logging
			3. Wherever possible prefer asynchronous IO over synchronous IO
				1. Cons: If application crashes somewhere, there is no guarantee that last few statements might not have been logged by async loggers
					1. Unless there is extremely critical that needs to be logged, we can prefer asynchronous logging
		4. Web Content Files:
			1. Web app can have static data stored as files (js, css, html, ...)
				1. They are stored on disk
					1. Fetching can involve IO
					2. They could be fetched frequently
					3. One way to avoid the cost
						1. We can keep the file in memory (caching)
							1. How to do this?
								1. Special components
									1. Reverse Proxy
										1. To separate the responsibility of serving static data and dynamic data
										2. Static requests are served by reverse proxy (does not hit web server)
										3. It specializes in storing the data
			2. Static is read from memory (once it is fetched into memory)
			3. Other free things we get with Reverse Proxy
				1. Page Cache - files already fetched remain in physical memory of the system
					1. Reverse proxy uses page cache efficiently
				2. Zero Copy - when copy is performed from disk over network, we can use **kernel mode** instead of user mode
				3. ...
				4. Examples: 
					1. Varnish
					2. Nginx
			4. **Any static content should be delivered by specialized component such as a reverse proxy**
		5. DB Disk Access
			1. If read only requests wants to be sent to database:
				1. We can cache the data somewhere outside the database
					1. Cache of the server say - we can avoid disk access
			2. Schema Optimization
				1. Denormalization Vs. Normalization
					1. If we find from load test, the problem is with disk IO
						1. Solution: Denormalization
							1. One can store that data in one table (instead of multiple tables)
								1. Going to multiple tables will require disk rotation and can be separate IOs - takes more time than single IO
					2. Use this if disk access is causing problem
				2. Indexes
					1. They avoid lot of data we need go through while we fetch some data
						1. If for instance we need to fetch some data from a table and a row:
							1. If not indexed, we may have to do a full scan to find the row
							2. If we can have an index (filter criteria) on that row, the db can use the index and through the index, it will know the exact disk location where it can find the record
								1. It will directly go to the record in the disk
									1. It will drastically reduce the IO
					2. There could be inefficiencies concerned with incorrect indexing
				3. Query optimization
					1. They should be optimized to fetch minimum possible amount of data
					2. Schema optimization is related to this
				4. Higher IOPS, RAID, SSD Disk
					1. SSD - Can be used if disk access is extremely critical
						1. These are much faster than regular disks
						2. Cons: A little more expensive
					2. Higher IOPS - Input/ Output Per Second
						1. If we are doing a lot of random IO (random seeks)
							1. Prefer HDDs that offer high IOPS
					3. RAID - Redundant Array of Integrated Disks
						1. Same data is replicated over multiple disks
						2. It can be partitioned
						3. Striping & Mirroring
						4. Advantages:
							1. We can read in parallel (does not reduce latency)
								1. IO will be faster
								2. Overall time will be reduced

### CPU Processing Latency ###
1. CPU Latency
	1. Inefficient Algorithms
		1. Many times quite obvious
		2. It can be handled by developers
	2. Context Switching
		1. It is not very obvious
		2. It affects entire system
		3. Issue with context switching
			1. Affects environments where (pretty much all components)
				1. Multiple processes are running
				2. Multiple threads are running
		4. Example: We are running two processes on a single CPU machine

				P1/T1 --->|    |     |    |---->|    |
				          |    |     |    |     |    |
				P2/T2     |    |---->|    |     |    |---->
							  ^
							  |
							wasted time:
				          1. save state of PCB1
				          2. restore state of PCB2

			1. If a process (P1 say) may try to do IO (access disk or network call)
				1. OS will evict the process
				2. OS will give opportunity to the other process to occupy CPU and start it's execution
					1. There is a delay between end of P1 and beginning of P2
						1. OS will save the state of P1 (PCB1) in memory
						2. OS will restore the state of P2 (PCB2) in memory
						3. OS will start P2
			2. How can we avoid incurring cost of context switch?
				1. If we can avoid IO
					1. Even after finishing IO, the process needs to wait for it's turn to execute (context switch)
						1. Overhead can be 100% (100 ms + 100 ms = 200 ms) 

### Minimizing CPU Processing Latency ###
1. Efficient Algorithms - development concern
2. Efficient Queries - development concern
	1. It gets translated to algorithms that fetch data or write data from or to database respectively
3. Context Switching
	1. Batch / Async IO - wherever possible
		1. If we are making multiple calls to DB to fetch data
			1. It is a network overhead + cpu overhead
				1. process or thread is evicted multiple times (due to IO)
					1. It incurs context switching cost
			2. If we can batch multiple calls to one call
				1. It will save network latency
				2. It will save on CPU latency
			3. Writes & reads can be combined to save context switch
		2. Async IO
			1. We write log statements (to find out what has gone wrong with the system)
				1. Separate thread can be used to do logging
					1. Even if logging thread gets evicted (since it is doing IO), the main thread is still continue to execute efficiently
	2. Single Threaded Model
		1. Example: JS Engine (Chrome browser), Node.JS, VolDB, Reverse Proxy like Nginx
		2. Efficient way to run processes is to do all processing work in CPU only through a single thread
			1. Example: All requests go to main thread
				1. If main thread wants to do IO, it delegates it to async thread
				2. Once IO completes, the result is communicated back to the main thread
				3. main thread gets the data and continues processing with the returned data
				4. Process will switch between threads (main, IO threads)
				5. Main thread will almost never leave the CPU
					1. It always has something to process
		3. If we have a large flow of requests, and if we have to do a lot of IO
			1. We can use single threaded model
				1. Appropriate if high load and high number of IOs
	3. Thread Pool Size
		1. We should not have a very large thread pool
			1. If too many thread, they may not get time to execute on CPU (thrashing)
				1. A lot of context switching can happen
		2. Have just the right number of threads for the machine
			1. Example: 2 CPUs - 10 threads (no guideline - it depends on - kind of process, how much IO it does, how CPU intensive it is)
			2. We need to find the optimal size
	4. Multi-Process in Virtual Environment
		1. If we run mutliple processes in a single machine
			1. We should run them in their own virtual environments
				1. Why?
					1. If we are running 4 processes, the processes will contend for the CPU on the machine
						1. If one of the processes continues to hog CPU (written efficiently)
						2. **Virtual environment gives dedicated quota of CPU to each process**
							1. Avoids interference between processes
		2. If it is a performance sensitive system:
			1. If machine is large size,
				1. We tend to run multiple processes on the machine
					1. Certain processes can make other processes starve for CPU (this can be avoided using virtual environments)

### Some Common Latency Figures ###
1. Latency comparison numbers (~2012)
	1. L1 cache reference	- 0.5	ns
	2. Branch mispredict	- 5		ns
	3. L2 cache reference	- 7		ns	(14x L1 cache) - proc mem - worst case
	4. Mutex lock/unlock	- 25	ns
	5. Main memory ref		- 100	ns (20x L2 cache, 200x L1 cache) - for context switch, PCBs are stored in main memory
	6. Compress 1K bytes with zippy	- 3,000 ns
	7. Send 1K bytes over 1 Gbps network	- 10,000 ns
	8. Read 4K randomly from SSD*			- 150,000 ns (~1GB/sec SSD)
	9. Read 1 MB sequentially from mem	- 250,000 ns
	10. Round trip within same datacenter - 500,000 ns (500 us)
	11. Read 1 MB sequentially from SSD* - 1,000,000 ns (~1GB/s SSD)
	12. Disk seek								- 10,000,000 ns
	13. Read 1 MB sequentially from disk - 20,000,000 ns
	14. Send packet CS->Netherlands->CS	- 150,000,000 ns
2. Disk seek - 10^5 mem reference
	1. We want to avoid disk (as much as possible)
3. Compressing and sending data
	1. 1 K - 3,000 ns + 10,000 ns (13,000 ns)
		1. Compression cost is much lesser as compared to sending data over network (3 times or so more)
	2. Significant amount of data can be compressed
4. Roundtrip within data center vs roundtrip between two continents (approximately)
	1. 500,000 ns vs 150,000,000 - 1:300 (300x)
	2. Fetching data within data center is much faster than fetching data from the internet (if it is far off)
		1. Solution: We can do caching
5. Disk access
	1. SSD vs Disk
		1. 150,000 vs 10,000,000 (might be worse for 4K for Disk)
			1. ~50x
6. Sequential IO
	1. Mem vs SSD vs Disk
		1. 250,000 ns vs 1,000,000 ns vs 20,000,000 (1:4:80)
7. Sequential vs Random access
	1. Random access
		1. Mem vs Disk: 100 ns vs 10,000,000 ns (100,000 times more)
	2. Sequential access
		1. Mem vs Disk (1 MB): 250,000 ns 20,000,000 ns (80 times more)

### Concurrency Related Latency ###
1. Parallel request concurrency
	1. If there are multiple requests in the system
		1. How do we minimize latency?
		2. How do we increase concurrency?

### Amdahl's Law for Concurrent Tasks ###
1. Assumption: We have already taken care of serial request or single request latency (minimized to whatever extant possible)
2. Concurrency here:
	1. Concurrent processing:
		1. If we have 3 requests and if we are processing one after the other (serial processing)
		2. If we have 3 requests and if we are processing all at once at the same time (parallel processing)
		3. In many systems it is neither truly serial nor parallel

			->	         ->
			-> -> -> -> -> -> -> ->
			->          ->
			
		1. If we have a synchronized block (java) or if we have taken a lock - the three processes execute serially
	2. Suppose we process serially only
		1. If we have one processor, one thread, one user
			1. 1 request / second say (rate)
				1. 3 requests in 3 seconds (serially)
		2. If we increase the number of processors to 2
			1. 1 request / second only (serial)
	3. Suppose we process in parallel
		1. If we have one processor, one thread, one user
			1. 1 request / second
		2. If we have two processors
			1. 2 requests / second
		3. If we have three processors, three threads, three users
			1. 3 requests / second
		4. If processes are perfectly parallel, the graph will be linear
	4. In general
		1. Overheads
			1. Taking locks
			2. Coordinate between threads
			3. Synchronize threads
		2. There will usually be serial parts
			1. Depending on the amount of serial parts, the graph is in-between
		3. Amdhal's law - tells how much the serial portion affects the graph
			
				C(N) = N / [1 + alpha(N - 1)]
				
			1. C - capacity
			2. N - scaling dimention
				1. like CPU or load
			3. Alpha is resource contention
				1. Alpha = 0, for linear performance
		4. Effect of locking or serialization
			1. If 95% of the process is parallel
				1. If we increase no of processors: Throughput will rise  and flatten (S curve)
					1. Amdhal's law can be used to calculate when it flattens
			2. If 90% of the process is parallel
				1. Flattens quicker
					1. Throughput - almost half of previous one
			3. If 75% of the process is serial
				1. Flattens even sooner
			4. If 50% it is almost as a serial process
			5. If 0% it will be flat
	5. If we want to make a system highly performant:
		1. We have to make it concurrent
		2. We have to make it perfectly concurrent as well
			1. Limitation: Shared resources (by taking locks)
				1. Files
				2. Shared memory
				3. Record in database
			2. Locks will introduce serial portions in the application
				1. Goal: Keep the serial portions as low as possible (< 5% is good enough)
					1. If only 50% - it could be as good as serial

### Gunther's Universal Scalability Law ###
1. Amdhal's law (deals only with queuing)
	1. When processes get serialized, it results in queuing (synchronized portion)
		1. A thread has to take a lock to enter the serialized portion
			1. Other threads which do not have the lock have to wait
		2. **Queuing limits throughput or performance of a system**
1. Universal Scalability Law (combines queuing with coherence)
	1. Queuing + Coherence - limits concurrency of the system

			C(N) = N / [1 + alpha(N - 1) + beta N (N - 1)]
			
		1. C is capacity
		2. N is scaling dimension like CPU or load
		3. alpha - represents resource contention
		4. beta - represents coherence delay
	2. Linear performance when alpha and beta are zero
	3. Coherence:
		1. Example: suppose there are 3 threads executing on 3 processors
			1. L1 & L2 are unique to the processors
			2. Suppose we use volatile variable
				1. It will be consistent across processors
					1. Other variables have copies in each processor (caches)
				2. If we want variable to have same value across all processors, it can be declared as volatile
					1. If we change the variable in one processor, it will force a refresh (of value) of the variable in other processors (caches will be refreshed)
						1. It has a performance cost
		2. If we have a lot of shared variables and we modify them a lot:
			1. The coherence cost will be high
				1. If we increase the number of threads/processors/users
					1. The throughput goes down (reverse U curve)
						1. It will bring down the throughput graph
							1. (graph flattens because of queuing, graph goes down because of coherence)

### Shared Resource Contention ###
1. Causes of Contention
	1. **Listen/ Accept Queue**
		1. Listen Queue: If a new request received by server (assuming other requests exist in the server)
			1. If server is overloaded (slowness may be):
				1. The request will get queued at listen queue itself
					1. Usually if enough processors are not available
		2. Accept Queue
			1. Request crosses listen queue but it will not be processed yet
		3. These can be thought of as network queues
		4. If queue size grows beyond certain size, the requests are rejected
			1. Client will see errors
		5. If requests are accepted
			1. If listen queue and/or accept queue are long
				1. The requests will face much more latency than of those that do not have to wait in the queue (queue time gets added)
					1. Queue is killer of concurrency (queue build up takes place)
		6. Queue is at network gate
	2. **Thread Pool**
		1. CPU - A thread has to allocated for request
			1. It processes thread
		2. There are limited threads (depending on number of processors)
		3. If system is overloaded
			1. There will be contention for thread from fixed size thread pool
		4. There could be increased context switching if we keep increasing thread pool
			1. If we keep limit on thread pool, there will not be too many requests running
		5. Context switching happens if there is any IO or locks the process is waiting for
			1. If there is contention, processes will generally be waiting for many locks (increase of context switching cost as well)
		6. There is contention for thread pool
	3. **Connection Pool**
		1. Suppose process has to make a call to the backend
			1. There is a limit on the number of connections that we can have based on the size of connetion pool
				1. The threads have to contend for connection from connection pool
		2. Backend is running slower than the rate at which threads are processing requests (contention at connection pool)
	4. **CPU/ Disk/ Network**
		1. CPU - contention in the form of contention for threads
		2. Disk - Depends on the disk controller
			1. Only a limited number of threads can be allowed to access a disk at the same time
				1. Practically - **we can assume that we have a serial access to the disk**
					1. Can be assumed for design of system
			2. It can be a source of contention if we do a lot of I/O
				1. Use case: DB access
					1. If too much data is fetched
		3. Network - If network is choked
			1. Sometimes happens in microservices architecture
				1. Internal network
			2. There can be contention for network availability
	5. **Locks**
		1. Biggest source of contention (acquiring locks)
			1. This is required for serial part of the code
				1. Locks are gatekeepers for serial portions of code
		2. If multiple threads are contending for same lock, then it becomes a source of contention
	6. **DB**
		1. Similar contention as disk but CPU, Disk and Network is heavier (?)

### Minimizing Shared Resource Contention ###
1. **CPU/Disk/Network**
	1. As we increase number of requests, the utilization goes up (including **memory**)
	2. Steps:
		1. Serial request latency should be optimized (making use of resources efficiently)
		2. Vertical scaling (for better bandwidth)
			1. Memory - increase memory (and bus speed to access)
			2. Disk
				1. Better disk
					1. RAID - Redundant Array of Independent Disks
						1. **Allows parallel access to disk**
							1. Data is copied to multiple disks
								1. If there are multiple threads looking for same data
									1. Data can be accessed by multiple threads at the same time
						2. DB performance can also be enhanced
			3. Network
				1. More bandwidth
			4. CPU
				1. Better CPU
2. **Listen Queue**
	1. Depends upon thread pool
		1. If lot of requests are coming (web app > services > db)
		2. There could be build of of the queue if web app is not able to serve the requests
			1. Listen Queue grows
	2. Don't have to do much
		1. Only causes problem if we go to extreme scales
	3. Steps:
		1. Ensure that the system is processing requests efficiently
		2. Take care of other contention issues within the system
			1. Internal optimization could minimize the size of listen queue
				1. Thread pool size
				2. Connection pool size
		3. **Tune OS to increase listen queue size**
3. **Thread Pool Size**
	1. It is a collection of threads dedicated for a single purpose
		1. Thread pool provided by container (tomcat, jetty, weblogic say - for web apps, services, (batch request thread pool is not considered here)
			1. Server thread pool for worker threads
	2. If we have smaller thread pool size, the contention will increase
		1. **Listen Queue** can grow (waiting)
	3. We can increase the thread pool size
	4. Other problem: If we increase thread pool size to too high
		1. Threads will be idle waiting for CPU (2000 threads vs 10 CPUs)
	5. Solution: **Optimal size has to be found**
		1. Using load tests
		2. Factors affecting thread pool size
			1. Wait time
				1. Processing time (web app makes call to services which takes time => threads wait for services to finish)
					1. Solution: Larger thread pool size
			2. CPU time
				1. If threads occupy CPU and not make many calls to backend (CPU intensive)
					1. CPU time will be very high
					2. We don't want to go for high thread pool size (?)
						1. More or less equal to number of CPUs
							1. If CPU utilization is 100% and wait time is 0, then number of threads = No of CPUs (ideal case)
								1. Non-ideal cases (waiting exists)
									1. Disk I/O wait
									2. Locking
									3. External calls 
						2. Thread pool size increases is proportional to the wait time
			3. Number of CPUs
4. **Connection Pool Size**
	1. Thumb rule: 1:1
		1. Suppose thread pool size is 100, connection pool size should also be at-least 100
			1. If a request comes to web app and web app wants to make a request to services
				1. 1 HTTP connection will be made to make 1 call to services (at-least)
					1. If single HTTP connection results in multiple services connections, then connection pool size will be > thread pool size
					2. If gateway is used, only one connection will be created with the gateway
	2. Services: Database connections are considered
		1. One thread will make one db connection at a time (multiple simultaneous DB calls is rare)
			1. 1:1 (thread pool size: connection pool size)
				1. Threads usually do transactions (single connection)
					1. It is different for distributed transactions (multiple connections)
5. **Vertical scaling**
		1. Increasing performance of a single machine is considered here
			1. If we are done with handling contentions in a single machine, we can think about multiple machines
		2. Increasing number of threads requires increasing number of CPUs
			1. This needs vertical scaling of the system
		3. Increasing number of db load requires
			1. Increasing number of CPUs
			2. Better disks (RAID may be)
			3. More DB memory
		4. Services
			1. Increase CPUs
			2. Better disks (RAID may be)
			3. More memory
			4. Better network
		5. Vertical scaling is
			1. Making hardware more powerful
			2. Increasing the capacity of the hardware

### Minimizing Locking Related Contention ###
1. Minimizing lock contention
	1. Reduce duration for which a lock is held
		1. Move code out of synchronization block that doesn't required lock (especially I/O)
			1. Example: logging something (I/O) (context switch for I/O)
		2. **Lock Splitting** - Split locks into lower granularity locks (that are exepriencing moderate contention)
			1. Divide scope of lock into smaller parts

					{
						{ // take lock here
							...
						} // leave lock here
						{ // take lock here
							...
						} // leave lock here
					}
					
				1. Go for lower granularity objects
					1. Contention will be reduced
						1. Contention is for two objects instead of one object
						2. Duration will also get reduced		
		3. **Lock Striping** - Split locks for each partition of data like in concurrent HashMap (concurrent data structures)
			1. Example: Concurrent HashMap

					---			(bucket 0)
					-----		(bucket 1) - lock 0
					-			(...)
					-
					-------	(bucket 4) - lock 1
					---			(...)
					--
					...
					-----		(bucket n) - lock k
					
				1. Divide buckets into partitions (16 partitions)
				2. If we want to modify a bucket entry, the lock object responsible for that partition is identified
				3. Only that lock will be used to lock the partition, rest of the partitions will be left
	2. Replace exclusive locks with coordination mechanisms
		1. Use **ReadWriteLock**/ **Stamped** locks
		2. Use **Atomic Variables** (protected by CAS)

### Pessimistic Locking vs Optimistic Locking ###
### Compare and Swap Mechanism ###
### Deadlocks ###
### Coherence Related Delays ###
### Caching ###
### System Architecture for Performance ###
### Caching for Performance ###
### HTTP Caching of Static Data ###
### Caching of Dynamic Data ###
### Caching Related Challenges ###

## Scalability ##
### Module Contents Overview ###
### Performance vs Scalability ###
### Vertical & Horizontal Scalability ###
### Reverse Proxy ###
### A Reference Software System for Discussing Scalability ###
### Scalability Principles ###
### Modularity for Scalability ###
### Replication ###
### Stateful Replication in Web Applications ###
### Stateless Replication in Web Applications ###
### Stateless Replication in Services ###
### Database Replication ###
### Database Replication Types ###
### Need for Specialized Services ###
### Specialized Services - SOAP/REST ###
### Asynchronous Services ###
### Asynchronous Processing & Scalability ###
### Caching for Scalability ###
### Vertical Partitioning with Micro-Services ###
### Database Partitioning ###
### Database Partitioning Selection ###
### Routing with Database Partitioning ###
### Methods for Horizontal Scalability ###
### Dealing with Large Scale Systems ###
### Load Balancing Multiple Instances ###
### Discovery Service and Load Balancing ###
### Load Balancer Discovery ###
### HLB vs SLB ###
### Layer-7 Load Balancer ###
### DNS as Load Balancer ###
### Global Server Load Balancer ###
### Global Data Replication ###
### Auto Scaling Instances ###
### Micro-Services Architecture ###
### Micro-Services Motivation ###
### Service Oriented Architecture ###
### Micro-Services Architecture Style ###
### Transactions in Micro-Services ###
### Compensating Tansactions - SAGA Pattern ###
### Micro-Services Communication Model ###
### Event Driven Transactions ###
### Extreme Scalability with NoSQL and Kafka ###

## Reliability ##
### Module Contents Overview ###
### Distributed Systems and System Failures ###
### Partial System Failures ###
### Reliability Engineering Topics ###
### Reliability ###
### Availability ###
### High Availability ###
### Fault Tolerance ###
### Designing Fault Tolerance ###
### Fault Tolerant Design ###
### Redundancy ###
### Types of Redundancy ###
### Single Point of Failure ###
### Stateless Component Redundancy ###
### Stateful Component Redundancy ###
### Load Balancer Redundancy ###
### Datacentre Infrastructure as SPOF ###
### Fault Detection ###
### Fault Models ###
### Health Checks ###
### External Monitoring Service ###
### Internal Cluster Monitoring ###
### Fault Detection in a System ###
### Recovering from Failures ###
### Stateless Component Recovery ###
### Load Balancer High Availability ###
### Database Recovery with Hot Standby ###
### Database Recovery with Warm Standby ###
### Database Recovery with Cold Backups ###
### High Availability in Large Scale Systems ###
### Failover Best Practices ###
### System Stability ###
### Timeouts ###
### Retries ###
### Circuit Breaker ###
### Fail Fast and Shed Load ###

## Security ##
### Module Contents Overview ###
### Security Objectives ###
### Network Security ###
### Symmetric Key Encryption ###
### Public Key Encryption ###
### Secure Network Protocol ###
### SSL and TLS ###
### Hashing ###
### Digital Signatures ###
### Digital Certificates ###
### Chain of Trust ###
### TLS/SSL Handshake ###
### Secure Network Channel ###
### Firewalls ###
### Network Security ###
### Identity Management ###
### Authentication and Authorization ###
### Authentication ###
### Credentials Transfer ###
### Stateful Authentication ###
### Stateless Authentication ###
### Single Sign-On Within a Network Domain ###
### Token Storage ###
### Authentication ###
### Access Management ###
### Role Based Access ###
### Role Based Access Example ###
### Authorization ###
### OAuth2 Token Grant ###
### OAuth2 Token Grant - Code Flow ###
### OAuth2 Token Grant - Password Flow ###
### JSON Web Tokens ###
### Common Vulnerabilities ###
### SQL Injection ###
### Cross Site Scripting ###
### Cross Site Resource Forgery ###

## Deployment ##
### Module Contents Overview ###
### Large Scale Deployments ###
### Application Deployment ###
### Infrastructure Deployment ###
### System Operations ###
### Modern Deployment Solutions ###
### Application Deployment ###
### Component Deployment ###
### Component Deployment Parts ###
### Provisioning and Configuration ###
### Virtual Machine Deployment ###
### Isolation Through Virtual Machines ###
### Docker Containers ###
### Infrastructure Deployment ###
### Deployment with Docker Containers ###
### Deployment with Containers on Cloud ###
### Deployment with Kubernetes ###
### Kubernetes Lifecycle Management ###
### Kubernetes Naming and Addressing ###
### Kubernetes Scaling with Multiple Instances ###
### Kubernetes Load Balancing ###
### Kubernetes High Availability ###
### Kubernetes Rolling Upgrades ###
### Kubernetes Capabilities ###
### Kubernetes Deployment ###
### Kubernetes Services and Workloads ###
### Kubernetes Architecture ###
### System Upgrades ###
### Rolling Updates ###
### Canary Deployment ###
### Recreate Deployment ###
### Blue Green Deployment ###
### A/B Testing ###

## Technology Stack ##
### Module Contents Overview ###
### Reference System for Using Tech Platforms ###
### Web Applications ###
### Solutions for Web Applications ###
### Apache Web Server ###
### Apache WebServer Architecture ###
### Apache WebServer Scalability ###
### Nginx WebServer ###
### Nginx Architecture ###
### Nginx as Reverse Proxy and Cache ###
### Web Containers & Spring Framework ###
### Jetty & Spring ###
### Node.JS ###
### Node.JS Event Loop ###
### Cloud Solutions for Web ###
### Cloud Storage ###
### Cloud CDN ###
### Services ###
### Services Solutions ###
### Memcached ###
### Memcached Architecture ###
### Redis Cache & Its Architecture ###
### Cloud Caching Solutions ###
### RabbitMQ ###
### RabbitMQ Architecture ###
### Kafka Architecture ###
### Redis Pub/Sub ###
### Cloud MQ Solutions ###
### Datastores ###
### Datastore Solutions ###
### RDBMS ###
### RDBMS Scalability Architecture ###
### NoSQL Objectives & Trade-Offs ###
### Amazon DynamoDB ###
### DynamoDB Architecture ###
### Google BigTable ###
### BigTable Architecture ###
### HBase ###
### Cassandra ###
### Cassandra Features ###
### MongoDB ###
### MongoDB Architecture ###
### Analytics ###
### Analytics Solutions ###
### Logstash Architecture ###
### Logstash Data Streaming Architecture ###
### Fluentd ###
### Elasticsearch ###
### Elasticsearch Architecture ###
### Hadoop HDFS ###
### Map-Reduce ###
### Apache Spark ###
### Stream Processing ###