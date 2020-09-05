# Reactive Programming with Spring Framework #
## Section 1: Introduction to Reactive Programming with Spring Framework 5 ##
### Introduction to Reactive Programming with Spring Framework 5 ###
1. Reactive programming - API spec
	1. Java 9 - included
	2. Java 8 - Project reactor, reactive streams
2. Reactive streams - streaming events
3. Functional programming
4. New capabilities

### Instructor Introduction - John Thompson, Spring Framework Guru ###

### Free 120 Day IntelliJ Trial! ###
1. [https://springframework.guru/udemy-90-day-trial-license-intellij-spring-5-reactive-programming/](https://springframework.guru/udemy-90-day-trial-license-intellij-spring-5-reactive-programming/)

### Using GitHub ###
1. All source code examples in GitHub

### Code Examples in GitHub ###
1. Beginning and ending source code
2. Right click and commit directory

## Section 2: Introduction to Reactive Programming ##
### Introduction ###
1. What is reactive programming
2. Common terminologies
3. New paradigm but old concepts

### Reactive Manifesto ###
1. Published in 2013
2. Available at [www.reactivemanifesto.org](www.reactivemanifesto.org)
3. Authors: Jonas Boner (Akka founder), Dave Farley, Roland Kuhn, and Martin Thompson
	1. For big scale systems
4. The term "Reactive" is getting a bit overloaded in the IT community
5. Reactive:
	1. Reactive systems - architecture and design pattern (arch level)
		1. ie. Cloud native
		2. Cloud based apps
		3. Large scale self healing
		4. Amazon
	2. Rective programming - more granular (code level)
		1. Generally event based
		2. Async non-blocking programming technique
		3. Even can be within reactive system
	3. Functional Reactive Programming (FRP)
		1. Often confused with Reactive Programming
6. Reactive Manifesto
	1. Responsive
		1. The system responds in a timely manner
		2. Responsiveness is the cornerstone of usability and utility (cornerstone for building - first stone)
		3. Responsiveness also means problems may be detected quickly and dealt with effectively - self healing
		4. Responsive systems provide rapid and consistent response times
		5. Consistent behaviour simplifies error handling, builds end user confidence, and encourages further interaction - bad connection cannot keep it consistent 
	2. Elastic
		1. The system stays responsive under varying workload
		2. Reactive systems can react to changes in the input rate by increasing or decreasing resources allocated to service inputs
		3. Reactive systems achieve elasticity in a cost effective way on commodity hardware and software platforms
		4. Example: amazon.com
			1. Cheaper servers are used
			2. Kubernetes automatically scales up and down
	3. Resilient
		1. System stays responsive in the face of failure
		2. Resilience is achieved by replication, containment, isolation, and delegation
		3. Failures are contained within each component - single part should not take down entire system
		4. Parts of the system can fail, without compromising the system as a whole
		5. Recovery of each component is delegated to another - redundancy
		6. High-availability is ensured by replication where necessary - microservices load balancing say, rabitmq
	4. Message Driven
		1. Reactive systems rely on asynchronous message passing to establish a boundary between components
			1. This ensures loose coupling, isolation, and location transparency
		2. Message passing enables load management, elasticity, and flow control - distributed systems say (JMS, webservice call, ...)
		3. Location transparent messaging makes management of failures possible - not concerned about specific servers
		4. Non-blocking communication allows recipients to only consume resources while active, leading to less system overhead
5. Spring cloud native
	1. Netflix|OSS + Spring Boot + Docker
		1. Kubernetes
		2. Docker swarm
		3. Zuul
		4. Eureka
	2. When a microservice starts, it registers iteself with jHipster registry and gets its config from Spring Cloud Config and registers itself with Eureka
		1. Zuul proxy can route to microservice
		2. If microservice goes down, another one comes and registers
	3. Logstash and Kibana
		1. Collection of logs from multiple nodes
6. Reactive programming with reactive systems
	1. Reactive programming is a useful implementation technique
	2. Reactive programming focuses on non-blocking, asynchronous execution - a key characteristic of reactive systems
	3. Reactive programming is just one tool in building reactive systems

### What is Reactive Programming? ###
1. 

### Reactive Streams ###
### Reactive Programming Examples with Spring ###
### Conclusion ###

## Section 3: Netflux Example Spring Reactive Application ##
### Introduction ###
### Create a New Spring Boot Project ###
### Create Domain Model ###
### Creating Spring Data Reactive Repositories ###
### Initializing Data With Spring Boot Command Line Runner ###
### Create Service Layer ###
### Create Rest Endpoint ###
### Running The Reactive Spring Boot Application ###
### Conclusion ###

## Section 4: Introduction to Functional Programming in Java ##
### Introduction ###
### What is Functional Programming? ###
### Functional Programming Examples ###
### Closures, Effectively Final and Lazy Evaluation ###
### Conclusion ###

## Section 5: Using Java Streams ##
### Introduction ###
### Introduction to Java Streams ###
### Java 8 Streams Examples ###
### Spring Framework Reactive Streams Examples ###
### Conclusion ###

## Section 6: Spring WebFlux Quote Service ##
### Introduction to Spring WebFlux ###
### Initial Spring Boot Project Creation ###
### Quote Object ###
### Quote Generator Service ###
### Spring WebFlux Quote Handler ###
### Spring WebFlux Quote Router ###
### Steaming Quotes ###
### Testing Quote Service ###
### Spring WebFlux Quote Service on GitHub ###
### Conclusion ###

## Section 7: Reactive MongoDB Quote Application ##
### Introduction ###
### Introduction to MongoDB ###
### Data Model ###
### 

## Section 8: Appendix A - Using GitHub ##