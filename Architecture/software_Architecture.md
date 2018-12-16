# Software Architecture [https://msdn.microsoft.com/en-us/library/ee658098.aspx](https://msdn.microsoft.com/en-us/library/ee658098.aspx) #

## Chapter 1: What is Software Architecture? ##

### What is Software Architecture? ###
1. It is the process of defining structured solution that meets all technical and operational requirements while optimizing
	1. Performance
	2. Security
	3. Manageability
2. Involves making decisions based on factors
	1. Impacted areas
		1. Quality
		2. Performance
		3. Maintainability
		4. Overall success
3. Definition: Philippe Khuchten, Grady Booch, Kurt Bittner, Rich Reitman

		Software architecture encompasses the set of significant decisions about the organization of a software system including the selection of the structural elements and their interfaces by which the system is composed; behavior as specified in collaboration among those elements; composition of these structural and behavioral elements into larger subsystems; and an architectural style that guides this organization. Software architecture also involves functionality, usability, resilience, performance, reuse, comprehensibility, economic and technology constraints, tradeoffs and aesthetic concerns.

4. *Patterns of Enterprise Application Architecture - Martin Fowler*: Common recurring themes identified during explanation of architecture

		The highest-level breakdown of a system into its parts; the decisions that are hard to change; there are multiple architectures in a system; what is architecturally significant can change over a system's lifetime; and, in the end, architecture boils down to whatever the important stuff is

5. *Software Architecture in Practice (2nd edition) - Bass, Clements, Kazman*

		The software architecture of a program or computing system is the structure or structures of the system, which comprise software elements, the externally visible properties of those elements, and the relationships among them. Architecture is concerned with the public side of interfaces; private details of elements - details having to do solely with internal implementation - are not architectural

### Why is Architecture Important? ###
1. Software needs solid foundation
2. Important factors
	1. Key scenarios
	2. Design for common problems
	3. Appreciation of long term consequences of key decisions
3. Need to design application carefully based on specific scenarios and requirements
4. Risks to consider due to poor architecture
	1. Unstable software
	2. Unable to support existing or future business requirements (extensibility)
	3. Difficult to deploy or manage in a production environment
5. Considerations while designing a system
	1. User
		1. Outline key scenarios
		2. Identify important quality attributes (reliability, scalability...)
		3. Key areas of satisfaction and dissatisfaction
	2. IT infrastructure
	3. Business goals

#### User, Business, and System Goals ####
1. Tradeoffs: Balance needs to be found between competing requirements across the three
	1. Overall user experience is a function of business and IT infrastructure
		1. Changes in one can significantly affect resulting user experience
		2. Changes in user experience requirements can have significant impact on business and IT infrastructure requirements
	2. Goals: Performance (user and business goal)
		1. System admin may not be able to meet it 100% (80% may be sufficient)
2. Focus of architecture:
	1. How major components in an app are used by, interact with other major elements and components within the app
		1. Design concerns (not part of architecture): Data structures, Algorithms, Implementation details of components (but there is some overlapping)
3. Guide: Processes and Information to construct architectural solutions that address relevant concerns, which can be deployed on chosen infrastructure, provide results and meet original aims and objectives
4. High level concerns:
	1. How will users be using application?
	2. How will application be deployed into production and managed?
	3. What are the quality attribute requirements for the application (security, performance, concurrency, internationalization, configuration)?
	4. How can application be designed to be flexible and maintainable over time?
	5. What are the architectural trends that might impact application now or after it has been deployed?

### The Goals of Architecture ###
1. Architecture seeks to build bridge between business requirements and technical requirements by understanding use cases and finding ways to implement the use cases in software.
	1. Goal: identify requirements that affect structure of application.
		1. Reduces business risks associated with building technical solution
	2. Design Goal: flexible to handle natural drift that occurs over time in hardware and software technology and user scenarios and requirements.
	3. Architect:
		1. Considers overall effect of design decisions, tradeoffs between quality attributes (performance, security), tradeoffs to address user, system, and business requirements.
2. Architecture should:
	1. Expose structure of system but hide implementation details
	2. Realize all use cases and scenarios
	3. Try to address requirements of verious stakeholders
	4. Handle both functional and quality requirements

### The Architectural Landscape ###
1. Key forces shaping architectural decisions
	1. User demand for faster results
	2. Business demand for faster results
	3. Better support for varying work styles and workflows
	4. Improved adaptability of software design
2. Key trends
	1. **User empowerment**: Design that supports user empowerment is: flexible, configurable, focused on user experience
		1. Design app with appropriate levels of user personalization and options
		2. Allow user to define how they interact with app instead of dictating to them (do not overload with unnecessary options and settings leading to confusion)
		3. Understand key scenarios and make them simple
		4. Make it easy to find information and use the app
	2. **Market maturity**: Take advantage of market maturity (take advantage of existing platform and technology options).
		1. Build on higher level app frameworks (where it makes sense)
			1. Focus is on uniquely valuable things in app rather than recreation of what already exists (reusability)
		2. Use patterns that provide rich sources of proven solutions for common problems
	3. **Flexible design**: Loose coupling (allows re-usability and improves maintainability)
		1. Pluggable designs: post deployment extensibility
		2. SOA: Provides interoperability with other systems
	4. **Future trends**: Understand future trends that might affect design after deployment
		1. Rich UI and media
		2. Composition models such as mashups
		3. Increasing network bandwidth and availability
		4. Increasing use of mobile devices
		5. Continued improvement in hardware performance
		6. Interest in community and personal publishing models
		7. Rise of cloud-based computing
		8. Remote operation

