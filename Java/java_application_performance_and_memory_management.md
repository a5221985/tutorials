# Java Application Performance and Memory Management #
## Introduction ##
### What do we mean by performance, and what versions of Java does this course cover ###
1. Overview:
	1. how to improve performance of apps running on vm
	2. avoiding mistakes that leads to poor performance
2. Performance considerations:
	1. Memory constraints
	2. Application speed
3. How to improve?
	1. Design time aspects
	2. Runtime aspects - tune VM
4. VM - execution environment
5. Focus on both aspects
	1. Program (20% here)
	2. execution environment (80% here)
6. Note: External factors are not handled (database connections, ...)
	1. Solutions:
		1. Scaling databases
		2. Caching connections
		3. Asynchronous calls
7. Covers Java versions 8 and 11 (long term support and next is 17 and can be used in production systems)

### Example code provided with this course ###
1. [https://www.udemy.com/course/java-application-performance-and-memory-management/learn/lecture/14402482#overview](https://www.udemy.com/course/java-application-performance-and-memory-management/learn/lecture/14402482#overview)
	1. Download the code

### Using different JDK and JVM vendors ###
1. Vendors:
	1. Oracle JDK
	2. OpenJDK
2. Most times it doesn't matter
	1. Tool bundled with Oracle JDK needs to be explicitly downloaded for OpenJDK
3. Hotspot VM implementation is used in the course (mostly used)
	1. Other implementations - Eclipse openj9 (this is slightly different)
4. Tools to help us understand how our apps work
	1. Open source
	2. Tools that work on any JDK and VMs

### The structure of this course ###
1. Part 1 - How the JVM runs your code (at runtime)
	1. How compiler works
	2. What JVM does at runtime to run the code in an optimal way
	3. Gives deeper understanding of the internals of JVM
		1. Gives easy potential optimisations to start with
		2. Gives basic understanding for the rest of the course
			1. For covering topics in detail
2. What is going on under the hood
	1. More competent and confident programmer
3. Chapters 2 and 3 - how jvm runs
4. Part 2 - How the JVM Manages Memory
	1. Chapters 4 - 10: A good understanding of how memory works in Java, role of stack and heap, how memory is allocated
		1. We can change a number of defaults which can be changed
			1. Can give us some performance improvement
5. Part 3 - Garbage Collection and Heap Analysis
	1. Chapter 11 - 15: Further optimisation techniques from programming choices
		1. To minimize garbage collection
		2. To select appropriate garbage collection algorithm for our specific needs
			1. Tuning how algorithm works
6. Part 4 - Measuring Performance
	1. Chapter 16 - 19: How profilers can help us find problems in code, how to use benchmarkings to assess whether alternative coding choices can perform better or worse
		1. JMH - Benchmarking framework
7. Part 5 - How programming Choices Impact Performance
	1. Colletions
		1. How do the different types of collections work?
			1. To make choice of right type of collection for our specific needs
				1. Lists
				2. Maps
				3. Other coding issues
					1. Do we need to use StringBuilder
					2. Are primitives faster than objects
					3. ...
8. Part 6 - The Future and Other JVM Languages
	1. Chapter 23 - GraalVM
		1. Replacement for JVM - signifant performance for JVM
	2. Chapter 24 - Other JVM languages
		1. Do Scala, Clojure or Kotlin perform better than Java?

### How to get support while you're taking this course ###
1. Q & A - Top right link (Dashboard)
	1. Q & A tab
		1. Questions and answers
		2. We can ask questions
		3. We can add answers
	2. We can send message to Instructor for Profile page
	3. Send review and comments

## Just In Time Compilation and the Code Cache ##
### What is bytecode? ###
1. What happens inside the JVM?
	1. The Java code is compiled by compiler into bytecode (.class) and they go into jar or war
	2. Bytecode is run by JVM
		1. JVM interpreting the bytecode (important feature)
			1. Write code once and run it on any hardware machine
		2. JVM has more features and complex algorithms than just interpreting
			1. Makes is more efficient than traditional code interpreter
				1. PHP - interpreter is used
					1. Look
					2. Analyze
					3. Way to execute is determined as needed
				2. JVM - much more complicated
					1. Any language that can be compiled to a JVM compatible bytecode can be run on a Java virtual machine
						1. Kotlin, Scala, Clojure, ...
							1. We can compare the bytecodes

### The concept of "Just In Time Compilation" ###
1. Initially JVM acts like an interpreter
	1. Makes it slow (compared to c)
		1. c is compiled to native code (there is no software in the middle to interpret because cpu can run the instructions directly)
		2. Solution: JVM JIT
			1. JVM monitors which branches of code are run the most often
				1. Which methods or parts of methods (especially loops) are executed frequently
					1. VM can decide which code is executed most often and that code can be compiled to machine code to speed up the execution
						1. Parts of the application are run as bytecode & other parts are run as native machine code
							1. Native machine code can run faster than bytecode
								1. Native machine code: understood by OS directly (Windows or Linux or Mac)
									1. Native windows code is different from native Mac code
			2. Windows JVM is able to construct Windows native code and Mac JVM is able to construct native mac code
				1. It is transparent to user
				2. **Implication: Code runs faster the longer it is left to run**
					1. VM can profile our code and work out which bits of the code can be optimised by compiling them to the native machine code
						1. If a method is run multiple times every minute, it is likely to be JIT compiled very quickly
						2. If a method that might run once a day, might not every be JIT compiled
					2. The process of compiling the bytecode into native machine code is run in a separate thread
						1. VM is a multithreaded application
							1. The thread that is responsible for running the code (the one interpreting the bytecode) and executing it, wont be affected by the thread doing JIT compiling
								1. Process of JIT compiling (runs in parallel) doesn't stop the app from running
								2. While compilation is taking place, the JVM will continue to use the interpreted version
									1. When compilation is complete (to native machine code), and the native machine code version is available, the VM will seamlessly switch to use the compiled version (instead of the bytecode)
										1. If the application is using all of the avilable CPU?
											1. We could potentially see a temporary reduction in performance if JIT compilation is taking place
												1. It would be in critical and high power processing applications, we might notice this - native version is still beneficial (how?)
2. One impact of JIT
	1. If we assess the performance:
		1. If we are running two versions of methods and want to check which one runs more quickly
			1. We get different results when we compare the performances when application starts and when we compare when the application is run for a while
				1. Before native compilation or after?
3. As a developer we want to know which methods are being compiled to native machine code
	1. Any method or any code block (at a high level) 

### Introducing the first example project ###
1. We want to know which methods or code blocks are being compiled when the application runs
	1. JVM flag - to find out
		1. Use Example 1 program
			1. New project
				1. PerformanceExample1
					1. Project can be configured from existing course
	2. `PrimeNumbers.java`
		1. `args` - number of prime numbers
		2. `generateNumbers(Integer max)`
			1. Adds prime numbers to `ArrayList` and prints them out
2. To run: Run as > Run Cofigurations
	1. Arguments: 10
3. Run from commandline:

		cd bin
		java Main 10

### Finding out which methods are being compiled in our applications ###
1. Compiler Flags:
	1. `-XX:+PrintCompilation`
		1. To find out what kind of compilation is happening
		2. `-XX` - advanced option
		3. `+` or `-` - to switch the option on or off
		4. `PrintCompilation` - option
	2. It is case sensitive and it is a sentence case (Each word starts with a capital letter)
2. `java -XX:+PrintCompilation Main 10`
3. To run through IDE:
	1. Run Configurations:
		1. Arguments:
			1. VM Arguments:

					-XX:+PrintCompilation
					
				1. It is every bit of compilation that VM is doing when the application runs
					1. Columns:
						1. First column: Number of milli seconds since the VM started
						2. Second column: Order in which the method or code block was compiled
							1. It just means that some parts took longer to compile than others
								1. Could be due to
									1. Multi-plexing issues
									2. Complexity or length of the code being compiled
						3. Third column: 
							1. `s` - synchronised method
							2. `n` - native method
							3. `!` - some exception handling
							4. `%` - code is natively compiled and is running in a special part of memory called the **code cache**
								1. Method is running in the most optimal way possible
						4. Fourth column: number from 0 - 4
						5. Fifth column: line of code that is actually being compiled
							1. This examples shows that most of the code is Java library methods
								1. Run the example with larger numbers
									1. Comment out the println and give 5000 (from console window)
										1. `%` symbol appears against `isPrime` - it is placed in code cache
										2. Number of 0 - 4 
											1. 0 - code is just interpreted (no compilation)
											2. 1 - 4 (progressively deeper levels of compilation has happened)
												1. `isPrime` is at level 4
												2. `getNextPrime` is also at level 4 (but not placed in code cache)

### The C1 and C2 Compilers and logging the compilation activity ###
1. Two compilers built into JVM
	1. C1:
		1. It can do first 3 levels of compilation (1 - 3)
			1. Each is more progressively complex than the last one
	2. C2:
		1. It can do the fourth level
2. VM decides which level of compilation to apply to a particular block of code based on how often it is being run and how complex and time consuming it is (profiling the code)
	1. Higher the number, the more profiled the code is
	2. If we have reached level 4, then C4 compiler was used
		1. JVM can then decide that the code is used so much that it can put into code cache (quickest in accessibility and running)
	3. Higher the compilation tier, the more optimised the compiled code should be
		1. If the code is doing something complex then there may not be any benefit in deeper level of compilation
			1. Same method `isPrime` got compiled to tier 3 and then to tier 4 later on and also placed in code cache
4. Alternate - to print to file (needs more work to read through)
	1. Two flags are required:

			java -XX:+UnlockDiagnosticVMOptions -XX:+LogCompilation Main 5000
			
		1. A file is produced (`*.log`)
			1. Search for `isPrime`
				1. A queued task (`task_queued`)
				2. Next: `nmethod`
				3. Next: `nmethod` - level 4
					1. Shows C2 compiler is used
					2. Shows level 4

### Tuning the code cache size ###
1. Code Cache has limited cache
	1. If a lot of methods that could be compiled to this level
		1. Some of the methods need to be removed to make room for the next one to be inserted
			1. Removed method could be re-compiled and added later on
				1. Large applications:
					1. Some methods could be moved into code cache and out and back in ...
						1. Default code cache might not be sufficient
							1. Solution: Increasing size of code cache can lead to improvement in application performance
								1. **Warning: VM warning: CodeCache is full. Compiler has been disabled** - if code cache is full
	2. The warning indicates that there is another part of code that could be compiled to run better but there is no room for the code
		1. Also that all parts of code in code cache are actively being used and there is no code that could be cleanup up effectively
		2. It is not optimal
2. To find size of code cache: `-XX:+PrintCodeCache` **(M)**
	1. `java -XX:+PrintCodeCache Main 5000`
		1. CodeCache: size=~2MB, used=~1MB
			1. If used reaches almost equal to size, then tweek to code cache size might be useful
				1. Max code cache size:
					1. Java 7 or below: 32 MB (32 bit), 48 MB (64 bit JVM)
					2. Java 8 or above: 240 MB (64 bit JVM)
3. VM args to change code size:
	1. `InitialCodeCacheSize` - size of code cache when application starts (usually quite small - 160 KB)
	2. `ReservedCodeCacheSize` - max size of code cache (cache can grow upto this size maximum)
	3. `CodeCacheExpansionSize` - How quickly the code cache should grow
		1. If it gets full (with current size), how much extra space should be added (each time we grow)
	4. The values can be provided in Bytes, KBs (`k` or `K`) or MBs (`m` or `M`) (Gigs use `g` or `G`)
	5. Example:

			java -XX:ReservedCodeCacheSize=28m - XX:+PrintCodeCache Main 5000
			
		1. Code cache size has increased

### Remotely monitoring the code cache with JConsole ###
1. JConsole **(M)** - 
	1. jdk-installation
		1. bin/jconsole.exe
			1. Double click
	2. Local Process (or Remote Process)
		1. Mac or Linux (Eclipse process is shown), Windows (not shown)
			1. JConsole monitors a folder
				1. The folder is not writable in Windows
					1. `Users/<username>/AppData/Local/Temp/hsperfdata_<usernam>`
						1. Right click > Properties > Security > Every one > Check Modify (or full control)
			2. Restart any Java application (Restart ecplipse)
		2. Go to JConsole
			1. PID appears (Eclipse)
			2. Connect
				1. Memory tab
					1. Code Cache (Max: 240 MB)
2. To connect to our application: Make the app to work a bit longer

		main(...) {
			Thread.sleep(20000);
			System.out.println("starting the work...");
			...
			
	1. `java Main 5000`
	2. Connect to the app in JConsole
		1. Code cache size - it is bigger than usual (why?)
			1. `java -XX:+PrintCompilation Main 5000`
			2. Immediately connect JConsole to the application
				1. A huge amount of compilation will go on!
					1. **Problem**: VM is doing some extra work to provide the communication and the information that JConsole needs to display it's charts
						1. That code is also compiled to code cache at times (so uses extra 2 MB of code cache)
3. Next: Using the information to optimise the application at runtime

## Selecting the JVM ##
### The differences between the 32 bit and 64 bit JVM ###
1. We can install 32 bit or 64 bit JVM
	1. 32 bit - chosen for either 32 bit OS or 64 bit OS
		1. Why 32 bit for 64 bit OS?
			1. If application does not require too much mem
				1. If heap size is < 3 GB (then this might be faster than 64 bit)
					1. Each pointer is only 32 bits => manipulating these pointers is quicker
					2. Max heap size = 4 GB (to use this)
		2. Only C1 compiler is available
			1. Client compiler (C1)
				1. If an application is short lived - just runs and finishes -> it is a client application
				2. For short lived application, startup time is important (should start quickly and run)
				3. It is unlikely that there will be many methods that will be run a sufficient number of times to warrant native code compilation
	2. 64 bit - chosen for 64 bit OS
		1. If application needs heap > 4 GB
		2. This might be faster if using long / double
		3. Don't just pick this for smaller application
		4. Max heap size is determined by OS
			1. Windows: 1.2 GB
		5. Both C1 and C2 compilers are available
			1. Client compiler (C1)
			2. Server compiler (C2)
				1. An application that tends to live longer like a server application can be considered as a server application
				2. Startup time is less important (performance of application is optimised over time)
2. For short lived applications that do not have much memory requirements might perform better on a 32 bit JVM

### Specifying which compiler to use at runtime ###
1. For Mac and Spark OSs, 32 bit JVM is not avaialable
	1. Solution: We can specify a flag to dictate which compiler is used at runtime
2. Running only with client compiler may give a better startup time
3. We can also tell JVM not to use native compilation (to save time)
4. Flag: `-client` **(M)** (for 64 bit compilers)
	1. In some OSs this flag is ignored (for long running code)
		1. But startup time can be quicker because less analysis would take place upfront
5. Testing startup time:

		// Remove thread.sleep(...)
		// Remove printline
		Date start = new Date();
		...
		Date end = new Date();
		
	1. `java -XX:+PrintCompilation Main 15000`
	2. `java -client -XX:+PrintCompilation Main 15000` (runs quickly)
6. Test on hardware on which the application is going to be deployed
	1. JVM compiler flags
		1. `-client`
		2. `-server` - 32 bit server compiler
		3. `-d64` - 64 bit server compiler
	2. For most OSs these things don't work like they should
	3. On most OSs, if 32 bit OS, can choose `-client` and `-server` (`-d64` flag gives an error)
		1. But if 64 bit OS, we get 64 server compiler whether we choose `-server` or `-d64`

### Turning off tiered compilation ###
1. Flag: `-XX:-TieredCompilation` (not sure if we have to use it) - to turn off (because it is on by default)
	1. Scenarios:
		1. One line of code only
		2. Serverless application
2. Running with the flag off and comparing the performance
	1. `java -XX:-TieredCompilation Main 5000`
		1. No compilation tiers showing
	2. `java Main 5000` - a fraction quicker run
3. It is unlikely that we might want to turn off tiered compilation

### Tuning native compilation within the Virtual Machine ###
1. `getNextPrimeAbove` - first column shows that it is compiled to level 4 much later on
2. JVM decides when and which methods to compiled (based on how many times the method is called and lookps in the methods)
	1. The details are very technical
3. Two factors affect the performance of the application
	1. How many threads are available to run the compiling process
		1. Default number of threads - depends on the number of CPUs in the computer
			1. cygwin is used in Windows (to see the long output which would not be possible with standard cmd)
				1. `java -XX:+PrintFlagsFinal`
	2. What is the threshold for native compilation
		1. How many times the method needs to get run before Java decides that the method needs to get compiled
			1. `CICompilerCount` - 3 - threads available for compiling our code
			2. Another way:
				1. `jinfo -flag CICompilerCount <pid-of-java-application>` **(M)**
					1. `jps` **(M)** - gives pids of current running java applications
						1. First PID can be chosen
	3. We can increase it to 4 and see the impact:

			java -XX:+PrintCompilation Main 15000
			java -XX:+PrintCompilation -XX:CICompilerCount=6 Main 15000
			
		1. Min number:
			1. 32 bit machine - 1
			2. 64 bit machine - 2 (one C1 and one C2)
		2. `-XX:CompileThreshold=n` - The number of times a method needs to run before it is natively compiled

			1. `jinfo -flag CompileThreshold <pid>`
				1. The number counting is not just simply how many times the method is run but it is more complex
					1. We can reduce the number and see
					2. The compilation will be faster
						1. `java -XX:CICompilerCount=6 -XX:CompileThreshold=3000 Main 15000`
							1. Makes difference with large applications

## How memory works - the stack and the heap ##
### Introduction - the structure of Java's memory ###
1. It is an important topic to understand the impact of memory on performance
	1. Because Garbage Collection impacts performance
		1. It removes memory no longer needed
2. To understand GC, we need to understand how memory works
3. Understanding memory helps us make programmatic choices that can make efficient use of memory
	1. Or making inefficient use of memory thereby minimizing the need for Garbage Collection
		1. Next: Different collection types in Java and how they work
4. We can tune the VM about how much memory the application can use and how that is distributed within different areas of memory (we need to know what those areas are and how are they used)
5. The way memory works in VM is incredibly complicated
	1. Only important concepts are explained here and the pictures are simplified versions of reality
6. Internals of memory storage - later

### How the stack works ###
1. Stack & Heap & MetaSpace (3 sections of memory)
	1. Stack - 
		1. They are many stacks
			1. Every thread will have it's own stack
				1. Very efficient data structure which is managed very effectively by the java virtual machine
					1. Java knows exactly when the data on the stack will be destroyed
		2. Working:
			1. Pushed to top
			2. Pop from top (only last item can be removed)
			3. Primitive variables
				1. Stored on stack

						newValue = 20 // removed
						tempValue = 10 // removed
						data = 7 // removed
						value = 7 (out of scope for calculate)
						args = empty array
						
						value = 20 (out of scope for calculate)
						args = empty array
						
						empty stack (when we reach the end of application)
				
				2. When we return from method, all the data of the method are popped (it is fast for JVM to do)
					1. Memory is freed up
					2. When we reach `}`, any local variables declared inside the block are popped off the stack and destroyed automatically (applies to any code block)
						1. This is the reason for scoping
							1. Variables declared within a code block are visible only to the code block
					3. JVM developers could have used any other data structure but knowing that a stack is used helps us understanding scoping
				3. Stacks are good for local variables - because they are meant to have a shorter lifetime
				4. It stores simple objects such as primities
	2. Heap

### How the heap works ###
1. Heap - 
		1. Used to store objects (complex)
		2. One heap is shared across all the threads of the application
		3. Most objects are quite big and most programs want to pass around objects across blocks of code
			1. With heaps it is easy to do
				1. Example: Suppose customer object has many fields and need to be passed to another method
					1. If stored on stack, we need to copy the entire object for the method
		4. All code blocks in our application can potentially access the heap
			1. Data in stack can only be accessed by it's thread and cannot be accessed by other applications
			2. Data on the heap can be accessed by multiple threads if programmed in a way to allow it
		5. Strings are also stored on the heap
		6. A variable reference to the object in the heap is stored on the stack
		7. Example:

				int age = 21;
				String name = "Hello";
				
			
				stack:				Heap
				name ----------> String: Hello
				age = 21	
				
			1. `name` is a pointer to the object in heap that lives in stack
			2. All data in application is accessed through stack
				1. Either fully (primitives)
				2. Or using a pointer to an object in heap

2. Example:

		public class Main {
			public static void main(String[] args) {
				List<String> myList = new ArrayList<String>();
				myList.add("One");
				myList.add("Two");
				myList.add("Three");
				printList(myList);
			}
			
			public static void printList(List<String> data) {
				System.out.println(data);
			}
		}
		
		stack				heap (usually massive compared to stack)
		
		
	1. Stack contains memory address of the object stored in heap
	2. Java Memory - The Rules
		1. Objects are stored on the heap
		2. Variables are a reference to the object
			1. If the reference is a local variable, it is stored on the stack
		3. Local variables are stored on the stack (do not reference any objects on heap)

### The heap and the stack together - an example ###
1. Stack and heap

		stack				heap
		data   -------->       # reference in myList is copied to data
		myList --------> List (in Java we cannot view this address)
								0 -> String: "One" (can only be accessed using list)
								1 -> String: "Two"
								2 -> String: "Three"
								
	1. In code we can only directly access the variables on the stack and the String is not directly reachable
	2. Objects in heap don't have to be stored in any logical order (they can appear anywhere)
	3. The List is not copied
2. Example:

		public static void printList(List<String> data) {
			String value = data.get(1);
			data.add("Four");
			System.out.println(value);
		}
		
		stack				heap
		value ---------------------|
							List		v
								1 --->String: Two
								...
								4 --->String: Four
								
	1. "Two" is reference from two different places
	2. When we return to the calling method, the method is going to see a modified list (extra item "Four")

## Passing objects between methods ##
### What does "passing by value" mean? ###
1. When values are passed to methods
2. Example: New project > ExploringMemory
	1. Main.java

			public static void valculate(int calcValue) {
				calcValue = calcValue * 100;
			}

			public static void main(String[] args) {
				int localValue = 5;
				calculate(localValue);
				System.out.println(localValue);
			}
			
		1. When we pass a value to a method, we are only passing a copy of that value

				calcValue = 5
				localValue = 5
				
					|
					v
					
				calcValue = 500
				localValue = 5

### What does "passing by reference" mean? ###
1. Some languages allow us to pass by reference
	1. VB has `byref`

			public static void calculate(byref int calcValue) {
				calcValue = calcValue * 100;
			}
			
			calcValue = localValue = 5 # they reference the same variable (not copy)
			
			calcValue = localValue = 500
			
		1. Use case: If we want to return multiple values in other languages
		2. In Java: Wrap the multiple values in a class and return an instance reference of this class

### Passing objects into methods ###
1. Passing by Value
	1. Pointer is copied across
	2. For objects passed into methods, the REFERENCE to the object is passed BY VALUE
2. Example:

		public class Main {
			public static void main(String[] args) {
				Customer c = new Customer("Sally");
				renameCustomer(c);
				System.out.println(c.getName());
			}
			
			public static void renameCustomer(Customer cust) {
				cust.setName("Diane");
			}
		}
		
		Stack					Heap
		cust -------------->
		c -----------------> Customer
									name ------> String: Sally
									
		Stack					Heap
		cust -------------->
		c -----------------> Customer
									name ------> String: Diane
												String: Sally (not referenced)
												(mem used by object can be freed for other objects to use)

### The final keyword and why it's not the same as a constant ###
1. Example:

		final Customer c = new Customer("John");
		
	1. Variables can be final
		1. Cannot be changed
	2. Classes and methods can be final
		1. Methods: Cannot be overriddent by subclasses (cannot override from a final method)
		2. Classes: Cannot be subclassed (cannot override from a final class)
2. Final: Generally seen as a good thing from a performance perspective
	1. It allows Java compiler to optimise the code
	2. We may not see any noticable improvement in performance but it is not detrimental
	3. Inlining is done
		1. Example: `int a = 10`
			1. Everytime this reference appears, the compiler just insterts the value 10 instead of looking up the value
				1. May not always be possible
					1. `final` - The real meaning is - the variable can only be assigned once
						1. It cannot be altered
						2. But variable can be changed from un-initialized value to initialized
3. Example:

		final Customer c;
		c = new Customer("John"); // allowed
		c = new Customer("Susan"); // not allowed - compiler error

### Why the final keyword doesn't stop an object's values from being changed ###
1. `final` - we cannot change the variable to point to a different object in the heap
	1. We can change the parameters in the object

			c.setName("Susan"); // allowed
			
		1. `final` doesn't make the object unchangeable
			1. Othe languages have this feature called const correctness
				1. Allows us to write much safer code
2. `const` in Java (c - uses it for **const correctness** **(M)**) is a reserved keyword
	1. It was considered to be thought about for implementation but never happened
		1. Example:

				final Customer c = new Customer("John");
				// is this method still safe?
				System.out.println(c.getName());
				System.out.println(c.getName()); // we cannot be sure that this will return the same value as the previous one
				
				public String getName() {
					String temp = this.name;
					this.name = "XXX";
					return temp;
				}
				
			1. The objects could have incorrect values
3. Convention: All parameters passed into methods should be final (coding standard say)
	1. For performance it is fine but it does not stop the method from changing the inner values

## Memory exercise 1 ##
### Instructions for the exercise ###
1. Open up the MemoryTest project - before you run the project, work through the code and predict the outcome!
2. Example:

		public class Main {
		
			public void start() {
				String last = "Z";
				Container container = new Container();
				container.setInitial("C");
				another(container, last);
				System.out.print(container.getInitial());
			}
			
			public void another(Container initialHolder, String newInitial) {
				newInitial.toLowerCase();
				initialHolder.setInitial("B");
				Container initial2 = new Container();
				initialHolder = initial2;
				System.out.println(initialHolder.getInitial());
				System.out.println(newInitial);
			}
		
			public static void main(String args[]) {
				Main main = new Main();
				main.start();
			}
		}
		
		Stack				Heap
		initial2 -------------------> Container
												initial ----> "A"
		newInitial -----------------> "Z" (same)
					 						"z" (is never referenced)
		initialHolder --------------> *intial2
		container ------> Container: --x--> "A" (free for GC)
								initial --x--> "C" 
										 ------> "B"
		last -----------> String: "Z"
		main -----------> Main:

### Walkthrough of the solution ###

## Escaping References ##
### Introduction - what is an escaping reference? ###
1. A Problem:
2. Strategies that do not have direct impact on performance are important
	1. Helps programmers in the long term
3. How escaping references is a problem and how to identify them and strategies we would use to avoid them
4. Copying collections - there is performance impact
5. Why is escaping references a problem
6. How to identify them
7. Strategies to avoid them
8. Avoiding escaping references is some work
9. Encapsulation
	1. Data and functionality are packaged together with access to data within class being strictly controlled
	2. Example:

			public class CustomerRecords {
				private Map<String, Customer> records;
				
				public CustomerRecords() {
					this.records = new HashMap<String, Customer>();
				}
				
				public void addCustomer(Customer c) {
					this.records.put(c.getName(), c);
				}
				
				public Map<String, Customer> getCustomers() {
					return this.records;
				}
			}

	1. The last method can be used for iterating

			CustomerRecords records = new CustomerRecords();
			
			records.addCustomer(new Customer("John"));
			records.addCustomer(new Customer("Simon"));
			
			for (Customer next : records.getCustomers().values()) {
				System.out.println(next);
			}
			
		1. `getCustomers` returns a reference to the records collection
			1. The client code can do anything it likes with the collection

					CustomerRecords records = new CustomerRecords();
					
					Map<String, Customer> myCustomers = records.getCustomers();
					
					myCustomers.clear(); // This is bad!!!
					
				1. The author of the `getCustomers` method probably didn't want the client method to change the collection
				2. The `Map` is like a public variable now (we have violated the encapsulation rules)
					1. Pain: Debugging
						1. If we find invalid values - difficult to verify where in our code did the objects change

### Strategy 1 - using an iterator ###
1. How to get - around?
	1. Do not return a pointer to existing objects
2. Load EscapingReference project in Eclipse

		records.getCustomers().clear(); // deletes customers
		
		for (Customer next : ...)
			...
			
	1. Doesn't print anything
3. We can make the class a iterable class

		public class CustomerRecords implements Iterable<Customer> {
			...
			@Override
			public Iterator<Customer> iterator() {
				return records.values().iterator();
			}
		}
		
	1. Change to client:

			for (Customer next : records) {
				System.out.println(next);
			}
			
		1. Have removed the escaping reference?
			1. We can actually mutate?

					Iterator<Customer> it = records.iterator();
					it.next();
					it.remove(); // removes an object from collection
					
			2. It is not a perfect solution
				1. Good enough solution because it is more complex to mutate
4. The change is 0 impact solution
	1. Has no impact on the performance

### Strategy 2 - duplicating collections ###
1. A better solution:

		public Map<String, Customer> getCustomer() {
			return new HashMap<>(this.records); // returning a copy of the hashmap
		}
		
	1. If collection2 = collection1
		1. collection2 points to same object as collection1
		2. `collection3 = new ArrayList<Customer>(collection1);`
			1. Customer will get a personal copy
				1. Even if customer changes, the original object doesn't get corrupted
2. Cons: Not a perfect solution
	1. User might still change the underlying collection & think that they have changed the original collection
		1. Confusion
3. Example:
	1. `records.getCustomer().clear()` - does not clear original collection
4. Might be good enough for our project
5. Performance impact:
	1. Overhead
		1. Retrieving the original collection
		2. Memory allocation to new collection
		3. Copying elements to new collection
	2. This might have minimal impact
		1. There is no way to know the size of the pointers (JVM implementations may differ)
		2. JVM uses either 4 or 8 bytes depending on the JVM
		3. Suppose there are 100000 objects in the collection
			1. We need to copy 800KB of memory (relatively quick)
	3. The new object returned is usually going to be short lived
		1. The mem is going to be freed up very quickly
			1. Short lived objects are good in terms of GC performance (heuristics)

### Strategy 3 - using immutable collections ###
1. Better solution:
	1. Return a new immutable collection
		1. A collection that cannot be edited
	2. < Java 10 - We need to use the `Collections` class

			return Collections.unmodifiableMap(records); // always makes a copy
			
	3. >= Java 10

			return Map.copyOf(records);
			
		1. Slight performance improvement (potential)
			1. If original collection is unmodifiable, it would just return that collection
2. Solution: Return unmodifiable copy of the collection

### Strategy 4 - duplicating objects ###
1. Other types of objects

		public Customer find(String name) {
			return records.get(name);
		}
		
	1. The customer state can be mutated (escaping reference)

			records.find("John").setName("Jane");
			
			System.out.println(records.find("John")); // Prints Jane
			
	2. Solution: Read only copy
		1. Option1: Copy constructor for the class

				public Customer(Customer c) {
					this.name = c.getName(); // only property reference is copied
				}
				...
				public Customer find(String name) {
					return new Customer(records.find(name));
				}

### Strategy 5 - using interfaces to construct immutable objects ###
1. Client might think change has persisted (no indication that it didn't)
2. Read only copy of Object
	1. Customer
		1. Refactor > Extract Interface > `ReadOnlyCustomer`
			1. Only `getName` and `toString`
		2. `find`

				public ReadOnlyCustomer find(name) {
					return new Customer(records.find(name));
				}
				
				// The following cannot be compiled
				records.find("John").setName("Jane"); // compile time error
				
		3. Customer can get over this:

				ReadOnlyCustomer c = records.find("John");
				Customer customer = (Customer) c;
				customer.setName("Jane"); // we did not mutate
				
3. Performance impact:
	1. Duplicating all properties in the heap
	2. Not much impact

### Strategy 6 - using modules to hide the implementation ###
1. Java 9 or above - module system (to package up the code but not allow client code to use the customer class)
	1. Example: Customer
		1. Right click on `src`
			1. `module-info.java`
			2. New package > `com.virtualpairprogrammers.escapingreferences.customers`
				1. `ReadOnlyCustomer`
				2. `CustomerRecords`
			3. New package > `com..virtualpairprogrammers.escapingreferences.customers.customerImplementation`
				1. `Customer`
			4. module-info.java
			
					module EscapingReferences {
						exports com.virtualpairprogrammers.escapingreference.customers;
					}
					
		2. New Java project: EscapingReferencesClient

				module EscapingReferencesClient {
					requires EscapingReferences;
				}
				
			1. Right click on client project > Build Path > Configure Build Path > Projects tab > Module Path > Check EscapingReference
			2. New class: main.Main

					CustomerRecords records = new CustomerRecords();
					
					records.addCustomer("John");
					records.addCustomer("Simon");
					
					for (ReadOnlyCustomer c : records) { // Customer c is not allowed because it is not allowed by module
						System.out.println(c);
					}
					
					ReadOnlyCustomer customer = records.find("John"); // Customer class is not accessible
					
				1. In CustomerRecords

						public void addCustomer(String name) {
							this.records.put(name, new Customer(name));
						}
						
2. This is probably the safest way to get over escaping references.

## Memory Exercise 2 ##
### Instructions for the exercise ###
### Walkthrough of the solution ###

## The Metaspace and internal JVM memory optimisations ##
### The role of the Metaspace ###
1. So far we have covered a good representation of things working in general
2. This chapter: Memory that does not follow the rules that we have learnt so far
3. Metaspace is small compared to heap
	1. General Metaspace (information about classes, methods, which methods were compiled to bitecode and which have been compiled to native code) - This information is completely out of reach to us as programmers (even if we could see it, we will not be able to explore it)
	2. Static variables
		1. Similar to stack
			1. Static primitives - entirely stored in metaspace
				1. `static int globalVersion = 3;` - solely in metaspace
				2. `static Map<String, String> settings = new HashMap<>();` - settings is created in metaspace, Map object is created in the heap
					1. All the String objects that are part of the Map live on the heap
			2. Static objects - stored on the heap but pointer or reference is held in metaspace
4. Variables in the metaspace are permanently there - They can never reach a state when they will no longer be referenced
	1. Objects referenced from metaspace will never be garbage collected
	2. All classes and all threads in a Java program have access to the metaspace 
		1. Static variables can be accessed by any piece of code we write in our application because thread that runs the code can access the metaspace
5. Public vs Private
	1. Example:

			public class Customer {
				private Integer id;
				public String name;
				...
			}
			
		1. Following code is possible:

				Customer c = new Customer();
				c.name = "Paul";
				
				stack				heap
				c -------------> Customer
										id
										name ------> String: Paul
										
			1. It is still stored in exactly the same way as a private variable

### The PermGen ###
1. Java 7 - The PermGen
	1. This is not relevant anymore
		1. There were problems with PermGen
			1. For the applications using PermGen, the area of memory might get full (this should never happen with metaspace)
				1. Why? Next: Tuning
				2. `java.lang.OutOfMemoryError:PermGen` - way to get around the problem - increase the size of the PermGen
				
						-XX:PermSize=N
						-XX:MaxPermSize=N
						
					1. These flags are no longer valid (from version 8)
						1. Warning: We are using invalid flags
							1. No error - flags will be ignored

### Are objects always created on the heap? ###
1. Stack's scope is very tight (it is based on code blocks)
	1. Often we want objects to live longer than their enclosing scope and that is why objects are created on the heap (we can share the objects between methods)
	2. Objects in the heap might live for a short while or very long
		1. In C, C++, Pascal and VB, we have the option of choosing whether to store the objects on the stack or on the heap
			1. Java did not offer that option and decided to place all objects on the heap - to simplify choices for the programmer (single clean way of doing this)
				1. If object is not going to be shared and it is needed only in one method or within one code block
					1. It would be more efficient to have the object created on the stack rather than the heap
						1. We as programmers do not have that choice but modern VMs are very efficient and very clever
							1. If it detects that the object we are instantiating is not going to be shared (doesn't go out of the code block it is created), the object can be instantly freed up and the memory can be released - VM will then instantiate the object on the stack - it won't impact us
2. VM stores objects very efficiently
	1. objects might get created on the stack entirely for performance benefit - we get this for free

### The String Pool ### 
1. Exploring strings project
	1. New project - ExploringStrings
		1. main.Main

				String one = "hello";
				String two = "hello";
				
				System.out.println(one.equals(two));
				System.out.println(one == two); // same references
				
				stack			heap
				two --------->
				one ---------> String: hello 
				
			1. Strings are immutable (and the rule that two separate objects are created does not apply to Strings)
				1. Java re-uses Strings
					1. Java puts Strings in pool and re-uses the strings which are in the pool
						1. Only happens with little strings
							1. Won't happen with strings calculated from something else

									Integer i = 76;
									String three = i.toString();
									String four = "76";
									System.out.println(three.equals(four)); // prints true
									System.out.println(three == four); // different references - prints false
									
								1. The calculated String will not be placed in the pool - it won't be re-used
								2. But there is a feature in the VM that we can look at in tuning
									1. VM can actually detect duplicated strings and will remove one of them and make the two point to the same underlying string
										1. **String de-duplication**
											1. At some point in the future, the second statement can print true

### Interning Strings ###
1. `three` - we need to place it in pool
	1. `four` can re-use the string

			i.toString().intern(); // placed in string pool
			
		1. very long strings wouldn't be placed in the pool
			1. Why?
		2. Why use `intern` - to re-use and minimize objects created
			1. Minimizes objects to be garbage collected when they are no longer needed
			2. There is some expense running the `intern`
	2. < Java 7
		1. String pool was in the PermGen space
	3. >= Java 7
		1. String pool is in heap
			1. => Strings can be garbage collected
				1. If no longer referenced

## Tuning the JVM's Memory Settings ##
### How the string pool is implemented ###
1. JVM Flags - to tune memory settings to optimise it's performance when application runs
	1. String pool - implemented using a HashMap
		1. Set of buckets - 16 buckets (standard hashmap)
		2. A calculation takes place which uses the hash code of the string
			1. Determines which bucket the string needs to live in
				1. Example: hashcode("Mouse") -> "Mouse"
				2. Strings with same hashcode will be in the same bucket
		3. Check to see if String exists in the pool
			1. If it does not exist, then add it
			2. O(1) time - find the bucket and check if it exists
				1. Searches the bucket
		4. Size of pool - 16 and grows
			1. If number of buckets is small and if we have a large number of strings, strings in each bucket might be large
				1. Checking every string in the bucket if that string is already there would take time (inefficient)
			2. If number of buckets is large, it could make it inefficient
				1. Not so important
2. There is no much need to optimize the interning process

### Understanding the size and density of the string pool ###
1. JVM flag to get information about strings in application
	1. `-XX:PrintStringTableStatistics`
		1. Simple application: ExploringStrings
			1. There is a bug in openjdk 11 (it might have fixed later or 12 ...)
				1. Use Java 8
		2. main.Main

				public static void main(...) {
				
				}
				
			1. `java -version` (11)
				1. `java -XX:+PrintStringTableStatistics Main` - Fatal error
				2. Use Java 8
					1. Symbol table
					2. String Table - this is what we want to see
						1. When JVM starts app - 731 strings are already placed in string pool (core java libraries and metadata strings)
						2. Default size: 60013 (since Java 8)
2. Large number of strings:

		Date start = new Date();
		List<String> strings = new ArrayList<>(); // to avoid garbage collection due to no reference
		for (Integer i = 1; i < 1000000; i++) {
			String s = i.toString().intern(); // a lot of strings are added to string pool
			strings.add(s);
		}
		Date end = new Date();
		System.out.println("Elapsed time was " + (end.getTime() - start.getTime()) + " ms."); // not very scientific - there are better ways to do this
		
	1. `java -XX:+PrintStringTableStatistics Main`
		1. Bucket size: 60013
		2. Maximum bucket size: 196 (to check if the string exists, JVM needs to scan through these number of strings towards the end)
			1. Condensed string pool - might slow down the application

### Tuning the size of the string pool ###
1. String pool - number of buckets will not increase over time. Whatever is selected at the beginning is going to remain during the length of the application
2. Flag: `-XX:StringTableSize=120121` - prime number > 60013 (next prime bigger than double - 120121)
	1. `java -XX:+PrintStringTableStatistics -XX:StringTableSize=120121 Main`
		1. Average bucket size has reduced to 83
		2. Max - 157 (less dense)
		3. Memory foot print has not increased much with increase in the number of buckets

### Tuning the size of the heap ###
1. String pool lives in heap (Java >= 8)
	1. heap should be big enough to store the footprint of the string pool
	2. Size of the heap: `java -XX:+UnlockDiagnosticVMOptions -XX:+PrintFlagsFinal`
		1. `MaxHeapSize` **(M)** - in bytes (4 GB)
		2. `InitialheapSize` **(M)** - (264 MB)
	3. The numbers are based on the hardware we are using
		1. Amount of physical memory
		2. 32 bit version or 64 bit JVM
			1. Look at the sizes for the hardware and the JVM version
2. `MaxHeapSize`
	1. `java -XX:MaxHeapSize=600m -XX:+PrintStringTableStatistics -XX:StringTableSize=120121 Main` (can be big enough to hold the memory requirements of the application)
		1. If application needs more than 4 GB, then setting this is important or the application is going to crash
			1. `java.lang.OutOfMemoryError: Java heap space` - don't simply increase heap size
				1. It could be memory leak (next)
					1. Instead - lower the size of the heap to test if the application is running efficiently
	2. `InitialHeapSize` - When application starts, Java requests the initial heap size amoaunt of memory from the OS
		1. It does not request the maximum (wasteful)
			1. If it needs more, it requests more from the OS
				1. Asking might have some impact on performance
					1. Solution: `InitialHeapSize` - the application we know might require 800 MB so we can set it to 1 GB to start with - which does not require VM to ask for more heap size
		2. Example: `java -XX:InitialHeapSize=1g -XX:+PrintStringTableStatistics -XX:StringTableSize=120121 Main`

### Shortcut syntax of heap tuning flags ###
1. Alternatives:
	
		-Xmx : -XX:MaxHeapSize
		-Xms : -XX:InitialHeapSize
		
	1. Example: `java -Xms1g -Xmx2g -XX:+PrintStringTableStatistics -XX:StringTableSize=120121 Main`

## Introducing Garbage Collection ##
### What it means when we say Java is a managed language ###
1. Sometimes objects are added on the stack and for string pool, VM might just re-use objects
2. When we finished using an object in Java, we don't have to tell that we no longer need it
	1. VM works this out automatically
		1. C++ - programmer must tell this explicitly
			1. `free`, `delete`
	2. Memory leak - even after program runs, the memory is still in use and it can only be freed by restarting the computer
		1. Program is compromising the integrity of the computer that it is running on
		2. Computer might crash
		3. Hard to detect
			1. It may take a long time before it is detected
			2. If it is detected, it can be catastrophic
	3. Java solved this problem by being managed langauge
		1. Memory leasks shouldn't be possible in Java
			1. When we call `new`, we are not taking memory from OS (memory is acquired by the VM)
				1. VM is just another program written in C
					1. The C program will control the requests for memory from the OS and it controls freeing up of memory when objects are no longer needed
					2. Controls when to put `free` to free memory
						1. JVM developers have taken care of putting them in the right place (or else all around the world there would be bug reports about it)
							1. OS level memory leaks should be impossible (if it happens, it is not the fault of the Java programmer)
		2. Garbage Collection is the process to free up memory
			1. It was invented for Lisp
			2. Automatic process analyses the heap and works out which objects are no longer needed
				1. Any un-used objects can be deleted and the memory can be freed up

### How Java knows which objects can be removed from the Heap ###
1. Simple rule - Any object on the heap which cannot be referenced from the stack is eligible for GC
	1. Example: 

			stack			heap
							Double: 17.6 (garbage)
							
		
							List (garbage) - cannot be reached from the stack
								0 ---> Customer: A (garbage)
								1 ---> Customer: B
								
							objA:A ----> objA:B ----> objA:C ---> objA:A
							
		1. static objects are referenced from the metaspace
			1. Any object that is un-reachable from the stack or the metaspace
				1. static objects will never be eligible
2. As a programmer, we are not supposed to control this process

### The System.gc() method ###
1. As a programmer, we have very little control over gc.
	1. The gc should be treated as an automatic process - we don't want to interfere with it
	2. `System.gc()` - It suggests that the VM runs the gc process
		1. It is not a command
2. Method in use: GarbageCollection project - load it (Java 8 version)
	1. Customer, Main
		1. Million customers and adding to list

				Runtime runtime = Runtime.getRuntime();
				
				List<Customer> customers = new ArrayList<>();
				
				for (int i = 0; i < 1000000; i++) {
					customers.add(new Customer("John"));
				}
				
				long avilableBytes = runtime.freeMemory();
				System.out.println("Available memory at start: " + avilableBytes / 1024 + "k");
				...
				avilableBytes = runtime.freeMemory();
				System.out.println("Avialable memory when customers created: " + availableMemory / 1024 + "k");
				
				customers = new ArrayList<>();
				
				availableBytes = runtime.freeMemory();
				System.out.println("Available memory when customers no longer referenced: " + availableBytes / 1024 + "k");
				
				Thread.sleep(1000);
				
				availableBytes = runtime.freeMemory();
				System.out.println("Available memory 1 second laster: " + availableBytes / 1024 + "k");
				
				System.gc();
				
				availableBytes = runtime.freeMemory();
				System.out.println("Available memory after GC suggestion: " + availableBytes / 1024 + "k");
				
			1. After `System.gc()` - may prompt to VM (no guarantee that GC will run)

### Java 11's garbage collector can give unused memory back to the operating system ###
1. Might be different for Java 11
	1. avialable memory gets reduced tremendously (if GC runs)
		1. Optimisation - didn't exist in Java 8
			1. Tuning - next
				1. VM wont immediately reserve 4 GB - requests as needed when needed
				2. Java 11 - VM requests more memory that it doesn't need and it will give back to the OS
					1. Java 8 - memory can never go down
					2. Java 11 - it can go down
						1. From a performance point of view - it is impactful
							1. Every request from VM to OS has slight performance impact
								1. Way around that - flag - initial heap size
									1. Java 11 - If we use the flag, the VM will not allow memory reserved to go below that initial heap size
			2. Run Configurations > VM arguments:

					-Xms300m
					
				1. Free memory is equal to or greater than 300m

### Why it's not a good idea to run the System.gc() method ###
1. It is not a good idea to run the `gc()` command
	1. It is using up system resources - it can slow down or completely halt running of the main application
		1. This needs to run as efficiently as possible
	2. Letting VM run that is a good option
		1. When is it a good idea to ask VM to run `gc`?
			1. If we have two code alternatives and we want to test which one runs better, we might want to run `System.gc()` before running the actual code
				1. We cannot guarrantee this - not a good idea
2. We should not call this method in any code we write

### The finalize() method ###
1. When `gc` physically removes (not just mark it) object from the heap, JVM runs the `finalize()` method on the object
	1. Deprecated from Java 9
2. Not a good idea to put code in `finalize()`
3. Customer

		@Override
		public void finalize() {
			System.out.println("This object is being g.c.'d" + name);
		}
		
	1. Run for 100 customers

			...
			customers.add(new Customer("Customer " + i));
			...
			
		1. Not all customers are collection and they could be random (could be different customers and different number of customers)
			1. **The application finished before all of the objects were removed from the heap**
				1. The finalize didn't run at all for other objects
					1. Worst thing we can do in `finalize` is to put clean-up code (closing resources etc...)
						1. It may not run or if it runs, we don't know when it is going to run
4. Docs:
	1. Damages we could do
5. GC is only needed to keep the heap nice and tidy **while** the application is running
	1. If the program reaches the end and even if the heap is cluttered with lots of objects which are eligible for garbage collection, the JVM might decide not to run the GC
		1. In fact, if application is finished, the JVM might just destroy and remove the objects from memory and never run GC => `finalize()` may never be called

### The danger of using finalize() ###
1. Increase to million customers

		for (int i = 0; i < 1000000; i++)
			Customer c = new Customer("Customer" + i);
			
		...
		@Override
		public void finalize() {
			System.out.println("This object is being g.c.'d " + name);
			while (true) {
			
			}
		}
		
	1. When GC hits the `finalize` method of the object, it just hangs and never runs any other `finalize` methods - never finishes
		1. We have disabled GC process
			1. Amount of available memory might be less than initilal size we specified

## Monitoring the Heap ##
### What is a soft leak? ###
1. Memory leaks shouldn't be possible in Java
2. JVM releases all of it's allocated memory back to the OS when application finishes
	1. Traditional leaks are not possible
3. Some leaks are possible (soft leaks)
	1. When an object remains referenced when no longer needed (library or our code)
		1. The object is referenced from somewhere on the stack (and GC never releases it)
			1. When program ends, the JVM calls `free` and releases the memory to the OS
	2. While application is running, we are holding the memory in the heap that will never be used again
		1. We might possibly run out of heap space
			1. Web-server - possible
4. Load SoftLeaks Project (going to contain memory leaks)

		Customer {
			...
		}
		
		CustomerManager { // acting like a queue
			addCustomer(Customer customer) {
				...
			}
			
			public Optional<Customer> getNextCustomer() {
				if (lastProcessedId + 1 > nextAvailableId) {
					lastProcessedId++;
					return Optional.of(customers.get(lastProcessedId));
				}
				return Optioanl.empty();
			}
		}
		
	1. Just keeps adding objects
	2. Runnable tasks add and remove
		1. One thread keeps adding customer objects in an infinite loop
		2. Second thread removes customer objects (but at a slower rate)
			1. Java 8: `customer.isPresent()` - optional class
			2. Java 11: `customer.isEmpty()` - optional class
	3. 10 threads run the code
		1. How to know if the application will run out of memory after a long time?
			1. Run with a constrained amount of memory to see how it performs
				1. Application will run out of memory more quickly
			
						-Xmx10m
						
					1. `java.lang.OutOfMemoryError: Java heap space` 

### Introducing (J)VisualVM ###
1. To view stack and the heap
2. Oracle JDK 8: bin
	1. Run: `jvisualvm.exe`
3. OpenJDK: Download from https://visualvm.github.io/download.html
	1. Oracle project - free to download and use (GNU)
		1. Version 9 onwards, this is moved to `GraalVM`
4. Download and install
	1. Windows: Error that JVisualVM cannot detect local applications
		1. Fix: Fix was done previously (`Users/<username>/AppData/Local/Temp/hsperfdata_<username>` should be readable)
5. Left: List of applications running
	1. Eclipse - right click > Open
		1. Overview
			1. Max heap size
			2. Initial heap size
		2. Monitor
			1. Heap graph
				1. Yellow - total heap
				2. Blue - used amount of heap
				3. Sudden drop - GC was run
	2. VisualVM - Java app as well

### Monitoring the size of the heap over time ###
1. Heap size: -Xmx50m
	1. check heap in VisualVM
		1. We have used up all the available memory (some of the memory cannot be used - 8 MB)

### Fixing the problem and checking the heap size ###
1. Fix: Removing customer (instead of just getting customer)
	1. synchronize remove using `synchronized`
2. Run it again with `-Xmx50m`
3. Re-connect the application in Visual VM
	1. It is not growing over time

## Analysing a heap dump ##
### Generating a heap dump ###
1. If GC is not working and it is unable to free up enough space to run the application without crashing with out of memory error
2. Heap dump - file containing information about the heap at any fixed point in time
3. There are multiple options:
	1. JVisualVM
	2. Commandline - at every point application crashes with an out of memory error, generate a heap dump
		1. If production server - we want to know what went wrong
		2. Flags:

				-XX:+HeapDumpOnOutOfMemoryError
				-XX:HeapDumpPath=someFilePath
				
			1. Click on Heap Dump button - generates file
				1. Copy file location

### Viewing a heap dump ###
1. Tool to analyze the heap
	1. Memory Analyzer (MAT) - tool - https://www.eclipse.org/mat/downloads.php
	2. Unzip
	3. Run MemoryAnalyzer.exe
		1. File > Open Heap Dump...
		2. File > Acquire Heap Dump... (We can get heap dump from live running process)
		3. Copy file location and select
			1. Leak Suspects Report - what objects are kept alive on the heap and why they are not garbage collected (select this)
			2. Component Report - Duplicate strings, empty collections, finalizer, ...
		4. Details
			1. customers - almost all of the heap
			2. List of objects
2. The tools are useful to find out soft leaks and fix the problem

## Generational Garbage Collection ##
### How the garbage collector works out what is garbage ###
1. Process used by GC to determine which objects to collect
	1. It must be efficient
		1. Because some of CPU resources will be allocated to the garbage collection process
			1. Less processing power for the application which GC is taking place (the more efficient the GC is, the lower the impact on the application)
2. Modern GCs use a clever mechanism
	1. Some optimizations exist in VM around how heap is structured to make it efficient
3. Steps: Mark and Sweep
	1. GC looks for all of the objects that need to be retained and it rescues them
	2. Two stage process:
		1. First stage: Marking
			1. Program execution is first paused (Stop the World Event - STW)
			2. Marking will not work properly if there were any threads executing
			3. GC then checks every single live reference
				1. Looks at every variable in the stack & metaspace and follows it's reference
					1. Objects it finds at the end of the reference are marked as being alive and the rest of them as well
		2. Second Stage: Sweeping:
			1. Once objects are marked for keeping, a full scan of the heap takes place and memory occupied by objects not being marked during marking phase are freed up
			2. The objects kept are moved to single contiguous block of memory
				1. Prevents heap from becoming fragmented over time and makes it easier for VM to find memory to allocate to future objects
4. GC doesn't collect garbage but collects those objects not eligible for garbage collection and saves them
	1. GC is faster, the more garbage there is
		1. If everything is garbage, gc is almost instantaneous
			1. Marking phase takes almost no time
			2. All the heap can be disposed off
5. This is basic process but not full story

### Why the heap is divided into generations ###
1. If there are lots of objects that are not garbage, and because GC marking phase is a stop the world event, application might freeze for may be a second or more
	1. To avoid this, we have Generational GC
		1. Most objects don't live for long
		2. If an object survives it is likely to live forever
2. To make it as efficient as possible, the heap is organized into sections known as generational garbage collection
3. Two sections:
	1. Young generation (much smaller)
		1. Three sections
		2. New objects are created here
		3. It might fill up quickly and if it does, gc takes place only on young generation (based on the hypothesis that most objects don't live for long, the young generation is mostly full of garbage)
			1. The process should be very quick
				1. Application could freeze for a fraction of a second (unnoticable)
		4. Any surviving objects are moved to the old generation
			1. Young generation becomes empty
		5. GC in young generation is called a minor gc
		6. A lot of minor gcs will be taking place
		7. More efficient process
			1. Most of the time, GC will not look at the entire heap
	2. Old generation
		1. GC runs on this only if it is full - major GC
			1. Major GC is much slower because it has bigger memory to sweep and may be many objects are still alive
				1. Marking process might take much longer
		2. Compacting process: Moving all surviving objects into single contiguous part of memory would take some time
			1. Even this can be made efficient
		3. It may take a few seconds
			1. Might pause the application for a few seconds - noticable to user

### The internals of the young generation ###
1. Young generation is split into three more sections - to make the process even more efficient
	1. Eden
	2. S0 - survivor space
	3. S1 - survivor space
2. Initially all three spaces are empty
3. Working principles: Java 8
	1. When an object is created, it is placed in the eden space
	2. When eden space becomes full - could happen quickly
		1. GC process will takes place clearing the eden space and any surviving objects are moved to S0
	3. New objects can again be created in the Eden space
	4. Next time GC runs, marking process runs in both Eden space and in S0
		1. Any object surviving will move to S1 (including in Eden space)
			1. Both eden and S0 become empty
	5. If eden gets full again, then gc looks at Eden and S1 and moves surviving objects to S0
		1. S0 and S1 are used to swap surviving objects (no priority)
			1. Why?
				1. We are only looking at two thirds of the young generation
				2. Eden gc could be very quick because most objects are discarded
				3. The compacting process of moving surviving objects into contiguous memory is also very quick
					1. We have an area of memory reserved for that (S0 or S1 - whichever is not currently used)
					2. Minor impact - There will always be a small amount of memory unused (either S0 or S1)
						1. Minor tradeoff for performance tradeoff
							1. JVisualVM - Only 46 MB out of 50 MB is used because 4 MB contains survivor space that is unused (cannot be used)
			2. When objects are swapped from either S0 to S1 or S1 to S0, we say that the objects are one generation older
				1. If an object is swapped 5 times, we say it has servived 5 minor GCs (5 generations)
			3. After a number of swaps, the object is determined to be a long surviving object and will be moved to old generation
				1. The threshold for when this happens is configurable
4. Minor GCs happen very frequently
5. Major GCs are much slower but should be pretty rare

### Viewing the generations in VisualVM ###
1. Open VisualVM
	1. Open Eclipse
	2. Monitor
		1. Click on Perform GC
	3. Install a plugin
		1. Tools > Plugins
			1. Available Plugins: Visual GC
			2. Install
		2. Close and re-open the tab
		3. Click on Visual GC (Java 8)
	4. Build an appliction in eclipse
2. Connect to soft leaks application

### Viewing the heap when there's a soft leak ###
1. Soft leaks in broken mode (objects not getting cleared in collection)
2. CustomerManager: Change to `customers.get(0)`
	1. `-Xms50m`
3. Open connection
4. Over time, VM has increased S1 and S0 spaces (edent and Sis are made the same)

## Garbage Collector tuning & selection ##
### Monitoring garbage collections ###
1. Tuning the process - we can make it work the most efficient way for our application
2. GC algorithms - known as Garbage Collectors
	1. JVM decides which is the best based on the hardware
		1. We can find out which one is used
		2. We can change this - runtime arg
	2. We can also check how often GC is taking place in application
		1. `-verbose:gc` **(M)**
			1. `-verbose` has other options (Java docs)
3. New Application
	1. Main: Managed way of adding and removing Customers

			List<Customers> customers = new ArrayList<>();
			
			while (true) {
				Customer c = new Customer("Matt");
				customers.add(c);
				if (customers.size() > 100) {
					for (int i = 0; i < 10; i++) {
						customers.remove(0);
					}
				}
			}
			
		1. VM arguments:

				-Xms10m -verbose:gc # gc will work harder
				
			1. GC - young generation garbage collection
			2. FullGC - major garbage collection on the old generation
4. Ergnomics - GC is trying to change to structure of the heap to make it perform well (later on)
	1. size before -> size after (GC), amount of time it took
	2. A lot of GCs are happening
5. So far jdk 8 is used
6. jdk 11 is slightly different

		if (customers.size() > 10000) {
			for (int i = 0; i < 5000; i++) {
				customers.remove(0); // the customers will survive but not that long
			}
		}
		
	1. `-Xmx20m`
	2. Open JVisualVM
		1. Visual GC Tab
			1. Old generation will fill up quite slowly
				1. When it fills up, major gc is run
			2. VM has altered the sections of the heap at runtime
				1. survivors - 2 MB each
				2. Eden - 5.5 MB
				3. Old - 13.5 MB
			4. There is a flag that will turn off dynamic re-sizing
				1. `-XX:-UseAdaptiveSizePolicy` - enabled by default
					1. `jinfo -flag UseAdaptiveSizePolicy <pid>`

### Turning off automated heap allocation sizing ###
1. Garbage collections taking place in the young generation are better for performance than those taking place on old generation
	1. We know what the application is doing (key point)
		1. We must think about what the behaviour of our objects are
			1. Are they short lived?
				1. In the example, most objects are surviving number of garbage collections and they are going to be free (for a short while instead of no time at all)
					1. We can tune for this scenario
						1. **We want to minimize full garbage collection**
							1. We can resize using flags - more memory to young generation and less memory to old generation
								1. GC on young generation will happen less frequently => more objects will be garbage collected earlier
									1. => few of them will make it to old generation
							2. We can also set threshold on how many GCs the objects have to survive to get to the old generation

### Tuning garbage collection - old and young allocation ###
1. Flags:
	1. `-XX:NewRatio=n` **(M)** - how many times bigger should old generation be compared to the young generation
		1. `4` - old generation will be 4 times bigger than young generation (8 MB vs 2 MB)
		2. `jinfo -flag NewRatio <pid>`
		3. `NewRatio` - it cannot be below 1 (set to 1)
			1. Restart the application with `-XX:NewRatio=1`
			2. Re-connect
				1. Visual GC - Old generation is 1/2 of young generation
			
### Tuning garbage collection - survivor space allocation ###
1. `-XX:SurvivorRatio=n` **(M)**
	1. `jinfo -flag SurvivorRatio <pid>`
		1. S0 and S1 should be 1/8 of the young generation (3/4 - eden)
			1. `SurvivorRatio` - 5
				1. 2/5 th S0 & S1
				2. 3/5 th eden space
	2. `java -Xmx20m -XX:SurvivorRatio=5 -XX:NewRatio=1 Main`
		1. VM will resize them (even if we specify the size) if it thinks that it will make the application perform more optimally

### Tuning garbage collection - generations needed to become old ###
1. `-XX:MaxTenuringThreshold=n` **(M)** - how many generations should the object survive before it becomes part of the old generation
	1. `jinfo -flag MaxTenuringThreashod` - 15
		1. If it is lesses, the object will be promoted to old generation sooner (may be good in some circumstances)
			1. It is upper bound
				1. JVM can choose a value lower than this if it feels so
					1. We cannot increase to more than 15, we might get an error
						1. Some JVMs - 16 and higher is assumed to be infinity => never promote to the old generation
							1. Bad idea - 1/2 of the heap will never be used (wasteful)

### Selecting a garbage collector ###
1. Default garbage collectors of Java versions
	1. Three types:
		1. Serial - uses a single thread to perform gc work
			1. while gc takes place, the application is paused
				1. All threads in the application will be on hold
			2. If computer is running other applications, then gc will be competing with those applications for processing time
				1. If too many applications and low processing power, gc will take a long time
			3. Use case:
				1. When application's performance is not very important
					1. Single process computer
						1. Other applications are more important than this application
				2. Gets less access to CPU
				3. Background task
					1. Other application needs to be optimized for performance (this needs to sacrifice performance)
				4. `-XX:+UseSerialGC` **(M)**
		2. Parallel
			1. Performs GC on young generation in parallel => multiple threads performing GC process
				1. If multiple processors exist on the computer
				2. If processor can process multiple threads at the same time (hyperthreading)
				3. For larger data sets and gives better performance than serial gc
			2. This collector is called a **throughput collector**
			3. `-XX:+UseParallelGC` **(M)** - default if Java 8 or below
				1. Visual VM shows this for Java 8
		3. Mostly Concurrent
			1. It is the closest thing we can get to a realtime garbage collection
				1. Ideal case - application is not paused while the gc is taking place (but this gc gets very close to this)
					1. It is impossible
			2. This gc pauses the application to mark the object but resumes application while sweep takes place
				1. STW pause is minimized
			3. Two options:
				1. `-XX:+UseConcMarkSweepGC` **(M)** - Java 9 default
				2. `-XX:+UseG1GC` **(M)** - Java 10 and above it is default (It has significantly improved for Java 10)

### The G1 garbage collector ###
1. VM Arguments:
	1. `-Xmx50m`
	2. Open Visual GC
		1. S0 and S1 are of different sizes
		2. S1 is almost full but S0 is empty
		3. Old generation is filled a little
2. Why? G1 works differently
	1. Heap is split into regions - 2048 regions
		1. The regions are allocated to different parts of the heap
			1. Some are allocated to eden, some to S0, some to S1 and some to old
				1. Not all of the regions need to be allocated initially
				2. When java decides that region needs to be allocatd in young generation, it looks at regions allocated to young generation (eden, S0, S1), after gc, it re-allocates the number of regions allocated to each part of young generation to give it what it thinks will give optimal performance
					1. Each time young generation gc happens, the different parts of the heap might change
						1. Example:
							1. S0 can change to eden
							2. Some un-alloacted regions to eden space
					2. When full gc takes place
						1. gc will work out for each region in the old generation, which regions are mostly garbage
							1. It will collect the garbage from those regions first (Garbage first collector)
							2. It doesn't look at the entirety of the old generation
								1. If it can clear a few regions that is enough and entire old generation doesn't need to be looked at
								2. Full old generation gc is a rare occurrence
									1. It can just do a part of the major collection and free up enough memory to re-size and re-allocate different areas of the heap to different parts of the young and old generation to maximize the performance

### Tuning the G1 garbage collector ###
1. We don't need to tune it in most circumstances
	1. The tuning of a few things can be done for strange situations
		1. Flags:
			1. `-XX:ConcGCThreads=n` - number of threads available for smaller regional collectors
				1. Only used to limit the number of threads (for minimizing performance impact on other applications)
					1. Instead change it to other GC (serial gc)
			2. `-XX:InitiatingHeapOccupancyPercent=n`
				1. G1 gc starts whenever heap reaches certain amount of fullness - by default 45%
					1. Runs whenever entire heap size is 45% full (not just eden or S0 or S1 or old generation)
				2. We can change this to different percentage
					1. We can play and find out what is the best value for the application and system on which it is running

### String de-duplication ###
1. from Java 8 - update 20 - option for creation of more available space on the heap
	1. We must use G1 gc
		1. `-XX:UseStringDeDuplication` - It allows gc to make more space if it finds duplicate strings on the heap
			1. If there are strings referenced from stack (if they are not in string pool), gc compares each string to the other and if they have the same value, it changes the references of the stack variables to point to single object with that value
				1. Making second object available for gc
					1. Efficient because it uses hashcodes of the strings and compares hashcodes to find duplicates (can do it reasonably quickly)
						1. Extra overhead - to run it
			2. Use case - use it if we know that there are going to be a lot of duplicate strings and the objects are going to live for a long time (not going to gcd early) and the strings are not interned in the string pool and if in memory constrained environment
				1. Not common use case
2. Next - testing performance impact of the choices in a robust and meaningful way

## Using a profiler to analyse application performance ##
### Introducing Java Mission Control (JMC) ###
1. Concerns:
	1. CPU usage
	2. Network usage
	3. Disk usage
2. Profiler - needs to be used
	1. It is a separate application which can connect to a running JVM and extract data from it for us to review
		1. Profilers put extra demand on the VM
			1. Performance of application when profiler is attached can change adversely while profiler is attached
				1. Un-avoidable fact
					1. If we are profiling on limited resources, profiling software and application we want to profile are going to be competing for resources
	2. Many of profilers are commercial software
		1. JProfiler - 500 usd per license
		2. Yokit 
	3. Open source
		1. Java Machine Control (JMC)
			1. It was integrated into Oracle JDK in Java 7 (originally developed as part JDK from another vendor called JRocket)
			2. Oracle acquired JRocket
				1. For this and earlier releases of Java 8 JMC and a key feature called flight recorder only if we had commercial license
					1. JMC and flight recorder are now open sourced and are available as part of open jdk
						1. Early access at that time
							1. We may need to build

### Building the JMC binaries ###
1. github.com/JDKMissionControl/jmc
2. Look at the instructions
3. Before we start: Install git client, install maven
4. Configure JDK 8 as default (Java 11 cannot be used - will not compile)
	1. `echo $JAVA_HOME`
5. `git clone <url>`
	1. `cd releng/third-party`
	2. `mvn p2:site`
	3. `mvn jetty:run`
6. Open another terminal: (cygwin)
	1. Go to the project
	2. `cd core`
	3. `mvn clean install`
	4. `cd ..`
	5. `mvn package`
	6. Linux, Mac and Windows versions are created

### Running JMC and connecting to a VM ###
1. Github page: How to run
	1. `.../jmc.exe -vm ".../jdk.../bin"`
2. Left hand side - any java applications running
3. Only a fraction is explored in the course
4. Expand the eclipse section
	1. MBean server - select this
	2. Flight recorder
5. MBean mode - JMX console mode
	1. Right click > Start JMX console or double click MBean server

### Customising the overview tab ###
1. First dial - heap memory
	1. We can add dial to see eden space
		1. Click on + on the right
			1. Filter: *eden (regex)
				1. Usage > Used
			2. Edit display name: We can change the name of the dial
2. Graphs:
	1. We can click + against processor block
		1. Filter: *eden (incompatible options are grayed out)
	2. Click + against memory block
		1. Filter: *eden
		2. Usage > Used
	3. Click + on top right corner
		1. Filter: *sur
		2. G1 Survivor Space > Peak Usage > Used

### The MBean Browser tab ###
1. Full list of statistics - when we add dials or charts
	1. Filter: *eden
		1. G1 Eden Space
			1. We can choose one of the metrics and add to the dials or charts
				1. PeakUsage > Used > Right click > Visualize... > My Chart1
					1. Right click (first entry) - Peak Usage (name)

### The System, Memory and Diagnostic Commands tabs ###
1. System tab
	1. About hardware
2. Processors - 4
3. OS
4. Environment variables
	1. Java class path
	2. Java HOME
5. Memory tab
	1. GC info
	2. Threads
		1. Threads tab
6. Diagnostic commands
	1. Commands to run against JVM
		1. VM.info - execute
		2. VM.flags
			1. Boolean - true (tells value of every flag)

### Introducing our problem project ###
1. FibonaciPrimes project - fibonacci numbers that are prime
	1. Open in eclipse
		1. Badly written code - it will never complete
			1. It will not work well
			2. It is a multithreaded application
				1. Given each thread a name
	2. Connect to MBean Server
		1. Memory is changing a lot - lot of GCs taking place
		2. Roughly 1/2 of CPU resources - there is an opportunity to optimise
		3. Fragmentation - how much of the heap is free after garbage collection
			1. If it gets close to 100% - there is probably a memory leak (or else almost all of the heap should still be used)
	3. JMC doesn't give specific details about memory leaks but only a pressure that has built up
		1. We need to use other tools (Heap dump and analysys using MAT) to examine further
	4. CPU usage: JVM CPU Usage vs machine CPU usage - it is not as high as possible
	5. Threads tab
		1. Number of threads are blocked
			1. combinedNumbersThread - blocked many times
			2. main - TIMED_WAITING - it has been put to sleep
		2. Threads should be in RUNNABLE state as much as possible
			1. Overused synchronised - hence BLOCKED

### Using the flight recorder ###
1. MBEan Server - live view of JVM
2. We can use JMC to record metrics over time and then use JMC to view those metrics
	1. Flight recorder
		1. Actual flight recorder stores metrics about the aircraft
			1. If aircraft crashes and if flight recorder can be found, it can be used to find information about the state of the aircraft and it's systems during flight
	2. We can tell VM to record it's state and investigate it afterwards such as when application crashes
		1. Flight recording is looking at the application after it has finished running
			1. Application might still be running 
		2. It is now part of open jdk - out of the box
			1. Oracle JDK 8 or greater
	3. VM that actually does the recording process
		1. Two ways to generate recording
			1. Runtime argument
			2. We can ask JMC to ask JVM to record for us
				1. Expand flight recording option
					1. We need to enable it when we start recording
						1. `-XX:+UnlockCommercialFeatures -XX:+FlightRecorder`
	4. Double click on No Recording
		1. Select **Time fixed recording**
			1. Recording time: 5 min
		2. Select Continous recording - production system
			1. Data is kept in memory
				1. We can ask JVM to dump the recording to a file to analyse
					1. Maximum size - how big the file should be
					2. Maximum age - how long in time the data should be kept for
						1. 5 min
					3. Event settings: How intensive should the profiling be
						1. Continous - on server - production (lowest overhead) - < 1% overhead
						2. Profiling - on server - 2 % overhead (select this)
				2. Other options:
					1. What do we want to store in flight recording file
						1. Thread Dump (Every 10s)
						2. Memory profiling: Default
					2. Finish
3. From commandline:
	1. Example:

			-XX:StartFlightRecording=delay=2min,duration=60s,name=Test,filename=recording.jfr,settings=profile
			
		1. Oracle JDK: `-XX:UnlockCommercialFeatures -XX:+FlightRecorder`
		2. Open JDK: `-XX:+FlightRecorder`

### Analyzing a flight recording ###
1. Right click on My Recording
2. Dump the last part of the recording (last 5 minutes)
	1. Statuses
		1. Reds - Expand and read (taking lot of memory)
		2. Ambers - Method profiling - which methods are called most often
			1. Java Blocking - threads being blocked
	2. Choose Threads (from left)
		1. Status of threads over time
			1. Drag at the bottom and select a slice
				1. right click and Zoom to Selected Range
					1. main - blue (sleeping and other colors)
					2. fibonacci - green (running)
					3. combinedNumbersT... - pink (blocked)
						1. Hover mouse over the colors
							1. Also tells what is blocking this

### Improving our application ###
1. Amend code
	1. Open FibonacciPrimesImproved project
		1. Run it
	2. Open JMC
		1. Connect
			1. Start flight recording - 1 min fixed time
		2. Open threads section
			1. main - mostly blue
			2. combinedNumbersT... - green
			3. fibonacci - green
			4. primesGenerateorThr... - green
		3. Nothing is blocked
2. First page
	1. Application halts - gc
	2. Primitive to Object Conversion

## Assessing Performance ##
### Why benchmarking isn't straight forward ###
1. Time taken is measured (smaller segment of code)
	1. Complications:
		1. JVM decides which code blocks are natively compiled
			1. If we are comparing two code blocks, we don't know which one is compiled to native code
				1. In production, methods might get compiled to native code - performance impact
		2. Garbage Collection
			1. While our code is running - STW
2. Benchmarking
	1. Microbenchmark - measuring the performance of a small piece of code
		1. More complications:
			1. Assessing in isolation - we are not going to run the code as part of the project in which it sits
				1. Inaccurate - code could perform differently in say multithreaded environment with competition for cpu and memory
			2. Different Hardware - development machine may not match production (more CPU and memory)
				1. Could have performance impact
		2. We don't want to do this as a starting point for performance optimization
			1. It is better to write the code, deploy and if the method is called once a day, optimization is waste of time
				1. If called once a second - optimizing it makes more sense
		3. Profiling process should guide us to methods worthy of optimization
3. Could be dangerous - If we optimize based on benchmarking but in live environment, it is not optimal at all

### Setting up the code for benchmarking ###
1. Quick and dirty measurment - easy and quick to run - practical for most scenarios
	1. Open `isPrime`
2. New Project: Benchmarking
	1. Copy `isPrime` method class `NumberChecker`
	2. `Main`
	
			NumberChecker nc = new NumberChecker();
			System.out.println(nc.isPrime(23));
			System.out.println(nc.isPrime(22));
			
		1. We can optimize method
			1. `Integer` objects - we could use `int`
			2. Go upto square root only
	3. `isPrime1`

			public Boolean isPrime1(int testNumber) {
				int maxToCheck = (int) (Math.sqrt(testNumber));
				for (int i = 2; i < maxToCheck; i++) {
					if (testNumber % i == 0) return false;
				}
				return true;
			}

### A simple approach to micro-benchmarking ###
1. Measuring time:

		long start = System.currentTimeMillis();
		...
		long end = System.currentTimeMillis();
		System.out.println("Time taken " + (end - start) + " ms.");
		
	1. We want to run this method:
		1. A number of times

				for (int i = 1001; i < 2000; i++)
					nc.isPrime(i);
		
		2. With different values

### Adding in a warm-up period ###
1. Complications:
	1. Native compilation
		1. It will run faster if natively compile
			1. We can turn off Tiered compilation: `-XX:-TieredCompilation`
		2. Another way:
			1. Native compilation takes place if JVM thinks that the method is run many times
				1. Warm-up period: We can run the code many times for JVM to natively compile the code before we start measuring performance
				
						// warm-up period
						for (int i = 1; i < 10000; i++)
							nc.isPrime(i);
							
						System.out.println("warmup finished, now measuring");
						
					1. VM arguments
					
							-XX:+PrintCompilation
						
						1. Warm up period does most of the compilation in this case
							1. Pretty much fixed native compilation issue
				2. Change max value to 50000 for actual test
					1. 834ms - for 50000
						1. Run it multiple times to check if we are getting numbers that are very close (820 ms - 835 ms)

### Comparing two code alternatives ###
1. Change to `isPrime2`
	1. There is some compilation taking during measuring phase
		1. How to get around that problem:
			1. One fix: Change the warm up max value to higher number
			2. Second fix: Change CompileThreshold (methods will get compiled earlier)
				1. `-XX:CompileThreshold=1000` (default was 10000)
				2. Add a pause soon after warmup so that we can ensure that the compilation has definitely taken place before meausuring

						Thread.sleep(2000);
						
				3. 20ms - much more performant

### Using macro-benchmarking ###
1. An extreme example:
	1. When run in isolation, one of the versions runs significantly faster than the other
		1. Does it run better or worse when we deploy the actual application
			1. No obvious answer to this
				1. For this we need macro-benchmark
					1. To assess the performance of a small piece of code in the context of the entire system
						1. Similar to micro-benchmark
							1. Allow JVM to do native compilation as it sees fit
							2. Sensible measurement
								1. We could exclude startup time
2. Go to fibonacciprimes project
	1. Find 100 primes
		1. Change `target` to `8`

				long start = System.currentTimeMillis();
				...
				long end = System.currentTimeMillis();
				System.out.println("Time taken " + (end - start));
				
			1. 8.5 seconds - with isPrime
			2. 9.2 seconds - with isPrime2 (not optimal overall)
				1. Isolation testing may not improve overall performance
					1. This method might run faster but might put much pressure and other method might be running slowly

## Benchmarking with JMH ##
### Installing the JMH benchmarking tool ###
1. More robust - JMH (Java Microbenchmark Harness)
	1. Another part of open jdk
	2. It will setup for us an environment and test our performance in a much more powerful way
		1. It takes care of warm-up period for us
		2. It analyses our code in a more production like environment
		3. It will run our code thousands of times to be give us more robust picture as to how it is performing
2. Install JMH
	1. JMH project front page
		1. mvn instruction
			1. `cd test` - we can re-name the folder to `jmh_benchmarking`
			2. Open the project in eclipse
				1. Choose No (for compliance version)
			3. Run as Maven Build > eclipse:eclipse

### Constructing and running benchmarking ###
1. We can copy paste our code in the benchmarking project or use the jar file
	1. Using jar file approach - next chapter (more work)
	2. Copy pasting code
		1. New package > com.virtualpairprogrammers.primes
		2. New class > PrimeBenchmarking.java
			1. paste `isPrime` & `isPrime2`
			2. Then add benchmarking methods:

					@Benchmark
					public void version1() {
						for (int i = 1; i < 50000; i++) {
							isPrime1(i);
						}
					}
					
					@Benchmark
					public void version2() {
						for (int i = 1; i < 50000; i++) {
							isPrime1(i);
						}
					}
					
				1. MyBenchmark class
					1. Remove `testMethod` - empty test method - or else it will slow things down
				2. `cd jmh_benchmarking`
					1. `mvn clean install`
					2. `cd target`
					3. `test-1.0.jar` - tests we have written
					4. `benchmarks.jar` - contains all of benchmarking code
						1. This needs to be run
							1. `java -jar benchmarks.jar` - takes about 25 minutes (as per experience)
							2. Version 2 is about 200 times faster than version 1

### Using different benchmarking modes ###
1. Documentation for jmh is very light
	1. It is based on samples
		1. From jmh website:
			1. Click on Samples - Sample 2 is to look at
	2. `java -jar benchmark.jar -h`
		1. Commandline arguments
			1. How long it takes for operation to run (instead of ops/s)
			
					java -jar benchark.jar -bm avgt
					
				1. ~ 700 ms vs 4 ms

## Performance and Benchmarking Exercise ##
### Instructions for exercise 1 ###
1. 

### Walkthrough of the solution & setting up ready for the next challenge ###
### Instructions for exercise 2 (use JMH to macrobenchmark the project) ###
### Walkthrough of the solution - part 1 setting up the code ###
### Walkthrough of the solution - part 2 - integrating into JMH ###

## How Lists Work ##
### Why it's important to understand how the different List implementations work ###
1. Choices we can make when we are writing code
	1. How the choices affect the performance of our application
2. Different types of lists and how they work
	1. They perform differently under various scenarios
		1. Our choice can improve performance
3. Good understanding of what is going on under the hood

### The 8 different list implementations ###
1. We usually use ArrayList but there are 8 different implementations of lists
	1. `ArrayList`
	2. `CopyOnWriteArrayList` **(M)**
	3. `LinkedList`
	4. `AttributeList` **(M)**
	5. `RoleList` **(M)**
	6. `RoleUnresolvedList` **(M)**
	7. `Stack`
	8. `Vector` **(M)**
2. We might straight away discard a few options while choosing for performance
	1. `AttributeList` is a child of the `ArrayList` (extends)
		1. Designed to be used with `MBean`
			1. Not for generic list types
	2. `RoleList` & `RoleUnresolvedList` - extend `ArrayList`
		1. Specifically used for matching role objects
			1. Not generic list types

### The CopyOnWriteArrayList ###
1. A thread safe version version of ArrayList
	1. It is too costly ordinarily
		1. Traversal operations outnumber mutations then it is efficient
			1. Iterating through the list
			2. Mutations: adding or removing items or changing an item (pointing to a different item)
	2. If we call a method to change the list
		1. A copy of the list will be created and original list will remain intact
			1. Lots of objects might get created and rest of the objects might get garbage collected
2. Consider using it when:
	1. Multi-threaded application
	2. Multiple threads accessing the same list
	3. Lots of iterations / reads
	4. Few writes / additions / deletions
3. Do testing will determine if this is right for the scenario
	1. There are alternatives
		1. This never gives best performance (experience)

### The ArrayList ###
1. Most Java programmers are familiar with
	1. Implemented in memory as an array
		1. Array with 10 elements is created initially
		2. Size of the list is 0 (if `list.size()` is called)
		3. As we add items, the array gets filled up
			1. If we reach the end and we try to add eleventh item, a new larger array list is created in memory
			2. All the items in the original ArrayList are copied and the new item is added
			3. Original arraylist can be discarded (available for gc)
		4. Source code for ArrayList - jdk directory
			1. `lib/src.zip`
				1. `java.base.java.util.ArrayList.java` - 1400 lines of code
					1. `DEFAULT_CAPACITY` - 10
					2. `add`
						1. `add(e, elementData, size)` - current size
							1. If s matches the size of the arraylist, a method called `grow` is called
						2. `newCapacity` method is called
							1. newCapacity is 1.5 times old capacity

### Specifying the initial size of an ArrayList ###
1. Process of resizing could impact the performance of the application
	1. new array and copy and destroy old array
		1. If a lot of objects need to be stored, the re-sizing might be costly
			1. Solution: Provide initial size to constructor

					List<Book> books = new ArrayList<>(500000); // max size (Integer.MAX_VALUE - 8)
					
				1. No resizing is required until 500000 items are added
2. ListBenchMarking project
	1. Book class
	2. ArrayList (empty) with 10000000 books
		1. Check time - 6616 ms
	3. ArrayList set size 10000000 books
		1. Check time - 3105 ms (about 1/2)
3. Rule of thumb: Put a number that will be big enough to store all the objects
	1. Too big number might be wasteful

### The Vector ###
1. `ArrayList` is not the best choice for all scenarios
	1. `Vector`
		1. It is like `ArrayList` - resized over time
		2. We can specify initial capacity
		3. Difference?
			1. It was one of original collections (1.0 version)
			2. ArrayList was added to version 1.2
		4. It is there to ensure backwards compatibility
	2. Important difference:
		1. **It is thread safe** - alternative to `CopyOnWriteArrayList`
			1. It comes at a performance cost - don't use it unless we want to it to thread safe
		2. Synchronization blocks are used
	3. It is unlikely to be deprecated any time soon

### The Stack ###
1. It is a child object of the `Vector` (exists since 1.0 version)
	1. LIFO
		1. There are other objects that do this
			1. `Deque` - Double ended queue
				1. `LinkedList` - implements `List` and `Deque` interfaces
				2. `LinkedList` - better for Stack

### The LinkedList ###
1. There is no array to store the objects
	1. As each item is added to memory, pointers are added to previous and next item for order
		1. We can see previous and next item in the list
	2. If we remove an item from the list, previous and next pointers are updated
	3. If we add an item to the list, previous and next pointers are updated
	4. Simplified view:
		1. Instantiating a new LinkedList
			1. list points to Node object
				1. Middle pointer points to new item
				2. first pointer is null
				3. last pointer is null
			2. When we add a new object an new Node is created
				1. last pointer of the previous node points to the new node
				2. first pointer of the current node points to previous node
		2. Advantages:
			1. No re-sizing of arrays
			2. No concept of initial size
	5. This allows navigating both forward or backwards following the pointers

### Choosing the optimal list type ###
1. Selecting between ArrayList or the LinkedList
	1. Scenarios:
		1. If we want to add items to end of the list - ArrayList is fine (only if re-size is required it is costly because new array needs to be created with data being copied from original array and old array getting gcd)
			1. LinkedList: If we are adding to the end - we are simply adding a pointer (always be quick)
				1. Getting to last item is quick as well (Java maintains a pointer to the last item)
		2. Adding item to the start of a list
			1. It is quick in a LinkedList - updating pointers
			2. It is more complicated in ArrayList - all existing items need to be shifted to the right by one space to accomodate new item
				1. For big array, it is expensive
		3. Removing an item
			1. ArrayList - All the items to the right of the item need to be shifted left by one position - copying is expensive
				1. It is easy to go straight to the item
			2. LinkedList - Changing pointers only on previous and next node
				1. Caveat - we need to iterate to the item first
					1. Slow operation
						1. We need to call `get` to find the item
							1. All pointers need to be navigated until we find the item
		4. Getting a random item
			1. ArrayList - fast because we can directly go to the item using it's index
			2. LinkedList - slow because we need to navigate through the pointers until we reach the item
2. Change ArrayList to LinkedList and benchmark in the project

		// Using ArrayList
		Book book = books.get(4967421);
		System.out.println(book);

	1. 1 ms
	2. Change to LinkedList

			// Using LinkedList
			Book book = books.get(4967421);
			System.out.println(book);
		
	3. 125 ms
3. Summary:
	1. ArrayList
		1. Good for
			1. Iteration
			2. Get
		2. Bad for
			1. Add
			2. Remove - depends on scenario
				1. Better performance for the middle (no navigation)
	2. LinkedList
		1. Good for
			1. Iteration
			2. Add
		2. Bad fo
			1. Get
			2. Remove - depends on scenario
				1. Better performance for first and last items

### Sorting lists ###
1. ArrayList or LinkedList
	1. How is sorting done?
		1. ArrayList sort

				Arrays.sort(...)
				
		2. LinkedList sort
			1. No sort method here
				1. `List` interface
					
						// default method usses the following
							Arrays.sort(...)
							
		3. Both use the same method
			1. With LinkedList - it is converted to an array before sorting
				1. Slightly slower
					1. Conversion back and forth - but sorting is much more intensive operation
2. Both can give pretty much same performance

## How Maps Work ##
### How Hashmaps Work - part 1 ###
1. How did Java implemented it?
	1. `LinkedHashMap`
	2. `HashMap`
	3. `TreeMap`
2. Map is made up of keys and values
	1. We cannot have two objects with same key
3. The time required to retrieve a value from it's key will not be the same for different sizes of hashmap
	1. 10 items vs 1 billion items
4. How do they work?
	1. Initially an array is created with 16 elements
	2. When we add an item to the hashmap the key could be a field

			Key: 124
			Value: Book object
				id: 124
				title: Little Women
				author: Louisa May Alcott
				
		1. Key is converted to integers
			1. Even strings are converted using an algorithm
		2. Java find mod: 124 % 16 = 12 (16 is size of the array)
		3. The key, value pair are stored in bucket number 12 (0 - 15)

### The role of the Hashcode ###
1. If key is a string
	1. Key: Little Women
		1. Integer representation is called hashCode
			1. `java.lang.Object` has `hashCode` method so every object has this method
				1. `System.out.println("Little Women".hashCode());`
					1. 675377748 % 16 = 4 (bucket 4)

### How Hashmaps work - part 2 ###
1. Each bucket could contain many objects
	1. If hashcode evaluates to same number
		1. Many numbers give mod value of 4
	2. Each bucket contains a linked list of objects
		1. Object is added to the linked list
			1. Not the same as LinkedList
	3. It is a challenge to understand the implementation
2. Each entry in the array is reference to the first item in the linked list
3. Size - hashmap can grow in time
	1. It has factor: 0.75
		1. Once 3/4th of the buckets have one or more elements in them then it is re-sized
		2. It doubles it's size
		3. All existing items are re-valuated
			1. Every item could move to a different bucket
				1. It could be significant overhead (compared to ArrayList)

### Specifying the initial size and factor of a HashMap ###
1. We can specify size and factor (how often it should re-size)

		Map<String, Book> books = new HashMap<>(500000, 0.6f); // (second factor is float)
		
	1. Size of array will allways be a power of 2
		1. 524288 - (at least 500000) - power of two
2. Code:

		Date start = new Date();
		Map<Integer, Book> books = new HashMap<>();
		
		for (int i = 0; i < 100000000; i++)
			books.put(i, new Book(i, "Jane Eyre", "Charlotte Bronte", 14.99));
		Date end = new Date();
		System.out.println("Elapsed time was " + (end.getTime() - start.getTime()) + " ms.");
		
	1. 6719 ms
	2. Change size: 500000
		1. 4703 ms
	3. Increase fill factor to 0.9f
		1. 3706 ms
3. Better not to give too much initial size - the memory may not be used 

### HashMap Performance ###
1. Retreiving items:
	1. hashcode is calculated
	2. Modulo is calculated
	3. Bucket is found
	4. Navigates linked list
2. Is it faster if we have small array with a lot of items in the linked list or big array with small number of items in the linked list?
	1. Is it quicker to navigate to a place in array or to a place in linked list?
		1. Larger array will give a better performance
3. Size and factor will impact performance
	1. Large initial size and large fill factor will make it quicker to add items
	2. To retrieve, size be as big as possible
		1. 1000000, 0.6f
			1. 3107 ms

### The rules for Hashcodes ###
1. If keys are objects are strings or integers - they have their own hashcode methods
	1. If we had 100 random words, we can expect to end up with equal number of words in each bucket - this is important
2. If we have our own hashcode
3. Example:

		Map<Book, Double> books = new HashMap<>();
		// add 10 million books
			books.put(new Book(...), 14.99); // Java needs hashcode
			
		// print book's hashcode
		// all items will have same hashcode - single bucket will have same all objects
		
	1. When we are using own objects
		1. The objects should give good range of hashcode
			1. Rules:
				1. We should get good range of hashcodes
				2. Equal objects should have equal hashcode
					1. If we are adding and then retrieving we must get the book back

### Generating and optimising the Hashcode method ###
1. Source > Generate > hashCode & equals (to compare two books)
	1. equals:
		1. Are they same physical objects?
		2. Cast and they should be same type
		3. All the fields should be same
	2. hashcode:
		1. prime number - for wide range
		2. hashcode = prime (prime (prime (prime + h(author)) + id) + h(price)) + h(title)
			1. `b1.hashCode()`
			2. `b2.hashCode()`
			3. If values are same, we should get same value (`hashCode` will be same)
		3. hashcode - it is too long
			1. if only id can be used (because it is meant to be unique) - the hashcode calculation is much faster
				
					return id;
					
				1. 7033 ms (faster than 9 s)

### Optmising Hashmap Performance ###
1. stackoverflow.com/questions/7115445
	1. Different sizes and factors

### How The LinkedHashMap Works ###
1. Main difference:
	1. HashMap: Items iterate in a "random" order
	2. LinkedHashMap: Items iterate in a defined order (in added order)
2. There is no difference in time when retrieving from either of them
3. There is no performance impact if we choose either
	1. LinkedHashMap - it takes a little more memory
4. LinkedHashMap - extends HashMap
	1. Extra bit: doubly linked list is used to maintain order
		1. Suppose there are 16 buckets
			1. If item is added to a bucket
				1. One extra marker links to the overall map (first item in overall linked list)
			2. If a second item is added and if it is in another bucket, a pointer is added from previously added item to the new item
				1. Second linked list gets created connecting all items

### The HashTable and TreeMap ###
1. HashTable - older (1.0 version)
	1. Thread-safe version of HashMap - good for multi-threaded environment
		1. Uses synchronisation blocks
2. TreeMap
	1. Stored in natural order of the keys
		1. Worse performance as compared to HashMap or LinkedHashMap
			1. Use only if small amount of data needs to be stored and if natural ordering is key to the requirement

## Other Coding Choices ##
### Introduction to how we'll compare coding options ###
1. For performance:
	1. Primitives vs Objects
	2. BigDecimal vs Double
	3. StringBuilder vs Concatenating Strings
	4. Loops vs Streams
	5. Logging
2. The techniques can be applied to other types
3. Load CodingPerformance project

### Comparing primitives with objects ###
1. run method does benchmarking
	1. Primitives vs objects (`long` vs `Long`)
		1. objects - 15 ms
		2. primitives - 8 ms
2. Primitives give better performance than objects

### Comparing BigDecimals with Doubles ###
1. BigDecimalPerformance.java
	1. BigDecimals - (more precision) - 84 ms
	2. Double - 48 ms
2. If we run without decimal digits
	1. BigDecimals - 36 ms
	2. Double - 28 ms
3. If we don't need precision that BidDecimal is offering, then we can get away with Double or Float or with double or float

### Using the StringBuilder ###
1. If we are concatenating string, we can use StringBuilder
	1. It uses array internally
		1. array of bytes - stored on stack (no objects added or removed in heap)
			1. Quick and efficient
2. Direct concatenation
	1. 323 ms
3. StringBuilder
	1. 181 ms (about 1/2)
4. If we are writing code without using StringBuilder, Java has some optimization
	1. Put all concatenations on a single line of code (all concatenated once) (instead of storing intermediate results)
		1. 176 ms
		2. Why?
			1. If compiler detects multiple concatenations, it converts to StringBuilder (internally)
	2. This version can be used because it has much less code to write than StringBuilder version (because JVM optimises it anyway)

### Comparing Loops and streams ###
1. Simple loops vs stream implementation
	1. Loops: 46 ms
	2. Stream: 68 ms
		1. It can take longer - we may get pretty similar results
2. It is better to check before choosing
3. Another version:

		names.stream().flatMapToInt(s -> IntStream.of(s.length() > 9 ? s.length() : null)).sum();
		
	1. 174 ms - very long
4. Streams may be good for multiple threads
5. ParallelStreams - 

		names.parallelStream().mapToInt(s -> s.length()).filter(l -> l > 9).sum();
		
	1. 23 ms
		1. Will always give better performance - if multiple CPUs that can run multiple threads

### A note on logging ###
1. `logger.log(...);`
	1. If we get some exception, we want to log the cause
		1. There is a performance issue
			1. If we configured logger to only output ERROR messages
				1. If Level.INFO is used
					1. The compilation of the log message will still happen
						1. Waste of CPU resources
2. There will be objects created and garbage collected
	1. How to avoid?
		1. Fix

				if (logger.isLoggable(Level.INFO)) {
					// log - if some work is required
				}

## GraalVM ##
### What is GraalVM? ###
1. Development project for Oracle
	1. Alternative to JVM
		1. It is for better performance
			1. It is much more
2. It is not production ready
3. It is only available for Linux and Mac
	1. Windows version does not provide all the features
		1. Windows 10 - Linux subsystem can be enabled
4. There are some features of Graal in Linux version of OpenJDK
5. We can download and install
6. Why GraalVM?
	1. Alternative JVM - it will likely run faster (available in jdk)
	2. Alternative Java Compiler - to regular compiler - more performance bytecode
	3. Native compiler (no JVM required)
	4. There is more ...
7. Enable Linux subsystem for Windows 10
	1. 

### Installing GraalVM ###
1. github.com/oracle/graal/releases (https://www.graalvm.org/downloads/)
	1. Community version (no cost or support)
		1. `bin`
			1. Some of them are replacements for standard (`javac`, `java`)
				1. `graalvm.../bin/java -version` - it is based on openjdk 1.8
				2. `graalvm.../bin/javac -version`

### Using the Graal Virtual Machine ###
1. Open GraalPerformanceTest project
2. `Main.java`
	1. Generate random numbers and find the biggest out of them
	2. No warm-up period
	3. UUID - `UUID.randomUUID()` **(M)**
		1. Extract just the numbers
		2. Convert to long
	4. Check if it is prime
	5. If so update the max
3. Open JDK vs Graal VM
	1. Open JDK
		1. 13375 ms
	2. Graal VM
		1. Recompile with JDK 8
		2. 13161 ms

### Using the Graal Compiler ###
1. Graal Compiler
	1. `graalvm.../bin/javac Main.java`
	2. `graalvm.../bin/java Main`
		1. 12777 ms (slightly better)
2. Optimizations
	1. Startup time
	2. Replacement for C2 compiler (more optimal performance)
3. Graal class is compatible with standard java
	1. 13204 ms

### Native image building with Graal ###
1. It doesn't need VM to run
2. `bin/native-image`
	1. Dependencies need to be installed
		1. `gcc`
		2. `zlib1g-dev`
	2. `bin/native-image Main`
		1. It contains VM embedded in it
			1. 9306 ms - 11166 ms

### Using the Graal experimental features within OpenJDK ###
1. Graal is written in Java
	1. What is in openjdk is earlier version and wont give same performance as latter versions
	2. Flags:

			-XX:+UnlockExperimentalVMOptions
			-XX:+EnableJVMCI
			-XX:+UseJVMCICompiler
			
		1. Linux version only
			1. `javac Main.java`
			2. `java Main`
			3. `java -XX:+UnlockExperimentalVMOptions -XX:+EnableJVMCI -XX:+UseJVMCICompiler Main`
				1. 23586 ms (very high)
					1. We cannot use it yet

## Using Other JVM Languages ##
### The principles of using other JVM Languages ###
1. Groovy
2. Scala
3. JRuby
4. Clojure
5. Kotlin
6. Code written in those languages can be compiled to bytecode that can be run on the JVM
7. Performance
	1. Most of what apply to Java apply - GC, flags, ...
	2. Some performance benefits are offered by other languages
		1. How to compare?
			1. JMH - can be used for Kotlin, Groovy and Scala
	3. Java version vs Kotlin version
		1. jar files - contain dependencies
	4. `java -jar JavaMain.jar` - 3169 ms
	5. `java -jar KotlinMain.jar` - 3113 ms
		1. It tends to take a fraction longer (not very noticeable)
8. Differences
	1. It doesn't have primitives
		1. We have to use object types
			1. compiler replaces with primitive equivalents
	2. Declaration
		1. `val` - immutable (cannot be changed and can be assigned only once) - doesn't impact performance
		2. `var` - mutable
	3. Variables are not nullable
		1. We need to do something else

### Looking at bytecode with javap ###
1. Why performance of Kotlin is different?
	1. We can look at bytecode
	2. `javap` **(M)** - disassembler (to readable form)
2. Simple project:
	1. main.Main.java (package is used for jdk 11)

			System.out.println("Hello world");
			
		1. Compile
		2. `Main.class`
			1. `javap -v Main.class`
				1. Constant pool - for every class, Java builds a constant pool
					1. List of every constant in the class
						1. Class names
						2. Interface names
						3. Strings that are part of string pool
						4. field names
						5. References to methods
						6. ...
						7. utf8 - literal value
					2. Each is given unique id
					3. One refers to the other
		3. Reference to main method
			1. First part - initialization
			2. method:
				1. stack=2, locals=1, args_size=1
					1. max depth of stack
					2. One local variable (could be for phrase "Hello world" - a local variable might have to be created)
					3. One argument passed into method
					4. getstatic - get static field from class
						1. Reference id is used

							getstatic			#16 // Field java/lang/System.out:Jjava/io/PrintStream
							ldc					#22 // push constant from constant pool - String Hello World
							invokevirtual		#24 // Method java/io/PrintStream.println:(Ljava/lang/String;)V - run this method
3. Getting information about bytecode:
	1. [docs.oracle.com/javase/specs/jvms/se11/html/jvms-6.html](docs.oracle.com/javase/specs/jvms/se11/html/jvms-6.html)
4. `ldc` - push item from run-time constant pool
5. Main.java

		Main {
			main(...) {
				int i = 7;
				int j = 13;
				int k = i * j;
				System.out.println(i + " * " + j + " = " + k);
			}
		}
		
	1. `javap -v Main.class`
		1. stack = 4
			1. one of the variables is going to be discarded (locals = 4, args_size=1)
		2. code

				bipush		7	// byte push
				istore_1		// store as local variable and give index number 1
				bipush		13
				istore_2		// store as local variable and give index nubmer 2
				iload_1		// load value with index 1
				iload_2		// load value with index 2
				imul			// multiply
				istore_3		// store result with reference number 3
				// StringBuilder is used to append the strings

### Disassembling bytecode back to Java ###
1. Java decompiler
	1. CFR - easy to use, it can decompile to latest java version as well
	2. Other decompilers - GUI based also exist
		1. Most do not support Java 8 lambda syntax and higher versions
	3. Download cfr jar file from website
2. Command:

		java -jar cfr-0.142.jar JavaMain.class
		
	1. The code is not exactly the same as what we wrote
		1. variable names might have changed (if scope is within method, name is not important)

				List<UUID> changed to ArrayList<UUID>
				
	2. Kotlin version

			java -jar cfr-0.142.jar KotlinMain.class
			
		1. Java version of Kotlin code
			1. Warnings about Kotlin dependencies which cfr could not find
				1. We have lost generic types

						List uuids = new ArrayList();
						// ...
						Intrinsics.checkExpressionValueIsNotNull((Object)uUUID, (String) "UUID.randomUUID()"); // extra code for non-null check
						
						...
						if (object2 == null) {
							throw new TypeCasteException("null cannot be cast to non-null type java.lang.String");
						} // extra code 
						
					1. In kotlin - String is converted to object and then check if it is not null before casting back to string
					2. Strings in kotlin cannot be null
						1. To have the safety of null pointer exceptions, extra code is added - performance cost

## Course Summary ##
### The OpenJ9 Virtual Machine and what's coming up in future version of Java ###
1. Hotspot VM is default with Oracle JDK and OpenJDK
2. Open J9 - 
	1. Claims to provide better performance
	2. Unlike Hotspot, it shouldn't require much configuration (in theory)
	3. It optimises Java code out of the box without needing a complicated set of command-line options
3. Download OpenJDK
	1. JDK or JRE
4. For production projects
5. Other enhancements with future releases:
	1. [www.oracle.com/technetwork/java/javace/12-relnote-issues-5211422.html](www.oracle.com/technetwork/java/javace/12-relnote-issues-5211422.html)
		1. Notes
			1. garbage collection
			2. What is changing with newer versions

### Bonus lecture ###
1. [Discounted Courses](https://www.multicode.co.uk/udemy-discounts)