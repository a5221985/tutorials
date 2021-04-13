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

			int main(void) { // first function called (before this - reset handler is executed if reset)
			
				printf("In thread mode: before internet\n");
				
				generate_interrupt();
				
				printf("In thread mode: after interrupt\n");
				
				for(;;);
			}
			
			void RTC_WKUP_IRQHandler(void) {
				printf("In handler mode: ISR\n");
			}

### Access Level of the Processor ###
### Core Registers Part-1 ###
### Core Registers Part-2 ###
### Core Registers Part-3 ###
### Memory Mapped and Non-Memory Mapped Registers of the MCU ###

## ARM GCC Inline Assembly Coding ##
### ARM GCC Inline Assembly Coding Part-1 ###
### ARM GCC Inline Assembly Coding Part-2 ###
### ARM GCC Inline Assembly Coding Part-3 ###
### ARM GCC Inline Assembly Coding Part-4 ###

## Rest Sequence of the Processor ##
### Reset Sequence of the Processor ###
### Reset Sequence of the Processor Contd ###

## Access Level and T Bit ##
### Demonstration of Access Level of the Processor ###
### Importance of T Bit of the EPSR ###

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