### The Principles of Architecture Design ###
1. Assumptions:
	1. Design will evolve over time
		1. During implementation stages with knowledge and testing against real-world requirements
	2. Cannot know everything you need to know up front to fully architect the system
2. Goal: Architecture must consider the evolution in mind to increase adaptability to requirements (not fully known at the start of design process)
3. Questions to consider for architectural design:
	1. What are the foundational parts of the architecture that represent the greatest risk if you get them wrong?
	2. What are the parts of the architecture that are most likely to change, or whose design you can delay until later with little impact?
	3. What are your key assumptions, and how will you test them?
	4. What conditions may require you to refactor the design?
4. Pitfalls
	1. Over engineering the architecture
	2. Assumptions that cannot be verified
5. How to avoid pitfalls?
	1. Keep options open for future change
	2. Look for aspects of design that needs to be fixed early in the process (that represents significant cost if redesign is required)
		1. Identify the areas quickly and invest time to get them right

#### Key Architecture Principles ####
1. Key principles of architecture:
	1. **Build to change instead of build to last**
		1. Consider how application may change over time (with new requirements and challenges)
		2. Build in flexibility to support it
	2. **Model to analyze and reduce risk**
		1. To capture requirements + architectural decisions + design decisions + analyze impact:
			1. Use Design tools
			2. Use UML (modeling system)
			3. Use visualizations (if appropriate)
		2. Pitfall:
			1. Do not formalize to such an extent as to suppress the capability to iterate and adapt
	3. **Use models and visualizations as a communication and collaboration tool**
		1. Efficient communication of design + decisions + ongoing changes to design
			1. Use models
			2. Use views
	4. **Identify key engineering decisions**
		1. Use guide to understand key engineering decisions and areas of mistake (often made)
			1. Get key decisions right to make design flexible and less likely to be broken by changes
2. Approach: Incremental + iterative approach to refine architecture
	1. Build baseline architecture (to get big picture right)
	2. Evolve candidate architectures iteratively (after testing)
		1. Test design against requirements and assumptions
		2. Iteratively add details (over multiple passes) to get:
			1. Big decisions right
			2. Details right
3. Pitfall:
	1. Diving into details too quickly (at the cost of big decisions with incorrect assumptions or failing to evaluate architecture effectively)
4. Testing:
	1. What assumptions have I made in this architecture?
	2. What explicit or implied requirements is this architecture meeting?
	3. What are the key risks with this architectural approach?
	4. What countermeasures are in place to mitigate key risks?
	5. In what ways is this architecture an improvement over the baseline or the last candiate architecture?
5. [Key Principles of Software Architecture](https://msdn.microsoft.com/en-us/library/ee658124.aspx)
6. [Technique for Architecture and Design](https://msdn.microsoft.com/en-us/library/ee658084.aspx) - incremental and iterative approach to architecture, baseline and candidate arhitectures, representing and communicating the design

### Additional Resources ###
1. Software Architecture in Practice, 2nd ed. - Bass, Len, Paul Clements, Rick Kazman
2. Patterns of Enterprise Application Architecture - Fowler, Martin

## Chapter 2: Key Principles of Software Architecture ##
### Overview ###
### Key Design Principles ###
#### Design Practices ####
#### Application Layers ####
#### Components, Modules, and Functions ####
### Key Design Considerations ###
#### Determine the Application Type ####
#### Determine the Deployment Strategy ####
#### Determine the Appropriate Technologies ####
#### Determine the Quality Attributes ####
#### Determine the Crosscutting Concerns ####

## Architectural Patterns and Styles ##
### Overview ###
### What Is An Architectural Style? ###
### Summary of Key Architectural Styles ###
#### Combining Architectural Styles ####
### Client/Server Architectural Style ###
### Component-Based Architectural Style ###
### Domain Driven Design Architectural Style ###
### Layered Architectural Style ###
### Message Bus Architectural Style ###
### N-Tier/ 3-Tier Architectural Style ###
### Object-Oriented Architectural Style ###
### Service-Oriented Architectural Style ###
### Additional Resources ###

## A Technique for Architecture and Design ##
### Overview ###
### Inputs, Outputs, and Design Steps ###
### Identify Architecture Objectives ###
#### Scope and Time ####
### Key Scenarios ###
#### Architecturally Significant Use Cases ####
### Application Overview ###
#### Relevant Technologies ####
#### Whiteboard Your Architecture ####
### Key Issues ###
#### Quality Attributes ####
#### Crosscutting Concerns ####
#### Designing for Issue Mitigation ####
### Candidate Solutions ###
#### Baseline and Candidate Architectures ####
#### Architectural Spikes ####
### What to Do Next ###
### Reviewing Your Architecture ###
#### Scenario-Based Evaluations ####
### Representing and Communicating Your Architecture Design ###
### Additional Resources ###