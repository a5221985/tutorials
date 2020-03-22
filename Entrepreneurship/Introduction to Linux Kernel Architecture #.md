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
4. Task switching and scheduling
	1. Many processes and threads run concurrently
	2. Made possible by task switching and scheduling functionality of the kernel
	3. Kernel makes a wise choice to choose the right process to run on the CPU
5. Address Space
	1. Every process in the system has the impression that it has its own address space
	2. This is made possible using virtual address space
	3. Virtual address space is not related to how much physical RAM is available
	4. Due to this setup, two processes may have the same virtual address but may be mapped to different physical address
6. Linux address space has two parts: kernel space and userspace
	1. kernel space - 2^32 or 2^64 (only kernel can use this)
	2. User space - 0 - TASK_SIZE (both user program and kernel can access this)
7. Privilege Levels
	1. Separation of address space leads to different privilege levels
	2. Linux uses two modes: kernel mode and user mode
	3. Key difference is that process running in kernel mode can access kernel space in addition to user space
8. System calls
	1. User process can communicate with kernel using system calls
	2. Traditional system calls:
		1. Process management
		2. Signals
		3. Files
		4. Directories and Filessytem
		5. Time functions
9. Modules and Hotplugging:
	1. Modules can add functionality to the kernel at runtime
	2. Hotplugging is adding and removing modules dynamically on certain system changes
	3. Example: USB driver could be a module that can be hotplugged dynamically by the computer when a USB device is detected
		1. When USB device is removed, module may be unloaded