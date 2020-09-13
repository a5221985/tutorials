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
2. Three-tier application:
	1. In three-tier application, user interface, application logic & database lie on different machines & have different tiers. They are physically separated
3. Example:

	![three_tier_architecture](three_tier_architecture.jpeg)
	
4. Example: Simple blog
	1. UI - HTML, JS, CSS
	2. Backend - Apache (say)
	3. Database - MySQL (say)
5. This architecture is best for simple use cases

### N Tier Applications ###
1. N-Tier applications and components
2. Topics covered:
	1. N-Tier app
	2. Why need for so many tiers?
	3. Single responsibility principle
	4. Separation of concerns
	5. Difference between layers and tiers

#### N-Tier Application ####
1. An N-tier app is app which has more than three components involved
2. What components?
	1. Cache
	2. Message queues for asynchronous behavior
	3. Load balancers
	4. Search servers for searching through massive amounts of data
	5. Components involved in processing massive amounts of data
	6. Components running heterogeneous tech commonly known as web services etc...
3. Examples: Social applications
	1. Instagram
	2. Facebook
4. Examples: Large scale industry services
	1. Uber
	2. Airbnb
5. Note:
	1. N-tier apps are called **distributed apps**
		1. Not safe to use this term yet
			1. It brings in complex stuff with it
				1. Confusing

#### Why the Need for So Many Tiers? ####
1. Two design principles can be used to explain this:
	1. Single Responsibility Principle
	2. Separation of Concerns

#### Single Responsibility Principle ####
1. Giving only one responsiblity to a component
	1. Let it execute it with perfection
		1. Examples:
			1. Saving data
			2. Running app logic
			3. Ensure delivery of message throughout system
2. Advantages:
	1. Flexibility
	2. Easier management
		1. Example: Upgrading DB server (like OS or patch) does not impact other components or service running
			1. Even if OS is installed, database would go down
			2. Rest of the application will still be up and only database dependent features are affected
	3. We can have dedicated teams
	4. We can have dedicated code repos for each component
3. Stored procedures violates SRP
	1. Business logic is in DB
		1. If database needs to be changed, how do we migrate the business logic?
			1. Migrate to new database?
			2. Refactor app code and squeeze in stored proc logic?
	2. DB should not have business logic
		1. It must be used to only persist data
4. Hence separate tier for each component

#### Separation of Concerns ####
1. Means be concerned about my work only and stop worrying about rest of the stuff
	1. Principle acts at all levels of service
		1. Tier level
		2. Code level
2. Keeping components separate makes them re-usable
	1. Different services can use same:
		1. DB
		2. Messaging server
		3. Other component
	2. Caveat: They must not be tightly coupled
3. Loosely coupled components makes scaling service easy in future when things grow

#### Difference Between Layers & Tiers ####
1. Layers in industry mean
	1. User interface layer
	2. business layer
	3. service layer
	4. data access layer
2. Example:

	![layers_in_architecture_logical](layers_in_architecture_logical.jpeg)
	
3. Layers are at code level
	1. Layers represent organization of code (breaking it into components)
	2. Tiers involve physicall separation of components
4. The layers can be used in any tiered application
	1. Single
	2. Two
	3. Three
	4. N

### Different Tiers in Software Architecture Quiz ###

## Web Architecture ##
### What is Web Architecture? ###
1. Involves multiple components
	1. Database
	2. Message queue
	3. Cache
	4. UI
2. All components run in conjunction with each other to form online service
3. Web architecture knowledge is important to software engineers
4. Example:

	![web_architecture](web_architecture.jpeg)
	
5. The example is typical architecture of web application used in majority of applications running online
6. We need to know the components well to build upon the architecture for more complex requirements
7. Next: Every component in detail

### Client Server Architecture ###
1. Architecture example:

	![client_server_architecture](client_server_architecture.jpeg)
	
