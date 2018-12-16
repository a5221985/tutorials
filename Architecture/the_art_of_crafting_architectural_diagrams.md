# The Art of Crafting Architectural Diagrams #
## Key Takeaways ##
1. Architectural diagrams are tricky and error prone
	1. Consistent and meaningful diagrams bring clarity and consensus across stakeholders
2. Problem: Relying on improper or inconsistent guidelines, lack of architectural education
3. Blend automatically generated with manually constructed ones to minimize work
	1. Illustrate different set of concerns
	2. Cover multiple abstraction levels of the system
4. Maintaining diagrams up-to-date needs extra effort
	1. Learn how to efficiently proceed in such cases by still keeping consistency and robustness across architectural diagrams
5. Additional concerns might emerge due to complexitites in modern architectures

## Introduction ##
1. Formal architectural models:
	1. Kruchten 4+1
	2. Rozanski
	3. Woods
2. Diagrams comply with views related to a specific viewpoint that could be part of a model
3. Problems: Inconsistency, fragmentation, granularity, look
	1. Solution: Diagrams must be self descriptive, consistent, accurate and connected to code
		1. Guidelines: To communicate (structure, elements, relationships, properties, principles) across different stakeholders (with different technical backgrounds and concerns)

## Current pitfalls when designing architectural diagrams ##
1. A complex idea can be conveyed in a single still image
	1. A diagram must not raise more questions than it answers
		1. It must not need additional words or explanation

### What does a box or shape denote? ###
1. Not properly documented box or shape can cause mis-interpretations
	1. It can be data, code, or process
2. Solution: Add explicit details about box or shape in diagram legend

### What do different edges of a shape represent? ###
1. Dashed, dotted, ... can be mis-understood
	1. does dashed line refer to a container, a microservice, a layer?
	2. Is it just designer's preference for rich look and feel?
2. Solution: provide accurate details in legend diagram (when choosing multiple or non-standard edges)

### What does a line or an arrow denote? ###
1. It can be data flow (data flows from system A to system B) or a relationship across elements (component A depends on component B)
2. Relationships and data flow directions do not converge usually
3. Solution: Write it explicitly in diagram legend

### What is the communication/association type indicated by a line or arrow? ###
1. Communication type of data flow or association type must be detailed
	1. Solution: Indicate the below in diagram legend
		1. data flow: synchronous, asynchronous
		2. relationship: dependency, inheritance, implementation

### What does that color mean? ###
1. Multiple colors for boxes without proper documented intention might raise multiple questions
	1. Why are some boxes green and others red?
	2. Why are some lines black and others blue?
2. Solution:
	1. Color scheme is less important
	2. Black and white is sufficient
	3. Only if stringent constraint exists to emphasize some parts of the diagram (use distinguishable colors)
	4. If colors are used, details of choices must be specified

### Missing relationships between diagram elements or isolated entities ###
1. Isolated entities in a diagram might be interpreted as incomplete
	1. Structural and behavioral perspective
2. Solution: Every element or entity should rely on/have relationship (represented by a line or arrow) with another part of the system

### Misleading/undocumented acronyms or too vague/generic terms ###
1. Label or acronym that is not documented must not be used because it is misleading
	1. TFH, RBPM, ... do not mean anything without proper explanation
2. Solution: Use diagram legend
3. Using extremely vague or generic terms (business logic, integration logic) - no valuable information (names are not self-descriptive)
	1. May propagate to the code
	2. Use self explanatory or suggestive names following clean code principles

### Emphasize technologies, frameworks, programming or scripting languages, IDE or development methodology on diagrams ###
1. Architecture must not be based on technology, framework, programming or scripting language, IDE, development methodology (they come in the end)
	1. Details are usesd to build the architecture (not to define the architecture)
2. Solution: Do not include implementation details in the architecture
	1. Architecture description can contain the rationale for choosing the technologies

### Mix runtime and static elements in the same diagram ###
1. Runtime elements: threads, processes, virtual machines, containers, services, firewalls, data repositories, ...
	1. These are not present at compile time so don't mix them with static elements (components, packages, classes) in the same diagram
2. Solution: Use dedicated digram types for runtime elements
	1. concurrency diagram
	2. deployment diagram

### Make assumptions like "I will verbally describe this", and "I will explain it later" ###
1. There must not be any verbal details to complement the diagram
	1. Oral explanations will not be captured in the diagram and get lost
	2. Later on other stakeholders will read the diagram and not understand
2. Solution: Include necessary details in a diagram to avoid any need for further clarifications

### Conflicting levels of details or mixed abstractions ###
1. Elements from different levels of abstraction must not be mixed (perspectives change and can cause confusion)
2. Solution: Stick with the same level of abstraction

### Cluttered or too vague diagrams trying to show too much or insufficient level of detail ###
1. Level of granularity captured should be meaningfully elected
2. Solution: Depends on architectural model, experience of the architect, complexity of the system

