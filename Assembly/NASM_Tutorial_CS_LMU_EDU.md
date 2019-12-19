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

			R0D (EAX) (double word)
			R1D (ECX)
			R2D (EDX)
			R3D (EBX)
			R4D (ESP)
			R5D (EBP)
			R6D (ESI)
			R7D (EDI)
			R8D
			R9D
			R10D
			R11D
			R12D
			R13D
			R14D
			R15D
			
	3. Lower 16 bits of each register can be considered as a register

			R0W (AX)
			R1W (CX)
			R2W (DX)
			R3W (BX)
			R4W (SP)
			R5W (BP)
			R6W (SI)
			R7W (DI)
			R8W
			R9W
			R10W
			R11W
			R12W
			R13W
			R14W
			R15W
			
	4. Lowest 8 bits of each register can be considered as a register

			R0B (AL)
			R1B (CL)
			R2B (DL)
			R3B (BL)
			R4B (SPL)
			R5B (BPL)
			R6B (SIL)
			R7B (DIL)
			R8B
			R9B
			R10B
			R11B
			R12B
			R13B
			R14B
			R15B
			
	5. Bits 15 through 8 of `R0` ... `R3` are named (historical reasons):

			AH
			CH
			DH
			BH
			
	6. There are 16 XMM registers (each 128 bits wide)

			XMM0
			XMM1
			XMM2
			XMM3
			XMM4
			XMM5
			XMM6
			XMM7
			XMM8
			XMM9
			XMM10
			XMM11
			XMM12
			XMM13
			XMM14
			XMM15

### Memory Operands ###
1. Forms of addressing:

		[ number ]
		[ reg ]
		[ reg + reg * scale ] - scale can be 1, 2, 4, or 8 only
		[ reg + number ]
		[ reg + reg * scale + number ]
	
	1. `number` is displacement
	2. `reg` is base
	3. `scale` is index
2. Examples:

		[750]				; displacement only
		[rbp]				; base register only
		[rcx + rsi * 4]	; base + index * scale

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
