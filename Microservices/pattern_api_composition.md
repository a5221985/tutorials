# Pattern: API Composition #
## Context ##
1. If we apply database per service pattern, it can result in not being so straight forward to implement queries that join data from multiple services.

## Problem ##
1. How to implement queries in a microservice architecture?

## Solution ##
1. API Composer
	1. It invokes services that own the data and performs in-memory join of the results

	![api_composition_pattern_example](api_composition_pattern_example.png)

## Example ##
1. An [API Gateway](https://microservices.io/patterns/apigateway.html) does API composition

## Resulting Context ##
1. Benefits
	1. It is a simple way to query data in microservice architecture
2. Drawbacks
	1. Some queries might result in in-efficient in-memory joins of large datasets

## Related Patterns ##
1. Database per Service pattern initiates the need for this pattern
2. CQRS pattern is an alternative solution