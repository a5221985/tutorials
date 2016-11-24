## Collections ##

### Introduction ###
#### Overview ####
1. What are collections?
2. How to make programs better?
3. Core elements of Collections framework: interfaces, implementations, algorithms

#### What is Collections Framework? ####
1. Unified architecture for representing and manipulating collections.
2. Contents:
	1. **Interfaces**
		1. Abstract data types that represent collections.
		2. Purpose: to enable manipulation of collections independently of details of representations.
		3. There is a hierarchy of interfaces
	2. **Implementations**
		1. Concrete implementation of collections interfaces.
		2. Re-usable data structures
	3. **Algorithms**
		1. Methods for performing useful computations on objects that implement collection interfaces
			1. searching 
			2. sorting
		2. Algorithms are polymorphic: same method can be used for different implementations of collection interface
3. C++: Standard Template Library (STL)

#### Benfits of the Java Collections Framework ####
1. **Reduces programming effort:** 
	1. The framework has useful data structures and algorithms: programmer can concentrate on important parts than low-level plumbing.
	2. Programmer does not have to write adapter objects to connect unrelated APIs because framework provides interoperability among unrelated APIs (How?).
2. **Increases program speed and quality:**
	1. Framework provides high performance and high quality implementations of data structures and algorithms.
	2. Different implementations of each interface are interchangeable.
	3. Programs can be easily tuned by switching implementations (for improving program's quality and performance)
3. **Allows interoperability among unrelated APIs:**
	1. If network administration API furnishes collection of node names and if GUI toolkit expects collection of column headings, APIs will interoperate seamlessly
4. **Reduces effort to learn and to use new APIs:**
	1. Standard collection interfaces eliminate the need to learn sub-APIs because the APIs take collection(s) as input and furnish collection(s) as output.
5. **Reduces effort to design new APIs:**
	1. Designers can use standard collection interfaces for creation of new APIs that rely on collections
6. **Fosters software reuse:**
	1. New data structures that confirm to standard collection interfaces are reusable.
	2. New algorithms that operate on objects that implement the interfaces are reusable.

#### Interfaces ####
1. Core collection interfaces:
	1. Interfaces that allow collections to be manipulated independently of details of representation.
	2. Foundation of Java Collections Framework
	3. Core collection interfaces form a hierarchy as in the picture

	![colls-coreInterfaces](colls-coreInterfaces.gif)
2. `Set`: Kind of `Collection`
3. `SortedSet`: Special kind of `Set`
4. Distinct trees: `Map` is not a `Collection`
5. All core collection interfaces are generic
		
		public interface Collection<E>...
6. When implementing a collection, specify type of object contained in the collection (For compile time checks)
7. Topics:
	1. General guidelines for effective use of interfaces
	2. Programming idioms for each interface
	3. Java does not separate interfaces for each variant of each collection type (immutable, fixed-size, append-only). Modification operations in each interface are optional (an implementation may not support all operations and may throw `UnsupportedOperationException`, they must document what operations it may suppport).
	4. All general-purpose implementations support all optional operations.
8. Core collection interfaces:
	1. `Collection`
		1. root of collection hierarchy.
		2. represents group of objects (elements)
		3. It is least common denominator and is used to pass collections around when most generality is desired.
		4. Some collections support duplicates but some do not, some are ordered but some are not.
		5. Java provides specific subinterfaces which implement this interface
	2. `Set`
		1. a collection that has no duplicate elements
		2. models mathematical set absraction.
			1. Examples:
				1. Cards comprising poker hand
				2. Courses making up student's schedule
				3. Processes running on  a machine
	3. `List`
		1. ordered collection
		2. Can contain duplicates
		3. Elements can be inserted at specific position in the list and elements at specific indices can be accessed
		4. Example: Vector
	4. `Queue`
		1. Collection to hold multiple elements prior to processing
		2. Special operations provided:
			1. insertion
			2. extraction
			3. inspection
		3. Elements are usually ordered in FIFO (Exceptions: priority queue - orders elements according to supplied comparator or using natural ordering)
		4. `remove` or `poll` removes head element of the queue.
		5. New elements are inserted at the tail of the queue in FIFO queue.
	5. `Deque`
		1. Collection that holds elements prior to processing
		2. Additional operations supported:
			1. insertion
			2. extraction
			3. inspection
		3. They can be used both as FIFO and LIFO.
		4. Elements can be inserted, retrieved and removed at both ends.
	6. `Map`
		1. Object that maps keys to values.
		2. Cannot contain duplicate keys.
		3. Each key can map to atmost one value
	7. `SortedSet`
		1. It is a `Set` that maintains elements in ascending order.
		2. Additional operations: used to take advantage of ordering
		3. Examples:
			1. wordlists
			2. Membership rolls
	8. `SortedMap`
		1. A `Map` that maintains mappings in ascending key order.
		2. Used for naturally ordered collections of key/value pairs
		3. Example: 
			1. Dictionaries
			2. Telephone directories

##### The Collection Interface #####
1. All general purpose collection implementations have constructor that takes `Collection` argument called conversion constructor which initializes new collection to contain all elements in specified collection.
2. Example:
	1. `Collection<String> c`: `c` can be `List`, `Set` ...
	2. `List<String> list = new ArrayList<String>(c); // list will contain all elements of c`
3. Methods:
	1. `int size()`
	2. `boolean isEmpty()`
	3. `boolean contains(Object element)`
	4. `boolean add(E element)`
	5. `boolean remove(Object element)`
	6. `Iterator<E> iterator()`
	7. `boolean containsAll(Collection<?> c)`
	8. `boolean addAll(Collection<? extends E> c)`
	9. `boolean removeAll(Collection<?> c)`
	10. `boolean retainAll(Collection<?> c)`
	11. `void clear()`
	12. Array operations
		1. `Object[] toArray()`
		2. `<T> T[] toArray(T[] a)`
	13. JDK 8 and later
		1. `Stream<E> stream()`: sequential stream
		2. `Stream<T> parallelStream()`: parallel stream
4. Brief overview of methods	
	1. how many elements are in colleciton (size, isEmpty)
	2. Check if a given object is in collection (contains)
	3. Methods to add and remove elements (add, remove)
		1. add: takes care of collections that can contain duplicates as well as those that cannot
		2. returns true if collection changes as a result of the call
	4. Methods providing iterator over collection (iterator)

###### Traversing Collections ######
1. Three methods used to traverse collections
	1. Using aggregate operations
		1. Prefered emthod for JDK8 and later.
		2. Procedure:
			1. Obtain a stream
			2. Perform aggregate operations
				1. We can use lambda expression.
		3. Example:
			
				myShapesCollection.stream().filter(e -> e.getColor() == Color.RED).forEach(e -> System.out.println(e.getName()));
		4. Using parallel stream if collection is large and if computer has enough cores

				myShapesCollection.parallelStream().filter(e -> e.getColor() == Color.RED).forEach(e -> System.out.println(e.getName()));
		5. Example: Convert elements of Collection to String and join them using commas

				String joined = elements.stream().map(Object::toString).collect(Collectors.joining(", "));
		6. Sum salaries of all employees:

				int total = employees.stream().collect(Collectors.summingInt(Employee::getSalary)));
		7. Bulk operations (mutative): `containsAll`, `addAll`, `removeAll`
		8. aggregate operations should not mutate


	2. `for-each` construct
	
			for (Object o: collection) {
				System.out.println(o);
			}

	3. Using `Iterator`s
		1. Object used to traverse through collection and remove elements selectively.
		2. `Iterator` interface

				public interface Iterator<E> {
					boolean hasNext();
					E next();
					void remove(); //optional
				}

			1. `hasNext`: returns `true` if iteration has more elements
			2. `next`: returns next element in iteration
			3. `remove`: removes last element returned by `next`
				1. Called only once per call to `next` or else will throw an exception
				2. The only safe way to modify collection during iteration.
			4. When to use?
				1. Remove current element. (For-each hides iterator)
				2. Iterate over multiple collections in parallel.
			5. Example: Traverse a `Collection` using `Iterator` and remove  specific elements

					static void filter(Collection<?> c) {
						for (Iterator<?> it = c.iterator(); it.hasNext();)
							if (!cond(it.next()))
								it.remove();
						}

					1. Code is polymorphic: works for any Collection regardless of implementation

