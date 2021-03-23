# Developer to Architect: Mastering Software Architecture #

## Introduction ##
### Introduction to Developer to Architect ###
1. How do you architect a new system?
	1. Starting with:

			Use cases
			DB Schema
			Code flow (sequence diagram)
			Class diagram
			
		1. Next step:

				user interface <-> web application <-> business service <-> database
				
			1. 3-tier or n-tier architecture
		2. Next step:
			1. Technologies and languages for implementation
				1. HTML/CSS/JS
				2. PHP
				3. Python
				4. C#
				5. Java
				6. Spring
				7. SQL
	2. We have not done any architect's job here
		1. 

## Performance ##
### Module Contents Overview ###
### A Reference Software System for Discussing Performance ###
### What is Performance ###
### How do Performance Problems Look Like ###
### Performance Principles ###
### System Performance Objectives ###
### Performance Measurement Metrics ###
### Serial Request Latency ###
### Network Transfer Latency ###
### Minimizing Network Transfer Latency ###
### Memory Access Latency ###
### Disk Access Latency ###
### Minimizing Disk Access Latency ###
### CPU Processing Latency ###
### Minimizing CPU Processing Latency ###
### Some Common Latency Figures ###
### Concurrency Related Latency ###
### Amdahl's Law for Concurrent Tasks ###
### Gunther's Universal Scalability Law ###
### Shared Resource Contention ###
### Minimizing Shared Resource Contention ###
### Minimizing Locking Related Contention ###
### Pessimistic Locking vs Optimistic Locking ###
### Compare and Swap Mechanism ###
### Deadlocks ###
### Coherence Related Delays ###
### Caching ###
### System Architecture for Performance ###
### Caching for Performance ###
### HTTP Caching of Static Data ###
### Caching of Dynamic Data ###
### Caching Related Challenges ###

## Scalability ##
### Module Contents Overview ###
### Performance vs Scalability ###
### Vertical & Horizontal Scalability ###
### Reverse Proxy ###
### A Reference Software System for Discussing Scalability ###
### Scalability Principles ###
### Modularity for Scalability ###
### Replication ###
### Stateful Replication in Web Applications ###
### Stateless Replication in Web Applications ###
### Stateless Replication in Services ###
### Database Replication ###
### Database Replication Types ###
### Need for Specialized Services ###
### Specialized Services - SOAP/REST ###
### Asynchronous Services ###
### Asynchronous Processing & Scalability ###
### Caching for Scalability ###
### Vertical Partitioning with Micro-Services ###
### Database Partitioning ###
### Database Partitioning Selection ###
### Routing with Database Partitioning ###
### Methods for Horizontal Scalability ###
### Dealing with Large Scale Systems ###
### Load Balancing Multiple Instances ###
### Discovery Service and Load Balancing ###
### Load Balancer Discovery ###
### HLB vs SLB ###
### Layer-7 Load Balancer ###
### DNS as Load Balancer ###
### Global Server Load Balancer ###
### Global Data Replication ###
### Auto Scaling Instances ###
### Micro-Services Architecture ###
### Micro-Services Motivation ###
### Service Oriented Architecture ###
### Micro-Services Architecture Style ###
### Transactions in Micro-Services ###
### Compensating Tansactions - SAGA Pattern ###
### Micro-Services Communication Model ###
### Event Driven Transactions ###
### Extreme Scalability with NoSQL and Kafka ###

## Reliability ##
### Module Contents Overview ###
### Distributed Systems and System Failures ###
### Partial System Failures ###
### Reliability Engineering Topics ###
### Reliability ###
### Availability ###
### High Availability ###
### Fault Tolerance ###
### Designing Fault Tolerance ###
### Fault Tolerant Design ###
### Redundancy ###
### Types of Redundancy ###
### Single Point of Failure ###
### Stateless Component Redundancy ###
### Stateful Component Redundancy ###
### Load Balancer Redundancy ###
### Datacentre Infrastructure as SPOF ###
### Fault Detection ###
### Fault Models ###
### Health Checks ###
### External Monitoring Service ###
### Internal Cluster Monitoring ###
### Fault Detection in a System ###
### Recovering from Failures ###
### Stateless Component Recovery ###
### Load Balancer high Availability ###
### Database Recovery with Hot Standby ###
### Database Recovery with Warm Standby ###
### Database Recovery with Cold Backups ###
### High Availability in Large Scale Systems ###
### Failover Best Practices ###
### System Stability ###
### Timeouts ###
### Retries ###
### Circuit Breaker ###
### Fail Fast and Shed Load ###

