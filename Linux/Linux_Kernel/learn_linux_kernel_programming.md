## Introduction ##
### What is Device Driver ###
1. A device driver (often referred to as driver) is a piece of software that controls a particular type of device which is connected to the computer system
2. A device driver has three sides:
	1. One side talks to the rest of the kernel
	2. One talks to the hardware
	3. One talks to the user
	
	User - via Device File -> Device Driver -> Hardware
	User -> Kernel -> Device Driver -> Hardware
3. Devices
	1. Display
	2. Mouse
	3. Keyboard
	4. ...
4. Kernel API
	1. Open file etc...

### What is Kernel Module ###
1. Traditional way of adding code to kernel was to recompile kernel and boot the system
2. Kernel modules are piece of code that can be loaded/inserted and unloaded/removed from the kernel as per the demand/need
3. Other names:
	1. Loadable Kernel Modules (LKM)
	2. Modules
4. Extension: .ko (Kernel Object)
5. Standard Location for Kernel Modules
	1. Modules are installed in the /lib/modules/<kernel version> directory of the rootfs by default
6. Device Driver vs Kernel Modules
	1. Kernel module may not be a device driver at all.
7. Example:

		cd /lib/modules/`uname -r`/
		cd kernel
		find . -name '*.ko' | wc -l

### Device Drivers vs Kernel Modules ###
1. A kernel module may not be a device driver at all.
2. A driver is like a sub-class of modules
	1. Modules are used for the below:
		1. Device Drivers.
		2. File System - no hw involved
		3. System Calls - no hw involved
		4. Network Drivers: Drivers implementing a network protocol (TCP/IP) - no hardware involved
		5. TTY line disciplines: For terminal devices
3. Advantages of Kernel Modules
	1. All parts of the base kernel stay loaded all the time (always in RAM). Modules can save you memory, because you have to have them loaded only when you're actually using them
	2. Users wouldn't need to rebuild and reboot the kernel every time they would require a new functionality
		1. Development is faster
	3. A bug in driver which is compiled as a part of kernel will stop system from loading, whereas module allows system to load.
	4. Faster to maintain and debug
		1. No recompilation or reboot
	5. Makes it easier to maintain multiple machines on a single kernel base
		1. Single functionality for all systems + hw specific modules
4. Disadvantages of Kernel Modules
	1. Size: Module management consumes unpageable kernel memory (more pages with modules)
		1. A basic kernel with a number of modules loaded will consume more memory than an equivalent kernel with the drivers compiled into the kernel image itself
			1. This can be a very significant issue on machines with limited physical memory
	2. As kernel modules are loaded very late in the boot process, the core functionality has to go in the base kernel (E.g. Memory Management)
		1. Memory Management cannot be a module
	3. Security: If you build your kernel statically and disable Linux's dynamic module loading feature, you prevent run-time modification of the kernel code
		1. We may need to disable this feature for security reasons
5. Configuration
	1. In order to support modules, the kernel must have been built with the following option enabled:

			CONFIG_MODULES=y
			
	2. `cd /boot`
		
			cat config-`uname -r` | grep CONFIG_MODULES

### Types of Kernel Modules ###
1. Types:
	1. In-Source Tree: Modules present in the Linux Kernel Source Code
	2. Out-of-Tree: Modules not present in the Linux Kernel Source Code
		1. Goes through review process (by maintainers)
		2. If it is fine, it becomes part of source code
3. All modules start out as "out-of-tree" develpments, that can be compiled using the context of a source-tree.
4. Once a module gets accepted to be included, it becomes an in-tree module

### Basic Commands ###
1. List Modules: (lsmod) lsmod gets its information by reading the file /proc/modules
	1. Changed to `/sys/modules` - lsmod reads info from here
	
			lsmod | wc -l
			lsmod | less # module loaded last is shown first, size, used by another module or not (dependencies)
	
2. Module Information: (modinfo): prints the information of the module

		strace lsmod # reads /sys/modules - each module has a folder here
		modinfo e1000 | less
		
			shows params accepted by module while loading
			version
			is in in-tree or not

### Hello World Kernel Module ###
### Printf vs Printk ###
### Simplified Makefile ###
### What Happens When Run insmod ###
### What Happens if we return -1 from Kernel Module Init function ###
### Give Another Name to Kernel Module ###
### Kernel Module Span Across Multiple C Files ###
### Two Kernel Modules From Single Makefile ###
### Dmesg in Deep ###
### Dmesg Follow Option ###
### Linux Kernel Module Example with module_init Only ###
### Linux Kernel Module Example with module_exit Only ###
### Two Line Linux Kernel Module ###
### Cross Compilation ###
### Resources ###
### Quiz 1: Introduction Quiz ###

