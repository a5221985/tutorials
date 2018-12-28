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

## Wrapping It Up ##
### The Enterprise Continuum ###
### Capability Assessment ###
### Stakeholders and Views ###
### Architecture Governance ###
### Reference Models ###

## Conclusion ##
### Booking the Exam ###
### What to Expect for Level 2 ###
### Finale ###
### More Resources ###

## Bonus Lectures ##
### Q&A - Your Questions ###
### $117 per hour as an Enterprise Architect ###
### TOGAF 9.1 Cheat Sheet Download ###
### TOGAF Part 1 Study Course - Audio Files ###
### TOGAF Part 1 Study Course - PDF Files ###

## Preliminary Phase In Detail: Step by Step ##
### Phases and Steps Bonus Videos ###
### Preliminary Phase, Step 1 ###
### Preliminary Phase, Step 2 ###
### Preliminary Phase, Step 3 ###
### Preliminary Phase, Step 4 ###
### Preliminary Phase, Step 5 ###
### Preliminary Phase, Step 6 ###

## Phase A In Detail: Step by Step ###
### Phase A, Architecture Vision, Step 1 ###
### Phase A, Architecture Vision, Step 2 ###
### Phase A, Architecture Vision, Step 3 ###
### Phase A, Architecture Vision, Step 4 ###
### Phase A, Architecture Vision, Step 5 ###
### Phase A, Architecture Vision, Step 6 ###
### Phase A, Architecture Vision, Step 7 ###
### Phase A, Architecture Vision, Step 8 ###
### Phase A, Architecture Vision, Step 9 ###
### Phase A, Architecture Vision, Step 10 ###
### Phase A, Architecture Vision, Step 11 ###

## Phase B In Details: Step by Step ##
### Phase B, Business Architecture, Step 1A ###
### Phase B, Business Architecture, Step 1B ###
### Phase B, Business Architecture, Step 2 ###
### Phase B, Business Architecture, Step 3 ###
### Phase B, Business Architecture, Step 4 ###
### Phase B, Business Architecture, Step 5 ###
### Phase B, Business Architecture, Step 6 ###
### Phase B, Business Architecture, Step 7 ###
### Phase B, Business Architecture, Step 8 ###
### Phase B, Business Architecture, Step 9 ###

## Phase C (Data) In Detail: Step by Step ##
### Phase C, Data Architecture, Step 1 ###
### Phase C, Data Architecture, Step 2 ###
### Phase C, Data Architecture, Step 3 ###
### Phase C, Data Architecture, Step 4 ###
### Phase C, Data Architecture, Step 5 ###
### Phase C, Data Architecture, Step 6 ###
### Phase C, Data Architecture, Step 7 ###
### Phase C, Data Architecture, Step 8 ###
### Phase C, Data Architecture, Step 9 ###

## Phase C (Application) In Detail: Step by Step ##
### Phase C, Application Architecture, Step 1 ###
### Phase C, Application Architecture, Step 2 ###
### Phase C, Application Architecture, Step 3 ###
### Phase C, Application Architecture, Step 4 ###
### Phase C, Application Architecture, Step 5 ###
### Phase C, Application Architecture, Step 6 ###
### Phase C, Application Architecture, Step 7 ###
### Phase C, Application Architecture, Step 8 ###
### Phase C, Application Architecture, Step 9 ###

## Phase D In Detail: Step by Step ##
### Phase D, Technology Architecture, Step 1 ###
### Phase D, Technology Architecture, Step 2 ###
### Phase D, Technology Architecture, Step 3 ###
### Phase D, Technology Architecture, Step 4 ###
### Phase D, Technology Architecture, Step 5 ###
### Phase D, Technology Architecture, Step 6 ###
### Phase D, Technology Architecture, Step 7 ###
### Phase D, Technology Architecture, Step 8 ###
### Phase D, Technology Architecture, Step 9 ###

## Phase E In Detail: Step by Step ##
### Phase E, Opportunities and Solutions, Step 1 ###
### Phase E, Opportunities and Solutions, Step 2 ###
### Phase E, Opportunities and Solutions, Step 3 ###
### Phase E, Opportunities and Solutions, Step 4 ###
### Phase E, Opportunities and Solutions, Step 5 ###
### Phase E, Opportunities and Solutions, Step 6 ###
### Phase E, Opportunities and Solutions, Step 7 ###
### Phase E, Opportunities and Solutions, Step 8 ###
### Phase E, Opportunities and Solutions, Step 9 ###
### Phase E, Opportunities and Solutions, Step 10 ###
### Phase E, Opportunities and Solutions, Step 11 ###

## Phase F In Detail: Step by Step ##
### Phase F, Migration Planning, Step 1 ###
### Phase F, Migration Planning, Step 2 ###
### Phase F, Migration Planning, Step 3 ###
### Phase F, Migration Planning, Step 4 ###
### Phase F, Migration Planning, Step 5 ###
### Phase F, Migration Planning, Step 6 ###
### Phase F, Migration Planning, Step 7 ###

## Phase G In Detail: Step by Step ##
### Phase G, Implementation Governance, Step 1 ###
### Phase G, Implementation Governance, Step 2 ###
### Phase G, Implementation Governance, Step 3 ###
### Phase G, Implementation Governance, Step 4 ###
### Phase G, Implementation Governance, Step 5 ###
### Phase G, Implementation Governance, Step 6 ###

## Phase H In Detail: Step by Step ##
### Phase H, Architecture Change Management Steps ###

## Requirements Management In Detail: Step by Step ##
### ADM Architecture Requirements Management, Steps 1-5 ###
### ADM Architecture Requirements Management, Steps 6-10 ###

## Before We Start ##
### Start of TOGAF 9.2 Course ###
### Welcome to the Course! ###
### About Your Instructor ###
### What is Enterprise Architecture? ###
### The TOGAF Certification for People ###
### The TOGAF 9.2 Standard ###

## Core and Basic Concepts ##
### Overview of Core Concepts ###
### Definition of Enterprise ###
### The Four Architecture Domains - BDAT ###
### Architecture Development Method - ADM ###
### Architecture Work Products - Deliverables, Artifacts and Building Blocks ###
### Enterprise Continuum ###
### Architecture Repository ###
### Architecture Capability ###

## The ADM ##
### Introduction to the ADM ###
### ADM Cycle ###
### Preliminary Phase ###
### Phase A - Architecture Vision ###
### Phase B - Business Architecture ###
### Phase C - Information Systems Architecture ###
### Phase C - Data Architecture ###
### Phase C - Application Architecture ###
### Phase D - Technology Architecture ###

## Continuing with the ADM ##
### Phase E - Opportunities and Solutions ###
### Phase F - Migration Planning ###
### Phase G - Implementation Governance ###
### Phase H - Architecture Change Management ###

## ADM Guidelines and Tools ##
### Introduction to ADM Guidelines and Tools ###
### ADM with Architecture Styles ###
### Architecture Principles ###
### Stakeholder Management ###
### Architecture Patterns ###
### Business Scenarios ###
### Gap Analysis ###
### Migration Planning ###
### Interoperability ###
### Business Readiness Transformation Assessment BRTA ###
### Risk Management ###
### Capability Planning ###

## Other Important TOGAF Concepts ##
### Architecture Capability Framework and Architecture Governance ###

## Wrapping Up ##
### Thank You and Congratulations ###
### Bonus Lecture ###