# C++ Programming #
## Compilers ##
1. GNU g++
2. MinGW: Minimal GNU for Windows
3. Visual C++: syntax may be slightly different

## IDE ##
1. Eclipse CDT
	1. C++ Development Toolchain
2. Visual C++
3. Codeblocks
	1. Not professionally
4. Emacs, VIM etc.

## Setup and Installaion ##
1. Compiler
	1. Windows: Code::Blocks
		1. MinGW
	2. Mac: gnu c++ compiler mac [http://stackoverflow.com/questions/9353444/how-to-use-install-gcc-on-mac-os-x-10-8-xcode-4-4](http://stackoverflow.com/questions/9353444/how-to-use-install-gcc-on-mac-os-x-10-8-xcode-4-4)
		1. `sudo xcode-select --install`
2. IDE
	1. Eclipse CDT
		1. Specify compiler path

## Hello World ##
1. File > New > C++ Project
2. Project Details:
	1. Project Name: SimpleProject
	2. Type: Hello World C++ Project
	3. Toolchain: MacOSX GCC
4. Running
	1. Select Project in Project Explorer
	2. Project > Build Project
	3. Run
		
			//============================================================================
			// Name        : SimpleProfect.cpp
			// Author      : AM
			// Version     :
			// Copyright   : Your copyright notice
			// Description : Hello World in C++, Ansi-style
			//============================================================================

			#include <iostream>
			using namespace std;

			int main() {
				cout << "!!!Hello there World!!!" << endl; // prints !!!Hello World!!!
				return 0;
			}

5. `Debug` folder
	1. Project > Build Configuration > Set Active > Release
		1. Generates Release folder
6. Console instructions

## Outputting Text ##
1. Outputting Text Project

		#include <iostream>
		using namespace std;

		int main() {
			cout << "!!!Hello there World!!!" << endl;
			return 0;
		}
	
	
	1. If Binaries folder is not getting generated: Do you see the file under "binaries" virtual folder in your Project Explorer? It looks like your "binary parser" is not picking the executable. Do you use CDT-generated makefile or the one you wrote yourself? Also check if "PE Windows Parser" and/or "Cygwin PE Parser" are selected when you open project properties, navigate to "C/C++ Build"/Settings page and "Binary Parsers" tab.
	2. `endl`: clears buffer out to output
	3. `flush`: clears buffer but don't add carriage return

## Variables ##
1. Variables Project
2. String literal[ly]: actual string that cannot change

		#include <iostream>
		using namespace std;

		int main() {
			int numberCols = 5;
			cout << "Hello" << endl;
			return 0;
		}

3. Keywords
	1. `int`: allocate memory to store integer
4. Variable names:
	1. start with `_` or letters
	2. Can contain `_`, letters or numbers

			int numberCats = 5;
			int numberDogs = 7;
			int numberAnimals = numberCats + numberDogs;
			cout << "Number of cats: " << numberCats << endl;
			cout << "Number of dogs: " << numberDogs << endl;
			cout << "Total number of animals here: " << numberCats + numberDogs << endl;
			cout << "new dog acquired" << endl;
			numberDogs = numberDogs + 1;
			cout << "new number of dogs: " << numberDogs << endl;