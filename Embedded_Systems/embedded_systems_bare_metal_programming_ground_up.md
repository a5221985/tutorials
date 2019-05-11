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
1. UART: Universal Asynchronous Receiver/Transmitter
	1. Serial Transfer - Sender -----> Receiver
	2. Parallel Transfer - 8 or more wires are used to transfer data

						------->
						------->
						------->
				Sender	-------> Receiver
						------->
						------->
						------->
						------->

			1. Preferred for short distances
				1. Used to transfer multiple bits at the same time
					1. Higher throughput
			2. Technology advanced so Serial communication somtimes exceeds parallel communication
				1. Parallel - size and cost of cable and connector are high
					1. Difficulty of synchronizing the arrival time of data lines at longer distances
	3. UART is common Serial communication protocol

#### UART Protocol Summary ####
1. The data coming to receiver on serial data line is all zeros and ones
	1. It is difficult to understand this unless sender and receiver agree on a set of rules (protocol)
		1. How many bits are packed?
		2. How many bits constitute a character?
		3. When data begins and ends?
	2. Usually used for character transmission method
2. Start and Stop Bit
	1. Start bit = 0
	2. Stop bit = 1
3. ASCII characters are packed between start and stop bits
	1. Framing
		1. Start bit is one bit
		2. Stop bit can be one or two bits
	2. Example:
		1. ASCII "A" = 0100 0001

				11		0100 0001		0

			stop bits		"A"		start bit

		2. LSB is sent first
	3. In Asynchronous serial communication, peripheral chips can be programmed for 5, 6 or 8 bits wide
		1. Older systems had 7 bit characters
		2. Modern systems can send non-ascii 8 bit data as well
	4. Parity Bit:
		1. To maintain integrity a parity bit is included in data frame

				0 			100 0001

				parity bit

			1. Odd parity - number of data bits including the parity bit is odd
			2. Even parity - number of data bits including the parity bit is even
		2. UART allows us to program with even parity, odd parity or no parity
	5. Data transfer: in baud rate
		1. Baud rate = bps (bits per second)
			1. They aren't necessarily equal
				1. Baud rate is number of signal changes per second
					1. Modems can transfer multiple bits of data per signal
			2. In UART - baud rate and bps are same

### Coding: Developing the UART Driver Using Information from the Datasheet ###
1. Task:
	1. Write driver to configure UART
	2. Access UART and transmit some data using UART
2. Code:
	1. Project > basic_uart (folder) > basic_uart (project name)
	2. Device > stm32f411vet
	3. CMSIS -> CORE
	4. Device -> Startup
	5. Target rename to stm32f4
	6. Source group rename to app
		1. Right click > Add new item
			1. main
	7. Target options:
		1. 16.0
		2. Debug
			1. ST-LINK Debugger
				1. Settings
					1. Flash Download
						1. Reset and Run
3. Books:
	1. Data sheet
		1. Block diagram
			1. Check bus it is connected to
				1. USART1 connected to APB2 Bus
				2. USART2 connected to APB1 Bus
		2. Reference manual
			1. `RCC_APB1ENR`
				1. Reset value is 0x0000 0000
					1. Access - 1/2 word or byte
				2. Bit 17 corresponds to USART2
	2. Set baud rate: (bps)
		1. Reference Manual - search for USART
			1. 548 page
				1. `USART_BRR` - reset 0x0000 0000
			2. Control register (`USART_CR1`)
				1. To enable or disable UART
					1. Bit 2 - RE (Receiver enable)
						1. Enables receiver
							1. 0 - disabled
							2. 1 - enabled, begins searching for start bit
					2. Bit 3 - TE (Trasmitter enable)
						1. Enables transmitter
							1. 0 - disabled
							2. 1 - enabled
				2. UE - 13 bit
					1. UART Enable - enables UART module
						1. 0 - USART prescalar and outputs disabled (at the end of current byte transfer?)
						2. 1 - USART enabled
			3. Control register 2 (`USART_CR2`)
				1. Can be used to set clock polarity and clock phase
					1. CPOL - (10) - polarity
					2. CPHA - (9) - phase
					3. STOP - (13, 12) - enable stop bit (2 bits)
			4. Control register 3 (`USART_CR3`) - enable flow control
				1. Reading and writing negative acknowledgement (one bit)
					1. NACK - (4) - reading and writing negative ack
	3. Set data size:
	4. Enable stop bit (use or no)
	5. Flow control (or no)
