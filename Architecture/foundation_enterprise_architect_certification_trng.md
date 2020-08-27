# Foundation Enterprise Architect Certification Trng #

## Before We Start ##
### Introduction ###
1. Open Group's Architecture Framework
	1. Part 1 exam preparation
2. TOGAF:
	1. Open Group:
		1. Large group of companies including government and universities
			1. Worked together to formalize the enterprise architecture
			2.  design process (Dell included)
			2. Spec: [http://sjd.ca/t9spec](http://sjd.ca/t9spec)
3. Architecture framework is:
	1. A precisely defined language for describing an architecture
	2. Predefined building blocks for putting it together
	3. The precise steps to follow to do so
4. Goal of the course:
	1. Take and pass TOGAF certification exam for Part 1
		1. Focus is only exam
5. What it takes to pass:
	1. This course plus supplemental materials
	2. The official TOGAF 9.1 specificatoin document
	3. Studying
	4. Notes
	5. Memorization (exam needs this)

### What is Enterprise Architecture? ###
1. Spec is not good for explanation
2. What is TOGAF?
	1. Industry standard architecture framework
	2. Define the desired future state of the enterprise
	3. Define the steps to reach the future state
4. ADM - Architecture Development Method
	1. The core of TOGAF
	2. Other parts:
		1. Document Repository
		2. Document Classification
		3. Governance
		4. Reference Models
		5. Developing Capabilities
5. Why does a company need architecture?
	1. Connects the long-term strategy of the enterprise (by executives, board of directors, ...) into actual plan that gets evenly implemented across the organization
		1. Phasing out in-person services say
			1. Need phases
6. How does a high-level executive strategy get turned into actual tasks to be implemented?
	1. Architect designs the plan using the ADM process
		1. What services can be put online and what cannot be put online
		2. What is the current technology and can it support the move or if we need to make changes
	2. TOFAF and ADM is a process to turn overall executive strategy into a work plan that gets implemented
		1. It is also a cycle that repeats
			1. Architecture vision is the goal
			2. When the goal is reached, repeat the process
7. ADM is generic, and can be implemented by any company (that is why it is a standard)
8. Summary:
	1. TOGAF contains a process that helps you define the future state of the enterprise
		1. Determine the steps to get you to the future state
	2. Alligns all parts of the business to the enterprise goals
9. This process is required because enterprises change 

### A Note About TOGAF 9.2 - Please Watch ###
1. TOGAF 9.2:
	1. Additional
	2. 9.1 has steps in the course

## The TOGAF 9 Level 1 Certification ##
### Details of the Exam ###
1. Two exams to be TOGAF Certified: Part 1 and Part 2
	1. Can be taken together or separately
2. Part 1 tests your understanding of the TOGAF 9.1 specification
	1. Definitions, concepts, phases of the ADM, enterprise continuum, etc
	2. Tests one concept or thing at a time
	3. Passing gives you TOGAF 9 Foundation
3. Part 2 tests how you apply the TOGAF standard to several scenarios
	1. Applying all of the TOGAF standard knowledge to each question (scenarios)
	2. TOGAF 9 Certified
4. Part 1 must be passed before taking Part 2
5. Part 1 exam:
	1. Taken in-person at a testing center local to you
	2. 40 multiple-choice questions
	3. 55% to pass (or at least 22 right out of 40)
	4. 60 minutes
6. It is a closed book test
7. Ability to review all answers before submitting (can go back and forth)
8. Graded immediately
9. Leave exam center certified for level 1
10. 11 major areas of TOGAF spec that part 1 exam is testing you
	1. Basic concepts (3 questions)
	2. Core concepts (3 questions)
	3. Introduction to the ADM (3 questions)
	4. The enterprise continuum and tools (4 questions)
	5. ADM phases (9 questions)
	6. ADM guidelines and techniques (6 questions)
	7. Architecture governance (4 questions)
	8. Architecture views, viewpoints, and stakeholders (2 questions)
	9. Building blocks (2 questions)
	10. ADM deliverables (2 questions)
	11. TOGAF reference models (2 questions)
11. What it's like (test)
	1. Around $320 U.S (localized to currency)
	2. Available at some Pearson VUE Test Centers
		1. [https://home.pearsonvue.com/](https://home.pearsonvue.com/)
	3. Book online
		1. Map is available
	4. Reschedule 48 hours before
	5. What happens if you fail
		1. Minimum waiting period of a month before re-test
		2. There is a fee for re-taking the test
			1. Go to open group to get a discount
12. Assignment:
	1. Read the official exam details page:
		1. [http://www.opengroup.org/togaf9/cert/docs/og91.html](http://www.opengroup.org/togaf9/cert/docs/og91.html)
		2. Choose an ideal date for when you'd like to take the exam by, and mark it in your calendar. Set definitive goal, and make plans to achieve it

### Introduction to Basic and Core Concepts ###
1. Architecture is 3 things
	1. Set of definitions
	2. Specific set of steps (processes)
	3. Content metamodel (allows to store content)
2. Concepts:
	1. Why do we need to define the Enterprise?
	2. What is an architecture?
	3. What is an architecture framework?
	4. Concept of architecture domains
	5. BDAT
	6. Purpose of the ADM

### Basic and Core Concepts ###
1. Enterprise: Any collection of organizations that has a common set of goals
	1. Goto spec and read (important for exam)
	2. Enterprise is limited to the business unit the architect is working for (not the entire company across the globe)
	3. If the entity is divided into multiple corporations (for legal and tax purposes), then they are all part of the enterprise
		1. Partners are also part of the enterprise
		2. Systems that partners use are part of the enterprise
			1. Partners log in
			2. Use it
	4. Enterprise is the scope of the architecture that we need to be defining
2. Architecture:
	1. "A formal description of a system [...] _to guide implementation_"
		1. An architecture document can be turned over to the development group or to the outside contractor and they can refer to the document and understand how to build the system
	2. "the structure of components, their inter-relationships, and the _guidelines governing their design_ and evolution over time"
		1. Architecture is a high level view of a system
		2. Structure of components and their relationships
			1. Boxes and lines
				1. How components interact
		3. There are rules and principles and guidelines for development team
3. Why do we need Enterprise Architecture?
	1. "The purpose of enterprise architecture is to optimize across the enterprise the often fragmented legacy of processes (both manual and automated) into an integrated environment that is responsive to change and supportive of the delivery of the business strategy"
		1. Fragmented legacy of processes: over time as organization has grown, new systems are brought on (piece meal), decisions are short sighted, systems may not keep up with latest decisions, parts of system may no longer be used but cannot afford to remove them
		2. Integrated environment: We need to think of the system as a whole (instead of individual parts) that is responsive to change and supportive of the delivery of the business
		3. Purpose of applications and systems: To support the business strategy
			1. If business decides, this is what we want to do, the applications, systems should adapt to what the business needs
2. Breaking things down:
	1. By now, all enterprises have legacy systems in place
	2. Often, no single document exists that covers all of them
	3. No single person can explain how everything works
	4. No plan for how to add new systems going forward
	5. Surprises when trying to make big changes
		1. If new system is introduced, something existing breaks (but we cannot take the system away)
	6. Large amounts of technical debt accumulate
		1. Decisions get accumulated
3. Positives of Enterprise architecture:
	1. Lower costs - development, maintenance, support
		1. If more responsive to change
	2. Reduced complexity:
		1. If complexity of the system is broken down (into micro services say)
	3. Reduced Risk
	4. Simpler to add new systems
	5. Faster purchase and implementation
4. What is an architecture framework?
	1. It has a common vocabulary
		1. When I say BRD, you know what that means
		2. When I say Enterprise, then you know what that means
	2. A set of tools or building blocks
		1. There are tools in the framework for us to do architectural work
	3. A method for designing a target state of the enterprise
		1. ADM
	4. A set of recommended standards
		1. IIIRM, TRM 
5. Core Concepts of the TOGAF 9.1 standard:
	1. Four architecture domains - BDAT
	2. Architecture development method - ADM
	3. Deliverables, artifacts, and building blocks
	4. Enterprise continuum
	5. Architecture repository
	6. Architecture capability of an organization
6. Assignment:
	1. Read chapter 3 of the TOGAF 9 Specification, on Definitions

### Core Concepts: Architecture Domains ###
1. Core concepts of the TOGAF 9.1 standard:
	1. four architecture domains: BDAT
	2. Architecture development model - ADM
		1. The most important thing on the exam
	3. Deliverables, artifacts, and building blocks
	4. Enterprise continuum
	5. Architecture repository
	6. Architecture capability of an organization
2. Architecture domains: architectural area being considered
	1. Business - business strategy, governance, ornaization key business processes (business architecture domain - irrespective of underlying technology used to solve it)
	2. Data - structure of logical and physical data assets, data mgmt
		1. Records being kept
			1. Customers
			2. Products
			3. Owners
		2. We need structure to the data
		3. How data is passed between apps
		4. API being called to pass data
	3. Applications - blueprint for individual applications, interactions, relationships to the core business processes
		1. The way users and customers interface with the technology
			1. Order entry system
	4. Technology (IT) - logical software and hardware capabilities required to support the above (hardware, networks, OS, etc)
		1. Used to meet the above requirements

### Core Concepts: Architecture Development Method ###
1. ADM:
	1. Majority of this course will focus on the ADM
	2. THe ADM is the heart of the TOGAF specification
	3. It is the method by which an architecture is designed
	4. 9 phases, plus requirements management itself
	5. Iterative process
		1. continuous, never-ending process (keeps turning)
			1. After phase A, it gets into this mode
	6. Baseline and target
		1. Baseline: The architecture that exists today (current state of the system)
		2. Target: Desired architecture
			1. If it is too far
				1. Use transitional architectures
					1. 3 month plan, 12 month plan, 2 years plan ...
		3. Short-term, long-term, quarter goals, annual goals

### Core Concepts: Deliverables, Artifacts and Building Blocks ###
1. Deliverable: work product contractually specified, formally reviewed, agreed to, and signed off on by stakeholders; outputs of projects
	1. Road maps
	2. Requirements
	3. Definitions
	4. Implementation plans
2. _Artifact: architectural work product; catalogs; diagrams; matrices; parts of deliverables; placed into architecture repository (may go into a deliverable but not itself a deliverable)
	1. Diagrams 
	2. Lists
	3. Matrices
3. _Building blocks_: a potentially re-usable component
	1. High level view
		1. We can say an order entry system must accept orders, modify orders, delete orders, archive orders (not desiging the actual system)
			1. Order entry system (building block)
	2. Architectural building block (ABB): It is the requirement
		1. Solution building block (SBB): Actual implementation of the ABB

### Core Concepts: Enterprise Continuum ###
1. Continuum: A line
	1. Enterprise Continuum: How the generic solutions can be leveraged for your organization
	2. We can map our architecture to this line
		1. More generic on the left
		2. More specific on the right
	3. We can grab generic solutions from other companies and can be used to build our architecture
	4. It is a way of classifying the items in the architecture as
		1. Most generic on the left to most specific on the right
2. 4 classifications
	1. Foundation architecture - TRM (an example of this - it is so generic that it can apply in any situation to any company)
		1. Not very useful
	2. Common systems architecture
		1. Little more specific
		2. IIIRM is an example (applies to many situations)
	3. Industry architecture
		1. Specific to industry
			1. Banking
				1. Grab some from this industry
			2. Education
	4. Organization-specific architecture

### Core Concepts: Architecture Repository ###
1. Architecture repository:
	1. Place were all of the architectural outputs are stored
		1. Deliverables
		2. Artifacts
		3. Views
	2. Supports Enterprise Continuum
	3. One document for technical, different one for business people, .. all gets stored here
	4. Different architectural output at different levels of abstraction
		1. Reference documents
		2. TOGAF spec
		3. Industry architectures
		4. ...
2. Components:
	1. Architectural metamodel
		1. Templates for doing architecture
	2. Architectural capability
		1. Assessment of the capability of the architecture group (do this from time to time)
	3. Architecture landscape
		1. Baseline and target architectures
		2. All of the documents go here
		3. Outputs of phases are going here
	4. Standards Information Base
		1. TOGAF
		2. SIFF
		3. ...
	5. Reference Library
		1. External reference models
			1. Industry architecture
			2. Common systems architecture
		2. Things that can be adopted to the enterprise 
	6. Governance Log
		1. Decisions made for the architecture go here
			1. We are going to accept this type of design and not this
			2. We accept these principles
			3. ...

### Core Concepts: Architecture Capability ###
1. The capability of a business to support an architecture function
	1. Architecture function supports business
		1. Takes business goals and designs applications, data and technology to meet those goals
	2. How good is the company at this?
		1. Does it have a full-time architect?
			1. Or part time
		2. Does it have a group?
		3. Who do they report to?
			1. Manager
		4. Is there a governance board?
			1. Do they follow all of the proper processes and procedures of TOGAF?
	3. Will everyone follow the rules? How to ensure?
		1. Will the executives support? Will they respect the architect's decision?
			1. CEO
			2. Executive team
			3. Implementation group:
				1. We don't think we can do A, B and C but need to do D, E and F
					1. How does it get resolved?
	4. Roles and responsibilities
		1. Technical architects
		2. Data architects
		3. Governance board
	5. Skills and process
		1. How trained am I?
		2. How good am I at this?
		3. Templates and processes I have in place
2. Rate ourselves as an architect
	1. 1 - just starting out
		1. Just hired the first architect
		2. Nobody knows what they are doing
		3. It is just an experiment
	2. Work your way up to 9 or 10
		1. Architecture governance is strong
		2. Got a group that supports it
		3. Everyone knows what they are doing
3. Assignment:
	1. Read Part I of the TOGAF 9.1 Specification

### Download the TOGAF 9.1 Spec as HTML or PDF ###
1. TOGAF 9.1 Spec: Reference whenever needed (look at this document daily as you study)
2. [http://pubs.opengroup.org/architecture/togaf9-doc/arch/](http://pubs.opengroup.org/architecture/togaf9-doc/arch/)
	1. Free an open to view
3. Free PDF version to download: 90-day evaluation purposes
	1. [https://www2.opengroup.org/ogsys/jsp/publications/PublicationDetails.jsp?catalogno=I112](https://www2.opengroup.org/ogsys/jsp/publications/PublicationDetails.jsp?catalogno=I112)
		1. Register for an account and agree to terms
		2. After getting the PDF, it is free

## ADM: Starting Out ##
### Introduction to the ADM ###
1. ADM: Architecture Development Method - It is the way an architect defines an implements the architecture
	1. Preliminary Phase
	2. 8 Phases A-H
	3. Requirements Management (In the center)
2. It is done repetetively
	1. If a change of business comes along, kick off the cycle again
		1. Preliminary phase (only once)
			1. Helps to get into the architecture development method
				1. Define what the enterprise is
				2. Gather the tools
					1. Software
					2. Frameworks
					3. Scrum method
					4. TOGAF
					5. Zachman
			2. We need to figure out how those can be used together
			3. Customize the ADM for the company

### What is the ADM? ###
1. ADM: Architecture Development Method
	1. "A method for developing and managing the lifecycle of an enterprise architecture"
	2. A of 9 phases (a preliminary phase, plus 8 phases that make up a cycle), that surround the continuously-ongoing requirements management phase. Each phase is itself made up of steps
2. Cycle:
	1. A Preliminary phase (only done once) - Phase 0
	2. Eight phase (A-H) arranged in a cycle
	3. All surrounding the continuous Requirements Management Phase
	4. All phases have inputs, steps and outputs
	5. Outputs (deliverables) are in the form of documents, that get saved to the architecture repository
	6. Knowing the phases, inputs, steps and outputs is key to passing the exam
3. ADM designed to be generic, to fit most enterprises
	1. But can be modified or extended to meet a specific need
	2. Own ADM can be constructed for our enterprise that is unique
		1. Technology requirements:
			1. Technology requirements can come first before the business requirements
			2. If it is a smaller company and all steps cannot be afforded
				1. Trim back on the steps and outputs

### Brief Overview of the ADM, Part 1 ###
1. ADM
	1. Preliminary phase - do it once
	2. 8 phases (A-H) in a cycle
		1. A-H-A-H...
	3. Continuous Requirements Management Phase in the center
		1. If we get changes in between the ADM process, this process can be used manage any phase
		2. It interacts with each of the phases
2. Preliminary phase
	1. Preparation and initiation activities
	2. Defining "the enterprise" - to us
		1. Partitioning of architecture
		2. What does it mean to you
		3. Enterprise is the business unit and the applications any one who interacts with those apps
			1. Outside partners are included
	3. Choosing frameworks
		1. TOGAF
		2. ITIL (service management) - need to swap off TOGAF steps for ITIL steps
		3. COBIT - architectural governance
	4. Evaluate enterprise maturity and capability
		1. Is the enterprise resistant to change?
		2. Is whole sale changes difficult? (need to do step by step)
		3. Enterprise capabilities?
		4. Architectural capabilities?
			1. What am I good at?
			2. What am I not good at?
			3. What I need to get better at?
	5. Defining architecture principles
		1. Guiding lights
3. Architecture Vision (Phase A) - Problems are defined and solutions are developed (identifying the problems like a BA)
	1. Develop a high-level vision to be delivered
	2. Obtain approval for a Statement of Architecture Work
		1. Project plan
		2. Define scope
		3. Estimate resources needed
		4. Develop a roadmap and schedule
		5. Define KPIs (Key Performance Indicators) and metrics
			1. Measures of success
				1. If I can recude cost by 50000 per year
				2. If I can take out 4 hours per week of a person's time and free it up for other things
		6. Communications plan
			1. Some people are more important than others
			2. Rake important people
				1. Ones with lots of inputs
				2. Ones with fewer inputs
4. Business Architecture (Phase B)
	1. B in BDAT
	2. Develop the baseline business architecture v1.0 (could be bottom-up, based on what exists)
		1. Business requirements dictate what the technical requirements are going to be
		2. Baseline: Current architecture (business processes)
	3. Develop the target business architecture v1.0 (top-down normally)
		1. Where we want to be  
	4. Identify gaps between baseline and target (ideal state)
		1. These are the requirements
			1. Baseline: If customers need to call
			2. Target state: Online
5. Information Systems Architecture (Phase C)
	1. D & A in BDAT
	2. Data and Application done separately (or at the same time)
	3. Develop the baseline data architecture v1.0
	4. Develop the target data architecture v1.0
	5. Develop the baseline application architecture v1.0
	6. Develop the target application architecture v1.0
	7. Identify gaps between baseline and target
6. Technology Architecture (Phase D) - exist to support the business data and application layers on top of it
	1. T in BDAT
	2. Develop the baseline technology architecture v1.0
	3. Develop the target technology architecture v1.0
	4. Identify the gaps between baseline and target

### Brief Overview of the ADM, Part 2 ###
1. Opportunities and Solutions (Phase E)
	1. Initial complete version of the Architecture Roadmap, based on gap analysis of BDAT
		1. Consolidation of BCD
	2. Determine if incremental approach required
		1. Swap out this and swap in that
		2. Incremental work packages
			1. Transitional architectures
		3. Formulate implementation and migration strategy
			1. Prioritization
		4. Identify and group work packages
2. Migration Planning (Phase F)
	1. Finalize the Architecture Roadmap and Implementation and Migration Plan
		1. Laying things on a project schedule
		2. Working with project managers
		3. Working with implementers
		4. Getting estimates for how long it is going to take
		5. Outsourcing the projects
	2. Ensure that plan is coordinated with the enterprise's approach to change
		1. If working in an enterprise that is very resistent to change and takes a lot of effort and work to make small changes
			1. Plan must be based on small changes
		2. If company is a risk taker and things move quickly and there is agile development and doing deployments in every 6 weeks
			1. Different approach to change
	3. Ensure the business value of the approach is understood by stakeholders
		1. Cannot recommend a change if we cannot explain what the value of it is
		2. Put a dollar value or time value or decisions can be made better
	4. Start thinking about implementation: costs, resources, timing
	5. Transition from developing the architecture to implementing
3. Implementation Governance (Phase G)
	1. Ensure conformance with the target architecture
		1. Implementors must confirm
		2. If they choose a software system, make sure the software has the features that you are looking for
			1. Development
			2. Deployment
			3. Testing
	2. Governance duties
		1. During implementation, changes might occur
			1. Something may not be possible
			2. A new version is out
			3. This company is going out of business 
			4. Support for this is no longer possible
	3. Handling change requests from implementation team
		1. Can we implement change x?
			1. Approve or deny
	4. Update baseline architecture as changes are implemented
		1. As a transitional architecture goes live, the baseline architecture changes
	5. Phase G ends when solutions are fully deployed
4. Architecture Change Management (Phase H)
	1. Keeping the architecture alive
		1. Keep it functioning
	2. Ensure architecture governance is happening
		1. Changes come in
		2. Changes get approved or denied
		3. Changes are logged
	3. Ensure the enterprise architecture capability is maintained
		1. Team members that leave must be replaced
		2. Improve the architecture group
	4. Monitoring: changes to the business enterprise, changes to the industry, changes to technology, formal change requests
		1. Technology changes
5. Requirements Management
	1. Center of the hub
	2. Operates continuously during the ADM process
	3. Requirements change all the time
	4. RM involves assessing impact of these changes
	5. New competitor, new legislation, disproven assumption, new company policy  

### Brief Overview of the ADM, Part 3 ###
1. ADM Iteration, Optional (not mandatory to implement ADM)
	1. Architecture development iteration
		1. An example, baseline first architecture
		2. Go through the phases B to F to define baseline architecture only
		3. Then repeat B-F to define a target architecture, lightly
		4. Then repeat B-F to define a target architecture, in detail
	2. Or Target first architecture
2. Transition planning iteration
3. Architecture governance iteration
4. Architecture capability iteration
	1. Re-address capability (H-A)

### Preliminary Phase ###
1. Preparation and initiation activites (before we start the ADM cycle)
2. Define "the enterprise"
3. Choosing frameworks
	1. TOGAF
4. Evaluate enterprise maturity and capability (ability to adjust to change as well)
5. Defining architecture principles

#### Objectives of the phase ####
1. Determine the architecture capability desired by the organization
	1. Pick a point in the future where you want more advanced architecture capability 
		1. Larger team
		2. Better governance structure
		3. Better processes
2. Establish the architecture capability
	1. Need support from business

#### Approach ####
1. Define the "Enterprise"
2. Identifying key drivers for change and elements
	1. We need to make the following changes because of this (drivers)
	2. Solution should be able to solve it
3. Defining the requirements for architecture work
	1. It is like a project
4. Defining the architecture principles
5. Defining the framework to be used
	1. TOGAF
	2. Zachman
	3. ...
6. Defining the relationships between management frameworks
	1. IT team: Operations framework
	2. Project management team: Project management framework
	3. Business team: Business framework
7. Evaluating the enterprise architecture maturity

#### Inputs (usually documents) ####
1. TOGAF
2. Other architecture frameworks
3. Board strategies, board business plans, IT strategy, business principles, business goals, business drivers
4. Major frameworks operating within the business (i.e. SCRUM)
5. Architecture capability
6. Partnership and contract agreements

#### Steps ####
1. Scope the enterprise organizations impacted
	1. We have a domain
		1. May be single department under larger department
	2. Organization:
		1. Business (clients)
		2. Applications under preview
2. Confirm governance and support frameworks
	1. Governance: People who do checks and balances, logs decisions, fairness, transparency
3. Define and establish architecture team
	1. Business architect (domain of expertise)
	2. Data architect
	3. Technical architect
4. Identify and establish architecture principles
5. Tailor TOGAF and other frameworks
	1. Values may value different things (security, speed, ...)
		1. Security conscious (Banks, defense)
			1. Add security reviews (from the start)
6. Implement architecture tools (decide the tools)
	1. Microsoft word
	2. Visio

#### Outputs (usually documents) ####
1. Organization model for enterprise architecture
	1. This document describes how the company does architecture
2. Tailored architecture framework
3. Initial architecture repository
	1. Past documents and organize them
		1. TOGAF metamodel can be used for this
		2. TOGAF enterprise continuum
4. Restatement/reference to business principles, goals, etc...
	1. Re-wording
5. "Request for architecture work" (optional)
	1. SOW like
6. Architecture governance framework
	1. Places where documents are stored
		1. Log files
		2. Project plans
		3. Decisions
		4. Principles
7. Assignment:
	1. Read chapter 6 of the TOGAF 9 specification: Preliminary phase
	2. Or check out section 9 of this course which goes through the steps in more detail

### Phase A: Architecture Vision ###
1. Develop a high-level vision to be delivered
2. Obtain approval for a statement of architecture work
	1. Contains
		1. Define Scope
		2. Estimate resources needed
		3. Develop a roadmap and schedule
		4. Define KPIs and metrics
		5. Communications plan

#### Objectives ####
1. Develop a high-level aspirational vision of the capabilities and business value to be delivered
2. Obtain approval for a statement of architecture work

#### Approach ####
1. Request for architecture work, what is in and out of scope
2. Creation of architecture vision
3. Go through the ADM "Business scenarios" process (use cases)

		1. Problem
			2. Envrionment (Problem lives here)
				3. Objectives (Environment has objectives)
					4. Human Actors (Employees, customers, ... who operate in this environment)
						5. Computer Actors (systems)
							6. Roles & Responsibilities (for the above)
								7. Refine (Goto Step 1)
								
#### Inputs (usually documents) (common inputs) ####
1. External reference materials
2. Request for architecture work (optional) (prelim phase)
3. Business principles, goals, and drivers (Prelim phase)
4. Organization Model for Enterprise Architecture (Prelim phase) 
5. Tailored architecture framework (Prelim phase)

#### Steps ####
1. Establish architecture project
	1. Kickoff meeting
	2. Schedule
	3. Project manager
	4. Timelines
	5. Tasks
2. Identify stakeholders, concerns and business requirements
	1. Stakeholders:
		1. Answer questions
		2. They give them requirements
		3. Learn how to talk to different people (different diagrams are required, different languages, different documents)
			1. Financial officer
			2. CIO
			3. CEO
			4. Sales department
			5. call center
			6. ...
3. Confirm business goals, drivers and constraints
4. Evaluate business capabilities
	1. What is company good at (scale of 1-10)
		1. In things that we want to do and how we do them and to what degree
	2. What is company not good at (scale of 1-10)
		1. In things that we want to do and how we do them and to what degree
5. Access readiness for transformation
	1. Evaluation of how the company adapts to change
		1. There are companies where change is expected
		2. There are companies where change is extremely difficult
			1. Even version number approval is difficult
6. Define Scope
7. Confirm architecture principles, including business principles
	1. Ensure principles are still working
	2. Chapter 23 of the TOGAF specification
8. Develop architecture vision
	1. What do you see in the target architecture (very high level)
	2. Come up with something like - this is what we are probably going to implement
		1. One or two pages
9. Define the target architecture value and KPIs
	1. What are they going to earn
	2. What are they going to save
	3. Are changes going to be easier
	4. Are changes going to be quicker
	5. What is the value to business
10. Identify transformation risks and mitigation activities
11. Develop statement of architecture work, secure approval
	1. Get approval

#### Outputs (usually documents) ####
1. Approved statement of architecture work
2. Refined statements of business principles, goals and drivers
3. Architecture principles
4. Capability assessment
5. Tailored architecture framework
6. Architecture vision
7. Draft architecture definition document (version 0.1 of all baseline and target BDAT documents)
8. Communications plan
	1. How to talk to stakeholders
9. Additional content in the architecture repository

#### Artifacts ####
1. Matrices: Stakeholder map matrix
2. Diagrams: Value chain diagram, solution concept diagram

#### Assignment ####
1. Read chapter 7 of the TOGAF 9 specification: Phase A
2. Or check out section 10 of this course which goes through the steps in more detail

### Half Way Mark ###
1. Go to Q&A
	1. Join discussion
	2. Reach out for help

## ADM: The Four Domains of BDAT ##
### Introduction to BDAT ###
1. Business Data Application Technology
	1. Architecture of a company can be divided into 4 manageable parts
2. Business Architecture:
	1. Specialist
	2. Interviews with business owners
	3. Translates business requirements into TOGAF ADM
3. Technology architecture
	1. How things are currently related together and transition that into target architecture
4. All 4 work together to build the architecture (output of ADM)
5. Why do we do business architecture first?
	1. Business should drive the technology

### Phase B: Business Architecture ###
1. It is the second phase of ADM cycle
2. Business Architecture
	1. B in BDAT
	2. Objective:
		1. Develop the baseline business architecture v1.0 (could be bottom-up, based on what exists)
			1. Bottom up: Baseline architecture already exists, and we need to discover and document it
		2. Develop the target business architecture v1.0 (top-down normally)
			1. Think up desired needs, find a solution for that
				1. It does not already exist (dreaming it up)
		3. Identify gaps between baseline and target
			1. This gets into the requirements
3. All BDAT are going to have very similar inputs, steps and outputs (except tailored for that domain)
4. Business architect
	1. Sometimes called Business Analyst
5. Objectives
	1. Develop the target business architecture based on business goals
	2. Identify candidate architecture roadmap components
6. Approach
	1. Business architecture is the foundation on which the other domains architecture are built on
	2. Develop the baseline description (bottom-up)
	3. Business models (activity and use-case models)
		1. Different sectors have models (banking sector say)

#### Inputs (usually documents) ####
1. External reference materials
2. Request for Architecture Work (optional) (Prelim Phase)
3. Business principles, goals, and drivers (Phase A, and from the TOGAF Specification Chapter 23)
4. Capability assessment (Phase A)
5. Communications plan (Phase A)
6. Organization Model for Enterprise Architecture (Prelim Phase)
7. Tailored Architecture Framework (Prelim Phase)
8. Approved Statement of Architecture Work (Phase A)
9. Architecture principles (Phase A)
10. Enterprise continuum
11. Architecture Repository 
12. Architecture vision (Phase A)
13. Draft architecture definition document (version 0.1 of all baseline and target BDAT documents) (Phase A)

#### Section 11 ####
1. Goes into each of the steps in individual detail
2. For deepening the understanding of Phase B

#### Steps ####
1. Select reference models, viewpoints, and tools
	1. Grab already existing business models
2. Develop baseline business architecture description
	1. Bottom up
		1. Go through organization
		2. Document business processes
		3. Follow people
			1. Talk to them
			2. What do you do
			3. Why do you do this
			4. How do you do that
		4. Some of the documents already exist (we just need to validate them)
3. Develop target business architecture description
	1. We came up with potential problems (vision, high level architecture)
	2. How does business look once we are done
4. Perform gap analysis
5. Define candidate roadmap components
	1. What we are going to do it 1 month, 3 months, 6 months ...
6. Resolve impacts across the architecture landscape
	1. Our work may have an impact on team outside our scope
7. Conduct formal stakeholder review
	1. Get feedback
8. Finalize business architecture
9. Construct architecture definition document

#### Outputs (usually documents) ####
1. Refined Phase A deliverables
2. Draft architecture definition document - baseline and target, v1.0
3. Draft architecture requirements specification - gap analysis
4. Business architecture components of an architecture roadmap

#### Artifacts ####
1. Catalogs: Organization/actor catalog, Driver/goal/objective catalog, role catalog, business service/function catalog, location catalog, process/event/control/product catalog, contract/measure catalog
2. Matrices: Business interaction matrix, actor/role matrix
3. Diagrams: Business footprint diagram, business service/information diagram, function decomposition diagram, product lifecycle diagram, goal/objective/service diagram, use-case diagram, organization decomposition diagram, process flow diagram, event diagram
4. Keywords
	1. Business
	2. Product
	3. Service
	4. Organization
	5. Process
	6. Event
	7. Goal
	8. Function
	9. Contract
	10. Location
	11. Role
5. Assignment:
	1. Read chapter 8 of the TOGAF 9 spec: Phase B
	2. Read chapter 23 of the TOGAF 9 spec: Business principles
	3. Or check out Section 11 of course which goes through steps in more detail

### Phase C: Information Systems Architecture, Data ###
1. Data architecture:
2. Information Systems Architecture
	1. D & A in BDAT
	2. Data and Application done separately
	3. Develop the baseline data architecture v1.0
	4. Develop the target data architecture v1.0
	5. Develop the baseline application architecture v1.0
	6. Develop the target application architecture v1.0
	7. Identify gaps between baseline and target
3. Approach to Information Systems Architecture in General
	1. Data and Application Architecture can be worked on in either order, or together
4. Objectives for information systems architecture
	1. Develop the target information systems (data and application) architecture based on business goals
	2. Identify candidate architecture roadmap components
5. Objectives for Data Architecture
	1. Develop the target data architecture based on business goals
6. Objectives for Data Architecture
	1. Develop the target data architecture based on business goals
	2. Identify candidate architecture roadmap components
7. Approach:
	1. Understand and address data management issues
		1. Data is an asset
			1. If a disaster occurs how to manage it
	2. Data migration issues
		1. Migrating solutions from one platform to another
		2. Moving data around securely
	3. Data governance
		1. Vendor security
		2. Old employee access
	4. Architecture repository
		1. Is there an existing data standard that can be borrowed, like SIF for Education or ARTS for retail?
			1. There are data standards depending on the industry

#### Inputs (usually documents) ####
1. External reference materials
2. Request for architecture work (optional) (Prelim phase)
3. Capability assessment (Phase A)
4. Communication plan (Phase A)
5. Organization Model for Enterprise Architecture (Prelim Phase)
6. Tailored Architecture Framework (Prelim Phase)
7. Data principles (TOGAF Specification Chapter 23)
8. Approved Statement of Architecture Work (Phase A)
9. Architecture vision (Phase A)
10. Draft architecture documents and draft requirements (Phase B)
11. Business related architecture roadmap (Phase B)

#### Section 12 ####
1. Goes into each step in individual detail, if interested (not a requirement for exam but could deepend understanding of Phase C (Data))

#### Steps ####
1. Select reference models, viewpoints, and tools
	1. Are there reference models in architecture repository that can help us come up with data definition
2. Develop baseline data architecture description
	1. Tools are well designed for it
		1. Layers
		2. Number of databases
		3. Roles and responsibilities
3. Develop target data architecture description
	1. Example: Putting SOA
		1. Services around data
	2. Plan how data is shared in the organization
4. Perform gap analysis
5. Define candidate roadmap components
6. Resolve impacts across the architecture landscape
	1. Resolve any differences across company
		1. If what we are doing impacts others, resolve them or vice-versa
			1. Common solution might help (company wide)
7. Conduct formal stakeholder review
	1. Go with plan and go to stakeholders who are most interested in data
		1. Take feedback
		2. Apply feedback
		3. Get approval
8. Finalize data architecture
9. Construct architecture definition document

#### Outputs (usually documents) ####
1. Refined Phase A deliverables
2. Draft architecture definition document - baseline and target, v1.0
3. Draft architecture requirements specification - gap analysis
4. Data architecture components of an architecture roadmap

#### Artifacts ####
1. Catalogs: Data entry/data component catalog
2. Matrices: Data entry/business function matrix
3. Diagrams: Conceptual data diagram, logical data diagram, data dissemination diagram, data security diagram, data migration diagram, data lifecycle diagram
4. Keyword: All "data"

#### Assignment ####
1. Read Chapter 9 of the TOGAF 9 spec: Information systems architecture
2. Read chapter 10 of the TOGAF 9 spec: on Data architecture
3. Read chapter 23 of the TOGAF 9 spec: Data principles
4. Section 12 of the course (steps in more detail)

### Phase C: Information Systems Architecture, Application ###
1. Objectives of application architecture
	1. Develop the target application architecture based on business goals
	2. Identify candidate architecture roadmap components
2. Approach for application architecture
	1. Architecture repository
		1. Are there an existing business models that can be adopted, like TeleManagement Forum (TMF) for the telecommunications industry?
			1. TMF: Application architecture model
		2. Or III-RM (Integrated Information Infrastructure Reference Model) from The Open Group
			1. Services model

#### Inputs (usually documents) - outputs of previous phases
1. External reference model
2. Request for Architecture Work (optional) (Prelim Phase)
3. Capability assessment (Phase A)
4. Communications plan (Phase A)
5. Organization Model for Enterprise Architecture (Prelim Phase)
6. Tailored Architecture Framework (Prelim Phase)
7. Application principles (TOGAF Specification Chapter 23)
8. Approved Statement of Architecture Work (Phase A)
9. Architecture vision (Phase A)
10. Architecture Repository
11. Draft architecture documents and draft requirements (Phase B)
12. Business related architecture roadmap (Phase B)

#### Section 13 ####
1. Each step in detail
2. Not a requirement for exam (details)
	1. Deepens understanding of Phase C (Application)

#### Steps ####
1. Select reference models, viewpoints, and tools
	1. Go to architecture repository and see what already exists for application architecture
		1. If we have gone through this cycle multiple times, there should be a few but if we have not already, it may be empty
2. Develop baseline application architecture description
	1. Bottom up:
		1. Find applications that exist in the organization
		2. Go to each business unit and document the inventory
			1. Who uses them
			2. What do they do
			3. How do they connect to each other
3. Develop target application architecture description
	1. Based on what we know
	2. We want the company to move towards
		1. Business design is also part of the architecture (not just systems)
4. Perform gap analysis
	1. Between baseline and target
	2. Pull out all of the differences
5. Define candidate roadmap components
6. Resolve impacts across the architecture landscape
	1. What other application developments are going underway
		1. Projects are on-going
		2. Pull them back into the design
7. Conduct formal stakeholder review
	1. Present the application architecture
	2. Take their feedback
	3. Get approval
8. Finalize application architecture
	1. Justify building blocks chosen (solution building blocks)
9. Construct architecture definition document
	1. Application section

#### Outputs (usually documents) ####
1. Refined Phase A deliverables
2. Draft architecture definition document - baseline and target, v1.0
3. Draft architecture requirements specification - gap analysis
4. Application architecture components of an architecture roadmap

#### Artifacts ####
1. Catalogs: Application portfolio catalog, interface catalog
2. Matrices: Application/organiztion matrix, role/application matrix, application function matrix, application interaction matrix
3. Diagrams: Application communication diagram, application and user location diagram, application use-case diagram, enterprise manageability diagram, process/application realization diagram, software engineering diagram, application migration diagram, software distribution diagram
4. Keywords: application, interface, software

#### Assignment ####
1. Read Chapter 11 of the TOGAF 9 Spec: Application architecture
2. Read Chapter 23 of the TOGAF 9 Spec: Application principles
3. Or check out section 13 of the course which goes through steps in more detail

### Phase D: Technology Architecture ###
1. T in BDAT (last domain)
2. Develop the baseline technology architecture v1.0
3. Develop the target technology architecture v1.0
4. Identify gaps between baseline and target

#### Objectives ####
1. Develop the target technology architecture based on business goals
2. Identify candidate architecture roadmap components

#### Approach ####
1. Architecture repository
	1. Existing IT services
	2. TOGAF Technical Reference Model (TRM)
	3. Generic industry technical models

#### Inputs (usually documents) ####
1. External reference materials
2. Product information on candidate products
3. Request for architecture work (optional) (Prelim Phase)
4. Capability assessment (Phase A)
5. Communications plan (Phase A)
6. Organization model for enterprise architecture (Prelim Phase)
7. Tailored architecture framework (Prelim Phase)
8. Technology principles (TOGAF specification chapter 23)
9. Approved statement of architecture work (Phase A)
10. Architecture vision (Phase A)
11. Architecture repository
12. Draft architecture documents and draft requirements (Phase B and C)
13. Business, data and application components of an architecture roadmap (Phase B and C)

#### Steps ####
1. Select reference models, viewpoints, and tools
2. Develop baseline technology architecture description
	1. IT: (pull the documentation)
		1. Firewalls
		2. Wiring
		3. Connections
		4. Communications
		5. Servers
3. Develop target technology architecture description
	1. Based on vision (Phase A)
	2. Top-down
		1. Example: Windows 2003 to Windows 2012
			1. Need servers
4. Perform gap analysis
	1. Existing infrastructure - no gaps
	2. Brand new cutting edge technology - a lot of gaps
5. Define candidate roadmap components
	1. 3, 6, 9, 12 months
6. Resolve impacts across the architecture landscape
	1. For new servers say
		1. Existing projects are not using the new servers
7. Conduct formal stakeholder review
	1. Technology stakeholders
	2. Get feedback
	3. Make changes
	4. Get final approval
8. Finalize technology architecture
	1. Look at different views (make them consistent)
9. Construct architecture definition document
	1. For technology (last domain)

#### Outputs (usually documents) ####
1. Refined Phase A deliverables
2. Draft architecture definition document - baseline and target, v1.0
3. Draft architecture requirements specification - gap analysis
4. Technology architecture components of an architecture roadmap

#### Artifacts ####
1. Catalogs: Technology standards catalog, technology portfolio catalog
2. Matrices: Application/technology matrix
3. Diagrams: Environments and locations diagram, platform decomposition diagram, processing diagram, networked computing/hardware diagram, communications engineering diagram
4. Keywords:
	1. technology
	2. network
	3. hardware
	4. environment
	5. platform
	6. communications

#### Assignment ####
1. Read chapter 12 on technology architecture
2. Read chapter 23 of the TOGAF 9 spec: Technology principles
3. Or check out section 14 of this course which goes through the steps in more detail

## ADM: Planning Implementation ##
### Phase E: Opportunities and Solutions ###
1. Opportunities and solutions (Phase E)
	1. Initial complete version of the architecture roadmap, based on gap analysis of BDAT
	2. Determine if incremental approach required
	3. Formulate implementation and migration strategy
	4. Identify and group work packages

#### Objectives ####
1. Generate the initial complete version of the architecture roadmap, based upon the gap analysis of BDAT
2. Determine whether an incremental approach is required, and if so identify transition architecture that will deliver continuous business value
	1. Define transition architectures (incrementally deliver business value)

#### Approach ####
1. Figure out how to deliver the target architecture
	1. Architecture roadmap
	2. Work packages
	3. Transition architectures
	4. Implementation and migration plan

#### Inputs (usually documents) ####
1. External reference materials
2. Product information
	1. Information about products that are part of the recommendation
		1. Example: SAP
			1. How to implement
			2. Resources required
			3. Timeline
3. Request for architecture work (optional) (Prelim Phase)
4. Capability assessment (Phase A)
5. Communication plan (Phase A)
6. Planning methodologies
7. Organization model for enterprise architecture (Prelim phase)
8. Tailored architecture framework (Prelim phase)
9. Approved statement of architecture work (Phase A)
10. Architecture vision (Phase A)
11. Architecture repository
12. Draft architecture documents and draft requirements (BDAT)
13. Change requests for existing business programs and projects
	1. Approved requests to make a change
		1. Example: Email providers from solution A to solution B, then change requests are submitted to different places
14. Candidate architecture roadmap components

#### Steps ####
1. Determine key corporate change attributes
2. Determine business constraints
	1. Budget
	2. Contract for services and expensive to break
		1. Need to wait for some time
3. Review and consolidate gap analysis from Phase B-D
	1. Put them into one
4. Review consolidated requirements across business functions
5. Consolidate and reconcile interoperability requirements
6. Refine and validate dependencies
7. Confirm readiness and risk for business transformation
	1. Significant change has significant risk
		1. Understand readiness of company
8. Formulate implementation and migration strategy
9. Identify and group major work packages
	1. For major systems, group them into one work
		1. Partitioning if they can be done separately
10. Identify transition architectures
	1. 3 months, 6 months, ...
11. Construct the architecture roadmap & implementation and migration plan

#### Outputs (usually documents) ####
1. Refined Phase A deliverables
2. Draft architecture definition document - baseline and target, v1.0
3. Draft architecture requirements specification - gap analysis
4. Capability assessments
5. Architecture roadmap, version 0.1
6. Implementation and migration plan, version 0.1

#### Artifacts ####
1. Diagrams: Product context diagram, benefits diagram
2. Keywords:
	1. benefits

#### Assignment ####
1. Review chapter 13 on opportunities and solutions
2. Or check out section 15 of this course which goes through the steps in more detail

### Phase F: Migration Planning ###
1. Migration planning (Phase F)
	1. Finalize the architecture roadmap and implementation and migration plan
	2. Ensure that plan is coordinated with the enterprise's approach to change
	3. Ensure the business value of the approach is understood by stakeholders
	4. Start thinking about implementation: costs, resources, timing
	5. Transition from developing the architecture to implementing

#### Objectives ####
1. Finalize the architecture roadmap and the supporting implementation and migration plan
2. Ensure that the implementation and migration plan is coordinated with the enterprise's approach to managing and implementing change in the enterprise's overall change portfolio
3. Ensure that the business value and cost of work packages and Transition Architectures is understood by key stakeholders

#### Approach ####
1. Creation of an implementation and migration plan

#### Inputs (usually documents) ####
1. External reference model
2. Request for architecture work (optional) (Prelim phase)
3. Capability assessment (Phase A)
4. Communications plan (Phase A)
5. Organization Model for enterprise architecture (Prelim Phase)
6. Governance models
7. Tailored architecture framework (Prelim phase)
8. Approved statement of architecture work (Phase A)
9. Architecture vision (Phase A)
10. Architecture repository
11. Draft architecture documents and draft requirements (BDAT)
12. Change requests for existing business programs and projects
13. Architecture roadmap, version 0.1 (Phase E)
14. Implementation and migration plan, version 0.1 (Phase E)

#### Steps ####
1. Confirm management framework interactions
	1. Enterprise might have certain business frameworks
		1. How they run projects
		2. How they do accounting
		3. Business processes
		4. ...
2. Assign a business value to each work package
	1. Savings
	2. Profits
3. Estimate resource requirements, project timings, etc
4. Prioritize
	1. Things that have business value but do not cost much or take a lot of time (first)
		1. There may be dependencies (Doing B before C)
5. Confirm architecture roadmap and update architecture definition document
6. Generate implementation and migration plan
7. Complete the architecture development cycle, lessons learned
	1. Things may need more time ...

#### Outputs (usually documents) ####
1. Implementation and Migration Plan, version 1.0
2. Finalized architecture definition document
3. Finalized architecture requirements
4. Finalized architecture roadmap
5. Re-usable ABBs
	1. Architecture building blocks
		1. structure say - may be starting point
		2. Turning up documents or concepts into ABBs
	2. Solution building blocks
6. Requests for architecture work for next ADM cycle (if any)
7. Implementation of governance model
	1. We need to decide how change gets recorded and approved and accounted for in the organization
8. Change requests for architecture capability from lessons learned
	1. Size
	2. Structure
	3. People in place
	4. Process in place 
	5. Support from senior management
	6. Architecture organization within the organization 
	7. Is approval needed to hire more people?
	8. Need to get more serious?
	9. Need to cut some corners now and do it more properly later on
	10. Changing ADM model or tailoring

#### Artifacts ####
1. None

#### Assignment ####
1. Review chapter 14 on migration planning
2. Or check out section 16 of this course which goes through the steps in more detail

### Phase G: Implementation Governance ###
1. Implementation governance (Phase G)
	1. Ensures conformance with the target architecture
	2. Governance duties
	3. Handling change requests from implementation team
	4. Updating baseline architecture as changes are implemented
	5. Phase G ends when solutions are fully deployed (could be a long phase)

#### Objectives ####
1. Ensure conformance with the Target Architecture by implementation projects
2. Perform appropriate Architecture Governance functions for the solution and any implementation-driven architecture Change Requests

#### Approach ####
1. Establish an implementation program that will enable the delivery of the Transition Architectures
	1. Architect may not be there for purchasing the products or implementing them or working on the business side
	2. But need to work with the solution implementation team to ensure what they are doing delivers in terms of transition architectures
2. Adopt a phased deployment schedule that reflects the architecture roadmap
3. Follow the organization's standard for coroporate, IT, and architecture governance
4. Use the organization's established portfolio/program management approach, where this exists
	1. Scrum or kanban
	2. ...
5. Define an operations framework to ensure the effective long life of the deployed solution
	1. The solution must be adaptable and useful for a period of time (2 years, 4 years, 6 years ...)

#### Inputs (usually documents) ####
1. External reference materials
2. Request for architecture work (optional) (Prelim Phase)
3. Capability assessment (Phase A)
4. Organization Model for Enterprise Architecture (Prelim Phase)
5. Tailored Architecture Framework (Prelim Phase)
6. Approved Statement of Architecture Work (Phase A)
7. Architecture vision (Phase A)
8. Architecture Repository
9. Architecture definition documents and requirements (BDAT)
10. Architecture roadmap, version 0.1 (Phase E)
11. Implementation governance model
12. Architecture contract
13. Request for architecture work for next ADM cycle (Phase F)
14. Implementation and migration plan, version 1.0 (Phase F)

#### Steps ####
1. Confirm scope and priorities for deployment
	1. Confirm them with stakeholders
2. Identify deployment resources and skills
	1. Is it being outsourced or doing it internally
	2. Need contractors?
3. Guide Development of solutions deployment
	1. Make sure development follows your direction
4. Perform enterprise architecture compliance reviews
	1. If the solution implementation team picks a solution and custom build new solution - review those specs and make sure they are compliant with architecture designed with constraints, roles and principles in place
5. Implement Business and IT Operations
6. Perform Post-Implementation Review and Close the Implementation
	1. Phase ends when solutions are deployed

#### Outputs (usually documents) ####
1. Architecture contract
	1. "... joint agreements between development partners and sponsors on the deliverables, quality, and fitness-for-purpose of an architecture"
		1. If we hire an outside partner (say IBM)
			1. IBM consulting is going to implement
				1. There needs to be an agreement
					1. What is being requested and what is delivered meets certain quality and fitness for purpose rules in the contract
					2. What they developed should match what has been envisioned
	2. Read chapter 49 of the TOGAF 9.1 spec
2. Compliance assessments
	1. Defining documents to say (Project X fulfills 9 out of 10 things we wanted to do)
3. Change requests
4. Architecture-compliant solutions deployed (result of the phase)

#### Artifacts ####
1. No artifacts

#### Assignment ####
1. Review chapter 15 on implementation governance
2. Review chapter 49 on architecture contracts
3. Or check out section 17 of this course which goes through the steps in more detail

### Phase H: Architecture Change Management ###
1. Architecture Change Management (Phase H)
	1. Keeping the architecture alive
	2. Ensure architecture governance is happening
	3. Ensure the enterprise architecture capability is maintained
		1. Teams might get dispersed (people might work on other teams)
		2. Make sure the architects, people who are responsible, the governors capability does not go off to other things and forget company's architecture for few years
2. Monitoring: changes to the business enterprise, changes to the industry, changes to technology, formal change requests

#### Objectives ####
1. Ensure that the architecture lifecycle is maintained
2. Ensure that the architecture governance framework is executed
3. Ensure that the enterprise architecture capability meets current requirements

#### Approach ####
1. Drivers for change - not always strategic in this phase, but reacting to "reality"
	1. Changes just happen
		1. OS version
		2. New mobile technology (sales team wants this)
	2. Need to react:
		1. Bottom-up
2. The enterprise change management process determines how changes are managed
	1. When change requirements come in, we need to have a proper change management process in place
3. How to determine what is simple maintenance vs redoing the ADM cycle
	1. If everyone is getting rid of desktops and now all work on mobile phones
		1. May need to go through ADM cycle again

#### Inputs (usually documents) ####
1. External reference materials
2. Request for Architecture Work (optional) (Prelim Phase)
3. Organization model for enterprise architecture (Prelim Phase)
4. Tailored architecture framework (Prelim phase)
5. Statement of architecture work (Phase A)
6. Architecture vision (Phase A)
7. Architecture repository
8. Architecture definition documents and requirements (BDAT)
9. Architecture roadmap (Phase F)
10. Change requests - technology changes, business changes, lessons learned
	1. Did not get what we expected
		1. Costing more
		2. Taking more time
	2. Need to find out what we can do differently the next time
		1. May have to go back to previous existing system
11. Implementation governance model
12. Architecture contract (Phase G)
13. Compliance assessments
13. Implementation and migration plan, version 1.0 (Phase F)

#### Steps ####
1. Establish value realization process
	1. Are we getting the value that we are expecting?
2. Deploy monitoring tools
3. Manage risks
4. Provide analysis for architecture change management
5. Develop change requirements to meet performance targets
	1. To meet requirements, to cut costs, can we change the project a little bit to meet that
6. Manage governance process
7. Activate the process to implement change

#### Outputs (usually documents) ####
1. Architecture updates
2. Change to architecture framework and principles
3. New requests for architecture work (for major changes)
4. Statement of architecture work (updated if necessary)
5. Architecture contract (updated if necessary)
6. Compliance assessments (updated if necessary)
	1. The phase could last of indefinite amount of time until next architecture re-work

#### Artifacts ####
1. None

#### Assignment ####
1. Read chapter 16 of the TOGAF 9 spec: Architecture Change Management
2. Or check out Section 18 of this course which goes through the steps in more detail

### ADM Architecture Requirements Management ###
1. Requirements Management
	1. Center of the hub
		1. Interacts with each of the ADM phases
	2. Operates continuously during the ADM process
	3. Requirements change all the time, regardless what phase you're currently in
	4. RM involves assessing impact of these changes
	5. New competitor, new legislation, disproven assumption, new company policy, missed requirement
		1. May need to accomodate the requirement now

#### Objectives ####
1. Ensure that the requirements management process is sustained and operates for all relevant ADM phases
2. Manage architecture requirements identified during any execution of the ADM cycle or a phase
3. Ensure that relevant architecture requirements are available for use by each phase as the phase is executed

#### Approach ####
1. Center of the hub - continuously drives the ADM cycle
2. Each phase of the ADM, the architect should identify which requirements are relevant for that phase
3. No specific tool is recommended within TOGAF for managing requirements

#### Inputs (usually documents) ####
1. Architecture repository
2. Organization model for enterprise architecture (Prelim phase)
3. Tailored architecture framework (Prelim phase)
4. Statement of architecture work (Phase A)
5. Architecture vision (Phase A)
6. Architecture requirements
7. Requirements impact assessment

#### Steps ####
1. This phase is really managing the interaction between requirements management, and each phase
2. The steps are continuous
3. So the steps are assigned to either "requirements management" or "ADM phase"

#### Steps (Summary) ####
1. Identify/ document requirements (from ADM phases)
	1. During BCD phases
2. Baseline requirements: Determine priorities, confirm stakeholder buy-in, place in requirements repository
	1. At the end of BDAT (that needs to be approved)
3. Monitor baseline requirements
	1. Keep track of changes in the architecture that gets introduced in the environment
4. Identify changed requirements, remove/add/modify (from ADM phases) the priorities
5. Identify changed requirements; record new priorities (from other places)
	1. These are from non ADM sources
		1. At any of the phases of ADM cycle, any new requirement comes in, put that down and decide what do you do with it
6. Assess impact of changed requirements (from ADM phases)
	1. Do we have to act on it right away
	2. Do we have to stop what we are doing
	3. Do we have to go back to phase B
	4. Can we finish this and deal with it later
	5. Do not have to do anything?
7. Implement requirements arising from Phase H (from ADM phases)
	1. If the architecture needs to be changed, that is fed into requirements management phase
8. Update the requirements repository
	1. Requirements are recommended to be stored in a repository (different from architecture repo)
		1. This is the storage for business requirements and technology requirements (Baseline and target)
	2. Maintain them
9. Implement change in the current phase (from ADM)
	1. If a requirement comes in we have to deal with it
10. Assess and revise gap analysis for past phases B-D (from ADM)
	1. If gaps are identified between baseline and target
		1. If something, do gap analysis again

#### Outputs (usually documents) ####
1. Requirements impact assessment
2. Architecture requirements specification, if necessary

#### Artifacts ####
1. None

#### Assignment ####
1. Review Chapter 17 on ADM architecture requirements management
2. Particularly the list of steps
3. Review chapter 41.6, on the requirements repository
4. Or check out section 19 of this course which goes through the steps in more detail

## Wrapping It Up ##
### The Enterprise Continuum ###
1. Second most important concept
2. Enterprise continuum in TOGAF:
	1. A view of the architecture repository that provides methods for classifying architecture and solution artifacts as they evolve from generic foundation architecture to organization specific architecture"
3. Enterprise continuum comprises of Complementary concepts:
	1. Architecture continuum
	2. Solution continuum
4. Enterprise continuum is:
	1. A view of the architecture repository
		1. A place where we store all of our architecture documents and artifacts
			1. Folder
			2. Website
			3. Binder
		2. All reference material
			1. Generic reference models
			2. Common technical models
			3. Industry specific stuff
	2. Classifying architecture and solution artifacts
	3. From generic to specific
	4. Architecture continuum and solutions continuum
5. Architecture repository (if file folder on network)
	1. Contains all building blocks that go into your architecture
	2. An empty box that you can fill with architecture output
6. Continuum is a tool that enables us to classify documents (artifacts): 
	1. The view can be used to identify if which ones are reference documents and which ones are specific to the business
	2. The enterprise continuum uses a scale from generic to specific
		1. Most generic documents on the left and most specific documents on the right
	3. Further divided between architecture continuum and solutions continuum
		1. Architecture continuum: Contains architecture documents that are not tied to a specific implementation
		2. Solutions continuum: Provides technical and implementation details for those components
	4. Both continuums support each other
7. ABB: Architecture Building Blocks
	1. Are building blocks that exist in the architecture continuum
8. SBB: Solutions Building Blocks
	1. SSOs used across apps say

#### Architecture Continuum ####
1. Foundation Architecture (Most Generic) - can be applied to almost any business or any industry
	1. Extremely generic services and functions
		1. Like the TRM (Technical Reference Model) or SIB (Standards Information Base)
			1. TRM cannot be directly implemented because it does not contain implementation or technical details
		2. Foundation upon which other architectures are built
2. Common Systems Architecture (still discuss a wide range of businesses)
	1. Still generic, but contains some details
		1. Like III-RM
			1. Describes an application architecture of data providers, data brokers and data consumers 
				1. It is just one of the ways one can organize business application
		2. Security architecture
		3. Network architecture
3. Industry Architecture (Each industry has a set of standards applicable to those businesses - Banking, retail, education, manufacturing, real-estate)
	1. Industry specific services and functions
	2. Managed by an industry group
		1. Like credit-card processing in retail industry
		2. Those are building blocks specialized to the type of business (not just for single business)
4. Organization Specific Architecture (Customizations of higher level architectures to the business)
	1. Most specific to only your business
	2. Your business services and functions
	3. Going through ADM, we end up with very specific architecture definition document that cannot be easily implemented by any other company

#### Solutions Continuum ####
1. Mirrors the architecture continuum
2. Foundation Solutions:
	1. Extremely generic solutions (tools, products and components that can be used to build a solution)
	2. Programming languages, operating systems, ITIL (most generic tools)
	3. Example: Open source product in Linux (foundation solution)
		1. It is applicable to any solution
3. Common systems solutions: (Products that run on top of generic solutions)
	1. Still generic, but contains some details
	2. Enterprise management systems, security systems (Software as a service - these are applicable to many businesses)
	3. Software as a service vendors (like, MS Office) - (more specific technologies)
		1. MySQL database
		2. Broker service
		3. Firewall software
4. Industry Solutions:
	1. Industry-specific solutions and implementations
	2. Implementations of an industry architecture
		1. Off the shelf merchant solution for handling credit cards (retail industry)
		2. Specific to industry but not specific to business
5. Organization-Specific Solutions: (Custom implementations - customized call center software, program that we need to write to capture some data from one system to other say)
	1. Most specific to only your business
	2. Implementation of your organization architecture

#### Summary ####
1. It is a view of architecture repository that categorizes documents and artifacts
2. Architecture continuum and Solutions continuum work hand in hand to support each other

### Capability Assessment ###
1. Capability Assessment, includes: (Before we start architecture definition we can understand the baseline and target level of the enterprise)
	1. Business capability
	2. IT capability
	3. Architecture maturity capability
	4. Business transformation readiness assessment
2. First defined in Phase A and updated in Phase E
3. Results of capability assessment are stored in Governance log: (artifacts)
	1. Decision log
	2. Compliance assessments
	3. Capability assessments
	4. Calendar (dates and times)
	5. Project portfolio (list of all projects going on)
	6. Performance measurement
4. Capability assessments are tracked, and updated occasionally to ensure progress made from baseline to target capabilities
	1. Every few months go over and update

#### Business Capability Assessment ####
1. Capabilities of the business
	1. Business has certain products and services, functions it needs to perform on a daily basis to sustain the business
		1. Show manufacturer
			1. Manufacturing - capability
			2. Sales - capability
			3. Logistics of shipping boxes to retail outlets - capability
			4. IT - capability
			5. Accounting - capability
			6. Stratigic capability
			7. Designers of fasion and styling - capabilities
2. Baseline state assessment of performance
	1. Manufacturer (say)
		1. How well are you manufacturing performance wise (scale of 1 to 10)
3. Future state aspiration of performance
4. Baseline state assessment of how each capability is realized
	1. If manufacturing is making a lot of mistakes:
		1. Wastage of materials
		2. Quality is not good
		3. Lot of manual effort
			1. Putting shoe laces into the holes
			2. Sowing the soles
	2. Ability to do it and how we do it
5. Future state aspiration of how each capability is realized
6. Assessment of likely impacts to the business if the Target Architecture is realized
	1. Automation
		1. More shoes per day
		2. Quality is better
		3. Less mistakes
		4. ...

#### IT Capability Assessment ####
1. Baseline and target maturity level of change process
	1. How do we handle change?
		1. If new application is developed
			1. Is there a ticketing process for prod deployment
			2. Development team and deployment team
2. Baseline and target maturity level of operational processes
	1. Operational process
		1. Cloud or server
		2. Backups
3. Baseline capability and capacity assessment
	1. Is IT department able to handle requests? Are they competent? Are there enough servers (if business grows)
4. Assessment of the likely impacts to the IT organization resulting from the successful deployment of the Target Architecture
	1. What do we need to change on the IT organization to handle that type of growth and that type of change

#### Architecture Maturity Assessment ####
1. Architecture governance processes, organization, roles, and responsibilities
	1. Ad-hoc to standard
	2. Assess that
2. Architecture skills assessment
3. Breadth, depth, and quality of landscape definition with the Architecture repository
4. Breadth, depth, and quality of standards definition with the architecture repository
	1. Settle on a single OS version
5. Breadth, depth, and quality of reference model definition with the Architecture repository (assess how clearly we have defined the customization to the organization)
	1. TRM
	2. SOA
	3. ...
6. Assessment of re-use potential
	1. Having BBs
		1. Standard way of doing things

#### Business Transformation Readiness Assessment ####
1. Readiness factors
	1. How ready is company for change?
		1. Slow company
		2. Is it easy or super difficult
		3. How many people are affected?
		4. What are the risks
		5. Is there going to be pushback
2. Vision for each readiness factor
3. Current and target readiness ratings
4. Readiness risks

### Stakeholders and Views ###
1. Related concepts to TOGAF
	1. Exam synopsys has it
2. Stakeholder:
	1. "An individual, team, or organization (or classes thereof) with interests in, or concerns relative to, the outcome of the architecture. Different stakeholders with different roles will have different concerns"
		1. Chapter 3, definitions
		2. Based on roles
			1. Business people
			2. Technical people
			3. Financial people
3. Stakeholder examples:
	1. Architect (You)
	2. Accounting/Finance
	3. The customer
	4. User of the solution
	5. Business unit
	6. Partners/Implementers
	7. External Suppliers
	8. Customer Service Group
	9. IT Group
	10. HR Group
	11. QA Group
	12. Security Group
4. TOGAF:
	1. Corporate Functions
		1. CEO
			1. Enterprise Security
			2. Program Managment Office
			3. QA Standards Group
			4. Procurement
			5. HR
			6. Below:
				1. End-user Organization
					1. Executives
					2. Line Management
					3. Business Domain Expert
					4. Data Owners
				2. Project Organization
					1. Executives
					2. Line Management
					3. Business Process/Functional Expert
					4. Product Specialist
					5. Technical Specialist
				3. System Operations
					1. IT Service Management
					2. Service Desk
					3. Application Management
					4. Infrastructure Management
					5. Data/Voice Communications
				4. Below: External
					1. Suppliers
					2. Regulatory Bodies
5. View
	1. "The representation of a related set of concerns. A view is what is seen from a viewpoint. An architecture view may be represented by a model to demonstrate to stakeholders their areas of interest in the architecture. A view does not have to be visual or graphical in nature."
		1. Business people say may be interested in certain bits of information but not the others, so view extracts interested pieces of information
	2. Chapter 3, definitions
	3. View examples:
		1. People view
		2. Workflow view
		3. Business objectives view
		4. Data entity view
			1. Database and app level interests
		5. Enterprise security view
		6. Cost view
			1. For business people
		7. Standards view
		8. Hardware view
		9. Data flow view
6. Viewpoint:
	1. "A definition of the perspective from which a view is taken. It is a specification of the conventions for constructing and using a view (often by means of an appropriate schema or template). A view is what you see; a viewpoint is where you are looking from - the vantage point or perspective that determines what you see."
		1. It is where you are looking from (Perspective)
	2. Chapter 3, definitions
	3. Examples:
		1. Business stakeholders see the architecture in terms of up-front and recurring cost, value delivered, services offered, flexibility for future business decisions, etc.
		2. Technical stakeholders see the same architecture in terms of number of applications, number of servers, number of users, size of database, etc.
			1. Load
			2. Performance
			3. ...
7. Assignment:
	1. Review chapter 3 on definitions
	2. Review chapter 24, on the stakeholder management

### Architecture Governance ###
1. Architecture Governance: "The practice and orientation by which enterprise architectures and other architectures are managed and controlled at an enterprise-wide level. It is concerned with change processes (design governance) and operation of product systems (operational governance)."
	1. From definitions, chapter 3:
		1. [http://pubs.opengroup.org/architecture/togaf9-doc/arch/chap03.html](http://pubs.opengroup.org/architecture/togaf9-doc/arch/chap03.html)
2. Hierarchy of Governance:
	1. Any organization has multiple layers of governance
		1. Corporate governance (Executive team & board of directors)
			1. Managing change and organization as a whole
	2. Technology governance (CIO/CTO, how they use technology, broader)
		1. Broader scope
	3. IT governance (IT resources linked to business goals, best practices)
		1. IT management function
			1. Practices
			2. Backups
			3. Security
	4. Architecture Governance
#### Characteristics of Governance (general) ####
1. **Discipline**: adhere to authority, policies and procedures
2. **Transparency**: all actions available for inspection
	1. Make decisions openly and are not made in secret
3. **Independence**: minimize conflicts of interest
	1. Technology team should not be running architecture governance because we may have technology requirements over the other requirements
4. **Accountability**: authorized and accountable for their actions
	1. Identifiable groups of people who are accountable for their actions
5. **Responsibility**: required to act responsibly
6. **Fairness**: not allowed an unfair advantage (for one group over another group)

#### Architecture Governance ####
1. System of controls over all architecture components and activities
	1. Approving architecture
	2. Reviewing architecture
	3. Monitoring architecture
2. System to ensure compliance with internal and external standards and legal obligations
	1. Legal bits change
	2. Industry standards (need to be compliant)
3. Process to support effective management of the above two
4. Practices that ensure accountability

#### Architecture Governance ####
1. Phase G (Implementation Governance) covers just one aspect of governance, dedicated to ensuring a solution being implemented adheres to the architecture
2. Context (Drivers (business, technology, regulatory) Organizational forms) - Diagram in TOGAF spec
	1. Process
		1. Policy Management & Take-on
		2. Compliance
		3. Desperation
		4. Monitoring & Reporting
		5. Business Control
		6. Environment Management
	2. Content
		1. Requirements
		2. SLAs and OLAs
		3. Authority Structures
		4. Organizational Standards
		5. Solutions
		6. Architectures
	3. Repository
	4. Process Flow control

#### Architecture Governance Processes ####
1. Policy Management and Take-On
2. Compliance
3. Dispensation
	1. If there is no compliance then give temporary reprieve (6 months say) to stay non-compliant but eventually come back to be compliant
		1. Security requirements
			1. Admin system is accessible from outside but needs login
				1. Get it behind VPN
4. Monitoring and Reporting
5. Business Control
6. Environment Management

#### Architecture Governance Organization ####
1. In a large enterprise, you're likely to have many layers and levels of governance. You have those that developed the architecture (architects), those that implement it (developers), and those that maintain it (IT/operations). They all can have their own local governance to ensure compliance. And it could be split along geographical lines as well.
2. The teams may monitor themselves
	1. Self governance

#### Assignment ####
1. Review Chapter 50, on the architecture Governance
	1. Exam is not going to dive into this too much

### Reference Models ###
1. Not much about reference models on the exam. They are optional parts of TOGAF
2. Except you should know where they fit on the enterprise continuum
3. Where do they fit?
	1. TOGAF has two reference models
		1. TRM - Technical Reference Model
			1. "The TRM is universally applicable and, therefore, can be used to build any system architecture."
			2. TRM is foundation architecture, the most generic it can be
			3. It is on the left-side of Enterprise Continuum and the Architecture Continuum
			4. Diagram from TOGAF
				1. Qualities (Symbolizes a computer)
					1. Infrastructure Applications
					2. Business Applications
					3. Application Platform Interface
						1. Qualities:
							1. Graphics & Image
							2. Data Management
							3. Data Interchange
							4. User Interface
							5. International Operations
							6. Location & Directory
							7. Transaction Processing
							8. Security
							9. Software Engineering
							10. System and Network Management
					4. Operating System Services
					5. Network Services
					6. Communications Infrastructure Interface
					7. Communications Infrastructure
		2. III-RM - Integrated Information Infrastructure Reference Model
			1. III-RM - Common Systems Architecture (focuses on the application software and not underlying network/hardware)
			2. It is on the middle-left of the Enterprise Continuum and the Architecture Continuum (no OS, ...)
			3. Graphic
				1. Qualities (Security, Mobility, Performance SLAs, Management Policy) - doesn't specify what consumer is, is it a web app or not, neither windows service or not
					1. Application platform
						1. Information Consumer Applications
							1. Development tools
							2. Brokering Applications
							3. Management Utilities
						2. Information Provider Applications

#### Assignment ####
1. Review chapter 43 & 44, on the TRM and III-RM: [http://pubs.opengroup.org/architecture/togaf9-doc/arch/chap43.html](http://pubs.opengroup.org/architecture/togaf9-doc/arch/chap43.html)
2. Don't spend much time on it

## Conclusion ##
### Booking the Exam ###
1. [prometric.com](prometric.com)
	1. Home page
		1. Search for open group
	2. Click Start here
	3. Locate a test center
	4. Next
	5. Policies
		1. Close book for part 1
		2. Open book for part 2
	6. Select TOGAF 9 Part 1
	7. Test sites
		1. Select and check if the site offers
		2. Select date (24 hours in advance)
	8. Reschedule/ Cancel an Exam (1 year validity)

#### Assignment ####
1. Book the exam

### What to Expect for Level 2 ###
1. It is a scenario based exam
	1. 8 questions (lengthy)
		1. Multiple answers (lengthy)
	2. 90 minutes
		1. over 10 minutes per question
		2. 60% to pass (24 out of 40 points)
		3. Partial points for close answers
	3. Open book exam
		1. Button can open TOGAF 9 spec (it is not an easy read)
			1. It is a quick look up only
	4. Part I is mandatory
	5. Price is same
2. Udemy course: TOGAF Architecture Framework Exam Preparation Level 2
	1. Joost Bleijenberg

### Finale ###
1. May need iterative process of reading and going through video lessons (going back and forth)

### More Resources ###
1. Official from the Open Group
	1. [TOGAF 9.1 Specification](http://pubs.opengroup.org/architecture/togaf9-doc/arch/)
		1. Root of all knowledge
	2. [TOGAF 9.1 Level 1 Certification Information](http://www.opengroup.org/togaf9/cert/docs/og91.html)
		1. Free PDF download with ADM and all phases
	3. [Official TOGAF 9.1 Part 1 Partice Test](https://www2.opengroup.org/ogsys/catalog/B092)
		1. Only 99 cents
	4. [Official TOGAF 9.1 Document Templates](https://www2.opengroup.org/ogsys/jsp/publications/PublicationDetails.jsp?catalogno=i093)
		1. Free downloads of some TOGAF documents
2. Third party YouTube Videos
	1. Orbus Software TV - [TOGAF Distilled](https://www.youtube.com/playlist?list=PLrAWWpbaj-7KM0uNkxKAf2t4Kzyqr_pYy)
	2. Enterprise Architects - [Introduction to Enterprise Architecture](https://www.youtube.com/watch?v=UnhC9xk9wiE)
3. Other Third-Party Sites
	1. TheOpenArch.com - [Three Free TOGAF 9 Foundation Sample Tests](http://theopenarch.com/81-tests/72-togaf-9-exam-tests.html)
		1. This is TOGAF 9 and not 9.1 (slight differences exist)
	2. StudyDroid.com - [This is a cool "flashcard" site](http://studydroid.com/)
		1. TOGAF flashcards
		2. Used 2 days before exam
			1. To identify gaps

## Bonus Lectures ##
### Q&A - Your Questions ###
### $117 per hour as an Enterprise Architect ###
1. [indeed.com](indeed.com) - what: togaf, where: India
	1. Senior technology architect - $117/hr ~ $200k per year
	2. Technical Architect, L3 (Government) - long contracts
		1. Needs government experience - $110/hour ~ $170k per year
2. [PayScale.com](PayScale.com)
	1. Avg: $103,138
	2. Max: $174,000
	3. Pace of increase is higher
3. [glassdoor.com](glassdoor.com)
4. CIO magazine
5. [wowjobs.com](wowjobs.com)
6. [salary.com](salary.com) 
7. The Open Group: List of members
	1. Places to look for work
		1. Dell
		2. Boeng
		3. Fujitsu
		4. Nasa
		5. Microsoft
	2. What to look for
		1. Look at career section
		2. Send resumes
		3. Talk to HR department
		4. Try to find people
8. Complementary skills (related skills can be learnt - ITIL ...)
	1. SQL server
	2. Data modeling
	3. Oracle
	4. SOA
	5. IaaS
	6. ...

### TOGAF 9.1 Cheat Sheet Download ###
1. Downloaded

### TOGAF Part 1 Study Course - Audio Files ###
1. [https://www.udemy.com/togaf-enterprise-architect/learn/v4/t/lecture/1948494?start=0](https://www.udemy.com/togaf-enterprise-architect/learn/v4/t/lecture/1948494?start=0)

### TOGAF Part 1 Study Course - PDF Files ###
1. Downloaded

## Preliminary Phase In Detail: Step by Step ##
### Phases and Steps Bonus Videos ###
1. These are in-depth and not essential to pass the exam
2. ADM phase by phase and step by step

### Preliminary Phase, Step 1 ###
1. Preliminary Phase
	1. Preparation and initiation activities
	2. Defining "the enterprise"
	3. Choosing frameworks
	4. Evaluate enterprise maturity and capability
	5. Defining architecture principles
2. Step 1: Define the scope of the enterprise organizations impacted
	1. To know what exactly our job is going to be
		1. Define Core enterprise (Units) - which are most affected and achieve most value
			1. Technology groups
			2. Developments groups
			3. ...
		2. Define Soft enterprise (Units) - which see the change but are not directly affected
			1. People who may use the system but the system itself is not changing - need to make them aware
		3. Define Extended Enterprise (Units) - Which are outside the scoped enterprise that will see the change
			1. May be aware - may be the order form is a little different
		4. Define Communities (Enterprises) - These are stakeholders (who are affected) who can be in groups
			1. Customers
			2. Sales staff
			3. Vendors
			4. Suppliers
			5. ...
		5. Governance - legal frameworks, geographies, etc...
			1. Are the units across states? across countries
				1. Are there different laws
				2. Privacy laws
				3. Certain laws affect it

### Preliminary Phase, Step 2 ###
1. Step 2: Confirm **Governance** and support frameworks
	1. Determine how architecture documents are brought under governance
		1. Come up with documents
		2. They are going to assess if the architecture is worth being done? Whether it kicks off a new ADM cycle? Whether they fall into architecture principles? Whether logging will be done?
	2. Process that we are about to undertake, ADM, architecture, definitions, artifacts can be brought under governance
		1. TOGAF has a governance model
		2. We may have an existing governance
	3. Likely require changes to how governance works in the organization
	4. Assess the current governance models
	5. Establish proper governance

### Preliminary Phase, Step 3 ###
1. Step 3: Define and establish **architecture team**
	1. Critical in startup phase
		1. Business experts
		2. Software experts
	2. Determine existing enterprise and business capabilities (in the areas)
	3. Maturity assessments
		1. What kind of architecture do we want?
		2. What kind of team do we want?
		3. How much are we willing to spend?
		4. Size of the team
	4. Identify gaps (from where we are to where we want to be)
	5. Allocate key roles (architecture team, governance team, ...)
		1. Individual people
			1. Who is going to lead the architecture
			2. Who is business architect
			3. Who is technical architect
			4. ...
	6. Requests for change of existing processes
		1. The existing processes must be documented
		2. We need to sell by showing the need to modify the way we do things
		3. Assess the impacts of ongoing projects on the proposed architecture
		4. Find areas of interest and conflict of interests
		5. Determine constraints on architecture work
			1. IBM solutions are used with long contracts
			2. Budget
			3. Time
			4. New Law
		6. Review and agree with sponsors and board
		7. Assess budget for architecture work
			1. Estimates are required

### Preliminary Phase, Step 4 ###
1. Step 4: Identify and establish **architecture principles**
	1. Principles are the rules you live by when designing an architecture
		1. Things that do not change (thoughtfully come up with this)
		2. OS (uniform across servers)
	2. They don't change often
	3. They set the foundation for architecture governance
		1. Changing a few servers to latest OS is not allowed
	4. Permission to say no to things that fall outside the principles

### Preliminary Phase, Step 5 ###
1. Step 5: **Tailor TOGAF** and other frameworks
	1. TOGAF is designed to be modified to the needs of the enterprise
	2. Modify terminology as needed, if you already have existing terms for things
		1. Can modify TOGAF and tailor it
			1. Tailored TOGAF uses company's terms
	3. Modify the ADM process to integrate into other existing processes in your enterprise
		1. Kinds of processes:
			1. ADM process say
			2. Project management processes
			3. Operation processes
			4. ...
		2. Suppose we want to setup a kickoff meeting as early as phase E and not phase F involving all stakeholders
	4. Modify the Architecture Content Framework templates and organization as needed
		1. Tweeking existing templates is possible (as necessary only)

### Preliminary Phase, Step 6 ###
1. Step 6: Implement **architecture tools**
	1. Based on the scale and architecture maturity of your organization
		1. Different tools for different needs
		2. Open tools vs proprietary tools (bigger organizations)
	2. May want to get software tools to help organize the architecture repository
		1. Searching for tools
		2. Demo
	3. Could be as simple as MS Office, Sharepoint, or as sophisticated as specialized tools for enterprise architecture
		1. Simple tools like Wiki
		2. Sophisticated tools for TOGAF
		3. Weak or two process ...
2. Summary:
	1. Preliminary phase involves setup
		1. Defining what we want to be
		2. Defining what the target maturity is
		3. Defining scope
		4. Definging the gaps
		5. Governance in place
		6. Setting up software
		7. Setting right people in right roles

## Phase A In Detail: Step by Step ###
### Phase A, Architecture Vision, Step 1 ###
1. Architecture Vision (Phase A)
	1. Develop a high-level vision to be delivered
	2. Obtain approval for a Statement of Architecture Work
		1. Define scope
		2. Estimate resources needed
		3. Develop a roadmap and schedule
		4. Define KPIs and metrics
		5. Communications plan
2. Step 1: Establish **architecture project**
	1. A project within the existing project management framework of the enterprise
		1. Timelines
		2. Budget
		3. Project manager
		4. Steps
		5. Frameworks (scrum, kanban, ...)
	2. Planned and managed using accepted practices
	3. Secure recognition and endorsement for the project
		1. From stakeholders
			1. IT group impacted
			2. Sales group impacted

### Phase A, Architecture Vision, Step 2 ###
1. Step 2: **Identify stakeholders**, concerns and business requirements
	1. Requirements gathering phase
		1. Interview people
		2. BA like
		3. Find out problems
		4. Dig down deeper on problems
	2. Identify the key stakeholders and their concerns, using Stakeholder Management
	3. Develop a stakeholder map, showing which stakeholders are involved, their level, and their key concerns
		1. Map those who need regular communication
		2. Those that needs only email
		3. Those whose concerns can be documents but need not be solved (less important)
	4. Which architecture views and viewpoints need to be developed
		1. They are different ways of looking at the architecture
			1. IT department
			2. Sales
			3. Executive team
			4. Finance team (profits, losses)
		2. Information presented must be specific to their view

### Phase A, Architecture Vision, Step 3 ###
1. Step 3: Confirm **business goals**, drivers and constraints
	1. Identify the business goals and strategic drives of the organization
		1. Where does the business want to go (1 year, 3 years, 5 years ...)
		2. What are the growth areas
		3. Where does it see doubling of growth
		4. Where does it see slowdown
		5. Architects have to see how the business is growing and accomodate for that
		6. We are invited to solve certain problems
			1. What are the drivers cousing them to say, we need a better architecture now
				1. May be a disaster
				2. Complaints from customers
				3. Business stalled
				4. Expenses increased
	2. Ensure the existing definitions are up to date and clarify any vague parts
	3. Define constraints that must be dealt with (i.e time, budget, resources)
		1. Break down on paper and understand what are the constraints that we are dealing with
			1. Contract that has got locked for next x years
			2. Big project that kicks off and we need to finish before then
			3. Time of the year (festival season)
		2. Accomodate for those

### Phase A, Architecture Vision, Step 4 ###
1. Step 4: Evaluate **business capabilities**
	1. There are two: One, ability of the enterprise to develop and use the architecture
	2. And baseline and target capability level of the enterprise itself
		1. If business is struggling with finances
		2. If we need to deploy quickly
		3. History of failed projects
	3. Identify any gaps in architecture capability, and go back to prelim phase if needed to address
		1. We may need proper BA
		2. Iterate through ADM (preliminary phase)
			1. Go back
	4. Gaps or limitations in the enterprise itself inform the design of the architecture
		1. Focus organization on single change
		2. Build up some successes
		3. Then increase the number of projects
		4. Size of work packages

### Phase A, Architecture Vision, Step 5 ###
1. Step 5: Assess **readiness** for transformation
	1. Use Business Transformation Readiness Assessment to evaluate the organization's ability to adapt to changes, like the ones to be proposed
		1. Identify risks and communicate them
		2. Get executives involved
	2. The result are part of the capability (step 4) and inform the architect function when designing target architecture and identifying risks
		1. Need to work around people and problems

### Phase A, Architecture Vision, Step 6 ###
1. Step 6: Define **scope** (what is going to be in the baseline architecture and what is out)
	1. IT group: How things are tracked, deployed, compliance with government
	2. Sales functions and customer service functions in next rounds
	3. Points
		1. This is the scope of the architecture effort itself: what is in and what is out
		2. Baseline and target are often different levels of detail; target more detailed
			1. Baseline can be kept light
			2. Target architecture can be deep
		3. Covers breadth of the enterprise, level of detail required, partitioning, the architecture domains, the time period to cover, existing architecture assets that can be leveraged
			1. How far of the enterprise is this project going to cover
			2. Partitioning: One architecture group working on this and other working on that
				1. We start off together and we separate and then merge them off together
				2. If application architecture, then we don't have to go very deep into business domain
			3. If long term architecture plan, come up with transition architectures (target is very massive may be)

### Phase A, Architecture Vision, Step 7 ###
1. Step 7: Confirm **architecture principles**, including business principles
	1. Ensure that existing definitions are current
	2. Clarify any ambiguity
	3. Secure endorsement for new items
		1. From right people

### Phase A, Architecture Vision, Step 8 ###
1. Step 8: Develop architecture **vision**
	1. Based on the stakeholder concerns, business capability, scope, constraints and architecture principles
	2. Construct high-level (version 0.1) view of the Baseline and Target Architectures
		1. Very high level
	3. For instance, draw simple solution concept diagrams
		1. Problems and high level solutions
	4. The first, very high-level definitions of the baseline and target environments
		1. Technology hosting say
		2. Find a system that scales with demand say

### Phase A, Architecture Vision, Step 9 ###
1. Step 9: Define the target **architecture value** and KPIs
	1. Develop the business case (for architecture and changes required)
		1. Make an easy case for spending money to make the changes
		2. What the cost is going to be and what the savings are going to be
	2. Review the value propositions with each of the stakeholder groups
		1. We are dealing with executives, the sales group, IT group, customer service
			1. This plan is going to save you money
			2. This is going to save you customer time
			3. It is going to make your jobs easier
			4. It is going to turn around response time
	3. Define the performance metrics and measures to be built in
		1. Need to measure metric
			1. Current value is x then future value is 1/2 x ...
			2. Start to get the metrics atleast
	4. Assess business risk
		1. Risk management in TOGAF

### Phase A, Architecture Vision, Step 10 ###
1. Step 10: Identify **transformation risks** and mitigation activities
	1. Identify any risks associated with the architecture vision and assess initial level of risk
		1. What is the worst case scenario
		2. How likely is it going to occure
		3. What is the mitigation strategy
	2. TOGAF defines two levels of risk that should be considered
		1. Initial level of Risk: assessment **prior** to implementing mitigations
			1. Example order entry system
				1. Risk: Orders can get lost, customer records can get misplaced
				2. Mitigation: Proper backup, run systems in parallel, pilot program (prove system is fail proof)
		2. **Residual Level of Risk:** assessment **after** implementing mitigations
	3. Risk mitigation activities can optionally be included in the Statement of Work
		1. Like pilot projects ...

### Phase A, Architecture Vision, Step 11 ###
1. Step 11: Develop **Statement of Architecture Work**, secure approval
	1. Assess the work products that are required to be produced by the architecture project
		1. Deliverables
			1. Artifacts
			2. Documents
	2. Ensure that:
		1. Performance metrics are built into the work products
		2. Specific performance related work products are available
	3. Identify new work products that will need to be created
		1. Documentation that does not exist yet may be required
	4. Identify existing work products (i.e. building blocks) that will need to be changed
		1. Technology changes
	5. Identify the impact of change on other work products
	6. Determine which architecture domains should be developed (BDAT), to what level of detail, and which views
		1. If IT focused project
			1. Only underlying technology (Technology domain and light on business)
		2. Views: targetted at specific stakeholders
	7. Assess the resource requirements to perform the work in the time req'd
	8. Estimate resources needed, develop roadmap, and schedule
		1. 2 months, 4 months, ... like a normal project
	9. Define performance metrics to be met during this cycle of the ADM
	10. Develop communications plan
		1. Certain stakeholders need frequent communication
		2. Certain fewer times
	11. Review and agree the plans with the sponsors, and secure formal approval for the statement of Architecture Work
	12. Gain sponsor's sign-off to proceed

## Phase B In Details: Step by Step ##
### Phase B, Business Architecture, Step 1A ###
1. Business Architecture (Phase B)
	1. B in BDAT
	2. Develop the baseline business architecture v1.0 (could be bottom-up, based on what exists)
	3. Develop the target business architecture v1.0 (top-down normally)
	4. Identify gaps between baseline and target
2. Step 1: Select **Reference Models, Viewpoints, and Tools**
	1. Select relevant business architecture reference models and patterns from the architecture repository based on the known drivers and concerns
	2. Select relevant business architecture viewpoints to be used to demonstrate later how their concerns are being addressed in the architecture
		1. For demonstrating concerns to stakeholders being addressed
			1. CFO: His concerns (financials)
	3. Identify appropriate tools and techniques for capturing, modeling, analyzing, and documenting the architecture
		1. Evernote
		2. Microsoft Word
		3. IBM Rational
		4. ...
	4. Step 1.1: Determine overall **modelling** process
		1. The level of detail of this will be highly dependent on the standards of the organaization. Yours might require extensive analysis and modelling, including use-cases, activities and classes.
			1. UML
			2. ...
	5. Step 1.2: Identify required **service granularity** level, boundaries and contracts
		1. **Micro-level functions:** has boundaries, without specific governance
			1. Just a process; like your process for sending out monthly invoices
				1. Has specific start and specific end
				2. We know whose job it is
		2. **Services:** has boundaries and specific governance
			1. Customer wants a website built
				1. Project starts and ends
				2. How to bill the customer
				3. We have price list
				4. We have processes in place
		3. **Macro-level functions:** has no boundaries, but specifically governed
			1. Human resources function (whole department)
				1. Crosses the entire company
				2. Involved in everything
					1. Management of employees
					2. Raises
					3. Benefits
		4. Services are business functions that have a service contract.
	6. Step 1.3: Identify required **catalogs** of business building blocks
		1. Inventories of the core assets of the business
		2. Raw material for metrices and views
		3. Such as:
			1. Organization/ actor catalog
			2. Location catalog
			3. Process/ event/ control/ product catalog 

### Phase B, Business Architecture, Step 1B ###
1. Step 1.4: Identify required **matrices**
	1. Matrices show the relationships between things
	2. Raw material for the development of views
	3. Such as:
		1. Business interaction matrix
		2. Actor role matrix
2. Step 1.5: Identify required **diagrams**
	1. Diagrams present information from a set of viewpoints
	2. Such as:
		1. Use-case diagram
		2. Process flow diagram
		3. Functional decomposition diagram
		4. Organization decomposition diagram
	5. Different diagrams for different stakeholders
3. Step 1.6: Identify **types of requirements** to be collected
	1. Time to dig into the actual business requirements
	2. The requirements are, what would the target architecture have to do to satisfy the concerns of the stakeholders
	3. These requirements often get reflected in the data, application and technical requirements too
	4. Requirements: What the target architecture have to do, in order the satisfy the concerns of the stakeholders

### Phase B, Business Architecture, Step 2 ###
1. Step 2: Define and Develop **Baseline** Business Architecture Description
	1. Baseline is what currently exists
		1. Business architecture
		2. Lines of businesses we are in
		3. The services
		4. The way we interact with customers
		5. The way businesses pass data between each other
2. Bottom-up
	1. Go out and talk to people
	2. Research
	3. Investigate
	4. Contact IT and send a list of it
	5. Contact each department and what software do they use
	6. Figure out everything that currently exists
3. The baseline description of the existing business architecture to the level needed
	1. We don't have to go to the maximum level of detail on every single domain
		1. Expensive
		2. May take too much time
	2. The company might have standards on this
4. Depends how much will be carried over to target architecture

### Phase B, Business Architecture, Step 3 ###
1. Step 3: Develop **Target** Business Architecture Description
	1. The target description of the business architecture to the level needed
	2. To support the architecture vision
	3. Use models developed in Step 1 to develop new target architecture content

### Phase B, Business Architecture, Step 4 ###
1. Step 4: Perform **gap analysis**
	1. Validate the architectures, including the different views against each other
		1. Difference between baseline and target
			1. What are added in target
		2. Sanity check
		3. Different views are not saying different things
		4. Facts
		5. All views should be in sync (relevant parts)
	2. Ensure the architecture supports all principles, objectives and constraints
		1. Understand them
			1. Constraints: time, money
		2. Principles
			1. Way we do business
	3. Test models for completeness against requirements
		1. time, error rates ... are covered (against requirements)
	4. Identify gaps between the target and baseline
		1. List out the differences

### Phase B, Business Architecture, Step 5 ###
1. Step 5: Identify **candidate roadmap** components
	1. Extract the key differences from the gap analysis, and those become features to be added to the architecture over time
		1. Transition and put them in work packages
	2. A business roadmap is required to prioritize activities over the coming phases
		1. Start building the roadmap
			1. Important
			2. Nice to have
			3. Side benefit things
	3. Used to feed into the Opportunities and Solutions phase
		1. Pull the roadmaps together into one consolidated roadmap

### Phase B, Business Architecture, Step 6 ###
1. Step 6: Resolve **impacts**
	1. Understand wider implications
		1. Busy people
		2. Multiple projects
		3. Project managers are busy
		4. If we remove call center it may impact other project
	2. Does it impact other architectures outside the scope?
	3. Has there been any recent changes outside that need to be accounted for with this?
		1. New technology purchased
		2. New subsidiary (merged in)
	4. Is there an opportunity to share this work with other architectures outside scope?
		1. Other departments can benefit
	5. Does it impact other projects already planned or underway? Or vice versa?
		1. Already development? Any impact on them or on us?

### Phase B, Business Architecture, Step 7 ###
1. Step 7: Conduct formal **stakeholder review** - Go back to stakeholders - showcase what you have done
	2. Ensure the architecture confirms to the original purpose of the project and the Statement of Architecture Work if necessary
	3. Present to stakeholders
		1. Many meetings
			1. Rethink assumptions
			2. Quesitions from stakeholders and come up with answers

### Phase B, Business Architecture, Step 8 ###
1. Step 8: Finalize **architecture**
	1. Going back to the architecture repository and checking if there are standards for the new building blocks
		1. Figure out if there are other building blocks that can be pulled into it
	2. Complete all documentation
	3. Cross-check against business goals
		1. Revenue
		2. Cutting costs
	4. Finalize all work products
		1. Lists
		2. Catalogs

### Phase B, Business Architecture, Step 9 ###
1. Step 9: Create **architecture defintion document**
	1. Document rationale for building block decisions
		1. Why are the departments where there are?
	2. Prepare business architecture section of architecture definition document: (all these go into business documents)
		1. Business footprint
		2. Description of business functions
		3. Management footprint
		4. Standards, rules and guidelines
		5. Skills matrix and job descriptions
2. Phase B is iterative

## Phase C (Data) In Detail: Step by Step ##
### Phase C, Data Architecture, Step 1 ###
1. Infrastructure systems architecture = data architecture + application architecture
	1. No separate steps for information systems architecture
2. Data Architecture (Phase C)
	1. D in BDAT
	2. Develop the baseline data architecture v1.0
	3. Develop the target data architecture v1.0
	4. Identify gaps between baseline and target
3. Steps:
	1. Step 1. Select **Reference Models, Viewpoints, and Tools**
		1. Select relevant data architecture models and patterns from the architecture repository based on the known drivers and concerns
		2. Select relevant data architecture viewpoints to be used to demonstrate later how their concerns are being addressed in the architecture
		3. Identify appropriate tools and techniques for capturing, modeling, analyzing, and documenting the architecture
			1. Data modeling tools like
				1. Classes and diagrams
				2. Data flow charts
	3. Data architecture deals with how data flows between departments, between applications, technology people are interested in (technology people and security team may be very interested in this, business team needs to atleast understand that people in the department have access to these elements of a customer record and not that element - restrictions and constraints)
	4. Step 1.1: Determine overall **modelling** process
		1. Level of detail will depend on the standards of the organization. Yours might require extensive analysis and modelling, including use-cases, activities and classes
			1. Data is usually well documented in an organization (stored in databases) - print out class diagrams and data diagrams
			2. Reference is there so easier
	5. Step 1.2: Identify required **catalogs** of data building blocks
		1. Take business service/ information diagram from business architecture
		2. Trace back from application to business function to data entity
		3. Inventories of the data needed to be in place to support the vision
		4. Raw material for matrices and views
		5. Such as:
			1. Data entity/ data component catalog
	6. Step 1.3: Identify requierd **matrices** (spreadsheets)
		1. Matrices show the relationships between things
		2. Raw material for the development of views
		3. Such as:
			1. Data entity/ business function matrix
			2. Business services/ information matrix
			3. Application/ data matrix
	7. Step 1.4: Identify required **diagrams**
		1. Diagrams present information from a set of viewpoints
		2. Such as:
			1. Conceptual data diagram
			2. Logical data diagram
			3. Data security diagram
			4. Data migration diagram
			5. Data lifecycle diagram
	8. Step 1.5: Identify **types of requirement** to be collected
		1. Time to dig into the actual data requirements
		2. Provides input to application and technology domains
		3. Identify requirements that should be met by the architecture
			1. Requirements coming from business and coming from the stakeholders

### Phase C, Data Architecture, Step 2 ###
1. Step 2: Develop **Baseline** Data Architecture Description
	1. The baseline description of the existing data architecture to the level needed
		1. Understand data layer and how it is handled may be wrapped in security etc...
	2. Depends how much will be carried over to target architecture
		1. If data is not going to change too much (concept of customer, fields, product catalogue)
			1. We may not have to do much
	3. Identify the relevant data architecture building blocks, if exists in the architecture repository
	4. Use models developed in Step 1 to develop baseline architecture content
		1. Grab the models and find the baseline

### Phase C, Data Architecture, Step 3 ###
1. Step 3: Develop **Target** Data Architecture Description
	1. The target description of the data architecture to the level needed
		1. New applications, lot of data changes, new web services, new windows services, get very detailed with the stuff
	2. To support the architecture vision
	3. Identify the relevant data architecture building blocks, if exists in the architecture repository
	4. Use models developed in Step 1 to develop new target architecture content

### Phase C, Data Architecture, Step 4 ###
1. Step 4: Perform **gap analysis**
	1. Validate the architecture, including the different views against each other
		1. Compare the baseline against the target architecture
		2. Making sure it is complete and not missing data, objects and relevant entities within any of the diagrams
		3. That gives full picture and not be blind to certain things
	2. Ensure the architecture supports all data principles, objectives and constraints
		1. How atomic the data structures are going to be
		2. SOA
		3. How things are served by web-services
		4. Design and definitions should follow the objectives and principles
	3. Test models for completeness against requirements
		1. Compare against the requirements
		2. Make sure that you have covered every requirement
			1. Plans for new apps coming in
			2. Plans for new business
	4. Identify gaps between the target and baseline
		1. What is the difference between baseline and target
			1. New tables?
			2. Web service between systems?

### Phase C, Data Architecture, Step 5 ###
1. Step 5: Identify **candidate roadmap** components
	1. Extract the key differences from the gap analysis, and those become features to be added to the architecture over time
	2. A data roadmap is required to prioritize activities over the coming phases
	3. Used to feed into the Opportunities and Solutions phase
2. Pulling out gaps and listing them (Candidate roadmap components)

### Phase C, Data Architecture, Step 6 ###
1. Step 6: Resolve **impacts**
	1. Understand wider implications
		1. If distributing data (each regional office has copies of data instead of storing in warehouse in head office)
			1. Security implications
			2. Partitioning of applications
			3. Can application handle local data store
			4. Are we going to feed into head office and feed it out to regions? Fed into local data ware house?
				1. How does it impact other parts
	2. Does it impact other architecture outside the scope?
	3. Has there been any recent changes outside that need to be accounted for with this?
		1. Has there been outside that need to be accounted for?
		2. Other projects, more tables, upgrade to next version, decisions ...
		3. Is there an opportunity to share this work with other architectures outside scope?
			1. Data diagrams, data building blocks, solution building blocks (sharing with other projects)

### Phase C, Data Architecture, Step 7 ###
1. Step 7: Conduct formal **stakeholder review**
	1. Ensure the architecture confirms to the original purpose of the project and the Statement of Architecture Work if necessary
		1. Need for services, systems to talk to each other, data to live, access to data all covered
	2. Present to stakeholders
		1. Get their feedback
		2. May be we don't have answers to all of their questions
		3. May need to tweek something
		4. Get approval

### Phase C, Data Architecture, Step 8 ###
1. Step 8: Finalize **architecture**
	1. Going back to the architecture repository and checking if there are standards for the new building blocks
	2. Complete all documentation
		1. Building blocks
	3. Cross-check against business requirements
	4. Finalize all work products

### Phase C, Data Architecture, Step 9 ###
1. Step 9: Creation of **data definition document**
	1. Document rationale for building block decisions
		1. Why are we putting things there, why is order entry system say contain those components
	2. Prepare data architectuer section of architecture definition document:
		1. Business data model
		2. Logical data model
		3. Data management process
		4. Data entity/ business function matrix

## Phase C (Application) In Detail: Step by Step ##
### Phase C, Application Architecture, Step 1 ###
1. Application Architecture (Phase C)
	1. A in BDAT
	2. Develop the baseline application architecture v1.0
	3. Develop the target application architecture v1.0
	4. Identify gaps between baseline and target
2. Step 1: Select **Reference Models, Viewpoints, and Tools**
	1. Select relevant application architecture reference models and patterns from the architecture repository based on the known drivers and concerns
	2. Select relevant application architecture viewpoints to be used to demonstrate later how their concerns are being addressed in the architecture
		1. Choose right views - how software talks to each other (diagrams)
	3. Identify appropriate tools and techniques for capturing, modeling, analyzing, and documenting the architecture
		1. Keep it consinstent with Business and Data techniques
			1. Using same tool for all BDAT
			2. Using same documenting repository for all BDAT
	4. Step 1.1: Determine overall **modelling** process
		1. The level of detail of this will be highly dependent on the standards of the organization. Yours might required extensive analysis and modeling, including use-cases, activities and classes.
	5. Step 1.2: Identify required **catalogs** of application building blocks
		1. Catalogs are hierarchical in nature: (catalogs go into various matrices and views)
			1. Logical > physical > service
		2. Raw material for matrices and views
		3. Such as:
			1. Application portfolio catalog
			2. Interface catalog
	6. Step 1.3: Identify required **matrices**
		1. Matrices show the relationships between things
			1. Example: Mapping applications to business services they deliver
			2. Example: Identify user and organizational dependencies
			3. Example: Matrices in TOGAF:
				1. Application/ organization matrix
				2. ...
		2. Raw material for the development of diagrams
		3. Map applications to business services (from business architecture)
		4. Identify user and organizational dependencies
		5. Such as:
			1. Application/ organization matrix
			2. Role/ application matrix
			3. Application/ function matrix
	7. Step 1.4: Identify required **diagrams**
		1. Diagrams present information from a set of viewpoints
		2. Once functionality is known, think about configuration and options
		3. Such as:
			1. Application communication diagram
			2. Application and user location diagram
			3. Enterprise manageability diagram
			4. Process/ application realization diagram
			5. Application migration diagram, etc
	8. Step 1.5: Identify **types of requirement** to be collected (actual application requirements)
		1. Time to dig into the actual application requirements
		2. Provides input to data and technology domains
			1. If we use SAP say, that may have implications on data design (SAP has a certain way of modeling data) which may in-turn have implications on technology - servers, and other infrastructure required by SAP
		3. Identify requirements that should be met by the architecture

### Phase C, Application Architecture, Step 2 ###
1. Step 2: Develop **Baseline** Application Architecture Description
	1. The baseline description of the existing application architecture to the level needed
	2. Depends how much will be carried over to target architecture
		1. May be worried about apps that are going to live
	3. Identify the relevant application architecture building blocks, if exists in the architecture repository
	4. Use models developed in Step 1 to develop baseline architecture content
		1. Use models to develop

### Phase C, Application Architecture, Step 3 ###
1. Step 3: Develop **Target** Application Architecture Description
	1. The target description of the application architecture to the level needed
		1. To be developed to the level that the enterprise needs
		2. If there are standards in the company follow those
		3. If we are researching and finding applications that requires decision making then do a lot of documentation
			1. Define the requirements
			2. Decide if performance or cost or throughput or servers that we need to pick and choose, we can do it at this stage
		4. To support the architecture vision, target business architecture, and target data architecture

### Phase C, Application Architecture, Step 4 ###
1. Step 4: Perform **gap analysis**
	1. Validate the architectures, including the different views against each other
		1. All views must be consistent
			1. Nothing should be missing
			2. Firewalls
	2. Ensure the architecture supports all principles, objectives and constraints
		1. Ensure they are consistent
	3. Test models for completeness against requirements
		1. Does the application architecture support the business architecture?
	4. Identify gaps between the target and baseline
		1. One app installation and removing 20 others
		2. Adapters need to be created
		3. Implications of moving to the target architecture

### Phase C, Application Architecture, Step 5 ###
1. Step 5: Identify **candidate roadmap** components
	1. Extract the key differences from the gap analysis, and those become features to be added to the architecture over time
		1. We have not decided yet whether we are going to do all at once or step by step
	2. An application roadmap is required to prioritize activities over the coming phases
	3. Used to feed into the Opportunities and Solutions phase
		1. We are not sure even the file formats are the same (defining impacts is next)
		
### Phase C, Application Architecture, Step 6 ###
1. Step 6: Resolve **impacts**
	1. Understand wider implications
		1. If we are shutting down or upgrading applications
		2. Moving to new version doesn't support certain features
	2. Does it impact other architectures outside the scope?
	3. Has there been any recent changes outside that need to be accounted for with this?
	4. Is there an opportunity to share this work with other architecture outside scope?
		1. If we install a big work package, then other departments can benefit
	5. Does it impact other projects already planned or underway? Or vice versa?

### Phase C, Application Architecture, Step 7 ###
1. Step 7: Conduct formal **stakeholder review** - to present and get sign off
	1. Ensure the architecture confirms to the original purpose of the project and the Statement of Architecture Work if necessary
		1. Saving x amount of dollars
		2. Increase revenue by x percent
		3. How is what we have so far confirming with that?
			1. if not stop at this point
	2. Does business and data architectures need to change due to this layer
		1. Purchasing enterprise systems
			1. Needs x and y
		2. How data gets pushed around
		3. Is the data architecture possible or is it wise?
		4. In the business process, we want to give morgage information instantly (people are waiting at counter)
			1. Application layer:
				1. Delays to get score
					1. Introduced by external systems
					2. Dependence on communication layers
			2. Not feesible may be
	3. Identify constraints on the technology architecture
		1. Talk to tech architect (and talk to say we need to run for the following businesses)
	4. Present to stakeholders
		1. Take documents that they can understand
		2. Present the viewpoints
		3. Take their viewpoints

### Phase C, Application Architecture, Step 8 ###
1. Step 8: Finalize **architecture**
	1. Going back to the architecture repository and checking if there are standards for the new building blocks
		1. Do the building blocks have industry or standards that are to the left side of the continuum (generic things that can be used instead of custom)
	2. Complete all documentation
		1. All documentation and architecture definition and requirements needs to be finalized
	3. Cross-check against business requirements
		1. Check if every business requirement is met
	4. Finalize all work products
		1. Diagrams
		2. Matrices

### Phase C, Application Architecture, Step 9 ###
1. Step 9: Create **architecture definition document**
	1. Document rationale for building block decisions
		1. Certain decisions
			1. Internally
			2. Overseas
		2. How things are redisigned
	2. Prepare application architecture section of architecture definition document

## Phase D In Detail: Step by Step ##
### Phase D, Technology Architecture, Step 1 ###
1. Technology Architecture (Phase D)
	1. T in BDAT
	2. Develop the baseline technology architecture v1.0
	3. Develop the target technology architecture v1.0
	4. Identify gaps between baseline and target
2. Step 1: Select **Reference Models, Viewpoints, and Tools**
	1. Select relevant technology architecture reference models and patterns from the architecture repository based on the known drivers and concerns
		1. Based on business drivers
	2. Select relevant technology architecture viewpoints to be used to demonstrate later how their concerns are being addressed in the architecture
		1. Technology people are concerned about how does it impact servers, networks, ...
	3. Identify appropriate tools and techniques for capturing, modeling, analyzing, and documenting the architecture
		1. There are tools that map out where the firewalls are where the servers are what the IP addresses are, what applications are running on those servers ...
			1. Network people may have this map
3. Step 1.1: Determine overall **modelling** process
	1. The level of detail of this will be highly dependent on the standards of the organization. Yours might require extensive analysis and modeling, including use-cases, activities and classes
		1. Say most of the changes will be focussed on applications and not on technology (no new servers, no new networks, no new connections, ...)
4. Step 1.2: Identify required **catalogs** of technology building blocks
	1. Catalogs are hierarchical in nature:
		1. Logical > physical > service
	2. Raw material for matrices and views
		1. Such as
			1. Technology standards
			2. Technology portfolio
5. Step 1.3: Identify required **matrices**
	1. Matrices show the relationship between things
	2. Raw material for the development of diagrams
		1. Such as:
			1. Application/ technology matrix (only matrix recommended by TOGAF)
				1. How technology supports applications
6. Step 1.4: Identify required **diagrams**
	1. Diagrams present information from a set of viewpoints
	2. Once functionality is known, think about configuration and options
		1. Such as:
			1. Environment and locations diagram
			2. Platform decomposition diagram
			3. Processing diagram
			4. Networked computing/ hardware diagram
			5. Communications engineering diagram
7. Step 1.5: Identify **types of requirement** to be collected
	1. Time to dig into the actual technology requirements
	2. Take the catalogs, matrices and diagrams previously developed
	3. Identify requirements that should be met by the architecture
		1. Anything that technology team/ group needs to do that this new architecture is telling them to do
8. Step 1.6: Select **Services**
	1. Services are business functionality available to applications across your enterprise, supported by the IT department or outside vendor
	2. Email service, printing service, authentication, credit card processing etc.
		1. As a business unit, you do not develop your own emailing capability (calling smtp or other services)
		2. As a business unit, we may not be building a credit card processing application (tie into existing one)
	3. Do some things make sense to become services that are commonly managed by the business units?
		1. What services does the company need to provide to the business units
		2. Things that business units are doing inside their own applications that can be centralized and provided to everybody

### Phase D, Technology Architecture, Step 2 ###
1. Step 2: Develop **Baseline** Technology Architecture Description
	1. The baseline description of the existing technology architecture to the level needed
		1. What servers, networks, firewalls already exist?
			1. Technology teams are good at documenting what they have installed
	2. Depends how much will be carried over to target architecture
		1. How much the technology needs to be changing
			1. If tech is not going to be changing or if there are no new requirements or are minimal, no much work on baseline technology architecture
	3. Identify the relevant technology architecture building blocks, if exists in the architecture repository
		1. Pull ABBs and SBBs that relate to technology architecture
	4. Use models developed in Step 1 to develop baseline architecture content
		1. Document

### Phase D, Technology Architecture, Step 3 ###
1. Step 3: Develop **Target** Technology Architecture Description
	1. The target description of the technology architecture to the level needed
		1. If there are very few changes, it is going to match the baseline architecture
		2. If there are radical changes, then get into a lot of detail about what's changing, what servers we need, how that's going to work
	2. To support the architecture vision, target business architecture, and target data architecture
	3. Identify the relevant technology architecture building blocks, if exists in the architecture repository
		1. We may have to pull out BBs
		2. We may have to build BBs if they don't exist
	4. Use models developed in Step 1 to develop new target architecture content
2. We have to be talking to relevant stakeholders
	1. Develop the architecture to a level that we can explain to people

### Phase D, Technology Architecture, Step 4 ###
1. Step 4: Perform **gap analysis**
	1. Validate the architectures, including the different views against each other
		1. Looking at them from different views (business view, technology view, stakeholder views) to make sure it is consistent
	2. Ensure the architecture supports all principles, objectives and constraints
		1. Not recommending technologies that go against the technology principles
	3. Test models for completeness against requirements
		1. Make sure the domains cover those requirements
		2. What servers support that and what processes are needed for that
	4. Identify gaps between the target and baseline
		1. Gap analysis that togaf describes in Part 3, chapter 27 of togaf spec
			1. Tells how to identify the gaps, differences and document those

### Phase D, Technology Architecture, Step 5 ###
1. Step 5: Identify **candidate roadmap** components
	1. Extract the key differences from the gap analysis, and those become features to be added to the architecture over time
		1. The previous activities feed into technology roadmap
			1. Those are features going to be developed over time
	2. A technology roadmap is required to prioritize activities over the coming phases
		1. If we need more environments and if we need multiple of them
			1. DEV, QA, STAGE, PROD
		2. They don't have to be provided at the same time
			1. roadmap can have timelines
	3. Used to feed into the Opportunities and Solutions phase
		1. Opportunities and Solutions: Turning roadmap into work packages

### Phase D, Technology Architecture, Step 6 ###
1. Step 6: Resolve **impacts** (across architecture landscapes)
	1. Understand wider implications
		1. How does it impact the wider business, what kind of implications does it have?
	2. Does it impact other architecture outside the scope?
		1. Is anything we are doing impacting the stuff that is outside our scope?
		2. Bring those people into the loop
	3. Has there been any recent changes outside that need to be accounted for with this?
		1. Some other project has gone live
			1. They might have cool features and we might start using them
		2. Own internal cloud environment
			1. It is a new option that we can take advantage of
	4. Is there an opportunity to share this work with other architectures outside scope?
		1. May be we can have this as a service that the entire company enjoys and what other opportunities are available for sharing
	5. Does it impact other projects already planned or underway? Or vice versa?
		1. Business may not stop other projects while in this process
		2. Keep track of projects going live soon, or in the near future
			1. Is anything that we are doing is impacting that?
				1. If a project that is going needs complete re-vamp then there is no point going with the release

### Phase D, Technology Architecture, Step 7 ###
1. Step 7: Conduct formal **stakeholder review**
	1. Ensure the architecture confirms to the original purpose of the project and the Statement of Architecture Work if necessary
		1. When we started, there were certain business drivers, there were certain things that were told to you that were high priority that were reasons for you to re-do that architecture.
			1. Ensure that what we have got now is confirming to that
	2. Present to stakeholders
		1. Review
		2. Stakeholders:
			1. People of the company
			2. VP of technology
			3. CIO
			4. ...
		3. Present to them on a technical level
			1. Technical architect has a big background in technology
				1. Speak the language
				2. Talk the talk
				3. Trends within technology fields
			2. Speak in the language that they understand and then get the approval
		4. Get feedback and refine and re-present

### Phase D, Technology Architecture, Step 8 ###
1. Step 8: Finalize **architecture**
	1. Going back to the architecture repository and checking if there are standards for the new building blocks
	2. Complete all documentation
		1. Full documentation for building blocks
	3. Cross-check against business requirements
		1. Cross check of overall architecture against business goals
		2. Document rationale for building block decisions in the architecture document
		3. Document final requirements, traceability, mapping of the architecture within the architecture repository
	4. Finalize all work products
		1. Outputs
			1. Gap analysis here

### Phase D, Technology Architecture, Step 9 ###
1. Step 9: Creation of **architecture definition document**
	1. Document rationale for building block decisions
		1. Justifications for the BBs are written down and documented
	2. Prepare technology architecture section of architecture definition document
		1. Fundamental functionality of the technology
		2. Dependent building blocks
		3. Interfaces chosen
		4. Third parties that we need to map into the environment
		5. Mapping the technology to business entities etc...
		6. Graphics and models
			1. Network diagrams
			2. App and server maps

## Phase E In Detail: Step by Step ##
### Phase E, Opportunities and Solutions, Step 1 ###
1. Opportunities and Solutions (Phase E)
	1. Initial complete version of the Architecture Roadmap, based on gap analysis of BDAT
	2. Determine if incremental approach required
		1. Or get to target architecture all in one go
	3. Formulate implementation and migration strategy
	4. Identify and group work packages
2. Step 1: Determine/ Confirm key **Corporate Change** Attributes
	1. How the architecture can be best implemented to take advantage of the business culture
		1. Knowing what can know about the company
		2. What can you do to make sure it is implemented the easiest way possible
		3. Company might be slow to act or decisions take a long time
			1. Try to get all the decisions at once and do it all at once approach
		4. Getting stuff incrementally does not raise too many eye brows
			1. We can do our own phase A..E deployments
	2. Assessment of the business readiness for transformation
		1. Process we can go through to assess how the company is ready for change 
			1. Take Phase A as input and analyzing to say this is what we want to do and how do we do it and what is best for our company
	3. Implementation Factor Assessment and Deduction matrix
		1. Take all assessment of the company and put that into the deduction matrix
			1. If organization has got a history of enterprise architecture, this is simple

### Phase E, Opportunities and Solutions, Step 2 ###
1. Step 2: Determine **Business Constraints** for Implementation
	1. Identify business drivers that would constrain implementation
		1. These may cause a change in the implementation plan
	2. Are the seasonal factors (end of year holiday rush), new product launches, budget issues (this year's budget vs next), new laws going into effect, etc.
		1. Decisions must be made for implementations around the issues
		2. Laws might be constraints

### Phase E, Opportunities and Solutions, Step 3 ###
1. Step 3: Review and **Consolidate** Gap Analysis Results from Phases B-D
	1. Creation of consolidated gaps, solutions and dependencies matrix
		1. Chapter 28 says what goes into the matrix
	2. Identify potential solution building blocks (SBBs) and associated (Architecture Building Blocks) ABBs
		1. Say expecting traffic to tripple for the website so need bigger server, more of a farm
			1. Pull out BBs associated with this kind of architecture
	3. Consolidate the B, C and D gap analysis into a single list
	4. Re-organize the matrix and group related items together
		1. Put them together and we may find a single solution that can solve the problems
		2. Re-organization may help us design the solution

### Phase E, Opportunities and Solutions, Step 4 ###
1. Step 4: Review **Consolidated Requirements** (across related business functions)
	1. Identify a minimal set of requirements whose implementation would lead to a more efficient and effective implementation of the Target Architecture
		1. Single solution may satisfy multiple requirements
	2. If different lines of business all have similar concerns, they can all be solved by a single shared solution
		1. Opportunity could be that we could develop a solution across the company and enterprise
			1. Authentication - centralized (usernames, passwords)
				1. Reduces risk
				2. Reduces cost

### Phase E, Opportunities and Solutions, Step 5 ###
1. Step 5: Consolidate and Reconcile **Interoperability Requirements**
	1. Consolidate inter-operability requirements from various phases
		1. applications or systems or solution to be able to work with other solutions
		2. What parts of the requirement needs interoperability
	2. Minimize interoperability conflicts or address them
		1. If system needs to access customer database
			1. System B needs to read from Customer DB but no existing method (no API, protected, firewall, ...)
				1. Interoperability conflict
					1. Minimize this
	3. Two basic approaches: Construct building blocks to work between the conflict (develop a public API with limited basis, very strong authentication, limited functionality with an application that runs inside the network (new BB) and other solutions can access the BB), or modify the existing building blocks to work together (System exports the database file to outside the bounds of the app and runs very often, the systems are modified to work together)

### Phase E, Opportunities and Solutions, Step 6 ###
1. Step 6: Refine and Validate **Dependencies**
	1. Refine the initial dependencies
		1. Any constraints on implementation or migration plan are identified
		2. Dependencies: Things which need to be in place before doing what we need to do
	2. If implementing this one change is dependent on IT upgrading everyone's systems to include more memory and disk space, that should be noted
		1. If desktop app that we want to develop needs this, this needs to be identified
			1. Dependency on IT department
		2. If company upgrading to SAP and it may be a dependency
	3. Addressing dependencies is one of the main goals of migration planning

### Phase E, Opportunities and Solutions, Step 7 ###
1. Step 7: **Confirm Readiness** and Risk for Business Transformation
	1. Review Business Transformation Readiness Assessment conducted in Phase A
		1. Chapter 30 of TOGAF 9.1 spec
		2. There is a process to determine how ready is the company for transformation or change
	2. Determine impact on roadmap and strategy
		1. We may have aggressive plans to solve a lot of company's problems (Bold and challenging and ambitious)
			1. If company has qualities that make the bold and ambitious plans risky, consider seriously
	3. Identify, classify and mitigate risk (for transformation)
		1. What are the qualities in the company that make the transformation risky?
		2. If strong leader but week people in top level, that's business risk
		3. Funding: If we have clear budget and clear source of funding, but if we don't, that is a risk
		4. Strong governance: Really good governance, then good sign but if company makes arbitrary decisions, they don't have responsibility and they don't have capability then it is a risk
	4. Risks listed in Consolidated Gaps, Solutions and Dependencies matrix
		1. Some of the documents will appear in the steps that follow

### Phase E, Opportunities and Solutions, Step 8 ###
1. Step 8: Formulate Implementation and Migration **Strategy**
	1. Creation of overall strategy for implementation of the target architecture
		1. And any transition architectures that are done before we get to the target architecture
	2. Three basic strategic approaches: greenfield, revolutionary, evolutionary (how are we going to implement the solutions or how are we going to explore the opportunities)
		1. Greenfield: Completely new implementation and there is nothing existing.
			1. Get a software, install, play with it and when we are happy with it, release it to the users
		2. Revolutionay: Radical change - there is an existing system and a new system is created that replaces it
			1. Old system is shut is off and data migrated and new system is turned on
				1. Risk is associated - new system doesn't work then hard to go back (needs fixing the new system)
		3. Evolutionary: Phased in approach - adding new features to existing application (users don't have to install anything)
			1. New menu and people start using
			2. Parallel Systems: Old and new systems are running and data is synchronized
				1. If new system is working as expected, then turn the old system off
	3. Three basic mitigations: quick win, achievable targets, value chain method
		1. Quick win: Analysis of the things that we want to deploy and then determine what is the easiest items to deploy that have the most benefit to the users
			1. In a month from now we want to deploy A, B and C and what are those and what is going to provide the most value (those are quick wins)
				1. Users see a lot of benefit in what we are trying to do very quickly
			2. Less money and less time, not very risky
		2. Achievable targets: If you have an ambitious goal, you can break it down into achievable targets (instead of changing 25 systems, replace 2, and next 2 and next 2 ...)
		3. Value chain: Delivering value to the user incrementally
			1. Performance:
				1. Slow app to super quick in one go or phase by phase?
	4. The basis of work packages
		1. Stuff that comes out of strategy is what goes into the creation of work packages (Step 9) 
			1. Quick wins: First work package
			2. Achievable targets: Next set of work packages
	5. Agreement reached on implementation and migration strategy
		1. With stakeholders for implementation and migration
			1. Deliver A, B and C first and then E and F which is half of the value in 2 months and next half in 6 months ...

### Phase E, Opportunities and Solutions, Step 9 ###
1. Step 9: Identify and Group Major **Work Packages**
	1. Key stakeholders to assess the missing capabilities
		1. Identifies in vision and target, gap analysis and roadmap
	2. Logically group the various activities into work packages
		1. Using consolidated gaps, solutions and dependencies matrix
			1. Some things make sense to be done together (strategy)
	3. Fill in the "solution" column of Consolidated Gaps, Solutions, and Dependencies matrix
		1. Proposed solution machanism
			1. Approaches are documented
	4. Classify every system: mainstream, contain, replace
		1. Mainstream: Part of the future or target
		2. Contain: Expected to be replaced or modified sometime in the next three years
			1. Not going to a lot of work on a system that is going to reach the end of it's life
		3. Replace: Existing set of work packages are going to replace the system
2. Think about development team next and package them into portfolios within the BU

### Phase E, Opportunities and Solutions, Step 10 ###
1. Step 10: Identify **Transition Architecture**
	1. When there's an incremental approach
		1. Determine if we need the incremental approach at all
		2. If there is only one target architecture then we don't need the transition architectures
		3. Transition architectures for incremental approach
	2. Provide measurable business value
		1. There is no use of having a transition architecture that does not provide any value
			1. It should have business value
				1. Hosted solution to cloud based solution has business value (though customers are not going to notice it)
					1. Saves money
	3. Implement difficult activities after the easier ones that deliver good business value (quick wins)
		1. Don't worry about 6 months project first
		2. Making it easier for the business

### Phase E, Opportunities and Solutions, Step 11 ###
1. Step 11: Creation of the **Architecture Roadmap & Implementation and Migration Plan**
	1. Consolidate work packages and transition architectures into Architecture Roadmap version 0.1
		1. High level document that timeline
	2. Timeline from baseline architecture to target architecture
		1. 3 months, 6 months, ...
	3. Each transition architecture must have a clear set of outcomes
		1. There should be business benefits or be clear about that
	4. Implementation plan demonstrates the activity necessary to realize Roadmap
		1. Roadmap is going to promise features and functionality
			1. In 6 months you can use phone to book appointment
		2. Implementation plan, talk about teams,...
			1. When you are going to start and when you are going to be done, project plan etc...
2. Up:
	1. Phase F, Implementation and Migration Planning

## Phase F In Detail: Step by Step ##
### Phase F, Migration Planning, Step 1 ###
1. Migration Planning (Phase F)
	1. Finalize the Architecture Roadmap and Implementation and Migration Plan
	2. Ensure that plan is coordinated with the enterprise's approach to change
		1. Determine the business value and ensure it is understood by stakeholders
			1. Think about implementation
	3. Ensure the business value of the approach is understood by stakeholders
	4. Start thinking about implementation: costs, resources, timing
	5. Transition from developing the architecture to implementing 
2. Step 1: Confirm **Management Framework** Interactions
	1. Coordinating the Implementation and Migration Plan with management frameworks within the organization
		1. Various parts of the organization have different management frameworks
			1. Alternate to TOGAF
				1. ZACHMAN
	2. Four Typical Ones:
		1. Business planning - Executive level (CEO, Vice President)
			1. They may use a framework for business planning
			2. We need to work within that
				1. How they spend money
				2. How they make decisions
				3. Verious checkins they require
				4. How resources are allocated
				5. Procurement
		2. Enterprise Architecture
			1. Structure and context of 4 domains (BDAT)
		3. Portfolio/ Project Management
			1. Project management is about finding space (how to plan and implement projects) - work with PMs in terms of how we are going to fit as architect and how implementation plan will be implemented by implementors
				1. Scrum
				2. PMI
				3. PMP
		4. Operations Management - Group of people who deliver the service to the customers (keep servers running, keep phone lines open, keep the factory open)

### Phase F, Migration Planning, Step 2 ###
1. Step 2: Assign a **Business Value** to Each Work Package
	1. Establish and assign business values to all of the work packages
		1. What is the benefit to the business and express it as a value
			1. Is there reduced cost?
			2. Is there increased revenue?
			3. Gain efficiencies?
			4. End of life scenarios?
	2. Issues to be addressed: Performance evaluation, ROI, business value, critical success factors (CSF), measure of effectiveness (MOE), strategic fit
		1. Think about success
			1. Leveraging the business value
			2. 100 K per month of savings
				1. 75 K achievement is a success say
				2. If not analyze what went wrong
	3. Work packages are the basis of what gets implemented
		1. Not at a stage where we cannot evaluate independent projects
		2. Resource allocation is not done here (only work packages)
	4. Assign risks to the projects
		1. Is the savings guaranteed?
			1. What can go wrong?
			2. Outside factors?
			3. Dependency on other projects
				1. Competetors

### Phase F, Migration Planning, Step 3 ###
1. Step 3: Estimate **Resource Requirements** and Project Timings
	1. Determine the required resources and times for each project
	2. Initial cost estimates
		1. For each of the requirements, work packages and projects
			1. Differentiate between capital costs and ongoing operation costs
				1. Up-front cost
				2. Maintenance cost
	3. Capital cost vs ongoing operation cost

### Phase F, Migration Planning, Step 4 ###
1. Step 4: **Prioritize** the Migration Projects
	1. Prioritize projects delivering the most business value for lowest cost (low-hanging fruit, quick wins)
		1. Low risk, low cost, can be done quickly and easily and deliver the most business value
			1. Do them first
	2. Review the risks, and ensure they have been mitigated as much as possible
		1. If a competetor can launch before us with a better product or different product or same product
			1. Benefits are taken away
			2. Can we get the product out faster
			3. Can we modify the existing products
			4. ...
	3. Have stakeholders agree on prioritization
		1. Meet:
			1. Tech leads
			2. Business owners
			3. Implementors
			4. Owners
		2. Agree on prioritization
	4. Review the risk assessment and revise; residual risk
		1. Revise planning
		2. Revise definition document
		3. Revise roadmap
		4. Revise transition architectures
		5. Residual risk?
			1. Once mitigation is done, there may still be other risks
				1. Left over risk (cannot mitigate any further)
			2. Stakeholders should agree that the residual risk is acceptable

### Phase F, Migration Planning, Step 5 ###
1. Step 5: Confirm **Architecture Roadmap** (Update the architecture definition document)
	1. Update the architecture roadmap including transition architectures
		1. Based on decisions of previous step
		2. Review and update to the current transition architecture as needed
	2. A Transition Architecture State Evolution Table can be used to show the proposed state of the domain architectures over time
		1. Across BDAT architecture domains, we can map out how the domains progress over time
	3. If approach changes, update Architecture Definition Document

### Phase F, Migration Planning, Step 6 ###
1. Step 6: **Generate** the Implementation and Migration Plan
	1. Generate the completed Implementation and Migration Plan
	2. Mostly bringing together details from previous steps
		1. Include all the other projects if there are dependencies
		2. If we want to upgrade desktops
			1. This is a dependeny (needs to be called out)
	3. Capture external dependencies

### Phase F, Migration Planning, Step 7 ###
1. Step 7: Complete the **Architecture Development Cycle**
	1. Completing architecture development, and transitioning into implementation
	2. Lessons learned, what went wrong and what can be done differently
	3. This could be a spot for iteration back to Phase B to go a level deeper into details
		1. Improve things (iteration is not on the test)

## Phase G In Detail: Step by Step ##
### Phase G, Implementation Governance, Step 1 ###
1. Implementation Governance (Phase G)
	1. Ensure conformance with the target architecture
	2. Governance duties
		1. Making sure that the development and implementor teams are following target architecture and giving business value expected
		2. Our job is to update the baseline architecture as the changes are implemented
	3. Handling change requests from implementation team
	4. Update baseline architecture as changes are implemented
	5. Phase G ends when solutions are fully deployed
2. Step 1: Confirm **Scope** and Priorities for Deployment
	1. Produce recommendations for deployment
		1. We would be meeting development and implementation management
		2. Come up with recommendations for them
	2. Identify enterprise architecture priorities for development team
		1. Main thing that we want to get out of this is what?
			1. SOA: Every backend piece of data is accessible to front end services
				1. Express main priorities
	3. Identify deployment issues and make recommendations
		1. Complicated migration (data taken from one set of hosts to another, downtime for app, ...)
	4. Identify building blocks that need replacement, update
		1. Very clear about architecture and what we are expecting at the end of this
	5. Perform gap analysis on enterprise architecture and solutions
		1. Gaps:
			1. New Software
			2. New Hardware
			3. Shut down
			4. ...

### Phase G, Implementation Governance, Step 2 ###
1. Step 2: Identify **Deployment Resources**
	1. Identify system development methods required for solutions deployment
		1. If inhouse team has a certain way to do development and this gets identified
		2. If we hire outside company, we need to know how they do development
	2. Ensure that system development method enables feedback to the architecture team on designs
		1. Make sure what the approach is and monitor this and make sure you are available and get the conformance requirements that you have and it gets feedback to you on the designs
			1. Suppose in-house development team does agile approach and they are expecting to do incremental deployments
				1. Deploying small features rapidly (fine)
					1. There are pros and cons to it
		2. As an architect need to change governance rules to make sure the requirements are followed pretty closely
			1. Attend milestone meeting
				1. Especially at release point
				2. Get feedback from team  

### Phase G, Implementation Governance, Step 3 ###
1. Step 3: Guide **Development** (of solutions to deployment)
	1. Formulate project recommendations re: impacts
		1. Here things are down into individual projects because we are into actual development
		2. My role is partly to manage impacts (not to resolve but at-least document)
			1. If change request is coming through, that becomes an impact
				1. If timeline changes (document)
				2. If roadmap changes (document)
	2. Define architecture contract, obtain signature
		1. It is big deal in TOGAF
			1. Agreement between business team, architecture team and development team
				1. What we are developing
				2. What does the solution need to do in terms of performance
					1. Functionality
		2. If dealing with internal project teams
			1. Outline things
			2. Internal team has to sign off for all the requirements
	3. Update enterprise continuum
		1. SBBs get put onto Continuum
			1. Very organization specific BBs or Generalized (shared)
	4. Guide development of service
		1. Service: It is a function that IT department provides to the enterpise or atleast supported by the company
			1. Email
			2. File storage
			3. Active directory
			4. ...
	5. Guide development of operational requirements
		1. Costs of things and how they impact ongoing operations
			1. If admin tools are required to manage things
			2. STAGE, PROD environments
	6. Produce implementation plan
		1. Actual plan for rolling things out
			1. How we are going to do development and deployment

### Phase G, Implementation Governance, Step 4 ###
1. Step 4: Compliance **Reviews**
	1. Review ongoing implementation governance and architecture compliance
		1. When solutions are in testing or staging, make sure they are delivering the features and functions outlined
	2. Conduct post-development reviews
		1. Sign-off

### Phase G, Implementation Governance, Step 5 ###
1. Step 5: Implement Business and IT **Operations**
	1. Carry out the deployment projects (operations side)
		1. Services should come online
		2. Business services
		3. Training and skills for end users (not our job)
		4. Communications documentation (user manuals, distribute to right people) - make sure it gets done
	2. Publish new baseline architectures
		1. Keep architecture repository up to date (need not be our job but this is taken care off)
			1. IP addresses
			2. ...

### Phase G, Implementation Governance, Step 6 ###
1. Step 6: Perform **Post-Implementation Review**
	1. Conduct post-implementation reviews
		1. Make sure there are no errors and everything is functioning as expected
		2. Implementation team might have waranty period
	2. Publish reviews and close projects
		1. Go back to business owners
			1. Target architecture is realized
			2. Not into measuring business value yet
	3. Phase G ends when all solutions are fully deployed **once**
		1. Follow ups might be there and this is out of scope
			1. Fixing bugs
			2. Tweeking
			3. ...

## Phase H In Detail: Step by Step ##
### Phase H, Architecture Change Management Steps ###
1. Architecture Change Management (Phase H)
	1. Keeping the architecture alive
	2. Ensure Architecture Governance is happening
	3. Ensure the enterprise Architecture Capability is maintained
	4. Monitoring: changes to the business enterprise, changes to the industry, changes to technology, formal change requests
		1. May kickoff another ADM cycle
		2. Minor changes can be done inside this phase
2. Step 1: Establish **Value Realization** Process
	1. Influence business projects to exploit the enterprise architecture for value realization (outcomes)
		1. We want to ensure the business is using the architecture to the maximum use that it can and get the maximum value that it can
			1. Influence the business project to exploit the architecture
			2. Example: Business services
				1. Company wide time management
					1. Influence all business units to use it
3. Step 2: Deploy **Monitoring** Tools
	1. Use of monitoring tools to enable: (architecture is delivering value and continuing to deliver value - architecture team must be on top of this to ensure processes are in place)
		1. Monitor technology changes
		2. Monitor business changes
		3. Business value tracking
		4. Monitor Architecture Capability maturity
		5. Track asset management programs
			1. Data assets
			2. Technology assets
		6. Track QoS (Quality of Service) performance
			1. How we are delivering service to the customers
			2. How departments are serving each other (within the company)
			3. Find ways of measuring customer satisfaction
4. Step 4: Manage **Risks**
	1. Manage enterprise architecture risk
		1. As we are monitoring company, quality, performance, changes, we are basically tracking risks
			1. Certain software versions are falling behind
				1. We need to keep up security risks
					1. To IT stakeholder
		2. Provide recommendations for IT strategy (they are driving the requirements and not you)
			1. Competition is doing this
			2. This is what I have observed
			3. ...
5. Step 4: Provide **Analysis** for Architecture Change Management
	1. Provide analysis for architecture change management
		1. Analyze performance (of the architecture)
		2. Enterprise architecture performance review
		3. Assess change requests
			1. May come any time
				1. Business may come up
					1. This change is not working for us
					2. We need to make this change
					3. New enhancements
		4. Undertake gap analysis
			1. Do the changes coming through require a change in the architecture?
			2. What are the gaps?
		5. Ensure following proper governance process
			1. For change to architecture
				1. Decisions are Logged
				2. Decisions are made properly
6. Step 5: Develop **Change Requirements** to Meet Performance Targets
	1. Make recommendations on change requirements to meet performance targets and development of position to act
		1. If architecture is not delivering the value that it has promised
			1. 1 million vs 3/4 million
		2. Recommendations should made sure the target is reached
7. Step 6: Manage **Governance** Process
	1. Manage governance process and framework for architecture
		1. Arrange meeting of Architecture Board
			1. Not that often
		2. Hold meeting of the Architecture Board to handle changes and dispensations
			1. Dispensations: Approvals from architecture board that are out of compliance of architecture
				1. Providing dispensations for architectures that have fallen apart
				2. Dispensation: Meaning
					1. Exemption from a rule or usual requirement
					2. A political, religious, or social system prevailing at a particular time
8. Step 7: Activate the Process to **Implement Change**
	1. Activate the architecture process to implement change: (Architecture board has taken decision to activate the process of implementation)
		1. Produce a new Request for Architecture Work
			1. Starts new ADM cycle
			2. Go ahead for implementation teams
			3. Update architecture repository
		2. Ensure any changes implemented in this phase are captured and documented in the Architecture Repository

## Requirements Management In Detail: Step by Step ##
### ADM Architecture Requirements Management, Steps 1-5 ###
1. Requirements Management
	1. Center of the hub
	2. Operates continuously during the ADM process
	3. Requirements change all the time
	4. RM involves assessing impact of these changes
	5. New competitor, new legislation, disproven assumption, new company policy
2. It is operating during the entire architecture development
3. It is the process by which changes can be taken into the process
	1. If something happens, we have identified the requirement too late, we have already passed certain phases but new requirement comes in
		1. Say
			1. Legislation
			2. Something missed
			3. New company policy
4. Note: 
	1. These steps do not follow the typical pattern for the ADM cycle
	2. Flips between Requirements Management Steps and ADM Phase Steps
		1. Nexus of control passes from requirements management, feeds into each of the phases and work done in the phases feed back into the requirements management
		2. It is a control hub (than actions where decisions are made)
	3. I will indicate where control passes to at each step
	4. Poorly defined in the TOGAF spec and in all related study books
		1. "Note also that the Requirements Management process itself does not dispose of, address, or prioritize any requirements; this is done within the relevant phase of the ADM. It is merely the process for managing requirements througout the overall ADM"
			1. It is just control hub
5. By way of example:
	1. Your're currently in the Phase G: Implementation Governance phase
	2. This phase is expected to last 18 months as you are deploying a series of transition architectures
	3. The request comes in from the IT department that they would like to get everyone on a "ticket system" for support requests, instead of the existing email system or phone calls
	4. All employees of the company need to be set on this system and use it to log support requests
		1. Need to be flexible to take in this
6. Step 1: Identify/ Document Requirements (ADM Phase Steps)
	1. Using business scenarios or another technique to document the actual requirements
		1. Problem definition
	2. Not yet received the changed requirements yet
		1. Identifying the problem
	3. Similar to Phases B-D
7. Step 2: Prioritize Requirements (RM Steps)
	1. Determine priorities on the current ADM cycle
	2. Confirm stakeholder buy-in to those priorities
		1. Similar to work pakages
		2. Requirements and priorities
	3. Record requirements priorities and place in Requirements Repository
	4. Similar to Phase E and F 
		1. Building work packages and finalizing implementation plan
8. Step 3: Monitor Baseline Requirements (RM Steps)
	1. Monitor baseline requirements
		1. Example of TOGAF spec that says this
		2. We want to see that there are no changes to the baseline (other than transition architectures)
			1. Checking for changes
9. Step 4: Identify Changed Requirements (ADM Phase Steps)
	1. Remove or reassess priorities
		1. Changes to priority
	2. Add requirements and re-assess priorities
	3. Modify existing requirements
		1. 8GB to 16GB
	4. Example: Identified the need for a ticketing system
10. Step 5: Identify Changed Requirements (RM Steps)
	1. Identify changed requirements and prioritize them (architect and stakeholders need to make decision)
	2. Record new priorities in Requirements Repository
	3. Ensure conflicts are identified and managed
		1. If new changes impact other teams or projects or stakeholders
			1. Handle these
	4. Generate Requirements Impact Statement for steering the architecture team
		1. If we decide to make the change, we must make a statement for the impact of the change which goes to the architecture team

### ADM Architecture Requirements Management, Steps 6-10 ###
1. Step 6: Assess Impact (ADM Phase Steps)
	1. What is the impact on the current phase?
	2. What is the impact on previous phases?
		1. Go back to baseline and target architectures
		2. Will the new requirements overrule the processes?
	3. Decide to implement or defer
		1. Immediate or defer (Go or no go decision)
			1. Low risk or not
	4. Issue Requirements Impact Statement
2. Step 7: Implement Requirements for Phase H (ADM Phase Steps)
	1. Phase H is Architecture Change Management Phase
		1. Monitoring phase
			1. Certain drivers may cause change
				1. These can be implemented in step 7 if we do not require a new round of the cycle
	2. Changes that arise during this phase can be implemented, if they do not require a new round of ADM Cycle
3. Step 8: Update Requirements Repository (RM Steps) - With information related to changes requested
	1. Update requirements repository based on changes requested
		1. Anything that changed target architecture, transition architectures, stakeholder views
	2. Update target architecture and stakeholder views
4. Step 9: Implement Change in Current Phase (ADM Phase Steps)
	1. How does this change affect the current phase of the ADM?
5. Step 10: Assess and Revise Gap Analysis (ADM Phase Steps)
	1. Go back over the gap analysis (Phases B through D based on target architectures)
		1. Ensure nothing is missed and not introducing any problems
	2. Ensure nothing is missed with this new change
	3. What else is affected?
6. Since it is poorly defined, company needs to have a process
	1. Can be customized or defined in more detail
7. This phase is only used to monitor and update requirements

#### Other Resources ####
1. Articles and free videos about TOGAF and architecture:
	1. [http://SoftwareArchitect.ca](http://SoftwareArchitect.ca)
2. Connect on LinkedIn:
	1. [http://sjd.ca/li](http://sjd.ca/li)

## Before We Start ##
### Start of TOGAF 9.2 Course ###
### Welcome to the Course! ###
1. Introduced in 2018
2. What this course covers
	1. Preparation for the Part 1 exam for TOGAF Foundation
	2. Structure of the TOGAF standard document
	3. Definitions
	4. Basic and core concepts of the TOGAF standard
	5. The ADM

### About Your Instructor ###
1. Certified to teach TOGAF commercially

### What is Enterprise Architecture? ###
1. What is TOGAF standard?
	1. Architecture framework for enterprise architecture
		1. Architecture framework: Set of methods, tools and common definitions (language for creation, adoption and maintenance of enterprise architecture)
		2. ADM: Architecture Development Method (iterative process)
	2. Enterprise architecture:
		1. 42010:2011 standard
			1. The fundamental concepts or properties of a system in its environment embodied in its elements, relationships, and in the principles of its design and evolution
				1. TOGAF agrees to it but adds
					1. ISO definition + the following
						1. The structure of components, their inter-relationships, and the principles and guidelines governing their design and evolution over time
		2. Components and their relationships + principles (rules and guidelines) governing their design and evolution over time
			1. Process put around to grow the architecture and change the architecture
		3. TOGAF: Is about developing proper architecture capability in your organization
			1. It has architecture governance
			2. It has standard meta model for storing and organizing information
			3. Principles for designing those documents
			4. Standardizing process for evolving that architecture for months and years ahead
		4. Architecture framework: It is how we do architecture

### The TOGAF Certification for People ###
1. Level 1 and Level 2
2. Part 1 and Part 2
	1. Part 1: TOGAF foundation level certificate
	2. Part 2: TOGAF certified level certificate
3. TOGAF Part 1
	1. A test of core knowledge of the standard
	2. A multiple-choice test, only 1 correct answer
	3. 40 questions
	4. Need 55% to pass, or 22 correct out of 40
		1. Closed book
		2. Memorize contents
		3. No negative marking
	5. Each correct answer is worth 1 point
4. TOGAF Part 2
	1. A test of how you apply the TOGAF Standard
	2. A scenario based test, scored using gradient scoring
		1. Correct answer 5 points, second best is 3 points, third best 1 point, wrong answer 0 points
	3. Open book exam
		1. PDF version is provided
	4. 8 questions
	5. Need 60% to pass
	6. Must have passed Part 1 to take Part 2
5. Combined test option is available
	1. $320 per test
		1. 1 month to wait if failed
	2. $495 for combined test
	3. English (+ESL) - get more time to take for English as a Second Language (tell before hand)

### The TOGAF 9.2 Standard ###
1. Read relevant chapter with each lesson
2. Free HTML or PDF version on The Open Group website
3. Standard:
	1. Part I: Introduction
		1. High level core concepts of TOGAF and key definitions (must)
	2. Part II: ADM (Core)
		1. Iterative process by which architects develop architecture
	3. Part III: Guidelines and Techniques
		1. To apply for your business
			1. Tailor TOGAF for specific needs (this part tells how)
	4. Part IV: Architecture Content Framework
		1. Structured metamodel for building artefacts and Building Blocks in architecture deliverables
			1. What goes into each document
	5. Part V: Enterprise Continuum
		1. Categorization model
			1. Documents can be organized from general to specific
				1. Architecture
				2. Solutions
	6. Part VI: Architecture Capability Framework
		1. Discusses how to establish capability for the architecture
4. + TOGAF Library
	1. Materials pulled out of 9.1 standard + new materials
		1. Set of materials that supports the use of the framework

## Core and Basic Concepts ##
### Overview of Core Concepts ###
1. 7 Core Concepts
	1. The definition of enterprise
	2. The architecture domains, or BDAT
	3. The architecture development method, or ADM
	4. Deliverables, artifacts and building blocks
		1. Outputs
	5. The enterprise continuum
		1. Categorization method
	6. The architecture repository
		1. Where work is stored
	7. And, defining architecture capability

### Definition of Enterprise ###
1. Highest level of description for an organization
	1. Legal entity
	2. Tight connection of businesses that operate together
	3. Example: US Government
		1. Branch
			1. One defined group of people at the top who can set the direction for the way the business runs
				1. Board of directors
				2. Executive team
				3. Deciders
		2. Could be collection of organizations
			1. Partners (contractors)
				1. McDonalds - suppliers
	4. Enterprise is the top level of the business
		1. Everything operating below it are interconnected in some way
			1. One or multiple organizations 
2. Scope of enterprise architecture
	1. May be you are an enterprise architect but not responsible for the whole enterprise
		1. Only one business unit
	2. Enterprise might be scoped differently for EA
		1. Certain in scope or out of scope
	3. Need to know where the scope is before we start

### The Four Architecture Domains - BDAT ###
1. Architecture Domains
	1. BDAT
2. Business, Data, Application and Technology
	1. Sub layers of enterprise architecture
	2. Business Domain
		1. Fundamental purpose of business
			1. Why are you in business?
			2. What are you hoping to achieve?
			3. Business strategy that should be dictated by the owners represented by the executives and heads of the business units
		2. Enterprise architecture tries to align all of the technical architecture of the business to the business architecture
		3. Business architecture is defined first
			1. DAT - Technical architecture is aligned with that
		4. Defining current and future capabilities of business
	3. Data Domain
		1. Deals with logical and physical data assets
			1. Data privacy
			2. How data is handled
			3. Data strategy
			4. Resources
		2. Deals with defining current structure and interaction of enterprise's major types and sources of data
	4. Application Domain
		1. Deals with how individual applications are developed and deployed
		2. How the applications are related to the core business process
		3. Deals with current and future structure and interaction of applications as groups of capabilities that provide key business functions
	5. Technology Domain
		1. Computers, networks, middleware are support system of business
			1. Online age
			2. Hackers are attacking
			3. Spending has increased
			4. Need to be strategic about this
		2. Deals with defining the current and future structure and interaction of the technology services and technology components

### Architecture Development Method - ADM ###
1. ADM: Established process that companies can use to define enterprise architecture
	1. Tested and repeatable
1. Phases:
	1. Preliminary Phase - Here we establish the basic principles and setup architectural capability that will guide through the task and make decisions easier
	2. Phase A: Vision (for the project) (ADM cycle phases from here)
	3. Phase B,C,D: BDAT (stakeholders sign off here)
	4. Phases E,F: Planning - Define a process for laying out a roadmap, a work plan and a series of transition architectures to get you from where you are to where you want to be
	5. Phase G: Implementation
		1. We work with development teams to get the work implemented and establish the architecture contract
	6. Phase H: Change Management
		1. This comes after the architecture is implemented
			1. Whether we want to kick off a new ADM cycle or not
	7. Requirements Management Phase Ongoing
		1. When things come, we need to handle them here
2. Examine things happening, changes in the industry, business requirements coming from executive team
	1. We can decide when we should be starting the ADM cycle all over again 

### Architecture Work Products - Deliverables, Artifacts and Building Blocks ###
1. Artifacts, Deliverables, and Building Blocks
2. Work produces a lot of outputs
	1. Outputs formats need not be invented
	2. These can be built in accordance with Architecture Content Framework
		1. ACF: Provides structural model for architectural content
3. Artifacts: Work products that get produced during the architecture work
	1. Lists
	2. Matrices
	3. Diagrams
4. What artifact is defined in which phase? Exam
	1. Understand what they are
	2. Why it is defined in which phase
5. Deliverables:
	1. Contractually specified and in turn formally reviewed, agreed, and signed off by the stakeholders
		1. A complete document - it must be reviewed, agreed upon and signed off by business owners and stakeholders
	2. Building Blocks: Strive to generalize and re-use as much as you can of the architecture
		1. Architecture Building Blocks (ABBs)
			1. Named concepts (business processes) that can be reused in other places (between architecture diagrams)
		2. Solution Building Blocks (SBBs)
			1. These are implementations of the ABBs (technical solutions that can be re-used between architecture diagrams)
				1. Supportive of ABBs
	3. Example; Organization - need to lookup a customer profile (many different organizations need this capability for many reasons)
		1. This is an ABB
			1. This can be copied and pasted at the required spot of the diagram or requirements
		2. SBB: CRM Customer Search Module
			1. Solution to the ABB
	4. ABBs and SBBs are deliverables

### Enterprise Continuum ###
1. A way to classify items in the architecture repository
	1. From extremely generic to extremely specific
		1. Somewhere in middle as well
2. It is a line
	1. Foundation Architectures (Generic)
		1. TOGAF contains TRM (Technical Reference Model)
			1. Extremely generic
				1. Describes a model that applies to a computer (applies to any company everywhere)
	2. Common Systems Architectures (not every standard in this category applies to my company)
		1. Focus is on service business say (SOA)
		2. Focus is on product businesses
		3. Focus is on manufacturing business
		4. Focus is on public sector
	3. Industry Architectures
		1. Focus is on financial firm (financial standards for how data is passed between firms in the industry)
			1. These apply to all companies in the industry
		2. Focus is on education sector (education specific standards)
	4. Organization-Specific Architectures
		1. Ours
		2. Proprietary generally
		3. Specific to our company
		4. We may taken from somewhere else and modified
3. Enterprise continuum is divided into
	1. Architecture Continuum
		1. ABBs live here
	2. Solutions Continuum
		1. SBBs live here

### Architecture Repository ###
1. It is a central storage for important architecture documents
	1. Do not keep C:..\Documents as central storage (too many files)
2. Most enterprises invest in an architecture repository system (a well organized file server) to store all work of architecture team
	1. Well organized file server (folders, naming standards, ...)
	2. Versioned file system like Git (for storing versioned files)
	3. Knowledge management tool (purchased)
		1. Specific tool could be
3. TOGAF standard does not recommend how we store the documents
	1. Each company can choose its own tool
4. TOGAF talks about how we organize the documents
	1. Architecture repository contains
		1. Architecture Metamodel
			1. Tailored to the organization
				1. It contains our own version of the architecture framework
		2. Architecture Capability
			1. All of the rules around governance of architecture
		3. Architecture Landscape
			1. Represents all of the assets that are currently deployed in the organization
				1. Systems
				2. Business processes
				3. ...
		4. Standards Information Base (SIB)
			1. Contains all standards not written by you (organization needs to keep handy and use when developing architecture)
				1. Can include
					1. Privacy standards (GDPR)
					2. Health standards (HIPA)
		5. Reference Library
			1. Reference matarial that we can pull from when building architecture
			2. As we are getting documents and other things we need
		6. Governance Log
			1. Record of architecture governance activity
				1. What changes were requested
				2. Whether they were approved or not
				3. Justifications around that
				4. Meeting Minutes
				5. ...
		7. Architecture Requirements Repository (*new in 9.2)
			1. This consists of approved documents (signed off)
		8. Solutions Landscape (*new in 9.2)
			1. SBBs that support the architecture landscape

### Architecture Capability ###
1. It is an evaluation of your ability to do enterprise architecture
	1. You may have no capability currently
		1. We are not trained on it
		2. We have no one dedicated to it
		3. We don't have processes in place
		4. We don't have governance
	2. Requires effort to grow architecture capability (the more we do it, the better we get at it)
		1. Get trained
		2. Start doing it
		3. Hire someone to do it full time
		4. Someone has experience in it
		5. Put proper governance in place
		6. Established framework that we are going to follow
2. Preliminary Phase of ADM
	1. We establish our current level of architecture capability
	2. We decide on what level we want to be
		1. 0 - 10 (we may not have the money, the more process, the longer it takes - not good for every company)
	3. Challenge:
		1. Get budget
		2. Hier and train
		3. Top levels of enterprise should be on-board with this 
		4. Establishing a dedicated architecture group
		5. Defining enterprise architecture for the enterprise
3. Capability has a relationship to governance and repository
	1. It is sandwitched between governance (top) and repository
	2. Architecture capability: People and processes that establish the architecture.
		1. Architecture goes into the repository 
		2. Above people and processes that establish the architecture, is the governance model that sits on top establishing that the process runs according to the way we have defined it
	3. Capability does not stop in the preliminary phase
		1. Ability to establish architecture contract is part of the capability too
			1. As we go through Phases A-F, the architecture team defining the architecture working with different leaders within the organization and put together a plan
			2. In phase G we establish architecture contract
				1. It is written and signed contract between the architecture team and implementation team
					1. Implementation team agrees to implement the architecture as it is defined
					2. During the implementation phase, we are going to monitor the implementations and make sure what we are developing and deploying matches the plan
					3. We can hold them accountable if they deviate from the plan
						1. If so they have to go to architecture governance and get a change request put through

## The ADM ##
### Introduction to the ADM ###
1. Architecture Development Method
	1. It is the process by which an architecture is defined
2. It has 10 phases
	1. Preliminary
	2. A - Architecture Vision
	3. B - Business Architecture
	4. C - Information Systems Architecture
	5. D - Technology Architecture
	6. E - Opportunities and Solutions
	7. F - Migration Planning
	8. G - Implementation Governance
	9. H - Architecture Change Management
	10. Requirements Management
3. 8 phases make up ADM cycle
	1. Each of the phases there are
		1. Objective
		2. Inputs - come from existing assets in the architecture repository - we may have to define a few
		3. Steps
		4. Outputs
	2. We may be working with collaborating with business and collection of information from key stakeholders
4. Going through ADM the first time is hard - no existing documents (architecture repository is empty)
	1. Establishing contacts
	2. Process is new
	3. May find people that don't want to work with you
5. Next time will be easier and easier next time

### ADM Cycle ###
1. A - H
	1. ADM cycle is designed to start over once last phase is complete
		1. Significant pauses at the end of each cycle for us to be
			1. looking for changes
			2. looking for possible opportunities to modify the architecture
	2. In the center is: Requirements Management Phase
		1. It allows us to handle change while ADM process is underway
			1. Everyone has a plan until they get punched in the mouth (Mike Tyson)
				1. In the middle of execution, we may have to pause to go back and revise a past phase
	2. Iterations
		1. In between phases can be interated
2. TOGAF is designed to be tailored
	1. ADM can be adapted to your needs
		1. Other processes may exist
		2. May skip a few phases

### Preliminary Phase ###
1. On top
2. Purpose: 
	1. **Define** architecture capability desired
	2. **Establish** the architecture capability
		1. Defining architecture principles
		2. ...
3. Where, what, why, who, and how we do architecture
	1. Setup: Getting into architecture
		1. How do we do this?
		2. Who approves this?

### Phase A - Architecture Vision ###
1. Architecture Vision - (Under which phase this activity occurs?)
	1. The purpose is to: Develop a **high-level aspirational vision** of the business value to be delivered
	2. The purpose is to: obtain approval for a **statement of architecture work**
2. Inputs to Phase A:
	1. Architecture reference materials
	2. Request for Architecture Work
	3. Business principles, business goals, and business drivers
	4. Organizational Model for Enterprise Architecture
	5. Tailored Architecture Framework
	6. Populated Architecture Repository
3. Steps of Phase A:
	1. Establish architecture project
		1. Kickoff meeting
		2. Project manager
		3. status meeting
		4. Budget
	2. Identify stakeholders, concerns and business requirements
		1. People to make happy
		2. Document their concerns
		3. Business goals
	3. Confirm business goals, drivers and constraints
	4. Evaluate capabilities (updated for TOGAF 9.2)
		1. Strengths and weaknesses of business
			1. manufacturing top quality say
	5. Assess readiness for transformation
		1. Risk adverse? Hates change
			1. Show them small improvements
	6. Define scope
		1. Address which parts of business problems are we solving
	7. Confirm architecture principles, including business principles
	8. Develop architecture vision
		1. High level idea
			1. After talking to stakeholders
			2. High level story
			3. How to move the company in 12 months say
	9. Define the target architecture value and KPIs
	10. Identify transformation risks and mitigation activities
		1. New lines of business should not risk existing lines
	11. Develop Statement of Architecture Work, secure approval
		1. Need approval to continue on
			1. Big milestone
4. Outputs from Phase A
	1. Approved Statement of Architecture Work
	2. Refined statements of business principles, goals and drivers
	3. Architecture principles
	4. Capabilities assessment
		1. Business scenarios
		2. Strengths and weaknesses
	5. Tailored architecture framework
	6. Architecture vision
	7. Draft architecture definition document (version 0.1 of all baseline and target BDAT documents)
		1. 1.0 is final and approved
	8. Communications plan
		1. Stakeholders
		2. Who has to sign off
		3. Who needs to be informed
		4. Send emails or copies of progress
	9. Additional content in the Architecture Repository
5. Artifacts Produced
	1. Matrices: Stakeholder map matrix
	2. Diagrams: **Business model diagram**, **Business capability map**, **Value stream map**, Value chain diagram, Solution concept diagram
		1. Business or value realated are in Phase A

### Phase B - Business Architecture ###
1. The BDAT phases: Business, Data, Application and Technology
2. Phase B - Business Architecture
	1. The purpose is: Develop the target business architecture
		1. Transitional architectures are waypoints along the way
	2. The purpose is to: Identify **candidate architecture roadmap** items based on gaps
		1. Roadmap: An analysis of baseline architecture and target architecture where we identify gaps between them and the gaps become work items that go onto the roadmap
	3. Business architecture is based on the architecture vision (Phase A)
		1. Look at business requirements and what adjustments are required
	4. Inputs to Phase B:
		1. External reference materials
		2. Request for Architecture Work (optional) (Preliminary phase)
		3. Business principles, goals, and drivers (Phase A)
		4. Capabilities assessment (Phase A)
		5. Communications plan (Phase A)
		6. Organization Model for Enterprise Architecture (Prelim Phase)
		7. Tailored Architecture Framework (Prelim Phase)
		8. Approved Statement of Architecture Work (Phase A)
		9. Architecture Principles (Phase A)
		10. Enterprise Continuum
		11. Architecture Repository
		12. Architecture vision (Phase A)
		13. Draft architecture definition document (version 0.1 of all baseline and target BDAT documents) (Phase A)
	5. Steps for Phase B
		1. Select reference models, viewpoints, and tools
			1. Reference model - standard model
				1. Banking reference model
				2. Education reference model
				3. Other industries
		2. Develop baseline business architecture description
			1. What is current business architecture
				1. BUs
				2. Processes
				3. How systems connect to each other
		3. Develop target business architecture description
			1. Where do we want to go
			2. What do we need to do to change the business architecture to get there
		4. Perform gap analysis
			1. Differences between the two
		5. Define candidate roadmap components
		6. Resolve impacts across the architecture landscape
			1. May need to oursource (call center say)
				1. Resolve them
		7. Conduct formal stakeholder review
		8. Finalize business architecture
		9. Construct architecture definition document (v 1.0)
			1. Finalized, signed off and approved
	5. Outputs from Phase B
		1. Refined Phase A deliverables
			1. If we need to go back to Phase A deliverables
				1. Vision
				2. Business goals/drivers
			2. Revise if needed
		2. Draft architecture definition document
			1. Baseline business architecture v1.0 (detailed)
			2. Target business architecture v1.0 (detailed)
		3. Draft architecture requirements specification - gap analysis
		4. Business architecture components of an architecture roadmap
	6. Artifacts Produced
		1. Catalogs: **Value Stream catalog**, **Business Capabilities catalog**, **Value Stream Stages catalog**, Organization/actor catalog, Driver/goal/objective catalog, role catalog, business service/function catalog, location catalog, process/event/control/product catalog, contract/measure catalog
		2. Matrices: **Value Stream/Capability matrix**, **Strategy/Capability matrix**, **Capability/Organization matrix**, Business interaction matrix, actor/role matrix
		3. Diagrams: **Business Model diagram**, **Business Capability Map**, **Value Stream Map**, **Organization Map**, Business footprint diagram, business service/ information diagram, function decomposition diagram, product lifecycle diagram, goal/objective/service diagram, **business** use-case diagram, organization decomposition diagram, process flow diagram, event diagram
3. The phase underwent the most change from 9.1 to 9.2
	1. Phase B has most updates
4. Phase B: Business architecture about how to get there

### Phase C - Information Systems Architecture ###
1. Phase C: Contains two phases in one - define the following (order does not matter)
	1. Data architecture
	2. Application architecture
2. The objective, inputs, steps, output are almost the same (but focussed on individual domains)
3. Purpose is: Develop the **target information systems architecture**
4. Purpose is: Identify **candidate architecture roadmap** items based on gaps

### Phase C - Data Architecture ###
1. The purpose is: Develop **target data architecture**
2. The purpose is: Identify **candidate architecture roadmap** items based on gaps
3. Inputs to Phase C, Data Architecture
	1. External reference materials
	2. Request for Architecture Work (optional) (Preliminary Phase)
	3. Capability assessment (Phase A)
	4. Communications Plan (Phase A)
	5. Organization Model for Enterprise Architecture (Prelim Phase)
	6. Tailored Architecture Framework (Prelim Phase)
	7. Data principles (TOGAF Specification Chapter 20)
	8. Approved Statement of Architecture Work (Phase A)
	9. Architecture vision (Phase A)
	10. Architecture Repository
	11. Draft architecture documents and draft requirements (Phase B)
	12. Business related architecture roadmap (Phase B)
4. Steps for Phase C: Data Architecture
	1. Select reference models, viewpoints, and tools
	2. Develop baseline data architecture description
	3. Develop target data architecture description
	4. Perform gap analysis
		1. Gaps become work items that go onto roadmap
	5. Define candidate roadmap components
	6. Resolve impacts across the architecture landscape
		1. Other teams
		2. Other departments
			1. Single system will have customer info (say)
				1. All other systems get info from here
		3. Involves talking to people, documenting it, buy-in across organization
			1. Single source of truth and it's impact
	7. Conduct formal stakeholder review
	8. Finalize data architecture
		1. v1.0
	9. Build architecture definition document
5. Outputs from Phase C: Data Architecture
	1. Refined Phase A deliverables
	2. Draft architecture definition document (work items are in the roadmap and the architecture requirements section, data and architecture requirements sections get filled in with any gap analysis)
		1. Baseline data architecture v1.0
		2. Target data architecture v1.0
	3. Draft architecture requirements specification - gap analysis
	4. Data architecture components of an architecture roadmap
6. Artifacts Produced
	1. Catalogs: Data entity/data component catalog
	2. Matrices: Data entity/business function matrix, **Application/Data matrix**
	3. Diagrams: Conceptual data diagram, logical data diagram, data dissemination diagram, data security diagram, data migration diagram, data lifecycle diagram

### Phase C - Application Architecture ###
1. The purpose is: Develop **target application architecture**
2. The purpose is: Identify **candidate architecture roadmap** items based on gaps
3. Inputs to Phase C, Application Architecture (everything from previous phases - if data is done first, it's outputs are included)
	1. External reference materials
	2. Request for Architecture Work (optional) (Preliminary Phase)
	3. Capability assessment (Phase A)
	4. Communications plan (Phase A)
	5. Organization Model for Enterprise Architecture (Prelim Phase)
	6. Tailored Architecture Framework (Prelim Phase)
	7. Application principles (TOGAF Specification Chapter 20)
	8. Approved Statement of Architecture Work (Phase A)
	9. Architecture vision (Phase A)
	10. Architecture Repository
	11. Draft architecture documents and draft requirements (Phase A)
	12. Business and data related architecture roadmap (Phase B)
4. Steps for Phase C, Application Architecture
	1. Select reference models, viewpoints, and tools
	2. Develop baseline application architecture description
	3. Develop target application architecture description
	4. Perform gap analysis
	5. Define candidate roadmap components
	6. Resolve impacts across the architecture landscape
	7. Conduct formal stakeholder review (get feedback and sign-off)
	8. Finalize application architecture
	9. Construct architecture definition document
5. Outputs from Phase C, Application Architecture
	1. Refined Phase A deliverables
	2. Draft architecture definition document
		1. Baseline application architecture v1.0
		2. Target application architecture v1.0
	3. Draft architecture requirements specification - gap analysis
	4. Application architecture components of an architecture roadmap
6. Artifacts Produced
	1. Catalogs: Application portfolio catalog, interface catalog
	2. Matrices: Application/ organization matrix, role/ application matrix, application function matrix, application interaction matrix
	3. Diagrams: Application Communication diagram, Application and User Location diagram, Application Use-Case diagram, Enterprise Manageability diagram, Process/ Application Realization diagram, Software Engineering diagram, Application Migration diagram, Software Distribution diagram

### Phase D - Technology Architecture ###
1. Purpose is: Develop the **target technology architecture**
	1. After this planning and putting into calendar etc...
2. Purpose is: Identify **candidate architecture roadmap** items based on gaps
3. Inputs to Phase D:
	1. External reference materials
	2. Product information on candidate products
		1. If third party app
			1. What hardware (servers)
			2. Additional servers
			3. Purchase hosting
			4. Contracts
			5. Any product info becomes inputs to target tech arch
	3. Request for Architecture Work (optional) (Prelim Phase)
	4. Capability assessment (Phase A)
	5. Communication plan (Phase A)
	6. Organization Model for Enterprise Architecture (Prelim Phase)
	7. Tailored Architecture Framework (Prelim Phase)
	8. Technology principles (TOGAF Specification Chapter 20)
	9. Approved Statement of Architecture Work (Phase A)
	10. Architecture Vision (Phase A)
	11. Architecture Repository
	12. Draft Architecture documents and draft requirements (Phase B and C)
	13. Business, data and application components of an architecture roadmap (Phase B and C)
4. Steps for Phase D:
	1. Select reference models, viewpoints, and tools
	2. Develop baseline technology architecture description
	3. Develop target technology architecture description
	4. Perform gap analysis
	5. Define candidate roadmap components
		1. Any changes to make to technology based on changes made to data and application
	6. Resolve impacts across the architecture landscape
	7. Conduct formal stakeholder review
	8. Finalize technology architecture
	9. Construct architecture definition document
5. Outputs from Phase D:
	1. Refined Phase A deliverables
	2. Draft architecture definition document
		1. Baseline technology architecture v1.0
		2. Target technology architecture v1.0
	3. Draft architecture requirements specification - gap analysis
	4. Technology architecture components of an architecture roadmap
6. Put into roadmap
7. Next:
	1. Analyzing
	2. Coming up with plan
	3. Prioritise 
	4. Work with other teams to put the plan into motion
8. Artifacts Produced:
	1. Catalogs: Technology Standards catalog, Technology Portfolio catalog
	2. Metrics: Application/ Technology matrix
	3. Diagrams: Environments and Locations diagram, Platform Decomposition diagram, Processing diagram, Networked Computing/ Hardware diagram, Communications Engineering diagram
9. Look for opportunities using emerging technologies
	1. 9.2
		1. Emerging technologies
			1. TOGAF changes slower than technology
			2. Drones, cloud, edge, ...
				1. Think about the trend and make decisions

## Continuing with the ADM ##
### Phase E - Opportunities and Solutions ###
1. The purpose is to: generate the initial architecture roadmap
	1. Finalize roadmap
		1. List of work items
		2. Schedule and timelines
		3. Order
2. The purpose is to: identify if transition architectures are required
	1. Temporary stoping points in between
		1. If the change is too big to do at once
3. 9.2: The purpose is to: define solution building blocks (SBBs) *new
	1. Generalizations of SBBs that can be re-used in organization
4. Inputs to Phase E:
	1. External reference matarials
	2. Product information
	3. Request for Architecture Work (optional) (Prelim Phase)
	4. Capability assessment (Phase A)
	5. Communications plan (Phase A)
	6. Planning methodologies
		1. We need to know how our company does planning and get involved
	7. Organization Model for Enterprise Architecture (Prelim Phase)
	8. Tailored Architecture Framework (Prelim Phase)
	9. Approved Statement of Architecture Work (Phase A)
	10. Architecture vision (Phase A)
	11. Architecture Repository
	12. Draft architecture documents and draft requirements (BDAT)
	13. Change requests for existing business programs and projects
		1. Evaluate through governance model
	14. Candidate architecture roadmap components
5. Steps for Phase E:
	1. Determine key corporate change attributes
		1. How company deals with change
	2. Determine business constraints
		1. It is not green field
		2. Contracts
		3. Vendors for hosting
		4. Budget limitations
		5. Things that are off limits
		6. Timelines
	3. Review and consolidate gap analysis from Phase B to D
	4. Review consolidated requirements across business functions
	5. Consolidate and reconcile interoperability requirements
		1. If conflicting requirements
		2. Restricted things or open things
		3. Reconcile among conflicts
			1. Interoperability between different business units within the organization and with outside organizations are reconciled and consolidated
	6. Refine and validate dependencies
		1. Understand dependencies (especially with hardware etc...)
	7. Confirm readiness and risk for busines transformation
		1. Ensure business is in a state of knowing that we have got  risks and we are going to be doing business transformation
			1. This is where we start migration strategy
	8. Formulate implementation and migration strategy
		1. How are we going to do this?
		2. Is internal team going to do it?
		3. Do we have to hire somebody?
			1. Putting constraints on them
	9. Identify and group major work packages
		1. Translate roadmap into work packages
			1. To teams
			2. To projects
	10. Identify transition architectures
		1. Done if we cannot get from baseline architecture to target architecture in a single jump
	11. Construct the architecture roadmap & implementation and migration plan
		1. What to do and scheduling
		2. Part of project planning
			1. Bring in 
				1. Implementers
				2. Business units
				3. Project managers
6. Outputs from Phase E:
	1. Refined Phase A deliverables
	2. Draft architecture definition document - incl. baseline and target, v1.0
	3. Draft architecture requirements specification - incl. gap analysis
	4. Capability assessments
	5. Architecture roadmap, version 0.1
	6. Implementation and migration plan, version 0.1
		1. Draft version
		2. Not sine off yet
7. Artificts Produced
	1. Diagrams: Product context diagram, benefits diagram

### Phase F - Migration Planning ###
1. The purpose is to: Finalize the architecture roadmap and migration plan
2. The purpose is to: ensure migration plan is aligned with enterprise approach to change
	1. Understanding business's ability to change is integral into having successful changes
3. The purpose is to: ensure business value and cost of work packages is understood
	1. It should increase revenue
	2. It should reduce cost
	3. We should be able to narrate good story with numbers that we are going to save this much money and we are going to make this much on the backend
4. Inputs to Phase F
	1. External reference materials
	2. Request for Architecture Work (optional) (Prelim Phase)
	3. Capability assessment (Phase A)
	4. Communications plan (Phase A)
	5. Organization Model for Enterprise Archtiecture (Prelim Phase)
	6. Governance Models and Frameworks
	7. Tailored Architecture Framework (Prelim Phase)
	8. Approved Statement of Architecture Work (Phase A)
	9. Architecture vision (Phase A)
	10. Architecture Repository
	11. Draft architecture documents and draft requirements (BDAT)
	12. Change requests for existing business programs and projects
	13. Architecture roadmap, version 0.1 (Phase E)
	14. Capability Assessment
	15. Implementation and migration plan, version 0.1 (Phase E)
5. Steps for Phase F
	1. Confirm management framework interactions
		1. How company runs in terms of management frameworks
		2. Do we have project management framework? PMP? Prince 2 etc...
	2. Assign a business value for each work package
		1. If we are trying to get a team together to implement then we must be able to unlock say $ 250k or push us closer to business goals in some way
	3. Estimate resource requirements, project timings, etc...
	4. Prioritize the migration projects
		1. Low value and high cost projects have to be pushed to the bottom
	5. Confirm architecture roadmap and update architecture definition document
		1. Polishing stage
	6. Generate implementation and migration plan
		1. Final plan
	7. Complete the architecture development cycle, lessons learned
		1. We are now ready to hand over to implementors
		2. What did we learn
		3. What will we do differently the next time?
		4. How can we grow and architecture team to make this process better?
6. Outputs from Phase F:
	1. Implementation and Migration Plan, version 1.0
	2. Finalized architecture definition document
	3. Finalized architecture requirements
	4. Finalized architecture roadmap
	5. Reusable Architecture Building Blocks (ABBs)
		1. Can we generalize some of these and re-use them in future cycles?
	6. Requests for Architecture Work for next ADM cycle (if any)
		1. Is any more architecture work required so that we can get more work out of this as well?
	7. Implementation of governance model
	8. Change requests for architecture capability from lessons learned
		1. Go back to priliminary phase and touch upon our architecture capability (if we have lessons learned)
			1. If we have to hire someone
			2. If we have to modify certain TOGAF steps
			3. If we have to do certain things earlier
			4. ...
7. Artifacts produced: none

### Phase G - Implementation Governance ###
1. It assumes that architects are not the implementors
	1. Don't change hats to then implement
	2. Our role is to ensure people entrusted to implement are doing it
2. The purpose is to: ensure _confirmance_
	1. confirmance: What we plotted out for our architecture is actually being implemented
3. The purpose is to: perform architecture governance
	1. If change is required (implementation team has better and cheaper solution)
		1. The team has to go through the architecture governance process
		2. If change is approved, it is implemented
2. Inputs to Phase G
	1. External reference materials
	2. Request for Architecture Work (optional) (Prelim Phase)
	3. Capability assessment (Phase A)
	4. Organization Model for Enterprise Architecture (Prelim Phase)
	5. Tailored Architecture Framework (Prelim Phase)
	6. Approved Statement of Architecture Work (Phase A)
	7. Architecture vision (Phase A)
	8. Architecture Repository
	9. Architecture definition documents and requirements (BDAT)
	10. Architecture roadmap, version 1.0 (Phase F)
	11. Implementation governance model
		1. How do we govern
	12. Architecture contract
		1. Optional in TOGAF but highly recommmended
		2. When we hand over documents to implementation team we need to go over the architecture and get them to commit to stick to the architecture
			1. Through contract
			2. If there is change request, it must be reviewed and approved
			3. Implementation team cannot choose or not to choose to implement something on their own
	13. Request for architecture work for next ADM cycle (Phase F)
	14. Implementation and migration plan, version 1.0 (Phase F)
3. Steps for Phase G
	1. Confirm Scope and Priorities for Development
	2. Identify Deployment Resources and Skills
		1. Understand who is doing
	3. Guide Development of Solutions Deployment
		1. We must be a guide and ensure we are always available for help in terms of making certain decisions or making sure what they are discussing is in confirmance
	4. Perform Enterprise Architecture Compliance Reviews
		1. If the team is coming up with their own solution level requirements then review their documents to ensure they are compliant
	5. Implement Business and IT Operations
	6. Perform Post-Implementation Review and Close the Implementation
		1. Verify if the contract is met
		2. Then consider implementation is completed
		3. If transition architectures
			1. Each implementation is verified against transition architecture
			2. Then we go back to phase G for next transition architecture (next phase) - iterative
			3. Until all are done
4. Outputs from Phase G
	1. Architecture contract
		1. "... joint agreements between development partners and sponsors on the deliverable, quality, and fitness-for-purpose of an architecture"
		2. Read chapter 23 of the TOGAF 9.2 spec
	2. Compliance assessments
		1. When reading their requirements
		2. Reviewing their work
		3. Watching their beta
		4. ...
	3. Change requests
		1. If they come back to say we need to make changes to the architecture based on these factors
	4. Architecture-compliant solutions deployed
		1. Major milestone
5. Artifacts Produced: None

### Phase H - Architecture Change Management ###
1. It is like holding phase
	1. Now we are waiting for changes to happen
2. The purpose is to: maintain architecture lifecycle
3. The purpose is to: execute architecture governance
	1. Any changes must go through change request process and governance and approval and documents reflect the changes if approved
4. The purpose is to: maintain architecture capability
	1. We might be in here for a while
	2. Keep mindful that people might move on to other projects but we must not lose the architectural capability
		1. Ensure when we start the next round of architecture, there is no long gap (like 18 months) and the people are still available and there is still the architecture capability
5. Inputs to Phase H (not active in constructing artifacts)
	1. External reference models
	2. Request for Architecture Work (optional) (Prelim Phase)
	3. Organization Model for Enterprise Architecture (Prelim Phase)
	4. Tailored Architecture Framework (Pelim Phase)
	5. Statement of Architecture Work (Phase A)
	6. Architecture vision (Phase A)
	7. Architecture Repository
	8. Architecture definition documents and requirements (BDAT)
	9. Architecture roadmap (Phase F)
	10. Change requests - technology changes, business changes, lessons learned
	11. Implementation governance model
	12. Architecture contract (Phase G)
	13. Compliance assessments (Phase G)
	14. Implementation and migration plan, version 1.0 (Phase F)
6. Steps for Phase H
	1. Establish Value Realization Process
		1. If target is saving $750M, then our job is to ensure the value is realized
		2. Did the process result in ending contract with vendor to cut the cost or shut down the process etc... (if not then work is adding for expenses and not saving money)
			1. Ensure the value we are expected to get indeed we get
	2. Deploy Monitoring Tools
		1. Ensure application remains in compliance
			1. We are getting sales
			2. We are getting analytics
			3. We are tracking the use of those things
	3. Manage Risks
	4. Provide Analysis for Architecture Change Management
	5. Develop Change Requirements to Meet Performance Targets
		1. Suppose we are not getting the value we thought we would
			1. (say higher sales)
			2. Do we need to make small changes to meet performance targets and if so it becomes change request and it becomes part of architecture governance and it can be implemented
	6. Manage Governance Process
	7. Activate the Process to Implement Change
7. Outputs from Phase H (here target becomes the baseline since it is already implemented)
	1. Architecture updates (maintenance)
	2. Change to architecture framework and principles (maintenance)
		1. If we have to move things around
	3. New Request for Architecture Work (for major changes)
		1. Inputs to Phase A
		2. If the changes are large and impactful, we need to start a new phase (ADM cycle)
	4. Statement of architecture work (updated if necessary) - result of change
		1. It is a project kickoff document
		2. Get it approved to start architecture work
	5. Architecture contract (updated if necessary)
	6. Compliance assessments (updated if necessary)
		1. Ensure things have not changed in terms of compliance
8. Artifacts Produced: none
9. Does a proposed change require a new ADM cycle? ADM cycle (central part)
	1. Ouptcome of phase H: do we need to kickoff a new cycle
	2. Or support the change as part of change management? (without starting new cycle)

### Requirements Management Phase ###
1. Technically, it's a phase. But it's constantly running during ADM cycle (also driving the ADM cycle)
2. Continuous process of handling change during any phase of the ADM process
3. Being able to handle change at any time is crucial for the ADM to succeed
	1. If an important requirement comes for Phase B while in Phase F we cannot wait until cycle is complete
	2. We must handle and adapt to change (hence the phase)
4. The purpose is: ensure the process is sustained through all phases
5. The purpose is: manage change while the ADM cycle is in progress
6. The purpose is: provide the requirements to each ADM phase
7. The RM Phase manages the "flow" of requirements
	1. Flow management
	2. We don't do handling of change in RM phase
	3. RM flow stops flow for new requrement and go back to Phase B (say)
		1. The change is handled in Phase B
8. Requirements Management is the process that manages the repository
	1. It is the controller of Architecture repository
		1. Any requirements that are coming and going between phases is handled by RM

## ADM Guidelines and Tools ##
### Introduction to ADM Guidelines and Tools ###
1. ADM Guidelines and Techniques
	1. Using the TOGAF ADM in the context of a specific Architectural Style
	2. Architecture Principles
	3. Stakeholder Management
	4. Architecture Patterns
	5. Business Scenarios
	6. Gap Analysis
	7. Migration Planning Techniques
	8. Interoperability Requirements
	9. Business Transformation Readiness Assessment
	10. Risk Management
	11. Capability-Based Planning

### ADM with Architecture Styles ###
1. How TOGAF ADM works with different architectural styles (9.2 new)
	1. Read spec document: Open group about different arch styles
2. As softawe development matures...
	1. Different architectural styles are used
	2. Many styles of application architecture have been adopted
	3. TOGAF does not need to change much based on your style
		1. Adapt outputs: documents and artifacts to match the style
			1. But you might want to change the content of your documents to fit
			2. Architere Content Metamodel
	4. Adopt different views, models, and tools
	5. TOGAF has a Service Oriented Architecture work group
		1. Constructing documents and designing SO requirements specific to that in relationship with TOGAF
			1. Open Group's website

### Architecture Principles ###
1. An enduring set of general rules and guidelines about architecture
2. Not intended to change very often
	1. We really want the principles to be like a light that guides (don't want to change very often)
3. Defined during the Priliminary Phase
	1. Re-affirmed during vision phase and subsequent phases
4. Serves as a statement by which you can use to make decisions
	1. Don't have to debate over paths
5. Example - Data architecture principle
	1. Data trustee
		1. Each data element has a trustee accountable for data quality (person or group)
			1. If we want to add new data
				1. Who is responsible for quality of the data
6. Five elements of a Good Principle:
	1. Understandability: We can explain in clear and unambiguous way (difficult to violate)
		1. Everyone should be able to understand
	2. Robustness: Should be definitive and precise
		1. Clear
		2. Defined well
		3. No vagueness
	3. Completeness: Covers all of the situations we encounter
	4. Consistency: Interpreted consistently (not contradicting principles)
		1. All must be compatable
	5. Stability: Enduring
		1. Don't have to change week by week or month by month
			1. We have a process in place to define or stop or modify principles

### Stakeholder Management ###
1. Stakeholder: An individual, team, organization, or class thereof (type), having an interest in a system
	1. Who has no interest is not a stakeholder
2. As an architect being able to win support for your plans is a skill
3. Knowing who the most powerful stakeholders are....
	1. List them
	2. Know their concerns and address
4. Makes things easier for approval and budgets
	1. One person is noisy (may not be drivers)
	2. One person is eager (may not be drivers)
5. Can establish a communication plan to keep them informed
	1. Do they have to be informed after decisions are made?
	2. Do they have to be in the room while decisions are made?
	3. If we can win key stokeholder then they can line those that report to them
	4. Identify problems and conflicts early in order to avoid them
		1. Someone wants more control over a function or feature
		2. Another stakeholder might be trying to get that open into less control
		3. We have to navigate through conflicts
			1. Understand
				1. Who those people are
				2. How important they are
				3. What their concerns are
6. TOGAF diagram:

				High	C (Keep Satisfied)	D (Key Players)
		Power	Low		A (Minimal Effort)	B (Keep Informed)
							Low					High
								Level of Interest
								
	1. Low level: Don't worry too much
	2. High power:
		1. Low level of interest: key player
		2. High level of interest: key player

### Architecture Patterns ###
1. "An idea that has been useful in one practical context and will probably be useful in others" - M. Fowler
	1. TOGAF has the concept of building blocks: what you use
		1. Architecture patterns is: when, why and how you use (and limitations)
2. Do not currently play a big role in the TOGAF Standard
3. Once you have developed a number of building blocks, you may want to establish patterns for them
	1. Min requirements we must have before we use that pattern (call center say)

### Business Scenarios ###
1. TOGAF 9.2 made this existing tool more prominent
2. Library (separate from standard)
3. What is a business scenario? 4 parts (mentioned in Phase A)
	1. A business process, application, or set of applications (something operating on the business)
	2. The business and technology environment
		1. In what scenario is this application or this people or this process operating
	3. The people and software systems ("actors") involved
		1. Similar to Use cases
	4. The desired outcome
		1. What is that we want to happen
			1. Customer service? Customer should get resolution to problem in timely fashion etc...
		2. The establish essentially the parts of the business that are trying to drive towards desired business outcome
4. Anyone should be able to understand a business problem and solution by reading the business scenario
	1. Example: Consider architecture vision phase
		1. Suppose we are watching what the business is doing and what the business goal is
			1. It becomes:
				1. A neatly laid out business case
					1. Anyone who reads this should come to very similar conclusion as you (there may be some back and forth regarding what you can do to change the process or improve the application or improve the capability of the business outcome)
						1. Everyone should be able to follow the pattern

### Gap Analysis ###
1. Key step in the BDAT Phases and Migration Planning (Phases B-E)
2. Gap analysis:
	1. Baseline architecture
		1. Architecture as it exists today
	2. Target archtiecture
		1. Archtiecture that will exist when you reach the full implementation
	3. We go through line by line of both the documents and we list out all of the differences
	4. Gaps: Anything added, changed or intentionally omitted
		1. Will also identify things accidentally omitted or missing from target architecture that needs to be there
			1. We can go back and correct target architecture if it is missing a key piece that needs to be there
				1. Things are not perfect the first time we do this document
3. It should be clear and easy to explain why things were added or removed
	1. Why?
		1. Added because it should improve this...
		2. Removed because it is unnecessary etc...
4. Exam: Steps are not required
	1. Need to know what gap analysis is and why it is important

### Migration Planning ###
1. TOGAF contains a number of tools for migration planning
	1. Chapter 24
2. Migration Planning, Phase F (not very huge in test)
	1. Implementation Factor Assessment & Deduction Matrix
	2. Consolidated Gaps, Solutions & Dependencies Matrix
	3. Architecture Definition Increments Table
	4. Transition Architecture State Evalution Table
	5. Business Value Assessment Technique

### Interoperability ###
1. "the ability to share information and services"
2. Business Interoperability: how business teams work together (one with other teams and processes that are out of our scope)
	1. When we are designing documents, requirements etc... should work well with others (stuff that are outside of our scope)
		1. Scope does not mean we build a firewall and not work with others
3. Information Interoperability: how data is shared
	1. Data architecture
4. Technical Interoperability: how technical services connect to one another
	1. How data are going to be shared between two business partners in a secure manner to have a pathway between one service and another that needs to talk to each other (say)
5. Each of the architecture definition phases has elements of interoperability
6. Architects think about how and what they do interacts with the "outside world" during the process
	1. What we do interacts with other people and companies etc...

### Business Readiness Transformation Assessment BRTA ###
1. Preliminary phase of ADM: How ready the business is for change (how the business handles change)
2. As an enterprise architect, we must get people to agree to those changes and get the changes implemented and be successful to unlock the business value the changes are designed for
3. BTRA: It is a tool or system (part of TOGAF spec) that will help to determine the readiness factors of the organization
4. "evaluating and quantifying an organization's readiness to undergo change"
5. No point constructing architecture if it'll be ignored
	1. If implemented then something might happen that makes it a big failure or we are not unlocking any of the value
6. Understanding how to get your organization to change is key to success
7. Recommended activities for BRTA
	1. Determine the readiness factors that will impact the organization
	2. Present the readiness factors using maturity models
	3. Assess the readiness factors, including determination of readiness factor ratings
	4. Assess the risks for each readiness factor and identify improvement actions to mitigate the risk
	5. Work these actions into Phase E and F implementation and migration plan
8. The enterprise may not have the readiness to change
	1. Structure implementation plan to address those to say
		1. We are going to do this in such a way that it is virtually going to be risk free to the enterprise or
		2. We are going to do this in a pilot project first or 
		3. We are going to do the least risky thing first or
		4. We are going to do the highest value thing first
	2. Define whatever order we need to put in place (whatever mitigation strategy we want to use to get around organization's resistence for change)
9. Example readiness factors:
	1. Vision
		1. It is the ability to define and communicate what is that we want to achieve
			1. If we can get everyone to bind on the vision, that is going to mitigate your resistance for change
	2. Desire, Willingness, Resolve
	3. Need
		1. If there is varying level of need across the organization
	4. Business Case
	5. Funding
	6. Leadership, Sponsor, Champion
		1. If there is a senior person who is well liked in the organization and who is ready to take your case and can become a champion for change or if the person is resistent to you (it is a challenge)
	7. Governance
	8. Accountability
	9. IT Capacity to Execute
	10. Enterprise Capacity to Execute
10. Example Factor: Need
	1. How strong is the business need for enterprise architecture?
	2. Does every part of the business recognize this as being required?
	3. How committed is the senior leadership to this?
		1. They recognize them as well - readiness factor
			1. Mitigate, address, re-factor work packages, re-factor business case to strengthen this

### Risk Management ###
1. Technique used to mitigate risk when we are implementing an architecture project
2. What are the risks of migrating to the target architecture?
	1. Business is about risks and it is about mitigating those risks to reap rewards of taking the risks
	2. When we define or assign our target architecture, we need to say we are going to run from first base to second base then what are the risks of getting from first base to second base
		1. Are those acceptable level of risks?
		2. Is there anything we can do to mitigate that?
3. Identify them, and track them (measure)
	1. When we mitigate the risks, we can see that we are actually mitigating them
4. TOGAF has the concept of Initial Level of Risk and Residual Level of Risk
	1. Initial level of risk is the risk that exists if you do nothing to mitigate them
		1. If going from A to B, and we do nothing to mitigate that risk, we need to define what those risks are
	2. Residual level of risk is the risk that remains after you have mitigated them
		1. Activities with 0 risk usually have very low reward
		2. Ensure
			1. Measures are in place
			2. Project in place
			3. Surveys in place
5. Example: Client acceptance risk
	1. Goal of ADM process (say) to increase level of self sufficiency of customers
		1. Self service portal
			1. Instead of call on phone
			2. Instead of coming in person to the store
		2. Push everyone to use the website and self serve (lower cost and increase self sufficiency of customers)
			1. Risks: Client acceptance risk
				1. Are the clients going to enjoy serving themselves or are they going to feel that is something that they don't want to do?
					1. We need to define this risk
		3. How do you measure it?
			1. Surveys
			2. Bring in customers
				1. Show them the process
				2. Show them the portal
				3. Ask for their opinion
				4. Try to get a broad cross section of clients to get their opinon before we roll this stuff out
		4. How do you mitigate it?
			1. Suppose clients in the surveys don't like the portal and are missing talking to someone
				1. Is there any intermediate step that we can do to assure people that this is a better level of service for them or maintain that the existing level of services are not going away etc...?
6. And what would the cost to the business be if it comes true?
	1. If clients do not accept the portal as we dream then what is the cost to the business?
		1. Are we increasing the cost to run those things but not reducing expenses because customers are not using it etc...

### Capability Planning ###
1. "a business planning technique that focusses on business outcomes"
2. Capabilities are business-driven and ideally business-led
	1. Designed to combat the fact that organizations are split along functions
		1. Public or private businesses are organized functionally
			1. HR department
			2. Finance department
			3. Development department
			4. IT department
			5. Call center department
			6. Design department
			7. ... (vertical)
		2. Company is delivering services horizontally
			1. From design department through development department to technology department upto final customer
				1. The departments must be rowing the boat in the same direction on particular cadence to give the optimal service to the customer
3. Many business functions work together to deliver one capability
4. Example: Ability to construct flawless products (build reputation)
	1. Apple say
		1. Who is responsible for these flawless products?
			1. Requires multiple business functions to work together
				1. Product design, software development, manufacturing, retail/ sales (they have to work together)
					1. Entire company must work to give this experience to the customer
						1. If any of the departments doesn't do a good job, then we are going to fail on the capabilities
							1. Capabilities crosses functional teams
							2. Capabilities planning focusses on business outcomes
5. The company plans for the capability of "flawless products", not just "best sales team"

## Other Important TOGAF Concepts ##
### Architecture Capability Framework and Architecture Governance ###
1. Other supporting players
	1. Frameworks:
		1. Architecture governance
			1. A system of controls over architecture
				1. We put governance in place and it is going to be a systemised process for how you make changes to architecture
					1. It controls how architecture changes
		2. A system to ensure compliance with architecture
			1. Implementation team has signed the contract
			2. Over months and years down the road, we are ensuring the architecture complies with the definitions constructed and there are no changes to the architecture that has not gone through the governance process
		3. Effective management of the systems
		4. Accountability to the business for that
			1. Governance team has to go back to both the corporate (might be executive board) or might be IT governance or technology governance
				1. We can say, we said we will deliver this and the team delivered this and we can ensure that so many months down the road that we are complying with that
		5. Governance is layerd within most organizations
			1. There may not be architecture governance board
			2. Levels:
				1. Corporate governance (outside the scope of enterprise architecture)
					1. Need to meet with the group once in a while to talk about the long term vision making sure that each department has goals and vision to achieve those goals
				2. Technology governance (outside the scope of enterprise architecture)
				3. IT governance (outside the scope of enterprise architecture)
				4. Architecture governance
					1. Principles of Good Governance
						1. Discipline
							1. Everyone who is involved in governance needs to be committed to adhering and sticking to that process
								1. We cannot make changes to architecture without the approval of architecture governance board
									1. Everyone must agree to that and follow it
						2. Transparency
							1. All actions are available for inspection
								1. All decisions must be explicable
						3. Independence
							1. We must not have a team or department or individual who has undue influence over making that decision
							2. We are making decision for the good of the entire organization and it is not that certain department is pulling in their direction and gives rise to conflict of interest
						4. Accountability
							1. Architecture governance is responsible for corporate governance and IT governance etc... above it.
							2. To ensure they have made their decisions and they stand by their decisions (accountable)
						5. Responsibility
							1. Everyone involved in the governance has to act responsibly
						6. Fairness
							1. Ensure all decisions made on the architecture governance process don't give unfair advantage to any parties (working for entire organization and not favoring a member or particular group at the expense of other parties)
					2. Architecture Board:
						1. Cross organization board that makes sure that architecture governance is executed
						2. It is supposed to be representative of all the key stakeholders in the architecture (not just self appointed arhitect who leads the board but must include senior members across different departments who meet regularly)
							1. The architectural decisions must represent the entire organization (in that way we can follow the key principles)
		6. Architecture Contracts
			1. "joint agreements between development partners and sponsors on the deliverables, quality, and fitness-for-purpose of an architecture"
				1. When we are kicking off ADM phase (in Phase A) we are agreeing to a statement of work
				2. Statement of work: It is a contract between sponsors and people who are paying for the architectural work and ourselves that I am going to build an architecture that meets their purposes
			2. Contracts between implementers and us in Phase J and H that they are going to follow the architecture
				1. They agree that we give them exactly what to implement and they implement it
				2. Phase H: Maintenance mode - they must not change what was implemented without following proper architecture governance
		7. Architecture compliance
			1. Different definitions (how implementation matches the definition)
				1. Irrelevant
					1. Definition and implementation have nothing in common (between features in architecture and what is implemented)
				2. Consistent
					1. Spec has parts of it fully and properly implemented but implementation does not cover every part of the spec and there are parts in implementation that are not part of the spec
					2. It is not wrong but not perfect
				3. Compliant
					1. Implementation is 100% true to the architecture definition except that there are whole parts of the definition that are not implemented
						1. Implementation is a subset of the overall architecture
				4. Conformant
					1. Implementation is a superset of spec
					2. Implemented the entire spec + more
				5. Fully conformant
					1. Perfection!
					2. Spec and implementation 100% match
						1. Nothing in architecture that is not fully implemented
						2. Nothing in the implementation that is not there in the architecture
				6. Non-conformant
					1. There are features in architecture spec which are implemented but they are not in accordance with the spec
						1. They were told to do it but they did something different
		7. Compliance Reviews
			1. As we go to Phase G - Implementation, we want to make sure the implementation is in conformance with the architecture defined
				1. It is part of compliance reviews
			2. It is also part of compliance when we are in Phase H - waiting mode
				1. When we are handling change requests, we want to make sure that implementation does not change (no un-approved changes to the environment)

## Wrapping Up ##
### Thank You and Congratulations ###
1. Book a date in 2 weeks
2. Spend rest of the time
	1. Reading standard
	2. Review standard
	3. Read sections that are interesting or vague
	4. Read through definitions chapters
	5. Ensure we know outputs of various phases and be able to easily remember (which phase, which document)

### Discounts for More Courses ###
1. [Copy+of+Udemy+Bonus+Lecture+AUG2020.pdf](Copy+of+Udemy+Bonus+Lecture+AUG2020.pdf)