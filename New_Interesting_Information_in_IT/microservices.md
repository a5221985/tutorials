# Microservices #
## Wiki ##
1. Implementation approach for SOA
2. It consists of independently deployable software systems.
3. Services are processes that communicate with each other over a network to achieve a goal
4. Protols used for the communication is technology-agnostic
5. Continuosly deployed systems can be realized using DevOps
6. Requirements:
	1. Small granularity
	2. lightweight protocols
	3. Services must be independently deployable
7. Benefits
	1. Enhances cohesion
	2. Decreases coupling (easier to change and add functions and qualities to system)
	3. Artitecture of individual servie emerges through continous refactoring
		1. Reduces need for big up-front design
	4. Allows releasing software early
	5. Allows releasing software continuously
8. Characteristics
	1. Service is easy to replace
	2. Services are organized around capabilities
		1. UI front-end, recommendation, logistics, billing, ...
	3. Service can be implemented using different programming languages, databases, hardware, software env
	4. Service is small in size, messaging enabled, bounded by contexts, autonomously developed, independently deployable, decentralized and built and released using automated processes.
9. Architecture
	1. Naturally modular
	2. Continuous delivery software development process.
		1. Any change to small part of app only requires only few services to be rebuilt and redeployed
	3. Fine grained interfaces
	4. Business-driven development
	5. Cloud app architecture
	6. Light weight container deployment
	7. polyglot programming and persistence
	8. Decentralized continuous delivery
	9. DevOps with services monitoring
10. Problems:
	1. Services are information barriers
	2. additional complexity is introduced.
		1. Network latency
		2. message formats
		3. load balancing
		4. fault tolerence
	3. Testing + deployment is more complicated
	4. Higher cost for inter-service calls
		1. Latency
		2. message processing time
	5. Moving responsibilities between services is more difficult
		1. communication between different teams may be necessary
		2. Rewriting functionality in another language my be involved
		3. Fitting into a different infrastructure may be necessary
	6. Complexity is shifted to network but it still exists
		1. It can be overcome by standardizing access mechanism.
			1. ex: between browser and app resource
11. Antipattern: Nano Services
	1. It is a service that is too fine grained whose overhead (communications, maintenance, ...) outwieghs the utility
		1. Overheads:
			1. Serialization/Deserialization
			2. Network traffic
			3. Interface definition
			4. Retries
			5. Fragmented logic (functionality distributed over many services)
12. Solution for nano-services
	1. Packaging functionality into software library (than service)
	2. combination of functionality to produce useful service
	3. Refactoring system (putting functionality in other services/redesigning system)
12. Implementation
	1. Baratine: open source JVM framework for reactive apps
	2. Docker
	3. Eduro/X: Framework (C/C++/Go)
	4. JLupin Next Server: Microservices platform (Java, .Net apps)
	5. Jolie: first language for Microservices
	6. KumuluzEE: open source microservices framework for Java EE
	7. MicroService4Net: uses windows services and self hosting web API (C#)
	8. NetKernel: OS for complex distributed microservices architecture
	9. Nirmata: SaaS solution with microservices tooling and container management
	10. Spring cloud: Tools for Spring Boot developers
	11. Wilma: Test tool
	12. Vert.x
13. Further information
	1. Building Microservices - Designing Fine-Grained Systems: S.Newman
	2. Microservices Architecture - Aligning Principles, Practices and Culture: I. Nadereishvili