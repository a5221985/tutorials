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
1. Memory map of MCU (STM32F407X)
	1. ARM Cortex M4
		1. Width of system bus is 32 bits
			1. Processor can produce 2^32 different addresses (4G)
				1. 0x0000_0000 to 0xFFFF_FFFF
	2. Memory map is in the range
		1. Manufacturer puts peripherals in the memory range
			1. Open reference manual
				1. Search for memory map
					1. Boundary addresses
						1. 0x4002_0400 - 0x4002_03FF - GPIOA
							1. All registers of GPIO port A are in this range
		2. If processor produces 0x4002_0400 on the system bus, it is referring to the GPIOA registers
			1. ST's implementation
			2. TI may put them in a different range
		3. Another example:
			1. 0x4001_5000 - 0x4001_53FF - SPI5
	3. The memory map gives the location of peripheral registers

### Understanding Memory Map of the MCU: Part 2 ###
1. TI's Tiva microcontroller
	1. Memory Model - processor memory map
		1. 0x4000_0000 - peripherals start here
			1. They have different addresses as compared to ST's microcontroller

### Understanding Memory Map of the MCU: Part 3 ###
1. Questions:
	1. What's the base address of AHB1 BUS peripheral registers?
		1. Find base address of AHB1 bus peripherals
			1. Few peripherals are connected to AHB1
				1. BUS column (AHB1, AHB2, ...)
					1. Starts from 0x4002_0000 (base address - AHB1_PERI_START_ADDRESS)
					2. Ends at 0x4007_FFFF (AHB1_PERI_END_ADDRESS)
	2. What's the base address of GPIOA registers?
		1. 0x4002_0000 - GPIOA
	3. What's the base address of RCC engine registers of the MCU?
		1. RCC - where is it connected? AHB1
			1. 0x4002_3800
	4. What's the base address of APB1 peripherals?
		1. 0x4000_0000 (TIM2)
	5. What's the base address of FLASH memory?
		1. 0x0800_0000
	6. What's the base address of SRAM2?
		1. 0x2000_0000 - SRAM1
		2. Size of SRAM1 - X bytes
		3. Base address of SRAM2 = 0x2000_0000 + X
	7. What's the base address of ADC1 registers?
		1. ADC1 is connected to APB2
			1. 0x4001_2000

### Quiz 1: Test your understanding ###

## MCU Bus Interfaces ##
### MCU Bus Interfaces Explanation Part 1: I-Code/D-Code/S-Bus ###
1. STM32F446xC/E
	1. Processor - ARM Cortex M4 (upto 180 MHz)
	2. Processor & peripherals talk via Bus interface
		1. I-BUS - Instruction Bus
		2. D-BUS - Data Bus
		3. S-BUS - System Bus
	3. Example:

			const char *pMessage = "Hi there, Good Morning !"; // stored in ROM (Flash memory)
			
			const int value = 200; // Stored in ROM (Flash memory) (cannot be changed)
			
			char myData[50]; // Stored in SRAM (content can be changed)
			
			int main(void) {
				for (uint32_t i = 0; i < strlen(pMessage); i++) {
					/* This is data copy from FLASH to SRAM */
					myData[i] = *(pMessage + i);
				}
				for(;;);
			}
	
		1. Instructions of the program will get stored in FLASH memory (along with constant data)
		2. Data:

				FLASH
				Instructions
				Const data (RO data)
				Vector tables
				
			1. Processor:

					ARM <- I-BUS - FLASH
					CM4 <- D-BUS - Const Data & Data
					
				1. Flash is connected to I-BUS
				2. Flash is connected to D-BUS (for RO data)
				3. Flash is connected through Flash Controller
	4. Technical Reference Manual of ARM Cortex M4 (ARM)
		1. Interfaces > Bus Interfaces
			1. Cortex-M4 - contains three external Advanced High-performance Bus (AHB)-Lite bus interface (I-BUS, D-BUS, S-BUS) & Advanced Peripheral Bus (APB) interface
			2. BUS: bound to a particular protocol (AHB-Lite protocol)
			3. I-Code: Instruction fetches from Code memory space (0x00000000 to 0x1FFFFFFF) are performed over 32-bit AHB-Lite bus
				1. If any instruction is placed outside the range, then I-Code cannot fetch
			4. D-Code:
				1. Data and debug accesses to Code memory space (0x00000000 to 0x1FFFFFFF) are performed over 32-bit AHB-Lite bus
					1. Core data acceses have higher priority than debug accesses on the bus (debug accesses are waited until aore accesses have completed)
			5. System Interface
				1. Instruction fetches, data, debug accesses to address ranges 0x20000000 to 0xDFFFFFFF & 0xE01000000 to 0xFFFFFFFF performed over 32-bit AHB-Lite bus
	
2. TM4C123GH

### MCU Bus Interfaces Explanation Part 2: AHB/APB1/APB2 ###
1. Summary:
	1. If instructions are present in between memory locations 0x00000000 to 0x1FFFFFFC then Cortex processor will fetch instructions using I-Code interface
		1. 0x08000000 falls in the range
	2. If instructions are present outside of 0x00000000 to 0x1FFFFFFC then processor fetches instructions over system bus
	3. If data is present in between memory locations 0x00000000 to ox1FFFFFFF, processor fetches data over D-Code bus interface
	4. If data is present outside, the data will be fetched over system bus
