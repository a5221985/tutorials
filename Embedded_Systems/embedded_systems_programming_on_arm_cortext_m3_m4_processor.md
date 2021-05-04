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
	1. When a task has nothing to do, it should call delay function which should put task into blocked state from running state until specified delay is elapsed
		1. We don't want to waste CPU cycles
	2. We should maintain 2 states for a task
		1. Running
		2. Blocked
	3. Scheduler should schedule only those tasks which are in Running state
	4. Scheduler should also unblock blocked tasks if their blocking period is over and put them back to running state

### Blocking States of Tasks ###
1. Introducing blocking state for tasks
2. TCB (Task Control Block) (instead of global variables)

		typedef struct {
			uint32_t psp_value;
			uint32_t block_count; // wait count (block period)
			uint8_t run_state;
			void (*task_handler)(void);
		} TCB_t;
		
	1. Structure contains all the information required for the task
3. Code

		// following can be in main.h
		#define TASK_RUNNING_STATE 0x00
		#define TASK_BLOCKED_STATE 0xFF

		TCB_t user_tasks[MAX_TASKS]; // remove global variables
		// ...
		init_task_stack();
		// ...
		
		void init_tasks_stack(void) {
			for (int i = 0; i < MAX_TASKS; i++)
				user_tasks[0].current_state = TASK_RUNNING_STATE;
			
			user_tasks[0].psp_value = T1_STACK_START;
			user_tasks[1].psp_value = T2_STACK_START;
			user_tasks[2].psp_value = T3_STACK_START;
			user_tasks[3].psp_value = T4_STACK_START;
			
			user_tasks[0].task_handler = task1_handler;
			user_tasks[1].task_handler = task2_handler;
			user_tasks[2].task_handler = task3_handler;
			user_tasks[3].task_handler = task4_handler;
			
			uint32_t *pPSP;
			
			for (int i = 0; i < MAX_TASKS; i++) {
				pPSP = (uint32_t*) user_tasks[i].psp_value;
				
				pPSP--;
				*pPSP = DUMMY_XPSR;
				
				pPSP--;
				*pPSP = (uint32_t) user_tasks[i].task_handler;
				// ...
				user_tasks[i].psp_value = (uint32_t) pPSP;
			}
		}
		
		// ...
		
		uint32_t get_psp_value(void) {
			return user_tasks[current_task].psp_value;
		}
		
		void save_psp_value(uint32_t current_psp_value) {
			user_tasks[current_task].psp_value = current_psp_value;
		}

### Blocking a Task for Given Number of Ticks ###
1. Block a task for a given number of ticks
	1. Let's introduce a function called "task_delay" which puts the calling task to the blocked state for a given number of ticks
	2. E.g. task_delay(1000); if a task calls this function then task_delay function puts the task into blocked state and allows the next task to run on the CPU
	3. Here, the number 1000 denotes a block period in terms of ticks, the task who calls this function is going to block for 1000 ticks (systick exceptions), i.e., for 1000ms since each tick happens for every 1 ms
	4. The scheduler should check elapsed block period of each blocked task and put them back to running state if the block period is over
2. Idle task
	1. What if all tasks are blocked? Who is going to run on the CPU?
		1. We will use idle task to run on the CPU if all tasks are blocked.
			1. Idle task is like user tasks but only runs when all user tasks are blocked
				1. We can put CPU to sleep

### Global Tick Count ###
1. Global tick count
	1. How does the scheduler decide when to put the blocked state tasks (blocked using task_delay function) back to the running state?
		1. In RTOS, task can block for
			1. Event
			2. Delay function
			3. Semaphore
			4. ...
	2. It has to compare task's delay tick count with global tick count
	3. Scheduler should maintain a global tick count and update it for every systick exception
2. Code

		#define MAX_TAKS 5
		#define IDLE_STACK_START ((SRAM_END) - (4 * SIZE_TASK_STACK))
		#define SCHED_STACK_START ((SRAM_END) - (5 * SIZE_TASK_STACK))
		
		uint8_t current_task = 1;
		uint32_t g_tick_count = 0;
		
		//...
		void init_tasks_stack(void) {
			// ...
			user_tasks[4].current_state = TASK_RUNNING_STATE;
			
			// ...
			user_tasks[0].psp_value = IDLE_STACK_START;
			user_tasks[1].psp_value = T1_STACK_START;
			// ...
			user_tasks[4].psp_value = T4_STACK_START;
			
			// ...
			user_tasks[0].task_handler = idle_task;
			user_tasks[1].task_handler = task1_handler;
			// ...
			user_tasks[4].task_handler = task4_handler;
			// ...
		}

		void idle_task(void) {
			while(1);
		}

		void task_delay(uint32_t tick_count) {
			user_tasks[current_task].block_count = g_tick_count + tick_count;
			user_tasks[current_task].current_state = TASK_BLOCKED_STATE;
		}
		
		__attribute__((naked)) void SysTick_Handler(void) {
			// update global tick count
		}

### Deciding Next Task to Run ###
1. It depends on the state of next task
	1. IDLE task - always in RUN state
	2. We have to check state of next task
		1. If blocked, move forward
		2. If idle task, move forward
		3. If run state, schedule it
	3. If all tasks are blocked
		1. Run idle task
2. PendSV Handler
	1. Using pendSV handler to carry out context switch operation instead of systick handler

			Systick handler
				Update globak tick count
				Unblock task
				Pend PendSV
				exit -------triggers--------> PendSV handler
												    Carry out context switch
												    exit
												    
		1. Systick handler - normal C function
			1. Unblock task - if tick countdown is over, changes blocking state to running state
		2. PendSV handler - naked function

### Implementing PendSV Handler for Context Switch ###
1. Code

		void update_next_task(void) {
			// ...
		}
		
		// ...

		void schedule(void) {
			*pICSR |= (1 << 28); // pend the PendSV
		}

		void task_delay(uint32_t tick_count) {
			if (current_task) // 0 - Idle Task
			{
				// ...
			}
			// allow other tasks to run
			schedule(); // trigger PendSV
		}

		__attribute__((naked)) void PendSV_Handler(void) {
			// cut and paste all code from SysTick_Handler
		}
		
		void unblock_tasks(void) {
			for (int i = 1; i < MAX_TASKS; i++) {
				if (user_tasks[i].current_state != TASK_RUNNING_STATE) {
					if (user_tasks[i].block_count == g_tick_count) {
						user_tasks[i].current_state = TASK_RUNNING_STATE; // Change it to TASK_READY_STATE
					}
				}
			}
		}
		
		void update_global_tick_count(void) {
			g_tick_count++;
		}
		
		void SysTick_Handler() { // doesn't have to be naked function
			uint32_t *pICSR = (uint32_t*) 0xE000ED04;
			update_global_tick_count();
			unblock_tasks();
			// pend pendsv exception
			*pICSR |= (1 << 28);
		} // When this exits, PendSV_Handler runs
		
	1. Generic User Guide
		1. Interrupt Control and State Register
			1. Set PENDSVSET bit
				1. 0 - no effect
				2. 1 - changes PendSV exception state to pending
			2. Address:
				1. 0xE000ED04

### Update Next Task and Testing ###
1. Logic:

		void update_next_task(void) {
			int state = TASK_BLOCKED_STATE;
			
			for (int i = 0; i < MAX_TASKS; i++) {
				current_task++;
				current_task %= MAX_TASKS;
				state = user_tasks[current_task].current_state;
				if ((state == TASK_READY_STATE) && (current_task != 0))
					break;
			}
			
			if (state != TASK_READY_STATE)
				current_task = 0;
		}

		// ...
		void task1_handler(void) {
			while (1) {
				// ...
				task_delay(1000); // 1000 ticks = 1000 ms
				// ...
				task_delay(1000);
			}
		}
		
		// Repeat for task2, task3 and task4