###### Collection Interface Bulk Operations ######
1. Operation on entire collection.
2. Implementing using basic operations may be inefficient.
3. Bulk operations:
	1. `containsAll` - `true` if target `Collection` (object used to invoke the method) contains all elements in the specified `Collection` (method argument)
	2. `addAll` - adds all elements of the specified `Collection` into target `Collection`
			1. Returns `true` if target `Collection` was modified
	3. `removeAll` - removes from target `Collection` all elements contained in specified `Collection`
		1. Returns `true` if target `Collection` was modified
	4. `retainAll` - removes from target `Collection` all elements not contained in specified `Collection`
		1. Returns `true` if target `Collection` was modified
	5. `clear` - removes all elements from `Collection`
4. Examples:
		
		c.removeAll(Collections.singleton(e)); // remove all instances of element e
		c.removeAll(Collections.singleton(null)); // remove all instances of null

	1. `Collections.singleton`: `{e}` (`Set` containing single element e) **(M)**

###### Collection Interface Array Operations ######
1. `toArray`: bridge method between `Collections` and old APIs that expect arrays as input.
	1. Translates `Collection` into an array
2. Simple form:
	1. `Object[] a = c.toArray();` **(M)**: c is a `Collection` and the code dumps contents of `c` into array of `Object` which has same length as `c` 
