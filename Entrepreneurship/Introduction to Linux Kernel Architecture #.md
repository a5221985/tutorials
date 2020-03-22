# Introduction to Linux Kernel Architecture #
1. What is kernel?
	1. Enhanced machine that abstracts computer on a high level
	2. Resource manager
2. Kernel bridges application and hardware
	1. Low level communication to hardware is handled and abstracts the hardware for applications
3. Processes vs Threads
	1. Applications, servers, and other programs running under UNIX are called processes
		1. Init is first process
	2. Similarity
		1. Independent sequence of execution
	3. Difference
		1. Processes run in a separate memory space, while threads run in a shared memory space