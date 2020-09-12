# Web Application & Software Architecture 101 #
## Course Overview ##
1. Components & concepts involved while designing architecture of web apps
2. Architectural styles
	1. client-server
	2. peer to peer decentralized
	3. microservices
	4. data flow in web app
	5. layers
	6. scalability concepts
	7. high availability
	8. ...
3. Picking right architecture and technology stack to implement the use case
4. Different use cases to gain insight into what technology & architecture fits best for certain use case when writing web app
5. Technology trade-offs

### About This Course ###
1. Topics:
	1. Who is the course for?
	2. Why take this course? What to expect from it?
	3. Course author
2. Who is this course for?
	1. It is for building good concept in web application & software architecture & for strenthening fundamentals
	2. Building software is like fitting lego blocks
	3. Helps with software engineering interviews
		1. Especially for full stack
3. Why take this course? What to expect from it?
	1. Components & concepts when designing architecture of web apps
	2. Architectural styles
		1. Client server
		2. Peer to peer decentralized architecture
		3. Microservices
		4. Fundamentals of data flow in web apps
		5. Layers
		6. Scalability
		7. High availability
		8. ...
	3. Techniques of picking the right architecture and technology stack to implement use cases
	4. Uses cases
		1. What technology and architecture fits best
		2. Technology trade-offs
	5. Course is for entrepreneurial journey
