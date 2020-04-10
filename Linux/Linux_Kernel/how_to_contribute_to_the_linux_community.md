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