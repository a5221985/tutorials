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
			1. Implementation: Ajax on client side (Asynchronous JavaScript & XML) to server in HTTP pull based mechanism
4. HTTP Push based mechanisms:
	1. Ajax Long Polling
	2. Web Sockets
	3. HTML5 Event Source
	4. Message Queues
	5. Streaming over HTTP
5. Next: Details

### HTTP Pull - Polling with Ajax ###
1. HTTP pull using polling over AJAX
2. Topics:
	1. AJAX - Asynchronous JavaScript & XML
3. Two ways of pulling/ fetching data from server
	1. HTTP GET request to server manually by triggering an event
		1. Clicking button
		2. Invoking other element
	2. Fetching data dynamically at regular intervals using AJAX without human intervention

#### AJAX - Asynchronous JavaScript & XML ####
1. AJAX: Asynchronous JavaScript & XML
	1. Used for adding asynchronous behaviour to web page
2. AJAX Example:

	![ajax_model](ajax_model.jpeg)
	
3. AJAX enables fetching updated data from server automatically sending requests over and over at stipulated intervals
	1. When updates are received
		1. A section of web page is updated dynamically by callback method
			1. Example: News websites, Sports websites (without reload)
4. `XMLHttpRequest`
	1. AJAX uses the object to send requests to server
	2. It is built in browser
	3. It uses JavaScript to update HTML DOM
5. JQuery - AJAX is used with this framework to implement asynchronous behaviour on UI
6. Polling - Requesting information server at regular intervals

### HTTP Push ###
1. Topics
	1. Time to Live (TTL)
	2. Persistent Connection
	3. Heartbeat Interceptors
	4. Resource Intensive

#### Time to Live (TTL)####
1. In HTTP Pull - There is Time to Live (TTL) for every request.
	1. 30 seconds, 60 seconds (varies with browser)
		1. If client does not receive response from server withing TTL, browser kills connection & client must send request hoping it would receive data from server before TTL ends again.
2. Open connections consume resources
	1. There is limit on number of open connections a server can handle at one point in time
	2. If connections are not closed and new ones introduced, server will run out of memory
3. Solution: TTL is used to avoid this issue
4. Problem: Suppose we are certain that response will take more time than TTL set by browser?

#### Persistent Connection ####
1. Persistent connection between client and server
	1. It is a network connection between client & server that remains open for further requests & responses, as opposed to being closed after single communication
2. HTTP Push-based communication between client and server
3. Example push based communication:

	![http_push_based_communication](http_push_based_communication.jpeg)

#### Heartbeat Interceptors ####
1. How is persistent connection possible?
	1. Solution: Heartbean interceptors
		1. These are blank request responses between client and server to prevent browser from killing connection
2. Isn't it resource intensive?

#### Resource Intensive ####
1. It is
	1. Persistent connections consume lot of resources in comparison to HTTP pull behaviour
	2. When is establishing persistent connection useful?
		1. Browser-based multi-player game has large amount of request-response activity within certain time
			1. It is better from user experience standpoint
2. Implementation strategies:
	1. Ajax long polling
	2. Web sockets
	3. Server-sent events
	4. ...

### HTTP Push - Based Technologies ###
1. Topics:
	1. Web Sockets
	2. AJAX - Long Polling
	3. HTML5 Event Source API & Server Sent Events
	4. Streaming Over HTTP
	5. Summary

#### Web Sockets ####
1. Preferred if bi-directional low latency data flow from client to server & back is required
2. Use cases:
	1. Messaging
	2. Chat applications
	3. Real time social streams
	4. Browser based massive multiplayer games (quite a number of read writes in comparison to regular web app)
3. With web-sockets, we can keep the client-server connection as long as we want
4. Use case: Bi-direction data
	1. It does not work over HTTP
	2. It runs over TCP
		1. Both server and client must support web-sockets (or else it wont work)