## Security ##
### Module Contents Overview ###
### Security Objectives ###
### Network Security ###
### Symmetric Key Encryption ###
### Public Key Encryption ###
### Secure Network Protocol ###
### SSL and TLS ###
### Hashing ###
### Digital Signatures ###
### Digital Certificates ###
### Chain of Trust ###
### TLS/SSL Handshake ###
### Secure Network Channel ###
### Firewalls ###
### Network Security ###
### Identity Management ###
### Authentication and Authorization ###
### Authentication ###
### Credentials Transfer ###
### Stateful Authentication ###
### Stateless Authentication ###
### Single Sign-On Within a Network Domain ###
### Token Storage ###
### Authentication ###
### Access Management ###
### Role Based Access ###
### Role Based Access Example ###
### Authorization ###
### OAuth2 Token Grant ###
### OAuth2 Token Grant - Code Flow ###
### OAuth2 Token Grant - Password Flow ###
### JSON Web Tokens ###
### Common Vulnerabilities ###
### SQL Injection ###
### Cross Site Scripting ###
### Cross Site Resource Forgery ###

## Deployment ##
### Module Contents Overview ###
### Large Scale Deployments ###
### Application Deployment ###
### Infrastructure Deployment ###
### System Operations ###
### Modern Deployment Solutions ###
### Application Deployment ###
### Component Deployment ###
### Component Deployment Parts ###
### Provisioning and Configuration ###
### Virtual Machine Deployment ###
### Isolation Through Virtual Machines ###
### Docker Containers ###
### Infrastructure Deployment ###
### Deployment with Docker Containers ###
### Deployment with Containers on Cloud ###
### Deployment with Kubernetes ###
### Kubernetes Lifecycle Management ###
### Kubernetes Naming and Addressing ###
### Kubernetes Scaling with Multiple Instances ###
### Kubernetes Load Balancing ###
### Kubernetes High Availability ###
### Kubernetes Rolling Upgrades ###
### Kubernetes Capabilities ###
### Kubernetes Deployment ###
### Kubernetes Services and Workloads ###
### Kubernetes Architecture ###
### System Upgrades ###
### Rolling Updates ###
### Canary Deployment ###
### Recreate Deployment ###
### Blue Green Deployment ###
### A/B Testing ###

## Technology Stack ##
### Module Contents Overview ###
### Reference System for Using Tech Platforms ###
### Web Applications ###
### Solutions for Web Applications ###
### Apache Web Server ###
### Apache WebServer Architecture ###
### Apache WebServer Scalability ###
### Nginx WebServer ###
### Nginx Architecture ###
### Nginx as Reverse Proxy and Cache ###
### Web Containers & Spring Framework ###
### Jetty & Spring ###
### Node.JS ###
### Node.JS Event Loop ###
### Cloud Solutions for Web ###
### Cloud Storage ###
### Cloud CDN ###
### Services ###
### Services Solutions ###
### Memcached ###
### Memcached Architecture ###
### Redis Cache & Its Architecture ###
### Cloud Caching Solutions ###
### RabbitMQ ###
### RabbitMQ Architecture ###
### Kafka Architecture ###
### Redis Pub/Sub ###
### Cloud MQ Solutions ###
### Datastores ###
### Datastore Solutions ###
### RDBMS ###
### RDBMS Scalability Architecture ###
### NoSQL Objectives & Trade-Offs ###
### Amazon DynamoDB ###
### DynamoDB Architecture ###
### Google BigTable ###
### BigTable Architecture ###
### HBase ###
### Cassandra ###
### Cassandra Features ###
### MongoDB ###
### MongoDB Architecture ###
### Analytics ###
### Analytics Solutions ###
### Logstash Architecture ###
### Logstash Data Streaming Architecture ###
### Fluentd ###
### Elasticsearch ###
### Elasticsearch Architecture ###
### Hadoop HDFS ###
### Map-Reduce ###
### Apache Spark ###
### Stream Processing ###