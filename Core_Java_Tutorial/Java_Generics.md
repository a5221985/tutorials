## Java Generics ##

### Introduction ###
1. Runtime bugs are difficult to trace back to their roots because they may surface at a point in a program far removed from their origin.

### Why Use Generics? ###
1. Types (classes and interfaces) are parameterized during class definition, interface definition or method definition.
2. Inputs to type parameters are types
3. Advantages of generic code:
	1. Stronger type checking at compile time
		1. Fixing compile time errors is easier than fixing run-time errors
	2. Cast elimination
		1. Code without generics requires casting:
		
				List list = new ArrayList();
				list.add("hello");
				String s = (String) list.get(0);
		2. Generic code does not require casting:

				List<String> list = new ArrayList<String>();
				list.add("hello");
				String s = list.get(0);	// no cast
		3. Enables a programmer to implement generic algorithms
			1. generic algorithms work on different collections of different types

### Generic Types ###
1. Simple Box class
	1. Non generic box class

			public class Box {
				private Object object;
				
				public void set(Object object) { this.object = object; }
				public Object get() { return object; }
			}

	2. We can pass in any object/ array
	3. Problem:
		1. One part of code may place Integer in box and expects to get Integers
		2. Another part of code may pass String
2. A generic Version of the Box Class
	1. Syntax: `class name<T1, T2, ...,  Tn> { /* ... */ }`
		1. T1, T2, ..., Tn are type parameters
	2. Generic Box class

			/**
			 * Generic version of the Box class.
			 * @param <T> the type of the value being boxed
			 * /
			 public class Box<T> {
				// T stands for "Type"
				private T t;
				
				public void set(T t) { this.t = t; }
				public T get() { return t; }
			}
		
		1. Type variable can be:
			1. class type
			2. interface type
			3. array type
			4. another type variable (?)

3. Type Parameter Naming Conventions
	1. Single uppercase letters
	2. Common type parameters
		* E - Element (Java Collection framework)
		* K - key
		* N - Number
		* T - Type
		* V - Value
		* S, U, V ... - 2nd, 3rd, 4th types

4. Invoking and Instantiating a Generic Type
	1. Replace generic type with concrete type during invocation
		1. `Box<Integer> integerBox; // integerBox will hold a reference to a Box of Integer`
	2. Instantiation 
		1. `Box<Integer> integerBox = new Box<Integer>();`
5. The Diamond
	1. In Java SE 7 and later, can use <> during constructor invocation of a generic type if compiler can determine the type argument(s) without ambiguity from its context.
		1. `Box<Integer> integerBox = new Box<>();`

6. Multiple Type Parameters
	1. Example:

			public interface Pair<K, V> {
				public K getKey();
				public V getValue();
			}

			public class OrderedPair<K, V> implements Pair<K, V> {
				private K key;
				private V value;

				public OrderedPair(K key, V value) {
					this.key = key;
					this.value = value;
				}

				public K getKey() { return key; }
				public V getValue() { return value; }
			}

		1. Instantiation

				Pair<String, Integer> p1 = new OrderedPair<String, Integer>("Even", 8);
				Pair<String, String> p2 = new OrderedPair<String, String>("hello", "world");

		2. Instantiation using diamond notation:
				
				OrderedPair<String, Integer> p1 = new OrderedPair<>("Even", 8);
				OrderedPair<String, String> p2 = new OrderedPair<>("hello", "world");

7. Parameterized Types
	1. Example:

			OrderedPair<String, Box<Integer>> p = new OrderedPair<>("primes", new Box<Integer>(...));

#### Raw Types ####
1. Raw type: name of generic class without arguments:
	1. `Box rawBox = new Box(); // Box is the raw type of generic type Box<T>`
2. Gives rise to pre-generics behavior.
3. Assignment of parametereized type object to it's raw type reference is allowed for backwards compatibility.

		Box<String> stringBox = new Box<>();
		Box rawBox = stringBox;
4. If a raw type object is assigned to parameterized type reference, a warning is shown

		Box rawBox = new Box();	// rawBox is a raw type of Box<T>
		Box<Integer> intBox = rawBox;	// warning: unchecked conversion
5. If a rawType object is used to invoke a generic method defined in corresponding generic type, a warning will be shown

		Box<String> stringBox = new Box<>();
		Box rawBox = stringBox;
		rawBox.set(8);	// warning: unchecked invocation to set<T>
6. raw types defer catching unsafe code to runtime.
7. unchecked: compiler does not have enough information to perform all type checks to ensure safety.
8. Recompile with `-xlint:unchecked` will give additional information about the warning
9. How to suppress unchecked warnings:
	1. compile with: `-Xlint:-unchecked`
	2. Use `@SuppressWarnings("unchecked")`

### Generic Methods ###
1. Methods with type parameters.
2. Type parameters scope is limited to the method of declaration.
3. Methods supported:
	1. Static methods.
	2. non-static methods
	3. generic class constructors
4. Syntax: declaration appears before method's return type (for static methods it is a must)

		public class Util {
			public static <K, V> boolean compare(Pair<K, V> p1, Pair<K, V> p2) {
				return p1.getKey().equals(p2.getKey()) && p1.getValue().equals(p2.getValue());
			}
		}

		public class Pair<K, V> {
			private K key;
			private V value;

			public Pair(K key, V value) {
				this.key = key;
				this.value = value;
			}

			public void setKey(K key) { this.key = key; }
			public void setValue(V value) { this.value = value; }
			public K getKey() { return key; }
			public V getValue() { return value; }
		}

	1. Invocation

			Pair<Integer, String> p1 = new Pair<>(1, "apple");
			Pair<Integer, String> p2 = new Pair<>(2, "pear");
			boolean same = Util.<Integer, String>compare(p1, p2); **(M)**

	2. Invocation with type inference (invocation without explicitly specifying type between angle brackets)

			Pair<Integer, String> p1 = new Pair<>(1, "apple");
			Pair<Integer, String> p2 = new Pair<>(2, "pear");
			boolean same = Util.compare(p1, p2);


### Bounded Type Parameters ###
1. To restrict type arguments to fewer types.
	1. Example: To pass only types which are subclasses of `Number`
2. Syntax: `<U extends Number>` (both for Class and Interface types)
	1. `Number` is upper-bound
	2. Example:

			public class Box<T> {
				private T t;

				public void set(T t) {
					this.t = t;
				}

				public T get() {
					return t;
				}

				public <U extends Number> void inspect(U u) {
					System.out.println("T: " + t.getClass().getName());
					System.out.println("U: " + u.getClass().getName());
				}

				public static void main(String[] args) {
					Box<Integer> integerBox = new Box<Integer>();
					integerBox.set(new Integer(10));
					integerBox.inspect("some text"); // error: this is still String!
				}
			}

	3. One can invoke methods defined in the bounded types

			public class NaturalNumber<T extends Integer> {
				private T n;

				public NaturalNumber(T n) { this.n = n; }
	
				public boolean isEven() {
					return n.intValue() % 2 == 0;
				}
				
				// ...
			}
	
	4. Multiple Bounds
		1. Syntax: `<T extends B1 & B2 & B3>` **(M)**
			1. If a bound is a class then it must be specified first
		2. Example:
			
				class A { /* ... */ }
				interface B { /* ... */ }
				interface C { /* ... */ }

				class D <T extends A & B & C> { /* ... */ }

