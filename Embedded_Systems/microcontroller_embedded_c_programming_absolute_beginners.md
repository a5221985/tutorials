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

## 'volatile' Type Qualifier ##
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
