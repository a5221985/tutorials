# Domain Driven Design & Microservices for Architects #
## Course Outline ##
### Author Introductions and Course Outline ###
1. Architects:
	1. Software architect makes high-level design choices based on their experience, **knowledge** & **understanding** of software models, standards, tools, and techniques.
2. Knowledge of all aspects of Microservices:
	1. Focusses on business value
		1. Not just technology aspects
	2. Responsible for guiding IT/Business leaders & mentor dev teams
	3. Responsible for delivery of targeted business benefits
	4. Hands on is goot but not required for architect
3. Courses helps in building foundation for DDD & Microservice Architecture
	1. Trains us to guide microservices teams build microservices
4. Part 1: Focusses on business
	1. Domain Driven Design
	2. Apply DDD strategic patterns
		1. Ubiquitous language
		2. Bounded Context
5. Part 2: Focusses on Technology
	3. Apply DDD Tactical patterns (to microservices)
		1. Events Driven Architecture
		2. REST | GraphQL
		3. Data Management
		4. Distributed Transactions
		5. Messaging and Streaming
		6. UML Flows
	2. Helps make appropriate design choices
6. Lessons:
	1. Concepts with examples
	2. Exercise: Apply the concepts
		1. Microservices modeling or design problem
		2. Solution to the problem
	3. Hands on: UML design and implementation (of microservices components)
	4. Quizzes: Part of the lessons
	5. Setup sample code in local machine
		1. Plant UML - modeling tool

### Development Tools and Setup ###
1. Dev Environment Setup:
	1. IntelliJ IDE
	2. Project repo and branches
	3. UML diagram with PlantUML
2. IntelliJ Community Edition but other IDEs are fine too:
	1. Download and install
	2. Get from version control option
		1. https://gethub.com/acloudfan/MSFA-ACME_Sales-v1.0.git
		2. https://gethub.com/acloudfan/MSFA-ACME_Products-v1.0.git
3. Code is organized in multiple branches
4. Switch to appropriate branch as instructed
5. UML available under the directory /uml
6. To checkout branches:
	1. View > Tool Windows > Git
	2. Select another branch > Right Click > Checkout
		1. Downloads and builds
7. https://plantuml.com
	1. Used to draw UML diag
	, using a human readable text description
	2. It is a drawing tool NOT a modelling tool as it does not enforce any modeling contraint
	3. Extension for UML
		1. File > Settings... > Plugins
			1. Search plantuml
		2. Click on Installed
			1. PlantUML integration
	4. Select file under /uml
	5. plantuml.com - documentation
	6. New diagram:
		1. Right click on /uml
		2. PlantUML File
		3. Sequence
		4. test-sequence.puml
	7. If diagram is not showing: Install Graphviz library
		1. https://plantuml.com/graphviz-dot
8. Gradle for dependencies
	1. Build automation tool
		1. `build.gradle` - gradle.org

## Microservice Architecture ##
### Microservices Architecture ###
1. Topics:
	1. Monolithic Architecture
	2. Microservices Architecture
	3. Realization of MSA
2. A Traditional way of building applications
	1. Modular: A well designed monolithic application consists of well defined modules
		1. Using huge code bases
		2. A common programming language is used for all components
	2. There is tight coupling between components
	3. Teams organized by technology & business
		1. A few smaller teams
			1. DB specialists
			2. BAs
			3. Infrastructure team
			4. ...
		2. Changes require coordination between all the teams involved
	4. Generally spans across multiple business functions
		1. Banking app may support multiple banking products as part of the same application
3. Microservices Architecture
	1. It arranges an application as a collection of loosely coupled services. In a microservices architecture, services are fine grained, and the protocols are light weight - Wikipedia
	2. A service in a MSA is referred to as a Microservice
		1. Self contained units built to realize a specific business capability
			1. Retail: Orders, Shipping, Marketing
			2. Bank: Retail accounts, credit cards, loans
	3. Business capability & Microservices:
		1. May be realized by one or more microservice
			1. Prduct manufacturer + partner network:
				1. Independent channels:
					1. Customer Order Service
					2. Partner Order Service
4. Microservice Contracts
	1. All interactions are via well-defined contracts
		1. Shipping service: Exposes interface called - Ship Order(order details)
			1. Invokes Update Status(delivery details) interface
		2. Orders service: Exposes interface called - Update Status (delivery details)
			1. Invokes Ship Order(order details) interface
	2. Other microservices are well aware of the contracts
5. MSA Realization
	1. Demarcate Business Capability Boundaries
		1. Each microservice realizes a specific business capability
	2. Each business capability is mapped to one or more microservices
		1. Domain Driven Design - helps us identify the business capability boundaries (Bounded Contexts)
	3. Each microservice is assigned to a small IT team
		1. The team is responsible for building and operating the microservice
		2. Each team defines contract between microservices by coordinating with other teams
		3. The team works with Domain experts to develop domain model
		4. Technical design and development of the microservice
			1. Team makes technical desicions
				1. Strategic DDD patterns - Used for developing the domain model
				2. Tactical DDD patterns - Used for building the microservices
6. Business Benefit of MSA?
	1. It helps business change at a faster pace
		1. Why?

### Business & Digital Transformation ###
1. Business & Digital Transformation
	1. Business transformation is an umbrella term that is used for referring to fundamental changes in how an organization conducts its business
		1. Microsoft: Packaged Software to Subscription model (charging monthly and yearly)
		2. Amazon: Online Bookstore to Marketplace (other vendors can also sell products)
		3. Apple: Computers to iPod, iPhones, iPad, Music Store, ...
