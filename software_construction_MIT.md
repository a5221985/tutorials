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

##### Include boundaries in the Partition #####
1. Bugs usually occure at boundaries between subdomains:
	1. Examples:
		1. 0 is a boundary between positive numbers and negative numbers
		2. the maximum and minimum values of numeric types, like `int` and `double`
		3. emptiness (the empty string, empty list, empty array) for collection types
		4. the first and last element of a collection
2. Why bugs happen at boundaries?
	1. Programmers often make off-by-one mistake (writing `<=` instead of `<` or initializing counter to 0 instead of 1)
	2. Some boundaries need to be handled as special cases in code
	3. Boundaries may be places of discontinuity in code's behavior
		1. If `int` grows beyond it's max positive value - it abruptly becomes negative
3. Solution:
	1. Include boundaries as subdomains in partition (we must choose inputs from boundary)
	2. Example: `max : int x int -> int`
		1. Partion into:
			1. Relationship between a and b
				1. a < b
				2. a = b
				3. a > b
			2. Value of a
				1. a = 0
				2. a < 0
				3. a > 0
				4. a = minimum integer
				5. a = maximum integer
			3. Value of b
				1. b = 0
				2. b > 0
				3. b < 0
				4. b = minimum integer
				5. b = maximum integer
		2. Pick test values that cover all classes:
			1. (1,2) covers a < b, a > 0, b > 0
			2. (-1, -3) covers a > b, a < 0, b < 0
			3. (0, 0) covers a = b, a = 0, b = 0
			4. (Integer.MIN_VALUE, Integer.MAX_VALUE) covers a < b, a = minint, b = maxint
			5. (Integer.MAX_VALUE, Integer.MIN_VALUE) covers a > b, a = maxint, b = minint

