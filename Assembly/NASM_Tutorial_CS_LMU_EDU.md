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
	3. `jne` - if previous comparison was not equal, jumps to a given label
		1. `jl` - jump if less than
		2. `jnl` - jump if not less than
		3. `jle` - jump if less than or equal to
		4. `jnle` - jump if not less than or equal to
		5. `jge` - jump if greater than
		6. `jnge` - jump if not greater than or equal to
		7. ...
	4. `equ` - not a real instruction. Defines an abbreviation for assembler itself to use
	5. `.bss` - writable data section

## Using a C Library ##
1. `main` - function in C
	1. C library has `_start` label inside
	2. Code in `_start` does some initialization and calls `main`
	3. Code then does some cleanup and issues system call for exit
	4. We need to implement main
2. Implementation of main in assembly

				global		main
				extern		puts
				
				section	.text
		main:										; This is called by the C library startup code
				mov			rdi,		message	; First integer (or pointer) argument in rdi
				call		puts					; puts(message)
				ret									; Return from main back into C library wrapper
				
		message:
				db			"Hola, mundo", 0		; Note: strings must be terminated with 0 in C
				
	1. `nasm -felf64 hola.asm && gcc hola.o && ./a.out`
	
3. MacOS:

					global		_main
					extern		_puts
				
					section	.text
		_main:		push		rbx
					lea			rdi,	[rel message]
					call		_puts
					pop			rbx
					ret
				
					section	.data
		message:	db			"Hola, mundo", 0

	1. C functions (or function that is expored from one module to another) must be prefixed with `_`
	2. Call stack must be aligned on a 16-byte boundary
	3. `rel` required to access named variables

## Understanding Calling Convention ##
1. why should argument go into `rdi`?
	1. convention used for calls
