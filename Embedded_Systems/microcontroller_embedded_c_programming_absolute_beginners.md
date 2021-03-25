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

### History of 'C' and Standardization ###
### Important Note ###

## IDE Installation ##
### Downloading IDE ###
### Key Features of the STM32CubeIDE ###
### Installing STM32CubeIDE ###
### Installing STM32CubeIDE on Linux ###
### Installing Compiler (GCC) for Host ###
### Installing Compiler (GCC) for Host (Windows) ###
### Installing Compiler (GCC) for Host (Linux) ###
### Installing Compiler (GCC) for Host (Mac) ###
### Importing Course Projects in to Workspace ###
### Constructing a Project for the Host ###
### Constructing a Project for the Target ###
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
