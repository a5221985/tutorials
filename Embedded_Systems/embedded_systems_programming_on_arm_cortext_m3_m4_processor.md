# Embedded Systems Programming on ARM-Cortext M3/M4 Processor #
## Introduction ##
### About the Instructor ###
### Important Note ###
### Motivation to Learn Cortex Family of Processors ###
1. Motivation:
	1. it's an embedded processor used in most of the microcontrollers we see today
		1. Used in wide range of embedded applications
			1. Battery powered devices
				1. Health monitoring
				2. Fitness tracking apps
				3. Medical meters
				4. ...
			2. Automotive apps
			3. IOT apps
			4. Mobile and home appliances
			5. Home/building automation
			6. Toys and consumer products
			7. PC and mobile accessories
			8. Test and measurement devices
	2. Other examples:
		1. Fitbit flex (for tracking fitness) - water-resistant wristband with 5-day battery life (battery life and charge cycles vary with use, settings and other factors.)
		2. Wireless syncing - sync stats wirelessly & automatically
		3. Spec
			1. Microcontroller: STM32L151C6 by STMicro
			2. Processor: ARM Cortex M3
			3. Application type: Ultra Low Power
		2. TomTom Spark 3 GPS Multisport Fitness Watch
			1. Microcontroller - SAMSx (Atmel SMART ARM Cortex-M7 Microcontrollers)
			2. Processor: ARM Cortex M7
			3. Application Type: Ultra Low Power
2. Most of famous MCU manufacturers produce microcontrollers based on ARM Cortex M processors
	1. TI (Low power battery based applications)
	2. STMicro (High + Medium + Low performance MCUs)
	3. Toshiba (measuring equipments + metering)
	4. NXP
	5. Microchip
	6. Broadcom (Wireless connectivity, IOT)
	7. ...
	8. Freescale
	9. Fujitsu
10. Motivation:
	1. Most of the manufacturers love to use ARM Cortex M processor in design because of it's 
		1. Minimal cost
		2. Minimal power
		3. Minimal silicon area
			1. For different power requirements
	2. Its a 32 bit processor which will suply boost the computational performance of an app and it comes with almost same price of 8 bit or 16 bit traditional processor
		1. Compared to 8 and 16 bit microcontrollers
	3. We can use the processor based MCUs in ultra low power to high performance based apps
	4. Processor is customizable to include (manufacturer can add more features such as below)
		1. Floating point unit
		2. DSP unit
		3. MPU (Memory Protection Unit)
		4. ...
	5. Powerful and easy to use interrupt controller
		1. Supports 240 external interrupts
	6. RTOS friendly
		1. Provides some exceptions
		2. Provides processor operational modes and access level configuration
			1. Helps to develop secured RTOS related applications
	7. Instruction set is rich and memory efficient
		1. Uses Thumb instruction set
			1. Collection of 16 bit & 32 bit instructions
			2. Cortex M processor cannot execute ARM instruction set instructions (which are 32 bit)
				1. It uses thumb instruction set
					1. Why? Gives same 32 ARM instruction performance but in 16 bit format
						1. Saves space in core memory
			3. ARM provides documentations to learn more about the processor
				1. infocenter.arm.com
11. Major competitors
	1. AVR based microcontrollers (8/16/32 bit) by microchip (Atmel - previously)
		1. Most of arduino boards use microcontrollers which are based on AVR Processor Core of 8 bit/16 bit/32 bit architecture
			1. Exception: Arduino Due - ARM Cortex M based (I think)
	2. MSP430 Microcontrollers (16bit) by TI
		1. Own architecture

### Processor Core vs Processor ###
1. Open ARM Cortex M4 Processor - Technical Reference Manual
	1. ARM's website
		1. Functional Description (section)
			1. Block diagram of Cortex M4
				1. Processor is
					1. Processor core
						1. Consists of ALU (data computation takes place and results will get generated)
						2. It has logic to decode and execute instruction
						3. It has many registers to store and manipulate data
						4. It has barrel shifter
						5. It has pipeline engine to boost instruction execution
						6. It has hardware multiplication and division engine
						7. It has address generation unit
						8. Registers to hold data
						9. Special function registers to track the status of core
						10. Checking validity of instruction
					2. Peripherals (processor specific)
						1. NVIC (Nested Vectored Interrupt Controller) engine
						2. FPB (Flash Patch Breakpoint)
						3. Bus Matrix
						4. MPU (Memory Protection Unit)
						5. DWT (Data Watchpoint and Trace Unit)
						6. ...
					3. Processor core (CPU Core(s)) + processor specific peripherals - This is called as CPU 
						1. Cortex-M4 - Single Core CPU
					4. Processor specific peripherals
						1. Discussed further later
						2. Bus Matrix
				2. Bus Interfaces - To talk to external world
					1. ICode - AHB-Lite Instruction Interface
					2. DCode - AHB-Lite Data Interface
					3. System - AHB-Lite System Interface

### Processor vs Microcontroller ###
1. Cortex-M4 Processor - designed by ARM
	1. Processor Core
	2. Associated peripherals
2. It is in software IP format - passed to vendors
	1. Vendors will integrate the engine into their microcontroller
		1. While integrating, the manufacturers may remove certain components
			1. MPU
			2. Data Watchpoint and Trace (DWT)
			3. ...
3. Differences
	1. STM32F446RE - ST Microelectronics
		1. ARM Cortex-M4, DSP, FPU
			1. Cortex-M4 core - design includes FPU - Manufacturer may keep it or remove it
		2. Datasheet
			1. Block diagram
				1. ARM CORTEX M4 (180 MHz)
					1. Taken from ARM
					2. Talks to ST's components using 3 bus interfaces
						1. I-Bus
						2. D-Bus
						3. S-Bus
				2. Rest of it is designed by ST
	2. STM32F030R8
		1. Block diagram
			1. CPU - Cortex-M0 (48 MHz)
	3. MSP430G2x11
		1. Block diagram
			1. CPU
				1. This is not based on ARM
					1. It is designed by TI
	4. Tiva series by TI (TM4C123GH6PGE)
		1. ARM Cortex-M4F (F - Has floating point unit)
		2. External peripherals
			1. GPIO
			2. TImers
			3. Serial Communication
			4. Data acquisition
				1. ADC
				2. DAC
				3. CAN
			5. Buses
				1. AHB
				2. APB
	5. The Cortex-M4 processor acts like a master and external peripherals act like a slave
		1. They communicate through bus interfaces