4. For special purpose i/o, we need to enable alternate function
	1. AF0 - AF15
		1. AF7 - USART1,2
			1. Alternate function low (AFL)
				1. `GPIOx_AFL`
5. Code:

			// APB1 bit 17 : USART2
			// USART connected to PA2

			#include "stm32f4xx.h"
		
			void USART2_Init(void);
			void USART_write(int ch);
			void delayMs(int delay);

			int main(void)
			{
				USART2_Init();
				while (1) {
					USART_write('H');
					USART_write('i');
					delayMs(10);
				}	
			}

			void USART2_Init(void) {
				RCC->APB1ENR |= 0x20000; // 0010 0000 0000 0000 0000
				// Enable normal gpio clock first and then go to the gpio and enable alternate function
				RCC->AHB1ENR |= 1; // USART is connected to PA2

				GPIOA->AFR[0] |= 0x0700; // Enable Alternate function for USART2
				GPIOA->MODER |= 0x0020; // Set PA2 to alternate function

				USART2->BRR |= 0x0683; // 9600 @16Mhz
				USART2->CR1 |= 0x0008; // Set 4th bit high, enable Tx
				USART2->CR1 |= 0x2000; // Don't combine this with prev because Tx must be enabled first
			}

			// place data in USART register, check reference guide
			void USART2_write(int ch) {
				while (!(USART2->SR & 0x0080)) {} // Check if Tx buffer is empty and wait while it is empty
				USART2->DR = (ch & 0xFF);
			}

			void delayMs(int delay)
			{
				int i;
				for (; delay > 0; delay--)
					for (i = 0; i < 3195; i++);
			}

		1. Data register (`USART_DR`)
			1. DR[8:0]: Data value
				1. contains received or transmitted data character.
				2. DR performs double function (read and write) since it contains transmission (TDR) and one reception (RDR)
					1. TDR - provides parallel interface between internal bus and output shift register
					2. RDR - provides parallel interface between the input shift register and internal bus
					3. When transmitted with parity enabled (PCE bit set to 1 in `USART_CR1`)
						1. MSB (bit 7 or bit 8) has no effect because it is replaced by parity bit
							1. If enabled, MSB is the parity bit
6. Get Terra Term software for UART:
	1. Search in google for terra term download
		1. First link
		2. Download page
		3. Download exe
	2. Install
		1. Add to menu
	3. Launch
		1. Serial - COM3
7. Rebuild and download to uc

### Coding: Receiving Data with the UART ###
1. Add newline

		USART_Write('\r');
		USART_Write('\n');

2. Receive data
	1. New Project - UART_Receive
		1. UART_Receive
	2. uc - stm32f11vet
	3. CMSIS - CORE
	4. Devise - Startup
	5. Target - stm32f4
		1. Source Group - app
	6. Target options
		1. 16.0
		2. Debug
			1. ST-Link Debugger
				1. Flash Download
					1. Reset and Run
	7. Right click on app
		1. Add new item
			1. C: main
