# Basics of Software Architecture in Java #
## Introduction ##
### Introduction ###
1. SOLID principles
	1. Single responsiblity principle
	2. Open-closed principle
	3. Liskov substitution principle
	4. Interface segregation principle
	5. Dependency inversion principle
2. Design patterns (Ensure the above principles are not violated)
	1. Behavioral design patterns
	2. Creational design patterns
	3. Structural design patterns
3. Why SOLID and Design Patterns?
	1. To write re-usable, flexible and maintainable software

### Course Materials ###
1. [http://www.globalsoftwaresupport.com/design-patterns-software-architecture-java/](http://www.globalsoftwaresupport.com/design-patterns-software-architecture-java/)

## SOLID Principles (Design Principles) ##
### S ###
### Single Responsibility Principle ###
1. An entity (class, method) should have only one reason to change if a class or method does more than one procedure, separate into two distinct classes or methods.
2. Done using interfaces, composition
3. Example: Book class with a print method and a save method
	1. If we want to print using color printer or black and white printer
	2. If we want to save in multiple formats
4. Benefits: Low coupled design with less and lighter dependencies

### Single Responsibility Principle Example I ###
1. Example:

		public class Book {
			private int numOfPages;
			private String authorName;

			public Book(String authorName, int nomOfPages) {
				this.authorName = authorName;
				this.numOfPages = numOfPages;
			}

			@Override
			public String toString() {
				// ...
			}

			// print() { ... save(); ... } - violates Single Responsiblity principle
			public void print() { // but not tightly coupled to Book so use Interface - if print() is not here, book will still be book
				// ...
			}

			public void save() { // but not tightly coupled to Book to use Interface
				// ...
			}

			// printAndSave() ... - violates Single Responsibility principle

			// getters and setters
		}

### Single Responsibility Principle Example II ###
1. Solution:

		public interface BookHandler {
			public void print();
		}

		public class BookPersistence {
			public void save(Book book) {
				System.out.println("Saving the book " + book);
			}
		}

2. Favour composition over inheritance
	1. We cannot extend multiple classes

			public class Book implements BookHandler {
				private BookPersistence bookPersistence;
				...
				@Override
				public void save() {
					this.bookPersistence.save(this);
				}
			}

			Book book1 = new Book("Albert Canus");
			book1.save();

### O ###
### The Open Closed Principle ###
1. Motivation:
	1. App should take care of frequent changes done during development and the maintenance phase of the application
		1. New functionalities have to be added
	2. Principle
		1. Changes in existing code should be minimized
			1. Why?
				1. Existing code is mostly already unit tested
				2. Changes in existing code might affect existing functionality in an unwanted manner
					1. Fast pace/ consistent pace development is difficult to achieve
		2. Statement:
			1. The design and writing of the code should be done in a way that new functionality should be added with minimum changes in the existing code
			2. Software entities should be open for extension but closed for modification
				1. A class should not extend an other class explicitly
					1. We should have a common interface
						1. We can change the classes at runtime due to the common interface
	3. Implementation:
		1. Strategy pattern
		2. Template pattern

### The Open Closed Principle Example I ###
1. Example: Sorting operation
	1. Bad example:
		
			public enum SortType {
				MERGESORT, INSERTIONSORT
			}

			public abstract class Sorter {
				protected sortType type;
				protected abstract void sort();
			}

			public class MergeSort extends Sorter {
				public MergeSort() {
					super.type = SortType.MERGESORT;
				}

				public void sort() {
					System.out.println("Sort with merge sort");
				}
			}

			public class InsertionSort extends Sorter {
				public InsertionSort() {
					super.type = SortType.INSERTIONSORT;
				}

				public void sort() {
					System.out.println("Sort with insertion sort");
				}
			}

			public class SorterManager { // violates OCP
				public void sort(Sorter sorter) {
					if (sorter.type == SortType.INSERTIONSORT) {
						doInsertionSort(sorter);
					} else if (sorter.type == Sortype.MERGESORT) {
						doMergeSort(sorter);
					}
				}

				private void doMergeSort(Sorter sorter) {
					sorter.sort();
				}

				private void doInsertionSort(Sorter sorter) {
					sorter.sort();
				}
			}

			public static void main(String[] args) {
				SorterManager sorterManager = new SorterManager();
				sorterManager.sort(new InsertionSort());
			}

### The Open Closed Principle Example II ###
1. Don't use Enums

		public interface Sorter {
			public void sort();
		}

		public class InsertionSort implements Sorter {
			public void sort() {
				//...
			}
		}

		public class MergeSort implements Sorter {
			public void sort() {
				//...
			}
		}

		public class SorterManager {
			public void sort(Sorter sorter) {
				sorter.sort();
			}
		}

		SorterManager sorterManager = new SofterManager();
		sorterManager.sort(new MergeSort());

### L ###
### Liskov Substitution Principle ###
1. Consider classes exending other classes
	1. Derived classes should work well without replacing the functionality of the existing classes
		1. Or else new classes can produce undesired effects when they are used in existing program modules
2. Requirements
	1. Child classes should never break the parent class type definition
	2. Subtype must be completely substitutable for their base types

			Vehicle
			Car extends Vehicle

		1. A method parameter `Car` can be replaced by `Vehicle` and the application does not break the functionality
	3. To solve the problem:
		1. Template pattern
3. If LSP is met, open-closed principle is usually met
	1. If LSP is violated, open-closed principle is violated
4. If LSP is to be met, Interface Segregation Principle must be met

### Liskov Substitution Principle Example I ###
1. Violation Example:

		public interface Vehicle {
			public void speed();
			public void addFuel();
		}

		public class Car implements Vehicle {
			public void speed() {
				// ...
			}

			public void addFuel() {
				// ...
			}
		}

		public class ElectricCar implements Vehicle {
			public void speed() {
				// ...
			}

			public void addFuel() {
				// throw exception
			}
		}

		public class App {
			public static void main(String[] args) {
				Vehicle car = new ElectricCar();

				if (car instanceof ElectricCar)
					ElectricCar ec = (ElectricCar) car; // violation of LSP - cannot change with parent type
					System.out.println("Unable to add fuel to electric car..."); // cannot call addFule();
				else 
					car.addFuel();
			}
		}

	1. Don't implement an interface of which we cannot use all the methods

### Liskov Substitution Principle Example II ###
1. Example:

		public interface NormalVehicle {
			public void speed();
			public void addFuel();
		}

		public interface ElectricVehicle {
			public void speed();
			public void chargeBattery();
		}

		public Car implements NormalVehicle {
			// ...
		}

		public ElectricCar implements ElectricVehicle {
			// ...
		}

		public static void main(String[] args) {
			ElectricVehicle car = new ElectricCar();
			car.chargeBattery();
		}

### I ###
### Interface Segregation Principle ###
1. Motivation? We can have an abstraction of the system using interfaces

		List<String> i = new ArrayList<>();

	1. If an interface contains lot of methods, they must be separated according to business requirements
2. Principle:
	1. No client should be forced to depend on methods it does not use
		1. If client wants only two methods but the interface has four methods, the client should not implement the unused methods

### Interface Segregation Principle Example ###
1. Example: BinarySearchTree, BalancedTree (more complex than BinarySearchTree)
	1. Bad implementation

			public interface Tree {
				public int findMax();
				public int findMin();
				public int traverse();

				// BalancedTree specific
				public void rightRotation();
				public void leftRotation();
			}

			public class BalancedTree implements Tree {
				// all methods are required
			}

			public class BinarySearchTree implements Tree {
				// implement findMax(), findMin(), traverse()
				// dummy implementation of other methods
			}

	2. Good implementation

			public interface Tree {
				public int findMax();
				public int findMin();
				public int traverse();
			}

			public interface IBalancedTree {
				public void rightRotation();
				public void leftRotation();
			}

			public class BinarySearchTree implements Tree {
				// implement findMax(), findMin(), traverse()
			}

			public class BalancedTree implements Tree, IBalancedTree {
				// all methods are required
			}

			public static void main(String[] args) {
				Tree binarySearchTree = new BinarySearchTree();
				Tree balancedTree = new BalancedTree();
			}

### D ###
### Dependency Inversion Principle Introduction I ###
1. Motivation?
	1. Two phases (usually):
		1. Low level modules are built (bluetooth connection to smartphone, access disk, connecting to database)
		2. High level modules which rely on low level modules
	2. Problem with the approach:
		1. If a low level module is changed, we may have to change the implementation of high level module (because of the dependency)
	3. Solution:
		1. High level modules should not depend on low level modules directly
			1. Use abstraction between low and high level modules

					HIGH LEVEL <-> ABSTRACT LAYER <-> LOW LEVEL

				1. Implementation:
					1. Interface:
						1. Connect
						2. CRUD
					2. OracleDatabase class should implement interface
					3. MySQLDatabase class should implement interface
					4. High level module used interface (loose coupling - does not change with low level module)

### Inversion of Control - Dependency Injection ###
1. We should avoid tightly coupled code
	1. Instantiating an object of a class with new keyword results in a class being tightly coupled to another class
	
			public class Person {
				private Address address;

				public Person() {
					this.address = new Address(); // tightly coupled
				}
			}

	2. Dependency inversion principle helps to build loosely coupled software modules
	3. Modules should depend on abstraction
		1. Suppose Package A' depends on Package B'
			1. If there is no dependency inversion, Object A refers to Object B
			2. Solution:
				1. Object A references Interface A
				2. Object B inherits/implements Interface A
2. In object oriented programming we can implement inversion of control several ways
	1. Using design patterns: factory, template or strategy patterns
	2. Using service locator pattern
	3. Using dependency injection pattern

### Dependency Inversion Principle Example I ###
1. Bad Example:

		public class MySQLDatabase {
			public void connect() {
				System.out.println("Connect to a MySQL Database...");
			}
		
			public void disconnect() {
				System.out.println("Disconnect to MySQL Database...")
			}
		}

		public class OaracleDatabase {
			public void connect() {
				System.out.println("Connect to a MySQL Database...");
			}
		
			public void disconnect() {
				System.out.println("Disconnect to MySQL Database...")
			}
		}

		public class DatabaseHandler {
			// private MySQLDatabase mySQLDatabase;
			private OracleDatabase database;

			public DatabaseHandler() {
				// this.mySQLDatabase = new MySQLDatabase();
				this.database = new OracleDatabase();
			}

			public void connect() {
				this.mySQLDatabase.connect();
			}

			public void disconnect() {
				this.mySQLDatabase.disconnect();
			}
		}

		public static void main(String[] args) {
			DatabaseHandler databaseHandler = new DatabaseHandler();
			databaseHandler.connect();
			databaseHandler.disconnect();
		}
	
	1. OCP violation may lead to DIP violation and vice-versa

### Dependency Inversion Principle Example II ###
1. Good example:

		public interface Database {
			public void connect();
			public void disconnect();
		}

		public class MySQLDatabase implements Database {
			// implement methods
		}

		public class OracleDatabase implements Database {
			// implement methods
		}

		public class DatabaseHandler {
			private Database database;

			public DatabaseHandler(Database database) {
				this.database = database;
			}

			public void connect() {
				database.connect();
			}

			public void disconnect() {
				database.disconnect();
			}
		}

## Behavioral Design Patterns ##
### Strategy Pattern Introduction ###
1. Take what varies and encapsulate it (it will not affect rest of the code)
	1. We can independently alter or extend parts that vary without affecting those that does not
		1. Separate the code the changes from code that changes the same
			1. Because we don't want to re-write parts that do not change
	2. Program to an interface and not an implementation (or Abstract super class)
		1. Actual runtime object is not locked into code
		2. Type of variable should be a supertype/interface: can be of any concrete implementation

				Animal dog = new Dog(); // GOOD

		3. Separate behavior from implementation
			1. Re-usability
			2. Can add new behavior without modifying existing behavior
2. Favor composition over inheritance
	1. Composition: Has-a relationship - lot of flexibility
		1. We can encapsulate stuffs into their own set of classes
		2. We can change behavior at runtime with interfaces
	2. Used in several design patterns

			class Book extends Write {

			}

### Strategy Pattern Example ###
1. Example:

		public interface Strategy {
			public void operation(int num1, int num2);
		}

		public class Add implements Strategy {
			public void operation(int num1, int num2) {
				System.out.println(num1 + num2);
			}
		}

		public class Multiply implements Strategy {
			public void operation(int num1, int num2) {
				System.out.println(num1 * num2);
			}
		}

		public class Manager implements Strategy {
			private Strategy stratagy;

			public void setStrategy(Strategy strategy) {
				this.strategy = strategy;
			}

			@Override
			public void operation(int num1, int num2) {
				strategy.operation(num1, num2);
			}
		}

		public static void main(String[] args) {
			Manager manager = new Manager();
			manager.setStrategy(new Add());
			manager.operation(1, 3);

			manager.setStrategy(new Multiply());
			manager.operation(2, 5);
		}

### Observer Pattern Introduction ###
1. Defines one-to-many dependency - If one object changes state all of its dependents are notified automatically
2. Observers rely on subjects
3. Why is it good?
	1. Loose coupling
		1. When two objects are loosely coupled, they can interact but they have little knowledge of each other
		2. Only thing that subject knows about observer is it's interface
		3. Observers can be added whenever we want (Observers must implement Observer interface)
		4. We can independently reuse subjects or observers
		5. We can change subject or observer independently

### Observer Pattern Example ###
1. Example:

		public interface Observer {
			public void update(int pressure, int temperature, int humidity);
		}

		public class WeatherObserver implements Observer {
			private int pressure;
			private int temperature;
			private int humidity;
			private Subject subject;

			public WeatherObserver(Subject subject) {
				this.subject = subject;
				subject.addObserver(this);
			}
		
			public void update(int pressure, int temperature, int humidity) {
				this.pressure = pressure;
				this.temperature = temperature;
				this.humidity = humidity;
			}

			private void showData() {
				System.out.println("Pressure: " + this.pressure + " Temperature: " + this.temperature + " Humidity: " + this.humidity);
			}
		}

		public interface Subject {
			public void addObserver(Observer observer);
			public void removeObserver(Observer observer);
			public void notifyAllObservers();
		}

		public class WeatherStation implements Subject {
			private int pressure;
			private int temperature;
			private int humidity;
			private List<Observer> observerList;

			publicWeatherStation() {
				this.observerList = new ArrayList<>();
			}

			public void addObserver(Observer observer) {
				this.observerList.add(observer);
			}

			public void removeObserver(Observer observer) {
				this.observerList.remove(observer);
			}

			public void notifyAllObservers() {
				for (Obersver observer: observerList)
					observer.update(pressure, temperatur, humidity);
			}

			// generate setters
			public void setPressure(int pressure) {
				this.pressure = pressure;
				notifyAllObservers();
			}

			public void setTemperature(int temperature) {
				this.temperature = temperature;
				notifyAllObservers();
			}

			public void setHumidity(int humidity) {
				this.humidity = humidity;
				notifyAllObservers();
			}
		}

		public static void main(String[] args) {
			Subject station = new WeatherStation();
			Observer observer = new WeatherObserver(station);

			station.setHumidity(100);
			station.setPressure(200);
			station.setTemperature(150);
		}

### Command Pattern Introduction ###
1. Command pattern: We can encapsulate method invocation, it encapsulates a request as an object ...
	1. object invoking the computation knows nothing about the implementation
2. Structure:
	1. Command: Knows about receiver and invokes a method of the receiver
		1. Values for parameters of the receiver method are stored in the command
	2. Receiver: Does the work itself
	3. Invoker: Knows how to execute a command, and optionally does bookkeeping about the command execution
		1. Invoker does not know about concrete Command
	4. Client: The client decides which commands to execute at which points
		1. To execute a command, it passes the command object to the invoker object

### Command Pattern Example I ###
1. Example:

		// Command
		public interface Command {
			public void execute();
		}

		public class TurnOnCommand implements Command {
			private Light light;

			public TurnOnCommand(Light light) {
				this.light = light;
			}

			@Override
			public void execute() {
				this.light.turnOn();
			}
		}

		public class TurnOffCommand implements Command {
			private Light light;

			public TurnOffCommand(Light light) {
				this.light = light;
			}

			@Override
			public void execute() {
				this.light.turnOff();
			}
		}

		// Receiver
		public class Light {
			public void turnOn() {
				System.out.println("Lights on...");
			}

			public void turnOff() {
				System.out.println("Lights off...");
			}
		}

		// Invoker
		public class Switcher {
			public List<Command> commands;

			public Switcher() {
				this.commands = new ArrayList<>();
			}

			public void addCommand(Command command) {
				this.commands.add(command);
			}

			public void executeCommands() {
				for (Command command: commands)
					command.execute();
			}
		}

		public static void main(String[] args) {
			Switcher switcher = new Switcher();

			Light light = new Light();
			TurnOnCommand onCommand = new TurnOnCommand(light);
			TurnOffCommand offCommand = new TurnOffCommand(light);

			switcher.addCommand(onCommand);
			switcher.addCommand(offCommand);

			switcher.executeCommands();
		}

### Command Pattern Example II - Queuing Model ###
1. Example: Android OS: Tasks - checking sensors, updating ui, making computations, checking battery
	1. The tasks are pushed on to a queue and are processed by another thread (producer-consumer)
2. Example:

		public interface Command {
			public void execute();
		}

		// Receiver
		public class Task {
			private int id;

			public Task(int id) {
				this.id = id;
			}

			public void solveProblem() {
				System.out.println("Solving problem with ID: " + id);
			}
		}

		// Command Implementation
		public class TaskSolver implements Command {
			private Task task;

			public TaskSolver(Task task) {
				this.task = task;
			}

			@Override
			public void execute() {
				task.solveProblem();
			}
		}

		// Invoker
		public class Algorithm {
			private BlockingQueue<Command> commandList;

			public Algorithm() {
				this.commandList = new ArrayBlockingQueue<>(10);
			}

			public void produce() {
				try {
					for (int i = 0; i < 10; i++)
						commandList.put(new TaskSolver(new Task(i+1)));
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}

			public void consume() {
				try {
					for (int i = 0; i < 10; i++) {
						Thread.sleep(1000)
						commandList.take().execute();
					}
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}

		// Client
		public static void main(String[] args) {
			final Algorithm algorithm = new Algorithm();

			Thread t1 = new Thread(new Runnable()) {
				@Override
				public void run() {
					algorithm.produce();
				}
			});

			Thread t2 = new Thread(new Runnable()) {
				@Override
				public void run() {
					algorithm.consume();
				}
			});

			t1.start();
			t2.start();
		}

### Iterator Pattern Example ###
1. Example:

		public interface Iterator implements Iterator {
			public boolean hasNext();
			public Object next();
		}

		public NameIterator {
			private String[] names;
			private int index;

			public NameIterator(String[] names) {
				this.names = names;
			}

			@Override
			public boolean hasNext() {
				return index < this.names.length;
			}

			@Override
			public Object next() {
				if (hasNext())
					return this.names[index++];
				return null;
			}
		}

		public class NameRepository {
			private String[] names = {"Adam", "Joe", "John", "Sarah"};

			public Iterator getIterator() {
				return new NameIterator(names);
			}
		}

		public static void main(String[] args) {
			NameRepository nameRepository = new NameRepository();

			for (Iterator iter = nameRepository.getIterator(); iter.hasNext();) {
				String name = (String) iter.next();
				System.out.println(name);
			}
		}

### Template Pattern Introduction ###
1. An abstract class exposes defined way/ template to execute its methods
2. Subclasses can override the method implementation as per need but the invocation is to be in the same way as defined by an abstract class

		abstract class Game() {
			abstract void initialize();
			abstract void startGame();
			abstract void finishGame();
		}

### Template Pattern Example ###
1. Example: Algorithm

		public abstract class Algorithm {
			public abstract void initialize();
			public abstract void sorting();
			public abstract void printResult();

			public void sort() {
				initialize();
				sorting();
				printResult();
			}
		}

		public abstract class BubbleSort extends Algorithm {
			private int[] numbers;

			public BubbleSort(int[] numbers) {
				this.numbers = numbers;
			}

			@Override
			public void initialize() {
				System.out.println("Initializing bubble sort...");
			}

			@Override
			public void sorting() {
				int n = this.numbers.length;
				int temp;

				while( n != 0 ) {
					temp = 0;
					for (int i = 1; i < n; i++) {
						if (numbers[i - 1] > numbers[i]) {
							int swap = numbers[i - 1];
							numbers[i - 1] = numbers[i];
							numbers[i] = swap;
							temp = i;
						}
					}
					n = temp;
				}
			}

			@Override
			public void printResult() {
				for (int i = 0; i < this.numbers.length; i++)
					System.out.println(numbers[i]);
			}
		}

		public abstract class InsertionSort extends Algorithm {
			private int[] numbers;

			public InsertionSort(int[] numbers) {
				this.numbers = numbers;
			}

			@Override
			public void initialize() {
				System.out.println("Initializing Insertion sort...");
			}

			@Override
			public void sorting() {
				int temp;
				int j;
				
				for (int i = 1; i < this.numbers.length; i++) {
					temp = this.numbers[i];
					j = 1;

					while(j > 0 && numbers[j - 1] > temp) {
						numbers[j] = numbers[j - 1];
						j = j - 1;
					}

					numbers[j] = temp;
				}
			}

			@Override
			public void printResult() {
				for (int i = 0; i < this.numbers.length; i++)
					System.out.println(numbers[i]);
			}
		}

		public static void main(String[] args) {
			int[] numbers = {1, 5, 3, 8, 2, -2, 10};

			Algorithm sortAlgorithm = new BubbleSort(numbers);
			sortAlgorithm.sort();

			sortAlgorithm = new InsertionSort(numbers);
			sortAlgorithm.sort();
		}


### Null Object Pattern Introduction ###
1. Motivation: References can be Null
	1. In code we have to check whether a reference is null or not -> NullPointerException
		1. This happens if we call a method on null objects
	2. Solution:
		1. Return empty ArrayList instead of null... (if not several if statements)
			1. Example:

					class Node {
						private int data;
						private Node leftChild;
						private Node rightChild;
						// ...
					}
	3. Good solution: null object design pattern
		1. An abstract class specifying various operations to be done
		2. Concrete classes extending this class and a null object class providing do nothing implementation of this class
			1. Can be used where we need to check if object is null

### Null Object Pattern Example ###
1. Example:

		public class Database {
			private List<String> customerNames;
		
			public Database() {
				this.customerNames = new ArrayList<>(Arrays.asList("Daniel", "Adam", "Joe", "Michael"));
			}

			public boolean existCustomer(String name) {
				for (String s: customerNames)
					if (s.equals(name))
						return true;
				return false;
			}
		}

		public abstract class AbstractCustomer {
			protected String personName;
			public abstract boolean isNull();
			public abstract String getCustomer();
		}

		public class NullCustomer extends AbstractCustomer {
			public abstract boolean isNull() {
				return true;
			}

			public abstract String getCustomer() {
				return "No customer with the given name exists in the database...";
			}
		}

		public class RealCustomer {
			private String customerName;

			public RealCustomer(String customerName) {
				this.customerName = customerName;
			}

			public abstract boolean isNull() {
				return false;
			}

			public abstract String getCustomer() {
				return customerName;
			}
		}

		public class CustomerFactory {
			private Database database;

			public customerFactory() {
				this.database = new Database();
			}

			public AbstractCustomer getCustomer(String name) {
				if (checkName(name)) {
					return new RealCustomer(name);
				}
				return new NullCustomer();
			}

			public boolean checkName(String name) {
				if (database.existCustomer(name))
					return true;
				return false;
			}
		}

		public static void main(String[] args) {
			CustomerFactory customerFactory = new CustomerFactory();
			System.out.println(customerFactory.getCustomer("Kevin").getCustomer());
		}

### Visitor Pattern Introduction ###
1. Pattern: It is separation of algorithm from an object structure on which it operates
	1. Enables us to add new operations to existing object structures without modifying these structures
		1. Solves open-closed-principle as well (can be used to meet this)
	2. Extract common operations into a unique class (example: webshop application)

### Visitor Pattern Implementation ###
2. Example:

		public interface ShoppingItem {
			public double accept(ShoppingCartVisitor visitor);
		}

		public class Table implements ShoppingItem {
			private String type;
			private double price;

			public Table(String type, double price) {
				this.type = type;
				this.price = price;
			}

			@Override
			public double accept(ShoppingCartVisitor visitor) {
				returns visitor.visit(this);
			}

			// Getters and Setters
		}

		public class Chair implements ShoppingItem {
			private String type;
			private double price;

			public Chair(String type, double price) {
				this.type = type;
				this.price = price;
			}

			@Override
			public double accept(ShoppingCartVisitor visitor) {
				returns visitor.visit(this);
			}

			// Getters and Setters
		}

		public interface ShoppingCartVisitor {
			public double visit(Table table);
			public double visit(Chair chair);
		}

		public interface ShoppingCart implements ShoppingCartVisitor {
			public double visit(Table table) {
				return table.getPrice();
			}

			public double visit(Chair chair) {
				return chair.getPrice();
			}
		}

		public static void main(String[] args) {
			List<ShoppingItem> items = new ArrayList<>();
			items.add(new Table("desk", 20));
			items.add(new Char("chair", 30));
			items.add(new Char("chair", 20));

			double sum = 0;
			ShoppingCartVisitor shoppingCart = new ShoppingCart();

			for(ShoppingItem shoppingItem: items) {
				sum += shoppingItem.accept(shoppingCart);
			}
		}
	
	1. Can be used to solve violation of open-closed principle

## Creational Design Pattern ##
### Singleton Pattern ###
1. Motivation: Usually an application connects to a single database

		public class Downloader {
			private static Downloader downloader = new Downloader(); // eager version

			private Downloader() {
			}

			public void startDownloading() {
				System.out.println("Start downloading data from the web...");
			}

			public static Downloader getInstance() {
				return Downloader.downloader;
			}
		}

		public static void main(String[] args) {
			Downloader d = Downloader.getInstance();
			Downloader d1 = Downloader.getInstance();

			if (d == d1)
				System.out.println("They are same");
		}

	1. Lazy version

			public class Downloader {
				private static Downloader downloader;

				private Downloader() {
				}

				public void startDownloading() {
					System.out.println("Start downloading data from the web...");
				}

				public static Downloader getInstance() {
					if (downloader == null)
						downloader = new Downloader();
					return Downloader.downloader;
				}
			}	

### Singleton Pattern II ###
1. Using Enum:

		public enum SingletonClass { // synchronized by default
			INSTANCE;
	
			private int counter;
			
			public void setCounter(int counter) {
				this.counter = counter;
			}

			public int getCounter() {
				return this.counter;
			}
		}

		public static void main(String[] args) {
			SingletonClass.INSTANCE.setCounter(10);
			System.out.println(SingletonClass.INSTANCE.getCounter());
		}

### Factory Pattern Introduction ###
1. Helps to build loosely coupled OO designs
	1. Problems with `new`
		1. We should not program to an implementation, we should program to an interface - `new` violates this
			1. code is less flexible
		2. `new Dog()` may have to be changed as new concrete classes are added (violated open-closed-principle)
	2. Solution:
		1. Find part in code that may change
		2. Separate it
		3. Encapsulate object creation
2. Factory classes are separation between higher level and lower level classes

### Factory Pattern Example ###
1. Example:

		public interface Algorithm {
			public void solve();
		}

		public class ShortestPath implements Algorithm {
			@Override
			public void solve() {
				System.out.println("Solve shortest path problem");
			}
		}

		public class SpanningTree implements Algorithm {
			@Override
			public void solve() {
				System.out.println("Solve spanning tree problem");
			}
		}

		public class AlgorithmFactory {
			public static final int SHORTEST_PATH = 0;
			public static final int SPANNING_TREE = 1;

			public static Algorithm createAlgorithm(int type) {
				switch (type) {
					case SHORTEST_PATH:
						return new ShortestPath();
					case SPANNING_TREE:
						return new SpanningTree();
					default:
						return null;
				}
			}
		}

		public static void main(String[] args) {
			Algorithm algorithm = AlgorithmFactory.createAlgorithm(AlgorithmFactory.SHORTEST_PATH);
			algorithm.solve();
		}

### Builder Pattern Introduction ###
1. Why?
	1. There can be lots of parameters in the constructor - this is hard to follow
		1. Solution: Use setters but we need multiple calls and the creation process is not thread safe
		2. It is not extensible: If we want to add one more optional parameter, we have to build a new constructor (telescoping constructors problem)
		3. Good solution: Add a new method when a new parameter is added
	2. Immutable property: (considering parallel execution - no problems because of )
		1. Use objects that cannot be modified after they have been created

### Builder Pattern Example - Avoiding Telescoping Constructors ###
1. Example:

		public class Person {
			private String name;
			private String email;
			private String address;
			private int age;
			private String university;

			public static class Builder {
				private final String name;
				private final String email;
				private String address;
				private int age;
				private String university;

				public Person(Builder builder) {
					this.name = builder.name;
					this.email = builder.email;
					this.address = builder.address;
					this.age = builder.age;
					this.university = builder.university;
				}

				public Builder(String name, String email) {
					this.name = name;
					this.email = email;
				}

				public Builder setAddress(String address) {
					this.address = address;
					return this;
				}

				public Builder setAge(String age) {
					this.age = age;
					return this;
				}

				public Builder setUniversity(String university) {
					this.university = university;
					return this;
				}

				public Person build() {
					return new Person(this);
				}
			}
		}

		public static void main(String[] args) {
			Person person = Person.Builder("Kevin", "kevin@gmail.com").setAge(15).setAddress("Hudson Street").build();
			System.out.println(person);
		}

### Why to Use Builder Pattern? ###
1. Reasons:
	1. If there are lots of parameters in the constructor - it is difficult to follow this pattern
	2. It is not extensible: If we want to add one more parameter, we need a new constructor (leads to telescoping problem)
		1. Solution: With builder, we just add another method
		2. Immutable property principle can be met (parallel execution is taken care of)
			1. Ensure objects cannot be modified after they have got created (no problems if multiple threads act on the object)
2. Example: UI module
	1. AddStudentLayout: (Using Vadin framework - easy to build components)
		1. We can connect UI components to Model
		2. Layout would just build based on Model
			
				return New AddStudentMainLayout(studentSavedListener).init().load().bind().layout();

### Data Access Object (DAO) Pattern Example ###
1. Example:
	
		public class Person {
			private String name;
			private int age;
			private String gender;
			private String address;

			public Person(String name, int age) {
				this.name = name;
				this.age = age;
			}

			@Override
			public String toString() {
				// ...
			}
		}

		public interface PersonDAO {
			public void insert(Person person);
			public void remove(Person person);
			public List<Person> getPeople();
		}

		public class Database implements PersonDAO {
			private List<Person> people;

			public Database() {
				people = new ArrayList<>();
			}

			@Override
			public void insert(Person person) {
				this.people.add(person);
			}

			@Override
			public void remove(Person person) {
				this.people.remove(person);
			}

			@Override
			public List<Person> getPeople() {
				return this.people;
			}
		}

		public static void main(String[] args) {
			Database database = new Database();
			database.insert(new Person("John", 27));
			database.insert(new Person("Adam", 47));
			database.insert(new Person("Joe", 37));

			for (Person person: database.getPeople())
				System.out.println(person);

			database.remove(adam);

			for (Person person: database.getPeople())
				System.out.println(person);
		}

## Structural Design Patterns ##
### Decorator Pattern Introduction ###
1. OCP:
	1. ObserverPattern - we can add new Observers + extend Subject without adding code to Subject
	2. DecoratorPattern - helps extend existing classes with new behavior without modifying existing code
		1. Flexible - If requirements are changing, we don't have to write the whole application
2. Decorator pattern:
	1. Attaches additional responsibilities to an object dynamically
		1. It acts as a flexible alternative to subclassing for extending functionality
3. Example:

		new LineNumberInputStream(new BufferedInputStream(new FileInputStream())); // one object wraps another object ...

4. Anti-pattern: Applying OCP everywhere may lead to difficult to understand code

### Decorator Pattern Example ###
1. Example:

		public interface Beverage {
			public int getCost();
			public String getDescription();
		}

		public abstract class BeverageDecorator implements Beverage {

			protected Beverage beverage;

			public BeverageDecorator(Beverage beverage) {
				this.beverage = beverage
			}

			@Override
			public int getCost() {
				return this.beverage.getCost();
			}
			
			@Override
			public String getDescription() {
				return this.beverage.getDescription();
			}
		}

		public class Milk extends BeverageDecorator {

			private Beverage beverage;

			public Milk(Beverage beverage) {
				super(beverage);
				this.beverage = beverage;
			}

			@Override
			public int getCost() {
				return this.beverage.getCost() + 3;
			}

			@Override
			public String getDescription() {
				return this.beverage.getDescription() + "milk";
			}
		}

		public class PlainBeverage implements Beverage {
			
			private Beverage beverage;

			public PlainBeverage(Beverage beverage) {
				super(beverage);
			}

			@Override
			public int getCost() {
				return 5;
			}

			@Override
			public String getDescription() {
				return "Plain beverage ";
			}
		}

		public class Sugar extends BeverageDecorator {
			public Sugar (Beverage beverage) {
				super(beverage);
				this.beverage = beverage;
			}

			@Override
			public int getCost() {
				return this.beverage.getCost() + 1;
			}

			@Override
			public String getDescription() {
				return this.beverage.getDescription() + " Sugar";
			}
		}

		public class App {
			Beverage b = new Sugar (new Milk(new PlainBeverage()));

			System.out.println(b.getCost());
			System.out.println(b.getDescription());

			Beverage b = new Sugar (new Sugar (new Milk(new PlainBeverage())));
		}

	1. Like this we can add additional features to the objects at runtime using decorator pattern
		1. Adds all costs
		2. Adds all items to description

### Facade Pattern Introduction ###
1. Facade manager is going to hide all the implementation details and problematic parts of an application
	1. It is an algorithm manager

### Facade Pattern Example ###

		public interface Algorithm {
			public void sort();
		}

		public class BubbleSort implements Algorithm {

			@Override
			public void sort() {
				System.out.println("Using the BubbleSort");
			}
		}

		public class MergeSort implements Algorithm {
			
			@Override
			public void sort() {
				System.out.println("Using the MergeSort");
			}
		}

		public class QuickSort implements Algorithm {
			
			@Override
			public void sort() {
				System.out.println("Using the QuickSort");
			}
		}

		public class SortingManager { // manages all sorting operations of all different types available
			private Algorithm bubbleSort;
			private Algorithm mergeSort;
			private Algorithm quickSort;

			public SortingManager() {
				this.bubbleSort = new BubbleSort();
				this.mergeSort = new MergeSort();
				this.quickSort = new QuickSort();
			}

			public void doBubbleSort() {
				this.bubbleSort.sort();
			}

			public void doMergeSort() {
				this.mergeSort.sort();
			}

			public void doQuickSort() {

			}
		}

		public class App {
			SortingManager manager = new SortingManager(); // single instance is enough to handle different sorts
	
			manager.doBubbleSort();
			manager.doMergeSort();
			manager.doQuickSort();
		}

### Adapter Pattern Introduction ###
1. Converts interface an interface of a class into another interface the clients expect
2. Helps two classes to work together which are not compatible
3. Relies on composition
	1. Favor composition over inheritance

### Adapter Pattern Example ###

		public interface Vehicle {
			public void accelerate();
		}

		public class Car implements Vehicle {
			@Override
			public void accelerate() {
				System.out.println("Car is accelerated.");
			}
		}

		public class Bus {
			@Override
			public void accelerate() {
				System.out.println("Bus is accelerated.");
			}
		}

		public class Bicycle {
			public void go() {
				System.out.println("Going by bicycle...");
			}
		}

		public class BicycleAdapter implements Vehicle {
			private Bicycle bicycle;

			public BicycleAdapter(Bicycle bicycle) {
				this.bicycle = bicycle;
			}

			@Override
			public void accelerate() {
				this.bicycle.go();
			}
		}

		public class App {
			public static void main(String[] args) {
				Vehicle bus = new Bus();
				Vehicle car = new Car();
				Vehicle bicycle = new BicycleAdapter(new Bicycle());

				bus.accelerate();
				car.accelerate();
				bicycle.accelerate();
			}
		}

## Model-View-Controller (MVC) Application ##
### Model-View-Controller Introduction ###
1. We can separate application with model view controller pattern
2. Why is it good?
	1. We can add extra features easily
3. Model: represents an object or a class carrying data.
	1. It can also have logic to update controller if its data changes
4. Controller: Acts on both model and view
	1. Controls data flow into model object
	2. Updates view whenever data changes in model
	3. Keeps view and model separate
5. View: Represents the visualization of data that model contains
	1. MODEL <----> Controller <----> View
		1. UI in desktop
		2. Browser UI
6. View should not communicate with model and vice versa directly
7. Controller directly communicates with view and model
	1. It delegates to model or view

### Model-View-Controller - Model ###
1. Model:
	1. Database

			public class Database {
				private List<Person> peopleDatabase;

				public Database () {
					this.peopleDatabase = new ArrayList<>();
				}

				public void addPerson(Person person) {
					this.peopleDatabase.add(person);
				}

				public void removePerson(Person person) {
					this.peopleDatabase.remove(person);
				}

				public List<Person> getPeopleDatabase() {
					return this.peopleDatabase;
				}
			}

	2. Person

			public class Person {
				private String name;
				private String occupation;

				// constructor ...
				// getters and setters ...
			}

### Model-View-Controller - View ###
1. MainFrame: Application frame itself

		public class MainFrame extends JFrame implements FormListener {
			private static final long serialVersionUID = 1L;
			private FormPanel formPanel;
			private TextPanel textPanel;
			private Controller controller;

			public MainFrame() {
				super(Constants.APPLICATION_TITLE);

				initializeClass();
				setLayout();
			}

			private void setLayout() {
				add(this.formPanel, BorderLayout.WEST);
				add(this.textPanel, BorderLayout.CENTER);
				
				setSize(700, 400);
				setVisible(true);
				setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			}

			private void initializeClass() {
				this.controller = new Controller(this);
				this.formPanel = new FormPanel();
				this.formPanel.setFormPanel(this);
				this.textPanel = new TextPanel();	
			}
		}

		public class TextPanel extends JPanel {
			private static final long serialVersionID = 1L;
			private JTextArea textArea;
	
			public TextPanel() {
				initializeClass();
				setLayout();
			}
	
			private void setLayout() {
				setLayout(new BorderLayout());
				textArea.setFont(new Font("Tahoma", Font.PLAIN, 14);
				add(new JScrollPane(textArea), BorderLayout.CENTER); // scroll pane
			}
	
			private void initializeClass() {
				this.textArea = new JTextArea();
			}
	
			public void addText(String text) {
				this.textArea.append(text + "\n");
			}
	
			public void clearText() {
				this.textArea.setText("");
			}
		}

		public class FormPanel extends JPanel implements ActionListener {
			private static final long serialVersionUID = 1L;
			private JTextField nameField;
			private JTextField occupationField;
			private JButton okButton;
			private FormListener formListener;

			public FormPanel() {
				initializeClass();
				setClassDimensions();
				setupLayout();
			}

			private void setupLayout() {
				setLayout(newe GridBagLayout());
			
				GridBagConstraints gc = new GridBagConstraints();

				gc.gridy = 0;
				gc.gridx = 0;
				gc.weightx = 1;
				gc.weighty = 0.3;
				gc.fill = GridBagConstraints.NONE;
				gc.anchor = GridBagConstraints.LINE_END;

				add(new JLabel("Name: "), gc);

				gc.gridx++;
				gc.gridy = 0;
				gc.anchor = GridBagConstraints.LINE_START;

				// New row
				gc.gridy++;
				gc.gridx = 0;
				gc.weightx = 1;
				gc.weighty = 0.4;
				gc.fill = GridBagConstraints.NONE;
				gc.anchor = GridBagConstraints.LINE_END;
				add(new JLabel("Occupation: "), gc);
				
				gc.gridx++;
				gc.gridy = 1;
				gc.anchor = GridBagConstraints.LINE_START;
				add(occupationField, gc);

				// new row
				gc.gridy++;
				gc.gridx = 0;
				gc.weightx = 1;
				gc.weighty = 10;
				gc.fill = GridBagConstraints.NONE;

				gc.anchor = GridBagConstraints.FIRST_LINE_END;
				add(okButton, gc);
			}

			public void setFormListener(FormListener formListener) {
				this.formListener = formListener;
			}

			private void setClassDimensions() {
				Dimension dim = getPreferredSize();
				dim.width = 300;
				setPreferredSize(dim);
				setMinimumSize(dim);
			}

			private void initializeClass() {
				this.nameField = new JTextField(10);
				this.occupationField = new JTextField(10);
				this.okButton = new JButton("OK");
				this.okButton.addActionListener(this);
			}
		}	

		public interface FormListener {
			public void okButtonClicked(String personName, String personOccupation);
		}

### Model-View-Controller - Controller ###
1. Controller

		public class Controller {
			private Database database;
			private MainFrame mainFrame;

			public Controller (MainFrame mainFrame) {
				this.database = new Database();
				this.mainFrame = mainFrame;
			}
	
			public void addPerson(String personName, String personOccupation) {
				Person person = new Person(personName, personOccupation);
				this.database.addPerson(person);
			}

			public void removePerson(Person person) {
				this.database.removePerson(person);
			}

			public List<Person> getPeopleDatabase() {
				return this.database.getPeopleDatabase();
			}

			public void refreshScreen() {
				List<Person> people = getPeopleDatabase();
				this.mainFrame.clearText();
				
				for (Person person: people) {
					this.mainFrame.refreshTextArea(person.getName(), person.getOccupation());
				}
			}
		}

## Miscellaneous ##
### Service Locator Introduction ###
1. Used for obtaining processes involved in obtaining a service with strong abstraction layer 
	1. Like DI
		1. Alternative for DI
2. A central registry called service locator
	1. Send a request to the service locator that we want an object that handle db related code
	2. Service locator is going to instatiate a given class and going to send back the object
		1. Example I want an object to handle web services
	3. Advantages: Lose coupling
		1. It is like runtime linker that allows code to be added at run-time without re-compiling source code
		2. Optimization
			1. Example: The application can detect it has a better database library than the default one -> alter the registry accordingly
	4. Disadvantages:
		1. black box: It is hard to detect and recover from error
		2. Registry hides the dependencies: May cause runtime errors insted of compile time errors (not desirable)
			1. That is the reason generics are introduced (to catch errors at compile time)
3. Differences between service-locator and dependency injection
	1. Both are just implementations of the dependency inversion principle
		1. Depend on abstraction rather than concrete implementation
			1. Losely coupled software design
	2. Service locator: Application class asks for the object explicitly to the service locator
	3. Dependency injection: No explicit request. The service appears in the application class (inversion of control)
		1. Easier to test (than service locator)
	4. Both are used mainly to separate service configuration from the use of the service in the application
		1. Service locator: Application is depending on service locator instead of on the lower level objects (principle is important)

### Service Locator Pattern Implementation ###
1. Example:

		public interface Service {
			public String getName();
			public void execute();
		}

		public class DatabaseService implements Service {
			public static final String NAME = "databaseService";

			public String getName() {
				return DatabaseService.NAME;
			}

			public void execute() {
				System.out.println("Executing database service...");
			}
		}

		public class MessagingService implements Service {
			public static final string Name = "messagingService";

			public String getName() {
				return MessagingService.NAME;
			}

			public void execute() {
				System.out.println("Executing messaging service...");
			}
		}

		public class Cache {
			private List<Service> listOfServices;

			public Cache() {
				listOfService = new ArrayList<>();
			}

			public Service getService(String jndiName) { // jndi uses service locator pattern

				// O(n) complexity
				for (Service s : listOfServices) {
					if (s.getName().equals(jndiName)) {
						return s;
					}
				}

				return null;
			}

			public void addService(Service service) {
				this.listOfServices.add(service);
			}
		}

		public class InitialContext {
			public Object lookup(String jndiName) {
				switch (jndiName) {
				case DatabaseService.NAME: 
					return new DatabaseService();
				case MessagingService.NAME:
					return new MessagingService();
				default:
					return null;
				}
			}
		}

		public class ServiceLocator {
			private static Cache cache = new Cache();

			public static Service getService(String jndiName) {
				Service service = cache.getService(jndiName);

				if (service != null)
					return service;

				InitialContext context = new InitialContext();
				Service s = (Service) context.lookup(jndiName);
				cache.addService(s);

				return s;
			}
		}

		public static void main(String[] args) {
			Service s = ServiceLocator.getService("databaseService");
			s.execute();

			s = ServiceLocator.getService("messagingService");
			s.execute();
		}

### JNDI and Service Locator Pattern ###
1. JNDI: Java Naming and Naming Interface
	1. Allows Java clients to discover data and objects according to names
	2. It is an API
		1. Independent of any implementation
			1. Like JPA
		2. It is a specification
			1. Implemented using service locator pattern
2. JBoss server:
	1. JNDI: specify data source name and it returns data source
		1. data source can be used to connect to database
		2. We can connect to database with multiple threads
			1. Scalable (facebook, webshop app)
		3. We can cache the services and return it with a name

## BONUS ##
### DISCOUNT FOR OTHER COURSES! ###