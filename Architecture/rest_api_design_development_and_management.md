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

### Example REST API Walkthrough ###
1. Ticketmaster:
	1. Public and partner APIs
	2. Management of access to APIs
	3. SLAs for each type of API
2. Ticketmaster - e-tickets for different concerts, ...
	1. Developer portal:
		1. Getting started
			1. Data model
		2. GET YOUR API KEY
			1. New account
			2. Approaval - automated
			3. Use credentials
		3. Distribution paterners
		4. Certified partners
	2. SLA:
		1. 5000 API calls per day
			1. 5 requests / second
				1. We can increase
	3. API Explorer
		1. Get
			1. Parameters
				1. JSON
				2. ...

### API Value Chain ###
1. Learning Objectives
	1. Why organizations build API?
	2. What is needed to build successful API?
2. API's Value Proposition?
	1. Makes the **asset of value** easily accessible within & outside the bounds of the organization
		1. Suppose data is of value
			1. Entities inside and outside organization can access (who have interest)
	2. Examples:
		1. Asset of Value:
			1. Data | Integration
				1. The Weather Company
				2. FedEx
			2. Service | Product
				1. NETFLIX (movies, programs are assets)
					1. Sony is accessing the APIs
				2. twilio (communication features as APIs)
					1. sms
					2. vidio calls
					3. voice calls
			3. Social (data of users)
				1. Facebook
					1. APIs - business users can access
				2. Twitter
3. Why make **Asset of Value** easily accessible?
4. What's in it for the owner?
	1. Business benefits
		1. Direct Revenue - owner organization constructs new revenue stream by way of exposing data and services (subscription model)
			1. twilio
			2. AWS
			3. The Weather Company
	2. Indirect Benefits (no direct revenue)
		1. ebay
		2. FedEx
		3. indeed
		4. Why?
			1. Ebay - to expand partner ecosystem
			2. FedEx - For competitive advantage
			3. indeed - Brand recognition
			4. Agility
			5. Social good
			6. ...
		5. Think about our organization
			1. Atria Healthcare:
				1. Data can be accessed by government for records
				2. Data can be accessed by partners for augmenting additional services
				3. Data can be used by business for analytics
					1. How is business doing
					2. How can business be improved
				4. Data can be used by other companies for advertisements
				5. Data can be accessed from other clients (mobile apps, desktop apps, ...)
				6. Indirect benefits:
					1. Recognition - other companies don't have this feature
						1. Competitive edge
5. End consumer of the asset:
	1. Individual users
		1. Public domain users
			1. Using
				1. Browsers
				2. Apps from App stores
			2. Add value on top of assets exposed by the company
	2. Enterprise users (users who are mostly involved in carrying out business functions)
		1. SAAS solutions
		2. Packaged solutions
		3. Home grown applications
6. Apps Deliver the Value
	1. Apps are used to deliver value added asset to end user