### Download Source Code ###
1. [https://github.com/niekiran/CortexMxProgramming](https://github.com/niekiran/CortexMxProgramming)

## Hardware/ Software Requirements ##
### Hardware/ Software Requirements ###
1. [https://www.udemy.com/course/embedded-system-programming-on-arm-cortex-m3m4/learn/lecture/25391790#overview](https://www.udemy.com/course/embedded-system-programming-on-arm-cortex-m3m4/learn/lecture/25391790#overview)
	1. Hardware: STM32F407 Discovery Board
	2. Software: STM32CUBEIDE

## IDE Installation ##
### Note for the Students ###
1. If already installed STM32CUBEIDE, skip this section

### About IDE ###
1. Installing an Integrated Development Environment (IDE)
	1. IDE is a software that contains all essential tools to develop, compile, link and debug code
		1. We may to integrate compiler and debugger tools into IDE in some cases
	2. Eclipse-based STM32CubeIDE is used in the course
		1. Developed by ST Microelectronics
			1. Used to write, compile, debug apps on STM32 ARM-based microcontrollers
	3. STM32CubeIDE is eclipse based with STM32 related customization

### Installing IDE on Windows ###
### Installing IDE on Ubuntu ###
### Embedded Target Used in this Course ###
1. STM32F407VGT6 - 32 bit microcontroller
	1. Processor: ARM Cortex-M4 with FPU
2. IO pins - for connecting external components (External interfacing headers)
	1. LEDs
	2. Buttons
	3. LCDs
	4. Keypads
3. 8MHz crystal oscillator - supply clock to the microcontroller
4. On board programmer and debugger - ST-LIN/V2-A
	1. To program and debug (no external programmer or debugger required)
	2. When we install STM32CUBEIDE - driver for the debugger will be installed automatically
		1. Separate STLink drivers are also provided
	3. Use mini USB cable to connect to PC
	4. Mini Type B Plug - USB
		1. Not used

### Documents ###
1. Documents related to microcontroller
	1. Search microcontroller in google (stm32f407)
		1. st.com site
			1. Resources
				1. Check Datasheet
				2. Check Reference Manual
				3. Download
	2. Search for board (stm32f407 discovery board)
		1. st.com site
			1. Resources
				1. Check Product Specification
				2. Check User Manual
				3. Check Schematic
				4. Download

## Embedded Hello World ##
### Note for the Students ###
1. If SMV and printf is learnt, skip the section

### Constructing Helloworld Project ###
### Printf Using SMV ###
### Testing Helloworld Program on Target ###
### Printf Using Semihosting ###

## Access Level and Operation Modes of the Processor ##
### Features of Cortex Mx Processor ###
1. Features
	1. Operational mode of the processor
	2. Different access levels of the processor
	3. register set of the processor (not very important if using higher level langauges such as C or C++)
		1. General purpose register
		2. Special purpose register
	4. Banked stack design of the processor
		1. Stack memory handling mechanism of the processor
	5. Exceptions and exception handling
	6. Interrupt handling
		1. Mechanism
	7. Bus interfaces
		1. Provided by ARM-Cortex
		2. Bus matrix of microcontroller
	8. Memory architecture of the processor, bit banding, memory map, ...
	9. Endinness
	10. Aligned and unaligned data transfer
	11. Bootloader and IAP (In Application Programming)
		1. We can invoke ST's bootloader and we can invoke our binary with the help of bootloader (IAP)
	12. ...

### Operational Modes of the Cortex Mx Processor ###
1. M0/M3/M4 (M7...)
	1. Processor gives 2 operational modes (physically)
		1. Thread mode
			1. All application code will execute under "thread mode" of the processor - "User Mode"
		2. Handler mode
			1. All exeptions handlers or interrupt handlers will run under the "Handler mode" of the processor
				1. System exceptions
				2. Interrupts (from peripherals)
			2. If exceptions occur, the processor switches to handler mode and invokes interrupt service routine with the exception or interrupt
	2. Processor always starts with "Thread mode"
	3. Whenever core meets system exception or any external interrupts, then core will change it's mode to handler mode in order to service the interrupt services routine (ISR) associated with the system exception or the interrupt

### Operation Modes Code Demonstration ###
1. Operation modes of Cortex Mx Procesor: Demonstration
	1. New project
		1. Board: operation_modes
		2. Empty
	2. main.c

			void generate_interrupt() { // gets executed in thread mode of the processor
				uint32_t *pSTR = (uint32_t*) 0xE000EF00;
				uint32_t *pSTR = (uint32_t*) 0xE000EF00;
				
				//enable IRQ3 interrupt
				*pISER0 |= (1 << 3);
				
				//generate an interrupt from software for IRQ3 (system level registers memory mapped)
				*pSTIR = (3 & 0x1FF); // interrupt handler will be called
			}

			int main(void) { // first function called (before this - reset handler is executed if reset) - the instructions will get executed in thread mode of processor
			
				printf("In thread mode: before internet\n");
				
				generate_interrupt();
				
				printf("In thread mode: after interrupt\n");
				
				for(;;);
			}
			
			void RTC_WKUP_IRQHandler(void) { // executed in handler mode of the processor
				printf("In handler mode: ISR\n");
			}
			
		1. Handler mode: (always gets executed in privileged mode)
			1. We have full control over processor: We can do anything to the processor
			2. We can touch any resources we want
			3. We can access all system level registers
			4. We can change interrupt configuration
			5. We can modify some of the control registers
		2. By default thread code also has privileged level access
			1. We can make thread mode code as unprivileged
			2. We cannot make handler mode code as unprivileged (always executes in privileged access level)
	3. Execute the code:
		1. Enable SWB
		2. How to know if it is in thread mode or handler mode
			1. Go to Coretex-M4 Generic user Guide
				1. Search for **Interrupt Program Status Register**
					1. IPSR Register - ISR_NUMBER (field)
						1. 0 - thread mode
						2. Non-zero - handler mode
							1. Number represents type of interrupt it is handling
								1. 1 - Reserved
								2. 2 - NMI
								3. 3 - HardFault
								4. 4 - MemManage
								5. 5 - BusFault
								6. 6 - UsageFault
								7. 7-10 - Reserved
								8. 11 - SVCall
								9. 12 - Reserved for Debug
								10. 13 - Reserved
								11. 14 - PendSV
								12. 15 - SysTick
								13. 16 - IRQ0
								14. ...
								15. n + 15 - IRQ(n - 1)^a
							2. Field will reveal which exception has caused the processor to move to the handler mode
			2. Window > Show View > Registers
				1. xpsr [8:0]
				2. IRQ3 is triggered if we run the code (19 is the value)
2. The only way to push the processor to handler mode is through external interrupt or through software exception

### Access Level of the Processor ###
1. Processor offers 2 access levels
	1. Privileged Access Level (PAL)
	2. Non-Privileged Access Level (NPAL)
2. Why the access levels?
	1. If code is running with PAL, then
		1. Code has full access to all processor specific resources and restricted registers (privileged level can only access these registers)
	2. If code is running with NPAL, then
		1. Code may not have access to some of the restricted registers of the processor
	3. By default - code will run in PAL
	4. When processor is in thread mode,
		1. It is possible to move the thread to NPAL
		2. Once we move out of PAL to NPAL (in thread mode)
			1. it is not possible to come back to PAL unless you change processor operational mode to "handler mode"
	5. "Handler mode" code execution is always with PAL
	6. Use CONTROL register of the processor if you want ot switch between access levels
		1. Configured to change access level to non-privileged mode

### Core Registers Part-1 ###
1. Cortex-M4 Devices - Generic User Guide
	1. Core register (section)
		1. Processor core registers (Cortex-M4 core) - 32 bit all
			1. Low registers: R0-R12 (general purpose registers)
				1. Can be used for general purpose (data operations, manipulations, store data, addresses, ...)
			2. R13 - Stack pointer (SP)
				1. Used to track stack memory (PSP, MSP - Banked version of SP)
				2. PSP - Processor Stack Pointer
				3. MSP - Main Stack Pointer
					1. Later (depends on mode)
			3. R14 - Link Register (LR)
				1. It stores the return information for subroutines, fucntion calls, and exceptions.
				2. On reset, the processor sets LR value to 0xFFFFFFFF
				3. Example:

						// Caller
						void fun1(void) {
							fun1_ins_1;
							fun2(); // PC jumps to fun2 address
							fun1_ins_2; // LR = return address (address of next instruction)
						}
						
						// Callee
						void fun2(void) {
							fun2_ins_1;
							fun2_ins_2;
						} // PC jumps back to resume fun1 - Function return PC = LR
						
					1. Before jumping to fun2, LR is loaded with address of next instruction (fun1_ins_2)
					2. When fun2 finishes, saved LR is copied into PC
						1. PC jumps back to fun1
					3. LR - used to link back to the caller
					4. Example: program:
						1. `main(0)` calls `generate_interrupt()`

								bl <address> # branch with link - LR gets updated with next address
								...
								bx lr # branch indirect - LR is copied into PC
								
							1. Check LR register
							2. Check PC register
								1. T bit of XPSR register may be different (?)

### Core Registers Part-2 ###
1. R15 - PC (Program Counter)
	1. It contains current program address (instruction address)
	2. On reset, processor loads PC with value of reset vector
		1. Address - 0x00000004 (mem map)
	3. Bit[0] of value is loaded into EPSR T-bit at reset and must be 1
		1. Later

### Core Registers Part-3 ###
1. Special registers (5 registers)
	1. PSR - Program Status Register (holds status of execution of current program)
		1. It combines 3 different sub-registers
			1. Application Program Status Register (APSR)
				1. 5 bits (27-31)
				2. Purpose
					1. Contains conditional flags
						1. Used to detect if result is zero or negative or if there was a carry or borrow or overflow, ...
							
								[31] 	N 	Negative flag (set if result is negative)
								[30]	Z	Zero flag (set if result is zero)
								[29]	C	Carry or borrow flag
								[28]	V	Overflow flag
								[27]	Q	DSP overflow and saturation flag
								
							1. The flag values are used to take decisions in assembly program	
			2. Interrupt Program Status Register (IPSR)
				1. 9 bits (0-8) - ISR_NUMBER
				2. Not for programmers
				3. Contains exception type number of current interrupt service routine
			3. Execution Program Status Register (EPSR)
				1. 25-26, 24, 10-15
				2. T bit - Thumb state bit
					1. If 'T' bit of the EPSR is set (1), processor thinks that the next instruction which it is about to execute is from Thumb ISA
						1. ARM Cortex-M processors support only Thumb ISA
							1. It should be 1 always for ARM Cortex Mx
								1. If it is 0, it results in processor fault
					2. If 'T' bit of the EPSR is reset (0), processor thinks that the next instruction which it is about to execute is from ARM ISA
	2. PRIMASK -

### Memory Mapped and Non-Memory Mapped Registers of the MCU ###
1. Non-memory mapped registers
	1. The registers do not have unique addresses to acess them
		1. They are not part of processor memory map
		2. They cannot be accessed in 'C' program using address dereferencing
			1. We have to use assembly instructions to access them
				1. General purpose registers
				2. SP
				3. PC
				4. LR
				5. PSR
				6. Control Reg
				7. Exception Map Regs
				8. ...
			2. They are internal to processor core
				1. They do not have any address to access from the 'C' program (no address manipulation technique)
			3. Inline assembly instructions are required
2. Memory mapped registers
	1. Registers of the processor specific peripherals (NVIC, MPU, SCB, DEBUG, etc...)
	2. Registers of the microcontroller specific peripherals (RTC, I2C, TIMER, CAN, USB, etc)
		1. Vendor specific peripherals
	3. Every register has it's address in the processor memory map
	4. The registers can be accessed in 'C' program using address dereferencing
		1. We can read and write data to these registers

## ARM GCC Inline Assembly Coding ##
### ARM GCC Inline Assembly Coding Part-1 ###
1. Inline assembly code is used to write pure assembly code inside a 'C' program
2. GCC inline assembly code syntax as shown below
	1. Assembly instruction: `MOV R0, R1`
	2. Inline assembly statement: `__asm volatile("MOV R0, R1");`
		1. `__asm` - keyword
			1. `asm` also works
		2. `volatile` - optional type qualifer
		3. `("<assembly>")`
		4. `;` - termination
3. Used to access processor core registers
	1. General purpose registers
	2. Special registers
	3. SP
	4. ...
4. Different compiler has different syntaxes
5. Example:

		LDR R0, [R1]
		LDR R1, [R2]
		ADD R1, R0
		STR R1, [R3]
		
		void fun_add(void) {
			__asm volatile ("LDR R0, [R1]");
			__asm volatile ("LDR R1, [R2]");
			__asm volatile ("ADD R1, R0");
			__asm volatile ("STR R1, [R3]");
			
			__asm volatile (
				"LDR R0, [R1]\n\t"
				"LDR R1, [R2]\n\t"
				"ADD R1, R0\n\t"
				"STR R1, [R3]\n\t"
				);
		}
		
	1. Every instruction must be in double quotes (in second case)
	2. Every instruction must be terminated by `\n\t`
	3. No comma between intstructions
6. 'C' variable and inline assembly (inline assembly does it)
	1. Move the content of 'C' variable 'data' to ARM register R0
	2. Move the content of CONTROL register to the 'C' variable "control_reg"
7. General form of an inline assembly statement

		__asm volatile (<code> : <output operand list> : <input operand list> : <clobber list>);
		
	1. `volatile` - Instructs compiler not to optimize the assembler code
		1. `<code>` must not get optimized
	2. `<code>` - assembly mnemonic defined as a single string
	3. `<output operand list>` - list of output operands separated by commas
	4. `<input operand list>` - list of input operands seperated by commas
	5. `<clobber list>` - It is used to tell the compiler about modifications done by assember code
	6. Format may vary with compiler
		1. ARM CC
		2. IAR
8. Example:

		__asm volatile ("MOV R0, R1");
		__asm volatile ("MOV R0, R1":::); // same as above - no operands or clobber list

### ARM GCC Inline Assembly Coding Part-2 ###
1. Exercise
	1. Load 2 values from memory, add them and store the result back to the memory using inline assembly statements.
	2. New ST Project
	3. Empty project
	4. main.c

			__asm volatile ("LDR R1, =#0x20001000");
			__asm volatile ("LDR R2, =#0x20001004");
			__asm volatile ("LDR R0, [R1]");
			__asm volatile ("LDR R1, [R2]");
			__asm volatile ("ADD R0, R0, R1");
			__asm volatile ("STR R0, [R2]");
			
		1. Put values into memory locations
			1. Window > Show View > Memory
				1. + `>` 0x20001000
					1. Put 6
				2. + `>` 0x20001004
					1. Put 4
				2. Row Size = 1, Column Size = 1
		2. Refer to instruction set manual to know about instructions

### ARM GCC Inline Assembly Coding Part-3 ###
1. Input/ Output Operands and Constraint String
	1. Each input and output operand is described by constraint string followed by a C expression in parantheses
		1. Input/Output operand format:

				"<constraint-string>" (<'C' expression>)
				
			1. Procedure to mix arm instruction and 'C' variable
			2. constraint string

					constraint string = constraint character + constraint modifier
					
2. Example: Move the content of 'C' variable 'val' to ARM register R0
	1. Instruction: MOV
	2. Source: a 'C' variable 'val' (INPUT)
	3. Destination: R0 (ARM core register)

			__asm volatile ("MOV R0, %0"::"r"(val)); // SRC, DST
			
		1. `%0` - Operand indexing using `%` sign followed by a digit
			1. `%0` - first operand (output list or input list)
			2. `%1` - second operand
			3. ...
		2. No output operand(s)
		3. `"r"(val)`
			1. `r` - constraint character
3. Constraint characters
	1. f - floating point registers f0...f7
	2. G - immediate floating point constant
	3. H - Same as G, but negated
	4. I - immediate value
	5. ...
	5. r - General register r0 ... r15
4. Constraint modifier
	1. `=` - write-only operand (usually used for all output operands)
	2. `+` - read-write operand (must be listed as an output operand)
	3. `&` - register that should be used for output only
5. Code:

		int val = 50;
		__asm volatile ("MOV R0, %0"::"r"(val));
		
	1. `r` - tells compiler to use general register for the operand
	2. Build the project
		1. Open `.list` file in the `Debug` directory

				ldr r3, [r7, #4]
				mov r0, r3
				
			1. For inline assembly statment, compiler took the following actions
				1. First variable (val) value is read from memory into `r3`
				2. Then `r3` is used as source register in final data copy instruction (`mov`)
	3. `r` - tells compiler to use registers for data minipulation
	4. `"i"(0x50)`

			mov.w r0, #80; 0x50
			
		1. Constraint character forced compiler to use an immediate value in %0's place of instruction
	5. `"r"(0x50)`

			movs r3, #80 ; 0x50
			mov  r0, r3
			
		1. Constraint character forced compiler to use "register" in `%0` place of instruction

### ARM GCC Inline Assembly Coding Part-4 ###
1. Example 2: Move the content of CONTROL register to 'C' variable "control_reg"
	1. CONTROL register is a special register of ARM core
	2. To read CONTROL register you have to use MRS instruction
		1. Instruction => MRS
		2. Source => CONTROL register
		3. Destination => A 'C' variable "control_reg" (OUTPUT operand)

				uint32_t control_reg;
				__asm volatile ("MRS %0, CONTROL":"=r"(control_reg)::);
				
			1. Instructions of processor - Generic User Guide
				1. Cortex-M4 Instruction Set section
					1. `MRS` - Move from special register to register
					2. `MSR` - Move from register to special register
			2. spec_reg - CONTROL
			3. `"=r"`
				1. `=` - for output operands
					1. The compiler is forced to choose a register that is write only
				2. `r` - forces compiler to use register
2. Code

		int control_reg;
		__asm volatile ("MRS %0, CONTROL":"=r"(control_reg));
		
	1. What is generated

			mrs r3, CONTROL
			str r3, [r7, #0]
			
3. Exercise: Copy the content of 'C' variable var1 and var2
	1. Instruction: MOV
	2. Source: a 'C' variable 'var1' (INPUT operand)
	3. Destination: a 'C' variable 'var2' (OUTPUT operand)

			int var1 = 10, var2;
			__asm volatile ("MOV %0, %1": "=r"(var2): "r"(var1));
			
4. Exercise: Copy the contents of a pointer into another variable

		int p1, *p2;
		p2 = (int*) 0x20000008;
		__asm volatile ("LDR %0, [%1]": "=r"(p1): "r"(p2)); // p1 = *p2;
		
	1. `[%1]` - similar to `[R1]`
	2. Instructions generated:

			ldr r3, [r7, #4] ; r3 contains address (contents of p2)
			ldr r3, [r3, #0] ; r3 is dereferenced to value
			ldr r3, [r7, #0] ; r3 is stored back to p1

## Reset Sequence of the Processor ##
### Reset Sequence of the Processor ###
1. Reset sequence - events happening when we reset the microcontroller
	1. When we press reset button on board - processor undergoes reset
2. Steps:
	1. PC is loaded with the value 0x0000_0000
	2. Processor reads value @ mem location 0x0000_0000 in to MSP
		1. MSP = value@0x0000_0000
			1. MSP is Main Stack Pointer register (32 bit)
				1. Processor first initializes the stack pointer
	3. Processor reads value @mem location 0x0000_0004 into PC
		1. The value is address of reset handler
	4. PC jumps to reset handler
		1. Reset handler
			1. A C or assembly function written by us to carry out any initializations required
		2. From reset handler we call `main()` function of the application

### Reset Sequence of the Processor Contd ###
1. Reset sequence
	1. Vector table directs processor to execute Reset handler after reset

			Reset_handler() { // address is available in vector table
				// first piece of code which gets executed after reset
				// initializations
				main();
			}
			
		1. main.c

				main() {
					// user code
				}
				
		2. Reset_handler is contained in startup file of the project
			1. Every project has a startup file
				1. Startup > startup_stm32f407vgtx.s

						Reset_Handler:
							ldr r0, =_estack
							//...
							
					1. Job of reset handler
						1. To do early initialization
						2. Calls user program
			2. Responsibility of reset handler

					Processor reset
							|
							v
					Initialize data section
							|
							v
					Initialize bss section
							|
							v
					Initialize 'C' std library (__lib_init_array();)
							|
							v
						main();
						
				1. The above steps are mandatory before we call main
				2. Next: Startup file
					1. Own Vector table
					2. Own Reset handler
					3. Own Initialization
				3. Reset_Handler:
					1. Initialization
					2. Call main

## Access Level and T Bit ##
### Demonstration of Access Level of the Processor ###
1. Switching between access levels demo
	1. Copy operations mode code
		1. Switch of privileged mode

				change_access_level_unpriv();
				
				generate_interrupt(); // we cannot execute this
				
			1. ARM Cortex M processor's system control register addresses can only be accessed in privileged access level
				1. An attempt to change contents of the registers from being in unprivileged access level will cause processor fault exception

						void change_access_level_unpriv() {
							// read
							__asm volatile ("MRS R0, CONTROL");
							// modify
							__asm volatile ("OR R0, R0, #0x01"); // data processing instructions
							// write
							__asm volatile ("MSR CONTROL, R0");
						} // Generic User Guide CONTROL register
						
					1. We cannot use C pointers. We need to use inline assembly code
					2. After this, code cannot access system registers
					3. Fault handler

							void HardFault_Handler(void) {
								printf("Hard fault detected!");
								while (1);
							}
							
						1. Show View > Fault Analyzer
				2. Use case: Embedded kernel or RTOS
					1. Two components
						1. Kernel
						2. User tasks
							1. Should not affect or modify system level settings of the processor (not trigger interrupts or turn of interrupts)
								1. The whole system can fail in that case
							2. Kernel can change the privilege level of user task to un-privileged and then launch the task
								1. If user task needs services, it can trigger system calls
									1. System call will be served by kernel code (for secured access)
				3. How to switch back?
					1. We cannot directly go back to privileged access level (trap - we cannot modify privileged access level)
					2. Trigger system exeption - Which moves processor into Handler Mode (which is privileged mode)
					3. ISR can be run
						1. This can modify CONTROL register back to 0 and exit
					4. Now thread mode will be in privileged mode

### Importance of T Bit of the EPSR ###
1. Various ARM processors support ARM-Thumb interworking
	1. Ability to switch between ARM and Thumb state
2. Processor must be in ARM state to execute instructions which are from ARM ISA and processor must be in Thumb state to execute instructions of Thumb ISA
3. The lsb (bit 0) of program counter (PC) is linked to the 'T' bit
	1. When we load a value or address into PC, Bit[0] of value is loaded into T-bit
		1. Any address we place in PC must have its 0th bit as 1
			1. This is taken care of by the compiler (we usually use C)
			2. We need to be careful if we are placing raw value or raw address into PC
				1. Raw value should always be odd
					1. Suppose we are initializing with function pointer address
					2. Inline assembly
4. Reason why we see all vector addresses are incremented by 1 in vector table
	1. All addresses are odd in vector table
5. Exercise:

		void (*fun_ptr)(void);
		
		fun_ptr = change_access_level_unpriv;
		
		fun_ptr(); // address of the function is loaded into PC
		
	1. Open *.list
		1. starting address of the function is even
		2. It was changed to odd number by the compiler
		3. The zeroth bit is copied to the T bit
6. Exercise: Hardcode the address

		fun_ptr = (void*) 0x080001e8;
		
		fun_ptr(); // even address will be placed into PC - Hard Fault

## Memory Map and Bus Interfaces of ARM Cortex Mx Processor ##
### Memory Map ###
1. Memory Map of the processor
	1. Memory map explains mapping of different peripheral registers and memories in the processor-addressable memory location range (2^32 locations)
	2. Processor-addressable memory location range depends on size of address bus (32 bit in this case)
	3. Mapping of different regions in addressable memory location range is called "memory map"
2. Processor has fixed default memory map that provides up to 4 GB of addressable memory
	
		ARM Cortex M4 CPU	Data memory	Code memory
				^					^			    ^
				|					|			    |
				v					v			    v
		<-----32 bit----------System bus (AHB)---------------->
				^			^		^			    ^
				|			|		|			    |
				v			v		v			    v
			GPIOD		TIMERS		ADC			   I2C
			
	1. Code memory - where we keep instructions
	2. Data memory - where we keep temp data of program
	3. To fetch data from ADC to data memory
		1. Processor communicates to ADC over 32 bit system bus
			1. Processor produces address of the peripheral on the address bus
			2. The matching register of the peripheral will be unlocked
			3. The data will be released on data bus
			4. The data reaches one of the internal registers of the processor
				1. Load from ADC into internal register
			5. The processor stores the data from internal register to data memory
				2. Store from internal register into memory
	4. System bus consists of
		1. 32-bit address bus
			1. 4 GB different values
		2. 32-bit data bus
3. The regions of the range are fixed by the processor design (we can't change it)
	1. If processor produces an address of 0, then the processor wants to talk to the code memory
		1. Code memory could be
			1. Embedded flash
			2. EEPROM
			3. Flash
			4. OTP
			5. ...
	2. SRAM region has to be for RAM
	3. Peripheral region should be for Peripherals only
	4. External RAM section is for talking to external RAM
	5. ...
4. Code Region
	1. 512 MB - Max we can connect 512 MB of code memory
		1. Vendors usually give 1 KB to 1 MB
		2. If we need more memory, we can add external memory
			1. NAND Flash
			2. NOR Flash
	2. This is the region where MCU vendors should connect CODE memory
	3. Different types of code memories are:
		1. Flash
		2. ROM
		3. OTP
		4. EEPROM
		5. ...
	4. Processor by default fetches vector table info from this region right after reset
		1. Default behaviour
			1. The behaviour can be changed by changing boot pins on the microcontroller
5. SRAM Region
	1. The SRAM (Static-RAM) region is the next 512 MB of memory space after CODE region
	2. Comes right after code region
	3. It is there for primarily connecting SRAM
		1. Mostly on-chip SRAM
		2. It is data memory (for temp data)
	4. First 1 MB of SRAM is bit addressable (bit-banding)
	5. **Program code can also be exeuted from this region**
6. Peripheral Region
	1. Peripheral memory region also has size of 512 MB
	2. Used mostly for on-chip peripherals (of microcontroller)
		1. Processor peripheral registers will not fall under this category
			1. NVIC
			2. ...
		2. This is only for vendor specific peripheral registers
			1. RTC
			2. ADC
			3. TIMERs
	3. Like SRAM region, first 1 MB of peripheral region is bit addressable if optional bit-band feture is included
		1. Bit-Band Region
		2. Bit-Band Alias
	4. This is an eXecute Never (XN) region
		1. If we try to execute code in this region will trigger fault exception
			1. To prevent code injection attacks
				1. One can transmit code through peripheral and make processor execute the code
7. External RAM Region
	1. The region is intended for either on-chip or off-chip memory
		1. Graphics related say
		2. Frame buffers say
		3. Audio info say
	2. External RAM must be connected in this region
		1. Registers will fall under this region
	3. We can execute code in the region
		1. E.g. connecting external SDRAM
8. External Device Region
	1. The region is intended for external devices and/or shared memory
	2. This is eXecute Never (XN) region
9. Private Peripheral Bus Region
	1. The region includes NVIC, system timer, system control block
	2. This is eXecute Never (XN) region

### Bus Protocols and Bus Interfaces ###
1. Bus protocols and bus interfaces
	1. In Cortex Mx processors bus interfaces are based on Advanced Microcontroller Bus Architecture (AMBA) specification
	2. AMBA is specification designed by ARM which governs standard for on-chip communication inside system on chip
		1. Vendor who designs microcontroller that is based on ARM Cortex M microprocessor, on-chip communication (between processor, memory and peripherals) will be governed by bus interface that is based on AMBA spec
	3. AMBA specification supports several bus protocols (the protocols are derived from AMBA spec)
		1. AHB Lite (AMBA High-performance Bus)
		2. APB (AMBA Peripheral Bus)
2. AHB and APB
	1. AHB Lite bus is mainly used for main bus interfaces
	2. APB bus is used for PPB (Private Peripheral) access and some on-chip peripheral access using an AHB-APB bridge (A bridge)
	3. AHB Lite bus majorly used for high-speed communication with peripherals that demand high operation speed
	4. APB bus is used for low-speed communication compared to AHB. Most of the peripherals which don't require high operation speed are connected to this bus
3. Connections:

		    ARM Cortex Mx Processor
		  PPB   System      D-CODE I-CODE
			^     ^             ^   ^
			|     |             |   | (32 bit)
		  AHB   AHB           AHB  AHB (instruction fetch,
			|     |				|   |    vector table read)
			v     v             v   v
	     PPB   SRAM,        CODE region
	          Peripheral,   (Program Image)
	           Ext Ram, 
	         Device regions 
	         
	         MCU Vendor 
	       specific region
	       
	  1. PPB <-> PPB - Data access
	  2. System <-> SRAM, Peripheral, Ext RAM, Device regions - any access (read/write)
	  3. D-CODE <-> CODE region - Data access
	  4. I-CODE <-> CODE region - Instruction feth, vector table read)
4. Processor gives 4 bus interfaces (all AHB)
	1. The interfaces can be used to connect memories (of different kinds) and peripherals
		1. I-CODE
			1. Used to fetch instructions and vector table
		2. D-CODE
			1. Used to fetch data from code region (from flash say)
				1. constants
				2. tables
				3. ...
			2. The code and data are fetched in parallel
		3. System
			1. To connect on-chip peripherals and memory (SRAM)
				1. Any data mem access
			2. Access to peripherals
				1. ADC
				2. DAC
				3. TIMERs
				4. ...
		4. PPB
			1. Private Peripheral Bus
			2. Used to communicate with PPB region
				1. Includes most of the peripheral registers of ARM Cortex Mx
					1. NVIC register
					2. Systick timer register
					3. System control block register
			3. All control and configuration registers of ARM Cortex Mx processor will be accessed through PPB
5. Refer to datasheet of STM32F407VG MCU
	1. Bus Matrix
		1. Given by microcontroller vendor
		2. Used to synchronize bus access from different bus masters
			1. Bus masters:
				1. Processor
				2. Ethernet
				3. USB
				4. DMA
			2. Access to bus (due to multiple masters) is taken care by Arbiter (bus arbiter) (an engine)
			3. AHB1 connects to System Bus of microcontroller
				1. Most peripherals are hanging on this bus
					1. GPIO peripherals
			4. AHB2 connects to camera interaface, USB OTG peripheral
				1. Peripherals requiring high operational speed
				2. Also connects to System bus (through bus matrix - it has an arbiter)
			5. AHB3
			6. AHB1 connects to bridge (AHB/APB1, AHB/APB2)
				1. Bridge converts AHB signals into APB signals
			7. APB
				1. Peripherals that do not require high operational speed are connected to this bus
				2. Used to reduce power consumption
				3. Two APB buses
					1. APB1
						1. 42 MHz
						2. USART
						3. SPI
						4. I2C
							1. Sensor connected here say
								1. Traffic goes through
									1. APB1 bus
									2. AHB/APB1 bridge
									3. AHB1 bus
									4. AHB bus matrix
									5. System bus
									6. Processor
						5. TIMers
						6. CAN
					2. APB2
						1. 84 Mhz

### Bit Banding ###
1. What is bit-banding?
	1. It is capability to address a single bit of a memory address
		1. The feature is optional
			1. MCU manufacturer may or may not support it (refer to reference manual)
2. Consider memroy of 1024 locations (bytes say)
	1. If we read from a location, 1 byte is returned (byte addressable memory)

			LDRB R0, [R1]
			
	2. To read 2 bytes

			LDRH R0, [R1] ; H - half word
			
	3. To read word

			LDR R0, [R1]
			
	4. To read 4 bits - not supported in the processor

			LDRB R0, [R1]
			ANDR R0, #0x0F
			
	5. Bit - banding - addressing single bit (using unique address)
		1. Use case: Changing only one bit
			1. Traditionally:

					LDRB R0, [R1]
					ORR R0, #01
					STRB R0, [R1]
					
				1. load a byte, modify and store the byte
			2. Bit-Banding - each bit has an address called alias address

					LDRB R0, [AD] ; just write
					
				1. Feature is available in SRAM and Peripheral (other regions it is not available)
					1. SRAM - Only initial 1 MB region
						1. 32 MB Bit band alias - region that stores alias addresses (0x22000000 to 0x23FFFFFF)

								0x20000000 bit[0] <- 0x22000000
								0x20000000 bit[1] <- 0x22000004
								0x20000000 bit[2] <- 0x22000008
								...
								0x20000000 bit[31] <- 0x2200007C
						
					2. Peripheral - Only initial 1 MB region
						1. 32 MB Bit band alias - region that stores alias addresses (0x42000000 to 0x43FFFFFF)
3. Bit band and bit band alias addresses
	1. The regions of SRAM and peripherals include optional bit-band regions
	2. Bit-banding provides atomic operations to bit data
		1. Read or modify are all atomic (will not be interupted by exceptions or interrupts)
4. Exercise:
	1. Modify content of memory location 0x2000_0200 using usual and bit banding method and analyze the difference
		1. First store the value 0xff into memory location 0x2000_0200
		2. Make the 7th-bit position of value to 0
	2. Solutions:

			LDRB R0, #0xff
			STRB R0, [0x20000200]
			LDRB R0, [0x20000200]
			ANDRB R0, #0x7f
			STRB R0, [0x20000200]
			
			LDRB R0, #0xff
			STRB R0, [0x20000200]
			LDRB R0, #0x01
			STRB R0, [0x2210001C]

### Bit Banding Exercise ###
1. Calculation of bit band alias address
	1. 7th bit position of memory location 0x2000_02000 using alias address
		1. Formula:

				Alias address = alias_base + (32 * (bit_band_memory_addr - bit_band_base)) + bit * 4
				
				= 0x22000000 + (32 * (0x20000200 - 0x20000000)) + 7 * 4
				= 0x22000000 + (32 x 512) + 28
				= 0x22000000 + 0x0000401C
				= 0x2200401C
				
2. Program:

		uint8_t *ptr = (uint8_t*) 0x20000200;
		
		*ptr = 0xff;
		
		*ptr &= ~(1 << 7);
		
3. Program: bit-band method

		#define ALIAS_BASE 0x22000000U
		#define BIT_BAND_BASE 0x20000000U
		
		// ...
		
		*ptr = 0xff;
		uint8_t* alias_addr = (uint8_t*) (ALIAS_BASE + (32 * (0x20000200 - BIT_BAND_BASE)) + 7 * 4);
		*alias_addr = 0; // clearing 7th bit of address 0x20000200
		
	1. Open memory browser
		1. Fewer instructions are generated for bit-banding

## Stack Memory and Placement ##
### Introduction to Stack Memory ###
1. Stack memory
	1. Stack memory is part of main memory
		1. Internal RAM or external RAM
	2. It is reserved for temporary storage of data (transient data)
	3. It is mainly used during
		1. Function
		2. Interrupt/ exception handling
	4. Stack memory is accessed in last in first out (LIFO)
	5. Stack can be accessed using PUSH and POP instructions
		1. Most processor architectures support the instructions
	6. Or using any memory manipulation instructions (LD, STR)
	7. Stack is traced using stack pointer (SP) register
	8. PUSH and POP instructions affect (decrement or increment) stack pointer register (SP, R13)
2. Stack memory uses
	1. Temporary storage of processor register values
	2. Temporary storage of local variables of function
		1. When function exits, the memory occupied by local variables will be reclaimed
			1. Stack dynamically expands and shrinks during runtime of a program
	3. During system exception or interrupt
		1. Used to save context of currently executing code
			1. Context:
				1. Some general purpose registers
				2. Processor status register
				3. Return address
3. SRAM (128 KB) (STM32F407 - has 2 SRAMs (SRAM1 & SRAM2) - combined 128 KB)

		[ Part of RAM reserved for "gobal data" ] RAM_START
		[ Part of RAM reserved for "Heap" ]
		[ Part of RAM reserved for "Stack" ] RAM_END
		
	1. Part of RAM reserved for "gobal data" - utilized when program contains global data and static local variables.
		1. Instructions can also be stored here and executed
	2. Part of RAM reserved for "Heap" - utilized during dynamic memory allocation
		1. `malloc`, `calloc`
	3. Part of RAM reserved for "Stack" - utilized during function call to save temp data, temp storage of local variables of function, temp storage of stack frames during interrupts & exceptions
4. How much memory to allocate has to be defined using
	1. Toolchain OR
	2. Linker script
5. We can also write our own dynamic memory allocation API that allocates memory in "Heap"
6. The boundaries can be decided by us (it depends on the project)
	1. The sections can also be at different locations
7. Stack operation model
	1. In ARM Cortex Mx processor stack consumption model is **Full Descending (FD)**
		1. Different Stack operation models
			1. Full Ascending stack (FA)
			2. Full Descending stak (ARM Cortex Mx processors use this)
			3. Empty Ascending stack (EA)
			4. Empty Descending stack (ED)

### Different Stack Operation Models ###
1. Full Ascending Stack
	1. Increasing mem addresses
	2. Steps: Push
		1. SP is incremented
		2. Data is copied
	3. This requires decremented SP to lower memory address
2. Full Descending Stack
	1. Decreasing mem addresses
	2. Steps: Push
		1. SP is decremented
		2. Data is copied
	3. This requires initializing SP to higher memory address
3. Empty Ascending
	1. Increasing mem addresses
	2. Steps: Push
		1. SP will be pointing to next empty location
		2. Data is copied
		3. SP is incremented to next empty location
4. Empty Descending
	1. Decreasing mem addresses
	2. Steps: Push
		1. SP will be pointing to next empty location
		2. Data is copied
		3. SP is decremented to next empty location
5. This behaviour cannot be changed for STM32 microcontroller (Full Descending Stack)
6. Example:

		PUSH LR
		PUSH R0
		PUSH R1
		POP R2
		POP R3
		POP PC
		
	1. Core registers of the processor
		1. R0 - 0xFFBC
		2. R1 - 0xAB11
		3. LR - 0x800211CD
		4. R2 - 0
		5. R3 - 5
		6. PC - 0x80010000
	2. Activity

			SP -> prev data
			      0x800211CD 
			      0xFFBC
			      0xAB11     <- SP
			      

### Stack Placement ###
1. How to allocate stack?
	1. Type-1 (decided by linker script or config file of toolchain)
		1. Initial portion of RAM is selected as Data section (global)
		2. End of data section is beginning of heap section (size of heap can also be mentioned in linker script)
		3. Stack is started immediately after heap
	2. Type-2 (this is generally used)
		1. Data and heap sections are same as in Type-1
		2. Stack is pushed to the end of RAM
		
				-------
				 Stack
				------- Stack boundary
					|
					v
				Unused RAM space	
					
					^
					|
				-------
				  Heap
				-------
			     Data
				-------
				
			1. If Stack tries to cross the boundary, it is stack overflow
				1. Software routines should check stack overflow
					1. SP can be compared with higher value constantly
			2. SP can be initialized to highest memory address of the RAM where stack begins

### Banked Stack Pointer Registers of ARM Cortex Mx ###
1. Cortex M Processor physically has 3 stack pointers
	1. SP (R13): Current Stack Pointer
	2. MSP: Main Stack Pointer
	3. PSP: Process Stack Pointer
2. After processor reset
	1. By default
		1. MSP will be selected as current Stack Pointer.
			1. SP copies contents of MSP (MSP behaves like SP)
3. Thread mode can change current stack pointer to PSP by configuring CONTROL register's SPSEL bit
	1. Thread mode
		1. If SPSEL = 0 (default)
			1. SP (R13) - copies the value of MSP
		2. If SPSEL = 1
			1. PSP is the current Stack Pointer
				1. SP (R13) copies the value of PSP
4. Handler mode code execution will always use MSP as current stack pointer
	1. Changing value of SPSEL bit (0 or 1) in handler mode doesn't make any sense
		1. Write will be ignored
		2. PSP is inactive in Handler mode
5. MSP will be initialized automatically by the processor after reset by reading the contentof the address 0x0000_0000
	1. It is our responsibility to keep a valid value in this address
6. If you want to use PSP, then make sure that you initialize PSP to valid stack address in your code
	1. First initialize PSP with valid stack address
	2. Change CONTROL register to use PSP
	3. Perform push and pop operations

### Stack Exercise ###
1. Program:

		int fun_add(int a, int b, int c, int d) {
			return a + b + c + d;
		}

		int main(void) {
			int ret;
			ret = fun_add(1, 4, 5, 6);
			printf("result = %d\n", ret);
			for(;;);
		}
		
	1. Show View > Registers
		1. SP -> 0x2001fff0 (highest mem address of RAM)
			1. startup_stm32f407vgtx.s

					g_pfnVectors:
						.word _estack ; initial stack address
						
				1. When processor is reset, it first fetches first entry from the vector table and initialize MSP register with the value
				2. `_estack` - linker symbol that denotes end of RAM as beginning of stack
					1. The symbol is defined in the linker script
						1. The boundaries are defined by linker script symbols
							1. start and end of stack or heap or data sections
							2. size of stack or heap or data sections
					2. linker script: STM32F407GTX_FLASH.ld (interpreted by the linker)
						1. Linker will assemble various sections of the project based on the definition of linker script (for creation of final executable)

								_estack = ORIGIN(RAM) + LENGTH(RAM);
								
							1. stack initial address = 0x20000000 + (128 * 1024) = 0x20020000
2. Change SP to PSP for Thread Mode Code
	1. Thread Mode: SP -> PSP
	2. Handler Mode: SP is always MSP (this cannot be changed)
3. To access PSP, we need to use inline assembly code

		1KB |				| STACK_MST_START
		    |				|
		    -------------- STACK_MSP_END = STACK_PSP_START
		    |				|
		    |				| STACK_PSP_END

	1. Top is 512 bytes
		1. Handler mode will use this stack space
	2. Botton is 512 bytes
		1. Thread mode will use this stack space
	3. OS usually runs in this fasion
		1. Kernel mode code will run using it's own stack (RTOS or Embedded OS)
		2. User stack will use separate stack space

### Stack Exercise Contd. ###
1. Instructions: MRS, MSR
2. Program:

		#define SRAM_START 0x20000000U
		#define SRAM_SIZE (128 * 1024)
		#define SRAM_END ((SRAM_START) + (SRAM_SIZE))
		#define STACK_START SRAM_END
		
		#define STACK_MSP_START STACK_START
		#define STACK_MSP_END (STACK_MSP_START + 512)
		#define STACK_PSP_START START_MSP_END
		
		//...
		
		__attribute__((naked)) void change_sp_to_psp(void) {
			__asm volatile (".equ SRAM_END, (0x20000000 + (128 * 1024))");
			__asm volatile (".equ PSP_START, (SRAM_END - 512)");
			__asm volatile ("LDR R0, =PSP_START");
			__asm volatile ("MSR PSP, R0");
			__asm volatile ("MOV R0,#0x02"); // 1st bit (16 bit)
			__asm volatile ("MSR CONTROL, R0");
			__asm volatile ("BX LR"); // return - Branch Indirect (LR captures the return address so we must branch to that address)
		}
		
		void generate_exception() {
			__asm volatile ("SVC #0x2"); // exception type
		}
		
		int main(void) {
			change_sp_to_psp();
			generate_exception();
		}
		
	1. `SVC` - can be executed by thread mode code to get some services from the kernel code
		1. Usually used in OS environment
		2. It is an instruction used to implement the system call layer
	2. The name of handler can be obtained from **startup_stm32f407vgtx.s**

			void SVC_Handler(void) {
				printf("In SVC Handler\n");
			}
			
3. `equ` assembler directive (assembler way of defining macros)

		.equ label, <value>
		
4. Step through the code to see that SP switches between MSP and PSP
5. MSP, PSP Summary
	1. Physically there are 2 stack pointer registers in Cortex-M processors
	2. Main Stack Pointer (MSP): This is default stack pointer used after reset
		1. It is used for all exception/ interrupt handlers & for thread mode code
	3. Process Stack Pointer (PSP): Alternate stack pointer that can only be used in thread mode
		1. It is used for application task in embedded systems and embedded OS (usually)
	4. After power-up
		1. Processor automatically initializes MSP by reading first location of vector table
6. Changing SP
	1. To access MSP and PSP in assembly code
		1. Use MSR and MRS instructions
	2. In 'C' program, we can write naked function ('C' like assembly function which doesn't have epilogue and prologue sequences) to change the currently selected stack pointer
		1. We must never write a pure 'C' function to do this switch (prologue and epilogue will involve push and pop operations)

### Function Call and AAPCS Standard ###
1. AAPCS - ARM Architecture Procedure Call Standard

		/* this is "caller" */
		void fun_x(void) {
			int ret;
			ret = fun_y(1, 2, 3, 4);
		}
		
		/* this is "callee" */
		int fun_y(int a, int b, int c, int d) {
			return (a + b + c + d);
		}
		
	1. "callee" receives 4 input args
	2. "callee" returns a value to "caller"
2. Procedure Call Standard for the Arm Architecture (AAPCS)
	1. The AAPCS standard describes procedure call standard used by the application binary interface (ABI) for ARM architecture
	2. SCOPE
		1. The AAPCS defines how subroutines can be separately written, separately compiled, and separately assembled to work together
		2. It describes a contract between a calling routine and called routine that defines:
			1. Obligations on caller to define a program state in which the called routine may start to execute
			2. Obligations on called routine to preserve the program state of caller across the call
			3. The rights of called routine to alter program state of its caller
3. Standard is useful if multiple developers are developing routines and they go into the same project
	1. All subroutines must adhere to the specification
4. When a 'C' compiler compiles code for ARM architecture, it should follow AAPCS specification to generate code
	1. Compiler will take care of following this standard
5. According to this standard, a 'C' function can modify registers R0, R1, R2, R3, R14 (LR) and PSR and it's not the responsibility of the function to save these registers before any modification
	1. "Caller" must save the contents of R0, R1, R2, R3, R14 (LR) and PSR (by pushing onto the stack)
6. If a function wants to make use of R4 to R11 registers, then it is responsibility of the function to save it's previous contents before modifying those registers and retrieve it back before exiting the function
	1. "Callee" must save the contents of R4 to R11 by pushing onto stack and then pop before exiting (R4 to R11 must be intact when returned)
7. R0, R1, R2, R3, R12, R14 (LR) registers are called "caller saved registers"
	1. It is the responsibility of caller to save the registers on stack before calling function if those values will still be needed after function call and retrieve it back once the called function returns
		1. Register values that are not required after function call don't have to be saved
8. R4 to R11 are called "calle saved registers". The function or subroutine being called needs to make sure that, contents of registers will be unaltered before existing function
9. According to the standard
	1. Caller function uses R0, R1, R2, R3 registers to send input arguments to callee function
10. The callee function uses registers R0 and R1 to send result back to caller function

		// this is "caller"
		void fun_x(void) {
			int ret;
			ret = fun_y(1, 2, 3, 4); // 1 -> R0, 2 -> R1, 3 -> R2, 4 -> R3
		}
		
		// this is "callee"
		int fun_y(int a, int b, int c, int d) {
			int result = a + b + c + d;
			return result; // result -> R0 (10)
		}
		
	1. Parameter and result passing during function call as per AAPCS standard
		1. `fun_x` (caller) copies the arguments into R0, R1, R2 and R3
		2. `fun_y` (callee) copies register contents back to local variables
		3. `fun_y` (callee) will always use R0 to return the result
			1. If result is 64 bits, two registers are used (R0, R1)
				1. Higher 32 bits will go into R1
				2. Lower 32 bits will go into R0
		4. Suppose there are more than 4 arguments (6 say)
			1. Rest of the arguments, stack will be used
				1. [Procedure Call Standard for the Arm Architecture](https://developer.arm.com/documentation/ihi0042/latest/)
					1. Local variables are reserved in stack memory
						1. R4-R8, R9, R10, R11 (6 registers) are used to access these variable values
		5. Open the project and check the assembly instructions generated
			1. Open **.list** file

					int fun_add(int a, int b, int c, int d) {
					80002b0:	b480      	push	{r7}
					80002b2:	b087      	sub	sp, #28
					80002b4:	af00      	add	r7, sp, #0
					80002b6:	60f8      	str	r0, [r7, #12]
					80002b8:	60b9      	str	r1, [r7, #8]
					80002ba:	607a      	str	r2, [r7, #4]
					80002bc:	603b      	str	r3, [r7, #0]
						int result = a + b + c + d;
					80002be:	68fa      	ldr	r2, [r7, #12]
					80002c0:	68bb      	ldr	r3, [r7, #8]
					80002c2:	441a      	add	r2, r3
					80002c4:	687b      	ldr	r3, [r7, #4]
					80002c6:	4413      	add	r3, r2
					80002c8:	683a      	ldr	r2, [r7, #0]
					80002ca:	4413      	add	r3, r2
					80002cc:	617b      	str	r3, [r7, #20]
						return result;
					80002ce:	697b      	ldr	r3, [r7, #20]
					}
					80002d0:	4618      	mov	r0, r3
					80002d2:	371c      	adds	r7, #28
					80002d4:	46bd      	mov	sp, r7
					80002d6:	bc80      	pop	{r7}
					80002d8:	4770      	bx	lr
						...
					
					080002dc <main>:
					
					int main(void)
					{
					80002dc:	b580      	push	{r7, lr}
					80002de:	b082      	sub	sp, #8
					80002e0:	af00      	add	r7, sp, #0
						int ret;
						ret = fun_add(1, 2, 3, 4);
					80002e2:	2304      	movs	r3, #4
					80002e4:	2203      	movs	r2, #3
					80002e6:	2102      	movs	r1, #2
					80002e8:	2001      	movs	r0, #1
					80002ea:	f7ff ffe1 	bl	80002b0 <fun_add>
					80002ee:	6078      	str	r0, [r7, #4]
						printf("%d\n", ret);
					80002f0:	6879      	ldr	r1, [r7, #4]
					80002f2:	4802      	ldr	r0, [pc, #8]	; (80002fc <main+0x20>)
					80002f4:	f000 f900 	bl	80004f8 <iprintf>
					    /* Loop forever */
						for(;;);
					80002f8:	e7fe      	b.n	80002f8 <main+0x1c>
					80002fa:	bf00      	nop
					80002fc:	080013b4 	.word	0x080013b4
			

### Stack Activities During Interrupt and Exception ###
1. To allow 'C' function to be used as exception/ interrupt handler
	1. Exception mechanism needs to save R0 to R3, R12, LR, and XPSR at exception entrance automatically and restore them at exception exit under control of processor hardware
	2. This way, when returned to the interrupted program, all registers would have same value as when interrupt entry sequence started
2. Processor saves the following since there is no caller for interrupt or exception handler
	1. An interrupt or exception handler can be written as normal 'C' function without worrying about AAPCS rules
		1. R0, R1, R2, R3, R12, LR, PC, XPSR
3. In normal function calls: Some registers have to be saved by caller, some registers have to be saved by the callee (AAPCS rules)
4. Interrupt/ exception handler
	1. They are asynchronous in nature
	2. They can occur at any time
	3. Processor hardware calls them (when interrupt or exception occurs)
		1. Processor will take the responsibility of saving the registers and restoring
			1. This is called **Stack Frame**
5. Suppose a task is running (it is using MSP)
6. An interrupt arrives
7. Stacking is done by processor automatically

		xPSR (higher address)
		return address (PC)
		LR
		R12
		R3
		R2
		R1
		R0 <- MSP (lower address)
		
	1. Stack frame
		1. xPSR - status register

8. Processor then calls exception handler
9. Processor moves to Handler Mode
10. When processor finishes executing handler code, it un-stacks
	1. Restores stack frame to registers
11. Processor then returns to the interrupted task
12. Stack Initialization
	1. Before reaching main
		1. `main` is the point where user application starts
		2. Stack must be initialized
			1. Done by processor by reading the first location of the vector table
				1. Ensure that first location of the vector table holds valid value for the stack pointer register (taken care by startup code)
	2. After reaching main function
		1. Re-initialize stack pointer (optional) - this can be done only after reaching main
			1. We may want to shift to another memory
				1. SRAM3
				2. External RAM (connected to microcontroller)
	2. Stack initialization tips
		1. Evaluate target application
			1. Decide the amount of stack that would be needed for worst-case scenario of application run time
			2. Know processor's stack consumption model (FD, FA, ED, EA)
			3. Decide stack placement in RAM (middle, end, external memory)
				1. Can be adjusted using linker script
			4. In many applications
				1. Second stage stack init may be required
					1. Example: We want to allocate stack in external SDRAM
						1. Start with internal RAM
						2. Initialize SDRAM in main or startup code
						3. Change stack pointer to point to SDRAM
			5. If using ARM Cortex Mx processor
				1. Ensure first location of vector table contains initial stack address (MSP)
					1. Startup code usually does this
			6. We can use linker script to decide the stack, heap and other RAM area boundaries
				1. Startup code usually fetches boundary info from linker scripts
			7. In RTOS scenario
				1. Kernel code may use MSP to trace it's own stack and configure PSP for user task's stack

## Exception Model of ARM Cortex Mx Processor ##
### Exception Model ###
1. Cortex M Processor Exception Model:
	1. M0/M1/M3/M4/M7
2. What is exception?
	1. Anything which disturbs the normal operation of the program by changing the operational mode of the processor
	2. There are two types of exceptions
		1. System exceptions
		2. Interrupts
3. What are system exceptions?
	1. Generated by the processor itself internally.
	2. Interrupts come from the external world to the processor
4. Exceptions = System exceptions + Interrupts
	1. Whenever processor core meets with an exception it changes the operational mode to "Hanlder Mode" (this is the only whay to change the mode during execution)
5. System exceptions: 15 system exceptions are supported by Cortex M processors
6. Interrupts: 240 interrupts are supported
7. Total: 255 exceptions

### Different System Exceptions ###
1. System exceptions:
	1. There is room for 15 system exceptions
	2. Exception 1 - reset exception (or reset system exception)
	3. Only 9 implemented system exceptions (in hardware)
		1. 6 are reserved for future implementations
	4. Exception 16 - interrupt 1 (IRQ 1)
2. Go to Generic User Guide
	1. Exception Model
		1. Exception types
			1. Reset
				1. Invoked on power up reset (reset circuitry will trigger reset when powered on - causing exception)
				2. Warm reset - pressing reset button
				3. Reset handler will get triggered (reaches main function)
				4. When reset asserted: Operation stop at any instruction
				5. When reset de-asserted: Execution restarts from address provided by reset entry in vector table
					1. Starts at privileged execution in Thread mode (Reset handler is always in thread mode but privileged)
			2. NMI
				1. Non Maskable Interrupt
					1. Can be signalled by a peripheral or triggerd by software (any exception can be triggered by a software)
					2. Highest priority exception (next to reset)
					3. It is enabled permanently
					4. Fixed priority: -2
					5. Properties
						1. Cannot be disabled or masked
						2. Cannot be prevented from activation by any other exception
						3. Cannot be pre-empted by any exception (except Reset)
			3. HardFault
				1. Occurs 
					1. Because of an error during exception processing OR
						1. Already in exception handler & execute illegal instruction (code access or execution)
					2. Because exception cannot be managed by any other exception mechanism
						1. If T-bit is 0, and we try to execute an instruction
							1. UsageFault Exception should be triggered
								1. If this is not configured, the exception will be escalated and HardFault will be triggered
					3. Default exception handler
				2. Fixed priority: -1
					1. Higher priority than any exception with configurable priority
			4. MemManage
				1. Exception that occurs due to memory protection fault
					1. If code tries to access protected memory (if we enable memory protection unit to guard memories)
						1. RTOS: Kernel code can restrict user applications or tasks from touching certain memories
							1. If user program tries to read or write to the memory, MemManage exception will be triggered
								1. RTOS can end the task or take any other action
			5. BusFault
				1. Rare
				2. Occurs because of Bus errors (memory related fault for instruction or data memory transaction)
					1. Might be from error detected on a bus in memory system
			6. UsageFault
				1. Due to fault related to instruction execution
					1. Undefined instruction
						1. T-bit = 0 (Processor thinks it is ARM instruction but it is not - undefined instruction)
					2. Illegal unaligned access
					3. Invalid state on instruction execution
					4. Error on exception return
				2. Cause (when core is configured to report them - we can configure core to report the following activities - reporting: Triggering UsageFault exception)
					1. Unaligned address on word and halfword memory access
					2. Division by zero
			7. Reserved (7-10)
			8. SVCall (to help RTOS - for efficient design)
				1. Supervisor Call (SVC)
					1. Triggered by `SVC` instruction
				2. In OS environment, apps can use `SVC` instruction to access **OS Kernel functions** and **device drivers**
					1. Privileged Kernel code
					2. Unprivileged tasks
						1. Since peripherals will be considered as restricted resourced (only accessible by kernel - memory say)
						2. The tasks can request service from kernel
							1. `SVC` instruction is executed along with service number
								1. `SVC` exception is caused and processor will move to handler mode and `SVC` handler will run in kernel mode
									1. `SVC` number will be decoded and approprate service will be provided
					3. This is used to implement System Call interface layer (API)
			9. Reserved (12-13)
			10. PendSV (to help RTOS - for efficient design)
				1. It is OS friendly exception given in ARM Cortex Mx processor
				2. Used for context switching in OS (FreeRTOS, OpenRTOS)
					1. Check source code
				3. Interrupt driven request for system-level service
					1. Use for context switching when no other exception is active
			11. SysTick (to help RTOS)
				1. System exception triggered by system timer (peripheral - inside the processor) when it reaches zero
					1. Software can also trigger SysTick exception
						1. In OS environment, processor can use the exception as system tick
							1. In RTOS or Embedded OS - Can be used to implemented Kernel ticking (context switching, blocking call, ...)
				2. SysTick timer - can be used to generate interrupts at fixed time interval
					1. Can be used like any other TIMER peripheral
			12. IRQ-1 (exception 16)
			13. ...

### System Exception Vector Address ###
1. Where to store vector addresses of exceptions in vector table
	1. 0x0000 0000 - MSP value
	2. 0x0000 0004 - Reset Handler address is stored here
	3. 0x0000 0008 - NMI Handler address is stored here
	4. 0x0000 000C - Hard Fault Handler address is stored here
	5. 0x0000 0010 - MemManage Handler address is stored here
	6. 0x0000 0014 - BusFault Handler address is stored here
	7. 0x0000 0018 - UsageFault Handler address is stored here
	8. 0x0000 002C - SVCall Handler address is stored here
	9. 0x0000 0030 - Debug Monitor Handler address is stored here
	10. 0x0000 0038 - PendSV Handler address is stored here
	11. 0x0000 003C - SysTick Handler address is stored here

### System Exception Control Registers ###
1. Control registers of the processor to control system exceptions of the processor
	1. Peripherals
		1. NVIC
		2. FPU
		3. MPU
		4. SCB (System Control Block)
		5. SYSTICK TIMER
		6. DEBUG (unit)
		7. ...
	2. The peripherals come with their own register set to control them
		1. The register sets (both processor and peripheral) are part of PPB (Private Peripheral Bus) region
			1. PPB Region:
				1. Address Map exists for Private Peripheral Bus (PPB)
					1. 0xE000E008-0xE000E00F - SyStem Control Block
					2. 0xE000E010-0xE000E01F - System timer
					3. 0xE000E100-0xE000E4EF - Nested Vectored Interrupt Controller
					4. 0xE000ED00-0xE000ED3F - System Control Block
					5. 0xE000ED90-0xE000ED93 - MPU Type Register
					6. 0xE000ED90-0xE000ED88 - Memory Protection Unit
					7. 0xE000EF00-0xE000EF03 - Nested Vectored Interrupt Controller
					8. 0xE000EF30-0xE000EF44 - Floating Point Unit
2. System Control Block (SCB)
	1. SCB provides system implementation information and system control
		1. Includes
			1. Configuration of system exceptions
			2. Control of system exceptions
			3. Reporting of system exceptions
	2. It contains registers to configure and control some of system specific functionality of ARM Cortex Mx processor
		1. Configure system exceptions
		2. Enable or disable system exceptions
		3. Configure priority for system exceptions
	3. ARM Cortex M4 Generic User Guide - reference
		1. Address map of private peripheral bus
			1. System Control Block
				1. Registers
					1. SHPR1 - System Handler Priority Register 1
					2. SHPR2 - System Handler Priority Register 2
					3. SHPR3 - System Handler Priority Register 3
					4. SHCRS - System Handler Control and State Register
						1. The above are used to configure priority of system exceptions (not interrupts - NVIC will handle that)
							1. SCB is for system exceptions and other control related settings
						2. This register can be used to enable system exceptions

								MEMFAULTACT	[0]
								BUSFAULTACT	[1]
								Reserved		[2]
								USBFAULTACT	[3]
								Reserved 		[4-6]
								SVCALLACT		[7]
								MONITORACT	[8]
								Reserved		[9]
								PENDSVACT		[10]
								SYSTICKACT	[11]
								USGFAULTPENDED [12]
								MEMFAULTPENDED [13]
								BUSFAULTPENDED [14]
								SVCALLPENDED   [15]
								MEMFAULTENA    [16]
								BUSFAULTENA    [17]
								USGFAULTENA    [18]
								Reserved 		[19-31]
						
					5. BFSR - BusFault Status Register
					6. UFSR - UsageFault Status Register
					7. HFSR - HardFault Status Register
					8. MMAR - MemManage Fault Address Register
					9. BFAR - BusFault Address Register
					10. AFSR - Auxiliary Fault Status Register
						1. The above are used to capture status of the faults
							1. At what address the fault happened
							2. What was the cause of the fault
							3. ...
3. SCB Usage
	1. System exception configuration
	2. Vector table offset configuration
	3. Set priority of system exceptions
	4. System specific settings
4. SCB Registers
	1. We can enable fault handlers
	2. Get pending status of fault exceptions
	3. Trap processor for divide by zero and unaligned data access attempts
	4. Control sleep and sleep wakeup settings
	5. Configure priority of system exceptions
	6. Systick timer control and status
4. Default System Exception Status
	1. Hard Fault - Always enabled by default - can be masked (disabled)
	2. NMI - Always enabled, cannot be masked
	3. Usage fault - Disabled by default
	4. Mem manage fault - Disabled by default
	5. Bus fault - Disabled by default
	6. Systick exception - Disabled by default and triggers whenever systick timer is enabled and expires
		1. Systick Timer triggers this exception
	7. SVC exception - Triggers only when `svc` instruction is executed
	8. PendSV exception - Disabled by default
	9. Debug monitor exception - Disabled by default

### NVIC ###
1. NVIC - Nested Vectored Interrupt Controller
	1. It is one of the peripherals of Cortex M processor core
		1. Processor core is connected to NVIC peripheral (To control interrupt traffic that comes to the processor)
	2. It is used to configure 240 interrupts (external to processor - not inside processor or core)
	3. Using NVIC registers, we can 
		1. Enable/ disable/ pend various interrupts
			1. Cortex M processor supports 240 interrupts
			2. The interrupts are managed and configured using NVIC
			3. What are the 240 interrupts?
				1. Can be anything external to processor core (reference manual of microcontroller - STM32)
					1. Vector Table section
						1. Defines the interrupts (on-chip but external)
							1. TIMERs
							2. CAN
							3. DMA
							4. UART
							5. SPI
							6. ...
							7. FPU (82)
						2. TIs microcontroller
							1. 154 interrupts are defined
				2. This is highly vendor specific and it is triggered by various on chip peripherals of MCU like SPI, GPIOs, CAN, TIMERs, DMAs, ...
					1. STM32 - 83 different interrupts
				3. Interrupts

						STM
							WD	<-  0  -> NVIC <-> Core
								<-  1  ->
						   			...
						   I2C <-	54	->
								<- 239 ->
								
					1. IRQ0 - WatchDog
					2. IRQ54 - I2C
					3. 240 lines are connected to NVIC engine
				
		2. Read status of active and pending interrupts
	4. We can configure priority and priority grouping of various interrupts (later)
	5. It is called "Nested" because
		1. It supports pre-empting (temporarily stopping) lower priority interrupt handler when higher priority interrupt arrives
2. ADC(1, 2, 3 - global interrupts) - IRQ18

### NVIC Registers ###
1. Enabling/ Disabling/ Pending of Interrupts
	1. Nested Vectored Interrupt Controller
		1. Interrupt Set-Enable register
			1. 8 such registers (to cover 240 interrupts)
				1. NVIC_ISER0 - NVIC_ISER7 (32 bits each)
			2. NVIC_ISER0 - first 32 interrupts can be enabled
			3. NVIC_ISER1 - 32 - 63 interrupts can be enabled
			4. ...
			5. Values:
				1. Write:
					1. 0 - no effect (cannot be used to disable 
					2. 1 - enable interrupt
				2. Read
					1. 0 - interrupt disabled
					2. 1 - interrupt enabled
		2. Interrupt Clear-enable Register
			1. NVIC_ICER0-NVIC_ICER7
				1. Write:
					1. 0 - no effect
					2. 1 - disable interrupt
				2. Read:
					1. 0 - interrupt disabled
					2. 1 - interrupt enabled
		3. Interrupt Set-pending Registers
			1. NVIC_ISPR0-NVIC_ISPR7
				1. They force interrupts into pending state (?)
					1. It enabled processor to check the priority of the pended interrupts (sys exceptions) and will call respective interrupt handler based on priority level of the pended interrupts (system exceptions)
				2. They also show which interrupts are pending
				3. Write:
					1. 0 - no effect
					2. 1 - changes interrupt state to pending
				4. Read:
					1. 0 - interrupt is not pending
					2. 1 - interrupt is pending
		4. Interrupt Clear-pending Registers
			1. NVIC_ICPR0 - NVIC_ICPR7
				1. To remove pending state from interrupts
				2. To show which interrupts are pending
				3. Write:
					1. 0 - no effect
					2. 1 - removes pending state of an interrupt
				4. Read:
					1. 0 - interrupt is not pending
					2. 1 - interrupt is pending
		5. Interrupt Active Bit Registers
			1. NVIC_IABR0 - NVIC_IABR7 - indicates which interrupts are active
				1. 0 - interrupt is not active
				2. 1 - interrupt is active
			2. When processor is servicing an interrupt (running interrupt handler), it makes the active bit corresponding to the interrupt as 1 which signals that the interrupt is currently serviced by the processor
				1. Indicates which interrupt handler is currently executed by the processor

### Peripheral Interrupt Exercise ###
1. Exercise-Enabling and Pending of USART3 Interrupt

		USART3 --39-> NVIC <-> CPU
		
	1. IRQ39
	2. USART3 - vendor specific
		1. Check Vector Table info
2. Steps to program an MCU peripheral interrupt
	1. Identify IRQ number of the peripheral by referring to MCU vector table
		1. IRQ numbers are vendor-specific
	2. Program the Processor register to enable that IRQ (Configuring NVIC interrupt register)
		1. Only when the IRQ is enabled, the processor will accept the interrupt over that line
		2. Set the priority (optional)
			1. If using priority, first set priority and then enable the IRQ (by default all interrupts have priority 0)
	3. Configure peripheral (USART3) using its peripheral configuration register
		1. Example: For USART3, whenever a packet is received, it will issue an interrupt on IRQ line 39
			1. This has nothing to do with processor
				1. How and when a peripheral should trigger an interrupt depends on the peripheral
					1. USART3 - triggers when packet is received
					2. TIMER - triggers when timer count is expired
					3. ADC - triggers when conversion is over
				2. The trigger should be configured on the peripheral side register (when and how)
					1. By default, peripherals do not trigger an interrupt
						1. Configure ADC to trigger after conversion
						2. Configure USART to trigger when RX buffer is filled (RX Buffer Full Interrupt)
	4. When interrupt is issued on IRQ line
		1. It will first get pended in pending register of processor
			1. Pending register of NVIC
	5. NVIC will allow the IRQ handler associated with IRQ number to run only if priority of new interrupt is higher than currently executing interrupt handler.
		1. Or else, newly arrived interrupt will stay in pending state
	6. If peripheral issues an interrupt when IRQ number is disabled (not activated from processor side)
		1. Interrupt will still get pended in pending register of NVIC
			1. The execution is triggered as soon as IRQ is enabled if priority is higher than currently active ISR
3. Flow:

		NVIC
			IRQ enable = 1
					|		 (4)		CPU
					+- AND ----> 1) Fetch the ISR
					|				   address from
			||||||||| PR			   vector table
				^					2) PC jumps to ISR -(5)-> ISR
		(3) Interrupt pends in pending reg of NVIC      {
				|								               Copy data from
			USART Rx buffer					               rx buffer to
				^	USART peripheral issues	interrupt (2)  SRAM
				|								               }
		_______________________________________________________________
				^
				|
			Data packet arrives
			from external world in
			to USART peripheral
			buffer (1)
			
	1. An event triggers the flow
	2. Flow:
		1. When data packet arrives from external world in to USART peripheral buffer
		2. When RX buffer is full, it triggers an interrupt
			1. It makes IRQ line high or low
		3. Interrupt sets pending state in pending state register of NVIC
		4. If IRQ is enabled (for the IRQ number)
			1. Output = 1
				1. It will interrupt the processor
		5. When interrupt is accepted by CPU
			1. Fetches ISR address from the vector table
			2. PC jumps to ISR
		6. ISR
			1. Copy data from rx buffer to SRAM
4. Peripheral programming
	1. Peripheral programming such as UART, SPI, TIMER - out of scope of the course
	2. Covered in MCU1 and MCU2 courses
		1. Masterning Microcontroller courses (driver development, TIMERS, PWM, CAN, RTC, LOW POWER)
5. USART 3 interrupting the processor in STM32F4x MCU
	1. USART interrupt mapping diagram

			TC
			TCIE
			TXE
			TXEIE
			CTSIF         OR ----------------+
			CTSIE                            |
			IDLE                             |
			IDLEIE     -----------------+    |
			RXNEIE                      |     OR -> USART interrupt
			ORE                         |    |
			RXNEIE                      |    |
			RXNE                        |    |
			PE                          |    |
			PEIE                        |    |
			LBD ---|                    |    |
			LBDIE--|AND ----------------|    |
			FE  ---|                         |
			NE  ---|AND ----------------| OR-+
			ORE ---------| 
					EIE --| AND ---------|
					DMAR--|
					
	1. LHS - various events that can occur in USART
	2. All the events are mapped to one output line to deliver interrupt
	3. The line is connected to NVIC
	
### Peripheral Interrupt Exercise Contd. ###
1. New project > USART3_int_pend

		#define USART3_IRQNO 39
		
		void USART3_IRQHandler(void);

		int main(void) {
			//1. Manually pend the pending bit for the USART3 IRQ number in NVIC
			uint32_t *const pISPR1 = (uint32_t *const) 0xE000E204; // Show View > SFR > NVIC
			
			*pISPR1 |= (1 << (USART3_IRQNO % 32));
			
			//2. Enable the USART3 IRQ number in NVIC
			uint32_t *const pISER1 = (uint32_t *const) 0xE000E104;
			*pISER1 |= (1 << (USART3_IRQNO % 32)); // interrupt gets triggered
			
			for(;;);
		}
		
		// Implement ISR
		void USART3_IRQHandler(void) {
			printf("in USART3 ISR\n");
		}
		
	1. Calculation: Do mod
		1. 39 % 32 = 7
	2. Once processor accepts interrupt, the pending state will be cleared automatically

## Interrupt Priority and Configuration ##
### Interrupt Priority Explanation ###
1. Interrupt priority and config
	1. What is priority?
	2. What is priority value?
	3. Different programmable priority levels
	4. Explore priority registers for interrupts (IRQs)
	5. Explore priority registers for system exceptions
	6. Pre-empt priority and sub priority
2. What is priority?
	1. Priority means urgency
3. What is priority value?
	1. Priority value is a measure of urgency (decides how urgent from others)
4. Relation between priority value & priority

		Priority value = 5
		ADC ------->|      |
		            | NVIC |<--->| CPU |
		TIMER ----->|      |
		Priority value = 4
		
	1. In this case, TIMER peripheral priority value is lesser than priority value of ADC
		1. TIMER interrupt is more URGENT than ADC interrupt
			1. TIMER priority is HIGHER than ADC priority
	2. If both interrupt hits NVIC at the same time, NVIC allows TIMER interrupt first
		1. TIMER ISR will be executed first by processor
	3. Priority is synonymous with "priority value"
		1. Priority of IRQ0 is 4
5. In ARM Cortex Mx
	1. Lesser the priority value, higher the priority (urgency)
6. Different priority levels
	1. Priority values are also called as priority levels
	2. How many different priority levels are there in ARM Cortex Mx processor?
		1. Depends on interrupt priority register implemented by MCU vendors
		2. STM32F4x MCU has 16 different priority levels
		3. TI TM4C123Gx has 8 different priority levels
7. Interrupt Priority Register of ARM Cortex Mx processor
	1. It is part of NVIC register set
		1. Using these registers, we can configure priority levels of interrupts (IRQs) only
			1. There are 60 interrupt priority registers (240 IRQs)
		2. Generic User Guide
			1. IPR0 - IPR59
				1. IPR0 - for 4 IRQs (60 x 4 = 240)
					1. IRQ0 - 8 bits

							bit 7 bit 6 bit 5 | bit 4-0
								implemented     not implemented
					
					2. IRQ1 - 8 bits
					3. IRQ2 - 8 bits
					4. IRQ3 - 8 bits

			2. How many bits are implemented depends on microcontroller vendor

					Bit 7 - 5: 8 priority levels
					Bit 7 - 4: 16 priority levels
					
						0x00, 0x10, 0x20, ... 0xf0
						
				1. For system exceptions, look into System Control Block (SCB)
					1. Not NVIC
					2. System Handler Priority Registers (1, 2, 3)

### Pre-Empt and Sub Priority ###
1. What if two interrupts of the same priority hit the processor at the same time?
	1. The sub-priority value of the interrupts will be checked to resolve the conflict.
		1. Interrupt with lower sub-priority will be allowed first
2. Priority Grouping
	1. Pre-Empt Priority:
		1. When processor is running interrupt handler, another interrupt appears, then
			1. pre-empt priority values will be compared
			2. Interrupt with higher pre-empt priority (less value) will be allowed to run
	2. Sub Priority:
		1. Values is used when two interrupts with same pre-empt priority values occur at same time
			1. Exception with higher sub priority (less in value) will be handled first
	3. Priority Group, Pre-empt priority field, sub-priority field
		1. 0 (default), Bit[7:1], Bit[0]
		2. 1, Bit[7:2], Bit[1:0]
		3. 2, Bit[7:3], Bit[2:0]
		4. 3, Bit[7:4], Bit[3:0]
		5. 4, Bit[7:5], Bit[4:0]
		6. 5, Bit[7:6], Bit[5:0]
		7. 6, Bit[7:7], Bit[6:0]
		8. 7, None, Bit[7:0]
3. Interrupt priority register
	1. 0: 
		1. bit 7 to bit 1 - pre-empt priority
		2. bit 0 - sub priority
4. Application Interrupt and Reset Control Register
	1. Used to control Priority Group
		1. 10-8: PRIGROUP (default is 0)
5. Case 1:
	1. When priority group = 0
		1. As per table we have
			1. pre-empt priority width = 7 bits (128 programmable priority levels)
				1. But only 3 bits are implemented (remaining 4 bits are not implemented)
					1. 8 programmable priority levels
			2. Sub-priority width = 1 (2 programmable sub priority levels)
				1. Bit 0 is not implemented so no sub priority levels
6. Case 2:
	1. When priority group = 5
		1. Pre-empt priority width = 2 bits (4 programmable priority levels)
		2. Sub-priority width = 6 (64 programmable sub priority levels)
			1. Since only 1 bit is implemented, only 2 programmable sub priority levels
7. What if two interrupts of same pre-empt priority and sub priority hit the processor at the same time?
	1. Interrupt with the lowest IRQ number will be allowed first
		1. TIMER2 - IRQ28 - allowed before I2C1 (if both pre-empt priority and sub-priority are the same)
		2. I2C1 - IRQ31

### Interrupt Priority Configuration Exercise ###
1. Generate below peripheral interrupts using NVIC interrupt pending register and observe the execution of ISRs when priorities are same and different
	1. TIM2 global interrupt
	2. I2C1 global interrupt
2. Program

		#define IRQNO_TIMER2 28
		#define IRQNO_I2C1 31
		
		void TIM2_IRQHandler(void);
		void I2C1_EV_IRQHandler(void);
		
		//...
		uint32_t *pNVIC_IPRBase = (uint32_t*) 0xE000E400;
		uint32_t *pNVIC_ISERBase = (uint32_t*) 0xE000E100;
		uint32_t *pNVIC_ISPRBase = (uint32_t*) 0xE000E200;
		
		configure_priority_for_irqs(uint8_t irq_no, uint8_t priority_value) {
			// 1. find out iprx
			uint8_t iprx = irq_no / 4;
			uint32_t* ipr = pNVIC_IPBase + iprx;
			
			// 2. position in iprx
			uint8_t pos = ((irq_no % 4) * 8);
			
			// 3. configure the priority
			*ipr &= ~(0xFF << pos); // clear
			*ipr |= (priority_value << pos); // set priority
		}
		
		int main(void) {
			// 1. Lets configure priority for the peripherals
			configure_priority_for_irqs(IRQNO_TIMER2, 0x80);
			configure_priority_for_irqs(IRQNO_I2C1, 0x80);
			
			// 2. Set the interrupt pending bit in the NVIC PR
			*pNVIC_ISPRBase |= (1 << IRQNO_TIMER2);
			
			// 3. Enable IRQs in NVIC ISER
			*pNVIC_ISERBase |= (1 << IRQNO_I2C1);
			*pNVIC_ISERBase |= (1 << IRQNO_TIMER2);
		}
		
		// ISRs
		void TIM2_IRQHandler(void) {
			printf("[TIM2_IRQHandler]\n");
			*pNVIC_ISPRBase |= (1 << IRQNO_I2C1); // Priority is not higher - ISR will not get executed
			while (1);
		}
		
		void I2C1_EV_IRQHandler(void) {
			printf("[I2C1_EV_IRQHandler]\n");
		}
		
	1. Priority configuration should be done before enabling the interrupt (good practice)
	2. Calculation: IPRx
		1. IRQ / 4
			1. 5 / 4 = 1 - IPR1
		2. (IRQ % 4) x 8
			1. (5 % 4) x 8 = 8 (left shift by 8)
3. Debug the code
	1. Increase the priority of I2C1
		1. 0x70
			1. Goes to I2C handler (lower priority interrupt handler got pre-empted)

### Pending Interrupt Behavior ###
1. Case 1: Single Pending Interrupt

								 _____________________
								 |				        |
		Interrupt Request  --                     ----------------
		                        _______
		                        |     |
		Interrupt Pending  -----       ---------------------------
		Status
		                               __________________
		                           .                        .
		Processor Mode     -----                               ---
		
		                               __________________
		                              |                  |
		Interrupt Active   -----------                    --------
		Status Bit
		
		Processor           th  |     |        ISR       |     | th
		Operation                  ^                        ^
		                           |                        |
		                        stacking               unstacking
		                        
2. Case 2: Double Pended Interrupt
	1. Suppose second IRQ request is pended when processor is executing ISR
	2. When processor returnes from ISR
		1. The processor immediately enters ISR (since another interrupt is pending)
		2. Pending bit is cleared for the new interrupt
		3. Interrupt Active Status goes high again

## Exception Entry and Exit Sequences ##
### Exception Entry and Exit Sequences ###
1. Entry Sequence:
	1. Pending bit set (in Pending Register of NVIC)
	2. Stacking and Vector Fetch (simultaneously)
		1. Stacking: Pushing registers onto stack
		2. Vector fetch: Fetching address of exception handler from vector table
	3. Entry into the handler and active bit set (NVIC reg)
	4. Clears pending status (processor does it automatically)
	5. Now processor mode changed to handler mode
	6. Now handler code is executing
	7. The MSP will be used for any stack operations inside the handler
2. Exit Sequence:
	1. In Cortex-M3/M4 processors, exception return mechanism is triggered using special return address called EXC_RETURN
		1. EXC_RETURN - it is value generated during exception entry and is stored in LR
	2. When EXC_RETURN is written to PC, it triggers the exception return
3. EXC_RETURN
	1. When is it generated?
		1. During exception handler entry, value of return address (PC) is not stored in LR as it is done during calling of a normal C function
			1. Exception mechanism stores the special value called EXC_RETURN in LR (at entry of exception)
	2. Decoding EXC_RETURN value
	
			Bits	Description				Values
			31:28	EXC_RETURN indicator	0xF
			27:5	Reserved (all 1)			0xEFFFFF
			4		Stack frame type			always 1 when floating point unit is available
			3		Return mode				1 = return to thread mode
												0 = return to handler mode
			2		Return stack				1 = return with PSP
												0 = return with MSP
			1		Reserved					0
			0		Reserved					1
			
		1. 2, 3 - updated during entry
			1. Captures operation mode and stack that was in use before start of handler execution
			2. Processor decodes and understand mode and stack
		2. Flow chart

				Exception return trigger
					|						
					EXC_RETURN[2] = 0 - Un-stacking using MSP (CONTROL[1] = 0)
					|
					EXC_RETURN[2] = 1 - Un-stacking using PSP (CONTROL[1] = 1)				|
					Resume program execution

4. Possible values
	1. 0xFFFFFFF1 - Return to Handler Mode, Exception return gets state from main stack, execution uses MSP after return
	2. 0xFFFFFFF9 - Return to Thread Mode, Exception return gets state from main stack, execution uses MSP after return
	3. 0xFFFFFFFD - Return to Thread Mode, Exception return gets state from process stack, execution uses PSP after return
	4. All other values - reserved	

### Analyzing Stack Contents During Exception Entry and Exit ###
1. New Project > Exception_entry_exit
	1. Copy the code which generates interrupt
		1. When interrupt is triggered, stack frame will be pushed to the stack (by hardware)
			1. xPSR
			2. Return address (PC)
			3. LR
			4. R12
			5. R3
			6. R2
			7. R1
			8. R0
		2. Go to memory browser
		3. It is state of thread mode code
		4. In interrupt handler
			1. LR is loaded with EXC_RETURN
			2. EXC_RETURN is written to PC while exiting
				1. This triggers retrieval of state from MSP (or PSP)
	2. Changing Thread Mode SP to PSP

			int control_reg = 0x2;
			uint32_t psp_value = 0x20008000;

			__asm volatile ("msr PSP, %0"::"r"(psp_value));
			__asm volatile ("msr CONTROL, %0"::"r"(control_reg));
			
		1. EXC_RETURN - 0xFFFFFFFD (PSP)

## Fault Handling and Analysis ##
### Introduction to Processor Faults ###
1. What is a fault?
	1. The fault is an exception generated by the processor (system exception) to indicate an error
2. Why fault occurs?
	1. Fault occurs because programmers are violating the design rules or may be due to interfaces with which processor deals (Memory say)
	2. Whenever fault occurs
		1. Internal processor registers will be updated to record
			1. Type of fault
			2. Address of instruction at which fault occured
			3. If an associated exception is enabled,
				1. Exception handler will be called by the processor
					1. In exception handler, programmers may implement code to report, resolve or recover from fault
						1. Example: If code tries to divide a number by zero, then divide by 0 fault will be raised from hardware
							1. This will invoke usage fault exception handler (if enabled)
							2. In exception handler, we may make certain decisions to get rid of the problem (closing task etc...)
		2. Most times, fault occurs due to programmer's code not adhering to processor programming guidelines
			1. If we don't, then exception will be triggered
3. Summary of ARM Cortex Mx System Exceptions
	1. 15 System exceptions (No 1 to 15)
		1. 9 implemented (rest reserved)
			1. Reset - -3 (fixed)
			2. NMI - -2 (fixed)
			3. HardFault -1 (fixed) - fault exception (raised whenever there is a fault in the processor)
			4. MemManage - fault exception
			5. BusFault - fault exception
			6. UsageFault - fault exception
4. Different types of fault exceptions in Cortex Mx processor
	1. Hard fault exception (enabled by default, non-configurable priority)
		1. Can be disabled by code using FAULTMASK register
	2. Usage fault exception (disabled by default, configurable priority - default priority 0)
	3. Mem manage fault exception (disabled by default, configurable priority - default priority 0)
	4. Bus fault exception (disabled by default, configurable priority - default priority 0)
5. Causes of fault
	1. Divide by zero (if enabled - divide by zero trap)
	2. Undefined instruction (if processor doesn't understand how to decode the instruction)
	3. Attempt to execute code from memory region which is marked as execute never (XN) to prevent code injection
		1. Example: Peripheral region (XN)
			1. Attribute of mem region is XN
				1. If PC tries to load instruction from the region
	4. MPU guarded memory region access violation by the code
		1. We can impose access rules using the unit
	5. Unaligned data access (if enabled)
	6. Returning to thread mode keeping active interrupt alive
		1. If interrupt is in active state, it must be finished
			1. We cannot keep it active and return to thread mode code
	7. Bus error (example no response from memory device (e.g. SDRAM)
		1. External mem interface
	8. Executing SVC instruction inside SVC handler or calling a function in SVC handler which eventually executes hidden SVC instruction (no nested SVC)
	9. Certain debug monitor settings and related exceptions

### Hardfault Exception ###
1. Hard-fault exception
	1. A hard fault is an exception that occurs because of
		1. An error during exception processing
		2. An exception cannot be managed by any other exception mechanism
		3. It has 3rd highest fixed priority (-1)
			1. After Rest and NMI
			2. Higher priority than any other configurable priority
	2. Causes
		1. Escalation of configurable fault exceptions
		2. Bus error returned during vector fetch (from vector table)
		3. Execution of break point instruction when both halt mode and debug monitor is disabled
		4. Executing SVC instruction inside SVC handler
2. Flow chart:

			| Configurable exceptions
			| (usage, mem manage, bus fault)
			v
		Is configurable
		exception enabled? - No -> Hardfault handler
			|				(Escalated to hardfault {FORCED})
			Yes
			|
			v
		Handled by configurble
		exception handlers
		
		Bus fault during vector fetch
		from vector table
			|
			Always escalated to hardfault
			|
			v
		Hardfault handler
		
	1. Example: If divide by zero exception occurs, it is usage fault exception
		1. If it is enabled, usage fault handler will be executed
		2. If it is disabled, then fault will be escalated to HardFault exception (HardFault exception handler is executed)
3. Scenario 2:

		(Thread mode)
		Execution of SVC
		instruction
			|
			v
		(Handler mode)
		Execute SVC instruction
		(SVC handler)
			|
			v
		(Handler mode)
		Hard-fault handler
		
4. Execution of breakpoint instructions
	1. Suppose we have written software breakpoint instructions in the code to halt the processor
		1. If halt mode and debug setting are disabled in the processor
			1. Execution of breakpoint causes HardFault exception
5. Hard Fault Status Register
	1. Gives clear picture why hard fault exception got triggered
		1. Bit[1] - VECTTBL (vector table)
			1. If this is set - hard fault triggered due to fault in vector table read
				1. BusFault exception handler will not be executed by the processor even if it is enabled
					1. Always handled by HardFault handler
		2. Bit[30] - FORCED
			1. Forced hard fault - generated by excalation of fault with configurable priority that cannot be handled (either due to priority or because it is disabled)
		3. Bit[31] - DEBUGEVT
			1. Debug breakpoint is hit while halt mode and debug monitor disabled
	2. This register can be read to understand the exact cause of hardfault exception

### Other Configurable Faults ###
1. Mem Manage Fault Exception
	1. This is configurable fault exception
		1. Disabled by default
	2. This can be enabled by configuring processor register "System Handler Control and State Register (SHCSR)"
		1. Found in SCB (System Control Block)
			1. Bit[16] - MEMFAULTENA (make it 1)
	3. When mem manage fault occurs, mem manage fault exception handler will be executed by processor
	4. Priority of the fault exception is configurable
2. Causes
	1. Mem manage fault exception triggers when memory access violation is detected (access permission by the processor or MPU)
		1. During read and/or write
	2. Unprivileged thread mode code (such as user application or RTOS task) tries to access a memory region which is marked as "privileged access only" by the MPU
		1. MPU can be used to mark certain regions of memory as privileged access only
	3. Writing to memory regions which are marked as read-only by the MPU4
	4. Can also be triggered when trying to execute program code from "peripheral" memory regions
		1. Peripheral memory regions are marked as XN (eXecute Never) regions by processor design
			1. To avoid code injection attacks through peripherals
				1. Behavior of memory accesses (Manual) (cannot be changed)
					1. Peripheral - XN
					2. External device - XN
					3. Private Peripheral Bus - XN
					4. Device - XN
3. Bus Fault Exception
	1. Configurable fault exception
	2. Disabled by default
	3. This can be enabled by configuring processor register "System Handler Control and State Register (SHCSR)"
		1. Bit[17] - BUSFAULTENA
	4. When Bus-fault occurs
		1. Processor executes bus fault exception handler
	5. Priority of the fault exception is configurable
	6. Causes:
		1. Due to error response returned by processor bus interface during access to memory devices
			1. During instruction fetch
			2. During data read/ write to memory devices
		2. If bus error occurs during vector fetch
			1. It will be escalated to hard fault even if bus fault exception is enabled
		3. Mem device sends error response when processor bus interface tries to access invalid or restricted mem locations which could generate a bus fault
		4. When device is not ready to accept mem transfer
		5. We may encounter such issues if we play with external memories such as SDRAM connected via DRAM controllers
		6. Unprivileged access to private peripheral bus
			1. SCB registers
			2. NVIC registers
			3. Debug registers
			4. Example: thread mode code which is in un-privileged access level and tries to configure NVIC register
				1. It causes Bus Fault
4. Usage Fault Exception
	1. Configurable fault exception
	2. Disabled by default
	3. We can enable this exception by configuring processor register "System Handler Control and State Register (SHCSR)"
		1. Bit[18]: USGFAULTENA
	4. When usage fault occurs
		1. Processor executes usage fault exception handler
	5. Priority of the fault exception is configurable
	6. Causes:
		1. Execution of undefined instruction (Cortex M4 supports only thumb ISA, executing instruction outside this ISA (like ARM ISA) would result in fault)
		2. Executing floating point instruction keeping floating point unit disabled
			1. If HW floating point unit doesn't exist
			2. If HW floating point unit exists but it is not enabled
		3. Trying to switch to ARM state execute ARM ISA instructions
			1. T bit of processor decides ARM state or THUMB state.
				1. For Cortex M, it should be maintained at 1.
			2. Making T bit 0 (may happend during function call using function pointers whose 0th bit is not maintained as 1)
				1. Resutls in a fault
		4. Trying to return to thread mode when exception/ interrupt is still active
		5. Unaligned memory access with multiple load or multiple store instructions
		6. Attempt to divide by zero (if enabled, by default divide by zero results in zero)
		7. For all unaligned data access from memory (only if enabled, otherwise Cortex M supports unaligned data access)
			1. Only if we enable un-aligned data access trap and unaligned data access occurs

### Configurable Fault Exception Exercise-1 ###
1. Exercise
	1. Write a program to enable all configurable fault exceptions
	2. Implement fault exception handlers and cause the fault by following method
		1. Execute an undefined instruction
		2. Divide by zero
		3. Try executing instruction from peripheral region
		4. Executing SVC inside the SVC handler
		5. Executing SVC instruction inside interrupt handler whose priority is same or lesser than SVC handler
2. Program: (Refer to Cortex-M4 Devices Generic User Guide - System Control Block - System Handler Control and State Register)

		#include <stdint.h>
		#include <stdio.h>

		void main(void) {
			// 1. enable all configurable exceptions like usage fault, mem manage fault and bus fault
			uint32_t *pSHCSR = (uint32_t*) 0xE000ED24;
			*pSHCSR |= (1 << 16); // mem manage
			*pSHCSR |= (1 << 17); // bus fault
			*pSHCSR |= (1 << 18); // usage fault
			
			// 3. lets force processor to execute some undefined instructions
			uint32_t *pSRAM = (uint32_t*) 0x20010000;
			*pSRAM = 0xFFFFFFFF; // invalid opcode
			void (*some_address)(void);
			some_address = (void*)((uint32_t)pSRAM + 1); // Thumb ISA
			some_address();
			
			// 4. Analyze the fault
		}
		
		// 2. implement the fault handlers
		void HardFault_Handler(void) {
			printf("Exception: HardFault\n");
			while(1);
		}
		
		void MemManage_Handler(void) {
			printf("Exception: MemManage\n");
			while(1);
		}
		
		void BusFault_Handler(void) {
			printf("Exception: BusFault\n");
			while(1);
		}
		
		void UsageFault_Handler(void) {
			printf("Exception: UsageFault\n");
			while(1);
		}
		
	1. Open disassembly
		1. Contents of address `0x20011001` - `0xFFFFFFFF`
			1. `0x20011001` is copied into **PC**
		2. Open Show View > Fault Analyzer
			1. Attempt to execute an undefined instruction (UNDEFINSTR)
				1. Fetches certain status registers to understand the current status
		3. Exception Status Register - can be obtained for actual fault
2. Fault status and address information
	1. When a fault occurs, inside the fault handler, we can check a few of fault status and address info registers to get more details about 
		1. Fault
		2. Instruction address 
	2. At which fault occurred. 
	3. Helpful during debugging
	4. Registers:
		1. HardFault
			1. Status Register: HFSR
		2. MemManage
			1. Status Register: MMFSR
			2. Address Register: MMFAR (Instruction address)
		3. BusFault
			1. Status Register: BFSR
			2. Address Register: BFAR (Instruction address)
		4. UsageFault
			1. Status Register: UFSR
3. Print UFSR (SCB) (indicates cause of usage fault)
	1. Bit[0]: `UNDEFINSRT` - 1 (processor has attempted to execute an undefined instruction)

			void UsageFault_Handler(void) {
				uint32_t* pUFSR = (uint32_t*) 0xE000ED2A;
				printf("Exception: UsageFault\n");
				printf("UFSR = 0x%hx\n", (*pUFSR) & 0xFFFF);
				while(1);
			}
			
4. If LSB of instruction is 0
	1. INVSTATE - 1 (processor has attempted to execute an instrution that makes illegal use of EPSR
	
			uint32_t *pSRAM = (uint32_t*) 0x20010000; // bit[0] cannot be 0
			
		1. UFSR - 2 (INVSTATE = 1)

### Analyzing Stack Frame ###
1. What happens if exception triggers?

							   Hander mode
							 _____________________
							/  Usage fault handler
			____________/ <- stacking of thread mode context
			thread mode |
						  |
						  Exception triggers
						  (thread mode instruction
						   caused exception)
						   
	1. Stacking

			SP:      Previous stack content
			SP - 4:  XPSR
			SP - 8:  PC
			SP - 12: LR
			SP - 16: R12
			SP - 20: R3
			SP - 24: R2
			SP - 28: R1
			SP - 31: R0 <- SP[MSP] (top of stack after triggers)
			
		1. "No FPU" stack frame
		2. Useful to debug where fault got triggered
		3. We can print contents of Registers of the stack frame to understand the behaviour
			1. To get address of SP
				1. We have to use inline assembly

						__asm volatile ("mrs r0, MSP");
						register uint32_t msp_value __asm("r0"); // not be created on stack, any register will be used to hold the value
						uint32_t* pMSP = (uint32_t*) msp_value;
						printf("MSP = %p\n", pMSP);
						
					1. When code is at beginning of fault handler, the stack frame is where SP points to (no additional data is pushed)
					2. In disassembly
						1. There is prologe - compiler pushes contents and manipulates SP

### Configurable Fault Exception Exercise-2 ###
1. We need to write pure assembly function to fetch the value of SP (prologue is added when C function is called)
	1. Solution: Naked functions

			__attribute__((naked))
			
		1. The attribute tells the compiler that function is an embedded assembly function.
		2. We can write the body of the function entirely in assembly code using `__asm` statements
		3. Compiler does not generate prologue and epilogue sequences for functions with `__attribute__((naked))`
		4. Use naked functions only to write assembly instructions (`__asm` statements).
			1. Mixing 'C' code might not work properly (c variable initialization etc...)
		5. Reference: http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dui0774g/jhg1476893564298.html
2. Program:

		__attribute__((naked)) void UsageFault_Handler(void) {
			// extracting value of MSP (based of stack frame) which got saved due to exception
			__asm volatile ("MRS r0, MSP");
			__asm volatile ("B UsageFault_Handler_c"); // callee gets r0 as first argement
		}
		
		void UsageFault_Handler_c(uint32_t *pBaseStackFrame) {
			//...
			printf("MSP = %p\n", pBaseStackFrame);
			printf("Value of R0 = %x\n", pBaseStackFrame[0]);
			printf("Value of R1 = %x\n", pBaseStackFrame[1]);
			printf("Value of R2 = %x\n", pBaseStackFrame[2]);
			printf("Value of R3 = %x\n", pBaseStackFrame[3]);
			printf("Value of R12 = %x\n", pBaseStackFrame[4]);
			printf("Value of LR = %x\n", pBaseStackFrame[5]);
			printf("Value of PC = %x\n", pBaseStackFrame[6]);
			printf("Value of XPSR = %x\n", pBaseStackFrame[7]);
			while (1);
		}
		
	1. LR - stores the instruction next to the instruction that triggered exception
		1. We can check **.list** file for the address

### Analyzing Stack Frame ###
1. Divide by zero
	1. New project:
		1. Copy the above code (with stack frame analysis code)
		2. Enable divide by zero trap

				// 2. Enable divide by zero trap
				// SCB - Configuration and Control Register - copy address
				uint32_t *pCCR = (uint32_t*) 0xE000ED14;
				*pCCR |= (1 << 4);
				
				// 3. attempt to divide by zero
				
				fun_div(10, 0); // Goes to UsageFault_Handler - UFSR - 200 (DIVBYZERO)
				
				// ...
				
				void fun_divide(int x, int y) {
					return x / y;
				}
				
			1. Bit[4]: DIV_0_TRAP
				1. 0 - do not trap divide by 0
				2. 1 - trap divide by 0
			2. Enables faulting or halting when ever processor executes SDIV or UDIV instruction with a divisor of 0
			3. Copy and paste `sdiv` in ARM Developer website
				1. [https://developer.arm.com/documentation/101273/r0p2/The-Cortex-M55-Instruction-Set--Reference-Material/Multiply-and-divide-instructions/SDIV-and-UDIV?lang=en](https://developer.arm.com/documentation/101273/r0p2/The-Cortex-M55-Instruction-Set--Reference-Material/Multiply-and-divide-instructions/SDIV-and-UDIV?lang=en)
			4. Fault analyzer captures the stack frame
			5. If usage fault is not enabled, it gets escalated to hard fault
2. Fault address info registers
	1. The registers contain address of location that generated the fault
		1. HardFault - HFSR (HardFault Status Register)
		2. MemManage - MMFSR (MemManage Fault Status Register)
			1. MMFAR (MemManage Fault Address Register)
				1. Contains address of the location that generated the fault
		3. BusFault - BFSR (BusFault Status Register)
			1. BFAR (BusFault Address Register)
				1. Contains address of the location that generated the fault
		4. UsageFault - UFSR (UsageFault Status Register)
3. Error reporting when fault occurs
	1. Implement handler which takes some remedial actions
	2. Implement user call back to report errors
	3. Reset microcontroller/Processor
	4. For an OS environment,
		1. Task that triggered the fault can be terminated and restarted
	5. Report fault status register and fault address register values
	6. Report additional information of stack frame through debug interface such as printf

## Exception for System Level Services ##
### SVC Exception ###
1. Exceptions for system-level services
	1. ARM Cortex Mx processor supports 2 important system-level service exceptions.
		1. `SVC` (SuperVisor Call)
		2. `PendSV` (Pendable SerVice)
	2. Supervisory calls are typically used to request privileged operations or access to system resources from OS
	3. SVC exception is mainly used in an OS environment (Embedded OS, RTOS, Simple Scheduler)
		1. Example: A less privileged user task can trigger SVC exception
			1. To get system-level services (like accessing device drivers, peripherals, restricted memory location, ...) from kernel of OS
	4. PendSV - mainly used in OS environment
		1. To carry out context switching between 2 or more tasks when no other exceptions are active in system
			1. Used in Multi-task system (multiple tasks and a scheduler)
				1. Scheduler uses PendSV system exception to perform context switching
4. `SVCall` - 11th exception in exception model
5. `PendSV` - 14th exception
6. `SVC` (Supervisor Call) instruction
	1. `SVC` is a thumb ISA instruction which causes SVC exception
	2. In RTOS scenario
		1. User tasks can execute `SVC` instruction with associated argument to make supervisory calls to seek privileged resources from kernel code
			1. `SVC` is used by user task (or less privileged task) to ask Kernel to get certain services
				1. System call layer can be implemented using `SVC` call (API)
	3. Unprivileged user tasks use `SVC` instruction to change processor mode to privileged mode 
		1. To access privileged resources like peripherals
	4. `SVC` instruction is always used along with a number (`SVC` number or `SVC` argument)
		1. Number can be used to identify the request type by kernel code
	5. `SVC` handler executes right after `SVC` instruction (no delay. Unless a higher priority exception arrives at the same time)
7. Scenario:

		User level code -(1)--> Kernel level code (2)
			User task            __SVC_request_handler(int svc_number) {
			SVC #1                   case 1:
			                             __write(); -(3)--> Privileged
			                         case 2:                resource
			                             __read();          (display)
			                         case 3:                  Peripheral
			                             __timer_start();     registers
			                         ...                      access is
			                         }                        protected
			                                                  by MPU
		(Access level: un-privileged                         (privileged
		Process mode: Thread)                                 access
		                                                      only)
		                                                      
	1. If un-privileged access is not given, user code may be able to do anything on the system and can jeoardise it's security
	2. Kernel can run in privileged mode (can change any config and access any privileged resource)
		1. Display say
			1. Config register
			2. Data register
	3. Mem-Protection Unit (MPU) (address range is protected) guards the peripheral from user task directly accessing it (changing it say)
		1. If user task tries to access it, there will be a fault (MemManage fault exception)
8. How to trigger SVC exception
	1. There are two ways
		1. Direct execution of `SVC` instruction with immediate value (inline assembly needs to be used) 
			1. Example: `SVC #0x04` in assembly
				1. Using `SVC` instruction is very efficient in terms of latency
		2. Setting the exception pending bit in `System Handler Control and State Register` (uncommon method)
    
### Extracting SVC Number ###
1. How to extract SVC number
	1. SVC instruction has a number mebedded within it
		1. Referred to as SVC number
	2. In SVC handler
		1. Fetch the opcode of SVC instruction
		2. Extract SVC number
	3. To fetch opcode of SVC from program memory
		1. Have PC (return address) where user code had interrupted while triggering SVC exception (past PC value will give the address of SVC instruction)
			1. Value of PC (return address) where user code interrupted is stored in stack as a part of exception entry sequence by processor
2. Illustration

		TASK-A
			SVC #<num>
				|
				stacking -> xPSR
				|           Return address (PC)
				v           LR
			SVC Handler	  R12
				Get MSP	  R3
				MSP + 6	  R2
				(return	  R1
				address)	  R0 <- MSP
				
	1. `Next_ins_addr_after_SVC = MSP[6]; // points to instruction right after SVC instruction in thread mode`
	2. `SVC_number = *((Next_ins_addr_after_SVC) - 2); // address of SVC instruction`
3. Exercise:
	1. Write a program to execute an SVC instruction from thread mode
	2. Implement SVC handler to print SVC number used
	3. Increment SVC number by 4 and return it to thread mode code and print it
	4. Hints:
		1. Write a `main()` function where you should execute SVC instruction with an argument. `SVC #0x5` say
		2. Implement the SVC handler
		3. In SVC handler extract SVC number and print it using printf
		4. Increment the SVC number by 4 and return it to thread mode

### SVC Number Exercise Part-1 ###

		int main(void) {
			__asm volatile ("SVC #0x05");
		}
		
		__attribute__ ((naked)) void SVC_Handler() {
			__asm volatile ("MRS R0, MSP");
			register uint32_t msp_addr __asm("R0");
			uint32_t *const msp = (uint32_t *const) msp_addr;
			uint32_t *const svc_addr = (uint32_t *const) (msp[6] - 2);
			__asm volatile ("LDR R0, %0"::"r"(*svc_addr));
			__asm volatile ("B SVC_Handler_c");
		}
		
		void SVC_Handler_c(uint32_t const svc) {
			uint8_t svc_num = (uint8_t) svc;
			printf("%u\n", svc_num);
		}
		
1. Instructor's solution:

		int main(void) {
			__asm ("SVC #0x05"); // integer in the range 0-255 (8-bit value);
			for(;;);
		}
		
		__attribute((naked)) void SVC_Handler(void) {
			__asm ("MRS R0, MSP");
			__asm ("B SVC_Handler_c");
		}
		
		void SVC_Handler_c(uint32_t *pBaseOfStackFrame) {
			printf("In SVC handler\n");
			// 1. get the value of MSP
			uint8_t *pReturnAddr = (uint8_t*) pBaseOfStackFrame[6];
			
			// 2. Decrement the return address by 2 to point to opcode of SVC instruction in the program memory
			pReturnAddr -= 2;
			
			// 3. Extract SVC number (LSB of opcode)
			uint8_t svc_number = *pReturnAddr;
			printf("SVC number is: %d\n", svc_number);
		}

### SVC Number Exercise Part-2 ###
1. How to send back data to thread mode from handler?
	1. Store the value in R0 (store it in stack frame R0 value)

			int main(void) {
				//...
				register uint32_t data __asm("R0");
				printf("%u\n", data);
			}

			void SVC_Handler() {
				svc_number += 4;
				pBaseOfStackFrame[0] = svc_number; // stack frame entry is modified
			}
			
2. This approach is not recommended if R0 is not free
	1. Solution: We can use GCC inline assembly syntax of mixing processor regiser and C variable using input/output arguments as discussed

			__asm ("SVC #25");
			uint32_t data;
			__asm volatile ("MOV %0, R0":"=r"(data)::);

### SVC Math Operation Exercise ###
1. Exercise:
	1. Write a program to add, subtract, multiply, and divide 2 operands using SVC handler and return the result to the thread mode code and print the result. Thread mode code should pass 2 operands via the stack frame.
	2. Use SVC number to decide the operation
		1. 36 - Addition
		2. 37 - Subtraction
		3. 38 - Multiplication
		4. 39 - Division
2. Solution:

		#include <stdio.h>
		#include <stdint.h>
		
		int32_t add(int32_t a, int32_t b);
		int32_t sub(int32_t a, int32_t b);
		int32_t mul(int32_t a, int32_t b);
		int32_t div(int32_t a, int32_t b);

		int main(void) {
			int32_t a = 25;
			int32_t b = 8;
			int32_t sum = add(a, b);
			printf("%ld + %ld = %ld\n", a, b, sum);
		
			int32_t diff = sub(a, b);
			printf("%ld - %ld = %ld\n", a, b, diff);
		
			int32_t prod = mul(a, b);
			printf("%ld + %ld = %ld\n", a, b, prod);
		
			int32_t quot = div(a, b);
			printf("%ld + %ld = %ld\n", a, b, quot);
			/* Loop forever */
			for (;;)
				;
		}
		
		int32_t add(int32_t a, int32_t b) {
			int32_t result = 0;
			__asm volatile ("MOV R0, %0"::"r"(a));
			__asm volatile ("MOV R1, %0"::"r"(b));
			__asm volatile ("SVC #36");
			__asm volatile ("MOV %0, R0":"=r"(result)::);
			return result;
		}
		
		int32_t sub(int32_t a, int32_t b) {
			int32_t result = 0;
			__asm volatile ("MOV R0, %0"::"r"(a));
			__asm volatile ("MOV R1, %0"::"r"(b));
			__asm volatile ("SVC #37");
			__asm volatile ("MOV %0, R0":"=r"(result)::);
			return result;
		}
		
		int32_t mul(int32_t a, int32_t b) {
			int32_t result = 0;
			__asm volatile ("MOV R0, %0"::"r"(a));
			__asm volatile ("MOV R1, %0"::"r"(b));
			__asm volatile ("SVC #38");
			__asm volatile ("MOV %0, R0":"=r"(result)::);
			return result;
		}
		
		int32_t div(int32_t a, int32_t b) {
			int32_t result = 0;
			__asm volatile ("MOV R0, %0"::"r"(a));
			__asm volatile ("MOV R1, %0"::"r"(b));
			__asm volatile ("SVC #39");
			__asm volatile ("MOV %0, R0":"=r"(result)::);
			return result;
		}
		
		__attribute__((naked)) void SVC_Handler() {
			__asm ("MRS R0, MSP");
			__asm ("B SVC_Handler_c");
		}
		
		void SVC_Handler_c(uint32_t *const pBaseOfStackFrame) {
			uint32_t a = pBaseOfStackFrame[0];
			uint32_t b = pBaseOfStackFrame[1];
			uint8_t svc_num = (uint8_t) *((uint32_t* const ) (pBaseOfStackFrame[6] - 2));
			uint32_t result = 0;
			switch (svc_num) {
			case 36:
				result = a + b;
				break;
			case 37:
				result = a - b;
				break;
			case 38:
				result = a * b;
				break;
			case 39:
				result = a / b;
				break;
			}
			pBaseOfStackFrame[0] = result;
		}

### PendSV Exception ###
1. It is an exception type 14 and has a programmable priority level
2. This exception is triggered by setting its pending status by writing to the "Interrupt Control and State Register" of processor
	1. There is no instruction to trigger the exception
3. Triggering a pendSV system exception is a way of invoking the pre-emptive kernel to carry out context switch in an OS environment
4. In an OS environment
	1. PendSV handler is set to lowest priority level
	2. PendSV handler carries out context switch operation
		1. Key concept in OS design
		2. Scheduler does context switching
5. Typical use of PendSV
	1. Typically the exception is triggered inside higher priority exception handler
		1. It gets executed when higher piority handler finishes
	2. Using this characteristic, we can schedule PendSV exception handler to be executed after all the other interrupt processing tasks are done
		1. Priority of PendSV is kept the lowest possible
	3. Useful for context switching operation
		1. Crucial operation in various OS designs
	4. Using PendSV in context switching will be more efficient in an interrupt noisy environment
		1. In interrupt noisy environment, we need to delay context switching until all IRQ are executed
6. Context Switch
	1. Illustration

			(Context		 (Context		  (Context
			Switching)	 Switching)	  Switching)
			Scheduler		 Scheduler	  Scheduler <- SysTick Timer
					  |		 ^		   |	  ^	            Exception
					  |		 |		   |	  |
					  v		 |		   v	  |
					  Task A 		   Task B	         <- Task
					(Time slot)   (Time slot)
					  
		1. It is saving saving the context of old task and retrieving the context of the next task (to be scheduled)
		2. A scheduler can run at fixed intervals (1 ms say)
			1. Code that is part of the kernel
			2. It saves the context of currently running task on the stack memory
			3. It retrieves the context of the next task (from ready list)
7. OS code runs on each systick timer exception & decides to schedule different task
8. Scenario:
	1. User task (task A) is running
	2. SysTick timeout occurred
	3. Scheduler runs (it is SysTick handler)
		1. It pends the PendSV (doesn't actually do the context switching)
	4. When SysTick handler exits & if there are no interrupts in the system, then PendSV handler runs (It is configured for the lowest possible priority)
		1. PendSV runs only if there are no active interrupts
	5. In PendSV, Context switch will be done in PendSV handler
		1. Context of previous task is saved and context of next task is retrieved from stack
		2. PendSV handler makes next task execute
	6. During the execution of the current task, suppose an interrupt occurs
		1. ISR is executed (handler code)
			1. Suppose SysTick timeout occurs
				1. SystTick will pre-empt the ISR only if it's priority is higher than currently active ISR. (Assume SysTick interrupt is highest)
		2. Scheduler pends the PendSV and exits
	7. ISR resumes
	8. When ISR finishes, it exits
	9. PendSV handler will be invoked
		1. Context switch did not delay the ISR
	10. Thread mode task continues
9. Attempt to transition to thread mode when ISR is pending (Context switching in Scheduler (without PendSV)
	1. Unfinished ISR:
		1. Returning to thread mode keeping unfinished handler code (ISR) will cause usage fault
10. PendSV other use cases
	1. Offloading Interrupt processing
	2. If a higher priority handler is doing time-consuming work, then
		1. Other lower priority interrupts will suffer
			1. System responsiveness may reduce
				1. Solution: Combination of ISR and pendSV handler
	3. Offloading interrupt processing using PendSV
		1. Interrupts may be serviced in 2 halves
			1. First half is time critical part that needs to be executed as a part of ISR
			2. Second half is called **bottom half**
				1. It is delayed execution where rest of the time-consuming work will be done
		2. PendSV can be used in these cases
			1. Second half execution is triggered in the first half
	4. Illustration:
		1. Task A is running
		2. IRQ #0 is triggered
		3. ISR #0 runs (very short)
			1. It does first half processing (time critical)
			2. It then pends PendSV
			3. It exits
		4. When there are no active ISRs executing
			1. PendSV handler will run
				1. It will carry out the non-time critical task (time consuming)
		5. When it is doing bottom half processing, if any interrupt (IRQ #1 say) is triggered
			1. It pre-empts PendSV
			2. ISR can run
			3. When ISR finishes, PendSV resumes

## Implementation of Task Scheduler ##
### Introduction ###
1. Implementing a Scheduler
	1. Let's implement a scheduler which schedules multiple user tasks in round-robin fashion by carrying out context switch operation
	2. Round robin scheduling method is
		1. Time slices are assigned to each task in equal portions and in circular order
	3. First we will use systick handler to carry out the context switch operations between multiple tasks
	4. Later we will change the code using pendSV handler
2. User tasks
	1. 4 user tasks in the application
		1. T1 - Stack-T1
		2. T2 - Stack-T2
		3. T3 - Stack-T3
		4. T4 - Stack-T4
	2. What is a task?
		1. A task is a piece of code, or 'C' function which does a specific job when it is allowed to run on the CPU
		2. A task has it's own stack to define it's local variables when it runs on the CPU
		3. When scheduler decides to remove task from CPU
			1. Scheduler first saves context (state) of task in task's private stack
				1. Used for local variables when executing
				2. Used store the state (context) of the task when it is switched out
		4. A piece of code or function is called a task when it is schedulable and never loses it's 'state' unless it is deleted permanently
3. Code:
	1. 4 user tasks (never returning C functions)
	2. New project > task_scheduler

### Constructing User Tasks ###
1. main

		#include <stdio.h>

		void task1_handler(void); // task 1
		void task2_handler(void); // task 2
		void task3_handler(void); // task 3
		void task4_handler(void); // task 4
		
		int main(void) {
			for (;;);
		}
		
		void task1_handler(void) {
			while (1) {
				printf("This is task 1\n");
			}
		}
		
		void task2_handler(void) {
			while (1) {
				printf("This is task 2\n");
			}
		}
		
		void task3_handler(void) {
			while (1) {
				printf("This is task 3\n");
			}
		}
		
		void task4_handler(void) {
			while (1) {
				printf("This is task 4\n");
			}
		}
		
2. Stack pointer selection
	1. PSP - thread mode - for 4 tasks
	2. MSP - handler mode - for scheduler (systick handler/ PendSV handler)

### Stack Pointer Selection ###
1. PSP - used to trace stack utilization of the tasks
2. MSP - used by scheduler for it's own use
3. Stack assessment: defining boundaries for each task
	1. STM32F4 - SRAM1 + SRAM2 (128 KB)

			RAM_START							RAM_END
			|									|
			v									v
							|	|	|	|	|	|
							  ^	  ^  ^  ^   ^  
							  |	  |  |  |   |
							  |	  |  |  |   Private stack
							  |	  |  |  |   of T1 (1Kb)
							  |	  |  |  |
							  |	  |  |  Private stack
							  |	  |  |  of T2 (1Kb)
							  |	  |  |
							  |	  |  Private stack
							  |	  |  of T3 (1Kb)
							  |	  |
							  |	  private stack
							  |	  of T4 (1Kb)
							  |
							  Private stack
							  of scheduler (1Kb)
							  
		1. Size of stack depends on application design
			1. Number of APIs called
				1. This has to be evaluated
	2. To define (Full descending):
		1. T1_STACK_START, T1_STACK_END
		2. T2_STACK_START, T2_STACK_END
		3. ...
4. Reserve stack areas for all the tasks and scheduler

		/* some stack memory calculations */
		#define SIZE_TASK_STACK 1024U
		#define SIZE_SCHED_STACK 1024U
		
		#define SRAM_START 0x20000000U
		#define SIZE_SRAM ((128) * (1024))
		#define SRAM_END ((SRAM_START) + (SIZE_SRAM))
		
		#define T1_STACK_START SRAM_END
		#define T2_STACK_START ((SRAM_END) - (1 * (SIZE_TASK_STACK)))
		#define T3_STACK_START ((SRAM_END) - (2 * (SIZE_TASK_STACK)))
		#define T4_STACK_START ((SRAM_END) - (3 * (SIZE_TASK_STACK)))
		#define SCHED_STACK_START ((SRAM_END) - (4 * (SIZE_TASK_STACK)))

### Tasks and Scheduling ###
1. Scheduling policy selection
	1. Using round robin pre-emptive scheduling (switching out one task and switching in another task)
	2. No task priority
	3. SysTick timer is used to generate exception for every 1 ms to run scheduler code
		1. Configuration is required
2. What is scheduling?
	1. It is an algorithm which takes decision of pre-empting a running task from CPU and takes decision about which task should run on CPU next
	2. Decision could be based on many factors such as
		1. System load
		2. Priority of tasks
		3. Shared resource access
			1. If a task that is holding a key to a shared resource is getting switched out, the scheduler can take a dynamic decision on the task
		4. Round-robin
3. What is context switching?
	1. Context switching is the procedure of switching out currently running task from processor after saving task's execution context or state and switching in next task to run on CPU by retrieving the past execution context or state of the task
4. What is execution context or state of a task?
	1. Processor core
		1. ALU
		2. General purpose registers (stores instruction operands, intermediate results)
			1. fetches inputs from memory and stores them in general purpose registers and then writes result back to memory
		3. Status registers
			1. Gives snapshot of instruction execution (last instruction)
				1. Zero flag
				2. Carry flag
				3. Negative flag
				4. ...
		4. Special registers
			1. PC
			2. SP
			3. ...
	2. Processor specific peripherals
		1. NVIC
			1. Controls interrupts and exceptions
				1. Microcontroller peripherals (I2C, UART, SPI, ...)
		2. Memory Protection Unit (MPU)
			1. To guard memory location
		3. SCB
			1. System Control Block
		4. Floating Point Unit (FPU)
		5. Debug Unit
		6. ...
5. When task is running on a processor, it could be using GPRs, SRs, SpRs, ...
	1. State of a task:
		1. General Purpose Registers + Some Special Registers + Status Register
			1. When scheduler wants to switch out a task, it must save it's intermediate results of operations already stored in general purpose registers and status register and some special register values
				1. Core Registers:
				
						R0 <- low registers
						R1         |
						R2         v
						R3
						R4
						R5
						R6
						R7
						R8 <- higher register
						R9         |
						R10        |
						R11        v
						R12       <-
						SP (R13) PSP, MSP (Stack pointer)
						LR (R14)          (Link register)
						PC (R15)          (Program counter)
						
						PSR (Program Status Register)
						PRIMASK (Exception mask registers)
						FAULTMASK (Exception mask registers)
						BASEPRI (Exception mask registers)
						CONTROl 
				
					1. What are important to state?
						1. GPRs
						2. PC (holds next instruction)
							1. If scheduler wants to switch in again, it should continue from the PC held instruction
						3. LR - important info about task handler, stack pointer selection (PSP, MSP)
						4. PSP (current value is copied into SP)
						5. PSR (Snapshot of current state)
						6. Other registers are not important
							1. They are privileged registers
								1. Used for some special purpose
									1. Turn off interrupts (globally) etc...
								2. These registers are not used by low priority user tasks which are scheduled
									1. Scheduler handles these registers
		2. When scheduler decides to switch out a task, it should preserve the registers in Task's private stack
			1. The registers collectively represent current execution state of the task
				1. The state must be retrieved back again when scheduler decides to run the task again at a later time
			2. State to save:
				1. R0-R12
				2. PSP
				3. LR (R14)
				4. PC (R15)
				5. PSR

### Case Study of Context Switching ###
1. Case of T1 switching out, T2 switching in

		Running T1
			|
			v
		Save the context of T1 to <- context saving
		T1's private stack (PUSH)
			|
			v
		Save the PSP value of T1 <- context saving
			|
			v
		Get current PSP value of T2 <- context retrieving
			|
			v
		Retrieve the context of T2 <- context retrieving
		from T2's private stack (POP)
			|
			v
		Run T2
		
2. Stacking and Un-stacking during Exception
	1. Suppose task 1 is running
		1. If a systick exception occurs,
			1. task 1 is pre-empted
			2. Handler code run (SysTick exception handler)
			3. Processor saved context (state) of task 1
				1. Done automatically
		2. When exception handler exits, the task 1 is resumed by un-stacking
	2. Use-case - we don't want to resume task 1 but we want to switch to task 2
		1. Just change the PSP value
			1. To task 2's private stack
3. Stack frame saved automatically (partially):

		xPSR
		Return address (PC)
		LR
		R12
		R3
		R2
		R1
		R0
		
	1. We want to save the remaining registers (R4 - R11)
		1. Push them manually

### Configure Systick Timer ###
1. Configure systick timer to produce exception for every 1 ms (background timer)
	1. Task: We need to program timer count
		1. Processor Clock = 16 MHz
		2. SysTick timer count = 16 MHz
			1. How fast it runs (16 million cycles per second)
				1. High speed internal oscillator - doesn't need configuration - 16 MHz
		3. 1 ms is 1 KHz in frequency domain
			1. TICK_HZ = 1000 Hz (desired exception frequency)
		4. So, to bring down SysTick timer count of clock from 16 MHz to 1 KHz use a divisor (reload value)
			1. Reload value = **16000**
	2. HSI value needs to be considered
2. Clock distribution

						 -16MHz-> Processor
			16MHz		|
		System clock -
			HSI			|
						 -16MHz-> SysTick timer
						 
	1. HSI is given directly to Processor and SysTick timer
3. SysTick timer count clock = 16 MHz
	1. 1 count takes 0.0625 micro seconds
	2. 1 micro second delay -> 16 count
	3. 1 ms -> 16000 count
4. Code

		#define TICK_HZ 1000U
		#define SYSTICK_TIM_CLK 16000000U

		int main(void) {
			init_systick_timer(TICK_HZ);
		}
		
		void init_systick_timer(uint32_t tick_hz) {
			uint32_t *pSRVR = (uint32_t*) ;
			uint32_t count_value = SYSTICK_TIM_CLK / tick_hz;
		}
		
	1. Go to General User Guide - Systick Timer
		1. SysTick Reload Value Register (copy the address)
			1. SYST_RVR - specifies start value to load into SYST_CVR reg

					31 - 24  23 - 0
					Reserved RELOAD
					
				1. RELOAD - Value to load into SYST_CVR reg when counter is enabled and when it reaches 0
			2. SYST_CVR - contains current value of SysTick counter
			
					31 - 24  23 - 0
					Reserved CURRENT
					
				1. CURRENT - Reads return current value of SysTick counter
					1. Write of any value clears the field to 0, clears SYST_CSR, COUNTFLAG bit to 0
						1. This should not be modified
						2. Each decrement needs 1 clock cycle
						3. When CVR becomes 0, the value from RVR is reloaded
							1. This SysTick exception gets triggered here
								1. Hence store (N - 1) count
									1. If exception is required every 100 clock cycles, RELOAD must be 99
5. Code:

		void init_systick_timer(uint32_t tick_hz) {
			uint32_t *pSRVR = (uint32_t*) 0xE000E014;
			uint32_t count_value = (SYSTICK_TIM_CLK / tick_hz) - 1;
			
			// Clear the value of SVR
			*pSRVR &= ~(0x00FFFFFFFF);
			
			// Load te value into SVR
			*pSRVR |= count_value;
			
			// Do some settings
			
			// Enable the systick
		}
		
	1. SysTick Control and Status Register
		1. Bit[16]: COUNTFLAG
		2. Bit[2]: CLKSOURCE
			1. 0 - external clock
			2. 1 - processor clock
				1. We are using processor clock here
		3. Bit[1]: TICKINT
			1. 0 - counting down to zero does not assert SysTick exception request
			2. 1 - counting down to zero asserts SysTick exception request
				1. Software can use COUNTFLAG to determine if SysTick has ever counted to zero
		4. BIT[0]: ENABLE
			1. 0 - counter disabled
			2. 1 - counter enabled
6. Code

		uint32_t *pSCSR = (uint32_t*) 0xE000E010;
		// ...
		// do some settings
		*pSCSR |= (1 << 1); // Enable SysTick exception request
		*pSCSR |= (1 << 2); // Indicates the clock source - processor clock source
		
		// enable the systick
		*pSCSR |= (1 << 0); // enables the counter
		
		// ...
		void SysTick_Handler(void) { // Does context switching
		
		}

### Case Study of Context Switching Contd. ###
1. Context switch
	1. Assume T1 is running
		1. When SysTick timer runs, a stack frame gets stored in private stack of T1
			1. Processor does this automatically (SF1)
		2. In SysTick handler
			1. Push remaining registers (R4 - R11) (SF2)
			2. Save the value of PSP. Because it is required later when processor needs to resume the execution of T1 by retrieving its saved state
				1. Stored in a global variable
			3. Restore PSP of Task 2
			4. Pop status of SF2 of Task 2
				1. Done by programmer
			5. Exit the exception handler
				1. Return address of Task 2 will get retrieved automatically
		3. Task 2 resumes
2. If Task 2 gets executed first
	1. Task's stack area init and storing of dummy SF
		1. Each task can consume a maximum of 1KB of memory as a private stack
		2. This stack is used to hold tasks local variables and context (SF1 + SF2)
		3. When a task is getting scheduled for the very first time
			1. It doesn't have any context
				1. The programmer should store dummy SF1 & SF2 in Task's stack area as part of "task initialization" sequence before launching scheduler
					1. Store 0s in all register values in stack frames
					2. xPSR
						1. T - bit: should be 1 (0x01000000)
					3. PC
						1. Address of task handler
							1. Make sure that lsb of the address is 1 (copied to T-bit)
					4. LR
						1. A special value (EXC_RETURN)
							1. Controls the exception exit
						2. Value to considered
							1. 0xFFFFFFFD - Thread mode, exception return, non-floating-point, PSP

### Initialization of Stack ###
1. Initialize scheduler stack pointer (MSP)
	1. Stack start address needs to be stored in MSP

			int main(void) {
				init_scheduler_stack(SCHED_STACK_START);
			}
			
			__attribute__((naked)) void init_scheduler_stack(uint32_t sched_top_of_stack) {
				__asm volatile("MSR MSP, %0"::"r"(sched_top_of_stack):);
				__asm volatile("BX LR"); // copies value of LR into PC
			}

### Initialization of Stack Contd. ###
1. Init tasks stack memory
	1. Store dummy SF1 and SF2 in stack memory of each task

			#define MAX_TASKS 4
			#define DUMMY_XPSR 0x010000000U
			// ...
			uint32_t psp_of_tasks[MAX_TASKS] = {T1_STACK_START, T2_STACK_START, T3_STACK_START, T4_STACK_START};
			uint32_t task_handlers[MAX_TASKS];

			int main(void) {
				// ...
				task_handlers[0] = (uint32_t) task1_handler;
				task_handlers[1] = (uint32_t) task2_handler;
				task_handlers[2] = (uint32_t) task3_handler;
				task_handlers[3] = (uint32_t) task4_handler;
				init_task_stack(void);
				// ...
			}
			
			void init_task_stack(void) {
				uint32_t *pPSP;
				for (int i = 0; i < MAX_TASKS; i++) {
					pPSP = (uint32_t*) psp_of_tasks[i];
					pPSP--;
					*pPSP = DUMMY_XPSR; // 0x01000000
					pPSP--;
					*pPSP = task_handlers[i];
					for (int j = 0; j < 13; j++) {
						pPSP--;
						*pPSP = 0x0;
					}
				}
				psp_of_tasks[i] = (uint32_t) pPSP;
			}
			
		1. Shift macros to main.h

### Stack Pointer Setup ###
1. Task pointer needs to be changed:

		uint8_t current_task = 0; // task1 is running
		//...
		int main(void) {
			enable_processor_faults(); // we may be doing illegal activities related to memory or inline assembly, changing handler to thread mode, ... - we need to enable all important faults
			//...
			switch_sp_to_psp();
			task1_handler();
		}
		
		void enable_processor_faults(void) {
			uint32_t *pSHCSR = (uint32_t*) 0xE000ED24;
			
			*pSHCSR |= (1 << 16); // mem manage fault
			*pSHCSR |= (1 << 17); // bus fault
			*pSHCSR |= (1 << 10); // usage fault
		}
		
		uint32_t get_psp_value(void) {
			return psp_of_tasks[current_task];
		}
		
		__attribute((naked)) void switch_sp_to_psp(void) {
			// 1. initialize the PSP with TASK1 stack start
			// get the value of psp of current task
			__asm volatile ("PUSH {LR}"); // Because LR will be corrupted after next instruction - we need to preserve LR of main
			__asm volatile ("BL get_psp_value"); // Branch with link - LR will store return address
			__asm volatile ("MSR PSP, R0");
			__asm volatile ("POP {LR}");
			
			// 2. change SP to PSP using CONTROL register
			__asm volatile ("MOV RO, #0x02");
			__asm volatile ("MSR CONTROL, R0");
			__asm volatile ("BX LR"); // Return to main
		}

### Implementing the Systick Handler ###
1. SysTick Handler

		void save_psp_value(uint32_t current_psp_value) {
			psp_of_tasks[current_task] = current_psp_value;
		}
		
		void update_next_task(void) {
			current_task++;
			current_task %= MAX_TASKS;
		}

		__attribute__((naked)) void SysTick_Handler(void) {
			/* Save the context of current task */
			// 1. Get current running task's PSP value
			__asm volatile ("MRS R0, PSP");
			// 2. Using that PSP value store SF2 (R4 to R11)
			__asm volatile ("STMDB R0!, {R4-R11}"); // we cannot use push (MSP will get affected) - STMDB - Store Multiple registers, decrement before (decrement address and then store)
			
			__asm volatile ("PUSH {LR}");
			
			// 3. Save the current value of PSP
			__asm volatile ("BL save_psp_value");
			
			/* Retrieve the context of next task */
			// 1. Decide next task to run
			__asm volatile("BL update_next_task");
			
			// 2. Get it's past PSP value
			__asm volatile ("BL get_psp_value");
			
			// 3. Using that PSP value retrieve SF2 (R4 to R11)
			__asm volatile ("LDMIA R0!, {R4-R11}"); // Load multiple registers, increment after (IA is default)
			
			// 4. Update PSP and exit
			__asm volatile ("MSR PSP, R0");
			
			__asm volailte ("POP {LR"});
			__asm volatile ("BX LR");
		}
	
	1. `!` - the final address is stored back to R0
	2. Task handler address must be odd

			*pPSP = task_handlers[i];
			
	3. ITM resource is not guarded (for debugging)

### Testing ###
1. Keep break points in task2, task2 and task3

### Toggling of LEDs Using Multiple Tasks ###
1. LED toggling using multiple tasks
	1. Discovery board has 4 LEDs
		1. LED4 - PD12 - Task1 (1s) (toggle)
		2. LED3 - PD13 - Task2 (500ms)
		3. LED4 - PD14 - Task3 (250ms)
		4. LED5 - PD15 - Task4 (125ms)
	2. Nucleo board has only 1 LED
		1. External LEDs are required
2. Implementation
	1. Add the given led.c and led.h files to project
		1. `inc/led.h`
		2. `src/led.c`
	2. Use software delay (for loop) to toggle the LEDs
		1. We can change to timer based delay
3. Code

		int main(void) {
			// ...
			led_init_all();
			
			init_systick_timer(...);
			// ...
		}
		
		void task1_handler(void) {
			while (1) {
				led_on(LED_GREEN);
				delay(DELAY_COUNT_1S);
				led_off(LED_GREEN);
				delay(DELAY_COUNT_1S);
			}
		}
		
		void task2_handler(void) {
			while (1) {
				led_on(LED_ORANGE);
				delay(DELAY_COUNT_500MS);
				led_off(LED_ORANGE);
				delay(DELAY_COUNT_500MS);
			}
		}
		
		void task3_handler(void) {
			while (1) {
				led_on(LED_BLUE);
				delay(DELAY_COUNT_250MS);
				led_off(LED_BLUE);
				delay(DELAY_COUNT_250MS);
			}
		}
		
		void task4_handler(void) {
			while (1) {
				led_on(LED_RED);
				delay(DELAY_COUNT_125MS);
				led_off(LED_RED);
				delay(DELAY_COUNT_125MS);
			}
		}
		
	1. Delay extends by 4 times for LED1
		1. Wasting 4 MS between scheduling
			1. Wastes CPU cycles due to looping
2. Introducing blocking state for tasks

### Blocking States of Tasks ###
### Blocking a Task for Given Number of Ticks ###
### Global Tick Count ###
### Deciding Next Task to Run ###
### Implementing PendSV Handler for Context Switch ###
### Update Next Task and Testing ###

## Bare Metal Embedded and Linker Scripts ##
### Bare Metal Embedded ###
### Cross Compilation and Toolchains ###
### Installing GCC ARM Cross Toolchain ###
### Build Process ###
### Compilation and Compiler Flags ###
### Makefile ###
### Analyzing Relocatable Obj Files ###
### Code and Data of a Program ###
### Linker and Locator ###
### Different Data and Sections of a Program ###
### BSS vs Data ###
### Startup File of Microcontroller ###
### Writing Startup File of Microcontroller From Scratch Prat-1 ###
### Writing Startup File of Microcontroller From Scratch Part-2 ###
### Writing Startup File of Microcontroller From Scratch Part-3 ###
### Writing Linker Script From Scratch Part-1 ###
### Writing Linker Script From Scratch Part-2 ###
### Location Counter ###
### Linker Script Symbols ###
### Writing Linker Script From Scratch Part-3 ###
### Linking and Linker Flags ###
### Analyzing ELF File ###
### Implementing Reset Handler ###
### OpenOCD and Debug Adapters ###
### Steps to Download Code Using OpenOCD ###
### Using GDB Client ###
### C Standard Library Integration ###
### Integrating System Calls ###
### Section Merging of Standard Library ###
### Fixing Linker Script to Resolve hardfault ###
### Semi-Hosting ###

## Thank You ##
### Bonus Lecture ###