#### Generic Methods and Bounded Type Parameters ####
1. Example:

		public interface Comparable<T> {
			public int compareTo(T o);
		}

		public static <T extends Comparable<T>> int countGreaterThan(T[] anArray, T elem) {
			int count = 0;
			for (T e: anArray) {
				if (e.compaterTo(elem) > 0)
					++count;
				}
			}
		}

### Generics, Inheritance, and Subtypes ###
1. We can invoke generic type by passing a supertype as its type argument and subsequent method calls can accept subtype type objects.
2. Example:

		Box<Number> box = new Box<Number>();
		box.add(new Integer(10)); // ok
		box.add(new Double(10.1));

3. `Box<Integer>` and `Box<Double>` are not subtypes of `Box<Number>` and hence the following code will not accept `Box<Number>` or `Box<Double>` type objects
	1. `public void boxText(Box<Number> n) { /* ... */ }`

	![generics-subtypeRelationship.gif](generics-subtypeRelationship.gif)
4. Generic Classes and Subtyping
	1. Generic class can be subtyped by extending or implementing it.
	2. Example:
		
		![generics-sampleHierarchy.gif](generics-sampleHierarchy.gif)

		1. `ArrayList<E>` implements `List<E>` and `List<E>` extends `Collection<E>`
	3. Type argument must be the same for subtype relationships
	4. Example:
	
		![generics-payloadListHierarchy.gif](generics-payloadListHierarchy.gif)

		1. `PayloadList<E, P>` extends `List<E>` and associates a value of type `P` with each element of type `E`

				interface PayloadList<E, P> extends List<E> {
					void setPayload(int index, P val);
					...
				}
		2. `PayloadList<String, String>`, `PayloadList<String, Number>` and `PayloadList<String, Exception>` are subtypes of `List<String>`

