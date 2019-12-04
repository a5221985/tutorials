# Deep Dive into Java Virtual Machine Architecture and Java Memory Management #

## Course Introduction-JVM and Java Memory Management ##
1. What you will learn in this Course:
	1. JVM Architecture
	2. Java Memory Management - Heap and Stack
2. How the course will benefit you
	1. Better understanding of JVM architecture and Java Memory Management
	2. Prepare for Core Java job interviews
	3. Help you to be better Java Programmer

## Introduction to JVM ##
1. Java Virtual Machine (JVM)
	1. A JVM is an abstract computing machine that enalbes a computer to run a Java program
		1. To know and understand the internal working of a JVM
		2. Components of JVM
		3. Under the hood understanding of what heppens to Java program
	2. JVM has two purposes
		1. Load the .class file
		2. Execute the bytecode
2. Example:

		Abc.java - javac -> Abc.class - java Abc -> JVM instance/RAM
		
	1. When `java` command is executed, a JVM instance is constructed,
3. How does jvm load and execute a class

		Class loader: loads execution file (.class file)
			Also loads built in class files (String.class, Object.class, ...)
			Loaded class (bytecode) is fed into the execution engine
		Execution Engine: 
			Executes bytecode
			
	1. Execution engine talks to the OS
		1. Uses native method calls
		2. It is translated into machine code and executed on the machine
4. Class is loaded into memory area
	1. It is called Memory area/Runtime Data Area

## JVM ClassLoader Overview ##
1. Class Loader - activity
	1. Load: responsible for loading bytecode to memory (following types of class loaders exist)
		1. Bootstrap class loader - (base class)
			1. loads Java internal classes
				1. Reside in `rt.jar` - distributed in JVM implementation
					1. Contains all core Java API classes
		2. Extension class loader - (child class of bootstrap class loader)
			1. Loads additional class files present under `/jre/lib/ext` folder
				1. All class files will be read for further processing
		3. Application class loader - (child class of Extension class loader)
			1. Loads classes specified in Classpath
	2. Link
		1. Verify - starts after loading is complete
			1. Verifies the loaded bytecode for validity and compatibility with JVM spec
			2. Checks:
				1. Magic number checks...
		2. Prepare
			1. Memory is allocated to static variables
			2. Variables are assigned default values
				1. Not for instance variables
		3. Resolve
			1. Symbolic references in the classes are changed to direct references (to a class)
	3. Initialize
		1. Initialize
			1. Static variables and class variables are assigned to proper values
			2. Static blocks are executed
2. The phases verify, prepare and resolve may get executed in parallel
3. Example failures:
	1. Classnotfound Exception:
		1. Happens when class loader fails to find the bytecode for the class

## JVM Run Time Data Method Area - Part 1 ##
1. Runtime Data Area:
	1. Areas:
		1. Method Area: class metadata for class is stored
			1. Stores runtime constant pool field and method information, static veriables, method bytecode - allocated in physical memory
			2. `-XX:MaxPermSize` - Called permgen space - default size is 64MB but can be tuned using the parameter
				1. Needed if too many classes need to be loaded then the following error may occur
			3. `Java.lang.OutOfMemorryError:PermGen` space
				1. PermGen space is too low
				2. Solution: Tune it
					1. Java 8 does not have
						1. New space is called the following:
			4. From Java 8 - Metaspace
				1. Consumes memory from native OS
					1. It has no limit virtually because it is using OS space
		2. Heap Area
		3. Stack
		4. PC register
		5. Native Method Stack

## JVM Run Time Data Method Area - Part 2 ##
1. Heap area: (only one universal area for JVM)
	1. Java.lang.OutOfMemoryIssue Heap
		1. Object allocation does not have sufficient heap space
	2. `-Xms`, `-Xmx`
		1. min and max sizes of heap
		2. Default: 1/4th the physical memory of machine
2. Heap:
	1. Objects are created here

## JVM Run Time Data Method Area - Part 3 ##
1. PC Register - program counter register - pointer to next instruction to be executed (per thread one)
	1. PC1 for t1 (thread 1)
	2. PC2 for t2
	3. PC3 for t3
