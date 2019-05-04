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
						1. Reset and Run (when new program is downloaded onto micro controller, we don't have to press reset)
4. The course teaches us to write firmware regardless of whether we have used that before or whether it is a go to microcontroller for development
	1. Need to master skills required to master the reference manual and data sheet and user guides
	2. Keil provides a set of references
		1. Books tab
			1. Device Data Books
				1. Cortex M4 Generic User Guide
				2. STM32F4 Reference Manual - everything we need to program the microcontroller
					1. RCC (Rest and Clock Control)
						1. PLL
						2. AHB1
							1. Enable register
								1. RCC AHB1 peripheral clock enable register (`RCC_AHB1ENR`) - (accessed using `RCC->AHB1ENR` because `RCC` is a struct)
									1. Address offset: 0x30
									2. Reset value: 0x0000 0000 (32 bit)
										1. 0 - GPIOA
											1. 1 - enable clock access to GPIOA
												1. GPIOAEN
						3. AHB2
					3. Send pin output
						1. All microcontrollers require at-least two registers for i/o control
							1. Directional register - set pin as input or output
							2. Data register - to write or read from pin
						2. Mode register: (Direction register is generic name) - `GEIPx_MODER`, `GPIOx_OTYPER`, `GPIOx_OSPEEDR`, `GPIOx_PUPDR` (1st is mandatory, others are optional)
						3. Output data register: (Data register is generic name) - `GPIOx_IDR` (input data register), `GPIOx_ODR` (output data register)
						4. Set/Reset register - `GPIOx_BSRR`
						5. ...
						6. Table 26:
							1. 00 - Input (reset state) (input pin)
							2. 01 - General purpose output pin
							3. 10 - Alternate function mode (input and output)
							4. 11 - Analog input
				3. STM32F4 Data Sheet
					1. Summary of MCU
						1. Capability
							1. FPU
							2. ART (Adaptive real-time memory accelerator)
							3. ...
						2. Electrical characteristics
						3. Functional overview
						4. Bus Matrix
						5. Clock
							1. To access a periferal like i/o peripheral or special purpose peripheral (UART, ADC, SPI)
								1. Enable the clock to the peripheral
									1. Enable the clock of the bus the peripheral is connected to - clock gating mechanism
							2. Previously it is default
								1. But to encourage low power consumption, clock gating mechanism was invented
									1. Enable clock access only to the microcontroller part in use
										1. GPIO port of Port A? enable clock for port A (enable clock on bus)
									2. Different companies have different clock gating mechanism
				4. STM32F4xx HAL Drivers
				5. STM32CubeMX User Manual
			2. Books about compiler
		2. Nucleo user guide - brand name so search online
			1. Google: stm32f411e-nucleo user guide
				1. Tells about Dev board (not uc)
				2. Download it
				3. See pin diagram
				4. See system requirements
				5. See development environment
				6. See picture of the board
				7. Find LED
				8. Go to F411 pinout diagram
				9. Go to Pin numbers (arduino format is used)
					1. bare metal does not understand this
					2. Translation of arduino naming format and actual naming format
						1. D13 - PA5 (STM32 pin) (this is not written on board)
							1. LED is connected to PA5
						2. CN - C connectors (group of pins)
							1. P - port
								1. PA5 - Port A 5
					3. Schematic diagram
						1. Three diagrams
							1. ST Link debugger
							2. Extension COnnector
							3. Micro controller
						2. LED:
							1. Bride that can be soldered or de-soldered
				10. Simplified block diagram
					1. Peripherals and other components are connected to main CPU
						1. GPIO PORT A is connected to AHP1 Bus (Advanced High Performance Bus)
							1. To enable clock:
								1. Go to AHP1 bus
								2. Select PORT A
						2. UART - APB
#### Coding ####

		#include "stm32f4xx.h"

		int main(void)
		{
			RCC->AHB1ENR |= 1; /* 000 .... 01 - 32 bits - friendly - bitwise or which keeps all other bits, enable GPIOA clock */
			
			GPIOA->MODER |= 0x400 /* PA5 is output - 0000 0000 0000 0000 0000 |01|00 |00|00 |00|00 (01 - output) */

			while(1) {
				GPIOA->ODR = 0x20; // 0010 0000 - turn's led on
			}
		} // leave new line after this

	1. Build
	2. Connect board to computer
	3. Download
	4. Blinking

			void delayMs(int delay);
			...
				while(1) {
					GPIOA->ODR |= 0x20;
					delayMs(100);
					GPIOA->ODR &=~ 0x20; // logical and & inversion
					delayMs(100);
				}
			}

			// Taking into account 16Mhz system clock
			void delayMs(int delay)
			{
				int i;
				for (; delay > 0; delay--)
					for(i = 0; i < 3195; i++); // experimentally found
			}

		1. Issues: ST-Link issue
			1. ST-Link is the top portion of the board (not the micro-controller part)
			2. To resolve driver issue, download and install ST-Link software from [ST-Link Software](https://www.st.com/content/st_com/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-programmers/stsw-link004.html?dl=qQrODtFI1RZR79rFZTbsAQ%3D%3D%2CKel3HxwZjMv4d75Ptjeqj4L40KOdG4f%2BUgDTUMXxaowUiT22CopUH8ZlgCko9%2B2pV0b8ymjJFM2UGuFrrQDZO9zrx2Lhy6qNfYwTK0YllY3kX8xHtre3mDbRQXfe1eBTCibS6udIK7Khdx5JNQdZWfo61pVcX2nnO6oqzNx9%2Ft248sxCDI0kcsM8eTF1hG4UUrmSyYhDD8Zc4n%2BTqDlLWaK3objHzBtlCspkJKIPvcck0UjK5dz5xIp5brAYnbEQwHWKpbPx7EezK52geFY5iVnf3C0IQkdWm2xII5cEynELF4SEwMUYDNEiK6a0VgZS)
				1. Follow the wizard to install softare and driver
				2. May need to upgrade the driver as instructed

### Coding: Controlling GPIO using the BSRR Register ###
1. BSRR - Bit Set/ Rest Register
	1. Blinking program can be implemented using this register
2. New Project
	1. New folder - blinky_with_bsrr
	2. Open: blinky_bsrr
	3. Select board: stm32f411vet
	4. CMSIS: CORE
	5. Device: Startup
	6. Target > 16Mhz
	7. Debug > ST Link Debugger
		1. Settings
			1. Flash Download
				1. Reset and Run
	8. Rename Source Group to stm32f4
	9. Rename target to app
		1. Right click > Add new item
			1. C file
				1. main
3. Got to reference manual
	1. GPIO Registers
		1. GPIO_BSRR
			1. 32 bit
				1. BS0 - BS15 - used for set (0-15)
				2. BR0 - BR15 - used for reset (16-31)
			2. Bits are write only
			3. Accessed in
				1. Word - 32 bit
				2. Half word - 16 bit
				3. Byte - 8 bit
			4. Read returns 0x0000
			5. Actions
				1. 0 - no action on corresponding ODRx bit
				2. 1 - sets (BSy) or resets (BRy) the corresponding ODRx bit
4. Code:
	1. Right click and add header

			#include "stm32f4xx.h"

			int main(void)
			{
				RCC->AHB1ENR |= 1;
				GPIOA->MODER |= 0x400;

				while (1)
				{
					GPIOA->BSRR = 0x20;	// set PA5 high
					delayMs(100);
					GPIOA->BSRR = 0x00200000; // set PA5 low - 0000 0000 0010 0000 0000 0000 0000 0000
					delayMs(100);
				}
			}

			...

		1. Build
		2. Download onto my board

### Coding: Reading GPIO Inputs ###
1. Program to turn on green LED when we press the push button (connected to PC13) - connected to pull up resistor (by default the pin is high when the button is not pressed)
	1. When we press button, PC13 goes low
2. New project:
	1. Folder - gpio_input
	2. Project - input
	3. uc - stm32f411vet
	4. CMSIS - core
	5. Device - startup
	6. target renamed to stm32f4
	7. source group to app
	8. target
		1. ...
3. Code

		#include "stm32f4xx.h"

		int main(void)
		{
			RCC->AHB1ENR |= 1; // enable port A
			RCC->AHB1ENR |= 4; // enable port C	
			GPIOA->MODER |= 0x400; // 0000 0000 0000 0000 0000 0100 0000 0000, port C 13 is input by default

			while (1) {
				if (GPIOC->IDR & 0x2000) // if PC13 is high
				{
					GPIOA->BSRR = 0x002; // Turn off led
				}
				else
				{
					GPIOA->BSRR = 0x20; // Turn on led
				}
			}
		}

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