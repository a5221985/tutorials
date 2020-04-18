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
### Embedded Target ###
### Docuents Required ###

