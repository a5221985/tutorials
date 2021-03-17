# Pattern: Decompose by Subdomain Context #
1. [Microservice architecture](https://microservices.io/patterns/microservices.html)
	1. It structures application into loosely coupled services
	2. Goal of microservices architecture
		1. Accelerate software development by enabling continuous delivery/ deployment
2. Successful Software Development

	![successful_software_development.png](successful_software_development.png)
	
3. Microservices architecture does it in two ways
	1. Simplifies testing
	2. Enables components to be deployed independently
	3. Structures engineering organization as a collection of small (6 - 10 members)
		1. Autonomous teams
			1. Each of the teams is responsible for one or more services
4. Note: Benefits are not automatically guaranteed
	1. Benefits can be achieved by careful functioanl decomposition of application into services
		1. Service must be small enough to be developed by small team
		2. Service must be easily testable
	2. How to achieve that?
		1. Single Responsibility Principle (SRP)
			1. There must be only one reason for a class to change
			2. SRP can be applied to service design
				1. A service can be cohesive and can implement small set of strongly related functions
5. Application can be decomposed in a way that most new and changed requirements only affect single service
	1. Changes that affect multiple services requires coordination across multiple teams
		1. This slows down development
6. Common Closure Principle (CCP)
	1. Classes that change for the same reason should be in the same package
		1. Two classes might implement different aspects of the same business rule
			1. If business rule changes, developers need to change code in small numbers
				1. Ideally only one of the packages

## Problem ##
## Forces ##
## Solution ##
## Examples ##
## Resulting Context ##
## Issues ##
## Related Patterns ##