2. Why do businesses need to transform?
	1. Reasons:
		1. Environmental changes e.g. new regulations (GDPR)
		2. Competitive pressure e.g. rapid rollout of new products
			1. Transformation is the choice
		3. New opportunities e.g. innovative technology (internet in 90s say)
		4. Customer demands e.g. expects immediate response
			1. Otherwise they might lose to their competitors
	2. Digital transformation:
		1. Digital transformation is the process of using digital technologies to
			1. Meet the needs of transformed business processes
			2. Construct innovative customer engagement mechanisms
		2. Digital transformation supports the business transformation initiatives
			1. Target: Integrated supply chain inventories across (partner) network (stores and warehouses)
				1. 2011 - Invested in digital technologies
					1. Customers could place orders online
					2. Pickup merchandize at store within few minutes
		3. Capital One: Physcial bank to a digital bank
			1. Depend on AWS cloud for different technology needs
				1. For ever changing operating model
		4. Amazon.com: Heavy use of AI/ML, API, Analytics, etc
			1. Helps change business model at a very rapid pace
				1. Helps construct new products in a short period of time
	3. What happens to business that do not transform?
		1. Fail to survive:
			1. 1997 - started a in-mail-DVD subscription model
			2. 2007 - Started streaming service using digital
			3. Blockbuster: Failed to transform its business in time, to counter the threat posed by Netflix & newer digital technologies
				1. 2021 - closed down
	4. Continuous transformation
		1. Transformation is not a one-time initiative:
			1. Business need to change on a continous basis
			2. Rapid changes are needed in systems and applications
			3. Organizations need to keep up pace with new and evolving technologies
	5. Example: Continuous Transformation
		1. Continuous change + Adoption of digital technologies
			1. Amazon Prime
			2. Amazon Web
			3. Services
			4. Alexa
			5. Amazon Drive
			6. Echo
			7. Kindle
			8. Fire tablets
			9. Fire TV
			10. Video
			11. Kindle Store
			12. Music
			13. Music unlimited
			14. Amazon digital game
			15. Store
			16. Amazon studios
			17. AmazonWireless
	6. Transformation and software
		1. Old ways of building software hinders transformation!!
			1. Changes are slow - using older techs and architecture paradigms
			2. Hard to integrate with newer digital technologies
		2. Microservices architectue addresses these challenges!!!
			1. Helps organizations move at a faster pace to achieve transformation at a faster pace
3. How does MSA enable Transformation?
	1. Change isolated to a set of microservices!!
		1. Bank:
			1. Retail accounts - business functionality for checking account and saving account
			2. Credit cards
				1. If this business strategy needs to be transformed
					1. Transformation of credit cards requires changes only in this MS
						1. Pace is much faster to make changes and release (in monolith, the modules are interdependent and hard to make changes faster and release)
			3. Loans & mortgage
4. Summary:
	1. Organizations need to continously transform
		1. Rapid changes to IT systems
		2. Rapid adoption of new digital technologies
		3. Speed to market is the key
	2. Microservices architecture enables transformation

### A Business Perspective of Microservices ###
1. Business benefits of adopting microservices architecture
	1. Microservices teams
		1. How teams are organized for building microservices
	2. Business capabilities and microservices
		1. Relationship between business capabilities and microservices
	3. Business benefits of MSA
2. Microservice Ownership
	1. Each service is built & operated by a small team
		1. Teams are cross functional & supported by domain expert
			1. Different skills exist in a team
	2. Team size: ~8
		1. We try to construct teams that are no longer than can be fed by two pizzas; we call that the two-pizza team rule
		2. Idea: Better collaboration among smaller teams:
			1. Frequent software releases
			2. Faster response to changes in business
			3. Technology becomes a competitive edge (for organization)
3. Why are MS organized around business capabilities?
	1. My thoughts:
		1. Each capability can be changed independently
		2. Capabilities can be changed at different pace
		3. Certain capabilities may become obsolete or get replaced by other new capabilities without affecting the other capabilities
	2. Trainer's thoughts:
		1. Each service can evolve independently
			1. Bank:
				1. Retail Accounts
				2. Credit Cards
				3. Loans & Mortage - a change is required here
					1. Monolithic application needs coordination among the teams
						1. This slows down the process of making changes
						2. Bank will be slow to release new products in the market
					2. Microservices
						1. Changes can be performed in each of the services independently
							1. Faster response to changes in business!!
		2. Services are easily replaceable
			1. Loans and Mortage can be replaced with newer transformed business operating model
				1. Caveat: No impact on other servides if contracts are not changing
	3. Makes it easier for IT teams to understand the business
		1. Team dealing with Retail Accounts need to know in detail about retail accounts and they don't need to know about Credit Cards much
			1. IT teams don't need to dive deep into ALL business capabilities!!!
				1. The team can focus on the microservice that they are building
	4. HIGHER Alignemnt with business priorities
		1. If retail account business is not undergoing frequent changes, team might decide to release every two weeks
		2. If loan and mortgage business is undergoing some serious transformation, then the team might decide to release every day
			1. Not time spent on managing conflicting business priorities
				1. Faster speed to value for the business
4. Microservice Architecture
	1. Key to rapid transformation => faster speed to market
		1. Support from IT team is required
	2. Microservices Architecture is an enabler / Catalyst for continous business transformation
		1. It helps move the IT teams at the same speed as the business!!
5. Critical Success Factor:
	1. Carving out the business scope of Microservices (to get the most benefit)
		1. If NOT done correctly
			1. Teams will be inter-dependent
			2. Loss of advantage of MSA
		2. This is where Domain Driven Design comes into picture!!!
6. Summary:
	1. Small teams => Faster speed to market
	2. Microservices are organized around business capabilities
		1. Enables IT teams to operate independently
		2. Must carve out appropriate business scope to stay independent

### A Tactical Perspective of Microservices ###
1. Topics:
	1. What is a microservice architecture?
	2. Pros of MSA
	3. Cons of MSA
2. Microservices Architecture
	1. Loosely coupled set of services - for building applications
		1. Services interact with each other over a network (using light weight protocols)
			1. HTTP
		2. Light weight protocol - HTTP
		3. Independent codebases | deployements
			1. They can be independently deployed
		4. Decentralized governance
			1. Teams can make their own decisions on works best for services they own
		5. Well defined business scope
3. Loose Coupling:
	1. Least amount of dependency between services
		1. ONLY external interfaces are known to consumer services
			1. Not internal implementation
	2. Interactions are over the network
		1. No code level dependencies