2. All peripherals fall outside I-Code & D-Code buses
	1. System Bus is used for peripherals
		1. SRAM1 & SRAM2
		2. Peripherals
3. System Bus - Extended using AHB BUS Matrix
	1. AHB1 Runs at 180 MHz (high speed)
	2. AHB1 is connected to a bridge
		1. Bridge converts to APB protocol (APB - slower 90 MHz & 45 MHz)
			1. APB1 (45 MHz) & APB2 (90 MHz)
		2. APB1
			1. TIMERs
			2. USARTs
			3. SPI
			4. ADC
		3. APB2
			1. TIMERs
			2. USARTs
			3. SPI
			4. I2C
			5. CAN
		3. AHB1
			1. GPIOx
	3. AHB2
		1. USB
		2. Camera (high speed required)
4. TI - TM4C123GH6PM
	1. ARM Cortex M4 - 80 MHz
	2. GPIO - connected to AHB and APB (high speed or low speed)

### MCU Bus Interfaces Explanation Part 3: Q/A Session ###
1. Q/A
	1. Is it true that, System Bus is not connected to FLASH memory?
		1. True
	2. Processor can fetch instructions from SRAM over i-code bus T/F?
		1. False (but there are advanced techniques to fetch instructions from SRAM)
	3. System Bus can operate at the speed up to 180 MHz
		1. True
	4. SRAMs are connected to System Bus T/F?
		1. True
	5. APB1 bus can operate at the speed up to 180MHz?
		1. False (45 MHz)
	6. Let's say I have a peripheral whose datasheet says that, it's operating frequency or speed must be above 95MHz, can I connect that peripheral via APB2 bus?
		1. No (APB2 bus max speed is 90MHz)
	7. Processor can fetch instructions as well as data simultaneously from SRAM T/F?
		1. False (only one bus connects to SRAM)
	8. Processor can fetch instructions as well as data simultaneously from FLASH T/F?
		1. True (I-Code & D-Code buses exist)
	9. What is the Max. HCLK value of your MCU?
		1. HCLK - Clock frequency of AHB Bus (notation)
			1. 180 MHz (max - it can be lowered)
	10. What is the Max P1CLK value of your MCU?
		1. P1CLK - Clock frequency of APB1 Bus
			1. 45 MHz
	11. What is the Max P2CLK value of your MCU?
		1. P2CLK - Clock frequency of APB2 Bus
			1. 90 MHz
	12. GPIOs and processor communicate over AHB1 bus?
		1. True
			1. AHB1 <-> AHB BUS Matrix <-> System Bus <-> Processor
				1. AHB Bus Matrix - it is like traffic controller
					1. Decides which BUS to connect at given point in time
						1. Serializes access
	13. USB OTG and processor communicate over AHB2 bus?
		1. True
			1. AHB2 <-> AHB Bus Matrix <-> System Bus <-> Processor
	14. USB OTG and GPIOs can communicate with processor concurrently or simultaneously?
		1. False (Serialized by AHB BUS Matrix)
	15. Processor can talk to FLASH memory and SRAM simultaneously?
		1. True (There are dedicated buses)
			1. I-Code & D-Code: FLASH
			2. S-BUS: SRAM

### Understanding MCU Bus Matrix ###
1. BUS Matrix:
	1. Application note (AN4031) - DMA COntroller
		1. Search for Bus Matrix
2. Diagram:
		
		CCM	   CORTEX M4    Ethernet  High Speed  Dual Port  DMA Port
		data    168MHz       10/100    USB2.0       DMA1      DMA2
		RAM    w/FPU & MPU  
		64 KB    Master      Master    Master      Master    Master
		  |     |  |  |
		  |  D-BUS I  S     FIFO/DMA  FIFO/DMA  FIFO/8 Srms FIFO/8 Srms
		  +-----|  |  |        |         |           |        | |
		        |--|--o--------|---------|-----------|--------o-o-AHB1
		        |  |  |        |         |           |        | |
		        |--|--o--------|---------|-----------|--------o-o-AHB2
		        |  |  |        |         |           |        | |
		        o--|--o--------o---------o-----------o--------o-o-SRAM1
		        |  |  |        |         |           |        | |
		        o--o--o--------o---------o-----------o--------o-o-SRAM2
		        |  |  |        |         |           |        | |
		        o--o--o--------o---------o-----------o--------o-o-FSMC
		        |  |  |        |         |           |        | | +--+
		        |--o--|--------|---------|-----------|---I----|-|-|A |
		        |  |  |        |         |           |        | | |R |
		        o--|--|--------|---------|-----------o---D----o-o-|T |
		                                                          +--+
		                                                          ^  ^
		                                                          |  |
		                                                          v  v
		                                                          FLASH
		                                                          1 MB

				Multi-AHB Bus Matrix
			
	1. Top - Masters
	2. Right - Slaves
	3. Multi-AHB Bus Matrix - Multiple AHB buses are connected
	4. `-o-` - Connectivity between master and slave
	5. Processor to Peripheral communication
		1. Seen as Master to Slave communication
			1. ARM Cortex - Master (focus is on this)
			2. Ehtenet 10/100 - Master
			3. High Speed USB 2.0 - Master
			4. Dual Port DMA1 & DMA2 - Masters
	6. Consider Cortex M4
		1. D-Bus (Master-Slave communication)
			1. Connected to SRAM1
			2. Connected to SRAM2
			3. Connected to FSMC (External memory controller)
			4. Connected to FLASH
				1. 4 devices can communicate with Processor over D-Bus (STM32 specific)
		2. I-Bus
			1. Connected to FSMC
			2. Connected to FLASH
				1. Cannot talk to any other device
		3. S-Bus
			1. Connected to AHB1
			2. Connected to AHB2
			3. Connected to SRAM1
			4. Connected to SRAM2
			5. Connected to FSMC

