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
	2. Extension of 16 bit predecessors (this is 32 bit)
		1. 32 bit wide registers and data types
		2. flat memory model
		3. 4 GB logical address space
		4. Paged virtual memory
2. x486: Intel 80486
	1. Improved the performance of x386
		1. Included on-chip memory caches
		2. Optimized instructions
	2. Included integrated x87 floating point unit
3. Pentium processor:
	1. 1993
	2. Pentium P5 micro architecture
	3. Performance improvement includes
		1. Dual instruction execution pipelines
		2. 64 bit external data bus
		3. Separate On-chip code and data caches
4. Micro-architecture:
	1. Defines organization of a computer's internal components including register files, execution units, instruction pipelines, data buses, memory caches 
	2. Often used by multiple processor product lines
	3. Later versions of P5 incorporated a new computational resource called MMX technology
		1. Supports single instruction multiple data operations
			1. SIMD operations
			2. For packed integers using 64 bit wide registers
5. Intel P6 architecture:
	1. Pentium Pro - 1995
	2. Pentium II - 1997
	3. Architecture:
		1. Extended 32 bit platform using 3 way superscalar design
			1. Processor is able to decode, dispatch and execute three distinct instructions during each clock cycle
		2. Out of order instruction executions
		3. Improved branch prediction
		4. Speculative instruction execution
	4. Pentium III - 1999
		1. Included new SIMD technology called streaming SIMD extension (SSE)
			1. Added 8 128 bit registers to x86 32 bit platform
			2. Instructions that support packed single precision (32 bit) floating point arithmetic
6. Intel Netburst micro architecture 
	1. 2000
	2. Included SSE2 - extended floating point capability of SSE to cover packed double precision (64 bit) values
	3. Incorporated additional instructions that enabled 128 bit SSE registers to be used for packed integer calculations and scalar floating point operations
	4. Several variations of pentium 4 are included in this architecture
	5. 2004 - Upgraded to include SSE3 and hiperthreading technology
		1. SSE3 - included packed integer and packed floating point instructions to x86 32 bit platform
		2. Hiperthreading: Makes parallel the processor's front end pipeline in order to improve performance
7. Intel Core micro architecture
	1. 2006
	2. x86 architecture was extended from 32 bit to 64 bit (After AMD had invented the first 64 bit micro processor)
	3. Included redesign of many netburst front end pipelines and execution unit to improve performance and reduce power consumption
	4. Incorporated x86 SSE enhancement (SSE3, SSE4.1)
		1. Added new packed integer and new packed floating point instructions to the platform
		2. No new registers or data types included
	5. Processors included are
		1. Core 2 Duo
		2. Core 2 Quad
8. Intel Nehalem micro architecture
	1. 2008
	2. Re-introduced hiperthreading to x86 architecture (it was excluded from core micro architecture)
	3. Incorporates SSE4.2
		1. Added many application specific accelerator instructions to x86 SSE instruction set
		2. Included 4 new instructions that facilitate text string processing using 128 bit wide x86 registers
	4. Processors:
		1. Core i3
		2. Core i5
		3. Core i7
9. Intel Sandy Bridge micro architecture
	1. 2011
	2. Introduced a new x86 SIMD technology - Advanced Vector eXtensions (AVX)
		1. Adds packed floating point operations for both single precision and double precision using 256 bit wide registers
		2. Supports new 3 operand instruction syntax
			1. Reduces number of register to register data transfers that must be performed
	3. Processors included
		1. 2nd and 3rd generation core i3, core i5 and core i7 cpus
10. Intel Haswell micro architecture
	1. 2013
	2. Includes AVX2 - extends AVX
		1. Supports packed integer operations using 256 bit wide registers
		2. Enhanced data transfer capabilities
			1. Broadcast instruction
			2. Cover instruction
			3. Permute instruction
		3. Fused Multiply Add operations (FMA)
			1. softwares can perform successive product sum calculations using single floating point rounding operation
		4. Several new general purpose register instructions
	3. Processors included are
		1. 4th generation core i3, core i5 and core i7 cpus
11. Summary
	1. core 2 - 1060-3333
	2. core i7 - 1060-4400

### Harvard Architecture vs Von Neumann Architecture ###
1. Von Neumann architecture
	1. Universal computer
		1. Has memory
		2. Arithmetic logic unit
		3. Control unit
		4. Output devices
		5. All parts are connected together by a bus
		6. Computer structure is independent of the computed problem
		7. Computer is programmed with the content of the memory
	2. Diagram
		1. ALU <- data - -> Control Unit
		2. Control Unit <-control-- Memory
		3. Memory <- - -> Control Unit
		4. Input/Output <---> Input/Output
		5. Memory <---> ALU
	3. Modern architecture
		1. CPU <-----> Memory
		2. Memory <-----> Input/Output
		3. CPU <-----> Input/Output
4. Harward architecture
	1. 1947
	2. Slightly different
	3. Separated memory for data and memory for instructions
		1. Two buses connected to CPU
			1. One for data
			2. One for instructions
			3. CPU <-----> Data Memory
			4. CPU <-----> Input/Output
			5. Data Memory <-----> Input/Output
			6. Instruction Memory <-----> CPU
			7. CPU <-----> Instruction Memory
	4. Simplified Von Neuman structure as follows
		1. CPU <-- Data & Instruction bus --> Memory
		2. Advantages:
			1. Single bus is simpler (control unit) design 
			2. Single bus is cheaper (development of control unit is cheaper)
			3. Common memory for data and instructions
		3. Disadvantages:
			1. Allows 2 simultaneous memory fetches
	5. Simplified Harvard architecture
		1. CPU <-- Data bus --> Memory
		2. CPU <-- Instruction Bus --> Memory
		3. Disadvantages:
			1. Multi-bus is relatively complex
			2. Multi-bus is relatively expensive
		4. Advantages
			1. Separate memory for data and instructions
				1. Allows 2 simultaneous memory fetches

## The Computing Device ##
### Logic Gates ###
1. Boolean algebra
	1. Only two values
		1. 0 and 1
		2. Truth table list all possible combinations in the problem
			1. Each combination is in a row
2. AND Gate
	1. x, y -> x.y
		1. 0, 0 -> 0
		2. 0, 1 -> 0
		3. 1, 0 -> 0
		4. 1, 1 -> 1
3. OR Gate
	1. x, y -> x + y
		1. 0, 0 -> 0
		2. 0, 1 -> 1
		3. 1, 0 -> 1
		4. 1, 1 -> 1
	2. IC - 4 OR gates
		1. If both switches are on, then led output will be on
4. NOT Gate
	1. Inverter
	2. x -> x'
		1. 0 -> 1
		2. 1 -> 0
5. XOR Gate
	1. x, y -> x (+) y
		1. 0, 0 -> 0
		2. 0, 1 -> 1
		3. 1, 0 -> 1
		4. 1, 1 -> 0
6. The logic gates can be put together to build different hardware functionality
	1. (x.y') + (x'.y) + (x.y)
	2. This is how microprocessor micro architecture is formed

### From Transistors to Operating Systems ###
1. How software and hardware are related is called virtual machine concept
2. Most basic function:
	1. Execute programs
		1. Written in native machine language
		2. Can be executed relatively small number of electronic circuit
			1. Let us call language L0
				1. Programmers find it extremely difficult to write in L0
					1. Enormously detailed
					2. Consists of 1s and 0s
			2. If a language L1 can be introducted which is easier to write
				1. Programs can be written in L1
				2. Much more readable
				3. Two methods
					1. Interpretation
						1. Each instruction of L1 program must be decoded before it can run on L0
					2. Translation
						1. The entire L1 program must be converted into an L0 program by an L0 program specifically designed for the purpose
						2. Result L0 program can be executed directly on the computer hardware
