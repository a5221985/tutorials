## Lambda Expressions ##
### Introduction ###
1. If implementation of anonymous classes is simple (an interface that contains only one method) then we may pass functionality as argument to another method
	1. example: action to be taken when a button is clicked
2. Lambda expressions enable to treat functionality as method argument or code as data
3. Lambda expressions lets us express single-method classes compactly

### Ideal Use Case for Lambda Expressions ###
1. Example: Consider a social networking application
	1. Feature: administrator can perform any kind of action (sending message on members satisfying certain criteria)

2. Use case:
	
		Name: Perform action on selected members
		Primary actor: Administrator
		Preconditions: Administrator is logged into the system
		Postconditions: Action is performed only on members that fit the specified criteria
		Main Success Scenario:
			1. Adminstrator specifies criteria of members on which to perform a certain action.
			2. Administrator specifies an action to perform on these selected members
			3. Administrator selects the Submit button.
			4. The system finds all members that match the specified criteria.
			5. The system performs the specified action on all matching members.
		Extensions
			1a. Administrator has an option to preview those members who match the specified criteria before he or she specifies the action to be performed or before selecting the Submit button.
		Frequency of Occurrence: Many times during the day

3. Members are represented by the following class:

		public class Person {
			public enum Sex {
				MALE, FEMALE
			}

			String name;
			LocalDate birthday;
			Sex gender;
			String emailAddress;

			public int getAge() {
				// ...
			}
			
			public void printPerson() {
				// ...
			}
		}
4. Let the members of social networking app are stored in a list `List<Person>`
5. We begin with a naive approach and then and then finish with efficient and concise approach using Lambda expressions


#### Approach 1: Create Methods That Search for Members That Match One Characteristic ####
1. Add several methods with each method searching for members that match one characteristic (gender, age)
2. To retrieve members older than a specific age:

		public static void printPersonsOlderThan(List<Person> roster, int age) {
			for (Person p: roster) {
				if (p.getAge() >= age) {
					p.printPerson();
				}
			}
		}
3. This application is brittle (?) if newer data types are introduced
	1. If app is upgraded and we change the structure of Person class to contain different member variables, change in data type or change in algorithm - requires rewriting a lot of API
	2. Very restrictive: We cannot use this to print members younger than a certain age


#### Approach 2: Create More Generalized Search Methods ####
1. The following method prints members within a specified range of ages:

		public static void printPersonWithinAgeRange(List<Person> roster, int low, int high) {
			for (Person p: roster) {
				if (low <= p.getAge() && p.getAge() < high) {
					p.printPerson();
				}
			}
		}

2. If members of a specified sex must be printed?
3. If combination of specified gender and age range?
4. If class definition is changed by adding relationship status geographical location?

#### Approach 3: Specify Search Criteria Code in a Local Class ####
1. Following method prints members that match given criterion

		public static void printPersons(List<Person> roster, CheckPerson tester) {
			for (Person p: roster) {
				if (tester.test(p)) {
					p.printPerson();
				}
			}
		}

	1. Method checks each `Person` instance contained in `List` roster whether it satisfies search criteria specified in `CheckPerson` `tester` by invoking `tester.test`. If `tester.test` returns `true`, `printPersons` is invoked on `Person` instance
2. Implement `CheckPerson` interface:

		interface CheckPerson {
			boolean test(Person p);
		}
3. Implementation of `CheckPerson`:

		class CheckPersonEligibleForSelectiveService implements CheckPerson {
			public boolean test(Person p) {
				return p.gender == Person.Sex.MALE && p.getAge() >= 18 && p.getAge() <= 25;
			}
		}
4. Usage:
	`printPersons(roster, new CheckPersonEligibleForSelectiveService());`
5. Advantages:
	1. don't have to change structure of Person
6. Problems:
	1. Need local class for each search

#### Approach 4: Specify Search Criteria Code in an Anonymous Class ####
1. Invocation of method `printPersons`

		printPersons(
			roster,
			new CheckPerson() {
				public boolean test(Person p) {
					return p.getGender() == Person.Sex.MALE && p.getAge() >= 18 && p.getAge() <= 25;
				}
			}
		);

2. Advantages:
	1. New class is not required for each search.
3. Problems:
	1. Syntax of anonymous class is bulky even though `CheckPerson` contains only one method

#### Approach 5: Specify Search Criteria Code with a Lambda Expression ####
1. `CheckPerson` is a functional interface (interface that contains only one abstract method (static or default)).
2. Definition:
	1. Omit name of abstract method when it is implemented

			printPersons(
				roster,
				(Person p) -> p.getGender() == Person.Sex.MALE && p.getAge() >= 18 && p.getAge() <= 25
			);

1. Advantages: Reduces amount of code

