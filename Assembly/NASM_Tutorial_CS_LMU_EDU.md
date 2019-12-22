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

		[750]						; displacement only
		[rbp]						; base register only
		[rcx + rsi * 4]			; base + index * scale
		[rbp + rdx]				; scale is 1
		[rbx - 8]					; displacement is -8
		[rax + rdi * 8 + 500]	; all four components
		[rbx + counter]			; uses the address of the variable 'counter' as the displacement

### Immediate Operands ###
1. From official docs:
2. Examples:

		200			; decimal
		0200		; still decimal - the leading 0 does not make it octal
		0200d		; explicitly decimal - d suffix
		0d200		; also decimal - 0d prefix
		0c8h		; hex - h suffix, but leading 0 is required because c8h looks like a var
		0xc8		; hex - the classic 0x prefix
		0hc8		; hex - for some reason NASM likes 0h
		310q		; octal - q suffix
		0q310		; octal - 0q prefix
		11001000b	; binary - b suffix
		0b110_1000; binary - 0b prefix, and by the way, underscores are allowed

## Instructions with Two Memory Operands Are Extremely Rare ##
1. Most instructions are of the following form:

		add reg, reg
		add reg, mem
		add reg, imm
		add mem, reg
		add mem, imm

## Defining Data and Reserving Space ##
1. [Chapter 3 or docs](https://cs.lmu.edu/~ray/notes/nasmtutorial/)
2. To place data in memory

		db		0x55					; just the byte 0x55
		db		0x55,0x56,0x57		; three bytes in succession
		db		'a',0x55				; character constants are OK
		db		'hello',13,10,'$'	; so are string constants
		db		0x1234					; 0x34 0x12
		dw		'a'						; 0x61 0x00 (it's just a number)
		dw		'ab'					; 0x61 0x62 (character constant)
		dw		'abc'					; 0x61 0x62 0x63 0x00 (string)
		dd		0x12345678			; 0x79 0x56 0x34 0x12
		dd		1.234567e20			; floating point constant
		dq		0x123456789abcdef0	; eitht byte constant
		dq		1.234567e20			; double-precision float
		dt		1.234567e20			; extended-precision float
		
3. To reserve space without initializing, following pseudo instrucitons can be used. They should be in `.bss` section

		buffer:		resb		64		; reserver 64 bytes
		wordvar:		resw		1		; reserver a word
		realarray:	resq		10		; reserver an array of ten reals

## Another Example ##
1. MacOS program:

		; ---------------------------------------------------
		; This is an OSX console program that writes a little triangle
		; output. Runs on macOS only.
		;
		; nasm -fmacho64 triangle.asm && gcc hola.o && ./a.out
		; ---------------------------------------------------
		
							global		start

			section		.data
				text		db			"*"
				newline	db			0x0a
			
			section		.text
			start:
							mov			r8,		0
			line:
							mov			r9,		0
			column:
							mov			rax,	0x02000004
							mov			rdi,	1
							mov			rsi,	text
							mov			rdx,	1
							syscall
						
						   inc			r9
						   cmp			r9,		r8
							jle			column
						
							mov			rax,	0x02000004
							mov			rdi,	1
							mov			rsi,	newline
							mov			rdx,	1
							syscall
						
							inc			r8
							cmp			r8,		10
							jl	line
						
							mov			rax,	0x02000001
							xor			rdi,	rdi
							syscall
		
	1. `cmp` - compares and sets flags
	2. `je` - if previous comparison was equal, jumps to given label

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
