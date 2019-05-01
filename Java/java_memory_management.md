# Java Memory Management #
## Why memory is important ##
### Introduction ###
1. How memory works in Java
2. How to find source of problem and fix it
3. Open source softwares

## How memory works in Java ##
### Section introduction ###
1. For code optimization
2. For avoiding code errors (difficult to trace)
3. JVM is complicated
	1. Different aspects of how it is managed
	2. Not a precise representation
	3. As a developer how to account for it

### The role of the stack ###
1. Stack: Every thread has its own stack
	1. Java knows when data can be destroyed
2. Each time a function is called, local veriables are pushed into the stack
	1. copy of argument is made
3. When we return from method, all variables in function are popped
4. All local variables are stored in stack
	1. Stack helps define variable scopes
		1. Thread maintains its own stack
		2. Calling method variables are burried inside

### Introducing the Heap ###
1. Heap: for data that has a longer lifetime than a code block or function
	1. Objects shared across methods
2. Heap is all memory except stack
	1. One heap is shared across threads
3. Easy sharing of variables
	1. Primitives are stored on stack
4. References are stored in Stack
	1. Stack

			age = 21;
			
	2. Heap

			name -> Hello (name is in stack)
			
5. Rules:
	1. Objects are stored on heap
	2. Variables are a reference to the object
	3. Local variables are stored on the stack
6. Heap is a massive amount of storage space compared to the stack
	1. In Java we don't have access to the address stored in reference
7. Only variables in stack are directly reachable

## Values and References ##
### Passing variables by value ###
1. Calling methods

		public static void main(String[] args) {
			int localValue = 5;
			calculate(localValue);
			System.out.println(localValue);
		}
		
		public static void calculate(int calcValue) { // a copy of the value is passed
			calcValue = calcValue * 100;
		}
		
2. Pass by value in Java (copies are made)

### How objects are passed ###
1. References are copied

### The "final" keyword ###
1. A variable can only be assigned once
	1. Un initialized can be assigned

			final Customer c;
			c = new Customer("John"); // allowed
			
2. We can't change which object is pointed to
	1. But we can change the object in the heap

			c.setName("Susan"); // allowed
			
3. In Java we cannot make an object fixed and un-changable
	1. `const` is not implemented
4. PMD tool enforces final keyword

### Memory exercise ###
1. Open MemoryTest
	1. Predict the outcome

## Escaping References ##
### What are escaping references? ###
1. Well defined class:

		public class Book {
			private String title; // cannot be changed outside
			private String author;

			public String getTitle() {
				return title;
			}

			public void setTitle(String title) {
				this.title = title;
			}

			public Book(String title, String author) {
				this.title = title;
				this.author = author;
			}
		}

	1. We cannot accidentally change the data (access is controlled)
	2. Example 2:

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

		1. Client code:

				for (Customer next: records.getCustomers().values()) {
					System.out.println();
				}

			1. Problem: calling code gets reference and do anything to it

					CustomerRecords records = new CustomerRecords();

					Map<String, Customer> myCustomers = records.getCustomers();

					myCustomers.clear();

				1. Violation of encapsulation
				2. Difficult to debug

			2. Work around: Don't pass pointers to objects

					public class CustomerRecords implements Iterable<Customer> {
						...
						@Override
						public Iterator<Customer> iterator() {
							return records.values().iterator();
						}
					}

					...

					for (Customer next: records) {
						System.out.println(next);
					}

					records.iterator().remove(); // problem

			3. Better solution is to return a new object

					public Map<String, Customer> getCustomers() {
						return new HashMap<String, Customer>(this.records);
					}

				1. This solution builds a new HashMap of references to existing Customers
					1. If reference is changed to new Customer object, then original Customer does not change
					2. Problem: Any internal value of a Customer (property) can be changed
					3. Problem: If we change copy and assume that we are changing original collection, then it causes confusion
				2. Example:

						records.getCustomers().clear(); // references in new collection are removed completely but original collection is not changed

			4. Elegant solution: Return immutable collection
				1. `Collections.unmodifyableMap`
				2. `Collections.unmodifyableList`
				3. Example:

						public Map<String, Customer> getCustomers() {
							return Collections.unmodifiableMap(this.records);
						}

					1. `records.getCustomers().clear()`: fails with error