## Linux Kernel Module Internals ##
### From .c to .ko ###
### Understanding Module.symvers and modules.order ###
### Insmod vs Modprobe ###
### How Modprobe Calculates Dependencies (modules.dep/depmod) ###
### Understanding module_init & module_exit Functions ###
### Examples of gcc Attribute Alias ###
### Linux Kernel Module Example Without module_init and module_exit macro ###
### Quiz 2: Linux Kernel Module Internals Quiz ###

## Module Parameters ##
### Passing Parameters to Linux Kernel Modules ###
### What Happen if We Pass Incorrect Values to Module Parameters ###
### How to Pass Parameters to Builtin Modules ###
### How to Pass String with Multiple Word as Parameter ###
### Passing Zero to Permission Argument of module_param Macro ###
### Passing Array as Module Parameters ###
### Inv bool ###
### Quiz 3: Module Parameters Quiz ###

## Exporting Symbols ##
### Symbol and Symbol Table ###
### Exporting Symbol ###
### System.amp vs /proc/kallsyms ###
### Linux Kernel Module Example of Exporting Function ###
### Module Stacking ###
### Linux Kernel Module Example of Exporting Variable ###
### Version Magic ###
### Resources ###
### Quiz 4: Exporting Symbols Quiz ###

## Module Licenses ##
### What Happens if we Don't Specify MODULE_LICENSE Macro ###
### What is Tainted Kernel ###
### How to Check Whether the Kernel is in Tainted State or Not ###
### What Happens When You Specify Invalid Lisense (Say "abd") ###
### What Happens When a Non-GPL Kernel Module Trying to Access GPL Module ###
### Quiz 5: Module Licenses Quiz ###

## Module Metadata ##
### How to Find Out Kernel Version From a .ko ###
### Module Metadata ###
### MODULE_INFO Macro ###
### Objdump on Kernel Module ###
### Quiz 6: Module Metadata Quiz ###

## Printk ##
### What Happens if we Continously Call printk ###
### Printk Kernel Ring Buffer Size ###
### Printk Log Levels ###
### Default printk Log Level ###
### Kernel Messages on Console ###
### Short printk Macros ###
### Enable pr_debug Messages ###
### Linux Kernel Module Example Which Prints Floating Point Number ###
### Why Floating Point Unit is OFF in Kernel Space ###
### Limiting printk Messages - printk_rate_limit ###
### Limiting printk Messages - printk_once ###
### Avoiding Default New Line Behavior of printk ###
### Printing Hex Dump - print_hex_dump ###
### Printing Hex Dump - print_hex_dump_bytes ###
### Dynamic Debug ###
### Resources ###
### Quiz 7: Printk Quiz ###

## System Call for Loading Module ##
### What Happens if I Try to Load Non-Ko File with insmod ###
### strace on insmod Command ###
### Find out Name of Module From .ko ###

## Kernel Panic, Ooops, Bug ##
### How to Dump Kernel Stack ###
### What is Kernel Panic ###
### Kernel Panic Example ###
### What is Oops ###
### Oops Example ###
### What is BUG and Example ###
### Can We Remove Module After Bug/Oops ###
### How to Define Preprocessing Symbol in Makefile ###
### Resources ###
### Quiz 8: Quiz ###

## Process Management in Linux Kernel ##
### How to Find Out How Many CPUs Are Present From User Space and Kernel Space ###
### Process Representation in Linux Kernel and Process States ###
### Linux Kernel Module Example Demonstrating Process Name, Process Id and Processes ###
### Linux Kernel Module Example Demonstrating Current Macro ###
### Linux Kernel Module Exmaple Demonstrating Current Macro Part 2 ###
### Linux Kernel Module Which Accepts PID as Argument and Print Process and Parent ###
### Process Memory Map ###
### Linux Kernel Module Example for Printing Process Memory Map ###
### Quiz 9: Quiz ###

## Kernel Threads ##
### Introduction to Kernel Threads ###
### Kernel Thread Example - kthread_create ###
### Kernel Thread Example - kthread_run ###
### Two Kernel Threads Example ###
### Can We Have Two Kernel Threads With Same Name ###
### What Happens If We Don't Use kthread_should_stop() in Thread Function ###
### What Happens If We Don't Call kthread_stop() in module_exit ###
### Print Process Id in Kernel Module ###
### Linux Kernel Thread Example of Race Condition ###

## Module Support for Multiple Kernels ##
### LINUX_VERSION_CODE Macro ###
### KERNEL_VERSION Macro ###
### UTS_RELEASE ###
### Linux Kernel Module Example Supporting Multiple Versions ###
### Output of Pre-Processed Stage ###
### Resources ###

## Bonus Section ##
### Significance of __init Macro ###
### Can We Use __init Macro for Builtin Modules ###
### __exit Macro ###
### __initdata and __exitdata Macro ###
### How Do You List Builtin Modules ###
### How to Load Modules Automatically ###
### Blacklisting Kernel Modules ###
### Blacklisting Kernel Modules Part 2 ###
### Passing Parameters to Linux Kernel Modules Loaded Using modprobe ###
### systool ###