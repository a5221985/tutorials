# Open API Beginner to Guru #
## OpenAPI Introduction ##
### Welcome ###
1. OpenAPI specifications

### Meet Your Instructor ###
1. springframeworkguru.com
2. Spring REST Docs
	1. Not comparable to OpenAPI
3. Why use OpenAPI?

### Getting the Most out of Your OpenAPI Course ###
1. Tips
	1. Take the time to complete the course!
		1. Many people never start
		2. Many start, but never finish
		3. To get the most of the course, you need to take the course!
		4. Pro-Tip: Plan time on your calendar. Make a meeting for yourself!
	2. Do quizzes
	3. Do the assignments
		1. Yet get a lot of benefit in learning from doing the coding exercises
			1. Proven in education research
2. Swagger Hub
	1. Swagger Hub is used in the course
		1. Commercial Product - but free to use
		2. Is not the focus of this course
3. Swagger Hub Alternatives
	1. Visual Studio Code
		1. Free to download and use
		2. Look for OpenAPI Plugins - will help
	2. IntelliJ - free community edition
		1. Open API plugins
	3. Any text editor will work fine
		1. Notepad, Text Wranger, Sublime Text
	4. DO NOT USE WORD or other word processing programs
4. Slack Community
	1. As a student in this course, you can request access to Spring Framework Guru's Slack Community
	2. Get your access to a Slack channel exclusive to students of this course
	3. Get help with the course, your projects, share something cool you are working on
	4. Or just say Hi!
	5. See Module in Section one for Instructions on How to join!
5. Join Slack - ask questions, or just say Hi!

### Slack Group for OpenAPI: Beginner to Guru ###
1. Slack channel - private and exclusive to students enrolled this course!
2. Teacher answering questions
3. TAs answering questions
4. Uses:
	1. Get help with the course
	2. Help others with problems they are having
	3. Share Spring Framework news, tips, and tricks
	4. See how others are using the Spring Framework
	5. Or just say Hi!

## Overview of OpenAPI ##
### Introduction ###
1. OpenAPI
2. Terminology
3. HTTP and RESTFul APIs
4. Technologies
5. Services with OpenAPI specs using YAML
6. Schema, Data Types
7. Re-usable components
8. Using OpenAPI Specs and Technologies

### What is an API? ###
1. API: Application Programming Interface
	1. API is broad term - covering a wide range of meanings
2. Application: Computer application
	1. Web site, Mobile application, any computer program
3. Programming: Instructions to complete a task
4. Interface: A point where two systems meet and interact
5. An API is a method for two computer applications to speak to each other
	1. Conversation
	2. Invoking action
6. APIs come in many flavors
7. Clicking on a link in an email message is executing an API
	1. Tells your device to open the web browser and go to this website
	2. This action is performed via an API
8. Some APIs are very technology specific - considered CLOSED
	1. For example on a mobile device where one application opens another
		1. Low level - needs OS calls may be
9. Others adopt broadly accepted standards - considered OPEN
10. APIs allow the internet to function as we know it
11. For example - searching Google for a term
	1. Your web browser does an HTTP POST of the search term to Google's servers
	2. Googles servers understand the HTTP POST and respond back with an HTML document
	3. Your web browser understands HTML - this is the language to describe the results web page
12. APIs in this course:
	1. This course will focus on the type of APIs used in web development
	2. These API follow Open Standards and are widely used
	3. These types of APIs are often referred to as Web Services
	4. Two primary types of Web Services are
		1. SOAP - older legacy systems (insurance, finance)
		2. RESTful - modern adoption, widely used
	5. Course will focus on RESTful Web Services
13. RESTful Web Services
	1. Popular because of their simplicity and versatility, RESTful web services have become the de facto standard for web services.
	2. REST - Representational State Transfer
		1. Representation - Typically JSON or XML
		2. State Transfer - Typically via HTTP
		3. Established by Roy Fielding from his 2000 doctoral dissertation
