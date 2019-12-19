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
5. Structure:

					Labels Instructions Operands
		Directives
			global start  mov			rax, 0x02000004
		Sections
			.data
			.bss
			.text

## Details ##
1. Must read [The NASM Manual](http://www.nasm.us/doc/)
2. [The Intel Processor Manuals](http://www.intel.com/content/www/us/en/processors/architectures-software-developer-manuals.html)

## Your First Few Instructions ##
1. Important instructions:

		mov x, y	x <- y
		and x, y  x <- x and y
		or  x, y  x <- x or y
		xor x, y  x <- x xor y
		add x, y  x <- x + y
		sub x, y  x <- x - y
		inc x     x <- x + 1
		dec x     x <- x - 1
		syscall   Invoke an OS routine
		db        [pseudo-instruction](http://www.nasm.us/xdoc/2.11.02/html/nasmdoc3.html#section-3.2) that declares bytes that will be in memory when program runs

## The Three Kinds of Operands ##
### Register Operands ###
1. Only integer registers and xmm registers are considered here
2. 16 integer registers and each 64 bits wide

		R0 (RAX)
		R1 (RCX)
		R2 (RDX)
		R3 (RBX)
		R4 (RSP)
		R5 (RSP)
		R6 (RSI)
		R7 (RDI)
		R8
		R9
		R10
		R11
		R12
		R13
		R14
		R15
		
	1. First 8 have alternate names
	2. Lower 32 bits of each register can be considered as a register

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
