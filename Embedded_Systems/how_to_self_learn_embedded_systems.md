# How to self-learn Embedded Systems? #
1. CS or CE or EE or EC background
2. Learning curve is very high

## 13 Things to do to self learn ##
1. Learn C
	1. 95% Embedded systems are written in C language
	2. Should be very good at it
		1. Should be able to write C for embedded systems
2. Learn OS Concepts (System architecture and how system works) - Process, mem management, scheduling
	1. Work with Unix/Linux
		1. Read docs
		2. Data sheets
		3. Study material
	2. Work on Multithreaded C programming using POSIX
	3. Learn interprocess communication, mutex, semaphore
		1. parallel/concurrent programmig
	4. Work on Linux Kernel Programming
		1. Embedded linux is common
			1. Learn embedded linux kernel programmig
	5. Work on device driver programming
3. Learn Computer Architecture
	1. Read 8086 (x86), 8051, ARM architecture. The more it is better
		1. Optimized code can be written
4. Get Familiar with build process
	1. See how cross-compilation is done
	2. Work with various IDEs and no IDE environment
		1. IAR
		2. MB Lab
		3. ...
		4. Vim
	3. Do some projects with arduino/raspberry pi/embedded board/STM32F4
		1. To understand build process and how compilation works
5. Learn Basic Electronics (Sensors, Actuators) - hardware architectures, how data is transmitted, interface
	1. ADC, Sensors, relays, display interface, camera interface
	2. Learn how to use oscilloscopes, multimeters, **logic analyzers**
		1. Debugging
6. Learn basic PCB design
	1. Learn CADsoft eagle, OrCAD, KiCAD
	2. Design your own PCB
7. Learn to read data sheets (for components used in project)
	1. Read as many datasheets as possible
		1. Architecture
		2. Interfacing
	2. Read BLE module, WiFi module, ZigBee module and so on
	3. Read from different manufacturers
	4. Read the datasheet of different development boards
8. Learn FPGA: (Field Programmable Gate Array - new hardware design concept - used to design our own processor or implement our own algorithm in hardware)
	1. Learn any Hardware description language. VHDL or Verilog
	2. FPGA used for interfacing
9. Learn Web technologies
	1. (HTML, JS), Database-(Sqlite, MySQL), Java and Python too
		1. IOT
	2. It will be useful for IoT applications (optional)
10. Learn Image Processing (Digital cameras, smart cameras)
	1. Learn simpleCV, OpenCV, fastCV to work on Image processing projects
11. Go through Source Codes
	1. Learn from other open source objects
	2. Go through Linux Kernel code, FreeRTOS code and any code you get
		1. How experts are writing code optimized in C language
12. Learn Reverse Engineering:
	1. Break into smaller chunks. Debug using RX/TX-UART, JTAG, Debug processes in an OS
		1. Linux has dmesg, ...
13. Learn Optimization techniques (limited CPU, Memory, storage)
	1. Learn profiling/optimization of your code 
	2. Be good at data-structures and algorithms
	3. Profiling tools - perf, Intel Vtune Amplifier, etc...