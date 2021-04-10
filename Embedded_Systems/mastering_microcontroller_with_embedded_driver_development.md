# Mastering Microcontroller with Embedded Driver Development #

## Notes and Information ##
### Important Note ###
1. [https://support.udemy.com/hc/en-us/articles/229233387-How-to-Use-the-Q-A](https://support.udemy.com/hc/en-us/articles/229233387-How-to-Use-the-Q-A)

### Source Code ###
1. [https://github.com/niekiran/MasteringMCU.git](https://github.com/niekiran/MasteringMCU.git)

## Development board used in our course ##
### About MCU Development Board ###
1. ST-F446RE-Nucleo
	1. Discovery - more expensive (code is compatible for both)
2. Documentation is avialable?
	1. ST maintains all docs
		1. Code samples
		2. Reference manuals
		3. Programmer manuals
3. On-board debugger
	1. STM32F4RE-Nucleo has one
	2. Otherwise we may need external debuggers
		1. Example: Arduino
4. CAN protocol support must exist (446RE has)
5. 100+ KB SRAM
6. Flash memory - 512kB to 1MB

### STM32F4 Discovery and Nucleo: Board Details ###
1. DISC1 - newer board
	1. B997D - board id for newer board (MB997C - older)
2. ST link circuitry - debugger - used to flash and debug code from host software
3. Jumpers should be connected properly
4. Firmware - Product description page
	1. ST-LIN/V2-A for newer discovery board
5. 8 Mhz external clock - for ST-Link module
6. Microcontroller comes with an internal clock (RC-Oscillator)
	1. Discover board is more sophisticated
7. Necleo - board - lesser features
	1. Arduino compatable (arduino shields can be used)
	2. ST morpho compatable 
	3. No on-board sensors
	4. User button and reset button
	5. No on-board external oscillator
	6. Has virtual COM support
		1. Device manager - Ports (COM & LPT) > STM STLink Vitual COM Port (COM3)
			1. We can talk to the board using UART by connecting to PC
		2. Discovery board needs to be configured for this:
			1. ST_LINK/V2-A VCP Configuration - User Manual
				1. U2 pin 12 and U2 pin 13 (not connected to USART)
					1. Solutions:
						1. UART to USB dongle - buy and they are cheap
							1. Short two wires (not easy)

## Hardware/Software Requirements ##
### Hardware/Software Requirements ###

## IDE Installation ##
### Downloading STM32CUBEIDE ###
1. IDE is a softwar ethat contains all essential tools to
	1. Develop
	2. Compile
	3. Link
	4. Debug
2. Compiler and debugger may have to be integrated manually
3. IDE: Eclipse-based STM32CubeIDE (developed by ST Microelectronics)
	1. For STM32 ARM-based microcontrollers
	2. Has STM32 related customization
4. Link: https://www.st.com/en/development-tools/stm32cubeide.html
5. You have to login

### Installation-Windows ###
### Installation-Ubuntu ###
1. Download
2. Extract
3. Give execute permission to *.sh script
4. `sudo ./<file>.sh`
5. Accept Agreement - `y`
6. Search for st

### Embedded Target ###
1. STM32F407VGT6 MCU based DISCOVERY board is used as target
2. Parts
	1. STM32F407VGT6 32 bit Microcontroller
	2. Processor: ARM Cortex - M4 with FPU (Floating Point Unit)
	3. IO pins for interfacing external components
		1. External interfacing IO headers
	4. Crystal oscillator - 8MHz
	5. On-board programmer and debugger
		1. Program or debug code
		2. Drivers from ST website
3. Mini-USB cable

### Documents Required ###
1. Documents related to microcontroller:
	1. STM32F407VG - landing page
		1. Resources
			1. Check Datasheet (PRODUCT SPECIFICATIONS section)
			2. Refernce Manuals (REFERENCE MANUALS section)
	2. stm32f407 discovery board (vendor website)
		1. Resources
			1. Product Specification (PRODUCT SPECIFICATIONS Section)
			2. User Manual (USER Manuals Section)
			3. Schematic (SCHEMATICS Section)

## Constructing a Project Using STM32CubeIDE ##
### Constructing Hello-World Project ###
1. Folder creation
2. Workspace:
3. Click on Start new STM32 Project
	1. If custom board:
		1. MCU/MPU Selector
	2. If Standard board:
		1. Board Selector
		2. Type board name is part number search box:
			1. STM32F4DISCOVERY
				1. Select - you can see picture and docs about features
				2. Resources:
					1. Data sheets
					2. User manuals
				3. Datasheet download
			2. NUCLEO-446RE
			3. Next: Project Name: 001HelloWorld
			4. Targeted Language: C
			5. Binary Type: Executable
			6. Targeted Project Type: Empty
				1. STM32Cube - used for cube project
					1. Peripheral config using cube software and generate code using GUI (not covered here)
			7. Structure:
				1. Src
					1. .c files
					2. main.c
				2. Inc
					1. headers files
			8. Right click on project and run Build Project
			9. Build logs:
				1. cross compiler is used
				2. Warning: FPU is not initialized (not discussed in the course)
					1. Right click on project
					2. Properties
					3. Settings
					4. Tool Settings
					5. MCU Settings
					6. Floating-point Unit: None
					7. Floating-point ABI: Software Implementation
				3. Rebuild
		3. Right click > Debug As > STM32 Cortex-M C/C++ Application
			1. Downloads code into target
			2. Sets board to debug mode
			3. Before that:
				1. Debug As > Select Debug configuration:
					1. Debugger
					2. Debug probe: ST-LINK (ST-LINK GDB server)
						1. There are two others
					3. Interface: SWD
					4. Access: port - dont change
					5. Serial Wire Viewer: (later)
						1. Enable
					6. Apply
					7. Okay
				2. Remember my decision > Switch to debug perspective
			4. Click on Terminate to terminate
		4. Simple problem:
			
				#include <stdio.h>
				
				int main(void) {
					printf("Hello World!\n");
					for(;;);
				}
				
		5. Build the project

### SWV Working Principle ###
1. How to see the message?
	1. printf - ARM Cortex M3/M4/M7 based MCUs
		1. Applicable to M3+ processors
	2. Printf works over SWO pin (Serial Wire Output) of SWD Interface
	3. ARM Cortex Processor connects to ST Link V2 Debug circuit using SWO pin
		1. ARM Cortex Processor:
			1. ITM unit - Instrumentation Trace Macrocell Unit
				1. ITM is an optional **application-driven** trace source that supports printf style debugging to trace operating system and **application events**, and generates **diagnostic system information**
				2. Serial Wire Debug (SWD)
					1. two-wire protocol for accessing ARM debug interface
						1. 2 pin debug + 1 pin trace
							1. trace: trace related info
			2. SWD:
				1. Two-wire protocol for accessing ARM debug interface
				2. part of ARM Debug Interface Spec v5 and is an alternative to JTAG
				3. Physical layer consists of two lines
					1. SWDIO: a bidirectional data line
						1. Insert breakpoint command example
					2. SWCLK: a clock driven by the host
						1. Synchronous protocol
				4. SWD interface is used to program MCUs internal flash
					1. you can access memory regions
					2. Add breakpoints
					3. stop/run CPU (from IDE)
				5. Serial wire viewer can be used for printf statements for debugging
					1. SWO - Trace pin
			3. SWD and JTAG:
				1. JTAG was the traditional mechanism for debug connections for ARM7/9 family, but with Cortex-M family, ARM introduced Serial Wire Debug (SWD) interface. SWD is designed to reduce pin count required for debug from 4 used by JTAG (excluding GND) down to 2. SWD provided additional pin SWO (Serial Wire Output) used for Single Wire Viewing (SWV) - low cost tracing technology
				3. ST-LINK V2 Modified SWD + SWV
					1. 2 - 3.3V
					2. 4 - SWCLK
					3. 5 - SWO
					4. 6 - SWDIO
					5. 7 - GND
			4. ITM Unit
				1. FIFO - Hardware buffer
					1. Write pintf data into FIFO
					2. SWO Pin is connected to it
						1. It is connected to ST Link circuitry of the board and can be captured using debug software (IDE)

### Testing Hello-World Through SWV ###
1. Copy pase the following code in syscalls.c

		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		//					Implementation of printf like feature using ARM Cortex M3/M4/ ITM functionality
		//					This function will not work for ARM Cortex M0/M0+
		//					If you are using Cortex M0, then you can use semihosting feature of openOCD
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		
		//Debug Exception and Monitor Control Register base address
		#define DEMCR        			*((volatile uint32_t*) 0xE000EDFCU )
		
		/* ITM register addresses */
		#define ITM_STIMULUS_PORT0   	*((volatile uint32_t*) 0xE0000000 )
		#define ITM_TRACE_EN          	*((volatile uint32_t*) 0xE0000E00 )
		
		void ITM_SendChar(uint8_t ch)
		{
		
			//Enable TRCENA
			DEMCR |= ( 1 << 24);
		
			//enable stimulus port 0
			ITM_TRACE_EN |= ( 1 << 0);
		
			// read FIFO status in bit [0]:
			while(!(ITM_STIMULUS_PORT0 & 1));
		
			//Write to ITM stimulus port0
			ITM_STIMULUS_PORT0 = ch;
		}
		
	1. This is the implementation of printf feature
	2. printf implementation in standard library:

			printf() 
			{
				__write();
			}
			
			__write()
			{
				ITM_sendChar();
				//LCD_sendChar();
				//UART_sendChar();
			}
			
		1. `__write` is impemented in `syscalls.c`
		2. IDE captures and prints on console
2. Test: Build and debug

### OpenOCD and Semihosting to use printf ###
1. OpenOCD Debugger and Semi-Hosting
	1. Open On Chip Debugger - (can be used for M0+)
		1. Linker args:
			1. `-specs=rdimon.specs -lc -lrdimon`
		2. Semi-hosting run command:
			1. `monitor arm semihosting enable`
		3. Add below function call to main.c
		
				extern void initialise_monitor_handles(void);
				initialise_monitor_handles(void); 
				
			1. New project:
				1. Right click > Debug Config
					1. STM32 MCU Debugging
						1. New lannch config
							1. Debugger
								1. Open OCD
							2. Startup
								1. Run commands:

										monitor arm semihosting enable
										
							3. Appy
							4. Close
				2. Right click > Properties > C++ Build > Settings > Tools Settings > Linker > Miscellaneous
					1. Other Flags > +

							-specs=rdimon.specs -lc -lrdimon
							
				3. `main.c`

						extern void initialise_monitor_handles(void);
						
						int main(void)
						{
							initialise_monitor_handles();
							printf("...');
							for(;;);
						}
						
					1. Right click on syscalls.c > Properties > C++ Build > Exclude Resource from Build
					2. Build the project
					3. Debug As > STM32 C Application
						1. Switch
						2. Prints appear on the console

## Embedded Code Debugging Tips and Tricks ##
### Debugging Options ###
1. Options:
	1. Serial Wire Viewer and data tracing (printf style debugging)
	2. Single stepping, stepping over and stepping out (IDE)
		1. step by step execution
		2. Can view register and mem contents
	3. Breakpoints (Inserting, deleting and skipping breakpoints)
		1. HW breakpoints
	4. Disassembly
		1. Converting higher level language to assembly language
			1. Mnemonics constructed
			2. Instructions generated
	5. Call stack
	6. Expression and variable windows
		1. IDE features
			1. We can watch variables
			2. We can write expressions to see values and addresses of variables and functions
	7. Memory browser
		1. Examine contents of memory of uc
			1. Flash, SRAM, ...
		3. Host machine can show what is there in those memory modules
	8. Data watch-points
		1. Used to halt processor when a condition is met
2. ITM - internal peripheral - for printf style debugging
	1. Minimal time-space overhead
		1. Minimum code
		2. Time consumed is minimal (doesn't slow down app)
3. New Project:
	1. Copy code from resource: main.c

### Single Stepping ###
### Disassembly and Register Windows ###
### Breakpoints ###
### Expression and Variable Windows ###
### Memory Browser Windows ###
### Call Stack and Fault Analyzers ###
### Data Watch-Points ###
### SFR Windows ###
### Other Basic Features of IDE ###

## Understanding MCU Memory Map ##
### Understanding Memory Map of the MCU: Part 1 ###
### Understanding Memory Map of the MCU: Part 2 ###
### Understanding Memory Map of the MCU: Part 3 ###
### Quiz 1: Test your understanding ###

## MCU Bus Interfaces ##
### MCU Bus Interfaces Explanation Part 1: I-Code/D-Code/S-Bus ###
### MCU Bus Interfaces Explanation Part 2: AHB/APB1/APB2 ###
### MCU Bus Interfaces Explanation Part 3: Q/A Session ###
### Understanding MCU Bus Matri ###

## Understanding MCU Clocks and Details ##
### Understanding MCU Clocking System: Part 1 ###

## Understanding MCU Clock Tree ##
### Understanding MCU Clock Sources and HSE ###
### HSI and RCC Registers ###
### Peripheral Clock Configuration ###
### Exercise: HSI Measurements ###
### About USB Logic Analyzer ###
### Code Implementation ###
### Exercise: HSE Measurements ###

## Understanding MCU Vector Table ##
### Understanding MCU Vector Table ###

## Understanding MCU Interrupt Design, NVIC, Interrupt Handling ##
### Understanding MCU Interrupt Design, NVIC, Interrupt Handling: Part 1 ###
### Understanding MCU Interrupt Design, NVIC, Interrupt Handling: Part 2 ###
### Understanding MCU Interrupt Design, NVIC, Interrupt Handling: Part 3 ###

## Importance of "Volatile" Keyword ##
### Importance of "Volatile" Keyword: Part-1 ###
### Importance of "Volatile" Keyword: Part-2 ###

## GPIO Must Know Concepts ##
### GPIO Pin and GPIO Port ###
### GPIO Behind the Scene ###
### GPIO Input Mode with High Impedence State ###
### GPIO Input Mode with Pull-Up/Down State ###
### GPIO Output Mode with Open Drain State ###
### GPIO Output Mode with Push Pull State ###
