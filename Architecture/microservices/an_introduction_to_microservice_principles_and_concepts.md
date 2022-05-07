# An Introduction to Microservice Principles and Concepts #
## Microservices ##
### Introduction ###
#### Microservices: Definition ####
1. No universally acknowledged definition
2. For the coures:

		Microservices are independently deployable modules
		
3. Example: e-commerce system can be divided into modules for
	1. Ordering
	2. Registration
	3. Product search
4. If all the modules are implemented in an application, a change in one of the modules can be brought into production by bringing a new version of the entire app (with all its modules)
5. If the modules are implemented as microservices
	1. Ordering module (say) can be changed independently of other modules
	2. Ordering module (say) can be brought into production independently
6. Advantages:
	1. Speeds up deployment
	2. Reduces number of tests (only for single module)
	3. A large project turns into a number of smaller projects
		1. Each project is in charge of a single microservice
7. Technically
	1. Every microservice has to be an independent process
		1. Provide independent virtual machine or Docker container for decoupling
			1. Deployment will replace a Docker container of an individual microservice with a new Docker container
				1. Other microservices will not be affected

##### Advantages of this Microservice Definition #####
1. Advantages:
	1. Compact
	2. General and covers all kinds of systems which are commonly denoted as microservices
	3. Definition is based on modules and is well-understood concept
		1. Allows us to adopt many ideas concerning modularization
		2. Also highlights that microservices are part of larger system and cannot function entirely on their own
			1. Microservices have to be integrated with other services
	4. Independent deployment has many [advantages](https://www.educative.io/collection/page/10370001/6518081205567488/4998953437233152)
		1. Definition explains what the most essential feature of a microservice really is

##### Deployment Monolith #####
1. System that is not made up of microservices can only be deployed in its entirety
	1. It is called deployment monolith
2. Deployment monolith can be divided into modules
	1. It does not make statement about internal structure of system

##### Size of a Microservice #####
1. Definition does not suggest anything about size of microservice
2. Microservices (though suggesting small services) can in practice be very huge
	1. Some microservices keep an entire team busy but others may have only few hundred lines of code
3. Size is ill-suited for definition

#### Chapter Walkthrough ####
1. [Advantages](https://www.educative.io/collection/page/10370001/6518081205567488/4998953437233152) and [disadvantages](https://www.educative.io/collection/page/10370001/6518081205567488/4532272759832576) of microservices
	1. These help evaluate applicability and usefulness of the architecture for specific project
2. Discussion of benefits explains which problems microservices can solve and how the architectue can be adapted for different scenarios
3. Discussion of disadvantages illustrates where technical challenges and risks lie and how those can be addressed
4. Recognizing advantages and disadvantages is critical for technology and architecture decisions to maximize benefits and reduce disadvantages

### Advantages ###
1. Reasons to use microservices

#### Microservices for Scaling Development ####
1. For easy scalability of development
	1. Or else large teams have to work on complex projects
	2. Microservices helps us divide the projects into smaller units and can work indepenedently of each other
	3. Examples:
		1. Teams responsible for an individual microservice can make most technology decisions on their own
		2. If microservices are delivered as Docker containers, each Docker container has to only offer interface for other containers
		3. Internal structure of containers does not matter if interface is present and works correctly
			1. It becomes irrelevant which programming language a microservice is written in
			2. The team can make decisions on their own
			3. Selection can be restricted to avoid increased complexity
			4. Even if programming language is restricted, team can use updated library with bug fix for their microservice
			5. A new feature requires change only in one microservice
				1. It can be deployed independently
				2. It can be brought into production on its own
2. Summary: With microservices, teams can act independently regarding domain logic and technology
	1. This minimizes coordination effort required for large projects

#### Replacing Legacy Systems ####
1. Maintaining legacy systems is a challenge since
	1. Code is often badly structured
	2. Changes are not checked by tests
	3. Developers might have to deal with outdated technologies
2. Microservices can replace parts of old system which requires integration between old system and new microservices
	1. Existing code does not have to be necessarily changed
	2. Example integration:
		1. REST
		2. Messaging
		3. UI level
3. Problems:
	1. Single sign-on for old system and new microservices need to be solved
4. [Greenfield project](https://en.wikipedia.org/wiki/Greenfield_project) - Microservices is like a greenfield project
	1. No pre-existing codebase needs to be used
	2. Devs can employ different technology stack
	3. Avoid modifying legacy code

#### Sustainable Development ####
1. Microservice-based architectures promise that systems remain maintainable even in long run

##### Replaceability of Microservices #####
1. Reason 1: Replaceability of microservices
	1. If microservice no longer is maintainable, it can be re-written
		1. Less effort as compared to deployment monolith since microservices are much smaller
	2. Cons: It is difficult to replace a microservice on which many other microservices depend on
		1. Since changes might affect the other microservices
		2. To achieve replaceability, dependencies between microservices have to be managed appropriately
2. How to replace a system after it has turned into a legacy system?
	1. If code of a microservice is unmaintainable, it can be replaced without influencing other microservices

##### Dependencies Have to Be Managed #####
1. Dependencies between microservices have to be managed in the long term to achieve maintainability

###### In Classical Architectures ######
1. Difficulties with classical architectures
	1. A developer might write new code and unintentionally introduce new dependency between two modules (which were forbidden in the architecture)
		1. Mistake usually goes unnoticed attention is only on code level and not architecture level
		2. It is not clear which module a class belongs to and hence it is not clear to which module a developer introducted a dependency
2. In such a manner, more and more dependencies are introduced over time
	1. Originally designed architecture becomes more violated which culminates in a completely unstructured system

###### In the Microservices Architecture ######
1. Microservices have clear boundaries due to their interface
	1. Whether interface is implemented as REST interface or messaging
	2. If a developer introduces new dependency on such an interface, all will notice because the interface has to be called appropriately
		1. It is unlikely that architecture violations will occur at the level of dependencies between microservices
	3. Interfaces between microservices are a way architecture firewalls since they prevent architecture violations
		1. Architecture firewalls is also implemented by architecture management tools like [Sonargraph](https://www.hello2morrow.com/products/sonargraph), [Structure101](http://structure101.com/), or [jQAssistant](https://jqassistant.org/)
		2. Advanced module concepts can also generate such a firewall
			1. Java world - [OSGi](https://www.osgi.org/) - limits access and visibility between modules
				1. Access can also be restricted to individual packages or classes
2. Summary: Architecture at the level of dependencies between microservices remains maintainable
	1. Developers cannot unintentionally add dependencies between microservices
		1. This ensures high architecture quality in long term both inside each microservice (how?) and between microservices
	2. Microservices enable sustainable development where speed of change does not decline over time

### Advantages: Continous Delivery ###
#### Continuous Delivery ####
1. [Continous Delivery](http://continuous-delivery-book.com/) - It is an approach where software is continously brought into production with the help of continuous delivery pipeline
2. Pipeline brings software into production via different phases

		commit -> acceptance tests -> capacity tests -> explorative tests -> production

#### Phases ####
1. commit phase
	1. compilation
	2. unit tests
	3. static code analysis
2. acceptance test
	1. automated tests - to ensure correctness of software regarding domain logic
3. capacity tests
	1. To check performance at expected load
4. explorative tests
	1. To perform not-yet-considered tests or to examine new functionalities
		1. Explorative tests can analyze aspects not yet covered by automated tests
5. Then software is brought into production
6. Each microservice has its own continous delivery pipeline
	1. Facilitates continous delivery

#### Microservices Facilitate Continous Delivery ####
1. Continuous delivery pipeline is significantly faster since deployment units are smaller
	1. Deployment is faster
2. Continuous delivery pipeline contain many test stages
	1. Software has to be deployed in each stage
	2. Faster deployents speed up the tests and therefore the pipeline
3. Tests are also faster since they need to cover fewer functionality
	1. Only features in individual microservice needs to be tested
		1. For deployment monolith, entire functionality has to be tested due to possible regression
4. Building continuous delivery pipeline is easier for microservices
	1. Setting up environment for deployment monolith is complicated
		1. Powerful servers might be required
		2. Third party systems might be necessary for tests
	2. A microservice often requires less powerful hardware
		1. Not many third party systems are needed in test environments
		2. Running all microservices together in one integration test can cancel out this advantage
			1. Environment sutable for running all microservices would required powerful hardware & integration with all third-party systems
5. Deployment of microservice poses smaller risk as compared to deployment of deployment monolith
	1. Deployment monolith - entire system is deployed anew
	2. Microservices - only one module is deployed
		1. Fewer problems since less of the functionality is changed
6. Summary - microservices facilitate continous delivery
	1. A reason enough to migrate a deployment monolith to microservices

#### Deployment Must Be Automated ####
1. Microservice architecture works only when deployment is automated
	1. Since microservices increases the number of deployment units (compared to deployment monolith)
		1. Deployment is feasible only when deployment processes are automated
2. Independent deployment - the continous delivery pipelines have to be completely independent
	1. Integration tests conflict with this independence
		1. They introduce dependencies between continous delivery pipelines of individula microservices
		2. Solution: Integration tests must be reduced to minimum
			1. Depending on the type of communication, there are different approaches to achieve this for synchronous and asynchronous communication

### More on Advantages ###
#### Robustness ####
1. Microservice systems are more robust
	1. If a memory leak exists in a microservice, only this microservice is affected and crashes
		1. Other microservices keep running
			1. These need to compensate for the crashed microservice (called resilience)
				1. Cache values and use them in case of problem OR
				2. Fallback to a simplified algorithm
	2. If no resilience, availability of a microservice system might get affected
	3. Microservice can fail for many reasons
		1. Example: Due to distribution into several processes, many servers might be involved and any of the servers might fail
		2. Communication between microservices is via network which can fail
	4. Microservices must implement resilience to achive robustness

#### Independent Scaling ####
1. Scaling whole system may not be required
	1. Example: For shop system, catalog might be most critical and hardware-consuming part
		1. By scaling complete system, hardware is spent on parts that don't require more power
2. Each microservice can be independently scaled
	1. It is possible to start additional instances of a microservice and distribute load of microservice into the instances
		1. This improves scalability of system significantly
			1. Example: Only catalog needs to scaled up
		2. Requirements to be fulfilled
			1. They must be stateless
				1. Or else request of specific client cannot be transferred to another instance
					1. The new instance may not have the state specific to that client
	2. It is difficult to start more instances of deployment monolith due to hardware requirement (which can also increase startup time)
	3. Scaling can be more fine grained for a microservice
		1. Fewer additional services (per microservice) are necessary and the environment is less complex

#### Free Technology Choice ####
1. Each microservice can be implemented with an individual technology
	1. Facilitates migration to a new technology since each microservice can be migrated individually
2. It is simpler and less risky to gain experience with new technologies since they can be used only for a single microservice before they are employed in several microservices

#### Security ####
1. Microservices can be isolated from each other
2. Example:
	1. It is possible to introduce firewalls into communication between microservices
	2. Communication between microservices can be encrypted to guarantee that communication really originates from another microservice and is authentic
		1. Prevents corruption of additional microservices if hacker takes over one microservice

#### In General: Isolation ####
1. Summary: Advantages can be traced back to stronger isolation
	1. Microservices can be deployed in isolation
		1. Facilitates continous delivery
	2. Microservices are isolated in respect to failures
		1. Improves robustness
	3. Each microservice can be scaled independently of other microservices
	4. Technologies can be chosen for each microservice in isolation
		1. Free technology choice
	5. Microservices are isolated in way that they can only communicate via network
		1. Communication can be safeguarded by firewalls
			1. This increases security
	6. Strong isolation ensures that boundaries between modules cannot be violated by mistake
		1. Architecture is rarely violated
			1. This safeguards the architecture
	7. A microservice can be replaced with another microservice
		1. Enables low risk replacement of microservices
		2. Allows architecture of individual microservices to be kept clean
		3. Isolation facilitates long-term maintainability of software
	8. Decoupling - Important feature of modules
		1. Microservices push decoupling to its extremes
			1. Modules are usually decouples in regard to code changes and architecture
			2. Microservices goes beyond that
2. Smaller size of microservices serves many purposes
	1. Easier to reason about them
	2. Security of microservice is easier to verify
	3. Performance is easier to measure
	4. Easier to figure out whether they work correctly
	5. Design and development is easier
3. Next: Tradeoffs of using microservice architecture
	1. How to prioritize advantages based on application
	2. Two levels of microservices and how many microservcies can be expected per system

### Tradeoffs, Prioritizing Advantages, & Levels ###
1. Ways we can prioritize advantages of microservice architectue and some potential trade-offs to be considered

#### Prioritizing Advantages ####
1. Which of the reasons for switching to microservices is most important depends on individual scenario
	1. Microservices in a greenfield system is exception
2. Often deployment monolith is replaced with microservice system
	1. Different advantages are relevant
		1. Easier scaling of development - an important reason for introduction of microservices
			1. Often difficult to work with a large number of developers on a single deployment monolith
		2. Easy migration from legacy deployment monolith facilitates introduction of microservices
		3. Continuous delivery is often a goal
			1. Aim is to increase speed and reliability with which changes can be brought into production
3. If single scrum team wants to implement a system with microservices, scaling development is not sensible reason
	1. Since development team is not large enough
	2. Other reasons
		1. Continuous delivery
		2. Technical
			1. Robustness
			2. Independent scaling
			3. Free technology choice
			4. Sustainable development
4. Focus on increasing business value
	1. Advantage in previously mentioned areas might make company more profitable or competitive
		1. Example: Faster time to market, better reliability of system

#### Microservices Involve Trade-Offs ####
1. What team needs to compromise when implementing microservices
	1. Example: 

#### Two Levels of Microservices: Domain and Technical ####
#### Typical Numbers of Microservices in a System ####

### Challenges ###

## Micro and Macro Architecture ##
### Introduction ###
### Domain-Driven Design & Bounded Contexts ###
### Strategic Design & Common Patterns ###
### Architecture Decisions ###
### Operation: Micro or Macro Architecture? ###
### Give a Preference to Micro Architecture! ###
### Organizational Aspects ###
### Independent Systems Architecture Principles ###
### Variations ###

## Migration ##
### Introduction ###
### Reasons for Migrating ###
### Typical Migration Strategies ###
### Alternative Strategies ###
### Build, Operation, and Organization ###
### Variations ###

## Docker ##
### Introduction ###
### Docker for Microservices: Reasons ###
### Docker Basics ###
### Dockerfile ###
### Docker Compose ###
### Variations ###

## Technical Micro Architecture ##
### Introduction ###
### Requirements ###
### Reactive Programming ###
### Spring Boot ###
### Spring Boot Starter Web as Single Dependency ###
### Spring Boot for Microservices: Communication ###
### Other Communication APIs Supported by Spring ###
### Spring Boot for Microservices: New Microservices & Resilience ###
### Go ###
### Go for Microservices? ###
### Variations ###