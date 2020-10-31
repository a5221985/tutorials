# Grokking the System Design Interview #
## System Design Problems ##
### System Design Interviews: A Step by Step Guide ###
1. Topics:
	1. Step 1: Requirements Clarifications
	2. Step 2: Back-of-the-envelope Estimation
	3. Step 3: System Interface Definition
	4. Step 4: Defining Data Model
	5. Step 5: High-Level Design
	6. Step 6: Detailed Design
	7. Step 7: Identifying and Resolving Bottlenecks
	8. Summary
2. Software engineers struggle with system design interviews (SDIs) due to
	1. Unstructured nature of SDIs - open-ended design problem that doesn't have a standard answer
	2. Lack of experience in developing complex, large scale systems
	3. No enough preparation for SDIs
3. This needs deliberate preparation as in coding interviews - Google, Facebook, Amazon, Microsoft, ... needs it
	1. Needs above average performance in the top companies
		1. Good performance can give higher position and higher salary (shows candidate's ability to handle complex systems)

#### Step by Step Approach to Solve Design Problems ####
##### Step 1: Requirements Clarifications #####
1. Ask about exact scope of the problem
	1. **Clarify ambiguities** early in the interview is critical
		1. If end goals of a system are defined clearly then success is more likely
	2. Clarify essential **parts of system that needs to be focussed** on in 35-40 minutes interview
2. Example: Twitter like service
	1. Questions to ask:
		1. Will users of service be able to post tweets and follow other people?
		2. Should we also design to construct and display user's timeline?
		3. Will tweets contain photos and videos?
		4. Are we focusing on backend only or are we developing front-end too?
		5. Will users be able to search tweets?
		6. Do we need to display hot trending topics?
		7. Will there be any push notification for new (or important) tweets?
	2. The questions determine how our end design will look like

##### Step 2: Back-of-the-envelope Estimation #####
1. Scale of system being design needs to be estimated
	1. Helps later when focusing on
		1. Scaling
		2. Partitioning
		3. Load balancing
		4. Caching
	2. Questions:
		1. What scale is expected from the system (e.g., number of new tweets, number of tweet views, number of timeline generations per sec., etc.)?
		2. How much storage will we need? We will have different storage requirements if users can have photos and videos in their tweets
		3. What network bandwidth usage are we expecting? This will be crucial in deciding how we will manage traffic and balance load between servers

##### Step 3: System Interface Definition #####
1. Define APIs expected from system
	1. Establishes exact contract
	2. Ensures that requirements have got validated
	3. Examples:
			
			postTwee(user_id, tweet_data, tweet_location, user_location, timestamp, ...)
			generateTimeline(user_id, current_time, user_location, ...)
			markTweetFavorite(user_id, tweet_id, timestamp, ...)

##### Step 4: Defining Data Model #####
1. Defining data model in early part of interview will clarify how data will flow between different components of system
	1. Also helps in data partitioning and management later
		1. Need to identify entities of the system
		2. Need to identify how the entities interact with each other
		3. Need to identify different aspects of management
			1. Storage
			2. Transportation
			3. Encryption
			4. ...
	2. Example: Twitter
		1. User: UserID, Name, Email, DoB, CreationData, LastLogin, etc...
		2. Tweet: TweetID, Content, TweetLocation, NumberOfLikes, TimeStamp, etc...
		3. UserFollow: UserID1, UserID2
		4. FavoriteTweets: UserID, TweetID, TimeStamp
2. Implementation:
	1. Which database system should we use?
		1. Will NoSQL like Cassandra best fit our needs?
		2. Should we use MySQL-Like solution?
		3. Which type of block storage should we use for photos and videos?

##### Step 5: High-Level Design #####
1. Draw block diagram with 5-6 boxes representing core components of system
	1. Enough components need to be drawn to solve the actual problem from end-to-end
2. Example: For Twitter
	1. We might need multiple application servers for
		1. Read/write requests
		2. Load balancers in front of them for traffic distributions
			1. If more reads than writes are expected, separate servers may be planned for them
		3. An efficient database is required for persistence (to store all tweets, support huge number of reads)
			1. Distributed file storage system may be required for photos and videos
3. High level design of twitter:

	![high_level_design_of_twitter](high_level_design_of_twitter.html) 

##### Step 6: Detailed Design #####
1. Dig deeper into two or three major components
	1. Interviewer's feedback usually guides us to different parts of the system for further discussion
	2. We may be able to present different approaches
		1. Also discuss pros and cons
			1. Justify why we prefer one approach on the other
				1. Discuss tradeoffs clearly and keep system constraints in mind
2. Constraints:
	1. For massive amount of data
		1. How to partition data to distribute it to multiple databases?
		2. Should we store all data of user on same database?
			1. Does it cause issues?
	2. How to handle hot users who tweet a lot or follow lots of people?
	3. User's timeline can contain the most recent tweets (and relevant)
		1. Does it need storing data in a way that is optimized for scanning latest tweets?
	4. To which layer cache can be introduced to speed up?
	5. What components need good load balancing?

##### Step 7: Identifying and Resolving Bottlenecks #####
1. Discuss bottlenecks and mitigation strategy
	1. Is there single point of failure in system?
	2. What are we doing to mitigate them?
	3. Do we have enough replicas of data?
		1. If we lose a few servers, can we still server users?
	4. Do we have different copies of services running?
		1. A few failures should not cause total system shutdown
	5. How is performance of service monitored?
		1. Do we get alerts when critical components fail?
		2. Do we get alerts when performance degrades?

##### Summary #####
1. For success in system design interviews:
	1. Preparation
	2. Being organized
2. The above steps can be followed to stay on track and cover all different aspects while designing a system

### Designing a URL Shortening Service Like TinyURL ###
1. TinyURL short description:
	1. Service will provide short aliases redirecting to long URLs
2. Examples: bit.ly, goo.gl, qlink.me, ...
3. Difficulty level: Easy
4. Topics
	1. Why do we need URL shortening?
	2. Requirements and Goals of the System
	3. Capacity Estimation and Constraints
	4. System APIs
	5. Database Design
		1. Database Schema
	6. Basic System Design and Algorithm
	7. Encoding Actual URL
	8. Generating Keys Offline
	9. Data Partitioning and Replication
	10. Cache
	11. Load Balancer (LB)
	12. Purging or DB Cleanup
	13. Telemetry
	14. Security and Permissions

#### Why do we need URL shortening? ####
1. URL shortening is used to construct shorter aliases for long URLs
	1. Short links
2. Users are redirected to original URL when they hit short links
3. Advantages:
	1. Save space when
		1. Displayed
		2. Printed
		3. Messaged
		4. Tweeted
	2. Less likely to mistype shorter URLs
4. Examples:

		https://www.educative.io/collection/page/5668639101419520/5649050225344512/5668600916475904/
		
		shortened to:
		
		http://tinyurl.com/jlg8zpc
		
	1. It is nearly 1/3rd the size of actual URL
5. The service is used to optimize links across devices
	1. Utility:
		1. Tracking individual links to analyze audience and campaign performance
		2. Hiding original URLs
6. [tinyurl.com](http://tinyurl.com/)
	1. Spend time on options their service offers

#### Requirements and Goals of the System ####
1. Note:

		You should always clarify requirements at the beginning of the interview. Be sure to ask questions to find the exact scope of the system that the interviewer has in mind
		
2. URL shortening system should meet the following functional requirements:
	1. Given a URL, service should generate shorter and unique alias of it (called short link)
	2. Link should be short enough to be easily copied and pasted into applications
	3. When users access a short link, service should redirect them to original link
	4. Users should optionally be able to pick custom short link for URL
	5. Links will expire after standard default timespan.
		1. Users can specify expiration time
3. Non-functional requirements:
	1. System should be highly available
		1. If service is down, URL redirections will start failing
	2. URL redirection should happen in real-time with minimal latency
	3. Shortened links should not be guessable (not predictable)
4. Extended Requirements:
	1. Analytics; e.g. how many times a redirection happened?
	2. Service should be accessible through REST APIs by other services

#### Capacity Estimation and Constraints ####

#### System APIs ####

#### Database Design ####

#### Basic System Design and Algorithm ####

#### Data Partitioning and Replication ####

#### Cache ####

#### Load Balancer (LB) ####

#### Purging or DB Cleanup ####

#### Telemetry ####

#### Security and Permissions ####

### Designing Pastebin ###
### Designing Instagram ###
### Designing Dropbox ###
### Designing Facebook Messenger ###
### Designing Twitter ###
### Designing Youtube or Netflix ###
### Designing Typeahead Suggestion ###
### Designing an API Rate Limiter ###
### Designing Twitter Search ###
### Designing a Web Crawler ###
### Designig Facebook's Newsfeed ###
### Designing Yelp or Nearby Friends ###
### Designing Uber Backend ###
### Design Ticketmaster ###
### Additional Resources ###

## Glossary of System Design Basics ##
### System Design Basics ###
1. Things to consider when designing large systems
	1. What are the different architectural pieces that can be used?
	2. How do the pieces work with each other?
	3. How can we best utilize the pieces: what are the right tradeoffs?
2. Investing on scaling before it is needed is generally not a smart business proposition
	1. But some forethought into design can save valuable tiem and resources in future
3. Topics:
	1. Core building blocks of scalable systems
		1. The concepts would benefit in understanding distributed system concepts
	2. Next:
		1. Consistent hashing
		2. CAP Theorem
		3. Load Balancing
		4. Caching
		5. Data Partitioning
		6. Indexes
		7. Proxies
		8. Queues
		9. Replication
		10. Choosing between SQL vs. NoSQL
4. Next: key characteristics of distributed systems

### Key Characteristics of Distributed Systems ###
1. Topics: (key characteristics)
	1. Scalability
	2. Reliability
	3. Availability
	4. Efficiency
	5. Serviceability or Manageability

#### Scalability ####
1. It is the capability of system, process, or a network to grow and manage increased demand
	1. A distributed system that can continuously evolve to support growing amount of work is considered to be scalable
2. Reasons of scaling
	1. Increased data volume (or)
	2. Increased amount of work
		1. Number of transactions
3. Scalable system would like to achieve scaling without performance loss
	1. Performance of system (though designed or claimed) to be scalable, declines with system size
		1. Due to management or environment cost
			1. Examples:
				1. Network speed may become slower (machines may tend to be far apart from one another)
			2. Some taks may not be distributed
				1. May be due to inherent atomic nature
				2. May be due to some flaw in system design
		2. Speed up obtained by distribution may get limited at some point
			1. Scalable architecture avoids the situation and attempts to balance load on all participating nodes evenly
4. Horizontal vs. Vertical Scaling:
	1. Horizontal scaling:
		1. Scaling by adding more servers into pool of resources
	2. Vertical scaling:
		1. Usually limited to the capacity of a single server
			1. Scaling beyond the capacity may often 
				1. involve downtime
				2. involve upper limit
5. Good examples of horizontal scaling:
	1. [Cassandra](https://en.wikipedia.org/wiki/Apache_Cassandra)
	2. [MongoDB](https://en.wikipedia.org/wiki/MongoDB)
6. Both provide easy way to scale horizontally
	1. One can add more machines to meet growing needs
7. Good example of vertical scaling is MySQL
	1. Provides easy way for vertical scaling by switching from smaller machines to bigger machines
		1. May involve downtime

#### Reliability ####
1. It is the probability a system will fail in a given period (of time)
	1. A distributed system is considered reliableif it keeps delivering its services even when one or several of its software or hardware components fail
		1. It is one of the main characteristics of a distributed system
			1. A failing machine can be replaced with a healthy one (to ensure completion of requested task)
2. Consider e-commerce store: [Amazon](https://en.wikipedia.org/wiki/Amazon_(company))
	1. Primary requirement:
		1. A user transaction should never be canceled due to failure of machine that is running that transaction
			1. If user has added an item to their shopping cart, system is expected to not lose it
				1. Reliable distributed system achieves this through redundancy of both software components and data
					1. If server carrying user's shopping cart fails, another server that has exact replica of shopping cart should replace it
						1. Cons: Redundancy has cost associated (to be paid upfront)
							1. Needed to eliminate **single point of failure**

#### Availability ####
1. It is the time a system remains operational to perform its required function in specific period (of time)
	1. Measured as percentage of time the 
		1. System
		2. Service or 
		3. Machine remains operational under normal conditions
2. Example: Aircraft that can be flown for many hours a month (without downtime) can be said to have high availability
3. Factors to account for:
	1. Maintainability
		1. If aircraft is down for maintenance, it is said to be not available during that time
	2. Repair time
	3. Spares availability
	4. Logistics considerations
4. Reliability:
	1. It is availability over time (considering full-range of possible real-world conditions that can occur - (roadblocks ...))
		1. Aircraft that can make it through any possible weather safely is more reliable than one that has vulnerabilities to possible conditions

##### Reliability vs. Availability #####
1. If system is reliable, it is available
	1. If a system is available, it is not necessarily reliable
		1. High reliability contributes to high availability
			1. It is possible to achieve high availability even with unreliable product by minimizing repair time and ensuring spares are always available whenever needed
2. Example: Online retail store (has 99.99% availability for first two years after launch)
	1. System was launched without information security testing
		1. Customers are unaware that system is not very reliable
			1. System is vulnerable to likely risks
	2. System might face information security incidents in third year
		1. May result in extremely low availability for extended periods (of time)
			1. May cause reputational and financial damage to customers 

#### Efficiency ####
1. How to measure efficiency of a distributed system
	1. Assume an operation that runs in a distributed manner, delivers set of items as a result
	2. Two standard measures of efficiency:
		1. Response time (or latency)
			1. Denotes delay to obtain first item
		2. Throughput (or bandwidth)
			1. Number of items delivered in a given time unit (e.g. in a second)
	3. Two measures correspond to following unit costs:
		1. Number of messages globally sent by the nodes of the system regardless of the message size
		2. Size of messages representing the volume of data exchanges
2. Complexity of operations supported by distributed data structures (e.g. searching for specific key in distributed index)
	1. These can be characterized as function of one of the cost units above
		1. Analysis in terms of 'number of messages' is over-simplistic
			1. Ignores impact of many aspects
				1. network topology
				2. network load
				3. network variations
				4. heterogeneity of 
					1. software components involved in data processing & routing
					2. hardware components involved in data processing & routing
			2. It is difficult to develop a precise cost model that would accurately take into account all performance factors
				1. Solution: Rough but robust estimates of system behaviour

#### Serviceability or Manageability ####
1. Aspect: How easy it is to operate and maintain?
	1. Serviceability or manageability
		1. How easy it is to operate and maintain
		2. It is the simplicity and speed with which system can be repaired or maintained
			1. If time to fix failed system increases, then availability will decrease
		3. Manageability:
			1. Things to consider
				1. Ease of diagnosing & understanding problems when they occur
				2. Ease of making updates or modifications
				3. Simplicity of operating the system
					1. Does it routinely operate without failure or exceptions?
2. Early detection of faults can decrease or avoid system downtime
	1. Example: Some enterprise systems can automatically call service center (without human intervention) when system experiences system fault

### Load Balancing ###
1. Topics:
	1. Benefits of Load Balancing
	2. Load Balancing Algorithms
	3. Redundant Load Balancers
2. Load Balancer (LB) - a critical component of distributed system
	1. It helps spread traffic across cluster or servers
		1. To improve responsiveness and availability of applications, websites or databases
	2. LB keeps track of status of all resources while distributing requests
		1. If a server
			1. Is not able to take new requests
			2. Is not responding
			3. Has elevated error rate
		2. LB will stop sending traffic to it
3. LB (typically) sits between client and server accepting incoming network and app traffic and
	1. Distributes traffic across multiple backend servers (using various algorithms)
		1. If application requests are balanced across multiple servers
			1. LB reduces individual server load
			2. LB prevents any one application server from becoming single point of failure
		2. This strategy increases overall app availability and responsiveness
4. To utilize full scalability and redundancy
	1. Try to balance load at each layer of system
		1. Adding LBs at 3 places:

			![load_balancing_at_different_levels](load_balancing_at_different_levels.png)

#### Benefits of Load Balancing ####
1. Users experience faster, uninterruted service
	1. One doesn't have to wait for single struggling server to finish its previous tasks
		1. Requests are immediately passed on to more readily available resource
2. Service providers experience less downtime and higher throughput
	1. Full server failure does not affect end user experience as load balancer will route around it to healthy server
3. Load balancer makes it easier for sys admins to handle incoming requests while decreasing wait time for users
4. Smart load balancer features
	1. Predictive analytics - determining traffic bottlenecks before they happen
		1. Gives organization actionable insights
			1. Key to automation
			2. Helps drive business decisions
5. Sys admins experience fewer failed or stressed components
	1. load balancing has several devices perform little bit of work

#### Load Balancing Algorithms ####
1. How does load balancer choose backend server?
	1. LBs consider two factors before forwarding request to backend server
		1. They first ensure server they choose is actually responding appropriately to requests
		2. Then use pre-configured algorithm to select one from set of healthy servers
2. Health Checks - 
	1. LBs should forward traffic to only healthy backend servers
		1. To monitor health of backend server
			1. "Health checks" - attempts to connect to backend servers to ensure that servers are listening
				1. If a server fails health check
					1. It is automatically removed from pool
						1. Traffic will not be forwarded until it responds to health checks again
3. LB methods:
	1. **Least Connection Method** - Directs traffic to server with fewest active connections
		1. Useful if there are a large number of persistent client connections evenly distributed between servers
	2. **Least Response Time Method** - Directs traffic to server with fewest active connections and lowest average response time
	3. **Least Bandwidth Method** - Method selects server that is currently serving least amount of traffic measured in megabits per second (Mbps)
	4. **Round Robin Method** - Cycles through list of servers and sends each new request to next server
		1. When it reaches end of list, starts over at the beginning
			1. Useful when servers are of equal specification & not many persistent connections
	5. **Weighted Round Robin Method** - If servers have different processing capacities
		1. Each server is assigned weight (integer value that indicates processing capacity)
		2. Servers with higher weights receive new connections before the ones with less weights
		3. Servers with higher weights receive more connections than servers with less weights
	6. **IP Hash** - Hash of IP address of client is calculated to redirect request to server

#### Redundant Load Balancers ####
1. LB can be single point of failure
	1. Solution: Second LB can be connected to first to form cluster
		1. Each LB monitors health of other
			1. Each LB is equally capable of serving traffic and failure detection
		2. If main LB fails, second LB takes over
2. Resources
	1. [What is Load Balancing](https://avinetworks.com/what-is-load-balancing/)
	2. [Introduction to architecting systems](https://lethain.com/introduction-to-architecting-systems-for-scale/)
	3. [Load Balancing](https://en.wikipedia.org/wiki/Load_balancing_(computing))

### Caching ###
1. Topics:
	1. Application server cache
	2. Content Distribution Network (CDN)
	3. Cache Invalidation
	4. Cache Eviction Policies
2. LB helps scale horizontally across indefinitely increasing number of servers
3. Caching benefits:
	1. Enables better use of resources that already exist
	2. Makes certain unattainable product requirements feasible
4. Principle used:
	1. Caching takes advantage of locality of reference princple
		1. Recently requested data is likely to be requested again
5. Caching uses:
	1. Used in almost every layer of computing
		1. Hardware
		2. Operating Systems
		3. Web Browsers
		4. Web Applications
		5. ...
6. Cache is like short-term memory
	1. It has limited amount of space
	2. It is typically faster than original data source
	3. It usually contains most recently accessed item
7. Caches are often found at level nearest to front end
	1. Implemented to return data quickly
	2. Not taxing downstream levels

#### Application Server Cache ####
1. Placing cache on request layer node enables local storage of response data
	1. If a request is made to service, node will quickly return local cached data (if it exists)
	2. If requested data is not in cache, the node will query data from disk
2. Cache locations:
	1. Cache on a single request layer node can be located in
		1. Memory (fast)
		2. Local disk (faster than going to network storage)
3. If request layer is expanded to many nodes, each node can host its own cache
	1. If load balancer randomly distributes requests across nodes?
		1. Same requests might go to different nodes and increase cache misses
			1. Solutions:
				1. Global caches
				2. Distributed caches

#### Content Distribution Network (CDN) ####
1. CDNs are caches for sites serving large amounts of **static media**
	1. A request will first ask CDN for a piece of static media
	2. CDN serves content if it has it locally available
	3. If content is not locally available, CDN will query back-end servers for the file
	4. CDN caches the file locally
	5. CDN then serves it to requesting user
2. If system is not large enough to have its own CDN, future transition can be eased using separate subdomain
	1. e.g. static.yourservice.com
		1. A lightweight http server like Nginx can be used
		2. In future, DNS can be cut-over from the servers to CDN later

#### Cache Invalidation ####
1. Cache needs some maintenance for keeping it coherent with source of truth (e.g. database)
	1. If data is modified in database
		1. The data should be invalidated in cache (else inconsistent application behaviour)
			1. Solution: Cache invalidation (three main schemes are used)
				1. **Write-through cache**: Data is written into cache and database at the same time
					1. Cached data is for fast retrieval
					2. Complete data consistency (between cache and storage) since same data is written to storage
					3. Pros: The scheme ensures that nothing gets lost in case of crash, power failure, or other system disruptions
						1. If one or both go down, the entire write is rolled back?
					4. Cons: Every write must be done twice before returning success to client
						1. Higher latency for write operations
				2. **Write-around cache**: Similar to write-through cache but data is directly written to storage (bypassing cache)
					1. Pros: Avoids flooding cache with write operations which will not be re-read
					2. Cons: Read request for recently written data will cause "cache miss"
						1. Needs to be read from slower back-end storage and experience higher latency
				3. **Write-back cache**: Data is written to cache alone and completion is immediately confirmed to client
					1. Write to permanent storage is done after specified intervals or under certain conditions
					2. Pros: Low latency and high throughput for write-intensive applications
					3. Cons: Risk of data loss in case of a crash or other adverse events
						1. Only copy is in cache

#### Cache Eviction Policies ####
1. Common cache eviction policies:
	1. First In First Out (FIFO): Cache evicts first block accessed first 
		1. Without regard to how often or how many times it was accessed before
	2. Last In First Out (LIFO): Cache evicts block accessed most recently first 
		1. Without regard to how often or how many times it was accessed before
	3. Least Recently Used (LRU): Discards least recently used items first
	4. Most Recently Used (MRU): Discards, in contrast to LUR, the most recently used items first
	5. Least Frequently Used (LFU): Counts how often an item is needed
		1. Items used least often are discarded first
	6. Random Replacement (RR): Randomly selects candidate item and discards it to make space when necessary
2. Resources:
	1. [Cache](https://en.wikipedia.org/wiki/Cache_(computing))
	2. [Introduction to architecting systems](https://lethain.com/introduction-to-architecting-systems-for-scale/)

### Data Partitioning ###
1. Topics:
	1. Partitioning Methods
	2. Partitioning Criteria
	3. Common Problems of Data Partitioning
2. It is a technique to break up big database (DB) into many smaller parts
	1. A process of splitting DB/table across multiple machines
		1. Used to improve
			1. Manageability
			2. Performance
			3. Availability
			4. Load balancing (of application)
	2. Justification: After certain scale point, it is cheaper and more feasible to scale horizontally by adding more machines than to grow vertically by adding beefier servers

#### Partitioning Methods ####
1. Many schemes can be used to decide how to break up app database into multiple smaller DBs
2. Most popular schemes
	1. Horizontal partitioning
	2. Vertical partitioning
	3. Directory based partitioning
3. **Horizontal partioning**:
	1. We put different rows into different tables
		1. Example: If storing places in table
			1. locations with Zip codes < 10000 are stored in one table & places with codes >= 10000 are stored in a separate table
				1. Range based partitioning (different ranges go into different tables)
					1. This is called **data sharding**
	2. Problem: If value used to partition is not chosen carefully, partitioning scheme will lead to unbalanced servers
		1. Splitting assumes, places will be evenly distributed across different zip codes
			1. May not be valid because there may be different places in thickly populated areas like Manhatten as compared to suburb cities
4. **Vertical Partitioning**:
	1. Data is divided to store tables related to specific feature in their own server
		1. Example: If building instagram like application
			1. Suppose we want to store data related to users
				1. Photos they upload, people they follow
					1. Place user profile info in one DB server
					2. Place friend lists on another
					3. Place photos on third server
	2. Pros: Straight forward to implement & has low impact on application
	3. Cons: If app experiences additional growth, it may be necessary to further partition a feature specific DB across various servers
		1. E.g. may not be possible for a single server to handle all metadata queries for 10 billion photos by 140 million users
5. **Directory Based Partitioning**:
	1. Loosely coupled approach (work around the issues above)
		1. Construct a lookup service which knows current partitioning scheme and abstracts it away from DB access code
			1. To find out where particular data entity resides
				1. Query directory server (that holds mapping between each tuple key to its DB server)
			2. Pros: Enables us to perform tasks as follows without any impact on the application
				1. Adding servers to DB pool
				2. Changing partionining scheme

#### Partitioning Criteria ####
1. **Key or Hash-based Partitioning**:
	1. A hash function is applied to some key attributes of entity being stored (e.g. number of db servers) that yields the partition number
		1. Example: If we have 100 DB servers, and our ID is numeric value that gets incremented by one each time new record is inserted
			1. Hash function could be: ID % 100
				1. This gives server number which can be used to store/ read that record
			2. Pros: Ensures uniform allocation of data among servers
			3. Cons: Fixes number of DB servers
				1. If new servers are added, hash function needs to be changed which requires redistribution of data and downtime for service
					1. Solution: **Consistent hashing**

2. **List Partitioning**:
	1. Each partition is assigned a list of values
		1. When a new record needs to be inserted, we can see which partition contains our key and store it there
			1. Examples: All users living in Iceland, Norway, Sweden, Finland, or Denmark will be stored in a partition for Nordic countries

3. **Round-Robin Partitioning**:
	1. Simple strategy that ensures uniform data distribution
		1. If there are `n` partitions, `i` tuple is assigned to partition (`i mod n`)

4. **Composite Partitioning**:
	1. Any of the above partitioning schemes are combined to devise new scheme
	2. Example: List partitioning scheme followed by hash based partitioning scheme
		1. Consistent hashing - may be considered as a composite partitioning scheme
			1. Hash reduces key space to a size that can be listed

#### Common Problems of Data Partitioning ####
1. On partitioned database, there are extra constriants on operations that can be performed
	1. Reason: Operations across **multiple tables** or **multiple rows in same table** will no longer run on same server
2. Following are additional constraints and complexities introduced by partitioning
3. **Joins and Denormalization**
	1. Joins on database running on one server is straight forward
		1. If database is partitioned and spread across multiple machines
			1. It is not feasible to perform joins that span database partitions
				1. Joins will not be performance efficient (data has to be compiled from multiple servers)
					1. Workaround: Denormalize the database so that queries that required joins can be performed from single table
						1. Cons: Services has to deal with issues of denormalization which includes inconsistency
4. **Referential Integrity**
	1. Trying to enforce data integrity constraints such as foreign keys in a partitioned database can be extremely difficult
		1. **Most RDBMS do not support foreign key constraints across databases on different database servers**
			1. Workaround: Referential integrity needs to be enforced in application code
				1. Apps may also need to run regular SQL jobs to clean up dangling references

5. **Rebalancing**
	1. Reasons for changing partitioning scheme:
		1. Data distribution is not uniform
			1. Example: lot of places with one zip code cannot fit into one database partition
		2. There is lot of load on a partition
			1. Example: Too many requests handled by DB partition dedicated to user photos
	2. Solutions:
		1. More DB partitions or
		2. Rebalancing of existing partitions
			1. Impact: partitioning scheme changed
				1. Downtime may be required (or else hard to change)
			2. Directory based scheme makes rebalancing palatable experience
				1. Cons:
					1. Complexity of the system is higher
					2. Another single point of failure is introduced
						1. i.e. lookup service/ database

### Indexes ###
1. Topics:
	1. Example: A library catalog
	2. How do Indexes decrease write performance?

#### Example: A Library Catalog ####
1. Library catalog is a register that contains list of books found in library
	1. Catalog is organized as a database table generally with four columns
		1. Book title
		2. Book writer
		3. Book Subject
		4. Date of publication
2. There are two catalogs
	1. One catalog is sorted by book title
	2. One catalog is sorted by writer name
3. 

#### How Do Indexes Decrease Write Performance? ####
1. Index can speed up data retrieval but can be large due to additional keys (slows down data insertion & update)
2. If adding rows or making updates to existing rows for table with active index
	1. We have to update the index as well
		1. Decreases write performance
			1. Applies to the following operations
				1. Insert
				2. Update
				3. Delete
	2. Indexes are added to increase search query performance
		1. If database is used to mostly write to and to read from
			1. Decreasing the performance of writing with indexes is not worth the increase in performance of reading
3. [Database Indexes](https://en.wikipedia.org/wiki/Database_index)

### Proxies ###
1. Topics:
	1. Proxy Server Types
		1. Open Proxy
		2. Reverse Proxy
2. Proxy: It is an intermediate server between client and back-end server
	1. Clients connect to proxy servers to make request for service like
		1. Web page
		2. File
		3. Connection
		4. ...
	2. [Proxy Server](https://en.wikipedia.org/wiki/Proxy_server)
		1. It is a piece of software or hardware that acts as intermediary for requests from clients
			1. These are used for seeking resources from other servers
	3. Usage:
		1. To filter requests
		2. To log requests
		3. To transform requests
			1. By adding/ removing headers
			2. By encrypting/ decrypting
			3. By compressing a resource
		4. It's cache can serve a lot of requests
3. If multiple clients access particular resource
	1. Proxy server can cache it and serve it to all clients without going back to remote server

		![proxy_server](proxy_server.jpeg)
		
#### Proxy Server Types ####
1. Proxies can reside on client's local server
2. Proxies can reside between client and remote server
3. Types of proxies:
4. Open Proxy
	1. [Open Proxy](https://en.wikipedia.org/wiki/Open_proxy) - It is a proxy server that is accessible by any internet user
		1. Generally a proxy server only allows users within network group (closed proxy) to store and forward Internet services such as DNS or web pages to reduce and control bandwidth used by the group
		2. Open proxy allows any user on the internet to be able to use this forwarding service
			1. Two famous open proxies
				1. **Anonymous Proxy** Proxy reveals its identity as a server but does not disclose initial IP address
					1. The proxy server can be discovered easily but it hides user's IP addresses (beneficial for some users)
				2. **Transparent Proxy** Proxy server identifies itself
					1. with support of HTTP headers, first IP address can be viewed
					2. Pros: It has an ability to cache the websites
	2. [Reverse Proxy](https://en.wikipedia.org/wiki/Reverse_proxy) - retrieves resources on behalf of client from one or more servers
		1. Resources are returned to the client
			1. It appears as though the resources have originated from the proxy server itself

### Redundancy and Replication ###
1. [Redundancy](https://en.wikipedia.org/wiki/Redundancy_(engineering)) - It is the duplication of the following of a system
	1. Critical components or
	2. Critical functions
2. They are in the form of a backup or failsafe
	1. They are used to improve system performance
		1. Example: If there is only one copy of file stored on single server
			1. If we lose the server, the file gets lost
				1. Solution: Redundant copies of the file
3. Plays a key role in removing single points of failure in a system
	1. If crisis exists, it provides a backup
	2. Example: If two instances are running in production, if one of the instances fails, system can failover to other one
		1. Primary server - Failover -> Secondary server
		2. Active data - data replication -> mirrored data
4. [Replication](https://en.wikipedia.org/wiki/Replication_(computing)) - Means sharing information to ensure consistency between redundant resources
	1. Example:
		1. Software components
		2. Hardware components
	2. Done to/for
		1. Improving reliability
		2. [Fault-tolerance](https://en.wikipedia.org/wiki/Fault_tolerance)
		3. Accessibility
5. Replication is popularly used in db management systems (DBMS)
	1. Primary-replica relationship between original and copies
		1. Primary server gets all the updates
		2. The updates ripple through to replica servers
			1. Replica outputs message stating that it has received update successfully
				1. This allows sending subsequent updates

### SQL vs. NoSQL ###
1. Topics:
	1. SQL
	2. NoSQL
	3. High level differences between SQL and NoSQL
	4. SQL vs. NoSQL - Which one to use?
	5. Reasons to use SQL database
	6. Reasons to use NoSQL database
2. Two main types of solutions:
	1. SQL - Relational databases
	2. NoSQL - Non-relational databases
3. The two differ in:
	1. The way they are built
	2. Kind of information they store
	3. Storage method they use
4. Relational databases are structured and have predefined schemas
	1. Example: Phone books (for storing phone numbers and addresses)
5. Non-relational databases are unstructured, distributed, and have dynamic schema (like file folders that hold everything from person's address and phone number to Facebook 'likes' and online shopping preferences)

#### SQL ####
1. Relational database store data in rows and columns
	1. Each row contains all the info about one entity
	2. Each column contains all separate data points
2. Examples: MySQL, Oracle, MS SQL Server, SQLite, PostgreSQL, MariaDB

#### NoSQL ####
1. Common types of NoSQL:
2. **Key-Value Stores**: Data is stored in array of key-value pairs
	1. 'key' - attribute name (linked to value)
	2. 'value'
3. Examples: Redis, Voldemort, Dynamo
4. **Document Databases**: Data is stored in documents (instead of rows and columns in a table)
	1. documents are grouped together into collections
	2. Each doc can have a different structure (does not have to follow a common schema)
	3. Exmaples: CouchDB, MongoDB
5. **Wide-Column Databases**: In columnar databases, we have column families
	1. Column families are containers for rows
	2. We don't need to know all the columns upfront (unlike relational databases)
	3. Each row does not need to have the same number of columns
	4. Use cases: for large datasets
	5. Examples: Cassandra, HBase
		1. More reasearch:
			1. Data is stored in columns
			2. Goal is to efficiently write and read data to and from hard disk storage
				1. To speed up time it takes to return a query (?)
					1. All column i values are physically together
					2. column (i + 1) values follow after that
				2. Example:

						ID	Last	First	Bonus
						1	Doe		John	8000
						2	Smith	Jane	4000
						3	Beck	Sam		1000
						
					1. Stored as: 1,2,3;Doe,Smith,Beck;John,Jane,Sam;8000,4000,1000;
					2. Advantages: 
						1. Data can be highly compressed (?)
							1. Permits rapid columnar operations - MIN, MAX, SUM, COUNT, AVG
						2. It is self indexing and hence occupies less disk space than relational database management system (RDBMS) containing same data

#### High Level Differences Between SQL and NoSQL ####
#### SQL vs. NoSQL - Which One to Use? ####

### CAP Theorem ###
### Consistent Hashing ###
### Long-Polling vs WebSockets vs Server-Send Events ###

## Appendix ##
### Contact Us ###
### Other Courses ###