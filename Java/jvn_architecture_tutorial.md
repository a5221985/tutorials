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
						1. 
					2. Prepare
					3. Resolve
			3. Initialize
	2. Runtime data areas
		1. 
	3. Execution Engine