3. Virtual machines
	1. Software program which emulates the functions of some other physical or virtual computer
		1. Virtual Machine VM1 can execute commands in language L1
		2. Virtual Machine VM0 can execute commands in language L0
	2. Each VM can be constructed using hardware or software
		1. People can write programs for VM1 and if it is practical to implement VM1 using hardware, then programs can be executed directly on the hardware
		2. OR
		3. Programs written in L1 can be translated or interpreted to L0 to executed in VM0
	2. VM1 cannot be radically different from VM0 because translation might be too time consuming
	3. If VM1 is still not programmer friendly, then another VM (VM2) can be designed that is more easily understood and programmer friendly
		1. This can be continued up to VMn (powerful and programmer friendly)
	4. Java is based on Virtual Machine technology
		1. Java program is translated into Byte Code by Java compiler
		2. Java Byte Code is low level language quickly executed at runtime by Java Virtual Machine program (relatively system independent)
		3. JVM is interpreted on many computer systems
4. Computer stack
	1. Applications/OS (Windows, Android, mbedSO)
		1. Written using high level languages
	2. Programming Language (C, C++, Java)
	3. Instruction Set Architecture (ISA) (MOV R0, R1, LDR, BEQ) - set of instruction supported by the processor
		1. Constructed based on the micro architecture
		2. Micro architecture deals with how ISA is implemented
		3. ISA: Assembly language (in loose terms)
			1. x86 language must be written for x86 based micro architecture
			2. Arm assembly language must be written based on arm based micro architecture 
	4. Microarchitecture (logic gates put together)
	5. Gates - Made up of transistors
	6. Transistors

### Number Systems ###
1. Computers operate internally with transistors acting as switches
2. This is the combinational logic used to build the adders, multipliers, dividers etc...
3. A switch understands only two states: on or off
4. Binary system offers itself suitable for computer system
	1. Base 2 system
		1. Each digit represents a power of two
		2. Two digits
			1. 0, 1
			2. 10, 11
			3. 100, 101
	2. Table
		1. 0 - 0000
		2. 1 - 0001
		3. 2 - 0010
		4. 3 - 0011
		5. 4 - 0100
		6. 5 - 0101
		7. 6 - 0110
		8. 7 - 0111
		9. 8 - 1000
		10. 9 - 1001
		11. 10 - 1010
		12. 11 - 1011
		13. 12 - 1100
		14. 13 - 1101
		15. 14 - 1110
		16. 15 - 1111
5. Binary System
	1. Subscript indicating base
		1. 110101(2)
			1. 1 * 2^5 + 1 * 2^4 + 1 * 2^2 + 1 * 2^0
			2. 53(10)
	2. Octal system was used
	3. Base 16
		1. 0, 1, 2, 3, ... A, B, C, D, E, F
	4. 0xA5E9
		1. 10 * 16^3 + 5 * 16^2 + 14 * 16^1 + 9 * 16^0 = 42473(10)
	5. Base 16 is used to massively shorten the length of addresses of instructions
		1. 4 binary digits represent one hex digit
			1. 1111 - F
	6. 0x: hex number prefix

## The Programmer's Model ##
### Overview of x86 Data Types ###
1. byte: 8 bits
	1. 0 to 255 (2^8 - 1)
2. word: 16 bits
	1. 0 to 65,535 (2^16 - 1) 
3. doubeword: 32 bits
	1. 0 to 4,294,967,295 (2^32 - 1)
4. quadword: 64 bits (8 bytes)
	1. 0 to 18,446,744,073,709,551,615 (2^64 - 1)

### Basic x86 Microcomputer Design ###
1. Simplified design of an x86 microcomputer
	1. CPU
		1. ALU
		2. CU
		3. Clock
	2. Memory Storage Unit
	3. I/O Device #1
	4. I/O Device #2

		+--- Data and I/O Bus ---+-----------+-----------+-----
		|						 | 			 |			 |
		CPU						Memory		I/O Device	I/O Device
			Registers			Storage		#1	|		#2	|
			ALU					Unit		 |	|		 |	|
			CU					 |	|		 |	|		 |	|
			Clock				 |	|		 |	|		 |	|
		+---------------Control Bus-|--------+--|--------+	|
		+---------Address Bus-------+-----------+-----------+

	1. Clock: synchronizes the internal operations of the CPU
	2. Control Unit (CU): Coordinates the sequence of steps involved in execution of machine instructions
	3. ALU (Arithmetic Logic Unit): Performs arithmetic operations (addition, subtractions, logical operations)
	4. CPU pins connect to data bus, control bus and address bus
	5. Memory storage unit: Holds instructions and data while a computer program is running
		1. Receives request from the CPU
		2. Transfers data from RAM to CPU
		3. Transfers data from CPU to memory
	6. Processing of data takes place in the CPU
	7. Programs existing in memory must be copied to the CPU before they execute
		1. One at a time
		2. Groups of instructions
	8. Bus: A group of parallel wires that transfer data from one part of the computer to another
		1. 4 bus types
			1. Data bus
				1. Transfers instructions and data between CPU and memory
			2. I/O bus
				1. Transfers data between CPU and system I/O devices
			3. Control bus
				1. Uses binary signals to synchronize the actions of all devices attached to the system bus
			4. Address bus
				1. Holds the addressees of instructions and data

#### Instruction Execution Sequence ####
1. Single instruction execution can be divided into a sequence of individual operations called the instruction execution cycle
2. Before execution, a program is loaded into memory
3. Instruction pointer (IP) contains the address of the next instruction
4. Instruction Queue holds a group of instructions about to be executed
5. Executing a machine instruction requires 3 basic steps
	1. Fetch (loads instruction from memory)
		1. Increments the IP (also called program counter)
	2. Decode (identifies the instruction)
		1. Control unit does this
		2. Instruction's input operands are passed to the ALU
		3. Signals are sent to the ALU indicating the operations to be performed
	3. Execute (processes instruction and writes result back to register or memory)
		1. ALU executes the instruction using the named registers and internal registers (as operands)
		2. Sends the output to the named registers or memory (or both)
6. Two more steps are required when the instruction uses a memory operand
	1. Fetch operand step
		1. If the input operand is located in the memory
			1. Control unit uses a read operation to retrieve the operand and copy it into the internal registers
	2. Store output operand step
		1. If the output operand is memory, the control unit uses write operation to store the data
7. ALU updates status flags providing information about the processor state

#### Data Flow Within a Typical x86 Processor ####
	
	![x86_data_flow](x86_data_flow.png)

1. Shows components that interact during the instruction execution cycle
2. To read instruction from memory:
	1. An address is placed on the address bus
	2. Memory controller places the requested code on the data bus
		1. This makes code available inside the code cache
	3. Instruction pointer value determines which instruction will be executed next
	4. Instruction is analyzed by the instruction decoder, causing the digital signals to be sent to the control unit which coordinates the arithmetic logic unit and the floating point unit
	5. Control bus:
		1. It carries signals that use the system clock to coordinate the transfer of data between different CPU components

#### Reading from Memory ####
1. Program throughput is often dependent on the speed of memory access
	1. CPU clock speed can be several Ghz
	2. Access to memory occurs over a system bus running at much slower speed
		1. CPU may have to wait one or more clock cycles until operands have been fetched from memory before the current instruction can complete its execution
			1. Wasted clock cycles are called wait state
	3. Several steps are required when reading instructions or data from memory
2. Clock cycle: It begins when clock signal changes from high to low (changes are called trailing edges - indicates the time between transition states)
3. Steps:
	1. During cycle 1: Address bits of the memory operand are placed on the address bus ADDR
		1. The address lines cross (this shows that some bits equal 1 while others equal 0)
	2. During cycle 2: The Read line RD is set low to notify memory that a value is to be read
	3. During cycle 3: The CPU waits 1 cycle to give memory time to respond
		1. During this cycle, the memory controller places the operand on the data bus (Data)
		2. Since memory is much slower than CPU, computers use high speed cache memory to host the most recently used instructions and data
	4. Cache:
		1. The first time a program reads a block of data, it leaves a copy in the cache 
		2. If the program needs to read the data the second time, it looks for the data in cache
		3. A cache hit indicates that the data is in the cache
		4. A cache miss indicates that the data is not in the cache and must be read from conventional memory again
		5. It has noticable effect on improving access to data (especially when the cache is large)

