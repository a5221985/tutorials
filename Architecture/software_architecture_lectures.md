# Software Architecture Lectures #

## What is Architecture ##
1. Example: Web application
	
		Web browser ---- HTTP Server ---- App Server ---- Database
		(1 machine)		(1 machine				                  )
						(1 machine)	      (1 machine)     (1 machine) - better response time, scalability (with users) - cost (more maintenance)

	1. Different architectures
2. Example: Verifying software license number

		license number ---> software ---> server (f(ln))

	1. `f(n)` - simple: table lookup, more users: hash
		1. Can be computed on server
			1. Needs internet connection
		2. Can be computed on software
			1. No need of internet connection (usability is higher)
			2. No tracking (security) where and when it is installed
3. Given a functionality we can implement in different ways
4. Architecture: How to take a software and implement it without changing the functionality
5. Formal Definition: From `Software Architecture in Practice - 2nd Edition` - (Reference book)

	> The software architecture of a program of a computing system is the structure or structures of the system, which comprise software elements, the externally visible properties of those elements, and the relationships among them
	
	1. What is visible externally, (not internals)
	2. The implementation details of a component are not part of architecture
	3. Simple words: components and topology of the connections between them

	> The software architecture of a system is the set of structures needed to reason about the system, which comprise software elements, relations among them, properties of both

	1. We must be able to reason about a system given its components and connections and their properties (both)
		1. Response time
		2. Scalability
		3. Security
6. Non-functional aspects of how the function is computed is part of software architecture (not the functional aspects)
7. ISO/IEC 42010 definition:

	> Fundamental concepts or properties of a system in its environment embodied in its elements, relationships, and in the principles of its design and evolution

	1. Why a component is chosen? (principle of design)
	2. Why a topology is chosen? (principle of design)
	3. Why a connector is chosen? (principle of design)
8. Community definitions: [http://www.sei.cmu.edu/architecture/start/glossary/community.cfm](http://www.sei.cmu.edu/architecture/start/glossary/community.cfm)
9. Home Work
	1. Try to come up with examples to illustrate what is architecture
	2. That is, architect a system in two different ways and figure out in what properties the systems would differ

## Architecture & Design ##
1. Oxford:
	1. Architecture vs. Design
		1. Architecture: The complex or carefully designed structure of something
			- The conceptual structure and logical organization of a computer or computer based system
		2. Design: A plan or drawing produced to show the look and functioning of a building, garment or other object before it is made
			1. Artifacts used in construction
2. Architecture and Design
	1. Verb and noun
	2. All architecture is design but not all design is architecture
		1. Architecture: Deconstructing a system so that certain quality attributes are met
	3. Quality attributes must drive deconstruction of the system (concern is architectural)
	4. Architectural design versus detailed design (smaller components)
3. Architectural styles and Design patterns (interchangeable)
	1. Scope of architecture is Components
	2. Scope of Design in Objects and Classes
4. HW:
	1. Think about what is the granularity of participating artifacts

## Quality Attributes ##
1. 

## Tactics: Modifiability ##

## Tactics: Building Quality Attributes Into Software ##

## Patterns ##

## Viewsets and Documentation ##

## Documenting Architectures ##

## 4 + 1 View of Architecture ##

## Quality Standard ISO 25010:2011 ##

## Solution Architecture ##