# How to Build Character Drivers for the Linux Kernel #
1. How working driver is loaded and deployed
2. LF331 - full course
3. ls -l
	1. `char_driver.c`
	2. `misc_driver.c` - simpler to code (Miscellaneous class)
	3. `Makefile` - used to compile the drivers
4. `make`
5. `sudo su`
	1. `tail -f /var/log/messages`
6. `ls -l /dev | less`
	1. entry for device drivers
	2. Reading and writing to the nodes is possible
7. `c` - character drivers
8. `b` - block drivers
9. Major number, Minor number:
	1. Major number: can correspond to the same driver
	2. Minor number: May correspond to different instances or to different methods of use of device driver
	3. Now different drivers can use the same major number but minor numbers should not overlap
10. Loading device drivers:
	1. `su`
	2. `insmod char_driver.ko`
	3. `insmod misc_driver.ko`
	4. `ls -l /dev/my_*`
		1. new nodes created for both drivers
11. How to interact with them?
	1. `echo hello char driver > /dev/my_cdrv`
	2. `echo hello char driver > /dev/my_mdrv`
	3. `cd /sys/module`
		1. `ls`
			1. `char_driver`
			2. `misc_driver`
				1. `cd misc_driver`
					1. `ls`
						1. info about device driver
						2. Reference count
						3. Parameters
						4. ...
	4. `cd /sys/class`
		1. `my_class`
			1. symbolic link to devices directory
		2. `misc` - existing
			1. symbolic link to device directory
	5. `cd /sys/devices/virtual/my_class`
		1. `my_cdrv`
			1. `cat dev` - major:minor
	6. `dd if=/dev/my_cdrv bs=32 count=1` - to read from the device
		1. `of` - commandline
		2. `bs` - block size (bytes to be read)
	7. `dd if=/dev/my_mdrv bs=32 count=1`
12. `lsmod`
	1. list of device drivers - size, who is using
13. Removing drivers:
	1. `rmmod char_driver`
	2. `rmmod misc_driver`
	3. `lsmod`
14. `Makefile`

		### Automatic Makefile generation by 'genmake' script ###
		### Copyright, Jerry Cooperstein, coop@linuxfoundation.org 2/2003 - 1/2012 ###
		### License: GPLv2 ###
		
		obj-m += char_driver.o misc_driver.o
		
		export KROOT=/lib/modules/3.6.2/build
		
		allofit: modules
		modules:
					@$(MAKE) -C $(KROOT) M=$(shell pwd) modules
		modules_install:
					@$(MAKE) -C $(KROOT) M=$(shell pwd) modules_install
		kernel_clean:
					@$(MAKE) -C $(KROOT) M=$(shell pwd) clean
					
		clean: kernel_clean
					rm -rf Module.symvers modules.order
					
	1. `obj-m` - modules that need to be compiled
	2. `KROOT` - kernel source (symbolic link)
	3. `-C` - main kernel directory
	4. `-M` - list of directories to compile the modules in
	5. `modules` - target
	6. `modules_install` - install target - puts modules under `/lib/modules/<version>` - can be loaded with modprobe
	7. `clean` - cleanup after compile