### x86 Operating Modes ###
1. Has three primary operating modes
	1. Protected Mode (Sub mode: Virtual - 8086 Mode)
		1. It is the native state of the processor
		2. All instructions and features are available
		3. It includes virtual-8086 sub-mode
			1. Allows processor to directly execute real-address mode software while in Protected Mode (in a safe, multi-tasking environment) - MS Dos
				1. If an MS Dos program crashes, or attempts to write data into system memory area, it will not affect the other programs running at the same time
		4. Projects are given separate memory areas called segments
		5. Processor prevents program from referencing memory outside their assigned segment
	2. Real - Address Mode
		1. This implements the 8086 programming environment + few extra features
			1. Extra features: Ability to switch to other modes
		2. This mode is used to run MS Dos program that requires direct access to the system memory and hardware devices
		3. Programs running in the real address mode can cause the OS to crash
	3. System Management Mode (SMM): It provides an OS with system management mechanisms (a mechanism to implement functions such as power management and system security)
		1. These functions are usually implemented by computer manufacturers who customize the processor for a particular setup

### Overview of the x86 Registers ###
1. Register: A register is a storage unit inside the processor core which can be accessed at much higher speeds than conventional memory

#### 8086 (16-bit) registers ####
	1. All are 16 bit
	2. Split into 4 categories
		1. General purpose registers
			1. Four GPRs (each has a recommended use)
				1. AX - AH,AL
					1. Used as an accumulator
					2. Preferred for most operations
				2. BX - BH,BL
					1. Used as a base register
						1. Typically used to hold the address of a procedure or variable
				3. CX - CH,CL
					1. Used as a counting register
						1. Typically for looping
				4. DX - DH,DL
					1. Used as a data register
						1. Typically used for multiplication and division
			2. Each of them can be treated as a single 16 bit quantity or two 8 bit quantities
				1. High byte referenced by H
				2. Low byte referenced by L
		2. Index registers - contain offset from a segment register
			1. Four ISs
				1. SI - Source Index register
					1. Used for copying strings
				2. DI - Destination Index register
					1. Used for copying strings
				3. BP - Base Pointer register
					1. It is offset from the SS register (used to locate variables on the stack)
				4. SP - Stack Pointer register
					1. It is offset from the SS register (points to the stack top)
		3. Status and Control registers
			1. IP - Instruction Pointer register
				1. It points to the next instruction to be executed
			2. Flags - Flags register
				1. Contains the status flags of the processor
		4. Segment registers
			1. Four SRs - used as base location for program instructions, data or the stack
				1. CS - Code Segment register
					1. It is the base location of program code
				2. DS - Data Segment register
					1. It is the base location of variables
				3. ES - Extra Segment register
					1. It is the additional base location for variables in memory
				4. SS - Stack Segment
					1. It is the base location for the stack

#### 80386 (32-bit) ####
1. General Purpose Registers (are 32-bit long)
	1. Eight GPRs (similar to 8086 but E is prefixed)
		1. EAX (32 bit)
		2. EBX
		3. ECX
		4. EDX
		5. EBP (32 bit) - Index registers are part of the GPRs
		6. ESP
		7. ESI
		8. EDI
2. Segment Registers (16-bit) - no E added (same length as 8086)
	1. Six SRs
		1. CS
		2. DS
		3. ES
		4. SS
		5. FS
		6. GS
3. Processor Status Flags Register (EFLAGS) - 32-bit
	1. One PSFR
		1. EFLAGS
4. Instruction Pointer (EIP)
	1. One IP
		1. EIP

#### Pentium 4 (x64) ####
1. General Purpose Registers (64-bit)
	1. 16 GPRs (R - indicates 64 bit)
		1. RAX (R0)
		2. RBX (R1)
		3. RCX (R2)
		4. RDX (R3)
		5. RBP (R4)
		6. RSP (R5)
		7. RSI (R6)
		8. RDI (R7)
		9. R8 - Extra - Extension of counting order of the registers
		10. R9
		11. R10
		12. R11
		13. R12
		14. R13
		15. R14
		16. R15
2. Instruction Pointer: (64 bit)
	1. RIP
3. Flags Register (64 bit)
	1. RFLAGS
4. The naming conventions ensure backwards compatibility among processors
	1. Consider RAX (64 bit)
		1. We can access lower 32 bits with EAX
		2. We can access lower 16 bits with AX
		3. We can access higher 8 bits of AX with AH
		4. We can access lowest 8 bits with AL (referenced)

### Coding: One Register to Rule Them All ###
1. Open VS
2. New project > Windows Console Application
	1. BackwardCompat
	2. Delete cpp files
	3. New Assembly file
		1. New Item > cpp
			1. Main.asm
	4. Right click on project > Build Dependencies > Build Customizations > Masm
	5. Right click on Main.asm
		1. Item Type: Microsoft Macro Assembler
3. x64: no memory model or min processor directives required

		.code 
		main proc
			mov rax, 2
			mov rbx, 3
			mov rcx, 4
			ret
		main endp
		end

	1. Right click on project > Properties > Linker > Advanced > Entry Point > main
	2. Select x64
	2. Build the solution
	3. Select x86 (errors)
	4. Put a break point
	5. Start debugging
	6. Open register view
		1. 64 bit registers
4. x86:

		.386
		.model flat
		.code
		main proc
			mov eax, 2
			mov ebx, 3
			mov ecx, 4
			ret
		main endp
		end

	1. select x86
	2. Rebuild solution
	3. Put a breakpoint
	4. Start debugging
		1. Register view > shrunk to 32 bit
5. This is same computer
	1. It only switches between x86 and x64
6. Comment: `;`
7. 16 bit (x86 is backwards compatible)

		.386
		.model flat
		.code
		main proc
			mov ax, 2
			mov bx, 3
			mov cx, 4
			ret
		main endp
		end

	1. Rebuild solution
	2. Put break point
	3. Start debugging
		1. Lower 16 bits store the number (upper 16 bits are junk)

### Overview of the x86 Flags ###
1. Flag states
	1. 1 - set
	2. 0 - reset/clear
2. 2 groups of flags
	1. Control flags
		1. Control CPU operations
			1. Break CPU after every instruction execution
			2. Interrupt CPU when an arithmetic overflow is detected
			3. Cause CPU to enter virtual 8086 mode
			4. Cause CPU to enter protected mode
		2. Programmers can set each individual bits in EFLAGS register
			1. Direction flag
			2. Interrupt flag
	2. Status flags
		1. Reflect outcome of arithmetic and logical operations performed by the CPU
			1. Zero (ZF):
				1. It is set when the result of an arithmetic or logical operation is zero
			2. Sign (SF):
				1. It is set when the result of an arithmetic or logical operation is negative
			3. Carry (CF):
				1. 
			4. Overflow (OF):
				1. It is set when the result of a signed arithmetic operation is too large to fit into the destination
			5. Parity (PF):
				1. It is set if the least-significant byte in the result contains an even number of 1 bits
					1. Else it is cleared
					2. Usually used for error checking when data might be altered or corrupted
			6. Auxiliary Carry (AC):
				1. It is set when an arithmetic operation causes a carry from bit 3 to bit 4 in an 8-bit operation

### Overview of the Floating Point Unit ###
1. MMX Registers
	1. Technology was added by intel in Pentium processors
	2. This is to improve performance of advanced multimedia and communication applications
	3. 8 64-bit MMX registers
		1. They support special instructions called SIMD
			1. SIMD: Single instrucion, multiple data
			2. MMX Instructions operate in parallel on the data values contained in the MMX registers
		2. They appear to be separate registers, MMX register names are aliases to the same registers used in the floating point unit
2. x86 architecture also contains 8 128-bit registers (XMM registers)
	1. Used by streaming SIMD extensions to the instruction set
	2. FPU performs high performance floating point arithmetic
		1. From 486 onwards, FPU was integrated into the main processor chip
