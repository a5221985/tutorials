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