4. Service Interactions
	1. Services expose interfaces as API/HTTP
		1. APIs are implemented as:
			1. RESTful services
			2. GraphQL APIs
		2. Made available via HTTP protocol
	2. Messaging is commonly used
		1. Request/Reply pattern
			1. RabbitMQ
			2. ActiveMQ
		2. Publish/Subscribe pattern
			1. Kafka
5. Advantages of Microservice Architecture:
	1. Pros of MSA:
		1. Changes are easier to manage
			1. No impact on other services
			2. No | Minimal coordination with other teams
			3. Regression testing needed ONLY for changed service
				1. Other microservices need not be tested
		2. Deployments are Independent
			1. Each team controls the frequency of deployments
				1. Depending on requirements and other constraints
			2. Higher productivity & Faster delivery
6. Polyglot microservices
	1. Each team may decide on tech stack
		1. Orders: node
		2. Shipping: spring framework
			1. Some experts urge caution against using too many languages
				1. May lead to challenges
7. Failure Isolation
	1. Failure in one service will not bring down entire system
		1. Common scenario in monolith: If one component fails, it might bring down the entire system
		2. Orders: continues to process orders and publishes to messaging broker
		3. If shipping service is down, the message is still persisted and when it is back up, it will be able to process the message
8. Service Scalability
	1. Each service can scale independently
		1. Black Friday: Heavy load on orders
			1. Additional instances of Orders microservice may be created for extra load
			2. Shipping microservice doesn't have to be scaled
9. Disadvantages of Microservice Architecture
	1. Poor performance due to network overheads
		1. Compared to monolithic application
	2. Complexity in managing data integrity
		1. Each service manages its own database
			1. Monolithic - common database - local transactions can be used for data integrity
			2. Traditional Tx mechanisms don't work
				1. Leading to higher complexity
	3. Harder to monitor | debug
		1. Independent processes need to be monitored
			1. Challenging to monitor and debug 100s of microservices
	4. Security threat
		1. Each service exposes interfaces (API)
			1. Expanded attach surface
10. Cons of MSA:
	1. Requires investment in new technologies (to address some of the disadvantages) - upfront investments
		1. Infrastructure
		2. Tools
		3. Skills development
11. Pros:
	1. Change management - becomes easier + Deployments - can be carried out independently
		1. Features can be released much faster
			2. Speed to market
	4. Failure isolation + Service Scalability (independent scaling)
		1. Better quality - experienced by consumers
12. Cons:
	1. Poor n/w performance
	2. Monitoring is a challenge
	3. Data management
	4. Security management

### Adoption of Microservices Architecture ###
1. Topics:
	1. What is needed for MSA?
		1. What organization needs
	2. Building a business case
		1. How a technologist can put a business case for gaining support for adoption of microservices in their organization
	3. Brownfield Vs. Greenfield MS projects
2. Adoption of MSA:
	1. Acquire resources with new IT skills
	2. Invest in technology e.g., cloud, containers, other tools for building and operating microservices
	3. Change in processes e.g. DevOps
		1. Newer ways to manage IT resources
	4. Change in culture e.g. Faster decisions
		1. Cannot happen overnight
3. Successful adoption of microservices requires:
	1. Commitment from Business & IT leaders
4. Role of an Architect
	1. Guide & Educate the Business & IT teams
		1. In terms of cost and benefits of adoption of microservices architecture
	2. Architect must spend time in building a business case for MSA adoption for your specific organization
		1. It is easier for architect to get support from IT and business leaders - if there are business benefits of adoption of microservices
5. Think Business
	1. Think of Business impact not technology
		1. Customer experience - Is it going to improve customer experience at a rapid pace
		2. New revenue streams
		3. Lowered costs - of IT operations
		4. Competitive advantage
		5. Customer loyalty
		6. Leverage opportunity
	2. Specific business impact depends on the organization
		1. As an architect I must understand organization's business to map benefits of microservices architecture to the organization
6. Messaging Examples:
	1. Technical vs Business Benefits
		1. Architect who focuses on technology side would describe benefit as follows: "With microservices architecture we can release our software every 6 weeks rather than every 3 months like we do today"
		2. Architect who focuses on business would describe benefit as follows: "IT can help business cut down the product development process to 6 weeks which is ~50% faster than our competitor!!"
			1. This appeals more to the business stakeholders
	2. Anothe example:
		1. "Our monolith apps are difficult to change hence, adopting new digital technologies has been slow. We need to invest in MSA technologies to be able to move faster"
		2. "Adoption of new digital technologies can help the business achieve the goals of increasing the Lifetime Value of our customer as MSA provides a foundation for faster adoption of these new digital technologies"
			1. Focus should be to resonate with Business and IT leaders showing business benefit rather than just the technical benefits
7. Business Case
	1. Doesn't have to be a 50 pages long formal document
		1. 5 to 7 slides are fine (to convey the right message)
	2. Clearly layout the Business Value (quantify)
		1. Clear messaging
			1. Give numbers
	3. Have a roadmap
		1. How do you expect the organization to adopt the microservice
			1. Indicate time to value - 3 months or 18 months to get there
	4. Describe what you need to be successful
		1. You want to get commitment from IT and business leadership
			1. They must understand what they are getting into
		2. Do a PoC to prove the value
			1. Demonstrate the value with something live is useful
8. Use your own template if the above is not appropriate for the business
9. Microservices projects:
	1. There are two types of microservices projects
		1. Brownfield - refactor the existing monolithic app
			1. Monolith to MSA:
				1. Dealing with legacy technologies & IT debt
			2. Refactor: Convert application to MSA
				1. Big bang approach - All microservices are built in parallel
				2. Incremental | Evolutionary approach - Pealing off parts of existing monolith and build microservices
			3. Replace - Build a new app ground up
		2. Greenfield - new application to be built ground up
			1. Option to build MSA
				1. Ground up - Build microservices from the get go
					1. Considerations: Availability of technology & tools
					2. Organization's readiness e.g., DevOps practices, processes
						1. This is for teams experienced with microservices and working with organizations that have adoped it
				2. Monolith first - Build a well-designed monolith app
					1. Gain some experience building the application
					2. After some experience peel off parts to construct MS
						1. More: https://martinfowler.com/bliki/MonolithFirst.html