15. `misc_driver.c`

		/*
		* The code herein is: Copyright the Linux Foundation, 2012
		*
		* This Copyright is retained for the purpose of protecting free
		* redistribution of source.
		*
		*		URL:	http://training.linuxfoundation.org
		*		email:	trainingquestions@linuxfoundation.org
		* This code is distributed under Version 2 of the GNU General Public
		* License, which you should have received with the source.
		*
		*/

		/* Here the order of import matters mostly or else compilation errors or other misbehaviour may occur */
		#include <linux/module.h>	/* for modules */
		#include <linux/fs.h>		/* file_operations */
		#include <linux/uaccess.h>	/* copy_(to,from)_user */
		#include <linux/init.h>		/* module_init, module_exit */
		#include <linux/slab.h>		/* kmalloc */
		#include <linux/device.h>
		#include <linux/miscdevice.h>
		
		#define MYDEV_NAME "my_mdrv"
		
		static struct device *my_dev;	// all devices in system generally have a structure
		static char *ramdisk;			// buffer to read and write from
		static size_t ramdisk_size = (16 * PAGE_SIZE);	// Most arch 4 KB or 64 KB (64 bit)
		
		// real open method might do: initialize device, setup private data area in the *file struct, ...
		// every time anyone opens a device, they get a file structure but has only one inode for the device that only descibes the device
		// many file structures pointing to one inode
		static int mycdrv_open(struct inode *inode, struct file *file)
		{
			static int counter = 0;
			dev_info(my_dev, " attempting to open device: %s:\n", MYDEV_NAME);
			dev_info(my_dev, " MAJOR number = %d, MINOR number = %d\n", imajor(inode), iminor(inode)); // print major and minor numbers
			counter++;
			
			dev_info(my_dev, " successfully open device: %s:\n\n", MYDEV_NAME);
			dev_info(my_dev, " have been opened %d times since being loaded\n", counter);
			dev_info(my_dev, "ref=%d\n", (int)module_refcount(THIS_MODULE));
			
			return 0;
		}
		
		static int mycdrv_release(struct Inode *inode, struct file *file)
		{
			dev_info(my_dev, " closing device: %s:\n\n", MYDEV_NAME);
			return 0;
		}
		
		static ssize_t;
		// __user - buffer in user space - copied from ramdisk in kernel to the user buffer
		mycdrv_read(struct file *file, char __user *buf, size_t lbuf, loff_t *ppos)
		{
			int nbytes, maxbytes, bytes_to_do;
			maxbytes = ramdisk_size - *ppos;
			bytes_to_do = maxbytes > lbuf ? lbuf : maxbytes;
			if (bytes_to_do == 0)
				dev_warn(my_dev, "Reached end of the device on a read");
			nbytes = bytes_to_do - copy_to_user(buf, ramdisk + *ppos, bytes_to_do); // we cannot use memcpy because we are no sure if address is legal. if page fault is involved, the page might have been swapped out of memory, copy_to_user returns number of bytes not successfully copied
			*ppos += nbytes; // ppos - position within the file which is advanced by nbytes
			dev_info(my_dev, "Leaving the READ function, nbytes=%d, pos=%d\n", nbytes, (int)*ppos);
			return nbytes;
		}
		
		static ssize_t
		mycdrv_write(struct file *file, const char __user *buf, size_t lbuf, loff_t *ppos)
		{
			int nbytes, maxbytes, bytes_to_do;
			maxbytes = ramdisk_size - *ppos;
			bytes_to_do = maxbytes > lbuf ? lbuf : maxbytes;
			if (bytes_to_do == 0)
				dev_warn(my_dev, "Reached end of the device on a write");
			nbytes = bytes_to_do - copy_from_user(ramdisk + *ppos, buf, bytes_to_do);
			*ppos += nbytes;
			dev_info(my_dev, "Leaving the WRITE function, nbytes=%d, pos=%d\n", nbytes, (int)*ppos);
			return nbytes;
		}
		
		// repositions offset within the file - trivial default implementation
		static loff_t mycdrv_lseek(struct file *file, loff_t offset, int orig)
		{
			loff_t testpos;
			switch (orig) {
			case SEEK_SET:
					testpos = offset;
					break
			case SEEK_CUR:
					testpos = file->f_pos + offset;
					break;
			case SEEK_END:
					testpos = ramdisk_size + offset;
					break;
			default:
					return -EINVAL;
			}
			testpos = testpos < ramdisk_size ? testpos : ramdisk_size;
			testpos = testpos >= 0 ? testpos : 0;
			file->f_pos = testpos;
			dev_info(my_dev, "Seeking to pos=%ld\n", (long)testpos);
			return testpos;
		}
		
		static const struct file operations mycdrv_fops = { // pointer to all the methods the driver can do
			.owner = THIS_MODULE, // exception - owner - describes attributes of the module - macro THIS_MODULE is generally used
			.read = mycdrv_read,	// called when we read from device and passes relevant arguments to the function
			.write = mycdrv_write,
			.open = mycdrv_open,
			.release = mycdrv_release,	// when you close the device - entry method name is different from the actual function call from the application???
			.llseek = mycdrv_lseek	// seeking
			// many more things can go here: Ex: mmap: for memory mapping (if device is memory mapped), ioctl - ioctl commands, async read and write, readv, writev
			// if not defined, an error is returned to user
			// default method for open is succeed
		};
		
		static struct miscdevice my_misc_device = {
			.minor = MISC_DYNAMIC_MINOR,	// dynamically allocated that no one else is using (MISC devices have major number 10
			.name = MYDEV_NAME,	// name that is given in /dev directory
			.fops = &mycdrv_fops,	// file operations structure
		};
		
		static int __init my_init(void)	// __init - tells this function will never be used again once the module is loaded, any resources allocated can be released, it can still be called when module is built into the kernel when it boots (exit routine is discarded)
		{
			ramdisk = kmalloc(ramdisk_size, GFP_KERNEL); // allocation in user space, GFP_KERNEL - If memory is not available, go to sleep until it is available (GFP_ATOMIC - return without blocking if memory is not available - more useful for interrupt routines which are not allowed to sleep)
			if (misc_register(&my_misc_device)) { // misc_register - loads device in system
				pr_err("Couldn't register device misc, "
						"%d,\n", my_misc_device.minor); // macro based on printk macro - prints only if there is an error
						kfree(ramdisk); // if there is a problem then free - no garbage collection
						return -EBUSY; // error code if there is a problem
			}
			my_dev = my_misc_device.this_device; // pointer to device structure
			dev_info(my_dev, "Succeeded in registering device %d\n", MYDEV_NAME); // like printf but prepends a unique string corresponding to the device
			return 0; // success, -ve values are errors, +ve values may or may not have a meaning
		}
		
		static void __exit my_exit(void) // __exit - it can be put in cache cold area - it is going to be run atmost once
		{
			dev_info(my_dev, "Unregistering Device\n");
			misc_deregister(&my_misc_device);	// deregisters
			kfree(ramdisk);	// frees memory
		}
		
		module_init(my_init);	// macro
		module_exit(my_exit);	// macro
		
