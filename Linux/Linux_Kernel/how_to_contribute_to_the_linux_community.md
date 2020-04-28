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
							1. We don't fix bugs by introducing new problems... - Linus Torvalds
							2. We may have to backout if it occurs
								1. We are not sure if the quality is increasing or decreasing over time
						2. If we don't allow existing things to break, we are sure that there is improvement in quality or it is the same
					6. No inherent right to inclusion
						1. Changes require justification (improve the kernel in some way and useful for users and must be the best solution)
						2. Other solutions may win out
							1. Better solution gets merged
								1. Tips
									1. Move on assuming the problem is solved
					7. Getting started: companies
						1. Ensure management understands the process
							1. Company should not intervene with kernel changes (do their own quality checks and qa)
								1. Peer review process is most important
					8. Getting started: companies
						1. Develop skills in-house
							1. It is just like developing any operating system
							2. Learn OS design
					9. Getting started: companies
						1. Get legal on board
							1. Know how open source licenses work
								1. Work with the legal people to understand this
					10. Getting started: companies
						1. Let your developers contribute
							1. Contribute on mailing list
							2. Talk to other developers
					11. Getting started: developers
						1. No 1 project for all kernel beginners: "make sure that the kernel runs perfectly at all times on all machines which you can lay your hands on"
							1. Find bugs and fix
							2. Find bugs and fix
							3. ...
						2. This develops reputation in the community
						3. If what we write does not add much value to kernel, then it is not much appreciated
					12. Getting started: developers
						1. Review code!
							1. Look at other code that people post
							2. Review and ask questions and comments
								1. I don't understand
								2. How does it work if this...
							3. Good learning
					13. Communication:
						1. Communicate your plans early
							1. Talk to developers early
							2. Don't keep internal until the end
							3. Tell people what we are trying to do early
						2. Specify requirements carefully
							1. "Why" instead of "what"
								1. Kernel may already have a solution
									1. Specify the requiremnt - we want to have this for our customer which the current kernel does not support well, we think this feature will be a good solution for this ...
						3. Listen:
							1. Feedback is important from community
							2. They have wisdom
							3. Respond to all of them
					14. Aim for the mainline
						1. early!
							1. Do not fall into the trap of adding more and more stuff to an out-of-tree project. It just makes it harder and harder to get it merged. There are many examples of this - Andrew Morton
								1. If we put the code early into the mainline kernel, the paroject may be carried on by other developers or else it may be dead and gone
							2. People may come back to you with suggestions on ways to make the code better
					15. Dealing with Reviewers:
						1. Do not ignore reviews
							1. Have to respond
							2. Fix the problem or discuss and justify your change
						2. Be nice to reviewers
							1. We may have to repeat the explanation and be patient
						3. Understand their motivation
							1. Do not take it personally
								1. Do not argue with them and get grumpy back at them
					16. Be part of the process
						1. The kernel needs you
							1. Development process document
								1. [http://www.static.linuxfound.org/sites/lfcorp/files/How-Participate-Linux-Community_0.pdf](http://www.static.linuxfound.org/sites/lfcorp/files/How-Participate-Linux-Community_0.pdf)
									1. How do we find patches
									2. Coding style documents