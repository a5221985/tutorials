# Software Architecture Monday #
## When Should You Replace Your Architecture? ##
1. Is my architecture okay?
2. Should I replace my architecture or keep it the same?
3. Architecture vitality:
	1. How viable my architecture is today
		1. 2, 5 years ago
		2. Is it still sound
	2. Drivers (as they change they may impact architecture (influence or reshape))
		1. Business drivers
			1. What are the needs and what is the business concerned about
				1. Mergers and acquisitions
				2. Time to market
				3. Competitive advantage
				4. User satisfaction
		2. Technology environment
			1. Deployment env: On prem vs cloud
			2. Are we using containerization
			3. CI-CD pipeline improvements or methodology
		3. Organizational structure
			1. How are the teams organized and the communication among them within the organization
				1. Pools of devs & testers in silos vs cross functional teams & domain based teams
				2. DevOps exists or not
	3. Example: Business drivers - use star ratings for architecture
		1. "We are a small startup that needs to get an application out the door as quickly and as inexpensive as possible"
			1. Drivers:
				1. Cost
				2. Simplicity
				3. Timeliness
			2. From star ratings
				1. Monolithic applications
					1. Layered - most supported
					2. Modular monolith - most supported
					3. Microkernel
						1. If shape of architecture matches our problem
		2. "Now that we are successful, we need to scale to meet high customer volumes, and we need fast time-to-market to remain competitive"
			1. Drivers:
				1. Scalability
				2. Agility - ability to respond quickly to change
			2. From star ratings
				1. Microservices - most supported (we need to move to this from monolithic)
				2. Service-based
				3. Monolithic - poorely supported

## Transacted Messages ##
1. Service A sends event to a topic
	1. Service B, C, D receive the event
		1. No coordination
	2. There are times when we need to send different messages
		1. Service B - white message
		2. Service C - green message
		3. Service D - blue message
	3. We might need to
		1. Monitor queue depth - for autoscaling OR
		2. Secure information OR
		3. Three different messages
	4. Solution:
		1. Point to point with a dedicated queue for each service
	5. Example: (more like a command than an event)
		1. Service A sends a message to Service B
		2. Service A then sends a message to Service C
		3. Service A then sends a message to Service D
	4. Problems
		1. Suppose Service A sends a message to Service B
		2. Suppose Service A then sends a message to Service C
		3. Now Service A has an exception and cannot send any further messages
			1. Solution:
				1. Start a transaction (on message broker)
				2. Send message to Service B - it is not picked up yet
				3. Send message to Service C - it is not picked up yet
				4. Send message to Service D - it is not picked up yet
				5. Now transaction is committed
					1. All messages are released and picked up by services
					2. We cannot control transactions in other services with messaging and event driven architecture
		4. Failure scenario
			1. Start a transaction
			2. Send a message to Service B
			3. Send a message to Service C
			4. Now an exception occurred and I rollback
			5. Messages are removed from both Service B and C
	5. Example implementations:
		1. JMS
		
				JMSContext jmsContext = cf.createContext(JMSContext.SESSION_TRANSACTED);
				...
				...
				jmsContext.commit(); // or jmsContext.rollback();
				
		2. AMQP
		
				ConnectionFactory factory = new ConnectionFactory();
				Connection conn = factory.newConnection();
				Channel channel = conn.createChannel(); // like session in JMS
				channel.txSelect(); // RabbitMQ
				...
				...
				channel.txComit(); // or channel.txRollback();
				
## Domain vs Technial Partitioning ##
1. Technical Partitioning:
	1. N-Tiered (Layered)
		1. Presentation Layer - customer screens
		2. Business Layer - customer logic
		3. Services Layer - customer utilities
		4. Persistence Layer - customer sql
		5. Database Layer - customer tables
	2. Where is the customer domain?
		1. It is everywhere (entire architecture)
	3. What is the change scope?
		1. At application level
			1. Suppose we want to add an expire date to wishlist items
				1. database layer: Add colum
				2. persistence layer: Modify SQL
				3. service layer: Utilities for data
				4. business layer: Modify business rules
				5. presentation layer: Modify presentation layer to show
2. Domain partitioning
	1. customer ui -> customer
		1. Add an expire data to wishlist items
			1. deployment unit?
				1. Domain
	2. payment ui -> payment
	3. shipping and tracking ui -> shipping
	4. shipping and tracking ui -> tracking
