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

#### Redundant Load Balancers ####

### Caching ###
### Data Partitioning ###
### Indexes ###
### Proxies ###
### Redundancy and Replication ###
### SQL vs. NoSQL ###
### CAP Theorem ###
### Consistent Hashing ###
### Long-Polling vs WebSockets vs Server-Send Events ###

## Appending ##
### Contact Us ###
### Other Courses ###