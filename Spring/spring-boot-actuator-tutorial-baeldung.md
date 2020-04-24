# Spring Boot Actuator #
## Overview ##
1. Configure, extend the monitoring tool in Spring 2.x and WebFlux
	1. Using reactive programming
2. Actuator has been redesigned with Spring Boot 2
3. New endpoints are added

## What is an Actuator? ##
1. It brings production ready features to our application
	1. Monitoring application
	2. Gathering metrics
	3. Understanding traffic or state of database
2. Uses: Used to expose operational information about running application
	1. Health
	2. Metrics
	3. Info
	4. Dump
	5. Env
	6. ...
3. HTTP endpoints are used
4. JMX beans are enabled
5. When we add the dependency, many endpoints are available out of the box
	1. It can also be extended

### Getting Started ###
1. Add the following dependency:

		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-actuator</artifactId>
		</dependency>
		
	1. Version is specified in Spring Boot Bill of Materials (BOM)

## Spring Boot 1.x Actuator ##
### Endpoints ###
1. Most common endpoints Boot provides out of box:
	1. `/health` - application health
		1. status - if unauthenticated
		2. full message details - if authenticated
	2. `/info` - arbitrary app info
	3. `/metrics` - metrics for current app
	4. `/trace` - trace info (last few HTTP requests by default)
	5. [Full List of Endpoints](https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#production-ready-endpoints)

### Configuring Existing Endpoints ###
1. Customizing endpoints:
	1. `endpoints.[endpoint name].[property to customize]`
		1. Three properties:
			1. `id` - by which endpoint will be accessed over HTTP
			2. `enabled` - if true, then it can be accessed otherwise not
			3. `sensitive` - if true then need authorization to show crucial info over HTTP
	2. Example: for `/beans` endpoint
	
			endpoints.beans.id=springbeans
			endpoints.beans.sensitive=false
			endpoints.beans.enabled=true

### /health Endpoint ###
1. It is used to check the health or state of running app
	1. By monitoring app
		1. Alerts if running instance goes down
		2. Alerts if it gets un-healthy (other reasons)
			1. Connectivity issues with DB
			2. Lack of disk space
	2. Default:
	
			{
				"status": "UP"
			}
			
		1. The info is collected from all the beans implementing `HealthIndicator` interface configure in application context

### /info Endpoint ###
### /metrics Endpoint ###
### Constructing a New Endpoint ###
### Further Customization ###

## Spring Boot 2.x Actuator ##
### Technology Support ###
### Important Changes ###
### Predefined Endpoints ###
### Health Indicators ###
### Metrics in Spring Boot 2 ###
### Customizating the /info Endpoint ###
### Constructing a Custom Endpoint ###
### Extending Exiting Endpoints ###
### Enable All Endpoints ###

## Summary ##