14. RESTful Terminology
	1. Verbs - HTTP Methods: GET, PUT, POST, DELETE
	2. Messages - payload of the action (JSON/XML)
	3. URI - Uniform Resource Identifier
		1. A unique string identifying a resource
	4. URL - Uniform Resource Locator
		1. A URI with network information - http://www.example.com
	5. Idempotence - 
		1. Wikipedia "Idempotence is the property of certain operations in mathematics and computer science that they can be applied multiple times without changing the result beyond the initial application"
			1. The operation can be exercised multiple times - without chaning the result
			2. Example - Refreshing web page (HTTP GET operation)
	6. Stateless - Service does not maintain any client state
	7. HATEOAS - Hypermedia As The Engine of Application State
		1. Wikipedia - "A REST client should then be able to use server-provided links dynamically to discover all the available actions and resources it needs. As access proceeds, the server responds with text that includes hyperlinks to other actions that are currently available."
15. HTTP - GET
	1. Use: To read data from resource
	2. Read only
	3. Idempotent
	4. Safe operation - does not change state of resource
16. HTTP - PUT
	1. Use: to insert (if not found) or update (if found)
	2. Idempotent - Multiple PUTs will not change result
17. HTTP - POST
	1. Use: to construct new object (insert)
	2. Non-Idempotent - Multiple POSTs is expected to construct multiple objects
	3. Not Safe operation - does chnage state of resource (on server)
	4. Only Non-Idempotent, Non-Safe HTTP verb
18. HTTP - DELETE
	1. Use: to delete an object (resource)
	2. Idempotent - Multiple DELETEs will have same effect/ behavior
	3. Not Safe operation - does change state of resource

### HTTP Protocol ###
1. Development of HTTP was started by Tim Berners-Lee of CERN in 1989
2. HTTP/0.9 is the Original HTTP proposal by Tim Berners-Lee
3. Started as a telnet friendly protocol
	1. HTTP History
		1. `telnet google.com 80`
			1. `GET /about/`

					(hypertext response)
					(connection closed)
					
4. HTTP/1.0 - From 1991 to 1995 the HTTP/HTML specifications grew rapidly
5. New software known as a "web browser" emerged
6. HTTP standards were developed by:
	1. IETF - Internet Engineering Task Force
	2. W3C - World Wide Web Consortium