10. Quick Review:
	1. Specific Business benefit to your organization
	2. Microservices Project
		1. Browfield
			1. Refactor monolith
			2. Replace monolith
		2. Greenfield
			1. Ground up
			2. Monolith first

## Introduction to Domain Driven Design ##
### Domain, Sub-Domain and Domain Experts ###
1. Understanding the domain
	1. What is a domain?
	2. Domain experts?
		1. Role of a domain expert
	3. Intro to ACME travels
2. English language definition of Domain
	1. A sphere of knowledge, influence, or activity
		1. Examples:
			1. Chemistry
			2. Biology
			3. Engineering
			4. Computer Science
			5. Economics
			6. ...
	2. Business perspective of Domain
		1. A field | industry in which the business operate
			1. Banking: Chase, Bank of America
			2. Oil & Gas: Shell, BP
			3. Retail: Walmart, Flipkart
			4. ...
3. Software perspective of Domain
	1. Represents the problem space
		1. eCommerce
			1. Amazon.com
		2. Social Media
			1. Twitter
		3. Media Streaming
			1. Netflix
		4. Resource Planning
			1. SAP
4. Sub-Domains
	1. Each domain consists of Sub-Domains
		1. Banking
			1. Loans Accounts
			2. Retail Accounts
			3. Merchant Accounts
			4. ...
	2. Each sub-domain has:
		1. Different rules & regulations
		2. Different types of products
		3. Different types of customers (via products)
5. Domain Experts:
	1. Aka subject matter experts or SME
	2. No one expert knows everything about the domain!!! (for large and complex domains)
		1. Solution: Multiple domain experts aligned with sub-domains
			1. Example: Banking
				1. Retail accounts expert
				2. Merchant accounts expert
				3. Loans accounts expert
				4. Compliance & Regulatory expert (for each account types)
6. ACME Travel
	1. Travel & Leisure Industry
		1. Travel advisor
			1. They know the needs and wants of the customers
			2. They use their knowledge to influence the decisions of customers
			3. Activities:
				1. Plan customer's vacations
				2. Ensure that planned vacation is within customer's budget
				3. Ensure that customer gets best possible experience on their vacation
	2. Sub-Domains and Experts:
		1. Travel Advisor
		2. Partner Contracts expert
			1. Knows how to manage contracts with other entities in the travel industry
				1. Airlines
				2. Cruise ships
				3. Hotels
		3. Accounts expert
		4. Customer support expert
7. Quick Exercise:
	1. What domain are you in?
		1. Automotive
	2. Subdomains within that domain?
		1. Electric Car
		2. Autonomous Vehicle
		3. E-Enabled Vehicles
	3. List out the domain experts you work with?
		1. 
8. Quick Review:
	1. Domain = A sphere of knowledge, influence, or activity
	2. Made up of Multiple sub-domains
	3. Multiple domain experts needed to support business functions

### Conceptual Models, Architecture and Design ###
1. Architecture and Design
	1. Conceptual models
	2. Architectural models
	3. Architecture vs. Design
2. Conceptual Models
	1. A representation of a system made from composition of **concepts**
		1. Focus is not on the physical parameters of the system
	2. Example:
		1. Critical concepts for a car:
			1. Engine
			2. Power Electronics
			3. Electric Motor
			4. Radiator
			5. Engine
			6. Lighweighting Materials
			7. Ruel Storage
			8. Charger
			9. Battery
		2. Some physical parameters
			1. 208 HP
			2. 14 Gallon tank
			3. 70 kWH battery
	3. The info in this model is not sufficient for Engineers to build the car
	4. Why conceptual model?
		1. Objective of conceptual models
			1. Enhance understanding of the designers (to think through and find flaws and opportunities for improvement)
				1. Good conceptual model leads to better product
			2. Conveying ideas to stakeholders
				1. To go to investors and show them say (easy to explain the conceptual model)
			3. Provide a point of reference to construct detailed specifications
				1. Model can contain certain aspects of physical parameters of the end product
				2. Example: Electrical engineer can use the conceptual model and certain physical parameters to come up with a detailed design for electric motor
				3. Example: Mechanical engineer can use the info to come up with a detailed design for the gas engine
			4. Documentation for future reference
	5. Software: Conceptual Models
		1. Common terminology for the domain concepts
			1. Core concepts to put together
		2. Identify different parts of the system
			1. Example: Banking with following terms clearly documented
				1. Account
				2. Transaction
				3. Ledger
		3. Relationships between the concepts (domain concepts)
		4. Critical | Foundational parameters are defined (for concepts and relationships)
			1. Example: Banking
				1. Relationships between Account, Transactions, Ledger
		5. Architectural Model (using info obtained previously)
			1. Visualization of the system represented by the model
3. Architectural Model
	1. It is the structured representation of a solution that meets the requirements in the problem space
		1. High level abstraction of parts of the end solution
		2. Presents a view of how the requirements will be met
		3. Assist in answering the questions posed by different stakeholders
