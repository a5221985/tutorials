# Domain Driven Design & Microservices for Architects #
## Course Outline ##
### Author Introductions and Course Outline ###
### Development Tools and Setup ###

## Microservices Architecture ##
### Microservices Architecture ###
### Business & Digital Transformation ###
### A Business Perspective of Microservices ###
### A Technical Perspective of Microservices ###
### Adoption of Microservices Architecture ###

## Introduction to Domain Driven Design ##
### Domain, Sub-Domain and Domain Experts ###
### Conceptual Models, Architecture and Design ###
### Modeling Techniques & Architectural Styles ###
### Domain Models ###
### Modeling Techniques & Architectural Styles ###

## Understansing the Business Domain ##
### Why Understand the Business? ###
### Introduction to Business Model Canvas ###
### Exercise: ACME Travels Business Model Canvas ###

## Domain Driven Design: Strategic Patterns ##
### Introduction to DDD and Patterns ###
### Business Subdomain Types ###
### Exercise: ACME Subdomain Type Assignment ###
### Understanding the Business Context ###
### Business Domain Language ###
### Strategic Pattern: Ubiquitous Language ###
### Exercise: Define ACME's Ubiquitous Language ###
### Strategic Pattern: Bounded Context ###
### Discovering the Bounded Contexts in a Domain ###
### Exercise: Identify ACME's Bounded Contexts ###

## Bounded Context Relationships ##
### Intro to DDD Integration Patterns ###
### Managing BC Relationships Using Context Maps ###
### Symmetric Relationship Patterns ###
### Asymmetric Relationship Patterns ###
### One to Many Relationship Patterns ###
### Exercise: Context Mapping for a Bank ###

## Domain Driven Design - Tactical Patterns ##
### Intro to DDD Tactical Patterns ###
### Entity Object - Pattern ###
### Value Object - Pattern ###
### Exercise: Identify Entity & VO in ACME Sales Model ###
### Hands On: Building the ACME Sales Entities & VO in Java ###
### Exercise: ACME Sales Use Case ###
### Hands On: UML for ACME Sales Aggregates ###
### Model Behavior: Anemic & Rich Models ###
### Repository Object - Pattern ###
### Hands On: ACME Model Repository in UML & Java ###
### Domain Service - Pattern ###
### Application Services - Pattern ###
### Infrastructure Services - Pattern ###
### Hands On: ACME Domain Service, UML & Java ###
### Hands On: Application and Infrastructure Services, UML & Java ###

## Events Driven Architects & Domain Events ##
### Intro to Events in Microservices ###
### Monolithic & Distributed Communication Patterns ###
### Microservices Interaction Patterns ###
### Event Driven Architecture ###
### Hands On: Pub Sub with AMQP/RabbitMQ ###
### Domain Events - Pattern ###
### Hands On: Static Class Broker Pattern ###
### Exercise: ACME Sales Domain Events ###
### Hands On: Realization of ACME Domain Events ###
### Integration Events - Pattern ###
### Exercise: ACME Sales Integration Events ###
### Hands On: Realization of ACME Integration Events (1 of 2) ###
### Hands On: Realization of ACME Integration Events (2 of 2) ###

## Event Storming for Constructing Shared Knowledge ##
### Learning Objectives: Discovering the Events in a Domain ###
### Introduction to Event Storming ###
### Elements of Event Storming ###
### Preparing for the ES Workshop ###
### Conducting the ES Workshop ###
### Exercise: ACME Sales ES Workshop ###

## Microservices Data Management Patterns ##
### Introduction to Microservices Data Persistence ###
### Monolithic Apps - Shared Persistence Storage ###
### Service Oriented Architecture (SOA) ###
### Separate Database Pattern ###
### Brownfield Microservices: Database Patterns | Options ###
### Shared Database Pattern ###
### Shared Database: Challenges & Solutions ###

## Microservices DB Performance Management ##
### Need for More Data Patterns ###
### Commands Query Separation (CQS) ###
### Hands On: PostgreSQL Database for Backend ###
### Realization of Commands & Queries ###
### Hands On: Build the CQS Pattern ###
### Command Query Responsibility Seggregation (CQRS) ###
### Data Replication Between WRITE-READ Sides ###
### Exercise: ACME CQRS for Proposal ###
### Hands On: ACME CQRS Command Implementation ###
### Event Sourcing and Event Store Considerations ###
### Hands On: MongoDB for ACME Sales READ Side ###
### Hands On: CQRS-v1 Proposal Subscriber ###
### Hands On: CQRS-v2 Read Side Query ###

## Microservices Managing the Data Integrity ##
### Introduction to Reliable Messaging ###
### Designing for Failure ###
### Exercise: Address ACME CQRS Write Side Failures ###
### Exercise: Address ACME CQRS Read Side Failures ###
### Hands On: Handling Duplicate Messages ###

## Microservices and Kafka ##
### Use of Kafka in Microservices ###
### Kafka Overview ###
### Kafka Concepts ###
### Hands On: Construct a Kafka Cluster ###
### Hands On: Working with Kafka Producer ###
### Hands On: Working with Kafka Consumer Groups ###
### Kafka vs AMQP (RabbitMQ) ###
### Exercise: Messaging for Microservices ###

## Managing Distributed Transactions with SAGA ##
### Distributed Transactions with SAGA ###
### SAGA Pattern for Distributed Transactions ###
### SAGA Choreography Vs. Orchestration ###
### SAGA Implementation Considerations ###
### Exercise: ACME Sales Booking Transaciton SAGA ###
### Hands On: UML & Code Walkthrough of Booking SAGA ###

## Microservices and API ##
### Microservices-API Realization ###
### Introduction to REST API ###
### REST API Resources & Design Constraints ###
### API Management ###
### Exercise: ACME REST API for Products ###
### Hands On: ACME REST API in Action ###
### Introduction to GraphQL ###
### GraphQL Schema Definition ###
### Exercise: ACME GraphQL API for Products ###
### Hands On: ACME GraphQL API in Action ###