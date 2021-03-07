# Domain Driven Design #
## Introduction ##
### Course Introduction ###
1. In the course
	1. About domain-driven design
	2. About domain-driven design building blocks, patterns and best practices to architect solutions and implement the code itself
	3. Design and code out a system using domain-driven design though detailed video tutorials
	4. Design own domain-driven component, then code it out
2. Ideal for:
	1. Software developers working on complex systems
	2. Software developers who are designing new systems, or refactoring existing systems
	3. Software architects who want to improve their skills in designing domain-driven components and solutions
	4. Anyone who wants to learn about domain-driven design and gain in-depth technical knowledge on how to design, structure and code systems following this approach
3. Course contents and structure
	1. Video tutorials explaining in detail the different technical skills and design skills that are necessary to architect and code a system following a domain-driven approach
	2. Assignments to gain understanding and expertise, with model answers explained in detail by the instructor. Coding solutions will be available to download in multiple object oriented langauges including C#, Java and Python

## What is DDD? ##
### Introduction to DDD ###
1. What is DDD?
	1. Used by Eric Evans
		1. To describe software architecture and design technique where the project's primary focus is on the core domain and it's logic
	2. What is domain?
		1. Specific subject for which the software is developed
			1. Objective - to reduce complexity by developing a solution by implementing it as close as possible to the domain of the problem we are solving
	3. To develop software properly using DDD, as developers, we need to work closely with the Domain expert who can explain how the real-world system works and together we can build a domain language that is understandable by both developers and the domain expert
		1. The language is then used in the code
			1. When we write functional requirements, the domain expert should be able to understand those requirements and verify that they are correct
				1. The common domain language is known as the **ubiquitous language**
2. Quote:

		Any foos can write code that a computer can understand. Good programmers write code that humans can understand. - Refactoring: Improving the Design of Existing Code, 1999
		
	1. The goal of DDD:
		1. To be able to build complex systems that are more maintainable, understandable and that help us achieve our business functionality by modeling our system on the domain itself

### Where to use DDD - Advantages and Disadvantages ###
1. Advantages
	1. Ubiquitous language - makes communication between development team and business team easier and also among development team
	2. The system is built to model the business domain, it will generally be flexible to change
		1. When new functional requirements need to be implemented
	3. Domain models are built using encapsulation, modularity and good module breakdown
		1. This makes domain driven systems more maintainable by nature
2. Disadvantages
	1. It requires strong domain expertise and effective communication between development team and domain experts
		1. This can add overhead and can lengthen development duration
	2. Higher (upfront) cost for the business
		1. May not be suitable for short term projects or for projects where there isn't high domain complexity (Not sure about this)
3. Suitable for projects that are:
	1. Long term
	2. Have a high domain complexity
	3. Have clear benefits in communication using a common domain language
4. Not suitable for technically complex projects (domain experts may not understand the technical complexity)

## DDD in Practice ##
### The Building Blocks ###
1. Domain: The subject are around which our program is going to be built
2. Domain Model: A conceptual object model representing different parts of the domain, that will be used in our software. It includes both behavior and data
3. Bounded Context: The context to which a model can be applied. In a complex project we often have multiple domains, each with their own bounded context
	1. Domain:
		1. Customer sub-domain
			1. Domain model for customer will only be valid in it's bounded context
		2. Product sub-domain
			1. Domain model for the product could only be applied to product sub-domain
4. Ubiquitous language: The common domain language used within the team and in the code itself
5. Entity: An object that is defined by a thread of continuity and its identity rather than by its attributes
	1. An object that is uniquely identified by its identity field
6. Value: An object that has attributes but no identity. It should be treated as immutable
7. Aggregate: A collection of values and entities which are bound together by a root entity, known as an aggregate root. The aggregate root encapsulates these objects and external objects should not reference its members. This guarantees the consistency of changes being made within the aggregate.
8. Domain Event: An event directly related to the domain
	1. An event is an object that represents that something has happened
		1. Domain events: handled differently as compared to non-domain events
			1. They may need modifying the domain model
