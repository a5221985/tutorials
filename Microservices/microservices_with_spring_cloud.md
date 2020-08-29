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
					
				1. Dynamically distribute load
		2. Naming server (Eureka)
			1. All instances of microservices would register with naming server
				1. All us can register
				2. Service discovery
					1. Example: CurrencyCalculationService can ask Eureka nameing server -> Give instance of CurrencyExchangeService and Eureka will provide the URL of the service
						1. Establishes dynamic relationship between the services
			2. Ribbon (Client Side Load Balancing)
				1. Example: CurrencyCalculationService will host Ribbon (client)
					1. Load is distributed only among the instances that it gets from Naming Server
			3. Feign (Easier REST clients)
				1. Mechanism to write simple RESTful clients
	5. Visibility and Monitoring
		1. Zipkin Distributed Tracing (server)
			1. Spring Cloud Slout is used to assign ID to request across multiple components
			2. Zipkin Distributed Tracing is used to trace request across multiple components
		2. Netflix [Zuul] API Gateway
			1. uS have common features
				1. Logging
				2. Security
				3. Analytics
				4. ...
	6. Fault Tolerance
		1. Hystrix
			1. If services is down, helps to configure default response

### Step 00 - 04 - Advantages of Microservices Architecture ###
1. New technology & process adaption (easily)
	1. Each microservice can be built in different technologies
		1. Can construct us in specific language
	2. We can bring in new processes
2. Dynamic scaling
	1. We can procure hardware or resources dynamically based on the load
3. Faster release cycles
	1. Easier to release
	2. We can bring new features faster to market

### Step 00 - 05 - Microservice Components - Standardizing Ports and URL 
1. Ports (Github - 03.microservices)
	1. Limits service - 8080, 8081, ...
	2. Spring Cloud Config Server - 8888
	3. Currency Exchange Service - 8000, 8001, 8002, ...
	4. Currency Conversion Service - 8100, 8101, 8102, ...
	5. Netflix Eureka Naming Server - 8761
	6. Netflix Zuul API Gateway Server - 8765
	7. Zipkin Distributed Tracing Server - 9411
2. URLs (same page below ports)

### Step 00 - Part 1 - Intro to Limits Microservice and Spring Cloud Config Server ###
1. Centralized application config or centralized us config
	1. Example:
		1. CurrencyCalculationService
		2. CurrencyExchangeService
		3. LimitsService
	2. Example:
		1. DB config
		2. External service config
		3. Business logic config
		4. ...
2. Example: Currency Exchange Service might have 4 environments
3. Managing config individually for each application and each environment is a difficult task
	1. Solution: Centralization
		1. Put all config in Git
		2. SpringCloudConfigServer takes the config and gives it to the specific us
			1. If LimitsService wants config for dev env of it's service, it can be provided by SpringCloudConfigServer
			2. If CurrencyCalculationService wants config for 3rd instance of it's service, SpringCloudConfigServer can provide it
	2. It is centralized us configuration application
		1. Git repo can be connected to SpringCloudConfigServer
4. Example:
	1. **limits-service-dev.properties**

			limits-service.minimum=2
			limits-service.maximum=222
			
	2. **limits-service-qa.properties**

			limits-service.minimum=3
			limits-service.maximum=5
			
	3. **limits-service.properties**

### IMPORTANT: SPRING BOOT AND SPRING CLOUD VERSIONS ###
1. SNAPSHOT, M1, M2, M3, M4 are work in progress
	1. Spring team is still working on them
	2. Not recommended
	3. Version recommended: 2.3.1+

### Step 01 - Part 2 - Setting up Limits Microservice ###
1. New project:
	1. Newer version of Spring Boot
	2. Group: com.in28minutes.microservices
	3. Artifact: limits-service
	4. Dependencies:
		1. Web
		2. DevTools
		3. Actuator: Monitoring
		4. Config Client: Spring-Cloud-Config-Client
			1. To connect to spring-cloud-config-server
	5. Generate project
	6. Unzip and put it in folder
	7. Import existing maven project in Eclipse
	8. Run the application
		1. Right click run as Java Application

### Step 02 - Creation of hard coded limits service ###
1. We want LimitsService to get config from SpringCloudConfigServer
2. Open **application.properties**

		spring.application.name=limits-service
		
3. New Controller: LimitsConfigurationController

		@RestController
		public class LimitsConfigurationController {
		
			@GetMapping("/limits")
			public LimitConfiguration retrieveLimitsFromConfigurations() {
				return new LimitConfiguration(1000, 1);			
			}
		}
		
4. `bean.LimitConfiguration.java`

		public class LimitConfiguration {
			int maximum;
			int minimum;
			
			protected LimitConfiguration() {
			
			}
			
			public LimitConfiguration(int maximum, int minimum) {
				super();
				this.maximum = maximum;
				this.minimum = minimum;
			}
			
			// Getters and setters
		}
		
	1. Open: `localhost:8080/limits`

### Step 03 - Enhance limits service to get configuration from application properties ###
1. application.properties

		limits-service.minimum=99
		limits-service.maximum=9999
		
2. Configuration properties: Configuration.java

		@Component
		@ConfigurationProperties("limits-service")
		public class Configuration {
			private int minimum;
			private int maximum;
			
			// Getters and setters
		}
		
3. LimitsConfigurationController.java

		@Autowired
		private Configuration configuration;
		
		...
			return new LimitConfiguration(configuration.getMaximum(), configuration.getMinimum());
		}

### Step 04 - Setting up Spring Cloud Config Server ###
1. New Spring boot project
2. group id: com.in28minutes.microservices
3. artifact id: spring-cloud-config-server
4. search: config server
5. Remove web, ... and keep DevTools and config server
6. Import it into eclipse
7. Dependency: spring-cloud-config-server
8. application.properties

		spring.application.name=spring-cloud-config-server
		server.port=8888

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