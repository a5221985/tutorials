# Embedded Systems #
## Introduction to ES ##
1. ES Tutorial topics
	1. Basic and Advanced concepts of Embedded System
2. Target audience
	1. Beginners
	2. Professionals
3. What is ES?
	1. It is a system composed of
		1. Hardware
		2. Application software
		3. Real time operating system
	2. Topics covered
		1. Characteristics
		2. Designing
		3. Processors
		4. Microcontrollers
		5. Tools
		6. Addressing modes
		7. Assembly language
		8. Interrupts
		9. Embedded c programming
		10. Led blinking
		11. Serial communication
		12. LCD programming
		13. Keyboard programming
		14. Project implementation
		15. ...

### What is System ###
1. System: It is a way of working, organizing or performing one or many tasks according to a fixed set of rules, program or plan
	1. All units are combined to work together by following certain set of rules (in real time computation)

### What is Embedded System ###
1. It is a system that has software embedded into computer-harware
	1. Makes it a system dedicated for a variety of applications or specific part of an application or product or part of a larger system
2. Types:
	1. Small independent system
	2. Large combinational system
3. It is microcontroller based control system used to perform specific task or operation
4. Major components
	1. **Hardware:** Physical component connected to the actual system
		1. Microcontroller based IC
		2. Power supply
		3. LCD
	2. **Application Software:** Run on the hardware (allows users to customize the code to be installed in the harware)
	3. **Real Time Operating System (RTOS):** It supervises the way an embedded system works
		1. It is an interface between application software and hardware
		2. Handles scheduling to control and take care of latencies

				Hardware <-----> RTOS <-----> Application Software
				
5. Pre-requisites
	1. Computer Architecture
	2. Circuits	

## Characteristic of ES ##
1. General characteristics of ES in real-time computation
	1. Software is embedded into hardware which makes the system dedicated for particular task or set of tasks
	2. It provides real-time output
	3. It may be a smaller part in a larger device to serve specific purpose by using hardware-software intermixture
	4. High reliability
2. Hardware and Software Interfacing
	1. Software: Driver for LED, Hardware: LED interface, Visual Aid: LED glowing On and Off
	2. Software: Driver for 7 segment display, Hardware: Single or multiple 7 segment display interface, Visual Aid: Numbers from 0000 to 9999
	3. Software: Driver for multiplexing 4 seven segment displays, Hardware: 7 segment display, Visual Aid: numbers from 0000 to 9999 (done using patterns in display lookup table)
	4. Software: Counter, Hardware: 7 segment display, Visual Aid: Showing incrementing values on 7 segment display (without interrupt, without ASCII values)
	5. Software: Timer counter, Hardware: Time/ Counter initialization, Visual Aid: Blinking LED (Timer in polling mode)
3. I/O handling using interrupt and background/foreground processes
	1. Software: Timer interrupt, Hardware: Timer, Interrupt vector table, Visual Aid: Blinking of dot on 7 segment display (dot is occurrance of interrupt)
	2. Software: Interrupt based display driver for 7 segment display, Hardware: Timer, interrupt, Visual Aid: 4 digit counter on 7 segment display (with interrupt, with ASCII values)
	3. Software: Interrupt based hex keypad driver, Hardware: Hex keypad, Visual Aid: display value of key pressed till user presses another key (keypad scanning with interrupt)
	4. Software: Complete stopwatch application, Hardware: 7-segment display, keypad, Visual Aid: Continuously incrementing values on 7-segment display (A - start, B - stop, C - reset)
3. Advantages of using embedded systems:
	1. Same hardware can be used in variety of applications
	2. Lesser power requirement (optimized)
	3. Lower operational cost of system (certified, cheaper)
	4. High performance and efficiency (optimized and verified)
4. Disadvantages:
	1. Time for software development (complexity)
	2. High skill required to eliminate failures

## Designing of an ES ##
1. Basic structure of ES:

	![designing-of-an-es](designing-of-an-es.png)
				
	1. Sensor: Used to sense change in the environment condition and generate electrical signal (corresponding to the change)
		1. Also called transducer
	2. ADC: Analog-to-digital converter - converts analog electric input signal to equivalent digital signal for further processing in embedded system
	3. Processor & ASICs: Processor - processes the signal and execute desired set of instructions with high speed
		1. ASIC - Application Specific Integration Circuit is used to perform task specific operation inside an ES
	4. DAC - Digital-to-analog converter converts digital electric input signal into equivalent analog signal
	5. Actuators: It is a comparator used for comparing analog input signal level to desired output signal level for providing error free otuput from the system

### Design Steps Required for the Development of Embedded System ###

![designing-of-an-es2.png](designing-of-an-es2.png)

## ES Processors ##
1. Processor: Major component in ES
	1. It receives response from sensors in digital form and processes the response to produce output in real-time
	2. Embedded systems engineer must know microprocessors and microcontrollers
2. Interal components of a typical processor
	1. **Control Unit:** Controls program flow
		1. Fetching unit to fetch instructions from memory
	2. **Execution Unit:** Executes various tasks inside a processor
		1. ALU: arithmetic and logic operations
		2. Program control operations

### Types of processors ###
1. **Application Specific System Processor (ASSP):** Application dependent system processor used to process signals (unique to the application)
2. **Application Specific Instruction Processor (ASIP):** Application dependent instructions are processed (inside combinational circuit)
3. **General Purpose Processor (GPP):** Processes signals (inputs) and generates output by controlling system bus, address bus and data bus

### Types of GPPs ###
1. Microprocessor
2. Microcontroller
3. Digital Signal Processor
4. Analog Signal Processor

## Microprocessor ##
1. CPU is built into a single VLSI chip called microprocessor
2. It is a general purpose device
3. Additional circuitry are added to make it work as a microcomputer
4. Operations performed
	1. Addition
	2. Subtraction
	3. Compare
	4. Fetch data from memory
	5. Transfer data
5. It is basic Input-Output System (BIOS)
	1. Input received from sensors are processed and output is produced

	![es-processors.png](es-processors.png)
	
6. Basic components of Microprocessor
	1. **Arithmetic and Logic Unit (ALU):** Performs arithmetic and logic operations
		1. Uses registers as well as memory
	2. **Accumulator:** Register used to store intermediate arithmetic and logical operation data
	3. **Working Registers:** Storage devices to store data inside a microprocessor
	4. **Stack pointer:** It is a pointer to certain address. Stores address of last program request inside stack
	5. **Clock circuit:** Used to generate clock pulse required as a reference signal for microprocessor
	6. **Interrupt circuit:** Used to generate interrupt signal when higher priority process needs to be served (basis is priority by the processor)

## Microcontroller ##
1. 

## MP vs MC ##
## Types of MicroControllers ##
## ES Tools and Peripherals ##

## 8051 MicroController ##
### 8051 MicroController ###
### 8051 MC Architecture ###
### 8051 MC Pin Diagram ###
### ES I/O Programming ###
### Addressing Modes ###
### 8051 Instruction Set ###
### Assembly Language ###
### 8051 Interrupts ###
### Embedded C ###
### LED Blinking ###
### 7-Segment Display ###
### Counter/ Timer ###
### Serial Communication ###
### Keypad Programming ###
### LCD Programming ###

## AVR MicroController ##
### AVR MicroController 10+ ###

## ES Projects ##
### ES Projects ###
### Fire Detection Project ###
### RFID Attendance System ###

## Robotics ##
### Robotics Tutorial ###