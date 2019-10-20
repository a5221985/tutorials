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
	1. Load: responsible for loading bytecode to memory
		1. Bootstrap class loader
	2. Link
	3. Initialize

## JVM Run Time Data Method Area - Part 1 ##
## JVM Run Time Data Method Area - Part 2 ##
## JVM Run Time Data Method Area - Part 3 ##
## JVM Execution Engine Overview ##
## JVM - Conclusion ##
## JVM Memory Management Introduction ##
## JVM Memory Management Stack ##
## JVM Memory Management Heap Part 1 ##
## JVM Memory Management Heap Part 2 ##
## Java Memory Management Summary ##
