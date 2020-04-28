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
		14. Commit message: `USB: otg: Fix bug on remove path without transceiver` (summary of what it does)
		15. Signed of by:
			1. Developer's certificate of origin
				1. I added this change; or
				2. Based this on a previous work with a compatible license; or
				3. Provided to me by (a), (b), or (c) and not modified
				4. This contribution is public
			2. Every single line of code is reviewed by atleast 2 people and they sign off
			3. No anonymous contributors allowed
			4. Example commit message:

					Staging: comedi: ssc_dnp: fixed a brace coding style issue
					
					Fixed a coding style issue.
					
					signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
					
			5. `git log`
			6. `git show` - patch in format
			7. `git show --pretty=full`
				1. Authorship is preserved
		16. `git format-patch master..tutorial` (patch is made)
			1. Converts to email
		17. We can configure email clients to send patches:
			1. There is documentation
		18. `./scripts/get_maintainer.pl <patch>.patch`
		18. `git send-email --to gegkh@suse.de --cc devel@deiverdev.osuosl.org --cc linux-kernel@vger.kernel.org <patch>.patch `
			1. Multiple files may need a summary patch (tell the order)
			2. Patch should do only one thing (not replace sub-systems)
			3. Adding new driver code is fine
			4. Modifying a sub-system needs review process
		19. `vim ~/.gitconfig`

				[sendmail]
						smtpserver = /usr/bin/msmtp
						
			1. man pages can tell how to configure for email servers
		20. `./scripts/get_maintainer.pl --file drivers/hid/hid-ezkey.c`
			1. We can contact them if required
		21. `git blame drivers/hid/hid-ezkey.c`
			1. Who wrote what line etc...
		22. `git show <commit-id>`
			1. Who made this commit and what changes they made
8. Checklist:
	1. Kernel builds with patch applied
	2. Correct "From:" address
	3. Concise "Subject:"
	4. Explain the patch
	5. Signed-off by
9. If no response:
	1. Wait for a week and re-send again
		1. Persistence is the key
10. `kernelnewbies.org`	
	1. Wiki
	2. What is in each kernel release
	3. mailing list
	4. irc channel
		1. Questions are answered
	5. Every single sub-system of kernel has a mailing list (usb)
		1. open - any one can send email