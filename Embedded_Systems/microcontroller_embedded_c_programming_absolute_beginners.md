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

		// ...

		static void chainge_system_clock(int system_clock) { // suppose we don't want any other file to call this function - private function of main.c
			print("System clock changed to = %d\n", system_clock);
		}
		
2. file1.c
		
		extern void change_system_clock(int system_clock); // extern is optional // doesn't compile - undefined reference made to ...
		
		void file1_myFun1(void) {
			change_system_clock(0);
		}

### 'extern' Storage Class Specifier ###
1. Extern
	1. 'extern' storage class specifier is used to access
		1. global variable defined outside the scope of file
	2. 'extern' storage class specifier can also be used during function call
		1. When function is defined outside scope of file (it is optional - it is assumed)
	3. 'extern' is relevant only when project consists of multiple files
		1. We need to access variable defined in one file from another file
	4. 'extern' is used to extend visibility of function or variable

### ASCII Codes ###
1. The American National Standards Institute (ANSI) developed ANSI C & ASCII code
	1. American Standard Code for Information Interchange
2. Using ASCII standard
	1. We can encode 128 different characters
3. We just need 7 bits
	1. `char` data type can be used
4. Example: Apple:) - ASCII code representation

		char a1 = 65;
		char a2 = 112;
		char a3 = 112;
		char a4 = 108;
		char a5 = 101;
		char a6 = 58;
		char a7 = 41;
		
	1. Short cut

			char a1 = 'A'; // instead of 65 - compiler changes it to 65
			char a2 = 'p';
			char a3 = 'p';
			char a4 = 'l';
			char a5 = 'e';
			char a6 = ':';
			char a7 = ')';
			
			printf("The string is: %c %c %c %c %c %c %c\n", a1, a2, a3, a4, a5, a6, a7); // %d prints 65
			
		1. Arrays:
			
				char a[] = "Apple:)";

## Functions ##
### Introduction to Functions in 'C' ###
1. Functions:
	1. In 'C', you write executable statements inside a function
		1. putting function calls say in global scope is illegal
			1. Variable definition and declaration are allowed
	2. A 'C', function is nothing but collection of statements to perform a specific task
	3. Every C program, at least, has one function called 'main'
	4. Using functions bring modularity to code
		1. Easy to debug
		2. Easy to modify
		3. Increases maintainability of code
	5. C function minimizes code size and reduces code redundancy
	6. Functions provide abstraction
		1. printf - function given by standard library
			1. We need not worry about how it is implemented
				1. It just serves our purpose
	7. If program, if we want to perform same set of tasks again and again
		1. We define a function to do the task
		2. We call it every time we need to perform the task
	8. It reduces code redundancy and brings modularity to program and also decreases final executable size of the program
	9. General definition:

			return_data_type function_name(parameter_list) {
				// body of function
			}
			
		1. Example:
			1. no input arguments

					int main() {
						/* ... */
					}
					
			2. 2 input arguments

					int main(int argc, char* argv[]) {
						/*...*/
					}
					
				1. We don't use this definition of main for embedded systems because most of the time, there are no commandline arguments in embedded systems
		2. `main` function should return `int` data as per 'C' standard C89 and above
			1. Returning `void` triggers warnings
		3. `main` takes only zero or two arguments
		4. `main()` is special function in C from where execution of program starts and ends
		5. `main()` returns status of program to parent process (OS here)
			1. It shows success or failure of program
				1. 0 - success
				2. non-0 - failure
		6. `main()` should return `int` value as per standard (C89 and above)
2. Function to add numbers

		int main() {
			function_add_numbers(12, 13, 14);
			function_add_numbers(-20, 20, 14);
			
			int valueA = 90;
			int valueB = 70;
			function_add_numbers(valueA, valueB, 90);
		}
		
		void function_add_numbers(int a, int b, int c) {
			int sum;
			sum = a + b + c;
			printf("Sum = %d\n", sum);
		}
		
	1. 'formal' parameters: Local scope variables of function `function_add_numbers` that are used to receive data from other parts of program
	2. Function prototype helps compiler to understand function return data type and data types of 'formal' parameters
		1. Or else, compiler will make unwanted assumptions which conflicts with function definition
			1. To avoid it, mention function prototype before calling function for very first time

### Function Prototypes ###
1. In C functions first have to be declared before they are used
	1. Warning: Compiler assumed the prototype

			#include <stdio.h>
			
			void function_add_numbers(int a, int b, int c); // protoype

### Returning Data from a Function ###
1. Compute sum and return the sum back to caller

		int retValue;
		retValue = function_add_numbers(23, 45, 67);
		printf("Sum = %d\n", retValue);
		//...

		int function_add_numbers(int a, int b, int c) {
			int sum;
			sum = a + b + c;
			return sum;
		}

### Function Exercise ###
1. Write a program to do mathematical operations such as addition, subtraction, multiplication, and division of integers
	1. Do all math operations in separate functions in a file called math.c
	2. Call functions from main.c to test them.
2. Solution:
	1. main.c

			#include <stdio.h>
			#include "math.h"

			int main() {
				int a = 13;
				int b = 19;
				
				int sum = add(a, b);
				int diff = sub(a, b);
				int product = mul(a, b);
				int quotient = div(b, a);
				
				printf("%d + %d = %d\n", a, b, sum);
				printf("%d - %d = %d\n", a, b, diff);
				printf("%d x %d = %d\n", a, b, product);
				printf("%d / %d = %d\n", b, a, quotient);
				
				return 0;
			}
			
	2. math.c

			int add(int a, int b) {
				return a + b;
			}
			
			int sub(int a, int b) {
				return a - b;
			}
			
			long long int mul(int a, int b) {
				return ((long long int) a) * b;
			}
			
			long double div(int a, int b) {
				return ((long double) a) / b;
			}
			
	3. math.h

			#ifndef MATH_H_
			#define MATH_H_
			
			extern int add(int a, int b);
			extern int sub(int a, int b);
			extern long long int mul(int a, int b);
			extern long double div(int a, int b);
			
			#endif /* MATH_H_ */
			
		1. Include guards:
			1. The prevent inclusion of header files multiple times in source file
			2. Written using pre-processor directives
		2. User defined header files should be in `""`

### Typecasting in 'C' ###
1. Typecasting is a way to convert variable or data from one data type to another data type
2. Data is truncated if higher data type is converted to lower data type
3. 2 Types of casting
	1. Implicit casting (compiler does this)
		1. automatic convertion as per default rules
	2. Explicit casting (programmer does this)
		1. Used to override what compiler does
4. Example:

		unsigned char data = 0x87 + 0xFF00; // 4 byte + 4 byte - compiler implicitly considers data size of the constants as 4 bytes (of integer data type). Also called integer promotion
		
	1. If we don't mention any data type for integer constants, it is considered as `int` data
	2. warning: unsigned conversion from `int` to `unsigned char`
		1. Compiler did implicit casting twice here
			1. Promoted data sizes of RHS constants to `int`
			2. While storing RHS into LHS, it again did casting from `int` to `unsigned char`
				1. This fired a warning "data loss during the convertion"
					1. Truncates `int` to `unsigned char`
				2. If there is not information loss, there is no warning

						unsigned char data = 0x01 + 0x0089;
						
		2. Explicit casting:

				unsigned char data = (unsigned char) (0x87 + 0xFF00);
			
			1. Explicit casting does not prevent any data loss
				1. Compiler comes to know that you just want 1 byte out of final result and it doesn't fire any warning
		3. Real number:

				float result = 80 / 3;
				
			1. fraction part is lost:
				1. `int` / `int` -> `int`
				2. Result is stored in `float`
			2. Solution: 		

					float result = ((float) 80) / 3;
					
				1. Numerator explicitly promoted to `float`
				2. Denominator is promoted to `float` (implicitly)
					1. `float` / `float` -> `float`
				3. Explicit casting of denominator

						float result = 80 / (float) 3;
						
					1. Warnings are dangerous and they must be resolved

### Typecasting in 'C' Contd ###
1. Different data:

		unsigned char data = 0x1FFFFFFFA0B0 + 0x1245;
		
	1. First number is considered as `long long int` and implicit casting is done on second number from `int` to `long long int`
	2. warning: `long long int` to `unsigned char`

## Microcontroller and Hello World ##
### Embedded - 'Hello World' ###
1. New STM32 Project:
	1. File > New > STM32 Project
	2. Board Select
	3. Name: 001HelloWorld
	4. Language: C
	5. Targeted Project Type: Empty
2. Folder:
	1. `Inc` - include folder - header files for project
	2. `Src` - source code (.c files)
		1. `main.c`
		2. `syscalls.c`
		3. `sysmem.c`
	3. Startup (startup code is required for every microcontroller)
		1. startup_stm32f407vgtx.s (later)
			1. Writing startup file from scratch - later
3. main.c

		#include <stdio.h>
		
		int main() {
			printf("Hello World\n");
			for(;;);
		}
		
	1. How are we going to see the message output without a display device connected to our board?
		1. Solution:
			1. ARM Cortex Processor
				1. Using printf outputs on ARM COrtex M3/M4/M7 based MCUs
					1. This discussion is only applicable to MCUs based on ARM Cortex M3/M4/M7 or higher processors
					2. printf works over **SWO pin** (**Serial Wire Output**) of SWD interface
			2. If usign a board based on Cortex M0 or M0+ processor
				1. Watch the next video to use openOCD based semi hosting technique to use printf
					1. Trace functionality cannot be used
			3. Board:

					ARM Cortex M4 Proc --SWO-> ST Link V2 DEBUG Circuit
					
					ST Link V2 DEBUG Circuit -USB-> PC
					
				1. On board ST Link V2 DEBUG circuit - Used by PC to communicate with the board
					1. To write program to internal flash of microcontroller
					2. To read various register locations of microcontroller
					3. To run or stop processor
					4. USB goes to PC
				2. ARM Cortex M4 Processor

						__________
						|ITM unit| (Instrumentation Trace Macrocell Unit)
						----------
						_________________________
						| Debug Connector (SWD) |
						-------------------------
						2 pin (debug) + 1 pin (trace)
						
					1. This is inside the ARM Cortex M4 Processor
					2. ITM - optional application-driver trace source that supports `printf` style debugging to trace operating system and application events, and generates diagnostic system info
						1. Available in M3 and above (Not in M0)
					3. Serial Wire Debug (SWD) - two-wire protocol for accessing ARM debug interface
						1. Works over SWD connector
							1. It has 3 pins
								1. 2 pins are used for debug
								2. 1 pin is used for trace
						2. SWD
							1. Serial Wire Debug (SWD) is a two-wire protocol for accessing ARM debug interface
							2. It is part of ARM debug Interface Specification v5 (an alternative to JTAG)
							3. Physical layer of SWD consists of two lines
								1. SWDIO: a bidirectional data line
									1. Carries debug related commands
										1. When we setup a break-point in IDE, the info is sent over SWDIO data line to the processor
										2. To stop processor, the info is carried over SWDIO line using SWCLK to the processor
								2. SWCLK: a clock driven by the host (host: SWLINK Circuit)
							4. Using SWD interface, we should be able to program MCUs internal flash
								1. We can access memory regions
								2. We can add breakpoints
								3. We can stop/run CPU
							5. Other good thing: We can use serial wire viewer for printf statements for debugging
							6. Both SWDIO and SWCLK are managed by ST-Link circuitry
				3. SWD and JTAG
					1. JTAG - traditional mechanism for debug connections for ARM7/9 family
						1. Cortex-M family: SWD interface was introduced
							1. SWD:
								1. Designed to reduce pin count required for debug from 4 used by JTAG (excluding GND) down to 2
								2. Additionally, SWD interface provides another pin called SWO (Serial Wire Output) - used for Single Wire Viewing (SWV) (low cost tracing technology)
			3. ITM Unit:

					ITM UNIT

						FIFO
						[||||] -> Debug Connector (SWD) -> SWO Pin (comes out of debug circuit)
						
				1. SWO pin is connected to ST link circuitry of board (FIFO is connected to SWO pin)
				2. The output can be captured using debug software (IDE)
					1. Not all IDEs supports this (STM32Cube, TrueIDE support)
