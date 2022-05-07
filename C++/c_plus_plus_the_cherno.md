# C++ - The Cherno #
## Welcome to C++ ##
1. Google things we don't understand
2. Why C++?
	1. For fast code that performs well
	2. For architecture neutral coding but that runs natively (if architecture is complex)
	3. Game engines are written in C++
		1. Unity
		2. Unreal
		3. FrostBite
	4. Why?
		1. Direct control hardware
			1. Compiler outputs machine code
		2. We almost control all the instructions that run on hardware
	5. Many platforms support C++
		1. x64
		2. OSs
		3. iOS, ANdroid
		4. XBOX, Playstation, Nintendo
		5. If there is a compiler, we can write C++ for the patform
	6. Java and C# runs on VM
		1. Intermediate code is run on VM
	7. Native code is pushing machine instructions into hardware
	8. However, bad C++ code might be more inefficient than Java or C# because VMs optimize on the fly
	9. C# or Java is good when we don't need to squeeze every bit of performance from the hardware

## How to Setup C++ on Windows ##
1. Most widely used OS in games industry
2. C++ (text file) -> compiler -> binary (runs on machine)
3. Don't use notepad
	1. Get IDE - set of tools
		1. Microsoft Visual Studio
			1. Has plugins for platforms
	2. Installation:
		1. Download
		2. Install Visual Assist plugin (paid - $99)
		3. Components:
			1. Desktop development with C++
			2. .NET desktop development
		4. Install
	3. Launch
