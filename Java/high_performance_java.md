# High Performance Java #
## The Course Overview ##
1. Java 9 performance enhancements
	1. JShell
	2. Writing good code in Java 9
2. Performance testing with JMH
	1. Set up of benchmark suite
	2. Constructing benchmark
	3. Avoid dead code elimination in tests
	4. Complex benchmarks
3. Compilers - Performance boosters
	1. Just in time compilation
	2. Ahead of time compilation
	3. Segmented code cache
	4. Summary of Java 9 performance improvement

## Performance Improvements ##
1. Topics
	1. Java 9 performance improvements
	2. Java 9 GC improvements
	3. Jshell - Interactive console in Java 9
	4. How to write good code in Java 9 - New Java 9 API
	5. Better Java 9 string performance
	6. Compact strings
	7. Stored strings in the Class-Data Sharing (CDS) archives
	8. Java concurrency - Reactive streams
2. Why strings are so important?
	1. Most objects created by our programs are of string type
	2. Java already optimize usage of string using string pool
		1. Special memory region
			1. There are shared strings

					new String("Cat"); // new object is created - anti-pattern

				1. s1 == s2 (works if the string is in string pool)
3. Java 9 and class-data sharing (CDS) archives
	1. Up to Java 8 string pool was per one per one JVM
	2. In Java 9 string and char[] objects are shared between JVMs
	3. It can reduce memory usage substantially
4. Compact strings
	1. Up to Java 8, string was internally represented as char[]
	2. In Java 9, XX:- CompactStrings compactions can be enabled
	3. Using that flag, string is represented as byte[] (more effective because of size)
	4. It improves space efficiency of string class
5. Reactive Streams
	1. Java 9 adds reactive streams to the standard API
	2. Publish-subscribe model
	3. Flow

			Publisher extends Flow

## Java 9 GC Improvement ##
1. Topics
	1. Java 9 change default garbage collection algorithm
		1. First choice
	2. Choosing G1 to be first choice
	3. How G1 is working
	4. Why it is a best general purpose GC
2. G1 Characteristics
	1. Heap is divided into N equally sized regions
	2. Max 2048 regions
	3. Each region from 1 MB to 32 MB
	4. Eden, survivor, and old generation can occupy every region
3. G1 Heap Allocation
	1. Eden Space - young objects live here
	2. Survivor space - all other objects live
	3. Old generation - old objects
4. How young GC works in G1
	1. End of young GC
		1. Live objects from young generation have been evacuated (copied/moved) to
			1. Zero or more survivor regions
			2. Old generation regions
		2. Ecend and survivor possibly resized
5. G1 Introduces Metaspace
	1. Classes matadata and statics are stored in the native heap and this space is called Metaspace
		1. GC cannot use native heap
	2. By default metadata allocation is only limited by the amount of available native memory
		1. Upto 3 GB (dangerous) - app may crash
	3. Parameter `MaxMetaspaceSize` is used to set maximum amount of space
		1. Native space is not exhausted
6. Garbage collection process
	1. Object is in Eden (Young generation)
	2. Object is moved to S0 - first pass if object survived (Young generation)
	3. Object is moved to S1 - second pass if object survived (Young generation)
	4. Object is moved to Tenured - third pass if object survived (Old Generation)
	5. Permanent - Metaspace (JDK 1.8 and later) - separate space (not seen by GC)
		1. Statics
		2. Classes

## JShell - Interactive Console in Java 9 ##
1. Topics
	1. Setup Java 9
	2. Starting JShell
	3. REPL (Read Evaluate Print Loop) - What it is?
	4. Playing with Java code using JShell
		1. Iteractive shell (without main method)
