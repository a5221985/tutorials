# Microservices #
## Definition of New Architectural Term ##
1. It is a particular way of designing software applications as suites of independently deployable services.
2. Organization of services:
	1. around business capability
	2. automated deployment
	3. intelligence in endpoints
	4. decentralized control of languages and data

## Introduction ##
1. It is a style of software systems.
2. Cons: No much information exists on microservices style and how to implement it.
3. Architecture: 
	1. A single application is developed as a suite of small services with each service running its own process and communicating with lightweight mechanisms (HTTP resource API).
	2. Services are built around business capabilities.
	3. Services are independently deployable by fully automated deployment machinery.
	4. Less centralized management required.
	5. Each service can be written in different programming languages
	6. Each service can use different data storage technologies
7. Comparing microservices architecture with monolithic architecture:
	1. Monolithic application is built as a single unit.
		1. Enterprise apps usually have 3 main parts: client-side user interface, (HTML pages, js running on browser), database (consists of many tables inserted into common, relational dbms), server-side apps.
			1. Server-side app: handles http requests, executes domain logic, retrieves and updates data from db, selects and populates html views and send them to browser.
				1. It is a monolith (single logical executable)
				2. If there is any change to the system, the entire system has to be rebuilt, versioned and deployed
		2. All requests are handled by a single process. The application is divided logically using features of the language such as classes, functions, namespaces. 
		3. The app can be run and tested on a laptop. 
		4. A deployment pipeline can be used to ensure that changes are properly tested and deployed into production.
		5. Many instances of a monolith can be run behind a load-balancer (horizontal scaling)
		6. Problems:
			1. Change cycles are tied together (change made to one small part requires entire monolith to be rebuilt and deployed)
			2. Difficult to keep a good modular structure (making changes that is supposed to affect only one module becomes harder)
			3. Scaling has to be done for the entire app but not parts of it which requires greater resource (?)

		![monoliths_and_microservices](monoliths_and_microservices.png)
	2. Microservices:
		1. Apps are built as suites of services
		2. Services are independently deployable and scalable
		3. Each service has firm module boundary
		4. Different services can be written in different programming languages
		5. Different services can be managed by different teams

## Characteristics of a Microservice Architecture ##
1. Common characteristics of a microservices architecture

### Componentization via Services ###
1. What makes a component?
	1. It is a unit of software that is independently replaceable and upgradeable.
2. Microservices componentizes by breaking the app down into services
3. Libraries: components linked into program and called using in memory function calls
4. Services: Out-of-process components who communicate with web service request, remote procedure call
5. Why use services instead of libraries?
	1. Services are independently deployable
	2. If libraries are used, a change to a single component requires redeployment of entire application.
	3. If changes are made to a single service, only that service needs to be redeployed.
	4. There may be changes in service interface which needs coordination
		1. Good microservices architecture minimizes these through cohesive service boundaries and evolution mechanisms in service contracts
	5. Most languages do not have good mechanism to define explicit published interface. There is usually tight coupling between components. Services use explicit remote call mechanisms
	6. Downsides:
		1. Remote calls are more expensive than in-process calls (remote APIs should be coarser-grained which is awkward to use)
		2. If change to allocation of responsiblities have to be made between components, the movement of behavior across process boundaries is harder to implement.
6. A service can map to one or more runtime processes
	1. the multiple processes can be deployed together (app process and db process)

### Organized Around Business Capabilities ###
1. To split application
	1. Management may divide the technology layer into UI teams, server-side teams, database teams
		1. Small changes requires takes time and needs budgetary approval
		2. Convey'y law:
			1. Any organization that designs a system (defined broadly) will produce a design whose structure is a copy of the organization's communication structure
	2. Microservices approach: Splitting into services organized around business capability
		1. Each service may include user-interface, persistent storage, external collaborators -> teams will be cross functional

		![PreferFunctionalStaffOrganization](PreferFunctionalStaffOrganization.png)
	3. Each product can be split into services communicating via message bus
2. Challenge in changing monolith into a microservices app
	1. Changing communication pattern from in-memory method invocation to remote process invocation
	2. Monolith: Dividing around business capabilities across business lines
		1. A large team can divide along business lines
		2. Problems:
			1. Tend to organize around too many contexts
	3. Dividing based on services (keeps team boundaries clear (?))

### Products not Projects ###
1. Project model:
	1. Goal: deliver a piece of software
	2. On completion, the software is handed over to maintenance team and project team that built is disbanded
