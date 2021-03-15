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
1. Pastebin:
	1. Users can store plain text
		1. Users can enter piece of text and get randomly generated URL to access it
	2. Similar services:
		1. patebin.com
		2. controlc.com
		3. hastebin.com
		4. priatebin.net
	3. Difficulty level: Easy
2. Topics:
	1. What is Patebin?
	2. Requirements and Goals of the System
	3. Some Design Considerations
	4. Capacity Estimation and Constraints
	5. System APIs
	6. Database Design
		1. Database Schema
	7. High Level Design
	8. Component Design
	9. Application Layer
	10. Datastore Layer
	11. Purging or DB Cleanup
	12. Data Partioning and Replication
	13. Cache and Load Balancer
	14. Security and Permissions

#### What is Pastebin? ####
1. Enables users to store plain text or images over network (internet say)
	1. This generates unique URLs to access uploaded data
2. Pros: Enables sharing data over network quickly
	1. Users can just pass URL to let other users see it
3. [pastebin.com](http://pastebin.com/) - try it ('Paste')
	1. Go through differnt options offered

#### Requirements and Goals of the System ####
1. Functional requirements:
	1. Users should be able to upload or 'paste' data and get unique URL to access it
	2. Usrers can upload text only
	3. Data and links will expire after specific timespan automatically
		1. Users can specify expiration time
	4. Users can pick custom alias for their paste
2. Non functional requirements
	1. System should be highly reliable (any data uploaded should not be lost)
	2. System should be highly available
		1. If service is down, users cannot access their pastes
	3. Users can access pastes in real-time with minimum latency
	4. Paste links should not be guessable (not predictable)
3. Extended requirements
	1. Analytics e.g. how many times a paste was created?
	2. Our service should also be accessible through REST APIs by other services

#### Some Design Considerations ####
1. Similar to URL Shortening service but with additional design considerations
	1. What amount of text user can paste at a time?
		1. Limit: Pastes not bigger than 10 MB (to stop abuse of service)
	2. Should there be size limits on custom URLs?
		1. Users can pick any URL they like (not mandatory to provide)
			1. It is reasonable to impose size limit on custom URLs
				1. Consistent URL database

#### Capacity Estimation and Constraints ####
1. Service will be:
	1. Read heavy - more read requests compared to new Paste creation (can assume 5:1 ratio between read and write)
2. **Traffic estimates**: Not expected to have traffic similar to Twitter or Facebook
	1. Assumption: 1 million new pastes added to system everyday
		1. => 5 million reads per day
	2. New pastes per second:

			1M / (24 hours * 3600 seconds) ~= 12 pastes / sec
			
	3. Paste reads per second:
	
			5M / (24 hours * 3600 seconds) ~= 58 reads/ sec
			
3. **Storage estimates**: Users can upload max 10MB of data
	1. Generally: source code, configs, logs (not huge texts)
		1. Assuming each paste size = 10 KB
	2. Total storage: 1M * 10 KB => 10 GB/day
		1. ~ 36TB for 10 years
			1. 3.6 billion pastes in 10 years
	3. To generate and store unique keys for each paste
		1. If base64 encoding is used: we might need 6 letters strings:
		
				64^6 ~= 68.7 billion unique strings ([A-Z, a-z, 0-9, ., -] - 26 + 26 + 10 + 1 + 1 = 64)
				
	4. If one byte is used to store 1 character: Total size required for 3.6B keys:

			3.6B * 6 => 22 GB
			
		1. Negligible compared to 36TB
			1. 70% capacity model is assumed to keep some margin (we don't want to use more than 70% of total storage capacity at any point)
				1. => 51.4 TB
4. **Bandwidth estimates**: 
	1. For write requests, we expect 12 new pastes per second - 120 KB of ingress per second

			12 * 10 KB => 120 KB/s
			
			
	2. For read requests, we expect 58 requests per second. Total data egres (sent to users) will be 0.6 MB/s

			58 * 10 KB => 0.6 MB/s
			
5. The ingress and egress are not big, the numbers can be kept in mind while designing service
6. **Memory estimates**: Some of the hot pastes (frequently accessed ones) can be cached
	1. Following 80-20 rule
		1. 20% of pastes generates 80% of traffic
			1. We need to cache 20% pastes (high demand)
				1. 5M read requests per day are expected: We need to cache 10 GB of pastes

						0.2 * 5 M * 10 KB = 10 GB

#### System APIs ####
1. SOAP or REST API can be used to expose the service
2. Following could be the definitions for create/retrieve/delete:

		addPaste(api_dev_key, paste_data, custom_url=None, user_name=None, paste_name=None, expire_date=None)
		
	1. Parameters:
		1. `api_dev_key` (`string`): API developer key of registered account
			1. Can be used to throttle users based on allocted quota
		2. `paste_data` (`string`): Text data of paste
		3. `custom_url` (`string`): Optional custom URL
		4. `user_name` (`string`): Optional username to be used to generate URL
		5. `paste_name` (`string`): Optional name of paste
		6. `expire_date` (`string`): Optional expiration date for paste
	2. Returns: (`string`)
		1. Successful insertion returns URL through which paste can be accessed
		2. On failure, returns error code
3. Similarly: Retrieve API

		getPaste(api_dev_key, api_paste_key)
		
	1. `api_paste_key` - string representing Paste Key of paste to be retrieved
		1. API will return textual data of paste
4. Similarly: Delete API

		deletePaste(api_dev_key, api_paste_key)
		
	1. Successful deletion return `true`, else `false`

#### Database Design ####
1. Observation about nature of data we are storing:
	1. Need to store billions of records
	2. Each meta data object stored can be small (less than 1KB)
	3. Each paste object stored can be of medium size (can be few MB)
	4. No relationships between records
		1. Except for storing which user added what paste
	5. Service is read heavy

##### Database Schema: #####
1. Two tables:
	1. One for storing info about pastes
	2. Second for storing other user's data

			Paste
				PK: URLHash: varchar(16)
				ContentKey: varchar(512)
				ExpirationDate: datetime
				UserID: int
				CreationDate: datetime
				
			User
				PK: UserID: int
				Name: varchar(20)
				Email: varchar(32)
				CreationDate: datetime
				LastLogin: datetime
				
		1. `URLHash` - URL equivalent of TinyURL
		2. `ContentKey` - reference to external object storing contents of paste (later) 

#### High Level Design ####
1. An application layer can serve all the read and write requests
	1. It can talk to a storage layer to store & retrieve data
2. Storage can be segregated with
	1. One database storing metadata realted to each paste, users, ...
	2. Seond database storing paste contents in some object storage (like [Amazon S3](https://en.wikipedia.org/wiki/Amazon_S3))
		1. Allows us to scale them individually

				Client -> Application server -> Object storage
									|
									v
							Metadata storage

#### Component Design ####
##### Application Layer #####
1. Processes all incoming and outgoing requests
2. App layer will be talking to backend data store components to serve requests
3. **How to handle a write-request?**
	1. Upon receiving write-request, the server will generate six-letter random string
		1. Serves as key of the paste (if user has not provided custom key)
	2. App server will then store contents of paste and generated key in database
		1. After successful insertion, server can return key to user
			1. Possible failure: Insertion failure due to duplicate key (could match an existing one)
				1. Keep retrying until we don't see failure due to duplicate key
					1. If custom key is already present in database, return an error to user
	2. Another solution:
		1. Run standalone Key Generation Service (KGS)
			1. Generates random six letters strings beforehand and stores then in database (key-DB)
		2. When new paste arrives, take one of already generated key and use it
			1. Makes it fast (no duplications or collisions)
		3. KGS ensures that all keys stored in db are unique
		4. KGS can use two tables to store keys:
			1. When a key is used, it can move to used keys table
			2. Can keep some keys in memory so that whenever server needs them, it can provide them quickly
				1. The keys can be moved to used keys table immediately
					1. Ensures each server gets unique keys
						1. If server dies before using all keys in memory, we lose those keys and can be ignored because there are other keys
		5. **Isn't KGS a single point of failure?**
			1. It is
				1. Solution: Stand by replica of KGS - whenever primary server dies, replicate can take over to generate and provide keys
		6. **Can each app server cache some keys from key-DB?**
			1. Yes
				1. Can speed things up
					1. Cons: If application server dies before consuming all keys, we lose the keys (acceptable because we have many unique six letter keys - much more than we require)
		7. **How does it handle a paste read request?**
			1. If paste read request is received, application server layer contacts datastore
			2. Datastore searches for key, and if found, it returns paste's contents
				1. If not found, error code is returned

##### Datastore Layer #####
1. Divided into two:
	1. Metadata database: Relational database like MySQL or Distributed Key-Value store like Dynamo or Cassandra can be used
	2. Object storage: Amazon S3
		1. If we reach full capacity, we can increase it by adding more servers
2. Detailed component design:

		clients -> Load balancer -> Application servers -> Load balancer -> Object storage (-> Block Cache)
		-> Metadata Cache <- Metadata storage
									^
									|
								Cleanup Service
									|
									v
								key-DB - - - -> key-DB (stand-by)
												    ^
												    |
										Key Generation Service (few)
												    |
												    v
												 Application Servers

#### Purging or DB Cleanup ####
1. [Designing a URL Shortening service](https://www.educative.io/collection/page/5668639101419520/5649050225344512/5668600916475904)

#### Data Partitioning and Replication ####
1. [Designing a URL Shortening service](https://www.educative.io/collection/page/5668639101419520/5649050225344512/5668600916475904)

#### Cache and Load Balancer ####
1. [Designing a URL Shortening service](https://www.educative.io/collection/page/5668639101419520/5649050225344512/5668600916475904)

#### Security and Permissions ####
1. [Designing a URL Shortening service](https://www.educative.io/collection/page/5668639101419520/5649050225344512/5668600916475904)

### Designing Instagram ###
1. Requirements: Photo-sharing service
	1. Users can upload photos to share them with other users
2. Similar Services:
	1. Flickr, Picasa
3. Difficulty: Medium
4. Topics:
	1. What is Instagram?
	2. Requirements and Goals of the System
	3. Some Design Considerations
	4. Capacity Estimation and Constraints
	5. High Level System Design
	6. Database Schema
	7. Data Size Estimation
	8. Component Design
	9. Reliability and Redundancy
	10. Data Sharing
	11. Ranking and News Feed Generation
	12. News Feed Creation with Sharded Data
	13. Cache and Load Balancing

#### What is Instagram? ####
1. Instagram is social networking service
2. It enables users to upload and share their photos and videos with other users
3. Instagram users can choose sharing info publicly or privately
	1. Publicly shared info can be seen by any other user
	2. Privately shared info can be seen by specified set of users only
4. It also enables users to share through other social networking platforms
	1. Facebook
	2. Twitter
	3. Flickr
	4. Tumblr
5. Simpler version of Instagram - user can share photos & follow other users
6. News feed (of each user) - consists of top photos of all people user follows

#### Requirements and Goals of the System ####
1. **Functional Requirements**
	1. Users should be able to upload/ download/ view photos
	2. Users can perform searches based on photo/ video titles
	3. Users can follow other users
	4. System should generate and display user's News Feed consisting of top photos from all people the user follows
2. **Non-Functional Requirements**
	1. Service needs to be highly available
	2. Acceptable latency of system is 200ms for News feed generation
	3. Consistency can take a hit (in the interest of availability) if user doesn't see a photo for a while, it should be fine
	4. System should be highly reliable; any uploaded photo or video should never be lost
3. **Not in scope**
	1. Adding tags to photos
	2. Searching photos on tags
	3. Commenting on photos
	4. Tagging users to photos
	5. Who to follow
	6. ...

#### Some Design Considerations ####
1. System would be read-heavy
	1. We can focus on building system that can retrieve photos quickly
2. Aspects:
	1. Practically, users can upload as many photos as they like
		1. Efficient management of storage is crucial factor in designing the system
	2. Low latency is expected while viewing photos
	3. Data should be 100% reliable. If user uploads a photo, system will guarantee that it will never be lost

#### Capacity Estimation and Constraints ####
1. Assuming we have 500M total users with 1M daily active users
2. 2M new photos every day, 23 new photos every second
3. Average photo file size => 200KB
4. Total space required for 1 day of photos

		2M * 200KB => 400 GB
		
5. Total space required for 10 years

		400GB * 365 (days a year) * 10 (years) ~= 1425TB

#### High Level System Design ####
1. We need to support 2 scenarios
	1. To upload photos
	2. To view/ search photos
2. We need [object storage](https://en.wikipedia.org/wiki/Object_storage) servers
3. We need database servers to store metadata info about photos

		client(s) - upload image -> Image Hosting System <-> Image Storage
		Image Hosting System <-> Image Metadata

#### Database Schema ####
1. Tip: **Defining the DB schema in the early stages of the interview would help to understand the data flow among various components and later would guide towards data partitioning**
2. What to store?
	1. Data about users
	2. Uploaded photos
	3. People they follow
	4. Index on (PhotoID, CreationDate) - we need to fetch recent photos first
3. DB schema:

		Photo
			PK: PhotoID: int
			UserID: int
			PhotoPath: varchar(256)
			PhotoLatitude: int
			PhotoLongitude: int
			UserLatitude: int
			UserLongitude: int
			CreationDate: datetime
			
		User
			PK: UserID: int
			Name: varchar(20)
			Email: varchar(32)
			DateOfBirth: datetime
			CreationDate: datetime
			LastLogin: datetime
			
		UserFollow
			PK:
				UserID1: int
				UserID2: int
				
4. Straight forward approach to store above data:
	1. RDBMS like MySQL
		1. Requires joins
			1. Challenge when we need to scale
				1. [SQL vs NoSQL](https://www.educative.io/collection/page/5668639101419520/5649050225344512/5728116278296576/)
5. We can store photos in distributed file storage like [HDFS](https://en.wikipedia.org/wiki/Apache_Hadoop), [S3](https://en.wikipedia.org/wiki/Amazon_S3)
6. The schema defined can be stored in a distributed key-value store (to enjoy benefits offered by NoSQL)
	1. Metadata related to photos can go to a table where 'key' would be 'PhotoID' and 'value' would be object containing PhotoLocation, UserLocation, CreationTimestamp, etc...
7. We need to store relationships between users and photos to know who owns which photo
8. We need to store list of people a user follows
9. Solution: Wide-column datastore like [Cassandra](https://en.wikipedia.org/wiki/Apache_Cassandra)
	1. UserPhoto table:
		1. 'key' is 'UserID'
		2. 'value' is list of 'PhotoIDs' (ownded by user) (stored in different columns)
	2. UserFollow table:
		1. Similar scheme
10. Cassandra (key-value stores) maintain number of replicas to offer reliability
	1. Delete's don't get applied instantly
		1. Data is retained for certain days (to support undeleting) before getting removed from system permanently

#### Data Size Estimation ####

#### Component Design ####

#### Reliability and Redundancy ####

#### Data Sharding ####

#### Ranking and News Feed Generation ####

#### News Feed Creation with Sharded Data ####

#### Cache and Load Balancing ####

### Designing Dropbox ###
### Designing Facebook Messenger ###
### Designing Twitter ###

### Designing Youtube or Netflix ###
1. Video sharing service like Youtube
	1. Users will be able to
		1. Upload videos
		2. View videos
		3. Search videos
2. Similar services:
	1. netflix.com
	2. vimeo.com
	3. dailymotion.com
	4. veoh.com
3. Difficulty level: Medium
4. Topics
	1. Why Youtube?
	2. Requirements and Goals of the System
	3. Capacity Estimation and Constraints
	4. System APIs
	5. High Level Design
	6. Database Schema
	7. Detailed Component Design
	8. Metadata Sharding
	9. Video Deduplication
	10. Load Balancing
	11. Cache
	12. Content Delivery Network (CDN)
	13. Fault Tolerance

#### Why Youtube? ####
1. One of the most popular
2. Features
	1. Upload
	2. View
	3. Share
	4. Rate
	5. Report
	6. Add comments on videos

#### Requirements and Goals of the System ####
1. Scope: Simpler version of Youtube with following requirements

##### Functional Requirements: #####
1. Users should be able to upload videos
2. Users should be able to share and view videos
3. Users should be able to perform searches based on video titles
4. Our services should be able to record stats of videos, e.g., likes/dislikes, total number of views, etc
5. Users should be able to add and view comments on videos

##### Non-Functional Requirements #####
1. System should be highly reliable, any video uploaded should not be lost
2. System should be highly available.
	1. Consistency can take a hit (in the interest of availability)
		1. If a user doesn't see a video for a while it should be fine
3. Users should have real-time experience while watching vidoes and should not feel any lag
4. Not in scope:
	1. Video recommendations
	2. Most popular videos
	3. Channels
	4. Subscriptions
	5. Watch later
	6. Favorites
	7. ...

#### Capacity Estimation and Constraints ####
1. Assume we have 1.5 billion total users
2. 800 million are daily active users
3. If on average, user views five videos per day, then total video-views per second is

		800M * 5 / 86400 sec => 46K videos / sec
		
4. Assume upload:view ratio: 1:200
	1. For every video upload, we have 200 vidoes viewed
		1. 230 vidoes uploaded per second

				46K / 200 => 230 videos / sec
				
5. **Storage Estimates**
	1. Every minute, 500 hours worth videos uploaded to Youtube
		1. If one minute of video needs 50MB of storage (videos need to be stored in multiple formats)
			1. Total storage needed for videos uploaded in a minute

					500 hours * 60 min * 50 MB => 1500 GB/min (25 GB/sec)
					
	2. Estimation ignores
		1. Video compression
		2. Replication
6. **Bandwidth Estimates**
	1. 500 hours of video uploads per minute => 30000 mins of video uploads per minute
		1. Assume each minute of video takes 10MB of bandwidth
			1. => 300 GB of uploads per minute

					500 hours * 60 mins * 10 MB => 300 GB/min (5GB/sec)
					
	2. Assume upload:view ratio of 1:200
		1. 1 TB/s outgoing bandwidth

#### System APIs ####
1. SOAP or REST APIs can be used to expose functionality of the service
2. Possible definitions of APIs

	1. Upload

			uploadVideo(api_dev_key, video_title, video_description, tags[], category_id, default_language, recording_details, video_contents)
		
		1. Parameters
			1. api_dev_key (string): API developer key of a registered account
				1. Used to (among other things) throttle users based on their allocated quota
			2. video_title (string): Title of the video
			3. video_description (string): Optional description of the video
			4. tags (string[]): Optional tags for the video
			5. category_id (string): Category of the video, e.g. Film, Song, People, etc...
			6. default_language (string): English, Mandarin, Hindi, etc...
			7. recording_details (string): Location where the video was recorded
			8. video_contents (stream): Video to be uploaded
		2. Returns: (string)
			1. HTTP 202: for successful upload
			2. Email notification: Email with link sent when video encoding completes
			3. Queryable API: To let users know current status of uploaded video

	2. Search

			searchVideo(api_dev_key, search_query, user_location, maximum_videos_to_return, page_token)
			
		1. Parameters
			1. api_dev_key (string): API developer key of a registered account of our service
			2. search_query (string): string containing search terms
			3. user_location (string): optional location of user performing search (?)
			4. maximum_videos_to_return (number): maximum number of results returned in one request
			5. page_token (string): token will specify page in result set that should be returned (?)
		2. Returns: (JSON)
			1. JSON containing information about list of video resources matching search query
				1. Video resource: Has following
					1. Title
					2. Thumbnail
					3. Creation date
					4. View count

	3. Stream

			streamVideo(api_dev_key, video_id, offset, codec, resolution)
			
		1. Parameters:
			1. api_dev_key (string): API developer key of a registered account of service
			2. video_id (string): string to identify video
			3. offest (number): One should be able to stream video from any offset
				1. Unit: time in seconds from beginning of video
					1. If one is playing/ pausing a video from multiple devices, we can store the offset on server
						1. Enables users to start watching video on any device from same point where they left off
			4. codec (string) & resolution (string):
				1. Different codecs and resolutions are passed to support multiple devices
					1. If we switch from TV to mobile to watch netflix:
						1. Different codec and resolution might be required
		2. Returns: (Stream)
			1. Media stream (a video chunk) from given offset

#### High Level Design ####
1. Components needed
	1. **Processing Queue**: Each uploaded video will be pushed to a processing queue to be de-queued later for encoding, thumbnail generation, and storage
	2. **Encoder**: To encode each uploaded video into multiple formats
	3. **Thumbnails generator**: To generate few thumbnails for each video
	4. **Video and Thumbnail storage**: To store video and thumbnail files in some distributed file storage
	5. **User Database**: To store user's information
		1. name
		2. email
		3. address
		4. ...
	6. **Video metadata storage**: Metadata database
		1. Stores all info about videos like
			1. Title
			2. File path in system
			3. Uploading user
			4. Total views
			5. Likes
			6. Dislikes
			7. ...
2. High level design of Youtube

		client -upload-> web server <-> App server -process q-> encode
		app server <-> user database
		app server <-> metadata database
		app server <- video & thumbnail storage
		encode -> metadata database
		encode -> video & thumbnail storage

#### Database Schema ####
1. **Video metadata storage - MySQL**
	1. Metadata can be stored in SQL db
	2. Following info can be stored with each video
		1. VideoID
		2. Title
		3. Description
		4. Size
		5. Thumbnail
		6. Uploader/ User
		7. Total number of likes
		8. Total number of dislikes
		9. Total number of views
	3. Following info can be stored for each video comment
		1. CommentID
		2. VideoID
		3. UserID
		4. Comment
		5. TimeOfCreation
2. **User data storage - MySQL**
	1. UserID
	2. Name
	3. Email
	4. Address
	5. Age
	6. Registration details
	7. ...

#### Detailed Component Design ####
1. Since service is potentially read-heavy, one can focus on building a system that can retrieve videos quickly
	1. Read write ratio is expected to be 200:1
		1. 200 views for every video upload
2. **Where would videos be stored?**
	1. Distributed file storage system
		1. [HDFS](https://en.wikipedia.org/wiki/Apache_Hadoop#HDFS)
		2. [GlusterFS](https://en.wikipedia.org/wiki/GlusterFS)
3. **How to efficiently manage read traffic?**
	1. Segregate read traffic from write traffic
		1. We can have multiple copies of each video
			1. Read traffic can be distributed on different servers
4. **How to efficiently manage read traffic?**
	1. Segregate read traffic from write traffic
		1. Possible because we have multiple copies of video
		2. Read traffic can be distributed on different servers
	2. Metadata:
		1. Primary-secondary configurations
			1. Writes go to primary
			2. They eventually get applied to secondaries
				1. Can cause staleness in data
					1. If new video is added, its metadata is inserted into primary first
						1. Secondaries would not be able to see it before it is applied to them
							1. They will return stale results to users
								1. Acceptable:
									1. It is short lived staleness
									2. User would be able to see new videos after few milliseconds
5. **Where do thumbnails get stored?**
	1. More thumbnails might be required than videos
		1. Assuming 5 thumbnails per video:
			1. Efficient storage is required to serve huge read traffic
				1. Two considerations before deciding which storage to be used for thumbnails
					1. Thumbnails: small files (5KB each say)
					2. Read traffic will be huge as compared to videos
						1. User might watch one video but the page might have 20 thumbnails of other videos as well
	2. Options:
		1. If thumbnails are stored on disk
			1. Many seeks need to be performed to read the files
				1. Inefficient and will result in higher latencies
		2. [Bigtable](https://en.wikipedia.org/wiki/Bigtable) - It is a wide column store
			1. Uses row key and column key and timestamp (3D mapping) into associated arbitrary byte array
				1. It is a sparse, distributed multi-dimensional sorted map
				2. Scales to petabyte range (across 100s or 1000s of machines)
					1. No re-configuration is required to add more machines
6. **Video Uploads**
	1. Videos could be huge
		1. If connection drops while uploading, we must support resuming from same point
7. **Video Encoding**
	1. Newly uploaded videos are stored on the server
	2. New task is added to processing queue to encode video into multiple formats
		1. Once all encoding is completed
			1. Uploader will be notified and video is made available for viewing or sharing
8. Detailed component design of Youtube

		client <-upload-> web-server <-> app-server -proc q-> encode
		web-server <-> view and image cache -> client
		user management <-> app-server <-> video-storage
		app-server <-> metadata database <-> encode
		encode -> video-storage
		BitTable Thumbnails Storage -> app-server

#### Metadata Sharding ####
1. Since read load is extremely high, we need to distribute data onto multiple machines
	1. This enables performing read/write operations efficiently
2. We have many options to shard data

##### Sharding based on UserID #####
1. We can store all data for a user on one server
	1. We can pass UserID to hash function
		1. The hash function will map user to database server where we will store all metadata for user's videos
		2. While querying, we can ask hash function to find server holding user's data and then read it from there
		3. To search videos by titles:
			1. We will have to query all servers
			2. Each server will return a set of videos
			3. Centralised server will aggregate and rank the results before returning them to user
	2. Issues with the approach
		1. What if user becomes popular?
			1. A lot of queries can hit the server holding that user
				1. Performance bottleneck
				2. It also affects overall performance of our service
		2. Over time some users can end up storing a lot of videos compared to others
			1. Maintaining uniform distribution of growing user data is tricky
2. Solutions:
	1. Re-partition/ redistribute data
	2. Use consistent hashing (to balance load between servers)

##### Sharding based on VideoID #####
1. Hash function will map each VideoID to a random server
	1. The server will be used to store Video's metadata
	2. To find vidoes of user
		1. We query all servers
		2. Each server will return a set of videos
		3. Centralized server will aggregate and rank the results before returning them to user
	3. Problem: Popular videos
		1. Solution: Re-partition or redistribution, consistent hashing
2. Cache can be used to further improve performance
	1. It can be used to store hot videos in front of db servers

#### Video Deduplication ####
1. 

#### Load Balancing ####
1. Consistent hashing can be used among cache servers
	1. Helps balance load between cache servers

#### Cache ####
#### Content Delivery Network (CDN) ####
#### Fault Tolerance ####
1. We can use [Consistent Hashing](https://www.educative.io/collection/page/5668639101419520/5649050225344512/5709068098338816/)
	1. To distribute among database servers
	2. It helps in replacing dead servers and also help in distributing load among servers

### Designing Typeahead Suggestion ###
### Designing an API Rate Limiter ###
### Designing Twitter Search ###
### Designing a Web Crawler ###
### Designing Facebook's Newsfeed ###
### Designing Yelp or Nearby Friends ###
### Designing Uber Backend ###
### Design Ticketmaster ###

### Additional Resources ###
1. [Dynamo](https://www.allthingsdistributed.com/files/amazon-dynamo-sosp2007.pdf) - Highly Available Key-Value Store
2. [Kafka](http://notes.stephenholiday.com/Kafka.pdf) - A distributed messaging system for Log processing
3. [Consistent hashing](https://www.akamai.com/es/es/multimedia/documents/technical-publication/consistent-hashing-and-random-trees-distributed-caching-protocols-for-relieving-hot-spots-on-the-world-wide-web-technical-publication.pdf) - Original paper
4. [Paxos](https://www.microsoft.com/en-us/research/uploads/prod/2016/12/paxos-simple-Copy.pdf) - Protocol for distributed consensus
5. [Concurrency Controls](http://sites.fas.harvard.edu/~cs265/papers/kung-1981.pdf) - Optimistic methods for concurrency controls
6. [Gossip protocol](http://highscalability.com/blog/2011/11/14/using-gossip-protocols-for-failure-detection-monitoring-mess.html) - For failure detection and more
7. [Chubby](http://static.googleusercontent.com/media/research.google.com/en/us/archive/chubby-osdi06.pdf) - Lock service for loosely-coupled distributed systems
8. [ZooKeeper](https://www.usenix.org/legacy/event/usenix10/tech/full_papers/Hunt.pdf) - Wait-free coordination for Internet-scale systems
9. [MapReduce](https://static.googleusercontent.com/media/research.google.com/en//archive/mapreduce-osdi04.pdf) - Simplified Data Processing on Large Clusters
10. [Hadoop](http://storageconference.us/2010/Papers/MSST/Shvachko.pdf) - A distributed file system

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
1. **Storage**: 
	1. SQL
		1. stores data in tables
		2. Each row represents an entity
		3. Each column represents data point about the entity
		4. Example: Columns for Car entity could be: 'Color', 'Make', 'Model', ...
	2. NoSQL
		1. Have different data storage models
			1. Key-value based
			2. Document based
			3. Graph based
			4. Columnar
2. **Schema**:
	1. SQL
		1. Each record confirms to a fixed schema
			1. Columns must be decided and chosen before data entry
			2. Each row must have data for all columns
		2. If schema needs to be modified:
			1. It can involve modifying whole database
			2. May require going offline
	2. NoSQL
		1. Schemas are dynamic
		2. Columns can be added on the fly
		3. Each row (or equivalent) doesn't have to contain data for each 'column'
3. **Querying**:
	1. SQL
		1. We can use SQL (Structured Query Language) for defining and manipulating data
			1. Powerful
	2. NoSQL
		1. Queries are focused on collection of documents
			1. UnQL (Unstructured Query Language)
				1. Different DBs have different syntax for UnSQL
4. **Scalability**:
	1. SQL
		1. Vertically scalable (in many common situations)
			1. We can achieve this by increasing horsepower (Memory, CPU, ...)
		2. Horizontal scaling (across multiple servers) is challenging and time-consuming process
	2. NoSQL
		1. Horizontally scalable
			1. One can add more servers easily in NoSQL database infrastructure (to handle more traffic)
			2. Cheap commodity hardware or cloud instances can host NoSQL databases
				1. Cost effective than vertical scaling
		2. NoSQL technologies also distribute data across servers automatically 

5. **Reliability or ACID Compliancy (Atomicity, Consistency, Isolation, Durability)**:
	1. Relational DBs:
		1. Many are ACID compliant
			1. Better for data reliability, safe guarantees of transactions
	2. NoSQL DBs: Sacrifice ACID compliance for performance and scalability
	
#### SQL vs. NoSQL - Which One to Use? ####
1. There is no one size fits all solution
2. Businesses rely on both relational and non-relational databases (for different needs)
3. NoSQL dbs are gaining popularity for their speed and scalability
4. Highly structured SQL database may perform better in certain situations
5. Using right technology depends on the use case

##### Reasons to Use SQL Database #####
1. Reasons:
	1. If we need to ensure ACID compliance
		1. Reduces anomalies and protects integrity of database
			1. Prescribes exactly how transactions interact with database
		2. NoSQL dbs sacrifice ACID compliance for scalability and processing speed
			1. e-commerce and financial applications need ACID compliant database (hence relational dbs are preferred)

##### Reasons to Use NoSQL Database #####
1. When other components of the application are fast and seamless, NoSQL dbs prevent data from being the bottleneck
	1. Big data - contributing factor to success of NoSQL dbs
		1. Handles data differently than traditional dbs
	2. Examples: MongoDB, CouchDB, Cassandra, HBase
2. Reasons:
	1. For storing large volumes of data that have little or no structure
		1. NoSQL databases have no limits on types of data one can store together
		2. New types can be added as need changes
		3. One can store data in document-based database without having to define what "types" of data those are in advance
	2. For making most of cloud computing and storage
		1. Cloud based storage is excellent cost-saving solution
			1. Cons: Requires data to be easily spread across multiple servers to scale up
		2. Commodity (affordable, smaller) hardware on-site or in cloud saves hassle of additional software
		3. Example: NoSQL dbs like Cassandra are designed to be scaled across multiple data centers out of the box (without many headaches)
	3. For rapid development
		1. NoSQL Dbs don't have to be prepared ahead of time
			1. Good for quick iterations
				1. Quick updates to data structure (without much downtime between versions)
		2. Relational database slows us down in this regard

### CAP Theorem ###
1. CAP Theorem: 
	1. It is impossible for a distributed software system to simultaneously provide more than two out of three of the following garantees (CAP)
2. **Consistency**
	1. All nodes see the same data at the same time
	2. Implementation: Updating several nodes before allowing further read
3. **Availability**
	1. Every request gets a response on success/failure
	2. Implementation: Replication of data across different servers
4. **Partition Tolerance**
	1. System continues to work despite message loss or partial failure
	2. A partition tolerant system can sustain any amount of network failure that doesn't result in failure of entire network
	3. Implementation: Data is sufficiently replicated across combinations of nodes and networks to keep system up through intermittent outages

	![cap_theorem_with_examples](cap_theorem_with_examples.jpeg)
	
5. One cannot build general data store that is continually available, sequentially consistent, tolerant to any partition failures
	1. One can build system that has only two of the properties
		1. To be consistent, all nodesshould see same set of updates in same order
		2. If network loses a partition, updates in one partition may not make it to the other partitions before client reads from out-of-date partition after having read from up to date partition
			1. To avoid this, the only thing that can be done is to stop serving requests from out-of-date partition
				1. => Service is no longer 100% available

### Consistent Hashing ###
1. Topics:
	1. What is Consistent Hashing?
	2. How does it work?
2. Distributed Hash Table (DHT): Fundamental component used in distributed scalable systems
	1. Hash tables need
		1. Key
		2. Value
		3. Hash function
			1. Maps key to location where value is stored

					index = hash_function(key)
					
3. Use case: Distributed caching system
	1. When new cache host is added to system, all existing mappings are broken
		1. Pain point of maintenance if caching system contains lots of data
			1. It is impractical to schedule downtime to update all caching mappings
	2. It may not be load balanced
		1. If data is non-uniformly distributed, it is more evident
			1. Standard assumption: Data is not distributed uniformly
				1. It may translate to certain caches becoming hot and saturated while others idle and almost empty
4. Solution: Consistent hashing

#### What is Consistent Hashing? ####
1. It is useful strategy (especially for distributed caching systems DHTs)
	1. Allows distributing data across cluster
		1. In a way that minimizes reorganization (when nodes are added and/or removed)
			1. Hence the caching system is easier to scale up and down
2. Consistent hashing: Working principle
	1. When hash table is resized (e.g. new cache host is added to system), only k/n keys need to be remapped
		1. k - total number of keys
		2. n - total number of servers
	2. If only `mod` is used to hash, all keys need to be remapped (not efficient)
	3. Objects are mapped to same host if possible
	4. When host is removed from system, objects on the system are shared by other hosts
	5. When new host is added, it takes it's share from few hosts without touching other's shares

#### How Does it Work? ####
1. Consistent hashing maps key to an integer
	1. If output is in the range of [0, 256]
	2. Imagine integers placed on a ring and values are wrapped around
2. Working principle
	1. Given a list of cache servers, hash them to integers in the range
	2. To map a key to a server:
		1. Hash it to a single integer
		2. Move clockwise on the right until finding the first cache it encounters
		3. The cache (encountered) is the one that contains the key
	3. If new server say D needs to be added, keys originally residing in C will split
		1. Some of the keys will be shifted to D (others will not be touched)
	4. To remove a cache or if cache fails say A, all keys originally mapped to A will fall into B
		1. Only the A's keys will need to be moved to B (other keys will not be affected)
3. For load balancing, real data is randomly distributed and may not be uniform
	1. May make keys on caches unbalanced
		1. Solution: Virtual replicas for caches
			1. Each cache is not mapped to a single point on the ring but to multiple points on the ring (replicas)
				1. Each cache is associated with multiple portions of the ring
4. If hash function mixes well as number of replicas increases, keys will be more balanced

### Long-Polling vs WebSockets vs Server-Sent Events ###
1. Topics:
	1. Ajax Polling
	2. HTTP Long-Polling
	3. WebSockets
	4. Server-Sent Events (SSEs)
2. Long-polling, websockets, server-sent events - popular communication protocols (between client (web browser say) and web server)
	1. HTTP Web request sequence
		1. Client opens a connection and requests data from server
		2. Server calculates response
		3. Server sends response back to client on opened request

				client - Request -> Server
				client <- Response - Server
				
			1. HTTP Protocol

#### Ajax Polling ####
1. Polling - standard technique used by majority AJAX apps
2. Working principle:
	1. Client repeatedly polls (or requests) server for data
		1. Client makes request and waits for server to respond with data
		2. If no data, server sends empty response
	2. Steps:
		1. Client opens connection and requests data from server using regular HTTP
		2. Requested webpage sends requests to server at regular intervals (0.5 seconds say)
		3. Server calculates response and sends it back, like regular HTTP traffic
		4. Client repeats 1 to 3 steps periodically to get updates from server
3. Ajax Polling protocol:

		Client - Request -> Server
		Client <- Response - Server
		Client - Request -> Server
		Client <- Response - Server
		Client - Request -> Server
		Client <- Response - Server

#### HTTP Long-Polling ####
1. A variation of traditional polling technique (allows server to push info to client whenever data is available)
2. Client requests info from server (as in normal polling)
	1. Server may not respond immediately
		1. Technique is also called "Hanging GET"
		2. If server does not have data for client (yet) it does not send empty response
			1. Server holds the request and waits until some data becomes available
			2. Once data becomes available, full response is sent to client
		3. Client immediately re-requests info from server so that server will almost always have an available waiting request
			1. Server can use it to deliver data in response to an event
3. Life cycle of app using HTTP long-polling:
	1. Client makes initial request using regular HTTP and waits for response
	2. Server delays it's respons until update is available (or timeout has occurred)
	3. If update is available, server sends full response to client
	4. Client (typically) sends new long-poll request
		1. Immediately upon receiving response or
		2. After a pause (to allow for acceptable latency period)
	5. Each long-poll request has a timeout
		1. Client has to reconnect periodically after connection is closed (due to timeout)

				Client - Request -> Server
				Client - Re-connect -> Server
				Client - Re-connect -> Server
				Client - Re-connect -> Server
				Client - Re-connect -> Server
				Client <- Response - Server
				
#### WebSockets ####
1. [Full Duplex](https://en.wikipedia.org/wiki/Duplex_(telecommunications)#Full_duplex) - communication channels are provided by websockets
	1. Also provides persistent connection between client and server
		1. Both parties can use the connection to send data at any time
2. How does it work?
	1. Client establishes websocket connection through the process called websocket handshake
	2. If the process succeeds, client and server can exchange data in both directions (at any time)
3. Pros: 
	1. Lower overheads
	2. Real-time data transfer between client and server
		1. Done using standardized way for server to send content to browser (without being asked by client) and allowing messages to be passed back and forth keeping connection open
		2. This way, two-way (bidirectional) ongoing conversation can be established between client and server

#### Server-Sent Events (SSEs) ####
1. Client establishes persistent and long-term connection with server
2. Server uses the connection to send data to client
3. If client wants to send data
	1. Needs to use another technology or protocol
4. Steps:
	1. Client requests data from server using regular HTTP
	2. Requested web-page opens connection to server
	3. Server sends data to client whenever new info is available
5. Use cases:
	1. For real-time traffic from server to client
	2. If server is generating data in a loop and sending multiple events to client

## Appendix ##
### Contact Us ###
1. hello@designgurus.org
2. Feedback: feedback@designgurus.org

### Other Courses ###
1. [Grokking the Coding Interview](https://www.educative.io/collection/5668639101419520/5671464854355968)
2. [Grokking the Object Oriented Design Interview](https://www.educative.io/collection/5668639101419520/5692201761767424)
3. [Grokking Dynamic Programing Patterns for Coding Interviews](https://www.educative.io/collection/5668639101419520/5633779737559040)
