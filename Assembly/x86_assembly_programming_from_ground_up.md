# x86 Assembly Programming from Ground Up #
## Introduction ##
### Introduction ###
1. x86 processor history
2. Architecture
3. Practical assembly programming

#### Coverage ####
1. The complete x86 Instruction Set, the MMX Instruction Set and the SSE Instruction Set and the AVX Instruction Set
2. Develop complex image processing algorithm in x86 Assembly
3. Develop complex mathematical algorithm in x86 Assembly
4. Write robust programs that mix C++ and x86 Assembly code

#### Applications ####
1. Navigating arrays
2. Computing the statistical properties of an array
3. Mean and standard deviation
4. ...

#### For whon ####
1. Experienced: upto speed with x86 architecture and assembly programming
2. Moving from other architectures

## Getting Started ##
### Setting Up the Development Environment ###
1. MASM assembler
2. Microsoft VS
	1. Select Desktop development with C++
3. Launch
4. Sign in
5. Evaluation:
	1. Use hotmail or outlook for free license
6. New project
	1. Test
	2. Windows console application
	3. Build
		1. Build Solution
	4. Run
		1. Debug: Start debug

### Coding: Simple Assembly Program ###
1. Project storage
	1. Users/<name>/source/repos/Test/Test
2. Open Visual Studio
	1. File > New > Project
	2. Windows console application
	3. Name: SimpleAddition
3. Delete *.cpp files
	1. Delete
4. Source Files
	1. Right click add > new item
	2. Main.asm
5. Right click on project
	1. Build dependencies
	2. Build customizations
	3. Check masm(targets, prop)
		1. Used professionally
6. Right click on Main.asm
	1. Properties
	2. Item type: Microsoft Macro Assembler
	3. Apply
	4. Ok
7. Code:

		.386 # directive - expected minimum processor - first architecture
		.model flat # flat memory segmentation model
		.code # this is code area
		start PROC
				mov eax, 213
				add eax, 432 # adds 432 to current value of eax and store in ret
		start endp
		end	  start # start - name of procedure 

	1. Select x86
8. Right click on project > Properties
9. Linker > Advanced
10. Entry Point: start
11. Build > Build Solution
12. Put a break point on ret
	1. To observe registers
13. Start debugging
14. Debug > Windows > Registers
15. Debug > Windows > Memory > Memory 1
	1. Registers
16. Debug > Windows > Disassembly
	1. Everything becomes 1 and 0
		1. But view shows hex format
	2. Check register eax
		1. Hex to decimal: Double click > Copy
			1. Online converter
				1. rapid tables hex to dec
					1. Paste
					2. Convert

### Installing a Syntax Highlighter ###
1. Search "masm assembler syntax highlighting visual studio"
	1. AsmHighlighter
	2. Download
	3. Double click to install
		1. Select Visual Studio if required
2. Open visual studio

### Coding: Mixing C/C++ and Assembly ###
1. New Project > Windows Console Application
	1. ArrayReverser
2. New file:
	1. Add > New Item > C++
	2. Reverser.asm
3. Right click build dependencies > Build customization > Masm
4. Right click on file > Properties > Item Type > Microsoft Macro Assembler
5. Build > Build Solution (error)
6. ArrayReverser.cpp
	1. Function with following parameters
		1. destination array pointer
		2. source array pointer
		3. number of elements
	2. Code:

			extern "C" void Reverser(int* y, const int* x, int n);
			...

				Reverser(dest_array, src_array, 10);
	
	3. Reverse.asm
		1. Context saving: prologue (push), epilogue (pop)
		
				.386
				.model flat,c
				.code
				
				Reverser proc
					push ebp
					mov ebp, esp
					push esi
					push edi
					
					xor eax, eax
					mov edi, [ebp + 8] # ebp is base pointer, pointing destination index to address
					mov esi, [ebp + 12] # pointing source index
					mov ecx, [ebp + 16] # pointing number of elements in array
					test ecx, ecx
				
					lea esi, [esi + ecx * 4 - 4]
					pushfd # save current direction flag
					std # sets flag to 1

				@@: loadsd
					mov [edi], eax
					add edi, 4
					dec ecx
					jnz @@

					popfd
					mov eax, 1

					pop edi
					pop esi
					pop ebp

					ret
				
				Reverser endp
				end Reverser

			1. Select x64

