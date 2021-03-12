# JVM (java virtual machine) architecture - tutorial #
1. Why learn it? Interviewers ask questions about JVM architecture
2. JVM function
	1. Load
	2. Execute
3. Steps:
	1. Edit MyApp.java file
	2. `javac MyApp.java`
	3. `java MyApp` - this command instantiates a JVM instance
4. How does JVM instance load and execute .class file
	1. Class loader
		1. Loads application's .class files
		2. Loads Java API's .class files
			1. Built in classes
				1. String.class
				2. Object.class
				3. Collections
				4. ...
		3. Feeds bytecode to execution engine
	2. Execution Engine
		1. Executes bytecode
		2. It talks to OS (to execute instructions)
			1. It makes native method calls
5. Breakdown:
	1. Class loader subsystem
		1. 3 main phases
			1. Load phase
				1. Loads bytecode into memory (.class from different sources)
					1. sources
						1. .jar (contains .class files)
						2. file system
						3. network socket
					2. Different class loaders
						1. Bootstrap class loader - loads internal classes
							1. In **rt.jar** (jre folder)
						2. Extension class loader - loads additional application classes
							1. **jre/lib/ext** - other jars
					3. Application class loader
						1. 	Loads classes from `CLASSPATH` env variable and `-cp` parameter from commandline options
			2. Link pase
				1. 3 different sub-phases
					1. Verify
						1. Looks at bytecode and checks if it is compatible with JVM class specifications etc... (if it is valid Java bytecode - magic number checks, ...)
					2. Prepare
						1. Memory is allocated for static variables in class files and assigned to default value
						
								private static int x = 10; // x = 0 in this phase
								
							1. This is the only mem allocation happening (only for class variables and not instance variables)
					3. Resolve
						1. All symbolic references inside current class are resolved (from symbolic to actual references)
							1. If we have references to other classes
							2. If we have references to constant pool
				2. The phases might get executed in parallel or might overlap
			3. Initialize phase
				1. Static initializers of class are run
					1. static block
					2. set actual values to static variables

							private static int x = 10; // x = 10 in this phase
			4. Problems
				1. `ClassNotFoundException` - When class loader fails to find the bytecode corresponding to class we mention
				2. `ClassDefNotFoundException` - During resolve phase - X refering to Y but Y cannot be found					
	2. Runtime data areas
		1. Memory of JVM
			1. 5 different areas
				1. 2 areas
					1. Method area - metadata corresponding to class are stored (Reflection API inquires data in the method area)
						1. static variables
						2. bytecode
						3. class level constant pool
						4. It is called PermGen space
							1. By default 64 MB is allocated (this can be tuned)
							
									-XX:MaxPermSize
									
								1. If PermGen is very low
									1. `java.lang.OutOfMemoryError: PermGen space`
						5. In Java 8, it is called Metaspace
							1. Moved PermGen to a separate memory in the native OS
								1. There is no limit to Metaspace (can use the whole memory or even use virtual memory)
							2. It can be tuned (limited to max size)
					2. Heap
						1. Object data is stored here
							1. If an object is instantiated, the object is usually created in heap
								1. Even arrays
						2. Tuned
						
								-Xms, -Xms
							
							1. Xms - Default is 1/4 th of physical memory
					3. 3 more
						1. PC registers
							1. Program counter registers
								1. Pointer to the next instruction to be executed per thread
									1. Suppose T1, T2, and T3 are threads then P1, P2, and P3 will exist
						2. Java Stacks
							1. Stack frames of current methods per thread

									stack frame1 stack frame4
									stack frame2 stack frame5
									stack frame3
							
							2. Stack frame
								1. Contains data related to currently executing method
									1. Mem area for parameters (array)
									2. Return values
									3. Local variables
									4. Operand stack
										1. Scratch area for doing operations specified in the methods **(?)**
						3. Native method stacks
							1. If a java method calls a native method, this stack is created (dll say)
					4. Exceptions
						1. Recursive algorithms
							1. Suppose we miss exit criterion for recursion
								1. stack frames will continue to get pushed indefinitely
									1. Java stacks memory area will run out of memory

											java.lang.StackOverflowError
											
										1. Suppose we want to tune java stacks

												-Xss
												
											1. Size of stacks
												1. Sets thread stack size
												2. Thread stack is memory area allocated for a Java thread
					5. Each thread cannot (directly) see what is in the stack of other threads
						1. Whatever is in thread stack is generally thread safe (unless they have references to objects in heap)
					6. Method area & Heap - They are created per JVM
	3. Execution Engine
		1. Once current instruction to be executed is ready:
			1. Interpreter
				1. Interprets the current instruction (which is in bytecode) and executes it
					1. Takes bytecode instruction
					2. Finds out what native operation needs to be done
					3. Executes the native operation
						1. This is done using JNI & Native method libraries
							1. JNI - Java Native Method Interface
							2. Native Method Libraries (.dll, .so, ... - they are present in JVM)
								1. Available in: `jre/bin`
									1. windows - .dll
									2. unix/linux - .so or .a
			2. JIT Compiler
				1. If certain instructions are getting executed repeatedly (hotspots), those will not be interpreted again and again
					1. JIT compiler them compiles the set of instructions and keeps the target machine code ready for execution
						1. No interpretation is required
			3. Hotspot profiler
				1. It watches bytecode running and grabs different statistics - used by JIT compiler
				2. It helps JIT compiler compile frequently used instructions
			4. GC
				1. Scavanger
				2. Removes unused objects from heap
6. Summary
	1. Components
		1. Class loader subsystem
			1. Load
				1. Bootstrap class loader
				2. Extension class loader
				3. Application class loader
			2. Link
			3. Initialize
		2. Runtime data areas
			1. Method area
			2. Heap
			3. Java stacks
			4. PC Registers
			5. Native Method Stacks
		3. Execution Engine
			1. Interpreter
			2. JIT Compiler
			3. Hotspot Profiler
			4. GC
		4. Native Method Interface (JNI)
		5. Native Method Libraries (.dll, .so, etc...)