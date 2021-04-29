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
2. SRAM
3. DRAM
4. EEPROM

## Linux, Build Tools, Emacs, Vim ##
## Electronic Circuits - Analog + Digital ##
## Schematic Design & PCB Layout ##
## Datasheet to PCB and Firmware ##
## FPGA, VHDL, Verilog and Logic ##
## Networking and Communication ##
## DSP, Control, Filtering and Mathematics ##