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

		unsigned char cityXTemperature; /* This is a variable declaration */
		cityXTemperature = 25; /* This is variable initialization */
		
	1. Variable declaration: includes **data type** and **variable name**
		1. Data type is mandatory in C
		2. **Data type can be selected according to the program logic and need**
3. Example - 2
	1. Storing sun's temperature value in program
		1. surface temperature - 5,505 degrees celcius
			1. It will never be negative anytime soon as per our knowledge (even if it goes, no life or this program would exist as of now)
			2. We can consider it as unsigned data (+ve data)
		2. 5505 > 255 - it cannot be `unsigned char`
			1. `unsigned short` can be used

					unsigned short sunTemperature = 5505;

### Variable Definition Exercise ###
1. Write a C program to calculate and print distance from A to C
	1. Construct variables to hold these data
	2. Compute the sum of data
	3. Store the result
	4. Print the result as shown in the format

			int main() {
				unsigned char distanceAToB = 160; // in kms
				unsigned char distanceBToC = 40;  // in kms
				unsigned char distanceAToC = distanceAToB + distanceBToC; // in kms
				printf("Total distance from A to C = %u\n", distanceAToC);
			}
			
		1. How to print contents?
			1. Integer
			2. Hex number
			3. Octal number
			4. Character
		2. Format specifiers
			1. `%d` - integer format (signed data)
			2. `%f` - float format
			3. `%c` - character
			4. `%s` - string
			5. `%ld` - long int
			6. `%x` - hex **(M)**
			7. `%o` - octal
			8. `%u` - unsigned integer

### Range Calculation for 'char' Data Type ###
1. Range Calculation:
	1. Range of `char` data type
		1. Variable of `char` type consumes 1 byte of memory
		2. `char` will be used to stored 1 byte of signed data
2. How is it stored?
	1. Most significant bit is used to represent sign of data
		1. 0 - +ve
		2. 1 - -ve
	2. Magnitude is stored in 2's complement format (if data is negative)
		1. Signed data - dedicated 1 bit is used to encode sign of data
			1. 7 bits - used to store magnitude
			2. MSB - used to represent sign of data
		2. Example: -25 in 1 byte signed data representation

				1 1 1 0 0 1 1 1
				
				25 = 0 0 0 1 1 0 0 1
				~25 = 1 1 1 0 0 1 1 0
				~~25 = 1 1 1 0 0 1 1 1
				
			1. 2's compliment automatically puts 1 at MSB
			2. Hex: 0xE7 (-25)
		3. Example: 25 in 1 byte signed data representation

				0 0 0 1 1 0 0 1
				
			1. Hex: 0x19 (25)
	3. `char` data type range (when +ve)
		1. least value = 0 0 0 0 0 0 0 0 (0)
		2. highest value = 0 1 1 1 1 1 1 1 (+127)
	4. `char` data type range (when -ve)
		1. least value = 1 0 0 0 0 0 0 0 (-128 - 2s compliment)
		2. highest value = 1 1 1 1 1 1 1 1 (-1)
3. Unsigned char range
	1. `unsigned char` - used to store 1 byte of unsigned data
	2. No particular bit is dedicated to encode sign
		1. Leas value: 0
		2. Highest value: 255 (1 1 1 1 1 1 1 1)

### Integer Data Type 'short int' and Value Range ###
1. `short int` and `unsigned short int`
	1. `short int` - used to store 2 bytes of signed data
	2. `unsigned short int` - used to store 2 bytes of unsigned data
	3. `short` (for signed) or `unsigned short` - `int` is assumed
	4. `short` - always consumes 2 bytes of memory irrespective of compilers
2. Range calculation:
	1. -25

			0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 1
			1 1 1 1 1 1 1 1 1 1 1 0 0 1 1 0
			1 1 1 1 1 1 1 1 1 1 1 0 0 1 1 1 (2s compliment)
			
		1. `0xFFE7`
	2. 25

			0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 1
			
3. Range:
	1. `short` range: -32,768 to 32,767
	2. `unsigned short` range: 0 to 65,535 (0xFFFF)