#### Approach 6: Use Standard Functional Interfaces with Lambda Expressions ####
1. Interface is too simple to be defined by the programmer so JDK defines standard functional interfaces (defined in `java.util.function`)
2. Use `java.util.function.Predicate<T>` interface

		interface Predicate<T> {
			boolean test(T t);
		}
3. Using `Predicate<T>` in place of `CheckPerson`

		public static void printPersonsWithPredicate(List<Person> roster, Predicate<Person> tester) {
			for (Person p: roster) {
				if (tester.test(p)) {
					p.printPerson();
				}
			}
		}
4. Invocation:
		
		printPersonsWithPredicate(
			roster,
			p -> p.getGender() == Person.Sex.MALE && p.getAge() >= 18 && p.getAge() <= 25
		);

#### Approach 7: Use Lambda Expressions Throughout Your Application ####
1. Instead of calling `printPerson` on `Person`, can specify different action. Specify the action using lambda expression.
2. Use `Consumer<T>` interface that contains `void accept(T t);`

		public static void processPersons(
			List<Person> roster,
			Predicate<Person> tester,
			Consumer<Person> block
		) {
			for (Person p: roster) {
				if (tester.test(p)) {
					block.accept(p);
				}
			}
		}

3. Invoction:

		processPersons(
			roster,
			p -> p.getGender() == Person.Sex.MALE && p.getAge() >= 18 && p.getAge() <= 25,
			p -> p.printPerson()
		);

4. If we want to include member profile validation or retrieve contact information, use `Function<T, R>` that contains `R apply(T t)`

		public static void processPersonsWithFunction(
			List<Person> roster,
			Predicate<Person> tester,
			Function<Person, String> mapper,
			Consumer<String> block) {
			for (Person p: roster) {
				if (tester.test(p)) {
					String data = mapper.apply(p);
					block.accept(data);
				}
			}
		}

5. The following invocation retrieves email address from each member contained in roster and then prints them

		processPersonsWithFunction(
			roster,
			p -> p.getGender() == Person.Sex.MALE && p.getAge() >= 18 && p.getAge() <= 25,
			p -> p.getEmailAddress(),
			email -> System.out.println(email)
		);

#### Approach 8: Use Generics More Extensively ####
1. Generic version of `processPersonsWithFunction` that accepts collection of elements of any data type

		public static <X, Y> void processElements(
			Iterable<X> source,
			Predicate<X> tester,
			Function<X, Y> mapper,
			Consumer<Y> block) {
			for (X p: source) {
				if (tester.test(p)) {
					Y data = mapper.apply(p);
					block.accept(data);
				}
			}
		}

2. Invocation:

		processElements(
			roster,
			p -> p.getGender() == Person.Sex.MALE && p.getAge() >= 18 && p.getAge() <= 25,
			p -> p.getEmailAddress(),
			email -> System.out.println(email)
		)

#### Approach 9: Use Aggregate Operations That Accept Lambda Expressions as Parameters ####
1. Aggregate operations

		roster
			.stream()
			.filter(
				p -> p.getGender() == Person.Sex.MALE && p.getAge() >= 18 && p.getAge() <= 25)
			.map(p -> p.getEmailAddress())
			.forEach(email -> System.out.println(email));

	1. processElements does the following:
		1. obtains source of objects (Stream<E> stream())
		2. Filters objects that match a predicate object (Stream<T> filter(Predicate<? super T> predicate))
		3. Maps objects to another value as specified by a Function object (<R> Stream<R> map(Function<? super T, ? extends R> mapper))
		4. Performs an action as specified by a Consumer object (void forEach(Consumer<? super T> action))

