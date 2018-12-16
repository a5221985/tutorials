# REST API Design, Development & Management #

## Setting the stage ##
### Introduction to the Author and the Course ###
1. IBM Cloud Champion
2. Case Study: Acme Travels
3. Tools used
4. 5 sections
	1. REST API Concepts
		1. Evolution of REST/JSON API
		2. RESTful Architectural constraints
		3. Richardson Maturity Model
			1. Simple and powerful concepts
	2. Designing REST API
		1. Resources, Associations, URI
		2. CRUD, Error handling, Caching
		3. Change mangement, versioning
		4. Partial responses, Pagination
		5. Examples: facebook, Linkedin
			1. How did they design
	3. Security of the API
		1. Basic Authentication, JWT (benefits)
		2. API Key/Secret, OAuth2.0
			1. Spotify
		3. Functional attacks
			1. Hackers look for vunerabilities
			2. Common type of attacks and how to protect
				1. SQL injection attack
	4. Contract First: Swagger
		1. Collaborative specs development
		2. Swagger 2.0/OAI Specs
			1. Popular
			2. How to write Swagger spec using yaml
		3. Tools, Benefits (contract first)
		4. Apigee, IBM API connect, MuleSoft support Swagger spec
	5. API Management
		1. API Management: Scope, Infra.
			1. Proxy
			2. Gateway based
		2. Policies: Security, Traffic ...
		3. Dev Portal, Monetization
			1. Build or buy dev portal
			2. Monetization: build APIs that can be monetized
				1. Selling APIs
		4. Apigee, IBM API connect, MuleSoft

