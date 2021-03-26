# Microcontroller Embedded C Programming: Absolute Beginners #
## Introduction ##
### About the Instructor ###
1. Kiran Nayak
	1. BE in Electronics and Communication Engineering
	2. Bharati Software, India

### Programming Languages for Embedded Systems ###
1. What is a program?
	1. A program is a series of instructions that cause a computer or a microcontroller to perform a particular task
	2. A computer program includes more than just instructions. It also contains data and various memory addresses on which the instructions work to perform a specific task
2. Programming languages in Embedded Systems
	1. C and C++ (most widely used) - we must be good at them
	2. Rust - recently gaining popularity
	3. Assembly
		1. Very powerful
			1. Still being used (a few parts are coded with this language)
	4. Java
	5. Python
		1. Micropython
3. Watch the following video: Survey by Embedded.com
	1. Dan Saks
		1. Writing better embedded software
4. C - a leading programming language for embedded systems

### History of 'C' and Standardization ###
1. C programming standardization
	1. The C programming language was initially developed in AT&T labs by Professor Brian W. Kernighan and Dennis Ritchie, known as K&R C.
	2. During 1970, 'C' programming became very popular but without any serious standardization to the language
	3. The non-official standard was called K&R C, which led to many ambiguities among different compiler programmers, and that led to non-portable codes.
	4. K&R C was the first non-official 'C' standard
	5. In 1989 ANSI designed and approved first official C stnadard called X3.159-1989
	6. In 1990 it was approved by ISO as international standard for C programming language: ISO/IEC 9899:1990 (Called ANSI C or C89 or C90 standard in short)
	7. Language underwent few more changes (addition of new features, syntaxes, data types, etc.) and newly updated standard released in 1999 under the ISO tag ISO/IEC 9899:1999 which is also called C99 standard in short
	8. C11 is an informal name for ISO/IEC 9899:2011, which is a new standard approved in December 2011. C11 supersedes the C99 standard.
	9. In this course, we will use C11 standard with some compiler (GCC) extensions (gnu11).
		1. It is compiler default
	10. Campatibility
		1. If we have written code using C90 standard, then it will compiler without issues in -std=C99 compilation (backward compatibility)
		2. If you have written code using C99 standard specific features, then it may not compile successfully in C90 compilation
2. First 'C' Program 'Hello World'
	1. Let's write a 'C' code which simply displays the text Hello world on the "console" and exits.

### Important Note ###

## IDE Installation ##
### Downloading IDE ###
1. Installing an Integrated Development Environment (IDE)
	1. IDE is software that contains all the essential tools to develop, compile, link, and debug your code
	2. In some cases, you may have to integrate compiler and debugger tools to the IDE manually
	3. Throughout this course we will be using Eclipse-based STM32CubeIDE which is developed by ST Microelectronics to write, compile, debug applications on STM32 ARM-based microcontrollers
	4. STM32CubeIDE is an eclipse IDE with STM32 related customization
2. Go to link: https://www.st.com/en/development-tools/stm32cubeide.html
	1. You may have to login
		1. Or just provide name and email id
	2. We can select latest version

### Key Features of the STM32CubeIDE ###
1. Key features
	1. It supports all OS platforms - it is based on eclipse
	2. It comes with in-built cross compilers and debuggers
		1. We don't have to download any external compilers or debuggers to integrate with the IDE
	3. Uses GNU C/C++ for Arm toolchain and GDB debugger
	4. Imports project from Atolic TrueSTUDIO and AC6 System Workbench for STM32
	5. Advanced Debug Features
		1. SWV - System analysis and real-time tracing
		2. View: CPU core registers, IP registers, memory (locations)
	6. In-built support for STM32CubeMx (We are not going to use STM32CubeMX in the course)
		1. For peripheral configuration
		2. For code generation

### Installing STM32CubeIDE ###
1. Windows:
	1. Do not uncheck drivers

### Installing STM32CubeIDE on Linux ###
1. Command-prompt
	1. Go to directory
	2. `sudo chmod +x <file>.sh`
	3. `sudo ./<file>.sh`
	4. Accept license: press space
		1. Type y
	5. Go to search box
		1. Search for ST
		2. Click to launch

