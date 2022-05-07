# Event-Driven Microservices Architecture #
## Introduction ##
### Introduction ###
### Prerequisites and Tools ###
### Setting Up Design Environment ###
### Design Architecture Journey = Monolithic -> Layerd -> SOA -> Microservices ###
### Understand E-Commerce Domain - Use Cases - Functional Requirement ###
### Understand E-Commerce Domain - Use Cases - Non-Functional Requirement ###

## Monolithic Architecture ##
### Introduction ###
### When to use Monolithic Architecture ###
### Benefits of Monolithic Architecture ###
### Challenges of Monolithic Architecture ###
### Monolithic Architecture Pros-Cons ###
### Reference Architecture of Monolithic Architecture ###
### Design Principles of Monolithic Architecture -- KISS, YAGNI, DRY ###
### Design the Architecture - E-Commerce App - KISS DRY YAGNI ###
### Design the Architecture - E-Commerce App - Database and Components ###
### Monolithic Architecture Inter-Process Communication ###
### Inter-Process Communication - Transaction Management in Monolithic Architecture ###

## Scalability - Verticial Scaling - Honizontal Scaling ##
### Scalability - Verticial Scaling - Horizontal Scaling Introduction ###
### Verticial Scaling - Scale Up ###
### Honizontal Scaling - Scale Out ###
### Design the Architecture - E-Commerce App - Scaling the Application ###
### What is Load Balancer and Why We are Load Balancer with Consistent Hashing ###
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
### What are Microservices? - 2 ###
### Microservices Characteristics ###
### Benefits of Microservices Architecture ###
### Challenges of Microservices Architecture ###
### When to Use Microservices Architecture - Best Practices ###
### Monolithic vs Microservices Architecture Comparing ###
### Design Pattern - The Database-per-Service Pattern ###
### Reference Architecture of Microservices Architecture ###
### Design Microservices Architecture - E-Commerce App - KISS DRY YAGNI ###
### Design Microservice Architecture - E-Commerce App - Database-per-Services ###
### Technology Choices - Adapting Technology Stack ###

## Decomposition Microservices Architecture - Understand E-Commerce Domain ##
### Introduction ###
### Microservices Decomposition Pattern - Decompose by Subdomain ###
### Bounded Context Pattern (Domain-Driven Design - DDD) ###
### Identify Bounded Context Boundaries for Each Microservices ###
### Using Domain Analysis to Model Microservices ###
### Analysis E-Commerce Domain - Use Cases ###
### Analysis E-Commerce Domain - Nouns and Verbs ###
### Identifying and Decomposing Microservices for E-Commerce Domain ###

## Microservices Communications - Basics ##
### Introduction ####
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
### DESIGN - API Gateway - Microservices Communication Design Patterns ###
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
### DESIGN - Pub/Sub Message Broker - Microservices Asynchronous Communication ###
### Technology Choices - Adapting Technology Stack ###

## Kafka and RabbitMQ Architecture ##
### Introduction - What is Apache Kafka? ###
### Apache Kafka Benefits and Use Cases ###
### Kafka Components - Topic, Partitions, Offset and Replication Factor ###
### Apache Kafka Cluster Architecture ###
### Apache Kafka Core APIs - Producer, Consumer, Streams and Connect API ###
### What is RabbitMQ, Main Components of RabbitMQ ###
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
### Horizontal, Verticial, and Functional Data Partition ###
### Database Sharding Pattern ###
### Cassandra No-Sql Database - Peer-to-Peer Distributed Wide Column Database ###
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

## Microservices Distributed Transactions ##
### Introduction - Microservices Distributed Transactions ###
### Saga Pattern for Distributed Transactions ###
### Saga Pattern - Choreography and Orchestration ###
### The Outbox Pattern ###

## Event-Driven Microservices Architecture ##
### Introduction - Event-Driven Microservices Architecture ###
### Design the Architecture - Event-Driven Microservices Architecture ###

## Microservices Distributed Caching ##
### Introduction - Microservices Distributed Caching ###
### Design the Architecture - Microservices Distributed Caching ###

## Microservices Deployments with Containers and Orchestrators ##
### Microservices Deployments with Containers and Orcherstrators ###
### What is Docker and Container? ###
### Docker Containers, Images, and Registries ###
### What is Kubernetes? ###
### Kubernetes Architecture ###
### Kubernetes Components ###
### Design the Architecture - Microservices Deployments Containers and Orcherstrators ###

## Implementation of Microservices Architecture ##
### Implementation of Microservices Architecture ###
### Code Review for Existing Microservices Architecture Repository on GitHub ###

## Thanks ##
### Bonus Lecture ###