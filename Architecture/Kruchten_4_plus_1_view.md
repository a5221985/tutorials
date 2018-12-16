# 4 + 1 Architectural View Model #

## Introduction ##
1. It is used to describe the architecture of software-intensive systems
	1. It is based on multiple concurrent views
2. Different views describe the system from the viewpoint of different stakeholders
	1. End-users
	2. Developers
	3. Project managers
4. Four views:
	1. Logical view
	2. Development view
	3. Process view
	4. Physical view
	5. Uses cases or scenarios (plus 1)

## Development View ##
1. System from programmer's perspective and software management
	1. Also known as implementation view
2. Diagrams used:
	1. UML component diagram
		1. Describes system components
	2. UML Package Diagram

## Logical View ##
1. Concerned with functionality the system provides to end-users
	1. Class diagrams
	2. State diagrams

## Physical View ##
1. From system engineer's point of view
	1. Topology of software components on physical layer, physical connections between the components
	2. Deployment view
	3. Diagram:
		1. Deployment diagram

## Process View ##
1. Deals with dynamic aspects of the system
	1. Explains system processes and how they communicate
	2. It deals with runtime behavior of the system
	3. Addresses
		1. Concurrency
		2. Distribution
		3. Integrators
		4. Performance
		5. Scalability
		6. ...
	4. Diagrams:
		1. Activity diagram

## Scenarios ##
1. Scenarios describe sequence of interactions between objects and between processes.
2. Used to identify architectural elements and illustrate and validate architecture design
	1. Starting point for tests of architecture prototype
	2. Use case view