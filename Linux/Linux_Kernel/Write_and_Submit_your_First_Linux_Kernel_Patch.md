# Write and Submit your First Linux Kernel Patch #
## Greg Kroah-Hartman SUSE Labs / Novell ##
1. git://github.com/greghk/kernel-tutorial.git
2. Documentation/HOWTO
	1. File that has content and links
3. Books: Linux Kernel in a Nutshell (free)
	1. How to build kernel
4. C: The C Programming language
	1. Dennis/Ritchie
5. Topics
	1. Git basics
	2. Linux Kernel coding style
	3. Fixing a file
	4. Generating a patch
	5. Emailing the patch
6. Git (free books)
	1. `git status`
		1. Where is kernel? `git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git`
	2. `git branch tutorial`
		1. `git checkout tutorial`
7. Coding style:
	1. We can see bugs
	2. It should be consistent
		1. Pick a coding style and stick to it
	3. We want someone else to join
	4. Linux Kernel is very good code
	5. `Documentation/CodingStyle` - Document
		1. Rules
			1. all tabs are 8 chars
			2. 80 char line limit (if too long - refactor)
		3. Braces: upper left, lower right
		4. `goto` are used
			1. Locking - jump to the end and release all locks (scheduler)
		5. single arg if statements - no braces
		6. function: all the way to left

				int function(int *baz)
				{
					do_something(baz);
					return 0;
				}
				
		7. `scripts/checkpatch.pl` (if we make modification to kernel if it is good or not)
		
				./scripts/checkpatch.pl --file --terse drivers/staging/modedi/drivers/ssv_dnp.c
				
		8. `vim drivers/staging/comedi/drivers/ssv_dnp.c +330`
		9. `git status`
		10. `git diff`
		11. `make M=drivers/staging/comedi/`
		12. It is hard to have test suite for hardware interactions
			1. Different hardware work differently
				1. Community checks (if people have the hardware they report)
		13. `git commit -a`