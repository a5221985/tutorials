# Modeling C Applications in UML with File ans Structures #
1. C programs can be modeled using:
	1. object-oriented techniques
	2. functional techniques
2. Example: DSP code interacts directly with hardware
	1. Limitations:
		1. Real-time constraints
		2. Size limits
		3. Memory limits
	2. Challenges:
		1. Designing
		2. Reviewing
		3. Re-using code
	3. Solution:
		1. UML
			1. shows structure
			2. shows behavior
		2. Challenge:
			1. Mould UML for low level C applications
			2. Solution:
				1. Functional UML approach
				2. Use **Files** and **Structures** as components

## Advantages of Modeling ##
1. Companies invest on IP (Intellectual Property)
	1. IPs go through
		1. Development time
		2. Testing time
		3. Maintenance time
		4. Enhancement time
	2. How to deal with it:
		1. Abstraction (provided by UML)
		2. Modeling process (which implements UML)
	3. Why modeling now?
		1. Challenges:
			1. Deal with increase in power (capability and power usage)
			2. Deal with complexity
				1. Each chipset may has it's own unique interface
				2. Solution needs to re-usable (as much as possible)

## Improving Design and Development ##
1. Engineers are visual people (who communicate using pictures)
	1. UML provides the following features to aid modeling (similar to those used before but formalizes the representation)
		1. Activity diagrams (flow charts)
		2. State Machine diagrams
		3. Sequence diagrams
2. How to model C application using UML?
	1. functions
	2. structures

## Improving Collaboration ##
1. UML helps team members (new members expecially) to understand design beyond their own areas
2. Design reviews help
	1. Find exception conditions
	2. Errors in logic

## Improving Re-Use ##
1. Reverse engineering code into diagrams enables understanding
	1. While files can be included in new model
	2. Which functionality has to be re-developed
2. Developers can see generalized functionality that can be abstracted
	1. If interface to hardware is abstracted, reusable IP (Intellectual Property) does not change when hardware changes

			enumStatus analogRead(unsigned int* theInput)
			
		1. This is implemented for each hardware
		2. Re-usable IP calls the function regardless of which hardware the app uses

## Improving Testing ##
1. Limitations with hardware
	1. Testing is blocked until hardware is available
	2. Physical constraints such as: temperature, speed of events limits range of testing
2. Solution: Abstraction of IP
	1. IP can be tested thoroughly and early in development cycle
	2. Nice to have feature:
		1. Modeling tool produces sequence diagrams as code runs
		2. Modeling tool animates statecharts during execution
	3. Testers can compare the modeling outputs to test case designs
		1. To ensure the requirements are being met
3. Impact:
	1. Higher quality product
	2. Product that meets customer's stated requirements

## Modeling Function-Based Designs ##
1. C **files**, **functions** and **data structures** can be represented as 
	1. **UML class diagrams**
	2. **Activity diagrams**
	3. **Sequence diagrams**
	4. **Statechart diagrams**
2. UML file represents source files
	1. Content:
		1. Variables
		2. Functions
		3. Types
		4. Structures
	2. Public attributes and operations:
		1. In *.h files
	3. Private attributes and operations:
		1. In *.c files
	4. Composite data
		1. It is in structure (`struct`)
			1. Represented as file/class without any operations
				1. Functions manipulating `struct`s can be in
					1. Same file (recommended)
					2. Different file

## Modeling Keeps it Simple ##
1. Modeling 
	1. Simplifies development process
	2. Facilitates collaboration
	3. Enables re-use
	4. Benefits modeling complex applications