3. Partitioning classification
	1. Technically partitioned
		1. Layered architecture
		2. Pipeline architecture - different components
			1. Filters
				1. Producers
				2. Consumers
				3. Transformers
				4. Testers
			2. Domain is spread across
	2. More technical partitioned and little domain partitioned
		1. Microkernel architecture
			1. each plugin is unique structure separate from the core domain of the system
			2. At times we can use plugins to represent domain
	3. More technical partitioned and little more domain partitioned
		1. Event-driven architecture
			1. Events and event processors are involved
				1. Domain is spread across multiple event processors
	4. In the middle:
		1. Space-based architecture
			1. Technically partitioned - due to artifacts and their roles
				1. Caching
				2. Data pumps
				3. Data readers
				4. Data writers
				5. Data updaters
			2. Domain partitioned
				1. Services that are domain based is possible
	5. More towards domain partitioned
		1. Modular monolith
		2. Service-based architecture
		3. Microservices architecture
			1. Change scope is at function level
4. Representation of components
	1. Through namespaces
		1. Layered (technical focus)
			1. app.presentation.customer.*
			2. app.business.customer.*
			3. app.services.customer.*
			4. app.persistence.customer.*
		2. Modular monolith (domain focus)
			1. app.customer.presentation.*
			2. app.customer.business.*
			3. app.customer.services.*
			4. app.customer.persistence.*
5. Call:
	1. If most changes are technical - replacing ui, replacing db, ...
		1. Technical partitioned architecture is a good choice
	2. If most changes are domain based
		1. Domain partitioned architectured is a good choice

## Why Enterprise Architecture Efforts Fail ##
1. 1/3 of enterprise architecture fail or get abandoned
2. Enterprise architecture - It is a bridge/glue between business strategy and operating model and IT operations/systems and infrasture and capabilities
	1. It aligns the two from planning and design standpoint
3. They might fail
	1. Reasons
		1. Enterprise architects
			1. They have to work with business stakeholders
				1. Business stakeholders tell EAs
			2. EAs build roadmaps as to what needs to be done to satisfy or implement business initiative
			3. The roadmap elements become projects that get sent to application architects
			4. Application architects build detailed models as to what really needs to be done
		2. Problems
			1. They work in silos
				1. Application architects might complain that EAs leave out too many details and they don't really know what needs to be done
				2. Business stakeholders might complain that EAs dont know enough about the business and don't really fully accomplish or grasp what we are trying to accomplish
		3. A solution:
			1. Bidirectional collaborative communication
			2. EAs become part of Business stakeholders and Application architects
				1. They know the insides on both sides
		4. Problems - Primary reason - Communication
			1. Warning signs:
				1. Business stakeholders stop listening to ea teams or don't care
					1. They are in their way
				2. Your EA team is seen as support staff and get assigned to projects

## Architecture Decision Records ##
1. Architecturally significant
	1. We will keep a collection of records (architecture decision records) for architecturally significant decisions: those that affect the structure (overall style - microservices, micro-kernel, service based, layered, ...), non-functional characteristics (ilities), dependencies (between services and components), interfaces (apis, ...), or construction techniques (processes, procedures, platforms and languages, ...) - Michael Nygard
2. Sections:
	1. Short text file: 1-2 pages long, one file per decision
	2. Markdown, textile, asciidoc, plaintext, etc...
	3. One document has only one decision
		1. Sections: (of ADR)
			1. Title
				1. Short noun phrase & numbered
				2. Describes actual architectural decision
			2. Status
				1. Proposed
				2. Accepted
				3. Superseded
			3. Context (describes the problem and why I am needing to make this architecture decision)
				1. Forces at play
				2. Alternative choices
			4. Decision
				1. Architecture decision
				2. Response to forces with justification
			5. Consquences
				1. Context after decision is applied
					1. Good or bad
				2. Document them
			6. Metadata
				1. Author
				2. When was it approved
				3. Who approved
				4. If it is modified who modified this decision
			7. Measurements for Compliance
				1. Document how it is going to be measured
					1. Using automated or manual fitness function
