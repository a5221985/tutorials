## Your First Steps to Software Architect - Introduction ##
### Step 00 - Course Introduction ###
1. APIs, Microservices, frameworks
2. How do I become one?
	1. Course answers
3. Topics
	1. How to think as architect
	2. What is important
	3. What is not
	4. What can we do to become architect
4. No technology, no TOGAF ...
5. Thought process
	1. Solve difficult problems first
	2. Early feedback
	3. Fail fast
	4. Be agile
	5. Avoid over design
	6. Minimize cycle time
	7. Promote re-use
	8. consistency
6. Fundamentals
	1. Technology
	2. Domain knowledge
	3. Soft skills
7. Enterprise standards
	1. Monitoring
	2. Governing
8. Application architect
	1. Take enterprise standards and customise to the app
9. Improve productivity
10. Ensure communication flow
11. Where can I start?
12. FAQs

## Software Architecture Basics ##
### Step 01 - Need for Architecture ###
1. Technologies
	1. Distributed systems
		1. Cloud
		2. Microservice
	2. Device explosion
		1. Mobiles
		2. Tabs
		3. IoT
	3. Enormous scale
		1. Scale of users (load)
	4. Technology evolution
		1. languages
		2. frameworks
		3. tools
		4. processes
2. How to stay relevant today and in future

### Step 02 - Goal of an Architect ###
1. Goal
	1. Technology supports/enables business - need to support business
		1. Business needs must be met
		2. Awesome experience to customer
	2. Business needs
		1. Functional requirements
		2. Non functional requirements
			1. 100000 users support
			2. load time not more than 2 seconds
			3. secure
			4. 99.9999% time availability
		3. Quick feature releases
		4. Early feedback
			1. If something is down
		5. Quick troubleshooting & Support
			1. Customer problems
2. Architect must build a system that meets the above business needs

### Step 03 - Fundamentals of Software Architect - Overview ###
1. Fundamentals
	1. Strong tech capabilities
		1. Technology knowledge
	2. Domain knowledge
		1. Understanding business needs
		2. Future trends in business
	3. Forward looking and agile
		1. pro-active
		2. understand technology of future
		3. Solve current and future business problems
		4. Break down complex problems
	4. Great communication
		1. Be in touch with business team, development team, testing team and operations team (hub of team)
		2. Vision must be communicated
	5. Impeccable credibility

### Step 04 - Fundamentals of Software Architect - Technical Capabilities ###
1. Technical capabilities
	1. Understands big picture
		1. Enterprise
	2. Technology trends
		1. What is happening outside
		2. Which are popular
		3. Which are obsolete
	3. Be hands on
		1. Do poc
		2. Provide solution quickly
	4. Diagnostic skills
		1. Finds solution if development team is stuck
		2. Performance issues
		3. ...
2. Understanding big picture
	1. Must be good at
		1. Languages
		2. Frameworks
		3. Tools
			1. In project
				1. Build tool
				2. Logging
				3. Deployment tool
				4. Monitoring tool
		4. Devices
		5. Cloud
			1. How to incorporate it
		6. Microservices
			1. How to transition to this or if needed
		7. Big Data
			1. What problem does it solve and how to use it
		8. UI
3. Technology trends
	1. 2018 - Spring boot is the leading java framework to develop Micro Services
	2. React has nullified all first mover advantage that AngularJS had
	3. Containers, DevOps, Microservices, BigData & Cloud are the popular buzzwords

### Step 05 - Fundamentals of Software Architect - Domain Knowledge ###
1. Domain knowledge
	1. Undestand business very well
	2. What is happening
	3. What is expected to happen in future
	4. Convey tech decisions to team

### Step 06 - Fundamentals of Software Architect - Soft Skills ###
1. Forward looking and agile
	1. Decision making
		1. What is happening in industry
		2. Implement right solutions
		3. Tech trends and align soution to them
		4. Identify opportunities
	2. Pro-active
		1. Look out for solutions
	3. Agile
		1. Identify risks and handle immediately
			1. Prototypes
			2. reference implementations
