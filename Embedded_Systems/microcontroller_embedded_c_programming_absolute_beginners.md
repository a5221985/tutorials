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
				1. Details
					1. Click Datasheet - downloads datasheet
					2. Docs & Resources
						1. User Manual
		3. ProjectName: 000TestProject
		4. Targeted Language: C
		5. Targeted Project Type: Emtpy
	3. Src/main.c
3. Right Click > Build Project (cross compiler is invoked)
	1. `*.elf` is generated
		1. Next: 
			1. How to install on target hardware
			2. How to debug code on target hardware
			3. How to generate dis-assembly

### FPU Warning Fix ###
1. If "FPU is not initialized, but the project is compiling for an FPU. Please initialize the FPU before use."
	1. We have enabled using hardware floating point unit of the processor in build settings but it has not been initialized in the code
		1. Warning is about asking us to initialize it before using any floating point related code or else it may result in processor fault exception
2. Fix:
	1. Right click on project > properties > expand C/C++ build > Settings > Tool settings > MCU settings > 
		1. Floating-point unit: None
		2. Floating-point ABI: Software implementation (-mfloat-abi=soft)
	2. Clean the project
	3. Build again

### Hardware/ Software Requirements ###
1. [Download PDF](https://www.udemy.com/course/microcontroller-embedded-c-programming/learn/lecture/24707434#overview)
	1. Hardware and software requirements to test source code developed in the course

### Meet the Embedded Target of This Course ###
1. Embedded Target
	1. In the course, STM32F408VGT6 MCU based DISCOVERY Board is used as target
2. Important features
	1. IO pins for interfacing external components
	2. STM32F407VGT6 32 bit Microcontroller Processor: ARM Cortex-M4 + FPU
	3. IO pins for interfacing external components
		1. LEDs
		2. Keypads
		3. Buttons
		4. LCDs
		5. They are called **external interfacing IO headers**
	4. 8 MHz crystal oscillator
	5. On board programmer and debugger - ST-LINK/V2-A
		1. Used to program or debug (we don't have to buy any programmer or debugger)
		2. When we install STM32CubeIDE, the driver and programmer will be installed automatically on the host machine
			1. STM32 also gives separate device drivers for STLink hardware - they can be downloaded and installed
	6. User manual of board:
		1. [https://www.st.com/en/evaluation-tools/stm32f4discovery.html](https://www.st.com/en/evaluation-tools/stm32f4discovery.html)
			1. Resources: user manuals, schematics
3. How to connect board to PC
	1. USB cable - type A plug to Mini Type B Plug
	2. There is another micro-usb connector - not used in the course

## Your First 'C' Program ##
### OnlineGDB Web Tool ###
1. Online Compiler - OnlineGDB - easy to use (cannot use to program target board) - for C program (other languages also)

### Printf and Hello World ###
1. Let's write a 'C' code which simply displays text Hello world on the 'Console' and exits
2. New project > HelloWorld (select C language)
	1. main.c
	2. We can change theme
	3. We can add compiler flags
3. Delete the code
4. Program: `main` is starting point of program execution
	1. C program is a collection of functions and it should have at-least one function called `main` function
	2. `main` function

			#include <stdio.h> // preprocessor directive that instructs preprocessor of compiler to include a file into source file.

			int main() { // C90 and C99 standard prototype
				printf("Hello World!"); // to print text here
			}
			
		1. Function definition
		2. `;` - end of a statement
		3. C compiler needs to know the prototype of `printf` to compile
		4. `<...>` - for standard libraries
		5. We can include files written by us
		6. Click on **Run** button
		7. Settings:
			1. Compiler flags: `-save-temps`
		8. Output files produced:
			1. First file: Preprocessed file: **main.i**
				1. Collection of our code and contents of stdio.h
					1. 849 lines
				2. Pre-processing stage

						main.c -> compiler -> main.i
								
					1. All pre-processing directives will be resolved
					2. Copy and paste the content:
						1. Search for `printf`

								extern int printf (const char *__restrict __format, ...);
			2. Second file: Assembly instructions: **main.s**
				1. Collection of assembly instructions
				2. Higher level language code statements will be converted into processor architectural level mnemonics
			3. Third file: Machine code: **main.o**
			
					main.s -> compiler -> main.o
							assembler stage
				
				1. Assembly level mnemonics are converted into opcodes (machine codes for instructions)
5. Print the following:

		Hello World!
		Today is a great day

### Printf Exercise Solution ###
1. Solution:

		int main() {
			printf("Hello World!\n");
			printf("Today is a great day");
		}
		
	1. `printf` never causes cursor to move to the next line
	2. `\n` - new line or line feed code
		1. `\` - escape character - gives special meaning to the character
		2. `\n` - escape sequence
	3. It can be used anywhere we want

### Escape Sequences in 'C' ###
1. Escape sequences:
	1. `\'` - single quote
	2. `\"` - double quote
	3. `\\` - backslash
	4. `\0` - Null
		1. Used in strings
	5. `\a` - Bell
	6. `\b` - Backspace
	7. `\f` - Form feed
	8. `\n` - Newline
		1. Moves the cursor to beginning of new line vertically
	9. `\r` - Carriable return
		1. Moves the cursor to beginning of current line horizontally
	10. `\t` - Horizontal tab
	11. `\v` - Vertical tab

### Printf Exercise Solution ###
1. Solution:

		printf("David says, \"programming is fun!\"\n");
		printf("Good Day!\n");

### Printf Exercise Solution ###
### Commenting in 'C' ###
1. Comments:
	1. Generally comments are used to provide description or documentation about the code you have written
	2. Through commenting you can mention:
		1. Important note
		2. Briefly explain behaviour of code
		3. Other useful details
	3. Comments help the developer understand the logic/algorithm of the code if he/she revisits it after a long time
	4. You can mention comments anywhere you want in the program and your comments will be ignored by compiler
	5. Comments do not affect program or they do not consume any program memory space.
	6. They are not part of final executable generated.
		1. It is just for documentation purposes
	7. Two types
		1. Single line comments
			1. `//...`
		2. Multi-line comments
			1. `/* ... */`
			2. Example:

					/* C standard library header file inclusion
						This is comment line 1
						... */
					#include <stdio.h>
			
			3. Example: Multiline comments

					/* This is my program 
					   this is comment line 1 */
					#include <stdio.h>
					
					// This is my program 
					// this is comment line 1
					#include <stdio.h>

## Data Types and Variables ##
### Data Types in 'C' ###
1. 'C' data types and variables
2. Data types:
	1. Data type is used for declaring the type of a variable
	2. In C programming, data type determines type and size of data associated with variables
	3. Before storing any value in variable
		1. First programmer should decide its type
3. Representing real world data
	1. Data as numbers (integer or real numbers)
	2. Data as characters
	3. Data as strings (collection of characters)
		1. Example: name
	4. Examples:
		1. Roy's age is 44 years, 6 months and 20 days
			1. They are numbers
		2. The temperature of the city X is +27.2 degrees celcius
			1. Real number
			2. Character
		3. Today's date is 21st June
		4. I got an 'A' grade in school assignment
			1. Character
4. Data types:
	1. Integer data types
		1. Used to represent whole numbers
			1. Example: 10, 20, 30, ...
	2. Float data types
		1. Used to represent real numbers (temperature say)
			1. Example; 10, 24.5, 60.000001, ...
5. Integer data:
	1. Signed data (temperatur say)
		1. `char`
		2. `short int`
			1. `short` in short
		3. `int`
		4. `long int`
			1. `long` in short
		5. `long long int`
			1. `long long` in short
	2. Signed data
		1. `unsigned char`
		2. `unsigned short int`
		3. `unsigned int`
		4. `unsigned long int`
		5. `unsigned long long int`

### 'C' Integer Data Types and Value Ranges ###
1. 'C' integer data types, their storage sizes and value ranges:
	1. `signed char` - 1 byte - -128 to +127
	2. `unsigned char` - 1 byte - 0 to 255
	3. `short int` - 2 bytes - -32,768 to 32,767
	4. `unsigned short int` - 2 bytes - 0 to 65,535
	5. `int` - 4 bytes - -2,147,483,648 to 2,147,483,647
	6. `unsigned int` - 4 bytes - 0 to 4,294,967,295
	7. `long` - 8 bytes - -9223372036854775808 to 9223372036854775807
	8. `unsigned long` - 8 bytes - 0 to 18446744073709551615
	9. `long long int` - 8 bytes - -9223372036854775808 to 9223372036854775807
	10. `unsigned long long int` - 8 bytes - 0 to 18446744073709551615
2. Meaning of memory size:
	1. Compiler (e.g. GCC) will generate code to allocate 64 bits (8 bytes of memory) for each long long variable
3. The sizes are fixed by the compiler designer
	1. int may be 2 bytes or 4 bytes or 8 bytes
		1. Example: XC8 - cross compiler for PIC 8 bit microcontrollers
			1. `unsigned char` - 8-bit - 0 to 255
			2. `char` - 8-bit - -128 to +127
			3. `unsigned int` - 16-bit - 0 to 65,535
			4. `int` - 16-bit - -32,768 to +32,767
			5. `unsigned short` - 16-bit - 0 to 65,535
			6. `short` - 16-bit - -32,768 to +32,767
			7. `unsigned short long` - 24-bit - 0 to 16,777,215
				1. Not from C standard
			8. `short long` - 24-bit - -8,388,608 to +8,388,607
			9. `unsigned long` - 32-bit - 0 to 4,294,967,295
			10. `long` - 32-bit - -2,147,483,648 to +2,147,483,648
		2. armcc cross compiler for 32-bit ARM based microcontrollers (not open-source)
			1. `char` - 8-bits - (1 byte-aligned) - 0 to 255 (unsigned) by default, -128 to 127 (signed) when compiled with `--signed_chars`
			2. `signed char` - 8-bits - (1 byte-aligned) - -128 to +127
			3. `unsigned char` - 8-bits - (1 byte-algined) - 0 to 255
			4. `(signed) short` - 2 (halfword-aligned) - -32,768 to 32,767
			5. `unsigned short` - 2 (halfword-aligned) - 0 to 65,535
			6. `(signed) int` - 4 (word-aligned) - -2,147,483,348 to 2,147,483,647
			7. `(signed) long` - 4 (word-aligned) - -2,147,483,648 to 2,147,483,647
			8. `unsigned long` - 4 (word-aligned) - 0 to 4,294,967,295
			9. `(signed) long long` - 8 (doubleword-aligned) - -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807
			10. `unsigned long long` - 8 (doubleword-aligned) - 0 to 18,446,744,073,709,551,615
	2. We need to refer to the reference manual of the compiler to know the sizes
4. 'C' integer data types, their storage sizes and value ranges
	1. C standard does not fix storage sizes of different data types. 		1. Only talks about minimum and maximum values
	2. For example C standard says:
		1. Minimum storage size of a long type variable: 32 bits
		2. Maximum: 64 bits. 
			1. Exact size of long type variable depends on compiler design
	3. Some compilers fix 32 bits as storage size for long & some fix 64 bits
		1. Same is true for `int`
			1. Some compilers fix 16 bits
			2. Some compilers fix 32 bits
5. The following data types are of fixed size irrespective of compilers
	1. `short` (`signed` or `unsigned`) - 2 bytes
	2. `char` (`signed` or `unsigned`) - 1 byte
	3. `long long` (`signed` or `unsigned`) - 8 bytes

### Char Data Type and Variable Definition ###
1. Integer data types: `char`
	1. It is integer data type to store single character (ASCII code)
		1. 1 byte of signed integer value
	2. `char` consumes 1 byte of memory
	3. `char` - smallest integer data type
	4. No special meaning of `char` data type
		1. It is just another integer data type
	5. `char` range: -128 to 127
		1. It will be used to store 1 byte of `signed` data
	6. Unsigned `char` range: 0 to 255
		1. It will be used to store 1 byte of `unsigned` data
	7. Example:
		1. I want to store current temperature data of city `X` in program
			1. City `X`'s temperature is `25` degrees celcius
			2. Suppose we are sure that `X`'s temperature never goes below 0 degrees and never goes above `40` degrees celcius
				1. `X`'s temperature will always be positive value and max value is less than 255
			3. We can use `unsigned char` can be used
			
					unsigned char cityXTemperature;
					cityXTemperature = 25;
					
				1. It holds only integers (not floats)
2. Variable definition

		unsigned char cityXTemperature; /* This is a variable definition */
		cityXTemperature = 25; /* This is variable initialization */
		
	1. Variable declaration: includes **data type** and **variable name**
		1. Data type is mandatory in C
		2. 

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