2. Since exception handlers and interrupt handlers are asynchronous in nature, we must avoid race conditions with global variables
	1. `task_delay`
		1. `user_tasks` - shared memory area
			1. Solution: Disable interrupt before accessing global variable
				1. Enable interrupt after finishing the access
				2. Pri-Mask register can be used (globally disable)

						// put the following in main.h
						#define INTERRUPT_DISABLE() do{__asm volatile("MOV RO, #0x1"); __asm volatile("MSR PRIMASK, R0"); } while (0) // multiple lines
						#define INTERRUPT_ENABLE() do{__asm volatile("MOV RO, #0x0"); __asm volatile("MSR PRIMASK, R0"); } while (0)
						//...
						
						INTERRUPT_DISABLE(); // All interrupts are disabled, Hard RTOS may not accept this
						// ...
						INTERRUPT_ENABLE();

## Bare Metal Embedded and Linker Scripts ##
### Bare Metal Embedded ###
1. Buiding and running bare metal executables for ARM target using GNU tools
	1. Section deliverables
		1. Toolchain installation
		2. Understand compiling a 'C' program for an embedded target without using an IDE
		3. Writing microcontroller startup file for STM32F4 MCU
		4. Writing your own 'C' startup code (code which runs before main())
		5. Understanding different sections of the relocatable object file (.o files)
		6. Writing linker script file from scratch and understanding section placements
		7. Linking multiple .o files using linker script and generating application executable (.elf, bin, hex)
		8. Loading the final executable on the target using OpenOCD and GDB client
2. Steps:

		User application (.c, .s files)
			|
			v
		compiler (building)
			|
			v
		linker (building)
			|
			v
		programmer and debugger (downloading)
			|
			v
		FLASH (running)
		
	1. Using command line tools only to do all the steps
3. Sample 'C' program:
	1. Take files from task_scheduler
		1. my_workspace/
			1. led.c
			2. led.h
			3. main.c
			4. main.h

### Cross Compilation and Toolchains ###
1. Flow:

		User application (.c, .s files) (high level language)
			|
			v
		Executable (Embedded target specific machine code)
		
	1. Executable is copied to target board
2. Cross compilation and toolchains
	1. What is cross compilation?
		1. It is a process in which cross-toolchain runs on host machine (PC) and generates executables that run on different machine (ARM)
	2. What are the?
		1. It is a collection of binaries which allows you to compile, assemble, link your applications
		2. It also contains binaries to debug the application on target
		3. It also comes with other binaries which help you analyze executables
			1. Dissect different sections of executable
			2. Disassemble
			3. Extract symbol and size information
			4. Convert executable to other formats such as bin, ihex
			5. Provides 'C' standard libraries
	3. Popular tool-chains
		1. GNU Tools (GCC) for ARM Embedded Processors (free and open-source)
			1. Using GNU's Compiler Collection (GCC) toolchain
		2. armcc from ARM Ltd. (ships with Keil, code restriction version (free), requires licensing (if we remove restriction))
3. Downloading GCC Toolchain for ARM embedded processors
	1. If we have installed STM32CubeIDE, the toolchain would have already been installed as part of the installation
	2. Official website to download GCC toolchain for ARM
		1. [https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm)
			1. Download the toolchain (search for gcc for arm)
			2. GNU-RM > Downloads
				1. `gcc-arm-nonde-eabi-...`

### Installing GCC ARM Cross Toolchain ###
1. Double click to install
	1. Default location
	2. Check **Add path to environment variable**
	3. We can refer to README
2. Open terminal
	1. `arm-none-eabi-gcc` - should detect the command
	2. Open GNU Tools Arm Embedded > <version> > bin (`/Applications/ARM/bin/arm-none-eabi-gcc` on Mac)
		1. Binaries
			1. Assembler
			2. Compiler
			3. Linker
			4. elf analysers
			5. ...
		2. The tools will run on host machine but constructs executables for ARM architecture
3. Important binaries
	1. Compiler, linker, assembler
		1. Compiler: `arm-none-eabi-gcc` (compiles, assembles, links to construct executables)
		2. Assembler: `arm-none-eabi-as` (assembly to machine code)
		3. Analyzers:
			1. `arm-none-eabi-objdump`
			2. `arm-none-eabi-readelf`
			3. `arm-none-eabi-nm`
		4. Linker: `arm-none-eabi-ld`
		5. Format converter: `arm-none-eabi-objcopy`
			1. One exe format to another exe format