7. HTTP/1.0

		telnet website.org 80
		
		Connected to xxx.xxx.xxx.xxx
		
		GET /rfc/rfc1845.txt HTTP/1.0
		User-Agent: CERN-.../2.35 lib.../2.17...
		Accept: */*
		
		HTTP/1.0 200 OK
		Content-Type: text/plain
		Content-Length: ...
		Expires: ...
		Last-Modified: ...
		Server: ...
		
		(plain-text response)
		(connection closed)
		
8. HTTP/1.1 - Originally released in 1997
	1. Solved a lot of ambiguities from earlier versions
	2. Added support for 
		1. keep alive connections
		2. chunked encoding transfers
		3. byte-range requests
		4. transfer encodings
		5. request pipelining
9. HTTP/1.1 - Updated by RFC 2616 in 1999 (Still used)
10. Updated again by RFC 7230 in 2014
	1. Still in use today
	2. Example:

			GET /index.html HTTP/1.1
			...
			Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.3
			Cookie: __qca=P0-.... (snip)
			
11. HTTP/2.0 Standardized in 2015
12. Supported by most servers and browsers by the end of 2015
13. As of May 2017, only 13.7% of the top 10 Million websites supported HTTP/2.0
14. Has high level of compatibility with HTTP/1.1
15. Features:
	1. Transport Performance was a focus of HTTP/2.0
	2. Improves page load speed by:
		1. Lower latency
		2. Higher Throughput
	3. Differences from HTTP/1.1 are largely transparent for web developers
		1. Usage is going to be same (but lower level)

### HTTP Request Methods ###
1. Request methods, also known as verbs, are used to indicate the desired action to be performed
	1. GET - is a request for a resource (html file, javascript file, image, etc)
	2. GET - is used when you visit a website
	3. HEAD - is like GET, but only asks for meta information about the body
	4. POST - is used to post data to the server
		1. Post form data to the server (like a checkout form)
	5. PUT - is a request for the enclosed entity be stored at the supplied URI. If the entity exists, it is expected to be updated
	6. POST - is a construct request
	7. PUT - is construct or update request
	8. DELETE - is a request to delete the specified resource
	9. TRACE - Will echo the received request. Can be used to see if request was altered by intermediate servers
	10. OPTIONS - Returns the HTTP methods supported by the server for the specified URL
	11. CONNECT - Converts the request to a transparent TCP/IP tunnel, typically for HTTPS through an unenecrypted HTTP proxy
	12. PATCH - Applies partial modifications to the specified resource
2. Safe Methods
	1. Safe methods are considered safe to use because they only fetch info and do not cause changes to server
	2. Safe methods are: GET, HEAD, OPTIONS, TRACE
3. Idempotent Methods
	1. Idempotence - A quality of an action such that repetitions of the action have no further effect on the outcome
	2. PUT and DELETE are idempotent methods
	3. Safe methods (GET, HEAD, TRACE, OPTIONS) are also idempotent
	4. Being truly idempotent is not enforced by the protocol
4. Non-Idempotent methods
	1. POST is not idempotent
	2. Multiple posts are likely to construct multiple resources
	3. There are websites which ask you to click submit only once
5. HTTP Status Codes
	1. 100 series are informational in nature
	2. 200 series indicate successful request
	3. 300 series are redirections
	4. 400 series are client errors
	5. 500 series are server side errors
6. Common HTTP Status Codes
	1. 200 Okay; 201 Created; 204 Accepted (background processing must occur)
	2. 301 Moved permanently (different URI)
	3. 400 Bad request (malformed data); 401 Not Authorized (resource has not been supplied or do not have security credentials to access)
	4. 404 Not Found (server was not able to find the resource)
	5. 500 Internal Server error (server code and not related to request), 503 - Service Unavailable (service is temporarily down)

### Why use OpenAPI? ###
1. OpenAPI - Short for OpenAPI Specification
	1. OA3 - for OpenAPI 3.x
2. OpenAPI is widely adopted standard for describing APIs
3. Strong industry support for OpenAPI
	1. Microsoft, Google, IBM
4. OpenAPI is considered technology agnostic
	1. Java, .NET, PHP, Ruby, etc - can all benefit from OpenAPI
5. OpenAPI Specifications are defined in YAML or JSON
	1. YAML - lighter
	2. JSON - more structured
6. The OpenAPI Specification is backed by a formal schema
	1. Defines document's properties and data types
		1. Sections
		2. Propeties
		3. Data types
7. OpenAPI is a structured document
	1. It can be read programmatically
8. OpenAPI Tools - Converters, Validators, GUI Editors, Mock Services, SDK Generators, Documentation
9. OpenAPI CodeGen - To generate server code for 20+ languages; Client code for 40+ languages
	1. Templates
10. The OpenAPI Specification becomes the single source of truth for what the API is supposed to do.
11. Without OpenAPI - what defines the API?
	1. Source code?
	2. Design documentation or wiki?
	3. Unit tests?
	4. Email messages between developers?
12. OpenAPI Spec is the source of truth and we code to the specification
13. OpenAPI at Velo Payments
	1. Microservices define API via OpenAPI Specification
	2. Unit Tests use OpenAPI to validate all requests and responses
		1. Tests are run locally and during CI/CD
	3. Consumer Driven Contracts defined in OpenAPI extensions
	4. Client side SDKs published in ~8 languages using OpenAPI generated code
	5. Public documentation generated from OpenAPI specification

### Pet Clinic on Swagger Editor ###
1. Different sections are considered as objects and it has properties

		info:
			version: 1.0.0
			title: Swagger Petstore
			licens:
				name: MIT
				
	1. Operations object

			/pets:
				get:
					summary: list all pets
					operationId: listPets
					tags:
						- pets
					parameters:
						- name: limit

### OpenAPI 2.0 vs 3.0 ###
1. 3.0 - widely adopted (course focus)
	1. Components are more re-usable
	2. Standerdized

### YAML Crash Course ###
1. Used to define open api specs
2. learnxinyminutes.com
3. `---` document start
4. `#` comments
5. `key: value` - values can be string or number
6. `|` - multiline text
7. Nesting:

		a_nested_map:
			key: value
			another_key: Another Value
			...
			
8. Sequences: arrays

		a_sequence:
			- Item 1
			- Item 2
			- ...

9. IntelliJ
	1. src/main/java/resources/temp.yaml (or yml)

			# This is a comment
			
			somekey: value
			
			somekey2: value # This is another comment
			
			myObject: 
				stringProperty: asdf asdf asdf
				numberProperty: 123
				listProperty:
					- val 1
					- val 2
					- val 3
					- myObj2:
						val22: asdf
						val44: asdfasdfadf
						
		1. Spacing - be careful (odd issues may occur)

## Defining a Microservice with OpenAPI ##
### Introduction ###
1. Defining operations. From scratch
2. Major components
3. Data structures: Schema
4. Re-usable components
5. Open-API parameters
6. Query params, headers, cookies
7. Building open-api spec

### Swagger Hub ###
1. SwaggerHub - swagger - smart bear's
	1. Predecessor to OpenAPI
2. Sign up for free
	1. Optional
	2. Create New > API
	3. Version: 3.0
	4. Non Template
	5. Name: openapicourse
	6. Version: 1.0
	7. Title OpenAPI Course
	8. Owner: springframeworkguru
	9. Visibility: Public
	10. Auto Mock API: OFF
	11. Create API
3. Swagger hub editor:
	
		description: Specification for ApenAPI Course
		path: {}

### OpenAPI Specification ###
1. Github: examples: v3.0
		1. Tools
		2. Documentation
			1. Redoc
		3. Server and client implementations
		4. Code generators
		5. JSON Schema of OpenAPI
	2. OpenAPI-Documentation
		1. Dev guidelines
		2. Schema Spec
			1. Single source of truth

### OpenAPI Info Object ###
1. OpenAPI 3.0
	1. OpenAPI Object
		1. openapi: string
		2. info: Info Object
		3. servers: [server-object]
2. Example:

		openapi: 3.0.2
		info:
			version: '1.0'
			title: 'OpenAPI Course'
			description: Specification for OpenAPI Course
			termsOfService: http://example.com/terms/
			contact:
				name: John Thompton
				url: https://springframework.guru
				email: john@springframework.guru
			license: 
				name: Apache 2.0
				url: https://www.apache.org/licenses/LICENSE-2.0.html
		paths: {}
			

### OpenAPI Servers Object ###
1. It is optional property
2. Gives end users info about where API is available
3. Example:
	1. Variables? optional

			servers:
				- url: https://dev.example.com
				  description: Development Server
			path: {}
			
		1. Handy, people can use the URL to exercise the API

### Assignment 1: Assignment - Add Servers ###
### OpenAPI Paths Object ###
1. Can be empty
2. Holds array of path item objects
3. Example:

		/pets/{petId}
		/pets/mine
		
	1. Path item object:
		1. Verb operations: get, put post, ...
			1. `get`:
				1. fields:
					1. responses:
						1. description
						2. headers
						3. content
						4. links
4. Version 1:

		paths:
			/v1/customers:
				get:
					responses:
						'200':
							description: List of Customers
				put:
					responses:
						'200':
							description: List of Customers

### Assignment 2: Assignment - List Beers ###

## OpenAPI Schema ##
### Introduction ###
### JSON Schema ###
1. Understanding JSON schema - 2009 (still in draft status)
2. OpenAPI needs data types
	1. Uses JSON schema
		1. OpenAPI extends JSON schema
3. Example:
	1. string:
		1. min length
		2. max length
		3. regular expressions
		4. format - datetime, time, email addresses, hostname
		5. JSON Pointer
	2. Integer:
	3. Ranges
		1. Min
		2. Max
	4. Object
		1. Properties
			1. it is number or string
			2. enumerations
	5. Array
		1. It is a list of Items
		2. Validation
	6. All of: Inherit all properties
	7. Not of: ...

### OpenAPI Data Types ###
1. Integer - int32, int64
2. Number - float, double
3. string - 
4. string - byte (base64 encoded characters)
5. string binary (octets)
6. boolean
7. string - date
8. string - date-time
9. string - password
10. Extensible by properties
	1. url
	2. ...
11. Schema object
	1. Reference to JSON schema
	2. Properties
		1. Overlap with JSON schema (but definitions are adjusted)
12. Subset fields:
	1. nullable
	2. readOnly (not sent in request)
	3. writeOnly
	4. deprecated
13. Example:

		...
		content:
			application/json:
				schema:
					type: array
					minItems: 1
					maxItems: 100
					items:
						type: string
						description: Customer Name
						minLength: 2
						maxLength: 100

### OpenAPI Objects ###
1. Example:

		description: List of Customers
		items:
			type: object
			description: customer object
			properties: 
				id:
					type: string
					format: uuid
				firstName: 
					type: string
					minLength: 2
					maxLength: 100
					example: John
				lastName:
					type: string
					minLength: 2
					maxLength: 100
					example: Thompson
				address:
					type: object
					properties:
						line1:
							type: string
							example: 123 main
						city:
							type: string
							example: St Pete
						zipCode:
							type: string
							example: 33701	

### OpenAPI Enums ###
1. Example:

		stateCode:
			type: string
			minLength: 2
			maxLength: 2
			description: 2 Letter state code
			# enum: [AL, AK, AZ, AR, CA] # one way
			enum:
				- AL
				- AK
				- AZ
				- AR
				- CA

	1. same data type needs to be used

### Assignment 3: Assignment - Improve List Beer Response ###

## OpenAPI Components ##
### Introduction ###
1. Saves coding time
2. Re-usable

### OpenAPI Components Object ###
1. components
	1. schemas: map of schema objects
		1. To define common objects (several endpoints can use them)
		2. A reference is used instead

				{
					"$ref": "#/components/schemas/Pet" # Looks for map object
				}
				
				{
					"$ref": "Pet.yaml" # file lookup - can also give fully qualified urls (remove objects)
				}
		
	2. responses
	3. parameters
	4. examples
	5. requestBodies
	6. headers
	7. securitySchemes
	8. links
	9. callbacks

### Constructing Reusable Customer Object ###
1. Example:

		...
		address:
			$ref: "#/components/schemas/Address"

		components:
			schemas:
				Address: # just a convention used in Java
					...
					stateCode:
						type: string
						minLength: 2
						maxLength: 2
						description: 2 Letter state code
						# enum: [AL, AK, AZ, AR, CA] # one way
						enum:
							- AL
							- AK
							- AZ
							- AR
							- CA
				Customer:
					...
					address:
						$ref: "#/components/schemas/Address"
				CustomerList:
					type: array
					minItems: 2
					maxItems: 100
					description: List of Customers
					items:
						$ref: "#/components/schemas/Customer"
						
		...
		items:
			$ref: "#/components/schemas/Customer"
			
		...
		schema:
			$ref: "#/components/schemas/CustomerList"
			
	1. Components can be shared
		1. Bill to address
		2. Ship to address

### Assignment 4: Assignment - Construct Reusable Beer Object ###
### OpenAPI Object Inheritance ###
1. Allows us to inherit some properties from an object
2. Example:

		ItemPagedList:
			type: object
			allOf:
				- $ref: "#/components/schemas/PagedResponse" # inheritance
			properties:
				content:
					$ref: "#/components/schemas/ItemList"
		PagedResponse:
			type: object
			properties:
				type: object
				properties:
					sort:
						type: object
						properties:
							sorted:
								type: boolean
							unsorted:
								type: boolean
					offset:
						type: integer
						format: int32
					pageSize:
						type: integer
						format: int32
					paged:
						type: boolean
					unpaged:
						type: boolean
				totalPages:
					type: integer
					format: int32

### Assignment 5: Assignment - Update Beer Object to use Inheritance ###

## OpenAPI Parameters ##
### Introduction ###
1. OpenAPI: Higher code qaility and less code
2. Parameters
	1. Request params
	2. Query params
	3. Path params
	4. Headers
	5. Cookies
3. Reuse parameter components
4. Request and response

### OpenAPI Parameter Object ###
1. Path parameters
	1. `/items/{itemId}`
2. Query parameters
	1. `/items?id=###`
3. Header
4. Cookie
5. Properties:
	1. name
	2. in: "query", "header", "path", "cookies"
	3. description
	4. required: path param: true, query: true or false
	5. decrecated
	6. allowEmptyValue: likely to be removed in later version
6. Serialization properties:
	1. style
	2. exclude
	3. allowReserved
	4. schema
	5. example
	6. examples
7. Complex:
	1. Content

### Describing Query Parameters ###
1. Page information: page number, page size
2. example:

		paths:
			/v1/customers:
				get:
					parameters: # This is list of parameters
						- name: pageNumber
						  in: query
						  description: Page Number
						  schema:
						  	type: integer
						  	format: int32
						  	default: 1
						- name: pageSize
						  in: query
						  description: Page Size
						  required: false
						  schema:
						  	type: integer
						  	format: int32
						  	default: 25

### Assignment 6: Assignment - Add Query Parameters for Beer ###
### Assignment 7: Challenge - Parameter Components ###
### Describing URL Parameters ###
1. Path Parameters:
2. Example:

		paths:
			...
			/v1/customers/{customerId}:
				get:
					parameters:
						- name: customerId
						  in: path
						  description: Customer Id
						  required: true
						  schema:
						  	type: string
						  	format: uuid
					responses:
						'200':
							description: Found Customer
							content:
								application/json:
									schema:
										$ref: "#/components/schemas/Customer"

### Assignment 8: Assignment - Add URL Parameters for Beer Operations ###

## OpenAPI Requests ##
### Introduction ###
1. Requests
2. HTTP methods and definitions
3. Request bodies
4. Response bodies
5. Response codes
6. Generating code

### OpenAPI Operation Summeries and Descriptions ###
1. Properties:

		/v1/customers:
			get:
				summary: List Customers
				description: Get a list of customers in the system
				...
				
		/v1/customers/{customerId}:
			get:
				summary: Get Customer By ID
				description: Get a single **Customer** by its Id value # rich using markdown

### OpenAPI Operation Tags ###
1. Groupings:
	1. Example:

			/v1/customers:
				get:
					..
					tags:
						- Customers
					..
			/v1/customers/{customerId}:
				get:
					..
					tags:
						- Customers
			/v1/items:
				get:
					..
					tags:
						- Items
			/v1/items{itemId}:
				get:
					..
					tags:
						- Items

		1. We can have more than one tag
		2. We can use tagging strategies

				tags:
					- Items
					- V1 Items

### OpenAPI Operation Id ###
1. `operationId` - unique string to identify the operation (among all)
	1. Optional
	2. Code generation tools identify this as a unique operation
2. Java conventions:
	1. Example:

			/v1/customers:
				get:
					summary: List Customers
					description: Get a list of customers in the system
					tags:
						...
					operationId: listCustomersV1 # visual q v1

### Describing RESTFul Create ###
1. Example: 

		/v1/customers:
		...
			post:
				summary: New Customer
				description: Creation of new customer
				tags:
					- Customers
				requestBody:
					required: true
					content: 
						application/json:
							schema:
								$ref: "#/components/schemas/Customer"

### Describe Response Headers ###
1. Example:

		/v1/customers:
		...
			post:
				summary: New Customer
				description: Creation of new customer
				tags:
					- Customers
				requestBody:
					required: true
					content: 
						application/json:
							schema:
								$ref: "#/components/schemas/Customer"
				responses:
					'201':
						description: Customer created
						headers: # headers returned
							Location: 
								description: Location of the created customer
								schema:
									type: string
									format: uri
									example: http://example.com/v1/customers/{assignedIdValue}

### Read Only Properties ###
1. Example: id genereation is on server side
	1. OpenAPI spec: properties
		1. Fixed fields:
			1. `readOnly` - should be not sent as part of request and is only provided in response
			2. `writeOnly` - opposite - example: password
2. Example:

		Customer:
			...
			properties:
				id:
					...
					readOnly: true  # if set, it is ignored

### Assignment 9: Assignment - Construct Beer Resource ###
### Assignment 10: Assignment - Update Beer Resource ###
### Describing RESTFul Update ###
1. Example:

		put:
			summary: Update customer
			description: Update customer by id.
			tags:
				- Customers
			parameters:
				- $ref: "#/components/parameters/CustomerIdPathParm"
			requestBody:
				required: true
				content:
					application/json:
						schema:
							$ref: "#/components/schemas/Customer"
			responses:
				'204':
					description: Customer updated
		...
		components:
			parameters:
				CustomerIdPathParm:
					- name: customerId
					  in: path
					  description: Customer Id
					  required: true
			
### Describing RESTFul Delete ###
1. Example:

		/v1/customers/{customerId}:
			...
			delete:
				summary: Delete customer by Id
				description: Delte a customer by its Id value
				tags:
					- Customers
				operationsId: delteCustomerV1
				parameters:
					- $ref: "#/components/parameters/CustomerIdPathParm"
				response:
					'200':
						description: Customer delete

### Assignment 11: Assignment - Delete Beer Resource ###
### Describing Additional Responses ###
1. Error responses:

		responses:
			...
			'400':
				description: Bad request
			'409':
				description: Conflict
		...
		responses:
			...
			'404':
				description: Not found
			'400':
				description: bad request
			'409':
				description: Conflict

### Assignment 12: Assignment - Additional Responses ###
### OpenAPI Callbacks ###
1. Callback Object
2. [swagger.io/docs/specification/callbacks/](swagger.io/docs/specification/callbacks/)
3. Example:

		/v1/customers/{customerId}/orders:
			...
			post:
				...
				callbacks:
					orderStatusChange:
						'${request.body#/orderStatusCallbackUrl}':
							description: Webhook for order status change notifications
							post:
								requestBody:
									content:
										application/json:
											schema:
												type: object
												properties:
													orderId:
														type: string
														format: uuid
													orderStatus:
														type: string
																				responses:
																					'200':
																						description: Okay
													1. On order status change, the callback is invoked which is a webhook to send notifications
													2. A body is also passed to the callback				

## OpenAPI Security Definitions ##
### Introduction ###
1. Security options

### OpenAPI Security Scheme ###
1. Specification:
	1. Fields and properties
	2. Many security schemes are supported
	3. Fields:
		1. type
		2. description
		3. name
		4. in
		5. scheme
		6. bearer
2. [swagger.io/docs/specification/authentication/](swagger.io/docs/specification/authentication/)
	1. Better docs
3. Security scheme:
	1. http
	2. apiKey
	3. oauth2
	4. openIdConnect
4. Definition:

		coponents:
			securitySchemes:
			
				BasicAuth:
					type: http
					scheme: basic
					
				BearerAuth:
					type: http
					scheme: bearer
					
				...
				
5. Applying security:

		security:
			- ApiKeyAuth: []
			- OAuth2:
				- read
				- write

	1. Property at root level (security)
	2. Applied to entire OpenAPI doc
		1. This can be overridden at operation level
			1. Check docs
6. Take away:
	1. Two step process:
		1. Define security scheme
		2. Apply
			1. Global
			2. Local
7. Scopes
	1. Like roles
		1. OAuth2
		2. OpenID Connect
	2. Some organizations use and some don't
	3. `BasicAuth: []` - odd!
	4. Read scope, write scope

### Basic Auth with OpenAPI ###
1. Setup of Basic Auth

		security: # All endpoints
			- BasicAuth: []
		components:
			securitySchemes:
				BasicAuth:
					type: http
					scheme: basic
					
2. Swagger UI:
	1. Click Authorize
		1. Can provide username and password

### JWT Bearer Token Auth ###
1. Example:

		security:
			...
			- JwtAuthToken: []
		components:
			seuritySchemes:
				...
				JwtAuthToken:
					type: http
					scheme: bearer
					bearerFormat: JWT
					
2. Swagger UI:
	1. Click Authorize

### Anonymous Authentication with OpenAPI ###
1. Operation security:

		paths:
			/v1/customers:
				get:
					...
				security: [] # do not need security - overrides spec level security
				
			/b1/customers/{customerId}:
				get:
					...
				security: []
				
2. Third party tools may not work with empty array as defined perviously

## OpenAPI Code Gen ##
### Introduction ###
1. Standards can be defined in OpenAPI itself
2. Final section:
	1. Code generation
		1. Tooling overview
			1. Node
			2. NPM
			3. Docker
			4. Maven
			5. Gradle
			6. ...
		2. Swagger Hub
			1. Code generation
				1. Java Client
				2. Server Stub
					1. Spring framework
				3. C# - not here
3. Other operations:
	1. Server side mocks
	2. Client side mocks
	3. Rich documentation

### OpenAPI Code Gen ###
1. [openapi-generator.tech](openapi-generator.tech)
1. Options:
	1. Clients
	2. Servers
	3. Schemas
	4. Docs
5. With Maven, Gradle, Docker, NPM, Homebrew
6. Generators
	1. Client generators
	2. Server generators
	3. Documentation generators
7. Each generator is configurable

### OpenAPI Generated Java Client ###
1. Specifications:
	1. Swagger Hub (can change anytime)
		1. Export > Download API
			1. YAML Resolved
		2. Export > Client SDK
			1. Only subset is available
				1. Java
2. Open the project in IntelliJ
	1. Has java code to call the APIs
3. Has authentication
4. It has tests to run the APIs
	1. Stubs

### OpenAPI Generated Java Server ###
1. Export > Server Stub > Spring
2. Open the project in IntelliJ
	1. We only have Maven POM (Not Gradle)
3. On server side:
	1. V1ApiController

### Conclusion ###
1. Done