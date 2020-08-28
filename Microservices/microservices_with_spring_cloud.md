# Microservices with Spring Cloud #

## Introduction ##
### Microservices and RESTful APIs with Spring Boot and Spring Cloud - Preview ###
### Congratulations ###
### Introduction to the Course & Course Guide ###

## Introduction to Web Services ##
### What is a Web Service? ###
### Important How Questions Related to Web Services ###
### Web Services - Key Terminology ###
### Introduction to SOAP Web Services ###
### Introduction to RESTful Web Services ###
### SOAP vs RESTful Web Services ###

## Restful Web Services with Spring Boot ##
### Section Introduction - RESTful Web Services with Spring Boot ###
### Step 01 - Initializing a RESTful Services Project with Spring Boot ###
### Fastest Approach to Solve All Your Exceptions ###
### Step 02 - Understanding the RESTful Services We Would Construct in this Course ###
### Step 03 - Constructing a Hello World Service ###
### Step 04 - Enhancing the Hello World Service to Return a Bean ###
### Step 06 - Enhancing the Hello World Service with a Path Variable ###
### Step 07 - Constructing User Bean and User Service ###
### Step 08 - Implementing GET Methods for User Resource ###
### Step 09 - Implementing POST Method to Construct User Resource ###
### CODE BACKUP FILE: For Reference ###
### Step 10 - Enhancing POST Method to Return Correct HTTP Status Code and Location ###
### Step 11 - Implementing Exception Handling - 404 Resource Not Found ###
### Step 12 - Implementing Generic Exception Handling for all Resources ###
### Step 13 - Exercise: User Post Resource and Exception Handling ###
### Step 14 - Implementing DELETE Method to Delete a User Resource ###
### COURSE UPDATE: Add Dependency spring-boot-starter-validation ###
### Step 15 - Implementing Validations for RESTful Services ###
### COURSE UPDATE: HATEOAS Updates ###
### Step 16 - Implementing HATEOAS for RESTful Services ###
### Step 17 - Overview of Advanced RESTful Service Features ###
### Step 18 - Internationalization for RESTful Services ###
### Step 18 Part 2 - Internationalization for RESTful Services ###
### Step 19 - Content Negotiation - Implementing Support for XML ###
### COURSE UPDATE: Disable XML Format Support ###
### COURSE UPDATE: USE SWAGGER 3.0.0 for Spring Boot 2.2+ ###
### Step 20 - Configuring Auto Generation of Swagger Documentation ###
### Step 21 - Introduction to Swagger Documentation Format ###
### Step 22 - Enchancing Swagger Documentation with Custom Annotations ###
### Step 23 - Monitoring APIs with Spring Boot Actuator ###
### Step 24 - Implementing Static Filtering for RESTful Service ###
### Step 25 - Implementing Dynamic Filtering for RESTful Service ###
### Step 26 - Verisoning RESTful Services - Basic Approach with URLs ###
### Step 27 - Versioning RESTful Services - Header and Content Negotiation Approach ###
### Step 28 - Implementing Basic Authentication with Spring Security ###
### Step 29 - Overview of Connecting RESTful Service to JPA ###
### COURSE UPDATE: H2 Database URL ###
### Step 30 - Constructing User Entity and Some Test Data ###
### Step 31 - Updating GET Methods on User Resource to Use JPA ###
### Step 32 - Updating POST and DELETE Methods on User Resorurce to Use JPA ###
### Step 33 - Constructing Post Entity and Many to One Relationship with User Entity ###
### Step 34 - Implementing a GET Service to Retrieve All Posts of a User ###
### Step 35 - Implementing a POST Service to Construct a Post for a User ###
### Step 36 - Richardson Maturity Model ###
### Step 37 - RESTful Web Services - Best Practices ###

## Microservices with Spring Cloud ##
### Section Introduction - Microservices with Spring Cloud ###
1. Topics:
	1. Spring Cloud Config Server and Bus
	2. Load Balancing with Ribbon and Feign
	3. Implement Naming Server with Eureka
	4. Implementing API Gateway with Zuul
	5. Distributed Tracing with Zipkin
	6. Fault Tolerence with Hystrix