3. Enable Rx pin PA3

		#include "stm32f4xx.h"

		void USART_init(void);
		char USART2_read(void);
		void LED_play(int value);
		void delayMs(int delay);

		int main(void)
		{
			RCC->AHB1ENR |= 1; // Enable clock to PortA
			GPIOA->MODER |= 0x400; // set pin as output
			
			USART_init();
			char ch;

			while (1)
			{
				ch = USART2_read();
				LED_play(ch);
			}
		}

		void USART_init(void)
		{
			RCC->AHB1ENR |= 1; // Enable GPIOA Clock
			RCC->APB1ENR |= 0x20000; // Enable USART2 Clock

			// Configure PA3 as USART RX
			GPIOA->AFR[0] |= 0x7000; // Alt7 for USART2
			GPIOA->MODER |= 0x0080; // Enable Alternate function at PA3

			USART2->BRR = 0x008B; // 115200 baudrate @16Mhz
			USART2->CR1 |= 0x0004; // Enables Rx
			USART2->CR1 |= 0x2000; // Enables USART2
		}

		char USART2_read(void)
		{
			while (!(USART2->SR & 0x0020)) {} // check if Rx buffer is empty and if so wait
			return USART2->DR;
		}

		void LED_Play(int value)
		{
			value %= 16;
			for (; value > 0; value--)
			{
				GPIOA->BSRR |= 0x20; // Turns LED on
				delayMs(100);
				GPIOA->BSRR |= 0x00200000; // Turns LED off
				delayMs(100);
			}
		}

		void delayMs(int delay)
		{
			int i;
			for (; delay > 0; delay--)
				for (i = 0; i < 3195; i++);
		}

	1. Open Terra Term:
		1. Serial: COM3
			1. Default is 9600, we need to change
				1. Setup > Setup Port
					1. Speed: 115200
	2. Press any key
		1. numbers
		2. letters
3. Project:
	1. Combine and build reader and writer with button input
		1. When button is pressed, the number or key should appear on screen

### Coding: Two-way UART Communication ###
1. Project
	1. UART_RX_TX
		1. uart_rx_tx
	2. stm32f411vet
	3. CMSIS - CORE
	4. Device - Startup
	5. Target 1 -> stm32f4
	6. Source Group 1 -> app
	7. Target options
		1. 16.0
		2. Debug
			1. ST-LINK Debugger
				1. Flash Download
					1. Rest and Run
2. Right click on app and add new item
	1. C file
		1. main
