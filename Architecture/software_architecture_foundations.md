# Software Architecture Foundations #
## What is Software Architecture ##
1. Architect (Noun)
	1. Designer of complete systems
		1. The structure of the complete system
			1. They don't fill in implementation details
		2. It is not just plugging in existing blocks (like lego blocks)
			1. Example: Architect does not make the choice of database (like pre-built windows for a building)
				1. It can be done at the end (or not made at all)
			2. Architect does not structure the building around pre-built windows
	2. Describes entire structures and systems (they have purpose)
		1. Purpose - It should fit the owners (tailored based on how it will be used)
			1. It should fit the domains
2. All effective architectures reflect the needs of customers and the domain and business they are working
	1. Best architecture reflects the structure of real world
		1. Start with customer (user's problem) and go down (find the best way to solve the problem)
	2. It is not just technical but also involves value judegements (it takes years of work to build that judgement)

## What Architect Does ##
1. Traditional
	1. Architectus Matrixis (Architect in Matrix)
		1. He is in suit and we don't understand what he is speaking
		2. He conceives the perfect system (at-least what he things so)
		3. The dirty work of implementation is done by lesser minions
		4. This is not effective and needs beuracratic process to get approvals to change the architecture
			1. Bottlenecks
			2. Fear of innovations
			3. Time consuming
			4. Adds considerable risks and millions of dollars
		5. Drawbacks
			1. Big and complex designs
				1. Code is written after design (usually never right)
				2. Doesn't capture the user's true needs (we learn as we work usually)
				3. Doesn't allow for learning
				4. We might build it perfectly but we are delivering the wrong thing
				5. Example: Upfront design (as in ATC by IBM) may become obsolete by the time it gets implemented
			2. Lack of Flexibility
				1. We discover design flaws, implementation issues, new requirements as we start implementing
					1. If the design is large and complex
						1. Painful bureaucratic processes
						2. Not following the design
						3. Random improvisation
			3. Slows down development process
				1. Enormous cost to development
				2. Centralized architect-making decisions
					1. Team might be waiting to get the design (waste of money)
				3. It is a bottleneck (lean terms)
					1. The speed of the entire software development system is controlled by the speed of the slowest part
						1. Single architect's decision
			4. UML - metaphor of building architecture taken too far
				1. It is more efficient to use programming language
				2. The actual code might deviate from the pictures very quickly
					1. If tools are used to keep picture in sync with the code, then the picture is a mess and not an architecture
			5. This architecture style doesn't fit agile world

## Architecture Today ##
1. Agile
	1. It welcomes changes
		1. We don't commit to a design too soon
			1. We learn about the problems as we solve them
			2. Learning as we work
	2. We don't waste time on design that we don't want to build but we don't know what we need to build until we put working software into people's hands
		1. Build very small things and release them constantly
		2. Let them evolve based on feedback