2. Communication
	1. Talks to stakeholders
		1. Different people talk to different language
3. Incredible credibility
	1. Team must see you as important

## Software Architecture - Defining Enterprise and Application Standards ##
### Step 07 - Enterprise Standards - Overview ###
1. Two kinds of architects
	1. Enterprise architect
		1. All apps in an enterprise are consistent
		2. Standards are set
	2. Application architect
		1. Take enterprise standards and customize it to meet the needs of a specific application
2. Enterprise standards
	1. Why?
		1. It is for every team member (Dev and QA especially)
		2. For
			1. Team members are transferable if ther is consistency
				1. Easier to maintain
	2. Define
	3. Monitor
	4. Govern

### Step 08 - Enterprise Standards - Important Standards to Start With
1. Big picture:
	1. What languages
	2. Preferred frameworks
		1. For microservices - spring boot
	3. Standards for messaging
		1. Kafka
		2. Messaging
		3. HTTP
		4. M3
		5. REST
	4. Infrastructure aspects must be well defined
	5. Coding standards
	6. Automation testing
		1. How to do API testing
		2. How to automate unit and integration tests
	3. Logging
		1. What to log and not
	2. Security
		1. Kind of security
	4. Performance
	5. NFRs
		1. Availability
		2. Accessibility

### Step 09 - Enterprise Standards - Process ###
1. Process elements
	1. CI
		1. For early feedback
	2. Pair Programming
		1. New team members
	3. Spikes
	4. Vertical-Slice
	5. DevOps
		1. Single team
			1. Dev team
			2. Operations team
	6. Contract First
	7. Code Reviews
		1. Sonar
		2. Manual
	8. TDD
		1. For low level design to be good
		2. Low coupling code
	9. BDD
		1. Entire spec is testable
	10. DOD
2. Modern development practices

### Step 10 - Tip : Don't worry about Terminology ###
1. Developers are of varied range of experiences

### Step 11 - Tip : Thought Process of Successful Architects ###
1. Though process
	1. Promote reuse
		1. Identify parts of code, tools, components that can be re-used across organization
	2. Consistency
		1. Apps across enterprise must be consistent
			1. How they are built
			2. What tools are used
			3. What processes are followed
		2. Innovation is allowed but in limited contexts
	3. Agile & Avoid Over Design
		1. Redundant layers must not exist
		2. Keep design as simple as possible
			1. 4 principles
		3. How to break down into simple chunks
	4. Fail Fast & Early Feedback
		1. Identify risks
			1. Conquor very early
		2. Failing tests
		3. CI
		4. Continuous monitoring in prod
	5. Difficult problems first
		1. Attach most difficult parts first
	6. Minimize cycle time
		1. cycle time: How much time is required to take a small change of code from development to production
			1. Executing tests

### Step 12 - Enterprise Standards - Design ###
1. Design
	1. 4 Principles of Simple Design
	2. OOPS-SOLID
	3. UI-Design
	4. Layering
		1. Common layering approach
			1. 3 or 4
		2. Clear responsibility for each layer
		3. Messaging layer for external system interaction
	5. Common Components
		1. Authentication
		2. Authorization
		3. REST APIs
		4. Similar UI designs
			1. Design standards can be defined
	6. Patterns
	7. Cross Cutting Concerns
		1. Security
		2. Logging
		3. Auditing
2. 4 Principles of simple design
	1. Runs all tests
		1. Completely testable with automated tests
	2. Contains no duplication
		1. Code must be easy to read
	3. Express intent of programmers
	4. Minimize number of classes and methods
3. SOLID principles (OOS)
	1. Single Responsibility Principle
	2. Open Closed Principle
	3. Liskov Substitution Principle
	4. Interface Segregation Principle
	5. Dependency Inversion Principle
4. 4 principles of simple design and SOLID principles are sufficient for good design
	1. Most design patterns can be derived from given problems by applying the above principles