3. Scenario (customer info say)
	
		http-client -> Mule -> ActiveMQ -> DB
		external -> Mule
		b2b -> Mule
		
	1. REST - Messaging
	2. Decision:
		1. Should we have dedicated ActiveMQ per client or centralized one?
			1. Show alternatives and justify
	3. ADR:
		1. 21. Centralized message broker for federated gateway hub
		2. Status
			1. Accepted
		3. Context
			1. The incoming gateway hub is federated into 3 separate hubs.
			2. Access to the customer information functionality in the application is only through JMS using ActiveMQ via the hub. The two options are to use a centralized broker or to use dedicated broker instances for each hub instance
		4. Decision
			1. We will use a centralized message broker instance for all federated gateway hubs
				1. It must be an affirmative decision
			2. We currently have low request volumes (200 requests/sec) and anticipate this will remain stable for the foreseable future. Therefore we do not see a performance bottleneck issue.
			3. We will leverage the ActiveMQ failover protocol coupled with clustered ActiveMQ broker instances to address any single point of failure issues
		5. Consquences
			1. The customer information application will only require a single connection to the ActiveMQ broker instance (instead of 3 connections)
			2. The gateway hubs can be expanded and consolidated without any coding changes to the application
			3. The application doesn't need to be concerned about where the request came from
	4. If Markdown or Wiki is used, we can add figures and descriptions
