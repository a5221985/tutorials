# x86 Calling Convention #
## Description ##
1. It describes interface of called code:
	1. Order in which atomic (scalar) parameters, or individual parts of complex parameter are allocated
	2. How parameters are passed
		1. Pushed on stack
		2. Placed in registers
		3. Or mix of both
	3. Which registers, the called function must preserve for caller
		1. Callee-saved registers or non-volatile registers
	4. How task of preparing stack for & restoring after function call is divided between caller and callee

## System V AMD64 ABI ##
1. Followed on Solaris, Linux, FreeBSD, MacOS (de-facto standard among Unix and Unix-like OSs)
2. Convention:
	1. First 6 integer or pointer arguments are passed in registers
		1. RDI
		2. RSI
		3. RDX
		4. RCS
		5. R8
		6. R9
		7. R10 - used as static chain pointer in case of nested functions (?)
	2. Floating point arguments
		1. XMM0
		2. XMM1
		3. XMM2
		4. XMM3
		5. XMM4
		6. XMM5
		7. XMM6
		8. XMM7
	3. Additional arguments
		1. Passed on stack
	4. Return values
		1. Integer return values 
			1. Upto 64 bits: Stored in RAX
			2. Upto 128 bits: Stored in RAX and RDX
		2. Floating point return values
			1. Stored in XMM0
			2. Stored in XMM0 & XMM1
	5. Wider values
		1. YMM registers are used for passing and returning
		2. ZMM registers are used for passing and returning
		