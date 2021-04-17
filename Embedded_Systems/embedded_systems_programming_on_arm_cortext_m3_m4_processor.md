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
### Configurable Fault Exception Exercise-2 ###
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
### Initialization of Stack Contd. ###
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