3. Complex form:
	1. `String[] a = c.toArray(new String[0]);`: c is a `Collection<String>` and the code dumps contents of `c` into new `String` array whose length is same as that of `c`

##### The Set Interface #####
1. `Set` is a `Collection` which cannot have duplicate elements.
2. Inherits only methods from `Collection` but adds restriction on duplicate elements.
3. `equals` and `hashCode`: comparison is more meaningful
	1. `equals`: true if two `Set`s have same elements
4. Three implementations of `Set`
	1. `HashSet`: stores elements in hash table
		1. Best in performance
		2. Order is not guarenteed
	2. `TreeSet`: stores elements in red-black tree (?)
		1. Substantially slower than `HashSet`
		2. Orders elements based on their values
	3. `LinkedHashSet`: implemented as hash table with linked list running through it.
		1. Orders elements in the order in which they were inserted
		2. Ensures order at slightly higher cost than `HashSet`
5. Example: For creation of `Set` object from another existing `Collection` which eliminates duplicates
		
		Collection<Type> noDups = new HashSet<Type>(c);
	1. Uses standard convertion constructor
6. Using `Stream` in JDK 8

		Collection<Type> set = c.stream().collect(Collectors.toSet());
7. Example: Collect `Collection` of names in `TreeSet`

		Set<String> set = people.stream()
							.map(Person::getName)
							.collect(Collectors.toCollection(TreeSet::new));
8. Example: Remove order of original collection by removed duplicates
	
		Collection<Type> noDups = new LinkedHashSet<Type>(c);
9. Example: Generic method that returns `Set` if a genertic `Collection` is passed

		public static <E> Set<E> removeDups(Collection<E> c) {
			return new LinkedHashSet<E>(c);
		}

###### Set Interface Basic Operations ######
1. `size`: returns number of elements in the `Set` (cardinality)
2. `isEmpty`
3. `add`: adds element to `Set` if it does not exist and returns `true` if operation modified the `Set`
4. `remove`: removes element from `Set` if it exists and returns `true` if operation modified the `Set`
5. `iterator`: returns an iterator over the `Set`
6. Example:

		import java.util.*;
		import java.util.stream.*;

		public class FindDups {
			public static void main(String[] args) {
				Set<String> distinctWords = Arrays.asList(args).stream()
												.collect(Collectors.toSet());
				System.out.println(distinctWords.size() + " distinct words: " + distinctWords);
			}
		}

7. Why is `Set<String>` used?
	1. Iterface is used because implementations can be changed by changing constructor
	2. If program uses nonstandard operations present in original implementation type but not in new type, the program will fail
		1. Using interface prevents usage of nonstandard operations

