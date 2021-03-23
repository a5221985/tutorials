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
			2. These are indications of capacity saturation
		2. Desired - Efficient utilization of all system resources

### Serial Request Latency ###
### Network Transfer Latency ###
### Minimizing Network Transfer Latency ###
### Memory Access Latency ###
### Disk Access Latency ###
### Minimizing Disk Access Latency ###
### CPU Processing Latency ###
### Minimizing CPU Processing Latency ###
### Some Common Latency Figures ###
### Concurrency Related Latency ###
### Amdahl's Law for Concurrent Tasks ###
### Gunther's Universal Scalability Law ###
### Shared Resource Contention ###
### Minimizing Shared Resource Contention ###
### Minimizing Locking Related Contention ###
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
### Load Balancer high Availability ###
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