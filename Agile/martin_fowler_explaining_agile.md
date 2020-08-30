Why Agile Software development works
1. Semantic diffusion
	1. ideas get difused as they are passed on
2. Core ideas:
	1. Martin Fowler: New methodology essay
		1. Planning:
			1. Plan driven software development
				1. Plan: prediction and affects success criteria
					1. plan == success but does not work if clear and stable set of requirements
						1. Requirements are unstable in software development
							1. Stabilizing requirements upfront is hard
		2. Solution: Break dependency between software development and stability of requirements
			1. Process that is tolerent in changes in requirements
				1. A late change in requirements is a competitive advantage
			2. **Adaptive Planning**:
				1. Re-plan every week or couple of weaks and release frequently\
					1. Needs automation of deployment too
				2. Evolutionary approach to design (Martin Fowler: Is design dead)
					1. Self testing code
					2. Continuous integration
					3. Refactoring
					4. Simple design
				3. The techniques enable it to happen
					1. **Very important part of agile**
						1. Must not take only the management stuff
			3. "In past the man was first; in the future the system must be first" - Frederick Winslow Taylor
				1. People were deciding what to do
				2. Now people may define a process to follow and everyone else should confirm to that process
					1. Process designers
					2. Slot people into different components (traditional)
			4. "In the title. [of this article] I refer to people as "components". That is how people are treated in the process/ methodology design literature. The mistake in this approach is that "people" are highly variable and non-linear, with unique success and failure modes. Those factors are first-order, not negligible factors. Failure of process and methodology disigners to account for them contributes to the sorts of unplanned project trajectories we so often see." - Alistair Cockburn: Characterizing People as Non-Linear First order components in Software Development
				1. If people are more important than process then they decide the process
					1. People come first and process comes next
						1. "A bad process will beat a good person every time" - Edwards Deming (attr)
	2. Agile:
		1. Why does it work aspects:
			1. Communication: it trumps technology
				1. It is more important
					1. Software usually fails due to people
				2. We are highly social creatures
		2. Most effective way to communicate: Whiteboard
			1. Paper or email will most likely fail
				1. Cannot ship paper and expect to get perfectly useful software
			2. **Individuals and interactions over processes and tools**
			3. **Customer collaboration over contract negotiation**
		3. Empirical process vs Defined process
			1. Process
				1. Input and controls -> process -> output
					1. Cake: Take same amount of ingredients, cook for the same amount of time and we get the output
			2. Impirical:
				1. Inputs and controls -> process -> output
					1. Output -> Inspect, adjust -> Inputs and controls
						1. Shower: check with hand and decide
				2. Chemical engineering
					1. Dupont:
						1. If we know the inputs, we need to use defined process
						2. If we have unknowns, we need to use Impirical process
							1. Unknowns: people
								1. **We need to constantly inspect output and put it in feedback loop**
						3. Use card-walls for feedback to the team (visibility to everybody not just project managers)
							1. Everyone should understand what is going on
						4. Knowing build system feedback
							1. Working software is feedback and indicator of progress
								1. Does it build well
								2. What stage is it going through
								3. If build breaks, everyone can tell
									1. cc-board
										1. Green - successful
										2. Dark green pulsing - currently building and last build succeeded
										3. Red - last build failed
										4. Dark red pulsing - currently building but last build failed
						5. Testing:
								1. Layering
									1. Earlier in the cycle using fast tests like unit tests
									2. Later in the cycle, using longer and forceful tests
										1. End-to-end acceptance tests
										2. Performance tests
										3. ...
						6. Pair programming (part of feedback loop) - only one part works at a time (kind of) - so full brain works with pair programming
							1. Person typing is more active with left brain (how)
							2. Person navigating thinks more holistically (why)
				3. "In software development, "perfect" is a verb, not an adjective" - Kent Beck - Extreme Programming Explained (2nd Ed)
					1. It is not what we achieve but what we constantly try to achieve
				4. Retrospectives:
					1. How well is the development process working
					2. What are the things we are doing well and what are the things we are struggling with, what are the things puzzling us
					3. How do we change our software process in order to change these things
					4. Team must own the software process
						1. How to change it is a constant process