5. [The WebSocket API](https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API)
6. [Introducing WebSockets - Bringing Sockets to the Web](https://www.html5rocks.com/en/tutorials/websockets/basics/)

#### AJAX - Long Polling ####
1. It lies between Ajax & Web Sockets
	1. Instead of immediately returning response, server holds response until it finds an update to be sent to client
	2. Connection stays a bit longer (than polling)
		1. Server doesn't return empty response
		2. If connection breaks, client has to re-establish connection to server
2. Advantages:
	1. Smaller number of requests sent from client to server (in comparison to regular polling)
		1. Reduces network bandwidth consumption
3. Use cases:
	1. Simple asynchronous data fetch (if we do not want to poll server too frequently)

#### HTML5 Event Source API & Server Sent Events ####
1. Different approach:
	1. Client does not poll for data
		1. Server automatically pushes data to client whenever updates are available
			1. Incoming messages from server are treated as events
2. With this approach:
	1. Servers can initiate data transmission towards client once client has established connection with initial request
	2. Helps get rid of huge number of blank request-response cycles
		1. Cuts down bandwidth consumption by notches
3. **Implementation:**
	1. Backend language must support the technology
	2. On UI: HTML5 Event source API is used to receive data in-coming from backend
4. Note: Once client establishes connection with server, data flow is in one direction only (from server to client)
5. Use cases:
	1. Real-time feed
		1. Twitter
		2. Stock quotes on UI
		3. Real-time notifications
6. [Good resource for further reading on SSE](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events)

#### Streaming Over HTTP ####
1. Use cases:
	1. Large data needs to be streamed over HTTP by breaking into smaller chunks
2. **Implementation: HTML5 & JavaScript Stream API**
3. Streaming API Example:

	![streaming_api](streaming_api.jpeg)
	
4. Used for multimedia content over HTTP
	1. Large images
	2. Video
	3. ...
5. Video:
	1. We can view partially downloaded video as it continues to download
		1. Playing downloaded chunks on the client
6. Setup:
	1. Client & Server agree to confirm to some streaming settings
		1. Helps them figure out when stream begins and ends over HTTP request-response model
7. [Further reading on Stream API](https://developer.mozilla.org/en-US/docs/Web/API/Streams_API/Concepts)

#### Summary ####
1. Persistent connection between client and server - technologies used
2. Ajax use case: Dynamically update web page by polling server at regular intervals
3. Long polling use case: Connection open time is slightly longer than polling mechanism
4. Web sockets use case: Bi-directional data flow
5. Server sent events: data flow from server to client
6. Technology that best fits depends on use cases

### Client-Side Vs Server-Side Rendering ###
1. Topics:
	1. Client-side rendering - How does a browser render a web page?
	2. Server-side rendering
	3. Use cases for server-side & client-side rendering

#### Client-Side Rendering - How Does A Browser Render A Web Page? ####
1. When user request web page from server & browser receives response
	1. Browser has to render response on window in the form of HTML page
2. Browser components for this:
	1. Browser engine
	2. Rendering engine
	3. JavaScript interpreter
	4. Networking & the UI backend
	5. Data storage etc...
2. Browser has significant work to convert response from server into HTML page
3. Rendering engine constructs DOM tree, renders & paints construction
	1. This needs time

#### Server-Side Renderig ####
1. To avoid rendering time on client UI is rendered on server
	1. HTML is generated in serve and directly sent to UI
2. It ensures faster rendering of UI
	1. Averts UI loading time in browser window
		1. Page is already constructed
			1. No much assembling & rendering work for browser

#### Use Cases for Server-Side & Client-Side Rendering ####
1. Server-side rendering is good for static content (WordPress Blogs)
	1. Good for SEO (crawlers can read the generated content)
2. Modern websites are dependent on Ajax
	1. Content for a module or section of a page must be fetched and rendered on the fly
3. Server side rendering generates entire page on server instead of sending just required content to client
	1. Consumes unnecessary bandwidth
	2. Fails to provide smooth user experience
		1. If number of concurrent users on website rises, it puts unnecessary load on server
4. Client side rendering:
	1. Good for Ajax based websites
5. Hybrid approach can be used
	1. To get most out of both techniques
		1. Home page can use server side rendering
		2. Other static content can use server side rendering
		3. Dynamic pages can use client side rendering
6. Important concepts:
	1. Monolithic architecture
	2. Micro-services
	3. Scalability
	4. High availability
	5. Distributed systems
	6. What are nodes in distributed systems? Why are they important to software design?
7. The components help to understand rest of the web components better

### Web Architecture Quiz - Part 2 ###

## Scalability ##
### What is Scalability? ###
1. Topics
	1. What is scalability?
	2. What is latency?
	3. Measuring latency
		1. Network latency
		2. Application latency
	4. Why is low latency so important for online services?
2. Scalability:
	1. What is it?
	2. Why is it important?
	3. Why is everyone talking about it?
	4. Is it important to scale systems?
	5. What are the plans or contingencies to scale when app or platform experiences significant traffic growth?
3. Chapter - deep dive into scalability
	1. Covers:
		1. What does scalability mean (in context of web applications)
		2. What does scalability mean in context of distributed systems or cloud computing?
		3. ...

#### What is Scalability? ####
1. It means ability of application to handle & withstand increased workload without sacrificing latency
	1. Example: 
		1. If app takes x seconds to respond to user request, it should take same x seconds to respond to each of million concurrent user requests on the app
	2. Backend infrastructure should not cumble under load of million concurrent requests
		1. It should scale well when subjected to heavy traffic load
		2. It should maintain latency of the system
2. Scalable application example:

	![scalabile_application_example](scalabile_application_example.jpeg)
	
#### What is Latency? ####
1. Latency: Amount of time system takes to respond to a user request
	1. If system takes 2 seconds to respond to a request, the latency is 2 seconds
2. Efficient software systems strive for minimum latency
	1. If traffic builds up, latency should not go up
		1. If latency remains the same, we can say, the application scaled well with increased load and is highly scalable
3. Big-O notation: Ideal case - O(1) for any algorithm (constant time: for key-value database say)
	1. O(n^2): where n is size of dta set
		1. This is not scalable
			1. If size of data set increases, the system needs more computational power to proces tasks
4. How do we measure latency?

#### Measuring Latency ####
1. It is time difference between action that user takes on  website (can be event like click of a button) & system response in reaction to event
2. Latency has two parts:
	1. Network latency
	2. Application latency
3. Example: Latency model:

	![latency_model](latency_model.jpeg)
	
#### Network Latency ####
1. It is the time the network takes for sending data packet from point A to point B
	1. Network should be efficient enough to handle increased traffic load on website
		1. Workaround strategy:
			1. To cut down network latency:
				1. Businesses use CDN & try to deploy servers across globe as close to end-user as possible

#### Application Latency ####
1. The amount of time, the application takes to process a user request
2. Ways to cut-down application latency:
	1. First step:
		1. Run stress test on application
		2. Run load test on application
		3. Scan for bottlenecks that slow down system as a whole

#### Why is Low Latency So Important for Online Services? ####
1. Impact of latency: It plays majore role in determining if online business wins or loses customer
	1. No one likes to wait for a response on a website
		1. If user gets response within stipulated time, then okay or else he bounces off to another site
			1. Market researches show this effect
		2. Use case: If money is involved, zero latency is what businesses want
			1. If that was possible
2. Example: Massive multiplayer games
	1. Slight lag in in-game event ruins whole experience
		1. Gamer with high latency internet connection will have slow response time despite having best reaction time of all players in arena
3. Example: Algorithmic trading
	1. Must process events within milliseconds
		1. Fintech companies have dedicated networks to run low latency trading
			1. Regular network wont cut it
4. [Huawei, Hibernia Atlantic laying fiber-optic link cables across Atlantic Ocean between London and New York](https://www.telegraph.co.uk/technology/news/8753784/The-300m-cable-that-will-save-traders-milliseconds.html)
	1. $300M was spent to save traders 6 milliseconds of latency

### Types of Scalability ###
1. Topics: Two types - Vertical and Horizontal
	1. What is Vertical Scaling?
	2. What is Horizontal Scaling?
	3. Cloud Elasticity
2. For application to scale:
	1. It needs solid computing power
		1. Solution: Servers should be powerful to handle increased loads
	2. Two ways to scale an application
		1. Vertical scaling
		2. Horizontal scaling

#### What is Vertical Scaling? ####
1. Adding more power to a server
	1. Ex: Increasing RAM from 16 Gigs to 32 Gigs
2. Scaling example:

	![vertical_scaling](vertical_scaling.jpeg)
	
3. Vertical scaling: It is called scaling up
	1. Power of hardware is increased
	2. Advantage: Simplest way to scale
		1. No code refactoring
		2. No complex configurations (horizontal scaling might need code refactoring)
	3. Disadvantage: Capacility limit on single server
		1. Example: Adding floors to a multi-floor building (we can add only to a certain point)
			1. One cannot scale building to the moon
			2. Solution: Building more buildings
				1. Horizontal scaling

#### What is Horizontal Scaling? ####
1. Aka Scaling out
	1. Adding more hardware to existing hardware resource pool
		1. Increases computational power of system as a whole
2. Horizontal scaling example:

	![horizontal_scaling](horizontal_scaling.jpeg)
	
3. Increased traffic influx can be dealt with increased computational capacity
	1. There is not limit on how much we can scale horizontally (assuming infinite resources)
		1. Servers and data-centers can be added indefinitely
	2. We can also dynamically scale in real-time as traffic on website increases & decreases over a period of time
		1. Vertical scaling requires pre-planning & stipulated time

#### Cloud Elasticity ####
1. Why cloud computing?
	1. It has the ability to scale up and down dynamically
	2. One has ability to pay only for resources required by app (economic reason)
2. If site has heavy traffic influx, more server nodes get added & when it doesn't, dynamically added nodes are removed
	1. Cloud elasticity - stretching and returning to original infrastructural computaional capacity
3. Multiple server nodes on backend helps with website staying alive online all the time (even if few server nodes crash)
	1. High availability

### Which Scalability Approach is Right For Your App? ###
1. Topics:
	1. Pros & Cons of Vertical & Horizontal Scaling
	2. What about the code? Why does the code need to change when it has to run on multiple machines?
	3. Why scalability Approach Is Right for Your App?

#### Pros & Cons of Vertical & Horizontal Scaling ####
1. Vertical scaling:
	1. Simpler than horizontal scaling
		1. No code changes
		2. No complex distributed system config
		3. Less administrative efforts
		4. Less monitoring
		5. Less management efferts
	2. Downside
		1. Availability risk
			1. Fewer powerful servers
				1. They may go down and may take down the entire website (doesn't happen for horizontal scaling - highly available)

#### What about the Code? Why does the code need to change when it has to run on multiple machines? ####
1. Code needs to be stateless in a distributed environment
	1. What is the meaning of this?
		1. Not static instances in class
			1. They hold application data
				1. If a server goes down, all static data is lost
					1. App will be in an inconsistent state
	2. Solution: Using persistent memory
		1. Key-value store (migrate state/static variable from class)
	3. Solution: Another solution is functional programming
		1. Functions don't retain any state
2. Estimating traffic: Have a ballpark figure in mind of how much traffic will it have to deal with?
3. Adoption of microservices architecture:
	1. Adopted early by certain teams
	2. Deployed on cloud
	3. Result: Workloads are distributed horizontally on the fly
4. Microservices architecture:

	![microservices_architecture](microservices_architecture.jpeg)
	
5. Advantages of horizontal scaling:
	1. No limit to augmenting hardware capacity
	2. Data is replicated across geographical regions
		1. How?
			1. Nodes & data centres are set up across the globe
6. Next: Cloud, serverless, microservices

#### Which Scalability Approach is Right for Your App? ####
1. If app is expected to receive minimal consistent traffic:
	1. Example: Utility, tool (internal say)
		1. Single server will suffice (for the traffic)
	2. Virtical scaling is okay if traffic is not expected to increase significantly
2. If app is public-facing social app (say)
	1. Fitness app
	2. Traffic is expected to spike exponentially in the near future
		1. High availability is important
		2. Horizontal scalability is important
3. Solution:
	1. Build application to deploy to cloud
	2. Keep horizontal scalability in mind from start

### Primary Bottlenecks that Hurt the Scalability of Our Application ###
1. Topics
	1. Database
	2. Application architecture
	3. Not Using Caching in the Application Wisely
	4. Inefficient Configuration & Setup of Load Balancers
	5. Adding Business Logic to the Database
	6. Not Picking the Right Database
	7. At the Code Level
2. Points in application that can become bottlenecks

#### Database ####
1. Consider a well architected application
	1. Workload runs on multiple nodes
	2. It has ability to horizontally scale
	3. But database is single monolith
		1. One server is given the onus of handling data requests from all server nodes of workload
			1. Bottleneck
	4. Server nodes handle millions of requests but response time of the requests & latency of application is very high due to single database (only so much it can handle)
2. Solution:
	1. Database needs to be scaled as well
		1. Wise use of data partitioning
		2. Sharding (?)
		3. Use multiple database servers

#### Application Architecture ####
1. Poor design can become a bottleneck
	1. Common mistake: all processes are scheduled sequentially
		1. Not using asynchronous processes
		2. Not using asynchronous modules
	2. **Solution: asynchronous processing**
		1. Example: If user uploads a dodument on portal
			1. Sending confirmation email
			2. Sending notification to all subscribers/listeners to the upload event should be done asynchronously
		2. **Forward the tasks to messaging server**
			1. Instead of doing sequentially & making user wait

#### Not Using Caching In the Application Wisely ####
1. Caching can be deployed in several layers of application
	1. It speeds up response time by notches
	2. It intercepts all requests going to database (reducing overall load on it)
2. Solution: Use caching exhaustively throughout application to speed up things significantly

#### Inefficient Configuration & Setup of Load Balancers ####
1. Using too many or too few load balancers impacts latency of the application

#### Adding Business Logic to the Database ####
1. Database is not a place to put business logic
	1. It makes application tightly coupled to database
	2. It puts unnecessary load on the database
2. Cons:
	1. Needs significant amount of refactoring when migrating to different database

#### Not Picking the Right Database ####
1. For transactions & strong consistency
	1. Relational database
2. For not so strong consistency (but need horizontal scalability on the fly)
	1. NoSQL database
3. Need suitable tech or else it has profound impact on latency of entire application negatively
	1. [Martin Fowler's talk on NoSQL](https://www.youtube.com/watch?v=qI_g07C_Q5I&t=1953s)

#### At the Code Level ####
1. Inefficient and badly written code has potential to take down entire service in production
	1. Using unnecessary loops or nested loops
	2. Writing tightly coupled code
	3. Not paying attention to the Big-O complexity while writing the code.
		1. May need firefighting in production
2. More details next

### How to Improve & Test the Scalability of Our Application? ###
1. Topics
	1. Tuning The Performance of the Application - Enabling It To Scale Better
		1. Profiling
		2. Caching
		3. CDN (Content Delivery Network)
		4. Data Compression
		5. Avoid Unnecessary Client Server Requests
	2. Testing the Scalability Of Our Application
2. Common & best strategies to fine tune performance of web application
	1. If application is performance optimized, it can withstand more traffic load with less resource consumption (as compared to application not optimized for performance)
3. Application's performance is directly proportional to it's scalability
	1. If application is not performant, it will not scale well
	2. Advantage of performance optimization:
		1. The best practices can be implemented even before real pre-production testing is done on application

#### Tuning The Performance Of The Application - Enabling It To Scale Better ####

##### Profiling #####
1. Profile the application in and out thoroughly
	1. Run application profiler
	2. Run code profiler
	3. Check which processes are taking too long
	4. Check which processes are eating up too much resources
	5. Find out the bottlenecks
	6. Eliminate them
2. Profiling:
	1. Dynamic analysis of code
	2. It enables to
		1. Measure space complexity of code
		2. Measure time complexity of code
		3. Figure out concurrency errors
		4. Figure out memory errors
		5. Figure out robustness
		6. Figure out safety of program
3. [https://en.wikipedia.org/wiki/List_of_performance_analysis_tools](https://en.wikipedia.org/wiki/List_of_performance_analysis_tools)

##### Caching #####
1. Cache wisely
2. Cache everywhere
3. Cache all static content  
4. Hit DB only when it is required
	1. Try to serve all read requests from cache
	2. Use **write through** cache

##### CDN (Content Delivery Network) #####
1. CDN further reduces latency of application
	1. How?
		1. Proximity of data to requesting user

##### Data Compression #####
1. Use apt compression algorithms to compress data
2. Store data in compressed form
3. Advantages:
	1. Compressed data consumes less bandwidth
		1. Download speed on client will be faster

##### Avoid Unnecessary Client Server Requests #####
1. Avoid unnecessary round trips between client & server
	1. Try to club multiple requests into one

#### Testing the Scalability Or Our Application ####
1. After basic performance testing of application
	1. Do capacity planning
		1. Provisioning of right amount of hardware & computing power
2. Testing application for scalability:
	1. Testing approach for scalability depends on system
		1. Testing can be performed at
			1. Hardware level
			2. Software level
3. Services & components need to be tested individually and collectively
4. What to consier while testing for scalability?
	1. CPU usage
	2. Network bandwidth consumption
	3. Throughput
	4. Number of requests processed within stipulated time
	5. Latency
	6. Memory usage of program
	7. End-user experience when system is under heavy load
	8. ...
5. In the testing phase, simulated traffic is routed to system to study
	1. How system behaves under heavy load
	2. How application scales under heavy load
	3. Contingencies are planned for unforeseen situations
		1. As per anticipated traffic, appropriate hardware & computational power is provisioned to handle traffic smoothly **with some buffer**
6. Load and Stress tests are run on the application
	1. JMeter can be used for
		1. Concurrent user test (If working on Java ecosystem)
	2. Cloud based testing tools are available to simulate tests scenarios (with few mouse clicks)
7. Businesses test systems for scalability to handle traffic surge
	1. Example: Sports website
		1. Prepares for sports event day
	2. Example: e-commerce website
		1. Gets ready for festival season
8. [How production engineers support global events on Facebook](https://engineering.fb.com/production-engineering/how-production-engineers-support-global-events-on-facebook/)
9. [How hotstrar a video streaming service scaled with 10 million concurrent users](https://www.8bitmen.com/how-hotstar-scaled-with-10-3-million-concurrent-users-an-architectural-insight/)
10. Tools popular in industry:
	1. Cadvisor (Container Advisor?)
	2. Prometheus
	3. Grafana (Web based dashboard)
11. Example: Dashboard monitoring architecture flow

	![dashboard_monitoring_architecture_flow](dashboard_monitoring_architecture_flow.jpeg)
	
12. [Pre-Production Monitoring](https://www.8bitmen.com/what-is-grafana-why-use-it-everything-you-should-know-about-it/)

### Scalability Quiz ###

## High Availability ##
### What is High Availability? ###
1. Topics
	1. What is High Availability?
	2. How Important Is High Availability To Online Services?
2. It is the norm today to have highly available computing infrastructure
	1. More with cloud
3. Cover frequently asked questions such as:
	1. What is it?
	2. Why is it so important to business?
	3. What is a highly available cluster?
	4. How do cloud platforms ensure high availability of the services running on them?
	5. What is fault tolerance & redundancy? How are they related to high availability?

#### What Is High Availability? ####
1. HA is the ability of the system to stay online despite having fialures at the infrastructural level in real-time
2. Sole mission of highly available systems:
	1. Stay online & stay connected
	2. Analogy: Backup generators to ensure continous power supply in case of power outages
3. Expressed as %:
	1. 99.99999% - the service will be up for the % of time
		1. Often used in SLA (Service Level Agreement) of cloud platforms

#### How Important Is High Availability To Online Services? ####
1. If social applications go down for a bit and bounce back, it might not impact business that much
2. If there is a mission critical system like the following, such systems cannot afford to go down at any time
	1. Aircraft systems
	2. Spacecrafts
	3. Mining machines
	4. Hospital servers
	5. Findance stock market systems
3. Smooth functioning of mission-critical systems relies on continual connectivity with their network/servers
	1. We might need super highly available infrastructures
4. Usually services do not want to go down (critical or not)
	1. Solution:
		1. Fault tolerance
		2. Redundancy
5. Elaboration next

### Reasons for Systems Failures ###
1. Topics
	1. Software Crashes
	2. Hardware Failures
	3. Human Errors
	4. Planned Downtime
2. Reasons for systems failure

#### Software Crashes ####
1. Applications crash (on mobile phones, desktops)
	1. Corrupt software files
	2. OS crashing
	3. Memory-hogging unresponsive processes
	4. Software running on cloud nodes crash unpredictably
		1. They may take down the entire node

#### Hardware Failures ####
1. Overloaded CPU
2. Overloaded RAM
3. Overloaded hard disk
4. Node goes down
5. Network outages

#### Human Errors ####
1. Biggest reason
	1. Flawed configurations
	2. ...
2. [This is an interesting read about Google's mistake in network config](https://thenextweb.com/google/2017/08/28/google-japan-internet-blackout/)

#### Planned Downtime ####
1. Routine maintenance operations
2. Patching of software
3. Hardware upgrades
4. ...

#### HA Systems Designed to Overcome the Failures ####
1. More details next

### Achieving High Availability - Fault Tolerence ###
1. Topics:
	1. What is Fault Tolerance?
	2. Designing a Highly Available Fault-Tolerant Service-Architecture
2. Fault Tolerance: An approach to achieve HA

#### What is Fault Tolerance? ####
1. Fault tolerance is the ability of the system to stay up despite taking hits
2. It is equiped to handle faults
3. It is an essential element in designing life-critical systems
4. A few of the instances/nodes of many go offline & bounce back all the time
	1. In case of internal failures, system could work at a reduced level but will not go down entirely
5. Social networking application:
	1. If a baclend node fails, few services of the app (image upload, post likes ...) may stop working but application as a whole will still be up
		1. This is technically **fail soft** 

#### Designing a Highly Available Fault-Tolerant Service - Architecture ####
1. HA at application level is achieved by breaking down the entire service architecturally into smaller loosely coupled services called **micro-services**
2. Example: Microservice architecture:

	![microservice_architecture](microservice_architecture.jpeg)
	
3. Advantages of breaking monolith into microservices:
	1. Easier management
	2. Easier development
	3. Ease of adding new features
	4. Ease of maintenance
	5. High availability
4. Each microservice takes the burden of running different features of application
	1. Image upload
	2. Comment
	3. Instant messaging
	4. ...
5. If few of the services go down, the application is still up

### Redundancy ###
1. Topics:
	1. Redundancy - Active-Passive HA Mode
	2. Getting Rid of Single Points of Failure
	3. Monitoring & Automation

#### Redundancy - Active-Passive HA Mode ####
1. Redundancy - Redundancy is duplicating the components or instances & keeping them on standby to take over in case the active instances go down. It's the fail-safe, backup mechanism
2. Example: High Availability - Redundancy

	![high_availability_redundancy](high_availability_redundancy.jpeg)
	
3. Active-passive HA mode:
	1. There are a few instances of nodes active and a few in standby
	2. The standby instances of nodes (redundant passive nodes) take over if any of the active instances go down (faiure)
4. Applications: Zero downtime is ensured by making the components redundant
	1. GPS
	2. Aircrafts
	3. Communication satellites

#### Getting Rid of Single Points of Failure ####
1. Distributed systems are popular because they get rid of single points of failure present in monolithic architecture
	1. Large number of distributed nodes work in conjunction with each other to achieve single synchronous application state
	2. Redundant nodes make sure there are no single points of failure in the system
		1. If a node goes down, redundant nodes take its place
			1. System as a whole remains un-impacted
2. Bottlenecks: Single points of failure at application level
	1. Detect bottlenecks in performance testing and get rid of them asap

#### Monitoring & Automation ####
1. Systems should be well monitored in real-time to detect bottlenecks or single points of failures
2. Self-healing:
	1. Automation gives instances the power to self-recover without human intervention
3. Systems can add or remove instances on the fly as per requirements
4. Automation cuts down failures which are mostly caused due to human errors

### Replication ###
1. Topics:
	1. Replication - Active-Active HA Mode
	2. Geographical Distribution of Workload

#### Replication - Active-Active HA Mode ####
1. Replication: Having a number of similar nodes running workload together
	1. No standby or passive instances
2. When a single or few nodes go down, remaining nodes bear the load of the service
	1. Load balancing is used
3. Example: High availability - replication

	![high_availability_replication](high_availability_replication.jpeg)
	
4. This is active-active high availability mode
	1. All components of system are active at any time

#### Geographical Distribution of Workload ####
1. Contingency for natural disasters
	1. Data centre regional power outages
	2. ...
2. Workloads are distributed across different data centres across the world in different geographical zones
	1. Advantages:
		1. Avoids single point of failure in context of data centre
		2. Reduces latency to a large extant because of proximity of data to user
3. Criticality of the system:
	1. High availability and fault-tolerant decisions are subject to
		1. How critical the system is?
		2. What are the odds that the components will fail?
		3. ...
4. Further availability:
	1. Multi-cloud platforms are used by businesses to deploy their workloads for further availability
		1. If one cloud provider goes south, another is a backkup

### High Availability Clustering ###
1. High availability cluster: Aka fail-over cluster
	1. It contains a set of nodes running in conjunction with each other that ensures high availability of service
2. Heartbeat network: Nodes in cluster are connected by private network called heartbeat network
	1. The network monitors each node and status of each node in cluster
	2. State management: Single state across all nodes in cluster is achieved with
		1. Shared distributed memory
		2. Distributed co-ordination service (*Zookeeper* say)
3. Example: Highly available cluster

	![highly_available_cluster](highly_available_cluster.jpeg)
	
4. Techniques for HA used by clusters
	1. Disk mirroring or RAID Redundant Array of Independent Disks
	2. Redundant network connections
		1. If primary network goes down, backup network takes over
	3. Redundant electrical power
	4. ...
5. Multiple HA clusters:
	1. Run in one geographical zone ensuring
		1. Minimum downtime 
		2. Continual service
6. Next chapter: Load balancing

### High Availability Quiz ###

## Load Balancing - ( - New - ) ##
### Introduction to Load Balancing ###
1. Topics
	1. What is Load Balancing?
	2. Performing Health Checks of The Servers With Load Balancers

#### What is Load Balancing? ####
1. Useful if
	1. Traffic load increases
	2. To stay highly available
2. Load balancers distribute heavy traffic load across servers running in cluster
	1. They use different algorithms
	2. Advantage:
		1. Averts risk of convergence of all traffic on service to single or few machines in cluster
		2. If traffic is converged only on few machines, it will overload them and cause
			1. Increase of latency of application
			2. Performance hit
			3. Failure of entire system
		3. Load balancing avoids the mess
3. Scenario 1: If node goes down when a request is processed
	1. Load balancer automatically routes future requests to other up and running servers in cluster
		1. Enabling service as a whole to stay available
4. Load balancer is single point of contact for all client requests
5. Example: Load balancer

	![load_balancer](load_balancer.jpeg)
	
6. Load balancers can be setup to efficiently manage traffic directed towards any component of the application
	1. Backend application server
	2. Database component
	3. Message queue
7. Purpose:
	1. To uniformly spread request load across machines in clusters powering the components
8. Example: Load balancing

	![load_balancing_at_different_components](load_balancing_at_different_components.jpeg)

#### Performing Health Checks of The Servers With Load Balancers ####
1. Load balancer should be aware of the running status of servers to route all user requests to running servers in cluster
	1. Load balancers perform halth checks of machines in cluster
		1. Load balancer usually maintains a list of machines that are up and running in cluster in real-time
			1. If a machine goes down, it is removed from the list
				1. Machines that are down are known as out of service instances
		2. User requests are forwarded to only the machines that are in service
2. Synomyms:
	1. Node
	2. Server
	3. Server Node
	4. Instance
	5. Machine
3. If **out-of-service** instance comes back online and becomes in-service
	1. Load balancer updates the list
	2. Starts routing future requests to that particular instance (all over again)
4. Next: DNS Domain Name System

### Understanding DNS - Part 1 ###
1. Topics:
	1. Domain Name System
	2. How Does Domain name System Work?
2. Every machine online is part of world wide web (www)
	1. It has unique IP address
		1. Enables it to be contacted by other machines on web using IP address
			1. IP: Internet protocol
				1. Protocol that facilitates delivery of data packets from one machine to other using IP addresses
				2. Example: 2001:db8:0:1234:0:567:8:1
					1. To fetch content from the server, user has to type in unique IP address of server in browser url tab
						1. This is not a viable option (in terms of our memory)
3. Solution: Domain names
	1. It is easier to work with

#### Domain Name System ####
1. DNS averts the need to remember long IP addresses to visit a website by mapping easy to remember domain names to IP addresses
2. Example: amazon.com
3. [Wikipedia resource for IP addresses](https://en.wikipedia.org/wiki/IP_address)

#### How Does Domain Name System Work? ####
1. **DNS querying:**
	1. When url is typed in browser and enter is hit, it is called **DNS querying**
2. Four key components (group of servers) that make up DNS infrastructure
	1. DNS Recursive Nameserver aka DNS Resolver
	2. Root Nameserver
	3. Top-Level Domain Nameserver
	4. Authoritative Nameserver
3. Domain name system:
	
	![domain_name_system](domain_name_system.jpeg)
	
3. Next:
	1. How does DNS query lookup process work
	2. Role of the servers in lookup process

### Understanding DNS - Part 2 ###
1. Topics:
	1. DNS query lookup process:
	2. Role of servers in DNS infrastructure
2. Steps:
	1. User types domain name in to browser and hits enter
	2. Browser sends request to DNS recursive nameserver (DNS resolver)
		1. DNS resolver: Receives client request and forwards it to Root nameserver to get address of Top-Level domain nameserver
	3. DNS Recursive nameserver (managed by ISP Internet Service Provider)
		1. DNS is a distributed system setup in large data centers managed by ISPs
			1. Data centers: contain clusters of servers optimized to process DNS queries in minimal time (milliseconds)
			2. Top level domain for `amazon.com` is `.com`
	4. DNS Resolver receives address of top-level domain nameserver
	5. DNS Resolver sends request to top-level domain nameserver (to fetch details of domain name)
		1. `.com` top-level domain nameserver will contain information on domains using `.com`
		2. `.edu` top-level domain nameserver will hold info on domains using `.edu`
		3. Example: 
			1. `amazon.com` - DNS resolver will route request to `.com` top-level domain name server
	6. Top-level domain name server returns IP address of `amazon.com` domain name server
	7. `amazon.com` domain name server is last server in DNS query lookup process
		1. It is called **Authoritative nameserver**
		2. This is owned by owner of domain name
	8. DNS Resolver fires query to authoritative nameserver & then rerutns IP address of `amazon.com`
	9. DNS Resolver caches data
	10. DNS Resolver forwards it to client
	11. Browser sends request to the IP address of `amazon.com`
3. Usually DNS info is cached and DNS servers don't have to do so much re-routing each time client requests IP of website
4. DNS info is also cached in local machines
	1. Browsing devices with TTL Time to Live
		1. Modern browsers do this automatically to cut down DNS query lookup time when revisting website
5. Example: DNS lookup process

	![dns_lookup_process](dns_lookup_process.jpeg)

### DNS Load Balancing ###
1. Topics:
	1. DNS Load Balancing
	2. Limitations of DNS Load Balancing

#### DNS Load Balancing ####
1. Authoritative server returns the IP address of domain
2. Problem: `amazon.com` needs more than single machine to run it's services
	1. The services are deployed across multiple data centers in different geographical locations across the globe
3. To spread user traffic across different clusters in different data centers
	1. Load balancing is used
		1. **It is setup at DNS level on authoritative server**
4. Example: Authoritative server DNS

	![authoritative_server_dns](authoritative_server_dns.jpeg)
	
5. It enables authoritative server to return different IP addresses of certain domain to clients
	1. Each time it receives a query for IP, it returns a list of IP addresses of a domain to client
	2. For each request, the authoritative serve changes order of IP addresses in the list in round-robin fashion
	3. As client receives list, it sends request to first IP address on the list to fetch the data from website
		1. Why list?
			1. To enable it to use other IPs in case first doesn't return response within stipulated time
	4. If another client sends request for IP to authoritative server,
		1. IP addresses are re-ordered and another IP is put on the top of the list following round-robin algorithm
6. When client hits IP, it may hit another load balancer (at data center that manages clusters)

#### Limitations of DNS Load Balancing ####
1. Doesn't take existing load on servers into account
2. Doesn't account for content
3. Doesn't account for request processing time
4. Doesn't account for in-service status
5. If machine is out of service and IP addresses are cached by client's machine and DNS resolver, request can be sent to the server
6. Advantages of DNS load balancing:
	1. Easy and less expensive way of setting up load balancing on service
7. [Round Robin DNS](https://en.wikipedia.org/wiki/Round-robin_DNS)

### Load Balancing Methods ###
1. Topics
	1. Hardware Load Balancers
	2. Software Load Balancers
	3. Algorithms/ Traffic Routing Approaches Leveraged By Load Balancers
		1. Round Robin & Weighted Round Robin
		2. Least Connections
		3. Random
		4. Hash
2. Three modes of load balancing
	1. DNS Load Balancing
	2. Hardware-based Load Balancing
	3. Software-based Load Balancing
3. Both hardware based and software based load balancing is common ways to balance traffic load on large scale services

#### Hardware Load Balancers ####
1. HLBs are highly performant physical hardware
	1. Located in front of application servers
	2. Load is distributed based on 
		1. Number of existing open connections to a server
		2. Compute utilization
		3. ...
2. Cons:
	1. Physical hardware is involved so we need maintenance and updates (just like any other server hardware)
	2. They are expensive to setup as compared to software load balancers
	3. Upkeep may require certain skillset
		1. IT team & network specialists
			1. Hard for developers to wrap their head around but needs vendor assistance
				1. Hence developers prefer software load balancers
	4. May need overprovisioning them to deal with peak traffic (not required for software load balancers)

#### Software Load Balancers ####
1. Pros:
	1. It can be installed on commodity hardware and VMs
	2. Cost-effective and offer more flexibility to developers
	3. Easy to upgrade and provision (as compared to hardware load balancers)
	4. LBaaS - Load Balancer as a Service (online)
		1. Can be directly plugged into application without setup
	5. More advanced as compared to DNS load balancing
		1. They consider many parameters to route traffic across servers
			1. Content that servers host
			2. Cookies
			3. HTTP headers
			4. CPU utilization
			5. Memory utilization
			6. Load on the network
		2. Continual health checks are performed on servers to keep updated list of in-service machines
2. Software load balancers are peferred over hardware load balancers because the latter need specialists to manage
3. [HAProxy](https://www.haproxy.com/): Software load balancer widely used by big guns in industry
	1. GitHub
	2. Reddit
	3. Instagram
	4. AWS
	5. Tumblr
	6. StackOverflow
	7. ...
4. Software load balancers use several algorithms to route traffic across machines
5. Next: Algorithms

#### Algorithms/ Traffic Routing Approaches Leveraged By Load Balancers ####
##### Round Robin & Weighted Round Robin #####
1. Round Robin Algorithm: Sends IP address of machines sequentially to clients
	1. The following are not taken into consideration:
		1. Load on servers
		2. CPU consumption
		3. ...
2. Weighted Round Robin:
	1. Weights are assigned based on server's compute & traffic handling capacity
	2. Traffic is then routed to them using Round Robin Algorithm
	3. Pros:
		1. Traffic is converged to machines that can handle higher traffic load
			1. Efficient use of resources
	4. Applications:
		1. Useful when service is deployed in different data centers having different compute capacities
			1. More traffic can be directed to larger data centers with more machines

##### Least Connections #####
1. Traffic is routed to machine that has least open connections of all machines in cluster
2. Two approaches:
	1. First approach: Assumes all requests will consume equal amount of server resources & traffic is routed to the machine having least open connections
		2. Cons:
			1. There is a possibility that machine with least open connections might be already processing requests demanding most of the CPU power (more traffic must not be routed to this machine)
	2. Second approach: 
		1. Takes the following into consideration
			1. CPU utilization
			2. Request processing time
		2. Criteria for routing is:
			1. Machines with
				1. Less request processing time
				2. Less CPU utilization
				3. Least open connections
3. Applications:
	1. For long opened connections
		1. Persistent connections
			1. Example: Gaming applications

##### Random #####
1. Traffic is randomly routed to servers
2. Load balancer may find similar servers in terms of the following and randomly route the traffic
	1. Existing load
	2. Request processing time
	3. ...

##### Hash #####
1. Source IP where request is coming from and request URL are hadhed to route traffic to the backend server
	1. Source IP ensures that request of client with certain IP will always be routed to same server
		1. Better user experience
			1. Server has already processed initial client requests and holds client's data in local memory
				1. No need to fetch client session data from session memory of cluster & process
					1. Reduces latency
		2. Enables client to re-establish connection with same server if connection drops
	2. URL hashing ensures that requests with the url always hits certain cache that already has data on it
		1. Ensures no cache miss
			1. Avoids duplicating data in every cache and thus efficient implementation of caching
2. Next: Monoliths and Microservices

### Load Balancing Quiz ###

## Monolith & Microservices ##
### What is a Monolithic Architecture? ###
1. Topics:
	1. What is a Monolithic Architecture?

#### What is a Monolithic Architecture? ####
1. Definition: Application has monolithic architecture if it contains the entire application code in a single codebase
2. Monolithic application:
	1. Self-contained
	2. Single tiered
3. Example: Monolithic architecture

	![monolithic_architecture](monolithic_architecture.jpeg)
	
4. All layers of app are in same code base (UI, business, data access)
5. Layers of web app:
	1. Controller
	2. Service Layer Interface
	3. Class Implementations of Interface
	4. Business Logic goes into Object Domain Model (a portion of it)
	5. Business Logic goes into Service (a portion of it)
	6. Business Logic goes into Business Layer (a portion of it)
	6. Business Logic goes into Repository/DAO Layer (a portion of it)
6. Example: Layers of Web Application

	![web_application_layers](web_application_layers.jpeg)
	
7. Advantages with monoliths:
	1. Simple to build
	2. Simple to test
	3. Simple to deploy
8. A strategy used by business
	1. Move forward with monolithic architecture
	2. Branch out to distributed microservices architecture later on
9. There are tradeoffs with the above approach and there is no standard solution
	1. Wise decision:
		1. Pick loosely coupled stateless microservices architecture right from start if it is expected to grow at quite a pace in the future
			1. Re-writing stuff is costly
				1. Stripping down things from tightly coupled architecture and re-writing stuff demands lot of resources and time
		2. But if requirements are simple, why bother writing microservices architecture?
			1. Running different modules in conjuction with each other isn't a cakewalk
10. Next: Pros and cons of monolithic architecture

### When Should You Pick a Monolithic Architecture? ###
1. Topics:
	1. Pros of Monolithic Architecture
		1. Simplicity
	2. Cons of Monolithic Architecture
		1. Continuous Deployment
		2. Regression Testing
		3. Single Points of Failure
		4. Scalability Issues
		5. Cannot Leverage Heterogeneous Technologies
		6. Not Cloud-Ready, Hold State
	3. When Should You Pick a Monolithic Architecture?

#### Pros of Monolithic Architecture ####
##### Simplicity #####
1. Monolithic applications are simple to develop, test, deploy, monitor and manage since everything resides in one repo
2. No complexity of 
	1. Handling different components
	2. Making them work in conjunction with each other
	3. Monitoring different components
	4. ...

#### Cons of Monolithic Architecture ####
##### Continuous Deployment #####
1. It is a pain
	1. Even minor code change in a layer needs re-deployment of entire application

##### Regression Testing #####
1. Once deployment is done, we need thorough regression testing of entire application (layers are tightly coupled with each other)
	1. Change in one layer may impact other layers significantly

##### Single Points of Failure #####
1. Monoliths have single point of failure
	1. If any layer has a bug, it can take down the entire application

##### Scalability Issues #####
1. Flexibility & scalability is an issue
	1. Change in one layer needs change and testing in all layers
		1. More tricky if code size changes

##### Cannot Leverage Heterogeneous Technologies #####
1. We cannot use heterogeneous technologies in single code base
	1. Compatibility issues
		1. Tricky to use Java and NodeJS in a single code base (may not even be possible)

##### Not Cloud-Ready, Hold State #####
1. Monolithic applications hold state in state variables hence not cloud ready
	1. Applications to be cloud native to work smoothly & be consistent on cloud must be:
		1. distributed
		2. stateless

##### When Should You Pick a Monolithic Architecture? #####
1. When requirements are pretty simple
2. App is expected to handle limited amount of traffic
	1. Example: Internal tax calculation app
	2. Use cases where business is certain that ther won't be exponential growth in user base and traffic over time
3. Dev teams could start with monolith and then scale out to distributed microservices architecture
	1. Helps team deal with complexity of application step by step as and when required:
		1. [This is exactly what LinkedIn did](https://engineering.linkedin.com/architecture/brief-history-scaling-linkedin)

### What is a Microservice Architecture? ###
1. Topics:
	1. What is a Microservices Architecture?

#### What is a Microservices Architecture? ####
1. Definition: In microservices architecture, different features/ tasks are split into separate respective modules/ codebases which work in conjunction with each other forming a large service as a whole
2. Advantages
	1. Principles:
		1. Single responsiblity principle
		2. Separation of concerns
	2. Easier and cleaner in the following aspects
		1. App maintenance
		2. Feature development
		3. Testing
		4. Deployment
	3. If project is large, it is expected to be managed by several different teams
		1. If modules are deparate, they can be assigned to respective teams with minimum fuss
			1. Smoothens the development process
3. Accommodating every feature in a single repo is complex
	1. Maintenance nightmare
4. Scalability:
	1. We need to scale out if we cannot scale up further
		1. Microservices architecture is inherently designed to scale
5. Example: Microservice architecture scalable

	![microservice_architecture_scalable](microservice_architecture_scalable.jpeg)
	
6. Every service has separate database
	1. No single point of failure
	2. No system bottlenecks
7. Next: Pros and cons of microservices architecture

### When Should You Pick A Microservices Architecture? ###
1. Topics:
	1. Pros of Microservice Architecture
		1. No Single Point of Failure
		2. Leverage the Heterogeneous Technologies
		3. Independent & Continuous Deployments
	2. Cons of Microservices Architecture
		1. Complexities in Management
		2. No Strong Consistency
	3. When Should You Pick a Microservices Architecture?

#### Pros of Microservice Architecture ####
##### No Single Points of Failure #####
1. Even if few of the services go down, the application as a whole is still up

##### Leverage the Heterogeneous Technologies #####
1. Each component interacts with the other via REST API Gateway interface
2. Each component can leverage polyglot persistence architecture
	1. Polyglot persistence:
		1. Using multiple database types like SQL, NoSQL etc...
3. Each component can use technologies such as Java, Python, Ruby, NodeJS ... together

##### Independent & Continuous Deployments #####
1. Deployment can be independent & continuous
2. A team can be dedicated for every microservice
3. Each microservice can be scaled without impacting other services

#### Cons of Microservices Architecture ####
##### Complexities in Management #####
1. Many nodes run together (distributed)
2. Managing and monitoring gets complex
	1. Additional components such as Apache Zookeeper, distributed tracing service are required for monitoring
3. More skilled resources are required
	1. May be a dedicated team

##### No Strong Consistency #####
1. Strong consistency is hard to guarantee in distributed environment
	1. Things are eventually conistent across nodes (distributed design causes this)

#### When Should You Pick a Microservices Architecture? ####
1. It is for complex use cases
2. It is for apps that expect traffic to increase exponentially in future
	1. Example: fancy social network application
		1. Components typically used:
			1. Messaging
			2. Real-time chat
			3. LIVE video streaming
			4. Image uploads
			5. Like
			6. Share
			7. ...
		2. Each component can be developed separately keeping
			1. Single Responsibility Priciple
			2. Separation of Concerns Principle
3. Three approaches:
	1. Picking a monolithic architecture
	2. Picking a microservice architecture
	3. Starting with monolithic architecture and later scale out into microservice architecture
4. Instructor's suggestion:
	1. Keeping things simple
	2. Understand requirements thoroughly
	3. Build something when you need it
	4. Keep evolving code iteratively

### Monolith & Microservices - Understanding the Trade-Offs - Part 1 ###
1. Topics:
	1. Fault Isolation
	2. Development Team Autonomy
	3. Segment - From Monolith to Microservices and Back Again to Monolith
2. This lesson:
	1. Trade-offs involved when choosing between monolith and microservices architecture

#### Fault Isolation ####
1. Microservices architecture makes it easy for us to isolate faults and debug them
	1. If glitch occurs in a service, we can fix the issue in that service without need to scan entire codebase in order to locate and fix that issue
		1. This is known as fault isolation
	2. If service goes down due to the fault, other services are up and running
		1. This is minimal impact on the system

#### Development Team Autonomy ####
1. If monolith:
	1. If number of developers and teams working on single codebase grows beyond certain number
		1. It may impede productivity and velocity of teams
	2. As size of codebase increases, compile-time & time required to run the tests increases
		1. Entire codebase has to be compiled as opposed to compiling module we work on (really?)
	3. If code changes are made by another team
		1. It may have direct impact on features we develop
		2. It may break the functionality of our feature
	4. Thorough regression testing is required every time anyone pushes new code or update to production
	5. As code is pushed to production, we need all teams to stop working on codebase until change is pushed to production (really?)
	6. Code pushed by certain team may require approval from other teams in organization working on same codebase (bottleneck)
2. If microservices:
	1. Separate teams have 
		1. Complete ownership of codebases
		2. Development and deployment autonomy over their modules with separate deployment pipelines
	2. Code management is easier (really?)
	3. It is easier to scale individual services based on traffic load patterns (agree)
3. If we need to move fast
	1. Lauch a lot of featurs quick to market and scale
		1. Microservices is a good bet
4. Cons:
	1. Increase in complexity of architecture
	2. Needs the following:
		1. Distributed logging
		2. Monitoring
		3. Inter-Service Communication
		4. Service Discovery
		5. Alerts
		6. Tracing
		7. Build & release pipelines
		8. Health checks
		9. ...
		10. May also need custom tooling from scratch
5. There are tradeoffs involved (no perfect or best solution)
	1. We need to be crystal on our use case and decide what architecture suits our needs the best

#### Segment - From Monolith to Microservices and Back Again to Monolith ####
1. [Segment](https://segment.com/)
	1. First started with monolith and then split it into microservices
	2. Later reverted to monolith architecture
2. Why?
	1. Microservices:
		1. For fault isolation - minimized damage cause by system
			1. Since fault is usually confined to (not necessarily) one service (as opposed to entire system and bringing it down)
		2. Easy debugging of issues
		3. A glitch in monolith has the potential to impact the entire system
		4. A separate microservice was constructed for every data provider
			1. Increase in number of microservices led to increase in complexity of architecture significantly (taking a toll on productivity)
			2. Defects with regards to microservices increased significantly
				1. Resources were dedicated to handle microservices related issues
					1. Operational overhead - slowed down the organization
	2. Monolith:
		1. To overcome above issues, team moved to monolith
			1. They gave up fault isolation etc...
		2. The monolith is called Centrifuge

### Monolith & Microservices - Understanding the Trade-Offs - Part 2 ###
1. Topics:
	1. Segment High-Level Architecture
	2. Istio - The Move From Microservices to a Monolith

#### Segment High-Level Architecture ####
1. Data infrastructure ingests hundreds of thousands of events every second
	1. Events are directed to APIs & Webhooks via message queue
		1. APIs are server side destinations (there are over a 100 of them)
	2. Initial stage:
		1. API injested events from different sources to distributed message queue
		2. Queue moved event payload to different destination APIs
2. Example: Event distribution monolith architecture:

	![event_distribution_monolith_architecture](event_distribution_monolith_architecture.jpeg)
	
3. Note: Message queue, webhook, data injestion are discussed later
4. If events are moved to a single queue, some events failed to deliver to destinations and were retried by queue after stipulated time intervals
	1. Enables queue to contain both new and failed events - waiting to be retried
		1. This flooded the queue which caused delays of delivery of events to destinations
			1. Solution: Engineering team at Segment split monolith into microservices and constructed a separate microservice for every destination
				1. Each service contained its own queue
				2. Enabled scaling of system
5. Example: Segment microservices architecture

	![segment_microservices_architecture](segment_microservices_architecture.jpeg)
	
6. If certain queues got flooded, it did not impact the event delivery of other services
7. When business gained traction, additional destinations were added
	1. Each destination had separate microservice and queue
		1. Increased the complexity of the architecture
8. Separate services had seperate event throughput & traffic load patterns
	1. Single scale policy couldn't be applied on all queues
	2. Every service and queue needed to be scaled differently based on traffic load pattern
		1. Had to be done manually
9. Auto-scaling:
	1. Was implemented in infrastructure
	2. Every service had distinct CPU & memory requirements
		1. This needed manual tuning of the insfrastructure
			1. Means more queues needed more resources for maintenance
	3. Solution:
		1. Segment reverted to monolith calling infrastructure as centrifuge
			1. Combined all individual queues for different destinations into single monolith service
10. Centrifuge architecture: [Goodbye Microservices: From 100s of Problem Children to 1 Superstar](https://segment.com/blog/goodbye-microservices/)	
	1. [Centrifuge: A Reliable System For Delivering Billions of Events Per Day](https://segment.com/blog/introducing-centrifuge/)

#### Istio - The Move From Microservices to a Monolith ####
1. [Istio](https://istio.io/)
	1. Open source service mesh:
	2. It enables to connect secure, control and observe microservices
	3. It enables us to control over how microservices share data with each other
2. It transitioned form microservices to monolith architecture
3. [Istio is An Example of When Not to Do Microservices](https://blog.christianposta.com/microservices/istio-as-an-example-of-when-not-to-do-microservices/)
4. [Microservices - Are They Still Worth It?](https://www.youtube.com/watch?v=sZd4xTQlrIE&t=44s)

### Monolith & Microservices Quiz ###

## Micro Frontends (- New -) ##
### Introduction to Micro Frontends ###
1. Topics:
	1. What are Micro Frontends?
	2. Micro Frontends E-Commerce Application Example

#### What are Micro Frontends? ####
1. Micro frontends: Separate loosely coupled components of UI
	1. Deployed using principles of microservices on front end
	2. It is more of architectural design decision & development appraoch (it is not a technology)
		1. What does it mean?
			1. Microservices provide complete autonomy to teams deploying them
			2. They are loosely coupled
			3. They provide fault isolation
			4. It offers freedom to pick the technology stack to individual teams to develop certain service
	5. Micro frontends has same upsides to front-end development
		1. Generally despite having a microservice architecture on the backend, front end is monolith (developed by dedicated front-end team)
2. Example: Monolithic Frontend

	![monolithic_frontend](monolithic_frontend.jpeg)
	
3. Micro frontends:
	1. The application (UI) is split into vertical slices
		1. Single slice goes from UI to database
			1. Each slice is owned by a dedicated team
				1. front-end devs of each slice develop UI component only of that service
				2. Team chooses their desired technology
	2. All the components then are integrated together to form complete UI of application
4. Example: Team with microfrontends

	![team_with_microfrontends](team_with_microfrontends.jpeg)

#### Micro Frontends E-Commerce Application Example ####
1. E-Commerce: Micro frontends is popular with E-Commerce websites
	1. Online game store:
		1. Delivers DVDs of all kinds of video games for desktops and consoles
			1. Xbox, Nintendo Switch, Play Station, ...
	2. Gamestore may have many different UI components
		1. **Search component**: search bar on top centre of website that enables users to search games based on keywords
			1. If user runs a search, component enables user to filter search results based on several options
				1. price range
				2. type of console
				3. game genre
				4. ...
		2. **Game Category Component**: Component displays popular and widely searched games of different categories on home page of website
		3. **Add to Cart & Checkout Component**: The UI component enables users to add games of their liking to cart and proceed with checkout filling in address & other required info to make final payment
			1. During checkout, website may recommend related games to user as upsells
			2. Use can also apply coupons & gift cards if he has any
		4. **Payment Component**: Payment UI component offers different payment options to user & facilitates order payment once user enters his card details on page
2. Every UI component has dedicated microservice running on backend powering particular UI component
	1. Each component is managed by dedicated full-stack teams
3. Complete UI of app is rendered combining different individual UI components called Mirco Frontends

### The Need for Micro Frontends ###
1. Topics:
	1. Easier Co-ordination with the Front End Devs
	2. Leveraging the Right Technology
2. How to divide:
	1. Each team may own a dedicated page in applcation (checkout page say)
	2. Each team may own components that fit in certain page (game category component on home page)
	3. Each team can own a combination of dedicated page and/or smaller UI component(s) of another page
	4. Fragments: Smaller components that integrate into a page
3. Example: UI fragment integration

	![ui_fragment_integration](ui_fragment_integration.jpeg)
	
4. Why split monolith UI?

#### Easier Co-ordination With the Front End Devs ####
1. Averts need for dedicated front-end team
2. Front-end devs work along with backend devs in same team
	1. Saves time spent in cross-team coordination between backend microservices and front-end teams
3. Communication is quick and not so formal (how?)
4. Improves team's productivity
5. Enables them to deliver better UX (more effective coordination between backend and frontend devs)

#### Leveraging the Right Technology ####
1. Micro frontends are loosely coupled
	1. They can be developed leveraging different technologies
		1. Single UI technology does not have to be used to build entire front-end
			1. Multiple technologies exist for front-ends + JavaScript frameworks
				1. There are use cases where:
					1. Plain JavaScript, HTML, CSS suffice
					2. Advanced frameworks like React, Angular & Vue are required for certain features
			2. If multiple teams are using the same technology, they can work on different versions of the technology
				1. Libraries can be upgraded independently without impacting other UI components
2. Example: Website UI built as Micro Frontends

	![website_ui_built_as_micro_frontends](website_ui_built_as_micro_frontends.jpeg)
	
3. Use cases:
	1. Micro frontends are good for medium to large websites (not so useful for simple use cases)
		1. Multiple technologies bring architectural & maintenance complexities with them
			1. Additional logic may be required to bring the components together
		2. There could be compatibility issues
		3. There could be performance issues
4. [Engineering Culture at Spotify](https://labs.spotify.com/2014/03/27/spotify-engineering-culture-part-1/)
5. Next: How micro frontends are integrated with each other

### Micro Frontends Integration ###
1. Topics:
	1. Client-Side Integration of Micro Frontends
	2. Server-Side Integration
	3. Technology & Frameworks Facilitating Server Side Integration
2. Once we have micro-frontends for online game store, we need to integrate them together to have functional website
	1. Two ways we can do this:
		1. By integrating micro frontends on the client
		2. By integrating micro frontends on the server
3. Similar to client side and server side rendering
	1. Additional logic is required for integration of UI components
4. Next: client side integration process

#### Client-Side Integration of Micro Frontends ####
1. One naive way to integrate (according to trainer): Micro-frontends with unique links
	1. Links are placed on website to navigate to certain micro-frontend
2. Example: Link Integration

	![link_integration_of_micro_frontends](link_integration_of_micro_frontends.jpeg)
	
3. Checkout microservice: hosted on AWS (say) with link https://www.aws.amazon.com/onlinegamestore/checkout
4. Payment service: hosted on Google Cloud with link https://www.cloud.google.com/onlinegamestore/payment
5. If navigation takes place from checkout page to payment page, address in browser changes from AWS URL to Google Cloud URL visible to end-user
	1. Iframes can be used to integrate within a specific page
6. Cons: 90s way of building websites (connecting web-pages using links and iframes)
	1. [Google reasons why not to use iframes in page content](https://stackoverflow.com/questions/23178505/good-reasons-why-not-to-use-iframes-in-page-content)
7. Micro-services frontends integration using iframes:

	![micro_frontends_integration_using_iframes](micro_frontends_integration_using_iframes.jpeg)
	
8. Other modern ways: (recommended by trainer)
	1. Client-side: Web components, [Single SPA](https://single-spa.js.org/)
		1. Mozilla docs:
			1. Web components is a suite of different technologies allowing you to construct re-usable custom elements - with their functionality encapsulated away from the rest of your code - and utilize them in your web apps
				1. [Web Components: The Secret Ingredient Helping Power The Web](https://www.youtube.com/watch?v=YBwgkr_Sbx0)
	2. Single SPA: JavaScript framework for frontend microservices that enables developers to build their frontend leveraging different JavaScript frameworks
		1. [Introduction to Single SPA](https://www.youtube.com/watch?v=L4jqow7NTVg)
		2. [Canopy Tax](https://www.getcanopy.com/) - cloud-based accounting software for working professionals
			1. It leverages Single SPA framework to build micro frontends
		3. [A Step by Step Guide to Single Spa by Canopy](https://medium.com/canopy-tax/a-step-by-step-guide-to-single-spa-abbbcb1bedc6)
9. Next: Server Side Integration

#### Server-Side Integration ####
1. Complete pre-built page of website is delivered to client from server (instead of sending individual micro-frontends to client and then having them clubbed there)
	1. Cuts down loading time of website on client significantly
		1. Browser does not have to do any heavy lifting
	2. Needs separate logic on server to integrate micro-frontends

#### Technology & Frameworks Facilitating Server Side Integration ####
1. [Zalando](https://www.zalando.com/) - fashion e-commerce company in Europse that uses [Project Mosaic](https://www.mosaic9.org/)
	1. [Zalando Recipe for Scalable Frontends](https://www.youtube.com/watch?v=m32EdvitXy4&feature=youtu.be)
2. [Open Components](https://opencomponents.github.io/)
	1. Open source micro frontends framework used for integrating micro frontends on server
3. [Open Table](https://www.opentable.com/) - San Francisco based online restaurant reservation company
	1. It uses Open Components Framework to manage micro frontends
	2. [Here is a talk on YouTube](https://www.youtube.com/watch?v=M4OXXRdCpyQ) - on their approach
4. [Server Side Includes SSI](https://en.wikipedia.org/wiki/Server_Side_Includes) - server-side scripting language used for clubbing content of multiple web pages on webserver

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