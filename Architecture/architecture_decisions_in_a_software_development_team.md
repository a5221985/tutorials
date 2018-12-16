# Architecture Decisions in a Software Development Team #
1. Every work needs structure (to go smoothly)
2. Software development projects
	1. Architecture is the structure of software
	2. Architecture describes building blocks of software and how they work with each other
	3. Agreed upon architecture rules enables us to shape the building blocks to fit together and be easier to extend and test and maintain
		1. Must be defined from start
		2. Get into continuous decision making together with team

## Collect Issues and Ideas ##
1. Table with the following columns
	1. the **date** issue was raised on
	2. the **name of the person** who raised the issue
	3. a **keyword** describing context of issue in single word for ease of indexing
	4. a **short text description** of issue, potentially with links to other material
	5. the **name of the person** who will take responsibility for issue (initially empty)
	6. a **status flag** e.g. "open", "in progress", or "done"
2. List is repo of architecture issues (everyone in project must know it)
	1. It is accessible to all and editable by all
	2. Anyone can add ideas to the list
	3. Junior developers may not contribute
	4. Issues about current architecture evolve the architecture
		1. Keep this list for every project (even own projects)

## Establish a Community of Practice ##
1. Establish a community of practice (CoP) for architecture topics
	1. CoP: Sub teams that each drive a certain topic within a project
		1. This is a group of team members who are interested in software architecture and are active software developers
2. Once every two weeks, schedule a meeting for CoP
	1. Previous day, go through the list
	2. Talk to everyoe who's contributed issues (for better understanding)
	3. Decide which topics should be part of meeting agenda
	4. Time box the meeting to 1 hour or 1 1/2 hours
		1. Each item can be timeboxed
	5. Discuss each item prioritized and make a decision
		1. Some items can be settled in the meeting
		2. Some items need follow up or to discuss with other people
			1. A caretaker is assigned in this case (update issue list accordingly)
	6. Go through all items currently "in progress" to follow up on them

## Document Your Decisions ##
1. Progress must be documented
	1. ADR: Architecture Decision Record
		1. It is structured document describing why we have made a decision and what we hope to achieve with it
			1. Example:
				1. Unique number for easier reference
				2. a title
				3. the decision
				4. the reasons for the decision
				5. the goals we hope to achieve with it
		2. Must be close to code base (make it part of code review)
		3. If reasons are not valid anymore (context has changed, goals we wanted to achieve have not been reached)
			1. Decide of different way of doing things

## And When There Is No Consensus? ##
1. Sometimes we keep discussing but cannot agree upon a course of action
	1. Options:
		1. Postpone issue to next meeting:
			1. Team can take time to think about it
			2. Team might learn something new that might help resolve the issue
			3. If it is urgent, we can accept debating partner's opinion and do it his or her way (document it)
			4. If we are sure the decision causes issues, we can overrule the team with our experience

## Deliver Great Architecture ##
1. Involve team in making architecture decisions
2. Relieves architect of deciding everything on our own
3. Helps team to grow and deliver architecturally sound software