4. Architecture vs. Design
	1. Difference is in the level of details & focus
		1. Architecture = High Level | Skeleton | Long term focus
			1. Concepts depicted in architecture may not change very frequently (may not change at all)
		2. Design = Relatively detailed | Focus on implementation
	2. Example: Architecture & Design for a Rideshare System
		1. Users: Drivers & Customers - Mobile Phones (for requesting and accepting rides)
		2. Ride request processor - receives requests from drivers and customers
			1. 5k rides/hour
		3. Exposed via API layer
			1. 500 calls/sec
		4. Location streams (drivers and users are tracked using this system)
			1. 10k messages/sec
			2. They contain locations of drivers and customers
		5. Streams are consumed using Drvier Customer Tracker
			1. The component must handle - 100k Activer users
		6. Ride Request Processor tracks all data in multiple databases:
			1. Ride Data
			2. Customer Data & Driver Data
			3. Payment Transactions
				1. Size of above data increase by 2TB/year
		7. Other services used:
			1. Notification system
			2. Geo Spatial Services
	3. Quick Exercise:
		1. Think about the design (using the above architecture)
			1. Design (focusing on implementation)
				1. We need to decide the technology used for implementation of each of the boxes
				2. Technology must meet all requirements of the system
		2. My Design
			1. Mobile Phone App
				1. Wireframe models
				2. UX Design
				3. UI Design
					1. UI components (in React Native)
			2. Location Streams:
				1. Design: Event-Driven async messages
					1. Pub-Sub model
			3. Driver Customer Tracker:
				1. Design: Subscriber to message broker
			4. Ride Request Processor:
				1. Design: LLD using OOD
			5. Notification System
				1. Push notifications
				2. SMS
			6. Geo Spatial Services
				1. Design: Synch (REST) client to GPS
			7. Database
				1. Design: 
					1. Ride Data: Cache
					2. Customer Data & Driver Data: NoSQL
					3. Payment Transactions: SQL (ACID)
		3. Instructor's design: (with some implementation details)
			1. Drivers & Customers - Mobile Phones - Android, iOS
			2. Location Streams - Kafka (high message rate)
			3. API Layer - Apigee
			4. Driver Customer Tracker - MongoDB & NodeJS
			5. Ride Request Processor - Java/Spring
			6. Database:
				1. Ride Data - MongoDB
				2. Customer Data & Driver Data - MongoDB
				3. Payment Transactions - MySQL
			7. Notification system - Twillio
			8. Geo Spatial Services - Google Maps API
		4. Design:
			1. Designer can carry out design of each of the key components
5. Quick Review:
	1. Conceptual Model = A set of concepts & their relationships
	2. Architectural Model - A structured representation of a solution (that meets requirements of problem space - no implementation details)
	3. Design - A structured representation of a solution that is close to the implementation

### Modeling Techniques & Architectural Styles ###
1. Common Modeling techniques and architectural styles
	1. Modelling techniques
	2. Architectural styles
	3. Intro to DDD
2. Model Diagrams
	1. Multiple ways of modelling
		1. Guiding principles:
			1. Purpose (& who are the audience, ...)
			2. Perspective | Viewpoint (of audience)
				1. Think about the audience's interests and concerns
					1. Will the model that I am constructing address their concerns and answer their questions?
			3. Level of Details
				1. How detailed should my model be so that it provides most value to the target audience
	2. Techniques:
		1. 4+1 Architectural View Model
			1. Describes architecture from viewpoints of multiple stakeholders
			2. Model:
				1. Scenarios (Requirements/Use-Cases)
					1. In the centre
					2. These are used as guide for constructing multiple views
					3. Also used for validating the architecture
				2. Logical View (Object Oriented Decomposition)
					1. Focuses on the functionality or capabilities exposed by the system to end-user
				3. Process View (Workflow, Interactions)
					1. Explains processes in the system and how the processes interact with each other
				4. Development View (Modules, Sub systems)
					1. Illustrates the system from a **programmer's perspective**
					2. It is concerned with software management
					3. Also known as **Implementation view**
				5. Physical View (Servers, Database Design)
					1. Depicts system from point of view of the Engineers
					2. It is concerned with the topology of the **software components** on the **physical layer** & **physical connections between the components**
			3. Stakeholder Interests or Concerns
				1. Large Software project can involve 10s or 100s of stakeholders
				2. They have different interests and concerns
					1. **Executives** - intersted in understanding the value the system will provide to the end user & how that **end user value** will translate to the **value for the business**
						1. Interested in **Logical View**
					2. **Business Experts** - They understand the business
						1. They want the system to implement the **right set of processes** (the processes must be accurate as well)
						2. Interested in **Process View**
					3. **Developers** - Concerned with the implementation of the system
						1. Concerned with **deployment** and **management** of the software
						2. Interested in **Development View**
					4. **Network Engineers** - Interested in knowing how the physical components (Servers, DBs, ...) that host the applications or components will talk to each other over the **network**
					5. **Architect** - Responsible for construction all the above views
						1. Ensures that each of the views provides **most value** to the interested stakeholders
					6. **Other Stakeholders** - play different roles
		2. UML
			1. http://www.omg.org/uml
			2. Provides
				1. Standard set of diagrams (for architectural modeling)
					1. Diagrams have a standard set of notations
			3. 14 standard diagrams
				1. The diagrams can be used for constructing various views
					1. Scenarios:
						1. Use Case Diagram
					2. Logical View:
						1. State Diagram
						2. Class Diagram
					3. Process View:
						1. Sequence Diagram
						2. Activity Diagram
					4. Development View:
						1. Component Diagram
						2. Package Diagram
					5. Physical View:
						1. Deployment Diagram
4. Bridge Architecture Styles:
	1. Examples:
		1. Beam bridge
		2. Arch bridge
		3. Truss bridge
		4. Suspension bridge
		5. Cantilever bridge
		6. Cable-Stayed bridge
	2. A bridge design follows a set of common principles
	3. Architectural styles
		1. Depending on the needs, requirements, conditions, a bridge designer can model the bridge using one of the architecture styles
5. Software Architecture Styles
	1. Architecture style: A reusable architectural pattern which may be used as a solution to a commonly occurring problem
	2. Architectural Styles:
		1. Categorized based on the key focus area
			1. Focus: Communication (between components)
				1. Service Oriented Architecture (SOA)
				2. Message Bus Architecture
			2. Focus: Structure
				1. Layered architectures
				2. Object Oriented Architecture & Design
			3. Focus: Deployment (of various components that make up the system)
				1. Client Servers
				2. 3 Tier Architecture
			4. Focus: Data (core data in the business domain)
				1. Database Centric Design
				2. Data Flow Diagrams
			5. Focus: Domain (on business domain rather than technology)
				1. Domain Driven Design
5. Exercise: List out the stakeholders in your organization
	1. Which views will be most appropriate for them
		1. POs
			1. Logical View
			2. Process View
		2. Development Team (Developers, QA)
			1. Development View
		3. DevOps Team
			1. Physical View
		4. Internal Users
			1. Scenarios
