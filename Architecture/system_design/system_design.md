# System Design #
## Tushar Roy ##
1. Introduction to System Design (subjective topic)
	1. Ask good questions (to define MVP)
		1. What features to add - work with interviewer
			1. Feature set must be small and go deeper
		2. How much to scale
			1. How much data to store
			2. What is the latency
			3. How many requests need to be handled per minute/second
	2. Don't use Buzzwords
		1. Don't use latest words - it may backfire
			1. We need to have in-depth knowledge on the topics
	3. **C**lear and organized thinking
		1. First define 50000 view
		2. Draw the right boxes
		3. Define actors
		4. Then go deeper into details
	4. **D**rive discussions (80-20 rule)
		1. I should be talking 80% of the time and interviewer 20% of the time
			1. Anticipate the problems in the solution and try to fix them pre-emptively
2. How to improve skills on the above:
	1. Personal experience - working with high scale systems
	2. Practice - Work with peers and friends and brainstorm to see what technologies we can use to solve the problem
	3. Gaining knowledge - blogs, videos
3. Basic features:
	1. Features
	2. Define APIs - what are the APIs
		1. Who is to call
	3. Availability
		1. If host went down
		2. If data center went down
	4. Latency and Performance
		1. Background job - latency is okay
		2. Customer facing - latency should be minimal
			1. Caching
			2. ...
	5. Scalability
		1. Is it going to work for 1000 users or 1M users
			1. Is it going to have good latency and performance
	6. Durability
		1. It may or may not be important
		2. Data
			1. Stored securely
			2. Data is not lost
			3. Data is not compromized
		3. If designing database, this aspect is important
	7. Class diagram
		1. Object oriented principles
			1. Design patterns
	8. Security & Privacy
		1. If designing an authentication system
	9. Cost effectiveness
		1. Is there any alternate solution
			1. Discuss pros and cons

### Concepts and Topics ###
1. Vertical vs Horizontal Scaling
	1. Vertical - add more memory, cpu, hardware (expensive but no distributed systems problem)
	2. Horizontal - add multiple hosts (cheaper but complexity involved with distributed systems) - easier to add hosts
2. CAP Theorem - we can achieve only two of the following
	1. Consistency
		1. Read has most recent write
	2. Availability
		1. Might or might not be the most recent write
	3. Partition Tollerence
		1. Between two nodes, we could be dropping network packets
	4. We could choose consistency of availability
		1. SQL DB: Data is less available, the data is always consistent
		2. NoSQL DB: Data is more available but it is less consistent (if it is configured that way)
3. ACID vs BASE:
	1. ACID: (Relational DBs)
		1. Atomicity
		2. Consistency
		3. Isolation
		4. Durability
	2. BASE: (more for NoSQL)
		1. Basically
		2. Available
		3. Soft-State
		4. Eventual Consistency
	3. If we are using NoSQL, we must decide which part of ACID properties we are willing to sacrifice
4. Partitioning/ Sharding Data
	1. Trillions of records:
		1. We cannot store it in one node of database (many nodes are required)
	2. How do we shard or split data?
		1. Each DB stores one portion
		2. How to access?
			1. Consistent hashing - very important concept
5. Optimistic vs Pessimistic Locking:
	1. DB transaction say
		1. Optimistic locking: Don't acquire any lock but when we are about to commit a transaction, we check to see if no other transaction has updated the record we are working on
		2. Pessimistic locking: Acquire all locks before hand and commit the transaction
	2. Understand when to use which kind of locking mechanism
6. Strong vs Eventual Consistency
	1. Strong:
		1. Reads will allways see the latest writes
			1. Relational DBs use this
	2. Eventual:
		1. Reads will see some writes but eventually will see the latest writes
			1. NoSQL can opt for this or strong
		2. Higher availability
7. Relational vs NoSQL Database
	1. Relation DB: ACID properties
	2. NoSQL: Scales better and has higher availability
8. Types of NoSQL
	1. Key-Value
	2. Wide column db - row can have many different kind of columns and many columns
	3. Document based db - semi structured data (XML, JSON)
	4. Graph based db - entities with edges with relationships between entities (like a graph)
9. Caching 
	1. Speeds up requests
		1. If some data is going to be used more frequently
	2. Two types
		1. Distributed cache - each node has a cache
		2. Centralized cache - single central cache is shared
	3. Consider the following:
		1. Cache cannot be the source of truth
		2. Cache data must be small (uses memory)
		3. Eviction policies
10. Data centers/ Racks/ Hosts
	1. Need to know how data centers are architected and arranged today
		1. Data center
			1. Racks
				1. Hosts
	2. What is the latency if we are talking across racks or across hosts or across DCs
	3. What can happen if hosts go down or racks go down or if DC goes down
10. CPU/ Memory/ Hard drive/ Memory/ Network bandwidth
	1. Limited resources
		1. Need to consider how we can work around the limitations and improve
			1. Throughput
			2. Latency
			3. Scale
11. Random vs Sequential Read/ Write on Disk
	1. Random is very slow for disk
		1. Must be avoided
	2. Sequential is amazingly fast
		1. If using Disk, design the system around sequential reads and writes
12. HTTP vs HTTP2 vs Websocket
	1. HTTP2: 
		1. Improvements over HTTP
			1. Multiple requests over single connection
	2. Websocket
		1. Bidirectional communication between client and server
	3. Know the differences and inner workings
13. TCP/IP Model
	1. 4 layers
		1. Know what each layer does
14. IPV4 vs IPV6
	1. IPV4 - 32 bit addresses
	2. IPV6 - 128 bit addresses
	3. How IP routing works
