# Bash Guide for Beginners #
## Introduction ##
### Why this guide? ###
1. Has real life examples
2. Automation

### Who should read this book? ###
1. UNIX or Unix like system users
2. Shell scripting for ease of execution of daily tasks
3. Pre-requisites
	1. Understand system boot and shutdown processes, init and initscripts
	2. Users and Groups, Set passwords
	3. Permissions, special modes
	4. Naming convention of devices, partitioning, mounting/unmounting file systems

### What do you need? ###
1. [bash](http://www.gnu.org/directory/GNU/)

### Organization of this document ###
1. Discusses concepts useful in daily life of serious bash user
2. Chapters:
	1. Chapter 1: Why bash is so good, building blocks, first guidelines on developing good scripts
	2. Chapter 2: Script basics: writing and debugging
	3. Chapter 3: The bash environment: initialization files, variables, quoting characters, shell expansion order, aliases, options
	4. Chapter 4: Regular expressions: an introduction
	5. Chapter 5: Sed: an introduction to the sed line editor
	6. Chapter 6: Awk: introduction to the awk programming language
	7. Chapter 7: Conditional statements: constructs used in Bash to test conditions
	8. Chapter 8: Interactive scripts: making scripts user-friendly, catching user input
	9. Chapter 9: Executing commands repetitively: constructs used in Bash to automate command execution
	10. Chapter 10: Advanced variables: specifying variable types, introduction to arrays of variables, operations on variables
	11. Chatper 11: Functions: an introduction
	12. Chapter 12: Catching signals: introduction to process signaling, trapping user-sent signals

## Bash and Bash Scripts ##
### Common shell programs ###
1. Shell program interprets user commands
	1. Direct commands
	2. Read from file (shell script or shell program)
	3. The commands are not compiled but interpreted
2. Shell reads commands line by line and finds it on the system
3. Compiler converts a program into machine readable form, an executable file - which may be used in shell script

### Shell Types ###
1. UNIX system offers different shell types
	1. `sh`: Bourne Shell - Basic shell, small program with few features
		1. Not standard
		2. Linux supports for compatibility with UNIX programs
	2. `bash`: Bourne Again Shell - Standard GNU shell (intuitive and flexible)
		1. Powerful tool for advanced and professional user
		2. Standard shell in Linux (for common users)
		3. it is super-set of `sh`
			1. It has add-ons and plugins
		4. Book covers this
	3. `csh`: C shell - syntax resembles C programming language
	4. `tcsh`: TENEX C shell - superset of C shell
		1. Enhanced user-friendliness and speed
		2. It is also called Turbo C shell
	5. `ksh`: Korn shell - superset of Bourne shell `sh`
		1. nightmare for beginners
2. `/etc/shells` - file that has known shells in the Linux system
3. Default shell is set in `/etc/passwd` file

		mia:L2NOfqdlPrHwE:504:504:Mia Maya:/home/mia:/bin/bash

4. To switch shell

		tcsh

### Advantages of the Bourne Again SHell ###
1. Bash is sh compatible and has useful features from ksh and csh
	1. IEEE POSIX Shell and Tools standard
	2. Has functional improvements over `sh` for programming and interactive use
		1. Commandline editing
		2. unlimited size of command history
		3. job control
		4. shell functions and aliases
		5. indexed arrays of inlimited size
		6. integer arithmetic in any base from two to sixty-four
		7. Can run most `sh` scripts without modification
	3. Has many extra features that other shells can't offer

#### Features only found in bash ####
1. Invocation
	1. `set` can be used to configure single character shell commandline options
2. Bash startup files
	1. Startup files: scripts read and executed by Bash when it starts
	2. Invoked as an interactive login shell, or with `--login`
		1. Interactive - we can enter commands
		2. Login shell - The shell is obtained only after authenticating to the system (username and password)
		3. Files read:
			1. `/etc/profile`
			2. `~/.bash_profile`, `~/.bash_login` or `~/.profile` - first existing readable file is read
			3. `~/.bash_logout` - upon logout
		4. Error messages are printed if config files exist but are not readable
			1. If a file does not exist, bash searches for the next one
	3. Invoked as an interactive non-logic shell
		1. Non-login shell - did not have to authenticate to the system
			1. When we open a terminal using an icon, or a menu item, that is a non-login shell
		2. Files read:
			1. `~/.bashrc` - usually referred in `~/.bash_profile`

					if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

	4. Invoked non-interactively
		1. All scripts use non-interactive shells
			1. They are programmed to do certain tasks (and cannot be instructed to change course)
		2. Files read:
			1. defined in `BASH_ENV` **(M)**
				1. Needs full path (`PATH` is not used to find the files)
	5. Invoked with the sh command
		1. Bash tries to behave like `sh` program while confirming to POSIX standard
		2. Files read:
			1. `/etc/profile`
			2. `~/.profile`
				1. This file is read as follows:

						vi ~/.profile

							export <NAME>=<VALUE>

						vi simple.sh

							echo -e "${NAME}\n"

	6. POSIX mode
		1. Eanbled using 
			1. `set -o posix`
			2. call bash program using `--posix` option
			3. set `POSIXLY_CORRECT` variable
		2. Used to make bash behave compliant with POSIX standard
		3. Files read:
			1. Defined by `ENV` variable
	7. Invoked remotely
		1. Files read (when invoked by **rshd**)
			1. `~/.bashrc`
			2. Avoid use of r-tools
				1. `rlogin`
				2. `telnet`
				3. `rsh`
				4. `rcp`
			3. r-tools are insecure because confidential data is sent over network un-encrypted
				1. Solution: Use implementations of Secure SHell (SSH)
					1. [http://www.openssh.org](http://www.openssh.org/)
		2. Invoked when UID is not equal to EUID
			1. No startup files are read
3. Interactive shells
	1. What is an interactive shell?
		1. it reads from and writes to user terminal
			1. input and output are connected to terminal
		2. `bash` command without options starts interactive shell
			1. Also when shell is invoked to read from standard input
			2. String to read from
		3. Checking if shell is interactive

				`echo $-` **(M)** (look for i)

			1. In non-interactive shells, prompt PS1 is unset
4. Interactive shell behavior
	1. Differences in interactive mode:
		1. Bash reads startup files
		2. Job control enabled by default
		3. Prompts are set, PS2 is enabled for multi-line commands
			1. `>`
		4. `ignoreeof` - option to bash to ignore EOF
		5. Command history and history expansion are enabled by default
			1. History is saved in `HISTFILE`
				1. Default `~/.bash_history`
		6. Alias expansion is enabled
		7. In absense of traps: `SIGTERM` signal is ignored
		8. In absense of traps: `SIGINT` is caught and handled
			1. ctrl+c will not quit interactive shell
		9. Sending `SIGHUP` signal to all jobs on exit is configured with `huponexit` option
			1. `SIGHUP` - signal hang up
				1. Signal sent to a process when its controlling terminal is closed
		10. Commands are executed upon read
		11. Bash checks for mail periodically
		12. Bash can be configured to exit when it encounters unreferenced variables. In interactive mode this behavior is disabled
		13. When shell build-in commands encounter redirection errors, this will not cause shell to exit
		14. Special build-ins returning errors when used in POSIX mode don't cause the shell to exit
		15. Failure of exec will not exit the shell
		16. Parser syntax errors don't cause the shell to exit
		17. Simple spell check for the arguments to the cd build-in is enabled by default
		18. Automatic exit after the length of time specified in the TMOUT variable has passed, is enabled

#### Conditionals ####
1. `[[` compound command is used
2. `test` **(M)** command is used
3. `[` built in command is used
4. Unary expressions:
	1. Usually file status checks
5. Binary expressions:
	1. String comparison
	2. Numeric comparison
6. `/dev/fd/N` - file descriptor N is checked
7. `/dev/stdin`, `/dev/stdout`, `/dev/stderr` - 0, 1, 2 are checked

#### Shell Arithmetic ####
1. Evaluation using arithmetic expressions or using `let` built-in
	1. Fixed width integers are used (no check for overflow)
	2. Division by 0 is trapped and flagged as error
2. Operator precedence and associativity is same as in C language

#### Aliases ####
1. Alias allows a string to be substituted for a word when it is used as first word of a simple command
	1. Shell maintains list of aliases set and unset using `alias` and `unalias` commands
2. Bash reads one complete line of input before executing any of commands on the line
	1. Aliases are expanded when command is read (not when executed)
		1. Alias definition on same line as another command does not take effect until next line of input is read
	2. Alias is expanded when a function definition is read, not when function is executed
		1. Alias definitions in a function are not available until the function is executed

#### Arrays ####
1. Bash provides one-dimensional array variables
	1. Any variable can be used as array
	2. `declare` **(M)** will explicitly declare an array
	3. No max limit on size
	4. Members need not be indexed or assigned contiguously
	5. Arrays are zero based

### Executing Commands ###
### Building Blocks ###
### Developing Good Scripts ###
### Summary ###
### Exercises ###

## Writing and Debugging Scripts ##
### Creation of and Running a Script ###
### Script Basics ###
### Debugging Bash Scripts ###
### Summary ###
### Exercises ###

## The Bash Environment ##
### Shell Initialization Files ###
### Variables ###
### Quoting Characters ###
### Shell Expansion ###
### Aliases ###
### More Bash Options ###
### Summary ###
### Exercises ###

## Regular Expressions ##
### Regular Expressions ###
### Examples Using Grep ###
### Pattern Matching Using Bash Features ###
### Summary ###
### Exercises ###

## The GNU sed Stream Editor ##
### Introduction ###
### Interactive Editing ###
### Non-Interactive Editing ###
### Summary ###
### Exercises ###

## The GNU awk Programming Language ##
### Getting Started with gawk ###
### The Print Program ###
### Gawk Variables ###
### Summary ###
### Exercises ###

## Conditional Statements ##
### Introduction to if ###
### More Advanced if Usage ###
### Using case Statements ###
### Summary ###
### Exercises ###

## Writing Interactive Scripts ##
### Displaying User Messages ###
### Catching User Input ###
### Summary ###
### Exercises ###

## Repetitive Tasks ##
### The for Loop ###
### The while Loop ###
### The until Loop ###
### I/O Redirection and Loops ###
### Break and Continue ###
### Making Menus with the Select Build-in ###
### The Shift Built-in ###
### Summary ###
### Exercises ###

## More on Variables ##
### Types of Variables ###
### Array Variables ###
### Operations on Variables ###
### Summary ###
### Exercises ###

## Functions ##
### Introduction ###
### Examples of Functions in Scripts ###
### Summary ###
### Exercises ###

## Catching Signals ##
### Signals ###
### Traps ###
### Summary ###
### Exercises ###

## Shell Features ##
### Commmon Features ###
### Differing Features ###