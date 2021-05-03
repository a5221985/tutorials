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

## Examples ##
### Fictitious e-commerce application ###
### Show me the code ###
## Resulting Context ##
### Benefits ###
### Drawbacks ###
### Issues ###
#### When to use the microservice architecture? ####
#### How to decompose the application into services? ####
#### How to maintain data consistency? ####
#### How to implement queries? ####

## Related Patterns ##
## Known Uses ##
## Examples ##
## See Also ##