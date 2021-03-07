# Microservices Architecture - The Complete Guide #

## Welcome ##
### Course Introduction ###
1. Architecture pattern that needs to be handled carefully
2. Why Microservices?
	1. The most popular architecture paradigm
		1. We need to design robust architecture based on this paradigm
	2. Not Tied to Specific Technology
		1. Can be implemented using any platform
			1. Java
			2. Python
			3. NodeJs
			4. .Net
			5. PHP
			6. ...
	3. Solves Real Problems
		1. Specific problems
			1. Dev team stumbles upon in almost every project
		2. Effectiveness of microservices architecture is measurable and can be quantified
	4. In High Demand in the Job Market
		1. A lot of jobs demanding this skill in Monster
	5. Generates a Lot of Buzz...
		1. Trend
3. Companies that implemented it
	1. Netflix - one of the first
	2. Facebook
	3. Amazon
	4. Uber
	5. Ebay
4. Microservices architecture must be handled carefully and thought out carefully
	1. It cannot be used everywhere
5. Quote:

		If microservices are implemented incorrectly or used as a band-aid without addressing some of the root flaws in your system, you'll be unable to do new product development because you're drowning in the complexity - Alexandra Noonan, Engineer, Segment
		
	1. Abandoned it completely after 2 years - too much wastage of money
6. Microservices Architecture
	1. You have to know
		1. If moving to us is a good idea to the specific system
		2. How to do it correctly (avoiding many obstacles in the way)
	2. Diving into microservices is never a good idea
7. By the end of the course...
	1. You'll know what microservices architecture is
	2. You'll know what problems it solves
	3. You'll know how to design a robust, scalable, easy to maintain microservices architecture
	4. You'll know when NOT to use microservices architecture
	5. You'll become a much better software architect
8. But That's Not All...
	1. At the end of this course -
		1. Download the Microservices Checklist! (condensed summary of step by step guide)
			1. The ultimate practical, step-by-step guide to help you design great microservices architecture!

