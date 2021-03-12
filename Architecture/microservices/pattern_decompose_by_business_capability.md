# Pattern: Decompose By Business Capability #
## Context ##
1. Suppose we are developing a large complex app and we want to use [microservice architecture](https://microservices.io/patterns/microservices.html)
	1. microservices architecture - structures application as a set of loosely coupled services
	2. Goal of microservices architecture
		1. Accelerate software development by enabling continuous delivery/ deployment
2. Architecture:

	![Successful software development](successful_software_development.png)

3. Microservices architecture benefits
	1. Simplifies testing
	2. Enables components to be deployed independently
	3. Structures engineering team as a collection of small (6-10 members)
	4. Enables each team to be autonomous and responsible for one or more services
4. Caveat - the benefits are not automatically guaranteed
	1. This needs careful functional decomposition of the application into services
		1. Each services must be small enough to be
			1. Developed by a small team
			2. Easily tested
	2. A guideline
		1. Single Responsibility Principle ([SRP](http://www.objectmentor.com/resources/articles/srp.pdf))

## Problem ##
## Forces ##
## Solution ##
## Examples ##
## Resulting Context ##
## Issues ##
## Related Patterns ##