# 10 Steps to Self Learn Embedded Systems #
## C Programming ##
1. Close to hardware
2. [https://repl.it/languages/c](https://repl.it/languages/c)

## Operating System Design ##
1. Defferred interrupt processing
2. Top half & bottom half
	1. Top half - responds to interrupts
		1. Clears device interrupt flags
		2. Gets data scheduled for bottom half
	2. Bottom half - runs at a later time
3. Tasklets
	1. Soft interrupt contexts
	2. Cannot sleep
	3. Guaranteed to run before next timer tick
4. Ways of deffering work (for interrupts)
5. Work queue
	1. Run in process context
	2. Can sleep
		1. I/O say
6. Interrupt contexts
7. Process contexts
8. Why run interrupts in threads

## How Computers Work ##
1. Flash
	1. Has limited cycles
		1. We don't want to write to file system much (logging say)
			1. System might break
2. SRAM
3. DRAM
4. EEPROM
5. Emulators
	1. We can write emulator to learn about hardware
6. General purpose computer hardware
	1. Simulation
		1. Good for FPGAs
		2. Verilog can be used on simulation
7. QEmu - Emulator
	1. Try to understand how it works

## Linux, Build Tools, Emacs, Vim ##
1. Good to know to write build scripts
	1. Makefile
	2. CMake
	3. Automake
	4. Automate system
		1. Command-line tools

## Electronic Circuits - Analog + Digital ##
1. Simulation tools:
	1. Qucs
	2. LTSpice
	3. ngspice
	4. xspice
		1. Digital circuits
		2. Can be extended with C
			1. C programs to simulate digital circuits can be plugged in

## Schematic Design & PCB Layout ##
1. How to design power supplies
	1. Buck regulator (high to low)
	2. Boost regulator (low to high)
2. Lay out RF circuits
	1. High frequency signals
		1. Arranging tracks
			1. Can get filtering working
3. Routing high speed designs (DRAM say)
	1. All tracks are of same length say
		1. High frequency and high speed signals need to arrive at the same time say
4. [https://hforsten.com](https://hforsten.com) - continuous frequency radar

## Datasheet to PCB and Firmware ##
1. Manufacturer application notes
	1. Valuable info related to components
	2. General understanding of circuit
		1. Basics as well
2. Examples:
	1. Reference design
		1. We can customise and integrate into our own circuit

## FPGA, VHDL, Verilog and Logic ##
1. Gates: AND, OR, NAND, NOR, XOR
2. Boolean algebra - it enables simplification of logical circuits
3. DeMorgan's theorem
	1. Logical expression to convert to sum of products (for simplification)
		1. Convert into NAND gates only (say - for FPGA)
4. Computer logic
	1. Started by Alan Turing & Kurt Godel

## Networking and Communication ##
1. Protocols
	1. IP (Internet Protocol)
	2. ICMP (Internet Control Message Protocol) - network maintenance and debugging
	3. IGMP (Internet Group Managemnt Protocol) - multicast traffic management
		1. Streaming TV info over internet (for multiple subscribers)
	4. UDP (User Datagram Protocol) (games - online)
	5. TCP (Transmission Control Protocol)
	6. DNS (Domain Name Server)
	7. SNMP (Simple Network Management Protocol)
	8. DHCP (Dynamic Host Configuration Protocol)
	9. AUTOIP (for IPv4, confirm with RFC 3927)
	10. PPP (Point-to-Point Protocol) (model lines)
	11. ARP (Address Resolution Protocol) for Ethernet (IP to MAC)
2. What do the protocols mean and how to use them

## DSP, Control, Filtering and Mathematics ##
1. Spate-space models
	1. For arranging multiple dynamic equations into a formal system
	2. Apply generic rules
2. Linear algebra (to understand state space models)
3. Transfer functions (can be converted to state space models)
	1. s-domain (analog - continuous time domain)
	2. z-domain (digital - discrete time domain)