### Summary decks download link for the course ###
1. [http://acloudfan.com/download-files](http://acloudfan.com/download-files)
2. [Link for download](http://acloudfan.com/download-files)

### ACME Travels - Case study ###
1. Case study: ACME Travels
	1. Business problem
		1. Almost all business over phone
		2. They have website built in 2000
		3. They released mobile app last year
			1. Bad reviews
			2. ACME is losing business to competition
			3. Competition is taking away customers with cool apps
			4. Competition is stealing ACME partners with affiliation deals
		4. ACME's CTO's vision
			1. A fully automated vacation ecosystem driven by ACME APIs
	2. Current architecture
		1. Browser based app
			1. HTTP/XML
		2. Mobile app
			1. HTTP/JSON
		3. Backend: PHP, Tomcat
			1. Web backend
			2. Mobile backend (no sharing)
			3. Data in MySQL db
		4. Sells vacation packages through partner agents
			1. Connect with ACME
				1. Email is sent to person at ACME who gets the data into the system
				2. FAX, Phone message is sent to person at ACME, ...
			2. SOAP/XML service was exposed to agents
				1. Not worked well
				2. Too complex to integrate the services into their systems
	3. Target architecture
		1. Data managed in MySQL and MongoDB
			1. Vacation data in MongoDB
			2. Transactions data in MySQL
		2. API layer for MySQL and MongoDB
		3. API Management is used on top of API layer
		4. Websites and mobile apps will use the common set of APIs
		5. Agents get another application which use the same API
			1. Agents can also integrate their system with the APIs
		6. Partners can connect to the ACME through APIs
			1. When Partner ecosystem expands, it would be easy to do business with ACME

### Tools for Design, Development, Testing and Management or REST API ###
1. Tools and Platforms (not a pre-requisites)
	1. Will be explained as we go
2. Languages
	1. NodesJS
		1. Simple
		2. Has many packages
		3. Frameworks
			1. Express (used)
			2. Hapi
			3. Restify
			4. StrongLoop
	2. Java
	3. php
	4. Go
	5. python
2. Tools
	1. Visual Studio Code (free version of visual studio)
	2. Testing tools
		1. Postman (used)
		2. SoapUI
		3. REST
	3. Mongolab (https://mlab.com) - online
	4. Swagger
		1. npm swagger command-line
		2. npm swagger editor
			1. http://editor.swagger.io
				1. Local editor
	5. API Management
		1. IBM API Connect (used)
		2. MuleSoft (used)
		3. Akana
		4. Apigee (used)
		5. Mashery
		6. WSO2
		7. 3SCALE

### Crash Course on MongoLabs ###
1. Open mlab.com
	1. Sandbox environment is free
	2. Sign up
	3. Login
	4. Create New (databas)
		1. Select Sandbox
		2. Unique db name
	5. Open new db
		1. Add collection
			1. test
	6. Add data
		1. Click on collection
		2. Add documents to it
2. Good tool for querying MongoDB

## Evolution of RESTful Services ##
### What is an API ###
1. Objectives
	1. Ability to explain what an API is
2. Case:
	1. IMDb
		1. Internet movie database - launched website to get info about movies
		2. Browser connects to IMDb server which connects to Database
	2. Today:
		1. Services can connect with other services (partners)
3. Example: Online DVD store
	1. Web server connects to backend
	2. Consider expanding to show movies
		1. Option: One more db with movies
		2. Option: Connect to IMDb (but only sends HTML)
			1. Lot more info than required
			2. Parse the HTML (screen scraping) and show only what we need
				1. Used in 2000
	3. Consider connecting to tracking like FedEx website
		1. Returns HTML
		2. Do screen scraping
	4. Problem:
		1. Dependency on HTMLs (because parsing logic is built for that)
			1. If IMDb changes the look and feel, it will break the scraping logic
				1. This may change frequently
	5. Solutions:
		1. One URL for browsers
		2. One URL for applications
			1. XML is served (HTML can change independently)
4. API:
	1. A user interface to data and systems that is consumed by applications rather than humans
	2. A well defined contract between provider and consumer
		1. XML exposed
			1. Contract = structure of request and response XML

### Evolution of REST/JSON API ###
1. Why JSON and REST?
	1. XML RPC - for Remote procedure call
	2. XML SOAP - Simple Object Access Protocol
		1. XML based standard
			1. Defines structure of messages exchanged
			2. Defines security, transactions + other standards
	3. XML worked well until mobile technology developed
		1. Developers complained
			1. XML is heavy in terms of network traffic (3G and 4G may not support)
			2. Parsing of XML is CPU & Memory intensive
			3. Slow performance of XML parsing on browser front end not desired
				1. Code is also complex
			4. Mobile devices battery performance reduced due to XML
				1. High network traffic
				2. Low performance
				3. Complex logic
			5. Standards & versions of standards caused confusion and complexity
				1. SPAs and Mobile apps
		2. Something else is needed
			1. JSON - JavaScript Object Notation
				1. http://json.org
				2. 2005 - 2006 popularity
2. REST - Representational State Transfer
	1. REST Architectural Principles
	2. Companies using it:
		1. Google
		2. facebook
		3. twitter
		4. FedEx
		5. BBC
		6. Walmart
		7. Tesla
		8. Uber
	2. They use APIs internally and expose them
		1. XML/JSON and REST
	3. Companies expose Developer Portal for using their APIs
		1. Walmart - Developer console
		2. Twitter - API
		3. BBC - API - Developer APIs
	4. API keys may be required

### Introduction to RESTful API ###
1. Resources, State & REST API
2. Learning objectives
	1. Resource & Representational state
	2. Describe a REST API (at a high level)
3. Resources
	1. In real world:
		1. Car has following attributes
			1. Make - BMW
			2. Year - 2015
			3. VIN - 12345
			4. ...
			5. Owner - ???
		2. Attributes are generally managed in the database
			1. For state changes
				1. Owner changed from Vince to Kathy
			2. Representational state of a resource is usually stored in the database
		3. When a client sends a request to, API returns a representational state of the resource
4. Formats of representational state
	1. Row from database
		1. Can be converted to HTML
		2. Can be covnverted to XML
		3. Can be converted to PDF
		4. Can be converted to JSON
	2. Representational state from backend is converted to representational state of front-end
5. REST API
	1. Walmart
		1. Register
		2. Get API key
		3. Developer console
	2. API is RESTful if it is:
		1. Built using RESTful architectural style
		2. Follows a set of principles
	3. Format:
		1. URL + Parameters + Verb=GET,POST,PUT,DELETE,HEAD,TRACE,OPTIONS
			1. Browser usually uses GET,POST
		2. Data
			1. Header
				1. Response code - 200, 400 Not found, 500 server error
			2. Response
	4. HTTP is only recommended for REST API but is not mandatory
	5. REST is not a standard but an architectural style and guidelines

### Quiz 1: API 101 ###
### Private, Public and Partner API ###
1. Types of API
2. Differences between them
3. REST API Consumer
	1. Private/Internal consumer - inside organization
		1. Private API is developed
	2. Public/External consumer - outside organization
		1. Public API is developed
	3. Partner - trusted relationship with organization building and exposing APIs
		1. Partner API is developed
4. Aspects different
	1. Private APIs are consumed by internal apps developed and owned by internal developers
		1. Internally developed
		2. External apps owned by internal resources
	2. Public APIs
		1. Public developers are public and untrusted who develop untrusted Apps to consume the APIs
	3. Partner APIs
		1. Organization exposes APIs to trusted partners
		2. Partner can own external apps as well which must be able to connect
5. There is no difference in the code but only how we manage the APIs
	1. API security
		1. Private
			1. API consumers are known
			2. No strict security
				1. Basic Auth (feasible, usable)
				2. Proprietary schemes
		2. Public
			1. Cannot trust
			2. Strict
				1. Key/Secret (preferred for all)
				2. OAuth
	2. Access request
		1. Private:
			1. Ad-hoc process
				1. email
				2. Internal ticketing/process
		2. Public:
			1. Developer portal (access request) - suggested for all
				1. Automated/manual (request)
	3. Documentation
		1. Private, Partner
			1. Controlled Environment
				1. Internal websites
				2. PDF (SOA)
		2. Public:
			1. Uncontrolled
				1. Developer portal (recommended for all)
	4. SLA management
		1. Service Level Agreement
			1. Example:
				1. Up time: 99.99%
				2. Throughput: 20 calls/second
				3. Support: Email
		2. Multiple SLAs can be defined
			1. Define SLA tiers
				1. Internal developers - unlimited rate access
				2. Public - 20 calls/second
		3. Runtime Management
			1. Public
				1. Internal monitoring must be done to ensure key performance aspects are being met and SLA is met
6. API provider as a good practice must always define and manage SLA for all APIs

## REST API Architectural Constraints ##
### Introduction to REST Architecture Constraints ###
1. Learning objectives
	1. What is "REST architectural constraint"?
	2. Richardson maturity model
		1. Guage current architecture in terms of compliance with RESTful architecture
2. REST like or REST ish
3. What makes architecture RESTful?
	1. Developer must follow 6 design rules - architectural constraints
		1. Client-Server architectural principles must be followed
		2. Uniform Interface - well defined contract between client and server
		3. Statelessness - server must not manage the state of the application
		4. Caching - server manages caching of responses by the way of headers
		5. Layered system - Architecture must have multiple layers and each layer should be manageable independently
		6. Code on demand (optional) - server must not only send data but also some code for developer to execute
	2. First 5 will qualify as RESTful architecture
4. How do I know if my current Architecture is RESTful?
	1. Richardson maturity model - assigned score between 0 & 3
		1. Level 0: The Swamp of POX
		2. Level 1: Resources
		3. Level 2: HTTP verbs
		4. Level 3: Hypermedia Controls
		5. Glory of REST

### REST API Architectural Constraint - Client Server ###
1. Client-Server separation of concerns
	1. Learning objectives
		1. How separation of concerns is achieved by client and server
		2. Explaining benefits of client server approach
2. Separation of concerns
	1. Server concerns
		1. Performance
		2. Scaling
		3. Authentication and Authorization
		4. Data cache
		5. Data security
		6. Database (where to manage data? database, filesystem, ...)
		7. ...
	2. Client concerns
		1. User experience to customer
		2. User interface
		3. Multi form factor support (how many devices that it supports)
3. Client and server do not reside in same process
4. Server is decoupled from client
	1. client or server can evolve independently
5. As long as contract is untouched - the client & server can evolve and change independently of each other

### REST API Architectural Constraint - Uniform Interface ###
1. Learning Objectives
	1. Describe uniform interface constraint
	2. Know the 4 guiding principles under the constraint
2. Statement: Client and Server share a common technical interface
	1. Interface = contract for communication between client-server
		1. Technical? contract has no business context
		2. Contract defined using HTTP methods & media types
			1. Decouples server and client
3. Four guiding principles
	1. Identity of the resource (URI/URL)
		1. HTTP/1.1 GET http://api.acmetravel.com/Vacations
		2. HTTP/1.1 GET http://api.acmetravel.com/Vacations/21/Reviews
	2. Representation of the resource
		1. Data is represented in some form on the server side
			1. XML, JSON, TXT: Client may receive data in a different format as compared to the server side representation
	3. Self descriptive messages - metadata
		1. Requests and responses have enough metadata on each end (server and client) to process the info
		2. Metadata is transferred in HTTP headers
			1. `Content-Type`
			2. HTTP Status Code
			3. `Host` - which host is sending the request/response
			4. `Accept`
	4. Hypermedia:
		1. Response = Data + Actions
			1. Actions: Server sends possible actions that client can take on the response data
			2. HATEOAS: Hypermedia As The Engine Of Application State
				1. What is this?
4. Summary:
	1. Uniform interface constraint: Communication contract
		1. Resource Identiy = URI/URL
		2. Resource Representation
		3. Self describing messages (metadata)
		4. Hypermedia/HATEOAS
			1. Also has links to actions that client can execute

### REST API Architectural Constraint - Statelessness ###
1. Learning Objectives
	1. Applying Statelessness constraint (What is it?)
		1. Used when designing REST API
2. Mid - Tier: Tomcat (say)
	1. Manages Session (client session management)
		1. REST API: This is not acceptable
	2. Each client request must be independent of any client request made previously
	3. Server receives all info it needs in the request
		1. Does not save any information of previous requests
			1. State is managed within the client
3. Summary:
	1. No state management in mid tier/server for REST API
	2. All calls from client are independent
	3. Client sends all the information in request that the server will need to process the request (no session management on server side)

### REST API Architectural Constraint - Caching ###
1. Learning Objectives:
	1. Caching architectural constraint
	2. HTTP cache control headers
2. How caching is implemented on typical web app
	1. Local cache - Browser
	2. Shared Cache - Gateway manages this
	3. Shared Cache on Server side (software based on hardware based)
3. Objectives of caching:
	1. Boost performance
	2. Make system more scalable
	3. Enhance user experience (UX)
4. Disadvantages of Statelessness
	1. Negative impact on performance
	2. Chattiness - More calls coming from client to server
	3. Higher data traffic (impacts scalability) - all information must be sent by client
5. Caching counters some of the above
	1. Higher Performance
	2. Higher Scalability
	3. Reduce Chattiness
6. Constraint states that:
	1. Response messages from service to its consumers must be explicitly labeled as cacheable or non-cacheable
	2. Caching is controlled by server by way of HTTP headers
		1. Cache-Control: allows server to define policy for the cache
			1. Who, How long, Under what conditions
				1. Who can cache the data
				2. How long data can be cached
				3. Under what condition data can be cached
			2. Example: private;max-age=60
				1. Only by client
				2. Maximum age of cached data is 60 seconds (after this client has to send fresh request)
		2. Expires: Tells when the resource of data that is cached will get expired
		3. Last-Modified: Tells when the resource that is cached was last changed
		4. ETag: Unique identifier associated with a response
			1. For example: id = 1, id = 2 (for vacation packages)
7. Summary:
	1. Caching counterbalances the statelessness
	2. Caching may occur on server, client or mid tier (intermediaries)
		1. App server
		2. Network appliance
		3. Client
	3. Server provides caching directives
		1. Using HTTP headers

### REST API Architectural Constraint - Layered System ###
1. Learning objectives
	1. Layered system architecture
	2. Benefits of layered system architecture approach
2. Layered System Constraint: Client-Server architecture consists of multiple layers
	1. No one layer can see past the next
		1. Gateway does not know about database
		2. Client knows only about Gateway and not about App server
	2. Layers may be added, removed or modified based on needs
		1. Suppose there is more traffic load
			1. A load balancer can be added between gateway and app server
			2. More app server instances can be added (client does not have to change)
	3. Restriction:
		1. Client should never connect directly to app server
			1. Client must not be responsible for distribution of load
				1. Instead load balancer must take care of that
3. Benefits of layered architecture
	1. Layering simplifies the architecture - hides the complexity of various layers
		1. Client doesn't have to know about the app-server layer (gateway can be used)
		2. Architecture may evolve with the changing needs (layers must be able to evolve independently)
		3. Client does not need to worry about request distribution
			1. Load balancer layer must take care of this
4. Summary
	1. REST API architecture must consist of multiple layers
	2. Each layer can change independent of the other layers
	3. Client must not connect directly to app server
	4. Benefits
		1. Simplication
		2. Evolution without disruption (to existing clients)

### REST API Architectural Constraint - Code On Demand ###
1. Learning objectives:
	1. What is code on demand?
2. Constraint:
	1. Server can extend client's functionality by sending some code
		1. Some executable code component is sent by server
3. Example: /Vacations?dest=HAWAII
	1. Server sends a javascript for booking a vacation (client doesn't know this before)
4. This constraint is optional
	1. Examples of code on demand
		1. Java applet
		2. Flash
		3. JavaScript
5. Summary
	1. In a response, server can send code along with data
	2. Client executes the received code to carry out some action
	3. Code is optional

### Richardson Maturity Model for REST API ###
1. Learning Objectices
	1. WWW as the basis of REST
	2. Undestand the RMM
2. Resource: [http://martinfowler.com/articles/richardsonMaturityModel.html](http://martinfowler.com/articles/richardsonMaturityModel.html)
	1. Glory of REST
	2. Level 3: Hypermedia Controls
	2. Level 2: HTTP Verbs
	3. Level 1: Resources
	4. Level 0: The Swamp of POX
3. WWW: Massively scalable distributed application
	1. Millions of systems connecting to WWW
	2. REST API adapts this proven architectural style
		1. Foundation for REST API
4. RMM:
	1. Level 0: POX: Plain Old XML
		1. Use of HTTP or RPC invocation
		2. HTTP/XML based RPC mechanism
			1. ACME is already using
	2. Level 1: Resources
		1. Think it as resources
			1. ACME:
				1. vacation
					1. reviews
					2. photographs
				2. customer
					1. loyalty rewards
					2. albums
				3. hotel deals
				4. car rental deals
	3. Level 2: HTTP Verbs
		1. Usage of different HTTP methods to manipulate Resources
			1. CRUD
				1. ACME:
					1. vacation:
						1. http://acme/vacation
							1. POST: Insert to DB
							2. GET: Select from DB
							3. PUT: Update in DB
							4. DELETE: Delete from DB
	4. Level 3: Hypermedia Controls
		1. Client not only receive data or state of the resource but also links to actions that it can take on the resources
		2. HATEOAS: Hypermedia As The Engine Of Application State
			1. Client calls server
			2. Server sends data to client
			3. Client needs knowledge of other end-points
				1. Client first uses GET /vacation
				2. Server returns vacation package details
				3. Server also sends URLs
					1. For adding review or comment
					2. For Booking the package
						1. If Bookings are not available
							1. This link is not sent or some other linke is sent to check this
			4. Benefits
				1. Server can change the URI schema without breaking the client
					1. Client must be using the links provided in the media
				2. It helps client developers to explore the API/service
					1. As it changes over time
				3. New operations & capabilities can be exposed by server
					1. Helps client evolve over time as server exposes more and more APIs
						1. Client does not have to change
5. Summary:
	1. RMM - Makes us think how various aspects of WWW can be related to REST APIs 
		1. WWW is a model for design and architecture of APIs
	2. Domain objects can be treated as resources
	3. HATEOAS: Client manages state by using media/links sent by server

## Designing REST API ##
### API Value Chain ###
1. Learning objectives
	1. Describe the API value chain
	2. General design guidelines
2. API value chain
	1. Data is managed in data store or database
	2. API ecosystem
		1. Data is used by APIs developed by API developers
		2. APIs are leveraged by App developers who build apps used by users
		3. The most important link in the API value chain is: App developer
			1. If API does not appeal to App developer, they may not use it
				1. Focus API for App developer
				2. API is a product
				3. API should meed the needs of App developer
					1. Think about the needs of App developer
						1. Public: Need to compete to other APIs
3. Common Sense Design Principles
	1. Un-Ambiguous Design: API should give clear intent of the API
	2. Design for simplicity: Don't confuse developers (App developers)
	3. Be clear: Simple and straight forward and easy to interpret
	4. Stay consistent: Use common patterns in APIs (App developers should understand the patterns (data, url pattern, ...)

### Practices for Resource Names, Actions & Associations ###
1. Learning objectives
	1. Endpoint naming
	2. REST API non CRUD operations
	3. Handling resource associations
2. API endpoints naming:
	1. Parts:
		1. Base URL: https://api.walmartlabs.com (stays the same)
		2. Resource: <base-url>/<version>/items
		3. Version: v1
	2. Good practices for Base URLs
		1. Avoid www domain: www.acme.com
		2. Keep base URL simple: (developers should be able to remember)
		3. If possible use a subdomain: https://**api**.twitter.com
		4. Or/And use separate domain: https://api.**walmartlabs**.com
3. Example: http://api.acme.com
4. Resources:
	1. Example: /items, /items/{id}
	2. Example: /people, /people/{id}
	3. Example: /programmes, /programmes/{id}
5. Patterns for resources:
	1. Nouns for resources
	2. Resources are plurals (good practice)
6. Example:
	1. Resource:

			GET http://api.acme.com/vacations
			GET http://api.acme.com/vacations/{id}

7. Actions: Operations that are not CRUD operations (calculation of tax, generating a report)
	1. Example: Uber: price estimation API - /estimates/price
		1. Twitter: /friendships/lookup
		2. Walmart: /search?query
	2. Pattern:
		1. Actions can be used as part of resource hierarchy
		2. If hierarchy cannot be defined, then construct action with subquery
			1. /search?query
8. Example: Book a vacation package

		POST /vacations/{id}/book
		POST /bookVacation

9. Example: Search by Destination & Nights

		GET /vacations/destination (problem)
		GET /vacations/search?destination=bahama&nights=2

10. Associations: Managing resource(s) within a resource
	1. Examples:
		1. Facebook: /me/photos
		2. Walmart: items/{id}/reviews
		3. Twitter: mutes/users/list
	2. Good practices:
		1. Avoid deep nesting (Maximum = 3 suggested)
		2. If more than three levels
			1. Use subquery
	4. Examples:
		1. vacations
			1. reviews: GET http://api.acme.com/versions/{id}/reviews
				1. Specific review: GET, PUT, DELETE http://api.acme.com/vacations/{id}/reviews/{review-id}
			2. photographs

### Implementing REST API CRUD Operations ###
1. Learning objectives
	1. HTTP methods mapping to CRUD
	2. Use of HTTP status code
	3. Supporting multiple resource formats
2. Uniform interface constraint is a contract for communication between client and server
	1. Three parts
		1. HTTP methods
			1. Method indicates the action to be performed on resource
				1. POST: Creation
				2. GET: Read or Retrieve
				3. PUT,PATCH: Update
				4. DELETE: Delete
				5. OPTIONS:
				6. HEAD:
				7. TRACE:
				8. CONNECT:
			2. Expose API using appropriate method to the user
		2. HTTP status codes
			1. Status Code:
				1. Code
					1. Three digit
						1. 1xx - information (100 - continue)
						2. 2xx - success (on server side) (200 ok)
						3. 3xx - redirection (307 temporary redirect)
						4. 4xx - client error (404 Not found)
						5. 5xx - server error (500 internal serve error)
				2. Textual information
				3. Use the standard codes for the API
					1. [https://www.w3.org/Protocols/rfc2616/rfc2616.html](https://www.w3.org/Protocols/rfc2616/rfc2616.html)
		3. Representation formats [supported]
3. Creation of a resource
	1. POST /vacations
		1. Body: has details of vacations package
		2. /vacations/{id}/reviews
			1. Body: has details has reviews
		3. Status code: 201 - creation
			1. Two options:
				1. May return a lind (id) to new resource in location header
					1. Location: http://api.acme.com/vacations/121/reviews/2
				2. May return the new object
					1. Bandwidth is used (mobile phone - not a good idea)
		4. Status code: 4xx - Bad request - 400 missing required field (id is not sent)
		5. Status code: 5xx - Issue in processing - 503 database unreachable
	2. GET /vacations - reads or retrieves resource collection or specific resource
		1. /vacations/{id}
		2. Status code: 200 - Ok
		3. Data: Response sent in requested format in the body
		4. Failure:
			1. 4xx - 404 - resource not found
			2. 5xx - 500 - Internal server error
	3. PUT/PATCH - update
		1. PUT - used to update all attributes of existing resource - replace can also CREATE if client provide ID (not suggested)
	4. PATCH - Modifies parts of an existing resource
		1. PATCH http://api.acme.com/vacations/121?validTill=3/1/2017
		2. Success status codes
			1. 200
			2. 204 - no content
			3. 201 - created
		3. Optional:
			1. Resource in body of response
			2. No need to send the link
		4. Failure: Same as POST and GET
	5. DELETE: Deletes resource
		1. /vacations - all
		2. /vacations/{id}
		3. Status codes:
			1. 200 - may return deleted resource in response body
			2. 204 - No returned content = 204
		3. Failure codes: Similar to other operations
4. Support multiple formats (json, xml, csv, ...)
	1. Design in such a way to support multiple formats in future
	2. One way: Accept query paramters
		1. /search?q=iphone&format=xml
		2. /search?q=iphone&format=json
	3. Second way: HTTP Header (accepts)
		1. Accepts: application/json
		2. Accepts: application/xml
	4. Third way: Resource format suffix
		1. /programmes/schedules/fm/today.json
		2. /programmes/schedules/fm/today.xml
5. Accept header is not so common
6. Most providers set default format = json
7. Response must return the following:
	1. Content-Type
	2. HTTP status code = 415 - Requested format not supported (if API does not support client requested format)
	3. Document (a) supported formats (b) how requester specifies
8. Suggested:
	1. Use sub-query or suffix for format
9. Summary:
	1. API CRUD operations should return standard HTTP codes

### Walkthrough: Creation of Vacations API in Node JS ###
1. Demo: Vacations API
	1. Creation of database - MLab
		1. Setup a collection - vacations
		2. Define the index on name
	2. Setup the node application
		1. Define the Mongoose schema for vacation package
	3. Creation of API endpoints & Test
		1. GET all active vacation packages
		2. POST a new vacation package
2. Creation of database in MLab
	1. name: acmetravel
	2. collection: vacations
	3. user: acmefan, password: xxxx
3. Code: Download from github
	1. [https://github.com/acloudfan/REST-API-Course](https://github.com/acloudfan/REST-API-Course)
	2. api/vi/Vacations.js
	3. data/Vacations.js (test data)
	4. db/Settings.js, db/Vacations.js
	5. models/Vacations.js

### REST API Error Handling Practices ###


### Walkthrough: Implementation of Error Handling for POST API ###
### Handling Changes to API ###
### Versioning the API ###
### API Caching (1 of 2) Concepts & Design Decisions ###
### API Caching (2 of 2) Cache Control Directive ###
### Demo - API Caching Using Cache-Control Directives ###
### Building Support for Partial Responses ###
### Building Support for Pagination ###

## REST API Security ##
### REST API Security - Introduction ###
### Securing API with Basic Authentication ###
### Securing API with Tokens & JWT ###
### Securing API with API Key & Secret ###
### API Authorization Using OAuth 2.0 ###
### API Security - Functional Attack ###

## REST API Specifications Using Swagger 2.0/OAI ##
### Requirements Analysis Process & Intro to REST Specifications ###
### Swagger/OAI Specifications Walkthrough ###
### Swagger/OAI Specifications, Part 1 of 3 ###
### Swagger/OAI Specifications, Part 2 of 3 ###
### Swagger/OAI Specifications, Part 3 of 3 ###

## API Management ##
### Introduction to API Management ###
### API Lifecycle & Developer Productivity ###
### API Developer Portal ###
### API Security Management ###
### API Traffic Management ###
### API Analytics ###
### API Product and API Monetization ###

## Good Bye & All the Best ##
### Good bye ###