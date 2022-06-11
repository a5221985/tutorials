# Bash Scripting Tutorial #
1. A powerful component of a Linux system
2. Supported on commandline and through scripts
3. It is used to automate tasks
4. Topics:
	1. Examples to show capability of bash scripts
	2. How to utilize different aspects of bash
	
## In This Bash Scripting Tutorial You Will Learn ##
	1. How to write hello world Bash script
	2. How to pass arguments to Bash script
	3. How to use global and local variables in Bash
	4. How to read user input
	5. How to load and read arrays in Bash
	6. How to compare integers and strings
	7. How to detect file types in Bash
	8. How to use `for`, `while`, and `until` loops
	9. How to use functions in Bash
	10. How to use `if` statements
	11. How to use `case` statements
	12. How to use quotes and special characters in Bash
	13. How to perform arithmetic calculations with Bash
	14. How to use Bash redirection

## Hello World Bash Shell Script - Bash Scripting Tutorial ##
1. Step 1: Find out where Bash interpreter is located

		$ which bash
		/bin/bash
		
	1. Shows that Bash shell is stored in `/bin/bash`
2. Step 2: Define a file `hello_world.sh`

		$ nano hello_world.sh
		
3. Step 3: Copy the following lines into the file

		#!/bin/bash
		# declare STRING variable
		STRING="Hello World"
		# print variable on a screen
		echo $STRING
		
	1. Shebang: Every bash script starts with `#!`
		1. We define the interpreter here: `/bin/bash`
		
4. Step 4: Make the file executable

		$ chmod +x hello_world.sh
		
5. Step 5: Execute the bash script

		$ ./hello_world.sh
		Hello World

## Simple Backup Bash Shell Script ##
1. We can put the same commands we execute on commandline
2. Example:

		#!/bin/bash
		tar -czf myhome_directory.tar.gz /home/linuxconfig
		
3. Advantage of script:
	1. We don't have to re-type the entire command each time
	2. We can expand script later on to make it more sophisticated

## Variables in Bash Scripts ##
1. `$STRING` - simple variable
2. `echo` - command to print on commandline
3. Example: Put a time-stamp in file name using `date` command

		#!/bin/bash
		OF=myhome_directory_$(date +%Y%m%d).tar.gz # **(M)**
		tar -czf $OF /home/linuxconfig

## Global vs. Local Variables ##
1. Global variable: Can be used anywhere in the script
2. Local variable: Can only be used inside a function in which it is declared
3. Eample:

		#!/bin/bash
		# Define bash global variable
		# This variable is global and can be used anywhere in this bash script
		VAR="global variable"
		
		function bash {
			# Define bash local variable
			# This variable is local to bash function only
			local VAR="local variable"
			echo $VAR
		}
		
		echo $VAR
		bash
		# Note the bash global variable did not change
		# "local" is bash reserved word
		echo $VAR

## Passing Arguments to the Bash Script ##
1. Ways in which bash script receives arguments:

		#!/bin/bash
		# use predefined variables to access passed arguments
		# echo arguments to the shell
		echo $1 $2 $3 ' -> echo $1 $2 $3'
		
		# We can also store arguments from bash command line in special array
		args=("$@")
		# echo arguments to the shell
		echo ${args[0]} ${args[1]} ${args[2]} ' -> args=("$@");
		
		# use $@ to print out all arguments at once
		echo $@ ' -> echo $@'
		
		# use $# variable to print out
		# number of arguments passed to the bash script
		echo Number of arguments passed: $# ' -> echo Number of arguments passed: $#'

## Executing Shell Commands with Bash ##
1. By constructing a new subshell with `$()` syntax
2. Example:

		#!/bin/bash
		# use a subshell $() to execute shell command
		echo $(uname -o)
		# executing bash command without subshell
		echo uname -o

	1. Last line just prints 'uname -o'

## Reading User Input ##
## Bash Trap Command ##
## Arrays ##
### Declare Simple Bash Array ###
### Read File Into Bash Array ###
## Bash if/else/fi Statements ##
### Nested if/else ###
## Bash Comparisons ##
### Arithmetic Comparisons ###
### String Comparisons ###
## Bash File Testing ##
## Loops ##
### Bash for Loop ###
### Bash while Loop ###
### Bash until Loop ###
## Control Bash Loop with Input ##
## Bash Functions ##
## Bash Select ##
## Case Statement Conditional ##
## Bash Quotes and Quotations ##
### Escaping Meta Characters ###
### Single Quotes ###
### Double Quotes ###
### Bash Quoting with ANSI-C Style ###
## Arithmetic Operations ##
### Bash Addition Calculator Example ###
### Bash Arithmetics ###
### Round Floating Point Number ###
### Bash Floating Point Calculations ###
## Redirections ##
### STDOUT From Bash Script to SRDERR ###
### STDERR From Bash Script to STDOUT ###
#### Stdout to Screen ####
#### Stdout to File ####
#### Stderr to File ####
#### Stdout to Stderr ####
#### Stderr to Stdout ####
#### Stderr and Stdout to File ####
## Closing THoughts ##
### Related Linux Tutorials ###