4. Integer data type: `int` and `unsigned int`
	1. `int` is integer data type to store signed integer data
	2. `int` type consumes 2 bytes of mem or 4 bytes of mem
	3. Size of `int` decided by compiler used to generate code for target hw
		1. Consult compiler user manual to understand size of int (typically 2 or 4 bytes)
	4. `unsigned int` - used to store unsigned integer value

### Integer Data Type 'int' and 'long' ###
1. Integer data type: type to store signed integer data
	1. `int` is integer data type
		1. To store signed integer data
	2. `int` type variable consumes 2 bytes or 4 bytes of mem
	3. Size of `int` - decided by compiler used to generate code for target hardware
		1. Consult user manual to understand size of `int` (2 or 4 bytes)
	4. `unsigned int` - integer data type to store unsigned integer
2. Integer data type: `long` and `unsigned long`
	1. `long` is integer data type to store signed integer data
	2. `long` type consumes 4 bytes or 8 bytes
	3. Size of `long` type is decided by compiler used to generate code for target hardware
		1. Consult compiler manual to understand size of `long` (typically 4 or 8 bytes)
	4. `unsigned long` - integer data type to store unsigned integer data

### Sizeof ###
1. `sizeof` - operator of C programming language
	1. Used to find size of variable
	2. Output may be different on different machines
		1. It is compiler dependent
2. Example:

		int main() {
			printf("Size of char data type = %d\n", sizeof(char)); 
			printf("Size of short data type = %d\n", sizeof(short));
			printf("Size of int data type = %d\n", sizeof(int));
			printf("Size of long data type = %d\n", sizeof(long));
			printf("Size of long long data type = %d\n", sizeof(long long));
			char size = sizeof(myLongHistory);
			return 0;
		}
		
	1. Operand can be:
		1. Variable name
		2. Data type
3. `sizeof` - tells how many bytes are consumed (from memory) by the variable or the type
4. It can be used instead of reading manual

### Variables Naming Rules and Definition vs Declaration ###
1. What are variables?
	1. Variables are identifiers for data
	2. Data are usually stored in memory
	3. Variable acts as a label to memory location (where data is stored)
	4. Variable names are not stored in computer memory (they are there for programming convenience)
		1. Compiler replaces them with memory location addresses during data manipulation
2. Memory location addresses (pointers in C)
	
		0x0807		0 1 1 0 0 1 1 1
		0x0806		1 1 0 0 0 1 0 0 
		0x0805		0 1 1 0 0 1 1 1
		0x0804		1 1 1 1 0 1 1 1
		0x0803		1 1 1 0 0 1 1 0
		0x0802		0 1 1 0 0 1 1 0
		0x0801		0 1 1 1 0 1 1 1
		0x0800		0 1 1 1 0 1 1 1
		
	1. To store or read to or from memory location respectively, we must use it's address
		1. Address can be (depending on computer architecture)
			1. 32 bits (Arm Cortex Mx - 32 bit)
			2. 16 bits
			3. 8 bits
	2. Example:

			0x0800		0 0 0 1 0 1 0 0
			valueA
			
		1. `valueA` - Name assigned to memory location address to retrieve the data stored
		2. Variable name exists for programming convenience and doesn't exist post-compilation
			1. Only associated memory address exists
3. Programmer referes to variable name associated to the memory location (for read or write)
4. Defining Variables
	1. Before you use a variable, you have to define it
	2. Variable definition
		1. Sometimes called variable declaration
		2. It is letting the compiler know we will need some memory space for program data
			1. For reserving some memory
	3. To declare a variable, we only need to state it's type
		1. Followed by variable name
	4. Example: If data type of variable is `char`
		1. Compiler reserves 1 byte
	5. Example: If data type of variable is `int`
		1. Compiler reserves 4 bytes
5. Syntax: Defining variables
	1. 'C' syntax of variable declaration:

			<data type> <variable name>;
			
		1. Example:

				char myExamScore; // This is called variable declaration
				
	2. Initialization

			char myExamScore; // variable declaration
			myExamScore = 25; // This is called variable initialization
			
		1. Initialization should follow declaration
		2. Compiler generates instructions to put value into memory location referred to by the variable name
	3. Variable declaration and initialization can be done in a single statement
		1. Example:

				char myExamScore = 25;
				