### Step 13 - Enterprise Standards - Tools ###
1. Different tools to be considered
	1. IDE
	2. Build
	3. Deployment
	4. Repository
	5. Version Control
	6. Monitoring
	7. Security
	8. Performance
	9. Code quality
	10. Analytics
	11. API Gateway
	12. API Documentation
	13. Confluence
	14. Reporting
2. Categories
	1. Development tools
		1. Standard IDE
			1. Eclipse
			2. IntelliJ
		2. Build tool
			1. Maven
			2. Gradle
		3. Deployment
			1. Similar across enterprise
		4. Standard repository
		5. Version control tool
			1. Branching
		6. Microservices
			1. API gateways
			2. Naming servers
			3. Dockor/Kubernetes
	2. Testing tools
	3. Operations tools
	4. Misc
		1. NFRs
			1. Automation
				1. Testing
					1. Code capture
					2. Fortify
					3. JMeter
					4. Load runner
				2. Monitoring
		2. Wikis
			1. Confluence
				1. Design
				2. Architecture
				3. Documentation
				4. FAQs

### Step 14 - Enterprise Standards - Example - REST API Standards ###
1. Standards for REST API
	1. Request/Response Structure
	2. URI
	3. Versioning
	4. Security
	5. Caching
	6. Filtering
	7. API Testing
	8. API Gateways
	9. Archetypes
	10. Stateless
	11. Contract First
	12. Documentation
2. YARAS REST API
	1. Yet Another RESTful API Standard (YARAS) - Introduction
		1. Best practices
		2. Different standards that can be set
	2. Requests and Responses
		1. Structure
		2. URI
		3. HTTP Verbs
		4. Headers allowed
		5. Response body
		6. How to pass metadata
		7. How to pass links
		8. What response codes are used
	3. HETEOUS
	4. How to filter, sorting, paging, ...
	5. Versioning
	6. Auditing
		1. Logging
	7. Error handling
		1. Error response
	8. Testability
		1. Mock responses
	9. Implementation recos

### Step 15 - Enterprise Standards - Example - Microservice Standards ###
1. Microservices
	1. Deciding boundaries
		1. Define how to define boundaries
		2. Infrastructure
			1. Which cloud service
			2. Containers, dockor, ...
	2. Messaging
		1. REST
		2. SOAP
		3. JMS
		4. Kafka
		5. RabbitMQ
	3. Monitoring
	4. Deployment
	5. Centralized Logging
	6. Containers
	7. Dynamic-Scaling

### Step 16 - Enterprise Standards - Monitoring and Governance ###
1. Monitoring - standard process of how to monitor
	1. Architecture reviews
	2. Design reviews
	3. Code reviews
		1. What are kinds of things architect is involved
	4. Technical debt
2. Right tools
	1. Sonar
	2. Check marks
	3. Add dynamics
3. Govern
	1. Keep the standards current
		1. Technology evolves
		2. Update standards based on this
	2. Bottom Up
	3. Don't stifle innovation

### Step 17 - Enterprise Standards - Conclusion ###
1. Upto now Enterprise standards and next app standards
	1. Define application standards based on enterprise standards

### Step 18 - Application Standards - Overview, Defining and Monitoring ###
1. Application standards
	1. Customise Enterprise Standards
		1. First design the high level architecture
		2. Define boundaries
		3. Prototyping
			1. Build a vertical slice by taking the most complex use case
		4. Language to use
		5. How many layers
			1. Responsibility of each layer
		6. What frameworks to use
		7. How does application communicate with each layer
			1. Does it expose services?
			2. Does it consume services?
			3. Format of communication
				1. REST/SOAP
				2. MQ
				3. Kafka
				4. Calling web service
		8. NFRs
		9. Code Quality
			1. Usually enterprise level decision
		10. Performance
			1. App specific
		11. Security
			1. How to authenticate
			2. How to authorise
		12. Patterns
		13. Common Components
		14. Re-use
		15. DOD - Definition of Done
			1. When user story is complete (put all definition)
				1. Code coverage
				2. Critical issues acceptable
		16. Take the app through as many levels as possible
		17. Build CI
	2. Monitor and Govern
		1. Most steps in CI
		2. Regular Commits
			1. Must be very often
		3. CI Run Time
			1. Should be very fast
		4. Architecturally Significant Use Cases
			1. Identify important ones
		5. Vertical Slices
		6. Appropriate Usage of Tools/Frameworks
		7. Reviews
		8. Retrospectives
