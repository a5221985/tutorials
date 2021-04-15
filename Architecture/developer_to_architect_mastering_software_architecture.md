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
				4. Advantages:
					1. Performance can go up 16 times (expectation)
						1. If operations are fairly divided among the 16 partitions
	2. Replace exclusive locks with coordination mechanisms
		1. Use **ReadWriteLock**/ **Stamped** locks
			1. **ReadWriteLock**
				1. When dealing with two kinds of threads (against a data structure)
					1. One thread - reading
					2. Other thread - writing
				2. Consider a data structure shared across threads
					1. Two types of locks
						1. Readers can take read lock
							1. While reading, it should not be modified
								1. Other readers can also take the lock (not mutually exclusive) - multiple readers can read
							2. Writer needs to wait for readers to finish
						2. Writers can take write lock
							1. If no readers are reading, writer takes the lock
				3. Advantages:
					1. Readers will not block other readers
						1. If we have a lot of reader threads but small number of writer threads, it reduces contention
		2. Use **Atomic Variables** (protected by CAS)
			1. CAS - Compare and Swap (doesn't take exclusive lock)
				1. Works based on optimistic lock
2. Take away:
	1. Reduce granularity of the lock
	2. Code protected should be as small as possible
	3. Look for non-exclusie locks

### Pessimistic Locking vs Optimistic Locking ###
1. Pessimistic Locking (regular kind)
	1. Threads must wait to acquire a lock
	2. Use when contention is high
	3. May result in deadlocks
		1. One of the participating thread is backed up by receiving an exception
	4. Procedure

			Lock & Fetch Data (Simultaneous)
					| 
				Process
					|
					v
				Update
					|
					v
				Commit (Unlock)
	
2. Optimistic Locking
	1. Threads do not wait for a lock, but backup when they discover contention
	2. Use when contention is between low to moderate
	3. May result in starvation
		1. Switch to pessimistic locking
	4. Procedure

			Fetch Data <--
					|		|
				Process	| On error
					|		|
					v		|
				Lock, Fetch,
				Verify & Update
					|
					v
				Commit (Unlock)
				
		1. Lock is for shorter duration as compared to optimistic locking
			1. Shorter serial portion
				1. Better concurrency
				2. Better performance
		2. Fetch (DB or Memory)
		3. Process - if it takes long time, we can run it outside lock scope
		4. Verify - check if initially fetched data is same as the one fetched again
			1. If so, there was no contention during the last fetch and this fetch
			2. If it is not the same, then the processing was done on stale data
				1. An error is thrown, process is re-run
	5. Dis-advantage:
		1. If there is lot of contention, we may have to back off many times => lot of CPU cycles get wasted
			1. The approach is good if there is no or moderate level of contention

### Compare and Swap Mechanism ###
1. Compare & Swap
	1. CAS is an optimistic locking mechanism
		1. All modern hardware (CPU) support it (OS as well if so)
	2. Java implements support for CAS through Atomic (`java.util.concurrent.atomic.*`) classes

			AtomicInteger ai = new AtomicInteger(10);
			ai.compareAndSwap(10, 20); 
			
			// returns true if value was 10 and sets 20 as the new value (at hardware level)
			// returns false if the value was not 10 as a result of a race condition with some other thread
			// Good for counters
			
			// Cassandra, HBase has similar feature
			select * from inventory where productId = 'Test-Product-7';
			
			productid			| quantity
			---------------------------
			Test-Product-7	| 		100
			
			update inventory set quantity = 200 where productId = 'Test-Product-7' if quantity = 0;
			
			[applied]		| quantity
			------------------------
				False		|		100
				
			update inventory set quantity = 200 where productId = 'Test-Product-7' if quantity = 100;
			
			[applied]
			----------
				True
				
	3. 	NoSQL - Doesn't allow transactions
		1. The only way to ensure atomicity is through optimistic locking
2. Advantage(s):
	1. Since this feature is provided at the hardware level, the performance is good

### Deadlocks ###
1. **Lock Ordering Related** - Reason 1
	1. Result of threads trying to acquire multiple locks
		1. Simultanous money transfer from X and Y accounts by thread T1 and T2
		2. T1: from X to Y
		3. T2: from Y to X
	2. Acquire locks in a fixed global order
		1. Acquire locks only in the sort order of account numbers: X and then Y
			1. Defined: Accounts are pre-sorted
				1. T1 should take lock on X and then on Y
				2. T2 should take lock on X and then on Y
					1. If T1 has taken lock on X, then T2 will not be able to proceed and T1 will be able to take lock Y
	3. Illustration
					
				  T1
			+-----------+
			|			  |
			|			  v
			X			  Y
			^			  |
			|			  |
			+-----------+
				  T2
			
		1. T1 has acquired lock for account X and is waiting for lock for account Y
		2. T2 has acquired lock for account Y and is waiting for lock for account X
		3. Example: If we have 20 threads and two have got deadlocked, we will be left with 18 threads, and if more and more pairs get deadlocked, we will lose most of the threads
			1. Brings down the performance of the application
	
2. **Request Load Related** - Reason 2 (Load induced deadlocks)
	1. Threads waiting for connections to multiple databases
		1. May run out of enough connections resulting in deadlocks
	2. Threads waiting for other threads to be spawned and perform some work
		1. May run out of enough threads resulting in deadlocks
3. Deadlocks
	1. Can throttle performance of the system
	2. Can bring down to a standstill
	3. Illustration:

					| (1)
					v
				gateway --+
			(2)	|	^		| (4)
				v	| (3)	v
			service 1	service 2
			
		1. Request reaches Gateway
		2. Suppose service 1 wants to call service 2 (db say) and it is routed through gateway (3) and (4)
		3. Response goes in reverse order
		4. When load goes up - there can be deadlocks (?)
			1. Suppose gateway service has got thread pool of size 10
			2. Suppose 10 users send requests to gateway
				1. 10 threads get allocated
			3. 10 threads make call to service 1
				1. Suppose 10 threads are allocated to service 1
			4. 10 threads make call to gateway service
				1. But the threads are occupied
					1. The threads will be blocked
		5. If there are only 2 requests,
			1. 2 threads for user and 2 threads for service 1 => 4 threads
				1. There is no blocking
		6. Suppose we are making connection to databases (we ran out of connection pool)
			1. If there is high load
				1. Few threads make connection to certain databases but not others
				2. Few other threads make connection to other databases but not to those already made by first set of threads
4. Solution:
	1. A solution: 
		1. Make service call directly (without going through gateway)
		2. Anticipate load from internal services and increase the size of the thread pool in gateway

4. **We must guard the system from deadlocks**

### Coherence Related Delays ###
1. Coherence Delays (related to shared data)
	1. **Visibility (Volatile)**
		1. Java garantees that a volatile object is always read from main memory and written back to main memory when updated in a processor
	2. **Locking (Synchronized)**
		1. All variables accessed in a sync block are read from main memory at the start of sync block
		2. All variables modified in a sync block are flushed to the main memory when the associated thread exits the sync block
			1. **Synchronized ensures locking & visibility**
			2. **Volatile only ensures visibility**
	3. These guarantees are provided using memory barriers which may result in invalidating or flushing of caches
2. Processor architecture

			CPU				CPU
		L1 Cache		L1 Cache (5ns)
		L2 Cache		L2 Cache (7ns)
				L3 Cache
			RAM - Main Memory  (100ms)
		Hard Disk/	Network Card - NIC
		SSD
		
		L1 Cache - faster
		L2 Cache - slower, bigger, cheaper
		
	1. Suppose T1 is running on CPU1
		1. T1 will load shared data into L1 and L2 caches
		2. T1 modifies shared data, it will be modified in L1
			1. This change will not be visible to T2
				1. If T1 is running a loop and it can be stopped by T2 by setting a value
					1. If code is not guarded by `synchronized` or `volatile` - the change happens only in L1 of CPU2 and L1 of CPU1 cannot see this
	2. Suppose T2 is running on CPU2
	3. Solution: `synchronized`
		1. Suppose T1 modifies variable
			1. It will be propagated to main memory
		2. Suppose T2 wants to read the variable, the variable becomes dirty and it will be read from memory
		3. Drawbacks
			1. High latency (access to RAM - 100ns) - 15 times slower as compared to cache
	4. Solution: `volatile`
		1. Locking related penalty is avoided
		2. Reading is still from main memory
3. We cannot do much regarding these kind of delays
	1. If variable is frequently accessed among threads - coherence related delays can occur
		1. We can try to minimize sharing of data
		2. We can try to reduce the frequency of modifying or accessing the variables

### Caching ###
1. How to make requests more efficient by caching some data

### System Architecture for Performance ###
1. Architecture so far

		UI Client ---> Web Application ---> Services ---> Database
					Persistent Connections      ^      Denormalization
					Response Compression        |      Normalization
					Efficient Encoding          |      Indexing
					Web Content Caching         |      Buffer/ Page Cache
					SSL Session Caching         |
					Session Caching             | 
									^              |
									|			     |
									Thread Pool & Size
									DB Connection Pool
									Efficient Locking
									Query Optimization
									Asynchronous Logging
									Sequential & Batch I/O
									Data Caching
									
	1. Buffer/ Page Cache
		1. Caching done by database
	2. Data Caching - in services
	3. Web Content Caching - static data
	4. SSL Session Caching (SSL connection parameters)
	5. Session Caching

### Caching for Performance ###
1. Caching architecture

		UI Client -||--> Web App --> Services --> Database
			||		static		||				||
		HTTP		data		session		object
		cache		cache		cache			cache
		
	1. Object cache (dynamic data)
		1. data fetched from database
			1. For any user (not user specific)
		2. Service doesn't have to make repeated calls to db for the same data
	2. Web app
		1. Session cache (user level) (dynamic data)
			1. User related data can be stored here
	3. Static Data Cache
		1. CSS, JS, Images, HTML, ...
			1. These files cannot change very frequently
		2. Caching can be at reverse proxy or load balancer
			1. It can have a large file system (HDD space)
				1. All static content can be put here
		3. Caching can be at CDN
		4. Caching can be at public cache
	4. HTTP Cache
		1. Browser cache
			1. Images
			2. ...
2. If something changes too frequently, caching doesn't make sense
	1. If it does not change frequently, it makes sense to cache
		1. Or if many requests can be served before the data changes

### HTTP Caching of Static Data ###
1. HTTP Caching for Static Data (between browser and web-application)
	1. GET method responses are idempotent and hence good candidates for caching
	2. Headers
		1. Cache-control: If a resource can be cached
			1. `no-cache`: Do not use cache without validating with origin server
				1. Browser or intermediate server can cache but it cannot use it without validating with origin server
			2. `must-revalidate`: Like no-cache but need to validate only after its max-age (even if client is ready to accept stale data)
			3. `no-store`: Do not cache at all
			4. `public`: Any shared cache can cache
				1. Any intermediate public cache can cache the object
					1. Useful for multiple users
			5. `private`: Only a client cache can cache
				1. User specific data (profile image say)
				2. private cache can cache this data
			6. `max-age`: Maximum age of a resource in cache, relative to resource request time
				1. How long the client or intermediate servers can cache it
		2. ETAG: A hash code for indicating version of a resource
			1. Invalidates previous version cache
			2. Example: If we have an image on web application and it is labeled as version 1 using ETAG
				1. Any cache can cache or `no-cache` (to enforce e-tags)
					1. Each time browser tries to use the cached image, it validates it against the web-application (can it use or not)
						1. Steps:
							1. Browser provides ETAG value to Web app
							2. Web app looks at ETAG and if it is latest version, it responds that browser can use it
							3. Web app can label ETAG to version 2 and send the response
							4. Browser checks if ETAG sent by web app matches with the one it has
								1. If it does not match, it reloads the image from the web-application and updates ETAG to version 2
2. Caching architecture between web browser and web application

		browser cache -proxy server cache -> reverse proxy cache -> web app
		
	1. Ignoring router servers in between
	2. Reverse Proxy Cache (close to server) - **private cache**
		1. There could be multiple web applications behind the reverse proxy (all requests come to reverse proxy)
		2. This can cache static data
	3. Proxy Server Cache (close to client) - **public cache**
		1. Multiple browser trying to access the same application will converge to this (office say)
		2. It can cache all responses coming from web application
		3. Data of any user can be cached and accessible to public (in the office)
			1. An admin can see this data
	4. Browser cache - **private cache**
3. How do public and private caches know what data to cache?
	1. GET - good candidate for caching (read only)
		1. Every get request cannot be good candidate for caching
			1. If it is serving the data that changes very frequently say
			2. If it is serving data that doesn't change frequently
				1. Good candidate to cache
4. Cache control header
	1. When a web app sends response, it can put a `cache-control` header in the response
		1. Indicates two things (for intermediate caches):
			1. Indicates if the request should be cached
			2. If cached, for how much duration
5. Reverse proxy:
	1. It can exclusively host static content (no static content on web application)
		1. It is responsible for setting cache headers

### Caching of Dynamic Data ###
1. Dynamic data caching - Two approaches
	1. Exclusive Cache (cache per node)
		1. Has low latency
		2. Without routing can lead to duplication
			1. It is okay one is fetching data from any instance
				1. User request can go to any instance
					1. If the data is filled in most of the nodes, it becomes effective - request can go to any of the nodes
			2. Useful for smaller datasets
				1. Example: Currency conversion table
					1. Duplication is okay (small data)
				2. Example: User profile data
					1. Duplication is expensive
						1. We need intelligent routing
							1. Session cache can be used
		3. With routing can lead to uneven load balancing
			1. Session cache
				1. Suppose user request has come to node 1 and it is cached
				2. Next time user request comes:
					1. A cookie can be stored in user browser that tells what node the user connected to in the previous request
					2. The user can be redirected to the same node
						1. If data is present in the cache, request can be served
				3. Advantages:
					1. Duplication of data can be avoided
					2. Very fast as compared to shared cache
						1. Cache is internal
							1. It is stored at the node and fetched quickly if request comes to the node
				4. Disadvantages:
					1. Requires routing of data to specific node
					2. Scalability issues
					3. Requires additional mechanism for this to work
		4. Illustration

									Node 1 [Cache Data]
								/
				Browser - LB -	Node 2 [Cache Data]
								\
									Node 3 [Cache Data]
		
		5. Example: Web-application
			1. Each web-app node can cache data in it's own memory
				1. It resides within the instance (service data say)
	2. Shared Cache (caching is deligated to an external component)
		1. Higher latency due to an extra hop (in network)
			1. Adds some cost (ms)
		2. Can scale out to a distributed cache
			1. Memcache
			2. Redis
		3. For large datasets
		4. Illustration

									Node 1
								/ 			\
				Browser - LB -	Node 2 - [Cache Data]
								\			/
									Node 3
									
		5. Advantages
			1. Intelligent routing is not required
				1. Only one cache
			2. Easy to scale out this cache
				1. Scaling responsibility can be decoupled to caching mechanism
				2. They can be clustered easily
					1. Can cache huge data
			3. Good for large data sets
			4. No intelligent routing
			5. No duplication of data
2. Where do we need this dynamic data caching?
	1. Services
		1. If they fetch data from database
			1. If it is not changing very frequently
			2. If it is accessed more frequently
	2. Web Application
		1. User profile info (say it is from database)
			1. If user asks for user profile again
				1. Cached data can be returned
3. Dynamic data that doesn't change frequently can be cached

### Caching Related Challenges ###
1. Any caching strategy has the following two limitations:
	1. **Limited cache space results in early evictions**
		1. Data is read only
		2. Prefer caching for frequently accessed objects
			1. **Cache fast-moving consumer goods** vs slow moving goods
				1. e-commerce store
					1. Not many people will be accessing slow moving goods
					2. Many people will be accessing fast moving goods and the goods will likely be unchanged for long periods of time
		3. Average size of cached objects should be as small as possible
			1. Large sized objects results in cache getting full too soon causing evictions
				1. Small objects occupy lesser space so more number of objects can be cached
					1. Optimizes cache size as well
	2. **Cache invalidation & cache inconsistency** (if data becomes stale it becomes in-consistent with main source)
		1. Requires update/ delection of cached value upon update (of source)
			1. Not an option when a cache is outside of a system (public cache say - HTTP cache - not in our control)
				1. We cannot update or delete contents of the cache
			2. No cache inconsistency
				1. Cache is immediately updated with source data if it changed - brings down inconsistency duration to bare minimum (cache is part of the system)
		2. TTL value can be used to remove aged data (results in cache miss - HTTP caching say) - TTL is Time To Live (object based caching)
			1. High TTL results in more cache hits
				1. Inconsistency interval increases
			2. Low TTL decreases inconsistency interval
				1. Cache hits go down
			3. Cache receives TTL along with object and it cannot be changed
				1. Disadvantage:
					1. May need trial and error to figure out a good TTL value or could be based on other statistics (which needs time and data)
					2. Suppose TTL is still valid and data has changed at source
						1. Client will be receiving stale data
							1. TTL is 1 hour and data changes every 5 minutes
					3. TTL is 5 minutes and data is updated every hour
						1. We will be hitting source every 5 minutes unnecessarily
3. Cache Hit Ratio: (used to measure effectiveness of cache)

		cache hit ratio = # of cache hits / (# of cache hits + # of cache misses)
		
	1. \# of cache hits - if data is served by cache
	2. \# of cache misses - if data was not served by cache
	3. \# of requests - \# of cache hits + \# of cache misses
	4. If cache hit ratio is high - more effective
4. Caching is based on memory
	1. It is not a cheap resource
		1. Database stores data on disk - cheaper
			1. Memory cannot store this amount of data (very expensive)
				1. TB of cache (memory) is prohibitively expensive
		2. We need to decide what to cache and what need not be cached
5. We need to look at trade-off while designing caching strategy

## Scalability ##
### Module Contents Overview ###
1. System Scalability
	1. Scalability
		1. Vertical & Horizontal Scaling
	2. Horizontal Scalability (ways to achieve it)
		1. Replication
		2. Services
		3. Caching
		4. Asynchronous Process
		5. Partitioning
	3. Load Balancing (How to load balance)
		1. Load Balancers
		2. Service Discovery
		3. DNS & Geo Load Balancing (for global solutions)
	4. Micro-Services (helps in highest degree of scalability)
		1. Architecture
		2. Transactions
		3. SAGA Pattern (compensating transactions)
		4. NoSQL (for scalability)

### Performance vs Scalability ###
1. Performance - meausured for **fixed load**
	1. Low latency (request-response time is low)
	2. High throughput (rate at which system is processing requests)
		1. Concurrency (increase)
			1. Single machine - multi-threading
			2. Multi machine - multi-threading + multi-processing = distributed processing (this was not considered before)
		2. Capacity (augment)
2. Scalability - measured for **for variable load**
	1. High throughput
		1. Definition: **Ability of a system to increase its throughput by adding more hardware capacity**
			1. 1 million users or 10 million users
				1. We want to see how the system will perform if we increase and/or decrease the load
	2. Both ways - UP and DOWN
		1. We should be able to scale up or down (to save cost)
	3. Scalability is performance under variable load

### Vertical & Horizontal Scalability ###
1. Vertical (we replace smaller hardware with a more powerful hardware (4 CPU to 32 CPU, 16 GB RAM to 256 GB RAM)
	1. Easier to achieve
		1. Very costly
	2. Limited scalability
		1. Expensive to get high end machines (may be exponential)
		2. It may be infeasible (such hardware may not exist)
2. Horizontal (we add more hardware - more such machines are brought up of the same power - 3 machines of 4 CPU & 16 GB RAM - cost goes up linearly (not exponentially))
	1. Hard to achieve
		1. Software should be designed to support this (coordination is required)
	2. Unlimited scalability
		1. Practically it is high
		2. Unlike vertical scalability, we can scale down and re-purpose the machines for other uses
			1. Cloud env - we can rent out and return to scale up and down respectively

### Reverse Proxy ###
1. Reverse Proxy
	1. Client needs to know only about the address of reverse proxy
		1. If load balancer does not exist
			1. Client needs to know about all the machines to distribute requests
				1. Clients need to remember IP addresses
					1. Not practical if we scale (dynamic property - can increase or decrease)
		2. Can be used for internal clients as well (IP address can be remembered)
		3. External client - only remebers DNS name which will be resolved to IP address by DNS server(s)
			1. DNS can map one DNS name to multiple IP addresses
				1. It is not going to be used as reverse proxy
					1. It can have stale data for quite some time (instances can be dynamically changing)
	2. Reverse proxy can also act as a load balancer
		1. Reverse proxy - sits near server side
			1. Every request intended to server goes through reverse proxy
			2. It can also decide which server can serve the request
				1. Can be configured to act as a load balancer

### A Reference Software System for Discussing Scalability ###
1. System for Scalability Discussion

		Web Browser -> Web application -> Business Application -> Database
		
	1. How to scale the application? - to handle millions of users

### Scalability Principles ###
1. Principles to make a system horizontally scalable: (scalability depends on the following principles)
	1. **Decentralization** (one component is not responsible all the different kind of work) - Monolith is an anti-pattern for scalability (if there is only one component for the entire load the system is facing - the only way to scale is vertically) - there are multiple components of different kind for the work
		1. More workers - Instances, Threads
		2. Specialized workers - Services
			1. Different kind of workers for different kind of work
	2. **Independence** (benefit of lots of workers is when they can work independently) - coordination may be required if there is shared data (db access say)
		1. Multiple workers are as good as a single worker if they can't work independently
			1. They must work concurrently to maximum extent
		2. Independence is impeded by (coordinator may be required)
			1. Shared resources
			2. Shared mutable data
				1. DB
				2. File
				3. ...
		3. Coordinator becomes bottleneck
			1. If we increase number of workers, the load on coordinator also increases
				1. 100 workers to 1000 workers
					1. Load on coordinator will be up by 10 times
						1. System will fail at some point
		4. Solution:
			1. If workers can be made to work independently
			2. If requirement for coordination can be minimized

### Modularity for Scalability ###
1. Modularity (scalability can be started from here)
	1. Scalable architecture starts with modularity
		1. Provides the foundation for breaking an application into more specialized functions / services
	
				Web Browser -> Web App -> Business App -> DBMS
												- API Protocol Layer
												- Service Modules:
												  User (module)
												  Catalog (module)
												  Order
												  Inventory
												- Data Access Layer

			1. Modularity applies to Business Logic (Business App mostly, and a little with Web App)
				1. It can be dividied such that
					1. It is not coupled
					2. It must be loosely coupled
					3. Later can be made completely decoupled (if possible)
	2. First make business logic modular
	3. Make API Protocol layer decoupled from business logic
		1. This can change independently from buisness logic
	4. Make Data Access Layer decoupled from business logic
		1. This can change independently from business logic

### Replication ###
1. Replication
	1. For handling increasing workloads
		1. Stateless (no data involved)
			1. Code Replication
				1. Web application - has 3 instances (running same code) - statelss/ stateful
				2. Service application - has 3 instances (running same code) - stateless
				3. Stateful:
					1. It is used in some circumstances
		2. Stateful
			1. Code & Data Replication
				1. Database (stateful) - has 2 instances
					1. Data synchronization
						1. Data written on one instance should get propagated to other instances
	2. Why?
		1. When load on system increases and if one machine cannot handle the load, we can scale horizontally
			1. User load can be shared among multiple instances
			2. DB - depends on the kind of replication used

### Stateful Replication in Web Applications ###
1. Stateful replication is done: When low latency is required (web app)
	1. Sticky sessions/ session affinity
		1. Session data is stored in an instance identified using id
		2. Client is returned a cookie with the following info:
			1. Session id
			2. Node id
		3. Client sends request to load balancer
		4. Load balancer checks the node id sent and redirects request to the node
			1. Latency is reduced (by reducing hops)
	2. Sessions occupy memory
	3. Session clustering for reliability
2. Example: Suppose user wants to fetch user profile
	1. User sends request to web app
	2. Web app forwards request to services app
	3. Services app sends request to DB
	4. The profile goes back using the same route
3. The number of hops can be reduced by storing profile in Web-app
	1. First time, the user profile data is obtained from DB
	2. Web-app stores user profile - in the instance hit
4. Limitations related to:
	1. Scalability
		1. Each session data occupies memory
			1. Suppose it occupies 1 MB per user
			2. 500 MB of total memory
			3. => 500 connections is the limitation
			4. CPUs and threads limit actual connections to 2000 connections simultaneously
				1. But due to session limitations, it can serve only 500
					1. More machines are required to serve remaining requests (due to session memory limitation)
						1. Operation cost will go up
	2. Reliability
		1. Suppose a node goes down (Node 1)
		2. If load balancer receives a request and it has to route it to node 1, node 1 is no longer alive
			1. Load balancer route to any of the other nodes
				1. The session data needs to be fetched again (full latency is the cost)
				2. All the users whose session data was stored on node 1 will get affected
					1. All of them will experience high latency (until caches are refreshed)
		3. If user has made changes to session data (user profile data) and it has not been propagated to the database yet and node goes down
			1. The changes will be lost
			2. User will see old data
				1. Solution: Web-Logic, Web-Sphere provide clustering session feature
					1. Session data gets clustered on other machines

							node 1 -- session 101 data
							...
							node i -- session 101 data
							...
							
						1. If a machine goes down, users can be diverted to node i
						2. When user makes changes to session data, clustering logic will ensure that the changes are propagated to replica
		4. Drawback
			1. Complicated
			2. Messy to handle
	3. Not preferred approach
		1. Stateless replication is the preferred approach
	4. Where is it used?
		1. If the above are not serious limitations and do not outweigh limitation on latency side

### Stateless Replication in Web Applications ###
1. Web Stateless Replication
	1. For higher scalability at the expense of higher latency
		1. No longer store data in web-layer
		2. Each time we go to the database and fetch data
			1. Issue: Added latency
				1. Solutions:
					1. Session data can be stored on:
						1. Client side in Cookies
						2. Server side in Shared Cache
							1. Options:
								1. Memcached
								2. Redis
							2. First time, request goes to DB and stored in cache
							3. Second time, request goes to Cache
								1. Latency is saved
									1. Not as fast as web-app memory
						3. Overhead
							1. Additional component - shared cache
						4. Advantages:
							1. Good for large amounts of data
							2. If there is non client specific data
							3. If any instance goes down
								1. Data is not lost - it is there is cache
								2. If cache goes down
									1. Application nodes can fetch data from database and fill the cache again
					2. Storing session data on user side (in cookies)
						1. The request will come along with session data to the web app
							1. Limitation: Cookies cannot carry a lot of data
								1. Network cost (if multiple hops are required)
						2. Good for small amount of data
2. Go for stateful if requirements for latency is extremely critical

### Stateless Replication in Services ###
1. Stateless replication - same as web stateless
	1. Similar to web app
		1. One can go for stateless replication
			1. Data that is more frequently read than modifed can be stored in a cache (shared cache)
	2. Challenges
		1. Introduction of additional complexity with shared resources
			1. If all instances are using shared resource (file say) and writing to it in a transaction mode
				1. We cannot synchronize using locks because the instances are separate (not managed by same OS)
					1. Solution:
						1. Lock table in database
							1. Take a lock on a row
							2. Modify the file
							3. Commit the row

### Database Replication ###
1. Database Replication (considering RDBMS systems - general use cases, NoSQL - specific use cases)
	1. For higher read scalability
	2. For high availability
2. A solution: Vertical scaling
	1. There is point where it doesn't work
3. How to scale?
	1. Read replica is created (another db instance)
		1. Any change happening to master db gets replicated to read replica
			1. Some of the read load can be diverted
		2. Master can take both read and write loads
	2. Advantages:
		1. If there are large number of read requests (as compared to write requests), this approach scales
	3. Backup replica
		1. Used for high availability
			1. if master goes down, the backup can be promoted as master

					-R/W->	Master DB -> Backup DB
								|
								v
					-R-> Read Replica DB (Slave/ Secondary)

### Database Replication Types ###
1. Master-Slave (Primary-Secondary)
	1. Asynchronous (read replica)
		1. Low latency writes
		2. Eventually consistent
		3. data loss
	2. Synchronous (backup)
		1. Consistent (both dbs are in sync)
		2. High latency writes
		3. Low write availability

				Service -R+W-> Master/Primary
					|				|
					|				Uni-directional
					|				replication
					R				|
					|				v
					+---------> Slave/ Secondary
					
			1. Any changes that go to master are replicated to slave in due course of time
				1. Two ways to do this
					1. Asynchronous
						1. If client writes to database, once transaction is successful, it is acknowledged immediately (by the master)
						2. Whatever changes done are propagated to slave(s)
							1. Time delay can exist
					2. Synchronous
						1. If client writes to master db
							1. The changes are immediately propagated to secondary db
							2. When secondaries acknowledge that the changes are applied, the primary acknowledges to the client that the transaction is committed
		3. Properties - reasons we do this are
			1. High read scalability (many read replicas can be made availability)
			2. High read availability (if one of the instances goes down, other replicas can serve the requests, if master goes down, read replicas can serve the requests)
			3. No write conflicts
	3. Differences between asynchronous and synchronous replications
		1. Asynchronous
			1. Changes are propagated after transaction completes (involving only master)
				1. Faster because only master is involved
			2. Consistency - there is lag
				1. Secondary may not have the most latest data
					1. If client reads data from secondary when master is different, client gets stale data
						1. It is eventially consistent
							1. After a delay, they become consistent
			3. If master db goes down and secondary is promoted
				1. Certain changes not promoted to slave are lost
			4. Writes become unavailable only if master goes down
				1. If secondary goes down, write can still continue
					1. It can pickup when it comes back
			5. It can be used in cases where we need high read performance, low latency reads and writes
		2. Synchronous
			1. Slower because all master and slaves have to be synchronized before comitting the transaction
				1. Slower write latency as compared to asynchronous
			2. Consistency
				1. Data is always consistent (transaction takes care of that)
			3. Low write availability
				1. Suppose read replica goes down & synchronous replication is established between master and slave
					1. Since secondary is not available, transaction cannot be completed (because transaction needs to update secondary as well to complete)
						1. Writes become unavailable if any of the databases goes down
			4. This can be used for backups
				1. Not for read replicas
				2. Master and backup will be in sync with each other
					1. Brings down latency a bit (as compared to asynchronous)
					2. But if master goes down, backup will get promoted to become master (without loss of data)
2. Master-Master (No-Master/ Peer-To-Peer)
	1. Asynchronous (multi-geography)
		1. Write conflicts
		2. High availability
			1. It does not matter which database goes down (we can write to other databases)
	2. Properties
		3. High read scalability
		4. High read write availability
		5. Transaction ordering issues

				Service -R+W-> DB1
									^
									|
								Bi-directional
								replication
									|
									v
				Service -R+W-> DB2
				
	3. Client can read/write on any of the instances
		1. Replication is bidirectional
			1. Change in one is propagated to other database
		2. Flavours
			1. Asynchronous
		3. Challenge:
			1. Write conflict
				1. If changes are made in both db instances to the same record at the same time
					1. In master-slave - there is only one source of truth
						1. No write conflicts (this is popular and simple)
				2. Not easily resolved
		4. Use case:
			1. Different data exist in different databases (not same records)
				1. User writes to the db close to the user
				2. If user from one location wants to write data of another location, the data is written to the remote location.
					1. Write latency is higher of remote location
			2. Business rules need to be written to handle write conflicts
		5. Clock skew can be present between the instances
			1. May cause transaction ordering issues

### Need for Specialized Services ###
1. Need for specialized services
	1. Service modules: (they live within same application instance)
		1. User
		2. Catalog
		3. Order
		4. Inventory
		5. Notification
	2. Scalability issues
		1. Extra load - updating inventory
			1. Warehouses review and upload updated inventory
				1. Load on system goes up
			2. We want to add more instances for inventory module only
				1. But bloated app has all the modules
					1. All modules need to be scaled (all resources (db connections, ... will be required)
						1. The operational issues can be fixed if we break our monolith application into smaller services

### Specialized Services - SOAP/REST ###
1. Specialized services
	1. Partially independent development and deployment
		1. There is still some dependency
			1. Common database
			2. If SOAP schema - WSDL dependency
				1. RESTful - the dependency can be got rid of
	2. Independent scalability
		1. Any service can be scaled independently
			1. Catalog service say
				1. More instance for Catalog service
	3. Independent technology
		1. Technolgy used to develop the services can be independent of each other
			1. User Service - .Net
			2. Catalog Service - Java
			3. Order Service - C++
			4. ...
2. Consequences
	1. We can independently develop the service (partial dependency)
		1. User service developer does not need to know the inner details of catalog service
			1. But shared tables of DB (one service cannot modify the schema)
	2. We can independenty deploy the service (partially)
		1. Patch on User service can be added independently of other services
		2. But common libraries and schema cannot be deployed independently
	3. Increase in complexity of the system
		1. Web application
			1. Needs to interact with multiple services say (complex interaction)
		2. Mobile client
			1. Complexity of app
				1. They are usually external to the system (unlike web application) - difficult to locate where which service is available
		3. **Solution**:
			1. RESTful Aggregator/Gateway Service
				1. Reasons for Gateway Service
					1. Workflow complexity
						1. Single point of contact for all clients (web or mobile)
							1. Aggregation of responses are taken care by aggregator service
					2. Inter-operable interface on gateway service
						1. This is essential here but not for internal services
							1. Inter-service communication can be on gRPC or Thrift (binary protocol)
								1. Faster (performant)
						2. Clients can use REST or SOAP
							1. Thrift or gRPC can also be used by clients
3. Caveat - Single instance exists for write load
	1. Problem if load becomes very high

### Asynchronous Services ###
1. Async services effectively reduces write load from a database
	1. Message queues - 
		1. Used to integrate client and server if interfaces are different (not compatible) (?)
		2. Used to reliably deliver message from client to server
		3. Scalability - used to offload some write load on databases
			1. Where to use message queue?
				1. Suppose order booking request takes time to process
					1. Order service:
						1. Accept the order
						2. Validate the order
						3. Persist it in messaging queue (processed later)
							1. Previously this step was done synchronously
								1. Also talk to inventory
							2. Message queues are fast at accepting messages (they are designed for that)
						4. Send response to user (acceptance)
					2. Order Processing service
						1. Pulls requests from messaging queue
							1. Push requests to order processing service can also be implemented as an alternative
						2. Talks to other servicess (Inventory say)
						3. Processes requests
						4. Talks to notification service
							1. Notification service - notifies user of order creation
2. Asynchronous processing:
	1. Where to use it?
		1. Where write operation is the main operation
			1. Read operation: request goes through system (db if required) processed and displayed to user
				1. Here asynchronous processing cannot be used (we need to respond immediately and show information immediately)
			2. **Predominantly write oriented operations: Write operations where intermediate read operations dont have to be shown to user**

### Asynchronous Processing & Scalability ###
1. Async services require infrastructure for average load as opposed to peak load
2. Order requests coming to order service are processed in order processing servie are written to database
	1. If we are receiving 50000 requests/sec on order service, db is also processing 50000 requests/sec
		1. DB has to scale at the same rate as order service
		2. There could be other requests from other services coming (common db for services)
		3. Load on DB will become very high
	2. Solution: Asynchronous processing
		1. Load on system will not be constant throughout and it varies
			1. Peak periods - request rate will be high
				1. The requests coming during peak periods can be stored
				2. When load on system is lesser, we can process the stored requests
					1. Requests don't have to be rejected
				3. A threshold can be used
					1. Any requests above 10000 requests/ second cannot be handled & lower rate can be hanled by the DB
						1. The scaling gets stopped dat 10000 requests/ sec
							1. This can be changed by introducing message queue + order processing service
								1. Message queues can scale much higher than databases (100000 requests/ sec say)
									1. They are fast because very less processing
				4. DB will continue to process at it's maximum rate
					1. 10000 requests/ sec
			2. When request rate goes down below 10000 requests/ sec
				1. DB and order processing service will catch up with the backlog accumulated
				2. Backlog gets reduced during lull periods (when there is no much load)
			3. Alternative - more database is needed
				1. Problems: 
					1. Even if the rate is slightly higher, db will not be able to handle them
					2. The rate doesn't last very long and could be in multiple short bursts then DB will be underutilized (on an average)
		2. Consequence: Peak load is distributed over a period of time
3. Asynchronous processing wherever it is possible to introduce can increase the scalability of the system	

### Caching for Scalability ###
1. Caching reduces latency and reduces overall read load
	1. Recap
		1. If there is data that is very frequently read and is not modified so frequently - candidate for caching
		2. Points where we can cache
			1. Database: Object Cache
				1. Services can utilize instead of going to database (read)
			2. Web application: Session cache or regular cache
				1. Data related to user session
				2. Global data can also be cached
			3. Reverse proxy: Can cache static data
			4. Proxy: Can cache static data
			5. Browsers: Can cache static data
	2. Consequences
		1. If data is available in browser cache, call is not made to the system
			1. Load on system will reduce
		2. If static data is available on reverse proxy, call will not be made to web application
			1. Reduces load from web application and rest of the system behind
		3. Web can cache data and not make calls to services
		4. Services can cache data in object cache and avoid making calls to database
		5. If we can reduce calls using caches, we can reduce load on the system components (especially database - it is hard to scale because it is stateful)
			1. Read replicas can be created but write load is still a bottleneck
			2. If read load is offloaded to cache, db gets freed from load
				1. This gives some breathing space to the database to increase it's write load (capacity gets utilized to serve write loads)
2. Two ways to reduce load on database
	1. Asynchronous processing using message queues (reduces write load by distributing in time)
	2. Caching for read load (reduces read load by offloading it to cache)
	3. This further scales database and the entire system

### Vertical Partitioning with Micro-Services ###
1. Micro-Services completely decouples services and databases for higher scalability
	1. Suppose we need to handle more load than what has already been done
		1. Write load (cannot be distributed for RDBMS)
			1. Solutions:
				1. Depends on the kind of data we are storing
					1. Each service represents a domain in the business logic
						1. Inventory
						2. Order
						3. Catalog
						4. User
							1. User Authentication (service)
							2. User Profile (service)
					2. We can separate data based on domain, we can host the data on different databases
						1. Inventory -> Inventory DB
						2. Order -> Order DB
						3. Catalog -> Catalog DB
						4. User -> User DB
					3. Roughly the system is 4 times more scalable (or more)
					4. Challenge:
						1. We may have to get rid of common tables
							1. Each db is responsible for a particular data according to business domain it belongs to
								1. Order service talks to only Order DB
								2. If Order service wants Catalog data:
									1. It should go through Catalog service
										1. There is separation of responsibility
					5. Consequences:
						1. The DBs can be scaled independently
						2. The DBs can be deployed independently
						3. The DBs might have different load
						4. Write load is distributed among different DBs
					6. Drawback:
						1. We have sacrificed ACID transactions
							1. Suppose Order service was previously doing transactions over multiple tables
								1. The tables are distributed across databases
									1. This is no longer possible
2. Vertical Partitioning:
	1. Services & Data are vertically partitioned
		1. Inverntory -> Inventory DB
		2. Order -> Order DB
		3. ...
	2. This is microservices architecture
		1. Used for high levels of scalability
			1. If we have run out of other ways of scaling the system
			2. Good to scale for write load

### Database Partitioning ###
1. Used for extreme scalability
	1. Context:
		1. Vertical partionaing of system
			1. DB split based on domain (Catalog -> Catalog DB, ...)
			2. Limitations:
				1. 10 domains say - 10 times scalability approximately
			3. This is not sufficient for higher levels of scalability
				1. Extreme load say (after vertical partitioning)
					1. Solution: Horizontal partitioning
						1. Suppose Order db is heavily loaded
							1. Range partitioning: (id is pk) - if we increase or decrease the number of nodes, we may have to change the way we partition (complicated)
								1. Logic:
									1. ids 1-100 hosted on node 1
									2. ids 101-200 hosted on node 2
									3. ...
								2. Challenges:
									1. Re-partitioning is required if we increase or decrease the number of nodes
									2. If nodes go down, re-partitioning may be required
								3. While inserting or fetching data, we need to have the logic to send the request to the right node
								4. Issues:
									1. We cannot do ACID transaction on records
										1. Single record ACID transaction is possible
										2. If 10 records live on different nodes, we cannot do ACID transactions
											1. Same problem as with vertical partitioning
										3. Even within domain we cannot do ACID transactions
								5. This kind of partitioning is not popular with RDBMS
									1. The transaction logic needs to be in the application
									2. We have to deal with eventual consistency
									3. Recently even RDBMS are providing auto-sharding or auto-partitioning
										1. Read the docs
								6. This kind of partitioning is popular with NoSQL databases
									1. It is taken care of internally
							2. Hash partitioning:
								1. Logic:
									1. Hash(id) % N = 1
									2. Hash(id) % N = 2
									3. ...
								2. In practice - %N is not applied - consistent hashing technique is used (a variation as well is used)
									1. Sophistication
										1. If any node goes down or we add new nodes, to rebalance data, there is minimum amount of disruption in terms of moving data
										2. Updates and inserts become scalable
								3. Downside:
									1. We lose ACID transactions
									2. Overall complexity increases
										1. More hardware
										2. More complexity to architecture (and implementation)
2. Use case: Go for DB partitioning if vertical partitioning is not sufficient for scaling out

### Database Partitioning Selection ###
1. Range Partitioning

		SELECT * FROM Order WHERE id = 150
		SELECT * FROM Order WHERE id > 150 AND id < 250
		
	1. Node 2 has data between 101..200 and Node 2 has data between 201..300
		1. We need to visit both nodes for the range
	2. Use case: If we are searching data on a range, we can split the data based on range
	3. Use case: If we are searching data based on single id

2. Hash Partitioning

		SELECT * FROM Order WHERE id = 150
		
	1. We cannot do range queries (150 and 250)
		1. We have to run 100 queries for each id (they can be bached if db supports but they are separate queries)
		2. The queries may go on different nodes
			1. There is chance that each query may run on a different node (100 nodes are hit)
				1. Hash partitioning ensures that the keys are distributed evenly
		3. Range partitioning is costly with hash paritioning scheme
		4. **It is good for CRUD on records based on key**
3. Range partitioning is a superset of Hash partitioning
4. Advantages of Hash partitoining:
	1. Performance is higher for id based query as compared to range partitioning
		1. Indexes are tree based entries	 for range based partitioning
			1. Index tree may be on multiple nodes (distributed db and indexes may be kept on multiple nodes)
			2. If we want to look for a range, we have to go through the tree structure (many machines may need to be visited)
				1. Latency may get increased
		2. Hash partitioning directly identifies the node
			1. We don't have to go through any index tree on multiple nodes
			2. Client can calculate the node and server is not required
3. NoSQL DBs have their own query language
	1. RDBMSs are simple to understand and universal

### Routing with Database Partitioning ###
1. CRUD requests
	1. Considered horizontally partitioned Order table
		1. How to get data? (of id = 256)
			1. Three ways:
				1. Client library - (CouchDB, Memcache)
					1. They are cluster aware (they know how many nodes are in the cluster)
						1. When we run query
							1. The library applied hashing algorithm to determine the node and fetch the data
				2. Router Component - (MongoDB)
					1. Hosted as a server application
					2. Any client can send the request to the router
					3. The router determines node where the request can get served (hash partitioning or range partitioning)
					4. The router is cluster aware + aware of the partitioning scheme
				3. Contact any node - (DynamoDB, CassandraDB)
					1. The contacted node takes the responsibility of forwarding the request to the right node

### Methods for Horizontal Scalability ###
1. Horizontal Scaling Methods
	1. Services (breaking monolith into services)
	2. Replication (more workers)
		1. Stateful (Db are stateful always)
		2. Stateless (web apps, services, ... - more scalable)
	3. Partitioning
		1. Vertical/ Functionality Partitioning (microservices)
		2. Database Partitioning (horizontal partitioning)
	4. Asynchronous Calls (write load - peak loads can be handled better)
	5. Caching (reduces latency, reduces load and hence increases scalability)

### Dealing with Large Scale Systems ###
1. Large Scale Systems
	1. We need other services
		1. Load balancing
		2. DNS
		3. Auto-scaling

### Load Balancing Multiple Instances ###
1. Load Balancing provides
	1. Single IP address for a component
		1. Any component can have multiple instances
			1. Web app
			2. Gateway
			3. Catalog service
		2. Suppose gateway wants to call catalog service
			1. Which instance to call?
			2. How many instances exist?
			3. The number of instances can change
			4. IP addresses can change
			5. Load on the instances can change
			6. Hence, it is even hard to maintain a list of IP addresses
				1. Solution: Load balancer
					1. It takes the responsibility of routing the request to the right instance (based on load, or whatever strategy)
					2. It takes the job of distribution of requests
					3. Client can use only one IP address (of the load balancer)
2. Outermost load balancer
	1. It has public IP
		1. There are software based and hardware based load balancers
	2. This will see the highest amount of load (next one also)
	3. Rest of the load balancers are there to provide single IP address to the different components
		1. If microservices has multiple services and each service has a lot of instances
			1. Each service has load balancer (Kubernetes say)
				1. There is alternative to load balancer

### Discovery Service and Load Balancing ###
1. The load balancers can be removed for each service and put in gateway service
	1. If there are lots of services, it becomes messy to have load balancer for each of the services (Kubernetes infrastructure makes it easy to maintain)
2. Alternative
	1. Discovery Service
		1. Use case: If there are lots of services, it becomes hard to track what services are available and what instances of the services are running and what of them are healthy
			1. Solution: Discovery service
				1. Order service instances (say) registers with discovery service (when they come up)
				2. Discovery service will know what services and what instances are still serving
				3. Each service frequently updates its existance to discovery service using a heartbeat (health)
				4. Steps:
					1. Gateway service queries the discovery service for instances of Order service (say)
					2. Discovery service will provide list of healthy instances of Order service
					3. Gateway service load balancer uses a strategy to choose the instance it wants to call
					4. Gateway makes a call to the order service  
	2. Load balancer that is embedded into gateway service code
		1. If gateway service wants to make a call to backend service, it makes a call to embedded load balancer (library)
3. Suppose Order service wants to call Catelog service
	1. It can embed load balancer along with discovery service
4. Discovery Service can also be used by traditional load balancers
	1. The latest status of the services can be obtained
	2. Large scale systems typically have discovery service
		1. Otherwise it becomes difficult to manage each service through configure 
	3. Needed if Kubernetes cluster management system is not used

### Load Balancer Discovery ###
1. External Clients - Use DNS to discover the external load balancer
	1. DNS name will be resolved to external IP address
2. Internal Clients - Use a local registery/ config to discover an internal load balancer

		Client -> External LB		    Services -> Internal LB  
			|		Name: www.abc.com
			v		Ext IP: 158.26.78.80
			DNS		IP: 198.168.1.1
			
	1. Internal LB
		1. IP address is used
			1. Available to clients through configuration or
			2. Available in registry (discovery service)

### HLB vs SLB ###
1. Two kinds
	1. Hardware based load balancer
		1. Load distribution for L4 & L7
			1. 2x 14-Core Intel Xeon processors
			2. 1.6 TB of available use storage space
			3. 512 GB DDR4 RAM
			4. 4x 100G and 8x 40G fiber ports
		2. F5 Big IP i5000 series
			1. Connections: 300 million
			2. Throughput: 320/160 Gbps
			3. RPS (L7): 10 million (requests per second - only at L7)
	2. Software based load balancer
		1. Load distribution L7 (only) - application layer
		2. Features
			1. Content based routing
			2. Supports SSL termination
			3. Supports sticky sessions
		3. NGINX
			1. Connections: 225 K (sufficient for many use cases)
			2. Throughput: 70 Gbps
			3. RPS: 3 million
2. TCP/IP Model
	1. Application layer (HTTP, HTTPS, SMTP, IMAP, FTP, DNS, NNTP...)
	2. Transport (UDP, TCP, SCTP)
	3. Internet
	4. Network Access (Link)
3. OSI Model
	1. Application (Layer 7 load balancing upto session layer)
	2. Presentation
	3. Session
	4. Transport (Layer 4 Load balancing)
	5. Network
	6. Data Link
	7. Physical
4. HW LBs
	1. Can take immense amount of load
	2. Can do load balancing for L4 (Transport) and L7
	3. They are better than software based
5. Why use software based load balancers?
	1. HW based load balancers are extremely expensive
	2. SW based load balancers are free
		1. There is some cost for maintenance which is less
		2. Options
			1. Apache
			2. NGINX
			3. HAPROXY
	3. One can upgrade to HW based LB if needed

### Layer-7 Load Balancer ###
1. L7 - app level protocols are used
	1. SSL Termination
	2. Reverse proxy
		1. Breaks TCP connection
	3. Content based routing
	4. Load balancing
		1. Round Robin
		2. Least Connection
		3. Weighted RR/Least Conn
		4. Least Response Time
2. Dynamic content: http://www.hotel.com
3. Static content: http://images.hotel.com
4. SRAM (128 KB) (STM32F407 - has 2 SRAMs (SRAM1 & SRAM2) - combined 128 KB)

		[ Part of RAM reserved for "gobal data" ] RAM_START
		[ Part of RAM reserved for "Heap" ]
		[ Part of RAM reserved for "Stack" ] RAM_END
		
	1. Part of RAM reserved for "gobal data" - utilized when program contains global data and static local variables.
		1. Instructions can also be stored here and executed
	2. Part of RAM reserved for "Heap" - utilized during dynamic memory allocation
		1. `malloc`, `calloc`
	3. Part of RAM reserved for "Stack" - utilized during function call to save temp data, temp storage of local variables of function, temp storage of stack frames during interrupts & exceptions
5. How much memory to allocate has to be defined using
	1. Toolchain OR
	2. Linker script
6. We can also write our own dynamic memory allocation API that allocates memory in "Heap"
7. The boundaries can be decided by us (it depends on the project)
	1. The sections can also be at different locations
8. Stack operation model
	1. In ARM Cortex Mx processor stack consumption model is **Full Descending (FD)**
		1. Different Stack operation models
			1. Full Ascending stack (FA)
			2. Full Descending stak (ARM Cortex Mx processors use this)
			3. Empty Ascending stack (EA)
			4. Empty Descending stack (ED)

### Different Stack Operation Models ###
1. Full Ascending Stack
	1. Increasing mem addresses
	2. Steps: Push
		1. SP is incremented
		2. Data is copied
	3. This requires decremented SP to lower memory address
2. Full Descending Stack
	1. Decreasing mem addresses
	2. Steps: Push
		1. SP is decremented
		2. Data is copied
	3. This requires initializing SP to higher memory address
3. Empty Ascending
	1. Increasing mem addresses
	2. Steps: Push
		1. SP will be pointing to next empty location
		2. Data is copied
		3. SP is incremented to next empty location

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