4. Options:
	1. Change to Dark mode - General
	2. Download settings file from : [https://thecherno.com/vs](https://thecherno.com/vs)
		1. Copy the file to Documents/Visual Studio 207/Settings
5. File > New Project > Empty Project
	1. HelloWorld
		1. Solution name:
			1. Group of projects related to each other
				1. It is like a workbench
			2. Each project is group of files that compiles to library or executable
	2. Add new item > Main.cpp
	
			#include <iostream>
			
			int main() {
				std::cout << "Hello world" << std::endl;
				std::getchar();
				return 0;
			}
			
		1. Right click on project > Build
		2. Go to the directory
		3. Double click to run

## How to Setup C++ on Mac ##
1. Xcode
	1. Games
		1. Lags a lot
2. App Store
	1. Xcode search
3. New project
	1. Choose langauge as C++
	2. Org name: Any unique id
4. Type the code in main

		#include <iostream>
			
		int main() {
			std::cout << "Hello world" << std::endl;
			std::getchar();
			return 0;
		}
		
5. Product > Build
6. Hit Play Button (enable developer mode)

## How to Setup C++ on Linux ##
1. Different tools
	1. CMake
	2. CodeLite IDE (light weight)
2. Steps:
	1. `mkdir Dev`
	2. `cd Dev`
	3. `mkdir HelloWorld`
	4. `cd HelloWorld`
	5. `sudo apt-get update`
	6. `sudo apt-get install vim g++ codelite cmake`
	7. `mkdir src`
	8. `touch src/Main.cpp`
	9. `vim CMakeLists.txt`
	
			cmake_minimum_required (VERSION 3.5)
			
			project (HelloWorld)
			
			set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Werror -std=c++14")
			set (source_dir "${PROJECT_SOURCE_DIR}/src/")
			
			file (GLOB source_files "${source_dir}/*.cpp")
			
			add_executable (HelloWorld ${source_files})
			
		1. :wq
	10. `vim build.sh` # generates project (not build)
	
			#!/bin/sh
			
			cmake -G "CodeLite - Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug
			
	11. `chmod +x build.sh`
	12. `build.sh`
		1. `HelloWorld.project`
		2. `HelloWorld.workspace`
	13. `codelite HelloWorld.workspace &`
	14. Open `Main.cpp`
	
			#include <iostream>
			
			int main() {
				std::cout << "Hello world" << std::endl;
				std::getchar();
				return 0;
			}
			
	15. Build > Build Project
	16. `./HelloWorld`
	17. Running Inside IDE:
		1. Settings > Preferences > Terminal > Build in terminal emulator
		2. Build > Run

## How C++ Works ##
1. Source files (text) -> Compiler -> Binary (lib or executable)
2. Executable programs:

		#include <iostream> // preprocessor statements - just before compilation, takes contents of iostream and pastes here
		
		int main() // entry point for application - computer starts from here
		{
			std::cout << "Hello World!" << std::endl; // << - overloaded operatators but it is a function
			std::cin.get(); // pauses until we press enter
			// return is optional for main function
		} // 0 is returned
		
	1. Steps:
		1. Preprocessor statements are evaluated (includes all contents of the files)
		2. File gets compiled into machine code
			1. Solution Config - set of rules applied for building a project (Right click on project > Properties > General - SDK, ... Configuration Type - Application (.exe), C/C++ - include dirs, optimization settings, code generation settings, preprocessor definitions)
				1. Debug
					1. Optimization - Disabled in Debug mode
						1. Highest in release mode
				2. Release
			2. Solution Platform - platform tergetted with current compilation
				1. x64
				2. x86
				3. Android
				4. ...
			3. The inidividual cpp files get compiled into .obj files
				1. ctrl + f7 - compiles individual files
				2. Right click >  Build
				3. Add or Remove Buttons > Customize > Add Command > Build > Compile
			4. Linker stiches all files into .exe
3. Header files don't get compiled
	1. Only when included
4. Error list
	1. Not useful - parses output looking for error (just overview)
	2. Output window is better
5. Open Folder (in file explorer)
	1. Debug > Main.obj (one for each cpp file)
6. Build entire project
	1. Solution name > Debug > .exe
7. Example:

		void log(const char* message) {
			std::cout << message << std::endl;
		}
		
		int main() {
			log("Hello World!");
		}
		
	1. Separate files:
		1. log.cpp
		
				#include <iostream>
		
				void log(const char* message) {
					std::cout << message << std::endl;
				}
				
		2. main.cpp
		
				#include <iostream>
				
				void log(const char* message); // declaration to tell compiler that this function exists somewhere
				
				// compiler doesn't care where it is defined
				int main() 
				{
					log("Hello World");
				}
				
		3. Once files are compiled, linker finds the definitions and wires them up - if not linker errors
			1. If we change log to logr
				1. Unresolved external symbol - unable to resolve symbols

## How the C++ Compiler Works ##
1. 

## How the C++ Linker Works ##
## Variables in C++ ##
## Functions in C++ ##
## C++ Header Files ##
## How to Debug C++ In Visual Studio ##
## Conditions and BRANCHES in C++ (if statements) ##
## BEST Visual Studio Setup for C++ Projects! ##
## Loops in C++ (for loops, while loops) ##
## Control Flow in C++ (continue, break, return) ##
## POINTERS in C++ ##
## REFERENCES in C++ ##
## CLASSES in C++ ##
## CLASSES vs STRUCTS in C++ ##
## How to Write a C++ Class ##
## Static in C++ ##
## Static for Classes and Structs in C++ ##
## Local Static in C++ ##
## ENUMS in C++ ##
## Constructors in C++ ##
## Destructors in C++ ##
## Inheritance in C++ ##
## Virtual Functions in C++ ##
## Interfaces in C++ (Pure Virtual Functions) ##
## Visibility in C++ ##
## Arrays in C++ ##
## How Strings Work in C++ (and how to use them) ##
## String Linterals in C++ ##
## CONST in C++ ##
## The Mutable Keyword in C++ ##
## Member Initializer Lists in C++ (Constructor Initializer List) ##
## Ternary Operators in C++ (Conditional Assignment) ##
## How to CREATE/INSTANTIATE OBJECTS in C++ ##
## The NEW Keyword in C++ ##
## Implicit Conversion and the Explicit Keyword in C++ ##
## OPERATORS and OPERATOR OVERLOADING in C++ ##
## The "this" Keyword in C++ ##
## Object Lifetime in C++ (Stack/Scope Lifetime) ##
## SMART POINTERS in C++ (std::unique_ptr, std::shared_ptr, std::weak_ptr) ##
## Copying and Copy Constructors in C++ ##
## The Arrow Operator in C++ ##
## Dynamic Arrays in C++ (std::vector) ##
## Optimizing the usage of std::vector in C++ ##
## Using Libraries in C++ (Static Linking) ##
## Using Dynamic Libraries in C++ ##
## Making and Working with Libraries in C++ (Multiple Projects in Visual Studio) ##
## How to Deal with Multiple Return Values in C++ ##
## Templates in C++ ##
## Stack vs Heap Memory in C++ ##
## Macros in C++ ##
## The "auto" Keyword in C++ ##
## Static Arrays in C++ (std::array) ##
## Function Pointers in C++ ##
## Lambdas in C++ ##
## Why I Don't "using namespace std" ##
## Namespaces in C++ ##
## Threads in C++ ##
## Timing in C++ ##
## Multidimensional Arrays in C++ (2D arrays) ##
## Sorting in C++ ##
## Type Punning in C++ ##
## Unions in C++ ##
## Virtual Destructors in C++ ##
## Casting in C++ ##
## Conditional and Action Breakpoints in C++ ##
## Safety in Modern C++ and How to Teach It ##
## Precompiled Headers in C++ ##
## Dynamic Casting in C++ ##
## BENCHMARKING in C++ (How to Measure Performance) ##
## STRUCTURED BINDINGS in C++ ##
## How to Deal with OPTIONAL DATA in C++ ##
## Multiple TYPES of Data in a SINGLE VARIBLE in C++? ##
## How to Store ANY Data in C++ ##
## How to Make C++ Run FASTER (with std::async) ##
## How to Make Your STRINGS FASTER in C++ ##
## VISUAL BENCHMARKING in C++ (How to Measure Performance Visually) ##
## SINGLETONS in C++ ##
## Small String Optimization in C++ ##
## Track MEMORY ALLOCATIONS the Easy Way in C++ ##
## lvalues and rvalues in C++ ##
## Continuous Integration in C++ ##
## Static Analysis in C++ ##
## Argument Evaluation Order in C++ ##
## Move Semantics in C++ ##
## std::move and the Move Assignment Operator in C++ ##
## ARRAY - Making DATA STRUCTURES in C++ ##
## VECTOR/DYNAMIC ARRAY - Making DATA STRUCTURES in C++ ##
## ITERATORS in C++ ##
## Writing an ITERATOR in C++ ##
## How to REALLY Learn C++ ##
## Intro to Binary and Bitwise Operators in C++ ##
## Bitwise AND (&), OR (|), XOR (^) and NOT (~) in C++ ##
## I Did a C++ University Assignment ##