6. Review:
	1. Architects construct models using different modeling techniques
		1. 4+1 architectural view model
		2. UML
	2. There are multiple architectural styles
		1. Each of the styles follow a set of architectural principles
		2. Focus on certain aspects of system
			1. Based on needs and needs and preferences
		3. DDD - architectural style
			1. Focus is on business domain

### Domain Models ###
1. Domain Models
	1. Domain Model
	2. Elements of a domain model
2. Why do businesses invest in software?
	1. My answers:
		1. Better customer experience
		2. Help business get insights to improve customer experience (through analytics)
	2. Instructor's answers:
		1. To fulfill some need(s) of the business | enterprise
			1. Needs:
				1. Reduce manual labor (automation; Machine Learning)
				2. Increase Efficiency (Workflow Engines; Tools (Productivity tools))
				3. Competitive Edge (Customer Loyalty; Business Intelligence)
	3. What is the real reasons for those needs?
		1. Reduce manual labor:
			1. Reduce size of the workforce to save money (payroll expenses) (a business problem)
		2. Increase efficiency
			1. Customer complaints about long response times (a business problem)
		3. Competitive Edge
			1. Competitors are pulling away customers (a business problem)
3. Business Problems:
	1. Current or long-term challenges & issues faced by the business that may prevent the business from achieving its goals
		1. To understand the problem, architects MUST understand the **domain first**
			1. For this purpose, architects construct **domain models**
				1. Domain model: **Organized and structured knowledge** of the domain that is relevant for solving a business problem
4. Domain Model
	1. Parts:
		1. Key concepts - foundational concepts related to the domain
			1. Example: Banking
				1. Calculation of fee
		2. Domain vocabulary - Common terms and definitions used by the stakeholders when they are discussing the problem space within that domain
			1. Example: Banking
				1. Transaction (+ meaning)
				2. Credit (+ meaning)
				3. Txn Posting (+ meaning)
				4. ...
			2. This **ensures** that **all stakeholders** have common understanding of **all the terms** used in the **domain**
			3. Domain Entities: Domain objects that have a unique identity
				1. Attributes in a domain object may change over the lifetime of the object but the id is maintained
					1. Example:
						1. Saving Account
						2. Checking Account
						3. Transaction (has Tx id)
			4. Relationship between Entities
				1. Real world has domain entities having relationship with other domain entities
					1. Example:
						1. Account entity Has Transaction entities (one to many)
			5. Workflows & Activities
				1. Businesses use **defined processes** for carrying out **operations**
					1. The processes are documented within domain model as workflows & activities
				2. Example:
					1. Open Saving Account (process)
					2. Loan Approval Process (process)
	2. A domain model captures structured knowledge for solving a business problem
		1. It may contain additional knowledge (not just components discussed)
			1. Visual diagrams
			2. Textual documentation
		2. We can choose what goes into the model to make it effective
5. Tools for constructing Domain Models
	1. Visualation (any tool can be used)
		1. UML
	2. Textual documentation
		1. Word Docs
		2. Wikis
6. Stakeholders can choose the tools that work the best for them
7. Review:
	1. Domain Model = Structured Knowledge
		1. Purpose = solution for a business problem (within the domain)
		2. Elements:
			1. Domain vocabulary
			2. Domain entities
			3. Relationship between entities
			4. Key concepts
			5. Workflows & Activities

### Modeling Techniques & Architectural Styles ###
1. Enterprise Domain Models
	1. Also known as "Aggregate"/"Unified" Domain Model
	2. Topics:
		1. Knowledge crunching
		2. Enterprise Domain Models
		3. What challeges does DDD address?
2. Who in your Organization REALLY understands your org's business processes?
	1. Marketing & Sales
	2. Executives (CEO, Presidents, VPs)
3. Domain Experts
	1. Complex Domains - No one expert knows everything about the domain
		1. Banking
			1. Retail Accounts Expert
			2. Merchant Accounts Expert
				1. Merchant account services
			3. Loans Accounts Expert
			4. Compliance & Regulatory Expert
		2. ACME Travel
			1. Travel Advisor
			2. Partner Contracts
			3. Accounts
			4. Customer Support
	2. To get domain knowledge, the teams must work with domain experts
		1. Usually not documented but is in the heads of experts
4. **Knowledge Crunching**
	1. **Teams process the knowledge received from the Domain Experts into domain models**
	2. This process is referred to as **Knowledge Crunching**
	3. Typically headed by the technology team who work very closely with experts to construct structured domain knowledge
	4. Led by an experience technologist
		1. IT Lead - e.g. Architect, Lead Developer, ...
			1. SHould have some prior experience with domain modeling exercise
				1. Doesn't have to be expert in certain technologies
				2. They need to have a breadth of knowledge in multiple technologies
				3. They must be open to learn business related topics
		2. Team members
			1. Developers, Analyst ...
5. **Enterprise Models**
	1. Knowledge was gathered from multiple experts to construct an enterprise domain model
		1. It captured all of the knowledge from across the enterprise in one set of models
			1. Idea is that the models would be used by developement teams to build well documented systems
	2. Also known as Unified Models or Aggregate Models
6. **Software Development**
	1. Software Development Team
		1. Focuses on specific areas in enterprise domain model
		2. Carry out technical design, code and build the product
7. Challenges with Enterprise Domain Models
	1. Inherent complexity due to scope and size
		1. Multiple experts need to be engaged
	2. Hard to keep the models up to date as there is no single owner
		1. Falls on IT team to manage the model and software products
			1. Due to product delivery priorities, model falls behind the actual implementation and loses its value
	3. Linguistic challenges e.g. conflicting meaning of terms
		1. When merging multiple domains into one model
		2. Same business term may have different meanings in sub-domains
		3. This can cause confusion to the software development team and domain experts
	4. These challenges are applicable to any complex domains
8. Addressing the Challenges
	1. Domain Driven Design approach provides principles and patterns to address the challenges faced with developing complex domain models