### Installing Compiler (GCC) for Host ###
1. Installation of GNU Compiler Collections (GCC) for Host
	1. STM32CubeIDE is an integrated development environment software to develop, compile, debug embedded applications for STM32 microcontrollers
	2. STM32CubeIDE installation procedure also installs the GCC cross compiler for ARM Cortex Mx processors
		1. We don't have to donwload any cross compilers
	3. Using same IDE, we also write and compile 'C' programs for our HOST machine (Windows/Linux/Mac)
	4. So now we need to install the compiler for HOST machine, which doesn't come with the STM32CubeIDE installation
	5. Windows: Install MinGW (Minimalist GNU for Windows)
	6. MinGW: minimalist development environment for native Microsoft Windows applications
		1. Windows flavour of GNU Tools
	7. Linux/MAC: install GCC

### Installing Compiler (GCC) for Host (Windows) ###
1. Search for MinGW
	1. Download installer

### Installing Compiler (GCC) for Host (Linux) ###
### Installing Compiler (GCC) for Host (Mac) ###
1. Install Homebrew
	1. Copy and paste the command
2. `brew install gcc`

### Importing Course Projects in to Workspace ###
1. Download all source codes and import to STM
2. New folder: `embedded_c`
	1. `downloads` - downloaded files, softwares
	2. `instructor` - save source code of instructor
	3. `my_workspace` - own apps