###### Set Interfce Bulk Operations ######
1. Let `s1` and `s2` are two `Set`s
	1. `s1.containsAll(s2)`: returns true if `s2` is a subset of `s1` (`s1` contains all elements of `s2`)
	2. `s1.addAll(s2)`: performs union of `s1` and `s2`
	3. `s1.retainAll(s2)`: performs intersection of `s1` and `s2`
	4. `s1.removeAll(s2)`: transforms `s1` into difference between `s1` and `s2`
2. To perform bulk operations non-destructively, copy set to new set and perform the operations

		Set<Type> union = new HashSet<Type>(s1);
		union.addAll(s2);

		Set<Type> intersection = new HashSet<Type>(s1);
		intersection.retainAll(s2);

		Set<type> difference = new HashSet<Type>(s1);
		difference.removeAll(s2);

3. Example: Find words which occur only once and which occur more than once

		import java.util.*;

		public class FindDups2 {
			public static void main(String[] args) {
				Set<String> uniques = new HashSet<String>();
				Set<String> dups = new HashSet<String>();

				for (String a: args)
					if (!uniques.add(a))
						dups.add(a);

				// Destructive set-difference
				uniques.removaAll(dups);

				System.out.println("Unque words: " + uniques);
				System.out.pritnln("Duplicate words: " + dups);
			}
		}

4. Symmetric difference

		Set<Type> symmetricDiff = new HashSet<Type>(s1);
		symmetricDiff.addAll(s2);
		Set<Type> tmp = new HashSet<Type>(s1);
		tmp.retainAll(s2);
		smmetricDiff.removeAll(tmp);

###### Set Interface Array Operations ######
1. Refer to `Collection` interface

##### The List Interface #####
1. It is an ordered `Collection`
2. May contain duplicate elements
3. In addition to operations in `Collection`, `List` contains the following:
	1. Positional access: manipulation of elements based on their numerical position in the list
		1. `get`, `set`, `add`, `addAll`, `remove`
	2. Search: searches for specified object in the list
		1. `indexOf`, `lastIndexOf`
	3. Iteration: extends `Iterator` taking sequence into consideration
		1. `listIterator`
	4. Range-view: `sublist`
4. Implementations:
	1. `ArrayList`: better performing
	2. `LinkedList`: better performance in certain cases (?)

###### Collection Operations ######
1. `remove`: removes first occurrence of the element in the list
2. `add`, `addAll`: Appends to the end of the list
	1. `list1.addAll(list2);`: concatenates `list2` to `list1`
		
			List<Type> list3 = new ArrayList<Type>(list1); // conversion constructor
			list3.addAll(list2);
3. Aggregating names to a list

		List<String> list = people.stream()
								.map(Person::getName)
								.collect(Collectors.toList());
4. Two `List`s can be compared for logical equality without regard to their implementation classes
	1. Two `List`s are equal if they contain the same elements in the same order

###### Positional Access and Search Operations ######
1. `get`
2. `set`: returns old value stored at that position
3. `add`
4. `remove`: returns old value stored at that position
5. `indexOf`: returns the index of first occurrence of an element
6. `lastIndexOf`: returns the index of the last occurence of an element
7. `addAll`: inserts all elements of a `Collection` starting at the specified position
	1. Order: inserted in the order in which the specified `Collection`'s iterator returns
8. Example: Swap two indexed values in a list

		public static <E> void swap(List<E> a, int i, int j) {
			E tmp = a.get(i);
			a.set(i, a.get(j));
			a.set(j, tmp);
		}
9. Example: Shuffle: It is there is `Collections` class

		public static void shuffle(List<?> list, Random rand) {
			for(int i = list.size(); i > 1; i--)
				swap(list, i - 1, rnd.nextInt(i));
		}

	1. It is fair since permutations occur with equal likelihood
	2. It is fast requiring exactly `list.size() - 1` swaps