## Guidelines to follow when constructing architectural diagrams ###
1. General guidelines for constructing diagrams

### Choose the optimal number of diagrams ###
1. "Architecture is a complex beast. Using a single blueprint to represent architecture results in an unintelligible semantic mess"
	1. Problem: What diagram to choose? How many of them do we need?
		1. Factors to consider
			1. Nature and complexity of the architecture
			2. Skills and experience of the architect
			3. Time available
			4. Amount of work to maintain them
			5. What makes sense
			6. What is useful for meeting stakeholders concerns
				1. Example: Network engineer wants to see - explicit network model (including hosts, communication ports, protocols)
				2. Example: database admin is concerned about how system manipulates, manages and distributes data
	2. Solution: Considering above aspects, pick optimal number of diagrams
2. Under-documentation may lead to hidden parts of the system
3. Over-documentation may need extra effort to keep them consistent, updated and not fragmented

### Keep structural and semantical consistency across diagrams ###
1. All diagrams must be consistent with boxes, shapes, borders, lines, colors, ...
	1. Different developers must follow the convention so that stakeholders understand
		1. Solution: Common diagramming tool for all projects
2. Diagrams must be synchronised with code changes
	1. Automation is possible using a modeling tool - preferred

### Prevent diagrams fragmentation ###
1. If multiple diagrams illustrate the same quality attribute - performance, scalability, etc.... but each one is individually incomplete
2. Solution: Remove diagrams that do not represent relevant quality attributes (not architecturally significant)
	1. Merge diagrams (concurrency and deployment)

### Keep traceability across diagrams ###
1. Comparing different diagram versions and easily reverting to pervious version is important
	1. Modeling tool must allow this
		1. Latest trend: Use plain text language to generate the diagrams
			1. solves traceability concern
			2. ensures structural consistency between diagrams

### Add legends next to architectural diagrams ###
1. If not following standard architectural description language like URL, ArchiMate
	1. Every piece of diagram must be detailed in the legend
2. If the above is not true, add architectural desciption language as key (no need for explanation because it follows standards)

## Does the Architectural Description Language (e.g. UML, ArchiMate, etc.) make a difference? ##
1. UML is rigid according to some people
2. ArchiMate is more powerful and suitable for modeling enterprise systems in comparison to UML
3. BPMN: Targetted to business processes
4. Rule of thumb: Architectural description language must be comprehensive and flexible

## How can diagrams be kept up-to-date as the system is developed and changed to the architectural materialize ##
1. Three approaches:
	1. Auto generate diagrams out of the source code
		1. guarantees they are consistent to the code
		2. Tools are not fully capable to do this
		3. "the ideal development environment is on for which the documentation is available for essentially free with the push of a button"
	2. First design diagrams with dedicated tool which then generate the source code skeletons (e.g. components/packages with boundaries, APIs)
		1. These can be used later on by developers to fill in the code
		2. Every change in architecture might regenerate or update the code skeletons
	3. Manually updating diagrams when new feature (which impacts architectural design - is implemented)
		1. Make updating architectural diagrams a part of the definition of done in development process
		2. Not recommended (may result in forgetting to update)
2. Recommendation:
	1. Blend of automatically and manually constructed diagrams
		1. Auto-generation must not produce too much noise (cluttered or meaningless information)
			1. More frequently changing diagrams (volatile) can be done this way (due to frequent development changes, usually lower abstraction)
			2. Static diagrams can also be generated
				1. Context diagrams
				2. Reference architecture diagrams
				3. Package diagrams
				4. Class diagrams
				5. Entity diagrams
				6. ...
	2. Source code may not make it obvious for certain quality attributes - auto generation is not an option
		1. Availability
		2. Scalability
		3. Performance
3. Manually modeled diagrams:
	1. State diagrams
	2. Concurrency diagrams
	3. Deployment diagrams
	4. Operational diagrams

## What complications (or simplifications) emerge for architectural diagrams when dealing with modern architectures (e.g. microservices)? ##
1. Modern architectural styles:
	1. Microservices
	2. Serverless
	3. Event driven
2. The styles only drive structure of the system, how components communicates each other (e.g. relationships between them) and what principles govern them.
3. There is impact on architectural desciption and implicitly on diagrams
	1. Multiple considerations need to be taken care of
		1. Number of distributed components (microservices)
		2. Type of component
		3. How components communicate to each other (boundaries, APIs, messages)
		4. Lifecycle and who owns each component
4. Views should capture decomposition, development, deployment and operability should be considered
	1. Each microservice can have it's own set of diagrams
		1. Consistency issues:
			1. Changing API for one microservice can impact X services (other diagrams must be updated)
		2. Fragmentation (high availability or performance between distributed services is not consolidated in one diagram)
		3. Cross cutting concerns (e.g who is in charge to illustrate monitoring, security across entire system elements) cannot be easily handled
		4. Team collaboration issues