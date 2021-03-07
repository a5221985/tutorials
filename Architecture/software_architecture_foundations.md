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
		3. New requirements emerge constantly as software comes together
			1. **Inspect and Adapt Loop** - Agile
			
					Build/refine -> Deploy -> Review -> Talk to users -> Build/ refine
		
		4. Start only with design that is enough for the first chunk built
		5. Get feedback and modify the design based on the feedback (learn and design incrementally as we build the system)
		6. It is a whole different way of approaching architecture
		7. Idea
			1. If we are not sure, we run an experiment
			2. If the experiment succeeds, we keep the code and underlying architecture
			3. If the experiemnt fails, we throw both of them out and try something else
				1. Use the learning (as an asset) to build something better
		8. Agile folks - the cost of rebuilding is better than building the wrong thing
	3. Everybody is an architect - at some level in the team
	4. Nobody asks permission to experiment - we just try (Architect doesn't give permissions)
	5. Architect works in a support role
		1. Servent Leader (Agile architect)
		
				Teaching -> Coaching -> Coordinating
				
			1. As opposed to making opaque decisions implemented by unthinking code monkeys
			2. The architect should make sure that the developers are completent architects who understand and consider architectural issues as they work
			3. Main design responsibility: assures coherence across the system
			
					Reviews work (of all teams)
					Makes suggestions (points out what a given team is doing doesn't mesh well with the system)
					Helps refine processes (gives teams alternatives and let them choose - not simply solve the problem on his own)
					
			4. Architect must ensure that the development team understands the code better than architects do
				1. Team can come with better solution than any single individual can
			5. Agile architect keeps the big picture in their heads
				1. If one did this rather than that to ensure it works with another team's product
				2. Architect nudges the structure of the entire system based on experience
			6. Good architects understand when their ideas are flawed and are ready to take directions from the teams
	6. Advantages:
		1. Avoids single point of failure (collaboration)
		2. Everybody understands how system works and why things are done in a certain way
		3. Work happens continuously
	7. Architect ensures team makes good decisions and not make decisions himself