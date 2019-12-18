# NASM Tutorial #
## Scope of the Tutorial ##
1. Standalone programs
2. Programs that integrate with C

## Your First Program ##
1. Linux:

					global		_start
		
					section	.text
		_start:	mov			rax, 1
					mov			rdi, 1
					mov			rsi, message
					mov			rdx, 13
					syscall
					mov			rax, 60
					xor			rdi, rdi
					syscall
					
					section	.data
		message:	db			"Hello, World", 10
		
2. MacOS:

					global		start
		
					section	.text
		start:		mov			rax, 0x02000004
					mov			rdi, 1
					mov			rsi, message
					mov			rdx, 13
					syscall
					mov			rax, 0x02000001
					xor			rdi, rdi
					syscall
			
					section	.data
		message:	db			"Hello, World", 10
		
	1. `nasm -fmacho64 hello.asm && ld hello.o && ./a.out`

## Structure of a NASM Program ##
1. NASM is line-based
2. Most programs consist of directives followed by one or more sections
3. Lines can have optional label
4. Most lines have instructions followed by zero or more operands

## Details ##
## Your First Few Instructions ##
## The Three Kinds of Operands ##
### Register Operands ###
### Memory Operands ###
### Immediate Operands ###
## Instructions with Two Memory Operands Are Extremely Rare ##
## Defining Data and Reserving Space ##
## Another Example ##
## Using a C Library ##
## Understanding Calling Convention ##
## Mixing C and Assembly Language ##
## Conditional Instructions ##
## Command Line Arguments ##
## A Longer Example ##
## Floating Point Instructions ##
## Data Sections ##
## Recursion ##
## SIMD Parallelism ##
## Saturated Arithmetic ##
## Graphics ##
## Local Variables and Stack Frames ##
## Using NASM on macOS ##
## Using NASM on Windows ##