### Avoiding Escaping References ###
1. Example:

		public Customer getCustomerByName(String name) {
			return this.records.get(name);
		}

	1. Gets reference to Customer and can do anything
	2. Elegant solution: Read only copy
		1. Need a copy constructor

				public class Customer {
					public Customer(Customer oldCustomer) {
						this.name = oldCustomer.name;
					}
					...
				}

				public Customer getCustomerByName(String name) {
					return new Customer(this.records.get(name));
				}
				...
				Customer john = records.getCustomerByName("John");
				System.out.println(john.getName());
				john.setName("Derek");
				...
				for (Customer next: records.getCustomers().values()) {
					return new Customer(this.records.get(name));
				}

		2. Elegant solution: read only version using interface

				public class Customer {
					...	
				}

			1. Extract interface (include only getters): `CustomerReadOnly`

					public class Customer implements CustomerReadOnly {
						...
						public CustomerReadOnly getCustomerByName(String name) {
							return this.records.get(name);
						}
					}

					...
					CustomerReadOnly john = records.getCustomerByName("John");
					...
					// customer can change this to Customer

### Escaping References Exercise ###
1. Returning string references:
	1. String: They are immutable
		1. If the value is changed, new value is created
	2. Example:

			Customer cust = (new Customer("John"));
			String name = cust.getName();
			name = "Simon"; // New literal is created and reference is changed to the new literal address
2. Exercise: Open up the BookCatalog project - what's wrong with this code?

## Introduction to Garbage Collection ##
### String Pools ###
1. Stack is efficient (if code block is exited the variable is popped out)
2. Problem: We want objects to live outside the scope of where the object is created

		public void main() {
			Customer c = new Customer("John");
			processCustomer(c);
			System.out.println(c);
		}

		public void processCustomer (Customer aCustomer) { // shared here (heap)
			aCustomer.doSomethingReallyImportant();
		}

	1. Lifetimes vary in heap
		1. C++: Choice of creation of objects in stack or heap
		2. Java: No choice, all objects are in heap
			1. Simplification
			2. Clean way
			3. Now VM is clever. If object falls within the scope of a function, it is created in stack
				1. No control to the developer (optimized automatically)
		3. Example:

				public class Main {
					public static void main(String[] args) {
						String one = "hello";
						String two = "hello"; // both point to single object in heap since string is immutable (internalized strings)

						if (one == two) // references are same
							System.out.println("They are the same object");
						else 
							System.out.println("They are difference object");

						String three = new Integer(76).toString();
						String four = "76";

						if (three == four) // references are same
							System.out.println("They are the same object");
						else 
							System.out.println("They are difference object"); // Java cannot re-use
					}
				}

			1. Forced internalization:

					new Integer(76).toString().itern(); // forced re-use

				1. No duplicates
				2. Limits creation of objects
3. Starting point for garbage collection: All objects are created in heap (assumption)

