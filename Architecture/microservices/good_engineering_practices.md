# Good Engineering Practices: C++Now 2019: Engineers Wanted, Programmers not so Much #
1. Important concerns
	1. Operations
		1. System should be up and running and stays up and running
			1. If it has business value
	2. Renovations
		1. Of existing system
			1. More capacity
			2. Better system
		2. Automation is the key (wherever possible)
	3. Integrations
		1. Integrating softwares from acquisitions say
		2. Restoration of old crufty code base and generate business value
	4. Design
		1. Programming (building something new)
2. Engineering priorities
	1. Long term demonstrated success vs. new tech
		1. Prefer the first
			1. Use the one that demonstrated success
	2. Brand reputation matters
		1. Choose the brand of vendor that has value
	3. Prefer used to new
		1. They work - demonstrated performance
			1. New things have risk
	4. Extensive sharing between companies
		1. Informations needs to be shared with other companies
3. clang-format - automatically formats C/C++/Objective-C code
	1. Use widely used standard in the industry (which has industry consensus)
4. Innovation for an engineer vs. innovation for a programmer
	1. Engineer - innovation to generate business value
	2. Programmer - cool library that can be used in few cases (short sited)
5. Service Level Objectives (SLOs)
	1. We can have sporadic test failures
		1. When we run builds at regular intervals, we can check sporadic failures and report
			1. SLO - 90%
		2. Job that builds and checks different statistics about the code and environment
			1. We can check trend
6. A scheduled risk to prevent unscheduled risks
	1. Have overspeed tests
		1. Performance tests
		2. Test points of failures
		3. Planned outage tests
			1. In cloud say
				1. See how the system behaves
7. Incremental deployment
	1. Static analyzer say
		1. Run on critical places
		2. Gradually apply it everywhere else
	2. Spreads cost over time
8. Periodic maintenance
	1. Re-visit code base periodically (as part of periodic maintenance)
		1. Do another code review regularly (of critical pieces first)
		2. Question how something works
9. Renovations
	1. Spread risk over time
		1. Continuous deployment
			1. Each software change must be deployed
				1. Release
		2. Incremental changes
			1. Improvement in pieces
10. Migration failures (can happen by one or more of below is done)
	1. The "2.0" migration
		1. Re-write the entire system (not practical)
	2. Opt-in migration
		1. We come up with new version and tell people to please migrate to the new version, if you have time
	3. One migration tied to another migration
		1. Two or more migrations are tied together which will increase the likelyhood of failure
	4. Deploy all at once
		1. Incremental deployment is better
11. Software Fitness Theory
	1. Software is a means to an end (goal)
	2. Fitness is observed by measured proximity to the end (goal)
12. Feedback
	1. Code review - simulation of what happens if someone has to revisit the code three months or three years down the line