2. Attend retrospectives

### Step 19 - Enabling Productive Teams as an Architect ###
1. Enable your teams - Ensure they adhere to engineering practices
	1. Keep looking for opportunities to improve productivity
		1. Tools
			1. Improve usage (how? new tools)
		2. Languages
			1. Improve usage (how? new languages)
		3. Frameworks
			1. Improve usage (how? new frameworks)
		4. Processes
			1. Improve (how? new processes)
	2. Help teams adhere to best engineering practices
		1. Key questions to ask myself
			1. How often is code comitted?
			2. How often is code released to test/prod?
			3. How much time does it take to make a small code change and take it live?
			4. What is the average time taken to fix a simple bug and take it live?
	3. Ensure communication flow between the teams
		1. Right amount of documentation
			1. Huge docs are not required
			2. Lot of pictures
		2. Appropriate use of diagrams
			1. UML
				1. Component diagram
				2. Deployment diagram
					1. Nodes
					2. App server
					3. Web server
					4. Load balancer
				3. Logical architecture
					1. Layers
					2. Frameworks
			2. Hand drawn are sufficient as well
		3. Communication within and outside the team - in the widest sense
			1. Dev
			2. Test
			3. Operations
			4. Business
			5. Spread & use best practices within the organization
		4. Involved with a group of architects sharing the best practices and setting the standards
			1. Weekly bottom up Meetings
				1. Other architects
				2. Sharing best practices
				3. keep standards up to date

## What Should I Start Doing Now? ##
### Step 20 - Where can I start - First Steps to Architect? ###
1. Make sure you understand every decision made in your project - Database, layers, frameworks, commons components, standards, messaging
	1. What are used?
	2. How many layers are present?
	3. Understand reason behind using them
	4. Why not more layers? Why not less layers?
		1. Talk to architects
2. Make sure you understand all the enterprise standards defined in your organization
3. Understand your business area and trends
	1. What is happening
	2. What is the current functionality
	3. How does it look like like in next few years
		1. Talk to business analyst
4. Follow technology trends - Architecture, tools and frameworks
	1. Thoughtworks tech radar
		1. Publishing - every 3 months
			1. New tools
			2. New frameworks
			3. Techniques
		2. PDF download
			1. Adopt
			2. Trial
			3. Assess
			4. Hold
	2. Stackoverflow developer survey
		1. What developers are saying
			1. Follow them
	3. Google for "Developer surveys"
	4. Join meetup groups in your area
	5. Develop skills in other areas - Front end, database
	6. Attend at least three conferences every year
	7. Attend/Setup architecture/design meetings within your organization
5. Be proactive and take ownership/responsibility
	1. Identify opportunity

### Step 21 - FAQ and References ###
1. FAQs
	1. Architecture vs Design
		1. Any decision that is easy to change is design
			1. Sprint team owns design
		2. Any decision that is difficult to change is architecture
			1. Architect own architecture
			2. Spend time in making this decision
		3. [first-steps-to-software-architect](https://github.com/in28minutes/first-steps-to-software-architect)
			1. References section
				1. Videos
					1. Agile
					2. Evolutionary design
					3. Trends
					4. Design patterns
					5. Code quality
				2. Evolving github
	2. Is architecture needed in agile?
	3. What technology trends are important today?
	4. What are the best practices?

## Conclusion ##
### Bonus Lecture : Coupons for My Best-Selling Courses - 30 Day Money Guarantee ###

### Course Conclusion ###
