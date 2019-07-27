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
1. Steps:
	1. Construct an interface to library: `mylib.h`
	2. Construct an implementation of library: `mylib.c`
	3. Construct a library object file that can be linked with programs that want to use the library code
		1. Or shared object file from many `.o` files
	4. Use library with other C code:
		1. `#include "mylib.h"`
		2. Link library code into `a.out` file
	5. Set LD_LIBRARY_PATH environment variable for finding shared objects (`.so` files) in non-standard locations at runtime

### Details ###
1. Interface: header file should contain definitions for everything exported by library
	1. function prototypes with comments for users of user library functions
	2. definitions of types and global variables exported by library
	3. Have boilerplate code (`#ifndef` ... `#endif`) around header file's contents (ensures that pre-processor includes `mylib.h` one time)
		1. Example:

				#ifndef _MYLIB_H_
				#define _MYLIB_H_
			
					// a constant definition exported by library:
					#define MAX_FOO 20
					
					// a type definition exported by library:
					struct foo_struct {
						int x;
						float y;
					};
					typedef struct foo_struct foo_struct;
					
					// a global variable exported by library
					// "extern" means that this is not a variable declaration, it
					// just defines that a variable named total_foo of type int
					// exists and you can use it (its declaration is in some library source file)
					extern int total_foo;
					
					// a function prototype for a function exported by library:
					extern int foo(float y, float z); // a very bad function name
				#endif

2. Implementation: construct a `mylib.c` file that includes `mylib.h` and contains implementation of every function in the library

		#include "mylib.h"
		...
		int total_foo;
		
		int foo(float y, float z)
		{
			...
		}	
		
3. Construct Library Object File that can be linked into other programs that use the library (use `-c` option to `gcc` to tell it to construct object file (`.o` file) rather than executable:

		gcc -o mylib.o -c mylib.c
		
	1. `mylib.o` can be used as library file and statically link it into other programs
	2. Shared object file: This can be constructed from one or more `.o` files.
		1. It is a Unix name for dynamically linked library (code is loaded at runtime)
		2. How to construct: use `-shared` flag

				gcc -shared -o libmylib.so mylib.o blah.o grr.o -lm
				
	3. Archive file: (statically linked library - `libmylib.a`) It can be constructed from one or more `.o` files
		1. Linking a static library copies code into `a.out` at runtime
4. Use library in other programs
	1. step 1: Add include line (`#include "mylib.h"`) in all program source files that use the library (`test.c`)
	2. step 2: Link program's `.c` file with library object file (specify `mylib.o` in command line)

			gcc test.c mylib.o
			
		1. linking `libmylib.so` (or `libmylib.a`)

				gcc test.c -lmylib
				
		2. linking library not in standard path:

				gcc test.c -L/home/newhall/lib -lmylib
				
5. Running executable linked with shared object file
	1. If `.so` is not in `/usr/lib` then set `LD_LIBRARY_PATH` env variable so that liner can find and load `.so` file into executable at runtime:

			# in bash:
			export LD_LIBRARY_PATH=/home/newhall/lib:$LD_LIBRARY_PATH
			
			# in tcsh:
			sentenv LC_LIBRARY_PATH /home/newhall/lib:$LD_LIBRARY_PATH	
			