15. TCP vs UDP
	1. TCP - connection oriented reliable
	2. UDP - Unreliable connection
		1. Fast but may lose packets
			1. Video streaming
16. DNS Lookup
	1. Translates address into IP address
		1. Hierarchy
		2. Caching
17. HTTPS/TLS
	1. TLS: Transport layer security
		1. Used to secure communication between client and server (privacy and data integrity)
		2. If used with HTTP - HTTPS
18. Public Key Infrastructure & Certificate Authority
	1. Used to manage public key and digital certificates
	2. CA - Trusted entity which tells us if public key is from the correct party
		1. If facebook is sending, CA tells that it is definitely from facebook and not from a middle attacker
19. Symmetric vs Asymmetric Encryption
	1. Asymmetric - computationally more expensive
		1. Must be used to send small amounts of data
		2. Public-private key encryption
	2. Symmetric key - AES encryption
11. Load Balancers:
	1. Delegate requests to servers
		1. Based on round robbin or load average
	2. Load balancing can be done at (Levels for OSI model)
		1. L4 - considers both client and destination IP addresses and port numbers (to do routing)
		2. L7 - HTTP
			1. Uses HTTP URI to do the routing
			2. Most LBs operate at this level
12. CNSs & Edge
	1. CDNs: Netflix puts the movies in CDNs close to you
		1. Streaming performance and latency is improved
	2. Edge:
		1. Processing is performed close to the end user
		2. It has a dedicated network from Edge to DC (general internet is not used for routing)
13. Bloom Filters & Count-Min Sketch
	1. Space efficient and Probabilistic Data Structures
		1. Bloom Filter - can be used to detect if a member is a set or not
			1. Can have false positive but never false negatives
				1. If design can tolerate false positives
		2. Count-Min Sketch - used to count frequency of events
			1. Out of millions of events we are interested in specific events (not keep track of all events)
				1. Gives an answer close enough to the actual answer with some error rate
14. Paxos:
	1. Used for consensus over distributed hosts (know use cases that it solves)
		1. Before - leader election
15. Design Patterns & Object Oriented Design
16. Virtual Machines & Containers
	1. VM - a hardware emulator that can be used as any machine
	2. Container - Used for running applications and dependencies in isolation
		1. Used in production now
17. Publisher/Subscriber over Queue
	1. Publisher publishes a message and Subscriber consumes it
	2. Very important
	3. Customer facing requests should not be exposed to Pub/Sub system
18. Map/Reduce
	1. Distributed and Parallel Processing of large data
		1. Map - used for filtering and sorting the data
		2. Reduce - Summarizing the data
	2. Big data field
19. Multithreading, Concurrency, Locks, Synchronization, CAS (Compare and Set)
	1. Java comes built in
	2. C/C++ depend on platform specific implementation

## Implementations of the Above Concepts - Used in high scale systems ##
1. Cassandra
	1. Wide column highly scalable database
	2. Uses:
		1. Simple key-value storage
		2. Time series data
		3. Traditional rows with large number of columns
	3. Can provide both strong and eventual consistency
	4. Uses consistent caching to shard data
	5. Gossipping is used to keep all nodes informed about clustering
2. MongoDB/Couchbase
	1. JSON like structure
	2. ACID properties at document level
	3. Scale very well
3. MySQL
	1. Many tables with relationships can be modelled
	2. Full ACID support
	3. Has Master-Slave architecture
		1. It scales very well
4. Memcached/ Redis
	1. Distributed caches
	2. They hold data in memory
	3. Memcached - simple and fast data storage
	4. Redis - key-value storage but does other things
		1. Can be setup as cluster for
			1. Availability
			2. Replication
		2. It can flush data on hard-drive if we configure it to do so
	5. Things to remember:
		1. They are never the sources of truth
		2. They can hold only limited data
			1. Limited by memory
6. Zookeeper
	1. Centralized configuration management tool
	2. Can be used for leader election
	3. Can be used for distributed locking
	4. Scales very well for reads but does not scale so well for writes
	5. Maintains data in memory - cannot store too much data
	6. Good for
		1. Small amount of data that must be available and has a lot of reads
7. Kafka
	1. Fault tollerent highly available queue
	2. Used in Pub/Sub streaming applications
	3. Delivers messages exactly once
	4. Keeps messages ordered inside partition of a topic
8. NGINX/ HAProxy
	1. Very efficient load balancers
	2. NGINX:
		1. Can manage 1000s or 10s of thousands of clients from a single instance
10. Solr, Elasticsearch
	1. Search platforms on top of lucene
	2. Highly available
	3. Highly scalable
	4. Fault tolerant
	5. Full text search
11. Blobstore like Amazon S3
	1. For big pictures, big files to be stored on cloud
12. Docker - container engine - used to run distributed applications - it can run on laptop or data center or on cloud
	1. Kubernetes/ Mesos
		1. Used to manage and coordinate containers
13. Hadoop/ Spark (faster version - does map-reduce in memory) - Used for Map-Reduce
	1. HDFS
		1. Java Based File System
			1. Distributed and fault tolerent
		2. Hadoop relies on HDFS for it's processing

## How to Prepare for System Design Interviews ##
1. How to prepare
	1. Why System Design Interview
		1. Technical ability to lead a team (I might need to guide juniors and colleagues)
			1. Guide to solve problem
		2. Problem solving
		3. Design skills
	2. If experience is more than 4 years and for senior role (atleast one round)
	3. Brush up below mentioned skills
		1. Technical ability to lead a team
		2. Problem solving skills
		3. Design skills
	4. There are many possible solutions to a given problem
		1. Interviewers may have a solution in mind
		2. Treat them as colleague and explain the design choices
2. How to tackle system design interview
		