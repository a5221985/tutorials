# How to Contribute to the Linux Community #
1. Working with kernel is not hard if you understand how the process works
	1. Community has developed their way of working and we need to understand that
2. Why care about working with Linux Development community?
	1. Kernel is core of linux system
3. How to get kernel to meet your needs?
	1. In open source we don't get to request new features but we need to implement them
		1. Push things the way we want them to go
4. External code is expensive
	1. Kernel APIs change quickly
		1. Push code into mainline kernel
			1. Expense goes away
	2. External code is lower quality code
		1. race conditions
		2. security bugs
		3. performance issues
		4. duplicated code
		5. ...
			1. Code inside can get better
				1. In-tree code can be improved by others
5. This is how community works
	1. We need to make kernel better for all
	2. Guiding principles (how kernel is made)
		1. Upsream first rule
			1. Code goes into kernel first
				1. before going to customers
				2. before user space depends on it
					1. The code changes and improves on it's way in (before shipping to the customer)
			2. Before shipping code
				1. If not, if the code changes on it's way in, then problems may occur in user space (uis,...)
			3. Commercial users observe this very well
		2. Technical quality overall
			1. Code quality outweighs
				1. Company plans
				2. User desires (better but needs quality)
				3. Existing practice
				4. Developer status
					1. Quality code
						1. How it performs
						2. How it integrates with other kernel code
						3. How secure is it
						4. ...
					2. Long-term view
						1. Kernel developers expect to be maintaining the code 5-10 years from now
							1. How much will it cost to maintain the piece of code for the indefinite future
							2. Does the code justify the cost?
							3. Are there changes that will make the code easier to maintain?
							4. ...
					3. Peer review
						1. No code is perfect
							1. it can always be improved heed requests for changes
						2. Review process:
							1. People expect it to be changed
								1. Understand the process and prepare to change
					4. No ownership of code
						1. Even code you wrote
						2. Anyone can change (even it may mean changing how it works)
					5. No regressions:
						1. Even to fix other problems
							1. We don't fix bugs by introducing new problems... - Linux Torvalds
							2. We may have to backout if it occurs
								1. We are not sure if the quality is increasing or decreasing over time