3. FPU: 
	1. 80-bit Data registers
		1. ST (0)
		2. ST (1)
		3. ST (2)
		4. ST (3)
		5. ST (4)
		6. ST (5)
		7. ST (6)
		8. ST (7)
	2. 48-bit pointer registers
		1. FPU Instruction Pointer
		2. FPU Data Pointer
	3. 16 - bit control registers
		1. Tag register
		2. Control register
		3. Status register
	4. Opcode Register
4. FPU is sometimes called x87 architecture
	1. 8 data registers are organized as a stack
	2. All arithmetic instructions are executed using either explicit or implicit operands (relative to top of the stack)
5. Operand: Quantity on which the operation is performed
	1. a + b (a is operand, b is operand)
6. Different data types can be pushed onto or popped off the FPU register stack
	1. Including signed integers of different sizes (16 bit, 32 bit and 64 bit)
	2. Floating point values of different sizes can also be pushed and popped
	3. Data transfers between FPU registers and x86 GPRs is not possible
		1. Intermedite mem location needs to be used for this
		2. Not performed very often - only in rare situations
7. FPU numberic formats, algorithms, exception signalling procedures are based on IEEE standard for binary FP arithmetic - IEEE 754.1985 standard
	1. 80 bit double extended precision format
		1. conversion between the internal format and supported floating point, integer and BCD formats occur automatically during FPU reg load and store operations
8. FPU special purpose registers
	1. Used to configure FPU
	2. Determine it's status
	3. Facilitate exception processing
	4. FPU control register (does not require elevated runtime privileges) - application programs can configure based on algorithm specific requirements
		1. Allows a task to enable or disable various floating point processing options
			1. Exceptions
				1. Setting exception mask bit to 1 in FPU control register disables generation of processor exception
			2. Rounding method
			3. Precision
9. FPU status register always records occurrance of any FPU exception condition
10. Application programs cannot access internal processor table that specifies the FPU exception handler
	1. Most C and C++ compilers provide a library function that allows application programs to designate a callback function that gets invoked when whenever FPU exception occurs
11. FPU status register contains 16 bit value that allows a task to determine the result of an arithemetic operation and check if an exception has occurred and query stack status info
12. FPU instruction set supports 3 types of memory operands
	1. Signed integer
		1. 16 bit word
		2. 32 bit double word
		3. 64 bit quad word
	2. Floating point
		1. 32 bit single precision (C/C++ - float)
		2. 64 bit double precision (C/C++ - double)
		3. 80 bit double extended precision
	3. BCD
13. Encoding using 3 distinct fields
	1. Significand - fractional part
	2. Exponent - locates the binary or decimal point in significand (magnitude)
	3. Signed bit - positive or negative

### Overview of x86 Memory Modes ###
1. Real address mode - only 1 MB memory can be addressed (00000 to FFFFF)
	1. Processor can run only one program at a time
	2. Processor can interrupt that program for a moment to process requests (interrupts)
		1. Interrupts usually come from peripherals (mouse, keyboard)
	3. Applications can access any memory addresses (including the ones linked with hardware)
2. Protected mode:
	1. Processor can run multiple programs at the same time
	2. 4 GB of memory is assigned to each process
		1. Process - running program
		2. Each program can be assigned their own memory area
	3. Programs are prevented from accessing each other's memory and data
	4. Microsoft windows and Linux run in protected mode
3. Virtual 8086 mode:
	1. Processor runs in protected mode and runs in virtual 8086 machine
	2. With 1 MB address space (simulates 8086 computer running in real address mode)
		1. 20 bit addresses
	3. Addressing:
		1. To hold 20 bit addresses, segmented addresses are used
			1. Each segment is 64 KB of memory
			
					8000:0000 to 8000:FFFF
					
4. Byte addressible memory:
	1. Each byte location (8-bit) has a separate address
	2. Two 16 bit registers are required for addressing
		1. 1 segment register (CS, DS, ES, SS)
		2. 1 offset register
	3. CPU automatically converts to 20 bit address
5. Programs have 3 segments:
	1. Code segment (CS contains 16 bit code segment address)
	2. Data segment (DS contains 16 bit data segment address)
	3. Stack segment (SS contains 16 bit stack segment address)
	4. ES, FS and GS - alternate data segments (they supplement DS)
6. Protected Mode:
	1. 4GB Linear address space (flat segmentation model)
		1. Appropriate for protected mode programming
			1. Easy to use
				1. Single 32 bit register had hold address of variable
				2. CPU performs transformation in the background
		2. CS, DS, SS, ES, FS, GS - point to segment descriptor tables which OS uses to keep track of locations of individual program segments
	2. A protected mode program has 3 segments:
		1. CODE - CS - references segment descriptor table for code segment
		2. DATA - DS - references segment descriptor table for data segment
		3. STACK - SS - refernces segment descriptor table for stack segment
7. Flat segmentation model:
	1. All segments are mapped to the entire 32 bit physical address space of the computer

			Segment descriptor:
			Base address  limit   access (determines how the segment can be used)
			  00000000     0400    ----
			  to
			  FFFFFFFF     0400    ----
			  
		1. 00040000 to FFFFFFFF are not accessed
	2. At-least two segments are required
		1. Code segment
		2. Data segment
	3. Each segment is defined by segment descriptor
		1. segment descriptor - 64 bit integer
			1. Stored in global descriptor table
8. All modern x86 architectures use the flat segmentation model
	1. Code indicates this
	
## Introduction to x86 Assembly Language ##
### Book to Read ###
1. "Modern X86 Assembly Language Programming" by Daniel Kusswurm

### Overview of x86 Integers ###
1. Integer constants:
	
		+ or - digits radix

	1. radix - H (hexadecimal), r (encoded real), q/o (octal), t (decimal), d (decimal), y (binary), b (binary)
	2. Example:

			26d
			1001110b
			
2. Integer prcedence
	1. (), Parantheses, 1
	2. +,-, Unary plus, Unary minux, 2
	3. *,/, Multiply, Divide, 3
	4. MOD, Modulus, 3
	5. +,-, Add, subtract, 4

### Introduction to Directives and Instructions ###
1. Directives?
	1. They are not instruction set
	2. They assist and control assembly process
	3. They are also called pseudo-ops
	4. They change the way the code is assembled
2. Examples:

		.CODE - indicates start of code segment
		.DATA - indicates start of data segment
		.STACK - indicates start of stack segment
		.END - marks the end of a module
		.DD - allocates a double word (4 bytes) storage
		.DWORD - allocates a double word (4 bytes) storage
3. Instructions?
	1. A statement that becomes executable when a program is assembled
	2. Instructions are translated by assembler into machine language bytes
	3. Parts

			[label:] mnemonic [operands] [;comment]
			optional required may be     optional
			
			start : mov eax, 10000h ; EAX = 10000h
			
		1. Label: used as a place marker for instructions and data
			1. Lable placed before an instruciton implies an instruction's address
			2. Label placed before a variable implies variable's address
				1. Data labels:

						count DWORD 100
						
					1. count - 32 bit variable - assembler assigns a numberic value to each label
					2. Multiple locations:

							amount DWORD 1024, 2024
							       DWORD 4096, 8192
							       
						1. amount refers to 1024 but next addresses follow amount (amount + 4, amount + 8, ...)
			3. Code labels: must end in :

					start: // it can be placed in a line by itself
						mov ax, bx,
						...
						jpm start
						
					start: ...
					
		2. Mnemonic: identifies an instruction

				mov : Move (assign) one value to another
				add : add two values
				sub : subtract one value from another
				mul : multiply two values
				jmp : jump to a new location
				call: call a procedure
				
		3. Operand: quantity on which an operation can be done
			1. Operator, Name
			2. 20, Constant
			3. 35 - 7, Constant expression
			4. EAX, Register
			5. count, Memory
		4. Block Comments:

				COMMENT !
				Assembly programming is awesome
				Register are empty
				!
				
				COMMENT &
				This procedure initializes the
				printer and scanner drivers.
				&
				
		5. Single line comments:

				start : move eax, 10000h ; EAX = 10000h