2. `filter`, `map`, `forEach`: aggregate opearations
	1. Aggregate operations: these process elements from a stream
		1. stream: sequence of elements (it is not data structure). It carries elements in collection through pipeline
		2. pipeline: sequence of stream operations (filter-map-forEach)
	2. Aggregate operations usually accept Lambda expressions as parameters
	3. [Aggregate Operations](https://docs.oracle.com/javase/tutorial/collections/streams/index.html)

### Lambda Expressions in GUI Applications ###
1. Purpose: to process events (keyboard actions, mouse actions, scroll actions) in GUI app we need event handlers.
2. Event handlers are implementations of a particular interface which are often functional interfaces which tend to have only one method
3. Example:

		bnt.setOnAction(new EventHandler<ActionEvent>() {
			@Override
			public void handle(ActionEvent event) {
				System.out.println("Hello World!");
			}
	
		});

	1. `EventHandler<ActionEvent>` interface contains only one method `handle(T event)`
	2. Use the following invocation with lambda expression

			btn.setOnAction(
				event -> System.out.println("Hello World!")
			);

### Syntax of Lambda Expressions ###
1. Lambda expressions consist of the following:
	1. comma-separated list of formal parameters enclosed in parantheses.
		1. Example:
			1. `CheckPerson.test` contains one parameter p, which is an instance of `Person` class
		2. Note: we can omit the data type of parameters in lambda expressions. We can omit parantheses for one parameter.
		3. Example:
				
				p -> p.getGender() == Person.Sex.MALE && p.getAge() >= 18 && p.getAge() <= 25
	2. Arrow token, ->
	3. Body which contains single expression or statement block
		1. Single expression is evaluated and value is returned by Java runtime
		2. Example of statement block with return statement:
			
				p -> {
					return p.getGender() == Person.Sex.MALE && p.getAge() >= 18 && p.getAge() <= 25;
				}
		3. void method invocation does not have to be enclosed in braces
			1. Example: `email -> System.out.println(email)`
2. Example: `Calculator`

		public class Calculator {
			interface IntegerMath {
				int operation(int a, int b);
			}

			public int operateBinary(int a, int b, IntegerMath op) {
				return op.operation(a, b);
			}
	
			public static void main(String... args) {
				Calculator myApp = new Calculator();
				IntegerMath addition = (a, b) -> a + b;
				IntegerMath subtraction = (a, b) -> a - b;
				System.out.println("40 + 2 = " + myApp.operateBinary(40, 2, addition));
				System.out.println("20 - 10 = " + myApp.operateBinary(20, 10, subtraction));
			}
		}

	1. Operations `addition` and `subtraction` is specified by instances of `IntegerMath`

### Accessing Local Variables of the Enclosing Scope ###
1. Lambda expressions can capture variables
2. Lambda expreesions do no have shadowing issues (?)
3. Lambda expressions are lexically scoped (they do not inherit any names from supertype or introduce new level of scoping)
4. Lambda expression does not introduce a new level of scoping which enables us to access fields, methods, local variables or enclosed scope.
	1. To access variables in enclosing class use `this`
4. Example:

		import java.util.function.Consumer;
		
		public class LambdaScopeTest {

			public int x = 0;
	
			class FirstLevel {

				public int x = 1;

				void methodInFirstLevel(int x) {
					
					// The following statement causes the compiler to generate
					// the error "local variables referenced from a lambda expression
					// must be final or effectively final" in statement A:
					//
					// x = 99;

					Consumer<Integer> myConsumer = (y) -> 
					{
						System.out.println("x = " + x); // Statement A
						System.out.println("y = " + y);
						System.out.println("this.x = " + this.x);
						System.out.println("LambdaScopeTest.this.x = " + LambdaScopeTest.this.x);
					};

					myConsumer.accept(x);
				}
			}

			public static void main(String... args) {
				LambdaScopeTest st = new LambdaScopeTest();
				LambdaScopeTest.FirstLevel fl = st.new FirstLevel();
				fl.methodInFirstLevel(23);
			}
		}
	1. If x is substituted in place of y, compiler generates the error "variable x is already defined in method methodInFirstLevel(int)" because lambda expression does not introduce new level of scoping. Lambda expression can directly access `x` of method `methodInFirstLevel`
	2. lambda expression can access local variables and parameters of enclosing block that are final or effectively final
		1. Example:

				void methodInFirstLevel(int x) {
					x = 99;
					// ...
				}
			1. `FirstLevel.x` is not effectively final anymore

### Target Typing ###
1. How to determine the type of a lambda expression?
	1. Example:

			p -> p.getGender() == Person.Sex.MALE && p.getAge() >= 18 && p.getAge() <= 25

		1. If `public static void printPersons(List<Person> roster, CheckPerson tester)` is invoked, the type of `p` is `CheckPerson` so the lambda expression is of the type `CheckPerson`
		2. If `public void printPersonsWithPredicate(List<Person> roster, Predicate<Person> tester)` is invoked, the type of `p` is `Predicate<Person>` so the lambda expression is of the type `Predicate<Person>`
2. Target type: the data type expected by the methods
3. Determining type of lambda expression:
	1. Type of lambda expression can be found if java compiler can determine the target type
		1. Variable declarations
		2. Assignments
		3. Return statements
		4. Array initializers
		5. Method or constructor arguments
		6. Lambda expression bodies
		7. Conditional expressions, ?:
		8. Cast expressions

#### Target Types and Method Arguments ####
1. For method arguments, compiler uses
	1. overload resolution
	2. type argument inference
2. Example:
	1. Consider the following two functional interfaces
	
			public interface Runnable {
				void run();
			}

			public interface Callable<V> {
				V call();
			}

		1. `Runnable.run` does not return a value
		2. `Callable<V>.call` returns a value
		3. If the method `invoke` is overloaded as follows, which method will be invoked?:

				void invoke(Runnable r) {
					r.run();
				}

				<T> T invoke(Callable<T> c) {
					return c.call();
				}
			
				String s = invoke(() -> "done");
			1. `invoke(Callable<T>)` will be invoked because it returns a value so the type of lambda expression `() -> "done"` is `Callable<T>`

### Serialization ###
1. Lambda expression can be [serialize](https://docs.oracle.com/javase/tutorial/jndi/objects/serial.html)d if
	1. target type is serializable
	2. captured argument is serializable
2. It is discouraged (see [inner classes](https://docs.oracle.com/javase/tutorial/java/javaOO/nested.html#serialization))


## Method References ##
### Kinds of Method References ###
1. Lambda expression sometimes calls a method. Method references lets us reference existing methods by name
2. Example:

		public class Person {
			public enum Sex {
				MALE, FEMALE
			}
		
			String name;
			LocalDate birthday;
			Sex gender;
			String emailAddress;

			public int getAge() {
				// ...
			}

			public Calendar getBirthday() {
				return birthday;
			}

			public static int compareByAge(Person a, Person b) {
				return a.birthday.compareTo(b.birthday);
			}
		}

	1. If members are contained in an array and you want to sort the members by age

			Person[] rosterAsArray = roster.toArray(new Person[roster.size[]]);

			class PersonAgeComparator implements Comparator<Person> {
				public int compare(Person a, Person b) {
					return a.getBirthday().compareTo(b.getBrithday());
				}
			}

			Arrays.sort(rosterAsArray, new PersonAgeComparator());

		1. Method signature of `sort` is the following:

				static <T> void sort(T[] a, Comparator<? super T> c)

		2. Since `Comparator<? super T>` is a functional interface, we can use lambda expressions instead of first defining a class and then initating an new instance of the class that implements `Comparator`

				Arrays.sort(rosterAsArray, 
					(Person a, Person b) -> {
						return a.getBirthday().compareTo(b.getBirthday());
					}
				);

		3. We can replace the method definition by existing method `compareByAge` in the `Person` class

				Arrays.sort(rosterAsArray, 
					(a, b) -> Person.compareByAge(a, b)
				);

		4. We can use a method reference instead of explicit method invocation

				Arrays.sort(rosterAsArray, Person::compareByAge);

			1. `Person::compareByAge` is semantically similar to `(a, b) -> Person.compareByAge(a, b)`
				1. formal parameter list is copied from `Comparator<Person>.compare` which is `(Person, Person)`
				2. its body calls the method `Person.compareByAge`

### What are the Kinds of Method Refernences? ###

|Kind|Example|
|-|-|
|Reference to a static method|ContainingClass::staticMethodName
|Reference to an instance method of a particular object|containingObject::instanceMethodName
|Reference to an instance method of an arbitrary object of a particular type|ContainingType::methodName
|Reference to a constructor|ClassName::new

#### Reference to a Static Method ####
1. Example: `Person::compareByAge`

#### Reference to an Instance Method of Particular Object ####
1. Example:

		class ComparisonProvider {
			public int compareByName(Person a, Person b) {
				return a.getName().compareTo(b.getName());
			}

			public int compareByAge(Person a, Person b) {
				return a.getBirthday().compareTo(b.getBirthday());
			}
		}

		ComparisonProvider myComparisonProvider = new ComparisonProvider();
		Arrays.sort(rosterAsArray, myComparisonProvider::comparByName);

	1. JRE infers the arguments type as (Person, Person)

#### Reference to an Instance Method of an Arbitrary Object of a Particular Type ####
1. Example:

		String[] stringArray = {"Barbara", "James", "Mary", "John", "Patricia", "Robert", "Michael", "Linda"};
		Arrays.sort(stringArray, String::compareToIgnoreCase);
		
	1. formal parameter list would be (String a, String b) where a and b are arbitrary names
	2. Method reference would invoke the method: `a.compareToIgnoreCase(b)`

#### Reference to a Constructor ####
1. Example:
	
		public static <T, SOURCE extends Collection<T>, DEST extends Collection<T>> DEST transferElements(SOURCE sourceCollection, Supplier<DEST> collectionFactory) {
			DEST result = collectionFactory.get();
			for (T t: sourceCollection) {
				result.add(t);
			}
			return result;
		}

2. Functional interface `Supplier` contains one method `get` that takes no arguments but returns an object
3. Invoke lambda expression
		
		Set<Person> rosterSetLambda = transferElements(roster, () -> { return new HashSet<>(); });
4. Using constructor reference instead of lambda expression

		Set<Person> rosterSet = transferElements(roster, HashSet::new);

	1. Type is infered by compiler
	2. Alternative definition

			Set<Person> rosterSet = transferElements(roster, HashSet<Person>::new);
