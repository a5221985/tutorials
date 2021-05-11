# Pattern: Microservice Architecture #
## Context ##
1. Server-side enterprise application development
	1. Must support different clients
		1. Desktop browsers
		2. Mobile browsers
		3. Native mobile apps
	2. Might expose API (for 3rd parties to consume)
	3. Might integrate with other apps via
		1. Web services
		2. Message broker
	4. Handles requests
		1. HTTP requests and messages
			1. By executing business logic
			2. By accessing a database
			3. By exchanging messages with other systems
			4. Returning HTML/JSON/XML response
2. There are logical components corresponding to different functional areas of application

## Problem ##
1. What is the application's deployment architecture

## Forces ##
1. There is a team of developers working on application
2. New team members must quickly become productive
3. Application must be easy to understand and modify
4. We want to practice continuous deployment of the application
5. We must run multiple instances of the application on multiple machines in order to satisfy scalability and availability requirements
6. We want to take advantage of emerging technologies (frameworks, programming langugages, etc ...)

## Solution ##
1. An architecture that structures app as set of loosely coupled, collaborating services
	1. Corresponds to Y-axis of Scale Cube
		1. Each service is:
			1. Highly maintainable and testable
				1. Enables rapid and frequent development and deployment
			2. Loosely coupled with other services
				1. Enables a team to work independently majority of the time on their service(s)
					1. Without getting impacted by changes to other services
					2. Without affecting other services
			3. Independently deployable
				1. Enables a team to deploy their service without having to coordinate with other teams
			4. Capable of being developed by small team
				1. Essential for high productivity by avoiding high communication head of large teams
2. Services communicate wither using
	1. Synchronous protocol - HTTP/REST
	2. Asynchronous protocol - AMQP
3. Services can be developed and deployed independently of one another
4. Each service has it's own database
	1. To be decoupled from other services
		1. Data consistency between services is maintained using Saga pattern