### Simple x86 Assembly Template ###
1. Example:

		; This program adds and subtracts 32-bit integers
		.386 							; min CPU required
		.model flat,stdcall			; identifies segmentation model, identifies convention used to pass parameters, flat - protected mode, stdcall - enables calling ms windows functions
		.stack 4096
		.code							; beginning of code segment
		main PROC						; PROC - identifies beginning of a procedure, main - name of procedure
				mov eax, 10000h		; EAX = 10000h
				add eax, 40000h		; EAX = 50000h
				sub eax, 20000h		; EAX = 30000h
		main ENDP						; end of main procedure
		END main						; marks end of program, identifies name of startup procedure
		
2. Aseembly Program Template:

		; Program Description:
		; Author:
		; Creation Date:
		; Revisions:
		; Date:
		.data
		; (insert variables here)
		.code
		main PROC
		; (insert executable instructions here)
		main ENDP
		; (insert additional procedures here)
		END main

### Coding: Declaring Variables in Assembly ###
1. Open Visual Studio
	1. New project
	2. Windows Console Applciation
	3. DeclaringVariables
	4. Delete C and C++ files
	5. Right click
	6. Add
	7. New Item
	8. Select C++
	9. Main.asm
	10. Right click on project
	11. Build Dependencies
	12. masm
	13. Right click on Main.asm
	14. Item Type
	15. Microsoft Macro Assembler
	16. Right click on project
	17. Properties
	18. Linker
	19. Advanced
	20. Entry Point: start
2. Content:

		.386
		.model flat
		.data
		num1	dword	11111111h
		num2	dword	10101010h
		ans		dword	0
		.code
		start	proc
				mov eax, num1
				add eax, num2
				mov ans, eax
				ret
		start	endp
		end		start
		
	1. Right click
	2. Build solution
	3. Put a break point at ret
	4. Debug
	5. Start debugging
	6. Right click on `ans` - Add to watch
	7. Click and display in hexadecimal format
	8. Select registers

### Dealing with Data ###
1. `[name] directive initializer [,initializer]`

		count DWORD 44324 ; DWORD is double word
		
2. Other directives

		BYTE : 8-bit unsigned integer
		SBYTE : 8-bit singed integer. S stands for signed
		WORD: 16-bit unsigned integer
		SWORD: 16-bit signed integer
		DWORD: 32-bit unsigned integer
		SDWORD: 32-bit signed integer
		FWORD: 48-bit integer (Far pointer in potected mode)
		QWORD: 64-bit integer. Q stands for quad
		TBYTE: 80-bit (10-byte) integer, T stands for Ten-byte
		REAL4: 32-bit (4-byte) IEEE short real
		REAL8: 64-bit (8-byte) IEEE long real
		REAL10: 80-bit (10-byte) IEEE extended real
		
3. Legacy directives:

		DB - 8-bit integer (one or more signed or unsigned values each must store one byte)
		DW - 16-bit integer
		DD - 32-bit integer or real
		DQ - 64-bit integer or real
		DT - 80-bit ingeger
		
4. BYTE:

		; Initialized
		
		char1 BYTE 'C'			; character constant
		num2 BYTE 0				; smallest unsigned byte
		num3 BYTE 255				; largest unsigned byte
		num4 SBYTE -128			; smallest signed byte
		num10 SBYTE +127			; largest signed byte
		
		; Uninitialized
		num5 SBYTE ?				; unitialized variable
		
		; Multiple initializers
		list BYTE 10,20,30,40	; placed consecutively in memory
									; offsets: 0000 (10), 0001, 0002, 0003 (40)
									
		; Strings (using single or double quotation marks)
		hello BYTE "Welcome back", 0
		
		; multi-line strings
		hello BYTE "Welcome back"
		      BYTE "Ready to get started"
		      BYTE "Enter your name", 0
		
5. WORD (16-BIT)

		word1 WORD 65535			; largest unsigned value
		word2 SWORD -32768		; smallest signed value
		word3 WORD ?				; uninitialized, unsigned
		
		; multiple initializers
		list WORD 1,2,3,4,5		; offsets: 0000 (1), 0002, 0004, 0008 (5)
		
6. Double WORD (32-BIT)

		word1 DWORD 12345678h	; unsigned value
		word2 SDWORD -214742222	; signed value
		word3 DWORD ?				; uninitialized, unsigned
		
7. Multiple initializers

		list DWORD 1,2,3,4,5	; offsets: 0000 (1), 0004, 0008, 000C, 0010 (5) 

### Endianness ###
1. How data is stored and retrieved in memory
	1. x86 uses little endien order - first bit is used to store least significant bit

			12345678h ; 0000 (78), 0001 (56), 0002 (34), 0003 (12)
			
	2. Big endian:

			0000 (12), 0001 (34), 0002 (56), 0003 (78)
			
### Notice ###
1. `#include <stdlib.h>` is needed in `main.c`

### Coding: Mixing C/C++ and Assembly ###
1. Using C/C++ file and assembly file - pushing and popping parameters - just give a taste
2. Open visual studio
	1. New project
	2. Windows Console Application
	3. ArrayReverser
	4. Add another file to Source Files
	5. Add new Item
	6. C++ File
	7. Reverser.asm
	8. Right click on project
	9. Build dependencies
	10. Build customization
	11. Masm...
	12. Right click on new file
	13. Properties
	14. Item Type
	15. Microsoft Macro Assembler
	16. Select C++ file
	17. Build solution
	18. Add code (copy source array to destination array in reverse order)

			extern "C" void Reverser(int* y, const int* x, int n);
			...
			
				const int n = 10;
				int x[n], y[n];
				
				//srand(4l);
				for(int i = 0; i < n; i++)
					//x[i] = rand() % 1000;
					x[i] = i;
					
				Reverser(y, x, n);
				
				printf("\n------------Array Reverser------------\n");
				for (int i = 0; i < n; i++)
				{
					printf("i:	%5d		y: %5d	x: %5d\n", i, y[i], x[i]);
				}	
			
	19. Add assembly code (push certain registers into stack - context saving - prologue, epilogue)

				.386							; optional
				.model flat,c					; c - 
				.code
				Reverser proc
						push ebp					; prolog
						mov ebp, esp
						push esi
						push edi
					
						xor eax, eax				; 0s
						mov edi, [ebp+8]			; destination address
						mov esi, [ebp+12]		; source address
						mov ecx, [ebp+16]		; number of elements
						test ecx, ecx
					
						lea esi, [esi+ecx*4-4]
						pushfd						; saves current direction flag
						std							; sets flag to 1
					
				@@:		loadsd
						mov [edi], eax
						add, edi, 4
						dec ecx
						jnz @B
						
						popfd
						mov eax, 1
						
						pop edi			; epilog
						pop esi
						pop ebp
						ret
				Reverser endp
				         end
				         
	20. In signal processing and image processing, most of the pixel manipulations are done in assembly and called in C/C++

## Data Transfer Instructions ##
### Operand Types ###
1. Instruction format with varying number of operands

		mnemonic	; destination register only
		mnemonic [destination]
		mnemonic [destination], [source]
		mnemonic [destimation], [source 1], [source 2]

2. Types of Instrucitons Operands
	1. Immediate - uses numeric literal
	2. Register - named register in CPU
	3. Memory - memory location
3. Direct Memory Operand
	1. Variable names are references to offset within data segment

			.data
			num1 BYTE 13h
			
		1. Program code contains references that dereference memory operands using addresses

				mov AL, num1	; num1 has address 00010400h, symbolic names makes it easier to reference memory
		
4. Operands summary:
	1. `reg8`: 8-bit general-purpose register: AH, AL, BH, BL, CH, CL, DH, DL
	2. `reg16`: 16-bit general-purpose register: AX, BX, CX, DX, SI, DI, SP, BP
	3. `reg32`: 32-bit general-purpose register: EAX, EBX, ECX, EDX, ESI, EDI, ESP, EBP
	4. `reg`: Any general-purpose register
	5. `sreg`: 16-bit segment register: CS, DS, SS, ES, FS, GS
	6. `imm`: 8-,16-,or 32-bit immediate value
	7. `imm8`: 8-bit immediate byte value
	8. `imm16`: 16-bit immediate word value
	9. `imm32`: 32-bit immediate doubleword value
	10. `reg/mem8`: 8-bit operand, which can be an 8-bit general register or memory byte
	11. `reg/mem16`: 16-bit operand, which can be a 16-bit general register or memory word
	12. `reg/mem32`: 32-bit operand, which can be a 32-bit general register or memory doubleword
	13. `mem`: Any 8-,16-, or 32-bit memory operand

