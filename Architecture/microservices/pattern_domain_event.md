# Pattern: Domain Event #
1. From DDD

## Context ##
1. When service updates it's data, it needs to publish events
2. Purpose:
	1. to update a [CQRS view](https://microservices.io/patterns/data/cqrs.html)
	2. To participate in coreography-based [sage](https://microservices.io/patterns/data/saga.html)
		1. For this events are used for coordination

## Problem ##
1. How does a service publish an event when it updates it's data?

## Solution ##
1. Organize business logic of service as a collection of DDD [aggregates](https://microservices.io/patterns/data/aggregate.html)
2. Aggregates emit domain events when they constructed or updated
3. The domain events are published by service for other services to consume

## Related Patterns ##
1. [Saga](https://microservices.io/patterns/data/saga.html), [CQRS](https://microservices.io/patterns/data/cqrs.html) - initiate the need for this pattern
2. [Aggregate pattern](https://microservices.io/patterns/data/aggregate.html) - used to structure business logic
3. [Transaction outbox pattern](https://microservices.io/patterns/data/transactional-outbox.html) - used to publish events as part of database transaction
4. [Event sourcing](https://microservices.io/patterns/data/event-sourcing.html) - sometimes used to publish domain events