10. Example: Print words from argument list in random order 

		import java.util.*;

		public class Shuffle {
			public static void main(String[] args) {
				List<String> list = new ArrayList<String>();

				for (String a: args)
					list.add(a);

				Collections.shuffle(list, new Random());
				System.out.println(list);
			}
		}
	1. Shorter and faster program

			import java.util.*;

			public class Shuffle {
				public static void main(String[] args) {
					List<String> list = Arrays.asList(args);
					Collections.shuffle(list);
					System.out.println(list);
				}
			}

###### Iterators ######
1. `Iterator` is used to return elements from the `List` in sequence
2. `ListIterator`: used to traverse the list in both directions, modify list during iterations, obtain current position of the iterator
	1. `hasNext`
	2. `next`: moves cursor forward
	3. `remove`:
		1. Returns last element returned by `next()` or `previous()`
	4. `hasPrevious`
	5. `previous`: moves cursor backward
3. Iterating through a list backwards
	
		for (ListIterator<Type> it = list.listIterator(list.size()); it.hasPrevious();) {
			Type t = it.previous();
			...
		}

	1. `list.listIterator()`: returns `ListIterator` positioned at the beginning of the list
	2. `list.listIterator(list.size())`: returns `ListIterator` positioned at the end of the list
		1. `list.listIterator(<index>)`: `<index>` element returned by initial call of `next`.
			1. `<index> - 1`: element returned by initial call to `previous`
	3. [0,n]: valid values of <index> (n + 1 values)
	4. Cursor position: in between two elements usually

	![colls-fivePossibleCursor](colls-fivePossibleCursor.gif)

4. `nextIndex` **(M)**: index of the element that would be returned when `next` is called
	1. If cursor is after the last element, returns -1
5. `previousIndex` **(M)**: index of the element that would be returned when `previous` is called
	1. If cursor is before initial element, returns -1
6. Possible implementation of `List.indexOf`

		public int indexOf(E e) {
			for (ListIterator<E> it = listIterator(); it.hasNext;)
				if (e == null ? it.next() == null: e.equals(it.next()))
					return it.previousIndex(); // returns index of element just examined using it.next()
			// Element not found
			return -1;
		}

7. Example: Replace a specified value with another

		public static <E> void replace(List<E> list, E val, E newVal) {
			for (ListIterator<E> it = list.listIterator(); it.hasNext();)
				if (val == null? it.next() == null: val.equals(it.next()))
					it.set(newVal);
		}

8. `add`: inserts elements into a list immediately before the current cursor position

		public static<E> void replace(List<E> list, E val, List<? extends E> newVals) {
			for (ListIterator<E> it = list.listIterator(); it.hasNext();) {
				if (val == null? it.next() == null: val.equals(it.next()))
					it.remove();
					for (E e: newVals)
						it.add(e);
			}
		}

###### Range-View Operation ######
1. `subList(int fromIndex, int toIndex)` **(M)**: returns `List` view from `fromIndex` inclusive to `toIndex` exclusive
	1. Changes in `List` is reflected in subList
			
			for (int i = fromIndex; i < toIndex; i++) {
				...
			}

2. Pass a range of elements instead of the whole list for operations on a range
	1. `list.subList(fromIndex, toIndex).clear();`
	2. Find index of an object in a given range:
		1. `int i = list.subList(fromIndex, toIndex).indexOf(o);`
		2. `int j = list.subList(fromIndex, toIndex).lastIndexOf(o);` - index is in the sub list
	3. `replace`, `shuffle`: work on sublist
3. Example: Use sublist to deal a hand from a deck (`List` that contains number of elements taken from end of specified `List`)

		public static <E> List<E> dealHand(List<E> deck, int n) {
			int deckSize = deck.size();
			List<E> handView = deck.subList(deckSize - n, deckSize);
			List<E> hand = new ArrayList<E>(handView);
			handView.clear();
			return hand;
		}