5. [Nature of a service](http://chrisrichardson.net/post/microservices/general/2019/02/16/whats-a-service-part-1.html)

## Examples ##
### Fictitious e-commerce application ###
1. Consider e-commerce application
	1. It takes orders from customers
	2. It verifies inventory and available credit
	3. It ships them
2. Components
	1. StoreFrontUI - implements user interface
	2. Account Service - Checking credit
	3. Inventory Service - Maintaining inventory
	4. Shipping Service - Shipping orders

		![microservice_architecture](microservice_architecture.png)

### Show me the code ###
1. [example applications developed by Chris Richardson](http://eventuate.io/exampleapps.html)

## Resulting Context ##
### Benefits ###
1. Solutions has following benefits
	1. Enables continous delivery and deployment of large, complex applications
		1. Improved maintainability
			1. Each service is relatively small
				1. Easier to understand and change
		2. Better testability
			1. Services are smaller and faster to test
		3. Better deployability
			1. Services can be deployed independently
		4. Enables us to organize development effort around multiple, autonomous teams
			1. Each (two pizza) team owns and is responsible for one or more services
			2. Each team can develop, test, deploy and scale their services independently of all other teams
	2. Each microservice is relatively small
		1. Easier for developer to understand
		2. IDE is faster making developers more productive
		3. App starts faster
			1. Makes developers more productive
			2. Speeds up development
	3. Improved fault isolation
		1. If there is memory leak in one service, then only that service will be affected
			1. Other services will continue to handle requests
				1. One misbehaving component of a monolithic architecture can bring down entire system
	4. Eliminates long-term commitment to technology stack
		1. To develop a new service, we can pick up a new technology stack
		2. If we want to make major changes to existing service, we can re-write it using new technology stack

### Drawbacks ###
1. Solution has drawbacks
	1. Developers must deal with additional complexity of constructed distributed system:
		1. Developers must implement inter-service communication mechanism and deal with partial failure
		2. Implementing requests that span multiple services is more difficult
		3. Testing interactions between services is more difficult
		4. Implementing requests that span multiple services requires careful coordination between teams
		5. Developer tools/IDEs are oriented on building monolithic application
			1. They don't provide explicit support for developing distributed applications
	2. Deployment complexity
		1. There is operational complexity of deploying and managing many different services (in production)
	3. Increased memory consumption
		1. The architecture replaces N monolithic app instances with NxM service instances
		2. If each service runs in it's own JVM (or equivalent)
			1. Usually necessary to isolate the instances
				1. There is overhead of M times as many JVM runtimes
		3. If each service runs on its own VM (e.g. EC2 instance) (Netflix)
			1. The overhead is even higher

### Issues ###
1. Many issues to address

#### When to use the microservice architecture? ####
1. Challenge is deciding when to use it
	1. First version of app usually does not have the problems that this approach solves
	2. Distributed architecture slows down development
		1. A major problem for startups (because the challenge is how to rapidly evolve business model and accompanying application)
			1. Y-axis splits can make it much more difficult to iterate rapidly
				1. However, if challenge is how to scale and we want to use functional decomposition
					1. The tangled dependencies might make it difficult to decompose monolithic app into set of microservices

#### How to decompose the application into services? ####
1. Challenge: How to partition system into microservices (it is like an art)
2. The following strategies can be used
	1. [Decompose by business capability](https://microservices.io/patterns/decomposition/decompose-by-business-capability.html)
		1. Define services corresponding to business capabilities
	2. [Decompose by domain-driven design subdomain](https://microservices.io/patterns/decomposition/decompose-by-subdomain.html)
	3. Decompose by verb or use case and define services that are responsible for particular actions
		1. Example: **Shipping Service**
			1. Responsible for shipping complete orders
	4. Decompose by nouns or resources (by defining service responsible for all operations on entities/resources of given type)
		1. Example: **Account Service**
			1. Responsible for managing user accounts
3. Each service should have small set of responsibilities
	1. [Single Responsibility Principle](http://www.objectmentor.com/resources/articles/srp.pdf) - Class should only have one reason to change
		1. SRP can be used to design a service as well
4. Unix utilities
	1. Utilities provided: grep, cat, find, ...
	2. Each utility does exactly one thing and does it exceptional well (usually)
	3. The utilities are combined using shell script to perform complex tasks

#### How to maintain data consistency? ####
1. To ensure loose coupling, each service has it's own database
	1. Challenge: Maintaining data consistency between services
		1. 2 phase-commit or distributed transactions is not an option for many apps
		2. Solution: [Saga pattern](https://microservices.io/patterns/data/saga.html)
			1. Service publishes an event when its data changes
			2. Other services consume the event and update their data
			3. Ways to reliably update data and publish events
				1. [Event Sourcing](https://microservices.io/patterns/data/event-sourcing.html)
				2. [Transaction Log Tailing](https://microservices.io/patterns/data/transaction-log-tailing.html)

#### How to implement queries? ####
1. Challenge: Retrieving data owned by multiple services
	1. Patterns:
		1. [API Composition](https://microservices.io/patterns/data/api-composition.html)
		2. [Command Query Responsibility Segregation](https://microservices.io/patterns/data/cqrs.html)

## Related Patterns ##
1. [Monolithic architecture](https://microservices.io/patterns/monolithic.html) - alternative
2. Other patterns that address issues that we would encounter when applying microservices architecture
	
	![patterns_related_to_microservices.jpeg](patterns_related_to_microservices.jpeg)
	
	1. Decomposition patterns
		1. Decompose by business capability: [Decompose by business capability](https://microservices.io/patterns/decomposition/decompose-by-business-capability.html)
		2. Decompose by subdomain: [Decompose by subdomain](https://microservices.io/patterns/decomposition/decompose-by-subdomain.html)
	2. Database per Service pattern: [Database per Service pattern](https://microservices.io/patterns/data/database-per-service.html)
		1. Each service has its own database to ensure loose coupling
	3. API Gateway pattern: [API Gateway pattern](https://microservices.io/patterns/apigateway.html)
		1. Defines how clients access services in microservices architecture
	4. Client-side Discovery: [Client-side Discovery](https://microservices.io/patterns/client-side-discovery.html) & [Server-side Discovery](https://microservices.io/patterns/server-side-discovery.html)
		1. Patterns used to route requests for a client to available service instance in microservice architecture
	5. Messaging and Remote Procedure Invocation pattern
		1. Two ways that services can communicate
	6. Single Service per Host: [Single Service per Host](https://microservices.io/patterns/deployment/single-service-per-host.html) & [Multiple Services per Host](https://microservices.io/patterns/deployment/multiple-services-per-host.html) patterns
		1. Two different deployment strategies
	7. Cross-cutting concerns patterns:
		1. Microservices chassis pattern: [Microservice chassis pattern](https://microservices.io/patterns/microservice-chassis.html)
		2. Externalized configuration: [Externalized configuration](https://microservices.io/patterns/externalized-configuration.html)
	8. Testing patterns:
		1. Service Component Test: [Service Component Test](https://microservices.io/patterns/testing/service-component-test.html)
		2. Service Integration Contract Test: [Service Integration Contract Test](https://microservices.io/patterns/testing/service-integration-contract-test.html)
	9. Circuit Breaker: [Circuit Breaker](https://microservices.io/patterns/reliability/circuit-breaker.html)
	10. Access Token: [Access Token](https://microservices.io/patterns/security/access-token.html)
	11. Observability patterns:
		1. Log aggregation: [Log aggregation](https://microservices.io/patterns/observability/application-logging.html)
		2. Application metrics: [Application metrics](https://microservices.io/patterns/observability/application-metrics.html)
		3. Audit logging: [Audit logging](https://microservices.io/patterns/observability/audit-logging.html)
		4. Distributed tracing: [Distributed tracing](https://microservices.io/patterns/observability/distributed-tracing.html)
		5. Exception tracking: [Exception tracking](https://microservices.io/patterns/observability/exception-tracking.html)
		6. Health check API: [Health check API](https://microservices.io/patterns/observability/health-check-api.html)
		7. Log deployments and changes: [Log deployments and changes](https://microservices.io/patterns/observability/log-deployments-and-changes.html)
	12. UI patterns:
		1. Server-side page fragment composition: [Server-side page fragment composition](https://microservices.io/patterns/ui/server-side-page-fragment-composition.html)
		2. Client-side UI composition: [Client-side UI composition](https://microservices.io/patterns/ui/client-side-ui-composition.html)

## Known Uses ##
1. Large scale websites evolved from monolithic architecture to microservices architecture (Netflix, Amazon, eBay)
2. Netflix
	1. Has upto 30% internet traffic
	2. It has large scale service oriented architecture
	3. Handles over 1 billion calls per day to video streaming API over 800 kinds of devices
		1. Each call fans out to six calls to backend services
3. Amazon.com
	1. First had 2-tier architecture
	2. It was then migrated to service oriented architecture (with 100s of backend services)
	3. Apps calling the services
		1. Website
			1. Calls 100-150 services to get data used to build the web-page
		2. Apps that call service API
4. eBay.com
	1. Auction site
	2. Evolved from monolithic architecture to service-oriented architecture
	3. Application tier has multiple independent applications
		1. Each application implements business logic for specific function area
			1. Buying
			2. Selling
	4. Each application uses X-axis splits
		1. Some applications (search say) uses Z-axis splits
			1. A combination of X-, Y-, and Z- style scaling is used for database
5. Other examples: [Other examples](https://microservices.io/articles/whoisusingmicroservices.html)

## Examples ##
1. [Examples](http://eventuate.io/exampleapps.html)

## See Also ##
1. [Good introduction to microservice architecture](https://microservices.io/microservices/news/2018/02/20/no-such-thing-as-a-microservice.html)