### Overview of the MOV Instruction ###
1. MOV instruction copies data from a source operand to a destination operand

		MOV destination, source ; source does not change but destination changes
		
	1. Copying smaller values to larger ones: (MOV does not do this)
	2. `count`: unsigned 16-bit value

			.data
			count WORD 1
			.code
			mov ecx, 0		; make all bits 0 first
			mov cx, count		; copy 16 bits to lower 16 bits of ECX
			
	3. `MOVZX` (Move with zero-extend)

			MOVZX reg32, reg/mem8
			MOVZX reg32, reg/mem16
			MOVZX reg16, reg/mem8
			
		1. Copy a byte to 16 bit destination

				MOVZX AX, 10001111b
				
			1. Example:

					.data
					byteVal BYTE 10001111b
					.code
					movzx ax, byteVal		; AX = 0000000010001111b
					
	4. `MOVSX` (Mov with sign-extend) - used only with signed instructions

			MOVSX reg32, reg/mem8
			MOVSX reg32, reg/mem16
			MOVSX reg16, reg/mem8
			
		1. Example:

				.data
				byteVal BYTE 10001111b
				.code
				movsx ax, byteVal		; AX = 1111111110001111b

### Understanding Direct - Offset Operands ###
1. Direct-Offset Operands

		numArray BYTE 10h,20h,30h,40h,50h
		
		mov al, numArray			; AL = 10h
		mov al, [numArray+1]	; AL = 20h
		mov al, [numArray+2]	; AL = 30h

### Memory Addressing Modes ###
1. 4 components
	1. Fixed displacement
	2. Base register
	3. Index register
	4. Scale factor
2. Effective address - calculated by processor to determine the final destination of the operand

		Effective address = BaseReg + IndexReg * ScaleFactor + Disp
		
	1. BaseReg - any general purpose reg
	2. IndexReg - any general purpose reg except ESP
	3. Disp - constant offset encoded within the instruction
	4. ScaleFactor - 1, 2, 4, 8
	5. Final effective address is always 32 bit
3. Examples:

		Disp									mov eax, [MyVal]
		BaseReg								mov eax, [ebx]
		BaseReg + Disp						mov eax, [ebx+12]
		Disp + IndexReg * SF				mov eax, [MyArray + esi*4]
		BaseReg + IndexReg					mov eax, [ebx + esi]
		BaseReg + IndexReg + Disp			mov eax, [ebx + esi + 12]
		BaseReg + indexReg * SF				mov eax, [ebx + esi * 4]
		BaseReg + IndexReg * SF + Disp	mov eax, [ebx + esi * 4 + 20]

## Arithmetic Instructions ##
### The Increment and Decrement Instructions ###
1. Increment and Decrement:

		INC reg/mem
		DEC reg/mem
		
2. Example:

		.data
		myWord	WORD 1000h
		.code
		inc myWord			; myWord = 1001h				
		mov bx, myWord
		dec bx					; BX = 1000h

### The Addition and Subtraction Instructions ###
1. `ADD dest, source` - source is unchanged, sum is stored in dest

		.data
		var1 DWORD 10000h
		var2 DWORD 20000h
		.code
		mov eax, var1			; EAX = 10000h
		add eax, var2			; EAX = 30000h
		
2. `SUB dest, source`

		.data
		var1 DWORD 30000h
		var2 DWORD 10000h
		.code
		mov eax, var1			; EAX = 30000h
		sub eax, var2			; EAX = 20000h

### Data Operators and Directives ###
1. Operators and directives are not executable instructions, they are simply interpreted by the assembler
2. Operators:

		OFFSET - Returns offset of a data label (distance in bytes from the beginning of the data segment)
		PTR - Overrides operand's default size
			1. Necessary when we are trying to access the variable using the size attribute which is different from the one used to declare the variable
		TYPE - Returns size of operand or array element size (in bytes)
			1. Type of byte is 1
			2. Type of word is 2
			3. Type of double word is 4
			4. Type of quad word is 8
		LENGTHOF - Returns number of elements in an array
		SIZEOF - Returns number of bytes used by array initializer (LENGTHOF * TYPE)
		LABEL - Redefines same variable with different size attributes
		ALIGN - Aligns a variable on a boundary (byte, word or double word) 

### Coding: Summing Array Elements ###
1. Open Visual Studio
2. New Project
3. Windows Console Application
4. ArraySum
5. Remove C++ files
6. Source Files > New Item > C++ File
	1. Main.asm
7. Right click on project > Build Dependencies > Build Customization > MASM
8. Right click on file > General > Microsoft MASM Assembler
9. Right click on Project > Linker > Advanced > Entry Point - start

		.386
		.model flat
		
		.data
		intArray DWORD 10000h,20000h,30000h,40000h
		
		.code
		start proc
			mov edi, OFFSET intArray
			mov ecx, LENGTHOF intArray
			mov eax, 0
		LP:
			add eax, edi
			add edi, TYPE intArray
			loop LP
			ret
		start endp
		end start
		
	1. Build Solution
	2. Put break point
	3. Start debugging
	4. Open Registers - EAX = a000...

### Coding: Scanning an Array ###
1. New Project: DataScan
	1. Entry point: Linker: ENtry Point - main

			.386
			model flat
			
			.data
			intArray SWORD 0,0,0,0,1,3,0,-34,-56,7,8
			;intArray SWORD 0,0,0,0,0,0,0,0,0,0,0
			
			.code
			main proc
				mov ebx, OFFSET intArray
				mov ecx, LENGTHOF intArray
				
			L1:
				cmp WORD PTR[ebx], 0
				jnz found
				add ebx, 2
				loop L1
				jmp notFound
				
			found: 
				movsx eax, WORD PTR[ebx]
				jmp quit
				
			notFound:
				mov eax, 9999999
				
			quit:
				ret
				
			main endp
			end main

### Coding: Using Pointers and Typedef ###
1. File > New > Project > PointersAndTypedef

		.386
		.model flat
		PBYTE TYPEDEF PTR BYTE ; pointer to byte
		PWORD TYPEDEF PTR WORD ; pointer to word
		PDWORD TYPEDEF PTR DWORD ; pointer to double word
		
		.data
		arrayB BYTE 10h,20h,30h
		arrayW WORD 1,2,3
		arrayD DWORD 4,5,6
		
		pt_1 PBYTE arrayB
		pt_2 PWORD arrayW
		pt_3 PDWORD arrayD
		
		.code
		start proc
			mov esi, pt_1
			mov al, [esi]
			mov esi, pt_2
			mov ax, [esi]
			mov esi, pt_3
			mov eax, [esi]
			ret
		start endp
		end start

## Conditional Branching ##
### The Jump and Loop Instructions ###
1. Jump: `jmp` - unconditional transfer to a destination using code label translated by assembler to an offset address
	1. Offset of destination is moved to the instruction pointer register causing execution to continue at new location

			start:
			.
			.
			jmp start			; repeat the endless loop
			
2. Loop: `loop` repeats a block of instructions a specific number of times
	1. `ecx` - counter whose value is decremented each time a loop is repeated

			LOOP destination
			
		1. Two steps
			1. Subtracts 1 from ecx register
			2. Compares ecx to 0
			3. If ecx is not zero, a jump is taken to the label identified by destination
			4. If ecx is zero, no jump takes place and control passed to the instruction following the loop 

### Logic Instructions ###
1. AND - bitwise and between two operands

		AND destination, source
		
		AND reg, reg
		AND reg, mem
		AND reg, imm
		AND mem, reg
		AND mem, imm
		
