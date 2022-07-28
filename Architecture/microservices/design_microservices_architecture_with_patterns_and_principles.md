# Design Microservices Architecture with Patterns & Principles #
## Introduction ##
### Introduction ###
1. Microservices architecture using design patterns, principles and best practices
2. Designing systems for
	1. High availability
	2. High scalability
	3. Low latency
	4. Resilience to network failure
3. Design Architecture Journey
	1. Monolithic (e-commerce)
		1. E-Commerce application design with all considerations
	2. Layered/SOA (next)
		1. E-Commerce application design with all considerations
	3. Microservices
		1. E-Commerce application design with all considerations
	4. Event-Driven Microservices
		1. E-Commerce application design
4. Aspects:
	1. Communications (Sync/Async)
	2. Data Management (Database/Query/Commands)
		1. Distributed transactions
	3. Design Patterns & Principles
	4. Caching (distributed)
	5. Deployment
		1. Containers & orchestrators
5. Design: draw.io
	1. Monolithic architecture
		1. Principles:
			1. KISS
			2. YAGNI
			3. DRY
		2. Functional Requirements
			1. List products
			2. Filter products as per brand and categories
			3. Put products into the shopping cart
			4. Apply coupon for discounts and see the total cost all for all of the items in shopping cart
			5. Checkout the shopping cart and construct an order
			6. List my old orders and order items history
		3. Non-Functional Requirements
			1. Scalability
			2. Increase Concurrent user request count
		4. Tech stack:
			1. Load Balancer
				1. Apache Nginx
			2. Application
				1. Java
				2. Single War file
				3. Tomcat Server
			3. Database:
				1. Oracle
				2. PostgreSQL
				3. MySQL
	2. Layered Architecture
		1. Principles:
			1. KISS
			2. YAGNI
			3. DRY
			4. SoC
			5. SOLID
		2. Components:
			1. FrontEnd
				1. UI
			2. Backend
				1. Business logic
			3. RDBMS
		3. Non-Functional Requirements
			1. Scalability
			2. Increase Concurrent user request
			3. Maintainability
	3. Service Oriented Architecture
		1. Principles
			1. KISS
			2. YAGNI
			3. DRY
			4. SoC
			5. SOLID
			6. ESB
		2. Components:
			1. Consumer Groups
				1. Web
				2. Web
				3. Mobile
			2. SOA
				1. ESB
				2. CRM
				3. OM
				4. Billing
				5. Shared
			3. RDBMS
	4. Microservices Architecture
		1. Principles
			1. KISS
			2. YAGNI
			3. DRY
			4. SoC
			5. SOLID
			6. Database per Microservice

### Prerequisites and Tools ###
### Setting Up Design Environment ###
### Design Architecture Journey = Monolithic -> Layered -> SOA -> Microservices ###
### Understand E-Commerce Domain - Use Cases - Functional Requirement ###
### Understand E-Commerce Domain - Use Cases - Non-Functional Requirement ###

## Monolithic Architecture ##
### Introduction ###
### When to Use Monolithic Architecture ###
### Benefits of Monolithic Architecture ###
### Challenges of Monolithic Architecture ###
### Monolithic Architecture Pros-Cons ###
### Reference Architectures of Monolithic Architecture ###
### Design Principles of Monolithic Architecture -- KISS, YAGNI, DRY ###
### Design the Architecture - E-Commerce App -- KISS, DRY, YAGNI ###
### Design the Architecture - E-Commerce App - Database and Components ###
### Monolithic Architecture Inter-Process Communication ###
### Inter-Process Communication - Transaction Management in Monolithic Architecture ###

## Scalability - Vertical Scaling - Horizontal Scaling ##
### Scalability - Vertical Scaling - Horizontal Scaling Introduction ###
### Vertical Scaling - Scale Up ###
### Horizontal Scaling - Scale Out ###
### Design the Architecture - E-Commerce App - Scaling the Application ###
### What is Load Balancer and Why We are Using Load Balancer with Consistent Hashing ###
### Technology Choices - Adapting Technology Stack ###
### Deployments for Monolithic Architecture ###

## Layered (N-Layer) Architecture ##
### Introduction ###
### Design Principles - Separation of Concerns (SoC) ###
### Design Principles - SOLID ###
### Design the Architecture - E-Commerce App - Layered Architecture ###
### Technology Choices - Adapting Technology Stack ###

## Service-Oriented Architecture (SOA) ##
### Introduction ###
### Architecture Design Patterns - Enterprise Service Bus (ESB) ###
### Design the Architecture - E-Commerce App - SOA ###
### Communication in SOA ###
### Comparing SOA and Microservices ###

## Microservices Architecture ##
### Introduction - What are Microservices? ###
### Microservices Characteristics ###
### Benefits of Microservices Architecture ###
### Challenges of Microservices Architecture ###
### When to Use Microservices Architecture - Best Practices ###
### Monolithic vs Microservices Architecture Comparison ###
### Design Pattern - The Database-per-Service Pattern ###
### Reference Architectures of Microservices Architecture ###
### Design Microservice Architecture - E-Commerce App - KISS DRY YAGNI ###
### Design Microservice Architecture - E-Commerce App - Database-per-Service ###
### Technology Choices - Adapting Technology Stack ###