2. Calling conventions must be followed explained in [AMD64 ABI Reference](http://www.x86-64.org/documentation/abi.pdf)
	1. Also in [Wikipedia](http://en.wikipedia.org/wiki/X86_calling_conventions#x86-64_Calling_Conventions)
	2. Pass as many parameters as will fit in registers in the following order:
		1. for integers and pointers: `rdi`, `rsi`, `rdx`, `rcx`, `r8`, `r9`
		2. for floating point (float, double): `xmm0`, `xmm1`, `xmm2`, `xmm3`, `xmm4`, `xmm5`, `xmm6`, `xmm7`
		3. Additional parameters must be pushed to stack, right to left and must be removed by caller after call
		4. Call instruction is run after pushing to stack
			1. Return address is in `[rsp]`
			2. First memory param is at `[rsp+8]`
			3. ...
		5. Stack pointer `rsp` must be aligned to a 16-byte boundary before making a call
			1. Call pushes return address (8 bytes) on stack
				1. Hence `rsp` is not aligned when inside function
					1. Solution:
						1. Push something to make extra space
						2. Subtract 8 from `rsp`
		6. Registers that called function must preserver are (all others can be freely changed):
			1. `rbp`
			2. `rbx`
			3. `r12`
			4. `r13`
			5. `r14`
			6. `r15`
		7. Callee must save control bits of `XMCSR` and x87 control word
			1. x87 instructions are rare in 64-bit code (don't have to worry)
		8. Integers are returned in `rax` or `rdx:rax`
		9. Floating point values are returned in `xmm0` or `xmm1:xmm0`
3. Example:

		; -------------------------------------------------------------
		; A 64-bit Linux application that writes the first 90 Fibonacci numbers. To
		; assemble and run:
		;
		;		nasm -felf64 fib.asm && gcc fib.o && ./a.out
		; -------------------------------------------------------------
		
						global		main
						extern		printf
					
						section	.text
			main:	
						push		rbx
						
						mov			ecx,		90
						xor			rax,		rax
						xor			rbx,		rbx
						inc			rbx
			print:
						; We need to call printf, but we are using rax, rbx, and rcx, printf
						; may destroy rax and rcx so we will save these before the call and
						; restore them afterwards
						
						push		rax				; caller-save register
						push		rcx				; caller-save register
						
						mov			rdi,		format	; set 1st parameter (format)
						mov			rsi,		rax	; set 2nd parameter (current_number)
						xor			rax,		rax	; because printf is vararg
						
						; Stack is already aligned because we pushed three 8 byte registers
						call		printf			; printf(format, current_number)
						
						pop			rcx				; restore caller-save register
						pop			rax				; restore caller-save register
						
						mov			rdx,		rax	; save the current number
						mov			rax,		rbx	; next number is now current
						add			rbx,		rdx	; get the new next number
						dec			ecx				; count down
						jnz			print			; if not done counting, do some more
						
						pop			rbx				; restore rbx before returning
						ret
						
			format:
						db			"%20ld", 10, 0 
						
	1. `nasm -felf64 fib.asm && gcc fib.o && ./a.out`
	2. `push x` - Decrement `rsp` by size of operand, then store `x` in `[rsp]`
	3. `pop x` - Move `[rsp]` into `x`, then increment `rsp` by size of operand
	4. `jnz label` - if the processors's Z (zero) flag, is set, jump to the given label `label`
	5. `call label` - Pushes the address of the next instruction, then jump to the label
	6. `ret` - Pop into the instruction pointer

## Mixing C and Assembly Language ##
1. Function that takes 3 integer params and returns max value

		; ----------------------------------------------------------
		; A 64-bit function that returns the maximum value of its three arguments. The function has signature:
		;
		;	int64_t maxofthree(int64_t x, int64_t y, int64_t z)
		;
		; Note that the parameters have already been passed in rdi, rsi, and rdx. We
		; just have to return the value in rax.
		; ----------------------------------------------------------
		
					global		maxofthree
					section	.text
			maxofthree:
					mov			rax,		rdi		; result (rax) initially holds x
					cmp			rax,		rsi		; is x less than y?
					cmovl		rax,		rsi		; if so, set result to y
					cmp			is max(x, y) less than z?
					cmovl		rax,		rdx		; if so, set result to z
					ret
					
2. C program that calls the assembly language function


		/*
		 * A small program that illustrates how to call the maxofthree
		 * assembly language.
		 */
		 
		#include <stduio.h>
		#include <inttypes.h>
		
		int64_t maxofthree(int64_t, int64_t, int64_t);
		
		int main() {
				printf("%ld\n", maxofthree(1, -4, -7));
				printf("%ld\n", maxofthree(2, -6, 1));
				printf("%ld\n", maxofthree(2, 3, 1));
				printf("%ld\n", maxofthree(-2, 4, 3));
				printf("%ld\n", maxofthree(2, -6, 5));
				printf("%ld\n", maxofthree(2, 4, 6));
				return 0;
		}
	
	1. `nasm -felf64 maxofthree.asm && gcc callmaxofthree.c maxofthree.o && ./a.out`

## Conditional Instructions ##
1. After a) arithmetic instruction and b) `cmp` instruction, processor sets or clears bits in `rflags`
2. Examples:

		s (sign)
		z (zero)
		c (carry)
		o (overflow)
		
	1. The flag values can be used to perform jumps, move or set.
	2. Example:

			jz label		; Jump to label if the result of the operation was zero
			cmovno x, y	; x <- y if the last operation did not overflow
			setc x			; x <- 1 if last operation had a carry, but x <- 0 otherwise (x must be a byte-size register or memory location)

3. Conditional instructions have three base forms: 
	1. `j` for conditional jump
	2. `cmov` for conditional move
4. Suffix has one of 30 forms:
	1. `s`
	2. `ns`
	3. `z`
	4. `nz`
	5. `c`
	6. `nc`
	7. `o`
	8. `no`
	9. `p`
	10. `np`
	11. `pe`
	12. `po`
	13. `e`
	14. `ne`
	15. `l`
	16. `nl`
	17. `le`
	18. `nle`
	19. `g`
	20. `ng`
	21. `ge`
	22. `nge`
	23. `a`
	24. `na`
	25. `ae`
	26. `nae`
	27. `b`
	28. `nb`
	29. `be`
	30. `nbe`

## Command Line Arguments ##
1. `int main(int argc, char** argv)` - c main function
	1. `argc` - ends up in `rdi`
	2. `argv` - pointer will end up in `rsi`
2. Example: Echo commandline arguments

		; ------------------------------------------------------------
		; A 64-bit program that displays its command line arguments, one per line.
		;
		; On entry, rdi will contain argc and rsi will contain argv
		; ------------------------------------------------------------
		
					global		main
					extern		puts
					section	.text
				
			main:
					push		rdi				; save registers that puts uses
					push		rsi
					sub			rsp,	8		; must align stack before call
					
					mov			rdi,	[rsi]	; the argument string to display
					call		puts			; print it
					
					add			rsp,	8		; restore %rsp to pre-aligned value
					pop			rsi				; restore registers puts used
					pop			rdi	
					
					add			rsi,	8		; point to next argument
					dec			rdi				; count down
					jnz			main			; if not done counting keep going
					
					ret
					
	1. `nasm -felf64 echo.asm && gcc echo.o && ./a.out dog 22 -zzz "hi there"`

## A Longer Example ##
1. Program to compute x^y

## Floating Point Instructions ##
1. Floating point arguments go into `xmm` registers
2. Function for summing values in double array

		; -----------------------------------------------------------
		; A 64-bit function that returns the sum of the elements in a floating-point
		; array. The function has prototype:
		;
		;	double sum(double[] array, uint64_t length)
		; -----------------------------------------------------------
		
						global		sum
						section	.text
			sum:
						xorpd		xmm0,	xmm0		; initialize the sum to 0
						cmp			rsi,	0			; special case for length = 0
						je			done
			next:
						addsd		xmm0, [rdi]		; add in the current array element
						add			rdi, 8				; move to next array element
						dec			rsi					; count down
						jnz			next				; if not done counting, continue
			done:
						ret								; return value already in xmm0
						
	1. C Program:

			/*
			 * Illustrates how to call the sum function we wrote in assembly language
			 */
			 
			#include <stdio.h>
			#include <inttypes.h>
			
			double sum(double[], uint64_t);
			
			int main() {
				double test[] = {
					40.5, 26.7, 21.9, 1.5, -40.5, -23.4
				};
				printf("%20.7f\n", sum(test, 6));
				printf("%20.7f\n", sum(test, 2));
				printf("%20.7f\n", sum(test, 0));
				printf("%20.7f\n", sum(test, 3));
				return 0;
			}
			
		1. Compilation and execution

				nasm -felf64 sum.asm && gcc sum.o callsum.c && ./a.out

## Data Sections ##
1. Text section is read only on most OSs, hence we might need data section
2. `.data` is usually only for initialization in most OSs
3. `.bss` is for un-initialized data
4. Example: Program to average command line arguments (expected to be integers) - displays result as a floating point number

		; -------------------------------------------------------------
		; 64-bit program that treats all its command line arguments as integers and
		; displays their average as a floating point number. This program uses a data
		; section to store intermediate results, not that it has to, but only to
		; illustrate how data sections are used.
		; -------------------------------------------------------------
		
						global		main
						extern		atoi
						extern		printf
						default	rel
						
						section	.text
			main:
						dec			rdi					; argc-1, since we don't count program name
						jz			nothingToAverage		
						mov			[count],	rdi		; save number of real arguments
			accumulate:
						push		rdi					; save register across call to atoi
						push		rsi
						mov			rdi,	[rsi + rdi * 8]		; argv[rdi]
						call		atoi				; now rax has the int value of arg
						pop			rsi					; restore registers after atoi call
						pop			rdi					; count down
						add			[sum],	rax			; accumulate sum as we go
						dec			rdi					; count down
						jnz			accumulate		; more arguments?
			average:
						cvtsi2sd	xmm0,	[sum]
						cvtsi2sd	xmm1,	[count]
						divsd		xmm0,	xmm1		; xmm0 is sum/count
						mov			rdi,	format		; 1st arg to printf
						mov			rax,	1			; printf is varargs, there is 1 non-int argument
						sum			rsp,	8			; align stack pointer
						call		printf				; printf(format, sum/count)
						add			rsp,	8			; restore stack pointer
						ret
						
			nothingToAverage:
						mov			rdi,	error
						xor			rax,	rax
						call		printf
						ret
						
						section	.data
			count:		dq			0
			sum			dq			0
			format:	db			"%g", 10, 0
			error:		db			"There are no command line argument to average", 10, 0
			
	1. Compilation and execution:

			nasm -felf64 average.asm && gcc average.o && ./a.out 19 8 21 -33
			nasm -felf64 average.asm && gcc average.o && ./a.out
			
	2. Processor instructions that convert between integer and floating point value:

			cvtsi2sd	xmmreg, r/m32		; xmmreg[63..0] <-- intToDouble(r/m32)
			cvtsi2ss	xmmreg, r/m32		; xmmreg[31..0] <-- intToFloat(r/m32)
			cvtsd2si	reg32, xmmr/m64	; reg32 <-- doubleToInt(xmmr/m64)
			cvtsd2ss	reg32, xmmr/m32	; reg32 <-- floatToInt(xmmr/m32)

## Recursion ##
1. While implementing recursive functions, we need to save registers carefully (because the same registers are overwritten when the function is called again and again)
	1. Strategy: push registers which need to be preserved before and after call to recursive function

			; -------------------------------------------------------
			; An implementation of the recursive function:
			;
			;		uint64_t factorial(uint64_t n) {
			;			return	(n <= 1)? 1: n * factorial(n - 1);
			;		}
			; -------------------------------------------------------
			
						global		factorial
						section	.text
			factorial:
						cmp			rdi,		0
						jne			calculate
						mov			rax,		1
						ret
			calculate:
						push		rdi
						dec			rdi
						call		factorial
						pop			rdi
						mul			rdi
						ret
						
		1. C - function

				#include <stdio.h>
				#include <inttypes.h>
				
				int64_t factorial(int64_t);
				
				int main() {
					for (int64_t i = 0; i < 20; i++)
						printf("%ld! = %ld\n", i, factorial(i));
					return 0;
				}

## SIMD Parallelism ##
1. XMM registers can do arithmetic on floating point values - 
	1. one operation at a time (scalar) or 
	2. multiple operations at a time (packed)
2. Operations have the form

		op	xmmreg_or_memory, xmmreg
		
	1. For floating point addition:
		1. `addpd` - do 2 double-precision additions in parallel (add packed double)
		2. `addsd` - do just one double-precision addition, using low 64-bits of register
		3. `addps` - do 4 single-precision additions in parallel (add packed single)
		4. `addss` - do just one single-precision addition, using the low 32-bits of the register (add scalar single)

3. Adding 4 floats at once:

		; void add_four_floats(float x[4], float y[4])
		; x[i] += y[i] for i in range (0..4)
		
					global		add_four_floats
					section	.text
		add_four_floats:
					movdqa		xmm0,	[rdi]			; all four values of x
					movdqa		xmm1,	[rsi]			; all four values of y
					addps		xmm0,	xmm1			; do all four sums in one shot
					movdqa		[rdi],	xmm0
					ret
					
	
		#include <stdio.h>
		void add_four_floats(float[], float[]);
		
		int main() {
			float x[] = {-29.750, 244.333, 887.29, 48.1E22};
			float y[] = {29.750, 199.333, -8.29, 22.1E23};
			add_four_floats(x, y);
			printf("%f\n%f\n%f\n%f\n", x[0], x[1], x[2], x[3]);
			return 0;
		}

## Saturated Arithmetic ##
1. 

## Graphics ##
## Local Variables and Stack Frames ##
## Using NASM on macOS ##
## Using NASM on Windows ##
