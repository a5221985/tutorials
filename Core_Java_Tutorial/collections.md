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
1. `Queue`: Collection to hold elements before processing.
	1. Operations:
		1. Collection operations
		2. insertion, removal and inspection
2. Interface:

		public interface Queue<E> extends Collection<E> {
			E element();
			boolean offer(E e);
			E peek();
			E poll();
			E remove();
		}
		
3. Two types of methods:
	1. Operation that throws an exception when operatoin fails
	2. Operation returns a special value when operation fails (`null` or `false`)
4. Structure:
	1. Throws exceptions:
		1. `add(e)`
		2. `remove()`
		3. `element()`
	2. Returns special value:
		1. `offer(e)
		2. `poll()`
		3. `peek()`
5. Queues usually order elements in FIFO order (expection: priority queues - ordering is occording to their values)
6. To remove elements:
	1. `remove()`, `poll()`: return head of the queue (ordering policy determines the element that is removed)
		1. When queue is empty, `remove` throws `NoSuchElementException` while `poll` returns `null`
7. Every queue must specify its ordering properties
8. bounded queues: restricts the number of elements
	1. `Queue` implementations in `java.util.concurrent`
	2. `Queue` implementations in `java.util` are unbounded
9. Insertion:
	1. `add()`: inserts unless queue capacity is violated (throws `IllegalStateException`)
	2. `offer()`: for bounded queues, which indicates failure by returning `false`
10. `element` and `peek` return head of the queue but do not remove any element.
	1. If queue is empty, `element` throws `NoSuchElementException`
	2. If queue is empty, `peek` returns `null`
11. `Queue` implementations usually do not allow insertion of `null` except `LinkedList`
	1. Don't insert `null` because it is a special value returned by `poll` and `peek`
12. `Queue` implementations usually do not define element-based version of `equals` and `hashCode` but inherit identity based version from `Object`
13. `Queu` does not define blocking queue methods.
	1. Defined by `java.util.concurrent.BlockingQueue`
14. Example:

		import java.util.*;
		
		public class Countdown {
			public static void main(String[] args) throws InterruptedException {
				int time = Integer.parseInt(args[0]);
				Queue<Integer> queue = new LinedList<Integer>();
				
				for (int i = time; i >= 0; i--)
					queue.add(i);
					
				while (!queue.isEmpty()) {
					System.out.println(queue.remove());
					Thread.sleep(1000);
				}
			}
		}
		
15. Using priority queue to sort a collection of elements:

		static <E> List<E> heapSort(Collection<E> c) {
			Queue<E> queue = new PriorityQueue<E>(c);
			List<E> result = new ArrayList<E>();
			
			while(!queue.empty())
				result.add(queue.remove());
				
			return result;
		}

##### The Deque Interface #####
1. Deque: It is a doubly ended queue.
	1. It supports insertion and removal of elements at both end points
	2. It is richer because it implements both stack and queue at the same time.
	3. It implements method to access elements at both the ends.
	4. There are methods to insert, remove and examine elements.
2. Implementations:
	1. `ArrayDeque`
	2. `LinkedList`
3. Three types of methods:
	1. Insert:
		1. `addFirst` **(M)**, `offerFirst` **(M)**: inserts at the beginning of `Deque` instance.
		2. `addLast` **(M)**, `offerLast` **(M)**: insert at the end of `Deque` instance.
		3. Use `offerFirst` and `offerLast` if capacity of `Deque` is restricted.
	2. Remove: 
		1. `removeFirst` **(M)**, `pollFirst` **(M)** remove elements from the beginning of `Deque`.
		2. `removeLast` **(M)**, `pollLast` **(M)** remove elements from the end of `Deque`
		3. `pollFirst` and `pollLast` return null if `Deque` instance is empty.
		4. `removeFirst` and `removeLast` throw exception if `Deque` instance is empty
	3. Retrieve:
		1. `getFirst` **(M)**, `peekFirst` **(M)** retreive first element of `Deque` instance. they don't remove the element.
		2. `getLast` **(M)**, `peekLast` **(M)** retreive last element.
		3. `get*` methods throw exception if `Deque` instance is empty.
		4. `peek*` methods return null if `Deque` instance is empty.
4. Other methods:
	1. `removeFirstOccurence`: removes first occurence of specified element if it exists. If not `Deque` remains unchanged.
		1. Returns `boolean`
	2. `removeLastOccurence`: removes last occurence of specified element if it exists. 
		1. Returns `boolean`

##### The Map Interface #####
##### The Map Interface #####
1. `Map` maps keys to values.
2. It cannot contain duplicate keys
3. Each key can map to atmost one value
4. Model's mathematical *function*
5. Interface methods:
	1. `put`
	2. `get`
	3. `remove`
	4. `containsKey` **(M)**
	5. `containsValue` **(M)**
	6. `size`
	7. `empty`
	8. Bulk operations:
		1. `putAll` **(M)**
		2. `clear` **(M)**
6. Three general purpose map implementations:
	1. `HashMap`
	2. `TreeMap`
	3. `LinkedHashMap`
7. Collections to `Map`s using JDK 8 aggregate operations
	1. Example: Grouping Employees by Department

			// Group employees by department
			Map<Department, List<Employee>> byDept = employees.stream().collect(Collectors.groupingBy(Employee::getDepartment));

	2. Example: Compute sum of all salaries by department:

			// Compute sum of salaries by department
			Map<Department, Integer> totalByDept = employees.stream().collect(Collectors.groupingBy(Employee::getDepartment, Collectors.summingInt(Employee::getSalary)));

	3. Example: Group students by passing or failing grades:

			// Partition students into passing and failing
			Map<Boolean, List<Student>> passingFailing = students.stream().collect(Collectors.partitioningBy(s -> s.getGrade >= PASS_THREASHOLD));

	4. Example: Group people by city

			// Classify Person objects by city
			Map<String, List<Person>> peopleByCity = personStream.collect(Collectors.groupingBy(Person::getCity));

	5. Example: Cascade collectors to group people by state and city

			// Cascade Collectors
			Map<String, Map<String, List<Person>>> peopleByStateAndCity = personStream.collect(Collectors.groupingBy(Person::getState, Collectors.groupingBy(Person::getCity)));

###### Map Interface Basic Operations ######
1. Basic operations behave exactly like their counterparts in `Hashtable`.
2. Example: Generate frequency table of words found in its argument list

		import java.util.*;

		public class Freq {
			public static void main(String[] args) {
				Map<String, Integer> m = new HashMap<String, Integer>();

				for (String a: args) {
					Integer freq = m.get(a);
					m.put(a, (freq == null)? 1: freq + 1);
				}

				System.out.println(m.size() + " distinct words:");
				System.out.println(m);
			}
		}

	1. Run the program with: `java Freq if it is to be it is up to be to delegate`
3. If we want to see the frequency table in alphabetical order, change `HashMap` to `TreeMap`
4. If we want to see the words printed in the order they appear in commandline use `LinkedHashMap`
5. Two `Map` objects regardless of their implementation can be compared for logical equality using `equals` and `hashCode` (they are equal if they represent same key-value pairs)
6. All general-purpose implementations of `Map` provide constructors that take a `Map` object and initialize the new `Map` to contain all `key-value` mappings in the specified `Map`.
	1. Source `Map` can be of different implementation than the destination `Map`
		1. Example:

				Map<K, V> copy = new HashMap<K, V>(m)

###### Map Interface Bulk Operations ######
1. `clear`: removes all mappings from the `Map`
2. `putAll`: Dumps one map into another
	1. Subtle use: Creation of attribute map with default values.

			static <K, V> Map<K, V> newAttributeMap(Map<K, V> defaults, Map<K, V> overrides) {
				Map<K, V> result = new HashMap<K, V>(defaults);
				result.putAll(overrides);
				return result;
			}

###### Collection Views ######
1. Methods that make `Map` be viewed as `Collection`
	1. `keySet`: `Set` of keys in `Map`
	2. `values`: `Collection` of values contained in `Map`
		1. Not a `Set` because multiple keys can map to same value
	3. `entrySet`: `Set` of key-value pairs.
		1. `Map.Entry`: Nested interface
			1. It is the type of elements in this Set
2. `Collection` views are only means of iterating over a `Map`
3. Iterating over keys in a map

		for (KeyType key: m.keySet())
			System.out.println(key);

4. Iterator:

		for (Iterator<Type> it = m.keySet().iterator(); it.hasNext();)
			if (it.next().isBogus())
				it.remove();

5. Iterating over key-value pairs:
	
		for (Map.Entry<KeyType, ValType> e: m.entrySet())
			System.out.println(e.getKey() + ": " + e.getValue());

6. When a `Map` is asked multiple times to return a `Collection` view, it efficiently returns the same view over and over.
7. We can call `Map.Entry`'s `setValue` method to change value associated with a key.
8. The three methods are the only safe way to modify `Map` during iteration
9. Removal of elements:
	1. `remove`
	2. `removeAll`
	3. `retainAll`
	4. `clear`
	5. `Iterator.remove`
10. `Collection` views do not support element addition (because `put` and `putAll` exist)

###### Fancy Uses of Collection Views: Map Algebra ######
1. `containsAll`: used to check if one `Map` contains another `Map`

		if (m1.entrySet().containsAll(m2.entrySet())) {
			...
		}

2. `equals`: checks if two `Map`s have mappings for same keys

		if (m1.keySet().equals(m2.keySet())) {
			...
		}

3. Consider a `Map` with collection of attribute-value pairs. Two `Set`s with one containing required attributes and other containing permissible attributes (contains required attributes as well). The following checks if the constaints meet or print an error message

		static <K, V> boolean validate(Map<K, V> attrMap, Set<K> requiredAttrs, Set<K> permittedAttrs) {
			boolean valid = true;
			Set<K> attrs = attrMap.keySet();

			if (!attr.containsAll(requiredAttrs)) {
				Set<K> missing = new HashSet<K>(requiredAttrs);
				missing.removeAll(attrs);
				System.out.println("Missing attributes: " + missing);
				valid = false;	
			}

			if (!permittedAttrs.containsAll(attrs)) {
				Set<K> illegal = new HashSet<K>(attrs);
				illegal.removeAll(permittedAttrs);
				System.out.println("Illegal attributes: " + illegal);
				valid = false;
			}
			return valid;
		}

4. Example: Knowing all keys common to two `Map` objects

		Set<KeyType> commonKeys = new HashMap<KeyType>(m1.keySet);
		commonKeys.retainAll(m1.keySet());

5. Example: Remove all key-value pairs that one `Map` has in common with another:

		m1.entrySet().removeAll(m2.entrySet());

6. Example: Remove from one `Map` all keys that have values in another `Map`

		m1.keySet().removeAll(m2.keySet());

7. Suppose we have a `Map` that maps each employee to his manager. Suppose we want to know who non managers are:

		Set<Employee> individualContributors = new HashSet<Employee>(managers.keySet());
		individualContributors.removeAll(managers.values());

8. Example: Fire all employees who report to manager Simon

		Employee simon = ...;
		managers.values().removeAll(Collections.singleton(simon));
	1. `Collections.singleton`: factory method that returns immutable `Set` with single, specified element

9. Example: Tell which employees have managers who no longer works for the company
		
		Map<Employee, Employee> m = new HashMap<Employee, Employee>(managers);
		m.values().removeAll(managers.keySet());
		Set<Employee> slackers = m.keySet();

	1. Make a temporary copy of the `Map`
	2. Remove all entries from the temporary copy whose manager value is a key in original `Map` (remaining entries in temporary map contain managers who are no longer employees)
	3. Keys in temporary `Map` are the values we are looking for

###### Multimaps ######
1. It can map each key to multiple values.
2. There is no interface for multimap
	1. Use a `Map` who values are `List` instances
3. Example: Read a word list containing one word per line (all lowercase) and prints out all the anagram groups what meet a size criterion.
	1. anagram group: bunch of words which contain exactly same letters in different order.
	2. Program takes two arguments: name of ditionary file, minimum size of anagram group to print out.
	3. Trick: Alphabetisize each word and use it as key and put an entry in multimap for the original word
	4. Program:

	5. [dictionary file](https://docs.oracle.com/javase/tutorial/collections/interfaces/examples/dictionary.txt)

##### Object Ordering #####
1. Sorting a `List` `l`:

		Collections.sort(l);

	1. If `l` has `String` elements, alphabetical order would be used.
	2. If `l` has `Date` elements, chronological order would be used.
2. How does `Collections.sort` know how to sort data of different data types?
	1. `String` and `Date` implement `Comparable` interface
		1. Provides natural ordering of a class
		2. This implementation automatically sorts the elements
	2. Classes that implement `Comparable` interface
		1. `Byte`
		2. `Character`
		3. `Long`
		4. `Integer`
		5. `Short`
		6. `Double`
		7. `Float`
		8. `BigInteger`
		9. `BigDecimal`
		10. `Boolean`: `Boolean.FALSE` < `Boolean.TRUE`
		11. `File`: System-dependent lexicographic on path name
		12. `String`
		11. `Date`
		12. `CollationKey`: Locale-specific lexicographic
3. If we try to sort a list whose type does not implement `Comparable`, `Collections.sort(list, comparator)` will throw `ClassCastException`
	1. Elements that can be compared to one another are called mutually comparable.
		1. Elements of different types can be mutually comparable (Standard Classes do no usually allow interclass comparison)

###### Writing Your Own Comparable Types ######
1. `Comparable` interface

		public interface Comparable<T> {
			public int compareTo(T o);
		}

	1. `compareTo` compares receiving object (on which it is called) and specified object (`o`) and returns:
		1. `0`: Equal to specified object `o`
		2. +ve integer: greater than to specified object `o`
		3. -ve integer: less than specified object `o`
		4. If objects are not comparable, the method `compareTo` throws `ClassCastException`
2. Example: 

		import java.util.*;

		public class Name implements Comparable<Name> {
			private final String firstName, lastName;

			public Name(String firstName, String lastName) {
				if (firstName == null || lastName == null)
					throw new NullPointerException();
				this.firstName = firstName;
				this.lastName = lastName;
			}

			public String firstName() { return firstName; }
			public String lastName() { return lastName; }

			public boolean equals(Object o) {
				if (!(o instanceof Name))
					return false;
				Name n = (Name) o;
				return n.firstName.equals(firstName) && n.lastName.equals(lastName);
			}

			public int hashCode() {
				return 31*firstName.hashCode() + lastName.hashCode();
			}

			public String toString() {
				return firstName + " " + lastName;
			}

			public int compareTo(Name n) {
				int lastCmp = lastName.compareTo(n.lastName);
				return (lastCmp != 0 ? lastCmp : firstName.compareTo(n.firstName));
			}
		}

3. Important points:
	1. `Name` objects are immutable.
		1. Elements which will be used in `Set`s and `Map`s (if we modify the elements while they are in collection, the collection will break)
	2. Constructor checks its arguments for `null`. Makes sure `Name` object is well formed so that other methods do not throw `NullPointerException`
	3. `hashCode` method is redefined. Essential for a class that redefines `equals` (equal objects must have equal hash codes)
	4. `equals` method returns false if specified object is `null` or inappropriate type. (To avoid `compareTo` from throwing runtime exception)
	5. `toString` is redefined to print `Name` in human readable form (good for objects which are going to be put into collections)
		1. collection type's `toString` depends on `toString` methods of their elemetns, keys and values.
4. `compareTo` implements standard name ordering algorithm (last names take precedence over first names)
5. We can utilize the natural ordering of the individual part's type (`String`)
	1. If most significant parts are equal, we compare the next most significant parts. If they are not equal, return the result
6. Example: Program that builds list of names and sorts them:

		import java.util.*;

		public class NameSort {
			public static void main(String[] args) {
				Name nameArray[] = {
					new Name("John", "Smith"),
					new Name("Karl", "Ng"),
					new Name("Jeff", "Smith"),
					new Name("Tom", "Rich")
				}

				List<Name> names = Arrays.asList(nameArray);
				Collections.sort(names);
				System.out.println(names);
			}
		}

7. There are 4 restrictions for classes that implement `Comparable` interface (Read documentation)
	1. Restrictions ensure that natural ordering is a total order on objects of a class that implements it

###### Comparators ######
1. Used to sort elements in an order other than natural ordering or used to sort elements that do not use natural ordering.
	1. Provide a `Comparator` to the `Collections.sort` method
2. `Comparator` interface:

		public interface Comparator<T> {
			public boolean compare(T o1, T o2);
		}

	1. It compares it's two arguments and returns (usually):
		1. -ve integer: if first argument is less than the second
		2. 0: if first argument is equal to the second
		3. +ve: if first argument is greater than the second
	2. If either of the arguments have inappropriate types, `compare` method throws a `ClassCastException`
	3. `compare` has to obey the same 4 restrictions of `compareTo`
3. Example: Consider an `Employee` class

		public class Employee implements Comparable<Employee> {
			public Name name() { ... }
			public int number() { ... }
			publiv Date hireDate() { ... }
				...
		}

	1. Natural ordering: `Name` ordering
	2. Use case: Return a list of employees in the order of seniority

			import java.util.*;
			
			public class EmpSort {
				static final Comparator<Employee> SENIRITY_ORDER = new Comparator<Employee>() {
					public int compare(Employee e1, Employee e2) {
						return e2.hireDate().compareTo(e1.hireDate());
					}
				};

				// Employee database
				static final Collection<Employee> employees = ...;

				public static void main(String[] args) {
					List<Employee> e = new ArrayList<Employee>(employees);
					Collections.sort(e, SENIORITY_ORDER);
					System.out.println(e);
				}
			}
		
		1. `Comparator` relies on natural ordering of `Date` of `hireDate` accessor method.
		2. `Employee` who hired most recently is the least senior
			1. Another trick: negate the result of comparison while maintaining the argument order:

					// Don't do this!!
					return -r1.hireDate().compareTo(r2.hireDate()); // May not work since -Integer.MIN_VALUE = Integer.MIN_VALUE
4. Restriction: It cannot be used to order a sorted collection (Like `TreeSet`) since it generates an ordering that is not compatible with equals (`Comparator` equates objects that `equals` method does not).
	1. Example: If two employees who were hired on the same date will compare as equal, when using `Comparator` to order a sorted collection, it's not good.
		1. If we use this `Comparator` to insert multiple employees hired on the same date into a `TreeSet`, only first will be added and the rest will be seen as duplicates and ignored.
		2. Fix: Tweek `Comparator` so that it produces an ordering that is compatible with `equals` (so that if elements are equal using `compare`, they must be equal using `equals`). Do a two part comparison

				static final Comparator<Employee> SENIORITY_ORDER = new Comparator<Employee>() {
					public int compare(Employee e1, Employee e2) {
						int dateCmp = e2.hireDate().compareTo(e1.hireDate());
						if (dateCmp != 0)
							return dateCmp;

						return (e1.number() < e2.number()? -1: (e1.number() == e2.number()? 0: 1));
					}
				};

			1. `return e1.number() - e2.number` may not work because, employee number can be -ve.
			2. If i is large positive integer and j is large negative integer, `i - j` will overflow and return a -ve integer. (`Comparator` violates one of the 4 restrictions)

##### The SortedSet Interface #####
1. It is a `Set` that maintains elements in ascending order (sorting is according to natural ordering or according to `Comparator` provided during creation time)
2. Operations in addition to `Set` operations
	1. Range view: allows arbitrary range operations on the sorted set
	2. Endpoints: returns the first or last element in the sorted set
	3. Comparator access: returns `Comparator`, if any, used to sort the set
3. Code:

		public interface SortedSet<E> extends Set<E> {
			// Range-view
			SortedSet<E> subSet(E fromElement, E toElement);
			SortedSet<E> headSet(E toElement);
			SortedSet<E> tailSet(E fromElement);

			// Endpoints
			E first();
			E last();

			// Comparator access
			Comparator<? super E> comparator();
		}

###### Set Operations ######
1. Operations that are inherited from `Set` behave identically with two exceptions:
	1. `Iterator` returned by `iterator()` traverses the sorted set in order
	2. Array returned by `toArray()` contains sorted set's elements in order
2. Implementation of `toString` returns all elements of sorted set in order

###### Standard Constructors ######
1. `SortedSet` has a conversion constructor that accepts any `Collection`
	1. `TreeSet`: The constructor constructs an instance that sorts its elements according to their natural ordering (even if the collection is a `SortedSet`)

###### Range-view Operations ######
1. Range-view operations are valid even if the backing sorted set is modified directly.
	1. range-view of a sorted set is a window onto whatever portion of the set lies in the designated part of the element space.
	2. Changes to range-view write back to backing sorted set and vice versa
2. Range-view operations:
	1. `subSet`: takes two end points (end points are objects and must be comparable to elements in `SortedSet`)
	2. range is half open (including low end point but excluding high end point)
		1. Example:

				int count = dictionary.subSet("doorbell", "pickle").size();

		2. Example: Remove elements beginning with `f`

				dictionary.subSet("f", "g").clear();
		
		3. Example: Tell how many words begin with each letter

				for (char ch = 'a'; ch <= 'z'; ) {
					String from = String.valueOf(ch++);
					String to = String.valueOf(ch);
					System.out.println(from + ": " + dictionary.subSet(from , to).size());
				}

		4. `successor(highEndpoint)`: calculates successor of `highEndpoint`.
			1. successor of string `s` in `String`'s natural ordering is `s + "\0"`
			2. Example: finding how many elements are between `"doorbell"` and `"pickle"` are including `"pickle"`

					count = dictionary.subSet("doorbell", "pickle\0").size();
			
			3. Example: Excluding lower end point

					count = dictionary.subSet("doorbell\0", "pickle").size();

		5. Other range-view operations: `headSet`, `tailSet` - each takes a single `Object`
			1. `headSet`: returns initial portion of backing `SortedSet` excluding the specified `Object`
			2. `tailSet`: returns final portion of backing `SortedSet` beginning with the specified `Object` upto the end of the `SortedSet`
		6. Examples:

				SortedSet<String> volume1 = dictionary.headSet("n");
				SortedSet<String> volume2 = dictionary.tailSet("n");

###### Endpoint Operations ######
1. `first`, `last`: These operations are used to return the first and last elements in a sorted set.
	1. Iterating over a `SortedSet`: Go into interior of a `Set` and iterate forward or backward.
		1. Example: Get the first element that is less than a specified object `o` in element space

				Object predecessor = ss.headSet(o).last();

###### Comparator Accessor ######
1. `comparator`: An accessor method which returns `Comparator` used to sort the set or `null` of sorted according to natural ordering of the elements.
	1. Purpose: So that sorted sets can be copied to another new sorted sets with the same ordering (used by `SortedSet` constructor)

##### The SortedMap Interface #####
1. `SortedMap` is a `Map` that maintains its elements in ascending order (sorted according to keys' natural ordering, or according to a `Comparator` provided at the time of creation of the `SortedMap`)
2. Additional operations (other than `Set` operations)
	1. Range view - performs arbitrary range operations on sorted map
	2. Endpoints - returns first and last key in the sorted map
	3. Comparator access - returns the `Comparator` used to sort the map
3. `Map` analog of `SortedSet`

		public interface SortedMap<K, V> extends Map<K, V> {
			Comparator<? super K> comparator();
			SortedMap<K, V> subMap(K fromKey, K toKey);
			SortedMap<K, V> headMap(K toKey);
			SortedMap<K, V> tailMap(K fromKey);
			K firstKey();
			K lastKey();
		}

###### Map Operations ######
1. Two exceptions
	1. `Iterator` returned by `iterator()` on sorted map's `Collection` views traverse the collections in order
	2. Arrays returned by `Collection` view's `toArray` contains keys, values, or entries in order
2. `SortedMap` impementations return a string containing all elements of view in order for `toString()`

###### Standard Constructors ######
1. Conversion constructor takes a `Map`

###### Comparison to SortedSet ######
1. Idioms and code examples in `SortedSet` section apply to `SortedMap` with trivial modifications.

##### Summary of Interfaces #####
1. Core collection interfaces are foundation of Java Collections Framework.
2. Framework consists of two distinct framework trees:
	1. First tree: Starts with `Collection` interface
		1. Provides basic functionality used by all collections (`add`, `remove`)
		2. `Set`, `List`, `Queue`: specialized subinterfaces
	2. `Set` interface does not allow duplicates.
		1. `SortedSet`: Sub-interface of `Set`
	3. `List` interface is for ordered collection (to have control over where elements must be inserted)
		1. Retrieval by exact position
	4. `Queue` enables insertion, extraction, inspection operations (ordered in FIFO basis)
	5. `Deque` enables insertion, extraction, inspection at both ends
		1. For LIFO and FIFO
	6. Second tree: `Map` interface which maps keys and values (like `Hashtable`)
		1. `SortedMap` maintains key-value pairs in ascending order or in an order specified by `Comparator`
3. Interfaces allow collections to be manipulated independently of the details of their representation

### Aggregate Operations ###
#### Overview ####
1. Iteration over collections on programmers behalf
2. Enables to write efficient and concise code
#### Aggregate Operations ####
##### Reduction #####
##### Parallelism #####
##### Q & A #####

### Implementations ###
#### Overview ####
1. JDK's general-purpose collection implementations and teaches when to use which collection
2. Wrapper implementations: add functionality to general purpose implementations
#### Implementations ####
1. Implementations: data objects used to store collections which implement interfaces.
2. Kinds of implementations:
	1. **General-purpose implementations**: most commonly used implementations for everyday use.
	2. **Special-purpose implementations**: for special situations.
		1. Display nonstandard performance characteristics
		2. Display nonstandard usage restrictions
		3. Display nonstandard behavior
	3. **Concurrent implementations**: Designed for high concurrency (at the expense of single-threaded performance. They are in `java.util.concurrent`)
	4. **Wrapper implementations**: Are used in combination with other implementations (general purpose ones usually) for added or restricted functionality
	5. **Convenience implementations**: min-implementations, usually available through static factory methods (efficient alternatives to general-purpose implementations for special collections (singleton sets))
	6. **Abstract implementations**: skeletal implementations that facilitate construction of custom implementations. Few people need this
3. General purpose implementations:
	1. Interface: `Set`
		1. `HashSet`, `TreeSet`, `LinkedHashSet` (Hash table + Linked list)
	2. Interface: `List`
		1. `ArrayList`, `LinkedList`
	3. Interface: `Queue`
		1. None
	4. Interface: `Deque`
		1. `ArrayDeque`, `LinkedList`
	5. Interface: `Map`
		1. `HashMap`, `TreeMap`, `LinkedHashMap` (Hash table + Linked list)
4. `HashSet`, `ArrayList`, `HashMap`: used by most applications
5. No `SortedSet` and `SortedMap` general purpose implementations (`TreeSet`, `TreeMap` respectively)
6. `Queue` has `LinkedList`
7. General purpose implementations 
	1. permit `null` as keys and values
	2. Not thread safe
	3. Have fail-fast iterations (detect illegal concurrent modifications during iteration and fail quickly and cleanly rather than at an undeterministic behavior at undetermined time)
	4. `Serializable`
	5. Support public `clone`
8. Why not synchronized?
	1. Used when synchronization is of no benefit (single threaded use, read only use, used as part of larger data object that itself is synchronized)
		1. May result in deadlock if synchronized
9. For thread-safe collections, use synchronization wrappers to transform into synchronized collection.
10. `BlockingQueue`: concurrent implementation which extends `Queue`
11. `ConcurrentMap`: concurrent implementation which extends `Map`
12. Implementations:
	1. Choice affects performance
	2. Style: Assign a new collection to variable of corresponding interface type (pass collection to a method expecting an argument of interface type)
		1. Program becomes independent of added methods in an implementation

##### Set Implementations #####
1. There are general-purpose and special-purpose implementations

###### General-Purpose Set Implementations ######
1. `HashSet`, `TreeSet`, `LinkedHashSet`
	1. `HashSet`: much faster than `TreeSet` (contant time vs log time for most operations)
		1. No ordering guarantees
		2. Iteration is linear with sum of number of entries and number of buckets (?) (capacity) (do not choose too high initial capacity which wastes space and time) (do not choose too low capacity which wastes time copying the entire data structure each time it's forced to increase its capacity)
			1. Default capacity: 16
			2. Specifying capacity: `Set<String> s = new HashSet<String>(64);`
			3. LoadFactor: pick a number so that the size becomes twice
	2. `TreeSet`: has operations of `SortedSet` interface
		1. It has no tuning parameters
	3. `LinkedHashSet`: Implemented as hash table with linked list running through it
		1. provides insertion ordering iteration (least recently inserted to most recently inserted)
		2. Nearly as fast as `HashSet`
		3. Intermediate between `HashSet` and `TreeSet`
		4. Iteration time: Not affected by capacity

###### Special-Purpose Set Implementations ######
1. Two implementations:
	1. `EnumSet`: high performance implementation for enum types (all entries must be enum)
		1. Internal representation: Bit vector of type single `long`
		2. Supports iteration over range of enum types
			1. Static factor method exists

					for (Day d: EnumSet.range(Day.MONDAY, Day.FRIDAY))
						System.out.println(d);
	
		3. Provides typesafe replacement for bit flags

				EnumSet.of(Style.BOLD, Style.ITALIC)		
	2. `CopyOnWriteArraySet`: Set implementation backed by copy-on-write-array
		1. copy-on-write-array: Mutative operations (`add`, `set`, `remove`) makes a new copy of the array (concurrent operations are supported safely)
		2. `add`, `remove`, `contains` require time proportional to size of set
		3. Uses: For sets that are frequently iterated but rarely modified
			1. Event handler lists that must prevent duplicates

##### List Implementations #####
1. There are general-purpose and special-purpose implementations

###### General-Purpose List Implementations ######
1. Two implementations: `ArrayList`, `LinkedList`
	1. `ArrayList`: Used mostly
		1. Access time: constant positional access time (No allocation of node object in the `List`)
		2. Uses `System.arraycopy` to move multiple items at once
		3. `Vector` without synchronization overhead
		4. adding elements to beginning, iterate over elements to delete from interior (Linear time)
		5. Tuning parameter: initial capacity (number of elements it can hold before it grows)
	2. `LinkedList`: For adding elements to beginning, iterate over elements to delete from interior (Constant time)
		1. Access time:  positional access time is linear
		2. No tuning parameters
		4. Optional operations: `clone`, `addFirst`, `getFirst`, `removeFirst`, `addLast`, `getLast`, `removeLast` (`Queue` interface is implemented)

###### Special-Purpose List Implementations ######
1. `CopyOnWriteArrayList`: `List` implementation backed by copy-on-write array.
	1. Synchronization is not necessary (iterators never throw `ConcurrentModificationException`)
	2. Uses: for event-handler lists (change is infrequent, traversal is frequent)
2. `Vector` is faster than `ArrayList` synchronized with `Collections.synchronizedList`
	1. `Vector` has legacy operations so manipuate it with `List` interface (otherwise not easy to change it later)
3. `Arrays.asList`: Good for fixed size `List`

##### Map Implementations #####
1. There are general-purpose, special-purpose and concurrent implementations

###### General-Purpose Map Implementations ######
1. Three implementations: `HashMap`, `TreeMap`, `LinkedHashMap`
	1. `HashMap`: For maximum speed and no ordering
	2. `TreeMap`: has `SortedMap` operations
		1. For key-ordered `Collection`-view iteration
	3. `LinkedHashMap`: Near `HashMap` performance and insertion order iteration
		1. Two capabilities in addition to `LinkedHashSet`
			1. We can order it based on key access instead of insertion order (looking up a key brings the key to the end of the map)
			2. `removeEldestEntry`: method. It can be overridden to remove stale mappings automatically when new mappings are added
				1. Use: Custom cache
				2. Example:

						private static final int MAX_ENTRIES = 100;

						protected boolean removeEldestEntry(Map.Entry eldest) {
							return size() > MAX_ENTRIES;
						}

###### Special-Purpose Map Implementations ######
1. `EnumMap`: implemented as an array (high performance implementation for enum keys)
	1. Speed approaches that of array
	2. Use for mapping enum to value
2. `WeakHashMap`: stores only weak references to its keys. Garbage collector removes the key when the only reference to the key is in `WeakHashMap` and not referenced anywhere outside
	1. Use: To implement registry-like data structures (utility of a key vanishes when its key is no longer reachable by any thread)
3. `IdentityHashMap`: It is an identity-based `Map`. It is based on a hash table.
	1. Used for topology-preserving object graph transformations (serialization, deep copying)
		1. Can keep track of objects already seen
	2. Used for object to meta-information mapping in dynamic debuggers
	3. Used for thwarting spoof attacks (intentionally perverse `equals` method)
		1. It does not use `equals` on keys
	4. It is fast

###### Concurrent Map Implementations ######
1. `java.util.concurrent` contains `ConcurrentMap` interface
	1. extends `Map` with atomic operations:
		1. `putIfAbsent`
		2. `remove`
		3. `replace`
	2. `ConcurrentHashMap`: Implementation of `ConcurrentMap`
		1. hightly concurrent
		2. High performance implementation backed by hash table
		3. Does not block for retrievals
		4. Client can select concurrency level for updates
		5. Replacement for `Hashtable` and supports `Hashtable` operations
			1. If legacy operations are not to be used, used `ConcurrentMap` interface for manipulations

##### Queue Implementations #####
1. There are general-purpose and concurrent implementations

###### General-Purpose Queue Implementations ######
1. `LinkedList` implements `Queue`
	1. Provides FIFO operations like `add`, `poll` ...
2. `PriorityQueue`: based on heap data structure
	1. elements are ordered according to ordering specified at construction time (natural ordering or imposed by `Comparator`)
	2. Implements optional methods of `Collection` and `Iterator`
		1. `Iterator` returned does not guarantee traversal in a particular order
			1. Use `Arrays.sort(pq.toArray())`
3. `poll`, `peek`, `remove`, `element` access the element at the head of the queue.
	1. If multiple elements are tied for head, one of the elements is head (ties broken arbitrarily)

###### Concurrent Queue Implementations ######
1. `java.util.concurrent` contains synchronized `Queue` interfaces and classes.
2. `BlockingQueue`: extends `Queue`
	1. Operations:
		1. wait for queue to become non-empty during retrieval
		2. wait for queue to have space during storage
	2. Implementations:
		1. `LinkedBlockingQueue`: (optionally bounded) FIFO blocking queue backed by linked nodes.
		2. `ArrayBlockingQueue`: (bounded) FIFO blocking queue backed by array
		3. `PriorityBlockingQueue`: unbounded blocking priority queue backed by heap
		4. `DelayQueue`: time-based scheduling queue backed by heap
		5. `SynchronousQueue`: simple rendezvous mechanism that implements `BlockingQueue`
			1. rendezvous call takes a `tag` and `value`
			2. Procedure:
				1. Calling rendezvous causes process to sleep
				2. When second rendezvous call with same tag occurs, values are excahanged and both processes are awakened
	3. `TransferQueue`: specialized `BlockingQueue` in JDK 7
		1. code that adds element to queue has the option of waiting for another code in another thread to retrieve the element
		2. Implementation:
			1. `LinkedTransferQueue`: unbounded `TransferQueue` based on linked nodes

##### Deque Implementations #####
1. There are general-purpose and concurrent implementations

###### General-Purpose Deque Implementations ######
1. `LinkedList`:
	1. List implementation of `Deque` interface
	2. More flexible than `ArrayDeque` (implements all optional list operations, `null` elements are allowed)
	3. More efficient than `ArrayDeque` for removing current element during iteration
	4. Consumes more memory than `ArrayDeque`
2. `ArrayDeque`:
	1. Resizable array implementation of `Deque` interface
	2. `null` elements are not allowed
	3. More efficient than `LinkedList` for add and remove operations at both ends
	4. Traversal:
		1. **foreach**

				ArrayDeque<String> aDeque = new ArrayDeque<String>();
				...
				for (String str: aDeque) {
					System.out.println(str)
				}

		2. **iterator**: Used for forward traversal for all kinds of lists

				ArrayDeque<String> aDeque = new ArrayDeque<String>();
				...
				for (Iterator<String> iter = aDeque.iterator(); iter.hasNext();) {
					System.out.println(iter.next());
				}

3. Support insertion, removal and retrieval at both ends.
	1. `addFirst`: adds element at head
	2. `addLast`: adds element at tail
	3. `removeFirst`
	4. `removeLast`
	5. `getFirst`
	6. `getLast`
4. Both `LinkedList` and `ArrayDeque` do not support concurrent access by multiple threads.

###### Concurrent Deque Implementations ######
1. `LinkedBlockingDeque`: concurrent implementation of `Deque`.
	1. `takeFirst` and `takeLast` wait when deque is empty until element becomes available. When the element becomes available, it retrieves and removes the element

##### Wrapper Implementations #####
1. Delegates work to specified collection but adds extra functionality on top of that which the collection has.
	1. Based on decorator pattern
2. They are built using static factory method in `Collections` class

###### Synchronization Wrappers ######
1. They add synchronization (thread-safety) to arbitrary collection.
2. Each of `Collection`, `Set`, `List`, `Map`, `SortedSet` and `SortedMap` have static factory method

		public static <T> Collection<T> synchronizedCollection(Collection<T> c);
		public static <T> Set<T> synchronizedSet(Set<T> s);
		public static <T> List<T> synchronizedList(List<T> s);
		public static <K, V> Map<K, V> synchronizedMap(Map<K, V> m);
		public static <T> SortedSet<T> synchronizedSortedSet(SortedSet<T> s);
		public static <K, V> SortedMap<K, V> synchronizedSortedMap(SortedMap<K, V> m);
	
3. Methods return synchronized `Collection`.
4. All access should be through returned collection.

		List<Type> list = Collections.synchronizedList<Type>(new ArrayList<Type>());

	1. It is as safe as `Vector`
5. Manual synchronization is required when iterating over the collection (reason: multiple calls are used into collection each iteration)

		Collection<Type> c = Collections.synchronizedCollection(myCollection);
		synchronized(c) {
			for (Type e: c)
				foo(e);
		}

6. When using `iterator`, it must be called from within `synchronized` block.
	1. Similar for `Collection` view of synchronized `Map` (synchronize on `Map` rather than on `Collection` view)

			Map<KeyType, ValType> m = Collections.synchronizedMap(new HashMap<KeyType, ValType>());
			...
			Set<KeyType> s = m.keySet();
			...
			// Synchronizing on m, not s!
			synchronized(m) {
				while (KeyType k : s)
					foo(k);
			}

7. Downside: cannot call noninterface operations of wrapped implementation
	1. `ArrayList`'s `ensureCapacity` cannot be called on wrapped `ArrayList`

###### Unmodifiable Wrappers ######
1. They take away the ability to modify the collection by intercepting modification operations by throwing `UnsupportedOperationException`
2. Two main uses:
	1. Makes a `Collection` immutable after it has been built: (Do not maintain reference to backing collection)
	2. Give read only access to certain clients to the data structures.
		1. Only a reference to wrapper is hander over
3. A static factory method exists for each of the `Collection`s

		public static <T> Collection<T> unmodifiableCollection(Collection<? extends T> c);
		public static <T> Set<T> unmodifiableSet(Set<? extends T> s);
		public static <T> List<T> unmodifiableList(List<? extends T> l);
		public static <K, V> Map<K, V> unmodifiableMap(Map<? extends K, ? extends V> m);
		public static <T> SortedSet<T> unmodifiableSortedSet(SortedSet<? extends T> s);
		public static <K, V> SortedMap<K, V> unmodifiableSortedMap(SortedMap<? extends K, ? extends V> m);

###### Checked Interface Wrappers ######
1. `Collections.checked`: interface wrappers.
	1. Used with generic collections
	2. They return dynamically type-safe view of collection (throws `ClassCastException` if client attempts to add an element of the wrong type)
		1. This is a mechanism that is against operations that defeat compile-time type-checking.

##### Convenience Implementations #####
1. Mini-implementations: more convenient and more efficient than general-purpose implementations
2. Available through static factory methods

###### List View of an Array ######
1. `Arrays.asList`: Returns `List` view of array argument.
	1. Changes to `List` affect array and vice-versa
	2. Size cannot be changed (it is same as that of array)
	3. `add`, `remove` throw `UnsupportedOperationException`
2. Uses: it is a bridge between array based and collection based API
	1. We can pass array to a method expecting `Collection` or `List`
	2. Getting a fixed size `List` more efficiently

			List<String> list = Arrays.asList(new String[size]);

###### Immutable Multiple-Copy List ######
1. `Collections.nCopies` **(M)**: returns immutable `List` with multiple copies of same element.
	1. Use: Initialization

			List<Type> list = new ArrayList<Type>(Collections.nCopies(1000, (Type)null));

	2. Use: Grow an existing `List`
	
			lovablePets.addAll(Collections.nCopies(69, "fruit bat"));

		1. We can use index to add new elements to the middle of the `List`

###### Immutable Singleton Set ######
1. `Collections.singleton`: Returns immutable singleton `Set` which consists of single element.
	1. Use: To remove all occurrences of a specified element from a `Collection`

			c.removeAll(Collections.singleton(e));

	2. Use: Remove elements with specified value from a `Map`

			job.values().removeAll(Collections.singleton(LAWYER));

	3. Use: Provide single input value to a method that accepts a collection of values.

###### Empty Set, List, and Map Constants ######
1. `Collections.emptySet`: returns an empty `Set`
2. `Collections.emptyList`: returns an empty `List`
3. `Collections.emptyMap`: returns an empty `Map`
4. Use:
	1. Input to methods that take `Collection` of values that is required but we don't want to provide any values.

			tourist.declarePurchases(Collections.emptySet());

##### Summary of Implementations #####
1. Implementations: data objects used to store collections (they implement the interfaces)
2. General purpose implementations:
	1. `HashSet` for `Set`
	2. `ArrayList` for `List`
	3. `HashMap` for `Map`
	4. `LinkedList` for `Queue`
	5. `ArrayDeque` for `Deque`
3. General implementations provide all optional operations contained in its interface
4. There are special purpose implementations:
	1. Non-standard
	2. Performance
	3. Usage restrictions
	4. Unusual behavior
5. `java.util.concurrent` contains thread safe collections implementations (not governed by single exclusion lock)
6. `Collections`: has static methods that operate on or return collections (Wrapper implementations)
7. Convenience implementations may be more efficient than general-purpose implementations when limited power is needed.
	1. Available through static factory methods

### Algorithms ###
#### Overview ####
1. Polymorphic algorithms provided by JDK to operate on collections
#### Algorithms ####
1. They are reusable
2. The methods are static and are in `Collections` class
	1. First argument: collection on which operation must be performed
		1. `List` or other `Collection` instances
3. Algorithms:
	1. Sorting
	2. Shuffling
	3. Routine Data Manipulation
	4. Searching
	5. Composition
	6. Finding Extreme Values

##### Sorting #####
1. It reorders `List` from ascending to descending order according to ordering relationship.
2. There are two forms:
	1. Takes `List` and sorts it according to element's natural ordering
3. Algorithm: slightly optimized merge sort
	1. Fast: guaranteed to run in `nlog(n)` time
		1. Runs faster on nearly sorted lists.
		2. Runs as fast as highly optimized quicksort (faster but is not stable and does not guarantee `nlog(n) performance`)
	2. Stable: Does not re-order equal elements. (Important if the list is sorted multiple times on different attributes)
4. Example:

		import java.util.*;

		public class Sort {
			public static void main(String[] args) {
				List<String> list = Arrays.asList(args);
				Collections.sort(list);
				System.out.println(list);
			}
		}

		java Sort I walk the line

5. Example: Using `Comparator` to print anagrams in reverse order of size

		// Make a List of all anagram groups above size threshold.
		List<List<String>> winners = new ArraysList<List<String>>();
		for (List<String> l : m.values())
			if (l.size() >= minGroupSize)
				winners.add(l);

		// Sort anagram groups according to size
		Collections.sort(winners, new Comparator<List<String>>() {
			public int compare(List<String> o1, List<String> o2) {
				return o2.size() - o1.size();
			}
		});

		// Print anagram groups.
		for (List<String> l : winners)
			System.out.println(l.size() + ": " + l);

##### Shuffling #####
1. It reorders `List` based on input from a source of randomness (permutations occur with equal likelihood)
	1. Applications: Shuffle `List` of `Card` objects representing a deck.
		1. Generating test cases
2. Two forms:
	1. First one: Takes a `List` and uses default source of randomness
	2. Second one: Takes a second `Random` object which is used as the source of randomness.

##### Routine Data Manipulation #####
1. 5 Algorithms:
	1. `reverse`: reverses the order of elements in a `List`
	2. `fill`: overwrites every element in a `List` with specified value (good for reinitializing a list)
	3. `copy`: Takes 2 arguments (destination `List` and source `List`)
		1. Copies elements in source to the destination
		2. Destination list must be atleast as long as the source (remaining elements remain un affected)
	4. `swap`: swaps elements at specified postions in a `List`
	5. `addAll`: adds all the specified elements to a `Collection`.
		1. Specify the elements individually or as an array

##### Searching #####
1. `binarySearch` searches for a specified element in a sorted `List`.
	1. Two forms:
		1. Takes a `List` and an element to search for (search key).
			1. Assumes that `List` is sorted in ascending order according to natural ordering.
		2. Takes a `List`, an element to search for and a `Comparator` (algorithm assumes that the `List` is sorted in ascending order according to the `Comparator`)
	2. Return values:
		1. index of search key is returned if found
		2. `(-(insertion point) - 1)` is returned if not found
			1. `insertion point`: point at which value could be inserted into the `List` or index of first element greater than `list.size()` if all elements are less than the search key.
2. Example: Look for specified search key and insert it if not found

		int pos = Collections.binarySearch(list, key);
		if (pos < 0)
			list.add(-pos - 1, key);

##### Composition #####
1. `frequency` **(M)**: counts number of times a specified element occurs in a specified `Collection`
2. `disjoint` **(M)**: Determines whether two `Collection`s are disjoint (no elements in common)

##### Finding Extreme Values #####
1. `min`, `max` return minimum and maximum element contained in a `Collection`
	1. Two forms:
		1. Simple form: Takes `Collection` and returns minimum or maximum according to natural ordering
		2. Second form: Takes `Comparator` also and returns minimum or maximum according to the `Comparator`

### Custom Implementations ###
1. Why do we need to write our own collection implementation?
2. How to write our own collection implementations (usage of abstract collection implementations)?
3. It is easy to write custom implementations using abstract implementations provided by Java platform.

#### Reasons to Write an Implementation ####
1. Typs of custom `Collections`
	1. **Persistent**
	2. **Application-specific**
	3. **High-performance, special-purpose**
	4. **High-performance, general-purpose**
	5. **Enhanced functionality**
	6. **Convenience**
	7. **Adapter**


#### How to Write a Custom Implementation ####

### Interoperability ###
1. How Collections framework interoperates with older APIs?
2. How to design new APIs that will interoperate seamlessly with other new APIs

#### Interoperability ####
1. Two aspects of Interoperability:
	1. `Compatibility`: How collections can be made to work with older APIs that predate addition of `Collections`
	2. `API Design`: How to design new APIs so that they will interoperate seamlessly with one another

##### Compatability #####
##### API Design #####
1. Guidelines that allow API to interoperate seamlessly with other APIs that follow the guidelines.

###### Parameters ######
###### Return Values ######
###### Legacy APIs ######