## Decomposition of Microservice Architecture - Understand E-Commerce Domain ##
### Introduction ###
### Microservices Decomposition Pattern - Decompose by Business Capability ###
### Microservices Decomposition Pattern - Decompose by Subdomain ###
### Bounded Context Pattern (Domain-Driven Design - DDD) ###
### Identify Bounded Context Boundaries for Each Microservices ###
### Using Domain Analysis to Model Microservices ###
### Analysis E-Commerce Domain - Use Cases ###
### Analysis E-Commerce Domain - Nouns and Verbs ###
### Identifying and Decomposition Microservices for E-Commerce Domain ###

## Microservices Communications - Basics ##
### Introduction ###
### Microservices Communication Types - Sync or Async Communication ###
### Microservices Communication Types Request-Driven or Event-Driven Architecture ###
### Microservices Synchronous Communication Patterns and Best Practices ###
### Designing HTTP Based RESTFul APIs for Microservices ###
### RESTFul API Design for Microservices ###
### RESTFul API Design for Microservices - Part 2 ###
### What is gRPC? ###
### How gRPC Works? ###
### Advantages of gRPC ###
### gRPC vs REST ###
### gRPC Usage of Microservices Communication ###
### Example of gRPC in Microservices Communication ###

## Microservices Communication Design Patterns - API Gateways ##
### Introduction ###
### Gateway Routing Pattern ###
### Gateway Aggregation Pattern ###
### API Gateway Pattern ###
### Main Features of API Gateway Pattern ###
### DESIGN - API Gateway - Microservices Communications Design Patterns ###
### Backends for Frontends Pattern BFF - Microservices Communications Design Pattern ###
### DESIGN - Backends for Frontends Pattern BFF - Microservices Communications ###
### Service-to-Service Communications Between Backend Internal Microservices ###
### Service Aggregator Pattern - Microservices Communications Design Patterns ###
### Service Registry Pattern - Microservices Communications Design Patterns ###
### DESIGN - Service Aggregator Pattern - Service Registry Pattern in Microservices ###
### Technology Choices - Adapting Technology Stack ###

## Microservices Asynchronous Message-Based Communication ##
### Introduction ###
### Asynchronous Message-Based Communication in Microservices Architecture ###
### Design Principles - Dependency Inversion Principles (DIP) ###
### Design Pattern - Publish-Subscribe Design Pattern ###
### DESIGN - Pub/Sub Message Broker - Microservices Asynchronous Communications ###
### Technology Choices - Adapting Technology Stack ###

## Kafka and RabbitMQ Architecture ##
### Introduction - What is Apache Kafka? ###
### Apache Kafka Benefits and Use Cases ###
### Kafka Components - Topic, Partitions, Offset and Replication Factor ###
### Apache Kafka Cluster Architecture ###
### Apache Kafka Core APIs - Producer, Consumer, Streams and Connect API ###
### What is RabbitMQ Main Components of RabbitMQ ###
### RabbitMQ Exchange Types ###
### RabbitMQ Architecture ###

## Scale the Microservices Architecture Design ##
### Introduction - Scale the Microservices Architecture Design ###
### The Scale Cube ###
### Stateless and Stateful Application Horizontal Scaling ###

## Microservices Data Management ##
### Introduction - Polyglot Persistence Microservices ###
### Microservices Database Management Patterns and Principles ###
### The Database-per-Service Pattern ###
### The Shared Database Anti-Pattern and Polyglot Persistence ###
### Relational and NoSQL Database - Document, Key-Value, Graph-Based, Column-Based ###
### How to Choose a Database for Microservices ###
### CAP Theorem ###
### Horizontal, Vertical, and Functional Data Partition ###
### Database Sharding Pattern ###
### Cassandra No-SQL Database - Peer-to-Peer Distributed Wide Column Database ###
### Design the Architecture - Database Sharding Cassandra ###

## Microservices Data Management - Queries ##
### Introduction - Microservices Data Management - Cross-Service Queries ###
### Materialized View Pattern ###
### CQRS Design Pattern ###
### CQRS Design Pattern - 2 ###
### Event Sourcing Pattern ###
### Eventual Consistency Principle ###
### Instagram System Architecture - Instagram Story View and User Information ###
### Instagram Database Architecture ###
### Design the Architecture - CQRS, Event Sourcing, Eventual Consistency ###

## Microservices Distributed Transaction ##
### Introduction - Microservices Distributed Transactions ###
### Saga Pattern for Distributed Transactions ###
### Saga Pattern - Choreography and Orchestration ###
### The Outbox Pattern ###

## Event-Driven Microservices Architecture ##
### Introduction - Event-Driven Microservices Architecture ###
### Design the Architecture -Event-Driven Microservices Architecture ###

## Microservices Distributed Caching ##
### Introduction - Microservices Distributed Caching ###
### Design the Architecture - Microservices Distributed Caching ###

## Microservices Deployments with Containers and Orchestration ##
### Microservices Deployments with Containers and Orchestration ###
### What is Docker and Container? ###
### Docker Containers, Images, and Registries ###
### What is Kubernetes? ###
### Kubernetes Architecture ###
### Kubernetes Components ###
### Design the Architecture - Microservices Deployments Containers and Orchestration ###

## Implementation of Microservices Architecture ##
### Implementation of Microservices Architecture ###
### Code Review for Existing Microservices Architecture Repository on Github ###

## Thanks ##
### Bonus Lecture ###