### Garbage Eligibility ###
1. When we are finished with objects, Java cleans up automatically
	1. C/C++: Explicitly delete the objects
		1. C: `free()`
		2. If we don't free memory, then we may have to re-start the computer (if it is web server, it must not be done)
			1. Fault: Memory leak (objects not freed continue to consume memory... this is a "memory leak"
			2. Hard to detect (it takes too long and it is catastrophic)
				1. It is also hard to decide when to delete objects
	2. Java avoids memory leaks by:
		1. Running on a VM
			1. `new`: we are taking from VM (Not OS) - just C program
				1. VM decides when to put `free()` function
		2. No leaks (no bug reports)
		3. Adopts a Garbage Collection strategy (invented in LISP)
			1. Automatic process analyzes the heap and works out to find out which objects are no longer needed 
2. Rule for garbage collection:
	1. Any object on the heap which cannot be reached through a reference from the stack is "eligible for garbage collection"
		1. It can never be used again
		2. It can be removed anytime in the future
	2. It is possible for an object that is referenced be garbage
		1. List has no reference but has references to other objects (these are also garbage)
		2. Circular references
			1. None of them are reachable from stack
	3. Garbage collector works out different possibilities

### The gc() and finalise() methods ###
1. A programmer has very little control over garbage collection process.
	1. It must be treated as automatic process
2. `gc()`: suggests that the JVM to run the garbage collection process
	1. No guarantee that the VM will do
	2. Example:

			public class Main {
				public static void main(String[] args) {
					Runtime runtime = Runtime.getRuntime();

					for (int i = 0; i < 100000000; i++) {
						Customer c;
						c = new Customer("John");
					}

					availableBytes = runtime.freeMemory();
					System.out.println("Available Memory: " + availableBytes / 1024 + "k);

					System.gc();

					availableBytes = runtime.freeMemory();
					System.out.println("Available memory: " + availableBytes / 1024 + "k");
				}
			}

		1. GC did run (accepted the request or it may have been running already and finished the job at the end)
			1. It may not be accepted and may get different numbers (lower, same or higher)
		2. Example usage:
			1. If two blocks need to be evaluated for performance, then we may run gc before we test that for each code block
				1. State need be same
				2. But may not work with this suggestion
		3. GC will temporarily stop all threads in the application running
			1. App is temporarily suspended until completed
			2. GC must be quick and should be reasonably in-frequent
		4. When garbage collection process physically removes objects from the heap, Java runs `finalize()` method
			1. `finalize()`: called by the gc
				1. Example:

						public class Customer {
							...
							public void finalize() {
								System.out.println("This object is being gc'd");
							}
						}

					1. This is useless:
						1. It may or may not run or may run at a different time
						2. Do not close resources in this method - if not, we do not know when it may be closed
						3. Even if gc runs, the object may not be garbage collected at that point in time
						4. GC is needed to keep the heap nice and tidy while app is running
						5. Finalize method is useful to check that all resources are being closed

								public void closeFile() {
									file.close();
								}

								public void finalize() {
									if (file.isOpen()) { // no guarantee that this will run
										logger.warn("It looks like this resource was not closed");
									}
								}

### Detecting soft leaks ###
1. Garbage Eligibility
	1. Java avoids memory leaks by:
		1. Running on a virtual machine
			1. Releases all of its memory to the OS automatically
				1. It must be properly implemented
		2. Adopts a Garbage Collection strategy
2. Soft leak: An app or library keeps an object live even if we are not going to use it again
	1. An object is referenced on the stack even though it will never be used again
		1. When the program ends, the VM will execute `free()`
			1. While program is running, the object will never be released
				1. Risk of running out of memory
	2. Example:

			@Override
			public void run() {
				while (true) {
					try {

					} catch (InterruptedException e) {
						e.printStackTrace();
					}

					String name = new UUID(1l, 10l).toString();
					Customer c = new Customer(name);
					cm.addCustomer(c);
					totalCustomerGenerated++;
					cm.getNextCustomer();
				}
			}

			public static void main(String[] args) {
				CustomerManager cm = new CustomerManager();
				GenerateCustomerTask task = new GenerateCustomerTask(cm);
				for (int user = 0; user < 10; user++) {
					Thread t = new Thread(task);
					t.start();
				}

				while (true) {
					try {
						Thread.sleep(5000);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
					cm.howManyCustomers();
					System.out.println("Available memory: " + Runtime.getRuntime().freeMemory() / 1024 + "k");
				}
			}

		1. Arguments
			1. VM arguments:

					-Xmx10m

				1. Max heap size
		2. `bin/jvisualvm.exe` - start
			1. Shows apps using vm
				1. Right click on Eclipse and choose open

## Generational Garbage Collection ##
### Mark and Sweep ###
### Generational Garbage Collection ###
### Using Visual GC to view a soft leak ###
### Using the Memory Analyzer tool ###
### Permgen and Metaspace ###

## Tuning the Virtual Machine ##
### Heap Size ###
### Permgen Size ###
### Garbage Collection and Generation sizes ###
### Generating Heap Dumps ###
### Choosing a garbage collector ###

## Hunting for a real world memory leak ##
### Introducing the application ###
### Monitoring the application ###
### Fixing a memory leak ###

## Bonus section - weak and soft references ##
### Weak and soft references ###

## Goodbye! ##
### Bonus lecture - links to other courses ###