### Build Process ###
1. Process:
	1. Pre-processing:
		
			main.c -> compiler -> main.i
				(pre-processing stage)
				all pre-processing directives
				will be resolved
				
		1. `#include`, macros, conditional compilation macros, ...
	2. Translating a source file into assembly language
		
			main.i -> compiler -> main.s
				(code generation stage)
				Higher level language code
				statements will be converted
				into processor architectural
				level mnemonics
				
	3. Assembly

			main.s -> compiler -> main.o (relocatable object file)
				(Assembler stage)
				Assembly level mnemonics
				are converted into opcodes
				(machine codes for instructions)
				
		1. Relocatable object files:
			1. Processor architecture specific machine codes with no absolute address (relocatable)
				1. They carry relocatable addresses
	4. Linking
	
			Re-locatable object files
				|
				v
			Linker <- .a (other libraries (std and/or third party .ex. libc)
				|
				v
			.elf (executable and debug file)
				|
				v
			objcopy tool
				|	|
				v	v
			.ihex	.bin (bin format)
			(Intel hex format)
			
		1. All required relocatable object `.o` files will be taken by linker
		2. It will resolve symbols and other info
		3. It will merge different sections of `.o` files into one executable (final executable) (`.elf`)
			1. `elf` - Executable and Linkable Format

### Compilation and Compiler Flags ###
1. Open workspace `my_workspace`
	1. Compilation

			arm-none-eabi-gcc -c main.c -o main.o
			
		1. We don't want to link (just compile and generate `.o` file)
		2. `-c` - just compile and assemble (don't link)
			1. GNU Compiler Collection (GCC) documentation: [https://gcc.gnu.org/onlinedocs/gcc-11.1.0/gcc/](https://gcc.gnu.org/onlinedocs/gcc-11.1.0/gcc/)
				1. Options containing the kind of output
		3. Problem: Assembler didn't work
			1. We did not mention the processor architecture
				1. The toolset can generate instructions for different architectures (M0, Arm 7, M3, M7, ...)
					1. Fix: Give processor name or architecture
						1. Machine dependent options: ARM Options

								-march=armv7ve (M4)
								
						2. OR another option:

								-mcpu=cortex-m4
								
							1. GCC uses this name to derive target ARM architecture (as if specified by `-march`)
						3. Instruction:

								arm-none-eabi-gcc -c -mcpu=cortex-m4 main.c -o main.o
								
						3. Another option: `-mthumb` (or else `-marm` will be considered by default)
							1. Generates Thumb ISA instructions
								1. There are other processors which support both
							2. Instruction:

									arm-none-eabi-gcc -c -mcpu=cortex-m4 -mthumb main.c -o main.o
									
								1. To generate Assembler code (and not object file)

										arm-none-eabi-gcc -S -mcpu=cortex-m4 -mthumb main.c -o main.s

### Makefile ###
1. Build automation:
2. Makefile
	1. Used to write steps
	2. `make` command executes instructions in `Makefile`
	3. Code

			CC=arm-none-eabi-gcc # variable
			MACH=cortex-m4
			CFLAGS= -c -mcpu=$(MACH) -mthumb -std=gnu11 -O0
			
			main.o: main.c
				$(CC) $(CFLAGS) -o $@ $^
			
		1. Syntax:

				target: dependency
					recipe
					
		2. `$^` - dependency
		3. `$@` - target
3. Install `make` for windows (Mac and Linux usually have it)
	1. GnuWin
	2. Set PATH variable to directory of `make`

### Analyzing Relocatable Obj Files ###
1. Analyzing .o files (Relocatable object files)
	1. `main.o` is in `elf` format (Executable and Linkable Format)
	2. ELF is standard file format for object files and executable files when you use GCC
		1. Format standard: describes the way of organizing various elements of program into different sections
			1. data
			2. read-only data (constants)
			3. code
			4. uninitialized data
			5. ...
2. Other file formats
	1. The Common Object File Format (COFF): Introduced by Unix System V
	2. Arm Image Format (AIF): Introduced by ARM
	3. SRECORD: Introduced by Motorola
3. Relocatable object files

		(source file)					(relocatable object file)
		main.c ----Compilation---> main.o
										machine code file.
										it doesn't contain
										any absolute addresses
										for data and code
										
	1. Object file analyzer tool:

			arm-none-eabi-objdump -h main.o
			
		1. `-h` - displays contents of section headers (different sections)
			1. `.text` - holds code or instructions
			2. `.data` - holds data
			3. `.bss` - holds un-initialized data
			4. `.rodata` - holds read only data
			5. `.comment` - added by compiler
			6. `.ARM.attributes` - added by compiler
		2. We can add our own user defined sections
		3. Disassemble:

				arm-none-eabi-objdump -d main.o > main_log
				
			1. All are from `.text` section
			2. Sizes are displayed by `-h` of different sections
		4. Full content: of all sections

				arm-none-eabi-objdump -s main.o
				
			1. `.rodata` - constant data
			2. `.comment` - metadata
		5. Dis-assembly of all the sections:

				arm-none-eabi-objdump -D main.o > main_log
				
			1. Shows variables
				1. Instructions in data section are not real commands
					1. Disassembly tries to map to valid instructions
		6. Why is it relocatable?
			1. First instruction of `<main>` is placed at address 00000000
			2. Rest of the instructions are at offset from the instruction 00000000
			3. Linker script relocates to the right address
			4. Makefile

					# ...
					all: main.o led.o
					# ...
					led.o: led.c
						$(CC) $(CFLAGS) -o $@ $^
						
				1. `make all` - tries to resolve dependencies for `all`
					1. It is done transitively
				2. `led.o` - base address is 00000000 in `.o` file
			5. Linker assigns relocatable addresses to each of the files
				1. Decided based on microcontroller memory map
			6. Base address of data section is also 00000000
			7. Base address of bss section is also 00000000

### Code and Data of a Program ###
1. Program:
	1. Code + Data
		1. Code operates on data
		2. Code (Instructions): stored in FLASH memory of microcontroller
		3. Data (Variables): stored in main memory (RAM)
			1. Data may change at any time during execution (cannot be stored on FLASH)
			2. Read only data can be stored on FLASH
				1. Doesn't have to be stored in RAM
			3. Text is not stored in Read/Write memory
			4. `.rodata` is stored in read-only memory
2. Sections:

		.data - contains initalized data
		.text - contains code (instructions)
		.rodata - contains read-only data
		user defined sections - contains data or code which programmer demands to put in user defined sections
		.bss - contains un-initialized data
		some special sections - added by compiler. contains special data
		
	1. When we load the elf file, we must ensure the sections go to proper memory destinations
		1. ROM - FLASH (special sections also go here)

### Linker and Locator ###
1. Linker and locator
	1. Use linker to merge similar sections of different object files and resolve all undefined symbols of different object files (?)
	2. Locator (part of linker) takes the help of linker script to
		1. Understand how you wish to merge different sections
		2. Assigns mentioned addresses to different sections (absolute addresses to merged sections)
2. The following is done by linker and locator with the help of linker script provided by you

		final.elf
			.text -> .text(main.o), .text(led.o)
			.data -> .data(main.o), .data(led.o)
			.bss -> .bss(main.o), .bss(led.o)
			.rodata -> .rodata(main.o), .rodata(led.o)
			
	1. Linked + Locator -> merging and relocation
3. Storage of final executable in code memory


						------------
						
							unused code memory
						------------
							.data (initialized global and static variables)
						------------
							.rodata
						------------
						
							.text
						------------
						Vector Table
		0x0800_0000	------------
		
	1. Program must be permanent after writing and hence in FLASH
	2. Vector Table (required by firmware)
		1. Included in startup file
	3. .rodata - typically placed after `.text`
	4. unused code memory - can be used for a different purpose
	5. The `.data` section is relocated to RAM
		1. Done by startup code
4. Startup code:
	1. Relocation

							-----------
							stack
							-----------
							Unused SRAM
							
							-----------
							heap
							-----------
							.bss (un-initialized global and static variables)
							-----------
			.data -----> .data (initialized global and static variables) 0x2000_0000
			
		1. Transfer of .data section to RAM (from FLASH)
			1. It is called as 'C' start-up
		2. .bss - reserved memory
		3. stack - startup code can initialize stack pointer
		4. 'C' startup code calls main function
		5. Boundaries: (initial address and size)
			1. `_edata`
			2. `_sdata`
			3. `_etext`
				1. Symbols should be defined to hold boundary addresses
					1. Startup code should have the initial addresses
						1. How to obtain boundary values (later)
5. Different data of a program and related sections
	1. `local_un_data`
	2. `local_i_data`
	3. `local_un_s_data`
	4. `local_i_s_data`
	5. `global_un_data`
	6. `global_i_data`
	7. `global_un_s_data`
	8. `global_i_s_data`

### Different Data and Sections of a Program ###
1. Different data of a program and related sections
	1. `local_un_data`
		1. local data of function
			1. Goes into stack (constructed and destroyed)
	2. `local_i_data`
		1. Stored in stack
	3. `local_un_s_data` 
		1. It is like global data but private to function
			1. Goes into BSS
	4. `local_i_s_data`
		1. It is like global data but private to function
			1. Goes into Data section
	5. `global_un_data` - global variables
		1. un-initialized
			1. It is not carrying any information
				1. Since these variables don't carry any useful data to "remember", why would you store in FLASH and waste memory?
					1. Compiler doesn't include the variables as part of .data section
						1. It belongs to BSS
	6. `global_i_data`
		1. initialized
			1. It should be stored in data section
	7. `global_un_s_data`
		1. un-initialized, static data (private)
			1. Not stored in data section (moved to bss)
	8. `global_i_s_data`
		1. initialized static data (private)
			1. Stored in data section
2. LMA - Load Memory Address (in FLASH)
3. VMA - Virtual Memory Address (Not virtual for microcontrollers)
	1. Startup code relocates to this
4. Table:
	1. Variable (data) | LOAD time | RUN time | Section | Note
	2. Global initializ| FLASH     | RAM      | .data   | copied to RAM
	3. Global un-init  | ---       | RAM      | .bss    | space reserve
	4. Global static in| FLASH     | RAM      | .data   | copied to RAM
	5. Global static un| ---       | RAM      | .bss    | space reserve
	6. Local init      | ---       | STACK    | ---     | consumed dyna
	7. Local un-initial| ---       | STACK    | ---     | consumed dyna
	8. Local static ini| FLASH     | RAM      | .data   | copied to RAM
	9. Local static un-| ---       | RAM      | .bss    | space reserve
	10. All global cons| FLASH     | ---      | .rodata |
	11. All local cons | ---       | STACK    | ---     | Like locals

3. .bss - initialized to zero

### BSS vs Data ###
1. .bss (block started by symbol) and .data section
	1. All uninitialized global variables and uninitialized static variables are stored in **.bss** section
		1. The variables do not have initial values and hence don't have to be stored in **.data** section (**.data** consumes FLASH space)
			1. If there is a large global uninitialized array in program and it is kept in **.data** section
				1. It would occupy FLASH (waste of space without any info)
	2. **.bss** doesn't consume any FLASH (unlike **.data** section)
		1. Just reserve RAM space for **.bss** section just using size & initialize the space to zero
			1. Typically done in startup code
		2. It does not have a load address
	3. Linker helps us determine the final size of **.bss** section
		1. Obtain size info from linker script symbols
2. Example:

		#include <stdint.h>
		
		uint32_t d_count = 300000; // into .data section
		
		int g_un_data1; // into .bss
		int g_un_data2 = 0; // into .bss (since it is 0)
		int g_i_data = 0x55; // .data
		static int g_un_s_data; // .bss
		static int g_i_s_data = 0x44; // .data
		
		int main(void) {
			// ...
			int l_un_data; // stack
			int l_i_data = 0x98; // stack but const is stored in flash
			static int l_un_s_data; // .bss
			static int l_i_s_data = 0x24; // .data
			// ...
		}

### Startup File of Microcontroller ###
1. Importance of start-up file
	1. Startup file is responsible for setting up right environment for main user code to run
	2. Code written in startup file runs before main().
		1. You can say startup file calls `main()`
	3. Some part of startup code file is target (Processor) dependent
	4. Startup code takes care of vector table placement (processor dependent) in code memory as required by ARM Cortex Mx processor
		1. Stack pointer initialization - the way we access stack pointer can be processor specific
		2. It may need to turn on co-processor (FPU say)
			1. If main code wants to do floating point operations
	5. Startup code may also take care of stack re-initialization
		1. It can alter stack placement
	6. Startup code is responsible of `.data`, `.bss` section initialization in main memory
		1. Copying data to `.data` and initialize `.bss` and then call `main()`

### Writing Startup File of Microcontroller From Scratch Part-1 ###
1. Start-up file
	1. Construct a vector table for microcontroller. 
		1. Vector tables are MCU specific
	2. Write a start-up code which initializes `.data` and `.bss` section in SRAM
	3. Call `main()`
2. Workspace
	1. `touch stm32_startup.c` - (or `.s` - assembly)
		1. Vector table placement:
		
				Addr of IRQ81 handler - 0x0800_0184
				Addr of IRQ80 handler - 0x0800_0180
				Addr of IRQ79 handler - 0x0800_017C
				...
				Addr of hardfault handler - 0x0800_000C
				Addr of NMI handler   - 0x0800_0008
				Addr of reset handler - 0x0800_0004
				Initial MSP value     - 0x0800_0000
				
			1. MSP
			2. 15 system exceptions
			3. 82 IRQs (IRQ0 - IRQ81)
		2. Total mem consumed: 82 + 15 + 1 = 98 word addressable memory locations = 98 * 4 = 392 bytes
	2. Construction of Vector Table:
		1. Construct an array to hold MSP and handlers addresses.

				uint32_t vectors[] = {store MSP and address of various handlers here};
				
		2. Instruct compiler not to include above array in `.data` section but in different user defined section
	3. Code:

			#include <stdint.h>
			
			#define SRAM_START 0x20000000U
			#define SRAM_SIZE (128 * 1024) // 128 KB
			#define SRAM_END ((SRAM_START) + (SRAM_SIZE))
			
			#define STACK_START SRAM_END
			
			void Reset_Handler(void);
			
			uint32_t vectors[] = {
				STACK_START,
				(uint32_t) &Reset_Handler,
			};
			
			void Reset_Handler(void) {
				
			}
			
		1. `vi Makefile`

				CFLAGS=... -Wall -O0

				all: main.o led.o stm32_startup.o
				# ...
				stm32_startup.o: stm32_startup.c
					$(CC) $(CFLAGS) -o $@ $^
					
				clean: # deletes object files and elf files
					rm -rf *.o *.elf

### Writing Startup File of Microcontroller From Scratch Part-2 ###
1. Instructing compiler to put vector into a user defined section
	1. Solution: Using compiler attribute
		1. GCC document: Common Variable Attribute > section Attribute
			1. Special section (instead of `.data` and `.bss`)

					struct duart a __attribute__((section ("DUART_A"))) = { 0 };
					
				1. Compiler generates a section by the name `DUART_A` and stores the variable in that section
			2. Changes:

					void NMI_Handler(void) __attribute__((weak, alias("Default_Handler")));
					void Hard_Handler(void) __attribute__((weak, alias("Default_Handler")));

					uint32_t vectors[] __attribute__((section (".isr_vector"))) = {
						STACK_START,
						(uint32_t) &Reset_Handler,
						(uint32_t) &NMI_Handler,
						(uint32_t) &Hard_Fault,
					};
					
					void Default_Handler(void) {
						while(1);
					}
					
				1. Now run: `arm-none-eabi-objdump.exe -h stm32_startup.o`
				2. It can be used with function prototype has well
				3. We need creation of 15 system exception handlers and 82 interrupt handlers
					1. we can have a single default handler for all exceptions and allow programmer to implement required handlers per application requirements
						1. Programmer may not be using all of them
				4. Function attribute: `weak` and `alias`
					1. `weak`: Lets programmer to override already defined weak function (dummy) with same function name
					2. `alias`: Lets programmer to give alias name for a function
						1. `Default_Handler` is an alias function name for `NMI_Handler`
							1. In vector table array, address of `Default_Handler` will be stored
								1. When NMI exception triggers, `Default_Handler` will be executed
					3. For programmer to override the functions, we have to make the symbols as `weak`
						1. Programmer can override the function with same function name in main application
							1. Programmer can implement real implementation of handling the exception
				5. In place of reserved, we have to put 0s

### Writing Startup File of Microcontroller From Scratch Part-3 ###
1. Populate rest of the vector table
2. Write start-up code which initializes .data and .bss
	1. Can be done in Reset_Handler (first function to get executed when processor undergoes reset)

			void Reset_Handler(void) {
				// copy data section to SRAM
				
				//init, the .bss section to 0 in SRAM
				
				// call init function of standard library (printf, scanf, ...)
				
				// call main()
			}
			
		1. Boundary info and size info
			1. Must be exported from linker script to startup file

### Writing Linker Script From Scratch Part-1 ###
1. Linker scripts
	1. Linker script is text file which explains how different sections of the object files should be merged to construct an output file
	2. Linker and locator combination assigns unique absolute addresses to different sections of the output file by referring to address info mentioned in linker script
	3. Linker script also includes code and data memory address and size information
		1. We have to mention various memories present on target board
		2. We have to mention size and address information
	4. Linker scripts are written using GNU linker command language
	5. GNU linker script has file extension of .ld
	6. We must supply linker script at linking phase to linker using `-T` option
2. Linker script commands
	1. `ENTRY`
		1. The command is used to set `entry point address` info in header of final elf file generated (populates entry point info in elf header)
			1. `Reset_Handler` in our case is entry point into application
				1. The first piece of code that executes right after processor reset
		2. Debugger uses the info to locate first function to execute
		3. Not a mandatory command to use
			1. Required when we debug elf file using debugger (GDB)
		4. Syntax: `ENTRY(_symbol_name_)` (function name aka symbol)

				ENTRY(Reset_Handler)
				
		5. Code: `vi stm32_ls.ld`

				ENTRY(Reset_Handler)
		
	2. `MEMORY`
		1. The command allows us to describe different memories present in target and their start address and size info
		2. The linker uses info mentioned in the command to assign addresses to merged sections (relocation to different addresses)
		3. The info is given under the command
			1. Helps linker to calculate total code and data memories consumed so far
			2. Throw error message if data, code, heap or stack areas cannot fit into available size
		4. Using memory command, we can fine-tune various memories available in target and allow different sections to occupy different memory areas
		5. Typically, one linker script has one memory command
		6. Syntax:

				MEMORY
				{
					name(attr): ORIGIN = origin, LENGTH = len
				}
				
			1. ORIGIN - defines origin address of memory region (start address)
			2. name - defines name of memory region (user-defined name)
				1. This will later be referenced by other parts of linker script
				2. It is label
				3. It has attribute list (optional)
			3. LENGTH - defines length info
			4. attr: defines attribute list of memory region
				1. Valid attribute lists must be make up of characters "ALIRWX" that match section attributes (case insensitive)
					1. R - read-only sections
					2. W - read-write sections
					3. X - Contains executable code
					4. A - allocated sections
					5. I - initialized sections
					6. L - same as 'I'
					7. ! - invert the sense of any of the following attributes
			5. Example:
				1. Microcontroller: STM32F4VGT6
				2. Flash size (in KB): 1024
				3. SRAM1 size (in KB): 112
				4. SRAM3 size (in KB): 16
				5. script:

						MEMORY
						{
							FLASH(RX): ORIGIN = 0x08000000, LENGTH = 1024K
							# SRAM1(RWX): ORIGIN = 0x20000000, LENGTH = 116K
							# SRAM2(RWX): ORIGIN = 0x20000000 + 116K - 4, LENGTH = 16K
							SRAM(RWX): ORIGIN = 0x20000000, LENGTH = 128K
						}
	
	3. `SECTIONS`
	4. `KEEP`
	5. `ALIGN`
	6. `AT>`

### Writing Linker Script From Scratch Part-2 ###
1. Sections command:
	1. SECTIONS command
		1. Used to construct different output sections in final elf executable generated
	2. Important command
		1. We can instruct linker how to merge input sections to yield output section
	3. Command also controls order in which different output sections appear in elf file generated
	4. Using the command, you also mention placement of section in memory region
		1. Example:
			1. You instruct linker to place `.text` section in FLASH memory region (described by MEMORY command)
2. Example:

		/* Sections */
		SECTIONS
		{
			/* This section should include .text section of all input files */
			.text:
			{
				// merge all .isr_vector section of all input files
				// merge all .text section of all input files
				// merge all .rodata section of all input files
			} >(vma) AT>(lma)
			
			/* This section should include .data section of all input files */
			.data:
			{
				// here merge all .data section of all input files
			}>(vma) AT>(lma)
		}
		
	1. The above file generates two sections in the output file generated
	2. The sections will appear in the given order
	3. `.text` - label (we can give any name)
		1. This is used to merge all individual sections of input files
			1. main.o, led.o. st32_startup.o
	4. `>(vma) AT>(lma)` - gives address info to linker and locator (where to place this section in memory)
		1. `lma` - load memory address
		2. `vma` - virtual memory address
	5. `.data` - used to merge all data sections
	6. Code:

			SECTIONS
			{
				.text :
				{
					*(.isr_vector)
					*(.text)
					*(.rodata)
				#}> FLASH AT> FLASH
				}> FLASH
				
				.data :
				{
					*(.data)
				}> SRAM AT> FLASH
				
				.bss :
				{
					*(.bss)
				}> SRAM
			}
			
		1. `*` - wildcard character
			1. Says merge `.text` section of all input files
		2. Storage of final executable:
			1. Initial storage must contain vector table
			2. Then text section
		3. We have to mention two memory regions for .text (vma, lma)
			1. But this is not relocatable address
				1. vma and lma are same for this section (it is in FLASH)
					1. Linker generates absolute addresses for the section
		4. Linker also generates load addresses
			1. The addresses fall in LMA memory region
		5. `.data`
			1. Load address is in FLASH
			2. Absolute address is in SRAM (falls in 0x20000000)

### Location Counter ###
1. We need to know the boundary
	1. Where .rodata ends
2. We need to know the size (or ending address of .rodata and .data)
	1. We can use this info to in 'C' start-up code
3. Boundary info:
4. Location counter (.)
	1. This is special linker symbol denoted by a dot '.'
	2. Symbol is called **location counter** since linker automatically updates the symbol with location (address) info
	3. We can use this symbol inside linker script to track and define boundaries of various sections
	4. We can also set location counter to any specific value while writing linker script
	5. Location counter should appear only inside `SECTIONS` command
	6. Location counter is incremented by size of output section
5. We use location counter symbols with other linker script symbols

### Linker Script Symbols ###
1. Linker script symbol
	1. A symbol is name of an address (or memory location)
		1. Symbol declaration is not equivalent to variable declaration (as in 'C' application)

				main.c
				
				int my_value = 100;
				// (global variable)
				
				my_value = $0; // we don't know the location here
				
				void fun1(void)
				{ ... }
				
				main.o
				Symbol table
				(address)		(symbol)
				0x2000_0000	my_value
				0x0800_0000	fun1
				
			1. The variable names must be converted to addresses
				1. How is this done?
					1. Done using symbol table
						1. Compiler maintains a table called symbol table in main.o
							1. Variable name or function name is called symbol name
							2. The address is resolved using symbol table
						2. Every object file maintains a symbol table
2. Inside linker script we want to catch boundary information
	1. We cannot use variables but we need to define symbols
		1. Linker script symbols

				MEMORY
				{
					//...
				}
				
				__max_heap_size = 0x400; /* A symbol declaration. Not a variable!!! */
				__max_stack_size = 0x200; /* A symbol declaration. Not a variable!!! */
				
				SECTION
				{
					.text:
					{ // . = VMA = 0x08000000
						// ...
						end_of_text = .; /* Store the updated location counter value in to a symbol 'end_of_text' - size of text section */
					}> FLASH
					
					.data
					{
						start_of_data = 0x20000000; /* Asign a value to a symbol 'start_of_data' */
						// ...
					}> SRAM AT> FLASH
				}
				
			1. Compiler cannot see these symbols
			2. Symbol table:

					Final elf generated
					
					Symbol Table
					Symbol Value		Symbol Name
					0x20000000		My_Value
					0x08000000		fun1
					0x400				__max_heap_size
					0x200				__max_stack_size
					
				1. Symbol values are addresses added by linker for variables and functions
				2. Custom symbol values added by us by constructing linker symbols in linker script: `__max_heap_size`, `__max_stack_size`

### Writing Linker Script From Scratch Part-3 ###
1. If we know the end of text section, we can know the address of `.data` section in the flash (this enables us to copy data to SRAM)
2. We should know destination address (of SRAM)
3. We should know the size
4. Script:

		SECTIONS
		{
			.text:
			{
				// ...
				_etext = .; /* end of text */
			}
			
			.data:
			{
				_sdata = .; /* start of data - SRAM address (not FLASH) */
				// ...
				_edata = .; /* end of data */
			}
			
			.bss:
			{
				_sbss = .; /* start of bss */
				// ...
				_ebss = .; /* end of bss */
			}
		}
		
	1. Location counter always tracks VMA or section in which is is being used (not LMA)

### Linking and Linker Flags ###
1. `make clean`
2. `make`
3. `arm-none-eabi-gcc -nostdlib -T stm32_ls.ld *.o -o final.elf`
	1. Remove `printf` statements from `main.c` and then compile
4. `arm-none-eabi-objdump -h final.elf`
5. Makefile

		# ...
		LDFLAGS= -nostdlib -T stm32_ls.ld
		
		all: main.o led.o stm32_startup.o final.elf
		# ...
		final.elf: main.o led.o startup.o
			$(CC) $(LDFLAGS) -o $@ $^
		
		clean:
			# ...
			
	1. `make clean`
	2. `make`

### Analyzing ELF File ###
1. Executable file is collection of different sections
	1. Ensure that all those sections are placed at appropriate absolute addresses
2. Map file: Linker can generate
	1. Used to analyze various resource allocation and placement in memory
	2. Makefile

			LDFLAGS = ... -Map=final.map # used by ld command
			
		1. GCC - also contains linker driver
			1. But certain linker specific arguments are not recognized by it
				1. Solution: `-Wl,-Map=final.map` (tells this is linker argument)
		2. `make clean`
		3. `make`
			1. final.map
				1. Open
					1. Shows memory map
						1. .text - 0x08000000
							1. `.isr_vector` starts from the beginning
							2. Third column: size of the section
							3. Different functions are placed and addresses assigned
			2. Add const variables in main.c

					const uint32_t const_v_1 = 100;
					const uint32_t const_v_2 = 200;
					
				1. `make clean`
				2. `make`
					1. `.rodata` section has const symbols (consumes 8 bytes)
				3. Padding is added between `.text` and `.rodata` (for word alignment)
					1. `*fill*` - 0x2
				4. `_etext = .` - holds location
					1. It is aligned address
						1. If it is not aligned
							1. We have to do it manually

									. = ALIGN(4); /* prev value will be taken and aligned to next word boundary and stored in location counter */
									_etext = .;
									
							2. map
								1. `*fill*` gets added
				5. `.data` section consumes only one byte
					1. It is initialized with only one variable
					2. File and variable name are also mentioned
				6. Making section aligned:

						. = ALIGN(4)
						_edata = .;
						
				7. `.bss`
					1. Un-initialized array went into COMMON section (not `.bss` section)
						1. This is defined by compiler
						2. But it has to be in `.bss`
						3. script:

								.bss :
								{
									// ...
									*(COMMON)
									. = ALIGN(4);
									_ebss = .;
								}
								
							1. `make clean`
							2. `make`
3. startup.c
	1. We can now initialize the sections

### Implementing Reset Handler ###
1. Code:

		extern uint32_t _etext;
		extern uint32_t _sdata;
		extern uint32_t _edata;
		extern uint32_t _sbss;
		extern uint32_t _ebss;
		// ...
		int main(void);
		
		void Reset_Handler(void) {
			// copy .data section to SRAM
			uint32_t size = &_edata - &_sdata;
			uint8_t *pSrc = (uint8_t*) &_etext;
			uint8_t *pDst = (uint8_t*) &_sdata;
			for (uint32_t i = 0; i < size; i++) {
				*pDst++ = *pSrc++;
			}
			
			// Init the .bss section to zero in SRAM
			size = &_ebss - &_sbss;
			uint8_t *pSrc = (uint8_t*) &_sbss;
			uint8_t *pDst = (uint8_t*) &_ebss;
			for (uint32_t i = 0; i < size; i++) {
				*pDst++ = 0;
			}
			
			// call main()
			main();
		}
		
	1. Run the following command to see all symbols

			arm-none-eabi-nm final.elf
			
		1. Prints symbol table
	2. In 'C' program, we cannot just write `_edata`
		1. It means that we want to access value from memory location `0x20000004`
			1. Associated with the variable
			2. But there is no value stored in any memory location for the symbol `_edata`
				1. Solution: use `&_edata`
				2. This will give corresponding symbol value (an address in the case) from symbol table (value 0x20000004)
	3. `make clean`
	4. `make`

### OpenOCD and Debug Adapters ###
1. Downloading and debugging executable

		Host               Dev Board/Microcontroller
		.elf --download--> Flash
		
	1. After this we can run the program
2. Methods:
	1. Host Interface: USB
	2. In-Circuit Programmer/ Debugger (Debug adapter)
		1. It is a hardware
		2. It does protocol convertion
			1. Host protocol to native target protocol
				1. USB to SWD or JTAG
					1. Target understands SWD or JTAG
					2. Host understands USB/ Serial port/ Parallel port
						1. We need program to talk to target
							1. OpenOCD (say)
	3. Target Interface: SWD or JTAG (Target)
3. OpenOCD:
	1. Open On-Chip Debugger (OpenOCD) aims to provide debugging
		1. in-system programming
		2. boundary-scan testing for embedded target devices (?)
	2. It is free and opensource host application
		1. Allows us to do the following with our application
			1. Program
			2. Debug (using GDB)
			3. Analyze (using GDB)
	3. Supports various target boards based on different processor architectures
	4. OpenOCD currently supports
		1. Many types of debug adapters
			1. USB-based
			2. Parallel port-based
			3. Standalone boxes (that run OpenOCD internally)
	5. GDB Debug: (various architectures - refer documentation)
		1. Allows ARM7 (ARM7TDMI and ARM20t), ARM9 (ARM920T, ARM922T, ARM926EJ-5, ARM966E-S), XScale (PXA25x, IXP42x), Cortex-M3 (Stellaris LM3, ST STM32, and Energy Micro EFM32) and Intel Quart (x10xx) based cores to be debugged via the GDB protocol.
	6. Flash programming (we want to program internal flash using OpenOCD - it supports flash writing)
		1. Flash writing is supported for external CFI-compatible NOR flashes (Intel and AMD/Spansion command set) and several internal flashes (LPC1700, LPC1800, LPC2000, LPC4300, AT91SAM7, AT91SAM3U, STR7x, STR9x, LM3, STM32x, and EFM32).
		2. Preliminary support for various NAND flash controllers
			1. (LPC3180, Orion, S3C24xx, more) is included
4. Programming adapters
	1. These are used to get access to debug interface of target with native protocol signaling
		1. Such as
			1. SWD
			2. JTAG
		2. Since HOST doesn't support such interfaces
	2. It does protocol conversion
		1. Example: Commands and messages coming from host application in the form of USB packets will be converted to equivalent debug interface signaling (SWD or JTAG) and vice versa
	3. Debug adapter helps us download and debug the code
	4. Some advanced debuggers help us capture trace events such as 
		1. On the fly instruction trace and profiling info
5. Popular debug adapters
	1. SEGGER J-Link EDU - JTAG/SWD Debugger
		1. Multiple CPUs supported - 8051, PIC32, RX, ARM7/9/11
		2. Cortex M/R/A, RISC-V
		3. Download speed up to 1 MByte/s
		4. Debug Protocol: JTAG/SWD
		5. Target Interface: 20-pin
			1. Debug interface
			2. Trace interface
			3. ...
	2. Keil ULink/Pro
		1. Target Connectors 10-pin (0.05") - Cortex Debug Connector
		2. 20-pin (0.10") - ARM Standard JTAG Connector
		3. 20-pin (0.05") - Cortex Debug + ETM Connector
		4. SWO (100 Mbps)
		4. Provides extended on-the-fly debug capabilities for Cortex-M devices (while processor is running at full speed). 
			1. We can control the processor
			2. We can set breakpoints
			3. We can read/write memory contents
		5. High-Speed data and instruction trace are streamed directly to the PC enabling us to analyze detailed program behaviour
	3. ST-LINK/V2
		1. In-circuit debugger and programmer for STM8 and STM32 microcontroller families
		2. Single Wire Interface Module (SWIM) and JTAG/Serial Wire Debugging (SWD) interfaces
			1. Used to communicate with any STM8 and STM32 microcontroller located on application board (only STM)
				1. Hacks:
					1. We can flash JLink firmware and convert it to JLink hardware (from Segger)
	4. STM32F4-DISC1 board
		1. It has embedded ST-LINK-V2A in-circuit programmer and debugger
		2. Supports only SWD debug protocol (No JTAG)
		3. This debugger can be used to program the microcontroller
6. Downloading process:

		HOST PC		
		Telnet Client		GDB Client
		(Port 4444)		(Port 3333)
				^           ^
				|           |
				+-----+-----+
				      |
				      v
				   OpenOCD           <---- Telnet Client (remote)
				(GDB, Telnet server, <---- GDB Client (remote)
				Flash programming driver)
				      ^
				      |
				      v
				  ST-LINK driver <--USB--> SWD or JTAG
				                          Debug adapter
				                           |      ^
				                           |      |
				                         SWDCLK  SWDIO
				                           |      |
				                           v      v
				                              DP
				                           SWJ-DP/
				                           SW-DP
				                              |
				                              |
				                     ARM Cortex Mx Processor
				                     AHB-AP ---- AHB ---- Core
				                                inter
				                               connect
				                                  ^
				                                  |
				                               AHB Bus
				                                  |
				                           +------+------+
				                           |      |      |
				                           v      v      v
				                         SRAM  FLASH    Other Peripherals
				                               Controller
				                               ----------
				                               Flash Memory
	
	1. STLINK driver must be installed on Host
	2. OpenOCD sends USB packets to SWD or JTAG debug adapter
	3. SWD
		1. Two pins
			1. SWDCLK
				1. Controlled by debug adapter
					1. Debug adapter is SWD master here
			2. SWDIO
				1. Bi-directional data line
				2. Commands and responses will travel
	4. Microcontroller
		1. Two pins are used (for SWDCLK and SWDIO)
		2. DP - Debug Port (Debug Access Port)
			1. The block knows how to talk to the processor (through the bus)
			2. It can access bus interfaces
				1. AHB
				2. APB
			3. The bus interfaces are accessed through bus access points
				1. AHB-AP
					1. Can access FLASH, SRAM, Other peripherals (AHB), Core (reset, break-points, watch-points, ...)
				2. APB-AP
		3. The packets carry address info and data (such as code)
	5. Discovery board has on-board debug adapter
		1. ST-LINK driver sends and/or receives USB packets to and from on board ST LINK adapter

### Steps to Download Code Using OpenOCD ###
1. Steps to download:
	1. Download and install OpenOCD
	2. Install Telnet client (for windows we can use PuTTY software)
		1. If we cannot use Telnet application, we can use "GDB Client"
	3. Run OpenOCD with board configuration file
	4. Connect to OpenOCD via Telnet Client or GDB client
	5. Issue commands over Telnet Client or GDB Client to OpenOCD to download and debug code
2. Search for OpenOCD
	1. Getting OpenOCD
	2. Unofficial binary packages
	3. GNU MCU Eclipse OpenOCD
	4. Assets
3. Board File	 (We have to execute OpenOCD with board file) 
	1. Scripts > Board
		1. stm32f4disovery.cfg
4. Mac - GDB Client
5. Windows - PuTTY
6. Ubuntu - Telnet
7. Set path for OpenOCD (`bin` folder)
	1. `PATH`
8. Makefile

		load:
			openocd -f board/stm32f4discovery.cfg
			
	1. `make clean`
	2. `make`
	3. Connect target board before running the command
		1. (STM32F4 DISCOVERY) to PC

### Using GDB Client ###
1. OpenOCD server is running
	1. We can connect to the server over various client programs (telnet client, GDB client, ...)
2. Open another terminal
	1. GDB (Run GDB client and then connect to OpenOCD server via the port 3333)

			arm-none-eabi-gdb
			
		1. Command to connect to OpenOCD server via port 3333

				target remote localhost:3333
				
			1. Connects to OpenOCD Server
		2. Scripts

				monitor reset init
				
			1. `monitor` - differentiates between GDB command and OpenOCD command
				1. This is not required for telnet
			2. `reset init` - OpenOCD command
		3. Downloading executable

				monitor flash write_image erase final.elf
				
			1. Search for openocd general commands in Google
		4. Reset microcontroller and halt

				monitor reset halt
				
		5. Run the program:

				monitor resume
				
		6. Halt execution

				monitor halt
				
		7. Reset the board

				monitor reset
				
3. Validate memory location values
	1. Open map file
		1. `.data` - 0x20000000 (current_task)
			1. Read location using OpenOCD
				1. `mdd` (double word) or `mdw` (word) or `mdh` (half word), `mdb` (byte)

						monitor mdw 0x20000000 4
						
					1. Data copy from flash to SRAM was wrong!!!

							uint32_t size = (uint32_t)&_edata - (uint32_t)&_sdata;
							
		2. `make clean`
		3. `make all`
		4. `arm-none-eabi-gdb`
		5. `target remote localhost:3333`
		6. `monitor reset init`
		7. `monitor flash write_image erase final.elf`
		8. `monitor reset`
		9. `monitor halt`
		10. `monitor mdw 0x20000000`
	2. Breakpoint (at address - get the address from map file)

			monitor bp 0x080001c6 2 hw
			
		1. `2` - length in bytes
		2. `hw` - hardware breakpoint (another option - software breakpoint)
		3. `monitor reset`
		4. `monitor mdw 0x20000000 4` - task 1 handler
	3. Removing breakpoint

			rbp 0x0800001c6
			bp
			monitor bp # no breakpoints set
			monitor bp 0x080000228 2 hw
			monitor reset # halts at location
			monitor mdw 0x20000000 4 # current task is 4
			
4. Telnet:
	1. Open PuTTY
		1. localhost:4444
		2. Telnet
		3. OpenOCD - session
		4. Save
		5. Open
	2. Commands: (they are same but we must not use `monitor`)

			reset init
			flash write_image erase final.elf

### C Standard Library Integration ###
1. 'C' standard library - `newlib` & `newlib-nano`
2. Newlib
	1. It is a 'C' standard library implementation intended for use on embedded systems
		1. Introduced by Cygnus solutions (now Red Hat)
	2. It is written as a Glibc (GNU libc) replacement for embedded systems
		1. Can be used with no OS ("bare-metal") or with lightweight RTOS
	3. It ships with gnu ARM toolchain installation as the default C standard library
	4. GNU libc (glibc) includes following interfaces
		1. ISO C
		2. POSIX
		3. System V
		4. XPG
	5. uClibc provides
		1. ISO C
		2. POSIX
		3. System V
	6. Newlib provides only ISO C
		1. Less feature set
3. Newlib-nano
	1. Due to increased feature set in newlib, it has become too bloated to use on systems where amount of memory is very much limited
		1. Especially for low memory embedded systems
	2. To provide C library with minimal memory footprint, suited for use with micro-controllers, ARM introduced newlib-nano based on newlib
		1. Doesn't support float data type by default
			1. Needs extra compiler argument
4. Go to toolchain installation path:
	1. libc.a - newlib library
	2. libc_nano.a - newlib-nano library
	3. librdimon.a - semi-hosting library (used for console IO operations like printf)
	4. librdimon_nano.a
	5. nano.specs - spec files (used during linking stage - to make application link to the libraries)
	6. nosys.specs - spec files
	7. pid.specs - spec files
	8. rdimon.specs - spec files
5. Low level system calls
	1. The idea of Newlib is 
		1. To implement hardware-independent parts of standard C library and 
		2. Rely on a few low-level system calls (that must be implemented with target hardware in mind)
			1. Newlib doesn't provide low level system calls to operate on hardware (we have to provide the low level system calls)
	2. When we are using newlib, 
		1. We must implement system calls appropriately to support devices, filesystems, memory management
	3. Design

			printf() - embedded application ('C' std lib function)
				|
				v
			Newlib-Nano - 'C' standard library (provides printf and calls _write())
				|
				_write();
				|
				v
			_write() {...} - (the function implementation here will received all strings pre-formatted by printf())
				|	|	|
				v	v	v
			UART  ITM	LCD
			
		1. `_write` - stubs (low level target specific system call implementation)
			1. The iplementation provided by us can write into
				1. UART
				2. ITM FIFO
				3. LCD
				4. ...
		2. Other system calls to be provided
			1. `scanf` -> `_read() {...}`
			2. `malloc` -> `_sbrk() {...}` - dynamic memory management API
	4. System Calls
		1. Download system calls implementation file `syscalls.c` attached with the lecture and place it in workspace - [https://www.udemy.com/course/embedded-system-programming-on-arm-cortex-m3m4/learn/lecture/19409108#overview](https://www.udemy.com/course/embedded-system-programming-on-arm-cortex-m3m4/learn/lecture/19409108#overview)
			1. It doesn't contain complete implementation (used to just compile without errors)

### Integrating System Calls ###
1. `vi Makefile`

		LDFLAGS= --spec=nano.specs -T ... 
		# ...
		all: main.o led.o stm32_startup.o syscalls.o final.elf
		# ...
		syscalls.o: syscalls.c
			$(CC) $(CFLAGS) -o $@ $^
		final.elf: main.o led.o stm32_startup.o syscalls.o
			# ...
			
	1. `nosys.specs` - no system calls
	2. `nano.specs` - newlib-nano
	3. `rdimon.specs` - semi hosting
	4. `--specs=nano.specs` - links the application with newlib-nano C standard library
		1. `nostdlib` must not be present in the flags
2. `main.c`
	1. Enable all printfs
	2. `make clean`
	3. `make`
		1. Errors: certain library files need some symbols (`__bss_start__`, `__bss_end__`, `end`)
			1. Fix: Linker script

					.bss :
					{
						_sbss = .;
						__bss_start__ = _sbss;
						# ...
						_ebss = .;
						__bss_end__ = _ebss;
						. = ALIGN(4);
						end = .;
					}
					
				1. `end` - helps memory management function to locate the end of heap
					1. Must be initialized to start of heap
						1. Later on, memory management unit can update the symbol to understand whether more mem can be allocated or not
							1. `_sbrk` function uses it
								1. the end of heap is compared with stack pointer to check if no more memory can be allocated or not (it must be start of heap to begin with)
									1. Heap starts after .bss section
3. Run object dump:
	1. `arm-none-eabi-objdump final.elf`
		1. Standard library has introduced a lot of sections
			1. Every function is considered as a sub-text section
				1. All the sections must be resolved to a single text section
						 
### Section Merging of Standard Library ###
1. C library introduces every function as a separate text section
	1. We can merge all of them into a common .text section
	2. We can merge all of .rodata sections into common .rodata section
2. Linker script

		SECTIONS
		{
			.text :
			{
				*(.isr_vector)
				*(.text)
				*(.text.*) # this one
				*(.init)
				*(.fini)
				*(.rodata)
				*(.rodata.*) # this one
				# ...
			} ...
			.data :
			{
				# ...
				*(.data)
				*(.data.*)
				# ...
			} ...
			
			.bss :
			{
				# ...
				*(.bss)
				*(.bss.*)
				# ...
			}
			
	1. `make clean`
	2. `make`
	3. If there are any unmerged sections, the linker will include the sections as they are in the output file
4. Testing:
	1. Flow:

			Reset_Handler()
				|
				v
			Initialize data section
				|
				v
			Initialize bss section
				|
				v
			Initialize 'C' std library (__libc_init_array();)
				|
				v
				main();
				
		1. `__libc_init_array();` - function that initializes C standard library
			1. `stm32_startup.c`

					void __libc_init_array();
					// ...
					void Reset_Handler(void) {
						// ...
						__libc_init_array();
						main();
					}
					
		2. Add printf in main.c

				printf("Implementation of simple task scheduler\n");
				
			1. `_write` - we will not be able to write because we have not implemented for the hardware
				1. But we can test std lib integration
	2. Makefile

			LDFLAGS= -mcpu=$(MACH) -mthumb ...
			
		1. We are linking with standard C library
		2. `-mfloat-abi=name` - specifies which floating point ABI to use
			1. `soft` - generate output containing **library calls** for floating-point operations
			2. `softfp` - generate code using hardware floating-point instructions (but uses soft-float calling conventions)
			3. `hard` - allows generation of floating-point instructions and uses FPU-specific calling conventions (if supported by processor)
				1. ARM-Cortex-M4F - supports
					1. We must enable it before using it
	3. Makefile

			CFLAGS= ... -mfloat-abi=soft ...
			LDFLAGS= ... -mfloat-abi=soft ...
			
		1. `make clean`
		2. `make`
		3. Connect the board and test
			1. PuTTY
				1. `reset init`
				2. `flash write_image final.elf`
				3. `reset halt`
					1. There are two more sections between .text and .data (so end of .text is not equal to start of .data)

### Fixing Linker Script to Resolve hardfault ###
1. Linker script

		_la_data = LOADADDR(.data); # returns 
		.data :
		{
			# ...
			
	1. `LOADADDR` - returns load address of `.data` section
2. Reset Handler (startup.c)

		extern uint32_t _la_data;
		// ...
		void Reset_Handler(void) {
			// ...
			uint8_t *pSrc = (uint8_t*) &_la_data; //flash instead of _etext
			// ...
		}
		
	1. `make clean`
	2. `make`
	3. `reset init`
	4. `flash write_image erase final.elf`
	5. `reset`
	6. `halt`
	7. `resume`

### Semi-Hosting ###
1. It is a technique by which we can see the printf messages on OpenOCD console
	1. OpenOCD should be in connection with hardware (it should be running)
		1. Printf messages are pulled by OpenOCD and displayed on console
2. Makefile

		LDFLAGS_SH= ... --specs=rdimon.specs ...
		# ...
		semi: main.o led.o stm32_startup.o final_sh.elf
		# ...
		final_sh.elf: main.o led.o stm32_startup.o
			$(CC) $(LDFLAGS_SH) -o $@ $^
		
	1. Copy from `LDFLAGS`
3. main.c

		// semi hosting init function
		extern void initialize_monitor_handles(void);

		int main(void) {
			initialize_monitor_handles();
			// ...
		}
		
	1. `make clean`
	2. `make semi`
4. linker script

		.bss :
		{
			# ...
			end = .;
			__end__ = .;
		}> SRAM
		
5. main.c

		void task1_handler(void)
		{
			while(1)
			{
				// ...
				print("Task1 is executing\n");
			}
		}
		// ...
		
	1. `\n` is important for semihosting (taken as marker to mark end of the message)
	2. `make clean`
	3. `make semi`
	4. `reset init`
	5. `flash write_image erase final_sh.elf`
	6. `arm semihosting enable`
	7. `reset`
	8. `halt`
	9. `shutdown` - terminates OpenOCD (disconnected)

## Thank You ##
### Bonus Lecture ###
1. [https://www.facebook.com/groups/fastbiteba/](https://www.facebook.com/groups/fastbiteba/)
2. [www.fastbitlab.com](www.fastbitlab.com)
3. [https://www.youtube.com/channel/UCa1REBV9hyrzGp2mjJCagBg](https://www.youtube.com/channel/UCa1REBV9hyrzGp2mjJCagBg)
4. [https://www.facebook.com/fastbiteba](https://www.facebook.com/fastbiteba)
5. [https://www.linkedin.com/in/fastbitlab](https://www.linkedin.com/in/fastbitlab)
6. [https://twitter.com/fastbiteba](https://twitter.com/fastbiteba)