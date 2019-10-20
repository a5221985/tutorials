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
		1. Verify - starts after loading in complete
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
1. 

## JVM Run Time Data Method Area - Part 2 ##
## JVM Run Time Data Method Area - Part 3 ##
## JVM Execution Engine Overview ##
## JVM - Conclusion ##
## JVM Memory Management Introduction ##
## JVM Memory Management Stack ##
## JVM Memory Management Heap Part 1 ##
## JVM Memory Management Heap Part 2 ##
## Java Memory Management Summary ##