2. Microservices:
	1. A team owns the product during its full lifetime (Amazon's: you build, you run it) where development takes responsibility for software in production
		1. Increases contact with users because they take some support burden
	2. Product model: We can link it to business capabilities (how can software assist users to enhance business capabilities) rather than as a set of functionality to be completed
	3. Smaller granularity of services makes it easier to have relationships between service developers and users (?)   

### Smart Endpoints and Dumb Pipes ###
1. Traditional approach:
	1. Making communication mechanism smart
		1. Example: Enterprise Service Bus (ESB): has sophisticated facilities for message routing, choreography, transformation, applying business rules
2. Microservices approach:
	1. Smart endpoints and dumb pipes:
		1. Apps are as decoupled and cohesive as possible
		2. Each app has its own domain logic and acts like filter in Unix
			1. Each app receives a request and produces a response
		3. Apps are coreographed using simple RESTish protocols (instead of complex WS-Choreography, BPEL, orchestration by central tool)
	2. Common protocols:
		1. HTTP reqest-response with resouce APIs
		2. Lightweight messaging
	3. Uses protocols used by www and Unix
	4. Frequently used resources are cached
	5. Messaging:
		1. Over light weight message bus
		2. Example: RabbitMQ or ZeroMQ
	6. Naive conversion from in-memory method calls to RPC does not perform well

### Decentralized Governance ###
1. Single Technology Platforms is the consequence of cenrtralized governance
2. Breaking up monolith into services gives us choices
	1. Node.js for simple reports page
	2. C++ for gnarly near-real-time component
	3. Swapping db that better suits read behavior of a component
3. Developers of microservices can develop useful tools which can be used to solve similar problems (instead of following defined standards) 
4. Example:
	1. Netflix: battle-tested code is shared as libraries for other developers to solve similar problems or leaves the option open for different approach
5. Shared libraries focus on
	1. Data storage
	2. Inter-process communication
	3. ...
4. How to manage service contracts?
	1. Tolerant Reader: 
	2. Consumer-Driven Contracts: 
		1. Increases confidence and provides fast feedback to check if services are functioning
	3. Tools can be used to define contracts of a service
		1. Make it part of automated build first before writing code
		2. Code is written to just satisfy the contract

### Decentralized Data Management ###
1. Conceptual model of the world differs between systems
	1. Sales view of customer differs from support view
2. Domain driven design:
	1. DDD divides complex domain into multiple bounded contexts and maps out relationships between them (useful for both monolithic and microservices architecture). There is a correlation between services and context boundaries.
3. Microservices prefer letting each service manage its own database
	1. Polyglot persistence: using a variety of data storage technologies for different kinds of data

	![decentralised-data](decentralised-data.png)
4. How are updates done?
	1. Using transactions to guarantee consistency when updating multiple resources.
		1. Problems: Temporal coupling
	2. Distributed transactions: Difficult to implement
	3. Microservices: Use transactionless coordination between resources - consistency is only eventual consistency and problems are dealt with by compensating operations (How?)
		1. Business is okay with some inconsistency (to meet demand)

### Infrastructure Automation ###
1. Cloud, AWS reduces operation complexity of building, deploying and operating microservices
2. CI and CD can be used and infrastructure automation can be used.

	![basic-pipeline](basic-pipeline.png)

	1. Key features:
		1. Automated tests
		2. Automated deployment to each environment
3. For microservices, the operational landscape may be different for each of them

	![micro-deployment](micro-deployment.png)

### Design for failure ###
1. Apps have to be designed to tolerate failures of services (components)
	1. A service call can fail (may be due to unavailability of supplier)
2. Client must respond gracefully in failure situation
3. This introduces additional complexity to handle failures
4. Failures have to be detected quickly and if possible, auto-restore
	1. Real time monitoring must be in place
5. Semantic monitoring provides early warning
6. In monoliths, libraries in same process does not give transparency to know when services are disconnected.
7. Monitoring each service for
	1. up/down status
	2. business relevant metrics
	3. circuit breaker status
	4. current throughput
	5. latency

### Evolutionary Design ###
1. Property when deciding components: independent replacement and upgradation (rewriting component without affecting collaborators)
2. Example: Guardian website
	1. microservices use monolith's API
	2. For features which are temporary, the portion can be put together using rapid development languages and removed once event is over.
3. Another approach: Keep things that change at the same time in a single service.
	1. If there are services changing at the same time, then merge them
4. Downside: Change in one service may break its consumers
	1. Solution: design services as tolerent as possible to changes in suppliers

## Are Microservices the Future ##
1. As compared to monoliths, the experience is better and we need to wait to judge
2. It depends on how well a software can be componentized.
	1. It is often difficult to figure out the boundaries
3. Refactoring is harder if components are services than in-process libraries (moving code across boundaries is difficult)
4. Interface changes need to be coordinated between participants (produceres and consumers), backwards compatability layers must be added, testing is more complicated
5. If components do not compose cleanly, complexity may get moved from inside the component to connections between components (may be to a place harder to control)
6. New techniques may be adopted by more skillful teams. A skillful technique for one team may not work for another team. A poor team will build a poor system and microservices may not make the system less messy.
7. Reasonable argument: Do not start with microservices architecture but with a monolith keeping it modular and then break it up into services if monolith is a problem.

## Further Reading ##
1. Microservices Resource Guide