9. Example: Hotel Booking System

	1. Booking - Contains a Customer and a Hotel Room (There could be other properties such as booking dates, specific requirements of customer, ...) - Aggregate (encapsulates two entities and properties)
		1.Customer (Object uniquely identified by a custom id - they may need to change over time (certain property of customer changes - address, salary, ...) - It is an entity in domain model
			1. Address - a property of customer (Object doesn't need to be uniquely identified by an identity - it just has certain values) - Value in domain model
				1. Country
				2. PostCode
				3. ...
		2. Hotel Room - Could be considered Value type (if it were any root)
			1. In order to identify each room differently - room 2, room 4 (booking timings may change, the number of begs owned in each room) - It can be entity
	2. If a customer does booking - a new booking object gets created
		1. A **Booking Created** event can be published (which other components can subscribe to)
			1. It is a domain event - it is directly related to the domain
5. We can convert functional programming requirements into domain models using domain driven design

### Design Patterns ###
1. Design patterns that are recommended to be used with DDD
	1. Factory - Recommended to encapsulate the logic of creation of domain objects such as entities and aggregates
		1. This pattern saves the client from being aware of the inner workings of object manipulation
			1. The entities and aggregates can be changed by client without knowing the inner workings of them
		2. Example:

				Application Code - Calls factory method -> Domain Object
				                                      Private Constructor
				                                      Factory Method
				                 <- Factory returns    
				                    an instance of 
				                    the domain object
				                    
			1. Constructor is made private to avoid direct creation
			2. Factory method is exposed to the application code
				1. This calls constructor
	2. Repository - Persistence related pattern
		1. The pattern adds an abstraction layer on top of the data access layer
			1. Methods used for retrieving and storing domain objects should be delegated to a specialized Repository object
				1. The application logic is not aware of the implementation of status storage related methods
					1. Alternative storage implementations can be interchanged without changing application or domain logic
			2. Example:

					Application Code -> Repository -> Storage
					                                  Implementation
					                                  
				1. We can change storage from Redis to MySQL it is possible
	3. Service - Objects that manipulate main domain objects without being part of the domain
		1. Certain operations do not conceptually form part of any entity, value or aggregate objects
			1. These operations need to be moved to a service

					Application Code
							| (calls)
							v
						Domain Object
							|
							v
						Domain Service
						
			2. Service should use terms from the ubiquitous language
			3. Services should be stateless
			4. If operations do not naturally belong to the domain object, they reside in service

### Component Architecture ###
1. It is a particular architecture style only
	1. Onion architecture model
	
									Service
								Application
			Service Application Domain Application Service
								Application
									Service
									
			Infra
				
		1. Outer layers depend on inner layers
			1. Service layer can reference Application and Domain layers
		2. Inner layers cannot depend on outer layers
			1. Domain layer cannot reference any other layer
	2. Domain layer - Contains domain models and related domain logic
	3. Application layer - Application level logic
	4. Service layer - Web API setup (If API component), User Interface Logic (If UI component)
	5. Ifra layer - Contains cross cutting concerns
		1. It is a separate layer
	6. Advantages:
		1. Reduces coupling
		2. Makes code more maintainable
2. We can use other architecture styles
	1. 3 tier architecture
	2. Hexagonal architecture

## A Complete DDD Example: From Design to Coding! ##
### Design Modelling ###
1. Realworld problem
	1. Design a system based on the information - before coding
2. Problem: Next

### Assignment 1: Design Modelling Assignment ###
1. Real world problem:
	1. Scenario:
		1. e-commerce clothing store - redesign monolithic system into modular system following DDD
		2. Processes, flows, functionalities
			1. Customers can view, filter and sort products on the site
			2. Customers can order products, paying via card or through Paypal
			3. Customers can redeem gift coupons and promotions to purchase products at a discounted price
			4. Products should be updated via regular product feeds to update availability, sizes, discontinuations
			5. Customers can view their order history
			6. Customers can track unfulfilled orders
			7. Customers can edit their personal information such as contact details and billing address
	2. Design and model using DDD principles
2. Possible solution:
	1. Entities:
		1. Customer
		2. Product
		3. Order
	2. Values
		1. Billing Address
		2. Contact Details
		3. Card
		4. Gift Coupon
	3. Repositories
		1. ProductRepository
		2. CustomerRepository
		3. OrderRepository

### Step 3: Coding ###
### Assignment 2: Coding a System using DDD ###
### Coding - Model Answer Explanation - Part 1 ###
### Coding - Model Answer Explanation - Part 2 ###
### Coding - Model Answer Explanation - Part 3 ###
### Bounded Contexts and Anti-Corruption Layers ###

## Next Steps ##
### Next Steps ###
1. How to beging using DDD..
	1. Try out on a small subset of your domain as part of a refactoring project
		1. Helps establish a domain driven mindset
		2. Helps ensure I am confident enough and have sufficient domain knowledge to apply domain driven design to other parts of the problem domain 
	2. Break down larger domains into smaller, more manageable subdomains!
		1. Especially when we are starting out
			1. To reduce unnecessary complexity
	3. Fits in well with several other architecture patterns including Microservices, CQRS and Event sourcing
		1. CQRS - Command Query Responsibility Segregation
	4. Other courses of the trainer
		1. Specialized microservices coures
		2. Enterprise architecture course