3. Go to: [https://github.com/niekiran/Embedded-C](https://github.com/niekiran/Embedded-C)
	1. Click on Clone > Download Zip
		1. Download into `downloads`
4. Open `instructor`
	1. `host` - host machine projects
	2. `target` - embedded target machine projects
5. Open `my_workspace`
	1. `host`
	2. `target`
6. Open STM32CubeIDE
	1. Select `instructor/host` and paste
7. File > Import
	1. General
		1. Existing Projects into Workspace
			1. `embedded_c/Downloads/Embedded-C-master/All_source_codes/host`
				1. Paste: Click Browse
				2. Select Copy projects into workspace
				3. Finish
	2. Restore
		1. All instructor projects are imported
8. Right click on a project: ASCII > Build Project
	1. Clean Project
9. Import embedded target projects written by instructor
	1. File > Switch Workspace
	2. Other
	3. Change `host` to `target`
	4. Launch
	5. FIle > Import > General > Existing Project
	6. Downloads/Embedded-C-master/All_source_codes/target/stm32f407_disc
	7. Browse > Paste
	8. Copy projects into workspace
	9. Finish
	10. Restore
	11. Compilation
		1. Select a project
		2. Right click
		3. Build
			1. Project is cross compiled (`arm-none-eabi-gcc` is invoked - cross compiler) - code is built for the target
		4. Clean
	12. Do not change any code in `instructor` folder - for reference if anything goes wrong in our project
10. Own project:
	1. `my_workspace`
		1. Two more workspaces:
			1. Switch workspace: Select `my_workspace` for `host` and `target`

### Constructing a Project for the Host ###
1. Host machine project - x86-x64 bit machine
2. Target machine project - STM32 Discovery board
3. Open STM32CubeIDE
	1. Open `my_workspace/host`
	2. File > New > C/C++ Project
	3. C Managed Build
	4. Next
	5. Project name: 000TestProject
	6. Executable > Empty Project
	7. MinGW GCC (windows)
	8. Linux GCC (Linux or Mac)
	9. Don't select Cross GCC or other (this is for host)
4. Right click on project
	1. New > Source File > main.c

			#include <stdio.h>
			
			int main(void) {
				printf("Hello world\n");
				
				printf("Press 'Enter' to exit this application\n");
				
				getchar();
				
				return 0;
			}
			
		1. Right click on project and Build Project
			1. Exe is created
		2. Execution:
			1. Right click on EXE > Properties 
			2. Click on Show in System Explorer
			3. Double click to launch

### Constructing a Project for the Target ###
1. Launch target workspace
2. File > New > STM32 Project
	1. Does some network activity
	2. Target selector:
		1. MCU/MPU Selector (used for custom board)
		2. Board Selector (used for standard board)
			1. 32F4Nucleo
				1. Deatils
				

### FPU Warning Fix ###
### Hardware/ Software Requirements ###
### Meet the Embedded Target of This Course ###

## Your First 'C' Program ##
### OnlineGDB Web Tool ###
### Printf and Hello World ###
### Printf Exercise Solution ###
### Escape Sequences in 'C' ###
### Printf Exercise Solution ###
### Printf Exercise Solution ###
### Commenting in 'C' ###

## Data Types and Variables ##
### Data Types in 'C' ###
### 'C' Integer Data Types and Value Ranges ###
### Char Data Type and Variable Definition ###
### Variable Definition Exercise ###
### Range Calculation for 'char' Data Type ###
### Integer Data Type 'short int' and Value Range ###
### Integer Data Type 'int' and 'long' ###
### Sizeof ###
### Variables Naming Rules and Definition vs Declaration ###
### Declaration vs Definition: An Illustration ###
### Variables Scope and Illustration ###
### Variables Scope and Illustration Contd ###
### Summary of Local and Global Variables ###

## Address of Variable ##
### Address of Variables ###
### Address of Variables Contd ###

## Storage Classes ##
### Storage Class Specifiers in 'C' ###
### Use Cases of 'static' with Variables ###
### Use Cases of 'static' with Functions ###
### 'extern' Storage Class Specifier ###
### ASCII Codes ###

## Functions ##
### Introduction to Functions in 'C' ###
### Function Prototypes ###
### Returning Data from a Function ###
### Function Exercise ###
### Typecasting in 'C' ###
### Typecasting in 'C' Contd ###

## Microcontroller and Hello World ##
### Embedded - 'Hello World' ###
### Testing printf Over ARM Cortex M4 ITM+SWO Line ###
### Issues with IDE ###
### Testing printf Over OpenOCD Semihosting ###
### Run sizeof on Embedded Target ###
### Sizeof Testing ###
### Compiler Settings on STM32CubeIDE ###

## Build Process ##
### Embedded Project Build Process ###

## Analyzing Embedded C Code ##
### What is a Microcontroller? ###
### Code Memory of the Microcontroller ###
### Code and Data of the Program Using Memory Browser ###
### Analyzing ELF File Using GNU Tools ###
### Disassembly ###
### IDE Option for Instruction Level Debugging ###

## Data Types to Manipulate Floating Point Data ##
### Manipulating Decimal Numbers in 'C' ###
### Single vs Double Precision ###
### Working with Float and Double Variables ###

## Taking Input From the User Using scanf() ##
### Scanf Introduction ###
### Scanf Exercise Implementation ###
### Scanf Exercise Implementation Contd ###
### Scanf Exercise ###
### Scanf and Float with Scientific Notation ###

## Pointers ##
### Pointers in 'C' ###
### Pointer Variables and Pointer Data Types ###
### Pointer Variables and Initialization ###
### Read and Write Operation on Pointers ###
### Pointer Exercise Implementation ###
### Significance of Pointer Data Types ###
### Significance of Pointer Data Types ###

## Importance of <stdint.h> ##
### Importance of <stdint.h> ###

## Operators ##
### Operators in 'C' ###
### Unary Operator in 'C' ###
### Unary Operators with Pointers ###
### Relational Operators in 'C' ###
### Logical Operators in 'C' ###

## Decision Making ##
### 'if' Statement ###
### 'if' Statement Exercise ###
### 'if' Statement Exercise Solution ###
### 'if' and 'else' ###
### 'if' and 'else' Exercise Implementation Part-1 ###
### 'if' and 'else' Exercise Implementation Part-2 ###
### 'if' and 'else' Exercise Implementation Part-3 ###
### 'if-else-if' Ladder Statements ###
### 'if-else-if' Ladder Exercise ###
### 'if-else-if' Ladder Exercise Solution ###
### Conditional Operator ###
### Switch Case Statement in 'C' ###
### Switch Case Exercise ###
### Switch Case Exercise Solution ###
### Switch Case Exercise Solution Contd ###

## Bitwise Operators ##
### Bitwise Operators in 'C' ###
### Bitwise AND and Bitwise OR ###
### Applicability of Bitwise Operators: Testing of Bits ###
### Finding a Number Even or odd Using Testing of Bits ###
### Applicability of Bitwise Operators: Setting of Bits ###
### Applicability of Bitwise Operators: Clearing of Bits ###
### Applicability of Bitwise Operators: XOR ###

## Embedded C Coding Exercise for LED ##
### Coding to Turn on an LED ###
### Controlling IO Pin Using Software ###
### Processor Addressable Memory Regions ###
### STM32 Memory Map ###
### Memory Mapped Peripheral Registers and IO Access ###
### Procedure to Turn ON the LED ###
### Enabling Peripheral Clock ###
### Calculating Peripheral Register Addresses ###
### LED ON Exercise Coding ###

## Bitwise Shift Operators ##
### Bitwise Right Shift Operator ###
### Bitwise Left Shift Operator ###
### Applicability of Bitwise Shift Operators ###
### Modifying LED on Exercise Using Bitwise Shift Operators ###
### Bit Extraction ###

## Looping ##
### Looping in 'C' ###
### While Loop ###
### While Loop Exercise ###
### While Loop and Semicolon ###
### While Loop Exercise ###
### 'do while' Loop ###
### 'for' Loop ###
### 'for' Loop Exercise ###
### 'for' Loop Number Pyramid Exercise ###
### 'for' Loop Exercise Solution ###
### Modifying LED on With Software Delay ###
### LED Toggle Using Software Delay ###

## Type Qualifier 'const' ##
### 'const' Type Qualifier ###
### Placements of 'const' Variables in Memory ###
### 'const' Usage and Different Case Studies ###
### 'const' Usage and Different Case Studies Contd ###

## Pin-Read ##
### IO Pin Read Exercise ###
### IO Pin Read Exercise Implementation ###

## Optimization ##
### Compiler Optimization and Flags ###
### Different Compiler Optimization Levels ###
### Analyzing Pin Read Exercise Disassembly with O0 and O2 ###

## 'volatile' Type Qualifer ##
### volatile and Effect of Optimization ###
### When to Use volatile Qualifier? ###
### Using Volatile to Fix Issues with the Pin-Read Exercise ###
### Using 'volatile' with ISR Part-1 ###
### Using 'volatile' with ISR Part-2 ###
### Usage of const and volatile Together ###

## Structures and Bit Fields ##
### Introduction to Structures ###
### Accessing Structure Member Elements ###
### Sizeof of a Structure ###
### Aligned and Un-Aligned Data Storage ###
### Structure Padding ###
### Calculating Structure Size Manually With and Without Padding ###
### Assembly Code Analysis of Packed and Non-Packed Structure ###
### Typedef and Structure ###
### Structurs and Pointers ###
### Structure Exercise ###
### Structure Exercise Implementation ###
### Structure and Bit Fields ###
### Structure and Bit Fields Contd. ###

## Unions ##
### Unions ###
### Applicability of Unions ###

## Usage of Bit-Fields in Embedded Code ##
### Bit-Fields Exercise: Constructing Bit-Field Structure for Peripheral Registers ###
### Bit-Field Structure for RCC_AHB1ENR ###
### Bit-Field Structure for GPIOx_ODR ###
### Modifying LED Toggle Exercise with Structures and Bit Fields ###
### Testing ###

## Keypad Interfacing ##
### Keypad Interfacing ###
### Why Pull-Up Resistors? ###
### Detecting Key Press Event ###
### Flow Chart for Implementation ###
### Keypad Key Read Code Implementation ###
### Delay Analysis ###

## Arrays ##
### Arrays in 'C' ###
### Read-Write Operation on an Array ###
### Passing Array to a Function ###
### Swapping of Arrays ###
### Swapping of Arrays Contd. ###

## Strings ##
### Strings in 'C' ###
### String literal ###
### String Variable vs String Literal ###
### Inputting a String ###
### scanf and scanset ###
### Exercise ###

## Pre-Processor Directives in 'C' ##
### Pre-Processor Directives in 'C' ###
### Conditional Compilation Directives ###
### 'defined' Operator ###
### Modifying LED Toggle Exercise with Macros ###
### BONUS LECTURE ###