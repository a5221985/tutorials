# Concurrency #
1. Java is designed from ground up for concurrent programming
	1. Java programming language and Java class libraries have the support
	2. High level concurrency APIs exist
2. Topics
	1. Basic concurrency support
	2. High-level APIs in `java.util.concurrent` packages

## Processes and Threads ##
1. Two basic units of execution:
	1. Processes
	2. Threads
		1. Java is concerned with this
2. Latest computer systems have multiple cores
### Processes ###
1. Has self contained execution environment
2. Has complete and private set of basic run-time resources
	1. Own memory space
3. Application may be a set of cooperating processes
	1. IPC may be used (pipes, sockets)
		1. Same system
		2. Different systems
4. Java app can create additional processes using [ProcessBuilder](https://docs.oracle.com/javase/8/docs/api/java/lang/ProcessBuilder.html) object.

### Threads ###
1. Sometimes called lightweight processes
2. Processes and threads provide execution environment
	1. Thread creation requires fewer resources than process creation
	2. Threads exist within a process (Each process has at-least one)
	3. Threads share resources
		1. memory
		2. open files
	4. Thread communication is more efficient but problematic
3. Every Java application has atleast one thread (more if we count system threads that do memory management, signal handling)
	1. One from application programmer's point of view

## Thread Objects ##
1. Each thread is associated with an instance of the class [Thread](https://docs.oracle.com/javase/8/docs/api/java/lang/Thread.html)

### Defining and Starting a Thread ###
### Pausing Execution with Sleep ###
### Interrupts ###
### Joins ###
### The Simple Threads Example ###

## Synchronization ##
### Thread Interference ###
### Memory Consistency Errors ###
### Synchronized Methods ###
### Intrinsic Locks and Synchronization ###
### Atomic Access ###

## Liveness ##
### Deadlock ###
### Starvation and Livelock ###

## Guarded Blocks ##
## Immutable Objects ##
### A Synchronized Class Example ###
### A Strategy for Defining Immutable Objects ###

## High Level Concurrency ##
### Objects ###
#### Lock Objects ####
#### Executors ####
##### Executor Interfaces #####
##### Thread Pools #####
##### Fork/Join #####
#### Concurrent Collections ####
#### Atomic Variables ####
#### Concurrent Random Numbers ####
#### For Further Reading ####