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
1. 

##### Step 7: Identifying and Resolving Bottlenecks #####
##### Summary #####

### Designing a URL Shortening Service Like TinyURL ###
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
### Key Characteristics of Distributed Systems ###
### Load Balancing ###
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