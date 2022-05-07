# Pattern: Single Service Instance Per Host #
## Context ##
1. Pre-requisite: Applied [Microservice architecture pattern](https://microservices.io/patterns/microservices.html)
	1. Architected system as a set of services
2. Each service is deployed as a set of service instances for throughput and availability

## Problem ##
1. How are services packaged and deployed?

## Forces ##
1. Services written in variety of languages, frameworks, and framework versions
2. Each service consists of multiple service instances for throughput and availability
3. Service must be independently deployable and scalable
4. Service instances need to be isolated from one another
5. Need to be able to quickly build and deploy a service

## Solution ##
## Examples ##
## Resulting Context ##
## Related Patterns ##