7. C++

		const int n = 10;
		int x[n], y[n];
		
		for (int i = 0; i < n; i++)
		{
			x[i] = i;
		}

		Reverser(y, x, n);

		printf("\n------------Array Reverser------------");
		for (int i = 0; i < n; i++)
		{
			printf("i:	%5d	y:	%5d	x:	%5d\n", i, y[i], x[i]);
		}
		
		return 0;

	1. Build solution
	2. Start without debugging
3. Uses:
	1. Digital signal processing
	2. Image processing
	3. Bit manipulations

## x86 Processors & Computer Architectures ##
### Evolution of Intel Processors ###
1. x386: Intel 80386
	1. 1985
	2. Extension of 16 bit predicessors (this is 32 bit)

### Harvard Architecture vs Von Neumann Architecture ###

## The Computing Device ##
### Logic Gates ###
### From Transistors to Operating Systems ###
### Number Systems ###

## The Programmer's Model ##
### Overview of x86 Data Types ###
### Basic x86 Microcomputer Design ###
### x86 Operating Modes ###
### Overview of the x86 Registers ###
### Coding: One Register to Rule Them All ###
### Overview of the x86 Flags ###
### Overview of the Floating Point Unit ###
### Overview of x86 Memory Modes ###

## Introduction to x86 Assembly Language ##
### Overview of x86 Integers ###
### Introduction to Directives and Instructions ###
### Simple x86 Assembly Template ###
### Coding: Declaring Variables in Assembly ###
### Dealing with Data ###
### Endianness ###

## Data Transfer Instructions ##
### Operand Types ###
### Overview of the MOV Instruction ###
### Understanding Direct - Offset Operands ###
### Memory Addressing Modes ###

## Arithmetic Instructions ##
### The Increment and Decrement Instructions ###
### The Addition and Subtraction Instructions ###
### Data Operators and Directives ###
### Coding: Summing Array Elements ###
### Coding: Scanning an Array ###
### Coding: Using Pointers and Typedef ###

## Conditional Branching ##
### The Jump and Loop Instructions ###
### Logic Instructions ###
### Condition Jump Instructions ###
### Instruction Operands ###

## The Nature of Mixing C/C++ and Assembly ##
### Coding: Computing the Sum of an Array ###
### Coding: Computing Signed Multiplication and Division ###
### Coding: Understanding C/C++ Calling Conventions ###
### Coding: Declaring Global Variables in C/C++ and using them in Assembly ###
### Coding: Experimenting with Conditional Codes ###

## Working with Arrays ##
### Coding: Iterating through Array Elements ###
### Coding: Array Elements Square ###
### Coding: Working with 2-Dimensional Arrays ###
### Coding: Computing the Sum of Rows and Columns of a 2-Dimensional Array ###

## Working with Strings ##
### Coding: Copying Strings from on Variable to Another ###
### Coding: Creation of a Character Search Algorithm ###

## Programming with the Floating-Point Unit (FPU) Registers ##
### Overview of the x86 FPU ###
### Coding: Writing a temperature conversion program using the FPU ###
### Coding: Developing the Sphere Computation Algorithm ###
### Coding: Processing Floating-Point Arrays with FPU Instructions ###
### Coding: Computing Min and Max of Single-Precision Floating Point Arrays ###
### Coding: Developing Algorithms with x86 FPU Transcendental Instructions ### Coding: Developing the Least Squares Algorithm ###

## Programming with the x86 MMX Extensions ##
### Coding: SIMD Arithmetic with Packed Data using MMX Registers (Part I) ###
### Coding: SIMD Arithmetic with Packed Data using MMX Registers (Part II) ###
### Coding: Shift Operations with Packed Data using MMX Registers ###
### Coding: Understanding MMX Multiplication ###

## Programming with the x86 SSE Extensions ##
### History of SSE ###
### The SSE Execution Environment ###
### Coding: Understanding SSE Floating-Point Arithmetic ###
### Coding: Developing the Sphere Algorithm using SSE Instructions ###
### Coding: SSE Packed Integer Arithmetic ###

## Programming with the x86 Advanced Vector (AVX) Extensions ##
### History of AVX ###
### The AVX Execution Environment ###
### Coding: Understanding AVX Floating Point Arithmetic ###
### Coding: Understanding AVX Packed Integer Arithmetic ###

## Closing ##
### Closing Remarks ###