##### Two Extremes for Covering the Partition #####
1. After paritioning, we can choose how exhaustive we want test suite to be:
	1. **Full Cartesian Product**
		1. Every legal combination of partition dimensions is covered by one test case
			1. `multiply` example: 7 x 7 = 49 test cases
			2. `max` example:
				1. Includes boundaries
				2. three dimensions with
					1. 3 parts
					2. 5 parts
					3. 5 parts
				3. 3 x 5 x 5 = 75 test cases
					1. In practice not all combinations are possible (no way to cover a < b, a = 0, b = 0, because a can't be simultaneously less than zero and equal to zero)
	2. **Cover Each Part**
		1. Every part of each dimension is covered by at least one test case (not necessarily every combination)
			1. Reduces test cases to 5 for `max` if carefully chosen
2. We may often have to strike compromize between the two extremes
	1. Basis
		1. Human judgement and caution
		2. Whitebox testing
		3. Code coverage tools

#### Blackbox and Whitebox Testing ####
1. Specification: 
	1. Description of function's behavior
	2. Types of parameters
	3. Type of return value
	4. Constraints
	5. Relationships between the constraints

##### Blackbox Testing #####
1. Choosing test cases only from specification (not from implementation of function)
	1. We have been doing this so far
		1. Partitioned and looked at boundaries in `multiply` and `max` (not looked into actual code)

##### Whitebox Testing #####
1. Also called glassbox testing
2. It is choosing test cases with knowledge of how function is actually implemented
	1. Example:
		1. If implementation selects different algorithms based on input (then partitioning is according to those domains)
		2. If implementation keeps an internal cache that remembers answers to previous inputs (we should test repeated inputs)
3. Whitebox testing should not include specific implementation behavior that is not specifically called for by spec
	1. Example: If spec says "throws an exception if the input is poorly formatted"
		1. Test shouldn't check specifically for `NullPointerException` (this could be the current implementation and a different implementation might throw a different exception)
		2. Spec in this case allows any exception to be thrown
			1. Test case should be general to preserve implementor's freedom

#### Documenting Testing Strategies ####
1. Specification is on top of the class

		/**
		 *	Reverse the end of a string.
		 * 
		 *	For example:
		 * 		reverseEnd("Hello, world", 5)
		 * 	 	returns "Hellodlrow ,"
		 * 	  
		 *	With start = 0, reverses the entire text.
		 *	With start == text.length(), reverses nothing.
		 * 
		 *	@param		text	non-null String that will have
		 * 				  		its end reversed
		 *	@param		start	the index at which the
		 *  					remainder of the input is
		 *  					reversed, requires 0 <=
		 *  					start <= text.length
		 *	@return	input text with the substring from
		 * 				start to the end of the string
		 * 			 	reversed
		 */
		 static String reverseEnd(String text, int start);
		 
1. Document the strategy at the top of the test classes:

		/*
		 *	Testing strategy
		 * 
		 *	Partition the inputs as follows:
		 *	text.length():			0, 1, > 1
		 *	start:						0, 1, 1 < start < text.length(),
		 * 								text.length() - 1, text.length()
		 * 	text.length() - start:	0, 1, even > 1 odd > 1
		 *  
		 *	Include even- and odd-length reversals because
		 *	only odd has a middle element that doesn't move.
		 * 
		 *	Exhaustive Cartesian coverage of partitions.
		 */
		 
2. Document how each test case was chosen, including white box tests:

		// covers	test.length() = 0,
		//			start = 0 = text.length(),
		//			text.length() - start = 0
		@Test public void testEmpty() {
			assertEquals("", reverseEnd("", 0));
		}
		
		// ... other test cases ...

#### Coverage ####
1. A way to judge test suite is to ask how thoroughly it exercises program
	1. It is called coverage
2. Common kinds of coverage:
	1. **Statement coverage**: is every statement run by some test case?
	2. **Branch coverage**: for every `if` or `while` statement, are both true and false direction taken by some test case?
	3. **Path coverage**: is every possible combination of branches (every path through the program) taken by some test case?
3. Branch coverage is stronger (requires more tests) than statement coverage
4. Path coverage is stronger than branch coverage
	
		path coverage >= branch coverage >= statement coverage
		
	1. Industry goal: 100% statement coverage (rarely achieved due to unreachable defensive code (like "should never get here" assertions)
	2. Highly desirable: 100% branch coverage
		1. Safety critical industry code has arduous criteria (e.g. "MCDC" - modified decision/condition coverage)
	3. Infeasible: 100% path coverage (requires exponential-size test suites)
5. Standard approach:
	1. Add tests until test suite achieves adequate statement coverage
		1. Every reachable statement in the program is executed by at least one test case
		2. Usually measured by a code coverage tool
			1. Counts the number of times each statement is run by test suite
				1. This makes whitebox testing easy
			2. Strategy:
				1. Measure the coverage of black box tests
				2. Add more test cases until all important statements are  executed
6. Tools:
	1. Eclemma - Eclipse plugin
		1. Lines executed are colored green
		2. Lines not yet covered are red
			1. Come up with test cases that execute the red colored lines until all red lines become green

#### Unit Testing and Stubs ####
1. Well-tested program will have tests for every individual module (where a module is a method or a class) contained in it
2. **Unit Test**: Test that tests individual module in isolation
	1. Testing in isolation leads to easier debugging
		1. If a unit test for a module fails, we can be confident that bug is found in that module (rather than everywhere in program)
3. **Integration Test**: Tests a combination of modules (or entire program)
	1. If a test fails, we may have to hunt for the bug (might be everywhere in the program)
	2. They are still important
		1. Because a program can fail at the connections (interfaces) between modules
			1. Example:
				1. A module might be expecting a different input than it's actually getting from another module
		2. Thorough set of unit tests give confidence in correctness of individual modules (less searching for bugs)
4. If we are building a web search engine:
	1. Two modules could be:
		1. `getWebPage()` - downloads web pages
		2. `extractWords()` - splits a page into its component words
5. Specification:

		/** @return	the contents of the web page downloaded from url
		 */
		public static String getWebPage(URL url) { ... }
		
		/** @return	the words in string s, in the order they appear,
		 *				where a word is a continuous sequence of
		 *			 	non-whitespace and non-punctuation characters
		 */
		public static List<String> extractWords(String s) { ... }
		
6. The methods methods can be used by another module `makeIndex()` as part of web crawler that makes search engine's index:

		/** @return	an index mapping a word to the set of URLs
		 *				containing that word, for all webpages in the input set
		 */
		public static Map<String, Set<URL>> makeIndex(Set<URL> urls) {
			...
			for (URL url : urls) {
				String page = getWebPage(url);
				List<String> words = extractWords(page);
				...
			}
			...
		}
		
	1. Test suite should have:
		1. unit tests just for `getWebPage()` that test it on various URLs
		2. unit tests just for `extractWords()` that test it on various strings
		3. unit tests for `makeIndex()` that test it on various sets of URLs
7. Mistake:
	1. Writing test cases for `extractWords()` that depend on test cases on `getWebPage()` to be correct
8. Modules must be tested in isolation and by paritioning
	1. Partitions to use web content for `extractWords()` could be reasonable but should not depend on `getWebPage()` which might be buggy!
		1. Solution: Store web page content as a string and pass it directly to `extractWords()`
9. For `makeIndex()` : If a test fails, the failure might have been in any of the methods called by `makeIndex()`
	1. Solution: **stub** versions of the modules called by higher level module
		1. Example: stub for `getWebPage()` wouldn't access internet, but return mock web page content irrespective of the URL passed
		2. Stub for class is called [mock object](http://en.wikipedia.org/wiki/Mock_object)
			1. Important technique for building large systems

#### Automated Testing and Regression Testing ####
1. **Automated testing** - running tests and checking their resuts automatically
	1. Test driver should not be interactive program that prompts for inputs and prints results for manual checking
		1. Test driver should
			1. Invoke module on fixed test cases
			2. Automatically check that results are correct
		2. Results should be:
			1. All tests OK
			2. These tests failred: ...
	2. Testing frameworks for automated test suites: JUnit
2. Automatic test generation is a hard problem - a subject of active computer science research
3. When we modify code, we must rerun the tests - Prefents program from regressing (introducing other bugs when you fix new bugs or add new features)
	1. Running all tests after every change is **regression testing**
4. How to fix bugs using tests?
	1. Take input that caused the bug and add it to automated test suite as a test case
		1. This is a regression test
			1. Helps populate test suite with good test cases (good test case elicits a bug)
			2. Also protects code from reversions that re-introduce the bug
				1. The bug is easy to make because it happend before
5. Test-first debugging:
	1. When a bug arises, write a test case for it that elicits it
	2. Immediately add it to test suite
	3. Once we fix the bug, all test cases should pass
		1. This can be regression test for the bug
6. In practice, automated testing and regression testing are used in combination
	1. Regression testing: practiced only if tests can be run often, automatically
	2. If we already have automated testing, it can be used to prevent regressions
7. **Automated Regression Testing**: best-practice of modern software engineering

#### Summary ####
1. Ideas:
	1. Test-first programming: Write tests before you write code
	2. Partitioning and boundaries for choosing test cases systematically
	3. White box testing and statement coverage for filling out a test suite
	4. Unit-testing each module, in isolation as much as possible
	5. Automated regression testing to keep bugs from coming back
2. Three key properties of good software as follows:
	1. **Safe from bugs**: Testing is for finding bugs
		1. Test-first programming - finding them as early as possible (immediately after it is introduced)
	2. **Easy to understand**: Code review is important
	3. **Ready for change**: By writing tests that only depend on behavior in spec.
		1. Automated regression testing - helps keep bugs from coming back when changes are made

### Code Review ###
1. Safe from bugs
	1. Correct today and correct in the unknown future
2. Easy to understand
	1. Communicating clearly with future programmers, including future you
3. Ready for change
	1. Designed to accommodate change without rewriting
4. Objectives:
	1. Code review: Reading and discussing code written by sombody else
	2. General principles of good coding: things you can look for in every code review, regardless of programming language or program purpose

#### Code Review ####
1. it is careful, systematic study of source code by people who are not original author of the code
	1. It is like proofreading a term paper
2. Two purposes of code review:
	1. **Improving the code**:
		1. Finding bugs
		2. Anticipating possible bugs
		3. Checking the clarity of code
		4. Checking for consistency with project's style standards
	2. **Improving the programmer**
		1. It is an important way programmers learn and teach each other
			1. About new language features
			2. About changes in design of project
			3. About coding standards
			4. About new techniques
		2. Open source projects:
			1. Much conversation happens in the context of code reviews
3. Widely practiced in open source projects
	1. Apache
	2. [Mozilla](http://blog.humphd.org/vocamus-1569/?p=1569)
4. Widely practiced in industry
	1. Google: Cannot push code into main repository until another entineer has signed off on it in code review
5. [MIT Code Reviewing Document](https://ocw.mit.edu/ans7870/6/6.005/s16/general/code-review.html)

##### Style Standards #####
1. Most companies and large projects have coding style standards
	1. [Google Java Style](http://google.github.io/styleguide/javaguide.html)
2. They can be very detailed
	1. Like how deep to indent
	2. Where curly braces and parantheses should go
3. They are a matter of taste and style
4. [Java General Style Guide](http://www.oracle.com/technetwork/java/javase/documentation/codeconvtoc-136057.html)
	1. Not updated for latest versions
	2. Specific advices:
		1. Opening brace should be at the end of the line that begins the compound statement
		2. Closing brace should beging at line and be indented to the beginning of compound statement

				public static void main(String[] args) { // point 1
					// ...
				} // point 2
		
5. Guidelines:
	1. Style is not important (but follow conventions of the project working on)
	2. Be self consistent
	3. Be a team player
6. Sensible rules:
	1. Topic of the course
	2. Need to look for them when coding or reviewing other's code
	3. It is not an exhaustive list
	4. Other factors that help code review:
		1. Specifications
		2. Abstract Data Types with representation invariants
		3. Concurrency and Thread safety

##### Smelly Example #1 #####
1. A bad code is often described as a bad smell that needs to be removed (Also called Code hygiene)
2. Example: Smelly code

		public static int dayOfYear(int month, int dayOfMonth, int year) {
			if (month == 2) {
				dayOfMonth += 31;
			} else if (month == 3) {
				dayOfMonth += 59;
			} else if (month == 4) {
				dayOfMonth += 90;
			} else if (month == 5) {
				dayOfMonth += 31 + 28 + 31 + 30;
			} else if (month == 6) {
				dayOfMonth += 31 + 28 + 31 + 30 + 31;
			} else if (month == 7) {
				dayOfMonth += 31 + 28 + 31 + 30 + 31 + 30;
			} else if (month == 8) {
				dayOfMonth += 31 + 28 + 31 + 30 + 31 + 30 + 31;
			} else if (month == 9) {
				dayOfMonth += 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31;
			} else if (month == 10) {
				dayOfMonth += 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30;
			} else if (month == 11) {
				dayOfMonth += 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31;
			} else if (month == 12) {
				dayOfMonth += 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30;
			}
			return dayOfMonth;
		}
		
	1. Next few sections will pick out the particular smells in the code

#### Don't Repeat Yourself ####
1. Duplicated code cons:
	1. Risk to safety
		1. If we have identical or similar code in two places, there may be bug in both copies
			1. If a maintainer fixes a bug in one place, the bug still exists in other copies
	2. Avoid duplication
		1. Do not copy and paste code from one place to the other (longer the block copied, riskier it is)
2. [Don't Repeat Yourself](http://en.wikipedia.org/wiki/Don't_repeat_yourself) - DRY must be followed
	1. `dayOfMonth` code has a lot of duplication

#### Comments Where Needed ####
1. Good software developers write comments in code and do it judiciously
	1. Good comments:
		1. Makes code easier to understand
		2. Safer from bugs (important assumptions have been documented)
		3. Ready for change
2. Kinds of comments:
	1. Specification - re-appears above a method or above a class - documents behavior of method or class
		1. Java: written as Javadoc comment
			
				/**
				 *
				 * ...
				 */
				 
			1. Example:

					/**
					 * Compute the hailstone sequence.
					 * See http://en.wikipedia.org/wiki/Collatz_conjecture#Statement_of_the_problem
					 * @param n starting number of sequence; requires n > 0
					 * @return the hailstone sequence starting at n and ending with 1.
					 * 				For example, hailstone(3) = [3, 10, 5, 16, 8, 4, 2, 1]
					 */
					public static List<Integer> hailstoneSequence(int n) {
						// ...
					}
					
		2. Specifications must document assumptions
	2. Source or piece of code copied or adapted from elsewhere
		1. Good practice
		2. Example:

				// read a web page into a string
				// see http://stackoverflow.com/questions/4328711/read-url-to-string-in-few-lines-of-java-code
				String mitHomepage = new Scanner(new URL("http://www.mit.edu").openStream, "UTF-8").useDelimiter("\\A").next();
				
			1. Avoids violation of copyright
				1. Stackoverflow may be in public domain but other sources may be proprietary or covered by other open source licenses (may be more restrictive)
			2. Important if the code has fallen out of date (coding style evolved now)
3. Bad comments:
	1. Transilaterations of code into English (it does not improve understanding - reader at-least knows Java)

			while (n != 1) {  // Test whether n is 1 (don't write comments like this!)
				++i; increment i
				l.add(n); // add n to l
			}
		
		1. Obscure code might get comment:

				sendMessage("as you wish"); // this basically says "I love you"
				
			1. `dayOfYear` needs some comments
				1. where? month runs from 0 to 11 or 1 to 12?

#### Fail Fast ####
1. Means: code should reveal bugs as early as possible
	1. Earlier the problem is revealed (closeer to cause), easier it is to find and fix
		1. Example: Static checking fails faster than dynamic checking
		2. Example: Dynamic checking fails faster than producing wrong answer that may corrupt further computation
2. Example: `dayOfYear` functions doesn't fail fast

#### Avoid Magic Numbers ####
1. 0, 1 and may be 2 are recognized as constants by Computer Scientists. Everything else are not (they don't mean much without explanation)
2. Declare a number with named constant (clear name)
3. Example:
	1. Months 2, ..., 12 can be named `FEBRUARY`, ..., `DECEMBER`
	2. 30, 31, 28 are more readable (and must eliminate duplicate code) if they are in data structure like `MONTH_LENGTH[month]`
	3. Do not hardcode constants computed by hand. Instead use something similar to:

			MONTH_LENGTH[JANUARY] + MONTH_LENGTH[FEBRUARY]

#### One Purpose for Each Variable ####
1. Example: `dayOfMonth` is re-used to compute very different values
2. Don't re-use parameters and variables
	1. Introduce them freely
	2. Give good names
	3. Stop using them when we don't need them (variable that meant something must not mean something else elsewhere)
		1. It is also a safety from bugs
		2. It is ready for change
3. Method parameters should generally be left un-modified
	1. Important for ready for change
		1. In future, another part of method may need the original parameters
	2. Use `final` - variable should never be re-assigned (Java checks that statically)
		1. Example:

				public static int dayOfYear(final int month, final int dayOfMonth, final in year) {
					// ...
				}
				
#### Smelly Example #2 ####
1. Bug in `dayOfyear` - Didn't handle leap years
	1. Suppose we write the following:

			public static boolean leap(int y) {
				String tmp = String.valueOf(y);
				if (tmp.charAt(2) == '1' || tmp.charAt(2) == '3' || tmp.charAt(2) == 5 || tmp.charAt(2) == '7' || tmp.charAt(2) == '9') {
					if (tmp.charAt(3) == '2' || tmp.charAt(3) == '6') return true; /* R1 */
					else
						return false; /* R2 */
				} else {
					if (tmp.charAt(2) == '0' && tmp.charAt(3) == '0') {
						return false; /* R3 */
					}
					if (tmp.charAt(3) == '0' || tmp.charAt(3) == '4' || tmp.charAt(3) == '8') return true; /* R4 */
				}
				return false; /* R5 */
			}

#### Use Good Names ####
1. Good method names and variable names are long and self-descriptive
	1. Comments can be avoided by making code more readable (using better names that describe methods and variables)
		1. Bad example:

				int tmp = 86400; // tmp is the number of seconds in a day (don't do this!)
				
		2. Good example:

				int secondsPerDay = 86400;
				
			1. `tmp`, `temp` and `data` are aweful names (programmer laziness)
				1. Every local variable is temporary (meaningless name)
				2. Every variable is data (meaningless name)
			2. Solution: Use long and descriptive names
2. Follow lexical naming conventions of the language
	1. Python: Classes are capitalized, variables are lowercase, words_are_separated_by_underscores.
	2. Java:
		1. `methodsAreNamedWithCamelCaseLikeThis`
		2. `variablesAreAlsoCamelCase`
		3. `CONSTANTS_ARE_IN_ALL_CAPS_WITH_UNDERSCORES`
		4. `ClassesAreCapitalized`
		5. `packages.are.lowercase.and.separated.by.dots`
3. Method names: verb phrases - `getDate`, `isUpperCase`
4. Variables and classes: noun phrases
	1. Use short words and be concise (avoid abbreviations)
		1. `message` is clearer than `msg`
		2. `word` is better than `wd`
	2. Abbreviations are harder for non-English speaking colleagues
5. `leap` bad name - it has multiple meanings based on context
	1. `leapYear` is better

#### Use Whitespace to Help the Reader ####
1. 

#### Don't Use Global Variables ####
#### Methods Should Return Results, Not Print Them ####

### Version Control ###
#### Inventing Version Control ####
#### Git: Copy, Commit, Pull, Push, Merge ####

### Specifications ###
#### Introduction ####
1. It's impossible to delegate responsibility for implementing a method without spec
	1. It is a contract
		1. Implementer is responsible for meeting the contract
		2. Client can rely on the contract
		3. It has demands on both parties
			1. If spec has pre-condition, client also has resposibilities (to fulfill the pre-conditions)
2. Topics
	1. Specification of methods
	2. Pre-conditions & Post-conditions
		1. What do they mean to implementor
		2. What do they mean to client
	3. Exceptions
		1. Makes methods safer from bugs
		2. Makes methods easier to understand
		
#### Why Specifications? ####
1. Bugs arise due to misunderstanding about behavior at interface between two pieces of code
2. Problems
	1. Different programmers in a team may have different specs in mind
3. Solution
	1. Precise spec in code lets us apportion blame to framents of code (not people)
4. Benefit
	1. Good for client of a method (don't have to read code to understand it)
5. Example: Java Spec for `BigInteger`
	1. Also has additional docs for corner cases
6. Benefit to implementer:
	1. Freedom to change implementation without telling clients
	2. Code can be faster
		1. Restricting inputs: may allow implementor to skip expensive check that is no longer necessary (more efficient implementation might exist)
	3. Contract is like a firewall between client and implementor
		1. Shields client from details of workingings of unit
			1. Spec is enough and we don't have to read the source code to use it
		2. Shields implementor from usage of the unit
		3. Decoupling - Code of unit and code of client can be changed independently (changes should respect the spec)

#### Behavioral Equivalence ####
1. Can we substitute one implementation for the other
2. There are clients that rely on only a subset of possible outputs and ignore the rest
	1. To substitute one implementation for another
	2. To know when substitution is possible
3. A spec should tell what the client depends on
	1. Example:

			static int find(int[] arr, int val)
				requires: val occurs exactly once in arr
				effects: returns index 1 such that arr[i] = val

#### Specification Structure ####
1. Clauses
	1. *precondition*: keyword used - `requires`
		1. It is an obligation on client (caller of method)
			1. It is a state in which the method must be invoked
	2. *postcondition*: keyword used - `effects`
		1. It is an obligation on implementor
		2. If precondition holds for invoking state, method is obliged to obey postcondition (by returning appropriate values, throwing exceptions, modifying or not modifying objects, ...)
			1. Logical implication:

					If 
						the precondition holds when method is called,
					then
						the postcondition must hold when method completes
						
					If 
						the precondition does not hold when method is called,
					then
						the implementation is not bound by post-condition (free to do anything, termination, throwing exception, returning arbitrary results, making arbitrary modifications included)
						
##### Specifications in Java #####
1. Case study: Eifel - incorporates preconditions and postconditions as part of language (runtime system, or compiler automatically checks to enfore contracts between clients and implementers)
2. Java does not have this
	1. static type checks (alternatives)
	2. Rest of contract which cannot be written as types:
		1. Described in comment preceding the method (human verification is required)
			1. Java documentation comments can be used
				1. `@param` - parameters
					1. Pre-conditions can be put here
				2. `@return` - result(s)
					1. Post-conditions can be put here
				3. `@throws` - result(s)
		2. Example:

				static int find(int[] arr, int val)
					requires: val occurs exactly once in arr
					effects: returns index i such that arr[i] = val
					
			1. The requirement can be written in Java as:

					/**
					 * Find a value in an array.
					 * @param arr array to search, requires that val occurs exactly once in arr
					 * @param val value to search for
					 * @return index i such that arr[i] = val
					 */
					static int find(int[] arr, int val)
					
				1. [Java API Documentation](http://docs.oracle.com/javase/8/docs/api/) - produced from Javadoc comments in [Java standard library source code](http://hg.openjdk.java.net/jdk8/jdk8/jdk/file/tip/src/share/classes/java)
					1. Eclise can show (and clients of code) useful info
					2. Enables us to produce HTML documentation in the same format as Java API docs
						1. [Javadoc Comments](http://javaworkshop.sourceforge.net/chapter4.html) - Introduction, commenting in Java, Javadoc comments
						2. [How to write Doc Comments](http://www.oracle.com/technetwork/java/javase/documentation/index-137868.html) - refer to this when writing specification
					
#### Null References ####
1. References to objects and arrays can take `null` value in Java
	1. => reference does not point to any object
		1. This is a hole in Java type system
			1. Primitives cannot be null

					int size = null; // illegal
					double depth = null; // illegal
					
				1. Compiler rejects (static errors)
			2. Null can be asigned to non-primitive variables

					String name = null;
					int[] points = null;
					
				1. Compiler doesn't complain but may cause errors at runtime

						name.length() // throws NullPointerException
						points.length() // throws NullPointerException
						
					1. `null` is not the same as `""` or `[]`
						1. methods can be called on `""` or `[]`
						2. length of `""` and `[]` is 0
			3. Non-primitives, arrays, collections (say `List`) might contain `null` as value:

					String[] names = new String[] { null };
					List<Double> sizes = new ArrayList<>();
					sizes.add(null);
					
				1. Likely to cause errors when contents are used
		2. Problem: `null`s are troublesome and unsafe
			1. Solution: Remove `null`s from design vocabulary
				1. `null` values are implicitly disallowed in parameters and return values
					1. Method can have a pre-condition that parameters must not be `null`
					2. Method that returns object or array can implicitly have a postcondition that it's return value is non-null
					3. If method allows `null` values for parameters: (not a good idea)
						1. We must explicitly state that
					4. If method returns `null` value: (not a good idea)
						1. We must explicitly state that
			2. Explicit declarations using extensions:

					static boolean addAll(@NonNull List<T> list1, @NonNull List<T> list2)
					
				1. [checked automatically](http://types.cs.washington.edu/checker-framework/) at compile time/ runtime
				2. Google's [discussion of `null` in Guava (Java libraries)](https://code.google.com/p/guava-libraries/wiki/UsingAndAvoidingNullExplained)
					1. Careless use of `null` can cause variatey of bugs
						1. 95% of collections wern't supposed to have null values in them
							1. Having ones fail fast
						2. `null` is ambiguous
							1. `null` return: What does it mean?
								1. `Map.get(key)` - if returns null can mean that value stored is `null` or no value exists that matches the key
							2. `null` can mean failure, success, anything
							3. Using any other value than `null` makes it clear

#### What a Specification May Talk About ####
1. Content:
	1. Parameters
	2. Return value
	3. Must not:
		1. local variables of method
		2. private fields of method's class
2. Keep implementation invisible to reader of the spec
3. Javadoc extracts spec comments and doesn't make source code available to the reader

#### Testing and Specifications ####
1. *black box* tests:
	1. Chosen with only the spec in mind
2. **glass box** tests:
	1. chosen with knowledge of implementation in mind
	2. Must also follow the spec
	3. Advantage:
		1. Implementation may provide stronger guarantees than spec
		2. Implementation may have specific behavior where spec is undefined
			1. test cases should not count on that behavior
3. Test cases must obey the contract always
	1. Example: `find`

			static int find(int[] arr, int val)
				requires: val occurs in arr
				effects: returns index i such that arr[i] = val
				
		1. Stronger precondition: `val` must occur
		2. Weak post-condition: `val` appears more than once in array
			1. Doesn't say which index to return
				1. Test case should not assume that we always have to return the lowest index (not in specification) (even if implementation returns lowest index)

						int[] array = new int[] { 7, 7, 7 };
						assertEquals(0, find(array, 7)); // bad test case: violates the spec
						assertEquals(7, array[find(array, 7)]); // correct
						
		3. Even if `find` implementation throws an exception if `val` is not found, test case cannot assume that behavior (violates precondition)
		4. Glass box testing: New test cases that must exercise different parts of implementation in an implementation independent way (it can't go beyond spec)

##### Testing Units #####
1. Example:

		/** @return the contents of the web page downloaded from url */
		public static string getWebPage(URL url) { ... }
		
		/** @return the words in string s, in the order they appear,
		 * 			  where a word is a contiguous sequence of
		 * 			  non-whitespace and non-punctuation characters */
		public static List<String> extractWords(String s) { ... }
		
		/** @return an index mapping a word to the set of URLs
		 *			  containing that word, for all webpages in the input set */
		public static Map<String, Set<URL>> makeIndex(Set<URL> urls) {
			...
			calls getWebPage and extractWords
			...
		}
		
	1. Unit testing: write tests of each module of program in isolation
		1. Good unit test is focused on just single spec
			1. tests will always rely on specs of Java library methods
				1. Unit test for one method (custom) should not fail if different method (custom) fails to satisfy the spec
					1. `extractWords` should not fail if `getWebPage` doesn't satisfy postcondition
	2. Integration testing: Tests use combination of modules - they make sure different methods have compatible specs
		1. Callers and implementors of different methods are passing and returning values as other expects
		2. These cannot replace systematically designed unit tests
			1. If we test `extractWords` by calling `makeIndex`: we are testing potentially small part of it's input space (possibly outputs of `getWebPage`)
				1. Bugs may be hiding which may surface if we use `extractWords` independently
				2. Bugs may be hinding which may surface if we change the implementation of `getWebPage`

#### Specifications for Mutating Methods ####
1. Describing side effects. Changes to mutable data (in post-condition)
2. Example: Spec that describes method that mutates an object

		static boolean addAll(List<T> list1, List,T> list2)
			requires: list1 != list2
			effects: modifies list1 by adding the elements of list2 to the end of it, and returns true if list1 changes as a result of call
			
3. Postcondition: Two constraints
	1. First: tells how `list1` is modified
	2. Second: tells how return value is determined
4. Precondition: Attempting to add elements to itself is undefined
	1. If `list1` and `list2` are same, algorithm will not terminate - outcome permitted by specification because of precondition
	2. Implicit: `list1` and `list2` must be valid objects (not `null`)
5. Another example of mutating method:

		static void sort(List<String> lst)
			requires: nothing
			effects: puts lst in sorted order, i.e. lst[i] <= lst[j]
						for all 0 <= i < j < lst.size()
						
6. Example of a method that does not mutate it's argument:

		static List<String> toLowerCase(List<String> lst)
			requires: nothing
			effects: returns a new list t where t[i] = lst[i].toLowerCase()
			
7. Convention: Mutation is disallowed unless stated otherwise
	1. `toLowerCase`: can explicitly state as an effect that "lst is not modified"
		1. But in the absense of postcondition describing mutation, no mutation of inputs can be allowed

### Exceptions ###
1. How to handle exceptional cases in a way that is safe from bugs and easy to understand
2. Signature: name, parameters types, return type (core part of spec)
	1. exceptions: can be included

#### Exceptions for Signaling Bugs ####
1. `ArrayIndexOutOfBoundsException` - thrown when array index is outside valid range
2. `NullPointerException` - Thrown when trying to call method on `null` object reference
3. Info displayed by Java can help us fix the bug
4. The above are most common exceptions
5. `ArithmeticException` - thrown for arithmetic errors like integer division by zero
6. `NumberFormatException` - thrown by methods like `Integer.parseInt` - if string cannot be parsed to integer

#### Exceptions for Special Results ####
1. Exceptions can be used to improve structure of code that involves procedures with special results
2. 

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