4. Code snippet: Go to Git repo and copy itm_send_data.c code
	1. syscalls.c
		1. paste the code just below include statements (from [https://github.com/niekiran/Embedded-C/blob/master/All_source_codes/target/itm_send_data.c](https://github.com/niekiran/Embedded-C/blob/master/All_source_codes/target/itm_send_data.c))
			1. It is an implementation of printf like feature using ARM Cortex M3/M4/M7 ITM functionality (does not work for M0/M0+ - use semihosting feature of openOCD)
		2. The code writes into FIFO
	2. Go to `_write(...)`
	3. Call the new function

			for (DataIdx ...)
			{
				// __io_putchar(*ptr++);
				ITM_SendChar(*ptr++);
			}
			
	4. What is happening?
		1. `printf` implementation is std library

				printf()
				{
					__write(...);
				}
				
					__write(...)
					{
						ITM_sendChar(...);
						LCD_sendChar(...);
					}
					
			1. `printf` is diverted to ITM Trace Unit
			2. Cross compiler is already installed by IDE (which is used for STM32)
				1. If we want to uprade to newer version - we need to change settings
5. Cross compilation
	1. x86/x86_64 architecture (Host machine)
		1. cross compiler: `arm-none-eabi-gcc` - the compiler runs on host machine
			1. It produces executable for different architecture(s)
				1. .elf (executable - executable and linkable format)
					1. Used for debugging
						1. Debug analyzers can be used to read contents (unless it is 
				2. .bin
					1. Pure binary (for production)
					2. Debugging is not possible with this format
				3. .hex
					1. Pure binary (for production)
					2. Debugging is not possible with this format
	2. Cross compiler runs on one architecture but produces code for a different architecture
		1. It is cross compilation
6. Native compilation
	1. Host native compiler (mingw_64 or gcc) - compiler runs on host machine
	2. It produces executable which also runs on same machine
		1. .exe (say)

### Testing printf Over ARM Cortex M4 ITM+SWO Line ###
1. Loading to target:
	1. Connect STM32 target board to PC
	2. Right click on project
		1. Debug As > Debug Configurations
		2. Double click STM32 MCU Debugging
			1. New config is created
				1. Debug/001HelloWorld.elf (default)
			2. Debugger
				1. Debug probe: ST-LINK (ST-LINK GDB server)
				2. Interface: SWD
				3. Serial Wire Viewer (SWV)
					1. Enable
				4. Clock Settings:
					1. Core Clock: 16.0 MHz
					2. SWO Clock: 2000 kHz
			3. Apply
			4. Close
	3. Right click on project
		1. Debug As > STM32 MCU C/C++ Application
			1. Loaded into target
			2. Switches to Debug perspective
2. IDE stops at first instruction of main function (halted at first instruction)
	1. Window > Show View > SWV > SWV ITM Data Console
	2. Click on **Configure Trace** (bottom right)
	3. Select Port 0
3. Click Resume button
	1. Click on **Start trace** (bottom right)
	2. Click on **Reset the chip and restart debug session** (top left)

### Issues with IDE ###
1. It is related to debugging session of IDE (if we encounter)
2. Right click > Debug As > STM32 application
	1. Switch
	2. Enable tracing
	3. If unknown characters appear
		1. Click on **Remove all collected SWV data** (bottom right)
		2. Click on **Reset the chip and restart debug session**
3. Going back to C/C++ perspective (edit)
	1. Two options to terminate
		1. Terminate - click this - IDE goes back to C/C++ perspective
		2. Terminate and relaunch
4. Try to debug again
	1. It goes back to debug perspective
	2. Problem: If we use Terminate at the bottom right
		1. Perspective changes back to C/C++ perspective
		2. If we try to debug again - Error in final launch sequence (newer versions)
			1. Click Okay
			2. Go to Debug perspective manually
			3. Right click on the option
			4. Terminate and Remove
			5. Go back to C/C++ perspective (top right)
			6. Try to Debug again

### Testing printf Over OpenOCD Semihosting ###
1. OpenOCD Debugger and Semi-Hosting
	1. Set linker arguments
		1. `-specs=rdimon.specs -lc -lrdimon`
	2. Add semi-hosting run command
		1. `monitor arm semihosting enable`
	3. Add below function call to main.c
	
			extern void initilise_monitor_handles(void);
			initialise_monitor_handles(void);
			
2. OpenOCD - debugger that helps program and debug code on the board
	1. Open On Chip Debugger
3. New Project: 001Helloworld_semihosting
	1. Build the project
	2. Right click on the project
	3. Debug Configurations
	4. Expand STM32 MCU Debugging
		1. New Lauch Configuration
			2. Debugger
				1. Debug probe: ST-LINK (OpenOCD)
			3. Startup
				1. Run Commands

						monitor arm semihosting enable
						
			4. Apply
			5. Close
	5. Right click on project
	6. Properties
	7. C/C++ Build
		1. Settings
			1. Tool Settings
			2. Linker
			3. Miscellaneous (set linker arguments)
				1. Click on +

						-specs=rdimon.specs -lc -lrdimon

			4. Apply
			5. Close
	8. main.c

			extern void initialise_monitor_handles(void);
			
			int main(void) {
				initialise_monitor_handler();

				printf("Hello World\n");
				
				for(;;);
			}
			
	9. Exclude `syscalls.c` from build
		1. Right click on `syscalls.c`
		2. Properties
		3. C/C++ Build
			1. Check: Exclude Resource from Build
	10. Build the project
	11. Connect the hardware
		1. Debug As > STM32 C Application
		2. Step over twice
4. `\n` is important in `printf` under openOCD debugger

### Run sizeof on Embedded Target ###
1. `sizeof`
	1. Find out storage sizes of below data types for cross compiler
		1. `char`
		2. `int`
		3. `long`
		4. `long long`
		5. `double`
	2. Example:

			printf("Size of char data type = %d\n", sizeof(char));
			printf("Size of short data type = %d\n", sizeof(short));
			printf("Size of int data type = %d\n", sizeof(int));
			printf("Size of long data type = %d\n", sizeof(long));
			printf("Size of long long data type = %d\n", sizeof(long long));
			
2. `for` loop is automatically added
	1. An embedded application never ends.
	2. If application has nothing to do, it puts processor to sleep or executes infinite loop
		1. This is implementation of infinite loop that does nothing but keeps the processor busy
3. ITM Data Console
	1. Channel 0 of ITM (default)
		1. ITM has 32 channels but `printf` works over channel 0
	2. Channel 1-31 - Diagnostic info of some other events (can be configured)
		1. RTOS say

### Sizeof Testing ###
### Compiler Settings on STM32CubeIDE ###
1. Go to IDE
	1. If we want to check compiler settings
	2. Right click on project
		1. Properties
		2. C/C++ Build
			1. Settings
				1. Toolchain Version: Default
					1. GNU Arm Embedded Toolchain (cross compiler)
						1. We can download new toolchain from ARM website
							1. developer.arm.com
								1. GNU-R.M
									1. Downloads
				2. Tool Settings
					1. Board
					2. Other options
						1. Runtime library - REduced C (--specs=nano-specs) (very small memory footprint as compared to standard C)
							1. Standard C - can also be used
					3. MCU Post build outputs
						1. Convert to binary file (-O binary)
						2. Convert to Intel Hex file (-O ihex)
						3. ...
					4. MCU GCC Compiler
						1. Default compiler flags
						2. General
							1. Language standard: C standard
								1. Do not change 'C' standard
									1. IDE uses 'gnu11' which 'ISO-C11 + GNU related extensions'
										1. ISO standard + new extensions = gnu11
						3. Optimization
							1. Do not change 'IDE' default optimization. In the 'volatile' section, we can experiement with optimization options
					5. MCU GCC Linker (Linker flags)
						1. Scripts (advanced concepts)
						2. Default options
					6. Apply

## Build Process ##
### Embedded Project Build Process ###
1. Build Process
	1. Preprocessing (compilation)
		1. Produces .i file
		2. `#include`, ... will be resolved
	2. Parsing (compilation)
		1. Parser engine will parse .i files to check syntax against standard selected
			1. Any error will be reported
		2. **Code generator**:
			1. Generates .s file
				1. C is converted to assembly language (mnemonics)
	3. Producing object file(s)
		1. **Assembler**
			1. Converts to machine code (.o file)
				1. .o files are relocated object files
	4. Linking object file(s)
		1. Multiple re-locatable object files (.o and .a files) will be combined into one executable (.elf)
			1. .a files - libraries (std and/or third party (libc))
		2. .elf - executable and link format (debug file)
	5. Producing final executable
		1. .elf is produced
	6. Post processing of final executable
		1. objcopy tool can be used to produce .bin (pure binary executable file) or .hex files
2. Right click
	1. Clean Project
	2. Build Project
		1. Compiles files in following order:
			1. startup file
			2. main.c
			3. syscalls.c
			4. ...
		2. .elf is generated
	3. Post processing tools can be invoked
		1. Object dump
		2. Size
			1. Code section size
			2. Data section size
			3. BSS section size
3. The intermediate files are stored in project
	1. Right click on project
		1. Properties
		2. Resource
			1. Click on icon against Location
				1. Go to Debug (no .i and .s)
	2. Instruct the compiler
		1. Right click
		2. Properties
		3. C/C++ Build
		4. Settings
		5. Compiler Settings
		6. Miscellaneous
			1. Click on +
			
					-save-temps
					
		7. Apply
	3. Re-build the project
		1. .i, .s files get generated
			1. Mnemonics for ARM Cortex Mx processor
4. Summary of Build:
	1. Preprocesing
	2. Compilation
	3. Linking

## Analyzing Embedded C Code ##
### What is a Microcontroller? ###
1. Analyzing Embedded C Program
	1. Anatomy of the microcontroller
	2. Identifying code and data parts of the program
	3. Code memory and data memory of the MCU
	4. Disassembly feature of the IDE (of final executable)
	5. Analyzing the executable (.elf) using GNU tools (like objdump and size)
2. What is microcontroller?
	1. Microcontroller (MCU, uC) is a small computer system on a single chip.
		1. But it's resources and capabilities such as memory, speed, external interfaces are very much limited (as compared to desktop computer)
			1. Since MCU targets embedded applications
	2. Typical microcontroller includes the following on a single chip (called System on Chip (SOC)):
		1. Processor
		2. Volatile memory
			1. SRAM
		3. Non-volatile memory
			1. FLASH
			2. ROM
			3. EEPROM
		4. input/output (I/O) pins
		5. Peripherals
			1. ADC
			2. DAC
			3. TIMERS
			4. UART (connectivity)
			5. USB (connectivity)
		6. Clock
		7. Bus interfaces
3. Anatomy of a typical small microcontroller

		CPU =Address Bus=> Program memory (non-volatile)
		CPU =Address Bus=> Data memory (volatile)
		CPU =Data Bus=> Program memory
		CPU =Data Bus=> Data memory
		CPU =Control Bus=> Program memory
		CPU =Control Bus=> Data memory
		CPU =Address Bus=> I/O <=Parallel I/O=>
		CPU =Data Bus=> I/O
		CPU =Control Bus=> I/O
		Clock -> CPU
		I/O <-> Serial I/O
		
	1. CPU - executes program instructions
		1. Reads instructions from program memory and executes
		2. CPU communicates with Program memory using Bus
			1. CPU produces address of next instruction and communicates with Program memory using Address Bus
		3. CPU decodes instruction and action will be taken accordingly
		4. How fast CPU executes instructions depends on CLOCK
	2. Program memory - non volatile
		1. Once we store program, it is permanent (erasable)
			1. Even if we remove power, it will not get corrupted
		2. Sends instruction to CPU using Data Bus
	3. CLOCK - controls speed of code execution
	4. Data memory - volatile
		1. Used to store data of program
		2. Used as scratchpad
			1. Temporarily
			2. It is not permanent data
		3. Usually data memory of MCU is consumed during run-time of program
		4. When power is taken off, content of the memory is lost
	5. Serial I/O
		1. Consider a mobile phone sending data (or instructions) to microcontroller via bluetooth
		2. Microcontroller can communicate with bluetooth module using serial I/O or parallel I/O
		3. Microcontroller receives data from Bluetooth and stores in data memory
4. Almost all microcontrollers have this feature
	1. Example: STM32 Cortex
		1. Internal details of an STM32F407xx MCU
			1. ARM Cortex M4 CPU (180 Mhz)
				1. Developed by ARM
					1. STM Takes software implementation of the unit and customize it as per their needs and then it is implemented on the chip
			2. Implementations of ST
				1. System
					1. RTC (real time clocking)
					2. PLL Engine (used to boost the clock)
					3. Internal RC Oscillators
						1. Can be used if microcontroller is not connected to a crystal (for clocking)
						2. Produce clock to CPU, Bus interfaces, peripherals
					4. Low power control circuitry
					5. Internal power regulator
						1. For producing regulated power supply to the microcontroller
					6. Watchdog timers
				2. Connectivity (Peripherals - for external connectivity)
					1. SPI
					2. Camera
					3. CAN
					4. I2C
					5. USB
					6. ...
				3. Control (don't connect to external devices but help us perform control related activities)
					1. PWM
					2. Wave generation
					3. Timers
					4. ...
				4. Analog
					1. ADC
					2. DAC
					3. Temperature sensor
					4. ...
				5. Embedded memory
					1. Flash memory (for code memory)
					2. SRAM (Static RAM - for data memory)
					3. External memory interfaces
						1. Flash
						2. SDRAM
					4. OTP
						1. One Time Programmable memory
	2. PIC16F887 microcontroller
		1. Peripheral Interface Controller - made by Microchip Technology (8-bit application domain)
		2. CPU (It is not ARM - it is proprietary by Microchip - PIC architecture) - it has it's own instruction set
			1. C code needs to be cross compiled for PIC
		3. Internal oscillators (default clock to CPU and peripherals)
		4. Peripherals
		5. Program memory
		6. Data memroy
		7. On-chip EEPROM
		8. I/O Ports
		9. Analog peripherals
		10. Timers
		11. PWM
	3. TIWA Development Board (Texas Instruments)
		1. CPU - Arm Cortex M4 (80 Mhz)
		2. Embedded memories
			1. 2 KB EEPROM
		2. Analog peripherals
		3. Connectivity related peripherals
	4. Peripherals to include and exclude rely on marketing
		1. Depends on application area the microcontroller targets

### Code Memory of the Microcontroller ###
1. Code memory
	1. Purpose of code (program) memory is to store instructions and constant data of program
	2. There are different types of code memory
		1. ROM (Read Only Memory) - simplest and cost efficient
			1. MPROM (Mask Programmable Read only Memory)
				1. Truly read only memory (we cannot erase it)
			2. EPROM (Ultraviolet Erasable Programmable ROM)
				1. We need to take the memory out of the chip and mount it into ultraviolet machine to erase
				2. It can be programmed after that (almost obsolete)
			3. EEPROM (Electrically Erasable Programmable ROM)
				1. Used in modern microcontrollers
					1. TIs uc (2KB)
				2. Erased using electric voltage
		2. OTP (On Time Programmable)
			1. One Time Programmable
		3. Flash
			1. It is EEPROM
				1. Fabrication technology used is different as compared to EEPROM
				2. Cost and speed is different
				3. It has dominated as code memory in modern microcontrollers
		4. FRAM (Ferroelectric Random Access Memory)
			1. Most STM32 microcontrollers do not have this as code memory
				1. Cost will shoot up
				2. It is very high as compared to Flash
			2. Use cases: MSP430FR2422
				1. FRAM - 7.25KB + 256B (just 8 KB)
					1. Ultra low power apps may be

### Code and Data of the Program Using Memory Browser ###
1. New project: 003Add

		int g_data1 = -4000;
		int g_data2 = 200;
		int result = 0;

		int main(void) {
			result = g_data1 + g_data2;
			
			printf("Result = %d\n", result);
			
			for(;;);
		}
		
	1. Build Project
	2. Load into target
		1. Debug As > STM32 Application
			1. ST-LINK GDB communicating with ST-LINK Circuit
		2. Download and verified successfully (into flash)
2. Examining Code memory
	1. Window > Show View > Memory Browser
		1. Type based address of program memory of microcontroller (base address of the FLASH)
			1. Get from reference manual
				1. Embedded Flash memory interface
					1. Flash module organization table
						1. 512 KB of flash memory is divided into many sectors
							1. This is where we store program instructions
								1. Sector 0 - Sector 11
									1. Copy the base address
									2. Paste in memory browser (hit enter)
										1. Machine code appears
								2. Word by word is shown by default
									1. Word by Word:
										1. Right click > Columns > 1
										2. Right click > Cell Size > 1 Byte
						2. There is ROM (System memory)
							1. ST factory-built bootloader is stored
								1. Never executes unless we invoke it by some settings (doesn't run by default)
3. Examing data memory
	1. Open Reference Manual
		1. Memory and bus architecture
			1. Search by SRAM
				1. SRAM1 - main data memory (112KB)
				2. Section 2.3.1: Embedded SRAM
					1. SRAM1: 0x2000 0000 (base address)
						1. Other SRAMs are for other purposes
	2. Paste the address in Memory Browser
		1. Right Click > Radix > Decimal Signed

### Analyzing ELF File Using GNU Tools ###
1. We downloaded executable in to program memory (Flash) of microcontroller
	1. So data of program must be in flash memory
		1. How did data arrive in data memory (SRAM)?
2. Where is data stored in flash memory
	1. Analyzing .elf using objdump gnu tool
		1. Run the following command on PC command prompt

				arm-none-eabi-objdump.exe -h 003Add.elf
				
			1. cd Debug
				1. run the command
		2. Open *.list (gives same output)
		3. What is `-h`?
			1. Display the contents of section headers
				1. elf format has section headers
3. ELF file has many sections
	1. .text - section of elf file contains 'codes' or all the 'instructions' of program
		1. Executable codes (machine codes)
	2. .rodata - section contains all 'read-only data' of program
		1. Constant data
	3. .data - section contains all 'data' of program
		1. Address: LMA (data is loaded into this address) (falls into flash memory area - data is loaded into flash memory)
		2. Virtual Memory Address: For this microcontroller there is nothing virtual (everything is physical) - it is Linux terminology
		3. LMA says: Where section is currently loaded
		4. VMA says: Where section should finally be copied to
			1. Destination address
			2. Who moved this?
				1. It is done by the software (we have not written any code)
					1. It is present in the final elf
						1. The code to copy the data from flash memory to SRAM is in startup file: startup_stm32f407vgtx.s

								Reset_Handler: # assembly
									... /* set stack */
									
							1. If ARM processor undergoes reset, the first function that gets executed is Rest_Handler (automatically by hw)
							2. Here is where data is copied from flash to SRAM
								1. First initialization of source and destination addresses
								2. Actual copy
								3. Zeroing of bss section
								4. Calls standard library initialization function (libc)
									1. If we are not using and standard library functions, this can be skipped
								4. Calls main
			3. Copy flash memory address and check - data exists
	4. LMA: Load Memory Address (Source in FLASH)
	5. VMA: Virtual Memory Address (Destination in SRAM)
4. Startup Code:

		Reset of processor
				|
				v
		Processor jumps to reset handler
				|
				v
		Copy .data from Flash to SRAM
				|
				v
		Zero out SRAM locations corresponding to .bss section size
				|
				v
		Call std. library init function __libc_init()
				|
				v
		Call main() of the user program
				|
				v
		Never return from main() back to reset handler
		
	1. Reset of processor - when power on reset or system reset
	2. The following are taken care by start-up code of project:
		1. Copy .data from Flash to SRAM
		2. Zero out SRAM locations corresponds to .bss section size
		3. Call std. library init function __libc_init()
	3. User code
		1. Call main() of the user program
		2. Never return from main() back to reset handler
5. We can go to breakpoint and keep a breakpoint in `CopyDataInit` section
	1. Debug
		1. Code execution halts at the place
	2. Reset the chip
		1. Execution halts
			1. Check r4 and r2
				1. Window > Show View > Registers
					1. General Registers
						1. r2 (flash address)
						2. r4 (-4000) - source address
						3. r0 (SRAM address)

### Disassembly ###
1. Disassembly feature of the IDE
	1. translate (a program) from machine code into a higher-level programming language
		1. We use objdump tool on executable file (.elf)
			1. We can get back assembly instructions for program
				1. Good for instruction level debugging
					1. To check how controller is passing (we can come to know if there is any room for optimisation)
		2. IDE also gives the feature (runs objdump internally)
			1. Open Debug Mode
				1. Window > Show View > Disassembly
2. Processor architecture and instruction set
	1. Processor: ARM Cortex M4
	2. Processor architecture: ARMv7E-M (architecture name)
	3. Instruction set architecture (ISA): Thumb-2 (ISA name)
		1. Instruction set (16/32-bit instruction encodings)
3. Click on Go to Current Program Counter (top right in Disassembly)
	1. `result = g_data1 + g_data2;`

			08000294	ldr		r3, [pc, #24]	; data is read into register
			...
						add		r3, r2			; modify
						...
						str		r3, [r2, #0]	; content written back to mem
						
		1. If we don't see opcodes:
			1. Right click > Show opcodes
		2. `printf` - code from standard library is also placed
4. `arm-none-eabi-objdump -d 003Add.elf`
	1. Disassembles
		1. Add following to `~/.bash_profile`

				export PATH=/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.9-2020-q2-update.macos64_1.5.0.202011040924/tools/bin:$PATH
				
	2. Most of the instructions are 16 bit
		1. Some of the instructions are 32 bit
5. Go to ARM website and explore Thumb 2 ISA	1. [https://developer.arm.com/documentation/ddi0553/latest](https://developer.arm.com/documentation/ddi0553/latest)
6. Instruction level debugging:
	1. Put breakpoints in main code
		1. We can see breakpoints in Disassembly window
	2. Put breakpoints in Disassembly window
		1. Instruction level debugging
			1. Check registers
			2. Check memory browser

### IDE Option for Instruction Level Debugging ###
1. Update
	1. Instead of keeping breakpoint at every line of disassembly code
		1. Enable **Instruction Stepping Mode** (top left)
		2. Use step-over or step-into (executes one instruction at a time)
		3. Disable if debugging C program

## Data Types to Manipulate Floating Point Data ##
### Manipulating Decimal Numbers in 'C' ###
1. Representation of decimal numbers in 'C'
	1. Decimal number contains a decimal point
		1. 125.55 - decimal number (real number)
	2. In computer memory, real numbers are stored according to representation standardized by IEEE standard 754
	3. IEEE754 floating-point representation is approximate representation of real numbers
	4. All computer systems and microcontrollers nowadays use this standard to store real numbers in memory
	5. If we are working with numbers that have a fractional part, or in case we are using integers that don't fit into long data type, then we can use floating-point representation
2. Real numbers
	1. Too small real numbers
		1. Charge of an electron
			1. -1.60217662 x 10^9 coulombs
	2. Too big real number
		1. distance between earth and andromeda galaxy
			1. 2.3651826 x 10^19 kms
3. In 'C' too small or too big numbers or numbers having fractional part are represented using floating point representation data types
	1. float
	2. double
4. Why floating point representation?
	1. To store, too-small number in memory
	2. To store, too-big number in memory
	3. To store, decimal number
5. Think of the following situations
	1. Storing charge of an electron (too small)
	2. Storing light years to kilometers conversion
	3. Which data type do you use to store 1.767 x 10^100 (too big)?
6. The IEEE-754 floating-point standard
	1. The IEEE-754 is a standard for representing and manipulating floating-point quantities that are followed by all modern computer systems and microcontrollers
		1. +7.432 x 10^48

### Single vs Double Precision ###
1. Approximate the number and store only required information
	1. sign (+)
	2. mantissa (significand) (7.432)
	3. exponent (48)
2. How many bits are required to store it?
	1. Two formats
		1. IEEE-754 floating-point standard (single precision - 32 bits representation)

				| sign | exponent | significand |
				31     30         22            0
				   1        8            23
				   
		2. IEEE-754 floating-point standard (double precision - 64 bits representation)

				| sign | exponent | significand |
				63     62         51            0
				   1        11           52
				   
			1. Higher level of approximation (more acurate compared to single precision implementation)
3. Example:
	1. 125.55
		1. Float (32-bit floating-point representation, single precision)
		2. Double (64-bit floating-point representation, double precision)
4. Format specifier for float and double data types
	1. Use `%lf` format specifier to read or write double type variable
	2. Use `%f` format specifier to read or write float type variable
	3. Use `%e` (float) or `%le` (double) format specifier to read or write real numbers in scientific notation
	4. All constants with decimal point are considered double by default

### Working with Float and Double Variables ###
1. Range of Float:
	1. Storage size: 4 bytes
	2. Precision: up to 6 decimal places
	3. Value range: 1.2x10^-38 to 3.4x10^38
2. Range of Double:
	1. Storage size: 8 bytes
	2. Precision: up to 15 decimal places
	3. Value range: 2.3x10^-308 to 1.7x10^308
3. Example:

		int main(void) {
			float number = 45.78976834578;
			printf("Number = %f\n", number);
			printf("Number = %0.9f\n", number);
			double number1 = 45.78976834578;
			printf("Number1 = %0.14f\n", number1);
			printf("Number1 = %e\n", number1);
			printf("Number1 = %0.2e\n", number1);
			
			double chargeE = -1.60217662e-19; // float only has 6 digits precision
			printf("chargeE = %0.28lf\n", chargeE); // prints 28 decimal places after decimal point
			printf("chargeE = %le\n", chargeE);
			return 0;
		}
		
		Number = 45.789768
		Number = 45.789768219
		Number1 = 45.78976834578000
		
	1. `%f` prints 6 decimal places
	2. `%0.9f` print upto 9 decimal places after decimal point
		1. Upto 6 it is correct but after that it is wrong

## Taking Input From the User Using scanf() ##
### Scanf Introduction ###
1. `scanf`
	1. `scanf` is a standard library function that allows you to read input data from standard in
		1. Generally keyboard (desktop)
		2. Touchscreen or keypad (embedded system)
	2. `scanf` can be used to read
		1. characters
		2. numbers
2. Example:

		int age;
		printf("Enter your age: ");
		scanf("%d", &age);
		
	1. `scanf` - reads integer (number) which user enters
		1. `%c` - ASCII value gets stored
	2. `scanf` - puts read value "at the address of" `age` variable
3. `getchar()`
	1. If we want to read a single character from keyboard in ASCII format
	2. `getchar()` - takes no arguments and returns int value which is ASCII value of key pressed

			int a = getchar(); // program hangs until we press a key followed by enter
4. Exercise:
	1. Write a program which takes 3 numbers from user and compute average of the numbers

			#include <stdio.h>

			int main() {
			    int a;
			    int b;
			    int c;
			    printf("Enter first number: ");
			    fflush(stdout);
			    scanf("%d", &a);
			    printf("Enter second number: ");
			    fflush(stdout);
			    scanf("%d", &b);
			    printf("Enter third number: ");
			    fflush(stdout);
			    scanf("%d", &c);
			    double average = (a + b + c) / 3.0;
			    printf("Average of %d, %d and %d is: %0.14lf\n", a, b, c, average);
			    getchar(); // makes application wait until user presses any key from keyboard
			    return 0;
			}	

### Scanf Exercise Implementation ###
1. When we execute `printf`
	1. Content is buffered into output buffer
	2. When application returns (`\n`), output is pushed to display (flushing)
		1. Solution: Explicitly flush

				fflush(); // used to clear output buffers of output stream (to display)
				
2. Usage of `fflush` - to flush contents of output buffer to stdout
	1. usage depends on console
		1. **eclipse** console might need it
		2. **.exe** on **Windows** may not need it
3. Instead we can directly execute the application
4. Whatever we enter from keyboard, it doesn't go to program directly
	1. It goes to input buffer
		1. When we type `10\n`
		2. It get inserted into input buffer
		3. `scanf` reads `10`
		4. `\n` still remains in input buffer
		5. If we make call to second scanf
			1. `\n` is read and discarded by `scanf` so it waits
		6. If user enters new number `45\n`
		7. Scanf will read `45`
		8. Final state of input buffer `\n`
		9. At the end `getchar()` reads `\n` and immediately returns
			1. Solution:

					while (getchar() != \n);
					getchar();

### Scanf Exercise Implementation Contd ###
1. `main_new.c` (exclude `main.c` from the build)

		printf("Enter 3 numbers: ");
		scandf("%f %f %f", &a, &b, &c);
		
	1. We can give any whitespece between the numbers

			123 -90 90.0000
			
			OR
			
			123
			-90
			90.000

### Scanf Exercise ###
1. Exercise
	1. Write a program which takes 6 characters (alphabets, numbers, special characters) from the user and prints the ASCII codes of the entered characters

### Scanf Exercise Implementation ###

		void waitForKeyPress();

		int main(void) {
			printf("Enter any 6 characters of your choice: ");
			scanf("%c %c %c %c %c %c %c", &a, &b, &c, &d, &e, &f);
			printf("ASCII codes: %u %u %u %u %u %u", a, b, c, d, e, f);
			
			waitForKeyPress();
			
			return 0;
		}
		
		void waitForKeyPress() {
			while(getchar() != '\n');
			getchar();
		}

### Scanf and Float with Scientific Notation ###
Exercise:
	1. Find out the number of electrons responsible for producing given charge.
		1. Use scientific notation for input and output
		2. Number of electrons = given charge / charge of Electron
	2. Solution:

			int main(void) {
				double requiredCharge, chargeOfElectron;
				chargeOfElectron = 
				printf("Enter the required charge: ");
				scanf("%lf", &requiredCharge);
				printf("Enter the charge of electron (in scientific notation): ");
				scanf("%le", &chargeOfElectron);
				double electrons = -(requiredCharge / chargeOfElectron);
				printf("Total number of electrons = %le\n", electrons);
				printf("Total nubmer of electrons = %ld\n", electrons);
				waitForKeyPress();
				return 0;
			}

## Pointers ##
### Pointers in 'C' ###
1. Pointers are one of the most essential programming features which are available in 'C'
2. Pointers make 'C' programming more powerful
3. Pointers are heavily used in embedded 'C' programming to
	1. Configure peripheral register addresses
	2. Read/write into peripheral data registers
	3. Read/write into SRAM/Flash locations
	4. Many other things
4. What is a pointer?
	1. Memory map

			0x00007FFF8E3C3828	0 1 1 0 0 1 1 1
			...
			0x00007FFF8E3C3821	0 1 1 1 0 1 1 1
			mem location address (pointer)
			
		1. On 64 bit machine, pointer size (mem location address size) is 8 bytes (64 bits)
		2. Operations that can be performed
			1. Write to a pointer
			2. Read from a pointer
			3. Increment pointer and go to next memory location
			4. Decrement pointer and go to previous memory location
		3. Pic: 2 bytes
		4. ARM Cortex M: 4 bytes

### Pointer Variables and Pointer Data Types ###
1. How to store a pointer inside a program
2. Operations on the pointer
3. How to define a pointer variable

		<pointer-data-type> <variable-name>;
		
	1. Pointer data types:
		1. `char*`
		2. `int*`
		3. `long long int*`
		4. `float*`
		5. `double*`
		6. `unsigned char*`
		7. `unsigned int*`
		8. `unsigned long long int*`
		9. `unsigned float*`
		10. `unsigned double*`
4. `*` - used to differentiate between pointer and non-pointer variable declaration
5. To store a pointer inside a program:

		#include <stdio.h>
		int main(void) {
			long long int someAddress = 0x00007FFF8E3C8824; // not a pointer for compiler - we cannot do pointer operations
			char* address1 = 0x00007FFF8E3C8824; // for compiler it is still just a number of type long long int
			char* address1 = (char*) 0x00007FFF8E3C8824; // compiler now treats it as a pointer - explicit cast
		}

### Pointer Variables and Initialization ###
1. Example:

		char* address1 = (char*) 0x00007FFF8E3C8824;
		
	1. `address` - pointer variable
		1. 8 bytes of memory will be reserved for the variable

				0x1F007FFF8E3C4828	0x00
				0x1F007FFF8E3C4827	0x00
				0x1F007FFF8E3C4826	0x7F
				0x1F007FFF8E3C4825	0xFF
				0x1F007FFF8E3C4824	0x8E
				0x1F007FFF8E3C4823	0x3C
				0x1F007FFF8E3C4822	0x88
				0x1F007FFF8E3C4821	0x24
										|
						+------------	+
						|
						v
				0x1F007FFF8E3C4828	0x41
				
			1. 8 bytes in 64 bit machine
		2. Briefly

				0x1F007FFF8E3C4821		0x1F007FFF8E3C4828
												|
						+-------------------+
						|
						v
				0x1F007FFF8E3C4828		0x41
				
2. The compiler will always reserve 8 bytes for the pointer variable irrespective of pointer data type
	1. Pointer data type does not control memory size of pointer variable

			char* address1; // 8 bytes
			int* address1; // 8 bytes
			
		1. What is the purpose of mentioning "Pointer data type"?
			1. Pointer data type decides behaviour of **operations** carried out on pointer variable
				1. Operations: read, write, increment, decrement
			2. Example:

					/* Read operation on address1 variable yields 1 byte of data */
					char* address1 = (char*) 0x00007FFF8E3C3824;
					
					/* Read operation on address1 variable yields 4 bytes of data */
					int* address1 = (int*) 0x00007FFF8E3C3824;
					
					/* Read operation on address1 variable yields 8 bytes of data */
					long long int* address1 = (long long int*) 0x00007FFF8E3C3824;
					
				1. `char*` - decides how many bytes are read or written or by how much to increment or decrement the pointer
					1. `address1` - it is pointer variable to char type data

### Read and Write Operation on Pointers ###
1. How to read data from pointer

		char data = *address1; // dereferencing a pointer to read data
		
	1. 1 byte of data is read from pointer and stored in `data` variable
	2. `*` - It is called as "value at addresss" operator
		1. Compiler generates instructions to feetch 1 byte of data from pointer
	3. `&` - "address of" operator
2. Write operation on pointer:

		char* address1 = (char*) 0x00007FFF8E3C3824;
		
		*address1 = 0x89; // dereferencing a pointer to write data
		
		0x00007FFF8E3C3824	0x1F007FFF8E3C4821
		...
		0x1F007FFF8E3C4821	0x85
								0x89	
								
3. Exercise:
	1. Construct a char type variable and initialize it to 100

			char a = 100;
	
	2. Print address of above variable

			printf("Address of a = %p\n", &a);
	
	3. Construct a pointer variable and store address of above variable

			char* pointer_a = &a;
	
	4. Perform read operation on pointer variable to fetch 1 byte of data from pointer

			char b = *pointer_a;
	
	5. Print data obtained from read operation on pointer

			char b = *pointer_a;
			printf("value at b = %c\n", b);
	
	6. Perform write operation on pointer to store value 65

			*pointer_a = 65;
	
	7. Print value of variable defined in step 1

			printf("value at a = %c\n", a);

### Pointer Exercise Implementation ###
1. Implementation

		#include <stdio.h>

		int main() {
		    char a = 100;
		    printf("Value of a = %c\n", a);
		    printf("Address of a = %p\n", &a);
		    char* pointer_a = &a;
		    char b = *pointer_a;
		    printf("Value at b = %c\n", b);
		    *pointer_a = 65;
		    printf("Value at a = %c\n", a);
		    return 0;
		}

### Significance of Pointer Data Types ###
1. Recommendation: start pointer with `p`

		char data = 100;
		char* pData = &data;
		
2. If `data` is of type `char`, `&data` will be of type `char*`

### Significance of Pointer Data Types ###
1. Example:

		long long int g_data = 0xFFFEABCD11112345;
		
		int main(void) {
			char* pAddress1;
			// char *pAddress1; // is also correct
			// pAddress1 = &g_data; // type mismatch
			pAddress1 = (char*) &g_data;
			printf("Value at address %p is %d\n", pAddress1, *pAddress1);
			
			int* pAddress2;
			pAddress2 = (int*) &g_data;
			
			printf("Value at address %p is %x\n", pAddress1, *pAddress1); 
			
			long long int* pAddress4;
			pAddress4 = (long long int*) &g_data;
			printf("Value at address %p is %I64x\n", pAddress4, *pAddress4));
		}
		
	1. Only 1 byte of data (45)
	2. 2 bytes are returned to second `printf`
		1. We can use this technique to read 4 bytes
2. If we want to read
	1. 1 byte from memory location: use `char*`
	2. 4 bytes from memory location: use `int*`
	3. 8 bytes from memory location: use `long long int*`
3. Warning: assignment to `char*` from incompatible pointer type `long long int *`

		long long int g_data = 0xFFFEABCD11112345;
		...
		char* pAddress1;
		pAddres1 = &g_data; // explicit typecasting is important
4. Effect of using different pointer data types on pointer operations

		long long int g_data = 0xFFFEABCD11112345;

		int main(void) {
			char* pAddress = (char*) &g_data;
			printf("value of pAddress %p\n", pAddress);
			printf("value at address %p is %d\n", pAddress, *pAddress); // prints 0x45
			
			pAddress = pAddress + 1;
			
			printf("value of pAddress %p\n", pAddress);
			printf("value at address %p is %d\n", pAddress, *pAddress); // prints 0x23
			
			pAddress = pAddress + 4;
			
			printf("value of pAddress %p\n", pAddress);
			printf("value at address %p is %d\n", pAddress, *pAddress); // prints 0xAB
			
			short* pAddress1 = (short*) &g_data;
			printf("value of pAddress %p\n", pAddress1);
			printf("value at address %p is %d\n", pAddress1, *pAddress1); // prints 0x2345
			
			pAddress1 = pAddress1 + 1; // incremented by 2
			
			printf("value of pAddress %p\n", pAddress1);
			printf("value at address %p is %d\n", pAddress1, *pAddress1); // prints 0x1111
			
			short* pAddress2 = (short*) &g_data;
			printf("value of pAddress %p\n", pAddress2);
			printf("value at address %p is %d\n", pAddress2, *pAddress2); // prints 0x11112345
			
			pAddress2 = pAddress2 + 1; // incremented by 4
			
			printf("value of pAddress %p\n", pAddress2);
			printf("value at address %p is %d\n", pAddress2, *pAddress2); // prints 0xfffeabcd
		}
		
	1. `long long int*` - incremented by 8 (bytes)
	2. Pointer arithmetic is used in embedded systems programming (very important)
		1. To store data into required SRAM locations
			1. If we want to put data into peripheral - we need it's address
			2. If we want to configure peripheral - we need it's address
		2. For copying data from peripheral register to SRAM memory and vice versa
		3. To configure peripheral registers
			1. Peripheral registers are memory-mapped
				1. Each register will be given a unique address in MCU memory map (later)
			2. Peripheral registers are part of memory map of the MCU
				1. A unique memory address will be given by the vendor to configure the peripherals
		4. Pointers to ISRs are stored in vector table to handle interrupts
		5. Pointers are also used to configure memory-mapped processor specific registers like interrupt configuration registers

## Importance of <stdint.h> ##
### Importance of <stdint.h> ###
1. Each architecture (x86, 8051, PIC, ARM, etc) has a natural, most-efficient size
	1. Designers (specifically compiler implementers) use natural native data size data for speed and code size efficiency
2. `stdint.h` - standard library header file
	1. Data type size and compiler
		1. Data types may cause portability issues of code when compiler changes.
			1. One compiler may consider `int` of size 2 bytes and another 4 bytes and some other 8 bytes
				1. Suppose we have written a program assuming a particular size for each data type => portability issues (buggy and problems)
					1. We have to take care of portability issues in C
3. Portability issues in 'C' programming code due to "size of data types"
	1. In 'C' programming language most commonly used data types `int` and `long` cause portability issues
		1. storage size of `int` and `long` are not defined within C standard (C90, C99)
		2. Compiler vendors have the choice to define storage size for variable depending solely on hardware capabilities of target platform wrt min (and max) widths defined by standard
			1. Example: XC8 compiler
				1. signed int - 2 bytes
					1. According to compiler designer, keeping the size of `int` type variable as 2 bytes will be most efficient for data manipulation considering underlying architecture of PIC 8-bit microcontroller (for ARM it may not be true - it is 4 bytes)
				2. Example:

						unsigned int count = 0;
						count++;
						if (count > 65,636) { // not portable
							// Do this task
						}
						
					1. The max value of count may be 65,535 or 4,294,967,295
						1. Both answers could be correct depending on the compiler
					2. Solution: Use data type alias names given by `stdint.h`
4. `stdint.h`
	1. Standard library header file `stdint.h` defines fixed-width integers using alias data types for standard data types available in 'C'
	2. A fixed-width integer data type is an aliased data type that is based on exact number of bits required to store the data
		1. `stdint.h` helps to choose an exact size for variable and makes code portable no matter which compiler code may be compiled on
			1. They are not new data types but aliased names to standard data types in 'C'
				1. Each compiler carries its own stdint.h which needs to be included in project to use
		2. Exast alias
			1. `int8_t` - exactly 8 bits signed - -128 to 127
				1. `char` say
			2. `uint8_t` - exactly 8 bits unsigned - 0 to 255
				1. `unsigned char` say
			3. `int16_t` - exactly 16 bits signed - -32,768 to 32,767
			4. `uint16_t` - exactly 16 bits unsigned - 0 to 65,535
			5. `int32_t` - exactly 32 bits signed - -2,147,483,648 to 2,147,483,647
			6. `uint32_t` - exactly 32 bits unsigned - 0 to 4,294,967,295
			6. `int64_t` - exactly 64 bits signed - -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807
			7. `uint64_t` - exactly 64 bits unsigned - 0 to 18,446,744,073,709,551,615
	3. How the types are resolved, it is not our concern, the compiler resolves it internally
5. Resolution example:

		uint32_t count = 0;
		count++;
		if (count > 65535) {
			// Do this task
		}
		
	1. Here, it doesn't matter under which compiler this code compiles, the compiler will always reserve 32 bits for the variable by using suitable standard data type
		1. No portability issues
5. MinGW > indluce > stdint.h
	1. How it is aliased depends on the compiler (it is not the same for all compilers)
6. Pic Microcontroller
	1. xc8 (PIC8) > pic > include < c99 > stdint.h
	2. xc32 (PIC32)
7. STM32
	1. ST > STM32CubeIDE_<version> > plugins > com.... > tools > arm-none-eabi > include > stdint.h
8. Some useful `stdint.h` aliases
	1. `uintmax_t` - defines largest fixed-width unsigned integer possible on the system
	2. `intmax_t` - defines largest fixed-width signed integer possible on the system
	3. `uintptr_t` - defines unsigned integer type that is wide enough to store the value of a pointer
		1. 64 - bit machine - 64 bits is size of pointer

## Operators ##
### Operators in 'C' ###
1. What is an operator?
	1. An operator is a symbol that tells compiler to perform certain mathematical or logical manipulations on operands
	2. Operator: Type
		1. ++, --: increment and decrement (unary - only one operand)
		2. +, -, *, /, %: arithmetic operators (binary - two operands)
		3. <, <=, >, >=, ==, !=: relational operators (binary)
		4. &&, ||, !: logical operators (binary)
		5. &, |, <<, >>, ~, ^: bitwise operators (binary)
		6. =, +=, -=, *=, /=, %=: assignment operators (binary)
		7. ?: : Conditional operators (ternary - three operands)
2. Arithmetic (mathematical) operators:
	1. + - addition
	2. - - subtraction
	3. * - multiplication
	4. / - division
	5. % - modulus
		1. Produces remainder from division
			
				14 % 4 = 2

	6. Expression

			uint32_t value;
			value = 2 + 3 * 4; // 14
			
		1. Operator precedence - defined by standard
			1. Operator precedence rules determine which mathematical operation takes place first, i.e. takes precedence over others. Parantheses, (), may be used to force an expression to a higher precedence
3. cppreference.com
	1. Don't try to memorize table
		1. Use () if you want to promote precedence of an operator of choice in an expression
	2. Lower the precedence value, higher the precedence
	3. Assiciativity - if two operators of same precedence
4. Example:

		2 + 3 * 4 // * has higher precedence as compared to +
		2 + 12
		14
		
		(2 + 3) * 4
		5 * 4
		20
		
		4 * 5 / 2 * 5
		20 / 2 * 5
		10 * 5
		50
		
		12 + 3 - 4 / 2 < 3 + 1
		12 + 3 - 2 < 3 + 1
		15 - 2 < 3 + 1
		13 < 3 + 1
		13 < 4
		0
		
	1. If two operators have same precedence, we have to resolve the conflict using associativity
5. All arithmetic operators are binary operators
	1. They need atleast two operands to operate

### Unary Operator in 'C' ###
1. Unary increment operator: x++
	1. Increments value of x by 1
	
			x = x + 1
	
2. Unary decrement operator: x--
	1. Decrements value of x by 1
3. They need only one operand
4. ++ is a unary operator and it can appear on either side of an expression

		uint32_t x;
		x++; // x is incremented by 1
		++x; // x is incremented by 1
		
	1. The `++` (increment) operator adds 1 to value of operand and updates operand
		1. Note: if operand is pointer, the behaviour is different
5. Examples:

		uint32_t x, y;
		x = 5;
		y = ++x; // y = 6, x = 6 - pre-incrementing (evaluated first)
		
		uint32_t n, m;
		n = 5;
		m = n++; // m = 5, n = 6 - post-incrementing (evaluated second)
		
6. -- is unary operator and it can appear on either side of expression

		uint32_t x, y;
		x = 5;
		y = --x; // y = 4, x = 4
		
		uint32_t n, m;
		n = 5;
		m = n--; // m = 5, n = 4
		
7. Unary operators with pointer variables

		uint32_t *pAddress = (uint32_t*) 0xFFFF0000;
		
		pAddress = pAddress + 1; // this is arithmetic add operation, result: pAddress = 0xFFFF0004;
		
		pAddress++; // this is unary increment operation, result: pAddress = 0x0xFFFF0004

### Unary Operators with Pointers ###
1. We can use pointer variable with unary increment or decrement operator

### Relational Operators in 'C' ###
1. Relational operators in 'C'
	1. Relational operators do some kind of evaluation on the operands and then return value 1 (for true) or 0 (for false)
	2. Relational operators are binary operators because they require two operands to operate
	3. Relational operators are evaluated left to right
2. `==` - equal to (`a == b` returns 1 if a and b are same)
3. `>` - greater than (`a > b` returns 1 if a is larger than b)
4. `<` - less than (`a < b` returns 1 if a is less than b)
5. `<=` - less than or equal to (`a <= b` returns 1 if a is less than or equal to b)
6. `>=` - greater than or equal to (`a >= b` returns 1 if a is greater than or equal to b)
7. `!=` - not equal to (`a != b` returns 1 if a is not equal to b)
8. True or false in 'C'
	1. In 'C' - zero is interpreted as false and anything other than zero is interpreted as true
	2. Expressions using relational operators evaluate to a value of either TRUE (1) or FALSE (0)
	3. Relational expressions are often used within if and while statements
9. Examples:
	1. A = 10, B = 20
		1. `C = (A == B)` - If A and B are same value, then this expression evaluates to be TRUE (1) otherwise FALSE (0).
		2. `C = (A <= B)` - If A is smaller than or equal to B, then this expression evaluates to be TRUE (1) otherwise FALSE (0). (1 is stored)

### Logical Operators in 'C' ###
1. Logical operators in 'C'
	1. Logical operators perform
		1. Logical-AND (&&)
		2. Logical-OR (||)
		3. Logical-NOT (!)
	2. These are binary operators except NOT
	3. Description:
		1. `&&` - And - `a && b` - returns 1 if a is nonzero and b is nonzero
		2. `||` - Or - `a || b` - returns 1 if a is nonzero or b is nonzero
		3. `!` - Not - `!a` - returns 1 if a is zero, returns 0 if a is non-zero
2. Logical AND Operator: `&&`
	1. Logical-AND operator produces value 1 if both operands have nonzero values
	2. If either operand is equal to 0, result is 0.
		1. If first operand is 0, second operand is not evaluated
	3. Example:

			A = -10, B = 20;
			C = (A && B); // true && true
			C = 1; // true
			
		1. The real values are not considered but only their truth or falsity is considered
3. Logical OR Operator: ||
	1. Logical-OR operator performs inclusive-OR operation on its operands
	2. Result is 0 if both operands have 0 values
	3. If either operand has nonzero value, result is 1
	4. If first operand of logical-OR operation has nonzero value
		1. Second operand is not evaluated
4. Logical NOT Operator: !
	1. It reverses the state of operand
	2. If condition of expression is true, then logical NOT operator will make it false

			c = !(A == B)
			
			x = 10; // state of x is true
			x = !x; // NOT of x (NOT of true = false)
			Result: x = 0;

5. Example:
	1. What is the value of A in the below expression?
		
			x = 7;
			y = 9;
			A = !((x > 5) && (y < 5));
			Result: A = non-zero (1 may be)

## Decision Making ##
### 'if' Statement ###
1. Decision Making in 'C'
	1. When you are going to write some program, it will always be necessary that you will have to put some code which ahs to be executed only when a specific condition is satisfied
	2. Program has to take decision based on internal/ external events or conditions
	3. Example:
		1. If user presses key, then execute 'this' set of statements or if user doesn't press a key, then execute 'that' set of statements
	4. In embedded programming
		1. Example: Water level indication and control program
			1. If sensor detects water level rising above threshold, then  program executes code to turn off motor, otherwise program doesn't turn off the motor
2. Decision taking statements in 'C'
	1. 5 different ways to take decisions by making use of below decision taking statements
		1. `if` statement
		2. `if`-`else` statement
		3. `if`-`else`-`if` statement
		4. Conditional Operators
		5. `switch`/`case` statements
3. Syntax: if statement
	1. Single statement execution

			if (expression)
				statement;
				
	2. Multiple statement execution

			if (expression) {
				statement_1;
				statement_2;
				statement_3;
				...
				statement_n;
			}
			
		1. if expression evaluation is true (nonzero), only then statement(s) will be executed
		2. expression: made up of relational operators, arithmetic operators, bitwise operators, ... that evaluates to true or false
		3. Flow chart:

				if (expression) -true-> statement(s) -> rest of the code
						|
						false
						|
						v
						rest of the code
						
			1. Example:

					int main(void) {
						uint8_t myData = 20;
						
						if (myData > 40)
							printf("Value = %d\n", myData);
							
						/* this statement is outside if block, so always executed */
						return 0;
					}
					
					
					
					int main(void) {
						uint8_t myData = 60;
						
						if (myData > 40) {
							printf("Value = %d\n", myData);
							myData = 0;
						}
						
						/* this statement is outside if block, so always executed */
						myData++;
						
						return 0;
					}
					
				1. The body of `if` statement is set of conditional statements
				2. In 'C', a semicolon (`;`) by itself or an empty block `{}` is a NOP
			2. Example:

					uint8_t isButtonPressed = 0;
					
					int main(void) {
						if (isButtonPressed) {
							printf("Turn on the LED\n");
							isButtonPressed = 0;
						}
						
						return 0;
					}
					
					/* Interrupt handler for button press */
					void ISR_button(void) {
						isButtonPressed = 1;
					}
					
4. Exercise:
	1. Write a program that takes user's age and decides whether a user can cast a vote or not
		1. The minimum age for casting a vote is 18 years
		2. Print appropriate message

				#include <stdio.h>
				#include <stdint.h>
				#include <stdbool.h>

				uint8_t MIN_AGE_TO_VOTE = 18;
				
				static bool isAgeEnoughToVote(uint8_t age);

				int main(void) {
					printf("Enter your age: ");
					fflush(stdout);
					
					uint8_t age = 0;
					scanf("%hhu", &age);
					
					if (isAgeEnoughToVote(age))
						printf("You can cast your vote!\n");
					else
						printf("You cannot vote!\n");
						
					waitForKeyPress();
					
					return 0;
				}	
				
				static bool isAgeEnoughToVote(uint8_t age) {
					return age >= MIN_AGE_TO_VOTE;
				}
				
				static void waitForKeyPress() {
					printf("Press any key to exit");
					while (getchar() != '\n');
						getchar();
				}

### 'if' Statement Exercise ###
### 'if' Statement Exercise Solution ###
### 'if' and 'else' ###
1. Syntax: if...else... statement
2. Single statement execution:

		if (expression)
			statement_1;
		else
			statement_2;
			
3. Multiple statement execution

		if (expression) {
			statement_1;
			statement_2;
		} else {
			statement_3;
			statement_4;
		}
		
4. Flowchart:

		if (expression) -true-> statement(s) (if block statements)
				|								
				false
				|
				v
			statement(s) (else block statements)
				|
				v
			rest of the code
			
1. Decision taking statements in 'C'
	1. In 'C' there are 5 different ways to take decisions by making use of below decision taking statements
		1. `if` statement
		2. `if`-`else` statement
		3. `if`-`else`-`if` ladder
		4. Conditional operators
		5. `switch`/`case` statement
2. The above implementation of the exercise
3. Exercise: 
	1. Write a program which receives 2 numbers (integers) from user and prints biggest of two
	2. If n1 == n2, then print "both numbers are equal"

			#include <stdio.h>
			#include <stdint.h>
			
			static void waitForKeyPress();

			int main() {
				printf("Enter first number: ");
				fflush();
				int32_t n1 = 0;
				scanf("%d", &n1);
				
				printf("Enter second number: ");
				fflush();
				int32_t n2 = 0;
				scanf("%d", &n2);
				
				if (n1 > n2)
					printf("%d is greater than %d\n", n1, n2);
				else if (n1 < n2)
					printf("%d is lesser than %d\n", n1, n2);
				else
					printf("both %d and %d are equal\n", n1, n2);
					
				waitForKeyPress();
				
				return 0;
			}

			static void waitForKeyPress() {
				printf("Press any key to exit");
				while (getchar() != '\n');
					getchar();
			}

### 'if' and 'else' Exercise Implementation Part-1 ###
1. Invalid inputs: floating point inputs

		float num1, num2;
		...
		int32_t n1, n2;
		
		n1 = num1;
		n2 = num2;
		
		if (n1 != num1 || n2 != num2) {
			print("Warning: Comparing only integer parts");
		}
		...
		
2. Handling character inputs
	1. Return value of scanf
		1. `scanf` returns total number of inputs scanned successfully

				scanf("%f", &num1);
				
			1. `scanf` returns 1 - if scan was successful
			2. `scanf` returns 0 - otherwise
		2. If we enter character, the `scanf` fails and returns 0 (EOF)
			1. If we enter a character when we were suppsed to enter a floating point number, the `scanf` fails

					if (scanf("%f", &num1)  == 0) {
						printf("Invalid input! Exiting ...\n");
						waitForKeyPress();
						return -1;
					}
					
					...
					if (scanf("%f", &num1)  == 0) {
						printf("Invalid input! Exiting ...\n");
						waitForKeyPress();
						return -1;
					}

### 'if' and 'else' Exercise Implementation Part-2 ###
### 'if' and 'else' Exercise Implementation Part-3 ###
### 'if-else-if' Ladder Statements ###
1. Syntax: if ... else ... ladder statement

		if (expression1) { // first check this
			// statement(s) 
		} else if (expression2) { // check this if expression1 is false
			// statement(s)
		} else if (expression3) { // check this if expression1 and expression2 are false
			// statement(s)
			...
		} else { // execute this if all the above expressions are false
			// statement(s)
		}
		
2. Flow chart:

		if (expression1) -true-> statement(s)1
				|
				false
				|
				v
		else if (expression2) -true-> statement(s)2
				|
				false
				|
				v
		else if (expression3) -true-> statement(s)3
				|
				false
				|
				v
		else -> statement(s)
				|
				v
			rest of the code

### 'if-else-if' Ladder Exercise ###
1. Exercise
	1. Write a program to calculate income tax payable by the user.
	2. Tax is calculated as per below table

			total income 			| % of tax
			--------------------|------------
			Up to $9,525 			| 0
			$9,526 to $38,700	| 12%
			$38,701 to $82,500	| 22%
			> $82,500				| 32% + $1000
			
		1. Tax payable = Income * (tax rate / 100);
	3. Get total income and calculate and print the tax

### 'if-else-if' Ladder Exercise Solution ###
1. Solution:

		#include <stdio.h>
		#include <stdlib.h>
		#include <stdint.h>

		void readInputIfValid();

		int main(void) {
			uint64_t income = 0;
			printf("Please enter your income: ");
			fflush();
			income = readInputIfValid();
			double tax = computeTax(income);
			printf("Tax to be paid: $%lf\n", tax);
			return 0;
		}
		
		static uint64_t readInputIfValid() {
			uint64_t input = 0;
			if (scanf("%llu", &income) == 0) {
				printf("Invalid income! Exiting\n");
				waitForKeyPress();
				exit(-1);
			}
			return input;
		}
		
		static double computeTax(uint64_t income) {
			if (income <= 9525)
				return 0.0;
			else if (income <= 38700)
				return (double) income * 0.12;
			else if (income <= 82500)
				return (double) income * 0.22;
			else
				return (double) income * 0.32 + 1000.0;
		}

2. Instructor's solution

		uint64_t income;
		uint64_t tax;
		
		double temp_income;
		
		printf("Enter your total income:");
		scanf("%lf", &temp_income);
		
		if (temp_income < 0) {
			printf("Income cannot be negative\n");
			return -1;
		}
		
		income = (uint64_t) temp_income;
		
		if (income <= 9525) {
			tax = 0;
		} else if ((income > 9525) && (income <= 38700)) {
			tax = income * 0.12; // only integer part will be saved
		} else if ((income > 38700) && (income <= 82500)) {
			tax = income * 0.22;
		} else if (income > 82500) {
			tax = income * 0.32 + 1000;
		}
		
		printf("Tax payable: $%I64u");
		
		wait_for_user_input();

### Conditional Operator ###
1. Decision taking statements in 'C'
	1. Conditional Operators
		1. Conditional operator is a temporary operator in C used for conditional evaluation
		2. Operator symbol ?:
		3. It's a ternary operator because it operates on three operands
	2. Syntax of conditional operator
	
			expression1 ? expression2 : expression3
			(operand1)	(operand2)		(operand3)
			
			uint32_t a = (5 + 4) ? (9 - 4) : 99; // a = 5
			
			if (expression1 != 0) // is true
				expression2
			else
				expression3
				
	3. Use case
		1. Sometimes you can use conditional operator to replace `if`...`else` statements
		2. Example:

				int main(void) {
					uint8_t age = get_voter_age();
					
					if (age < 18) {
						printf("you are not eligible to vote\n");
					} else {
						printf("contrats!!! you can vote\n");
					}
					
					return 0;
				}
				
				int main(void) {
					uint8_t age = get_voter_age();
					(age < 18) ? printf("you are not eligible to vote\n") : printf("contrats!!! you can vote\n");
					return 0;
				}
				
2. Evaluate these expressions

		int32_t a = 5;
		a = 0 ? (a < 9) : a++;
		a = ? // 5
		
		int32_t a = 5, b = 10;
		a = !(a + b) ? !(a < 9) : a;
		a = ? // 5

### Switch Case Statement in 'C' ###
1. Syntax of `switch`/`case` statement
	1. `switch`/`case` statement is one of decision making statements available in 'C'
	2. It may be used instead of several `if`...`else` statements
	3. Syntax:

			switch (expression) {
			case value1:
				statement-1;
				statement-2;
				break;
			case value2:
				statement-3;
				statement-4;
				break;
			case value3:
				statement-5;
				statement-6;
				break;
			default: // if none of the `case`s match
				statement-7;
				statement-8;
			}
			
		1. `case` must be followed by integer value
		2. `break` - control comes out of `switch` body
2. Example:

		int main(void) {
			uint8_t key_read = read_keypad();
			
			switch (key_read) {
			case 1:
				all_leds_race();
				break;
			case 2:
				all_leds_on();
				break;
			case 3:
				all_leds_toggle();
				break;
			case 4:
				all_leds_blink();
				break;
			default:
				all_leds_off();
				printf("Invalid key ! Please enter number between (1 to 4) only\n");
			}
		}
		
	1. If `break` is not present, it continues with next `case` statement

### Switch Case Exercise ###
1. Exercise:
	1. Write a program to calculate the area of different geometric figures
		1. Circle, triangle, trapezoid, square, and rectangle
		2. The program should ask user to enter code for which user wants to find out area
			1. `t` for triangle
				1. `1/2 h b`
			2. `z` for trapezoid
				1. `1/2 (a + b) h`
			3. `c` for circle
				1. `PI r^2`
			4. `s` for square
				1. `a^2`
			5. `r` for rectangle
				1. `a b`

### Switch Case Exercise Solution ###
1. Solution:

		int main(void) {
			int8_t code = 0;
			printf("Area calculation program\n");
			printf("Circle\t--> c\n");
			printf("Triangle\t--> t\n");
			printf("Trapezoid\t--> z\n");
			printf("Square\t--> s\n");
			printf("Rectangle\t--> r\n");
			scanf("%c", &code);
			
			float area = 0.0;
			switch (code) {
			case 'c':
				float radius = 0.0;
				printf("Circle Area Calculatin:\n");
				printf("Enter radius(r) value: ");
				scanf("%f", &radius);
				area = 3.1415 * r * r;
				break;
			case 't':
				float base = 0.0;
				float height = 0.0;
				printf("Triangle Area Calculation:\n");
				printf("Enter base value: ");
				scanf("%f", &base);
				printf("Enter height value: ");
				scanf("%f", &height);
				area = 0.5 * base * height;
				break;
			case 's':
				float side = 0.0;
				printf("Square Area Calculation:\n");
				printf("Enter side value: ");
				scanf("%f", &side);
				area = side * side;
				break;
			case 'r':
				float base = 0.0;
				float height = 0.0;
				printf("Rectangle Area Calculation:\n");
				printf("Enter base value: ");
				scanf("%f", &base);
				printf("Enter height value: ");
				scanf("%f", &height);
				area = base * height;
				break;
			default:
				printf("Invalid input\n");
				area = -1;
			}
			
			if (area >= 0) {
				printf("Area = %f\n", area);
			}
			
			return 0;
		}

### Switch Case Exercise Solution Contd ###
1. Negative numbers:

		if (r < 0) {
			printf("radius cannot be -ve\n");
			area = -1;
		} else {
			// ...
		}

## Bitwise Operators ##
### Bitwise Operators in 'C' ###
1. Heavily used in embedded C programming
	1. We end up manipulating
		1. Memory addresses
		2. Content of peripheral registers
		3. Content of status registers
		4. ...
2. Bitwise Operators in 'C'
	1. Bitwise AND: `&`
	2. Bitwise OR: `|`
	3. Bitwise left shift: `<<`
	4. Bitwise right shift: `>>`
	5. Bitwise NOT: `~` (negation)
	6. Bitwise XOR: `^`
3. Difference between logical operator and bitwise operator
	1. `&&` is logical AND operator
	2. `&` is bitwise AND operator
	3. Example:

			char A = 40;
			char B = 30;
			
			C = A && B;	// C != 0 (true)
			C = A & B;	// C = 00101000 & 00011110 = 00001000 = 8
			
			C = A || B;	// C != 0 (true)
			C = A | B;	// C = 00101000 & 00011110 = 00111110 = 32 + 16 + 8 + 4 + 2 = 62
			
			C = !A;		// C = 0
			C = ~A;		// C = !00101000 = 11010111 = -41
			
			C = A ^ B;	// C = 00101000 ^ 00011110 = 00110110 = 32 + 16 + 4 + 2 = 54
			
4. Applicability of bitwise operations
	1. In embedded C program most of the time you will be doing
		1. Testing of bits (&)
		2. Setting of bits (|)
		3. Clearing of bits (~ and &)
		4. Toggling of bits (^)
	2. Example: If an LED is connected to one of the pins of a microcontroller port
		1. If we want to turn on the LED, we can set some bit(s)
		2. If we want to turn off the LED, we can clear some bit(s)
		3. If we want to analyze status register of a peripheral, we will be testing some bits
	3. Exercise:
		1. Write a program which takes 2 integers from the user, computes bitwise &, |, ^ and ~ and prints the result

### Bitwise AND and Bitwise OR ###
1. Solution:

		#include <stdio.h>
		#include <stdint.h>
		#include <stdlib.h>

		static uint32_t readInputIfValid();
		static void waitForKeyPress();

		int main() {
			printf("Enter first number: ");
			fflush(stdout);	
			uint32_t num1 = readInputIfValid();
			
			printf("Enter second number: ");
			fflush(stdout);
			uint32_t num2 = readInputIfValid();
			
			printf("%u & %u = %u\n", num1, num2, (num1 & num2));
			printf("%u | %u = %u\n", num1, num2, (num1 | num2));
			printf("%u ^ %u = %u\n", num1, num2, (num1 ^ num2));
			printf("~%u = %u\n", num1, (~num1));
			
			waitForKeyPress();
			
			return 0;
		}
		
		static uint32_t readInputIfValid() {
			float num = 0.0f;
			if (scanf("%f", &num) == 0) {
				printf("Invalid input! Exiting");
				waitForKeyPress();
				exit(-1);
			}
			return (uint32_t) num;
		}
		
		static void waitForKeyPress() {
			printf("Press any key to exit ");
			while (getchar() != '\n')
				;
			getchar();
		}

### Applicability of Bitwise Operators: Testing of Bits ###
1. Testing of bits (&)
	1. Write a program to find out whether a user entered integer is even or odd
	2. Print an appropriate message on the console
	3. Use testing of bits logic
2. Solution:
	1. Test least significant bit of number using bitwise operation
		1. if lsb is zero, then number is EVEN
		2. if lsb is one, then number is ODD
	2. Bit-Masking
		1. Bit masking is a technique in programming used to test or modify the states of the bits of a given data
			1. Modify: if state of bit is zero, make it one or if the state of bit is one then make it zero
			2. Test: check whether the required bit position of a data is 0 or 1

						00101110
					&	00000001 (mask)
						--------
						00000000
						
				1. Data is masked with zeros to make all bits of data in this area zero at output
					1. Area of no interest: put zeros in the mask
					2. Area of interest: put one(s) in the mask
	3. Solution:

			if (number & 1) {
				printf("Number is odd\n");
			} else {
				printf("Number is even\n");
			}

### Finding a Number Even or odd Using Testing of Bits ###
1. Solution:

		#include <stdio.h>
		#include <stdint.h>

		int main(void) {
			int32_t num1;
			printf("Enter a number: ");
			scanf("%d", &num1);
			
			if (num1 & 1) {
				printf("Number is odd\n");
			} else {
				printf("Number is even\n");
			}
		}

### Applicability of Bitwise Operators: Setting of Bits ###
1. Write a program to set (make bit state to 1) 4th and 7th-bit positions of a given number and print the result.

		#include <stdio.h>
		#include <stdint.h>
		#include <stdlib.h>
		
		int main() {
			int32_t mask = 0x90;
			
			printf("Enter a number: ");
			fflush(stdout);
			int32_t num = readInputIfValid();
			
			printf("%d | %d = %d\n", num, mask, (num | mask));
			
			waitForKeyPress();
			
			return 0;
		}
		
		static uint32_t readInputIfValid() {
			float num = 0.0f;
			if (scanf("%f", &num) == 0) {
				printf("Invalid input! Exiting");
				waitForKeyPress();
				exit(-1);
			}
			return (uint32_t) num;
		}
		
		static void waitForKeyPress() {
			printf("Press any key to exit ");
			while (getchar() != '\n')
				;
			getchar();
		}

### Applicability of Bitwise Operators: Clearing of Bits ###
1. Instructor's solution:

		int main(void) {
			int32_t num1, output;
			printf("Enter a number: ");
			scanf("%d", &num1);
			
			output = num1 | 0x90;
			printf("[intput][output] :0x%x 0x%x\n", num1, output);
			
			wait_for_user_input();
		}

### Applicability of Bitwise Operators: XOR ###
1. Exercise: Clearing of bits
	1. Write a program to clear (make bit state to 0) 4th, 5th, 6th, bit position of a given number and print the result.
		1. Which bit wise operation do you use to clear the given bit position of the data?
			1. Solution:

					10111110
					10001111
					--------
					10001110
					
				1. `&` is used to test and clear but not set
				2. Un-interested areas should have all 1s
				3. interested areas should have all 0s
			2. Solution 2:

					  10111110
					~(01110000) (7 << 4)
					  --------
					  10001110
					  
				1. Negate (Bitwise NOT) the mask value first and then perform bitwise AND (&)
2. Toggling of bits:
	1. Led_state = Led_state ^ 0x01

			00000001
			00000001
			--------
			00000000
			00000001
			--------
			00000001
			
		1. Code:

				while (true) {
					LED_state ^= 0x01;
				}
				
3. Exercise:
	1. Write a program to turn on the LED of your target board
	2. For this exercise we need the knowledge of
		1. Pointers
		2. Bitwise operations
		3. Hardware connections

## Embedded C Coding Exercise for LED ##
### Coding to Turn on an LED ###
1. Hardware connections
	1. Let us understand how external hardware (LED) is connected to MCU
		1. Refer to schematic of the board you are using
			1. ST Documentation - Resource Section
				1. CAD Resrouces > Schematics
				2. Search for LEDs
					1. Part Number: LD2, LD3
			2. LD2 is connected to PB13 (D13), PA5
				1. PB13 - Port B Pin No 13
		2. Open user manual
			1. Board layout
	2. In STM32Fx based MCUs, each port has 16 pins where you can connect external peripherals (0-15)
		1. (LED, Display, button, bluetooth transceiver, external memory (e.g. EEPROM), Joy stick, Keypad, etc...)
		2. U5A - part number of the microcontroller 
		3. The pins on ports are exposed to external world
			1. Ports
				1. Each port is a collection of 16 pins
					1. PA0 to PA15
						1. 23 pin of microcontroller corresponds to PA0
				2. Port F, Port G, Port H, ... are not exposed
		4. LD2 - connected to PA5 (GPIO - external peripheral, protocol communication (Ethernet, UART, I2C, ...)
			1. How to access it?
2. Now our goal is to control the I/O pin PD12's state either HIGH or LOW through software to make LED turn ON or OFF
	1. PD12: 12th pin of the GPIO Port D peripheral
3. It also has a set of registers which are used to control pin's mode, state and other functionality

### Controlling IO Pin Using Software ###
1. GPIO D peripheral - used to control pins of port D
	1. It has set of registers which are used to control pin's mode, state and other functionality
		1. Software needs to write to the register (to control mode, state, data to transfer, write data, read data, ...)
	2. How to addess the registers?
		1. We can access registers of the peripheral using memory addresses
			1. The peripheral registers are memory mapped
				1. **Each register has it's own memory address**
2. Memory mapped I/O
	1. IO pins are controlled using peripheral registers which are mapped on to processor addressable memory locations
	2. What are processor addressable memory locations?

### Processor Addressable Memory Regions ###
1. Figure:

		ARM Cortex M4 CPU	Data memory	Code memory
				^					^			^
				|					|			|
				v					v			v
			<-------System bus (AHB)-------------->
				^			^			^		^
				|			|			|		|
				v			v			v		v
			  GPIO		TIMERS			ADC		I2C
			  
	1. System bus (AHB) - central bus which connects processor with memory and peripherals - it has 2 channels
		1. 32 bit address channel - 2^32 addresses to target memory and peripherals
		2. 32 bit data channel
	2. AHB - specification
		1. Designed by ARM
		2. Advanced High Performance Bus
2. Suppose we want to send data to external world over GPIO pins
	1. Peripherals are controlled by their own set of registers, and a register is addressed by its unique address
		1. CPU has to send the data to one of the registers of the GPIO peripheral over system bus
		2. Data from register is transmitted to the external world
	2. **We can get the address by going through the memory map of the processor**
	3. Example: If we want to read data from ADC peripheral
		1. We want to place appropriate addess on address bus
3. 2^32 = 4 G memory addresses
4. Processor addressable memory locations?
	1. Since address bus width is 32 bits
	2. Processor puts address ranging from 0x0000_0000 to 0xFFFF_FFFF on address bus
	3. So 4G (4,29,49,67,296) different addresses can be put on address bus
5. Memory map of ARM Cortex Mx processor

		System - 0xE01000000 to 0xFFFFFFFF
		Private peripheral bus - External - 0xE00400000 to 0xE01000000
		Private peripheral bus - Internal - 0xE00000000 to 0xE00400000
		External device - 1.0 GB - 0xA0000000 to 0xE0000000
		External RAM - 1.0 GB - 0x60000000 to 0xA0000000
		Peripheral - 0.5 GB - 0x40000000 to 0x60000000
		SRAM - 0.5 GB - 0x20000000 to 0x40000000
		Code - 0.5 GB - 0x00000000 to 0x20000000
		
	1. Program memroy, data memory, registers of various peripherals are organized withing same linear 4 GB of address space
	2. The above is generic memory map which must be followed by all MCUs which use ARM cortex Mx processor
	3. If processor puts any address from 0x00000000 to 0x20000000 (exclusive) on address bus, the code memory is targeted
		1. Address generation unit puts the address
	4. If processor puts any address from 0x20000000 to 0x40000000 (exclusive) on address bus, the SRAM is targeted (data memory)
	5. If processor puts any address from 0x40000000 to 0x60000000 (exclusive) on address bus, the Peripherals are targeted
6. This map is fixed for ARM Cortex Mx microcontroller architecture
	1. The microcontroller designers who use ARM Cortex Mx processor in the design should follow the memory map
		1. **The diagram exists in ARM Cortex technical manual**
7. GPIOD register address falls in the range 0x40000000 to 0x60000000
	1. The addresses can be treated as pointers and we can write and read data to and from the pointers
8. Memory map of STM32 MCU
	1. Memory map of the microcontroller you can refer from the datasheet of reference manual of the microcontroller

### STM32 Memory Map ###
1. Open Datasheet or Reference manual
	1. Bus Architecture
		1. Memory Map
			1. GPIOD - peripheral register
				1. First register is at the address: 0x40020C00 (base address of GPIOD)
			2. ADC1,2,3 - 0x40012000 (base address)
			3. CAN - 0x40006800
				1. If processor puts the address on address bus, it would be talking to the CAN peripheral registers
			4. I2C
			5. UART
			6. Ethernet MAC:
				1. Registers used to **control and configure** Ethernet MAC peripherals and registers used to **read data from and write data** into Ethernet MAC peripheral are mapped in address range 0x4002_8000 to 0x4002_93FF

						0x4002 0000 - 0x4002 03FF: GPIOA
						0x4002 0C00 - 0x4002 0FFF: GPIOD
						
2. About peripheral registers
	1. All peripheral registers in STM32 microcontroller are of 32 bits wide
	2. Different peripherals have different number of peripheral registers
	3. Never assume about the address of peripheral registers
		1. Refer to device reference manual

### Memory Mapped Peripheral Registers and IO Access ###
1. GPIO - may have 10, ADC - 15 say, ...
	1. Depends on complexity of the peripheral
		1. More complex peripheral may have more registers
			1. Ethernet MAC
			2. CAN
			3. TIMER
			4. ...
2. GPIOD Peripheral Registers (GPIOA, GPIOB, ... have same set of registers) - the registers are implemented inside the microcontroller
	1. GPIOD port mode register (each 32 bit)
		1. Used to control mode of an I/O pin
			1. Input - for button say
			2. Output - for LED say
	2. GPIOD port output type register
		1. What should the output type of I/O pin be?
			1. If it is in output mode
	3. GPIOD port output speed register
	4. GPIOD port pull-up/pull-down register (important)
		1. To activate or deactivate pull-up resistors
	5. GPIOD port input data register
		1. Used to read data from I/O pin
	6. GPIOD port ouptut data register
		1. Used to write data into I/O pin
			1. Used to turn on or off LED (say)
				1. Write 1 to turn ON
				2. Write 0 to turn OFF
	7. GPIOD port bit set/ reset register
	8. GPIOD port configuration lock register
	9. GPIOD alternate function low register
	10. GPIOD alternate function high register
3. GPIOD port MODE register

		0x4002_0C03	Most significant byte
		0x4002_0C02	3rd byte
		0x4002_0C01	2nd byte
		0x4002_0C00	Least significant byte (address of register)
		
4. GPIOD OUTPUT TYPE register

		0x4002_0C07	Most significant byte
		0x4002_0C06	3rd byte
		0x4002_0C05	2nd byte
		0x4002_0C04	Least significant byte (address of register)
		
	1. GPIOD prot output type register = GPIOD port mode register address + 4
	2. GPIOD port output speed register =  GPIOD prot output type register + 4
	3. ...
5. How to control output state of GPIO Pins?
	1. GPIOD output data register can be used

			GPIOD bit 0 controls PD0 (if we write 1, PD0 will become +VCC (3.3V, if we write 0, PD0 will become 0V)
			GPIOD bit 1 controls PD1
			...
			GPIOD bit 15 controls PD15

### Procedure to Turn ON the LED ###
1. Procedure to turn on the LED
	1. To write a code to turn on the LED is not easy.
		1. This makes embedded system programming unique
			1. We must know memory map
			2. We must know peripheral registers
			3. We must know peripheral register addresses
			4. We must know hardware connections,
			5. ...
2. Procedure to turn on the LED
	1. Identify the GPIO port (a peripheral) used to connect the LED
		1. GPIOD
	2. Identify the GPIO pin where the LED is connected
		1. 12 (PD12)
	3. Activate the GPIOD peripheral (Enable the clock) (most of the peripherals are dead by default in certain microcontrollers - STM say)
		1. Until we enable clock for a peripheral, peripheral is dead
			1. It doesn't function
			2. It doesn't take any configuration values set by us
		2. If we activate the clock:
			1. Peripheral is ready to take **configuration** and **control**-related commands or arguments (config values)
		3. Note: For certain microcontrollers,
			1. peripheral may be ON by default
				1. No need to activate
					1. Explore the device **datasheet** or **reference manual**
	4. Configure the GPIO pin mode as output
		1. To drive LED (to ON or OFF), operation mode of GPIO pin has to be configured as OUTPUT
	5. Write to the GPIO pin
		1. 1 (HIGH) to make GPIO pin state HIGH (3.3V)
		2. 0 (LOW) to make GPIO pin state LOW (0V)
3. Procedure to turn on the LED: Summary
	1. Identify the GPIO port (a peripheral) used to connect the LED
	2. Identify the GPIO pin where the LED is connected
	3. Activate the GPIOD peripheral (Enable the clock)
	4. Configure the GPIO pin mode as output
	5. Write to the GPIO pin
4. How to enable the peripheral clock?
	1. Through peripheral clock control registers of microcontroller
	2. In STM32 MCU, clock control registers are mapped at following address range in mem map of MCU
		1. 0x4002 3800 - 0x4002 3BFF - RCC
			1. RCC - an engine (Reset and Clock Control)
				1. The RCC engine takes care of controlling clocks for various parts of the microcontroller:
					1. Processor 
					2. Buses
					3. Memory
					4. Peripherals
					5. ...
				2. RCC has it's own addresses to control the clock
		2. To do:
			1. Select appropriate register in the RCC block
			2. Enable the clock
				1. **Go to Reset and Clock Control section of reference manual**
					1. RCC Registers
						1. RCC AHB1 peripheral clock enable register (used to enable clocks for peripherals hanging on AHB1 bus - we can get this info from datasheet)
							1. Internal archicture (GPIOD is connected to AHB1 bus which is connected to AHB bus-matrix)
								1. ADC is connected to APB2 bus (slower bus) which is connected to AHB bus through a bridge (AHB/APB2)
						2. The data exchange between memory and peripherals happens over the AHB bus

### Enabling Peripheral Clock ###
1. RCC AHB1 peripheral clock register (RCC_AHB1ENR) - for all peripherals hanging on AHB1 bus

		Address offset: 0x30 (add this offset to the base address of RCC peripheral registers - 0x4002 3800 (mem map))
		Reset value: 0x0010 0000 (to reset RCC)
		Access: no wait state (?)
			1. word access
			2. half-word access
			3. byte access
		
		GPIODEN - bit 3 (set to 1 to enable the clock)
		
			GPIODEN: IO port D clock enable
			0: IO port D clock disabled
			1: IO port D clock enabled

### Calculating Peripheral Register Addresses ###
1. Address of clock control register (**AHB1ENR** - **RCC AHB1 peripheral clock enable register**)
	1. Calculate address of AHB1ENR
	
			base address + offset
			0x40023800 + 0x30 = 0x40023830
			
2. Address of GPIOD mode register (used to control mode)
	1. Calculate address of GPIOD mode register (**Go to GPIO section > Registers > GPIO port mode register**)

			base address + offset
			0x40020C00 + 0x00 = 0x40020C00
			
		1. Reset value: 0x00000000 for other ports (Port D say)
		2. Reset value: 0xA8000000 for port A
		3. Reset value: 0x00000280 for port B
	2. 32 bits are divided into 16 sections (for 16 pins)
		1. Each section has 2 bits

				MODER0[1:0]
				rw	rw
				
			1. Why 2 bits?
				1. Each pin can be in 4 modes

						00: Input (reset state)
						01: General purpose output mode
						10: Alternate function mode
						11: Analog mode
						
			2. For PD12 - MODER12[1-0] - bits 24 & 25
				1. value: `01`
3. Address of the GPIOD output data register (used to write to IO pin)
	1. Calculate address of **GPIOD output data register**
		1. In Datasheet, go to **GPIO port output data register** (GPIOx_ODR)
			1. bits 16-31 are not used
			2. bits 0-15 are used
				1. These bits can be read and written by software

						ODR0 - controls pin 0
						ODR1 - controls pin 1
						...
						ODR15 - controls pin 15
						
		2. Address

				base address + offset
				0x40020C00 + 0x14 = 0x40020C14

### LED ON Exercise Coding ###
1. Solution:
	1. New STM32 project
	2. Select board
	3. Name: led_on

			#include <stdint.h>

			int main(void) {
				uint32_t *pClkctrlreg = (uint32_t*) 0x40023830;
				uint32_t *pPortDModeReg = (uint32_t*) 0x40020C00;
				uint32_t *pPortDOutReg = (uint32_t*) 0x40020C14;
				
				//1. Enable peripheral clock
				*pClkctrlreg |= 0x08; // read and write back
				
				//2. Configure the mode of the IO pin as output
				*pPortDModeReg &= 0xFCFFFFFF; // clearing bits 24 and 25
				*pPortDModeReg |= 0x01000000; // setting bit 24
				
				//3. SET 12th bit of the output data register to make I/O pin-12 as HIGH
				*pPortDOutReg |= 0x1000;
				
				for(;;);
			}
			
		1. In embedded programming:
			1. While we configure hardware register bit fields
				1. We must respect the other bits (never change the state of unknown bit positions)
					1. If our code is part of another project, the peripheral might be used for other purposes (we must not disturb those)
						1. DMA
						2. GPIOA, GPIOB, ...
				2. Solution: Use bitwise operation
		2. GPIO port output data register
			1. Reserved must be kept at reset value
2. Program for STM32F446RE:

		/********************************************************************************
		 * @file           : main.c
		 * @author         : Auto-generated by STM32CubeIDE
		 * @brief          : Main program body
		 ******************************************************************************
		 * @attention
		 *
		 * <h2><center>&copy; Copyright (c) 2021 STMicroelectronics.
		 * All rights reserved.</center></h2>
		 *
		 * This software component is licensed by ST under BSD 3-Clause license,
		 * the "License"; You may not use this file except in compliance with the
		 * License. You may obtain a copy of the License at:
		 *                        opensource.org/licenses/BSD-3-Clause
		 *
		 ******************************************************************************
		 */
		
		#include <stdint.h>
		
		#if !defined(__SOFT_FP__) && defined(__ARM_FP)
		  #warning "FPU is not initialized, but the project is compiling for an FPU. Please initialize the FPU before use."
		#endif
		
		int main(void)
		{
			uint32_t *pClkCtrlReg = (uint32_t*) 0x40023830;
			uint32_t *pPortAModeReg = (uint32_t*) 0x40020000;
			uint32_t *pPortAOutReg = (uint32_t*) 0x40020014;
		
			// 1. Enable peripheral clock
			*pClkCtrlReg |= 0x01;
		
			// 2. Configure the mode of the I/O pin as output
			*pPortAModeReg = 0xA8000000;
			*pPortAModeReg &= 0xFFFFF3FF; // clearing bits 10 and 11
			*pPortAModeReg |= 0x00000400; // setting bit 10
		
			// 3. Set 5th bit of the output data register to make I/O pin-5 as HIGH
			*pPortAOutReg =  0x00000000;
			*pPortAOutReg |= 0x0020;
		
			/* Loop forever */
			for(;;);
		}
		
	1. Show View > SFR
		1. Peripheral registers (GPIOD)
			1. Step Over
				1. AHB1ENR
				2. GPIODEN (enable clock)
				3. GPIOD > MODER ([24:2])
		2. Shows register views
		3. ODR > ODR12

## Bitwise Shift Operators ##
### Bitwise Right Shift Operator ###
1. Right shift
	1. This operator takes 2 operands
	2. Bits of 1st operand will be right shifted by the amount decided by 2nd operand
	3. Syntax: operand1 >> operand2
	4. Example:

			char a = 111; // 01101111
			char b = a >> 4; // empty bit position will be filled with 0s - 00000110

### Bitwise Left Shift Operator ###
1. This operator takes 2 operands
2. Bits of 1st operand will be left shifted by the amount decided by 2nd operand
3. Syntax: operand1 << operand2
4. Example:
5. A value will be multiplied by 2 for each left shift
6. A value will be divided by 2 for each right shift

### Applicability of Bitwise Shift Operators ###
1. Applicability
	1. Bitwise shift operators are very much helpful in bit masking of data along with other bitwise operators
	2. Predominantly used while setting or clearing of bits
	3. Lets consider this problem statement: Set 4th bit of given data
2. Example:

		Data = 0x08
		Data = Data | (1 << 4) = 0x18
		
	1. Shift by the bit position number that needs to be set
2. Example:

		Data = 0x18
		Data = Data & (~(1 << 4)) = 0x08

### Modifying LED on Exercise Using Bitwise Shift Operators ###
1. Program

		*pClkCtrlReg |= (1 << 3);
		
		*pPortDModeReg &= ~(3 << 24);
		*pPortDModeReg |= (1 << 24);
		
		*pPortDOutReg |= (1 << 12);

### Bit Extraction ###
1. Lets consider the problem statement
	1. Extrat bit positions from 9th to 14th [14:9] in a given data and save it in to another variable
2. Example: 0xB410

		1|011010|000010000
		
	1. Shift the identified portion to right hand side until it touches the least significant bit (0th bit)

			Data >> 9
			
			1|011010|000010000
			000000000001|011010
	
	2. Mask the value to extract only 6 bits [5:0] and then save it in to another variable

			000000000001|011010
			000000000000|111111
			-------------------
			000000000000|011010
			
3. Code:

		uint16_t data = 0xB410;
		uint8_t output;
		output = (uint8_t) ((Data >> 9) & 0x003F);

## Looping ##
### Looping in 'C' ###
1. Why looping?

		#include <stdio.h>
		#include <stdint.h>
		
		int main(void) {
			uint8_t i = 1;
			
			while (i < 10) {
				printf("%d\n", i++);
			}
		}
		
	1. Certain statements are executed until a condition is met
2. There are three types of loop statements in 'C'
	1. `while` loop
	2. `for` loop
	3. `do`...`while` loop
3. `while`, `for` and `do` are reserved words in 'C' standard

### While Loop ###
1. Syntax: `while` loop

		while (expression) {
			/* multi statement while loop */
			statement1;
			statement2;
			statement3;
			...
			statementN;
		}
		
		/* Single statement while loop */
		while (expression)
			statement1;
			
	1. Repeat execution of code inside loop body until expression evaluates to false (0)
		1. If expression evaluates to false, the loop breaks
2. Flow chart:

		+->	[Expression evaluation result?]
		|		|			|
		|		true		false
		|		|			|
		|		v			|
		+--[execute		|
			statement(s)]	|program continues with code outside loop
							v
							
	1. expression is evaluated first (always done first)
	2. if expression evaluation is TRUE, then
		1. statements inside the body of the loop will be executed and execution loops back to check the expression again
	3. If expression evaluation is FALSE, then
		1. Loop body breaks and the program continues with code outside the loop body
3. Example: Write a program which prints from 1 to 10 using 'while' loop

		uint8_t i = 1;
		while (i < 11) {
			printf("%d\n", i++);
		}

### While Loop Exercise ###
### While Loop and Semicolon ###

		while (num <= 10); /* infinite loop */ {
			// ...
		}
		
1. forever loop
	1. A special form of while loop is forever loop
		1. Loop that never ends (common in embedded apps in main program)
			1. An embedded program may run forever (unlike a PC program) (or as long as it is powered up)
	2. Example:

			int main(void) {
				/* super loop */
				while (1) {
					readDataSensor();
					processData();
					displaySensorData();
				}
			}
			
2. Exercise:
	1. Write a program to print all the even numbers between 0 and 100 (including boundaries)
	2. Also count and print how many even numbers you find
	3. Use `while` loop or `for` loop or `do` `while` loop
	4. Later change the program to accept boundary numbers from user

### While Loop Exercise ###
1. Solution:

		int32_t start_num = 0;
		int32_t end_num = 0;
		printf("Enter start and end numbers (give space between the two numbers): ");
		scanf("%d %d", &start_num, &end_num);
		
		int32_t i = (start_num % 2 == 0) ? start_num : start_num + 1;
		uint32_t count = 0;
		while (i <= end_num) {
			printf("%d\n", i);
			i += 2;
			count++;
		}
		
		printf("No of even numbers = %u\n", count);

### 'do while' Loop ###
1. Instructor's implementation
2. Syntax: do...while loop

		do {
			statement1;
			statement2;
			...
			statementN;
		} while (expression);
		
	1. Flow chart

					|
					v
			+-> execute statement(s)
			|		|
			true	v
			+-- expression evaluation result?
					|
					false
					|
					v
					
		1. Repeat execution of code inside `do` body until expression evaluates to false (0)
3. Points to remember:
	1. Statements are executed first
	2. Expression is evaluated
	3. If expression evaluation result is true, execution loops back and the statements inside the `do` body executes again
	4. If expression evaluation result is false, while statement is terminated and program continues with the statement next to while statement
	5. Statements are executed at least once
4. In embedded programming, we use `do`...`while` loop to write multiline 'C' macros in a header file.
	1. 'C' pre-processor directives
		1. Function like macros
		2. Multi-line macros

### 'for' Loop ###
1. for loop syntax:

		for (block-1; block-2; block-3) {
			// Body of for loop
		}
		
	1. A `for` statement has three blocks separated by 2 semicolons
	2. Writing 2 semicolons are mandatory
	3. You can leave any block empty
		1. You can leave all blocks empty -> results in infinite loop
	4. `;`s are compulsory
	5. `block-1` - executed only once
	6. `block-2` - evaluated as true or false (decides whether to break the loop or continue the loop)
	7. `block-3` - we can put any expression
	8. Order of execution:
		1. `block-1` is executed
		2. `block-2` is evaluated
			1. If evaluation is true, body is executed
				1. `block-3` is executed
				2. Go back to step 2
			2. If evaluation is false, loop is exited
2. Flow chart:

		execute block-1
			|
			v
		check result of block-2? -false-> done
			|			^
			true		|
			|			|
			v			|
		execute body	|
			|			|
			v			|
		execute block-3
		
3. It can be used for iteration

		for (int i = 0; i < 10; i++) {
			//...
		}

### 'for' Loop Exercise ###
1. Print even numbers using for loop

		int first_even = (start_num % 2 == 0) ? start_num : start_num + 1;
		for (int i = first_even; i <= end_num; i += 2) {
			printf("%d\n", i);
		}

### 'for' Loop Number Pyramid Exercise ###
1. Exercise: Number pyramid

		#include <stdio.h>
		#include <stdint.h>
		#include <stdlib.h>
		
		int main() {
		    printf("Enter height of the pyramid: ");
		    fflush(stdout);
		
		    double input = 0.0;
		    scanf("%lf", &input);
		
		    uint32_t height = (uint32_t) input;
		    if (input <= 0 || (((double) height) != input)) {
		        printf("Invalid input! positive integer in the range [0, 4294967295] expected. Exiting...\n");
		        exit(-1);
		    }
		
		    for (uint32_t i = 1; i <= height; i++) {
		        for (uint32_t j = i; j > 0; j--) {
		            printf("%u\t", j);
		        }
		        printf("\n");
		    }
		    return 0;
		}

### 'for' Loop Exercise Solution ###
### Modifying LED on With Software Delay ###
1. Exercise:
	1. Modify the LED on program in to LED toggle program by introducing a software delay between LED on and LED off
	2. LED should continously toggle with certain time delay forever.
2. Program:
		
		#include <stdint.h>
		
		#if !defined(__SOFT_FP__) && defined(__ARM_FP)
		  #warning "FPU is not initialized, but the project is compiling for an FPU. Please initialize the FPU before use."
		#endif
		
		int main(void) {
			uint32_t *pClkCtrlReg = (uint32_t*) 0x40023830;
			uint32_t *pPortAModeReg = (uint32_t*) 0x40020000;
			uint32_t *pPortAOutReg = (uint32_t*) 0x40020014;
		
			// 1. Enable peripheral clock
			*pClkCtrlReg |= 0x01;
		
			// 2. Configure the mode of the I/O pin as output
			*pPortAModeReg &= 0xFFFFF3FF; // clearing bits 10 and 11
			*pPortAModeReg |= 0x00000400; // setting bit 10
		
			while (1) {
				// 3. Set 5th bit of the output data register to make I/O pin-5 as HIGH
				*pPortAOutReg |= 0x0020;
		
				//introduce small human observable delay
				for (uint32_t i = 0; i < 1000000; i++)
					;
		
				// Turn OFF the LED
				// 4. Clear 5th bit of the output data register to make I/O pin-5 as HIGH
				*pPortAOutReg &= ~(0x0020);
		
				//introduce small human observable delay
				for (uint32_t i = 0; i < 1000000; i++)
					;
			}
	
		}
	

### LED Toggle Using Software Delay ###
2. Delay
	1. Software delay (loop statements)
		1. Make processor busy in a software loop doing nothing
			1. Not accurate to obtain desired time delay
			2. Processor will also waste execution cycles until certain delay is met
				1. Precision is not required here
	2. Hardware delay (hardware peripherals such as TIMERS)
3. Knowing the number of cycles for software delay

## Type Qualifier 'const' ##
### 'const' Type Qualifier ###
1. Type qualifiers in 'C'
	1. `const`
	2. `volatile`
2. Applying the qualifiers to variable declaration is called qualifying declaration
	1. Used to write bug free code
		1. qualifier: A word or phrase, especially an adjective, used to attribute a quality to another word, especially a noun
			1. In programming, a qualifier is used to attribute a feature to a variable
3. `const` type qualifier
	1. It is used to enforce read-only feature on variables

			uint8_t data1 = 10; // here data1 is called a variable
			data1 = 50;			// OK. 'data1' value can be modified through out the program
			
			const uint8_t data2 = 10; // here data2 is called constant variable
			data2 = 50;					// compile-time error! 'data2' value cannot be modified because it is read-only
			
4. Example:

		const uint8_t data1 = 10; // value cannot be modified
		
		uint8_t const data1 = 10; // same as above - instructor prefers this
5. About 'const'ness of a variable
	1. By using `const` keyword, you are making a promise to compiler that you (programmer) won't try to modify the content of the variable using its name
	2. If you try to modify variable by its name, the compiler stops you by throwing an error (compile-time error)
		1. You can still modify the content of the variable by using its address	

				const uint8_t data = 10;
				data = 50 // error
				printf("Value = %u\n", data);
				
				uint8_t* ptr = (uint8_t*) &data;
				*ptr = 50; // no error
				printf("Value = %u\n", data);
				getchar();
				
			1. `const` doesn't mean that value never changes
				1. It is only programming safety feature to ensure that programmer shouldn't try to modify the value

### Placements of 'const' Variables in Memory ###
1. `const` placement in memory
	1. All local const variables are just like non-const variables as far as memory placement is concerned. They are placed in RAM. 
		1. The only specialty of a const variable is, it is read-only
	2. All global const variables are stored in ROM or FLASH.
		1. Depends on linker script rules and hardware on which code runs
	3. In STM32 target hardware
		1. All global const variabls live in FLASH memory
			1. If we try to modify const variable using it's address, operation has no effect
				1. **Because flash memory of microcontroller is write-protected**
					1. FLASH is code space - write protected
2. Global scope:

		const uint8_t data = 10;
		
		int main() {
			//...
			*p = 20; // OS crashes the application (on host), on target (STM32) the op has no effect - undefined behaviour
			//...
		}
		
	1. Protects variable value
3. Use `const` to guard data from modifications in project
	1. If we unknowingly change read-only variable, compiler will alert

### 'const' Usage and Different Case Studies ###
1. Use case: To define mathematical constants in the program

		float const pi = 3.1415;
		float const radius = 4;
		int const number_of_months = 12;
		
2. Use case: Modifiable pointer and constant data

		uint8_t const *pData = (uint8_t*) 0x40000000;
		
	1. Here pointer `pData` is modifiable but data pointer by `pData` cannot be modifiable (read-only)
		1. It is a pointer pointing to read-only data
	2. `pData` is a pointer (*) pointing to constant data of type unsigned integer_8
	3. Examples:

			pData = (uint8_t*) 0x50000000;
			pData = (uint8_t*) 0x60000000;
			pData = (uint8_t*) 0x70000000;
			
			*pData = 50; // not allowed
			
	4. Where is it used?

			//This function copies data from src pointer to dst pointer
			void copy_src_to_dst(uint8_t *src, uint8 *dst, uint32_t len) {
				for (uint32_t i = 0; i < len; i++) {
					*dst = *src; //*dst++ = *src++
					dst++;
					src++; // increased to point to next location
					// *src = 10; // compiler will not alert
				}
			}
			
		1. `src` is not guarded (prone to mistake)
			1. Data pointed to by `src` must not be modified
		2. Solution:

				//This function copies data from src pointer to dst pointer
				void copy_src_to_dst(uint8_t const *src, uint8 *dst, uint32_t len) {
					for (uint32_t i = 0; i < len; i++) {
						*dst = *src; //*dst++ = *src++
						dst++;
						src++; // increased to point to next location
						// *src = 10; // compiler will alert
					}
				}
				
			1. `src` is guarded (compiler alerts if programmer tries to change the data pointed by src pointer)
				1. Programmer will know that `src` must not be changed
3. Example: `open` & `write` - Linux man page

		int open(const char *path, int oflag, ...);
		
		ssize_t write(int fd, const void *buf, size_t count);
		
	1. `buf` - should not be modified

### 'const' Usage and Different Case Studies Contd ###
1. Use Case 3: Modifiable data and constant pointer

		uint8_t *const pData = (uint8_t*) 0x40000000;
		
	1. Here pointer `pData` is read-only but data pointed by `pData` can be modifiable
		1. pData is read only pointer pointing to modifiable data
	2. `pData` is a constant pointer (*) pointing to data of type unsigned inteter_8
2. What is allowed?

		uint8_t *const pData = (uint8_t*) 0x40000000;
		pData = (unit8_t*) 0x50000000; // not allowed
		
		*pData = 50; // allowed
		
3. Use case:

		/*
		* Update the details of age and salary in to the pointer provided
		* by the caller
		*/
		void update_user_data(uint8_t *const pUserAge, uint32_t *const pUserSalary) {
			if (pUserAge != NULL) {
				*pUserAge = getUserAge();
			}
			
			if (pUserSalary != NULL) {
				*pUserSalary = getUserSalary();
			}
		}
		
	1. Improves readability and guards pointer variables
2. Use Case 4: `const` data and const pointer

		uint8_t const *const pData = (uint8_t*) 0x40000000;
		
	1. `pData` pointer is read only
	2. Data pointed by `pData` is also read only
		1. `pData` is read only pointer pointing to read-only data
	3. **pData is a constant pointer (\*) pointing to constant data of type unsigned integer_8**
3. Use case:

		/*
		 * read and return the content of status register pointed by
		 * pStatusReg
		 * accidental write to SR may cause unpredictable consequences
		 */
		uint32_t read_status_register(uint32_t const *const pStatusReg) {
			return (*pStatusReg);
		}
		
	1. The status register should not be modified
		1. otherwise, it will cause system to fail
4. Use of `const`
	1. It adds some safety while you write code.
		1. Compiler warns you when trying to change the value of const variable
		2. Since a constant variable doesn't change
			1. It has only one state throughout the problem
				1. We need not track it's various states
		3. Improves readability of program
		4. It must be used generously to enforce pointer access restrictions while writing functions and function prototypes

## Pin-Read ##
### IO Pin Read Exercise ###
1. Exercise:
	1. Write a program which reads the sttus of the pin PA0. If the status of PA0 is LOW then turn off the on board LED (PD12) and if the status of PA0 is HIGH then turn on the LED.
	2. Change the status of PA0 pin manually by connecting between GND (0V) and VDD (3.3V) ponts of the board
2. Connect Jumper wire to PA0
	1. Connect the other end to GND - LED should turn off
	2. Connect the other end to VDD - LED should turn on
3. Points to consider:
	1. Check if PA0 is free I/O or not (Discovery - it is free)
		1. Check User Manual (free or it is used by other functionality)
			1. Table 6: STM32 pin description versus board functions
				1. Section **Extension Connectors**
					1. Free I/O - can be used for GPIO functionality
4. Hints:
	1. PA0 should be in input mode
	2. To read from pin PA0, code has to read PORT-A input data register

### IO Pin Read Exercise Implementation ###
1. My Solution:

		#include <stdint.h>
		#include <stdbool.h>
		
		#if !defined(__SOFT_FP__) && defined(__ARM_FP)
		  #warning "FPU is not initialized, but the project is compiling for an FPU. Please initialize the FPU before use."
		#endif
		static const int PORT_A_INPUT_REGISTER = 0x40020010;
		static const int PORT_A_OUTPUT_REGISTER = 0x40020014;
		static const int PORT_A_MODE_REGISTER = 0x40020000;
		static const int CLOCK_CONTROL_REGISTER = 0x40023830;
		static const int PORT_A_PULL_UP_OR_DOWN_REGISTER = 0x4002000C;
		
		typedef enum port {
			PORT_A = 0x01,
			PORT_B = 0x02,
			PORT_C = 0x04,
			PORT_D = 0x08,
			PORT_E = 0x010,
			PORT_F = 0x020,
			PORT_G = 0x040,
			PORT_H = 0x080
		} port;
		
		typedef enum port_pin {
			PORT_PIN_ZERO,
			PORT_PIN_ONE,
			PORT_PIN_TWO,
			PORT_PIN_THREE,
			PORT_PIN_FOUR,
			PORT_PIN_FIVE,
			PORT_PIN_SIX,
			PORT_PIN_SEVEN,
			PORT_PIN_EIGHT,
			PORT_PIN_NINE,
			PORT_PIN_TEN,
			PORT_PIN_ELEVEN,
			PORT_PIN_TWELVE,
			PORT_PIN_THIRTEEN,
			PORT_PIN_FOURTEEN,
			PORT_PIN_FIFTEEN
		} port_pin;
		
		typedef enum bit_num_32 {
			BIT_ZERO,
			BIT_ONE,
			BIT_TWO,
			BIT_THREE,
			BIT_FOUR,
			BIT_FIVE,
			BIT_SIX,
			BIT_SEVEN,
			BIT_EIGHT,
			BIT_NINE,
			BIT_TEN,
			BIT_ELEVEN,
			BIT_TWELVE,
			BIT_THIRTEEN,
			BIT_FOURTEEN,
			BIT_FIFTEEN,
			BIT_SIXTEEN,
			BIT_SEVENTEEN,
			BIT_EIGHTEEN,
			BIT_NINETEEN,
			BIT_TWENTY,
			BIT_TWENTY_ONE,
			BIT_TWENTY_TWO,
			BIT_TWENTY_THREE,
			BIT_TWENTY_FOUR,
			BIT_TWENTY_FIVE,
			BIT_TWENTY_SIX,
			BIT_TWENTY_SEVEN,
			BIT_TWENTY_EIGHT,
			BIT_TWENTY_NINE,
			BIT_THIRTY,
			BIT_THIRTY_ONE
		} bit_num_32;
		
		typedef enum port_mode {
			INPUT_MODE = 0x00, OUTPUT_MODE
		} port_mode;
		
		typedef enum bit_state {
			ZERO, ONE
		} bit_state;
		
		typedef enum pull_up_or_down_mode {
			NO_PULL_UP_OR_DOWN = 0x00, PULL_UP = 0x01, PULL_DOWN = 0x02, RESERVED = 0x03
		} pull_up_or_down_mode;
		
		typedef struct pin_value_pair {
			port_pin pin;
			bit_state state;
		} pin_value_pair;
		
		typedef struct pin_mode_pair {
			port_pin pin;
			port_mode mode;
		} pin_mode_pair;
		
		typedef struct pull_up_or_down_mode_pair {
			port_pin pin;
			pull_up_or_down_mode mode;
		} pull_up_or_down_mode_pair;
		
		int isActive(bit_state state);
		int getBitState(uint32_t registerValue, bit_num_32 bit);
		void setBit(uint32_t *const pointer_register, bit_num_32 bit);
		void clearBit(uint32_t *const pointer_register, bit_num_32 bit);
		void assignBits(uint32_t *const pointer_portModeRegister,
				pin_value_pair pairs[], uint8_t pairsSize);
		void setOrClearBitState(pin_value_pair pair,
				uint32_t *const pointer_portModeRegister);
		void configureMode(port_pin pin, uint32_t mode,
				uint32_t *const pointer_portModeRegister);
		void configurePortMode(uint32_t *const pointer_portModeRegister, port_pin pin,
				port_mode mode);
		void configurePortPullUpOrDownMode(uint32_t *const pointer_portModeRegister,
				port_pin pin, pull_up_or_down_mode mode);
		void enablePeripheralClock(uint32_t *const pointer_clockControlRegister,
				port portNum);
		void configurePeripheral(uint32_t *const pointer_clockControlRegister,
				uint32_t *const pointer_portAModeRegister, port portNum,
				pin_mode_pair pairs[], uint8_t pairsSize);
		void turnLEDOn(port_pin pinNum, uint32_t *const pointer_portOutputRegister);
		void turnLEDOff(port_pin pinNum, uint32_t *const pointer_portOutputRegister);
		uint32_t* const getAddress(const int location);
		bit_state readInputState(uint32_t *const pointer_InputRegister, port_pin pin);
		void turnLEDOnOrOff(uint32_t *const pointer_portAInputRegister, port_pin pin,
				uint32_t *const pointer_portAOutputRegister);
		
		int main(void) {
			uint32_t *const pointer_clockControlRegister = getAddress(
					CLOCK_CONTROL_REGISTER);
			uint32_t *const pointer_portAModeRegister = getAddress(
					PORT_A_MODE_REGISTER);
			uint32_t *const pointer_portAInputRegister = getAddress(
					PORT_A_INPUT_REGISTER);
			uint32_t *const pointer_portAOutputRegister = getAddress(
					PORT_A_OUTPUT_REGISTER);
			uint32_t *const pointer_portAPullUpOrDownRegister = getAddress(
					PORT_A_PULL_UP_OR_DOWN_REGISTER);
		
			pin_mode_pair portAPinZeroInputPair = { PORT_PIN_ZERO, INPUT_MODE };
			pin_mode_pair portAPinFiveOutputPair = { PORT_PIN_FIVE, OUTPUT_MODE };
			pin_mode_pair portAPinModePairs[] = { portAPinZeroInputPair,
					portAPinFiveOutputPair };
			uint8_t pairsSize = sizeof(portAPinModePairs)
					/ sizeof(portAPinModePairs[0]);
			configurePeripheral(pointer_clockControlRegister, pointer_portAModeRegister,
					PORT_A, portAPinModePairs, pairsSize);
		
			configurePortPullUpOrDownMode(pointer_portAPullUpOrDownRegister,
					PORT_PIN_ZERO, PULL_DOWN);
		
			turnLEDOnOrOff(pointer_portAInputRegister, PORT_PIN_FIVE,
					pointer_portAOutputRegister);
		}
		
		inline int getBitState(uint32_t registerValue, bit_num_32 bit) {
			return ((registerValue & (0x01 << bit)) >> bit);
		}
		
		inline uint32_t* const getAddress(const int location) {
			return (uint32_t* const ) location;
		}
		
		inline void setBit(uint32_t *const pointer_register, bit_num_32 bit) {
			*pointer_register |= (1 << bit);
		}
		
		inline void clearBit(uint32_t *const pointer_register, bit_num_32 bit) {
			*pointer_register &= ~(1 << bit);
		}
		
		inline void configurePortMode(uint32_t *const pointer_portModeRegister,
				port_pin pin, port_mode mode) {
			configureMode(pin, (uint32_t) mode, pointer_portModeRegister);
		}
		
		inline void configurePortPullUpOrDownMode(
				uint32_t *const pointer_portPullUpOrDownRegister, port_pin pin,
				pull_up_or_down_mode mode) {
			configureMode(pin, (uint32_t) mode, pointer_portPullUpOrDownRegister);
		}
		
		inline void configureMode(port_pin pin, uint32_t mode,
				uint32_t *const pointer_portModeRegister) {
			port_pin lowPin = (port_pin) (pin << 1);
			port_pin highPin = lowPin + 1;
			bit_state lowBitState = getBitState(mode, BIT_ZERO);
			bit_state highBitState = getBitState(mode, BIT_ONE);
			pin_value_pair lowPair = { lowPin, lowBitState };
			pin_value_pair highPair = { highPin, highBitState };
			pin_value_pair pairs[] = { lowPair, highPair };
			uint8_t pairsSize = sizeof(pairs) / sizeof(pairs[0]);
			assignBits(pointer_portModeRegister, pairs, pairsSize);
		}
		
		inline void enablePeripheralClock(uint32_t *const pointer_clockControlRegister,
				port portNum) {
			*pointer_clockControlRegister |= portNum;
		}
		
		inline void assignBits(uint32_t *const pointer_portModeRegister,
				pin_value_pair pairs[], uint8_t pairsSize) {
			for (uint8_t i = 0; i < pairsSize; i++)
				setOrClearBitState(pairs[i], pointer_portModeRegister);
		}
		
		inline void setOrClearBitState(pin_value_pair pair,
				uint32_t *const pointer_portModeRegister) {
			if (pair.state == ONE)
				setBit(pointer_portModeRegister, pair.pin);
			else
				clearBit(pointer_portModeRegister, pair.pin);
		}
		
		inline void configurePeripheral(uint32_t *const pointer_clockControlRegister,
				uint32_t *const pointer_portModeRegister, port portNum,
				pin_mode_pair pairs[], uint8_t pairsSize) {
			enablePeripheralClock(pointer_clockControlRegister, portNum);
			for (int i = 0; i < pairsSize; i++)
				configurePortMode(pointer_portModeRegister, pairs[i].pin,
						pairs[i].mode);
		}
		
		inline void turnLEDOn(port_pin pinNum,
				uint32_t *const pointer_portOutputRegister) {
			setBit(pointer_portOutputRegister, pinNum);
		}
		
		inline void turnLEDOff(port_pin pinNum,
				uint32_t *const pointer_portOutputRegister) {
			clearBit(pointer_portOutputRegister, pinNum);
		}
		
		inline int isActive(bit_state state) {
			return state == ONE;
		}
		
		inline bit_state readInputState(uint32_t *const pointer_InputRegister,
				port_pin pin) {
			return getBitState(*pointer_InputRegister, pin);
		}
		
		inline void turnLEDOnOrOff(uint32_t *const pointer_portAInputRegister,
				port_pin pin, uint32_t *const pointer_portAOutputRegister) {
			while (true)
				if (isActive(readInputState(pointer_portAInputRegister, PORT_PIN_ZERO)))
					turnLEDOn(pin, pointer_portAOutputRegister);
				else
					turnLEDOff(pin, pointer_portAOutputRegister);
		}
		
1. Instructor's solution:

		uint32_t *pPortAModeReg = (uint32_t *) 0x40020000 //see memory map
		uint32_t *pPortAInReg = (uint32_t *) 0x40020010 //see memory map

		// enable clock for GPIO D an GPIO A peripheral AHB1ENR (same for both)
		*pClkCtrlReg |= (1 << 3); // GPIO A
		*pClkCtrlReg |= (1 << 0); // GPIO D
		
		//configure PA0 as input mode (GPIOA MODE REGISTER)
		*pPortAModeReg &= ~(3 << 0);
		
		while (1) {
			//read the pin status of the pin PA0 (GPIOA INPUT DATA REGISTER)
			uint8_t pinStatus = (uint8_t) (*pPortAInReg & 0x01);
			
			
			if (pinStatus) {
				*pPortDOutReg |= (1 << 12);
			} else {
				*pPortDOutReg &= ~(1 << 12);
			}
		}
		
	1. Window > Show View > Variables

## Optimization ##
### Compiler Optimization and Flags ###
1. Program optimization
	1. Optimization is a series of actions taken by compiler on program's code generation process to reduce
		1. Number of instructions (code space optimization)
		2. Memory access time (time-space optimization)
		3. Power consumption
			1. The above two might help here
	2. By default, compiler doesn't invoke any optimization on program
	3. Optimization can be enabled using compiler flags
2. GCC compiler flags to enable optimization
	1. `-O0`
		1. No optimization
		2. Not recommended for production if you have limited code and ram space
		3. Has fast compilation time (no optimization algorithms invoked)
		4. Debugging friendly
			1. Used during development
				1. Since there is almost one to one map between source code and generated assembly instructions
		5. Code that works with `-O0` optimization may not work with `-O0`+ optimization levels (`-O1`, `-O2`, ...)
			1. Needs to be verified again
	2. `-O1`
		1. Moderate optimization to decrease memory access time and code space
	3. `-O2`
		1. Full optimization
		2. Slow compilation time (optimization algorithms are invoked)
		3. Not debugging friendly (there is no one to one mapping between source code and assembly instructions)
	4. `-O3`
		1. Full optimization of `-O2` + some more aggressive optimization steps will be taken by compiler
		2. Slowest compilation time
		3. May cause bugs in the program
			1. We may have to revisit the program and re-write the buggy portions
		4. Not debugging friendly
3. We need to work with different optimization levels to find out what works for us
	1. Code exercises in the course cosider only `-O0` optimization level

### Different Compiler Optimization Levels ###
1. PinRead program
	1. Right click > properties > C/C++ Build > Settings
	2. MCU GCC Compiler
		1. Optimization
			1. `-O1`
	3. Compile with `-O0` and check the code size
	4. Compile with `-O1` and check the code size (text section is smaller)
	5. Compile with `-O3` and check the code size
		1. Application should work
			1. Re-check if it still works with `-O3` optimization level
2. Whenever you change the optimization level, please do `clean` followed by `build`

### Analyzing Pin Read Exercise Disassembly with O0 and O2 ###
1. Code does not work with `-O2`
	1. Investigating this helps us understand about `volatile`
2. Open dis-assembly code
	1. First analyze for `-O0`
		1. For every loop the processor has to read the input register and update the variable
			1. Put a breakpoint and run
				1. Instruction stepping mode
		2. For each iteration of the loop, current value will be read from the peripheral register address (Input data register of GPIOA), and variable `pinStatus` will be updated
			1. Load and store are executed in every loop
	2. Next analyze for `-O2`
		1. in `-O2`, compiler generated the code in such a way that fresh value form peripheral register (input data register of GPIOA) is NOT read anymore for every iteration of the loop (optimization in time by doing less memory hits). But this breaks application
			1. Solution: We need to tell the compiler to not do any optimization on the statement (reading from register)

## 'volatile' Type Qualifier ##
### volatile and Effect of Optimization ###
1. Volatile
	1. Volatile is a type qualifier in 'C' used with variables
		1. It instructs compiler not to invoke any optimization on variable operation (read or write)
			1. It tells compiler that value of variable may change at any time with or without programmer's consent.
				1. Compiler turns off optimizing read-write operations on variables which are declared using `volatile` keyword
	2. It is very useful in embedded systems code
2. Example:
	1. New STM32 Project

			uint8_t data1;
			uint8_t data2;
			
			data1 = 50;
			data2 = data1;
			data2 = data1; // this can get removed by optimization algorithm
	
			for (;;);
			
		1. How to tell compiler not to optimize operations on certain variables?
			1. Use `volatile`

					uint8_t volatile data1;
					uint8_t volatile data2;
					// ...
					
				1. Compiler will not optimize operations on the variables

### When to Use volatile Qualifier? ###
1. When to use volatile qualifer?
	1. A variable must be declared using a volatile qualifier when there is a possibility of unexpected changes in the variable value
		1. Unexpected changes in the variable value may happen from within code or from outside code (from hardware)
			1. Unexpected changes may come from user
	2. Use volatile when code is dealing with below scenarios
		1. Memory-mapped peripheral registers of microcontrollers
		2. Multiple tasks accessing global variables (read/write) in an RTOS multithreaded application
		3. When a global variable is used to share data between main code and an ISR code
2. Case 1: volatile data

		uint8_t volatile my_data;
		volatile uint8_t my_data; // same as above
		
	1. `my_data` is a `volatile` variable of type `uint8_t`
3. Case 2: non-volatile pointer to volatile data

		uint8_t volatile *pStatusReg;
		
	1. `pStatusReg` is a non-volatile pointer, pointing to `volatile` data of type `uint8_t`
	2. Use case:
		1. Perfect case of accessing memory-mapped registers (used most frequently in embedded systems programming)
			1. Use it generously whenever you are accessing memory mapped registers in microcontroller code
		2. Data might change un-expectedly (no optimization for read/write operations done using the pointer)
4. Case 3: volatile pointer to non-volatile data (rarely used)

		uint8_t *volatile pStatusReg;
		
	1. `pStatusReg` is a `volatile` pointer, pointing to non-volatile data of type unsigned integer_8
5. Case 4: volatile pointer to volatile data (rarely used)

		uint8_t volatile *volatile pStatusReg;
		
	1. `pStatusReg` is a `volatile` pointer to `volatile` data of type unsigned integer_8
6. `const` and `volatile` can be applied to any declaration, including the ones of structures, unions, enumerated types or typedef names

### Using Volatile to Fix Issues with the Pin-Read Exercise ###
1. Fix:

		uint8_t pinStatus = (uint8_t)(*pPortAInReg & 0x1);
		
	1. We now have to tell copiler that DATA pointed to by the pointer may change at any time - not do any optimizations on DATA READ and DATA WRITE operations using the pointer

			uint32_t volatile *pPortAInReg = (uint32_t*) 0x40020010;

### Using 'volatile' with ISR Part-1 ###
1. When to use `volatile` qualifier?
	1. When a global variable is used to share data between main code and an ISR code
2. Example:

		uint8_t g_button_pressed = 0;
		...

		while (1) {
			// Disable interrupt
			*pEXTIMaskReg &= ~(1 << 0);
			
			if (g_button_pressed) {
				// Some delay until button debouncing gets over
				for (uint32_t i = 0; i < 500000/2; i++);
				g_button_press_count++;
				printf("Button is pressed %lu\n", g_button_press_count);
				g_button_pressed = 0;
			}
			
			// Enable interrupt
			*pEXTIMaskReg |= (1 << 0);
		}

		...
		/* This is button interrupt handler */
		void EXIT0_IRQHandler(void) {
			// Make this flag SET. if button pressed
			g_button_pressed = 1; // global flag
			*pEXITIPendReg |= (1 << 0);
		}
		
	1. Works only with `-O0`
	2. With `-O3` - it misbehaves

### Using 'volatile' with ISR Part-2 ###
1. Fix
	1. Use `volatile` for mem-mapped registers
	2. Make global flag `g_button_pressed` as `volatile`
	3. Compiler may remove the delay loop (because it is useless for speed)

			for (unit32_t volatile i = 0; i < 5000000/2; i++);

### Usage of const and volatile Together ###
1. `const` and `volatile` can be used together in variable declaration
	1. Example:

			uint8_t volatile *const pReg = (uint8_t*) 0x40000000; // pointer is guarded from unexpected changes, data may undergo un-expected changes
			uint8_t const volatile *const pReg = (uint8_t*) 0x40000000; // data can change un-expectadly but program must not change the data value
			
		1. `const` and `volatile` do not oppose each other
2. Case: Reading from read only buffer or address which is prone to unexpected change

		uint8_t const volatile *const pReg = (uint8_t*) 0x40000000;
		
	1. Data coming from external world
		1. Protocols
		2. Networks
		3. User pressing button
		4. ...
	2. Program should not modify it
3. Modify program accordingly

		uint32_t const volatile *const pPortAInReg = (uint32_t*) 0x40020010;

## Structures and Bit Fields ##
### Introduction to Structures ###
1. Structures in 'C'
	1. Structure is a data structure used to construct a user-defined data type in 'C'
	2. Structures allow us to combine data of different types
2. Creation of Structure

		struct tag_name {
			member_element-1;
			member_element-2;
			member_element-3;
			...
			member_element-n;
		};
		
	1. Syntax
	2. It is a record to club data of different data types
	3. `tag_name` - name of structure or record
	4. Body contains member elements
	5. Structure definition doesn't consume any memory. It just describes a record
3. Example:

		struct CarModel {
			unsigned int carNumber;
			uint32_t carPrice;
			uint16_t carMaxSpeed;
			float carWeight;
		};
		
	1. Data of different data types can be combined in a structure
4. Variables of a structure

		struct CarModel CarBMW, CarFord, CarHonda; // memory will be consumed when we construct structure variables
		
	1. `struct CarModel` - user define data type
	2. `CarBMW` - structure variable (14 bytes)
		1. Data type of `CarBMW` is `struct CarModel`
5. Initialization

		struct CarModel CarBMW = {2021, 15000, 220, 1330}; // C89 method. Order is important
		struct CarModel CarBMW = {.carNumber = 2021, .carWeight = 1330, .carMaxSpeed = 220, .carPrice = 15000}; // C99 method using designated initilizers
		
	1. Write a program to construct CarModel structure and instantiate 2 variables of type CarModel. Initilize the variables with below data and print them
		1. 2021, 15000, 220, 1330
		2. 4031, 35000, 160, 1900.96
	2. Solution:

			struct CarModel {
				uint32_t carNumber;
				uint32_t carWeight;
				uint8_t carMaxSpeed;
				float carPrice;
			};
			
			struct CarModel carBMW = {2021, 15000, 220, 1330};
			struct CarModel carHonda = {4031, 35000, 160, 1900.96};
			
			printf("%u, %u, %u, %f\n", carBMW.carNumber, carBMW.carWeight, carBMW.carMaxSpeed, carBMW.carPrice);
			printf("%u, %u, %u, %f\n", carHonda.carNumber, carHonda.carWeight, carHonda.carMaxSpeed, carHonda.carPrice);
			
		1. Struct definition is usually given outside a function
		2. Struct is better defined in a header file

### Accessing Structure Member Elements ###
3. Accessing structure members
	1. When a structure variable is created, use a `.` (dot) operator to access the member elements

			pritnf("Details of car BMW is as follows\n");
			printf("carNumber = %u\n", carBMW.carNumber);
			printf("carWeight = %u\n", carBMW.carWeight);
			printf("carMaxSpeed = %u\n", carBMW.carMaxSpeed);
			printf("carPrice = %u\n", carBMW.carPrice);
			
		1. Keeping it outside is traditional - since it is a record

				struct carModel const carFord = {4031, 35000, 160, 1900.96}; // each member will become const

### Sizeof of a Structure ###
1. `sizeof` - to check total memory consumed by struct

		struct carModel carBMW = {...};
		printf("Sizeof of struct carModel is %I64u\n", sizeof(struct carModel)); // not 14 bytes but 16 bytes - due to structure padding
		
	1. Suppose we have only one element - 1 byte
	2. Suppose we have two elements - 8 bytes

			uint8_t carSpeed; // 1 byte
			uint32_t carWeight; // 4 bytes
			// + padding = 3 bytes
	
### Aligned and Un-Aligned Data Storage ###
1. Aligned/ un-aligned data access
	1. For efficiency, compiler generates instructions to store variables on their natural size boundary addresses in memory
	2. This is also true for structures
		1. Fields in structure are located on natural size boundary
			1. What is natural size bounary?
			
					char  0403010 0403011 0403012 0403013 0403014 0403015
					// can be placed in any addresses
					short 0403010 0403012 0403014 0403016 0403018 040301A
					// stored only at addreses ending with 0, 2, 4, 8, ...
					int   0403010 0403014 0403018 040301C 0403020 0403024
					// stored only at addreses ending with 0, 4, 8, 1C, ...
					
				1. Compiler generates code that automatically aligns the data to the natural size boundaries
					1. Aligned data storage

### Structure Padding ###
1. Program

		struct DataSet
			char data1;
			int data2;
			char data3;
			short data4;
		};
		...
		struct DataSet data;
		data.data1 = 0x11;
		data.data2 = 0xFFFFEEEE;
		data.data3 = 0x22;
		data.data4 = 0xABCD;
		int8_t *ptr;
		ptr = (uint8_t*) &data; // struct DataSet *
		uint32_t totalSize = sizeof(struct DataSet);
		
		for (uint32_t i = 0; i < totalSize; i++) { // printing byte by byte
			printf("%p: %X\n", ptr, *ptr);
			ptr++;
		}
		
		printf("Sizeof of struct data is %I64u\n", sizeof(struct DataSet)); // 12 bytes - 4 bytes are for padding
		
	1. Output:

				0x7ffee6fd35d0: 11 // data1
				0x7ffee6fd35d1: 35
				0x7ffee6fd35d2: FD
				0x7ffee6fd35d3: E6
				0x7ffee6fd35d4: EE // data2 - natural size boundary starts here for int
				0x7ffee6fd35d5: EE // data2
				0x7ffee6fd35d6: FF // data2
				0x7ffee6fd35d7: FF // data2
				0x7ffee6fd35d8: 22 // data3
				0x7ffee6fd35d9: E1
				0x7ffee6fd35da: CD // data4 - natural size boundary starts here for short
				0x7ffee6fd35db: AB // data4
				Sizeof of struct data is 12
				
		1. This is aligned data storage
		2. Why?
			1. It becomes easier for processor to do read and write transactions with memory
				1. Less instructions dealing with memory
				2. Less bus transactions with memory
					1. Executaion perfiromance is improved with aligned memory
			2. Unaligned data access increases size of code
			3. Drawback: loss of memory due to padding
				1. If memory is precious, we can go with un-aligned data storage
					1. `gcc` attribute called `packed` structure can be used for un-aligning

### Calculating Structure Size Manually With and Without Padding ###
1. Structure padding

		struct data {
			char data1;
			int data2;
			char data3;
			short data4;
		};
		
		data-3|		|data-4|data-4|
		data-2|data-2|data-2|data-2|
		data-1|		|		|		|
		0		1		2		3		4
		
2. No padding:

		struct data {
			char data1;
			int data2;
			char data3;
			short data4;
		}__attribute__((packed));
		
		sizeof(struct data) = 8 bytes
		
		data-2|data-3|data-4|data-4| // data2 is split (not good for performance)
		data-1|data-2	|data-2|data-2|
		0		1		2		3		4

### Assembly Code Analysis of Packed and Non-Packed Structure ###
1. New project

		struct DataSet {
			char data1;
			int data2;
			char data3;
			short data4;
		};
		
		int main(void) {
			struct DataSet data;
			data.data1 = 0xAA;
			data.data2 = 0xFFFFEEEE;
			data.data3 = 0x55;
			data.data4 = 0xA5A5;
		}

	1. STRB - insruction to 'store a byte' into memory
		1. Used for byte
	2. STR - instruction to 'store a word' into memory (for instruction to work)
		1. Used for word
		2. The address must be word aligned
	3. STRH - instruction to 'store a half word' into memory
		1. The address must be half word aligned (for instruction to work)
2. Unaligned

		struct DataSet {
			char data1;
			int data2;
			char data3;
			short data4;
		}__attribute__((packed));
		
		int main(void) {
			struct DataSet data;
			data.data1 = 0xAA;
			data.data2 = 0xFFFFEEEE;
			data.data3 = 0x55;
			data.data4 = 0xA5A5;
		}
		
	1. Only `STRB` instructions are used (4 `STRB`s even for int)
		1. Multiple instructions are generated
			1. `STR` cannot be used because it can only be used with word aligned addresses
3. Using packed structure, we might save some memory
	1. Code size increases
	2. Processor needs to talk to memory multiple times
		1. Decreases performance
			1. Processor accessed memory only one time to store a word data but 4 times for packed data

### Typedef and Structure ###
1. `typedef` is used to give alias name to primitive and user defined data types

		typedef struct {
			unsigned int carNumber;
			uint32_t carPrice;
			uint16_t carMaxSpeed;
			float carWeight;
		} CarModel_t; // alias name
		
		CarModel_t carBMW, carFord; // struct is not required
		
2. `stdint.h` has many `typedef`s for primitive data types
3. `_t` - used for struct or primitive `typedef`
4. `_e` - used for enum `typedef`
5. Pascal case can be used as a convention (capital letter followed by other letters followed by `_t`)
6. Points:
	1. A structure type cannot contain itself as a member

			struct CarModel {
				unsigned int carNumber;
				uint32_t carPrice;
				uint16_t carMaxSpeed;
				float carWeight;
				struct CarModel carBMW; // Not allowed
			};
			
	2. Structure types can contain pointers to their own type
		1. Self-referential structures are used to implement linked lists and binary trees

				struct CarModel {
					unsigned int carNumber;
					uint32_t carPrice;
					uint16_t carMaxSpeed;
					float carWeight;
					struct CarModel *pCarBMW; // allowed
				};
				
	3. Nested structure (structure inside a structure)

			struct Data {
				char data1;
				int data2;
				char data3;
				short data4;
				struct {
					char data5;
					int data6;
				} modeData; // member element is of type struct
			};
			
			struct CarModel {
				unsigned int carNumber;
				uint32_t carPrice;
				uint16_t carMaxSpeed;
				float carWeight;
				struct {
					float temperature;
					float airPressure;
					int fuel;
				} carParameters;
			};
			
		1. The member elements are not tag names
		2. The member elements are not typedefs
			1. One does not have to give tagname but only variable name
				1. Syntax generally used for nested structures

### Structure and Pointers ###
1. Structures and pointers
	1. Constructing pointer variables of a structure
	2. Reading and writing data with member elements uisng structure pointers
2. Storage of a structure in memory
	1. Base address of structure in memory is also the address of the first member element
	2. Suppose we have to change the member element values using the base address of the structure variable

			uint8_t* ptr = (uint8_t*) &data;
			*ptr = 0x55;
			// modifying second element - how to increment? due to padding, we may add to wrong locations
			
		1. Solution:

				// pData is a pointer variable of type struct DataSet*
				struct DataSet *pData;
				
				// pData now holds the address of structure variable data
				pData = &data;
				
				// changing the value of data1 member element
				pData->data1 = 0x55; // *(address_of_first_member_element_data1) = 0x55;
				
			1. `->` - dereferencing operator when you use structure variable of pointer type
			2. `.` - for non-pointer type structure variable
3. Example:

		struct DataSet {
			char data1;
			int data2;
			char data3;
			short data4;
		};
		
		int main(void) {
			struct DataSet data;
			
			data.data1 = 0x11;
			data.data2 = 0xFFFFEEEE;
			data.data3 = 0x22;
			data.data4 = 0xABCD;
			
			printf("data.data1 = %d\n", data.data1);
			
			struct DataSet *pData;
			pData = &data;
			
			pData->data1 = 0x55;
			
			printf("data.data1 = %d\n", data.data1);
			
			return 0;
		}
		
	1. Why use pointer?
		1. For passing structures around to other functions
		2. Exmple:

				displayMemberElements(&data); // pass by reference
				//...
				void displayMemberElements(struct DataSet* pData) {
					printf("data1 = %X\n", pData->data1);
				}
				
			1. Pass by reference - only address is passed
			2. Pass by value - the entire structure is copied to new function parameter

					displayMemberElements(data);
					//...
					void displayMemberElements(struct DataSet data) {
						printf("data1 = %X\n", data.data1);
					}

### Structure Exercise ###
1. Write a program to decode a given 32 bit packet information and print the values of different fields. Construct a structure with member elements as packet fields as shown below

		ADDR_MODE SHORT_ADDR				             STATUS
			[][		][	LONG_ADDR	][ SENSOR ][BAT][PAYLOAD][][ CRC ]
			1 bit 2 bits  8 bits   3 bits   3 bits 12 bits 1 bit 2 bits
			
	1. Structure

			struct Packet {
				crc;
				status;
				payload;
				bat;
				sensor;
				longAddr;
				shortAddr;
				addrMode;
			};
			
		1. Solution:

				struct Packet {
					uint8_t crc;
					uint8_t status;
					uint16_t payload;
					uint8_t bat;
					uint8_t sensor;
					uint8_t longAddr;
					uint8_t shortAddr;
					uint8_t addrMode;
				};
				// ...
				struct Packet packet;
				packet.crc = (uint8_t) (input & 0x03);
				packet.status = (uint8_t) ((input & (0x01 << 2)) >> 2);
				packet.payload = (uint16_t) ((input & (0x0FFF << 3)) >> 3);
				packet.bat = (uint8_t) ((input & (0x07 << 15)) >> 15);
				packet.sensor = (uint8_t) ((input & (0x07 << 18)) >> 18);
				packet.longAddr = (uint8_t) ((input & (0x0FF << 21)) >> 21);
				packet.shortAddr = (uint8_t) ((input & (0x03 << 29)) >> 29);
				packet.addrMode = (uint8_t) ((input & (0x01 << 31)) >> 31);
				
				printf("crc\t\t: 0x%hhX\n", packet.crc);
				printf("status\t\t: 0x%hhX\n", packet.status);
				printf("payload\t\t: 0x%hX\n", packet.payload);
				printf("bat\t\t: 0x%hhX\n", packet.bat);
				printf("sensor\t\t: 0x%hhX\n", packet.sensor);
				printf("longAddr\t: 0x%hhX\n", packet.longAddr);
				printf("shortAddr\t: 0x%hhX\n", packet.shortAddr);
				printf("addrMode\t: 0x%hhX\n", packet.addrMode);

### Structure Exercise Implementation ###
1. 4 bytes need 10 bytes to store with this approach
2. Bit fields can minimize structure memory consumption

### Structure and Bit Fields ###
1. Bit fields can be extracted and stored in a variable

		uint32_t crc: 2; // full length has to be considered
		uint32_t status: 1;
		uint32_t payload: 12;
		uint32_t bat: 3;
		...
		
	1. The fields will be refering to bits of same memory location
		
2. New project

		struct Packet {
			uint32_t crc			:2;
			uint32_t status		:1;
			uint32_t payload		:12;
			uint32_t bat			:3;
			uint32_t sensor		:3;
			uint32_t longAddr	:8;
			uint32_t shortAddr	:2;
			uint32_t addrMode	:1;
		};
		
	1. Rest of the code is same
	2. Heavily used in networking activities
	3. Order doesn't not matter (order in memory gets changed)

### Structure and Bit Fields Contd. ###
1. Example: Structure named "CarDetails" which comprises below info
	1. Car max speed (Max 400 Km/h) (7 bits)
	2. Car weight in Kgs (Max 5000 Kg) (13 bits)
	3. Car color (an ASCII code of color) (7 bits)
	4. Car price in USD (Max 100,000,000) (28 bits)
2. Solution:

		struct CarDetails {
			uint32_t speed		: 7;
			uint32_t weight		: 13;
			uint32_t color		: 7;
			uint32_t price_l		: 5; // lower 5 bits of the price - 32 bit boundary
			uint32_t price_h		: 23: // higher 23 bits of hte price
		};
		
		struct CarDetails {
			uint32_t speed		: 7;
			uint32_t weight		: 13;
			uint32_t color		: 7;
			uint32_t price;
		}; // same mem consumption as above
		
## Unions ##
### Unions ###
1. A union in 'C' is similar to structure except that all of it's members start at the same location in memory
2. A union variable can represent the value of only one of its members at a time
3. Example:

		union address {
			uint16_t shortAddr;
			uint32_t longAddr;
		};
		
		// size is size of biggest member element
		
		0xE00	0xE01	0xE02	0xE03
		
	1. Use cases:
		1. use unions instead of strucutre to save memory when access to its member elements is mutually exclusive
			1. Example: sending packets using either long address or short address (both are not used at the same time)
4. Example:

		#include <stdio.h>
		#include <stdint.h>
		
		union Address {
			uint16_t shortAddr;
			uint32_t longAddr;
		};
		
		int main() {
			union Address addr;
			addr.shortAddr = 0xABCD;
			addr.longAddr = 0xEEEECCCC;
			
			printf("short addr = %#X\n", addr.shortAddr);
			printf("long addr = %#X\n", addr.longAddr);
			
			return 0;
		}
		
5. Storage

		0xE00 0xE01 0xE02 0xE03 0xE04 0xE05 0xE06 0xE07
		D     C     B     A
		C     C     C     C     E     E     E     E

6. Use it when access to variables are mutually exclusive

### Applicability of Unions ###
1. Applicability of unions in Embedded System Code
	1. Bit extraction
	2. Storing mutually exclusive data thus saving memory
2. Open Packet code

		union Packet { // size is 4 bytes
			uint32_t packetValue;
			
			struct {
				uint32_t crc			:2;
				uint32_t status		:1;
				uint32_t payload		:12;
				uint32_t bat			:3;
				uint32_t sensor		:3;
				uint32_t longAddr	:8;
				uint32_t shortAddr	:2;
				uint32_t addrMode	:1;
			} packetFields;
		}
		//...
		union Packet packet;
		//...
		scanf("%X", &packet.packetValue);
		//...
		printf("crc		:%#x\n", packet.packetFields.crc);
		//...

## Usage of Bit-Fields in Embedded Code ##
### Bit-Fields Exercise: Constructing Bit-Field Structure for Peripheral Registers ###
1. LED Toggle
	1. Why?
		1. For abstraction
			1. Suppose we are writing middleware stack - we cannot tell user to use user manual (we need abstraction - simple interface)
2. Similar structure needs to be created for bitfields
	1. RCC AHB1 (RCC_AHB1ENR)
		1. We can convert this register info into structure with bit fields
	2. Constructing bit-field strcuture for peripheral registers

			typedef struct {
				uint32_t gpio_a_en			:1; // 0
				uint32_t gpio_b_en			:1; // 1
				uint32_t gpio_c_en			:1; // 2
				uint32_t gpio_d_en			:1; // 3
				uint32_t gpio_e_en			:1; // 4
				uint32_t gpio_f_en			:1; // 5
				uint32_t gpio_g_en			:1; // 6
				uint32_t gpio_h_en			:1; // 7
				uint32_t const reserved_0	:1; // 8
				uint32_t const reserved_1	:1; // 9
				uint32_t const reserved_2	:1; // 10
				uint32_t const reserved_3	:1; // 11
				uint32_t crc_en				:1; // 12
				uint32_t const reserved_4	:1; // 13
				uint32_t const reserved_5	:1; // 14
				uint32_t const reserved_6	:1; // 15
				uint32_t const reserved_7	:1; // 16
				uint32_t const reserved_8	:1; // 17
				uint32_t bkp_sramen_en		:1; // 18
				uint32_t const reserved_9	:1; // 19
				uint32_t const reserved_10	:1; // 20
				uint32_t dma_1_en			:1; // 21
				uint32_t dma_2_en			:1; // 22
				uint32_t const reserved_11	:1; // 23
				uint32_t const reserved_12	:1; // 24
				uint32_t const reserved_13	:1; // 25
				uint32_t const reserved_14	:1; // 26
				uint32_t const reserved_15	:1; // 27
				uint32_t const reserved_16	:1; // 28
				uint32_t otghs_en			:1; // 29
				uint32_t otghs_ulpen		:1; // 30
				uint32_t const reserved_17	:1; // 31
			} RCC_AHB1ENR_t;
			
			31 30		29    ... 22   21  ... 18 ... 12 ... 7 
			   OTGHS  OTGHS     DMA2 DMA1    BKP    CRC    GPIOH
			   ULPIEN EN        EN   EN      SRAMEN EN     EN
			   rw     rw        rw   rw      rw     rw     rw
			   
			6     5     4     3     2     1     0
			GPIOG GPIOF GPIOE GPIOD GPIOC GPIOB GPIOA
			EN    EN    EN    EN    EN    EN    EN
			rw    rw    rw    rw    rw    rw    rw
			
		1. Convention: `PERIPHERALNAME_REGISTERNAME_t`
	3. Different bit field structures for different peripheral registers

			typedef struct {
				uint32_t moder_0		:2; // [0, 1]
				uint32_t moder_1		:2; // [2, 3]
				uint32_t moder_2		:2; // [4, 5]
				uint32_t moder_3		:2; // [6, 7]
				uint32_t moder_4		:2; // [8, 9]
				uint32_t moder_5		:2; // [10, 11]
				uint32_t moder_6		:2; // [12, 13]
				uint32_t moder_7		:2; // [14, 15]
				uint32_t moder_8		:2; // [16, 17]
				uint32_t moder_9		:2; // [18, 19]
				uint32_t moder_10	:2; // [20, 21]
				uint32_t moder_11	:2; // [22, 23]
				uint32_t moder_12	:2; // [24, 25]
				uint32_t moder_13	:2; // [26, 27]
				uint32_t moder_14	:2; // [28, 29]
				uint32_t moder_15	:2; // [30, 31]
			} GPIOx_MODER_t;
			
			MODER15[1:0] MODER14[1:0] MODER13[1:0] MODER12[1:0]
			31 30        29 28        27 26        25 24
			rw rw        rw rw        rw rw        rw rw
			
			MODER11[1:0] MODER10[1:0] MODER9[1:0] MODER8[1:0]
			23 22        21 20        19 18       17 16        
			rw rw        rw rw        rw rw       rw rw
			
			MODER7[1:0] MODER6[1:0] MODER5[1:0] MODER4[1:0]
			15 14        13 12        11 10        9  8
			rw rw        rw rw        rw rw        rw rw
			
			MODER3[1:0] MODER2[1:0] MODER1[1:0] MODER0[1:0]
			7  6         5  4         3  2        1  0        
			rw rw        rw rw        rw rw       rw rw
			
			typedef struct {
				uint16_t odr_0				:1 // 0
				uint16_t odr_1				:1 // 1
				uint16_t odr_2				:1 // 2
				uint16_t odr_3				:1 // 3
				uint16_t odr_4				:1 // 4
				uint16_t odr_5				:1 // 5
				uint16_t odr_6				:1 // 6
				uint16_t odr_7				:1 // 7
			} GPIOx_ODR_t
			
			31  30  29  28  27  26  25  24  23  22  21  20  19  18  17
			res res res res res res res res res res res res res res res
			
			16  15    14    13    12    11    10    9    8    7    6   
			res ODR15 ODR14 ODR13 ODR12 ODR11 ODR10 ODR9 ODR8 ODR7 ODR6 
			
			5    4    3    2    1    0
			ODR5 ODR4 ODR3 ODR2 ODR1 ODR0
			
3. Keep the structures in header file: `main.h`

		#ifndef MAIN_H_
		#define MAIN_H_
		
		typedef struct {
			uint32_t gpio_a_en			:1; // 0
			uint32_t gpio_b_en			:1; // 1
			uint32_t gpio_c_en			:1; // 2
			uint32_t gpio_d_en			:1; // 3
			uint32_t gpio_e_en			:1; // 4
			uint32_t gpio_f_en			:1; // 5
			uint32_t gpio_g_en			:1; // 6
			uint32_t gpio_h_en			:1; // 7
			uint32_t const reserved_0	:1; // 8
			uint32_t const reserved_1	:1; // 9
			uint32_t const reserved_2	:1; // 10
			uint32_t const reserved_3	:1; // 11
			uint32_t crc_en				:1; // 12
			uint32_t const reserved_4	:1; // 13
			uint32_t const reserved_5	:1; // 14
			uint32_t const reserved_6	:1; // 15
			uint32_t const reserved_7	:1; // 16
			uint32_t const reserved_8	:1; // 17
			uint32_t bkp_sramen_en		:1; // 18
			uint32_t const reserved_9	:1; // 19
			uint32_t const reserved_10	:1; // 20
			uint32_t dma_1_en			:1; // 21
			uint32_t dma_2_en			:1; // 22
			uint32_t const reserved_11	:1; // 23
			uint32_t const reserved_12	:1; // 24
			uint32_t const reserved_13	:1; // 25
			uint32_t const reserved_14	:1; // 26
			uint32_t const reserved_15	:1; // 27
			uint32_t const reserved_16	:1; // 28
			uint32_t otghs_en			:1; // 29
			uint32_t otghs_ulpen		:1; // 30
			uint32_t const reserved_17	:1; // 31
		} RCC_AHB1ENR_t;
		
		typedef struct {
			uint32_t moder_0		:2; // [0, 1]
			uint32_t moder_1		:2; // [2, 3]
			uint32_t moder_2		:2; // [4, 5]
			uint32_t moder_3		:2; // [6, 7]
			uint32_t moder_4		:2; // [8, 9]
			uint32_t moder_5		:2; // [10, 11]
			uint32_t moder_6		:2; // [12, 13]
			uint32_t moder_7		:2; // [14, 15]
			uint32_t moder_8		:2; // [16, 17]
			uint32_t moder_9		:2; // [18, 19]
			uint32_t moder_10	:2; // [20, 21]
			uint32_t moder_11	:2; // [22, 23]
			uint32_t moder_12	:2; // [24, 25]
			uint32_t moder_13	:2; // [26, 27]
			uint32_t moder_14	:2; // [28, 29]
			uint32_t moder_15	:2; // [30, 31]
		} GPIOx_MODER_t; // can be used with any mode register
		
		typedef struct {
			uint16_t odr_0				:1; // 0
			uint16_t odr_1				:1; // 1
			uint16_t odr_2				:1; // 2
			uint16_t odr_3				:1; // 3
			uint16_t odr_4				:1; // 4
			uint16_t odr_5				:1; // 5
			uint16_t odr_6				:1; // 6
			uint16_t odr_7				:1; // 7
		} GPIOx_ODR_t;
		
		#endif MAIN_H_
 
### Bit-Field Structure for RCC_AHB1ENR ###
### Bit-Field Structure for GPIOx_ODR ###
### Modifying LED Toggle Exercise with Structures and Bit Fields ###
1. Configuration

		GPIOx_MODE_t *pGpiodMode; // ponter to struct
		pGpiodMode = (GPIOx_MODE_t*) 0x40020C00; // address of mem-mapped register
		
		pGpiodMode->pin_0 = 1; // member elements can be accessed directly
		pGpiodMode->pin_1 = 1;
		pGpiodMode->pin_15 = 1;
		
	1. Internally compiler converts the above statement to the following statement

			*(0x40020C00) |= (3 << 30); // compiler will take care of bit manipulation
			
2. Program:

		#include "math.h"
		
		int main(void) {
			RCC_AHB1ENR_t volatile *const pClkCtrlReg = (RCC_AHB1ENR_t*) 0x40023830;
			GPIOx_MODER_t volatile *const pPortDModeReg = (GPIOx_MODER_t*) 0x4002;
			GPIOx_ODR_t volatile *const pPortDOutReg = (GPIOx_ODR_t*) 0x4002
			
			// 1. enable clock for GPIOD peripheral in the AHB1ENR register
			pClkCtrlReg->gpiod_en = 1; // even this can be bastracted - using enum say
			
			// 2. configure the mode of the IO pin as output
			pPortDModeReg->pin_12 = 1;
			
			while (1) {
				// Set 12th bit of output data register to make I/O pin-12 as HIGH
				pPortDOutReg->pin_12 = 1;
				
				// introduce small human observable delay
				// This loop executes for 300k times
				for (uint32_t i = 0; i < 300000; i++);
				
				// Set 12th bit of output data register to make I/O pin-12 as LOW
				pPortDOutReg->pin_12 = 0;
				
				// introduce small human observable delay
				// This loop executes for 300k times
				for (uint32_t i = 0; i < 300000; i++);
			}
		}

### Testing ###
1. Debug and check in SFRs window that the bit is set

## Keypad Interfacing ##
### Keypad Interfacing ###
1. 4x4 keypad interfacing
	1. If you want to reproduce the project you would need
		1. 1 4x4 matrix keypad
		2. Few jumper wires to do connections
2. Problem: Write a program which detects and prints key pressed
3. 8 pins keypad
	1. Connections
		1. First four pins are row pins
		2. Last four pins are column pins
	2. Internal Connections

					C1		C2		C3		C4
			    x--|      |
			R1 -|- | ---- | ---- ...
			       |      |
			R2 -|- | ---- | ---- ...
			       |      |
			R3 ... |      |
			       |      |
			R4     |      |
			
		1. When no key is pressed, coluns and rows are completely isolated
		2. When key is pressed
			1. Column and row come into contact
				1. This must be detected in the program
			2. Use logic to decide which key was pressed
		3. Columns are inputs (input mode)
			1. Microcontroller reads C1, C2, C3 and C4 to detect key press
		4. Rows are outputs (output mode)
4. How to connect to microcontroller
	1. Check 8 free IOs
		1. C1 - PD8 (input mode)
		2. C2 - PD9 (input mode)
		3. C3 - PD10 (input mode)
		4. C4 - PD11 (input mode)
		5. R1 - PD0 (output mode)
		6. R2 - PD1 (output mode)
		7. R3 - PD2 (output mode)
		8. R4 - PD3 (output mode)
	2. Pull up resistors are required for columns
		1. 22K resistors are used internally
			1. Modern microcontrollers come with pull up and pull down functionality

### Why Pull-Up Resistors? ###
1. Description:

		       i/o
		MCU -*-----+
		 |      __ | C1
		 *    +-  -+ ---> floating (open)
		 |    |    |
		 +----*--- | --+ 
		     R1    |   |
		              _|_
		               -
		          
	1. If pin is floating, it pick pick up random noice of circuit and can fluctuate between high and low
		1. If we read a floating pin
			1. It sometime shows high and sometime shows low
	2. If we want to read from a pin, always avoid floating state
		1. Give proper initial state
			1. Two options
				1. Pull up - connected to +VDD (3.3V in this case) and 22 k ohm resistor (HIGH initial state)
					1. Resistor value shold be very high (22K or more)
				2. Pull down
	3. If key is pressed
		1. We need to make R1 grounded
			1. C1 will get grounded

### Detecting Key Press Event ###
1. When no key is pressed C1, C2, C3, C4 read HIGH
2. Logic
	1. Scan for keys row by row one at a time
	2. Steps:
		1. R1 is make LOW (R2, R3 and R4 are made HIGH)
		2. If key '2' is pressed
			1. C2 will be pulled down to low
		3. C2 will be read as LOW (C2, C3, and C4 will be HIGH)
	3. So, when R1 is LOW, if C2 reads LOW, then conclude that key '2' is pressed
		4. Now R2 is made LOW
		5. Repeat the steps
3. Implementation flow chart
	1. Download flowchart

### Flow Chart for Implementation ###
1. Keep all row GPIOs in OUTPUT mode & all column GPIOs in INPUT mode
	1. PA0 - PA3 - Output
	2. PA4 - PA7 - Input
2. Make R1 LOW state
	1. R1 = 0, R2 = 1, R3 = 1, R4 = 1
	2. Read C1
		1. If LOW - print '1'
			1. Give 200 ms delay  between detecting and printing (for debouncing - to avoid continuous detection of the key)
				1. What is button debouncing?
					1. When we press a key, there will be a metal contact
						1. Assuming user takes ~ 100 to 200ms to press and release the button
							1. There will be a bouncing pattern between high and low
								1. When user has pressed and released, the time is spent by software in busy loop (after detection) (approximate delay is enough)
	3. Read C2 and repeat the above steps
3. Make R2 low
	1. R1 = 1, R2 = 0, R3 = 1, R4 = 1
	2. Repeat the above steps for C1, C2, C3 and C4
4. Repeat the steps for R3 and R4
5. Repeat from R1 again
6. Implementation:
	1. Step 1
		1. Find out free IOs available on target board pin headers
		2. Decide which are IO pins you are going to use to handle rows and columns of keypad
	2. Step 2
		1. Define required pointer variables to handle memory-mapped registers
		2. Initialize pointer variables with appropriate memory-mapped register addresses
		3. Make use of type qualifiers such as `volatile` if memory-mapped register access is involved
	3. Step 3
		1. Initialization
			1. Make all row IOs mode as OUTPUT
			2. Make all column IOs mode as INPUT
			3. Activate internal pull-up resistors for all column IOs (refer to the pull-up/pull-down enable register)
				1. GPIO port pull-up/pull-down register (01 - pull-up)
	4. Step 4
		1. Implement key detect logic as per flow chart
7. Bit manipulation is sufficient to code this
8. Later use bit fields and structure

### Keypad Key Read Code Implementation ###
1. My solution:

		int main() {
			RCC_AHB1ENR_t volatile *const pointer_ClockStatusRegister = (RCC_AHB1ENR_t volatile *const) RCC_AHB1ENR_ADDRESS;
			GPIOx_MODER_t volatile *const pointer_modeRegister = (GPIOx_MODER_t volatile *const) GPIOx_MODER_ADDRESS;
			GPIOx_IDR_t volatile *const pointer_inputDataRegister = (GPIOx_IDR_t volatile *const) GPIOx_IDR_ADDRESS;
			GPIOx_ODR_t volatile *const pointer_outputDataRegister = (GPIOx_ODR_t volatile *const) GPIOx_ODR_ADDRESS;
			
			pointer_ClockStatusRegister->gpio_a_en = ENABLE;
			pointer_modeRegister->moder_0 = OUTPUT; // R1
			pointer_modeRegister->moder_1 = OUTPUT; // R2
			pointer_modeRegister->moder_2 = OUTPUT; // R3
			pointer_modeRegister->moder_3 = OUTPUT; // R4
			pointer_modeRegister->moder_4 = INPUT;  // C1
			pointer_modeRegister->moder_5 = INPUT;  // C2
			pointer_modeRegister->moder_6 = INPUT;  // C3
			pointer_modeRegister->moder_7 = INPUT;  // C4
			
			while (true) {
				pointer_outputDataRegister->odr_0 = LOW;
				pointer_outputDataRegister->odr_1 = HIGH;
				pointer_outputDataRegister->odr_2 = HIGH;
				pointer_outputDataRegister->odr_3 = HIGH;
				state = pointer_inputDataRegister->odr_4;
				softwareDelay(DEBOUNCE_DELAY);
				if (state == LOW)
					printf("%u\n", 0);
				state = pointer_inputDataRegister->odr_5;
				softwareDelay(DEBOUNCE_DELAY);
				if (state == LOW)
					printf("%u\n", 1);
				state = pointer_inputDataRegister->odr_6;
				softwareDelay(DEBOUNCE_DELAY);
				if (state == LOW)
					printf("%u\n", 2);
				state = pointer_inputDataRegister->odr_7;
				softwareDelay(DEBOUNCE_DELAY);
				if (state == LOW)
					printf("%u\n", 3);
					
				pointer_outputDataRegister->odr_0 = HIGH;
				pointer_outputDataRegister->odr_1 = LOW;
				pointer_outputDataRegister->odr_2 = HIGH;
				pointer_outputDataRegister->odr_3 = HIGH;
				state = pointer_inputDataRegister->odr_4;
				softwareDelay(DEBOUNCE_DELAY);
				if (state == LOW)
					printf("%u\n", 4);
				state = pointer_inputDataRegister->odr_5;
				softwareDelay(DEBOUNCE_DELAY);
				if (state == LOW)
					printf("%u\n", 5);
				state = pointer_inputDataRegister->odr_6;
				softwareDelay(DEBOUNCE_DELAY);
				if (state == LOW)
					printf("%u\n", 6);
				state = pointer_inputDataRegister->odr_7;
				softwareDelay(DEBOUNCE_DELAY);
				if (state == LOW)
					printf("%u\n", 7);
					
				pointer_outputDataRegister->odr_0 = HIGH;
				pointer_outputDataRegister->odr_1 = HIGH;
				pointer_outputDataRegister->odr_2 = LOW;
				pointer_outputDataRegister->odr_3 = HIGH;
				state = pointer_inputDataRegister->odr_4;
				softwareDelay(DEBOUNCE_DELAY);
				if (state == LOW)
					printf("%u\n", 8);
				state = pointer_inputDataRegister->odr_5;
				softwareDelay(DEBOUNCE_DELAY);
				if (state == LOW)
					printf("%u\n", 9);
				state = pointer_inputDataRegister->odr_6;
				softwareDelay(DEBOUNCE_DELAY);
				if (state == LOW)
					printf("%u\n", 10);
				state = pointer_inputDataRegister->odr_7;
				softwareDelay(DEBOUNCE_DELAY);
				if (state == LOW)
					printf("%u\n", 11);
					
				pointer_outputDataRegister->odr_0 = HIGH;
				pointer_outputDataRegister->odr_1 = HIGH;
				pointer_outputDataRegister->odr_2 = HIGH;
				pointer_outputDataRegister->odr_3 = LOW;
				state = pointer_inputDataRegister->odr_4;
				softwareDelay(DEBOUNCE_DELAY);
				if (state == LOW)
					printf("%u\n", 12);
				state = pointer_inputDataRegister->odr_5;
				softwareDelay(DEBOUNCE_DELAY);
				if (state == LOW)
					printf("%u\n", 13);
				state = pointer_inputDataRegister->odr_6;
				softwareDelay(DEBOUNCE_DELAY);
				if (state == LOW)
					printf("%u\n", 14);
				state = pointer_inputDataRegister->odr_7;
				softwareDelay(DEBOUNCE_DELAY);
				if (state == LOW)
					printf("%u\n", 15);
			}
		}
		
1. Instructor's solution:

		uint32_t volatile *const pGPIODModeReg = (uint32_t*) 0x40020C00;
		uint32_t volatile *const pInputDataReg = (uint32_t*) (0x40020C00 + 0x10);
		uint32_t volatile *const pOutputDataReg = (uint32_t*) (0x40020C00 + 0x14);
		uint32_t volatile *const pClocktrlReg = (uint32_t*) (0x40020C00 + 0x30);
		uint32_t volatile *const pPullUpDownReg = (uint32_t*) (0x40020C00 + 0x0C);
		
		// Enable peripheral clock of GPIOD peripheral
		*pClockCtrlReg |= (1 << 3);
		
		// Configure PD0, PD1, PD2, PD3 as output (rows)
		*pGPIODModeReg &= ~(0xFF); // clear
		*pGPIODModeReg |= 0x55; // set
		
		// Configure PD8, PD9, PD10, PD11 as input (columns)
		*pGPIODModeReg &= ~(0xFF << 16);
		
		// Enable internal pull-up resistors for PD8, PD9, PD10, PD11
		*pPullUpDownReg &= ~(0xFF << 16);
		*pPullUpDownReg |= 0x55;
		
		// make all rows HIGH
		*pOutputDataReg |= 0x0f;
		
		// make R1 LOW (PD0)
		*pOutputDataReg &= ~(1 << 0);
		
		// scan the columns
		// check C1 (PD8) low or high
		if (!(*pInputDataReg & (1 << 8))) {
			// key is pressed
			delay();
			printf("1\n");
		}
		
		// check C2 (PD9) low or high
		if (!(*pInputDataReg & (1 << 9))) {
			// key is pressed
			delay();
			printf("2\n");
		}
		
		// check C3 (PD10) low or high
		if (!(*pInputDataReg & (1 << 10))) {
			// key is pressed
			delay();
			printf("3\n");
		}
		
		// check C4 (PD11) low or high
		if (!(*pInputDataReg & (1 << 11))) {
			// key is pressed
			delay();
			printf("4\n");
		}
		
		// make R1 LOW (PD0)
		*pOutputDataReg |= (1 << 0);
		// make R2 LOW (PD1)
		*pOutputDataReg &= ~(1 << 0);
		
		// scan the columns
		// check C5 (PD12) low or high
		if (!(*pInputDataReg & (1 << 12))) {
			// key is pressed
			delay();
			printf("5\n");
		}
		
		// check C6 (PD13) low or high
		if (!(*pInputDataReg & (1 << 13))) {
			// key is pressed
			delay();
			printf("6\n");
		}
		
		// check C7 (PD14) low or high
		if (!(*pInputDataReg & (1 << 14))) {
			// key is pressed
			delay();
			printf("7\n");
		}
		
		// check C8 (PD15) low or high
		if (!(*pInputDataReg & (1 << 15))) {
			// key is pressed
			delay();
			printf("8\n");
		}
		...

### Delay Analysis ###
1. delay

		void delay(void) {
			for (uint32_t i = 0; i < 300000; i++);
		}
		
	1. Debug using instruction level debugger - 7 instructions are executed
		1. 16 Mhz - RC oscillator
		2. 7 instructions = 7 * 0.0625 = 0.4375 ~ 0.5 micro seconds
		3. 2000 - 1 ms
		4. 150 ms - 150 x 300k

## Arrays ##
### Arrays in 'C' ###
1. Problem Statement
	1. Suppose we want to find average age of a class of 100 students

			avgStudentAge = (ageOfStudent1 + ageOfStudent2 + ... + ageOfStudent100) / 100
			
			uint8_t ageOfStudent1 = 45;
			...
			uint8_t ageOfStudent100 = 32;
			
2. The definitions can be merged into single statement

		uint8_t studentsAge[100]; // name is a reference
		
	1. Array in 'C' is a collection of data of same datatype
3. Understanding Array Syntax:
	1. Here `studentsAge` is base pointer or reference to 100 data items of type `uint8_t`

			uint8_t studentsAge[100]; // studentsAge - reference or array variable or pointer
			
		1. `studentsAge` is `uint8_t*` and not `uint8_t`
			1. Items are of type `uint8_t`
	2. Size of an array

			uint8_t studentsAge[100];
			
		1. Total memory consumed by array in memroy = number of data items x size of single data item = 100 x 1 = 100 bytes
		
				sizeof(studentsAge) = 100
				
4. Program

		#include <stdio.h>
		#include <stdint.h>
		
		int main(void) {
			uint32_t studentsAge[100];
			printf("Size of an array = %u\n", sizeof(studentsAge));
			return 0;
		}
		
5. Array storage in memory

		uint8_t studentsAge[100];
		
		34     11     99         45         19     56
		0xE005 0xE006 0xE007 ... 0xE035 ... 0xE067 0xE068 ...
		
	1. Try printing `studentsAge` with `%p` format specifier - base address gets printed
	2. Data will be stored in contiguous memory locations in the memory
	3. `studentsAge` holds base address of array in memory

			printf("Base address of the array = %p\n", studentsAge);
			
		1. Base address is the same as address of first item in the array

### Read-Write Operation on an Array ###
1. Write a progam that initializes an array of 10 items to 0xff and then prints the values of each element.
	1. Array initialization
	2. Array read and write

			uint8_t someData[10] = {0xff, 0xff, 0xff}; // this is fine
			
		1. Partial intialization is allowed
			1. Rest of the items will be initialized to zero

					uint8_t someData[10] = {0xff, 0xff, 0xff, 0, 0, 0, 0, 0, 0, 0};
					
			1. The following is also legal

					uint8_t someData[] = {0xff, 0xff, 0xff}; // compiler has enough info to calculate the size
					
		2. The following is wrong

				uint8_t someOtherData[]; // compiler does not know the size
				
		3. Length can be a variable

				int len = 10;
				uint8_t someData[len];
				
			1. This is a variable length array - C99
			2. If we use C89, it does not work
1. Write a progam that initializes an array of 10 items to 0xff and then prints the values of each element.
	1. Array initialization
	2. Array read and write

			uint8_t someData[10] = {0xff, 0xff, 0xff}; // this is fine
			
		1. Partial intialization is allowed
			1. Rest of the items will be initialized to zero

					uint8_t someData[10] = {0xff, 0xff, 0xff, 0, 0, 0, 0, 0, 0, 0};
					
			1. The following is also legal

					uint8_t someData[] = {0xff, 0xff, 0xff}; // compiler has enough info to calculate the size
					
		2. The following is wrong

				uint8_t someOtherData[]; // compiler does not know the size
				
		3. Length can be a variable

				int len = 10;
				uint8_t someData[len];
				
			1. This is a variable length array - C99
			2. If we use C89, it does not work
				1. Right click > Properties > C/C++ Build > Settings > GCC C Compiler > Dialect > Language Standard > C90 (`-std=c90`)
				2. GCC C Compiler > Warnings > Pedandtic (`-pedantic`)
			3. Commandline:

					gcc -std=c90 -pedantic -o array array.c
					gcc -std=c89 -pedantic -o array array.c
					
2. Contiguous mem location addresses

		*(someData + 1) = 0xEE;
		
3. Shortcut

		someData[1] = 0xEE; // 1 is the offset
		
	1. Offset 1 corresponds to 2nd element
	2. Offset 0 corresponds to 1st element (no offset required)
		1. Pointer manipulation is the reason for this

				uint8_t someData[] = {0xFF, 0xFF, 0xFF};
				
				printf("0th element value = %x\n", someData[0]);
				printf("0th element value = %x\n", *(someData + 0));
				
	3. Printing all elements of the array

			uint8_t someData[] = {0xFF, 0xFF, 0xFF};
			uint8_t len = sizeof(array) / sizeof(array[0]);
			for (uint8_t i = 0; i < len; i++)
				printf("%x\n", array[i]);
				
			array[2] = 0xEE;
			
			printf("\n");
			
			for (uint8_t i = 0; i < len; i++)
				printf("%x\n", array[i]);
				
		1. Summary

				*(someData) = 10; // someData[0]
				*(someData + 1) = 20; // someData[1]
				*(someData + 2) = 30; // someData[2]
				...
				
			1. Pointer vs short hand method

### Passing Array to a Function ###
1. Sending array into function

		void array_display(uint8_t* pArray);
		//...
		array_display(someData);
		//...
		void array_display(uint8_t* pArray) {
			for (uint32_t i = 0; i < 10; i++) // how big is the array?
				printf("%x\n", pArray[i]);
		}
		
	1. We should also pass the size

			uint32_t size = sizeof(array) / sizeof(uint8_t);
			array_display(someData, size);
			//...
			void array_display(uint8_t const *const pArray, uint32_t const size) {
				for (uint32_t i = 0; i < size; i++) // how big is the array?
					printf("%x\n", pArray[i]);
			}
			
		1. Getting address of a specific item

				&someData[2];
				
2. Exercise: Write a function that accepts 2 arrays and swaps them out
	1. Print the updated arrays after swapping
	2. Program should take inputs from user

			#include <stdio.h>
			#include <stdint.h>
			
			void printString(char const *const string);
			void printArray(uint32_t const *const array, uint32_t const size);
			void readArrayElements(uint32_t *const array, uint32_t const size);
			void swap(uint32_t *const array_1, uint32_t *const array_2, uint32_t const size);
			
			int main() {
				printString("Enter the size of the arrays to swap: ");
				uint32_t size = 0;
				scanf("%u", &size);
				
				printString("Enter the elements of the first array separated by spaces: ");
				uint32_t array_1[size];
				readArrayElements(array_1, size);
				
				printString("Enter the elements of the second array separated by spaces: ");
				uint32_t array_2[size];
				readArrayElements(array_2, size);
				
				printString("contents of first array are: ");
				printArray(array_1, size);
				
				printString("contents of second array are: ");
				printArray(array_2, size);
				
				swap(array_1, array_2, size);
				
				printString("contents of first array after swapping are: ");
				printArray(array_1, size);
				
				printString("contents of second array after swapping are: ");
				printArray(array_2, size);
				
				return 0;
			}
			
			void printString(char const *const string) {
				printf("%s", string);
				fflush(stdout);
			}
			
			void printArray(uint32_t const *const array, uint32_t const size) {
				for (int i = 0; i < size; i++)
					printf("%u ", array[i]);
				printf("\n");
			}
			
			void readArrayElements(uint32_t *const array, uint32_t const size) {
				for (int i = 0; i < size; i++)
					scanf("%u", &array[i]);
			}
			
			void swap(uint32_t *const array_1, uint32_t *const array_2, uint32_t const size) {
				uint32_t temp = 0;
				for (int i = 0; i < size; i++) {
					temp = array_1[i];
					array_1[i] = array_2[i];
					array_2[i] = temp;
				}
			}
			
### Swapping of Arrays ###
### Swapping of Arrays Contd. ###

## Strings ##
### Strings in 'C' ###
1. A string is a collection of characters terminated by null character
	1. Null character is used to indicate end of string
2. Example: Name is a collection of characters and can be represented as string
3. We can use array to store strings
4. Unlike in C++, Java, Python, 'C' does not have any dedicated data type to store string data
	1. In 'C' we take the help of array to store and manipulate string data
		1. String manipulations are realized through arrays
5. Example:

		"hello"
		
6. Storage:

		char msg[] = "hello"; // msg is called string variable
		
	1. Mem storage

			'h'   'e'   'l'   'l'   'o'   '\0'
			0xE00 0xE01 0xE02 0xE03 0xE04 0xE05
			msg
			
		1. NULL character is `0` (indicated as `\0`)
		2. Consumes 6 bytes (not 5)
	2. Another method

			char msg[] = {'h', 'e', 'l', 'l', 'o', '\0'}; // this is a string
			char msg[] = {'h', 'e', 'l', 'l', 'o'}; // this is not a string
7. Differences

		char msg1[10] = "hello"; // partial initialization
		char msg2[] = "hello"; // compiler will reserve only 6 bytes
		
		sizeof(msg1); // gives 10 bytes
		sizeof(msg2); // gives 6 bytes
		
		strlen(msg1); // gives 5 bytes - c standard library
		strlen(msg2); // gives 5 bytes - c standard library
		
	1. Counts only the required info (excludes NULL char)
8. Example:

		char msg1[] = "A"; // string definition
		char msg2 = 'A'; // this is a character variable

### String literal ###
1. Also called string constant

		char *msg1 = "hello"; // valid method
		
	1. Compiler allocates some address to the string literal and stores base address in `msg1`
	2. Differences between the following

			char *msg1 = "hello"; // this string lives in ROM
			char msg2[] = "hello"; // this string lives in RAM
			
		1. The contents of `msg2` can be changed
		2. The contents of `msg1` cannot be changed

				msg1[0] = 's'; // not allowed
				
2. Program

		char msg1[] = "Hello how are you?";
		printf("Message is: %s\n", msg1);
		
	1. Window > Show View > Variables
		1. `0x200ffdc` - this is in RAM
	2. Window > Show View > Memory Browser
		1. Search for `0x200ffdc`

### String Variable vs String Literal ###
1. Program

		printf("Address of 'msg1' variable = %p\n", &msg1);
		printf("Value of 'msg1' variable = %p\n", msg1);
		
	1. Click box and arrow (compile and re-launch)
	2. Both values are same

			&msg = &(msg + 0);
			
	3. The string is copied from flash memory to variable during runtime
		1. Check in memory browser
		2. The copying is not part of startup code (this is for global data)
			1. It is part of function execution
				1. Transient data is handled here
					1. It is created in stack memory
2. Memory

		0x20000000					(0x2002FFFC)
		|	global data	| stack |	heap | (192 KB)
		
	1. Stack - SP register is used to track the stack status
		1. When variables are created, SP decrements
			1. `msg1` is created in stack
				1. Data copy takes place during run-time of function
		2. Global array copying is handled by startup code
	2. There are two copies of the string
	
			msg[0] = '\n'; // changes the new copy (not the flash)
			
3. String literal case:
	1. Example:

			char *pmsg2 = "fastbitlab.com"; // The string is also in flash - but there is no data copy (only pointer assignment)
			
			printf("Message is: %s\n", msg2);
			printf("Address of 'pmsg2' variable is: %p\n", &pmsg2); // This will be in RAM
			printf("Value of 'pmsg2' variable is: %p\n", pmsg2); // This will be flash address
			
		1. Output

				0x2001ffde
				0x8001300c
				
			1. `pmsg2` is created in stack and it will be pointing to string in flash
				1. Flash control blocks write access to flash by default
					1. Special instructions to flash control
						1. Inserting password ...
		2. If we try this in host computer
			1. Un-expected behaviour
				1. Application may crash
		3. Use const

				char const *pmsg2 = "fastbitlab.com"; // good practice - compiler will throw an error if we try to modify

### Inputting a String ###
1. Printing and inputting a string
	1. Use the format specifier `%s` with printf to print a string and with scanf to input a string
		1. Be careful with `%s`
			1. The array must be terminated by NULL character
				1. Else it may result in **segmentation fault**
2. Program

		char name[30]; // name must be less than 30 chars
		printf("Enter your name: ");
		fflush(stdout);
		scanf("%s", name);
		printf("Hi %s\n", name); // works
		fflush(stdout); // not required because `return 0` automatically flushes
		
	1. It cannot read whitespace characters
	2. Investigation

			for (int i = 0; i < 30; i++) {
				printf("%x\n", name[i]);
			}
			
		1. `scanf` - automatically adds NULL characters at the end of string read
		2. `scanf` ignores whitespace characters (even multiple spaces)
		3. Example:

				char fname[30], lname[30];
				
				printf("Enter your full name: ");
				scanf("%s%s", fname, lname);
				printf("Your name is : %s %s\n", fname, lname);

### scanf and scanset ###
1. Using `scanset` of `scanf` function

				%[A-Z]s
				%[^r]s
				%[<any-arg>]s
				
3. Example:

		scanf("%s", name);
		scanf("%[^s]s", name); // read all characters until char 's'
		printf("Your name is: %s\n", name);
		
	1. Input

			hello how are you and my name is X
			
			hello how are you and my name i
			
	2. Another example:

			scanf("%[^\n]s", name); // read until newline (excluded)
			
		1. Input

				hello how are you my name is kiran

### Exercise ###
1. Write a program to maintain records of students. The program must maintain records of 10 students and you should give below features to your program
	1. Display all records
	2. Add a record
	3. Delete a record
2. The program also should avoid alert about the below situations
	a. Duplication of a record
	b. No space to add a new record
	c. Deleting an unknown record
3. Solution:

		typedef struct {
			uint32_t rollNumber;
			uint8_t studentSemester;
			char studentDOB[10];
			char studentBranch[50];
			char studentName[100];
		} StudentRecord;
		
		int main() {
			StudentRecord records[10];
			uint8_t size = 0;
			
			while (true) {
				printf("Student record management program\n");
				printf("Display all records\t--> 1");
				printf("Add new record\t--> 2");
				printf("Delete a record\t--> 3");
				printf("Exit application\t--> 0");
				printf("Enter your option here: ");
				scanf("%u", &option);
				if (option == 0)
					break;
				switch (option) {
				case 1:
				    if (size == 0) {
				    	printf("No records found");
				    	break;
				    } else {
				    	printf("Displaying all students records\n");
				    	printf("**************");
				    	for (uint8_t i = 0; i < records; i++) {
				    		printf("rollNumber\t: %u\n", records[i].rollNumber);
				    		printf("studentSemester\t: %hhu\n", records[i].studentSemester);
				    		printf("studentDOB\t: %s\n", records[i].studentDOB);
				    		printf("studentBranch\t: %u\n", records[i].studentBranch);
				    		printf("studentName\t: %u\n", records[i].studentName);
				    		printf("***************\n");
				    		break;
				    	}
				    }
				    break;
				case 2:
					if (size >= 10) {
						printf("It is full! Cannot add more records\n");
						break;
					}
					printf("Add a new record\n");
					printf("Enter the rollNumber: ");
					uint32_t rollNumber = 0;
					scanf("%u", &rollNumber);
					
					bool recordAlreadyExists = false;
					for (int i = 0; i < size; i++) {
						if (records[i].rollNumber == rollNumber) {
							recordAlreadyExists = true;
							break;
						}
					}
					
					if (recordAlreadyExists) {
						printf("Record with the rollNumber already exists. Cannot add duplicate records\n");
						break;
					}
					
					records[size].rollNumber = rollNumber;
					printf("Enter the studentSemester: ");
					scanf("%hhu", &records[size].studentSemester);
					printf("Enter the DOB (mm/dd/yyyy): ");
					scanf("%s", &records[size].studentDOB);
					printf("Enter the studentBranch: ");
					scanf("%[^\n]s", &records[size].studentBranch);
					printf("Enter the studentName: ");
					scanf("%[^\n]s", &records[size].studentName);
					size++;
					printf("Record added successfully\n");
					break;
				case 3:
					if (size == 0) {
						printf("No records to delete\n");
						break;
					}
					printf("Delete a record\n");
					printf("Enter the roll number of the student: ");
					uint32_t rollNumber = 0;
					scanf("%u", &rollNumber);
					bool recordFound = false;
					for (uint8_t i = 0; i < size; i++) {
						if (records[i].rollNumber == rollNumber) {
							for (int j = i; j < size - 1; j++)
								records[j] = records[j + 1];
							size--;
							printf("Record deleted\n");
							recordFound = true;
							break;
						}
					}
					if (!recordFound) {
						printf("Record does not exist\n");
						break;
					}
				}
			}
			return 0;
		}
		
4. Hints:
	1. Use a structure to maintain a student record
	2. Student record should contain the below info

			// Definition of a student record
			typedef struct {
				int rollNumber;
				char name[100];
				char branch[50];
				char dob[15];
				int semester;
			} STUDENT_INFO_t;
			
	3. Reserve space to hold 10 students records
	
			STUDENT_INFO_t students[10]; // a global array to hold record of 10 students

## Pre-Processor Directives in 'C' ##
### Pre-Processor Directives in 'C' ###
1. In C programming pre-processor directives are used to affect compile-time settings
2. Pre-processor directives are also used to construct macros used as a textual replacement for numbers and other things.
3. Pre-processor directives begin with the `#` symbol
	1. `#include`
	2. `#if`
	3. `#ifndef`
4. Pre-processor directives are resolved or taken care during the pre-processing state of compilation
5. Pre-processor directives supported in 'C'
	1. Macros - `#define <identifier> <value>` - used for textual replacement
	2. File inclusion - 
		1. `#include <std lib file name>`
		2. `#include "user defined file name"`
	3. Conditional compilation - used to direct compiler about code compilation
		1. `#ifdef` **(M)**
		2. `#endif`
		3. `#if`
		4. `#else`
		5. `#ifndef`
		6. `#undef` **(M)**
	4. Others
		1. `#error` **(M)**
		2. `#pragma`
6. Macros in 'C' (`#define`)
	1. Macros are written in 'C' using `#define` pre-processor directive
	2. Macros are used for textual replacement in the code
		1. Common use is for defining constants
	3. Syntax:

			#define <identifier> <value>
			
		1. Example:

				#define MAX_RECORDS 10
				
		2. Example:

				#include <stdio.h>
				#include <stdint.h>
				
				// This is a macro which defines minimum age for evaluation
				#define MIN_AGE 18
				
				int main(void) {
					uint8_t age = get_voter_age();
					
					if (age < MIN_AGE) {
						printf("You cannot vote!\n");
					} else {
						printf("Congratulations! you can vote!\n");
					}
				}
				
			1. Why this?
				1. Suppose the value for MIN_AGE is used at many places
				2. Suppose we want to change the value
					1. Without macro, we may have to change everywhere
						1. With macro, the value can be changed only in one place
	4. During pre-processing stage of the compilation process, macro names (identifiers) are replaced by the associated values inside the program
		1. macro is just an **identifier** and not a variable (only a textual representation of the value)
	5. In embedded systems programming, we use lots of 'C' macros to define
		1. Pin numbers
		2. Pin values
		3. Crystal speed
		4. Peripheral register addresses
		5. Memory addresses
		6. Configuration values
		7. ...
	6. Examples:

			#define PIN_8					8
			#define GREEN_LED			PIN_8
			#define LED_STATE_ON		1
			#define LED_STATE_OFF		0
			#define XTAL_SPEED			8000000UL // UL - unsigned long
			#define FLASH_BASE_ADDR		0x08000000UL
			#define SRAM_BASE_ADDR		0x20000000ul
			
			#define PI					3.1415; // wrong - no semicolon
			
		1. Uppercase is a convention
			1. To distinguish between variable names and macros
	7. Function like macros
		1. To define a function-like macro, use the same `#define` directive
			1. But put parantheses immediately after macro name.
		2. Examples:

				#define PI_VALUE		3.1415
				
				#define AREA_OF_CIRCLE(r)	PI_VALUE * r * r
				areaCircle  AREA_OF_CIRCLE(radius); // original C statement
				
				areaCircle = PI_VALUE * radius * radius; // stage 1
				areaCircle = 3.1415 * radius * radius; // pre-processed C statement - stage 2
				
	8. The following macro is poorly written and dangerous

			#define AREA_OF_CIRCLE(r)		PI_VALUE * r * r
			
		1. We have to be careful with macro 'values' when we do some 'operations' using multiple 'operands'
			1. Why is it bad?

					areaCircle = AREA_OF_CIRCLE(radius + 1);
					areaCircle = 3.1415 * radius + 1 * radius + 1; // converted to this
					
				1. Fix:

						#define AREA_OF_CIRDLE(r) ((PI_VALUE) * (r) * (r))
						
					1. Use parantheses for every operand
	9. Best practices while writing macros in 'C'
		1. Use meaningful macro names
		2. It's recommended that you use UPPER case letters for macro names to distinguish them from variables
		3. Remember, macro's names are not variable
			1. They are labels or identifiers
				1. They don't consume any code space or ram space during compile time or run time of program
		4. Make sure parantheses surround macro value
		5. While using function-like macros or macros along with operators
			1. Surround operands with parantheses

### Conditional Compilation Directives ###
1. Examples of conditional compilation directives
	1. `#if`
	2. `#ifdef`
	3. `#endif`
	4. `#else`
	5. `#undef`
	6. `#ifndef`
2. The directives help us to include or exclude individual code blocks based on various conditions set in program
3. `#if` and `#endif` directives
	1. Syntax:

			#if <constant expression>
			
			#endif
			
	2. Example:

			#if 0
				// code block - is or is not part of final program
			#endif
			
4. This directive checks whether constant expression is zero or non zero value.
	1. If constant is 0
		1. Code block will not be included for code compilation
	2. If constant is non zero
		1. Code block will be included for code compilation
	3. `#endif` - marks end of scope of `#if`, `#ifdef`, `#ifndef`, `#else`, `#elif` **(M)**
	4. `<constant expression>` must be a number or integer
	5. `#if` - it is conditional compilation directive
5. Example:
	
		#define DEBUG 0

		int main() {
		#if DEBUG
			// code block is excluded
			#if 0 // nested
				// code block
			#endif
		#endif	
		}
		
	1. Example:

			#if 1
				// Code block-1 // included
			#else
				// Code block-2 // excluded
			#endif
			
6. `#ifdef`
	1. Syntax:

			#ifdef <identifier>
				// code block
			#endif
			
		1. `#ifdef` directive checks whether identifier is defined in program or not
			1. If identifier is defined, code block will be included for compilation
		2. Example:

				#ifdef NEW_FEATURE
					// Code block
				#endif
				
	2. Depends on definition only
		1. Identifier is used instead of constant expression
	3. Problem:
		1. Execute triangle area calculation code block only if AREA_TRI macro is defined in the program
		2. Execute circle area calculation code block only if AREA_CIR macro is defined and execute triangle area calculation code block only if AREA_TRI macro is defined in the program
		3. Make sure that compilation fails if none of the macros is defined
		4. Make sure that compilation triggers warnings if none of the macros are defined
		5. Solution:

				#define AREA_TRI // not required, it can be passed as commandline argument
				#define AREA_CIR // not required, it can be passed as commandline argument
				
				#ifdef AREA_TRI
				// area of triangle logic
				#endif
				
				#ifdef AREA_CIR
				// area of circle logic
				#endif
				
			1. Passing definition as compiler argument
				1. Right click on project > Properties > GCC C Compiler > Preprocessor
					1. Defined symbols (`-D`)
						1. `AREA_TR`

								gcc -DAREA_TR ...
								
			2. Overriding already defined symbols

					#undef AREA_TR
					
			3. If not defined then include the code block

					#ifndef AREA_TR
						// code block
					#endif

### 'defined' Operator ###
1. `#if` and `defined` operator
	1. The `defined` operator is used when you want to check definitions of multiple macros using single `#if`, `#ifdef` or `#ifndef` directives
	2. 'C' logical operators can also be used (AND, NOT, OR) with `defined` operator
2. Example:

		#ifdef AREA_CIR
			#ifdef AREA_TRI
		printf("This is the area calculation program for both circle and Triangle"); // We want to include this only if both macros are defined
			#endif
		#endif
		
	1. Another approach

			#if defined(AREA_CIR) && defined(AREA_TRI)
				printf("This is the area calculation program for both circle and Triangle");
			#endif
			
	2. User must mention atleast one of the macros

			// can be kept outside or inside a function
			#if !defined(AREA_CIR) && !defined(AREA_TRI)
				printf("Please define atleast one macro\n");
				#error "No macros defined."
			#endif
			
		1. `#error "<error-message>"` **(M)**
	3. Warning instead of error

			#if !defined(AREA_CIR) && !defined(AREA_TRI)
				printf("Please define atleast one macro\n");
				#warning "No macros defined."
			#endif

### Modifying LED Toggle Exercise with Macros ###
1. LED Toggle Project with Macros
	1. main.h

			// some macros
			#define ADDRESS_REG_AHB1ENR ( (RCC_AHB1ENR_t*) 0x40023830 )
			#define ADDRESS_REG_GPIO_X_MODE ( (GPIOx_MODE_t*) 0x40020C00 )
			#define ADDRESS_REG_GPIO_X_ODR ( (GPIOx_ODR_t*) 0x40020C14 )
			#define CLOCK_ENABLE ( 1 )
			#define MODE_CONF_OUTPUT ( 1 )
			#define PIN_STATE_HIGH ( 1 )
			#define PIN_STATE_LOW ( 0 )
			#define DELAY_COUNT ( 300000UL ) // default is int
			
	2. main.c
	
			// ...
			RCC_AHB1ENR_t volatile *const pClkCtrlReg = ADDRESS_REG_AHB1ENR;
			GPIOx_MODE_t volatile *const pPortDModeReg = ADDRESS_REG_GPIO_X_MODE;
			GPIOx_ODR_t volatile *const pPortDOutReg = ADDRESS_REG_GPIO_X_ODR;
			
			pClkCtrlReg->gpiod_en = CLOCK_ENABLE;
			
			pPortDModeReg->pin_12 = MODE_CONF_OUTPUT;
			
			// ...
			pPortDOutReg->pin_12 = PIN_STATE_HIGH;
			for (/*...*/; i < DELAY_COUNT; /*...*/)
			// ...
			pPortDOutReg->pin_12 = PIN_STATE_LOW;
			for (/*...*/; i < DELAY_COUNT; /*...*/)
			// ...

### BONUS LECTURE ###
1. [Mastering Microcontroller DMA programming for Beginners
(Highest rated course on Embedded Systems)](https://www.udemy.com/course/microcontroller-dma-programming-fundamentals-to-advanced/?couponCode=FASTWEBAPR21)
2. [STM32Fx ARM Cortex Mx Custom Bootloader Development](https://www.udemy.com/course/stm32f4-arm-cortex-mx-custom-bootloader-development/?couponCode=FASTWEBAPR21)
3. [Free videos on embedded systems, embedded Linux, RTOS programming on our YouTube channel](https://www.youtube.com/channel/UCa1REBV9hyrzGp2mjJCagBg)
4. [http://fastbitlab.com/](http://fastbitlab.com/)
5. [https://www.linkedin.com/in/fastbitlab/](https://www.linkedin.com/in/fastbitlab/)