4. Example: Write a program to deal hands from a 52 card deck
	1. Program takes two command-line arguments (1) number of hands to deal (2) number of cards in each hand

			import java.util.*;

			public class Deal {
				public static void main(String[] args) {
					if (args.length < 2) {
						System.out.println("Usage: Deal hands cards");
						return;
					}
					int numHands = Integer.parseInt(args[0]);
					int cardsPerHand = Integer.parseInt(args[1]);

					// Make a normal 52-card deck.
					String[] suit = new String[] {
						"spades", "hearts",
						"diamonds", "clubs"
					};
					String[] rank = new String[] {
						"ace", "2", "3", "4",
						"5", "6", "7", "8", "9", "10",
						"jack", "queen", "king"
					};
					
					List<String> deck = new ArrayList<String>();
					for (int i = 0; i < suit.length; i++)
						for (int j = 0; j < rank.length; j++)
							deck.add(rank[j] + " of " + suit[i]);

					// Shuffle the deck.
					Collections.shuffle(deck);

					if (numHands * cardsPerHand > deck.size()) {
						System.out.println("Not enough cards.");
						return;
					}

					for (int i = 0; i < numHands; i++)
						System.out.println(dealHand(deck, cardsPerHand));
				}

				public static <E> List<E> dealHand(List<E> deck, int n) {
					int deckSize = deck.size();
					List<E> handView = deck.subList(deckSize - n, deckSize);
					List<E> hand = new ArrayList<E>(handView);
					handView.clear();
					return hand;
				}
			}

5. If elements are added to or removed from backing `List`, then semantics of `List` returned by `subList` becomes undefined
	1. Solution
		1. Use `subList` as transient object to perform range operations on backing `List`
		2. Use `subList` for shorter duration (since backing `List` may be modified or using another `subList`)

###### List Algorithms **(M)** ######
1. `sort`: Uses merge sort algorithm (fast stable sort (does not reorder equal elements))
2. `shuffle`: randomly permutes elements in a `List`
3. `reverse`: reverses order of elements in a `List`
4. `rotate`: rotates all elements in `List` by specified distance
5. `swap`: swaps elements 
6. `replaceAll`: replaces all occurrences of one specified value with another
7. `fill`: overwrites every element in a `List` with specified value
8. `copy`: copies source `List` into destination `List`
9. `binarySearch`: searches an element in ordered `List` using binary search algorithm
10. `indexOfSubList`: returns index of first sublist of one `List` that is equal to another sublist
11. `lastIndexOfSubList`: returns index of the last sublist of one `List` that is equal to another sublist

##### The Queue Interface #####
##### The Deque Interface #####
##### The Map Interface #####
##### Object Ordering #####
##### The SortedSet Interface #####
##### The SortedMap Interface #####
##### Summary of Interfaces #####

### Interfaces ###
#### Overview ####
1. Core collection interfaces (heart and soul of Java collections framework)
2. General guidelines for effective use of the interfaces and when to use them
3. Idioms for each interface

### Aggregate Operations ###
#### Overview ####
1. Iteration over collections on programmers behalf
2. Enables to write efficient and concise code
#### Aggreget Operations ####
##### Reduction #####
##### Parallelism #####
##### Q & A #####

### Implementations ###
#### Overview ####
1. JDK's general-purpose collection implementations and teaches when to use which collection
2. Wrapper implementations: add functionality to general purpose implementations
#### Implementations ####
##### Set Implementations #####
##### List Implementations #####
##### Map Implementations #####
##### Queue Implementations #####
##### Deque Implementations #####
##### Wrapper Implementations #####
##### Convenience #####
###### Implementations ######
##### Summary of #####
###### Implementations ######
##### Questions and Exercises #####

### Algorithms ###
#### Overview ####
1. Polymorphic algorithms provided by JDK to operate on collections
#### Algorithms ####
##### Sorting #####
##### Shuffling #####
##### Routine Data Manipulation #####
##### Composition #####
##### Finding Extreme Values #####

### Custom Implementations ###
1. Why do we need to write our own collection implementation?
2. How to write our own collection implementations (usage of abstract collection implementations)?
#### Reasons to Write an Implementation ####
#### How to Write a Custom Implementation ####

### Interoperability ###
1. How Collections framework interoperates with older APIs?
2. How to design new APIs that will interoperate seamlessly with other new APIs
#### Interoperability ####
##### Compatability #####
##### API Design #####
