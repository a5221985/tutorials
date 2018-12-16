# Foundation Enterprise Architect Certification Trng #

## Before We Start ##
### Introduction ###
1. Open Group's Architecture Framework
	1. Part 1 exam preparation
2. TOGAF:
	1. Open Group:
		1. Large group of companies including government and universities
			1. Worked together to formalize the enterprise architecture design process (Dell included)
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
### Phase A: Architecture Vision ###
### Half Way Mark ###

## ADM: The Four Domains of BDAT ##
### Introduction to BDAT ###
### Phase B: Business Architecture ###
### Phase C: Information Systems Architecture, Data ###
### Phase C: Information Systems Architecture, Application ###
### Phase D: Technology Architecture ###

## ADM: Planning Implementation ##
### Phase E: Opportunities and Solutions ###
### Phase F: Migration Planning ###
### Phase G: Implementation Governance ###
### Phase H: Architecture Change Management ###
### ADM Architecture Requirements Management ###

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