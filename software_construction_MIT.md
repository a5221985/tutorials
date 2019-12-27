# Software Construction #
## Readings ##
### Static Checking ###
##### Objectives for Today's Class #####
1. Two topics:
	1. static typing
	2. big three properties of good software

#### Hailstone Sequence ####
1. Definition: starting with n, next number is
	1. n / 2 if n is even
	2. 3n + 1 if n is odd
	3. Sequence ends with 1
2. Odd number rule may bounce up and down the number before decreasing to 1
3. Conjecture: All hailstones reach to the ground (number reaches 1)
	1. It is still an open question [https://en.wikipedia.org/wiki/Collatz_conjecture](https://en.wikipedia.org/wiki/Collatz_conjecture)
4. Hailstones form in clouds by bouncing up and down until they eventually build enough weight to fall to earth

#### Computing Hailstones ####
1. Code: Java

		int n = 3;
		while (n > 1) {
			System.out.println(n);
			if (n % 2 == 0)
				n = n / 2;
			else
				n = 3 * n + 1;
		}
		System.out.println(n);
		
2. Code: Python

		n = 3
		while n > 1:
			print(n)
			if n % 2 == 0:
				n = n / 2
			else
				n = 3 * n + 1
		
		print(n)
		
2. Notes:
	1. Basic semantics of expressions and statements in Java are similar to Python:
		1. `while` and `if` behave the same (example)
	2. Java requires `;` at the end of statements
		1. It could be pain
		2. But more freedom to organize code (can split into multiple lines for readability)
	3. Java requires parantheses around conditions of `if` and `while`
	4. Java requires curly braces around blocks (instead of indentation)
		1. Indentation helps readability (even though Java doesn't impose it)
		2. Programming is a form of communication to both computer and human beings
			1. Humans need indentation

#### Types ####
1. Difference between Python and Java
	1. `int` used to declare variable (specifies type)
2. `type` set of values along with operations that can be performed on those values
3. Java has primitive types:
	1. `int` (integers) - +/- 2^31 ~ 2 billion
	2. `long` (large integers) - +/- 2^63
	3. `boolean` - true or false
	4. `double` - floating point numbers (represents subset of real numbers)
	5. `char` - for single characters (`'A'` and `'$'`)
4. Java has object types as well:
	1. `String` - sequence of characters (Python also has)
	2. `BigInteger` - integer of arbitrary size (Python also has)
5. Convention: Primitive types are lower case and object types start with capital letter
6. Operations:
	1. Functions that take inputs and produce outputs (they may change the values)
	2. Syntax varies (but they are still functions)
		1. Three different syntaxes for operations:
			1. As *infix*, *prefix* or *postfix* operator
				1. `a + b` - invokes operation `+ : int x int -> int`
			2. As method of object
				1. `bigint1.add(bigint2)` - calls `add: BigInteger x BigInteger -> BigInteger`
			3. As function
				1. `Math.sin(theta)` - calls `sin: double -> double`
					1. `Math` is not object but class that contains `sin` function
	3. `str.length()` vs `len(str)` (Python) - same operation in two languages but using different syntax
7. Some operations are overloaded: `+`, `-`, `*` and `/` are heavily overloaded for numberic primitives in Java
	1. Methods can also be overloaded
		1. Most programming languages have some degree of overloading

#### Static Typing ####
1. Java is **statically-typed** language. Types of all variables are known at compile time (before program runs)
	1. Compiler can deduce types of all expressions as well
		1. If `a` and `b` are declared as `int`s, then compiler concludes that `a + b` is also an `int`
			1. Eclipse can find this on the fly while typing
2. In **dynamically-typed** languages like **Python**, type checking is deferred until run-time (while program is running)
3. Static typing is a kind of **static checking**
	1. Means checking for bugs at compile time
4. The course is aimed at eliminating bugs in code
	1. Static checking is an idea for this
	
			"5" * "6"
			
		1. This type of bug can be found simply while typing 

#### Static Checking, Dynamic Checking, No Checking ####
1. Three kinds of automatic checking that languages can provide:
	1. **Static checking**: bug is found automatically before program runs
	2. **Dynamic checking**: bug is found automatically when code is executed
	3. **No checking**: language doesn't help you find the error, whatch for it yourself or get wrong answers
2. Catching a bug statically is better than dynamically catching which is better than not catching
3. Ruls of thumb for what errors could be caught at each time:
4. **Static checking** can catch:
	1. syntax errors: extra puncutation, spurious words
		1. Python (dynamically typed) languages also have this kind of static checking (indentation error) even before program starts running
		2. Wrong names: `Math.sine(2)` (`sin`)
		3. Wrong number of arguments: `Math.sin(30, 20)`
		4. Wrong argument types: `Math.sin("30")`
		5. Wrong return types: `return "30"` (if return type is `int`)
5. **Dynamic checking** can catch:
	1. Illegal argument values: `x / y` if `y` is 0 (works normally)
		1. Divide by zero is dynamic error
	2. Unrepresentable return values: when specific return value can't be represented in the type
	3. out-of-range indices: negative or too-large index on string
	4. calling method on `null` object reference (`null` is like Python `None`)
6. Static checking is about types which are independent of specific values of variables
	1. Ensures that variable has some value from the set Type (we don't know the exact value)
7. Dynamic errors are caused by specific values

#### Surprise: Primitive Types Are Not True Numbers ####
1. Trap in Java - primitive numeric types have corner cases that do not behave like integers and real numbers => some errors are not dynamically checked at all
	1. **Integer division**: `5/2` - does not return fraction (returns truncated integer)
		1. Produces wrong answer instead of returning a dynamic error
	2. **Integer overflow**: `int` and `long` are finite sets of integers with max and min values
		1. If a computation's result is too positive or too negative to fit in the finite range, computation overflows (wraps around) - returns an integer in legal range but not the right answer
	3. **Special values in `float` and `double`s **: `float` and `double` have several values that aren't real numbers: `NaN` (Not a number), `POSITIVE_INFINITY`, `NEGATIVE_INFINITY`
		1. Operations expected to produce dynamic errors (like divide by zero or taking root of negative number), produce a special value.
			1. If we continue to compute, we can end up with a bad answer

#### Arrays and Collections ####
1. Storing hailstone computation to store in a data structure instead of printing it out
2. Java has two kinds of list like types: Arrays (fixed length sequences of another type T), Lists

		int[] a = new int[100];
		
	1. `int[]` includes all possible array values but particular value once created cannot change it's length
	2. Operations:
		1. Indexing: `a[2]`
		2. Assignment: `a[2] = 0`
		3. Length: `a.length` (this is not method call)
3. Example: Hailstones using Arrays

		int[] a = new int[100];		// <===== DANGER WILL ROBINSON
		int i = 0;
		int n = 3;
		while (n != 1) {
			a[i] = n;
			i++;	// very common shorthand for i = i + 1
			if (n % 2 == 0) {
				n = n / 2;
			} else {
				n = 3 * n + 1;
			}
		}
		a[i] = n;
		i++;
		
	1. What would happen if we tried an n that turned out to have a very long hailstone sequence? It wouldn't fit in length 100 array (bug)
		1. Will Java catch it statically? Dynamically? Not at all?
	2. For less-safe languages like C and C++, which do not do automatic runtime checking of array accesses have been responsible for large number of network security breaches and internet worms
	3. Instead of using fixed length array, use `List` type (variable length sequence of another type T)

			List<Integer> list = new ArrayList<>();
			
		1. Operations:
			1. indexing: `list.get(2)`
			2. assignment: `list.set(2, 0)`
			3. length: `list.size()`
		2. `List` is an interface (cannot be constructed using `new`)
			1. It specifies operations that can be performed on a list
		3. `ArrayList` is a class
			1. Concrete type that provides implementations of operations
			2. Commonly used but there are other implementations
				1. `LinkedList`
					1. `Java 8 API` - Java API docs - **must read** 
						1. API is a synonym for library
		4. `List`s know how to deal with object types only (not primitive types)
			1. Java has equivalent object type (for type written in lowercase and abbreviated like `int` which has capitalized and fully spelled equivalent object type)
		5. Java automatically converts `int` to `Integer` in certain contexts

				Integer i = 5;
	
4. Hailstone code written with list:

		List<Integer> list = new ArrayList<>();
		int n = 3;
		while (n != 1) {
			list.add(n);
			if (n % 2 == 0)
				n = n / 2;
			else
				n = 3 * n + 1;
		}
		list.add(n);
		
	1. It is simpler and safer (list automatically enlarges itself to fit as many numbers as you add - until we run out of memory)

#### Iterating ####
1. Steps through elements of array or list

		int max = 0;
		for (int x : list) {
			max = Math.max(x, max);
		}
		
	1. Arrays and lists can be iterated as above
	2. `Math.max` handy function in Java API
		1. **java 8 Math**

#### Methods ####
1. Java needs statements to be inside a method and every method needs to be in class
2. Example:

		public class Haistone {
			/**
			 * Compute a hailstone sequence.
			 * @param n Starting number for sequence. Assumes n > 0.
			 * @return hailstone sequence starting with n and ending with 1.
			 */
			public static List<Integer> hailstoneSequence(int n) {
				List<Integer> list = new ArrayList<>();
				while (n != 1) {
					list.add(n);
					if (n % 2 == 0) {
						n = n / 2;
					} else {
						n = 3 * n + 1;
					}
				}
				list.add(n);
				return list;
			}
		}
		
	1. `public` - any code anywhere in program can refer to the class or method
		1. Other access modifiers: `private`, `protected` provide more safety (guarantees immutability for immutable types)
	2. `static` - method does not take `self` parameter (in Java it is implicit)
		1. `static` methods cannot be called on an object
			1. The right way to call is:

					Hailstone.hailstoneSequence(83);
					
	3. Comment is a specification of the method (describes input and output)
		1. Spec should be concise, clear and precise
			1. `n` must be positive - this info is not captured by type declaration

#### Mutating Variables vs Reassigning Variables ###
1. *snapshot diagrams* - to visualize distinction between changing a variable and changing a value
	1. When we assign to a variable, we are changing where variable arrow points (it can point to a different value)
	2. When we assign to contents of mutable value (array or list), we are changing references inside the value
2. Good programmers avoid things that change (because they may change unexpectedly)
3. Design principle: Immutability
	1. Immutable types: Types whose values can never change once they have been created (atleast not in a way visible to outside world)
	2. Java supports immutable references (variables that are assigned once and never reassigned)

			final int n = 5;
			
		1. If Java compiler finds that the final variable is not assigned only once at runtime, it will produce compiler error (static checking for immutable references)
		2. **Good practice - use final for declaring parameters of method and as many local variables as possible**
			1. Important documentation for reader of code
			2. Important for compiler to check
4. Two variables in `hailstoneSequence` method

		public static List<Integer> hailstoneSequence(final int n) {
				final List<Integer> list = new ArrayList<>();
		}

#### Documenting Assumptions ####
1. Writing type of variable down, documents an assumption about it.
	1. e.g: the variable will always refer to an integer
		1. Java checks this assumption at compile time and guarantees that there's no place in program where you violated the assumption
	2. Declaring variable as final is another form of documentation
		1. Claim that variable will never change after its initial assignment
			1. Java can check this statically
	3. n must be positive: Java (unfortunately) doesn't check this automatically
2. Why write down assumptions?
	1. Programming is full of assumptions (we usually don't write them and don't remember them)
		1. Other people who read or change programs later won't know them (they may have to guess)
3. Programs must be written with 2 goals in mind:
	1. Communicating with computer - first persuading compiler that program is sensible
		1. Syntactically correct
		2. Type-correct
		3. Getting logic right (it must give right result at runtime)
	2. Communication with other people - Making program easy to understand so that when someone has to fix it or improve it, adapt it in future, they can do so

#### Hacking vs. Engineering ####
1. Hacky code is written so far:
	1. Hack solution:
		1. Bad: writing lots of code before testing any of it
		2. Bad: Keeping all the details in your head, assuming you'll remember them forever.
		3. Bad: assuming that bugs will be nonexistent or else easy to find and fix
	2. Software engineering is not hacking: Engineers are pessimists
		1. Good:
			1. Write little bit at a time
			2. Testing as we go
				1. Test first programming
		2. Good: Document assumptions that code depends on
		3. Good: Defend code against stupidity
			1. Especially our own!
			2. Static checking helps with that 

#### The Goal of 6.005 ####
1. Primary goal: Produce software that is:
	1. **Safe from bugs**: Correctness (correct behavior right now), and defensiveness (correct behavior in the future)
	2. **Easy to understand**: Has to communicate to future programmers who need to understand it and make changes in it (fixing bugs or addings new features).
		1. Future programmer might be me (months or years from now)
			1. Surprisingly we forget it, if we do not write it down
				1. Writing it down helps my future self
	3. **Ready for change**: Software always changes
		1. Some designs make it easy to make changes
		2. A few need throwing away ans rewriting a lot of code
2. Other important properties:
	1. Performance
	2. Usability
	3. Security
3. There could be tradeoffs among the above
	1. Big 3 properties (there could be others)
		1. Consider every language feature, every programming practice, every design patern that we study and relate them to the Big three

#### Why We Use Java in This Course ####
1. **Safety**: Java has static checking (primarily type checking, but other kinds of static checks as well - return values ...)
	1. Safety from bugs is key tenet of software engineering
	2. Java is good language to learn about good software engineering practices
		1. Python can also be used to write safe code (but it involves more effort)
2. **Ubiquity**: Java is used in reasearch, education, industry
	1. Java runs on Windows/Mac/Linux
	2. Java can be used for Web programming (server and client)
	3. Java can be used for Android programming
		1. Scheme and ML are better in teaching programming (but not widespread)
		2. Java in resume is a marketable skill
	4. The skills acquired from course is not language specific
		1. The skills acquired are:
			1. Safety
			2. Clarity
			3. Abstraction
			4. Engineering instincts
3. **A good programmer must be multilingual**
	1. Programming languages are tools - we must use the right tool for our job
		1. Other languages which can be learnt
			1. JavaScript
			2. C/C++
			3. Scheme or Ruby or ML or Haskell
4. Java has wide array of interesting and useful **libraries** (both its enormous built-in library, and other libraries out on net)
	1. IDEs
		1. Eclipse
	2. Compilers
	3. Test frameworks
	4. Profilers
	5. Code coverage
	6. Style checkers
5. Cons of using Java
	1. Wordy - hard to write examples on board
	2. Large - many features over years
	3. Internally inconsistent - (`final` means different things in different contexts, `static` keyword does not mean static checking)
	4. Has features of older languages - C/C++ (primitive types, switch statement...)
	5. No interpreter:
		1. Java 9+ has

#### Summary ####
1. **static checking**
	1. **Safe from bugs**: Static checking helps with safety by catching type errors and other bugs before runtime
	2. **Easy to understand**: Helps with understanding, because types are explicitly stated in code
	3. **Ready for change**: Static checking makes it easier to change code by identifying other places that need to change in tandem.
		1. Example:
			1. When a name or type of variable is changed, compiler immediately displays errors at all places where variable is used

### Basic Java ###
1. Safe from Bugs
	1. Correct today and correct in the unknown future.
2. Easy to Understand
	1. Communicating clearly with future programmers, including future you
3. Ready for Change
	1. Designed to accomodate change without rewriting

#### Getting Started with the Java Tutorials ####
1. [Java Tutorials](http://docs.oracle.com/javase/tutorial/index.html)
2. [Getting Started: Learning Java](https://ocw.mit.edu/ans7870/6/6.005/s16/getting-started/java.html)
3. [Java API Documentation](http://docs.oracle.com/javase/8/docs/api/)
	1. All classes built into Java

##### Language Basics #####
1. [Language Basics](http://docs.oracle.com/javase/tutorial/java/nutsandbolts/index.html)
2. Questions which need to be answered:
	1. [Variables](http://docs.oracle.com/javase/tutorial/java/nutsandbolts/QandE/questions_variables.html)
	2. [Operators](http://docs.oracle.com/javase/tutorial/java/nutsandbolts/QandE/questions_operators.html)
	3. [Expressions, Statements, Blocks](http://docs.oracle.com/javase/tutorial/java/nutsandbolts/QandE/questions_expressions.html)
	4. [Control Flow](http://docs.oracle.com/javase/tutorial/java/nutsandbolts/QandE/questions_flow.html)

##### Numbers and Strings #####
1. [Numbers and Strings](http://docs.oracle.com/javase/tutorial/java/data/index.html)
2. Questions:
	1. [Numbers](http://docs.oracle.com/javase/tutorial/java/data/QandE/numbers-questions.html)
	2. [Characters, Strings](http://docs.oracle.com/javase/tutorial/java/data/QandE/characters-questions.html)

##### Classes and Objects #####
1. [Classes and Objects](http://docs.oracle.com/javase/tutorial/java/javaOO/index.html)
2. Questions:
	1. [Classes](http://docs.oracle.com/javase/tutorial/java/javaOO/QandE/creating-questions.html)
	2. [Objects](http://docs.oracle.com/javase/tutorial/java/javaOO/QandE/objects-questions.html)

##### Hello, world! #####
1. [Hello World!](http://docs.oracle.com/javase/tutorial/getStarted/application/index.html)

#### Snapshot Diagrams ####
1. Useful to draw pictures of what's happening at runtime (to understand subtle questions)
2. **Snapshot diagrams**: Represent internal state of a program at runtime
	1. Stack (methods in progress and their local variables)
	2. Heap (objects that currently exist)
3. Why do we use snapshot diagrams?
	1. To interact with each other through pictures
	2. To illustrate concepts like 
		1. primitive types vs. object types
		2. immutable values vs. immutable references
		3. pointer aliasing
		4. stack vs. heap
		5. abstractions vs. concrete representations
	3. To help explain design for team project
	4. To pave way for richer design notations in subsequent courses
		1. Snapshot diagrams generalize into object models in 6.170
4. Diagram notation can be applied to any modern programming language (Python, Javascript, C++, Ruby).

##### Primitive Values #####
1. Primitive values are represented using bare constants
2. Incoming arrow is reference to value from variable or object

##### Object Values #####
1. Object value is circle
2. Label is type
3. Field names are written inside (optional)
4. Arrows point to their values
5. Fields can include declared types (optional)
	1. `x:int`
	2. `int x`

##### Mutating Values vs. Reassigning Variables #####
1. Snapshot diagrams give us a way to visualize distinction between changing variable and changing value:
	1. When assigning to variable or field, you are changing where variable's arrow points. You can point it to a different value
	2. When assigning to contents of mutable value - (array or list)
		1. We are changing references inside that value

###### Reassigning and Immutable Values ######
1. Re-assigning:

		String s = "a";
		s = s + "b";
		
	1. `String` is immutable type (values can never change once created)
	2. Immutability (immunity to change) is major design principle in the course
	3. Denoted in diagram by double border

###### Mutable Values ######
1. `StringBuilder` - is mutable object that represents a string of characters
	1. It has methods to change value of the object

			StringBuilder sb = new StringBuilder("a");
			sb.append("b");
			
	2. Difference between mutability and immutability will play an important role in making code safe from bugs

###### Immutable References ######
1. Java has immutable references (variables are assigned only once)
	1. Done using `final` keyword

			final int n = 5;
			
		1. If compiler finds a re-assignment, it throws an error (static checking for immutable references)
2. Snapshot diagram representation: double arrow
3. We can have an immutable reference to a mutable value

		final StringBuilder sb = new StringBuilder("a");
		
4. We can have a mutable reference to an immutable value

		String s = "abcd";

#### Java Collections ####
1. [Arrays](http://docs.oracle.com/javase/tutorial/java/nutsandbolts/arrays.html)
	1. Fixed length containers for a sequence (of objects or primitive types)
2. **Java Collections Framework**: More powerful and flexible tools for managing collections of objects

##### Lists, Sets, and Maps #####
1. [List](http://docs.oracle.com/javase/8/docs/api/?java/util/List.html)
	1. Contains an ordered collection of zero or more **objects**
		1. Same object may appear multiple times
		2. We can add and remove items from the list (grows and shrinks to accomodate its contents)
2. Example list operations:
	1. Java:
		1. `int count = lst.size();` - count number of elements
		2. `lst.add(e);` - append an element to the end
		3. `if (lst.isEmpty()) ...` - test if list is empty
	2. Python:
		1. `count = len(lst)`
		2. `lst.append(e)`
		3. `if not lst: ...`
3. Snapshot diagram representation:
	1. Object with indices drawn as fields
		1. Example: cities is a List of Strings which may represent a trip from Boston to Bogota to Barcelona
4. `Set` - un ordered collection of zero or more unique objects (like in Mathematics) or [Python set](https://docs.python.org/3/library/stdtypes.html#set-types-set-frozenset)
	1. An object cannot appear multiple times
	2. Operations:
		1. Java:
			1. `s1.contains(e)` - test if set contains an element
			2. `s1.containsAll(s2)` - test whether s1 is a superset of s2
			3. `s1.removeAll(s2)` - remove s2 from s1
		2. Python:
			1. `e in S1`
			2. `s1.issuperset(s2)`, `s1 >= s2`
			3. `s1.difference_update(s2)`, `s1 -= s2`
	3. Snapshot diagram representation: Object with no name fields
5. `Map` (similar to Python dictionary)
	1. Key must be hashable
	2. Operations:
		1. Java
			1. `map.put(key, val)` - add mapping key -> val
			2. `map.get(key)` - get the value for a key
			3. `map.containsKey(key)` - test whether map has a key
			4. `map.remove(key)` - delete a mapping
		2. Python
			1. `map[key] = val`
			2. `map[key]`
			3. `key in map`
			4. `del map[key]`
	3. Snapshot diagram representation:
		1. Object that contains key/value pairs
			1. `turtles` map contains `Turtle` objects assigned to `String` keys: `Bob`, `Buckminster`, `Buster`

##### Literals #####
1. Python:
	1. `lst = [ "a", "b", "c" ]`
	2. `map = { "apple": 5, "banana": 7 }`
2. Java:
	1. `String[] arr = { "a", "b", "c" };`
		1. This constructs an array but not list
		2. [provided utility function](http://docs.oracle.com/javase/8/docs/api/?java/util/Arrays.html)

				Arrays.asList(new String[] { "a", "b", "c" });
				
			1. This restricts length (fixed)

##### Generics: Declaring List, Set, and Map Variables #####
1. Java can restrict type of objects contained in collection
	1. When we add item, compiler performs static checking to ensure we only add items of appropriate type
	2. When we pull out an item, it is expected type only
2. Examples:

		List<String> cities;			// a List of Strings
		Set<Integer> numbers;			// a Set of Integers
		Map<String, Turtle> turtles;	// a Map with String keys and Turtle values
		
3. Collection of primitive types cannot be constructed (`Set<int>` is not acceptible)
	1. Primitives have wrappers
		1. Java does automatic conversion between wrappers and primitive types

				sequence.add(5);					// add 5 to the sequence
				int second = sequence.get(1);	// get the second element

##### ArrayLists and LinkedLists: Constructing Lists #####
1. Java helps us distinguish between specification of a type - what does it do? and the implementation - what is the code?
2. `List`, `Set`, `Map` are interfaces:
	1. They define how the types work (they do not provide implementation code)
	2. Advantage:
		1. Users can choose different implementations in different situations
		2. Examples:

				List<String> firstNames = new ArrayList<>();
				List<String> lastNames = new LinkedList<>();
				
			1. Diamond operator `<>` is used to save typing
			2. Both `ArrayList` and `LinkedList` provide operations of `List`
				1. The operations must work as described in the documentation for `List`
				2. If we swap `LinkedList` with `ArrayList` or vice versa, the code will not break
				3. Difference is performance
					1. When in doubt use `ArrayList`

##### HashSets and HashMaps: Constructing Sets and Maps #####
1. `HashSet` - default choice for `Set`s

		Set<String> set = new HashSet<>();
		
	1. Java provides sorted sets with `TreeSet`
2. `HashMap` - default choice for `Map`s

		Map<String, Turtle> map = new HashMap<>();

##### Iteration #####
1. Examples:

		List<String> cities = new ArrayList<>();
		Set<Integer> numbers = new HashSet<>();
		Map<String, Turtle> turtles = new HashMap<>();
		
	1. Python:

			for city in cities:
				print city
				
			for num in numbers:
				print num
				
			for key in turtles:
				print "%s: %s" % (key, turtles[key])
				
	2. Java:

			for (String city : cities) {
				System.out.println(city);
			}
			
			for (int num : numbers) {
				System.out.println(num);
			}
			
		1. We cannot iterate over `Map`s directly
			1. We can iterate over keys:

					for (String key : turtles.keySet()) {
						System.out.println(key + ": " + turtles.get(key));
					}
					
				1. Under the hood, this kind of `for` loop uses `Iterator` (design pattern)

##### Iterating with indices #####
1. Different `for` loop using indices

		for (int i = 0; i < cities.size(); i++)
			System.out.println(cities.get(i));
			
	1. This code is verbose and has more places of bugs to hide (unless we need `i`)

#### Java API Documentation ####
1. [Java Platform API](http://docs.oracle.com/javase/8/docs/api/)
	1. API - Application Programming Interface
		1. If we want an app to talk to **Facebook**, it publishes an API (more than one, for different languages and frameworks)
	2. Java API is large set of generally usueful tools for programming almost anything
		1. `java.lang.String` - full name for `String`
			1. Objects of this type can be constructed using double quotes `"..."`
		2. `java.lang.Integer` - (and other wrapper classes)
			1. Java automatically converts between primitives and wrapped ("boxed") types in most situations
		3. `java.util.List` - in Python it is part of the language but in Java it is implemented
		4. `java.util.Map` - is like Python dictionary
		5. `java.io.File` - represents file on disk
			1. Operations:
				1. Test if file is readable
				2. Delete a file
				3. Check when a file was last modified
		6. `java.io.FileReader` - allows us to read files
		7. `java.io.BufferedReader` - allows us to read text efficiently
			1. Useful feature:
				1. Reading entire line at a time
2. Closer look at `BufferedReader`:
	1. Class hierarchy - at the top of the page
	2. List of implemented interfaces (next)
		1. The class has all the methods of all those types (plus it's own)
	3. Next we see direct subclasses
		1. For interface - implementing classes
			1. Helps us identify that `HashMap` is an implementation of `Map`
	4. Next is **description of class**: they might be a little obtuse (but **first place we should go** to understand the class)
	5. Next is **constructor summery** - which can let us know how a new object can be constructed
		1. Constructor is not the only way in Java but it is most common
	6. Next is **method summary lists all the methods we can call** on object of the class
		1. First place to see to know what the methods do
	7. Next is detailed description which includes:
		1. **method signature** - return type, method name, parameters, exceptions
		2. full **description** -
		3. **Paremeters**: descriptions of method arguments
		4. **Returns** descriptions of what method returns

##### Specifications #####
1. The above detailed descriptions are **specifications**
	1. The specs allow us to use tools like `String`, `Map`, `BufferedReader` without having to read or understand code that implements them
	2. Reading, writing, understanding, analyzing specs:
		1. Key undertakings of the class

### Testing ###
1. Safe from bugs
	1. correct today and in unknown future
2. Easy to understand
	1. Communication clearly with future programmers (including future you)
3. Ready for change
	1. Designed to accommodate change without rewriting

##### Objectives for Today's Class #####
1. Topics covered:
	1. Understand value of testing
		1. With test first programming
	2. Design test suite for a method by
		1. Partitioning input and output space
		2. Choosing good test cases
	3. Judge test suite by measuring code coverage
	4. Know when to use blackbox vs. whitebox testing
	5. Know when to use unit tests vs. integration tests
	6. Know when to use automated regression testing

#### Validation ####
1. Testing is example of general process called *validation*
	1. Purpose of validation: uncover problems in program and increase confidence in program's correctness
	2. Validation includes:
		1. **Formal reasoning**: about program
			1. *verification*
				1. Constructs a formal proof that program is correct
				2. It is tedious to do by hand
					1. Automated tool is active area of research
				3. Small and crucial pieces can be formally verified
					1. Scheduler in OS
					2. Bytecode interpreter in VM
					3. [Filesystem in OS](http://www.csail.mit.edu/crash_tolerant_data_storage)
		2. **Code review**: Having someone else carefully read code and reason informally about it
			1. Good way to uncover bugs
			2. Proofreading (like an essay)
		3. **Testing**: Running program on carefully selected inputs and checking results
2. Even with best validation, it's hard to achieve perfect quality in software
	1. *Residual defect rates* (bugs left over after software has shipped) per kloc (one thousand lines of source code)
		1. 1 - 10 defects/kloc: Typical industry software
		2. 0.1 - 1 defects/kloc: High-quality validation. Java library might achieve this level of correctness
		3. 0.01 - 0.1 defects/kloc: Very best, safety-critical validation, NASA and Praxis can achieve this level
3. Example: for a million lines of industry software, 1 defect/kloc is 1000 bugs!

##### Why Software Testing is Hard #####
1. Approaches that don't work well in software world
2. **Exhaustive testing** - infeasible
	1. space of possible test cases is too big (usually) to cover exhaustively
		1. Example: 32-bit floating-point multiply operation: `a * b` - 2^64 test cases
3. **Haphazard testing** - Just try and see if it works
	1. Likely to find bugs - if the program is too buggy (more likely to fail than succeed)
	2. Does not increase our confidence in program correctness
4. **Random or statistical testing** - Doesn't work well for software
	1. Other disciplines can test small random samples (1% hard drives manufactured) and infer defect rate for whole production lot
	2. Physical systems can use tricks to speed up time
		1. Opening a refrigerator 1000 times in 24 hours instead of in 10 years
			1. The tricks have known failure rates (mean lifetime of hard drive)
				1. Continuity or uniformity across space of defects is assumed - true for physical artifacts
	3. Software behavior varies discontinuosly and discretely across space of possible inputs
		1. System may seem to work fine across broad range of inputs and abrupty fail at single boundary point
			1. [famous Pentium division bug](http://www.willamette.edu/~mjaneba/pentprob.html)
				1. Affected 1 in 9 billion divisions
		2. Stackoverflows, out of memory, numberic overflow tend to happen abruptly (always in the same way though and not with probabilistic variation)
			1. For physical systems, there is visible evidence that system is approaching failure point (cracks in bridge) or failures distributed probabilistically near failure point (statistical testing will observer some failures before point is reached)
	4. Test cases must be chosen carefully and systematically

##### Putting on Your Testing Hat #####
1. As a tester, you want to make the program fail
	1. Don't be tempted to treat code as precious thing and fragile eggshell to test it lightly just to see it work
2. Be brutal!!!
	1. Good tester beats program everywhere it might be vulnerable so that the vulnerabilities can be eliminated

#### Test-first Programming ####
1. Test early and often (not at the end)
	1. Don't have a pile of invalidated code
		1. Debugging is longer and more painful
	2. Test the code as we develop it
2. Test first programming:
	1. Write tests before we write any code
	2. Development of a single function:
		1. Write a specification for the function
		2. Write tests that exercise the specification
		3. Write the actual code. Once your code passes the tests you wrote, you're done
3. **Specification**: Describes input behavior and output behavior of function
	1. Gives types of parameters
	2. Gives additional constraints on them (`sqrt`'s parameter must be nonnegative)
	3. Gives type of the return value
	4. Gives how the return value relates to inputs
4. Implementation of spec:
	1. Method signature
	2. Comment above it that describes what it does
5. Writing tests first is a good way to understand spec
	1. Spec can be buggy too
		1. Incorrect
		2. Incomplete
		3. Ambiguous
		4. Missing corner cases
	2. Trying to write tests can uncover problems early (before we've wasted time writing implementation of buggy spec)

#### Choosing Test Cases by Partitioning ####
1. Challenging design problem: Choosing good test suite
	1. Test cases must be small enough to run quickly
	2. Test cases must be large enough to validate the program
2. Implementation:
	1. Divide input space into **subdomains**
		1. Each subdomain consists of a set of inputs
	2. All subdomains completely cover input space (every input lies in at least one subdomain)
	3. Choose one test case from each subdomain
	4. The chosen tests form test suite
3. How to partition:
	1. Partition input space into sets of similar inputs on which program has similar behavior
	2. We can use one representative of each set
4. Advantages:
	1. Makes use of limited testing resources
		1. Chooses dissimilar test cases
	2. Forces testing to explore parts of input space that random testing might not reach
5. Output space can also be partitioned into subdomains (similar inputs on which program has similar behavior)
	1. If we need to ensure, tests will explore different parts of output space
		1. Most times, partitioning input space is sufficient

##### Example: `BigInteger.multiply()` #####
1. `BigInteger` - is in Java library which can represent integers of any size (no virtual limit)
	1. `multiply()` - method in `BigInteger` to multiply two instances of `BigInteger`

			/**
			 * @param val another BigInteger
			 * @return a BigInteger whose value is (this * val).
			 */
			public BigInteger multiply(BigInteger val)
			
		1. Examples:

				BigInteger a = ...;
				BigInteger b = ...;
				BigInteger ab = a.multiply(b);
				
			1. `multiply` is a function of two arguments: `a` and `b`
				1. `this` represents `a`
				2. It takes two arguments of type `BigInteger`:

						multiply: BigInteger x BigInteger -> BigInteger
						
					1. This is 2-D input space (with all pairs of (a,b))
					2. Partitioning:
						1. a and b are both positive
						2. a and b are both negative
						3. a is positive, b is negative
						4. a is negative, b is positive
						5. a or b is 0, 1 or -1 (special cases)
						6. Implementer might try to make it faster using `int` or `long` internally when possible and fall back to expensive general representation when value is too big: Hence try big integers bigger than `long`
							1. a or b is small
							2. If a or b is bigger than `Long.MAX_VALUE` - biggest possible primitive integer in Java: Roughly `2^63`
					3. Choose `a` and `b` independently from:
						1. 0
						2. 1
						3. -1
						4. small positive integer
						5. small negative integer
						6. huge positive integer
						7. huge negative integer
					4. This will produce: 7 x 7 = 49 partitions that completely cover space of pairs of integers
					5. To produce test suite: pick arbitrary pair (a,b) from each square of grid:
						1. (a,b) = (-3,25) to cover (small negative, small positive)
						2. (a,b) = (0,30) to cover (0, small positive)
						3. (a,b) = (2^100,1) to cover (large positive, 1)
						4. ...
			2. `max()`:

					/**
					 * @param a	an argument
					 * @param b	another argument
					 * @return the larger of a and b
					 */
					public static int max(int a, int b)
					
				1. Partitioning:
					1. a < b
					2. a = b
					3. a > b
				2. Test suite:
					1. (a,b) = (1,2) to cover a < b
					2. (a,b) = (9,9) to cover a = b
					3. (a,b) = (-5,-6) to cover a > b
				3. Include boundaries in the Partition
					1. Bugs usually occure at boundaries between subdomains:
						1. Examples:
							1. 0 is a boundary between positive numbers and negative numbers
							2. the maximum and minimum values of numeric types, like `int` and `double`
							3. emptiness (the empty string, empty list, empty array) for collection types
							4. the first and last element of a collection
						

#### Blackbox and Whitebox Testing ####
#### Documenting Testing Strategies ####
#### Coverage ####
#### Unit Testing and Stubs ####
#### Automated Testing and Regression Testing ####

### Code Review ###
#### Don't Repeat Yourself ####
#### Comments Where Needed ####
#### Fail Fast ####
#### Avoid Magic Numbers ####
#### One Purpose for Each Variable ####
#### Use Good Names ####
#### Use Whitespace to Help the Reader ####
#### Don't Use Global Variables ####
#### Methods Should Return Results, Not Print Them ####

### Version Control ###
#### Inventing Version Control ####
#### Git: Copy, Commit, Pull, Push, Merge ####

### Specifications ###
#### Why Specifications? ####
#### Behavioral Equivalence ####
#### Specification Structure ####
#### Null References ####
#### What a Specification May Talk About ####
#### Testing and Specifications ####
#### Specifications for Mutating Methods ####
#### Exceptions for Signaling Bugs ####
#### Exceptions for Special Results ####
#### Checked and Unchecked Exceptions ####
#### Throwable Hierarchy ####
#### Exception Design Considerations ####
#### Abuse of Exceptions ####

### Designing Specifications ###
#### Deterministic vs Undetermined Specs ####
#### Declarative vs Operational Specs ####
#### Stronger vs Weaker Specs ####
#### Diagramming Specifications ####
#### Designing Good Specifications ####
#### Precondition or Postcondition? ####
#### About Access Control ####
#### About Static vs Instance Methods ####

### Avoiding Debugging ###
#### First Defense: Making Bugs Impossible ####
#### Second Defense: Localizing Bugs ####
#### Assertions ####
#### What to Assert ####
#### What Not to Assert ####
#### Incremental Development ####
#### Modularity and Encapsulation ####

### Mutability & Immutability ###
#### Mutability ####
#### Risks of Mutation ####
#### Aliasing is What Makes Mutation Risky ####
#### Specifications for Mutating Methods ####
#### Iterating Over Arrays and Lists ####
#### Mutation Undermines an Iterator ####
#### Mutation and Contracts ####
#### Useful Implementation Types ####

### Recursion ###
#### Choosing the Right Decomposition For a Program ####
#### Structure of Recursive Implementations ####
#### Helper Methods ####
#### Choosing the Right Recursive Subproblem ####
#### Recursive Problem vs Recursive Data ####
#### Reentrant Code ####
#### When to Use Recursion Rather Than Iteration ####
#### Common Mistakes in Recursive Implementations ####

### Debugging ###
#### Reproduce the Bug ####
#### Understand the Location and Cause of the Bug ####
#### Fix the Bug ####

### Abstract Data Types ###
#### What Abstraction Means ####
#### Classifying Types and Operations ####
#### Designing Abstract Type ####
#### Representation Independence ####
#### Realizing ADT Concepts in Java ####
#### Testing and Abstract Data Type ####

### Abstraction Functions & Rep Invariants ###
#### Invariants ####
#### Rep Invariant and Abstraction Function ####
#### Documenting the AF, RI, and Safety from Rep Exposure ####
#### ADT Invariants Replace Preconditions ####

### Interfaces ###
#### Interfaces ####
#### Subtypes ####
#### Example: MyString ####
#### Example: Set ####
#### Generic Interfaces ####
#### Why Interfaces? ####
#### Realizing ADT Concepts in Java, Part II ####

### Equality ###
#### Three Ways to Regard Equality ####
#### == vs. equals() ####
#### Equality of Immutable Types ####
#### The Object Contract ####
#### Equality of Mutable Types ####
#### The Final Rule For Equals() and hashCode() ####

### Recursive Data Types ###
#### Recursive Functions ####
#### Immutable Lists ####
#### Recursive Datatype Definitions ####
#### Functions Over Recursive Datatypes ####
#### Tuning the Rep ####
#### Null vs Empty ####
#### Declared Types vs Actual Type ####
#### Example: Boolean Formulas ####
#### Writing a Program with ADTs ####
#### Recipes for Programming with ADTs ####
#### Example: Matrix Multiplication ####

### Regular Expressions and Grammars ###
#### Grammars ####
#### Regular Expressions ####

### Parser Generators ###
#### Parser Generators ####
#### An Antlr Grammar ####
#### Generating the Parser ####
#### Calling the Parser ####
#### Traversing the Parse Tree ####
#### Constructing and Abstract Syntax Tree ####
#### Handling Errors ####

### Concurrency ###
#### Two Models for Concurrent Programming ####
#### Processes, Threads, Time-Slicing ####
#### Example: Shared Memory ####
#### Interleaving ####
#### Race Condition ####
#### Tweaking the Code Won't Help ####
#### Reordering ####
#### Example: Message Passing ####
#### Concurrency is Hard to Test and Debug ####

### Thread Safety ###
#### What Threadsafe Means ####
#### Strategy 1: Confinement ####
#### Strategy 2: Immutability ####
#### Strategy 3: Using Threadsafe Data Types ####
#### How to Make A Safety Argument ####

### Sockets & Networking ###
#### Client/ Server Design Pattern ####
#### Network Sockets ####
#### I/O ####
#### Blocking ####
#### Using Network Sockets ####
#### Wire Protocols ####
#### Testing Client/ Server Code ####

### Queues & Message-Passing ###
#### Two Models for Concurrency ####
#### Message Passing with Threads ####
#### Implementing Message Passing with Queues ####
#### Stopping ####
#### Thread Safety Arguments with Message Passing ####

### Locks & Synchronization ###
#### Synchronization ####
#### Deadlock ####
#### Developing a ThreadSafe Abstract Data Type ####
#### Locking ####
#### Monitor Pattern ####
#### Thread Safety Argument with Synchronization ####
#### Atomic Operations ####
#### Designing a Data Type for Concurrency ####
#### Deadlock Rears its Ugly Head ####
#### Goals of Concurrent Program Design ####
#### Concurrency in Practice ####

### Graphical User Interfaces ###
#### View Tree ####
#### How th View Tree is Used ####
#### Input Handling ####
#### Separating Frontend from Backend ####
#### Background Processing in Graphical User Interfaces ####

### Map, Filter, Reduce ###
#### Abstracting Out Control Flow ####
#### Map ####
#### Functions as Values ####
#### Filter ####
#### Reduce ####
#### Benefits of Abstracting Out Control ####
#### First-Class Functions in Java ####
#### Map/Filter/Reduce in Java ####
#### Higher-order Functions in Java ####

### Little Languages ###
#### Representing Code as Data ####
#### Building Languages to Solve Problems ####
#### Music Language ####

### Team Version Control ###
#### Git Workflow ####
#### Viewing Commit History ####
#### Graph of Commits ####
#### Using Version Control as a Team ####

## General ##
### General Information ###
### Collaboration and Public Sharing ###
### Code Reviewing ###
### Nanoquiz Grading and Makeups ###

## Getting Started ##
### Getting Started: Java, Eclipse & Git ###
### Getting Started: Java ###
### Getting Started: Eclipse FAQ ###

## Problem Sets ##
### Turtle Graphics ###
### Tweet Tweet ###
### Poetic Walks ###
### Expressivo ###
### Multiplayer Minesweeper ###

## Project ##
### ABC Music Player ###

## Quizzes ##
### Quiz 1 and Quiz 1 solutions ###
### Quiz 2 and Quiz 2 solutions ###
### Quiz Archive ###