### Type Inference ###
1. Java compiler looks at method invocation and corresponding method declaration to determine type argument to make the invocation.
2. Inference algorithm determines types of arguments, type of result assigned or returned.
3. Inference algorithm finds most specific type that works with all arguments
	1. Example:

			static <T> T pick(T a1, T a2) { return a2; }
			Serializable s = pick("d", new ArrayList<String>()); // compiler identifies the second argument as Serializable object
	2. Type Inference and Generic Methods
		1. Type arguments need not be passed to generic methods explicitly using angle brackets.
		2. Example:

				public class BoxDemo {
					public static <U> void addBox(U u, java.util.List<Box<U>> boxes) {
						Box<U> box = new Box<>();
						box.set(u);
						boxes.add(box);
					}

					public static <U> void outputBoxes(java.util.List<Box<U>> boxes) {
						int counter = 0;
						for (Box<U> box: boxes) {
							U boxContents = box.get();
							System.out.println("Box #" + counter + " coutains [" + boxContents.toString() + "]");
							counter++;
						}
					}

					public static void main(String[] args) {
						java.util.ArrayList<Box<Integer>> listOfIntegerBoxes = new java.util.ArrayList<>();
						BoxDemo.<Integer>addBox(Integer.valueOf(10), listOfIntegerBoxes);
						BoxDemo.addBox(Integer.valueOf(20), listOfIntegerBoxes);
						BoxDemo.addBox(Integer.valueOf(30), listOfIntegerBoxes);
						BoxDemo.outputBoxes(listOfIntegerBoxes);
					}
				}

			2. To invoke generic method `addBox` we can specify type parameter as follows:
				1. `BoxDemo.<Integer>addBox(Integer.valueOf(10), listOfIntegerBoxes);`
			3. If we ignore the type witness, java will automatically infer the type `Integer`
				1. `BoxDemo.addBox(Integer.valueOf(20), listOfIntegerBoxes);` 

	3. Type Inference and Instantiation of Generic Classes
		1. Type arguments while invoking the constructor can be ignored using `<>` diamond
			1. `Map<String, List<String>> myMap = new HashMap<String, List<String>>();` can be re-written as `Map<String, List<String>> myMap = new HashMap<>();`

	4. Type Inference and Generic Constructors of Generic and Non-Generic Classes
		1. Constructors can be generic declaring their own type parameters in both generic and non-generic classes
		2. Example:
			
				class MyClass<X> {
					<T> MyClass(T t) {
						// ...
					}
				}

				new MyClass<Integer>(""); // compiler infers the type of T as String because String type object is passed as argument

		3. Example 2:

				MyClass<Integer> myObject = new MyClass<>(""); // compiler infers the type Integer for X and the type String for T

		4. Inference algorithm does not use results from later in the program for inference

	5. Target Types
		1. Target type is the datatype of an expression.
		2. Example: `static <T> List<T> emptyList();`
			1. Assignment statement: `List<String> listOne = Collections.emptyList(); // compiler will infer type of T as String`
			2. Alternative assignment statement: `List<String> listOne = Collections.<String>emptyList();`
		3. Example 2: Consider the following method:

				void processStringList(List<String> stringList) {
					// process stringList
				}

			1. Java SE 7 does not support the following: `processStringList(Collections.emptyList()); // List<Object> cannot be converted to List<String> error`
				1. Compiler looks for an object type for T and assigns `Object`
			2. Java SE 8 supports the above invocation (target type is expanded to include method arguments)

### Wildcards ###
1. ?: wildcard - unknown type
2. wildcard can be used as
	1. type of parameter
	2. field
	3. local variable
	4. return type
5. Wildcard is not used as
	1. type argument for generic method invocation, generic class instance creation, supertype

#### Upper Bounded Wildcards ####
1. Used to relax restrictions on a variable
2. Example:
	1. The upper bound for `List<Integer>`, `List<Double>` and `List<Number>` is `Number`
3. Syntax:
	1. `? extends <upper-bound>` (for both classes and interfaces)
	2. Example:
		1. For `List<Integer>`, `List<Double>` and `List<Number>` use `List<? extends Number>` (match  list of any `Number`)
4. Example:
	1. `public static void process(List<? extends Foo> list) { /* ... */ }`
	2. Access list elements as of type `Foo`:
	
			public static void process(List<? extends Foo> list) {
				for (Foo elem: list) {
					// ...
				}
			} 

	3. We can use any method defined in `Foo` class

#### Unbounded Wildcards ####
#### Lower Bounded Wildcards ####
#### Wildcards and Subtyping ####
#### Wildcards Capture and Helper Methods ####
#### Guidelines for Wildcard Use ####
### Type Erasure ###
#### Erasure of Generic Types ####
#### Erasure of Generic Methods ####
#### Effects of Type Erasure and Bridge Methods ####
#### Non-Reifiable Types ####
### Restrictions on Generics ###
### Questions and Exercises ###