2. Spring cloud components are developed
3. Github repository
	1. [https://github.com/in28minutes/getting-started-in-5-steps](https://github.com/in28minutes/getting-started-in-5-steps)
		1. Components
		2. Ports
		3. URLs
		4. Complete code
		5. Folder for each component

### Step 00 - 01 - Introduction to Microservices ###
1. Definitions:
	1. Small autonomous services that work together - Sam Newman
	2. There is a bare minimum of centralized management of these services, which may be written in different programming languages and use different data storage technologies - James Lewis and Martin Fowler
	3. In short, the microservice architectural style is an approach to developing a single application as a suite of small services, each running in its own process and communicating with lightweight mechanisms, often an HTTP resource API...contd
	4. These services are built around business capabilities and independently deployable by fully automated deployment machinery...contd
2. Microservices
	1. REST
		1. Usually exposed by REST
	2. & Small Well Chosen Deployable Units
		1. Well thought out boundaries
	3. & Cloud Enabled
		1. Building set of small u services instead of one monolith
		2. We can have multiple instances of each of the microservices

				microservice1 -> A1, A2
				microservice2 -> B1, B2, B3, B4
				microserivce3 -> C1
			
			1. We can bring up another if load is increased

3. Cloud enabling:
	1. Set up an architecture such that it would be able to dynamically adjust and be able to bring new instances up and bring the old instances down

### Step 00 - 02 - Challenges with Microservices ###
1. Challenges with building us:
	1. Bounded context
		1. How to identify boundary?
		2. What to do in each one of them?
		3. What should we not do in each one of them?
		4. We may need business knowledge to establish right boundaries between the us
			1. Experience:
				1. It is an evolutionary process
					1. Try to follow domain driven design (read the book)
					2. Need to play around
					3. Try to identify right boundaries at that point in time
						1. As we gain more knowledge, we must be able to put in more into the microservices
	2. Configuration management
		1. Say 10 us, 5 envs, 50 instances
			1. Lot of work for operations team
	3. Dynamic scale up and scale down
		1. Establishing technology to be able to do that
			1. Based on load, we may have to change the number of instances automatically
				1. Using dynamic load balancing
					1. New ones must be used
				2. Must be able to dynamically distributed
	4. Visibility
		1. If there is a bug
			1. How to identify where the bug is
				1. We need centralized logging
					1. Which microservice caused the problem
			2. We need monitoring
				1. To identify which are down
				2. If there is no enough disk space
	5. Pack of cards
		1. If one fundamental us goes down, the other (pack of cards) us go down
		2. We need fault tolerence in us

### Step 00 - 03 - Introduction to Spring Cloud ###
1. Spring Cloud
	1. Components to solve challenges
	2. Cloud.spring.io
		1. Spring cloud provides tools for developers to quickly build some of the common patterns in distributed systems (e.g. configuration management, service discovery, circuit brakers, intelligent routing, micro-proxy, control bus, one-time tokens, global locks, leadership election, distributed sessions, cluster state). Coordination of distributed systems leads to boiler plate patterns, and using Spring Cloud developers can quickly stand up services and applications that implement those patterns. They will work well in any distributed environment, including the developer's own laptop, bare metal data centres, and managed platforms such as Cloud Foundary.
		2. It is not one project
			1. Projects
				1. Spring Cloud Netflix
					1. Played with us architecture
						1. Components open source
							1. Eureka, Hystrix, Zuul
				2. Spring Cloud Config
					1. Centralized config managmenent
				3. Spring Cloud Bus
					1. Enables us and infrastructure components
					2. Config server
					3. API gateway
				4. Finchley M2 reelase of Spring Cloud
	3. Operations
		1. Spring Cloud Config Server
			1. We can store config for each of the server in Git repo (centralized location)
				1. Spring Cloud helps us to expose the centralized config to the us
	4. Dynamic scale up and scale down
		1. Ribbon (load balancing)
			1. Example:

								CurrencyCalculationService
											|
										Ribbon	- NamingServer
											/	\
					CurrencyExchangeService1 CurrencyExchangeService2

### Step 00 - 04 - Advantages of Microservices Architecture ###
### Step 00 - 05 - Microservice Components - Standardizing Ports and URL 
### Step 00 - Part 1 - Intro to Limits Microservice and Spring Cloud Config Server ###
### IMPORTANT: SPRING BOOT AND SPRING CLOUD VERSIONS ###
### Step 01 - Part 2 - Setting up Limits Microservice ###
### Step 02 - Creation of hard coded limits service ###
### Step 03 - Enhance limits service to get configuration from application properties ###
### Step 04 - Setting up Spring Cloud Config Server ###
### Step 05 - Installing Git ###
### Step 06 - Creation of Local Git Repository ###
### Step 07 - Connect Spring Cloud Config Server to Local Git Repository ###
### Step 08 - Configuration for Multiple Environments in Git Repository ###
### Step 09 - Connect Limits Service to Spring Cloud Config Server ###
### Step 10 - Configuring Profiles for Limits Service ###
### Step 11 - A review of Spring Cloud Config Server ###
### Step 12 - Introduction to Currency Conversion and Currency Exchange Microservice ###
### Step 13 - Setting up Currency Exchange Microservice ###
### Step 14 - Creation of simple hard coded currency exchange service ###
### Step 15 - Setting up Dynamic Port in the Response ###
### Step 16 - Configure JPA and Initialized Data ###
### Step 17 - Creation of JPA Repository ###
### Step 18 - Setting up Currency Conversion Microservice ###
### Step 19 - Creation of service for currency conversion ###
### Step 20 - Invoking Currency Exchange Microservice from Currency Conversion Micro ###
### Step 21 - Using Feign REST Client for Service Invocation ###
### Step 22 - Setting up client side load balancing with Ribbon ###
### Step 23 - Running client side load balancing with Ribbon ###
### Step 24 - Understand the need for a Naming Server ###
### Step 25 - Setting up Eureka Naming Server ###
### Step 26 - Connecting Currency Conversion Microservice to Eureka ###
### Step 27 - Connecting Currency Exchange Microservice to Eureka ###
### Step 28 - Distributing calls using Eureka and Ribbon ###
### Step 29 - A review of implementing Eureka, Ribbon and Feign ###
### Step 30 - Introduction to API Gateways ###
### Step 31 - Setting up Zuul API Gateway ###
### Step 32 - Implementing Zuul Logging Filter ###
### Step 33 - Executing a request through Zuul API Gateway ###
### Step 34 - Setting up Zuul API Gateway between microservice invocations ###
### Step 35 - Introduction to Distributed Tracing ###
### Step 36 - Implementing Spring Cloud Sleuth ###
### Step 37 - Introduction to Distributed Tracing with Zipkin ###
### Step 38 - Installing Rabbit MQ ###
### Step 39 - Setting up Distributed Tracing with Zipkin ###
### Step 40 - Connecting microservices to Zipkin ###
### Step 41 - Using Zipkin UI Dashboard to trace requests ###
### Step 42 - Understanding the need for Spring Cloud Bus ###
### Step 43 - Implementing Spring Cloud Bus ###
### Step 44 - Fault Tolerance with Hystrix ###
### FAQ 01 - Microservices Characteristics ###
### FAG 02 - What do you do next? ###

## Thanks ##
### Bonus Lecture: Out Best Courses ###
### Thank You ###