### Join The Software Architects Community ###
1. [Software Architects Discussion Facebook Group](https://www.facebook.com/groups/127639125043271/)
	1. Largest Software Architects group in the world
	2. Free to ask questions
	3. Bring up dilemmas
	4. Post interesting links
	5. Announce relevant events
2. [Software Architecture Newsletter](https://memilavi.com/newsletters)
	1. Latest news, reports, articles, trends and recommendations about SA - monthly
	2. Takes only 5 minutes

### Who Is This Course For? ###
1. Some background in software architecture
	1. Architects
	2. Development Background
		1. Developer, Team Leader, Dev Manager, ...
	3. Preferably with some experience
	4. Preferably with Backend Development Experience
	5. Anyone who wants to learn about Microservices architecture

### What We Will Talk About in This Course ###
1. Agenda
	1. Welcome
	2. History of Microservices
		1. it is important - where did we come from
	3. Problems with Monolith & SOA - which led to microservices
	4. Microservices Architecture
		1. 9 factors which are basis for microservices
	5. Problems Solved by Microservices
	6. Designing Microservices Architecture
	7. Deploying Microservices
		1. Not easy
			1. Kubernetes
	8. Testing Microservices
		1. Challenge
	9. Service Mesh
		1. We can make communication much easier
	10. Logging & Monitoring
		1. For success
	11. When Not to Use Microservices
	12. Microservices and the Organization
		1. Whether traditional organizational chart is not suitable for ms and what changes should be made
		2. How as an architect should I help the organiztion in this transition
	13. Anti-Patterns and Common Mistakes
		1. Avoid these
	14. Breaking Monolith to Microservices
		1. Techniques
	15. Case Study
		1. Fictional system - design
	16. Conclusion

## History of Microservices ##
### Introduction ###
1. What was before and why didn't work
	1. Microservicesa are a result of problems with two architecture paradigms
		1. Monolith
		2. SOA

### Monolith ###
1. Monolith architecture
	1. The original architecture - ancerstor of all architecture
	2. There are a lot of monolith apps - not a bad thing
		1. There are situations or scenarios needing it
	3. All software components are executed in a single process
	4. No distribution of any kind
		1. All components share the same threads, compute power, memory, ...
		2. Huge chunk of code happily running along minding it's own business
	5. Strong coupling between all classes - all pieces are tied to together
		1. No network
		2. No common API
	6. Usually implemented as Silo
		1. It is a standalone app
			1. Does not share anything with other apps
				1. Does not expose anything to other apps
					1. Data or functionality
						1. No API
		2. It lives in world of it's own
		3. Keeps data and functionality to itself
	7. Example: HR App
		1. All components are within the process - no distribution
			1. There could be other processes
				1. In-mem database or other db
				2. UI runs on a separate machine
			2. The core of the application is a monolith (most of the work is done here)
	8. Purchasing App
		1. This has to communicate with HR App
			1. Which order is placed by an employee
			2. Who is the boss of the employee placing an order
		2. Not possible with monoliths
			1. No sharing functionality or data
				1. Not easy to overcome this
2. Advantages:
	1. Much easier to design
		1. No queus
		2. No networking
		3. ...
	2. Performant
		1. No serialization or deserialization
		2. Fast

### Service Oriented Architecture ###
1. First coined in 1998
2. Premise - Apps are services exposing functionality to the outside world
	1. It is opposite of monolith
	2. The app is built from ground up with sharing capabilities with well defined API
3. Services expose metadata to declare their functionality
	1. Clients consume the service using the metadata
	2. Usually implemented using SOAP & WSDL
		1. Protocol for web-service
			1. XML document
4. Usually implemented with ESB
	1. Enterprise Service Bus
	2. Family of products
		1. Designed to mediate between clients and services and between services
	3. It claims to provide all of the cross cutting concerns of the SOA based applications
		1. Authorizations
		2. Authentication
		3. Routing
		4. Validation
		5. Monitoring
		6. ...
	4. Turned out to be a huge problem
5. Example: HR Service, Purchasing Service

			SOAP <----------->	SOAP
		HR Service			Purchasing Service
		
6. Client does not talk to any of the services directly
	1. ESB is used
		1. It is a channel between services within an organization
		2. It is the only tool that communicate with services
	2. Client goes to ESB
		1. ESB knows which service the request must be routed to
		2. It needs only to know how to talk to the ESB
			1. Caused a lot of problems
7. SOA Pros
	1. Sharing Data & Functionality between systems
		1. Easy standard platform agnostic way
	2. If we want to retrieve data we just have to look at WSDL documents and construct our own methods for the WSDL
	3. Multitude of tools could automate the process
		1. Even good looking client library for web-applications
		2. Visual Studio .Net - had this capability
	4. Polyglot between services
		1. To avoid platform dependency
		2. Communication between services is done using standard protocol using SOAP and WSDL
			1. Platform didn't matter
				1. Java service could communicate with .Net service
				2. Java service didn't have to know what platform was used by the other service
					1. Key success factor
						1. A corner stone of every distributed service architecture

## Problems with Monolith & SOA ##
### Introduction ###
1. A lot of problems were found in both paradigms
2. Problems relevant to technology, deployment, cost and more
	1. Some of these problems were so accute that it made the SOA disappear
3. Reasons for new architectural pattern
	1. Microservices - closely tied to the solutions to the problems

### Single Technology Platform ###
1. Problems:
	1. Single technology platoform - With monolith, all the components must be developed using the same development platform
		1. Not always the best for the task
			1. Sometimes, it is better to use more platforms for a single application
				1. If we want to leverage specific capabilities of the platform
		2. We can't use specific platform for specific features
			1. If we start with NodeJS - good for handling short web requests
				1. If we have to handle requests (documents) that NodeJs is not good at, we are stuck with it
					1. .Net might be better
		3. Future upgrade is a problem - need to upgrade the whole app
			1. We cannot upgrade specific parts of the application
				1. Much longer process
		4. Example:
			1. If we want to use NodeJS and .Net at the same time
				1. It is not possible

### Inflexible Deployment ###
1. Problems
	1. Inflexible Deployment
		1. With monolith, new deployment is always for the whole app
			1. No way to deploy only part of the app
		2. Even when updating only one component - the whole codebase is deployed
			1. Forces rigorous testing for every deployment
			2. Forces long development cycles
		3. Example: If we fix a bug in a single line of code
			1. It forces us to build and deploy the entire application and test (regression) it thoroughly (1 million lines of code app)
				1. Process may take weeks
		4. Example:
			1. All components need to be tested
				1. Due to strong coupling
					1. If bug has propagated, we need to repeat the cycle

### Inefficient Compute Resources ###
1. Problems:
	1. Inefficient Compute Resources
		1. With monolith, compute resources (CPU and RAM) are divided across all components
			1. Single process that consumes the resources and uses them for all of it's internal components
				1. Not ideal - If a specific component needs more resources - no way to do that
					1. We cannot allocate resources to a specific component
		2. The resources are allocated to the whole monolith
			1. Very inefficient
		3. Example: 4 vCores, 8 GB RAM
			1. If a component requires more compute power due to intensive computations
				1. Increase compute power to whole process
					1. 8 vCores, 16 GB RAM - other components don't need this power

### Large and Complex ###
1. Problems:
	1. Large and complex
		1. With monolith, the codebase is large and complex
			1. A lot of dependencies and coupling
			2. Every little change can affect other components
				1. There is no clear isolation between components
					1. Ensuring that a change in one component will not trickle to other components is not easy
						1. A lot of testing is required and still bugs might slip into production
		2. Very difficult to maintain
			1. Even small change requires a lot of process to take it to production
				1. Side-effect - Developers will start trying their best to not change anything (due to the cost incurred to take the change to production)
					1. This might make the system obsolete very quickly
		3. Example: Single change - bugs, we fix, all tests are run (long and complex process)

### Complicated and Expensive ESB ###
1. Problems: SOA
	1. Complicated and Expensive ESB
		1. With SOA, the ESB is one of the main components
			1. It takes care of 
				1. Routing
				2. Validation
				3. Authentication
				4. Aggregation
				5. ...
		2. It can quickly become bloated and expensive
			1. Oracle and IBM built - very expensive
			2. Complex beasts
				1. Needed dedicated expertise to handle them
					1. Only large organizations with deep pockets could use this
					2. Young and small companies avoided them
		3. Happened because ESB tried to do everything
			1. When single piece of code tries to do everythin, it doesn't end up well
				1. Very difficult to maintain
					1. Companies had to deal with the complexity which was expensive
						1. The complexity and expensee of the middleware (ESB) outweighed the advantages offered by SOA
			2. ESB - was the main problem which led to demise of SOA

### Lack of Tooling ###
1. Problems: SOA
	1. For SOA to be effective, short development cycles were needed
		1. Allow for quick testing and deployment
			1. But no tooling existed to support this
				1. Testing and deployment were manual processes that took a long time
2. Manual SOA based systems took longer than monolith
	1. No time saving was achieved
		1. It took much longer to build and maintain a SOA than a monolith

## Microservices Architecture ##
### Introduction ###
1. History
	1. Problems with monolith and SOA led to a new paradigm
	2. Has to be modular (problem with monolith), with simple API (SOA had complex ESB)
	3. The term "microservices" first appeared in 2011
	4. In 2014 Martin Fowler and James Lewis published their "Microservices" article
		1. They outlined the main attributes of the central architecture
			1. Guidelines
				1. Became the de-facto standard for Microservices definition
					1. https://martinfowler.com/articles/microservices.html
						1. 9 attributes
							1. We can rank
2. 9 Characteristics
	1. Componentization via Services
	2. Organized Around Business Capabilities
	3. Products not Projects
	4. Smart Endpoints and Dumb Pipes
	5. Decentralized Governance
	6. Decentralized Data Management
	7. Infrastructure Automation
	8. Design for Failure
	9. Evolutionary Design

### Componentization ###
1. Componentization via Services
	1. Modular design is always a good idea
		1. In post monolith era
		2. Updating it requires a small code change (only service is affected)
	2. Components are the parts that together compose the software
		1. Each component is responsible for specific aspect of the software
	3. Modularity can be achieved using:
		1. Libraries - called directly within the process
			1. External code files used in code
				1. Import, using
				2. libraries are executed within the same process
					1. They share same computer resources and do not share any mediation
					2. No mediation - serializer, networking
						1. Very fast
		2. Services - called by out-of-process mechanism (Web API, RPC)
			1. REST - popular
2. In microservices we prefer using Services for the componentization
	1. Makes it modular
3. Libraries can be used inside the service
	1. Not used as a separate component
4. Example: Monolith
	1. Single process runs all libraries
	2. Microservice
		1. Every component is a service
		2. Communication is done using out of process mechanism
			1. Web API
			2. RPC
	3. Each service has libraries
		1. Highly recommended
5. Motivation:
	1. Independent deployment (single component modification allows us to deploy only the component)
		1. If component is library, whole application needs to be deployed
	2. Well defined interface - forces it
		1. We need to design web API - much thought is put into it (when exposed to the world)

### Organized Around Business Capabilities ###
1. Traditional projects have teams with horizontal responsibilities - UI, API, Logic, DB etc
2. Monolith:

		UI - Team A
		API - Team B
		Logic - Team C
		Database - Team D
		
	1. slow, cumbersome inter-group communication
		1. UI team need to talk to API team etc...
		2. Logic team needs database schema etc...
		3. The teams do not use the same terminology
		4. The teams do not have the same schedule
		5. The teams do not have the same goals usually
			1. Logic - team doesn't care about the database
			2. UI - user experience is important and quality of backend is not cared about
				1. It may hurt the project and may impact quality
3. With microservices, every service is handled by a single team, responsible for all aspects.

		UI - Team A
		API - Team A
		Logic - Team A
		Database - Team A
		
	1. Each service is handled by one team
		1. Goal: To make service perform it's functionality as best as possible
			1. It can make decision related to whole functionality of the service
				1. Adapting UI to API
				2. Changing Database Schema
				3. ...
			2. No inner politics
			3. No short sighted decision
4. How do we decide the boundaries of the service?
	1. When does it end and another begin
		1. We mark based on business capabilities
			1. E-commerce
				1. Order management
					1. Single team is responsible for this capability
				2. Inventory managment
				3. Shopping basket
				4. Payment
				5. ...
	2. One team per business capability
		1. Instead of having horizontal teams
5. Motivation:
	1. Quick development - long and cumbersome inter-group communication is avoided
	2. Well-defined boundaries - what should and should not be included is clearly defined
		1. Makes design easier and working with it simpler

### Products not Projects ###
1. With traditional projects, the goal is to deliver a working code
	1. What team is working on - end goal
		1. Project ends usually when code is delivered
			1. We do not consider acceptance testing
				1. No lasting relationship with the customer
2. Often no acquaintance with the customer
	1. Only project management and business analyst meet the customer and developer has no idea who the customer is
3. After delivering - the team moves on to the next project
	1. The team does not think like a customer
		1. Best quality but did not deliver to the expectations of the cusotmer
4. With Microservices - the goal is to deliver a working product (not working code)
	1. If code is less elegant as compared to the product, it is okay
5. A product needs ongoing support and requires close relationship with the customer
	1. Team needs to develop a relationship with customer
6. The team is responsible for the Microservice after the delivery too
	1. It owns the service
		1. Even kt is complete end to end to new team
7. Quote: You build it, you run it - Werner Vogels, AWS CTO
	1. Your job is not just build it but to successfully run it as well
		1. Agile manifesto
			1. Increasing customer's involvement
				1. Better product
8. Motivation:
	1. Increase customer's satisfaction
		1. When team thinks like customer, the end result is what customer needs - it will fit it's needs
			1. More satisfaction to customer
	2. Change developer's mindset
		1. Focus on product rather than project improves the product
			1. Helps the team to be better

### Smart Endpoints and Dumb Pipes ###
1. Traditional SOA projects used two complicated mechanisms
	1. ESB
	2. WS-* protocol
		1. Extension of SOAP protocol
			1. Conventions
				1. Security
				2. Discovery
				3. Reliable messaging
				4. ...
	3. Made inter-service communication complicated and difficult to maintain
2. Microservices systems use "dumb pipes" - simple protocols
	1. Simplest form of communication possible
	2. Complexity is in the logic of the applications
3. Strive to use waht the web already offers
	1. HTTP protocol
		1. Usually - REST API, the simplest API in existence
			1. Nothing new is introduced
				1. HTTP protocol is used with HTTP verbs
4. Microservices

		REST	<--------> REST
		service1			service2
		
5. Important notes:
	1. Direct connections between services is not a good idea
		1. If a service changes it's location, all the other depending services must be updated
	2. Better use discovery service or a gateway
	3. In recent years more protocols were introduced (GraphQL, gRPC), some of them quite complex
6. Motivation:
	1. Accelerate development
		1. Simpler methods of communication
	2. Make the app easier to maintain
		1. Simpler tools
		2. Less engines and protocols makes less things break down

### Decentralized Governance ###
1. In traditional projects there is a standard for almost anything:
	1. Which dev platform to use
	2. Which database to use
	3. How logs are created
	4. ...
2. With microservices each team makes its own decisions:
	1. Which dev platform to use
	2. Which database to use
	3. How logs are careated
	4. ...
3. Each team is fully responsible for its service
4. Team will make optimal decisions
	1. Technological
		1. Is SQL better or NoSQL
		2. NodeJS vs Java
5. Enabled by the loosely coupled nature of Microservices
	1. In monolith, changing a component means changing a library
		1. It affects rest of the monolith
			1. Libraries must align themselves with the rest of the application
	2. A change in one of the microservice does not affect the other microservices
6. Multi dev platform is called **Polyglot**
7. Motivation:
	1. Enables making the optimal technological decisions for the specific service
		1. Enables quick development

### Decentralized Data Management ###
1. Traditional systems have a single database
2. Stores all the system's data from all the components
3. With microservices each service has it's own database
	1. Important notes:
		1. This is the most controversial attribute of Microservices
		2. Not always possible
			1. Separate databses is not possible
			2. Does not make sense
			3. Reasons:
				1. Raises problems such as distributed transactions, data duplication and more
					1. Each data is related to it's service
						1. The data is not related to other services data
							1. Not always
								1. E-commerce
									1. Order's management
									2. Customer management
									3. Problem: How many orders did customer submit in last 6 months
										1. Customer's data is now related to order's data
											1. We may want to store them together
												1. Same transaction must be used to update both databases (business requirement related data is in one of the databases)
4. Distributed transaction needs to be used
	1. **Two phase commit (?)**
		1. More complicated than single database with a monolith
	2. Data duplication
		1. Same data is duplicated across two databases
			1. Orders db and customers db
				1. If one of the db goes out of sync then inconsistency issues occur
5. Don't insist on separate database
6. Motivation:
	1. Right tool for the right task - having the right database is important
		1. Not all databases are equal
			1. Some databases are good for specific tasks
				1. RDBMS - good for complex queries of structured data
				2. NoSQL - good for storing large amount of same structured data
		2. Both types of tasks are dealt with usually in modern systems
	2. Encourages isolation
		1. One service cannot access data stored in other services
		2. Each database is independent of other services
			1. More modular systems
			2. Change can be done without affecting other services

### Infrastructure Automation ###
1. The SOA paradigm suffered from lack to tooling
	1. Affected schedules
		1. Reflected more during testing and deployment
2. Tooling greatly helps in deploying using:
	1. Automated testing
	2. Automated deployment
3. https://martinfowler.com/articles/microservices.html

		Run on build (compile, unit and functional test)
		machine
		
		deployed on (acceptance test)
		build 
		machine
		
		deployed to (integration test)
		integration
		environment
		
		deployed to (user acceptance test)
		UAT
		environment
		
		deployed to (performance test)
		performance
		environment
		
		deploy to
		production
		
1. Automation makes it complete faster
2. For microservices automation is essential
	1. Manually testing and deploying 
3. Short deployment cycles are a must for microservices
	1. Deployment and testing cannot be done manually
		1. Tools must be used
4. There are a lot of automation tools:
	1. Azure DevOps
	2. GitLab
	3. Jenkins
5. As an architect, we must not choose the tool for the team
	1. We need to ensure that there is an automation tool and the team is not doing testing and deployment manually
6. Motivation:
	1. Short deployment cycles
		1. Otherwise it will fail
			1. Manual testing might cause it

### Design For Failure ###
1. With microservices, there are a lot of processes and a lot of network traffic
	1. A lot can go wrong
		1. Process can crash
		2. Network can go down
		3. ...
	2. The probability that a part will not work properly will increase with the number of moving parts
2. the code must assume failure can happen and handle it gracefully
	1. If code calls another service, it should assume the service might go down
		1. It should not throw unhandled exception but should mitigate it
3. Extensive logging and monitoring should be in place
4. Example:

		service1 --- unstable network ---> sevice2
		service2 -------------> service3 x
		
	1. What to do?
		1. Catch the exception
			1. Unhandled exception might expose sensitive data to the client
			2. Unhandled exception might confuse the user
		2. Retry
		3. Log the exception
	2. Service mesh
		1. Simplifies communication between services
5. Monitoring
	1. The monitoring service continuosly monitors the services for problems and evaluates data about services
		1. Example: CPU and RAM usage
			1. Sends alerts to ensure the servcie is up and running
	2. It knows how to raise alerts
		1. Through email or text
	3. Example:
		1. Azure Monitor
		2. Application insights
		3. Kubernetes
6. Motivation:
	1. Increase system's reliability
		1. If system can handle errors gracefully - better user experience

### Evolutionary Design ###
1. The move to microservices should be gradual
	1. No need to break everything apart
		1. Not usually the right path
2. Start small and upgrade each part separately
	1. We have lot of opportunities to find out if we broke something

### Summary ###
1. These are guidelines, not mandatory instructions
2. Adopt what works for you
	1. There are many systems that do not satisfy every single attribute describe
3. The microservices world is rapidtly changing
	1. Follow new APIs, monitoring, cloud services etc...
		1. Even communcation has better options now
4. The most important attributes: (try best to meet)
	1. Componentization (modularity done using services)
	2. Organized around business capabilities
		1. It forces architects hard about the boundaries of services
			1. We cannot change APIs at will
				1. They should be designed carefully to not change much in the future (or should be backwards compatible)
					1. We cannot say we will start with small API and see where it goes
		2. Well bounded service makes it more modular and more independent of other services
	3. Decentralized governance
		1. Team can decide best technology that suites the service needs
			1. Slow and legacy technology need not be used
		2. Team can use tools required
	4. Decentralized data management (when possible)
		1. It is good idea but comes with exceptions
			1. Makes it more autonomous
	5. Infrastructure automation
		1. Complexity cannot be handled manually (slows down testing and deployment cycles)

## Problems Solved by Microservices ##
### Introduction ###
1. We discussed problems caused by Monolith and SOA
	1. Inflexible deployment
	2. Single tech
	3. Expensive
2. Microservices solve these problems

### Single Technology Platform ###
1. With monolith, all the components must be developed using the same development platform
	1. Not always the best for the task
		1. Multiple platforms might be required (capabilities can be extended)
	2. Can't use specific platform for specific features
	3. Future upgrade is a problem - need to upgrade the whole app
	4. Example:
		1. We can use only .Net or NodeJs (not both)
			1. microservices
				1. Decentralized governance attribute solves it
					1. Each team decides which platform or technology to use
						1. Higher level decisions are not required
						2. DB, messaging, ...
					2. .net, node, java, rust, c, c++, ...

### Inflexible Deployment ###
1. With monolith, new deployment is always for the whole app
	1. No way to deploy only part of the app
	2. Even when updating only one component - the whole codebase is deployed
	3. Forces rigorous testing for every deployment
	4. Forces long development cycles
2. With microservices, the componentization via services attribute solves it
	1. It is easier to deploy just part of a system
		1. when components are different processes, allows for separate deployments
			1. It has almost no effect on other services
	2. Also - Decentralized Data Management
		1. Each service has it's own database
			1. Updating database for a service is easier
				1. Single database - changing or upgrading it might affect other services (coupling the services)
			2. Fully independent services

### Inefficient Compute Resources ###
1. With monolith, compute resources (CPU and RAM) are shared across all components
	1. Uses for all it's internal components
		1. If a specific component needs more resources - there is usually no way to do that (may be too complex to do that)
			1. Whole monolith needs to be allocated compute resources
	2. Very inefficient
2. With microservices, the componentization via services attribute solves it
	1. Components run as services
		1. Each component can be assigned the correct compute power it needs
	2. Each service has it's own process
		1. Example:
			1. service1 - 4 vCores, 8GB RAM
			2. service2 - 8 vCores, 8GB RAM
			3. ...

### Large and Complex ###
1. With monolith, the codeabase is large and complex
	1. Codebase usually has lot of dependencies and coupling
	2. Every little change can affect other components
	3. Testing not always detects all the bugs
		1. Some bugs might slip the cracks
	4. Very difficult to maintain
		1. Every little change needs complex process to deploy to production
		2. Might make the system obsolete - because development team tries to avoid changing the existing sytem (due to complexity in change management)
2. With microservices, the componentization via services attribute solves it
	1. Each service has bounded code
		1. Well defined boundaries
			1. Each service cannot directly access other services (locked from other services code)
	2. Decentralized Data Management
		1. Another level of isolation between services
			1. Reduces chance of mixing service functionality
				1. If single db - mixed content is possible (in DB)
					1. Complexity is shifted to the db
	3. Organized around business capabilities
		1. Single team is responsible for a service
			1. Slow cumbersome intergroup communication between teams is avoided
				1. Service can be simple and easy to maintain

### Complicated and Expensive ESB ###
1. With SOA, the ESB is one of the main components
	1. Responsible for all communication
2. Can quickly become bloated and expensive
	1. Tried to do everything
		1. It is complex
		2. Very difficult to maintain
			1. Lot of time and money is wasted
2. With microservices, the Smart Endpoints and Dumb Pipes attribute solves it
	1. Services should themsleves handle all aspects of communication
		1. Communication should be very simple
			1. REST - simplest form of communication
				1. Existing and proven method for communication
	2. Example:
		1. No mediator is required to connect to each other
	3. Remember:
		1. Appliction Gateway & Discovery (connecting directly is discouraged)
		2. Other APIs: GraphQL (facebook), gRPC (google)
			1. Look at them and try them (if they could be used) - alternatives to REST

### Lack of Tooling ###
1. For SOA to be effective, short development cycles were needed
2. Allow for quick testing and deployment
	1. No tooling existed to support this
	2. No time saving was achieved
		1. Caused failure of SOA
3. With microservices, the infrastructure automation attribute solves it
	1. Automates testing and deployment
		1. Provides short deployment cycles
		2. Makes the architecture efficient and effective (lack of tooling problem is solved)

## Designing Microservices Architecture ##
### Introduction ###
1. Process we need to follow
	1. Designing microservices architecture should be methodical
		1. Do not rush into development
		2. "Plan more, code less"
			1. True for every software and more for microservices
	2. Critical to the success of the system
		1. The more we plan, the more we think about the overall system mapping, the more we know what we are going into, the less we will code later
			1. The less we code, the less bugs we introduce, the less the maintenance will be
2. Process:
	1. Understand the System's Requirements
	2. Understand the Non-Functional Requirements
	3. Map the Components
	4. Select the Technology Stack
	5. Design the Architecture
	6. Write Architecture Document
	7. Support the Team
3. Important steps for microservices
	1. Map the components
		1. Split to:
			1. Mapping components
			2. Communication patterns
				1. Deserves it's own lecture
	2. Select the Technology Stack
	3. Design the Architecture

### Mapping the Components ###
1. The single most important step in the whole process
	1. Determines how the system will look like in the long run
2. Once set - not easy to change
3. This step will shape the system and a lot of thinking is invested in it
4. What is it?
	1. Defining the various components of the system
		1. Decomposing system into parts
			1. Orders
			2. Payments
			3. ...
	2. Remember: Components = Services
		1. Services behave differently than libraries
			1. They have their own set of constraints
				1. Every access needs network traffic - problem from performance point of view
					1. There are more issues ...
5. Mapping the Components:
	1. Base it on:
		1. Business requirements
			1. The collection of requirements around a specific business capability
				1. For example: Orders management
					1. System should manage orders received by customers
						1. Add new order
						2. Update existing order
						3. Calculate amount of orders
						4. ...
					2. Each requirement is related to the orders management business capability
						1. Business capability - used as frame for component
						2. Requirements - Actions that the component can do
		2. Functional autonomy
			1. The maximum functionality that does not involve other business requirements
				1. Telemetry processing - only functionality involving telemetry processing should be involved (not other service functionality)
				2. Order management - Retrieve the orders made in the last week
					1. Get all the orders made by users aged 34-45 (must not be included in the service)
						1. This is grey area
							1. Duplicating data might be required (real-life situations may change too)
								1. Architect should try to minimize this as much as possible
		3. Data entities
			1. Service is designed aroudn well-specified data entities
				1. Easiest factor to undestand - used most by architects
					1. Major entities are identified first
						1. Example: Orders, Items, ...
				2. Data can be related to other entities but just by ID
					1. Service should not store full entity
						1. Example: Order stores the Customer ID
							1. DB holds only ID of customer
								1. To retrieve customer data, we go to customer service and retrieve the details
									1. We go to customer management service - designed around the customer entity and use service retrieval method to grab customers matching the order entity
		4. Data autonomy
			1. Builds on Data entity pattern
				1. Underlying data is an atomic unit
					1. Service does not depend on data from other services to function properly
						1. If that happens - we messed on architecture
							1. We may need to include the external data into our service
			2. Example: Employees service that relies on Addresses service to retrieve Employees data
				1. Employee service has no life of it's own. It relies on other service to function properly
					1. Architecture is not optimised
						1. Include Addresses data inside Employees service (makes service a little bit larger - but alternative is much worse - we need data autonomy)
2. Example:
	1. Services:
		1. Inventory service
		2. Orders service
		3. Customers service
		4. Payments service
	2. Factors:
		1. Business Requirements: Manage inventory items, Manage orders, Manage customers, Perform payments
		2. Functional autonomy: 
			1. Manage inventory items:
				1. Add, remove, update, change
			2. Manage orders
				1. Add, cancel, calculate sum
			3. Manage customers
				1. Add, update, remove, get account details
			4. Perform payments
				1. Perform payments
		3. Data Entities
			1. Inventory Service - Items
			2. Order Service - Orders, Shipping address
			3. Customers Service - Customer (multiple shipping addresses can be used), Address, contact details
			4. Payments Service - Payment History
		4. Data Autonomy
			1. Inventory service:
				1. None
			2. Orders service
				1. Related to items by ID related to customer by ID
			3. Customers service
				1. Related to Orders by ID (not a must relationship - back to orders)
			4. Payments Service
				1. None
	3. Technology or development platform are not considered in this phase
		1. Too early - technology has no impact on the mapping
3. Real systems might be more complex than this
	1. Edge cases:
		1. Edge case #1:
			1. Retrieve all customers from NYC with total number of orders for each customer

					Customer name		No of orders
					David Smith		16
					Diane Rice		23
					George Murray		22
					
				1. Data is spread across 2 services (this could be common use case)
					1. Customers data is in customers service
					2. Orders data is in orders service
			2. Three approaches to solve the problem:
				1. Data duplication (recommended)
					1. Number of orders is stored in orders db and also in customers db
						1. If orders are updated in orders database, then customer db must also be updated
							1. Problems
								1. The data may go out of sync (update is simple though)
				2. Service Query
					1. The service talk to each other (for querying customers)
						1. Customers service retrives number of orders for each customer from orders service
							1. Problem: clogs network and the services (200 requests could be too much)
								1. One solution: it can be done in batches (lot more coding)
						2. Cons: performance problem
				3. Aggregation Service
					1. There is a third service that aggregates the results of Orders service and Customers service
						1. Queries both services
							1. Advantage: Data between the services is not mixed
					2. Result merging is done by third service
					3. Cons: Additional service and additional development
			3. Recommendation: First approach
				1. Very little data duplicated
				2. Read only (no synchronization required (???))
		2. Edge case #2:
			1. Retrieve list of all the orders in the system
				1. Problem: Volume of data
					1. Number of orders will be high with time
						1. Network and service usage will increase
			2. Services are not designed for this scenario (well defined amount fo data
			3. Find out what's the purpose of this query?
				1. Usually for reporting
					1. Report engine is the preferred mechanism for this
						1. Can work directly with the db
							1. Efficient querying is done
						2. Service will not suffer from this edge case
4. Cross-Cutting Services
	1. Services that provide system-wide utilities
		1. Common examples:
			1. Logging
			2. Caching
			3. User management
	2. Thes MUST be part of the mapping
		1. They can simplify the design and development of other services
		2. They usually should be developed early 

### Defining Communication Patterns ###
1. Efficient communication between service is crucial
	1. Inter-service communication
		1. It's important to choose the correct communication pattern
			1. Using wrong pattern may result in
				1. Slow performance
				2. Un-maintainable system
				3. Poor error handling
2. Main patterns:
	1. 1-to-1 sync
		1. A service calls another service and waits for the response
			1. The calling service's process is blocked until a response is returned from the other service
				1. The calling service has to wait the entire duration
		2. Used mainly when the first service needs the response to continue processing
			1. When the data is needed to continue the flow that it is executing now
			2. Example:
			
					Orders -------> Inventory
					
				1. Orders service wants to finalize the order but it wants to make sure the item is in stock
					1. Is item in stock?
						1. It cannot continue until response is received
		3. Pros:
			1. Immediate response - don't have to wait an un-known time until someone triggers the response
				1. Calls triggers it
			2. Error handling - simple
				1. We will know it immediately (calling service will get error immediately)
			3. Easy to implement
				1. No need for
					1. Third party mechanism
					2. Thread handling
				2. Can be implemented using few lines of code
		4. Cons
			1. Performance
				1. Calling service is blocked until response is received
					1. Performance of the application is reduced badly
		5. The pattern should be limited to use cases where the response is absolutely needed to continue
		6. How to implement?
			1. Payments service exposes API - REST/GraphQL/gRPC
			2. Orders service calls the API - to get response
				1. Response is returned synchronously
			3. This is direct connection
				1. Usually not recommended
					1. Each of 6 services connected to other services - spider web
						1. Problem: If one of the services is changed
							1. Change will affect all the services communicating with this service (ripple affect - shock waves)
			4. Two approaches:
				1. Service discovery - It acts like yellow pages for the services
					1. When a service wants to access another service, it first goes to yellow pages service
					2. Gets URL of the second service
					3. Service then connects the second service using the URL
					4. The services only need to know the Directory's URL
						1. No need to keep any other services - close coupling
					5. Example: **Consul**
						1. Discovery
						2. Configuration
						3. Monitoring
				2. Gateway - Service goes to the gateway and gateway goes to the other service
					1. Services only need to know the Gateway's URL
				3. Differences
					1. Service discovery is easier but gateway can provide more services
						1. Monitoring
						2. Authentication
						3. Authorization
						4. ...
					2. Gateway approach is becoming more popular
						1. Service discovery approach can be chosen if we are comfortable with that
	2. 1-to-1 async
		1. A service calls another service and continues working
			1. Dosn't wait for response - fire and forget pattern
				1. The calling service doesn't wait for the response and continues with the next step
					1. Doesn't care what happened (usually) to the call
		2. Used maintly when the first service wants to pass a message to the other service
			1. Other service needs to handle it
				1. The callee service has to take care of error handling
		3. Example:
			1. Orders service sends a message saying an order was performed so handle the payments to the payments service
				1. An async message is sent to payments service
					1. It doesn't wait for response
				2. Payments service should make sure everything works but if there is a problem, it should handle it
		4. Pros:
			1. Performance
				1. Calling service doesn't get blocked
					1. Other service can take time if needed but calling service is not affected
		5. Cons:
			1. Setup is complicated - Needs more setup
				1. Usually needs third party tooling
					1. Complicates setup and maintenance
			2. Difficult error handling
				1. Difficult to trace the error and where exactly it happened and what were the reasons for it
		6. How to implement?
			1. Orders ----> Queue ----> Payments
				1. Queue
					1. **RabbitMQ**
						1. Easy setup
						2. Simplicity
						3. Performance
						4. It is free
				2. Orders service sends a message to the Queue and Queue relays it to the Payments service
					1. orders service completed it's flow when message is sent to the queue (it doesn't care what happened after that)
						1. The message might not have reached it's destination
							1. It is the responsibility of the Queue
	3. Pub-Sub/ Event Driven
		1. A service wants to notify other services about something
			1. Multiple other services
		2. The service has no idea how many services liten and how many will get it
			1. Difference between 1-to-1 async and this:
				1. In 1-to-1, the service directs the message to a specific other service (even if there is no direct contact with it)
				2. In pub-sub, a service publishes a message and other services subscribed to this message will receive it
					1. The publishing service doesn't know how many other services have subscribed to the message (it doesn't care)
		3. The sender doesn't wait for response - Fire and Forget pattern
		4. Usage: Used maintly when the first service wants to notify about an important event in the system
			1. Lets other services decide what to do with the event
				1. Related to events - Event driven
		5. Example: If an order was cancelled
			1. Service sends pub-sub message (that order was cancelled)
				1. Other services subscribed to this event will receive this message
					1. Inventory service - returns order items back to stock
					2. Customers service - reduces numer of orders for the customer
					3. Payments service - should issue a refund
		6. Pros
			1. Performance - improved
			2. Notify multiple services at once (not possible with other patterns)
		7. Cons
			1. Needs more setup - additional third party tools may be required
			2. Difficult error handling - lot of moving parts
				1. Pinpointing exact location of the error is not easy
			3. Might cause load (on system)
				1. If a lot of messages are sent and a lot of services have subscribed to it, it may cause high traffic and CPU and RAM usage - might make our system slow
		8. How to implement?
			1. Orders ---> Pub/Sub ---> Payments, Customers
				1. RabbitMQ
				2. AzureEventGrid
3. Summary:
	1. Choosing the correct communication pattern is crucial
	2. Affects:
		1. Performance
		2. Error Handling
		3. Flow (of communication)
	3. Almost impossible to reverse
		1. **The choice can be made at the beginning (at components mapping step)**

### Selecting Technology Stack ###
1. In monolith - this step will pretty much set the technology stack and it is difficult to change or reverse
2. In microservices - Decentralized Governance allows selecting different technology stack for each service
	1. Gives independence to the team in selecting the stack and allows them to pick the most efficient and suitable platform for the specific task
3. We'll focus on Backend platform and storage platforms
	1. Most critical ones for microservices
		1. Alternatives - pros and cons
			1. There's no objective "Right" or "Wrong" for technology stack - any stack can be used to get the job done
				1. There are some considerations while making that decision
4. Make it a concrete decision based on hard evidence
	1. Tech stack discussions might become emotional (don't fall into this trap - don't fall in love with one or the other)
5. Development Platform (summary)

					App Types	Type System	Cross Platform		Community		Performance	Learning Curve
		.Net		All			Static		No					Large			OK			Long
		.Net Core	Web Apps,	Static		Yes					Medium and		Great		Long	
					Web API,									growing
					Console,									rapidly
					Service
		Java		All			Static 		Yes 				Huge			OK			Long
		Node.JS		Web Apps,	Dynamic		Yes					Large			Great		Medium
					Web API
		PHP			Web Apps,	Dynamic		Yes					Large			OK			Medium
					Web API
		Python		All			Dynamic 	yes 				Huge 			OK			Short
		
	1. App Types: web api (usually for microservices)		1. All the above support this
	2. Type System: developer sets hard coded types for variables, values, methods, ...
		1. Compiler error will be thrown otherwise
			1. Static - more reliable in production (because errors are cought early during compilation)
			2. Dynamic - faster development
				1. Developers have to think less about types
				2. More flexible in assignments
		2. There are pros and cons for both types
		3. Node.JS
			1. Trends: Using typescript (micrsoft) can be used for Node.JS
	3. Cross Platform: Can we run on Windows, Linux and OS-X?
		1. .Net - consider it only if application is meant to run on Windows (otherwise, just discard this option)
	4. Community: It is better to have large vibrant community that can help
	5. Performance: Strive to use the platform that provides the best performance possible unless system doesn't need high performance
		1. Desktop apps say
		2. With microservices - performance is very important
	6. Learning Curve: Development team does not have prior experience with the platform, we must ensure they are brought on board as quickly as possible
	7. Personal Favorites: .Net core, Node.js
6. Data Store
	1. 4 Types of data store:
		1. Relational Database
			1. Traditional db
			2. Stores data in tables
			3. Tables have concrete set of columns
				1. They have concept of relationships

						Column Name	Type	Nullable?
						OrderId		Num		No
						OrderDate		D/T		No
						CustomerId	Num		No
						DeliveryAdd	String	No
						
						Column Name	Type	Nullable?
						OrderItenId	Num		No
						OrderId		Num		No
						ItemName		String	No
						Quantity		Num		No
				
					1. Relationships exist in relational databases
						1. Orders vs Order Items
					2. Popular databases
						1. SQL Server
						2. MySQL
						3. PostgreSQL
			4. Use cases:
				1. Data is fully structured
				2. We need complex queries
		2. NoSQL Database
			1. Emphasis on scale and performance
				1. Less emphasis on data complexity or advanced queries
			2. Schema-less
				1. No well defined structure to data records
					1. Each record can have it's own fields and types
			3. Data usually stored in JSON format
				1. Nesting and querying
			4. Popular
				1. MongoDB
				2. Amazon DynamoDB
				3. Couchbase
				4. Azure Cosmos DB
			5. Use cases:
				1. Semi structured data
				2. No advanced query capabilities required
				3. If we need scale and performance
					1. Logs
					2. Telemetry data
		3. Cache
			1. Stores in-memory data for fast access
				1. Used in conjunction with db
				2. It's goal is to bring the data closer to the application and store in fast access medium such as in memory to accelerate retrieval time
			2. Use cases:
				1. To store data accessed frequently and rarely changed
					1. Zip codes
					2. List of countries
				2. Modern sophisticated caches distribute data across nodes
					1. Large scale
					2. Redundancy
				3. Distributed cache
					1. Uses proprietary protocol to communicate with nodes
						1. Protocol: Extremely fast and minimal overhead
							1. Performance
			3. Cache can store only serializable data
				1. Cannot store complex binary objects
					1. It shouldn't - not a good idea
			4. Popular
				1. Redis - simple cache
					1. Great performance
					2. Great capabilities
					3. Allows querying data
		4. Object Store
			1. Stores un-structured large data
				1. Documents
				2. Photos
				3. Files
				4. ...
			2. File system?
				1. Files can get locked
				2. Authorization mechanism is complex
					1. Usually managed by sys-admins
						1. They usually don't know what file shares are needed and why?
				3. Accidental deletes can happen
				4. Hence a specialized engine
			3. Popular stores:
				1. Microsoft Azure Blog Storage
				2. Amazon S3
				3. Minio - on premises
			4. Recommendation: Use one of the cloud storage engines whenever possible
				1. Plan B: Minio

### Design the Architecture ###
1. Most important things here - This course does not cover specific component architecture - only covers microservices architecture (The complete guide to become a software architect)
2. Service's architecture is no different from regular software
	1. Ideas are the same
	2. Patterns and practices are the same
	3. From component architectural point of view they are the same		1. We need to learn software architectural patterns
3. Based on the layers paradigm
	1. Leading paradigm
		1. Represent horizontal functionality of a software component
			1. Traditional architecture
				1. Expose User Interface / API (expose something to the user world)
				2. Execute Logic (some sort - calculation, validation, processing, accessing, external systems, ...)
				3. Save/ Retrieve Data (from store)
			2. Each layer is mapped to the above tasks (of a component)
				1. UI/ SI layer mapped to user interface or API
					1. Expose API
					2. Handle JSON
					3. Auth (sometimes)
				2. Business Logic (BL) mapped to logic
					1. Validation
					2. Enrichment
					3. Computations
				3. Data Access Layer (DAL) mapped to save/retrieve data
					1. Connection Handling
					2. Querying/ Saving Data
					3. Transaction Handling
	2. Why layers?
		1. Two main reasons:
			1. Forces well formed and focused code
				1. If we are developing logic - we can focus just on the logic (not dealing with opening communication channel or saving to the database)
					1. Easier to maintain
			2. Makes the code more modular
				1. If code was previously working with oracle, we can now make it work wih MySQL
					1. We just need to replace the DAL layer (UI and BL wont be affected)
						1. If done correctly, the UI and BL will never know that the DB has changed
	3. Code Flow
		1. UI/SI (can access BL but will not skip BL and talk to DAL - breaks modularity of the code and causes coupling)
		2. BL (should not access UI/SI - no access to layer above it - breaks modularity of the code and causes coupling)
		3. DAL

## Deploying Microservices ##
### Introduction ###
1. Why dedicated section?
	1. Deployment of microservices is extremely important
		1. Remember: "Infrastructure Automation" attribute of microservices
	2. Slow and complicated deployment will render the whole system ineffective and useless
	3. Microservices have a lot of moving parts
		1. If we test and deploy each part manually, we are going to have a problem
			1. It will be slow
				1. In this case, it is better to work with monolith (simpler and faster)
	4. Architect should be aware of deployment, not responsible
		1. Should not build or deploy or design deployment process
			1. Should only ensure that there is insfrastructure in place and it is used correctly
				1. If not used correctly, architect should refer it to the IT team and management and if required consult about it (that is all)
	5. Only high level concepts will be discussed
		1. Baseline only for further exploration

### CI/CD ###
1. What is CI/CD?
	1. Continous Integration/ Continuous Delivery
		1. The full automation of the integration and delivery stages
	2. Integration & Delivery?
		1. Schedule - After development
			1. Build - most important
				1. Computer it will run on will be able to run it
			2. Unit Tests
				1. Tests smallest units of code (methods usually)
			3. Integration Tests
				1. Service test
			4. Staging
				1. Software is deployed in a simulated production environment for verification tests
			5. Production
		2. This is simpler version
3. Integration stage: result - tested piece of software ready to be deployed
	1. Build
	2. Unit Tests
	3. Integration Test
4. Delivery/ Deployment - Software is deployed on environments we want
	1. Staging
	2. Production
5. Automation
	1. CI/CD
		1. We want perform the two steps continously and without any interruptions and very quickly
			1. Well organized microservices environment allows pushing to production every few minutes (different from every few months)
6. Why Use CI/CD?
	1. Faster release cycle
		1. We can push updates quickly and efficiently
	2. Reliability
		1. Reliable tests each step of the way
		2. Sophisticated alerting every step of the way to let us know what went wrong
			1. Manual steps are error prone
	3. Reporting
		1. Extensive reporting is in place
			1. Shows us what is the state of teh application
				1. Which tests passed and failed?
				2. What were the reasons for that
				3. How was the performance of the application
				4. ...
		2. CI/CD tools can collect huge amount of data and lot of insights can be generated from the data
4. Pipelines
	1. The heart of the CI/CD process
	2. Defines the set of actions to perform as part of the CI/CD process
		1. Typical pipeline
			1. Building code
			2. Testing
			3. Deploying
	3. Usually defined using YAML, with UI representation (of it)
		1. Azure DevOps
			1. Restore
			2. npm install
			3. bower install
			4. gulp
			5. Build
			6. Test
			7. Publish
			8. Publish Test Results
			9. Copy Files
			10. Publish Artifact
		2. other tools have similar representations
5. As the architect:
	1. Make sure there is a CI/CD engine in place - which one does not matter
		1. Cloud based engine is great
		2. On premise tools are also good (Jenkins)
	2. Help shape the steps in the pipeline (the team)
		1. Assist in designing pipeline

### Containers ###
1. Traditional deployment
	1. Code was copied and built on the production server
		1. Or it was prior built and copied to the server
		2. Problems were found on the servers that weren't found in the dev machines
			1. The software that was run on the server was not the same as the one worked on by the developer
				1. Defect in production? It works on my machine
					1. For obscure reasons it didn't work on production machine
						1. A lot of time and money was wasted identifying what caused the problem
			2. Solution: Containers
2. What are containers?
	1. Thin packaging model
	2. Packages software, its dependencies, and configuration files
	3. Can be copied between machines
	4. Package becomes an atomic unit that can be executed with whatever is contained in the package
		1. It is completed independent of the machine in which it is hosted
			1. Exception: Uses the underlying operating system
3. What is the difference between containers and VMs?
	1. VMs
		1. Hardware + host OS + hypervisor (runs VMs and makes host resources accessible - disk, network, ...) + VMs (with guest OS + applications)
	2. Containers
		1. Hardware + host OS + container runtime (similar to hypervisor - runs containers and makes host resources accessible to them - networking, disk, ...) + containers
		2. It is more lightweight
			1. Container shares the OS with the host (same as the host)
				1. If host OS is upgraded, the containers will run the upgraded OS
					1. It has advantage but serious drawbacks
4. Why containers?
	1. Predictability - The same package is deployed from the dev machine to the test to production (this is the most important factor for architect and dev team)
		1. If it runs on dev machine, it runs on production machine
	2. Performance - Container goes up in seconds vs minutes in VM
		1. Container uses host OS and does not require booting another OS - loads much faster
	3. Density - One server can run thousands of containers vs dozens of VMs
		1. Containers are much lighter and require much less memory
5. Why not containers?
	1. Isolation - Containers share the same OS, so siolation is lighter than VM
		1. It is easier to cross boundaries between containers than between VMs
			1. If app contains sensitive code or data, it should be better deployed on an isolated VM
				1. It can use container but should not share the host machine with containers of other applications

### Introduction to Docker ###
1. Implementation:
	1. It is the most popular container environment
	2. De-facto standard for containers
	3. Released in 2013
2. Docker architecture

		Client
		docker build							 |--> Registry -----|
		docker pull	|----> Docker daemon |--> Images -----|<-
		docker run							 |--> Containers <-
		
	1. The Docker Server - Daemon
		1. Runs on the docker host and is responsible for managing the docker containers
			1. Turns them on or off
			2. Keeps track of activity
			3. Builds containers based on images
			4. Exposes API for management tools
	2. Images of the containers, containing the software to run
		1. Set of definitions in software for a container to run
			1. Similar to VMs
		2. Example: Image for front-end of e-commerce application or image for database - building blocks
		3. Images are static files and they don't run - they are only the basis for the containers
	3. Repositories of images. Can be public or private
		1. Registry - Collection of images from where you can pull images and use it as it is or customize it for our needs
			1. Download - base .Net core image and customize it by copying our code into it
				1. New custom image - basis for the new container
			2. Can be public - Docker Hub
			3. Can be private - Accessible only to the organization
	4. Instances of Images
		1. Containers - It is built and run from the images
			1. It is run in a sandbox constructed by the docker daemon
			2. It is a full blown process and can do whatever it wants assuming it has permissions
				1. It is a piece of software that can run on the machine in isolation to the host but can use it's resources 
	5. Client - CLI
		1. Used to send instructions to the daemon
			1. It is gateway to the whole functionality of docker
				1. Pull images
				2. Customize images
				3. Run images
				4. Shut images off
				5. Check status
				6. ...
			2. For DevOps team
3. dockerfile
	1. The ability to pull images from repository and add customization to it - major success factor
		1. Done using dockerfile
			1. Contains instructions for building custom images
				1. It is used to instruct daemon to
					1. Copy files
					2. Run commands
					3. Change working directory
					4. ...
	2. They are quite small
		1. Many baseline images are available and we are only adding on top of them
		2. Example:

				WORKDIR	/opt/node_app
				COPY		package.json	package-lock.json* ./
				RUN			npm install --no-optional && npm cache clean --force
				ENV			PATH /opt/node_app/node_modules/.bin:$PATH
				WORKDIR	/opt/node_app/app
				COPY		.	.
				
			1. https://www.docker.com/blog/keep-nodejs-rockin-in-docker/
4. Support for Docker
	1. Supported by all major OSs (Windows, Linux, OSX)
	2. Supported by major cloud providers - We can deploy docker images to cloud and it runs
		1. Amazon ECR (registry)
		2. Azure ACR (registry)
			1. Push the container image to cloud and it just runs

### Containers Management ###
1. Containers are a great deployment mechanism
2. Gained popularity rapidly
3. What happens when there are too many of them?
	1. Example:
		1. Front-end - 2
		2. Backend - 2
		3. Database - 1
		4. Batch Processing - 1
	2. When number of containers begins to grow, we have problems managing the containers
		1. Problems:
			1. Deployment - too many containers makes it tiresome and error prone
			2. Scalability - If load on containers increases, we need to add more containers to scale them
				1. To distribute load more effectively
			3. Monitoring - When a container goes down, someone has to know that (if there are lots of containers, knowing this manually is nearly infeasible)
			4. Routing - If we have more than one instance of a container, we need routing mechanism (similar to load balancer) to route requests to containers
			5. High availability - How to ensure that our container system can deal with crashes and errors
		2. In VM environment - host managers, load balancers solve these problems

### Introduciton to Kubernetes ###
1. Kubernetes - Most popular container management platform
	1. De-facto standard for container management
	2. Released by Google in 2014
2. Provides all aspects of management
	1. Routing
	2. Scaling
	3. High-availability
	4. Automated deployment
	5. Configuration management
3. Deep dive into Kubernetes architecture is not required but some elements are important
	1. Pod - atomic unit in Kubernetes
		1. Kubernetes manages this
			1. It is a container of containers
				1. One or more docker containers live inside a pod
					1. Pod is like a wrapper around containers
						1. Provides
							1. Connectivity
							2. Monitoring
		2. Usually, there is one docker container inside a pod
		3. Pod exposes IP address - Kubernetes uses this to communicate with the Pod
	2. Service - Containers are accessible to public network using Service
		1. It is a mechanism used by Kubernetes to expose functionality exposed to the outside world
			1. It masks inner containers
		2. Service - Provides public IP and load balancing, monitoring, high availability and more
4. Deployment - Summary
	1. Automated deployment is a must for effective microservices architecture
	2. Docker and Kubernetes are the de-facto industry standard
	3. As an architect, you're not responsible for the deployment but should be aware of it
		1. Ensure, there is deployment in place and help the IT and DevOps teams to adopt one

## Testing Microservices ##
### Introduction ###
1. Testing is important in all systems and all architecture types
	1. No system should go to production without going through a rigorous testing phase - to ensure there are as few bugs as possible
		1. No system is absolutely bug free
			1. We have to try to minimize bugs
	2. With microservices, it is even more important
		1. A lot of proesses and moving parts and potential for a lot of things going wrong is much bigger
2. Testing microservices poses additional challenges
	1. Not found in traditional applications
	2. We need to have well planned and implemented testing for microservices
3. Tests Types
	1. Unit Tests
	2. Integration Tests
	3. End-to-End Tests

### Challenges with Microservices Testing ###
1. Microservices systems have a lot of moving parts
	1. We could have nearly countless processes participating with each one having it's own technology stack, own database, own api, ...
2. Testing and tracing all the services is not trivial
3. Example:

		service1 --> service2 --> service3 (has db)
		
	1. Test begins at service1 and end at service2
		1. With single process, we can have a full cycle test
			1. We can send request to the API and wait for API response
				1. We know that the API did not access external services
		2. With microservices, the result of the flow could depend on the different service
			1. We may have to send request to service1 and check results at service3
				1. It is complicated and takes more time
	2. If a service that the test depends on is not ready on time, the tests might fail
		1. If a service that is a dependency is not fully developed when the first service is ready, then one cannot test the flow
4. Main challenges:
	1. Testing state across services
		1. When a service calls another service and end state is in another service
	2. Non-functional dependent services

### Unit Tests ###
1. Tests individual code units
	1. Method
	2. Interface
	3. ...
2. It is not used to test the whole flow and communication between components
3. In-process only
	1. Example: We don't check if a service can communicate with the database
4. Usually automated
	1. In well tested system, there are a lot of unit tests
		1. There should be more unit tests than methods
			1. Ratio: 4:1
	2. Manually testing is not humanly sane
		1. It is better to use a unit test framework
	3. Almost all platforms have unit-testing frameworks
		1. NUnit - .Net
		2. JUnit - Java
		3. ...
5. Unit tests are developed by developers
	1. Why?
		1. Developers have most intimate knowledge about the code they write and they know what are the functions or other code units that need to be tested
		2. QA team might know the functional requirements of the code but they have no idea about the code units
			1. They cannot write unit tests
6. Example:

		Order Service
			- AddOrder()
			- CancelOrder()
			- GetOrderDetails()
			- GetOrdersForUser()

	1. Typical code unit we want to test is a method
		1. At-least 4 unit tests (for each method)
			1. There should be much more
7. Unit tests are extremely important for the quality of the system
8. Unit Tests in Microservices
	1. No different
		1. They are same in both monolith and microservices
	2. Test only in-process code
		1. They are not affected by the distributed nature of microservices
		2. They are completely oblivious of what is happening outside the boundary of the process
	3. Use the same frameworks and methodologies
		1. No specialised frameworks must be needed for microservices

### Integration Tests ###
1. Test the service's functionality
	1. We are not interested in the code
		1. Only service's functionality (not how it is developed)
2. We try to Cover (almost) all code paths in the service
	1. The more paths we cover, the more comprehensive our testing is
	2. If the code is very complicated, it is not always possible to cover all code paths in integration testing
		1. It is better to ensure all critical paths are covered
3. Some paths might include accessing external objects
	1. Database, other services
		1. We cross process boundary often (as opposed to unit tests)
4. Example:

		Orders Service ---> DB
		
	1. What happens if the database (or other external service) is not ready?
		1. Wrong version
		2. Not working for whatever reason
	2. We can use a test double
		1. It pretends to be the real object/ service to allow testing
			1. Example: DB test double
	3. Three types of test doubles:
		1. Fake
			1. Implements a shortcut to the external service
				1. It fully replaces the original object and provides a lightweight implementation of the original object
					1. Example: stores data in-memory (some storage)
			2. Many times implemented in-process
				1. To allow quick implementation and allow inter-service communication (to reduce complications)
			3. This needs code change
				1. The service needs to know that it is now working with a fake instead of real object
				2. Fake DB resides in the service itself and exposes the same API (as the actual object)
		2. Stub
			1. Holds hard-coded data
			2. Usually replaces data stored in a DB (or service that retireves data from db)
			3. Allows simulating data services quickly
				1. We don't need to have a fully functional db with dynamic data (or service that accesses that db)
					1. We just need a lightweight service holding pre-defined data stored in the code itself
						1. Quick simulation of data service & effective integration tests
			4. No code change required
				1. The service doesn't even know that it works with a stub
					1. From service point of view, the stub is a normal service returning normal data
			5. Customers stub (a light weight implementation of customer service holding hard coded data)
				1. Order service doesn't know that something has changed
		3. Mock
			1. Only verifies access was made
				1. If we need to access weather service, we mock the weather service and check if the access was made
				2. We are not interested in the result of the call but only checks that an access was made
			2. Holds no data at all
			3. No code change required (similar to stub)
			4. It is usually positioned outside the service
				1. Service has no idea that it is working with a mock
				2. Example: Customers mock - it just verifies that service called customer service
5. Integration Tests
	1. Use the service's API (as opposed to unit tests)
		1. They run the service the same way we run in real life (from outside using it's API)
	2. Developed and conducted by the QA team
		1. Not developers
			1. There is no need for intimate familiarity with the code
	3. QA team is well equiped with such tasks
	4. Should be automated
		1. To accelerate deployment cycle
			1. Most unit testing frameworks support integration tests
				1. Some interesting tools also might help

### End to End Tests ###
1. Test the whole flow(s) of the system
	1. They touch all services
		1. Verify that all flows of the system are correct
2. If any service escaped the integration tests, it should be tested in end-to-end tests
3. Test for end state
	1. If a service calls another service that altered it's state, the end-to-end test ensures that the state was actually changed
		1. Different from integration test (we test only a single service - if it performs flawlessly)
			1. If a service calls another service that messes things up, integration test will not find it
				1. End-to-end tests will
4. Example:

		service1 --> service2 --> service3 (db) --> service4 (db)
		
	1. end-to-end: begins with service1 and ends with service4
		1. We don't test what happened at service1 or service3
			1. one end to another
5. End-to-end tests are extremely fragile
	1. There are a lot of moving parts and things can go out of control quite quickly
		1. Maintaining a working testing environment in every changing microservices environment is not easy
6. It requires code
	1. We need to run the test and check the end state (going to db and checking a specific value)
		1. or calling another service and checking the value
7. Usually used for main scenarios only
	1. Do not try to cover all scenarios with end-to-end
		1. Don't try most extreme ones
			1. It will take a lot of time and it wont be the best use of the efforts
	2. Edge scenarios - integration tests should take care
	3. End-to-end tests - main scenarios only

### Summary ###
1. It is extremely important
2. Focus on the integration tests (most effective tests - least effort with most value)
3. As an architect:
	1. Make sure there is a test automation framework in place
		1. To allow fast deployment cycles - if not, help the customer adopt one
	2. Be involved in the test results analysis, may require architecture changes
		1. If tests show that there is a performance problem with one of the services, it might be a good idea to revist the architecture and improve it

## Service Mesh ##
### Introduction ###
1. One of newest concept
	1. Growing number of products, implementations and articles about it
2. It is one of the most minsunderstood concept
3. What it is
4. When it should and shouldn't be used
5. What is service mesh?
	1. Manages all service-to-service communication in microservices architecture
	2. Provides additional services
	3. Platform agnostic (usually...)

### Problems Solved by Service Mesh ###
1. Microservices communicate between each other a lot
	1. Challenges in inter-service communication
		1. The communication might cause a lot of problems and challenges:
			1. Timeouts - response from calling service does not return on time
			2. Security - to ensure that data passed between services is as secure as possible
				1. When possible, there should be secure authentication between services
			3. Retries - If communication fails once
			4. Monitoring - We can detect problems with communication
				1. We can find out which service timesout or fails
					1. High level view of the system
2. We need the above for microservices
3. Example:

		service1 -x-> service2 - TCP (not REST API) -> service3
						 service3 - retry -> service4
	
	1. How to handle this scenario?
		1. If it is handled in code, this will distract developer from focussing on business logic
	2. TCP instead of REST API
		1. Forces developer to learn TCP communication which they might not be familiar with and it might take more time
	3. Retry on error
		1. Retry logic will distract the developer from focusing on business logic
4. Service mesh - the above problems it tries to solve
	1. Software Components that sit near the service and manage all service-to-service communication
		1. Communication and troubleshooting tasks are handled by service mesh
	2. Provides all communication services
		1. Frees services from handling it
	3. The service interacts with the service mesh only (in standard way - completely oblivious to retries, errors, protocols, monitoring, ... that mesh is doing)
		1. Single end-point that is part of the mesh and what happened to that is mesh problem
5. Services provided by service mesh
	1. Protocol conversion - mesh can convert communication via http api such as REST to a less conventional protocol such as TCP and vice versa
	2. Communication security - Encryption mechanism
	3. Authentication - Using an authentication engine present in the organization such as Active Directory
	4. Reliability - timeouts, retries, health checks, circuit breaking, ...
	5. Monitoring - Bird's view of networking and what is happening with the services
	6. Service discovery - loose coupling between services
	7. Testing (A/B testing, traffic splitting) - mesh can be configured to route the messages to different services to test them while preserving the majority of messages in their original routing
		1. A/B testing
	8. Load balancing - mesh can route the messages to different instances of the service based on values factors
	9. ...
6. Circuit Breaker
	1. Prevent cascading failures when a service fails
	
			service1 --> service2 --> service3
			
		1. If service3 fails and times out
			1. service2 will also time out and eventually service1 will time out as well
				1. The problem worsens if service2 gets more and more calls which causes more timeouts
	2. Solution: Circuit breaker in front of the service3
		1. It monitors service3 and checks how many timeouts it is experiencing, if this number goes above a threshold, the circuit breaker goes into action and cuts the service3 off and from now on circuit breaker will immediately respond with and error and will not wait for the service3 to timeout
			1. service2 will not face timeouts
7. In short
	1. The developer doesn't have to handle any communication aspects between services
		1. Mesh handles them all
		2. Allows developer to focus on business aspects and not on plumbing

### Service Mesh Architecture ###
1. Service mesh components
	1. Placed near services
		1. The service mesh components are called data plane
			1. They do heavy lifting
				1. Converts protocols
				2. Handles security
				3. Implements circuit breaker
				4. Retries timeouts
2. Control plane
	1. Manages and controls data plane
		1. This component configures, manages and configures data planes and ensures that they work according to the actual needs
	2. It defines what kind of security is needed or what protocols are required for the application and what to do in case of timeout etc...
3. Most products, dataplace and control plane are bundled together and have a proprietary command and control protocols
	1. In recent years, initiative was taken for command planes to communicate with different data planes
		1. One company can build control plane that can handle great visualization and monitoring capabilities
		2. Other company can build data plane that can handle heavy loads
	2. The two can be combined to build a great service mesh

### Types of Service Mesh ###
1. Two main types:
	1. In-Process
		1. Service + mesh is part of service service process itself

				[service1[mesh]] --> [[mesh]service2]
			
			1. If a service wants to communicate with other service, it makes a call to it's in-process mesh
			2. The in-process mesh makes a network call to the other mesh
			3. The second mesh relays the message to the other service
		2. Advantages:
			1. No inter-process communication is required to use it
	2. Sidecar
		1. Service mesh is implemented as an out of process component
			1. It is not part of the services process
		2. Service makes a network call to it's mesh
		3. Mesh makes another network call to the other mesh
		4. The second mesh makes another network call to the second service to relay the message
2. In-Process vs Sidecar
	1. In-process
		1. Performance - only one network call (between mesh components only)
		2. Not code agnostic
			1. The service should be aware of it's methods and interfaces
			2. The servcie code should be modified to accomodate the mesh component
	2. Sidecar
		1. Platform agnostic - service mesh is located outside service, we don't care how it is implemented
			1. Service can be implemented using .Net core & mesh can be implemented using node.js
				1. Service mesh implementations can be expanded to other platforms
		2. Code agnostic - code in service doesn't have to be changed to use the side-car mesh
			1. Service just calls an external service using standard API
				1. Service should not know that the API is of service mesh and that it performs routing, validation, etc... (it should look like a simple call)
3. Sidecar implementation is more popular than in-process implementation
	1. Unless strict performance requirements are in place, we can use sidecar implementation

### Products and Implementations ###
1. There are quite a few Service Mesh implementations
	1. Some in-process, most sidecar
	2. Most free, some aren't
	3. DO NOT develop your own
		1. Developers must focus on business logic and not low level implementations of existing products
2. Leading implementations
	1. Sidecar:
		1. Istio - most popular
			1. It is developed to work with containers managed by Kubernetes
				1. We could begin with this and if this option doesn't work for any reason, we can go with other options
		2. Linkerd
			1. Popular
		3. Maesh
			1. Newest among them
	2. In-Process:
		1. DDS (not free)
			1. It puts great emphasis on performance
				1. Popular in military industry
					1. Which requires great performance and reliability
			2. Use it only if system needs blazing fast performance

### Should You Use Service Mesh? ###
1. It is not an easy decision
	1. It has cross system effect
		1. We should be convinced that it is the best option
2. Use it
	1. Only if:
		1. You have a lot of services...
		2. Which communicate a lot with each other
		3. Or you have a complex communication requirement with various protocols or brittle network (that is prone to fail)
			1. If we know ahead that network communication will be a challenge, then consider using service mesh

## Logging and Monitoring ##
### Introduction ###
1. Without proper logging and monitoring, we are going to have a lot of problems with the system
	1. It might lead to it's failure
	2. We can discuss about logging, monitoring, difference between them, specific challenges in microservices architecture and how to implement them correctly
2. Logging & Monitoring
	1. Extremely important in Microservices
		1. Even more than traditional applications
	2. Flow goes through multiple processes
		1. process call chain can save something to database
	3. Hard to get wholistic view
		1. We want to know what happened to the system
			1. It is difficult to stitch the processes together and understand system's behaviour
	4. Hard to know what's going on with the services
		1. We might be able to look at a specific service and understand if there are any problems with it
			1. It is nearly impossible to know what is going on with all the services working together
				1. All the problems are handled by a well designed logging and monitoring

### Logging vs Monitoring ###
1. Differences
	1. In the core they are completely different
		1. Logging
			1. Recording the system's activity - we document what the system did, what the users did, how did the system behave
				1. Used to analyse systems behaviour and making sure everything is good
				2. For detecting and analysing errors
			2. Audit
				1. We can trace user behaviour and see what they did
				2. For regulatory reasons
					1. Example: Banking industry
					2. Exmaple: Specific user actions that led to the error
			3. Documenting errors
				1. Logging every error that happens in the system (and every detail that might be relevant)
					1. Timestamp
					2. Stack trace
					3. Type of error
					4. Inner exceptions
					5. ...
			4. ...
		2. Monitoring
			1. It is based on system's metrics
			2. Tools look at various metrics of the system
				1. Infrastructure related metrics
					1. CPU
					2. Disk
					3. RAM
					4. ...
				2. Application related metrics
					1. Requests per minute
					2. Orders per day
					3. ...
			3. The metrics are made available to the user via sophisticated dashboard
			4. Most important part are the alerts
				1. Alerting when needed
					1. Alerts when a specific metric goes out of range
						1. CPU goes above 90%
						2. Average response time goes above 5 seconds
					2. Alerts are sent to a pre-defined group of people
						1. They can handle the problem
2. Both logging and monitoring are required
	1. To ensure microservices system is reliable and stable

### Implementing Logging ###
1. Logging should provide wholistic view of the system
2. Should allow tracing end-to-end flow
	1. From service from which it origininated to the service where it ended
		1. With all in-between services included
3. Should contain as much information as possible
	1. We cannot have too much information in logging
		1. Ensure to log whatever data we can think of even if in first look we feel it is useless
			1. Log
				1. Timestamp
				2. Severety
				3. Module
				4. Message
				5. Machine name
				6. IP
				7. Port
				8. ...
4. Can be filtered using severity, module, time, etc
	1. Example: All the errors that occured on the orders service in the past 4 hours
	2. The filtering should be quick to get what we need
5. Logging
	1. Traditional logging:
		1. If two services exist, each service has it's own logging infrastructure
			1. The service has it's own logging library
			2. Logs are written to service's own repository (file, database)
				1. Easy to implement
					1. If application has a single process, there is no problem with this approach
	2. Microservices logging:
		1. Problems with traditional approach:
			1. Logs are separate from each other - if we want to look at log trace and end to end flow, that would be a problem
			2. Different formats
				1. One log might be stored as json document
				2. Another log might be stored as regular text
				3. Going between the logs makes it slow and confusing
			3. Logs are not aggregated
				1. We cannot obtain aggregated data on the logs
					1. How many errors were reported in 24 hours
					2. How many db accesses did we have
				2. Solution: Logs should be in central place
			4. Logs can't be analyzed
				1. To analyze logs and generate insights in them, we need to have logs in central location
6. Logging implementation
	1. Microservices:

			service1				service2
				|						|
				----->	logging <-----
				
		1. Whenever services want to write logs, they write it to central logging service
			1. The logs are unified
			2. Aggregated
			3. Can be analyzed
				1. If logs are in the same location, it is easy to locate and analyze the logs
		2. Logging Library?
			1. To generate log records, is there any special requirement?
		3. Transport?
			1. How to transport logs to central logging service?
		4. Logging Service?
			1. Should we use any product or build our own?
7. Logging Library
	1. Better use one library for all the services
		1. The library should be flexible enough and suits development platform we use
			1. Winston (nodejs), Serilog (.net core)
				1. Both are fast and extremely flexible libraries
		2. If using various platforms - one library for each platform
			1. Don't use Nlog for one .Net service and Serilog for another .Net service
		3. Use severity wisely
			1. Severity - tells what kind of event is represented by the log record
				1. Begins with debug (represents information that is of interest only if we are debugging the system but not on regular one)
				2. Info (logs events we should be aware of but a not a reason for concern - system startup, ...)
				3. Warning (Indicates there is some kind of problem but there is nothing much to worry about - keep an eye on it)
				4. Error & Critical - Something really bad happened and the system might go down any minute now
			2. Never fill logs with inappropriate log levels
				1. Debug data with Info severity etc...
				2. Errors should not be in Info
8. Log as much info as possible, at least:
	1. Timestamp
	2. User
	3. Serverity
	4. Service - the event happened in
	5. Message - event we want to log
	6. Stack Trace (if error)
	7. Correlation ID
		1. A flow identifier
		2. It correlates events between services
		3. Enables stitching separate events to single flow
		4. Exmaple:

				service1 --> Logging --> service2
				
							Timestamp: ...
							User: ...
							Severity: ...
							Message: Flow start
							.
							.
							Correlation ID: 56
							
			1. Correlation ID: is arbitrary but must be unique in the system
			2. Both log messages from the services have the same correlation id
				1. 56, Flow start
				2. 56, Flow end
					1. Both log records belong to the same flow because they have the same correlation id
						1. We can filter records by correlation id and get the full flow
9. Transport
	1. It is part of the engine that transports the logs from services to central logging service
		1. Preferably Queue
		2. Balances the load
			1. That might be applied on the logging service and can function properly under heavy load
		3. No performance hit on the client side
			1. The cost and time of computing power for pushing data into a queue is neglibable
				1. It is much lower than writing to a file
		4. Which one to use? Doesn't matter
			1. Usually RabbitMQ / Kafka (popular)
				1. RabbitMQ - simple and flexible
10. Logging Service
	1. Central component that receives and stores log records from the other services in the system
		1. Preferably based on existing indexing / digesting / search product
			1. The products are designed from bottom up to handle a huge amount of data in various formats and to make data accessible using easy to use visualization tools and query language
			2. Such products can usually index any log formats regardless of structure, file format, encoding, ...
		2. Most tools provide great visualization of data
			1. They don't require development at all
				1. There might be some configuration required
					1. Configuration
						1. Receiver
						2. Formats
	2. Popular tools: (both are popular)
		1. ELK stack - personal preference
		2. Splunk

### Implementing Monitoring ###
1. Monitoring looks at metrics and detects anomolies
2. It provides simplified view of the system status
	1. Usually using dashbaord - presents important metrics in an easy to grasp format
3. Alerts when there is a problem - triggers a notification when action is required
	1. Kibana
		1. Charts and diagrams
		2. Presentation of various data points
		3. Highly customizable to our needs
4. Types of Monitoring
	1. Infrastructure monitoring
		1. We monitor the underlying server
			1. CPU
			2. RAM
			3. Disk
			4. Network
			5. Other infrastructure related metrics
		2. Alerts when infrastructure problem is detected
			1. High CPU utilization
			2. Disk failure
		3. Data source: agent installed on the machine
			1. The agent is constantly sampling the infrastructure
			2. The agent sends the metrics information to the monitoring tool which processes it and presents it on the dashboard and if needed sends alerts
	2. Application monitoring (very important for architects)
		1. Monitors the application (not infrastructure)
		2. Looks at metrics published by the app
			1. Requests per minute
			2. Orders per day
			3. ...
		3. We can set alerts when application problem is detected
			1. Bug in the code
			2. Slowdown in response time
		4. Data source for applicaiton monitoring: Application's logs (log database), event log (other mechanisms)
5. Most monitoring products provide both
	1. They have agents installed on the servers
	2. They can connect to the log sources and get information about application
6. Monitoring products: Most are quite good (don't develop your own)
	1. Nagios (on-premise)
	2. ELK stack (on-premise)
	3. New Relic (cloud based)
	4. Application Insights (cloud based)
7. Role of architect:
	1. Ensure there is one
		1. Should not be involved in installing, configuring and maintaining monitoring tool
			1. This is the responsibility of the IT guys
	2. Ensure there is monitoring and it can connect to the system logs

## When Not to Use Microservices ##
### Introduction ###
1. We shouldn't use sometimes
	1. Main scenarios when using microservices is a mistake
2. When not to use microservices
	1. Microservices are not one-size-fits-all solution
		1. Designing every system as a microservices system is a mistake
3. There are cases where they shouldn't be used
	1. If they will be used, they might cause damage
		1. Need to evaluate on a case-by-case basis

### Small Systems ###
1. Small systems with low complexity should usually be a monolith
	1. Microservices add complexity
		1. We need to look at the trade-off between the added complexity of microservices and the advantages they bring with them
			1. For small systems, this tradeoff usually does not justify itself
				1. We don't have the challenges that require microservices in the first place
					1. No point in using it anyway
2. What is complex system? How do we know if the system is complex enough to require microservices
	1. If the service mapping results in 2-3 services - microservices are probably not the right option
		1. Indicates that the system is inherently simple
			1. We don't want to solve non-existing problems by adding complexity
			2. It is better to go with monolith

### Intermingled Functionality or Data ###
1. One of the most important microservice's attributes is its autonomy
	1. Service should be as autonomous as possible
		1. To the point that it should be able to work without any dependencies on external services
		2. When there is no way to separate logic or data - microservices will not help
			1. May even cause performance hit
2. Designing a system when almost all services depend on other services will negate majority of advantages of microservices
	1. Will prevent them from being independent deployment units
	2. Make strongly coupled services - which is what microservices are trying to avoid
3. How to identify this trait?
	1. If almost all requests for data span more than one service - there's a problem - strong indication that data or functionality is not autonomous
		1. Serious problem with mapping of the services
			1. Go back to the drawing board and try to design more autonomous services
			2. If we find there is no way to do that, better go back to monolith

### Performance Sensitive Systems ###
1. If system is extremely performance sensitive - microservices is not always a good idea
2. Example:
	1. Military systems
	2. Real-time applications
	3. Games
	4. ...
3. Rule of thumb: Microservices systems have performance overhead
	1. Result of the network hops
		1. A lot of light weight autonomous components communicate over network
			1. Communication has a substantial performance overhead
				1. Network latency
				2. Serialization and de-serialization of methods
				3. Encryption
				4. ...
		2. For web-sites, this is not a problem
			1. Overhead is not large enough to affect overall performance
				1. If the system is VERY performance sensitive - think twice
	2. Think if the system will be too slow if microservices are used
		1. Look at performance SLA
			1. SLA is in the low-milliseconds to even microseconds - (call to a service is expected to return within a millisecond say)
				1. The system is probably not a good fit for microservices architecture
4. Take a long and hard look at the performance SLA

### Quick-and-Dirty Systems ###
1. Example a POC - a concept to show the feasibility of an idea
	1. The purpose of such a POC is to demonstrate an idea and not an example of an architectural best practice
2. Microservices design and implementation takes time
	1. If the steps in it cannot take a day or two then it needs some serious considerations
3. If you need a small, quick system, and need it NOW - don't go with microservices
	1. We won't meet the deadline
4. The quick-and-dirty systems usually have a short lifespan
	1. Doesn't need state of the art architecture

### No Planned Updates ###
1. If system has no planned updates - microservices architecture is not required
	1. Some systems have almost no planned future updates
	2. For example - embedded systems
		1. Software is part of a hardware unit
			1. Updating it might require a hardware replacement
				1. Updating software is such systems is quite rare
					1. It should not be designed with short deployment cycles in mind
2. Microservices' main strength is in short update cycle
	1. If no updates, then no microservices
3. For other uses cases, it must be thought out carefully as well

## Microservices and the Organization ##
### Introduction ###
1. Transitioning to microservices is not just an architectural or technological journey
	1. It is a move that affects the whole organization
		1. The effect of microservices and how should the organizations adapt to the new architecture
2. Microservices and the Organization
	1. Microservices require different mindset
		1. Tranditional organizations will have hard time succeeding with microservices
	2. A software development shop which was used to do specific things for 20 years and wants to move to microservices without changing anything is going to have problems and will probably fail
3. Without adapting - there's no point in going with microservices
4. Next - how should organization structure change and take advantage of microservices architecture

### Conway's Law ###
1. It is more of an observation introduced in 1967 by Melvin Conway
	1. Computer scientist
2. Still relevant...
3. Law: Describes the relationship between the organization and the software structure / architecture

		Any organization that designs a system (defined broadly) will produce a design whose structure is a copy of the organization's communication structure
		
	1. Various components of the architecture will reflect quite accurately the organizations structure
4. Example: Traditional Project's Organization Chart
	
							Project Manager
		IT-Services Backend-Developers Frontend-Developers DBA
		
	1. IT-Services - VMs, deployment, source control etc...
	2. Backend developers - Java, .Net, Node, ...
	3. Frontend developers - React, Angular, View, ...
	4. DBA - Responsible for setup and maintenance of DBs
5. System design

		Frontend
			|
		Backend
			|
			DB
			|
			IT

	1. Components are designed and built by different teams which should talk with each other
		1. Front-end developers should continously talk with Backend developers to ensure their API client is actually compatible with backend API
		2. Backend developers should always check with the DBAs if DB's structure doesn't suddenly change
	2. The structure is common among traditional organizations
		1. This is a direct result of the Convey's law
6. Such a project structure will not work with microservices

### The Problem with Traditional Team ###
1. It is designed by a traditional project team
	1. This structure is in collision with attribute #3 - Products not Projects
		1. "You build it, you run it" - Werner Vogels, AWS CTO
2. When there are multiple teams - no one takes responsibility
	1. Teams are horizontal - Backend, Frontend, IT etc...
	2. No wholistic view on the product
		1. The team looks at it as a project
			1. Only a single layer of the product is developed by a team and that is it
				1. They don't care about the fate of the product
					1. Is the customer satisfied?
					2. How many bugs were found?
	3. Each team will look at it's own tasks and no-one will look at it's whole product

### The Ideal Team ###
1. The ideal team is responsible for all aspects of the service:
	1. Backend
	2. Frontend
	3. DB
	4. Deployment
	5. ...
	6. UI/UX
2. A team spirit can be given to look at the product as a whole and not just as a project
	1. Such a team will take responsibility for the product and not the project
		1. It eliminates inter-group communication
			1. Paces up the development process
3. The ideal team size
	1. Famous opinion:
		1. "Every interal team should be small enough that it can be fed with two pizzas" - Jeff Bezos
			1. Pizza not mandatory
			2. Exact number varies
			3. Should be small (Usually 3-7)

### Changing Mindset ###
1. Traditional organizations have hard time transitioning to microservices
2. Need help in the process
	1. You can and should help
3. How to help?
	1. Training - Lecture on Microservices, success stories, basic principles
		1. We can teach others (a lot of it)
		2. Conduct lectures about microservices
			1. Tell success stories such as Netflix, Amazon
		3. Explain basic principles that stand at the heart of the microservices
	2. POC - Go small, quick win
		1. Great way to learn new concepts and technologies
		2. Microservices - a great candidate
			1. Define a small focussed system we want to implement
			2. Work with developers and build it together
				1. By going small and being focussed, we get a quick win - for gaining confidence and publishing success story in an organization
	3. Work closely with the team during design and development
		1. When development process begins, we will be the most professional person in the team when it comes to microservices (take advantage of that)
		2. Be with developers, help them feel you will not let them fail
			1. This will ensure that the chances of success are much higher

## Anti-Patterns and Common Mistakes ##
### Introduction ###
1. Microservices require thorough design
	1. A lot of this is happening before writing the first line of code
2. They are not "Fire and Forget"
	1. It's easy to make mistakes that will cause the project to fail
		1. This section: Common mistakes and how to avoid them

### No Well-Defined Services ###
1. The architecture process
	1. Three steps:
		1. Map the components
			1. Split to:
				1. Mapping
					1. The single most important step in the whole process
					2. Determines how the system will look like in the long run
					3. Once set - not easy to change
				2. Communication patterns (how sevices communicate)
		2. Selecting the technology stack
		3. Design the architecture
2. No Well-Defined Services
	1. Negligent mapping results in bloated services
		1. If we don't define well bounded services with clear definition of what is inside and outside
			1. We may end up with huge services
				1. Each service encapsulates loosely related logic
				2. It may keep growing
					1. Dependent functionality gets added continously
						1. and generates a mini-monolith
		2. If we don't de-lineate whats in and whats out, more and more logic will creap it's way inside and service will grow uncontrollably
			1. If mapping is defined properly, where each logic should reside will be clearly defined
				1. To which service the logic should belong to
3. The mapping should be thorough and methodical

### No Well-Defined API ###
1. API is the door to the service
	1. This is how other services or client communicate with the service
	2. This is how the service is exposed to the outer world
	3. Example: REST API exposed
		1. REST API is used to expose the service
			1. It is the de-facto standard for microservices
				1. Other API standards:
					1. GraphQL
					2. gRPC
	4. The APIs should be well thought of and easy to learn
2. No Well-Defined API
	1. If API is not well thought of and easy to learn, no one will be able to use it
		1. We must invest in API design
	2. They must be consistent
		1. The API structure should follow the same standard across all the endpoints and services and must be logical
		2. The consistency should lead to predictability
			1. The developer should be able to guess how the new API will look like based on the existing one and it will make life much easier (for the developer)
	3. API must be versioned
		1. Multiple versions of the API must be supported
			1. When we upgrade the service and modify the API, not all clients will upgrade to the new API at the same moment
				1. Clients might still be using the older versions - plan for that
	4. API must be platform agnostic
		1. We must not expect to receive data types that are specific to the platform
		2. We must not use proprietary communication protocols
		3. We must use only serialisable types
		4. We must ensure that everyone can call the API regardless of the platform they use
	5. API must be part of the design
		1. When designing a service, ensure that API specification is included in the architecture
			1. We must not let the developers decide on the API
				1. They are more focussed in producing the underlying code than the API design
3. API Design Example: Include a table similar to the one below
	1. Get next list to be processed: GET /api/v1/lists/next?location=...
		1. Return Codes: 200 OK, 400 Bad Request
	2. Mark item as collected / unavailable: PUT /api/v1/list/{listId}/item/{itemId}
		1. Return Codes: 200 OK, 404 Not Found
	3. Export list's payment data: POST /api/v1/list/{listId}/export
		1. Return Codes: 200 OK, 404 Not Found
4. Developers know exactly what to implement

### Implementing Cross-Cutting Last ###
1. Every system has cross-cutting (system-wide) services
	1. Services that provide system-wide utilities that are consumed by most of the other services
	2. Include
		1. Logging
		2. Caching - common technique for performance improvement
		3. Users Management
		4. Authorization & Authentication - for users
		5. And more...
2. Implementation:
	1. Should be implemented first
		1. Quite boring to implement and are quite low in the list that developer wants to do
		2. Reasons: Other services are going to use them
			1. If other services are developed when cross cutting services do not exist yet, then the services need to be re-visited when adding functionality provided by the cross-cutting concerns
				1. No one likes to go back and modify existing code
3. Development of cross cutting concerns
	1. Example: logging, caching
		1. Then: Orders, Customers (these services make use of logging and caching services)
			1. If anyone tries to add cross cutting code later on, chances are that they will be ignored or missed

### Expanding Service Boundaries ###
1. Every service has well-defined boundaries
	1. The boundaries clearly define what is included in the service and what is not
2. Expanding these boundaries makes the service inefficient and bloated
3. It's tempting - don't do that!
	1. Example: Orders management
		1. Orders reporting should not be added
4. Many times new service should be used instead of expanding existing service's boundaries
	1. Design reporting service
		1. Bloated service is difficult to maintain and defeats the point of having microservices

## Breaking Monolith to Microservices ##
### Introduction ###
1. A lot of organizations try to go this path of converting legacy monolith to modern microservices systems
	1. There are reaons for this
2. Quite common scenario
3. The organization wants to improve the current system
	1. It believes that migrating to microservices will do that
		1. This is not always the case
4. If we want to take this route, this needs to be thoroughly planned
5. High rate of failures in such projects
	1. Main reason: The whole move was not planned correctly
6. The migration has to be done very carefully
7. As an architect, one of the roles is to hold the client back and not let him run without proper planning

### Motivation for Breaking Monolith ###
1. Why would we want to do that?
	1. Why do we want to take a perfectly working system and tear it apart?
		1. There must be a very good reason
2. Some of the reasons:
	1. Shorten update cycle (major factor) - new or existing system
		1. microservices brings down update cycle from few months to many times in a single day
			1. If monolith is getting frequent changes, it is logical to migrate to microservices
	2. Modularize the system
		1. Componentization via services
			1. Much easier to maintain
			2. Much more flexible for future requirements
	3. Save costs
		1. What costs can be saved?
			1. Software and hardware costs
				1. Monoliths legacy apps are usually based on outdated and expensive technologies
					1. Today's platforms are usually open and free and do not incur on going costs
						1. Other platforms may require support contract or upfront payment
				2. By moving to modern platforms, the organization can save costs
					1. With microservices, the move can be gradual and more manageable
			2. HR costs
				1. Legacy systems come with large and bloated development teams
					1. Large teams cost lot
				2. Organization can move to smaller and more efficient teams
	4. Modernize the system
		1. Legacy monolith apps are based on old technologies that are out of support or close to that
			1. Organization wants to migrate to a newer technology stack
				1. Microservices way is a good way of doing that (since change is gradual and managed and allows modern technology to be integrated into the system in an effective way)
	5. Being attractive
		1. Organizations want to attract top developers to the industry
			1. Difficult task if technological environment is outdated
				1. Developers will prefer workplace with modern and shiny technologies 
					1. Microservices check the box here
		2. This reason is not truly professional but we have fealings and desires and it plays a role in decision making

### Strategies for Breaking Monolith ###
1. Breaking Monolith is a delicate process
2. Must be planned ahead
3. Worst thing that can happen
	1. Here is a legacy system, lets now go write services for it
4. Strategies for Breaking Monolith
	1. New modules as services
	2. Separate existing modules to services
	3. Complete rewrite

### New Modules as Services ###
1. We do not modify existing code
	1. Adding features and modules as services
		1. Over time since system is in ever changing mode, the system will become a pure microservices system (assumption)
			1. This is not always the case
2. Example:
	1. Monolith with the following components
		1. Orders
		2. Inventory
		3. Customers
		4. Payments
		5. Shopping Cart
	2. New requirement: Special sales
		1. New service: Sales Service
			1. REST API is added
				1. Other services can communicate with it
				1. Inventory component can talk to Sales service via REST API
		2. Legacy monolith application is talking to modern microservice
3. Pros
	1. Easy to implement - leaving monolith untouched
	2. Minimum code changes - regarding maintenance
4. Cons
	1. Takes time - Approach takes time
		1. Move to microservices is a function of new requirements and changes done to system
			1. If changes are never required, the system will never become microservices system
	2. End result is not pure microservices architecture
		1. Monolith still exists with services surrounding it
			1. It is unlikely that the whole system will get converted to microservices

### Separate Existing Modules to Services ###
1. Each component of the system is converted from a library to a service
2. Example:
	1. Shopping cart component is separated out into a service wrapped around with a REST API in a separate process
		1. This is not trivial
			1. The code might be dependent on other classes
			2. The code might be stateful
			3. The code might require frequent access to external resources
		2. The code must be thoroughly reviews and usually some change must be done to the component before running it as a service
		3. Other existing components can communicate with the service using it's REST API
	2. The strategy is repeated for other components
3. When we are done, we have a pure microservices system
4. Pros
	1. End result is pure microservices architecture
		1. We are not stuck with a monolith and some services around it
5. Cons
	1. This approach takes time
		1. To separate each component and convert to service
	2. A lot of code changes
		1. Slow cumbersome process
			1. Extensive code reviews
			2. A lot of adaptations
	3. Regression testing required
		1. We have changed the core of the system and we have to ensure that we have not caused any damage

### Complete Rewrite ###
1. Dump everything we have and develop it from scratch
	1. This approach is taken if the system is too old or if components have so many dependencies that the other strategies become impractical
2. Example: 
	1. We develop each component from scratch and add REST API (for services to communicate)
3. End result
	1. Pure microservices
	2. Built on modern platform
	3. Up-to date system
4. Pros
	1. End result is pure mocroservices architecture
	2. Opportunity for modernization
		1. To integrate full CI-CD process
		2. To automate testing
5. Cons
	1. Takes time
		1. Majority of time is spent on design and planning
			1. Not necessarily on development
	2. It can be treated as a new project
		1. We can use all methodologies and techniques for creation of microservices
	3. Rigorous testing is required
		1. This is a new system and we have to ensure it works flawlessly
6. Which one to pick
	1. This depends largely on the complexity of the legacy system
		1. The more complex the system, the more we go for complete re-write
	2. How to figure out if the system is complex?
		1. We need to conduct an extensive code review and examine what is exactly is happening
			1. Based on the study, we can make an educated decision on migrating to microservices strategy

## Case Study ##
### Introduction ###
1. We need to get our hands dirty to fully understand how the parts in the theory are connected and get a good insight
2. Case study:
	1. Use what we learned in a real-world system
	2. Go through main steps of the architecture process:
		1. Functional requirements
		2. Non-functional requirements
		3. Map the components
		4. Defining communication
2. Technology stack won't be discussed
	1. Not specifically relevant to microservices
		1. We are free to use any stack (java, nodejs, .net, ...)
3. By the end of this section, we can download the architecture diagram used in the case study
	1. Full service map of the system
	2. Complete communication methods enabled by each service
		1. Can be used as template for future architecture diagrams

### Introducing MyLib ###
1. MyLib
	1. Library management system
		1. Covers very aspect and every task librarians and library users might use
		2. Manages books inventory
			1. Records new books added to the library
			2. Books removed from it (due to wear and tear)
		3. Manages books' borrowing
			1. Books borrowed by customer are recorded by the system
		4. Manages customers
			1. We want to know how many customers are registered with the library (allowing them to borrow books)
			2. We can add more customers
		5. Display notifications (late returns etc...) - to librarians and customers
			1. If a customer marks a book as wanted, he/she will get a notification 
		6. Charges annual fee
			1. Using system
				1. Could use external payment system
					1. Third party product is preferred

### Non-Functional Requirements ###
1. Requirements - Architecture cannot be designed before there are well defined requirements
	1. Functional - What the system should do
	2. Non-Functional - What the system should deal with
		1. Load
		2. Data volume
		3. SLA
		4. ...
2. As architects, we are more concerned with non-functional requirements (they dictate the architecture)
3. Functional Requirements
	1. Web Based
	2. Manage books inventory
	3. Manage books' borrowing
	4. Manage customers
	5. Display notifications
	6. Charge annual fee
4. NFR - What we ask (ask right questions and get data)
	1. How many expected concurrent users?
		1. It hints about the load the system might expect
			1. Higher the number, higher the load
	2. How many books will be managed?
		1. It indicates what data volume should system support
			1. If millions of records, we need to plan for huge storage
	3. How many borrowings in a day?
		1. Indicates number of daily actions
		2. If this number is high, we need to think about the load
		3. Since every action is recorded in the database, we should calculate data volume generated by this number
			1. See if there is potential problem
		4. What's the desired SLA?
			1. Required uptime of the system
				1. Some military systems or high traffic e-commerce site should never go down
				2. Some might suffer occasional downtimes
				3. Some systems are worthless if they are down for 1/2 hour but for some it is okay
			2. The higher the SLA, the more robust the system should be, the more expensive the hardware is
5. Answers:
	1. 10 concurrent users
		1. The main users are librarians - there aren't many in the library
			1. It is a little bit higher
	2. 10,000 books - not a high number
		1. There is no particular consideration about the data volume
			1. We need precise calculation for data volume
	3. 500 borrowings in a day
		1. Needs closer look
	4. 9/5 - 9 hours a day for 5 days
		1. Extremely low SLA
6. Data volume:
	1. 1 book record = 1 KB (in DB - larger than what we need)
	2. 10,000 books = 10 MB (extremely low - no problem)
	3. 1 borrowing record = 500 bytes (customer id, book id and date)
	4. 500 borrowings / day = ~182K borrowing / year = 91 MB / year
		1. The calculation assumes 365 days of operation - much more than actual - better safe than sorry
		2. The growth is quite small (91 MB/year) ~ 100 MB/year
	5. SLA is not very important
7. Quite relaxed system with no challenges on non-functional side

### Mapping the Components ###
1. Mapping components to services
	1. How to perform this mapping?
		1. Attributes - 9
			1. Microservices attribute #2: "Organized Around Business Capabilities"
			2. Entities - we have them well defined
				1. Lets try and design the services around them - most common design approaches (usually a successful one)
2. Business Entitites
	1. Books
	2. Borrowing
	3. Customers
	4. Utilities - not part of business entities
		1. Notifications
		2. Payments (External System)
		3. View
		4. Note: For the sake of simplicity, we'll not discuss logging & monitoring
3. 3 Services
	1. Books Service
		1. used to manage the books inventory in the library
			1. We can add, modify, remove books from library
				1. Every new book purchased will be added using the service
		2. This service is not responsible for customers borrowing books
			1. There is another service
		3. The service will be used by the librarians
			1. They decide which books to add and remove
		4. This service has storage (=database)
		5. Should be synchronous (immediate response)
			1. Immediate response for it's actions
				1. If a book is added or removed, the librarian should immediately know that it was added or removed
			2. This decision plays important role in API design
		6. This does not depend on other services to operate successfully
			1. Works only around Book entity
		7. Books Service API - dictates other services are going to communicate with it
			1. Nature of communication is important - synchronous or asynchronous
			2. We'll use REST API
				1. Because we need immediate response
			3. Main functionalities:
				1. Get book details - using book id
				2. Add new book
				3. Remove book
				4. Update book
			4. API: (they vary only by the verb - good design)
				1. Get book: `GET /api/v1/book/{bookId}`
					1. 200 OK
					2. 404 Not Found - if book is not found
				2. Add book: `POST /api/v1/book`
					1. 200 OK
				3. Update book: `PUT /api/v1/book/{bookId}`
					1. 200 OK
					2. 404 Not Found
				4. Remove book: `DELETE /api/v1/book/{bookId}`
					1. 200 OK
					2. 404 Not Found
	2. Borrowing Service
		1. Used to manage the borrowing of books
			1. Borrows or returns books by customer
		2. Also used by librarians
		3. Has a storage (=database)
		4. Should be synchronous (immediate response - librarians need to know immediately)
		5. Does not depend on other services
			1. It does refer to other services - Books service, Customers service
				1. We can still say it does not depend
					1. Will the service be working if it is the only operational service is the system?
						1. Yes - the service does not CALL other services
							1. It just uses ids that can be used in other services dbs but its operation does not depend on it
		6. We'll use REST API
			1. Because we need immediate response
		7. Main functionalities:
			1. Add a borrowing
			2. Add a book return
			3. Get borrowing by customer (to see what books were borrowed by a customer)
		8. API
			1. Get borrowing: `GET /api/v1/borrowing/{customerId}`
				1. 200 OK
				2. 404 Not Found
			2. Add new borrowing: `POST /api/v1/borrowing`
				1. 200 OK
			3. Add new book return: `POST /api/v1/borrowing`
				1. 200 OK
	3. Customers Service
		1. Used to manage the library's customers
		2. Used by the librarians
		3. Has a storage (=database)
		4. Should be synchronous (immediate response)
		5. Does not depend on other services
			1. It refers to the books & borrowing DB)
		6. We'll use REST API
			1. Because we need immediate response
		7. Main functionality
			1. Add a customer
			2. Remove a customer
			3. Get customer details
			4. Get customer's borrowed books
		8. API
			1. Get customer details: `GET /api/v1/customer/{customerId}`
				1. 200 OK
				2. 404 Not Found
			2. Get customer's borrowed books: `GET /api/v1/customer/{customerId}/books` (books - sub-entity - indicates books of specific customer - sub-entities should appear after main entity)
				1. 200 OK
				2. 404 Not Found
			3. Add new customer: `POST /api/v1/customer`
				1. 200 OK
			4. Remove customer: `DELETE /api/v1/customer/{customerId}`
				1. 200 OK
	4. Notifications Service
		1. Used to send notifications to the library's customers
			1. Book was returend, New books added, etc...
		2. Used by the other services
			1. Not by human users
			2. Books service might call this when a new book is added or borrowing service might use it when a book is returned
		3. Asynchronous
			1. Services calling it do not expect immediate response
				1. They expect this service to send notifications at the earliest convenience
		4. Might experience load (ie. Sending notifications to all the customers will result in huge amount of notifications sent)
			1. How to handle this load?
				1. Notifications Service API
					1. We'll use Queue
						1. No immediate response required
						2. Distributes load
							1. Messages to be handled can be pushed to the queue and wait until someone can handle them
	5. Payments Service
		1. Used to send payments instructions to external service
			1. Doesn't do the charging but routes to third party applications
				1. Handling payments is extremely delecate and painful process
					1. Better to outsource whenever possible
		2. Used by other services (for example - a new customer joins the library)
		3. Asynchronous
		4. High-reliability is a must
			1. Money is involved!
		5. API
			1. We'll use Queue
				1. No immediate response required
				2. High-availability
					1. Queue engines offer high availability - solves reliability problem
						1. Even if service is down, the payment instructions are safely stored in the Queue waiting to be processed
	6. View Service
		1. Used to serve static content to the web browser
			1. HTML, CSS, JS files
		2. Browser will call this service when first entering the system
			1. After getting the static content, most of the other work will be done with other services (books, borrowing, customers, ...)
		3. Very basic
			1. Almost no logic
			2. No special considerations
			3. It is glorified file share
		4. No API required, works directly with the browser
6. 6 services with clearly defined communication channels

### Download the Architecture Diagram ###
1. Architecture diagram: Very important part of our work as an architect
	1. It provides a high level view of the system and shows value services and relationship between them
	2. Services not exposed to the user are shown at the bottom
2. Download the diagram from resources section:
	1. [https://www.udemy.com/course/microservices-architecture-the-complete-guide/learn/lecture/21112244#content](https://www.udemy.com/course/microservices-architecture-the-complete-guide/learn/lecture/21112244#content)
3. It helps us and customer to figure out exactly what is going on and help us become a better architect

## Conclusion ##
### Download the Microservices Checklist ###
1. Checklist - essential tool in our journey to microservices
	1. It contains all we need to ensure we do our best job with microservices
		1. Describes the 9 microservices attributes
			1. All of them are not mandatory but we need to keep them in mind while designing microservices
		2. Details all the steps in the microservices architecture process
			1. A well defined architecture process needs to be followed if we want to ensure we did not miss anything along the way
		3. Contains flow diagram to help you decide if microservices is the right approach for your system
			1. Although popular, microservices is not the silver bullet we should always use
				1. There are cases where microservices should not be used and may also harm the performance of the system
		4. Contains servcie mesh refresher - what it is, when to use it
		5. Describes the 3 approaches for breaking monolith to microservices
			1. We might encounter such project (because organizations are  trying to migrate to microservices)
				1. We have to be well equipped for such tasks
2. Download Checklist:
	1. [https://www.udemy.com/course/microservices-architecture-the-complete-guide/learn/lecture/21139772#content](https://www.udemy.com/course/microservices-architecture-the-complete-guide/learn/lecture/21139772#content)

### Conclusion ###
1. Short recap
	1. What is microservices architecture
	2. How to use it
	3. When not to use it
	4. How to become a better software architect
2. Topics
	1. Welcome
	2. History of microservices - where did we come from (monolith and SOA)
	3. Problems with monolith & SOA - single technology platform and inflexible deployment
	4. Microservices architecture - 9 attributes
	5. Problems solved by microservices - that were present in monolith and SOA
	6. Designing microservices architecture - component mapping and communication patterns
	7. Deploying microservices - should be automated
	8. Testing microservices - should be automated
	9. Service mesh - relatively new and abstracts interservice communication - makes life much easier
	10. Logging and monitoring - extremely crucial for microservices
	11. When not to use microservices
	12. Microservices and the organization - adaptations we have to do in order to support new architectural style
	13. Anti-patterns and common mistakes
	14. Breaking monolith to microservices
	15. Case study
	16. Conclusion

### BUNUS: Next Steps ###
1. [Software Architects Discussions](https://www.facebook.com/groups/127639125043271)
2. The complete guide to becoming a software architect
	1. 