# Embedded Systems Bare-Metal Programming Ground Up (STM32) #

## Introduction ##
### Introduction ###
1. Solid foundation for bare metal embedded firmware development of arm based micro-controllers
	1. How to navigate the arm micro-controller reference manual and data sheet to extract right information to build professionally build peripheral drivers and firmware
	2. No libraries - Pure bare metal embedded C and register manipulation only
2. ST Micro-electronics STM32F4 Nucleo board - arm cortex M4 micro-controller
3. What will I learn?
	1. Write firmware using only **bare-metal embedded-c**
	2. Understand **Cortex-M Architecture**
	3. Write **Analog-to-Digital Converter (ADC) drivers** using bare-metal embedded-c
	4. Write **PWM drivers** using bare-metal embedded-c
	5. Write **UART drivers** using bare-metal embedded-c
	6. Write **TIMER drivers** using bare-metal embedded-c
	7. Write **SPI drivers** using bare-metal embedded-c
	8. Write **I2C drivers** using bare-metal embedded-c
	9. Master the **ARM-Cortex CMSIS** standard
		1. ARM Architecture
		2. How to build professional embedded firmware for arm processors
4. For whom?
	1. Absolute beginner to embedded systems
	2. Experienced embedded developer and want to learn how to professionally develop embedded applications for arm processors  

## Set Up ##
### Download Keil uVision 5 ###
1. IDE and Tool chain
	1. Keil uVision 5: Provided by arm
		1. Search for `keil mdk uvision 5`
			1. Download: Product Downloads
				1. MDK-Arm
					1. Submit the form
				2. Download exe

### Installing Keil uVision 5 ###
1. Double click to open and install
	1. Agree
	2. Default folders
	3. Name and email
	4. Install
2. Pack Installer: Installs various startup files that we need for different arm boards
	1. Arm does not build any of the boards but has smart engineers who design
		1. Designs are licensed out to silicon manufacturers like TI, ST Electronics, Apple, Qualcom etc...
	2. Disable firewall

### Installing Packs ###
1. Pack Installer
	1. Search: stm32f411vet
		1. Click Install
	2. Search: NXP
		1. Klxx Series
			1. DFP
				1. Some of them may be deprecated (install older version)
	3. tm4c123
		1. Highlight
			1. _DFP: Install

## General Purpose Input/ Output (GPIO) ##
### Overview of ARM Cortex-M General Purpose Input/Output Module ###
1. Memory holds code and data for CPU to process
2. I/O ports are used by CPU to access I/O devices
3. Microcontroller:
	1. Two types of I/O
		1. GPIO: General Purpose IO: For interfacing devices
			1. LEDs
			2. Switches
			3. Keypads
			4. 7-Segment
			5. LCD
			6. DC-motors
			7. ...
		2. SPIO: Special Purpose IO - have designated functions
			1. I2C
			2. SSI
			3. UART
			4. ADC
			5. DAC
			5. CAN
			6. PWM
			7. TIMER
	2. In micro-controller, the same pin may be configured as a GPIO or SPIO
		1. We need to tell that
	3. Pins are grouped into Ports - each port has a number of pins - micro-controls have this convention
		1. Port A
			1. A1 - pin 1 of port A
		2. Port B
			1. B3 - pin 3 of port B
		3. ...
		4. In Arduino, it is simple convention P1 - P30
			1. Bare metal needs the port convention
	4. Buses: Exist in all micro-controllers
		1. Advanced Peripheral Bus (APB)
			1. Minimum of 2 clock cycles access to peripherals
		2. Advanced High-Performance Bus (AHB)
			1. 1 clock cycle access to peripherals
		3. Datasheet: Search stm32f411re datasheet
			1. Click to goto ST website
			2. Download datasheet
				1. Datasheet: Summary of particular MCU
					1. No of peripherals
					2. Power consumption limit
					3. Block diagram:
						1. AHP bus - GPIO PORT A, B, C, D, H
						2. AP bus - USART
				2. Reference manual: reference (over 1000 pages)
			3. tm4c123gh6pm datasheet - over 1000 pages
				1. search for block diagram (Cortex-M4F - has floating point unit)
				2. AHP bus, AP Bus
			4. nxp lpc1768 datasheet/user manual
				1. Search for block diagram

### Coding: Developing GPIO Driver Using Information from the Datasheet ###
1. New project > Bare-Metal > blinky
	1. name: blinky
	2. Select STM32F411VET
	3. Manage Run-Time Environment
		1. CMSIS > include CMSIS-CORE
		2. Device > Startup > check System Startup
2. Change target to stm32f4
3. Change source group to - app
	1. Right click on app
		1. Select Add item to group app
			1. C file > main
		2. Target options (click)
			1. Select debugger
				1. 16.0 Mhz Xtor
			2. Debug:
				1. ST-Link debugger
				2. Settings
					1. Flash Download
						1. Reset and Run (when new program is downloaded onto micro controller, we don't to press reset)
						2. 

### Coding: Controlling GPIO using the BSRR Register ###
### Coding: Reading GPIO Inputs ###

## Universal Asynchronous Receiver-Transmitter (UART) ##
### Overview of the UART Protocol ###
### Coding: Developing the UART Driver Using Information from the Datasheet ###
### Coding: Receiving Data with the UART ###
### Coding: Two-way UART Communication ###

## System Tick and General Purpose Timers ##
### Overview of the System Tick Timer ###
### Overview of General Purpose Timers ###
### Coding: Developing the System Tick Timer Driver ###
### Coding: Creation of a Delay Function using the System Tick Timer ###
### Coding: Developing the General Purpose Timer (GPTM) Driver ###
### Coding: Configuring the General Purpose Timer for Input Capture ###
### Coding: Input Capture frequency measurement ###
### Coding: Configuring the General Purpose Timer for PWM Output ###

## Interrupts Programming ##
### Introduction to Interrupts ###
### Understanding External Interrupts ###
### Coding: Developing the GPIO Interrupt Driver ###
### Coding: Working with Multiple GPIO Interrupts ###
### Coding: Developing the UART Interrupt Driver ###
### Coding: Developing the System Tick Interrupt Driver ###
### Coding: Developing the General Purpose Timer Interrupt Driver ###

## Analog to Digital Conversion (ADC) ##
### Introduction to Analog to Digital Conversion ###
### Coding: Developing the ADC Driver ###
### Coding: Reading the CPU Temperature with the ADC and Displaying it with the UART ###

## Interfacing with a Liquid Crystal Display (LCD) ##
### Coding: Developing the Liquid Crystal Display (LCD) Driver ###
### Coding: Configuring the Liquid Crystal Display for 4-bit Data Mode ###

## ARM Design Philosophy and RISC Architecture ##
### The RISC Design Philosophy ###
### The ARM Design Philosophy ###
### Embedded Systems with ARM Processors ###
### ARM Bus Technology and AMBA Bus Protocol ###
### Memory ###
### Peripherals ###
### Von Nuemann and Harvard architecture ###
### Cache and Tightly Coupled Memory ###
### Memory Management extensions ###
### Cooprocessor extensions ###

## The ARM Programmer's Model ##
### Data Types ###
### Processor Modes ###
### ARM7TDMI Registers ###
### ARM7TDMI Vector Table ###
### ARM Cortex-M Registers ###
### ARM Cortex-M Vector Table ###
### ARM Data Flow Model ###
### The Pipeline ###
### ARM Processor Family ###
### ARM Cortex-A and Cortex-R ###
### ARM Cortex-M ###

## Closing ##
### Closing Remarks ###