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
		
		fun_ptr(); // even address will be placed into PC

## Memory Map and Bus Interfaces of ARM Cortex Mx Processor ##
### Memory Map ###
### Bus Protocol and Bus Interfaces ###
### Bit Banding ###
### Bit Banding Exercise ###

## Stack Memory and Placement ##
### Introduction to Stack Memory ###
### Different Stack Operation Models ###
### Stack Placement ###
### Banked Stack Pointer Registers of ARM Cortex Mx ###
### Stack Exercise ###
### Stack Exercise Contd. ###
### Function Call and AAPCS Standard ###
### Stack Activities During Interrupt and Exception ###

## Exception Model of ARM Cortex Mx Processor ##
### Exception Model ###
### Different System Exceptions ###
### System Exception Vector Address ###
### System Exception Control Registers ###
### NVIC ###
### NVIC Registers ###
### Peripheral Interrupt Exercise ###
### Peripheral Interrupt Exercise Contd. ###

## Interrupt Priority and Configuration ##
### Interrupt Priority Explanation ###
### Pre-Empt and Sub Priority ###
### Interrupt Priority Configuration Exercise ###
### Pending Interrupt Behavior ###

## Exception Entry and Exit Sequences ##
### Exception Entry and Exit Sequences ###
### Analyzing Stack Contents During Exception Entry and Exit ###

## Fault Handling and Analysis ##
### Introduction to Processor Faults ###
### Hardfault Exception ###
### Other Configurable Faults ###
### Configurable Fault Exception Exercise-1 ###
### Analyzing Stack Frame ###
### Configurable Fault Excepiton Exercise-2 ###
### Analyzing Stack Frame ###

## Exception for System Level Services ##
### SVC Exception ###
### Extracting SVC Number ###
### SVC Number Exercise Part-1 ###
### SVC Number Exercise Part-2 ###
### SVC Math Operation Exercise ###
### PendSV Exception ###

## Implementation of Task Scheduler ##
### Introduction ###
### Constructing User Tasks ###
### Stack Pointer Selection ###
### Tasks and Scheduling ###
### Case Study of Context Switching ###
### Configure Systick Timer ###
### Case Study of Context Switching Contd. ###
### Initialization of Stack ###
### Initialization of Stack Contc. ###
### Stack Pointer Setup ###
### Implementing the Systick Handler ###
### Testing ###
### Toggling of LEDs Using Multiple Tasks ###
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