10. Review:
	1. Knowledge Crunching = Constructing the Domain Model (from knowledge gathered from domain experts)
	2. Multiple challenges with constructing models for complex domains
	3. DDD addresses these challenges

## Understanding the Business Domain ##
### Why Understand the Business? ###
1. Understanding the Business
	1. Every business today is a technology business; for some business, technology is the core model and for others technology supports the business model
2. Examples: Uber, AWS
	1. Technology is core business
	2. CapitalOne, Dominos (legacy businesses)
		1. Technology supports core business model
3. Goal of the IT teams is to help the business achieve the business goals, hence **IT teams MUST understand the business model**
	1. Advantages:
		1. Deliver higher & faster value to the business
		2. Active participation in the business decisions
		3. Align the IT objectives with business objectives
4. Outcome:
	1. IT becomes a trusted partner of business rather than just a service provider (more value to business and customers of business)
5. Architects | Developers
	1. Who understand the business earns the trust of the business and their peers
		1. **Spend time on understanding the business**
6. Domain Driven Design
	1. Requires that the technologist MUST understand the domain!!!
	2. **Business Model Canvas** is a technique that helps with understanding the business | domain
7. Section Objectives
	1. Business Model Canvas
	2. Understand ACME Travel's business model

### Introduction to Business Model Canvas ###
1. Business Model Canvas
	1. What is a business model canvas?
	2. 9 building blocks
	3. Uber's business model canvas
2. Business model canvas:
	1. Business model canvas is a tool that helps **discuss, communicate, design and understand** the organization's business model
	2. Benefit?
		1. Entire business model [depicted] in One image
3. Creation of the canvas:
	1. 9 basic building blocks organized in the form of a canvas
		1. Key Partners
		2. Key Activites
		3. Value Proposition
		4. Customer Relationships
		5. Customer Segments
		6. Key Resources
		7. Channels
		8. Cost Structure
		9. Revenue Streams
	2. Uber - case study
	3. Google - search business model canvas
		1. Deeper dive
			1. Wikipedia
	4. Uber:
		1. Customer Segments
			1. Who are the customers?
				1. Customers
					1. Individuals
					2. Businesses
				2. Drivers
		2. Value Proposition
			1. What value are you giving to your customers?
				1. Customers: Ride is a tap away!!
				2. Drivers: Supplementary income at convenience
		3. Key Resources
			1. What key resources do our value prop require? (only those without which business cannot exist)
				1. Platform: Connects the customers to drivers
				2. Software: Algorithms for pricing, routes, matching etc...
				3. Driver network: No drivers mean no Uber
		4. Key Partners:
			1. Who are the key partners | suppliers?
				1. Drivers: Drivers drive the customers
				2. Technology providers: E.g. Mapping technology
					1. Uber does not construct in-house all of the technologies required for the platform. It procures from other suppliers or partners
				3. State authorities: Permission to operate
					1. Without permissions, Uber cannot operate
		5. Key Activities:
			1. What key activities do your Value Prop require? (activities business carries out for creation of value for customers)
				1. Build & Maintain Platform | Software
				2. Driver recruitment
				3. Legal affairs
					1. With state authorities
		6. Customer Relationsips (We must ensure that the customers are happy with the services we are providing)
			1. What type of relationship does each of our customer segments expect us to establish?
				1. Ratings & Feedback (for customers and drivers)
				2. Self Service (from which customers and drivers can get service from Uber)
				3. Support (Customer support via emails and phone)
					1. Uber drivers have 24/7 phone support
		7. Revenue Streams (depicts revenue flow for the business)
			1. For what do the customers pay?
				1. Ride commissions (for each of the rides)
				2. Premium Rides
				3. Surge Price
				4. Cancellation fee
		8. Cost Structure (cache outflow)
			1. What key activities do we spend money on?
				1. Marketing
				2. Legal affairs
				3. Technology development
				4. Employee salaries
				5. R&D
		9. Channels
			1. Channels through which customers want to be reached?
				1. Mobile Apps
				2. Third Party Apps (used by customers to avail certain services)
4. Quick Review:
	1. Business model canvas is a tool that helps in understanding the business model
	2. 9 parts depicted in the form of a canvas
		1. Key Partners
		2. Key Activites
		3. Value Proposition
		4. Customer Relationships
		5. Customer Segments
		6. Key Resources
		7. Channels
		8. Cost Structure
		9. Revenue Streams

### Exercise: ACME Travels Business Model Canvas ###
1. Business Model Canvas: Creation of business canvas will help understand the business
	1. How the canvas is created?
	2. Walkthrough of the canvas for ACME
2. Exercise:
	1. Please follow along:
		1. Construct the business model canvas for organization you work for!!!
			1. Key Partners
				1. Technology providers:
					1. HU Vendors
					2. Charging Station API Vendors
					3. Car Electronics Vendors
				2. Charging Stations
			2. Key Activites
				1. Build & Maintain Platform | Software
				2. Legal affairs
					1. With state authorities
			3. Value Proposition
				1. Customers:
					1. Convenience through automation or semi-automation using mobile phones or touch screen panels
					2. Features to aid drivers during commute
			4. Customer Relationships
				1. Customer feedback through ratings, comments, complaints
				2. Self service & Support (customers can get service from Mercedes Benz)
				3. Analytics (to get insight into customer experience and issues with the vehicles and improve customer experience)
			5. Customer Segments
				1. Individuals
				2. Businesses
			6. Key Resources
				1. Platforms (mobile phones, touch screen panels): Used by customers to ease commute & safety
				2. Software: algorithms to provide features required to support customers
				3. Hardware: backend data centers to run the software
			7. Channels
				1. Mobile Apps
				2. Mobile phones
				2. Third Party Apps (used by customers to avail certain services)
			8. Cost Structure
				1. Marketing
				2. Legal affairs
				3. Technology development
				4. Employee salaries
				5. R&D
			9. Revenue Streams
				1. Sales
				2. Premium features
				3. Commission from charging stations (?)
