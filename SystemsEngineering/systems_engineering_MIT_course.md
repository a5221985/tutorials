# Fundamentals of Systems Engineering #
## Requirements Definition ##
1. Design decisions are required for level 2, level 3, ... requirements
2. System requirements review
	1. Review and agree on level 0, level 1, may be level 2
		1. Other levels are design dependent
3. Problems:
	1. Can be traced back to requirements
		1. Over ambitious (un achievable)
		2. Missed requirements (clear later on and not written down)
4. Example: Good requirements:
	1. DC-3
		1. Key Requirements
			1. Range: 1000 miles
			2. Cruise Speed: 150 mph
			3. Passengers: 20-30
				1. Depending on configuration
			4. Twin Engines
			5. "Rugged and Economical"
				1. Fuzzy (today)
5. More complex systems needed when requirements are more ambitious
	1. Planes: 1000s and 1000s or requirements
		1. Later: Complexity management
	2. More and more requirements are added when systems grow in performance and complexity

### Requirements Standards ###
1. NASA Systems Engineering Handbook
	1. NASA/SP-2007-6105
		1. Section 4.2 (pp. 4048) - Technical Requirements Definition
		2. Section 6.2 (pp. 131-135) - Requirements Management (updating, adding, modifying)
		3. Appendix C (pp. 279-281) - How to write a good Requirement
		4. Appendix D (pp. 282-282) - Requirements Verification Matrix