## Understanding MCU Clocks and Details ##
1. Clock - very important - microcontroller is a digital circuitry that is synchronous with the clock
	1. The digital components in the microcontroller need to synchronize with each other
	2. What is clock?
		1. Square wave signals of certain frequency
	3. Selecting right frquency is important
		1. Low power may need low frequency (power is related to frequency)
			1. [https://physics.stackexchange.com/questions/34766/how-does-power-consumption-vary-with-the-processor-frequency-in-a-typical-comput](https://physics.stackexchange.com/questions/34766/how-does-power-consumption-vary-with-the-processor-frequency-in-a-typical-comput)
				1. Processor contains FETs (complementary)
					1. When input goes low, small capacitance gets charged to hold small amount of energy
						1. The amount lost to capacitor
					2. When input goes high, the charge will be drained to ground and be lost
					3. So when level changes, n Joules are lost (at high once, at low once)
					4. If frequency is 1 MHz, switching occurs at 10^6 times per second => n.10^6 Joules per second is lost
					5. If frequency is 1 GHz, switching occurs at 10^9 times per second => n.10^9 Joules per second is lost
					6. Energy in a capacitor is `C.V^2 / 2` (dissipation varies quadratic with voltage)

							P = c.V^2.f + P_S
							
						1. c - scaling constant (with dimension of capacitance (F))
						2. P_S - static power dissipation (power at zero clock frequency)
					7. Hence P is proportional to f
2. Clocking system (STMF407)
	1. Reset and Clock Control Section > Clocks (Reference Manual)
		1. Three clock sources can be used to drive the system clock (SYSCLK)
			1. HSI oscillator clock
			2. HSE oscillator clock
			3. Main PLL (PLL) clock
	2. Sources:
		1. Crystal oscillator
			1. External component
			2. Connected to microcontroller
			3. This can be dropped based on design requirements
		2. RC oscillator
			1. Alternative
				1. Comes built in
			2. Simply activate and use
		3. PLL (Phase Locked Loop)
			1. Alternative
				1. Bomes built in
			2. Simply activate and use
			3. Generates higher frequency
				1. By taking lower frequency clock as input

## Understanding MCU Clock Tree ##
### Understanding MCU Clock Sources and HSE ###
1. RC - Resistive-and-Capacitive
2. Clocking engine (Reference: STM32F407)
3. RCC Peripheral (reset and clock control) > Clocks	1. Clock Tree (diagram)
4. Open STM32CubeIDE
	1. New project > Board Selector > STM32F407
		1. Name: Clock
		2. STM32Code
		3. Finish
		4. No
		5. Do you want ot open STM32CubeMx Perspective: Yes
		6. Yes
			1. Downloads HAL Layer > Cancel
				1. No code generation
		7. Clock Configuration
			1. HSI - High Speed Internal (RC Oscillator)
			2. HSE - High Speed External (Crystal oscillator) - 8MHz (user manual of board)
				1. Microcontroller spec - 4 - 26 MHz
				2. It is connected to microcontroller pins (where crystal is connected)
					1. Go to HSE/LSE clock sources diagram in reference manual

							    | OSC_IN  OSC_OUT|         
							    +--[ ]------[ ]--+
							        |        |
							 +-| |--+--|[]|--+--| |-+
							 | c_L1             c_L2|
							---                    ---
							 -                      -
							
						1. c_L1 & c_L2 - load capacitors

## Understanding MCU Clock Tree ##
1. RC - Resistive-and-Capacitive
2. Clocking engine (Reference: STM32F407)
3. RCC Peripheral (reset and clock control) > Clocks	1. Clock Tree (diagram)
4. Open STM32CubeIDE
	1. New project > Board Selector > STM32F407
		1. Name: Clock
		2. STM32Code
		3. Finish
		4. No
		5. Do you want ot open STM32CubeMx Perspective: Yes
		6. Yes
			1. Downloads HAL Layer > Cancel
				1. No code generation
		7. Clock Configuration
			1. HSI - High Speed Internal (RC Oscillator)
			2. HSE - High Speed External (Crystal oscillator) - 8MHz (user manual of board)
				1. Microcontroller spec - 4 - 26 MHz
				2. It is connected to microcontroller pins (where crystal is connected)
					1. Go to HSE/LSE clock sources diagram in reference manual

							    | OSC_IN  OSC_OUT|         
							    +--[ ]------[ ]--+
							        |        |
							 +-| |--+--|[]|--+--| |-+
							 | c_L1             c_L2|
							---                    ---
							 -                      -
							
						1. c_L1 & c_L2 - load capacitors
				3. Another way of providing external clock
					1. External clock configuration (mode)

							    |         OSC_OUT|         
							    +--[ ]------[ ]--+
							        ^      (HI-Z) 
							        |
							     External
							      source
							      
						1. External source
							1. Another microcontroller
							2. Another circuit
			3. Discovery boards come with crystal oscillator installed on the board
			4. Necleo boards don't come with on-board crystal oscillator
				1. External clock can be used
					1. On Nucelo board, HSE is supplied to microcontroller from ST-LINK circuitry (it has it's own microcontroller)
						1. 8 MHz clock source
				2. Go to user manual of the board:
					1. OSC Clock
						1. 3 ways to give external clock
							1. MCO form ST-LINK
							2. Oscillator on board - from X2 crystal
								1. Schematic
									1. PH0 & PH1 - 8 MHz
									2. X3 - not available on the board (Real-time clock)
								2. HSE oscillator (not provided)
									1. To connect and use this, de-solder MCO connection
5. Summary:
	1. HSE can be provided to the MCU via a crystal or external source
		1. from another circuit or from another MCU
	2. On STM32-DISCOVERY board, HSE is 8 MHz provided by onboard crystal
	3. On Nucleo board, HSE is 8 MHz pulled from ST-LINK circuit
		1. Do not do any soldering or desoldering on board for the course
			1. No need to make any chnages unless there is special requirements

### HSI and RCC Registers ###
1. HSI Clock
	1. Generated from interal 16 MHz RC oscillator (ST Microcontroller specific)
		1. Used directly as system clock OR
		2. Used as PLL input
	2. After reset, MCU uses HSI as its default clock source
		1. Power on reset OR
		2. System reset
	3. We can change clock to something else through code (HSE or PLL)
	4. Clock Configuration
		1. HSI RC
			1. 16 MHz
				1. Coming from within microcontroller
				2. Goes into System clock multiplexer
					1. Multiplexer can be configured to select one of the clocks
						1. HSE & PLL have to be enabled through code to use them
			2. In the diagram, we cannot select HSE (we can switch between HSI and PLL)
				1. Pinout - System Core
					1. RCC
						1. High Speed Clock (HSE)
							1. Crystal/Ceramic
					2. We can now select HSE
			3. The system clock is used to derive clocks for other microcontroller domains (peripherals)
				1. HCLK (AHB Clock)
					1. AHB Prescalar
						1. Used to divide the SYSCLK
							1. If SYSCLK = 400Mhz, Prescalar should divide it to produce 160 MHz (which is maximum for AHB)
				2. HCLK is used to derive clocks for other domains
					1. Ethernet PTP clock (doesn't depend on HCLK - uses SYSCLK)
					2. HCLK AHB bus core, memory and DMA (HCLK)
						1. GPIO
						2. Camera interfacing
						3. Memories
						4. ...
					3. To Cortex system timer (Systick timer)
						1. Derived from HCLK but through Pre-scalar
					4. FCLK Cortex clock
						1. Directly goes to processor
							1. Processor can run with speed of HCLK
					5. APB1 peripheral clocks
						1. PCLK1 - max 42 MHz
							1. Prescalar is used from HCLK
					6. APB1 timer clocks
						1. X1 is used from APB1 Prescalar
					7. APB2 peripheral clocks
						1. PCLK2 - max 84 MHz
							1. Prescalar is used from HCLK
					8. APB2 timer clocks
						1. X1 is used from APB2 Prescalar
2. PLL Engine
	1. Phased Lock Loop
		1. Clock multiplier engine
	2. Used to boost clock higher than HSI or HSE
	3. This can be used as source for SYSCLK
	4. It has multipliers and dividers
		1. These can be configured
			1. Example: 16 MHz to 100 MHz
	5. Source can be
		1. HSI
		2. HSE
	6. Useful for boosting clock speed
3. The configuration can be done in RCC peripheral register
	1. RCC registers > RCC clock control register
		1. PLL configuration register
		2. RCC clock configuration register
			1. AHB & APB prescalars
4. Default values
	1. HSI
		1. All pre-scalars are /1
			1. All clocks will be 16 MHz
5. Clock for I2S
	1. Derived from PLL engine (needs activating PLL engine)
6. Certain peripherals like the following will not work fine if we under-clock them (might need activating PLL)
	1. USB
	2. Ethernet
	3. ...

### Peripheral Clock Configuration ###
1. Configuration
	1. In modern MCUs, before using any peripheral, we must enable its peripheral clock using peripheral clock registers
	2. By default
		1. Peripheral clocks of almost all peripherals will be disabled to save power
	3. A peripheral won't take or respond to configuration values until we enable it's peripheral clock
	4. In STM32, peripheral clocks are managed through RCC registers
		1. RCC peripheral (System Peripheral)
			1. It is used to manage clocks of various domains
2. Using RCC we can control clocks of various domains (APB, AHB, Memory, ...)
	1. RCC Registers (used to configure peripheral clocks)
3. ADC Peripheral
	1. ADC Registers
		1. ADC Control Register CR1
			1. Assume we set bit 8
				1. Add offset to ADC register's base address
	2. New project: 004PeriClockEnable

			#include<stdint.h>
			#define ADC_BASE_ADDR 0x4001200UL
			#define ADC_CR1_REG_OFFSET 0x04UL
			#define ADC_CR1_REG_ADDR ((ADC_BASE_ADDR) + (ADC_CR1_REG_OFFSET))
			
			int main(void) {
				uint32_t* pAdcCrlReg = (uint32_t*) ADC_CR1_REG_ADDR;
				*pAdcCrlReg |= (1 << 8);
				for(;;);
			}
			
		1. Single step
		2. Window > Show View > SFR
			1. SCAN bit is not set (no effect)
				1. Clock is not enabled
4. Before configuring any peripheral, we must enable it's peripheral clock
5. How to enable?
	1. Know to which bus it is connected (Look at the memory map)
		1. ADC1 - connected to APB2 bus
	2. Goto RCC register
		1. RCC APB2 peripheral clock enable register (RCC_APB2ENR)
			1. Offset: 0x44 (from base address of RCC registers)
		2. Set 8th bit (1 - enabled)
	3. Code

			#define RCC_BASE_ADDR 0x40023800UL
			#define RCC_APB2_ENR_OFFSET 0x44UL
			#define RCC_APB2_ENR_ADDR ((RCC_BASE_ADDR) + (RCC_APB2_ENR_OFFSET))
			
			int main(void) {
				uint32_t *pRccApb2Enr = (uint32_tI) RCC_APB2_ENR_ADDR;
				
				// 1. Enable the peripheral clock for ADC1
				*pRccApb2Enr |= (1 << 8);
				
				// ...
			}

### Exercise: HSI Measurements ###
1. Write a program to output HSI clock on microcontroller pin and measure it using oscilloscope or logic analyser
2. Steps to output a clock on MCU pin
	1. Select the desired clock for the MOCx signal (Microcontroller Clock Output)
		1. Microcontroller Clock Output Signal
	2. Output the MCOx signal on MCU pin
3. MCO1 & MOC2 - signals that can be output
	1. Enable: RCC > Master Clock Output 1 & Master Clock Output 2
	2. The signal has to be routed to output pin
		1. We can divide using divisor
		2. The signal can be connected to another microcontroller
4. Reference Manual > RCC Clock Configuration Register (RCC_CFGR)
	1. Bits[21:22]
		1. 00: HSI clock selected
		2. 01: LSE oscillator selected (Low Speed External Oscillator)
		3. 10: HSE oscillator selected
		4. 11: PLL clock selected
	2. Explore Pin details
		1. Use Datasheet of Microcontroller
			1. Datasheet - pin details, electrical characteristics, ...
			2. Reference manual - peripherals, peripheral implementation, register sets, register config
5. Go to Pinouts and pin description
	1. Alternate function mapping (later) (16 modes possible - multiplexing (AF0 ... AF15))
		1. MCO1
			1. PA8 (Can be mapped to this pin if we select AF0 mode)
				1. I2C3_SCL - if we select AF4
				2. Pin 8 of Port A
	2. Pin and ball definitions
		1. PA8 - pin 41
			1. Depends on package
				1. LQFP64
				2. WLCSP90
				3. LQFP100 (100 is number of pins)

### About USB Logic Analyzer ###
1. Debugging hardware
	1. To trace signals of microcontroller peripherals
		1. I2C
		2. SPI
		3. UART
		4. ...
	2. USB Logic Analyser
		1. Can be connected to PC
			1. To trace signals of microcontroller
	3. Low cost solutions to digital oscilloscope
		1. Digital oscilloscope
			1. Variable key
			2. High price
			3. Many features
			4. High frequency range
		2. Those features are unavailable in logic analyser
	4. Saleae logic analyser
		1. www.saleae.com
			1. SPI, I2C and more
				1. To decode different prodotocols
				2. Software to capture and decode signals
	5. Logic 8 - for this course
		1. Must have
			1. Customer care can give discount
	6. Alternative
		1. USB Logic Analyzer with sigrok PulseView - Sparkfun
			1. PulseView - software
			2. 24 MHz - limitation (sufficient for the course)
		2. PicoScope 3000 Series (16 channel)
2. Download software

### Code Implementation ###
1. New Project:
	1. Code

			#include <stdint.h>
			
			#define RCC_BASE_ADDR 0x40023800UL
			#define RCC_CFGR_REG_OFFSET 0x08UL
			#define RCC_CFGR_REG_ADDR (RCC_BASE_ADDR + RCC_CFGR_REG_OFFSET)

			int main(void) {
				uint32_t *pRccCfgrReg = (uint32_t*) RCC_CFGR_REG_ADDR;
				
				// 1. Configure the RCC_CFGR MCO1 bit fields to select HSI as clock source
				*pRccCfgrReg &= ~(0x3 << 21); // clear 21 and 22 bit positions
			
				// 2. Configure PA8 to AF0 mode to behave as MCO1 signal
				// a. Enable the peripheral clock for GPIOA peripheral
				uint32_t *pR
			
				uint32_t *p
			
				for (;;);
			}

### Exercise: HSE Measurements ###

## Understanding MCU Vector Table ##
### Understanding MCU Vector Table ###

## Understanding MCU Interrupt Design, NVIC, Interrupt Handling ##
### Understanding MCU Interrupt Design, NVIC, Interrupt Handling: Part 1 ###
### Understanding MCU Interrupt Design, NVIC, Interrupt Handling: Part 2 ###
### Understanding MCU Interrupt Design, NVIC, Interrupt Handling: Part 3 ###

## Importance of "volatile" Keyword ##
### Importance of "volatile" Keyword: Part-1 ###
### Importance of "volatile" Keyword: Part-2 ###

## GPIO Must Know Concepts ##
### GPIO Pin and GPIO Port ###
### GPIO Behind the Scene ###
### GPIO Input Mode with High Impedence State ###
### GPIO Input Mode with Pull-Up/Down State ###
### GPIO Output Mode with Open Drain State ###
### GPIO Output Mode with Push Pull State ###
### Optimizing I/O Power Consumption ###

## GPIO Programming Structure and Registers ##
### GPIO Programming Structure ###
### Exploring GPIO PORT and Pins of STM32F4xx Discovery Board ###
### GPIO Mode Register (Used to Set Mode for a Pin) ###
### Input Configuration of a Microcontroller's GPIO Pin ###
### Output Configuration of a GPIO Pin in Push Pull Mode ###
### Output Configuration of a GPIO Pin in Open Drain Mode ###
### Input Stage of a GPIO Pin During Output Configuration ###
### Alternate Functionality Configuration of a GPIO Pin ###
### GPIO Output Type Register Explanation ###

## GPIO Registers: SPEED, PULL UP/ DOWN, IDR and ODR ##
### GPIO Output Speed Register and its applicability ###
### GPIO Pull Up and Pull Down Register ###
### GPIO Input Data Register ###
### GPIO Output Data Register and Summary of Various Modes Discussed ###

## GPIO Alternate Functionality Register and Example of Usage ##
### Alternate Functionality Settings of a GPIO Pin with Example: Part 1 ###
### Alternate Functionality Settings of a GPIO Pin with Example: Part 2 ###
### Request for Review ###

## GPIO Peripheral Clock Control ##
### Enabling and Disabling GPIO Peripheral Clock ###

## GPIO Driver Development Overview and Project Creation ##
### GPIO Driver Development Overview ###
### MCU Specific Header File and Its Contents ###
### New Project Creation and Constructing MCU Specific Headerfile ###
### Include Path Settings ###
### Important Note on IDE Usage ###

## Updating MCU Specific Header File with Bus Domain and Peripheral Details ##
### Writing Base Address C Macros for MCU's Embedded Memories: Part 1 ###
### Writing Base Address C Macros for MCU's Embedded Memories: Part 2 ###
### Defining Base Addresses of Different Bus Domains ###
### Defining Base Addresses of AHB1 Peripherals ###
### Defining Base Addresses Conclusion ###

## Structuring Peripheral Registers ##
### Address of Peripheral Registers ###
### Structuring Peripheral Registers ###
### Peripheral Definition Macros ###

## Writing Clock Enable and Disable Macros ##
### Writing Peripheral Clock Enable and Disable C Macros ###
### Project Include Settings and Build ###

## GPIO Driver API Requirements and Handle Structure ##
### Constructing GPIO Driver Header and Source File ###
### Defining GPIO Handle and Configuration Structure ###
### Driver API Requirements and Adding API Prototypes ###
### Driver API Input Parameters and Return Types ###
### Driver Empty API Implementation and Documentation ###

## GPIO Driver API Implementation: Clock Control ##
### Implementation of GPIO Peripheral Clock Control API ###

## GPIO Driver API Implementation: GPIO Init and De-Init ##
### Writing User Configurable Macros ###
### Implementation of GPIO Init API ###
### Implementation of GPIO Init API Contd. ###
### Configuring Alternate Function Registers ###
### GPIO De-Init API Implementation ###

## GPIO Driver API Implementation: GPIO Data Read and Write ##
### Implementation of GPIO Input Port Read and Input Pin Read APIs ###
### Implementation of GPIO Output Port Write and Output Pin Write APIs ###
### Implementation of GPIO Pin Toggle API ###

## Exercise ##
### Exercise: LED Toggling with PUSH PULL Configuration ###
### Exercise: LED Toggling with OPEN DRAIN Configuration ###
### Exercise: Handling on Board LED and Button ###
### Exercise: Connecting External Button and Circuit Explanation ###
### Exercise: Testing Button Interface ###
### Exercise: Button Interrupt Introduction ###

## GPIO Pin Interrupt Configuration ##
### GPIO Pin Interrupt Configuration Coding: Part 1 ###
### GPIO Pin Interrupt Configuration Coding: Part 2 ###
### GPIO Pin Interrupt Configuration Coding: Part 3 ###
### GPIO Pin Interrupt Configuration Coding: Part 4 ###
### GPIO Pin Interrupt Configuration Coding: Part 5 ###
### GPIO Pin Interrupt Configuration Coding: Part 6 ###
### GPIO Pin Interrupt Configuration Coding: Part 7 ###

## Exercise: GPIO Interrupts ##
### Exercise: External Button Interrupt Implementation ###
### Exercise: Debugging the Application: Part 1 ###
### Exercise: Debugging the Application: Part 2 ###

## MCU I/O Pin Specifications ##
### STM32 Pin Specifications ###
### Pin Current Characteristics ###
### Logic Levels ###

## SPI Introduction and Bus Details ##
### Introduction to SPI Bus ###
### SPI Comparison With Other Protocols ###
### Importance of SPI Slave Select Pin ###
### SPI Minimum Bus Configuration ###
### SPI Behind the Scene Data Communication Principle ###

## SPI Bus Configuration and Functional Block Diagram ##
### SPI Bus Configuration Discussion: Full Duplex, Half Duplex and Simplex ###
### SPI Functional Block Diagram Explanation ###

## STM32 NSS Pin Settings and Management ##
### NSS Settings in STM32 Master and Slave Modes ###
### STM32 SPI Hardware and Software Slave Managements ###

## SPI CPOL and CPHA Discussion ##
### SPI CPOL and CPHA Discussion ###
### SPI CPOL and CPHA Waveform Example ###

## SPI Serial Clock Discussion ##
### SPI Peripherals of Your Microcontroller ###
### SPI Serial Clock Frequency ###

## SPI Driver: API Requirements and Configuration Structure ##
### SPI API Requirements and Configuration Items ###
### Updating MCU Specific Header File and SPI Related Details ###
### SPI Adding API Prototypes to Driver Header File ###

## SPI Driver API Implementation: Clock Control ##
### Implementation of SPI Peripheral Clock Control API ###

## SPI Driver API Implementation: SPI Init ##
### SPI User Configuration Options Writing and Register Bit Definition Macros ###
### Implementation of SPI Init API: Part 1 ###
### Implementation of SPI Init API: Part 2 ###

## SPI Driver API Implementation: Send Data ##
### Implementation of SPI Send Data API: Part 1 ###
### Implementation of SPI Send Data API: Part 2 ###
### Implementation of SPI Send Data API: Part 3 ###
### Implementation of SPI Send Data API: Part 4 ###

## Exercise: SPI Send Data ##
### Exercise to Test SPI Send Data API ###
### Finding Out Microcontroller Pins to Communicate Over SPI2 ###
### Exercise: Code Implementation: Part 1 ###
### Exercise: Code Implementation: Part 2 ###
### Exercise: Code Implementation: Part 3 ###
### Exercise: Testing ###

## Exercise: STM32 Master and Arduino Slave Communication ##
### Exercise: Communicating With Arduino Slave ###
### Exercise: Coding Part 1 ###
### Exercise: Coding Part 2 ###
### Exercise: Coding Part 3 ###
### Exercise: Testing ###

## SPI Driver API: Receive Data ##
### Implementation of SPI Data Receive API: Part 1 ###
### Implementation of SPI Data Receive API: Part 2 ###

## Exercise: SPI Receive Data ##
### Exercise: SPI Command and Response Based Communication ###
### Exercise: Coding Part 1 ###
### Exercise: Coding Part 2 ###
### Exercise: Coding Part 3 ###

## SPI Interrupts ##
### SPI Peripheral Interrupting the Processor ###

## SPI Interrupt Mode APIs ##
### SPI Interrupt Mode API Implementation and Changes to Handle Structure ###
### SPI Send Data with Interrupt API Implementation ###
### SPI Receive Data With Interrupt Implementation ###

## SPI Driver API: IRQ Handling ##
### SPI: Handling of Interrupts ###
### SPI IRQ Handler Implementation: Part 1 ###
### SPI IRQ Handler Implementation: Part 2 ###
### SPI IRQ Handler Implementation: Part 3 ###
### Exercise ###

## Common Problems in SPI ##
### Common Problems in SPI and Debugging Tips ###

## I2C Introduction and I2C Signals ##
### I2C Introduction and Differences with SPI ###
### I2C SDA and SCL Signals ###

## I2C Modes ##
### I2C Standard and Fast Mode ###

## Understanding I2C Protocol ##
### I2C Protocol Explanation ###
### I2C START and STOP Conditions ###
### I2C ACK and NACK ###
### I2C Data Validity ###

## I2C Master and Slave Communication ##
### Example of Master Writing to Slave ###
### Understanding Repeating START Condition ###

## STM32 I2C Functional Block Diagram ##
### I2C Functional Block Diagram ###

## I2C Driver API Requirements and Config Structures ##
### I2C Driver API Requirements ###
### I2C Handle and Configuration Structure ###
### I2C User Configurable Macros ###
### I2C API Prototypes ###
### Steps for I2C Init Implementation ###

## I2C Serial Clock Discussion (SCLK) ##
### I2C Serial Clock Settings With Explanation ###
### Clock Stretching ###

## I2C Driver API: I2C Init ##
### Implementation of I2C Init API: Part 1 ###
### Implementation of I2C Init API: Part 2 ###
### Implementation of I2C Init API: Part 3 ###

## I2C Driver API: I2C Master Send Data ##
### I2C Transfer Sequence Diagram for Master Sending Data ###
### Implementation of I2C Master Sending Data API: Part 1 ###
### Implementation of I2C Master Sending Data API: Part 2 ###
### Implementation of I2C Master Sending Data API: Part 3 ###
### Implementation of I2C Master Sending Data API: Part 4 ###
### Implementation of I2C Master Sending Data API: Part 5 ###

## I2C Pull Up Resistance, Rise Time and Bus Capacitance ##
### I2C Pull UP Resistance, Rise Time and Bus Capacitance Discussion ###
### I2C Rise Time Calculation ###

## Exercise ##
### Exercise: Introduction ###
### Exercise: Coding Part 1 ###
### Exercise: Coding Part 2 ###
### Exercise: Testing ###

## I2C Driver API: I2C Master Receive Data ##
### I2C Transfer Sequence Diagram for Master Receiving Data ###
### Assignment: I2C Master Receive Data API Implementation ###
### Implementation of I2C Master Receive Data API: Part 1 ###
### Implementation of I2C Master Receive Data API: Part 2 ###

## Exercise ##
### Exercise: Reading Data from the I2C Slave ###
### Exercise: Coding Part 1 ###
### Exercise: Coding Part 2 ###
### Exercise: Coding Part 3 ###
### Exercise: Testing Repeated Start ###

## I2C Interrupts and IRQ Numbers ##
### I2C IRQ and Interrupt Discussion ###
### I2C Errors and Importance of BUSY Flag ###
### I2C Handle Structure Modification ###
### I2C Adding Interrupt Related Macros and Interrupt API ###

## I2C Interrupt Based API ##
### Assignment: I2C Interrupt APIs Implementation ###
### Implementation of I2C Interrupt Based APIs ###

## I2C IRQ Handler Implementation ##
### I2C IRQ Handler Implementation Part 1 ###
### I2C IRQ Handler Implementation Part 2 ###
### I2C IRQ Handler Implementation Part 3 ###
### I2C IRQ Handler Implementation Part 4 ###
### I2C IRQ Handler Implementation Part 5 ###
### I2C IRQ Handler Implementation Part 6 ###
### I2C IRQ Handler Implementation Part 7 ###
### I2C IRQ Handler Implementation Part 8 ###
### I2C Error IRQ Handler Implementation ###

## Exercise ##
### Exercise: Testing I2C Interrupt APIs Part 1 ###
### Exercise: Testing I2C Interrupt APIs Part 2 ###

## I2C Slave Programming ##
### I2C Slave Programming Discussion ###
### I2C Transfer Sequence Diagram for Slave Transmitter ###
### I2C Slave Support in Driver ###

## Exercise ##
### Exercise: I2C Slave Programming ###
### Exercise: Coding Part 1 ###
### Exercise: Testing ###
### Exercise: Modifying I2C Transactions ###

## Common Problems in I2C ##
### Common Problems in I2C and Debugging Tips ###

## UART Essentials ##
### Intro UART vs USART ###
### Understanding UART Pins ###
### UART Frame Formats ###
### Baud Rate ###
### Synchronization Bits ###
### UART Parity ###

## UART Functional Block and Peripheral Clock ##
### Exploring UART Functional Block ###
### UART Peripheral Clock ###

## UART Communication ##
### UART Transmitter ###
### UART Receiver ###

## USART Driver Development ##
### USART Driver Development Configurable Items ###
### USART Driver APIs Prototypes ###
### Configuration Options and USART Registers ###
### USART Driver API: USART Init ###
### USART Driver API: Tx and Rx Assignment ###
### USART Driver API: Send Data ###

## USART Oversampling and Baudrate ##
### USART Oversampling ###
### USART Baud Rate Calculation Part-2 ###
### USART Baud Rate Calculation Part-3 ###
### USART Baudrate Coding ###

## Exercise ##
### Exercise: USART Send Data to Arduino ###
### Communicating With PC Over UART ###

## USART Interrupts ##
### USART Interrupt Discussion ###
### Exercise ###
### USART IRQ Handler Implementation: Assignment ###

## Exercise: RTC on LCD ##
### Real Time Clock on LCD ###
### DS1307 RTC Registers ###
### RTC Code Implementation ###
### RTC Coding for Set Time and Date ###
### RTC Coding for Get Time and Date ###
### BCD and Binary Manipulation Functions ###
### Writing RTC Application ###
### RTC and Systick ###
### LCD Connections ###
### Significance of LCD Pins ###
### LCD Initialization ###
### LCD Initialization Flowchart ###
### Sending Command and Data to LCD ###
### Construcing LCD Command Code ###
### Testing ###

## BONUS LECTURE ##
### BONUS LECTURE ###