2. OR - bitwise or between two operands

		OR destination, source
		
		OR reg, reg
		OR reg, mem
		OR reg, imm
		OR mem, reg
		OR mem, imm
		
3. TEST - implied AND operation between each pair of matching bits between two operands

		TEST reg, reg
		
		test al, 00001001b ; test bits 0 and 3 in the al register
		
	1. Unline AND, test does not modify the destination operand
	2. Useful to test if individual bits are set in two operands
4. CMP - used to compare integers (implied subtraction between source and destination)

		CMP destination, source

### Condition Jump Instructions ###
1. `J<cond>` instruction: branches to a destination label when a status flag condition is true or else, falls through to the next instruction

	1. Operations that modify CPU status flags
		
			SUB
			AND
			CMP
			
		1. `J<cond> destination` - one or more flags are tested
	2. Example:

			cmp eax, 0
			jz level2 ; jump if ZF = 1
			.
			.
			level2:
			
			cmp eax, 0
			jnz level2 ; jump if ZF = 0
			.
			.
			level2:
			
	3. Table:

			JC - Jump if Carry flag is set - CF = 1
			JNC - Jump if Carry flag is not set - CF = 0
			JZ - Jump if Zero flag is et - ZF = 1
			JNZ - Jump if Zero flag is not set - ZF = 0
			JO - Jump if Overflow flag is set - OF = 1
			JNO - Jump if Overflow flag is not set - OF = 0
			JS - Jump if signed flag is set - SF = 1
			JNS - Jump if signed flag is not set - SF = 0
			JP - Jump if parity flag is set - PF = 1
			JNP - Jump if parity flag is not set - PF = 0
			
	4. Jump instructions based on equality comparisons:

			JE - Jump if equal
			JNE - Jump if not eaual
			JCXZ - Jump if CX = 0
			JECXZ - Jump if ECX = 0
			
		1. `CMP leftOp, rightOp`

### Instruction Operands ###
1. Implicitly specified operands
	1. Immediate operand type - constants (only source)
	2. Register - GPRs
	3. Memory - location in memory
2. Examples:

		mov eax, 42 ; eax = 42
		imul ebx, 11h ; ebx *= 0x11
		xor dl, 55h ; dl ^= 0x55
		add esi, ebx ; esi += 8
		
		mov eax, ebx
		inc ecx
		add ebx, esi
		mul ebx		; edx:eax = eax * ebx
		
		mov eax, [ebx]	; eax = *ebx
		add eax, [val1]	; eax += *val1
		or ecx, [ebx+esi]	; ecx |= *(ebx + esi)
		sub word ptr [edi], 12	; *(short*)edi -= 12

## The Nature of Mixing C/C++ and Assembly ##
### Coding: Computing the Sum of an Array ###
1. New project: Windows console - CalculateSum
2. New item: Adder.asm - C++ file
3. Build Customizations - Masm
4. Adder.asm - Properties - Microsoft Macro Assembler
5. CalculatorSum.cpp
		
		extern "C" int AdderASM(int a, int b, int c);
		int AdderCPP(int a, int b, int c);
		
		int main()
		{
			int a = 17, b = 11, c = 14;
			//int sum = AdderCPP(a, b, c);
			int sum = AdderASM(a, b, c);
			printf("a: %d\n", a);
			printf("b: %d\n", b);
			printf("c: %d\n", c);
			printf("sum: %d\n", sum);
			
			return 0;
		}
		
		int AdderCPP(int a, int b, int c)
		{
			return a + b + c;
		}
		
6. Adder.asm

		.386
		.model flat,c ; c style names for public symbols
		.code
		AdderASM proc
			push ebp
			mov ebp, esp	; stack frame initializes - offset of data on stack are relative to registers ebp and esp
			
			mov eax, [ebp+8]		; eax = 'a'
			mov ecx, [ebp+12]	; ecx = 'b'
			mov edx, [ebp+16]	; edx = 'c'
			
			add eax, ecx			; eax = 'a' + 'b'
			add eax, edx			; eax = 'a' + 'b' + 'c'
			
			pop ebp
			
			ret
		AdderASM endp
		end AdderASM
		
	1. x86-32 assembly language function assumes eax to return 32 bit integer to it's calling function
	2. Rebuild solution and Start without debugging

### Coding: Computing Signed Multiplication and Division ###
### Coding: Understanding C/C++ Calling Conventions ###
1. Allocation of space on stack
2. Proper use of commonly used x86 instructions
3. New project > CPPCallingConventions > Windows Console App
	1. Right Click > Add New Item > C++ File > CalculateSum.asm
	2. Right click on project > Build dependencies > Build Customisations > MASM
	3. Right click on asm file > Properties > Item Type > Microsoft Macro Assembler
4. 6 args - first 3 inputs, sum of nums, sum of squares, sum of cubes
5. CPP file:

		extern "C" void CalculateSum(int a, int b, int c, int* s1, int* s2, int* s3);
		
6. ASM file:

		.386
		.model flat, c
		.code
		
		CalculateSum proc
		; function prolog
			push ebp		; non volatile register
			mov ebp, esp	; when ebp is used to access function args, positive displacement is used, when local variables are used, negative displacement is used
			sub esp, 12	; allocates 12 bytes of local storage space on stack, x86 stack grows downwards to lower address
			push ebx		; non volatile register
			push esi		; non volatile register
			push edi		; non volatile register
		
		; load arguments;
			mov eax, [ebp + 8]		; eax = 'a'
			mov ebx, [ebp + 12]		; ebx = 'b'
			mov ecx, [ebp + 16]		; ecx = 'c'
			mov edx, [ebp + 20]		; edx = 's1'
			mov esi, [ebp + 24]		; esi = 's2'
			mov edi, [ebp + 28]		; edi = 's3'
			
		; compute s1 = a + b + c
			mov [ebp - 12], eax
			add [ebp - 12], ebx		; not very efficient (regs can be used)
			add [ebp - 12], ecx		; a + b + c
			
		; compute s2 = a*a + b*b + c*c
			imul eax, eax				; a * a
			imul ebx, ebx				; b * b
			imul ecx, ecx				; c * c
			mov [ebp - 8], eax
			add [ebp - 8], ebx
			add [ebp - 8], ecx
			
		; compute s3 = a*a*a + b*b*b + c*c*c
			imul eax, [ebp + 8]		; a * a * a
			imul ebx, [ebp + 12]	; b * b * b
			imul ecx, [ebp + 16]	; c * c * c
			mov [ebp - 4], eax
			add [ebp - 4], ebx
			add [ebp - 4], ecx		; a*a*a + b*b*b + c*c*c
		
		; save s1, s2, s3
			mov eax, [ebp - 12]		; s1
			mov [edx], eax			; moves back to s1
			mov eax, [ebp - 8]
			mov [esi], eax
			mov eax, [ebp - 4]
			mov [edi], eax
			
		; epilog
			pop edi
			pop esi
			pop ebx					; if ebx is not use, this is not required
			mov esp, ebp				; release local memory
			pop ebp					; restores ebp
			
			ret
			
		CalculateSum endp
			end
			
	1. Stack structure:

			High Mem						
						s3					+28
						s2					+24
						s1					+20
						c					+16
						b					+12
						a					+8
						Return address	+4
						old EBP			0	<- EBP
						Temp s3			-4
						Temp s2			-8
						Temp s1			-12
						OLD EBX			-16
						OLD ESI			-20
						OLD EDI			-24	<- ESP
			Low Mem	
			
	2. If a function has 0 params, it does not have to initialize stack frame pointer
	3. If an assembly function calls another function that does not preserve volative registers
		1. Solution: Calling function must ensure non-volative regs are properly saved and restored
7. Example: CPP

		#include "pch.h"
		#include <iostream>
		
		extern "C" void CalculateSum(int a, int b, int c, int* s1, int* s2, int* s3);
		
		int main()
		{
			int a = 2, b = 3, c = 4;
			int s1, s2, s3;
			
			CalculateSum(a, b, c, &s1, &s2, &s3);
			printf("Inputs a: %d	b: %d	c: %d\n", a, b, c);
			printf("Outputs sum: %d	squares: %d cubes: %d\n", s1, s2, s3);
			return 0;
		}

