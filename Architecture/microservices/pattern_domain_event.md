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
## Related Patterns ##