2. Client-server architecture is fundamental building block of the web
	1. Works on request-response model
		1. Client sends request to server for info
		2. Server responds with info
	2. Examples:
		1. Wordpress blog
		2. Facebook
		3. Twitter
		4. Bank app
3. Small percent of business websites use **peer to peer architecture**

### Client ###
1. Topics
	1. Client
	2. Technologies used to implement clients in web applications

#### Client ####
1. Client holds UI
2. UI: Presentation part of the application
	1. Written in
		1. HTML
		2. JS
		3. CSS
3. It is responsible for look & feel of app
4. Client can be:
	1. Mobile app
	2. Desktop
	3. Tablet (iPad)
	4. Web based console
		1. Commands
5. Architecture example:

	![client_architecture](client_architecture.jpeg)
	
#### Technologies Used to Implement Clients in Web Apps ####
1. Client is window to application
2. Open Source technos popular for web-based UIs
	1. ReactJS
	2. AngularJS
	3. VueJS
	4. JQuery
	5. ...
3. Different platforms need different frameworks and libraries for front-end
	1. Mobile phones
		1. Android tools
		2. iOS tools
		3. Windows Tools
4. [Developer Survey of StackOverflow](https://insights.stackoverflow.com/survey/2019#technology)

### Types of Client ###
1. Two Types:
	1. Thin client
	2. Thick client

#### Thin Client ####
1. Holds just UI of app
2. It has no business logic
3. For each action, client sends request to backend server
4. Client types example:

	![client_types](client_types.jpeg)
	
#### Thick Client ####
1. Thick client holds all or some part of business logic (Two tier apps)
2. Examples:
	1. Utility app
	2. Online games
	3. ...

### Server ###
1. Topics
	1. What is a Web Server?
	2. Server-Side Rendering

#### What is a Web Server? ####
1. Task of web server: receive requests from client & provide response after executing business logic (based on request params received from client)
2. Every service needs server to run (which run online)
	1. Application servers: Servers running web applications
3. Other types of servers:
	1. Proxy server
	2. Mail server
	3. File server
	4. Virtual server
4. Server config and type can differ depending on use case
	1. Example: Backend app code written in Java
		1. Apache Tomcat
		2. Jetty
	2. Example: Simple use cases - hosting websites
		1. Apache HTTP Server
5. All components of web app need server
	1. Database
	2. Message queue
	3. Cache
	4. ...
	5. UI - also hosted on dedicated server in modern apps

#### Server-Side Rendering ####
1. Server-side rendering: Server can be used to render UI on backend and send rendered data to client
2. There are pros and cons of this technique

### Communication Between the Client & the Server ###
1. Topics:
	1. Request-Response Model
	2. HTTP Protocol
	3. REST API & API Endpoints
	4. Real World Example of Using a REST API

#### Request-Response Model ####
1. Client-server have request-response model
2. Client sends request and server responds with data
3. If no request, then no response

#### HTTP Protocol ####
1. Protocol used for communication
	1. Over World Wide Web
2. HTTP protocol:
	1. It is request-response protocol that defines how info is transmitted across web
	2. It is stateless protocol
		1. Every process over HTTP is executed independently & has no knowledge of previous process
	3. [good resource](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview)

#### REST API & API Endpoints ####
1. N-tier: Every client must hit REST end-point to fetch data from backend
2. Backend app code has REST-API implemented which acts as interface to outside world requests
	1. Every request must hit REST-endpoints to fetch data
		1. Client written by business
		2. Third party clients which consume data
3. REST API Architecture:

	![rest_api_Architecture](rest_api_Architecture.jpeg)

#### Real World Example of Using a REST API ####
1. To write an application that keeps track of birthdays of friends and send a reminder couple of days before event date
2. Client can hit Facebook Social Graph API (REST-API) to get data & then run business logic on data
3. There are advantages of REST based API

### Web Architecture Quiz - Part 1 ###
### What is a REST API? ###
1. Topics:
	1. What is REST?
	2. REST API
	3. REST Endpoint
	4. Decoupling Clients & Backend Service
	5. Application Development Before the REST API
	6. API Gateway

#### What is REST? ####
1. REST: Representational State Transfer
	1. Software architectural style for implementing web services
	2. RESTful web services:
		1. Web services implemented using REST architectural style

#### REST API ####
1. It is an API implementation that adheres to REST architectural constraints
	1. Acts as interface
	2. Communication between client & server is over HTTP
	3. Takes advantage of HTTP methodologies to establish communication between client and server
	4. Caching: Servers can cache response that improves performance
2. Stateless communication:
	1. Every communication between client and server is a new one
		1. No info or memory carries over from previous communications
			1. Client has to send authentication info whenever it interacts with backend (backend then figures out if client is authorized to access data)
3. Decoupling of front end and back end:
	1. REST API decouples backend & client

#### REST Endpoint ####
1. API/REST/Backend endpoint means url of service:

		https://myservice.com/users/{username}
		
	1. It is a backend endpoint to fetch user details of particular user from service
	2. REST-based service will expose url to all clients to fetch user details using url

#### Decoupling Clients & the Backend Service ####
1. Backend service doesn't worry about client implementation
	1. It calls out to multiple clients and says
		1. "Hey everyone, this is url address of resource/info you need. Hit it whenever you need the resource. Any client with required authorization can access it"
2. Different clients can have different code bases:
	1. Mobile browser
	2. Desktop browser
	3. Tablet
	4. API Testing tool
3. New types of clients and modification of client code has no effect on functionality of backend service
	1. Clients and backend services are decoupled

#### Application Development Before the REST API ####
1. Before REST-API, backend code was tightly coupled with client
	1. JSP (Java Server Page) is an example
		1. Business logic is put in JSP tags
			1. Makes code refactoring and adding new features difficult (logic got spread across different layers)
			2. Separate code/ classes were required for handling requests from different types of clients
				1. One servlet for mobile client
				2. One servlet for web-based client
				3. ...
		2. REST API:
			1. No worry about clients
			2. Provide endpoints
				1. Response is in JSON or other standard data transport format
					1. Client handles data in whatever way they want
			3. Multiple types of clients can be introduced without considering backend implementation
			4. To access public data of social network
				1. Use their REST API

#### API Gateway ####
1. API Gateway architecture:

	![api_gateway_architecture](api_gateway_architecture.jpeg)
	
2. REST-API - single entry point into system (gateway)
	1. It encapsulates business logic
	2. It handles all client requests
	3. It takes care of authorization
	4. It takes care of authentication
	5. It can sanitize input data & other necessary tasks
		1. Before providing access to app resources
3. REST API is interface for communication between client and server over HTTP
4. Next: HTTP Pull & Push-based communication mechanisms

### HTTP Push & Pull - Introduction ###
1. Topics
	1. HTTP PULL
	2. HTTP PUSH
2. Two modes of data transfer between client and server
	1. HTTP PUSH
	2. HTTP PULL

#### HTTP PULL ####
1. For every response, there has to be a request
	1. Client sends request
	2. Server responds with data
2. Client pull data from server when it requires
	1. Does it over and over to fetch updated data
3. Bandwidth is consumed for every request and response to and from server
4. Every hit on server costs business money & adds load on server
5. If there is no updated info on server when client sends request:
	1. Client doesn't know that - so sends request over and over
		1. Not ideal
		2. Wastage of resources
		3. May bring down server - if excessive pulls

#### HTTP PUSH ####
1. Client sends request for info to server
	1. For first time
2. Then server keeps pushing new updates to client whenever available
	1. Advantage: Client doesn't have to send requests multiple times for data
		1. Saves network bandwidth
		2. Cuts down load on server (significantly)
3. Example: Callback
	1. Client phones server for info
	2. Server responds:
		1. "Hey!! I don't have info right now but I'll call back whenever it is available"
	3. Example: User notifications
		1. If an event happens in backend, we get notified
			1. Implementation: Ajax on client side (Asynchronous JavaScript & XML)

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