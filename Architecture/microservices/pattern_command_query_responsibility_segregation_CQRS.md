# Pattern: Command Query Responsibility Segregation (CQRS) #
## Context ##
1. [Microservices Architecture Pattern](https://microservices.io/patterns/microservices.html), [Database Per Service Pattern](https://microservices.io/patterns/data/database-per-service.html)
	1. Once the above patterns are applied, it is not straightforward to implement queires that join data from multiple services
		1. Furthermore, if Event sourcing pattern is applied, then data cannot be easily queried

## Problem ##
1. How to implement a query that retrieves data from multiple services in a microservice architecture?

## Solution ##
1. Define view database
	1. It is read-only replica designed to support query
	2. Application keeps replica up to date by subscribing to [Domain events](https://microservices.io/patterns/data/domain-event.html) - published by service that own the data

## Examples ##
## Resulting Context ##
## Related Patterns ##
## See Also ##