2. Steps:
	1. Download JDK 9
		1. [http://jdk.java.net/9/](http://jdk.java.net/9/)
	2. `cd jdk-9/bin`
	3. `jshell`
	4. Example:

			List<Integer> integers = new LinkedList<>()
			integers
			integers.add(1) (tab)
				temporary variable is created
			String a = "cat"
			String b = a
			integers.stream().filter(v -> v > 1).collect(Collectors.toList())

		1. We don't have to import anything

				CompletableFuture.supplyAsync(() -> "hello").get()
			

## How to Write Good Code in Java 9 ##
1. Topics
	1. How Java 9 favors collections and immutability
	2. Treating optional as stream of one or zero elements
	3. Using dropWhile()/takeWhile()
	4. Parallel Files.lines() that use MappedByteBuffer
2. Java 8 way:

		// given
		Set<String> set = new HashSet<>();
		set.add("a");
		set.add("b");
		set.add("c");
		
		// when
		Set<String> strings = Collections.unmodifiableSet(set);
		strings.add("a"); // Throws UnsupportedOperationException

3. Java 9 way:

		// given
		Set<String> set = Set.of("a", "b", "c");

		//when
		set.add("a"); // Throws UnsupportedOperationException

4. Map the Java 9 way:

		// given
		Map<Integer, String> map = Map.of(k1: 1, v1: "a", k2: 2, v2: "b");

		// when
		map.put(3, "a"); // Throws ...

	1. Similarly `List.of`
5. Example:

		// given
		Optional<String> value = Optional.of("a");

		// when
		List<String> collect = value.stream().map(String::toUpperCase).collect(Collectors.toList());

		// then
		assertThat(collect).hasSameElementsAs(List.of("A"));

6. `takeWhile` in Stream API

		// given
		Stream<Integer> integerStream = Stream.of(10, 5, 1);

		// when
		List<Integer> collect = integerStream.sorted(Comparator.reverseOrder())
								.takeWhile(v -> v > 1) // beware of ordering stream!! takeWhile only gives determistic
								.collect(Collectors.toList());

		// then
		assertThat(collect).hasSameElementsAs(List.of(10, 5));

	1. `takeWhile`: as long as the condition is being met it continues but as soon as condition fails, it quits. The elements are processed from lowest index to highest index
	2. `dropWhile`: as long as the condition is being met, the element is dropped. The elements are processed from lowest index to highest index


			// given
			Stream<Integer> integerStream = Stream.of(1, 2, 3, 4, 5);

			// when
			List<Integer> collect = integerStream
									.sorted()
									//.parallel() // don't use this
									.dropWhile(v -> v < 4) // beware of ordering stream!!
									.collect(Collectors.toList());

			// then
			assertThat(collect).hasSameElementsAs(List.of(4, 5));

7. Parallel Files.lines() that use MappedByteBuffer
	1. Up to Java 8, lines were read using Spliterator that divide work non-evenly
		1. Longest task took substantial amount of time, maling all parallel tasks waiting for its finish
	2. In Java 9, it chunks an input into N MappedByteBuffer of same size making computation faster
8. Summary
	1. Explored Java 9 performance improvements
	2. Discussed Java 9 GC improvements
	3. Explained JShell - Interactive REPL in Java 9
	4. Constructed an efficient code using new Java 9 API

## Setup Benchmarks Suite ##
1. For high performance of application
2. Topics
	1. Setup benchmarks suite
	2. Constructing benchmarks with warm up period
	3. Avoid dead code elimination in tests
	4. Constructing complex benchmarks
3. Topics of this video
	1. Constructing project with JMH
	2. Looking at the pom.xml
	3. Constructing simple test suite
	4. Starting a performance test
4. Generating project

		mvn archetype:generate \
				-DinteractiveMode=false \
				-DarchetypeGroupId=org.openjdk.jmh \
				-DarchetypeArtifactId=jmh-java-benchmark-archetype \
				-DgroupId=com.tomekl007 \
				-DartifactId=packt_jmh \

	1. To start benchmark

			java -jar target/benchmarks.jar

## Constructing Benchmarks with Warm up Period ##
## Avoid Dead Code Elimination in Tests ##
## Constructing Complex Benchmark ##
## Just-in-time Compilation ##
## Ahead of Time Compilation ##
## Segmented Code Cache ##

# Writing High Performance Java application in Java 9 #
## The Course Overview ##
## Java Memory Model ##
## Hardware Affinity ##
## JVM Intrinsic Functions ##
## Understanding and Analyzing Bytecode ##
## Optimistic Locking Versus Pessimistic Locking ##
## CompareAndSet Structures ##
## Coordinating Threads ##
## Java 9 - Reactive Streams ##
## Detecting Memory Leaks - JVisualVM ##
## Examining CPU and Resources Usage ##
## Summary of Writing High Performance Java Applications ##
