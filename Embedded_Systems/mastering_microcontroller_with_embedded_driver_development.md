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

### SWV Working Principle ###
### Testing Hello-World Through SWV ###
### OpenOCD and Semihosting to use printf ###	

