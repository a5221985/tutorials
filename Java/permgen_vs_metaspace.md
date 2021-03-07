# PermGen #
1. `PermGen` (Permanent Generation) is special heap space separated from main memory heap
	1. JVM tracks
		1. Loaded class metadata in PermGen
		2. static content in this memory section
			1. static methods
			2. primitive variables
			3. references to static objects
	2. Contains data about bytecode, names, JIT information
		1. String Pool: Before Java 7, it was part of this memory
			1. It has [disadvantages](https://www.baeldung.com/java-string-pool)
	3. Default memory size
		1. 32-bit JVM is 64 MB
		2. 64-bit JVM is 82 MB
	4. JVM o

# Metaspace #
1. New memory space (from Java 8)
2. **It is replacement for PermGen memory space**
3. Difference?
	1. How PermGen and Metaspace handle memory allocation
		1. Native memory region grows automatically by default
4. New flags to tune the memory:
	1. `MetaspaceSize` & `MaxMetaspaceSize` - to set metaspace upper bounds
	2. `MinMetaspaceFreeRatio` - minimum percentage of class metadata capacity free after garbage collection
	3. `MaxMetaspaceFreeRatio` - maximum percentage of class metadata capacity free after garbage collection to avoid reduction in amount of space
5. Gains for Garbage collection due to the change:
	1. garbage collector automatically triggers cleaning of dead classes once class metadata usage reaches its maximum metaspace size
		1. This reduces JVM the chance to get OutOfMemory error
			1. Caveat - We need to [tune the metaspace to avoid memory leaks](https://www.baeldung.com/jvm-parameters)