2. Java Stack - when a method is executed, a stack frame is added to the stack, when method returns, frame is removed (contains parameters, local variables, return values, operand stacks)
	1. Per thread
	2. Created when thread starts
	3. t1, t2, t3 - application threads
	4. `Java.lang.StackOverflowError` - usually occurs for infinite recursion
	5. `-Xss` - used to increase stack size
3. Native Method Stack
	1. If a method in a thread is invoking a native method, (loading dll)
		1. Native stack is used which is per thread

## JVM Execution Engine Overview ##
1. Execution engine
	1. Java interpreter
		1. processes bytecode instruction and analyzes native operation and executes native operation
		2. Uses Native Method Interface (JNI)
		3. JNI interfaces with Native Metod Libraries (.dll, .so, ...)
	2. Profiler
		1. Hotspot profiler
			1. Keeps an eye on bytecode and grabs info
				1. It can be used by JIT to compile frequently used instructions
	3. JIT compiler - used to fix slowness of interpreter
		1. compiles bytecode instructions and keeps target code ready for execution (repeated instructions are done once) - native code
			1. execution of native code is faster than interpreting code
	4. GC - Cleans up un-used objects and classes in memory area

## JVM Memory Management Introduction ##
1. Two types of memory
	1. Stack memory
		1. Stores primitive types and addresses of objects
		2. Every thread has its own stack so there could be multiple stacks in a JVM
	2. Heap Space
		1. The object value is stored in actual Heap
		2. There could be only one Heap space in a JVM
2. Stack:
	1. Abstract data type which serves as collection of elements
		1. Push - which adds an element to the collection
		2. Pop - which removes most recently added element
		3. LIFO - Last in First Out
3. Stack Memory in Java World
	1. For every thread JVM will construct runtime stack
		1. This stack will store method specific values
	2. As soon as method ends, block becomes unused and become available for next method
	3. Whenever a method is invoked a new block is invoked in method memory to hold local values and reference to other objects
	4. Stack memory is always referenced in LIFO order
	5. Stack memory is less compared to Heap memory

## JVM Memory Management Stack ##
1. Example:

		public class StackExample {
			public static void main(String[] args) {
				int i = 10;
				methodM1();
			}
			public static void methodM1() {
				int j = 10;
				methodM2();
			}
			public static void methodM2() {
				int m = 30;
			}
		}
		
		t1:
		
		methodM2()
		m = 30
		-------
		methodM1()
		j = 10
		-------
		main()
		i = 10
	
	1. JVM frees up stack after execution of thread t1

## JVM Memory Management Heap Part 1 ##
1. Heap: A large amount of objects, kept in a disordered manner
2. What is Java Heap Space?
	1. Java heap space is used by Java run time to allocate memory to objects and JRE class
	2. As there is one heap space per JVM any object created in heap space has **global access** and can be referred anywhere from application
3. Garbage collectors cleans up the heap space if objects are not referrenced in the application

## JVM Memory Management Heap Part 2 ##
1. Example:

		public class HeapExample {
			public static void main(String[] args) {
				int m = 0;
				createBall("red");
			}
			public static void createBall(String color) {
				Ball redBall = new Ball(color);
			}
		}
		
		
		t1:
		createBall()
		redBall --------------> Ball
		------------
		main()
		m = 0
		
	1. When execution of `createBall` is completed, the stack frame is destroyed (no reference to `Ball` object)
	2. `Ball` object is eligible for garbage collection

## Java Memory Management Summary ##
1. Stack memory is faster than heap memory
2. Memory spaces:

		OS Mem
			JVM Mem
				Stack size -Xss Thread Stack Size
				Heap size -Xms (Min Heap Size), -Xmx (Max Heap Size)

3. Memory Exceptions:
	1. `java.lang.StackOverFlowError`
		1. When there is no memory left in stack to store method call or local variable. Use `-Xss` to define stack memory size
		2. Usually with recursive calls
	2. `java.lang.OutOfMemoryError`
		1. When there is no more heap space for creating the object. Use `-Xms` and `-Xmx` JVM options to define start up size and maximum heap size 	
		2. Could be because of memory leak (objects are not getting cleared)
