# Linux Kernel and Driver Programming #
## Character Device Driver Part 1 ##
1. Switching between kernel mode and user space mode
2. Why everything is file in linux?
	1. Security
		1. Suppose there is no difference between kernel memory and user memory
			1. User programs can bring entire system down
			2. Solution:
				1. Part of memory is dedicated to kernel only and only kernel can access
				2. Part of memory is allocated to user which both kernel and user space can access
	2. x86 architecture:
		1. Ring levels - supported by hardware
			1. 0 - most privileged mode (can access any memory (0, 1, 2, 3))
			2. 1 - can access memory belongs to 1, 2, 3
			3. 2 - ...
			4. 3
		2. Linux access 2 of them
		3. Tells which of the memory we can access
		4. User space and kernel space
			1. 1:3 - 1 GB to kernel and 3 GB to user programs
			2. Different ways to switch between user space and kernel space
				1. One way: Standard set of system calls
					1. Defined by OS
					2. Wrapper is libc library
					3. If task wants to run kernel code
						1. We cannot run it directly
							1. `syscall` is invoked
								1. Uses software interrupt `0x80` to switch to kernel mode
					3. Another way is to define syscall
					4. Standard system calls
						1. Open
						2. Close
						3. Write
						4. OpenAt
						5. GetTID
				2. Another way is file system

## Character Device Driver Part 2 ##
## Character Device Driver Part 3 ##
## Character Device Driver Part 4 ##