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

### Pet Clinic on Swagger Editor ###
### OpenAPI 2.0 vs 3.0 ###
### YAML Crash Course ###

## Defining a Microservice with OpenAPI ##
### Introduction ###
### Swagger Hub ###
### OpenAPI Specification ###
### OpenAPI Info Object ###
### OpenAPI Servers Object ###
### Assignment 1: Assignment - Add Servers ###
### OpenAPI Paths Object ###
### Assignment 2: Assignment - List Beers ###

## OpenAPI Schema ##
### Introduction ###
### JSON Schema ###
### OpenAPI Data Types ###
### OpenAPI Objects ###
### OpenAPI Enums ###
### Assignment 3: Assignment - Improve List Beer Response ###

## OpenAPI Components ##
### Introduction ###
### OpenAPI Components Object ###
### Constructing Reusable Customer Object ###
### Assignment 4: Assignment - Construct Reusable Beer Object ###
### OpenAPI Object Inheritance ###
### Assignment 5: Assignment - Update Beer Object to use Inheritance ###

## OpenAPI Parameters ##
### Introduction ###
### OpenAPI Parameter Object ###
### Describing Query Parameters ###
### Assignment 6: Assignment - Add Query Parameters for Beer ###
### Assignment 7: Challenge - Parameter Components ###
### Describing URL Parameters ###
### Assignment 8: Assignment - Add URL Parameters for Beer Operations ###

## OpenAPI Requests ##
### Introduction ###
### OpenAPI Operation Summeries and Descriptions ###
### OpenAPI Operation Tags ###
### OpenAPI Opeartion Id ###
### Describing RESTFul Create ###
### Describe Response Headers ###
### Read Only Properties ###
### Assignment 9: Assignment - Construct Beer Resource ###
### Assignment 10: Assignment - Update Beer Resource ###
### Describing RESTFul Delete ###
### Assignment 11: Assignment - Delete Beer Resource ###
### Describing Additional Responses ###
### Assignment 12: Assignment - Additional Responses ###
### OpenAPI Callabacks ###

## OpenAPI Security Definitions ##
### Introduction ###
### OpenAPI Security Scheme ###
### Basic Auth with OpenAPI ###
### JWT Bearer Token Auth ###
### Anonymous Authentication with OpenAPI ###

## OpenAPI Code Gen ##
### Introduction ###
### OpenAPI Code Gen ###
### OpenAPI Generated Java Client ###
### OpenAPI Generated Java Server ###
### Conclusion ###