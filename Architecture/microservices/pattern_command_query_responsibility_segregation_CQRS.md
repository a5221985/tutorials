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
2. Example:

	![query_side_service](query_side_service.png)

## Examples ##
1. My book's FTGO example application has `Order History Service`
	1. It implements this pattern
2. [Eventuate-based example applications](http://eventuate.io/exampleapps.html)

## Resulting Context ##
1. Advantages
	1. Supports multiple de-normalized views that are scalable and performant
	2. Improved separation of concerns - simpler command + query models
	3. Used in (necessary) in event sourced architecture

## Related Patterns ##
1. [Database per Service pattern](https://microservices.io/patterns/data/database-per-service.html) - this initiates the need for this pattern
2. [API Composition pattern](https://microservices.io/patterns/data/api-composition.html) - an alternative solution
3. [Domain event](https://microservices.io/patterns/data/domain-event.html) - pattern generates the events
4. Used with [Event sourcing](https://microservices.io/patterns/data/event-sourcing.html)

## See Also ##
1. [Eventuate](http://eventuate.io/) - platform for developing transactional business applications