7. API Developer: (but must also understand customer's needs, understand needs of app developers, support app development process)
	1. Cusotmer - App developer
	2. Must follow
		1. REST API Design Principles
		2. Best practices & Guidelines
		3. Use right tools, technology, skills, knowledge
8. Why Build API?
	1. What _asset_ of _value_ does your org hold?
		1. Data?
		2. Service?
		3. Capabilities?
	2. Who will get the MOST benefit from these asset?
		1. Internal stakeholders?
		2. External entity?
		3. Partners?
	3. Is there a _Business Value_ in making the asset easily accessible?
		1. For our organization
	4. Are there partners who will help in _delivering the value_?
		1. Ecosystems around APIs

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

### WebApp Versus REST API Architecture ###
1. Learning Objectives:
	1. Architectural Similarities
	2. Architectural Differences
2. WWW:
	1. Massively scalable distributed application
	2. Forms the basis for REST API Architecture
		1. Proven technologies are used for REST API
3. www vs REST
	1. www and REST support
		1. Client-Server
		2. Layered
		3. Caching
		4. Code on Demand
		5. HATEOUS
	2. www
		1. URI: No hard & fast rules
		2. Statelessness:
			1. Depends on needs
			2. Web server can manage
		3. HTTP methods:
			1. Typically uses GET & POST
	3. REST
		1. URI: Strick rules & best practices
			1. Contract
			2. Resources identity
		2. Statelessness
			1. Server never tracks the client's state
				1. If client sends request, it sends state related data along with the request
		3. HTTP Method:
			1. POST - creation
			2. GET - retrieval
			3. PUT - Update
			4. DELETE - deletion

## Designing REST API ##
### API Endpoint URL ###
1. Scheme:

		https://domain/product/version/resource/{id}
		
	1. product (optional): grouping name
		1. Packages
			1. Logicall grouping of resources
				1. If org is building multiple APIs. Each of the APis can have dedicated end points and built by different teams
				2. This is optional
					1. If it is a small company then it can be ignored
				3. Makes it easier for the client to understand APIs
				4. Examples:
					1. https://app.ticketmaster.com/**discovery**/...
					2. https://app.ticketmaster.com/**account**/...
					3. https://app.ticketmaster.com/**partners**/...
	2. resource: REST resource
	3. https://domain: base URL
		1. Examples:
			1. https://api.paypal.com
			2. https://app.ticketmaster.com
			3. https://developer.uber.com
		2. Note: DO NOT use your www sub-domain for API
			1. `api` is subdomain
			2. `app` is subdomain
			3. `developer` is subdomain
		3. Separate URL is also possible:
			1. https://api.walmartlabs.com
			2. https://services.expediapartnercentral.com
	4. version: version of API
		1. API can be treated as a software product
			1. Software products can have multiple versions at the same time
			2. Multiple versions can be actively consumed by consumers
				1. Insulates API consumers from API changes
					1. Consumers can switch if they want on their own schedule instead of being forced to switch along with the API version
			3. It is optional
				1. There are other ways to manage APIs
					1. Headers
					2. Query params
	5. id: resource id
		1. If `id` is not specified, it can imply that the operation can be carried out on the entire collection
		2. Examples: https://services.expeciapartnercentral.com/products/properties
			1. Get can return a collection of properties
			2. https://services.expeciapartnercentral.com/products/properties/property-id - specific property
	6. Root URL:
		1. **https://domain/product/version**/resource/{id}
2. Summary:
	1. Base URL
	2. Grouping
	3. Version
	4. Resource
	5. Id

### Practices for Resource Names, Actions & Associations ###
1. Learning Objectives:
	1. Resource Naming
	2. Actions
	3. Associations
2. Resource Naming: (Nouns)
	1. Yelp: /businesses (plural - more common)
		1. /businesses/{id}
	2. LinkedIn: /people
		1. /people/{id}
	3. The Movie DB: /list (singular)
		1. /list/{id}
3. Operations on Resource:
	1. Create, Retrieve, Update, Delete
		1. HTTP method is used
	2. What if the operation is NOT a CRUD operation?
		1. e.g. Calculations
		2. e.g. Reporting
		3. Solution: Specify action using a verb
			1. Example: Spotify: https://api.spotify.com/v1/search (verb)
		4. The specified action may not apply to any resource
			1. Example: https://api.spotify.com/v1/search
				1. Does NOT apply to any specific resource in the API
			2. Exmaple:
				1. Uber: /estimates/price
				2. Twitter: /friendships/lookup (friendship collection lookup)
		5. Practice: Define ACTION as part of resource hierarchy
			1. `/resource/action`
4. Resource Associations:
	1. Resource relationships:
		1. e.g. Orders have Items
		2. e.g. People have Followers
			1. `/people/{id}/followers` - all followers of the user
	2. Example:
		1. E-Trade: Accounts have Transactions
			1. https://api.etrade.com/v1/accounts/{accountIdKey}/transactions
			2. https://api.etrade.com/v1/accounts/{accountIdKey}/transactions/{transId}
		2. Expedia:
			1. properties/{propId}/roomTypes/{roomId}/amenities
		3. The Weather Company:
			1. geocode/{latitude}/{longitude}/forecast/daily/{days}
	3. Too much nesting is not good:
		1. Maximum 3 levels is recommended
			1. Alternative: Subquery to avoid deep nesting
5. Summary:
	1. Resource names should be nouns, Use of plurals suggested
	2. Actions can be verbs; may be standalone or apply to resource
	3. Avoid nesting over 3 levels for associated resources

### Walk Through: Setup the API URI for ACME API ###
1. Learning Objectives:
	1. API URL
	2. Resource
	3. Search action
	4. Associations
		1. Vacatioins with other resources
2. Who is the consumer of ACME API?
	1. App developer
	2. End user experience cannot be ignored
		1. When designing we need to think about end consumer's experience
		2. Is your API providing the capabilities for building the end consumer's experience
3. ACME API Bae & Root URL
	1. https://**api**.acme.com
	2. Product can be ignored (not complicated)
	3. version: v1
	4. Root URL: https://api.acme.com/v1
4. ACME API Resources
	1. Resource names should be nouns
		1. vacations
			1. https://api.acme.com/v1/vacations
			2. https://api.acme.com/v1/vacations/{id}
5. ACME API for Search
	1. Users may like to find Vacation packages by destination:

			GET /vacations/destination/{Bahamas}
			
	2. Users may like to find Vacation packages by:
		1. Destiantion
		2. Price
		3. Number of days
		4. ...
		4. Solution: More generic capability

				GET /vacations/search?destination=Bahamas&numberofdays=5
				
			1. Query params
6. ACME API Associations
	1. vacations -> photographs (users) (Customers will upload pictures)
		1. App developers should be able to show some pictures for the destination to give end users experience for buying the package
	2. vacations -> reviews (Customers will review packages & assign stars)
	3. Solution:
		1. /vacations/{vacation-id}/photographs
			1. /vacations/1001/photographs - App dev can pull all photographs associated with vacation package with id 1001
		2. /vacations/{vacation-id}/reviews/{review-id}
			1. DELETE /vacations/1001/reviews/10
7. Summary:
	1. ACME API Root URL: https://api.acme.com/v1
	2. Vacations Package Resource: /vacations, /vacations/{id}
	3. Vacation Package Search: /vacations/search?destination=Bahamas
	4. Vacations Package Associations: /vacations/{vacation-id}/photographs/, /vacations/{vacation-id}/reviews/

### HTTP API Request flow and HTTP Status Code ###
1. Learning Objectives:
	1. HTTP API Call flow
	2. Contract specification overview (parts)
	3. HTTP Status Code (by server)
2. REST API Call flow
	1. REST client - HTTP VERB -> RESTful API
		1. Request
			1. Query params
			2. HTTP header
			3. Body
		2. Response
			1. HTTP header
			2. Body
	2. Defined independently for each of the HTTP methods
		1. GET
		2. POST
		3. PUT
		4. DELETE
3. Uniform Interface - Contract
	1. Contract between client and server
	2. API developer needs to provide
		1. Endpoint: http://.../vacations
		2. Query parameters
		3. Request: POST, GET, PUT, DELETE
		4. HTTP Headers supported:
			1. Standard header such as Accepts
			2. Custom headers
		5. Body:
			1. Format
				1. Data format e.g. JSON
				2. Request Schema
		6. Response:
			1. HTTP Header
				1. HTTP Status Code
				2. Standard | Custom Headers
			2. Body:
				1. Data format e.g., JSON
				2. Response Schema
4. HTTP Server always sends status code in header
	1. Status response text - info message related to status code
	2. 3 Digit Return Standard Return Codes
		1. First digit represents the classification
			1. 5 classifications
				1. 1xx - informations (100 - continue)
				2. 2xx - Success (200 - OK)
				3. 3xx - Redirection (307 - Temporary Redirect)
				4. 4xx - Client Error (404 - Not Found)
				5. 5xx - Server Error (500 - Internal Server Error)
		2. Documented in RFC2616 - https://www.w3.org/Protocols/rfc2616/rfc2616.html
	3. Note: Do not invent new codes - Use the standard HTTP Codes for your REST API
5. Example: Etsy
	1. https://www.etsy.com/developers
		1. API
			1. JSON, JSONP
		2. All 4 verbs
		3. Response formats
		4. Response codes
6. Summary:
	1. Contract: Endpoint, query params, request, response, headers
	2. 3 digit number

### Implementing REST API CRUD Operations ###
1. Learning Objectives:
	1. Request | Response fro CRUD
	2. HTTP Status Code
2. Use appropriate HTTP verb from CRUD
	1. PATCH
	2. OPTIONS
	3. TRACE
	4. HEAD
	5. CONNECT
3. Constructing a Resrouce:
	1. Endpoint: https://acme.../vacations
		1. http://acme.../vacations/{id}/review
	2. Request body contains the Resource representation
	3. API design may require use of standard | custom header
4. Constructing a Resource Reponse:
	1. Header:
		1. 2xx Success (201 created)
		2. 4xx Bad Request (400 Missing required field)
		3. 5xx Issue in processing (503 Database unreachable)
	2. Body:
		1. May return the new resource instance (data e.g. JSON)
		2. May return link to new resource instance
			1. http://.../vacations/1423 (link is returned by server)
5. Retrieve Resource - GET
	1. Endpoint: http://acme.../vacations
		1. https://acme.../vacations/{id}
	2. Query paramters:
		1. http://acme.../vacations/subquery
	3. API design may require use of standard | custom header
	4. Request body is optional (retrieval)
	5. Status codes:
		1. 200 OK - if server was able to retrieve successfully
		2. 4xx Bad request - 404 Resource Not found
		3. 5xx Issue in processing - 500 
	6. Body:
		1. Collection of Resources
		2. Single instance of the requested resource
6. Updating the Resource - PUT/PATCH
	1. PUT - Update ALL of the attributes of the resource
	2. PATCH - Update SOME of the attributes of the resource
		1. For large objects it may be performant
			1. Only part of the data can be sent
			2. Example: PATH http://api.acme.com/vacations/121?validTill=3/1/2022
	3. PUT/PATCH - requirements:
		1. Endpoint - http://acme.../vacations/{id}
		2. Parameters - http://acme.../vacations/subquery
		3. Body:
			1. Request body contains the Resource data to update
			2. API design may require use of standard | custom header
		4. Status Codes:
			1. 200 Success - Updated Resource in Body
			2. 201 Created - Body data optional
			3. 204 No Content - No content in Body
			4. 4xx Bad request
			5. 5xx Issue in processing
		5. Body: Depends on HTTP status code
7. Deleting the resource
	1. DELETE
		1. Endpoint - http://acme.../vacations
			1. http://acme.../vacations/{id}
		2. Parameters - http://acme.../vacations/subquery

### API Data Format Setup ###
### Setup the Demo/ Test Environment ###
### Walkthrough: Creation of Vacations API in Node JS ###

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
### Application Error Handling Patterns ###
### Walkthrough: Implementation of Error Handling for POST API ###

## REST API Handling Change - Versioning Patterns ##
### Handling Changes to API ###
### Versioning the API ###
### Walk through: ACME API Versioning ###

## REST API Cache Control Patterns ##
### API Caching (1 of 2) Concepts & Design Decisions ###
### API Caching (2 of 2) Cache Control Directive ###
### Demo - API Caching Using Cache-Control Directives ###
### Building Support for Partial Responses ###
### Building Support for Pagination ###

## REST API Response Data Handling Patterns ##
### Building Support for Partial Responses ###
### Walk Through: Setup Partial Response Support in ACME API ###
### Building Support for Pagination ###
### Walk Through: Building Support for Pagination in ACME API ###

## REST API Security ##
### REST API Security - Introduction ###
1. Learning Objectives: Very important - Designers should think about security from the beginning
	1. API security considerations
2. Application flow:
	1. Attack
		1. Application attack - manipulate, steel identity
		2. Gateway attack - vulnerabilities and connect to back end
		3. Breaching firewall - directly access server, directly access database
	2. Consider all attack posibilities
		1. Best strategy - prevent attacker from reaching the API server or API management system
			1. Think about security at every API touch point
3. Example: Bank Mobile Application
	1. Confidential data
		1. Customer personal data
		2. Transactional data
	2. Protection:
		1. Firewall - impenitrable
			1. If API are at the boundary of the firewall
				1. We have introduced an attack surface
					1. Attackers can get access the data
						1. Data theft
						2. Data manipulation
						3. Identify theft
						4. DOS attack
				2. If the API has some weekness or vulnerability, attackers take advantage of that
					1. We need to think about all the possible types of attacks that an attacker can launch
			2. Common attacks
				1. Functional attacks - ...
		2. Impersonation:
			1. Mimics the mobile application
				1. Call the API
					1. Who is the caller of API?
						1. Authentication and Authorization
						2. How to ensure that the client is actually a mobile app and not an imperosonator
							1. Multiple ways
								1. Basic
								2. Token based
								3. Key-secret based
					2. Transactions getting executed
						1. Is the transaction authorized?
							1. OAuth 2.0 - defacto standard
		3. Securing the data
			1. How to secure
				1. Maintaining or managing measures to protect the data
					1. From unauthorized access or threat
					2. Maintaining the integrity of the data
						1. API designers may not have control but needs to specify the requirement
						2. Data at rest is outside the scope of REST API design and implementation
							1. Work with other stakeholders to prtect it
						3. Data in motion
							1. Transmitted from mobile app to my application is within the scope of REST API design and implementation
								1. Solution: Always use TLS/HTTPS for REST API
									1. Encryption
									2. protection from
										1. Un-authorized attacks
										2. Man in the middle attacks
							2. Do not use self-signed certificates
			2. API Security
				1. Authentication
				2. Authorization
				3. Functional attacks

### Securing API with Basic Authentication ###
1. Learning objectives
	1. Basic authentication for API security
		1. Issues related to basic authentication scheme
	2. Implement basic auth for node API
2. Basic Authentication - easiest way to protect the API
	1. HTTP Header
		1. Authorization: Encoded-Credentials (Base64 encoded)
			1. user:password
			2. Server decodes the header and reads the username and password
				1. If it is good, sends 200 OK
				2. If not okay, 401 Unauthorized
			3. Anyone can read this data
				1. Need to use https and ssl
				2. Must not be used with http
		2. Issues
			1. Dreamz
				1. Vacation bidding
					1. If user needs info from Dreamz
						1. Dreamz calls Acme API
							1. provided by Acme
				2. If http is used, man-in the middle attack is possible
	2. This scheme needs user to send the credentials in every request
		1. sessions can be used - not allowed for REST
	3. Dreamz Mobile app may be invoking API
		1. The credentials need to be stored in the mobile app
			1. Anyone can break into the app and take the credentials
3. Passport: [http://passportjs.org/](http://passportjs.org/)
	1. Authentication middleware for Node.js
		1. Non intrusive - keeps the code maintainable
		2. Supports multiple forms of authentication
			1. Basic
			2. OAuth2
			3. Tokens
		3. Built in support for social authentication
			1. Facebook
			2. ...
	2. Over 300 strategies - authentication
	3. Example:
		1. Where to store?
			1. File

					// Hardcoded users for testing
					// Can be changed to store the users in a database
					var users = [
						{ id: 1, name: "jim", email: "jim@mail.com", password: "jim123" },
						{ id: 2, name: "sam", email: "sam@mail.com", password: "sam123" }
					];

					var checkCredentials = function (username, password) {
						// Check if username/password are good
						var user = users.find(function (u) {
							return u.name === username && u.password === password;
						});
						return user
					}

					exports.checkCredentials = checkCredentials;

		2. app.js

				var express = require('express')
				var basicauth = require(__dirname, '/basicauth')

				// Express app setup
				var app = express();
				var router = express.Router();

				// This is the passport middleware function that get called first
				var auth = basicauth.auth
				// Setup the route with basic authentication
				router.get('/private', auth, function (req, res) {
					res.send('Access granted to private resource!!!')
				});

				app.use(router);
				app.listen(3000);
				console.log('Listening on 3000')

		3. basicauth.js

				// This has all the code for implementing basic auth
				var passport = require('passport')
				// This the strategy for basic authentication
				var BasicStrategy = require('passport-http').BasicStrategy

				// Access to the users data
				var users = require(__dirname + '/userdata/users')

				// Setup the passport strategy
				passport.use(new BasicStrategy(function (username, password, done) {
					var user = users.checkCredentials(username, password)
					if (user)
						return done(null, true)
					else
						return done(null, false)
				}));

				// This is the middleware function that gets invoked
				var auth = passport.authenticate('basic', { session: false })

				exports.auth = auth;

### Securing API with Tokens & JWT ###
### Securing API with API Key & Secret ###
### API Authorization Using OAuth 2.0 ###
### API Security - Functional Attack ###

## REST API Specifications Using Swagger 2.0/OAI ##
### Requirements Analysis Process & Intro to REST Specifications ###
1. Learning Objectives:
	1. Specification development process
	2. Specification standards
		1. Multiple competing
2. Application Programming Interface
	1. A **user interface** to data and systems that is **consumed by applications** rather than humans
	2. A well defined **contract** between API provider and consumer
		1. REST API is an embodiment of that
3. Contract Creation Approach
	1. Contract Last
		1. API developer develops code, annotates and puts comments
		2. Tool is run on the code to output the specification document and another documentation (for reading)
	2. Contract First
		1. First specification is created
		2. A tool is run on the specification to generate code (skeleton)
			1. API developer adds logic to the skeleton
			2. Generate documentation (for reading)
		3. Recommended because the other approach makes it difficult to keep code and spec in sync
4. Specifications
	1. Collaboration between App Developer and API Developer
		1. Get together for the following
			1. Requirements gathering
			2. Analysis
			3. Specification definition
			4. Mocking & Validation
				1. Mock REST service is created using Spec (v1)
		2. App Developer uses the mock to validate the function they are developing
			1. If it works, that is the final version or else the above interative process continues til spec is agreeable to both
		3. Final version (REST API Spec) is taken by API Developer to implement the API
5. REST API Specification Standards
	1. WADL - W3C standard - Web API Description Language (XML based standard)
	2. apiblueprint
	3. apiary
	4. raml: Supported by mulesoft
	5. Swagger: Becoming standard for REST API Spec across industry
6. Swagger:
	1. Open source projects adopted Swagger and supported by multiple vendors
		1. apigee
		2. API Management (IBM)
		3. Mashery
		4. Layer7 Technologies
	2. Vibrant community
		1. [https://github.com/swagger-api](https://github.com/swagger-api)
7. Benefits
	1. Swagger spec can be used for the following:
		1. Generate Developer Documentation
			1. Can be put on a website
				1. App developer can search the APIs to select the API best for them
	2. Swagger spec can be used to generate Proxy
		1. Automated proxy creation
		2. Server code generation
	3. Swagger spec can be used to generate Client code (for app developer) using codegen tool
		1. Java client code
		2. ...
	4. Swagger spec can be used for service virtualization (Mocking)

### Swagger/OAI Specifications Walkthrough ###
1. Learning Objectives:
	1. Introduction to Swagger & YML
	2. Swagger tools (for creation and editing)
2. [http://swagger.io/specification/](http://swagger.io/specification/)
	1. OpenAPI initiative took over
		1. Open API initiative (OAI) is focussed on creation, evolution and promotion of a vendor neutral API Description Format based on the Swagger Specification
		2. Swagger spec is known as OpenAPI Spec - Version 2.0
			1. Spec can be written in JSON or YML
				1. YML is superset of JSON
					1. We can mix both
	2. [http://yaml.org/](http://yaml.org/)
		1. Preferred because
			1. Human consumption i.e, easily readable & understandable
				1. Meant for human consumption
		2. It is a serializatoin language like XML, JSON (may not replace XML or JSON)
			1. Mostly used for configuration files
		3. Superset of JSON
			1. Uses indentation instead of symbols such as <> or {}
3. JSON example:

		"swagger": "2.0",
		"info": {
			"title": "Uber API",
			"description": "Move your app forward with the Uber API",
			"version": "1.0.0"
		}

4. YML example:

		swagger: '2.0'
		info:
			title: Uber API
			description: Move your app forward with the Uber API
			version: 1.0.0

5. Learn YML (it is easy)
6. Editor tool
	1. Any YML Editor is OK
		1. Eclipse: YEdit
	2. Online Editor
		1. [https://editor.swagger.io](https://editor.swagger.io)
			1. Left side editor
			2. Right side spec
		2. Import
		3. Download
		4. Generate Server code
			1. Lot of languages
		5. Generate Client code
	3. Node tools
		1. `swagger-editor`
		2. `swagger` - collection of tools but framework for APIs
			1. `swagger project create` - creation of project
			2. Model it: opens swagger editor for YML
				1. Provide YML spec
			3. Try it:
				1. API is live while we edit
					1. Shows mock data
		3. Quit faking: Write real code with Node.js
		4. Publish the entire API project to any Node.js platform

### Swagger/OAI Specifications, Part 1 of 3 ###
1. Learning Objectives:
	1. Structure of the document
	2. Meta data, URL endpoints
		1. How to do this
	3. Tags, External links to docs
2. Swagger 2.0 - has 3 parts
	1. Global information:
		1. Metadata
		2. External documentation links
		3. Tags - makes spec developer friendly by making it searchable
	2. Definitions: schemas for Requests and responses (applied to various resource operations)
		1. definitions
		2. parameters
		3. securityDefinitions
	3. Resource definitions: Refers to the previous two parts
		1. request schema and response schema are defined under definitions
		2. tags refers to tags in part 1
3. Solution: [https://github.com/acloudfan/REST-API-Course-Swagger.git](https://github.com/acloudfan/REST-API-Course-Swagger.git)
	1. Clone the repo
	2. git branch rootdocument
4. Metadata
	1. Info
		1. Version
		2. Title
		3. Description
		4. Contact (optional)
			1. name
			2. url
			3. email
		5. License (optional)
			1. name
			2. url
5. Example:

		swagger: "2.0"

		info:
			version: "0.0.1"
			title: ACME Vacations API
			description: This specification is for the ACME Travel packages |
				These specifications were used to teach the students how
				to construct the Swagger specifications for their REST API

			contact:
				name: A Cloud Fan
				url: http://www.acloudfan.com
				email: raj@acloudfan.com
			
			license:
				name: GNU
				url: http://acloudfan.com

	1. | is used for multiline description
6. Root Document - used to define endpoint urls
	1. host - `api.acme.com:3000`
	2. basePath - `/v1` - prepended to resource name
	3. schemas[string] - `http`, `https`
	4. consumes[string] - content type header - indicates type of the request accepted (`application/json`, `application/xml`, `plain/text`)
	5. produces[string] - content type header - indicates type of the request produced (`application/json`, `application/xml`, `plain/text`)
	6. Example:

			host: localhost:3000
			basePath: /v1/
			schemas:
				- http
				- https

			consumes:
				- application/json
			produces:
				- application/json
			
		1. `-` indicates each item in an array
7. Tags:
	1. Metadata - used by the developer portal tools - to generate filterable and searchable documentation for the API
	2. Tag#1
		1. name
		2. description
	3. Tag#2
		1. name
		2. description
	4. These are referred in Paths or Operations sections
		1. Third section
	5. Example:

			tags:
				- name: vacations
				  description: Refer to vacation packages that are offered by ACME travel
				- name: hotels
				  description: Refer to partner hotels through which ACME offers vacation |
								deals.
				- name: package
				  description: Same as vacations. It refers to the vacation package.
8. Spec does not have all the documentation so the developers need to get as much help as possible
	1. externalDocs: Defined under root
		1. Two parts:
			1. description
			2. url
		2. Links to external document repository
			1. FAQ - external web page
		3. May be used in Path (not by $ref)
			1. Can also be created for paths
				1. Website is linked from the spec
		4. Example:

				externalDocs:
					description: This is an external doc
					url: http://developer.acmetravel.com/docs

### Swagger/OAI Specifications, Part 2 of 3 ###
1. Learning Objectives:
	1. Defining schema for request/response
	2. Parameters - how request data is received
	3. Security schemes - applied to various operations
2. Solution:
	1. [https://github.com/acloudfan/REST-API-Course-Swagger.git](https://github.com/acloudfan/REST-API-Course-Swagger.git)
	2. Clone repo
	3. `git branch definitions`
3. Definitions:
	1. Parts:
		1. definitions: name schema for defining requests and responses for API operations - In path section references are made to the definitions
			1. `$ref:"#/definitions"` from operation
		2. parameters: how request data is received
			1. Request/Input schema - operations make references to the parameters under Definitions section
				1. `$ref:"#/parameters"` in operation parameters
		3. securityDefinitions: Define different schemes supported by the API
			1. Under operations, using `security` element we make references to `securityDefinitions` from the operation
	2. Details:
		1. definitions: have common schema that describe the messages for requests and responses
			1. There can be multiple named schemas under the definitions
			2. Each named schema has two parts
				1. schema - JSON Schema (say) [http://json-schema.org](http://json-schema.org)
				2. examples - (data examples)

						Mime-type : {
							example as per the
							schema
						}

					1. Example with xml or with json
					2. Used in **docs** or by **mocking tools**
	3. Example:

			# Definitions
			definitions:
				GeneralError:
					required:
						- message
					properties:
						message:
							type: string

		1. `GeneralError` - named schema and it has one property `message`
		2. `message` is of type `string` and it is a required field
			1. Any time there is an error, the operation will be able to send error message in this format
	4. Example: for http status 404 along with a message with the following structure

			# Not found error
			NotFoundError:
				required:
					- message
					- hint
				properties:
					message:
						type: string
					hint:
						type: string

	5. Example: Vacations schema

			# Vacations
			Vacations:
				required:
					- name
					- description
					- type
					- numOfNights
				properties:
					name:
						type: string
					description:
						type: string
					type:
						type: string
						enum:
							- resort
							- cruise
					destinations:
						type: array
						items:
							$ref: "#/definitions/Location"
						minItems: 1
						maxItems: 12
					numOfNights:
						type: number
						minimum: 1
						maximum: 31

		1. References to another schema

				Location:
					required:
						- city
						- country
					properties:
						city:
							type: string
						country:
							type: string

4. Parameters
	1. Here we can define the common ways in which the API will receive request data or request message
		1. Parameter:
			1. name
			2. description
			3. in
				
					{
						body,
						query,
						header,
						path,
						formData
					}

				1. If `n==body` then we must define the schema
					1. We can define under this or we can make reference to the schema defined under definitions section

			4. required
	2. Example:

			parameters:
				IdInPath:
					name: id
					in: path
					type: string
					required: true

		1. Body: No name needed but schema is needed
		2. Query: name is needed
		3. Path: name of path
		4. header: custom header name

6. SecurityDefinitions:
	1. type - security scheme

			{
				basic,
				apiKey,
				oauth2
			}		

	2. name - Used for associating with operation
	3. description
	4. in - where the security credentials are received

			{
				query,
				header
			}

	5. Example:

			securityDefinitions:
				KeySecurity:
					type: apiKey
					in: query
					name: api_key

		1. `apiKey` - scheme

### Swagger/OAI Specifications, Part 3 of 3 ###
1. Learning Objectives:
	1. How to construct the /paths
	2. How to use *definitions* (in path parameters, responses and security)
2. Parts:
	1. paths
		1. Multiple path definitions
			1. `/vacations`, `/portals` paths
		2. Each path can have one or more operations
	2. Operation
		1. get:, put:, post:
		2. Summary - Short description for the operation
		3. Description - Long description for the operation
		4. Tags [] - Pre defined tags or new tags (first part or new tags)
		5. External Documentation - link to external documentation specific to this operation
3. Define Paths before the Definitions (recommended)

		# Paths
		paths
			/vacations/{id}
				get:
					summary: this is a get op
					description: Returns the vacation package identified by {id}
					tags:
						- vacations
						- packages
					externalDocs:
						description: Link to the /vacations ops details & flow
						url: http://www.acloudfan.com
					consumes:
						- application/json
					produces:
						- application/json
					parameters:
						- $ref : "#/parameters/IdInPath"

					# 1 response per HTTP Status code
					responses:
						"200": 
							description: Gets the specific hotel
							schema:
								$ref: "#/definitions/Vacation"
					
						"400":
							description: When a vacation package is NOT found
							schema:
								$ref: "#/definitions/NotFoundError"

						default: # all other http codes
							description: Error
							schema:
								$ref: "#/definitions/GeneralError"

					# security
					security:
						- keySecurity: [] # oauth only - scopes

	1. Consumes - MIME type (array)
	2. Produces - MIME type (array)
	3. Parameters - decides how request data will be received by the operation
		1. `$ref: "#/parameters"`
		2. On the fly
	4. For each status code, there should be a response
		1. There can be multiple responses for an operation
		2. Can reference from definitions
		3. Can be created here
	5. Security: refers to the security scheme defined under the securityDefinitions
		1. Security: "#/securityDefinitions"

## API Management ##
### Introduction to API Management ###
1. Learning Objectives:
	1. API management scope
		1. Activities related to API management
	2. API management infrastructure
		1. Two infrastructure models
			1. High level
2. API Management: API Management is the process of publishing, documenting and overseeing Application Programming Interfaces in a secure, scalable environment
	1. Activities
		1. Lifecycle management
		2. Productivity enhancements for application developers
		3. Securing the API
		4. Traffic management
		5. Analytics
		6. Productization of the APIs
		7. Monetization
3. API management platforms
	1. akana
	2. apigee
	3. IBM API Connect
	4. 3scale
	5. MuleSoft
	6. Mashery
	7. WSO2
	8. ...
4. Two API management models (Infrastructure)
	1. Agent based
		1. Enterprise network (secure env)
			1. APIs implemented in 
				1. Node.JS
				2. Websphere
				3. Enterprise Service Bus
			2. Gateway is on the edge of the enterprise
			3. API management policies gets applied on the APIs within the servers hosting the APIs throw an agent (provided by API management platform)
				1. Through some kind of agent provided by the API management platform
			4. Access to the application is through the secured gateway
	2. Proxy based
		1. API management platform sits on the edge of the enterprise
		2. Proxies are defined on the platform
		3. Calls coming to the proxies are routed to the API implementations in the trusted network
			1. Policies are applied to the proxies (not to API implementations)
		4. When an app makes a call to the proxy, the policies are applied and if everything is good, call is routed to the backend
		5. Common policies:
			1. Security policies
			2. Traffic management policies
		6. Dev portal
			1. App developers can access the Dev Portal to get information about the APIs
			2. To raise request for access
			3. To get support for the APIs
4. Details of activities
5. Some API management platform as example (for activities)

### API Lifecycle & Developer Productivity ###
1. Learning Objectives
	1. API Lifecycle
		1. API management perspective
	2. Developer productivity
		1. Of API developer
		2. Of App developer
2. Three products - features to enhance productivity
	1. IBM API Connect
	2. apigee
	3. MuleSoft
3. Lifecycle of API
	1. Build (stage)
		1. API is developed by the developer
		2. Once API is validated, it gets into next stage
	2. Publish
		1. App developers can request access to the API
			1. If access is granted, they can access or invoke
	3. Deprecated - Sometimes published version is deprecated
		1. Replaced by new version
		2. This will not allow for new app developers to request the access
	4. Retired - At some point deprecated API gets retired
		1. API code is removed from infrastructure
4. To support the API lifecycle in an organization, organization must establish some processes, practices and roles
	1. Developer documentation
	2. Who will carry out publishing
5. We need to publish roadmap in advance
	1. If provided new version of API, provide Dates for publish, depreated and retired dates in advance if possible
		1. For App developers are external
6. Setup App developer communication
	1. Keep them updated with lifecycle state transitions in advance if possible
7. Leverage and construct tools
	1. If company has bought the following use them:
		1. HP Systnet
		2. IBM WSR
8. API lifecycle management is not a standard feature on the API management platforms
	1. IBM API Connect (support this)
		1. Draft: API starts it's life in this mode
		2. Plan: Next phase
		3. Stage: Next phase
			1. Publish: Available for provisioning under API Connect developer portal
				1. Deprecate: API no more available for provisioning on Developer portal
9. Productivity:
	1. App developer - Needs developer portal to manage the following
		1. API Documentation:
			1. Like to see great documentation
			2. Like to see samples and examples
		2. Self serve provisioning
			1. How the app developer will get access to the APIs
				1. email and phone is not a good idea
			2. Develop a website for letting app developers request access
		3. Support
			1. If app developer has a problem where do they go?
	2. API developer - Should make quick decisions about how to implement the API, best designs options, other aspects of implementation
		1. Development guidelines
		2. Frameworks - for constructing the API
		3. Best practices - API developers can leverage
	3. Design and Development: API Management solutions support this by frameworks and features
		1. Specifications based tooling
			1. Feature: Import of specifications for the creation of the API
				1. Example: Importing Swagger Spec in IBM API Connect or apigee
				2. Example: Importing RAML based Spec in MuleSoft Platform
					1. API gets created just by import of the Specs
		2. Utilities and Tools:
			1. Feature: Provided to enhance developer productivity
				1. Mulesoft:
					1. API Manager > Add new API
						1. API Name: New API
					2. API Designer
						1. Paste RAML
							1. API is ready
				2. IBM API Connect
					1. We can import Swagger Spec (OpenAPI spec)
						1. Import
		3. Non-functional requirements
			1. Security and traffic management (must not be coded into the API - complex and may change)
				1. Solution: Policy based implementation
					1. Apply policies written in XML or JSON format (configurations)
						1. Basic to oauth2 say
						2. Some use proprietary
							1. Mulesoft - Mulesoft expression language
					2. If policies are not enough, then
						1. Support for extensions
							1. JavaScript based
							2. Java based
							3. Groovy based
			2. Example: apigee
				1. Target Endpoint: Google GeoCoding API
					1. http://maps.googleapis.com/maps/api/geocode/json?address=92012
				2. Demo:
					1. Creation of proxy for GeoCoding API
						1. http://acloudfan-test.apigee.net/geolocation
					2. Apply policy to protect with **Basic Authentication**
						1. http://acloudfan-test.apigee.net/geolocation?username=acloudfan&password=test
				3. Implemetation:
					1. Go to apigee portal
						1. API proxy
						2. Reverse proxy (most common)
							1. Use OpenAPI 
							2. Next
						3. Proxy name: geolocation
						4. Existing API: http://maps.googleapis.com/api/geocode/json
							1. Next
						5. Secure access for users and clients
							1. Authorization: Pass through (none)
						6. Build and deploy
						7. Open link
						8. Provide address=08817
						9. Basic authentication
							1. Go to Develop tab
							2. Add a step
								1. Basic Authentication
								2. Appy
								3. Save
							3. Give `&username=acoundfan&password=whatever`
								1. No code but only policy
						10. apigee uses xml for policies
							1. API developer can change xml to change behavior

									<User ref="request.queryparam.username"/>

								1. Can be changed to receive in header param

### API Developer Portal ###
1. API Management - Developer Portal
	1. Learning Objectives
		1. Developer portal features (that make sense for our API)
		2. Build versus Buy
	2. Demos
		1. apigee
		2. mulesoft
2. It is a one stop shop for app developers
	1. It should have
		1. API Documentation
			1. Manage in Swagger/OAI
				1. This cannot contain a complex flow
					1. Separate doc and publish in a web-page
					2. Use `externalDocs` URL to connect with external documentation
			2. Try it feature
				1. On the Dev portal
				2. Developer can understand how API works
					1. Provide sample code
					2. Provide sample data
					3. Provide SDK
						1. To get developer up to speed quickly (without going through the documentation)
			3. Example:
				1. Walmart Open API
					1. Search API
						1. Click Try and it works
				2. Uber:
					1. SDK
						1. To add button to mobile app
		2. Self server provisioning
			1. Get access
			2. Manual provisioning:
				1. Emails or phone calls to get access to API
					1. App Developer connects to API Owner using ticketing system
					2. API Owner checks policy
						1. If okay to grant access,
							1. Manually generate key/secret (share with App developer)
				2. Okay for internal teams (not for public or partner APIs)
			3. Self provisioning:
				1. App developer visits Dev portal
				2. App developer looks at the API and tries out
				3. App developer raises request for the API
				4. Dev Portal checks if API is setup for auto approval
					1. If setup for auto approval,
						1. Portal generates the key/secret
							1. Key/secret are shared with App developer on the portal
					2. If not setup for auto approval,
						1. API Owner is notified
						2. API Owner checks API policy
						3. API Owner grants access if okay
						4. Key/Secret are generated on the portal itself
						5. Key/Secret are shared on portal itself
			4. Provision practices:
				1. Clearyly define the role, responsible for authorization of access to API
					1. By way of manual process or by way of self service
						1. Need someone to take decision on whether to authorize access or not
				2. Setup the API access policies for your API
					1. Think about who can access it
						1. Private use
						2. Partner use
						3. Public developer (may need to deny)
				3. Define a criteria for Automatic versus Manual provisioning 
					1. API can be marked as a manual or automatic provisioning API
					2. Criteria:
						1. Sensitivity of data - highly sensitive data needs every request to be looked up (so manual provisioning)
						2. Limited capacity in the backend - We may not want everybody to use the API - constraints on the backend
						3. Trust tiers ... ...
							1. Categorize App developers into trust tier system
								1. To decide whether to approve the request or not
				4. If the API is for internal use only then DO NOT publish on portal
					1. Example: Twitter API
						1. Create new app
							1. name
							2. ...
						2. client key and secret key:
							1. Keys and Access Tokens
				5. API Management Platforms:
					1. Provides control on the provisioning aspect of the API
					2. Examples: IBM API Connect, apigee, MuleSoft
						1. apigee - Product is created
							1. Access - internal only, private (explicit authorization is required), public
							2. Key approval - automatic or manual
				6. Benefit of using API Management platform:
					1. Visibility & Provisioning control by configuration
					2. Runtime & Dev portal are integrated
		3. Support:
			1. Internal only API: App developers are supported using ticketing system - not an elaborate dev portal
			2. Public API or Monetized: Elaborate dev portal
				1. Need to provide the following:
					1. Guidance on how to solve some common problems (FAQ)
					2. Best practices
					3. Contact forms
					4. Bug reporting form (for reporting bugs)
					5. Build a developer community (if popular)
						1. Social media - Twitter, Facebook
							1. Forum - developers can solve each other's problems and discuss best practices
					6. Blogs from expert API provider team and publish them
			3. Example: Twitter
3. Build vs Buy
	1. Developer portal is a web application
		1. It depends
			1. Budget
			2. Nature of API being published
			3. Roadmap
	2. Build option
		1. Documentation from Swagger/OAI may be published as-is
		2. For self service provisioning a work flow wll need to be designed
			1. May need to define a manual workflow otherwise
	3. Buy option
		1. API product vendors offer Developer Portal bundled with their products
			1. Integrated with runtime
		2. Support look and feel customization
			1. Change almost the entire look and feel
		3. Some have provision to extend the portals
			1. To include forums
			2. To include blogs
4. Demo:
	1. MuleSoft:
		1. Create New Portal
			1. Theme
				1. Image for API portal
				2. Colors
			2. API Reference
				1. Add references 
5. Summary:
	1. API Documentation - Docs, Try it, Samples, SDK
	2. Self serve provisioning - Automation
	3. Support - FAQ, Developer community
	4. Off the shelf dev portal products
		1. May be customized
		2. May be extended

### API Security Management ###
1. Learning Objectives:
	1. Managing the key/secret, OAuth
		1. apigee - management
	2. Countering the functional attacks
		1. Best practices
		2. General practices for security
2. API to serve publically available data
	1. All API must require a minimal security of API Key
		1. Client can invoke the API but they need to provide an API key
			1. Purpose: 
				1. If there is a misbehaving client, we can invalidate the key
				2. Generate analytics with key as the identity of the app
				3. Usage metrics for the user
	2. API provider:
		1. Management of key/secrets
		2. Implementation of key/secret in API
		3. Support App Developer
	3. App Developer:
		1. Developer controls key/secret
			1. Creation on dev portal
			2. Renew on dev portal
			3. Delete on dev portal
3. Look for commercially available key/secret solutions
	1. API management tools provide this out of the box
	2. Example: apigee
		1. Enable API/Key Secret for the GeoLocation API
		2. Setup API key/secret for the developer & use it for invoking the API
		3. Invalidate the key
	3. apigee
		1. Add step
		2. Verify API key
		3. API key and secret can be used
		4. Delete the app to remove key
4. OAuth2.0 Implementation
	1. Do not provide oauth in API code (passport with node js)
		1. API provider: Off the shelf authorization server for oauth
			1. Authorization server: 
				1. Need to connect to enterprise access and identity solution (like LDAP)
				2. It should manage storage for tokens
				3. It should manage the following:
					1. Tokens
					2. Scopes
					3. Clients
5. Functional threats:
	1. API Testing practices; adopt tools
		1. We should mimic the functional testing attacks
	2. Engage third party for vulnerability assessments
		1. Individuals knowledgable in carrying out the attacks and they are knowledgable to write test cases to break the API
			1. We should get a report
			2. Need to do this if public API
	3. Continuous monitoring to detect attacks/ threats
		1. Carry out monitoring
		2. Check logs
		3. Run reports on logs
	4. Pro-active in protecting API from new attack types
		1. New types of attacks
	5. Implement threat protection in the proxy
		1. Almost all API management tools offer a mechanism to implement functional threat protection in the proxy
	6. Example: apigee
		1. XML Threat Protection
		2. JSON Threat Protection
		3. Regular Expression Protection
6. API Infrastructure
	1. How can security be implemented for public or partner facing APIs
		1. Suppose we have a trusted environment
		2. We put API management gateway or platform on the edge of the environment (in a firewall say)
			1. Define proxy to connect to the API in the trusted environment
			2. Apply policies on the proxy to manage the security
	2. API consumer: Invokes the proxy on which the policies are applied (if everything is good, the call is forwarded to the internal API)
	3. Leverage API management platform for public facing APIs
7. API Security Practices
	1. Educate the API developers
		1. What they need for securing the APIs
	2. Provide development guidelines and patterns on security
	3. Stay up to date on security threats (new vulnerability)
	4. Have a well defined security policy
	5. Develop a well defined contingency plan
		1. How to protect an API from an on-going attack?
	6. Work with other stakeholders to protect infrastructure
		1. All touch points within the API pathway are secure
			1. Network team
			2. Server team
			3. ...

### API Traffic Management ###
1. Learning Objectives:
	1. Need for traffic management?
		1. Why do we need traffic management for API for API infrastructure?
	2. Common policies
		1. 3 common policies
	3. Demo: apigee
2. Traffic Management?
	1. API provider is in between the consumer and Data owner
		1. API provider: must fulfill the contractual aspects agreed upon with the consumer
		2. API provider: must protect the data
	2. Why should API provider manage the traffic?
		1. Response time consistency (for API consumers)
			1. example: 100 calls/second - 1 sec, 105 calls/second - 5 sec
				1. 30 calls/sec - app developer
					1. Suppose infinite loop is introduced (bug) - 80 calls/ sec - respnse time goes up to 5 sec
				2. Not consistent behavior
		2. Service Level Agreement (SLA)
			1. Contractual agreement - SLA is associated
				
					SLA {
						Number of calls: 10,000 calls/ day
						Concurrency: 5 calls/ second
						Response time: Under 1 second
					}

				1. How to enforce this?
					1. Provider has to take care
					2. How to ensure only 10000 calls /day or 5 calls /sec
						1. Enforce the SLA on the **consumer**

		3. Protecting the backend
			1. Internal network say shared by multiple servers
				1. API is used by multiple Apps from outside
					1. DOS attack or misbehaving app
						1. May impact internal components
							1. Degradation of performance of DB
							2. Too many requests may swarm the network
							3. Other servers like webapp servers may get impacted
					2. Spike and volume is not controlled on the edge of the enterprise (say)
			2. API provider must put in some kind of traffic management control to prevent the backends getting impacted due to such high volume events
				1. Blocking or throttling the request at the edge of the enterpise network
					1. API management platforms usually provide traffic management policies to the proxy to APIs
					2. Policies:
						1. Quota:
							1. Defines maximum # of calls per unit time that an app can make to the API
								1. Quota for public domain developer apps
									1. Twitter - 350,000 tweets/minute
										1. API calls from internal apps
									2. Twitter - 350 calls/hour
										1. public apps
									3. Walmart - 5000 calls/day
							2. Example:
								1. Demo: Add Quota (6 calls/minute) for GeoLocation API
								2. Test in node code
									1. Add quota policy - 6 calls per minute
										1. 7th calls onwards fail in the minute
						2. Rate Limiting
							1. API provider can limit the number of concurrent connections to the API
								1. Example: 100 concurrent calls / second
									1. Number of connections should not exceed 100
										1. 20 calls/sec for each app say
							2. Solution:
								1. Walmart open API:
									1. 5 calls/second
						3. Spike Arrest
							1. Protects API backend from severe spikes and DOS attacks
								1. Prevents calls beyond high wate rmark from reaching backend
									1. High watermark value is defined
										1. Calls/sec should never exceed the high watermark

### API Analytics ###
1. API Management analytics
	1. Learning Objectives:
		1. Why do we need API Analytics
		2. Types of API analytics (API Management platform)
		3. Demo: Apigee and Mulesoft for API analytics
2. Why gather API analytics?
	1. Service improvement: We can understand APIs better, usage of APIs, align with the needs of the API consumers
	2. Catch errors: public users may be causing, error rate and nature of errors
	3. Understand threats/attacks
	4. Business support: business analytics can be captured by introspecting data flowing through the API
		1. Insight to business - how transactions are invoked by 3rd party applications or internal applications
3. Analytics types:
	1. Metrics
		1. Error rate
		2. Response time
		3. Throughput
	2. Visibility
		1. Into usage of the API
		2. Into transactions
4. Metrics:
	1. Performance
		1. Response time
		2. Throughput
		3. Peaks/Valleys
	2. Error rates
		1. API errors - implementation throwing errors
		2. Backend errors
		3. Policy errors
			1. How many calls are failing because of violation of quota or rate limit or spike arrest
				1. May need to increase
	3. SLA metrics - if we are providing the promised SLA or if they are sticking to the SLA on their end
		1. Calls/ time
		2. Response
5. Visibility
	1. Usage analytics
		1. Most active App developer subscribed to the APIs
		2. Which APIs are popular
		3. Region based: Which regions are invoking
		4. Device types: from which devices are APIs getting invoked
	2. Transactions - Most API management platforms do not support this
		1. Specific to the business
		2. Logic for transactional analytics should be build in the proxy
	3. Exaples:
		1. Origin of maximum sales?
			1. Credit card data is used for this
6. Apigee Dashboard:
	1. Graphs - hourly/daily, error rate, test reports

### API Product and API Monetization ###
1. Learning Objectives:
	1. API = Product (API is a product)
	2. Monetization models & technology (for rolling out APIs)
2. Product: "A Product is anything that can be offered to a market that might satisfy the need or want of the customer"
	1. Example: App developers want to build advanced communication features
		1. twilio - offer advanced comm apis to integrate
			1. Video conferencing
			2. SMS Texting
			3. Chatting
	2. AWS: Fulfull infrastructure needs of organizations
		1. API is the product
	3. Capital One DevExchange - Brand recognition, indirect revenue (marketing aspect)
3. Treating API as product
	1. To release new model of a car:
		1. Product lifecycle
			1. **Business case** to justify the need for a new model and how will company make money by releasing the new model
			2. Carry out research - who are the target customers for the new model and what are their needs and wants
			3. Construct: Gather resources and team to build the model
			4. Marketing: New car model must be marketed to the targetted segment as much as possible
			5. Launch/Post Launch Support
	2. API:
		1. **Buiness case**: Why does the organization need the new API?
			1. New revenue?
			2. Brand awareness?
			3. Partnership?
		2. **Research**:
			1. Who are the consumers going to be?
			2. What are their needs and wants?
			3. Why would they use the API?
				1. What incentives are provided by using the API?
		3. **Construction**:
			1. Delivery/Planning
			2. Pilot - to ensure that we are moving in the right direction
		4. **Marketing**:
			1. How will consumers know about the API
				1. Generate buzz with events - hackathons
				2. Promote - blogging, press release, paid advertisement
		5. **Launch/ Post Launch**:
			1. Launch - cool apps using the API and release it to open source
			2. Post Launch - how to support app developers using the API
4. Data & Services are usually exposed as APIs
	1. Can be sold to developers (direct or indirect revenue)
		1. Direct:
			1. Salesforce
			2. Amazon
		2. Indirect: (revenue when service is sold or merchendize is sold)
			1. CapitalOne
			2. Best Buy
5. Monetization models:
	1. Free model:
		1. API provider offers their API for free to dev community
			1. Facebook
			2. Twitter
			3. LinkedIn
		2. Used to expand their reach
			1. Brand recognition
	2. Freemium model:
		1. Tier model
			1. Free tier: Developers can use it for free
			2. Paid tier: Developers can switch to this any time
		2. Example: Google maps, IBM watson, Apigee
	3. Enterprise pays:
		1. Organization pays the developer to use the model
			1. Amazon Associates - developers who are using their APIs to sell their amazon products
				1. Amazon pays them if they are able to sell through their apps
				2. Ebay, Expedia
		2. Developer pays:
			1. Developer is paying the API provider organization for their use of the API
				1. Pay as you go
					1. Amazon web services - monthly statement
				2. Subscription:
					1. License fee model - for certain number of users or certain number of licenses
				3. Transaction:
					1. Developer pays per transaction
						1. PayPal
						2. Strike
6. Technology Considerations:
	1. Tiered Product Definitions
		1. API management tools support product definitions and plans
	2. Usage Metering:
		1. How would you measure the usage of the APIs by specific developers
	3. Subscription management
		1. Make sure no overages and ways to handle overages
	4. Reporting
		1. Reports generated for the business and consumers of the API
	5. Indirect revenue model:
		1. Partner management - track partners and track revenues generated by partners
7. API management platforms sell the above as add-on models for monetization
8. Summary:
	1. Treat API as a product
	2. Monetization about business + technology
		1. Decide on a business model
		2. Technology considerations to support the business model

## Good Bye & All the Best ##
### Good bye ###
1. Topics:
	1. REST API Foundation
		1. REST API constraints
	2. Design Best Practices
		1. Pagination
		2. Partial responses
		3. Error handling
		4. Best practices
		5. (Practice and build APIs and share it with peers)
	3. Security
		1. Hackers can exploit vulnerabilities
		2. Testing
			1. Functional attacks are real
			2. Use standard security schemes
				1. Spotify
				2. OWASP
	4. Swagger/OAI
		1. Vendor community support
	5. API Management
	6. Business
		1. Monetization models
			1. Technology experts should educate business