4. Course Author
	1. HP Enterprise - Full-stack developer in Technical Solutions - R & D team
	2. [LinkedIn Profile](https://www.linkedin.com/in/shivang-sarawagi-b7b5881b/)

### Significance of Software Architecture ###
1. Topics:
	1. Significance of web apps
	2. Significance of software architecture
	3. Reason behind learning architecture
2. Headings:
	1. Importance of getting app architecture right
	2. Overview of software development process
		1. POC
	3. Course design

#### Importance of Getting App Architecture Right ####
1. Get the base right
2. Architecture is base and must be carefully thought
	1. To avoid major design changes
	2. To avoid code refactoring at a later point
3. Re-design eats up time
	1. May push shipping dates (may be by months)
	2. May waste engineering and financial resources to do this
4. Before we touch code and get hands dirty, get the architecture right
5. Software development is iterative and evolutionary process
	1. We always don't get things perfect in the first go
		1. It is not an excuse for not doing homework

#### An Overview of the Software Development Process ####
1. Requirement gathering and analysis
	1. Architects, developers and product owners spend time discussing requirements
2. When business requirements are done, we study use cases which we have to implement
	1. This involves figuring out corner cases as early as possible
	2. This involves fitting lego blocks together
	3. This may invole writing high level design documents
3. Once requirements, use cases, corner cases are done, research on picking right technology stack to implement the use cases

#### Proof of Concept ####
1. Once tech stack is picked, we write POC
2. What is POC?
	1. Helps get closer, hands-on-view of technology
	2. Helps us implement basic use case
	3. We can understand pros and cons of tech, performance, other tech limitations if any
	4. Helps with learning curve if working with completely new tech
		1. Product owners, stakeholders have something concrete to play with to base their further decisions on
	5. For solo indie developer or small group
		1. Pic the POC and start with the main code
	6. Showcase POC to stakeholders
		1. If everyone is satisfied, main repo is created and first dev branch on GitHub
3. It is important to
	1. Get architecture right the first time
	2. Get knowledge of web architecture across to developers

#### Course Design ####
1. Two parts:
	1. Concepts & Architectural components involved in designing web applications
		1. Insights into tiers of software applications
			1. Monolithic repos
			2. Microservices
			3. Peer to peer architecture
			4. ...
	2. Second part:
		1. Use cases for designing architecture for apps (we use in day to day life)
2. Understanding how apps are designed from bare bones
	1. Thought process of picking right tech stack for use case ...

## Different Tiers in Software Architecture ##
### Introduction ###
1. Tier:
	1. What is it?
	2. What are it's components?
2. Different tiers involved in software landscape (bird's eye view)
3. What we learn?
	1. What is tier?
	2. Why do software apps have different tiers? What is need for them?
	3. How to decide the number of tiers in app?

#### What is a Tier? ####
1. Tier: logical separation of components in application or service
	1. Separation is at physical at component level (not code level)
2. Components?
	1. Database
	2. Backend application server
	3. User interface
	4. Messaging
	5. Caching
3. Web service components:

	![Web service component](application_tiers.jpeg)
		
4. Next: types of tiers and real examples

### Single Tier Applications ###
1. A single-tier application is an application where the user interface, backend business logic & the database all reside in the same machine
2. Example: User interface, backend server, database all reside in same machine

	![single_tier_architecture](single_tier_architecture.jpeg)
	
3. Examples:
	1. Desktop apps
		1. MS Office
		2. PC Games
		3. Image editing software
			1. Gimp
	
#### Advantages of Single Tier Applications ####
1. Main upside:
	1. No network latency
		1. Every main component is on same machine
		2. Hence adds to performance of software
		3. No requests to backend server
			1. Does not make user experience slow
	2. Caveat: Performance depends on how powerful the machine is
		1. Depends on hardware requirements & software
	3. Data of user stays in machine and doesn't need transmission over network
		1. Ensures data safety at highest level

#### Disadvantages of Single Tier Applications ####
1. Business will not have control over application
	1. Once software is shipped, no code or feature changes can be done until customer manually updates by connecting to remote server or downloading & installing patch
	2. Example: Buggy game in 90s once shipped, nothing could be done
	3. Solution: Product testing must be thorough - no room for mistakes
2. Code in single-tier apps is vulnerable to being tweeked & reverse engineered
3. Security is minimal
4. Performance & look and feel can get inconsistent 
	1. As it depends on config of user's machine

### Two Tier Applications ###
1. Topics:
	1. Two tier applications
	2. Need for two tier applications

#### Two Tier Application ####
1. A two-tier application involves a client and a server.
	1. The client would contain user interface & business logic in one machine
	2. Backend could be database running on different machine
		1. It is hosted by business
2. Example:

	![two_tier_architecture](two_tier_architecture.jpeg)
	
3. Why two-tier apps?
4. Why not host business logic on different machine & control it?
5. Is app code not vulnerable to being accessed by third person?

#### Need for two tier app ####
1. Examples: To-do list app, planner app, productivity app
	1. No business significant harm (if code is accessed by third person)
	2. Advantages:
		1. UI and code reside on same machine and hence fewer network calls to backend server
			1. Application latency is kept low
2. To-do list save:
	1. When user is done constructing to-do list he then persists changes to database
3. Online browser
4. App-based games
	1. games files are downloaded the only once when user uses app for the first time
	2. Network calls are again made to keep game state persistent
5. Fewer service calls => less money spent on servers
6. How is choice made?
	1. Business requirements dependent
	2. Use case dependent
7. One can keep UI and business logic on client or move business logic to dedicated backend (three-tier app)

### Three Tier Applications ###
1. Popular
	1. Largely used in industry
		1. Simple websites
			1. Blogs
			2. News websites
			3. ...

### N Tier Applications ###
### Different Tiers in Software Architecture Quiz ###

## Web Architecture ##
### What is Web Architecture? ###
### Client Server Architecture ###
### Client ###
### Types of Client ###
### Server ###
### Communication Between the Client & the Server ###
### Web Architecture Quiz - Part 1 ###
### What is a REST API? ###
### HTTP Push & Pull - Introduction ###
### HTTP Pull - Polling with Ajax ###
### HTTP Push - Based Technologies ###
### Client-Side Vs Server-Side Rendering ###
### Web Architecture Quiz - Part 2 ###

## Scalability ##
### What is Scalability? ###
### Types of Scalability ###
### Which Scalability Approach is Right For Your App? ###
### Primary Bottlenecks that Hurt the Scalability of Our Application ###
### How to Improve & Test the Scalability of Our Application? ###
### Scalability Quiz ###

## High Availability ##
### What is High Availability? ###
### Reasons for Systems Failures ###
### Achieving High Availability - Fault Tolerence ###
### Redundancy ###
### Replication ###
### High Availability Clustering ###
### High Availability Quiz ###

## Load Balancing - ( - New - ) ##
### Introduction to Load Balancing ###
### Understanding DNS - Part 1 ###
### Understanding DNS - Part 2 ###
### DNS Load Balancing ###
### Load Balancing Methods ###
### Load Balancing Quiz ###

## Monolith & Microservices ##
### What is a Monolithic Architecture? ###
### When Should You Pick a Monolithic Architecture? ###
### What is a Microservice Architecture? ###
### When Should You Pick A Microservices Architecture? ###
### Monolith & Microservices - Understanding the Trade-Offs - Part 1 ###
### Monolith & Microservices - Understanding the Trade-Offs - Part 2 ###
### Monolith & Microservices Quiz ###

## Micro Frontends (- New -) ##
### Introduction to Micro Frontends ###
### The Need for Micro Frontends ###
### Micro Frontends Integration ###

## Database ##
### Introduction & Types of Data ###
### Relational Database ###
### When Should You Pick A Relational Database? ###
### NoSQL Databases - Introduction ###
### Features of NoSQL Databases ###
### When to Pick a NoSQL Database? ###
### Is NoSQL More Performant than SQL? ###
### Database Quiz - Part 1 ###
### Polyglot Peristance ###
### Multi-Model Databases ###
### Eventual Consistency ###
### Strong Consistency ###
### CAP Theorem ###
### Database Quiz - Part 2 ###
### Types of Databases ###
### Graph Databases ###
### Key Value Database ###
### Time Series Database ###
### Wide-Column Database ###
### Database Quiz - Part 3 ###


## Caching ##
### Introduction ###
### How Do I Figure If I Need A Cache in My Application? ###
### Reducing the Application Deployment Costs via Caching ###
### Caching Strategies ###
### Caching Quiz ###

## Message Queue ##
### Introduction to Message Queues ###
### Publish Subscribe Model ###
### point to Point Model ###
### Notification Systems & Real-Time Feeds with Message Queues ###
### Handling Concurrent Requests with Message Queues ###
### Message Queue Quiz ###

## Stream Processing ##
### Introduction ###
### Data Ingestion ###
### Different Ways of Ingesting Data & the Challenges Involved ###
### Data Ingestion Use Cases ###
### Data Pipelines ###
### Distributed Data Processing ###
### Lambda Architecture ###
### Kappa Architecture ###
### Stream Processing Quiz ###

## More On Architecture ##
### Event Driven Architecture - Part 1 ###
### Event Driven Architecture - Part 2 ###
### Web Hooks ###
### Shared Nothing Architecture ###
### Hexagonal Architecture ###
### More on Architecture Quiz - Part 1 ###
### Peer to Peer Architecture - Part 1 ###
### Peer to Peer Architecture - Part 2 ###
### Decentralized Social Networks ###
### Federated Architecture ###
### More on Architecture Quiz - Part 2 ###

## Picking the Right Technology ##
### How to Pick the Right Server-Side Technology? ###
### Key Things to Remember When Picking the Tech Stack ###
### Conclusion ###

## Case Studies ##
### A Web-Based Mapping Service ###
### A Baseball Game Ticket Booking Web Portal ###

## Mobile Apps ( - New - ) ##
### Introduction ###
### Before You Design Your Mobile App ###
### Responsive Interfaces ###
### Types of Mobile Apps - Part 1 ###
### Types of Mobile Apps - Part 2 ###
### Choosing Between A Native & A Hybrid App ###
### Progressive Web Apps ###
### Mobile Backend as a Service ###
### Epilogue ###