3. ACME Travels:
	1. How is it constructed?
		1. Mostly by interviewing the experts (subject matter experts of the Domains within Organization)
		2. Observing the business (to gain understanding)
		3. Using publicly available information
		4. For new business, founders must construct one to sell the idea to Venture Capitalists
			1. They may not be business experts but there are industry experts who can provide insights into what of **business model** would work for the specific industry
	2. ACME business experts were interviewed to construct the business model canvas (assumption)
		1. **Customer Segments**
			1. "Vacationers who appreciate the ease & convenience; these are the folks who do not like the hassles of planning - they just want ot pack up their bags and go"
				1. **Hassle free traveler**
			2. "Looking for options that fit their budget; willing to cut down on luxuries" (deals)
				1. **Budget Conscious**
			3. "Corporations arranging group tours for their employees; we give them group discounts and offer them specialized services e.g., travel guides"
				1. **Corporate**
		2. **Value Proposition**
			1. Hassle Free: "We take care of everything; you just need to pack up your bags"
				1. All inclusive vacation package
					1. Value prop: **Convenience**
			2. Budget Conscious: "Affordable travel packages for every budget"
				1. Customizable travel bundles
					1. Value prop: **Value for money**
			3. Corporate: "End to end logistics is always appreciated by corporates"
				1. Group vacation packages
					1. Value prop: **Logistics** (& planning provided)
		3. **Key Resources**
			1. "A vacation package consists of multiple parts"
				1. Hotel
				2. Air BnB
				3. Airline ticket
				4. Trains ticket
				5. Car Rental
				6. Cruise
				7. Excursions
				8. Limousine Service
				9. Other add on
			2. Parts into three buckets:
				1. **Transportation**
					1. Airline
					2. Bus
					3. Train
					4. Cruise
				2. **Accommodation**
					1. Hotels
				3. **Excursions**
					1. Beaches
					2. Trecking/Hiking
					3. Visits
		4. **Key Partners | Suppliers**
			1. Transportation: "We get bulk tickets multiple Airlines, Cruises, Bus Companies; also have business relationship with car rental companies that give use commission or discount depending on the contract we have"
				1. **Airlines**
				2. **Cruise Liners**
				3. **Bus Companies**
				4. **Rental Cars**
			2. Accommodation: "We get special rates from hotels and more recently we have started using AirBnB as well"
				1. **Hotels**
				2. **Air BnB**
			3. Excursions: "We have a network of tour operators that work closely with us to construct the attractive vacation package options"
				1. **Tour Operators**
		5. **Key Activities**
			1. "We do a market research to understand the likes and dislikes of our customers"
				1. **Market Research**
			2. "We design and run market campaigns to attract new customers and to increase the volume for return customers"
				1. **Campaigns**
			3. "To be profitable we need to negotiate optimal contract with our providers"
				1. **Contract Negotiation**
			4. "Vacation packages are our products, and we have product designers who use the market research and other mechanisms to design the products"
				1. **Product Design**
			5. "In the last few years we have started to spend a $$ in automation of our systems e.g. we can now check partner's offering availability without making a call!!!"
				1. **Technology**
					1. More effort is spent on technology to make ACME more competitive and profitable
		6. **Customer Relationship**
			1. "24x7 Full Support Guarantee to our customers via phone, email, text message"
				1. **24x7 Customer Support**
			2. "Sometimes are providers do not provide the best experience and that leads to conflicts; we act as the single point of contact for conflict resolutions after all our reputation is at stake!!"
				1. **Conflict Management** (ACME protects customers by helping with resolution of conflicts)
					1. ACME works with providers and partners as customer advocates
			3. "We will not survive if our customers do not like our products, so we are big on feedback"
				1. **Feedback**
					1. ACME takes feedbacks seriously and works on it
		7. **Channels**
			1. "From Day 1 travel agents have been the biggest producer for our business (approx. 50%). But gradually we see that the travel agent business is declining as people like to use their phones and iPads to research & book vacations"
				1. **Travel Agents** (declining due to change in customer preferences)
			2. "Direct sales are almost 35% of our revenue - hoping to increase it to 55% in next 2 years with the help of technology"

## Domain Driven Design: Strategic Patterns ##
### Introduction to DDD and Patterns ###
### Business Subdomain Types ###
### Exercise: ACME Subdomain Type Assignment ###
### Understanding the Business Context ###
### Business Domain Language ###
### Strategic Pattern: Ubiquitous Language ###
### Exercise: Define ACME's Ubiquitous Language ###
### Strategic Pattern: Bounded Context ###
### Discovering the Bounded Contexts in a Domain ###
### Exercise: Identify ACME's Bounded Contexts ###

## Bounded Context Relationships ##
### Intro to DDD Integration Patterns ###
### Managing BC Relationships Using Context Maps ###
### Symmatric Relationship Patterns ###
### Asymmetric Relationship Patterns ###
### One to Many Relationship Patterns ###
### Exercise: Context Mapping for a Bank ###

## Domain Driven Design - Tactical Patterns ##
### Intro to DDD Tactical Patterns ###
### Entity Object - Pattern ###
### Value Object - Pattern ###
### Exercise: Identify Entity & VO in ACME Sales Model ###
### Hands On: Building the ACME Sales Entities & VO in Java ###
### Aggregate & Factory - Pattern ###
### Exercise: ACME Sales Use Case ###
### Hands On: UML for ACME Sales Aggregates ###
### Model Behavior: Anemic & Rich Models ###
### Repository Object - Pattern ###
### Hands On: ACME Model Repository in UML & Java ###
### Domain Service - Pattern ###
### Application Services - Pattern ###
### Infrastructure Services - Pattern ###
### Hands On: ACME Domain Service, UML & Java ###
### Hands On: Application and Infrastructure Services, UML & Java ###

## Events Driven Architecture & Domain Events ##
## Event Storming for Constructing Shared Knowledge ##
## Microservices Data Management Patterns ##
## Microservices DB Performance Management ##
## Microservices Managing the Data Integrity ##
## Microservices and Kafka ##
## Managing Distributed Transactions with SAGA ##
## Microservices and API ##