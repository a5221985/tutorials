# C Libraries #
## Introduction ##
1. Libraries usually get created using many library source files
	1. Flavours
		1. Archive files: `libmin.a`
			1. statically linked into executables that use them
		2. Shared object files: `libmine.so`
			1. dynamically linked into executables that use them
2. To link libraries
	1. `-L` - path to library files
	2. `-l` - for linking a library (`.so`, `.a`)
	3. Example:

			-L{path to file containing library} -l${library name}
			
			gcc -o myprog myprog.c -L/home/newhall/lib -lmine
			
	4. `-I` - to specify path to the header file (compiler may need to find them)

			-I/home/newhall/include
			
	5. `LD_LIBRARY_PATH` - environment variable to set if shared object files (`.so`) will not be installed in `/usr/lib`
		1. Runtime linker will be able to find them and load them at run time
		2. Example:

				# if running bash:
				export LD_LIBRARY_PATH=/home/newhall/lib:$LD_LIBRARY_PATH
				
				# if running tcsh:
				setenv LD_LIBRARY_PATH /home/newhall/lib:$LD_LIBRARY_PATH 

## Using and Linking Library Code ##
1. Steps: if program is not automatically linked by compiler (1. include library's header file in C source file (`test.c`) and 2. tell compiler to link code from library's `.o` file into executable file
2. Steps in detail:
	1. Step 1: Add an include line (`#include "somelib.h"`) in program source file (`test.c`)
	2. Step 2: Link program's `.c` file with library's object file (specify `somelib.o` file as command line argument)
		
			gcc -o myprog test.c somelib.o
			
		1. `myprog` should contain machine code for all functions defined in `test.c` and `mylib` library functions that are called by

## Creation and Usage of Own Library Code ##
