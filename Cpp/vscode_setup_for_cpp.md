# VSCode Enable C++ #
1. Mingw compiler:
	1. [www.mingw.org](www.mingw.org)
		1. Downloads
		2. Sourceforge.net
		3. Click on Download Latest Version
	2. Install
		1. C:\MinGW
		2. Continue
			1. Starts installation manager
				1. Right click and mark for installation (install all)
			2. Click on Installation
				1. Apply Changes
				2. Apply
2. Open folder
	1. C:\MinGW\bin
	2. Copy the path and add to PATH environment variable
3. Open cmd
	1. `g++ --version`
4. Open VSCode
	1. Extensions
		1. c++
			1. C/C++ - from Microsoft
			2. Install
			3. Reload
	2. New `main.cpp`

			#include <iostream>
			
			int main() {
				std::cout << "Hello World!" << std::endl;
			}

		1. Click on bulb or ctrl+shift+p - C/Cpp: Edit Configurations...
			1. Edit "includePath" setting
				1. .vscode/c_cpp_properties.json

						"name": "Win32",
						...
						"browse": {
							"path": [
								"${workspaceRoot}",
								"C:\\MinGW\\lib\\gcc\\minggw32\\<version>\\include\\c++"
							],
						}

					1. open C:/MinGW/lib/gcc/mingw32/<version>/include/c++
	3. ctrl+shift+p
		1. Tasks: Configure Task
			1. Create tasks.json file from template
			2. Others

					"command": "g++",
					"args": [
						"-g", "main.cpp"
					],
					"group": {
						"kind": "build",
						"isDefault": true
					}

	4. ctrl+shift+b
		1. a.exe
	5. Open terminal
		1. `.\a.exe`
	6. Debugging
		1. Click debug option
		2. Click on green play button
		3. Select C++ (GDB/LLDB)
			1. `launch.json`
			2. Give debugging path
				
					"program": "${workspaceFolder}/a.exe",
					...
					"miDebuggerPath": "C:\\MingGW\\bin\\gdb.exe",
					"preLaunchTask": "echo", // this is label from tasks.json

	7. Add breakpoints

			system("pause");
			...
					

