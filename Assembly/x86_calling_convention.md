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
	6. Saving registers and restoring
		1. Callee must save and restore following registers if it wishes to use any of them (before returning control to caller)
			1. RBX
			2. RSP
			3. RBP
			4. R12-R15
		2. Caller must save all other registers (if it wishes to preserve those values)
	7. Leaf node functions (functions that do not call any other functions)
		1. 128-byte space is stored just beneath stack pointer for the function
			1. It is called red-zone
				1. The zone will not be clobbered (treat or deal with harshly) by any signal or interrupt handlers
				2. This zone is used by compiler to **save local variables**
					1. Compiler may omit some instructions at starting of function (adjustment of RSP, RBP) by utilizing the zone
				3. Other functions may clobber the zone (hence used only by leaf node functions)

						-mno-red-zone
						
					1. Flag to disable red-zone optimization
	8. Variadic function (function that accepts variable number of arguments)
		1. Number of floating point arguments passed to function (in vector registers) must be provided by caller in AL register
	9. No shadow space provided on function entry
	10. Return address is adjecent to 7th integer argument on stack
	11. Alignment:
		1. Stack aligned on 16 bytes boundary
	12. Kernel Interface
		1. Uses
			1. RDI
			2. RSI
			3. RDX
			4. R10
			5. R8
			6. R9
	13. C++
		1. `this` is first parameter
		