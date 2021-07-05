# Software Architecture Monday #
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