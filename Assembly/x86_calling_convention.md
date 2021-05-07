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