6. Rules for Naming a Variable
	1. Make sure that variable name is not more than 30 characters
		1. Some compilers may issue error (if longer)
	2. Variable names can only contain
		1. Alphabet (uppercase and lowercase)
		2. Digits
		3. Underscore
	3. First letter of a variable cannot be a digit
		1. It should be alphabet or underscore
	4. You cannot use 'C' standard reserved keywords as variable names
7. C99 Reserved Keywords
	1. Syntax:
		1. `auto` - ?
		2. `break`
		3. `case`
		4. `char`
		5. `const`
		6. `continue`
		7. `default`
		8. `do`
		9. `double`
		10. `else`
		11. `enum`
		12. `extern`
		13. `float`
		14. `for`
		15. `goto`
		16. `if`
		17. `inline`
		18. `int`
		19. `long`
		20. `register`
		21. `restrict` - ?
		22. `return`
		23. `short`
		24. `signed`
		25. `sizeof`
		26. `static`
		27. `struct`
		28. `switch`
		29. `typedef`
		30. `union`
		31. `unsigned`
		32. `void`
		33. `volatile`
		34. `while`
		35. `_Bool` - ?
		36. `_Complex` - ?
		37. `_Imaginary` - ?
	2. Semantics
		1. The above tokens (case sensitive) are reserved (translation phases 7 and 8)
			1. For use as keywords
		2. `_Imaginary` is reserved for specifying imaginary types
8. Example:

		#include <stdio.h>
		
		int main() {
			char _1111111; // legal
			char 89_; // illegal
			long long mySalary123_0; // legal
			int _____myAge; // legal
			char MYNAME; // legal
			int %_temperatureValue; // illegal
			int my car number; // illegal
			int 1234; // illegal
		}
		
1. Variable definition vs. declaration
	1. A variable is **defined** when compiler generates instructions to allocate storage for variable
	2. A variable is **declared** when compiler is informed that variable exists along with its type.
		1. Compiler does not generate instructions to allocate storage for variable at that point
	3. Variable defintion is also a declaration
		1. Not all variable declarations are definitions

### Declaration vs Definition: An Illustration ###
1. Example:

		int myExamScore; // local space (scope)
		myExamScore = 540;
		
		
		
		extern int myExamScore; // error - undefined reference made - when compiler sees this, it will not allocate any storage
		
		...
		myExamScore = 540; // this is not defined - compiler cannot find it
		
	1. `extern` - tells compiler that this variable is defined outside the scope of this file.

### Variables Scope and Illustration ###
1. Variables Scopes
	1. Variables have scopes
	2. Variable scope refers to accessibility of a variable in a given program or function
		1. Example:
			1. A variable may be available only in a specific function
			2. A variable may be available in the entire C program
	3. Local scope variables (local variables)
	4. Gobal scope variables (global variables)
2. Local scope variables

		int main() {
			int myScore; // it exists (memory claimed) for the time the function is executed
		}
		
	1. Once function exits:
		1. Local variables die (memory re-claimed)
	2. Local variables come and go during the run time of the function execution of a program
		1. They don't sit permanently on data memory
3. Example:

		void myFunc1(void); // prototype or signature

		// int myScore; // it will occupy data memory permanently throughout life span of a program

		int main() {
			int myScore;
			
			myScore = 900;
			
			printf("Value of the variable myScore = %d\n", myScore);
		
			/* this is a function call */
			myFunc1();
			
			return 0;
		}

		void myFunc1(void) {
			myScore = 800; // undeclared
			printf("002Value of the variable myScore = %d\n", myScore);
		}
		
	1. Example:

			int valueA = 4;
			
			int main() {
				int valueA = 67;
				
				printf("value A = %d\n", valueA);
				
				return 0;
			}
			
		1. If variable names are same, first preference is given to local space

				{
					int valueA = 67; // restricted to this scope only
				}
				
			1. When execution control goeas out of scope of a local variable, local variable dies
				1. Variable loses its existence