2. International Council of Systems Engineering (INCOSE)
	1. Systems Engineering Handbook, Version 3.1
	2. Requirements Working Group
		1. [http://www.incose.org/ChaptersGroups/WorkingGroups/processes](http://www.incose.org/ChaptersGroups/WorkingGroups/processes)
3. ISO/IEC 15288 (IEEE STD 15288-2008)
	1. Systems and software engineering
	2. System life cycle processes
		1. 6.4.1 Stakeholder Requirements Definition Process

### Requirements set *constraints* and *goals* in the design and objective space ###
1. System design needs to have tradeoffs between performance, cost, schedule and risk
2. "Shall" - Requirements help set constraints and define the boundaries of the design space and objective space
3. "Should" - Requirements set goals once "shall" requirements are satisfied
4. Two spaces:
	1. **Design space** - things we decide as engineers
	2. **Objective space** - things our systems/products achieve and what our customers care about

### Concept ###
1. Requirements are input to the design process, while specifications are the output
2. Requirements vs Specifications
	1. Requirements
		1. Requirements specify _what_ the product or system shall/should do
			1. **Functions** it shall perform
			2. How well it should perform these
			3. Degree at automation of the system (what operations must do)
			4. Compatibility with other devices etc...
		2. Specifications describe _how_ the system is built and works
			1. The **Form** it is made of
				1. Materials used in the system
				2. Overall dimensions
			2. Schematics, Blueprints, etc...
			3. User Interface
3. Example:
	1. "Description"
		1. Large enough to accomodate big dishes
		2. 1,200 watts of power to reheat food quickly
		3. One touch settings for different food types (rice, pizza, frozen meals) ...
		4. Etc...
	2. "Specification"
		1. Stainless steel exterior
		2. Dimensions: 24" x 14" x 19"
		3. Weight: 45.5 lbs
		4. General warranty: 1 year
		5. Power cord: included
		6. Etc...

### Technical Requirements Definition Process ###
1. System Design Process
	1. Requirements Definition Process
		1. Stakeholder Expectations
		2. Technical Requirements Definition: The center Directors or designees shall establish and maintain a process, to include activities, requirements, guidelines, and documentation, for definition of the technical requirements from the set of agreed upon stakeholder expectations for the applicable WBS model
			1. Technical Solution Definition Processes
		3. Logical Decomposition
		4. Design Solution Definition
	2. Technical Management Processes
		1. Technical Planning Process
			1. Technical Planning
		2. Technical Control Process
			1. Requirements Management
			2. Interface Management
			3. Technical Risk Management
			4. Configuration Management
			5. Technical Data Management
		3. Technical Assessment Process
			1. Technical Assessment
		4. Technical Decision Analysis Process
			1. Decision Analysis
	3. Product Realization Processes
		1. Product Transition Process
			1. Product Transition
		2. Evaluation Processes
			1. Product Verification
			2. Product Validation
		3. Design Realization Process
			1. Product Implementation
			2. Product Integration
2. Shall: Requirements
3. Should: Goal - degree of attainment is flexible

### Purpose of Technical Requirements Definition ###
1. The technical requirements definition process
	1. Is used to **transform** the baseline stakeholder **expectations** (input) into unique, quantitative, and measurable technical **requirements** (output)
2. Requirements
	1. Come in many flavors
	2. Should be expressed as well-written "shall" statments that can be used for defining a design solution

### Importance of Technical Requirements Development (1/2) ###
1. Establishes the **basis for agreement** between the stakeholders and the developers on what the product is to do
	1. Legally signing
2. Reduces the development effort because **less rework** is required to address poorly written, missing, and misunderstood requirements.
	1. Forces the relevant stakeholders to consider rigorously all of the requirements **before** design begins
	2. Careful review can reveal omissions, misunderstandings, and inconsistencies **early** in the development cycle
3. Provides a basis for estimating **costs** and **schedules**
	1. The description of the product to be developed as given in the requirements is a **realistic basis** for estimating project costs and can be used to evaluate bids or price estimates

### Importance of Technical Requirements Development ###
1. Provides a baseline for verification
	1. Organizations can develop their validation and verification plans much more productively from a **good** requirements document.
	2. The requirements document provides a baseline against which **compliance** can be measured
	3. The requirements are also used to provide the stakeholders with a **basis for acceptance** of the system
2. Facilitates **transfer** of the product to new users
3. Serve as a basis for **later enhancement** or alteration of the finished product

### Interrelationships Among the System Design Processes ###
1. Step 1: Missions Authority
2. Step 2: Stakeholder Expectations
	1. Mission Objectives & Constraints
	2. Operational Objectives
	3. Mission Success Criteria
3. Step 3: High-Level Requirements
4. Step 4: Functional and Logical Decomposition
5. Step 5: Trade Studies and Iterative Design Loop
	1. Design and Product Breakdown Structure
	2. Derived and Allocated Requirements
		1. Functional
		2. Performance
		3. Interface
		4. Operational
		5. "ilities"
	3. ConOpts
6. Step 6: Functional & Performance Analysis
	1. Sufficent Depth? No - go to Step 4, Yes - go to next step
7. Step 7: Work? Safe & reliable? Affordable? No - Rebaseline requirements? (Yes - go to Step 2, No - go to Step 4), Yes - Select Baseline

### What if we get into details? ###
1. Other issues:
	1. Requirement volatility - change over time
	2. Conflicts - they may clash
	3. New requirements - more get added
2. Main issue:
	1. Level 2, 3 ,... requirements cannot be written until we have made key design decisions (electric propulsion? chemical propulsion?)
3. System architecture: Concept selection (Functional and Logical Decomposition)

### Types of Requirements ###
1. **Functional** Requirements define what functions need to be done to accomplish the mission objectives
	1. Example: The Thrust Vector Controller (TVC) shall provide vehicle control about the pitch and yaw axes
		1. This statement describes a high level function that the TVC must perform
		2. Statement has form of Actor - Action Verb - Object acted on
2. **Performance** Requirements define how well the system needs to perform the functions (qualifiers for functional requirements - how well should a function be performed)
	1. Example: The TVC shall gimbal the engine a maximum of 9 degrees, +/- 0.1 degree
3. **Constraints** are requirements that cannot be traded off with respect to cost, schedule or performance
	1. Example: The TVC shall weigh less than 120 lbs
		1. It is not functional or performance (a constraint on form)
	2. It is also called **specification constraint**
4. **Interface** Requirements
	1. Example: The TVC shall interface with the J-2X per conditions specified in the CxP 72262 Ares I US J-2X Interface Control Document, Section 3.4.3
		1. J-2 is a famous engine
5. **Environmental** Requirements
	1. Example: The TVC shall use the vibroacoustic and shock [loads] defined in CxP 72169, Ares 1 Systems Vibroacoustic and Shock Environments Data Book in all design, analysis and testing activities
	2. Range of environmental conditions can be written (temp range from 30 degrees to 80 degrees)
6. **Other** - illities requirement types described in the SE Handbook  (**very important for long term**) include:
	1. Human factors
	2. Reliability requirements
	3. Safety requirements

### Attributes of Acceptable Requirements ###
1. A complete sentence with a **single** "shall" per numbered statement
2. Characteristics for _each_ Requirement Statement:
	1. **Clear** and **consistent** - readily understandable
	2. **Correct** - does not contain error of fact
	3. **Feasible** - can be satisfied within natural physical laws, state of the art technologies, and other project constraints (tricky)
		1. If repeating - confidence is high
		2. If something new - ambitious and confidence may be not that high (may be way beyond state of the art)
			1. Technology may not be ready yet
				1. **Technology readiness scale**
		3. In-feasible requirements need to be negotiated up-front
	4. **Flexible** - Not stated as to how it is to be satisfied
		1. Do not overstate how it should be done
	5. **Without ambiguity** - only one interpretation makes sense
	6. **Singular** - One actor-verb-object requirement
	7. **Verify** - can be proved at the level of the architecture applicable
3. Characteristics _for pairs and sets_ of Requirement Statements:
	1. **Absence of redundancy** - each requirement specified only once
		1. Good in system design but not in requirements
	2. **Consistency** - terms used are consistent
	3. **Completeness** - usable to form a set of "design-to" requirements
	4. **Absence of conflicts** - not in conflict with other requirements or itself
		1. Example: shall use aluminium but not metals are allowed to be used - direct contradition
		2. Competing requirements
4. Example:
	1. Sticky hand tool to keep flies away
	2. BMW i3 - small city electric car
	3. Swiss cheez like building
5. Standards and regulations are not same
	1. Standard: group of companies or organizations applied to (IEEE 802.11g)
		1. Write down in requirements if you are complying to
	2. Regulations: Law
6. Requirements Decomposition, Allocation and Validation
	1. Customer:
		1. Mission Authority
		2. Mission Objectives
		3. Mission Requirements
		4. System Functional Requirements
		5. System Performance Requirements
		6. Programmatics
			1. Cost
			2. Schedule
			3. Constraints
			4. Mission Classification
	2. Implementing Organizations
		1. System Functional Requirements
		2. System Performance Requirements
		3. Environmental and Other Design Requirements and Guidelines
		4. Institutional Constraints
		5. Assumptions
		6. System Performance Requirements
			1. Subsystem A Functional and Performance Requirements
				1. Allocated Requirements
				2. Derived Requirements
			2. Subsystem B ...
				1. ...
			3. Subsystem C ...
				1. ...
			4. Subsystem K ...
				1. ...
7. Requirements are decomposed in a hierarchical structure starting with the highest level requirements
8. These high-level requirements are decomposed into functional and performance requirements and allocated across the system
9. These are then further decomposed and allocated among the elements and subsystems. This complete set of design-to requirements is achieved
10. At each level of decomposition (system, subsystem, component, etc), the total set of derived requirements must be validated against the stakeholder expectations or higher level parent requirements

### Requirements Margins Management ###
1. Due to uncertainty during early design, must use appropriate _requirements margins_ (e.g. for mass, power, memory etc...) - be more stringent than it needs to be (to build a reserve in the system to handle unexpected things)
2. Margins are *reserves*. that are not allocated to subsystems but are controlled by project managers
	1. Example: mass growth has been experienced in almost all vehicle development programs
		1. Mass growth can range from 10-60%
		2. Depends on *novelty* of the project
3. Typical Guidelines:
	1. Establish SRR Mass + 30% margin
	2. pre-PDR keep 20% mass margin
	3. pre-CDR keep 10% mass margin
	4. pre-IOC keep 5% mass margin
		1. Initial Operating Capability
4. Monitor the satisfaction of the requirements during the design process
	1. Y-Axis: Technical parameters (should not emit more than x NO2)
		1. Min to max is the tolerance band
	2. X-Axis: Progress in Time
	3. Have a current estimate (at the end of the project)
	4. The margins narrow down as you progress
	5. Example: GTW - Gross Take-off Weight
		1. Maximum Contract or Allocated Requirement Threshold
			1. Penalty for exceeding the weight
				1. Estimate weight at the end of the day
				2. Take out weight if it exceeds

### Technical Requirements Definition Best Practice Process Flow Diagram ###
1. Input
	1. From Stakeholder Expectations Definition and Configuration Management Processes
		1. Baseline Stakeholder Expectations
		2. Baseline Concept of Operations
		3. Baselined Enabling Support Strategies
	2. From Stakeholder Expectations Definition and Technical Data Management Processes
		1. Measures of Effectiveness
2. Activities (Requirements Definition Process)
	1. Analyze Scope of Problem
	2. Define Design and Product Constraints <-> Define Functional and Behavioral Expectation in Technical Terms
	3. Define Performance Requirements for Each Defined Functional and Behavioral Expectation
	4. Define Technical Requirements in Acceptable "Shall" Statements
	5. Validate Technical Requirements
	6. Define Measures of Performance for Each Measure of Effectiveness
	7. Establish Technical Requirements Baseline
	8. Define Technical Performance Measures
3. Output (Performance Measurements we can track and validate later)
	1. To Logical Decomposition and Requirements and Interface Management Processes
		1. Validated Technical Requirements
	3. To Logical Decomposition and Technical Data Management Processes
		1. Measures of Performance
	4. To Technical Assessment Process
		1. Technical Performance Measures

### Requirements Capture: Documents vs. Database ###
1. Where/ how are requirements captured?
	1. Low cost "easy" solution: Creation of a **document** (e.g. in MS Word or Excel) to capture and revise the requirements. Use hyperlinks to link requirements.
	2. This works okay for smaller projects with dozens or a few hundred requirements (e.g. about 3 levels of decomposition-> (7 +/- 2)^3 = 125 - 729
	3. For larger projects with >1000 requirements need to use a relational database
	4. **Commercial Tools** e.g. DOORS are available (but can be expensive)

## Systems Modeling Languages ##
1. Why Systems Modeling Languages?
	1. Means for describing artifacts are traditionally as follows:
		1. Natural Language (English, French etc ...) - challenging for system engineering
			1. Confusing for different descriptions
		2. Graphical (Sketches and Drawings)
		3. These then typically get aggregated in "documents"
			1. Examples: Requirements Document, Drawing Package -> Technical Data Package (TDP) should contain all info needed to build and operate system (+ CAD say)
				1. TDP contains: (deliverable of design process)
					1. Software
					2. Drawings
					3. Descriptions
	2. Advantages of allowing an arbitrary description:
		1. Familiarity to describer of description
		2. Non-confining, promotes creativity
	3. Disadvantages of allowing an arbitrary description:
		1. Room for ambiguous interpretations and errors
		2. Difficult to update if there are changes
		3. Handoffs between SE lifecycle phases are discontinous
		4. Uneven level of abstraction
		5. Large volume of information that exceeds human cognitive bandwidth
		6. ...
	4. Past efforts to construct System Modeling Languages
		1. E.g. Bond Graphs (1960), IDEF (1981), etc...
			1. 
	5. Regardless of the System Modeling Language being developed and used they share the common features:
		1. Domain agnostic
		2. **Ontology**: [https://en.wikipedia.org/wiki/Ontology_engineering](https://en.wikipedia.org/wiki/Ontology_engineering)
			1. Defines entities allowed to exist and be described
			2. How entities can be grouped, related to a hierarchy and subdivided
			3. Constrains the universe of concepts that can be represented in the language
		3. **Semantics**: [https://en.wikipedia.org/wiki/Semantics](https://en.wikipedia.org/wiki/Semantics)
			1. Describes the meaning of the entities allowed by the ontology
			2. Relationship between signifiers (e.g. words, symbols ...) and their denotation
		4. **Syntax**: [https://en.wikipedia.org/wiki/Syntax](https://en.wikipedia.org/wiki/Syntax)
			1. Set of rules, principles and processes that govern the structure of the language and how correct "sentences" can be synthesized

## System Architecture and Concept Generation ##
## Concept Selection and Tradespace Exploration ##
## Design Definition and Multidisciplinary Optimization ##
## Miscellaneous Topics - MBSE and Introduction to CAD (Guest Lecture from Solidworks) ##
## Systems Integration and Interface Management ##
## Verification and Validation ##
## Commissioning and Operations ##
## Lifecycle Management ##