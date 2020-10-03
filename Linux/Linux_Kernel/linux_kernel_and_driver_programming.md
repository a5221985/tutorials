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
					1. If we write something to a file, both userspace and kernel space can access it
						1. It needs to have proper privileges though
						2. Driver does not deal with privileges but policies on top of drivers deal with privileges
3. The entire Linux core is written using file system architecture
	1. It will treat everything as a file
		1. User space can access file using set of APIs
			1. Suppose kernel can send data to user space
				1. Kernel can define a file
				2. Kernel can then expose the file to user space with a set of APIs
				3. Kernel can write to the file
				4. User space can access the file using APIs such as system calls
	2. This mode of communication is followed throughout kernel
4. Filesystem structure
	1. `include/linux/fs.h`

			file_operations {
				seek
				read
				write
				async_read
				async_write
				...
			}
			
5. Two kinds of devices
	1. Character device
		1. Data is transmitted as a stream of characters
			1. mouse
			2. keyboard
			3. joystick
		2. We cannot navigate back and forth (we have lost that data)
		3. For slower devices
	2. Block device
		1. Hard-drive
			1. We can navigate back and forth between lba's
				1. Navigable
		2. For faster devices
6. Other architecture
	1. Networking
		1. Stream based
7. Module: [https://www.youtube.com/watch?v=HFMI-hDL5kQ](https://www.youtube.com/watch?v=HFMI-hDL5kQ)
8. Example:

		static int __init driver_init(void)
		{
			int status;
			my_dev = MKDEV(100, 0); /* Major and Minor Number */ // major number: identifier for device uniquely in system - massages to construct a unique number
			register_chrdev_region(my_dev, 1, devname); // statically assigning major and minor numbers, runtime allocation is also possible, 1 - 100, 0 (2 - 100, 0 & 100, 1)
			
			my_cdev = cdev_alloc();
			cdev_init(my_cdev, &device_fops);
			
			status = cdev_add(my_cdev, my_dev, 1);
			
			if (status < 0) {
				pr_info("Driver init failed\n");
				return status;
			}
			
			memset(buffer, '\0', PAGE_SIZE);
			return 0;
		}
		
		static void __exit driver_exit(void)
		{
			cdev_del(my_cdev);
			unregister_chrdev_region(my_dev, 1);
		}
		
	1. Two devices cannot have the same combination of major, minor numbers
		1. Say 100, 0
		2. `/dev` - for device nodes (not another place)

## Character Device Driver Part 2 ##
1. Suppose they have same combination, then system will treat both of them as a single device (not two devices)
2. `cat /proc/devices`
	1. List of devices it is using currently
		1. Character devices
			1. 1 mem
			2. 2 ...
			3. ...
			4. We can use non used number
		2. Block devices
			1. Minor number has no restrictions
				1. It is better to give unique numbers
					1. If interrupt occurs for one device, if there is a clash, other device (with same combination) can respond to the interrupt (duplicate read, read loss)
	2. `register_chrdev_region` - api for statically assigning major and minor numbers
		1. There is one for runtime
		2. Second param - number of minor numbers required
		3. `/dev` is used for devices allways (?)
	3. `MKDEV` - massages major and minor numbers to generate unique number
	4. `cdev_alloc()` - allocation of memory
	5. `cdev_init()` - buffer where it maps to device operations
	6. `cdev_add()` - maps `my_cdev` (operations) to `my_dev` (number)
	7. `memset(buffer, '\0', PAGE_SIZE)`

			static struct file_operations device_fops = {
				.owner = THIS_MODULE,
				.write = device_write,
				.open = device_open,
				.read = device_read,
			};
			
			static int device_open(...)
				// locking may be required - for one driver,
				// locking for re-entrance or spin lock, ...
			
			// called from user space using write or fwrite
			static ssize_t device_write(, buffer, size of buffer, position) {
				int nbytes = lbuf + copy_from_user(buffer + *ppos, buf, lbuf); // copies from user to kernel space
				*ppos += nbytes;
				pr_info (..., buffer, nbytes);
				
				return nbytes;
			}
			
			static void __exit driver_exit(void) {
				cdev_del(my_cdev);
				unregister_chrdev_region(my_dev); // major numbers, minor numbers, infrastructure
			}
			
		1. Running:

				lsmod | grep -i char
				insmod char_driver_demo.ko
				lsmod | grep -i char
				mknod /dev/shakilk1729 c 100 0 # manually constructing node
				ls -l /dev/shakilk1729

## Character Device Driver Part 3 ##
1. Continuation

		cat /dev/shakilk1729
		echo "hello" > /dev/shakilk1729
		cat /dev/shakilk1729 # acts like a file
		dmesg
		mknod /dev/shakilk17291 c 100 0
		cat /dev/shakilk17291 (acts like the same device as before)
		
2. Syscall - kernel communication using interrupt
	1. `open()` - `sys_open()`

			SYSCALL_DEFINE(open, const char __user *, filename, int, flags, int, mods)
			{
				call do_sys_open(),
				ret = do_sys_open(AT_FDCWD, filename, flags, mode);
				return value return by do_sys_open(),
				return ret;
			}
			
		1. Syscalls maps inputs to registers and emits an interrupt
3. Gettid example:

		#include <sys/syscall.h>
		#include <sys/types.h>
		#include <stdio.h>
		#include <unistd.h>
		#include <stdlib.h>
		
		int main()
		{
			pid_t tid;
			tid = syscall(SYS_gettid); // raw syscall and there is no wrapper (we are wrapping it here)
			printf("Thread ID: %d\n", tid);
			printf("PID is: %d\n", getpid());
			return 0;
		}
		
	1. `gcc test_syscalls.c`
	2. `./a.out`
	3. `echo hello > /dev/shakilk1729`
		1. It is converted to write system call
		2. write internally calls SYS_write
		3. Switches to kernel mode and sends data to kernel
	4. `cat /dev/shakilk1729`
		1. It is converted to read system call
		2. Read internally calls SYS_read
		3. Switches to kernel mode and reads data from kernel and copies to user space
		4. Cat then displays the data

## Character Device Driver Part 4 ##
1. [http://youtu.be/zJn4IbIbhmE](http://youtu.be/zJn4IbIbhmE)
	1. Best character device module
2. Dynamically allocating major and minor numbers
		
		dev_t my_dev;
		...
		alloc_chrdev_region(&my_dev, 0, 1, *shakilk1729);
		
	1. `my_dev` is filled by the API
	2. 0 - starting from 0 (baseminor)
	3. 1 - 1 device node (100, 0) (count)
	4. (name)
3. Documentation:
	1. [www.fsl.cs.synysb.edu/kernel-api/re940.html](www.fsl.cs.synysb.edu/kernel-api/re940.html)
4. Printing

		pr_info("Major number= %d minor number = %d\n", MAJOR(my_dev), MINOR(my_dev)); // extracts major and minor numbers from the unique number
		
	1. udev infrastructure - for on the fly creation (not look into what was allocated and use it)
5. Next:
	1. USB
	2. Networking
	3. Dummy filesystems
6. Insert module	
	1. `dmesg` - prints major and minor numbers
	2. `mknod /dev/shakil1729 c 249 0` (take the numbers from the `dmesg`)
	3. `echo "hello" > /dev/shakil1729`
	4. `cat /dev/shakil1729`
7. We can also use file open functions for the device in program
	1. We can write and read from user program