3. Code

		#include "stm32f4xx.h"
		#include "stdio.h"

		int main(void)
		{
			int n;
			char str[100];

			USART2_init();
			printf("Hello from the other side\r\n");
			fprintf(stdout, " test for stdout\r\n");
			fprintf(stderr, " test for stderr\r\n";

			while (1)
			{
				printf("How old are you?");
				scanf("%d", &n);
				printf("Your age is: " %d\r\n", n);
				printf("Enter your first name: ");
				gets(str);
				printf("I like your style: ");
				printf("\r\n");
			}
		}

		void USART2_init(void)
		{
			RCC->AHB1ENR |= 1; // Enable GPIOA Clock
			RCC->APB1ENR |= 0x20000; // Enable USART2 Clock

			// Configure PA3 as USART RX
			GPIOA->AFR[0] |= 0x7700; // Alt7 for USART2
			GPIOA->MODER |= 0x00A0; // Enable Alternate function for PA2 and PA3

			USART2->BRR = 0x0683; // 9600 baudrate @16Mhz
			USART2->CR1 |= 0x000C; // Set 4th bit high to enable Tx and 8th high to enable Rx
			USART2->CR1 |= 0x2000; // Enables USART2
		}

		int USART2_write(int ch)
		{
			// Wait for Tx Buffer empty
			while (!(USART2->SR & 0x0080)) {}
			USART2->DR = (ch & 0xFF);
			return ch;
		}

		int USART2_read(void)
		{
			// Wait for Rx Buffer empty
			while (!(USART2->SR & 0x0020)) {}
			return USART2->DR;
		}

		struct __FILE
		{
			int handle;
		};

		FILE __stdin = {0};
		FILE __stdout = {1};
		FILE __stderr = {2};

		int fgetc(FILE *f)
		{
			int c;
			c = USART2_read();
			if (c == '\r')
			{
				USART2_write(c);
				c = '\n';
			}
			USART2_write(c);

			return c;
		}

		int fputc(int c, FILE *f)
		{
			return USART2_write(c);
		}

	1. Open Terra Term
		1. Connect to serial port
	2. Using standard c console io to read and write characters

## System Tick and General Purpose Timers ##
### Overview of the System Tick Timer ###
1. SysTick Timer
	1. It is present in all arm cortext microcontrollers
		1. STM32, ...
	2. Used to initiate and action on a periodic basis
		1. Done at fixed rate without external signal
			1. Say reading sensor value every 200 ms
	3. Widely used for real time OS
	4. It can be used to control everything (scheduler)
	5. SystemTick Timer
		1. 24- bits down counter that runs at bus clock frequency (either driven by system clock or an internal oscillator)
			1. Counts down from initial value to zero
				1. When it reaches zero, in the next clock it underflows and it raises a flag known as count and re-lows the initial value to start all over again
2. SysTick Registers
	1. SysTick Control and Status Register
	2. SysTick Reload Value Register
	3. SysTick Current Value Register
3. If we want an action to occur every second:
	1. SysTick->LOAD = 16000000 - 1; // clock is 16Mhz
		1. 16Mhz = 16000000 cycles = 1 second
	2. Every one millisecond?
		1. 1/1000 seconds = 16,000,000 / 1000 = 16,000 cycles (load 16,000 - 1)
4. General purpose timers
	1. Measure occurance of events
	2. Delays

### Overview of General Purpose Timers ###
1. Timer vs Counter - differences are in their clock source (internal - timer, external clock source - clock)
	1. Timer
		1. PLL
		2. XTAL
		3. RC
	2. Counter
		1. Clock fed to CPU
2. Timer uses (interchangeable)
	1. Creation of delays
	2. Counting events
	3. Measuring time between events
		1. We can count the number of times a sensor crosses it's threshold (using timers)
		2. Number of times a button is pressed
			1. Any software triggered or hardware triggered events
3. One - shot vs Periodic
	1. One-shot: Timer stops counting once timeout reaches
	2. Periodic: Timer continues counting after timeout (when reaches it's limit, restarts from beginning)
4. Down-Counter vs Up-Counter
	1. Down-Counter: Time counts from a set value to zero
	2. Up-Counter: Timer counts from zero to a set value
5. Converting bit size into seconds
	1. Largest value = 2^16 = 65,536
		1. 16Mhz = 16,000,000 clock cycles per second
		2. 65536 / 16Mhz = 4.096 x 10^-3 = 4.096 milliseconds (maximum delay value) (5 second delay is not possible)
	2. 32 bit timer: 268.435 seconds max delay
	3. 16 + 8-bits (prescalar) = 24 bits = 1.048 seconds max

### Coding: Developing the System Tick Timer Driver ###
1. New project
	1. folder: systick_basic
	2. name: systick_basic
	3. sm32f411vet
	4. CMSIS: core
	5. Device: Startup
	6. Target 1 - stm32f4
	7. Source Group - app
	8. Target options
		1. 16.0
		2. Debug
			1. ST-LINK debugger
				1. Settings
					1. Flash Download
						1. Reset and Run
	9. New item: main

			#include "stm32f4xx.h"

			int main(void)
			{
				RCC->AHB1ENR |= 1; // Enable Clock to Port A
				GPIOA->MODER |= 0x400; // PA5 is set as output

				// Configure Systick
				SysTick->LOAD = 3200000 - 1; // 200 ms
				SysTick->VAL = 0;
				SysTick->CTRL = 5;

				while (1) {
					// 
					if (SysTick->CTRL & 0x10000)
					{
						GPIOA->ODR ^= 0x20;
					}
				}
			}

		1. 

### Coding: Creation of a Delay Function using the System Tick Timer ###
1. Delay function which takes an argument
2. New project - systick_delay
	1. ...
3. Delay function:

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