4. ADR automations
	1. [https://github.com/npryce/adr-tools](https://github.com/npryce/adr-tools)
	2. Commands:
	
			adr init doc/arch # for versioning in repo
			adr new Central broker for hub
			  doc/arch/adr-021.md # bring up in editor
			adr new -s 21 Dedicated broker for hub
			  doc/arch/adr-022.md # supersedes 21
			  doc/arch/adr-021.md # superseded by 22 - marked and this doc is no longer valid
			  
5. Links:
	1. [Architecture Decision Records](http://thinkrelevance.com/blog/2011/11/15/documenting-architecture-decisions) - Michael Nygard
	2. [Software Architecture Monday](https://www.developertoarchitect.com/lessons/)
	3. [Upcoming Events](https://www.developertoarchitect.com/upcoming-events.html) - conferences and trainings

## Lesson 86 - Becoming a Software Architect ##
1. Roadmap for becoming software architect
	
		make sure you are prepared
		|
		v
		develop a personal roadmap and radar (a direction for making decisions about projects - what I should work on, different jobs)
		|    |    |    |
		|    |    |    v
		|    |    |    begin developing good soft skills (start becoming the "go-to" person on the team, make yourself known to business stakeholders (walk around and be seen) -> start developing negotioation skills): 1. start developing facilitation skills, 2. start developing leadership skills
		|    |    v
		|    |    start focusing on tradeoff analysis (continually identify and analyze tradeoffs)
		|    v
		|    learn architecture styles and patterns (language of architects)
		v
		start focusing on technical breadth
		|
		v
		maintain your technical breadth	
	
2. Make sure you are prepared
	1. a passion for creation of solutions for business problems
		1. Understand business problem (on business side)
			1. Build solutions that address those problems
		2. An interest in developing strong people skills
			1. Negotiations (know and develop)
		3. A desire to mentor, coach, and lead teams
			1. Sitting in cubicle is not right attitude for this
		4. A willingness to stay technical but go broader rather than deeper
			1. Focus is more on technical depth
		5. An understanding of what is expected of a software architect
			1. Make architecture decisions that guide technology decisions for the development teams (for team, division or entire company)
				1. To support ilities (availability, scalability, performance, ...)
			2. Continually analyze the architecture and recommend solutions for improvement
				1. Architecture vitality
			3. Analyze technology and industry trends and keep current with the latest trends
			4. Ensure compliance with the architecture
				1. The architecture decisions might not be met if we don't ensure compliance
			5. Have exposure to multiple and diverse technologies, platforms, and environments
			6. Have a certain level of business domain expertise (to collaborate and communicate with business stakeholders)
				1. Trading OR
				2. Banking OR
				3. Retail OR
				4. Finance OR
				5. ...
			7. Possess exceptional interpersonal skills, including teamwork, facilitation, and negotiation
			8. Understand the political climante of the enterprise and be able to navigate the politics
				1. To get things done
3. References:
	1. Tips for transitioning into software architecture interview (O'Reilly)
		1. [https://www.youtube.com/watch?v=JV8HNsFWHD4](https://www.youtube.com/watch?v=JV8HNsFWHD4)
	2. Fundamentals of Software Architecture - Mark Richards and Neil Ford

## Lesson 87 - Becoming a Software Architect - Part 2 ##
1. Develop a personal roadmap and radar
	1. [developertoarchitect.com/lessons/lesson58.html](developertoarchitect.com/lessons/lesson58.html)
		1. Watch this - introducing the process of certification
		2. Download nomination packet
			1. We can track our proficiencies as software architect
				1. Example: Establish technical vision
					1. Allows tracking dates
					2. Allows tracking system we worked on
					3. Allows tracking major activities and system we worked on
					4. Briefly describe how we established the technical vision
		3. Sections:
			1. Core foundational skills
				1. CFS01 - Apply Communication Skills (various levels of proficiencies)
				2. CFS02 - Lead Individuals & Teams
				3. CFS03 - Perform Conflict Resolution
					1. Negotiation and facilitation
				4. CFS04 - Manage Architectural Elements of an IT Project Plan
					1. What aspects of architecture need to be coordinated within the plan
				5. CFS05 - Understand Business Aspects
					1. Core business drivers
					2. Talking business stakeholders
					3. What are the business drivers and goals within the project
				6. CFS06 - Develop IT Architecture
					1. Elements such as components, architecture style
				7. CFS07 - Use Modeling Techniques
				8. CFS08 - Perform Technical Solution Assessments
					1. Assessing an architecture
				9. CFS09 - Apply IT Standards
				10. CFS10 - Establish Technical Vision
					1. Balance between being pragmatic and being visionary
				11. CFS11 - Use of Techniques (of architecture)
					1. Data analysis
					2. Component analysis
					3. ATAM
					4. CBAM
				12. CFS12 - Apply Methods (of architecture)
				13. CFS13 - Define Solution to Requirements
				14. CFS14 - Manage Stakeholder Requirements
					1. Understand how stakeholder requirements are satisfied through architecture
				15. CFS15 - Establish Architectural Decisions
					1. Use of ADRs
				16. CFS16 - Validate Conformance of Solution to the Architecture
				17. CFS17 - Perform as Technology Advisor
				18. EC01 - Experience Producing Architectures
					1. Demonstrate that proficiency
				19. EC02 - Breadth of Architecture Experience
				20. EC03 - Experience with Different Technologies and Architectures
					1. Core expectation
					2. Charting and documenting experience
				21. EC07 - Industry Knowledge
				22. EC08 - Knowledge of IT Trends
					1. Demonstrate where we have leveraged that knowledge
				23. PD02 - Develop and Maintain IT Industry Knowledge
				24. PD03 - Develop and Maintain Vertical Industry Knowledge
			2. Experience skills
			3. Professional development/ personal development
2. Develop a personal roadmap and radar (concentric circles)
	1. Core Experience Skills (CFS...)
		1. Proficient
		2. Applied
		3. None (never applied)
	2. Professional Development Skills (EC...)
		1. Proficient
		2. Applied
		3. None
	3. Core Foundational Skills (PD...)
		1. Proficient
		2. Applied
		3. None
3. Chart the core foundational skills in the radar
	1. We can move CFS... from None to Applied and then to Proficient

## Lesson 88 - Becoming a Software Architecture - Part 3 ##
1. Start focusing on technical breadth
	1. Stuff you know (part of technical depth and technical breadth)
	2. Stuff you know you don't know - familiar but cannot use it effectively (part of technical breadth)
	3. Stuff you don't know you don't know - don't know that it even exists that will be perfect for your problem
2. Maintain your technical breadth
3. Knowledge triangle of developer
	1. Stuff you know & stuff you know you don't know - both are close
	2. Stuff you know & stuff you know you don't know grow together - senior developer
		1. Bypassing stuff stuff you know you don't know
4. Junior architect
	1. Increase technical breadth sacrificing technical depth
5. Senior architect
	1. Increase technical breadth even more (much more) and maintain technical depth
		1. There is a big difference between technical depth and technical breadth
6. Balance the triangle
7. Lesson 3 - 20 minute rule
	1. Before checking email
		1. Spend 20 minutes to focus on technical breadth
	2. Resources
		1. ThoughtWorks technology radar
		2. DZone refcardz
			1. To become familiar with unknown
8. Industry knowledge
	1. Business Domain Knowledge
		1. How to gain?
			1. Start asking questions (ask if you don't understand)
				1. Business owner
				2. Analyst
				3. Product owner
			2. Ask before becoming a software architect
	2. After the trade is made - book
	3. Understanding insurance
	4. How the us securities industry works
	5. New science and retailing
	6. Sources:
		1. Amazon
			1. Type "Trading industry", ...
			2. ... Industry
			3. Introductory guides/dummy guides
9. Fundamentals of Software Architecture - Book
10. [https://www.developertoarchitect.com/lessons/](https://www.developertoarchitect.com/lessons/)
11. [https://www.developertoarchitect.com/training/](https://www.developertoarchitect.com/training/)
12. [https://www.developertoarchitect.com/](https://www.developertoarchitect.com/)
	1. Articles
	2. Books
	3. Videos

## Lession 89 - Becoming a Software Architect (Part 4) ##
1. Journey
2. Learn Architecture Sytles and Patterns
	1. It is part of the language of architecture
	2. Architecture styels allow a system to support basic characteristics outside of the application functionality

## Lesson 93 - What is Software Architecture? ##
1. Perspective of software architecture
2. Two parts:
	1. The "structure"
	2. The "process" (creation, maintenance, ...)
3. Structure
	1. Definition:
		1. Definition:
			1. It is the thing holding all of the source code
		2. Dimensions:
			1. Structure - how code is physically organized
				1. Overall structure
				2. An architectural style
					1. Monolith
					2. Microservices
					3. Space based
					4. ...
			2. Architecture characteristics
				1. Ilities: Architecture must support critical for success of the application (derived from business goals, business drivers and business concerns) - qualify what architecture style is suitable
					1. Availability
					2. Scalability
					3. Maintainability
					4. Performance
					5. Reliability
					6. Security
					7. Elasticity
					8. Learnability
					9. Testability
					10. Deployability
					11. Recoverability
					12. Observability
			3. Architecture decisions
				1. Only the business and service layers can access the persistence layer - a decision
					1. Change can be control (presentation does not have to change if database changes)
				2. They form principles and add to structural aspects
			4. Architecture components (building blocks)
				1. Parts:
					1. Main components
					2. Interfaces
					3. Dependencies
				2. What building blocks to be implemented
				3. How the building blocks interrelate (services or components)
				4. Overall structure and decisions that guides development team to implement the architecture

## Lesson 108 - The Role of a Software Architect ##
1. IT Career Energizer with Phil Burgess
2. Role of a software architect
	1. Identify and quantify and qualify architecture characteristics
		1. Ilities - non-functional attributes
		2. Needs close collaboration with business stakeholder (project sponsor or product owner) - to determine business needs and translate them into architectural characteristics
		3. Ensuring they have not changed since last discussion (6 months or 1 year ago)
	2. Select (or validate an existing) architecture style
		1. Validation - do we have the right architecture style in place?
			1. It may have been valid 5 years ago but business and technology changes and environments change (cloud)
			2. Constant validation
	3. Identify and analyze architecture components
		1. Architecture component is a building block of an application
			1. Manifested as a group of source code files within a directory, a namespace or a package structure
		2. The components created an maintained as architects are put together to build the application or service
	4. Identify, understand, and evaluate tradeoffs (very important)
		1. First law: Everything in software architecture is a tradeoff
			1. Identify a tradeoff, analyze and make a good decision
		2. Make architecture decisions and justify those decisions & document the decisions
			1. ADRs - effective way
				1. Document
				2. Justify
				3. Showing consequences of decision
	5. Govern decisions to ensure compliance with the architecture
		1. How?
			1. Automated fitness functions
				1. RQInit
				2. RQInit Net
				3. Net Arc Test
				4. Custom code
			2. To analyse the architecture and ensure that the decisions are being complied
			3. Architecture decisions can be automated + manual checks if required
	6. Lead and guide development teams though the implementation of the architecture
		1. Building soft skills, facilitating, mentoring, and coaching
		2. Lead and guide team through the implementation of the architecture

## Lesson 109 - BASE Transactions and Eventual Consistency ##
1. ACID - Atomicity, Consistency, Isolation, Durability - transactions
	1. We do commits and roll-backs
	2. Guarantee that multiple updates (inserts say) to DB will be kept in sync
	3. Durability - All the updates will be saved
	4. The updates will be isolated (from prying eyes) until I do a commit on all of the information
2. BASE - Basic Availability, Soft state, Eventual Consistency