### Coding: Experimenting with Different Addressing Modes ###
1. Topics:
	1. How to use modes
	2. Define assembly language lookup table
	3. Accessing global variables declared in C++
2. MemoryAddressingDemo.asm

		.386
		.model flat, c
		
		; block of memory with data
		; int fibVals[] = {0, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610};
		.const
		FibVals	dword	0, 1, 2, 3, 5, 8, 13, 21
					dword	34, 55, 89, 144, 233, 377, 610
		
		NumFibVals	dword($ - FibVals)/sizeof dword ; $ - current location counter value (offset from beginning of current memory block), gives number of dwords in FibVals
		
				public		NumFibVals ; make it accessible in C++
				
		.code
		MemoryAddressing		proc
			push ebp
			mov ebp, esp
			push ebx
			push esi
			push edi
			
			xor eax, eax
			mov ecx, [ebp + 8]	; i
			cmp ecx, 0			; subtracts source from destination and sets appropriate flags
			jl InvalidIndex
			cmp ecx, [NumFibVals]
			jge InvalidIndex
			
		; Eg1 - base register
			mov ebx, offset FibVals	; ebx = FibVals
			mov esi, [ebp + 8]		; esi = i
			shl esi, 2				; esi = i * 4
			add ebx, esi				; ebx = FibVals + i*4
			mov eax, ebx				; loads table value
			mov edi, [ebp + 12]
			mov [edi], eax			; saves in v1
			
		; Eg2 - base register + displacement
			mov esi, [ebp + 8]
			shl esi, 2
			mov eax, [esi + FibVals]	; eax = *(FibVals + i*4)
			mov edi, [ebp + 16]
			mov [edi], eax
		
		; Eg3 - base register + index register
			mov ebx, offset FibVals
			mov esi, [ebp + 8]		; i
			shl esi, 2
			mov eax, [ebx + esi]	; eax = *(FibVals + i*4)
			mov edi, [ebp + 20]
			mov [edi], eax
			
		; Eg4 - base register + index register * scale factor
			mov ebx, offset FibVals
			mov esi, [ebp + 8]
			mov eax, [ebx + esi * 4]
			mov edi, [ebp + 24]
			mov [edi], eax
			mov eax, 1
			
		InvalidIndex:
			pop edi
			pop esi
			pop ebx
			pop ebp
			
			ret
		MemoryAddressing endp
			end
		
3. CPP

		extern "C" int MemoryAddressing(int i, int *v1, int *v2, int *v3, int &v4);
		extern "C" int NumFibVals;
		
		int main()
		{
			int v1 = 0, v2 = 0, v3 = 0, v4 = 0;
			int rv;
			
			for (int i = 0; i <= NumFibVals; i++)
			{
				rv = MemoryAddressing(i, &v1, &v2, &v3, &v4);
				printf("rv: %2d, v1: %2d, v2: %2d, v3: %2d, v4: %2d\n", rv, v1, v2, v3, v4);
			}
			return 0;
		}
		
	1. Why use `extern "C"`?
		1. Since program is in C++
			1. If the function was implemented or compiled in C
			2. This instructs compiler or linker to use C naming & calling conventions (instead of C++ name mangling (decorating with additional info for passing more semantic info from compiler to linker) and C++ calling conventions)
				1. Well written libraries will have this already within their definition or declaration
					1. Flexibly exports to C and C++
		2. Note: C++ is misunderstood to be a superset of C but there are incompatibilities
			1. `bool` is in C but not in C++
			2. `_Bool` is in C99 but not in C++
		3. How to include in library?

				//
				// C_library.h
				//
				
				#ifdef __cplusplus
				extern "C" {
				#endif
				
				//
				// ... prototypes for C_library go here ...
				//
				
				#ifdef __cplusplus
				}
				#endif
				
4. Which mode is recommended:
	1. Factors to consider
		1. Register availability
		2. Number of times and instruction is expected to execute
		3. Instruction ordering
		4. Memory space vs execution time tradeoffs
		5. Hardware features
			1. Processors
			2. Microarchitecture
			3. Memory and cache sizes
	2. Using simple instruction forms (instead of complex ones) to reference operand in memory
		1. Drawback: 
			1. Longer code and more space is used by instructions
			2. May need extra instructions to preserve non-volatile registers

### Coding: Declaring Global Variables in C/C++ and using them in Assembly ###
1. Topics:
	1. Integer sizes on x86
	2. Extra instructions
	3. Feature: Global variable of C++ in assembly
2. IntegersEx.asm
	1. long -> quad word (assembly)
	2. short -> word (assembly)
	3. int -> double word (assembly)
	4. Code: C++

			extern "C" char GlChar = 10;
			extern "C" short GlShort = 20;
			extern "C" int GlInt = 30;
			extern "C" long long GLongLong = 0x000000000ffffffff;
			
			extern "C" void IntegerAddition(char a, short b, int c, long long d);
			
	5. Assembly

			.386
			.model flat, c
			
			extern GlChar:byte
			extern GlShort:word
			extern GlInt:dword
			extern GLongLong:qword
			
			.code
			IntegerAddition proc
				push ebp
				mov ebp, esp
				; Compute GlChar += a
				mov al, [ebp + 8]
				add [GlChar], al
				; Compute GlShort += b
				mov ax, [ebp + 12]
				add [GlShort], ax
				; Compute GlInt += c
				mov eax, [ebp + 16]
				add [GlInt], eax
				; Compute GLongLong += d - 64 bit
				mov eax, [ebp + 20]
				mov edx, [ebp + 24]
				add dword ptr [GLongLong], eax
				adc dword ptr [GLongLong], edx
				pop ebp
				ret
			IntegerAddition endp
			end
			
	6. C++

			IntegerAddition(3, 5, -37, 11);
			printf("Int value %d", GlInt);
			printf("Char value %d", GlChar);
			printf("Short value %d", GlShort);
			printf("Long Long value %d", GLongLong);
			return 0;

### Coding: Experimenting with Conditional Codes ###
1. Topics:
	1. Condition codes
		1. Conditional mov
2. Minimum and maximum value between two numbers
3. c++

		extern "C" int SignedMinA(int a, int b, int c);
		extern "C" int SignedMaxA(int a, int b, int c);
		
		extern "C" int SignedMinB(int a, int b, int c);
		extern "C" int SignedMaxB(int a, int b, int c);
		
4. Assembly

		.model flat, c
		.code
		; find min()
		SignedMinA proc
			push ebp
			mov ebp, esp
			mov eax, [ebp + 8]	; eax = 'a'
			mov ecx, [ebp + 12]	; ecx = 'b'
			
			cmp eax, ecx
			jle @F			; nearest @@ forward label if <=
			mov eax, ecx	; eax = min(a, b)
			
		@@:mov ecx, [ebp + 16]
			cmp eax, ecx
			jle @F
			mov eax, ecx	; eax = min(a, b, c)
			
		@@:
			pop ebp
			ret
		SignedMinA endp
		end

## Working with Arrays ##
### Coding: Iterating through Array Elements ###
### Coding: Array Elements Square ###
### Coding: Working with 2-Dimensional Arrays ###
### Coding: Computing the Sum of Rows and Columns of a 2-Dimensional Array ###

## Working with Strings ##
### Coding: Copying Strings from one Variable to Another ###
### Coding: Creation of a Character Search Algorithm ###

## Programming with the Floating-Point Unit (FPU) Registers ##
### Overview of the x86 FPU ###
### Coding: Writing a temperature conversion program using the FPU ###
### Coding: Developing the Sphere Computation Algorithm ###
### Coding: Processing Floating-Point Arrays with FPU Instructions ###
### Coding: Computing Min and Max of Single-Precision Floating Point Arrays ###
### Coding: Developing Algorithms with x86 FPU Transcendental Instructions ###
### Coding: Developing the Least Squares Algorithm ###

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