### Variables Scope and Illustration Contd ###
### Summary of Local and Global Variables ###
1. Summary of Global Variables
	1. **Scope**: Global variables are visible to all functions of a program
		1. They are everywhere
		2. One can access global variables from another file of project
	2. **Default value**: All uninitialized global variables will have 0 as default value
	3. **Lifetime**: Till the end of execution of program
2. Summary of Local Variables
	1. **Scope**: Within body of function. Local variables lose existence once execution control comes out of function body
	2. **Default value**: unpredictable (garbage value)
	3. **Lifetime**: Till the end of execution of function in which a variable is defined

## Address of Variable ##
### Address of Variables ###
1. Write a program to print address of variables

		int myData;
		
		&myData; // gives memory location address of myData variable
		
	1. `%p` - format specifier to print memory address (pointer)
	2. Print address:

			printf("Address of variable a1 = %p\n", &a1);
			
		1. `0x00007FFF8E3C3821` - address (8 bytes - 64 bit machine)
			1. Pointer size is compiler and hardware-specific
			2. ARM Cortex Mx STM32 - 4 bytes (32 bit machine)
		2. `01000001` - ASCII code of 'A' - 0x41
		3. Example:

				printf("Address of variable a1 = %p\n", &a1);
				printf("Address of variable a1 = %p\n", &a2);
				printf("Address of variable a1 = %p\n", &a3);
				printf("Address of variable a1 = %p\n", &a4);
				printf("Address of variable a1 = %p\n", &a5);
				
			1. Consecutive addresses

### Address of Variables Contd ###
1. Storing address into variable

		unsigned long int addressOfA1 = &a1;
		
	1. We are trying to assign a pointer type data into a variable
		1. Data type mismatch warning
			1. Solution: Convert pointer data type into variable data type using typecasting
	2. Variables are represented by variable data type
	3. Pointers are represented by pointer data type
		1. `char*`
			1. It is not just a number but a pointer

					unsigned long int addressOfA1 = (unsigned long int) &a1;
					
				1. After typecasting it is just a number (not a pointer)
				2. `long` should be 8 bytes or else size will mismatch if pointer is of 8 bytes

						unsigned long long int addressOfA1 = (unsigned log long int) &a1;
						
					1. Format specifier:

							%I64d or %I64u or %I64x (MINGW compiler specific)
							%lld or %llu or %llx (gcc)

## Storage Classes ##
### Storage Class Specifiers in 'C' ###
1. Storage classes in 'C' decide
	1. Scope of variable
	2. Visibility of variable or function
	3. Life time of variable
2. Scope, visibility, and lifetime
	1. Features of variable
		1. The features can be modified using storage class specifiers
3. Two widely used storage class specifiers in 'C'
	1. `static`

			int main() {
				myFun1();
				myFun1();
				myFun1();
				myFun1();
			}

			void myFun1(void) {
				static int count = 0; // if we make it global, it becomes public (even to other files)
				count = count + 1;
				printf("This function executed %d times\n", count);
			}
			
		1. Requirement: We want global variable that is private to a fucntion
			1. We want a private variable that does not lose its existence even if execution control goes out of scope of that variable
				1. `static` - accessible only from within the scope (function in this case) but it is global in lifetime
	2. `extern`

### Use Cases of 'static' with Variables ###
1. A 'C' project
	1. file1.c
	2. file2.c
	3. file3.c
2. A 'C' project can be a collection of multiple source files
	1. `static` storage class specifier can be used to manage visibility of variables across various files effectively
		1. main.c

				void file1_myFun1(void);

				static int mainPrivateData; // global is visibility will make it accessible somewhere else
				
				int main() {
					mainPrivateData = 100;
					printf("mainPrivateData = %d\n", mainPrivateData);
					
					file1_myFun1();
					
					printf("mainPrivateData = %d\n", mainPrivateData);
					return 0;
				}
			
		1. New file: file1.c

				extern int mainPrivateData; // declaration only, static variables cannot be externed

				void file1_myFun1(void) {
					mainPrivateData = 900; // cannot be modified
				}
				
			1. `static` global variables are accessible only in the file

### Use Cases of 'static' with Functions ###
1. main.c

		void chainge_system_clock(int system_clock) { // suppose we don't want any other file to call this function
			print("System clock changed to = %d\n", system_clock);
		}

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
