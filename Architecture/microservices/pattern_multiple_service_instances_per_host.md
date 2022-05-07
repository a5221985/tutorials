# Pattern: Multiple Service Instances Per Host #
## Context ##
1. Pre-requisite: Application of [Microservice Architecture Pattern](https://microservices.io/patterns/microservices.html)
	1. Each service is deployed as set of service instances
		1. For throughput and availability

## Problem ##
1. How are services packaged and deployed?

## Forces ##
1. Services written in variety of languages, frameworks, and framework versions
2. Each service consists of multiple service instances for throughput and availability
3. Service must be independently deployable and scalable
4. Service instances need to be isolated from one another
5. Need to be able to quickly build and deploy a service
6. Need to be able to constrain the resources (CPU and memory) consumed by a service
7. Need to monitor behaviour of each service instance
8. Want deployemnt to be reliable
9. Must deploy application as cost-effectively as possible

## Solution ##
1. Run multiple instances of different services on host (Physical or Virtual Machine)
2. There are ways to deploy service instance on shared host
	1. Deploy each service instance as JVM process
		1. Tomcat or Jetty instances per service instance
	2. Deploy multiple service instances in same JVM
		1. Web apps or OSGI bundles

## Examples ##
## Resulting Context ##
1. Benefits of the pattern
	1. More efficient resource utilization than [Service Instance per host pattern](https://microservices.io/patterns/deployment/single-service-per-host.html)
2. Drawback of the approach
	1. Risk of conflicting resource requirements
	2. Risk of conflicting dependency versions
	3. Difficult to limit resources consumed by service instance
	4. If multiple services instances are deployed in same process then it is difficult to monitor resource consumption of each service instance
		1. Also impossible to isolate each instance

## Related Patterns ##
1. [Single Service Instance per Host pattern](https://microservices.io/patterns/deployment/single-service-per-host.html)
2. [Serverless Deployment Pattern](https://microservices.io/patterns/deployment/serverless-deployment.html)