16. `char_driver.c`

		...
		static dev_t first; // device type - packs major and minor numbers
		static unsigned int count = 1; // number of minor numbers we want
		
		...
		static struct class *foo_class; // 
		
		...
		static init __init my_init(void)
		{
			// We have to request a range of major and minor numbers that are unique and noone else is using
			if (alloc_chrdev_region(&first, 0, count, MYDEV_NAME) < 0) { // function to automatically find that - number is returned in "first" and minor number 0 is requested and how many minor numbers we want
				pr_err("failed to allocate character device region\n");
				return -1;
			}
			if (!(my_cdev = cdev_alloc())) { // allocate space for cdev_alloc structure
				pr_err("cdev_alloc() failed\n");
				unregister_chrdev_region(first, count); // if fails, we de-allocate the space so that someone else can use it
				return -1;
			}
			cdev_init(my_cdev, &mycdrv_fops); // sets up various fields. Puts a pointer to the file operation structure so that system will know the methods associated with it
			ramdisk-= kmalloc(ramdisk_size, GFP_KERNEL);
			if (cdev_add(my_cdev, first, count) < 0) { // driver goes live - people can access it
				pr_err("cdev_add() failed\n");
				cdev_del(my_cdev);
				unregister_chrdev_region(first, count);
			}
			
			foo_class = class_create(THIS_MODULE, "my_class"); // new class of driver. called my_class
			my_dev = device_create(foo_class, NULL, first, NULL, "%s", MYDEV_NAME); // returns device structure associated with the new class
			
			dev_info(my_dev, "\nSucceeded in registering character device %s\n", MYDEV_NAME);
			dev_info(my_dev, "Major number = %d, Minor number = %d\n", MAJOR(first), MINOR(first));
			return 0;
		}
		
		static void __exit my_exit(void)
		{
			dev_info(my_dev, "\ndevice unregistering\n");
			device_destroy(foo_class, first);
			class_destroy(foo_class);
			if (my_cdev)
				cdev_del(my_cdev); // device goes dead - de-allocates space from cdev structure
			unregister_chrdev_region(first, count); // releases claim on major and minor numbers
			kfree(ramdisk);
		}
		...
		MODULE_AUTHOR("Jerry Cooperstein");
		MODULE_DESCRIPTION("LF Sample Char Driver");
		MODULE_LICENSE("GPL V2");
		
	1. `modinfo char_driver.ko` - extracts info
		1. Dependencies are also displayed
		2. Major parameters - kernel version, type of kernel, perempt(?), ...
3. Other kinds of drivers:
	1. Block drivers
	2. PCI drivers
	3. USB drivers (BUS)
	4. Network drivers (don't have device nodes)