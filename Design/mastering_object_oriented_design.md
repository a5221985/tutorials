# Master Object Oriented Design in Java - Homework + Solution #

## Section: 0 ##
### How to make the most of this course ###
1. Complete HW assignments
2. Participate in discussion board
3. Apply the knowledge

### Download source code for lectures ###

## Introductory Principles in Object Oriented (Optional Prerequisite) ##
### Class and Object (Optional Prerequisite) ###
1. Objects do work
	1. behavior or function
	2. Software objects do work in an application
2. Example:
	1. Person

			public class Person {
				String name;
				int age;
				int heightInInches;
				String eyeColor;

				public Human() {
					
				}

				public void speak() {
					System.out.println("Hello, my name is " + name);
					System.out.println("I am " + heightInInches + " inches tall");
					System.out.println("I am " + age + " years old");
					System.out.println("My eye color is " + eyeColor);
				}

				public void eat() {
					System.out.println("Eating...");
				}

				public void walk() {
					System.out.println("Walking...");
				}

				public void work() {
					System.out.println("Working...");
				}
			}

			public class Earth {
				public static void main(String args[]) {
					Person tom;
					tom = new Person(); // new <constructor>
					tom.age = 5;
					tom.eyeColor = "brown";
					tom.heightInInches = 72;
					tom.name = "Tom Zsabo";
					tom.speak();
				}
			}

	2. Class: Specification or blueprint of how object should behave or should have

### Program Flow and Using Constructor (Optional Prerequisite) ###
1. Another object

		Person joe = new Person();
		joe.age = 36;
		joe.eyeColor = "Green";
		joe.heightInInches = 68;
		joe.name = "Joe Greenzila";

2. Assigment of field values in constructor

		public Human(String name, int age, int heightInInches, String eyeColor) {
			super();
			this.age = age;
			this.eyeColor = eyeColor;
			this.heightInInches = heightInInches;
			this.name = name; // this - variable that points to current object
		}

		...
		Person p1 = new Person("Tom", 25, 76, "Blue");
		Person p2 = new Person("Joe", 44, 64, "Green");
		Person p3 = new Person("Ahmed", 23, 56, "Brown");

		p1.speak();
		p2.speak();
		p3.speak();

### Quiz 1: Object and Class ###
### Application Runtime (Optional Prerequisite) ###
1. Organization of Java code
	
		Package
			Java Class file
				Java Class file (specification)
					Methods (behavior)

2. Constructor:
3. Object: Runtime concept (come to existence only when app runs)

		Animal animal1 = new Animal(12, "W", 23); // animal1 = reference to object

	1. Think in terms of objects and runtime concepts

### Java Behind The Scenes ###
1. Class: 

		class Name {

		}

	1. Complaint from runtime
	2. Named blocks - methods (all work is done here)
		1. main - starting point of Java app
2. Memory locations:
	1. Two
		1. Stack:
			1. frame: created when a method is executed
				1. `main()` - frame
					1. local variables are stored here and values are assigned
				2. `doWork()` - frame (on top of `main()`)
					1. local variables ...
				3. `doMore()` - frame (on top of `doWork()`)
					1. local variables ...
				4. `doMore()` is eliminated on exit from stack
				5. `doWork()` is eliminated on exit from stack
				6. `Car myCar` is created in `main()` frame
				6. `main()` is eliminated on exit from stack
		2. Heap:
			1. `myCar = new Car();`
				1. `myCar` in stack is assigned the address of object `new Car()`
				2. `new Car()` invokes creation of object in heap
			2. `myCar = new Car();`
				1. `myCar` in stack is changed to point to another object
				2. `new Car()` invokes creation of another object in heap
	2. Garbage collection:
		1. Old `new Car()` object which has no references and eliminated by garbage collection
			1. Frees memory for other new objects
	3. Instance variable: (object is same as instance)
		1. Class that has variables

				class Car {
					int hp;

				}

				Car my2Car = new Car();

			1. `hp` has slot in heap
		2. Complex instance variable

				Class Car {
					...
					Engine myEngine;
					...

				Engine bigEngine = new Engine(); // bigEngine contains address of object
				my3Car.myEngine = bigEngine; // myEngine stores reference to object

### Class Inheritence (Optional Prerequisite) ###
1. Object oriented programming: it is a way of programming which is better than procedure oriented (multiple files logically)
2. Inheritance: One class inherits behaviour from another class (properties also)

		public class Bird extends Animal {
			public Bird(int age, String gender, int weightInLbs) {
				super(age, gender, weightInLbs);
			}

			public void fly() {
				System.out.println("Fly");
			}
		}

		public class Fish extends Animal {
			public Fish(int age, String gender, int weightInLbs) {
				super(age, gender, weightInLbs);
			}

			public void swim() {
				System.out.println("Swim");
			}
		}

		...
		Animal animal1 = new Animal(12, "M", 23);
		Bird bird1 = new Bird(3, "F", 10);
		bird1.eat();
		bird1.sleep();

	1. Methods visible to a variable are as defined in its type spec
		1. `Animal animal1` - only methods of `Animal`
		2. `Bird bird1` - only methods of `Bird`

### Quiz 2: Application Runtime Quiz ###
### Interfaces and Abstracts (Optional Prerequisite) ###
1. New classes

		public class Chicken extends Bird {
			public Chicken(int age, String gender, int weightInLbs) {
				super(age, gender, weightInLbs);
			}

			// overriding = replace
			public void fly() {
				System.out.println("not able to fly...");
			}
		}

		public class Sparrow extends Bird {
			public Sparrow(int age, String gender, int weightInLbs) {
				super(age, gender, weightInLbs);
			}
		}

		public class Zoo {
			public static void main(String[] args) {
				Chicken chick1 = new Chicken(1, "W", 7);
				chick1.fly();
			}
		}

2. Interface: Contract - compulsory for class to implement its methods
	1. Flyable - Functionality abstracted away

			public interface Flyable {
				// abstract method
				public void fly();
			}

			public class Sparrow extends Bird implements Flyable {
				...

				@Override
				public void fly() {
					System.out.println("Sparrow flying high...");
				}
			}

### Abstract Classes (Optional Prerequisite) ###
1. Abstract class: it has abstract methods in it - it can only be extended but cannot be instantiated

		public abstract class Animal {
			...
			public abstract void move();
		}

	1. Used only for inheritance

			public class Fish extends Animal {
				...
				public void move() {
					System.out.println("Swim");
				}
			}

			public class Bird extends Animal {
				...
				public void move() {
					System.out.println("Flap wings");
				}
			}

			Animal sparrow1 = new Sparrow(1, "M", 4); // object is of type animal but variable is of type Animal
			sparrow1.move();

			Fish fish1 = new Fish(1, "M", 2);
			fish1.move();

			moveAnimal(fish1);
			moveAnimal(sparrow1);

			public static void moveAnimal(Animal animal) {
				animal.move(); // generic method
			}

	2. Polymorphism
		1. more dynamic
2. Interface:

		Flyable flyingBird = new Sparrow(1, "m", 4);
		flyingBird.fly(); // only method that is visible from our code

### Quiz 3: Interfaces and Abstract Classes ###
### Message From the Instructor ###
1. Repitition is the way to learn

## Object Oriented Design Principles (SOLID) ##
### Objects, Messages and Dependencies ###
1. Objects: have identity, have state, have behavior
	1. Objects carry out behvior in response to messages they receive
2. Think in terms of how objects behave during runtime
3. Concept:
	1. Methods defined in a class definition, represent the BEHAVIOR that instances of that class will have during RUNTIME
	2. This behavior is invoked by sending MESSAGES to that Object
4. Example:

		public class Vehicle {
			public void startEngine() { // message
				System.out.println("Starting my Engine"); // behavior
			}
			public void stopEngine(){
				System.out.println("Stopping my Engine");
			}
			public void accelerate(){
				System.out.println("Accelerating myself...");
			}
		}

		public class App {
			public static void main(String[] args) {
				Vehicle myCar = new Vehicle();
				myCar.accelerate();

				Vehicle anotherCar = new Vehicle();
				anotherCar.accelerate();
			}
		}

		public class Driver {
			public void drive(Vehicle raceCar) { // dependency - Driver depends on vehicle - Association
				raceCar.accelerate();
			}
		}

5. Association: Define relationship between classes
	1. Dependency association
	2. Composition association: Object composed of other objects
		1. If containing object siezes to exist, the other objects sieze to exist
		2. Example:

				public class Vehicle {
					Engine myEngine;

					public Vehicle(Engine anEngine) {
						myEngine = anEngine;
					}

					public void operateVehicle() {
						myEngine.start();
					}
		
					// other methods hidden ...
				}

			1. Vehicle owns Engine object
	3. Aggregation association
		1. SchoolLanguageDepartment </>-Composition-> SpanishCourse <>-Aggregation-> Student

				public class SchoolLanguageDepartment {
					SpanishCourse spanish; // Owns - Removed when Department is removed
					FrenchCourse french;
					HindiCourse hindi;
				}

				public class HistoryCourse {
					Student[] registeredStudents; // If course is removed Student is not removed
				}

### Forming Associations Between Objects ###
1. Example: Customer receiving newspapers from a newspaper company
	1. umlet
		1. Class: NewspaperCompany
		2. Class: Customer
		3. Flow: Newspaper Flow (arrow points towards dependency)
					
									stopPaperDelivery()
				[NewspaperCompany]<----------------------[Customer]

				public class Customer {
					NewsPaperCompany paperCompany;

					public void setNewsPaperCompany(NewsPaperCompany aPaperCompany) {
						paperCompany = aPaperCompany;
					}

					public void cancelSubscription() {
						paperCompany.stopPaperDelivery();
					}
				}

### Overview of Software Design ###
1. Hospital Employee Management System
	1. Hire and Terminate Employees
	2. Print Reports (XML, CSV format)
2. Problem statement: Big picture view of what needs to be delivered to the user of the system
3. Design: No Design and Over Design are bad
	1. System should be able to change
		1. Develop Iteratively - Engage business users all the way
	2. Keep things simple
		1. Nurses, Doctors, Staff - employees
	3. Class names should be nouns based on their intent

### Single Responsibility Principle ###
1. Wrong class diagram

		Employee
			id: long
			name: String
			department: String
			working: boolean
			
			saveEmployeeToDatabase() - not a behavior of employee
			printEmployeeDetailReportXML() - not a behavior of employee
			printEmployeeDetailReportCSV() - not a behavior of employee
			terminateEmployee() - not a behavior of employee

	1. Single Responsibility Principle: A class should have only single reason to change
		1. Problems with above class: responsible for too many things
			1. If database changes all classes containing database code should be modified
			2. If report formats change the methods have to be changed
2. Dont Repeat Yourself (DRY)
	1. If requirement changes, only single place needs modifiation (we don't have too change many classes)

### UML Diagram - Single Responsibility ###
1. Classes
	1. ReportFormatter (formatting)
		1. convertObjectToXML(Object object) : String
		2. convertObjectToCSV(Object object) : String
		3. getFormattedValue() : String
	2. EmployeeReportFormatter (formatting) - inherits from ReportFormatter
		1. anEmployee : Employee
		2. formatType : FormatType
		3. getFormattedEmployee()
	3. Employee (POJO)
		1. id : long
		2. name : String
		3. department : String
		4. working : boolean
	4. EmployeeDAO (saving and deleting employees in database)
		1. connectionManager : DatabaseConnectionManager
		2. saveEmployee(Employee emp)
		3. deleteEmployee(Employee emp)
	5. DatabaseConnectionManager (manages database connections)
		1. getManagerInstance() : DatabaseConnection
		2. connect()
		3. getConnectionObject()
		4. disconnect()
2. ClientModule (instantiates EmployeeReportFormatter, Employee, EmployeeDAO)
	1. hireNewEmployee(Employee emp)
	2. terminateEmployee(Employee emp)
	3. printEmmployeeReport(Employee emp)
3. User -> Our Application in the Physical World

### Single Responsibility - Homework ###
1. Employee

		public class Employee {
			private long id;
			private String name;
			private String department;
			private boolean working;

			// constructor
			
			// getters and setters

			// toString - generate
		}

		public class EmployeeDAO {
			public void saveEmployee(Employee employee) {
				DatabaseConnectionManager connectionManager = DatabaseConnectionManager.getManager();
				connectionManager.connect();
				connectionManager.getConnectionObject().prepareStatement("insert into employee_tbl");
				connectionManager.disconnect();
				System.out.println("Saved employee to the database: " + employee);
			}

			public void deleteEmployee(Employee employee) {
				System.out.println("Deleted employee from the database");
			}
		}

		public class DatabaseConnectionManager {
			private Connection connection;

			...
		}

		public class ClientModule { // too much responsibility
			public static void main(String[] args) {
				Employee peggy = new Employee(1, "peggy", "accounting", true); // HR Module, tightly coupled to Employee
				ClientModule.hireNewEmployee(peggy); // HR Module
				printEmployeeReport(peggy, FormatType.XML); // Reporting Module
				// Interface for user
			}

			public static void hireNewEmployee(Employee employee) {
				EmployeeDAO employeeDAO = new EmployeeDAO();
				employeeDAO.saveEmployee(employee);
			}

			public static void terminateEmployee(Employee employee) {
				EmployeeDAO employeeDAO = new EmployeeDAO(); // instantiation again and again
				employeeDAO.deleteEmployee(employee);
			}

			public static void printEmployeeReport(Employee employee, FormatType formatType) {
				EmployeeReportFormatter formatter = new EmployeeReportFormatter(employee, formatType);
				System.out.println(formatter.getFormattedEmployee());
			}
		}

		public enum FormatType {
			CSV, XML
		}

		public class ReportFormatter {

			String formattedOutput;

			public ReportFormatter(Object object, FormatType formatType) {
				switch(formatType) {
				case XML: 
					formattedOutput = convertObjectToXML(object);
					break;
				case CSV: 
					formattedOutput = convertObjectToCSV(object);
				}
			}

			private String convertObjectToXML(Object object) {
				return "XML: <title>" + object.toString() + "</title>";
			}

			private String convertObjectToCSV(Object object) {
				return "CSV: ,,, " + object.toString() + ",,,,"; 
			}

			public String getFormattedValue() {
				return formattedOutput;
			}
		}

		public class EmployeeReportFormatter extends ReportFormatter {
			public EmployeeReportFormatter(Employee employee, FormatType formatType) {
				super(employee, formatType);
			}

			public String getFormattedEmployee() {
				return getFormattedValue();
			}
		}

### Quiz 4: Quiz on Single Responsibility Pinciple ###
### Open Closed Principle & STRATEGY Pattern ###
1. Software Modules should be open to extension and closed for modification
	1. New functionality should need minimal changes to already tested and working code
	2. Closest to testing: when unit tests are passing for existing functionality, the cost of modifying the code and tests as well
	3. Saves from fragile design
2. Example: `work()` changes with employee
	1. Nurse: `checkVitals()`
	2. Doctor: `diagnose()`, `prescribeMeds()`
3. Example: Nurse

		public class Nurse extends Employee {
			public Nurse(int id, String name, String department, boolean working) {
				super(id, name, department, working);
				System.out.println("Nurse is instantiated...");
			}
		}

		public class Doctor extends Employee {
			public Doctor(int id, String name, String department, boolean working) {
				super(id, name, department, working);
				System.out.println("Doctor is instantiated...");
			}
		}

		public class HospitalManagement {

			public void callUpon(Employee employee) { // responsiblity problem
				if (employee instanceof Nurse) {
					checkVitalSigns();
					drawBlood();
					cleanPatientArea();
				} else if (employee instnaceof Doctor) {
					prescribeMedicine();
					diagnosePatients();
				}
			}

			// Nurses
			private void checkVitalSigns() {
				System.out.println("Check vitals...");
			}
		
			private void drawBlook() {
				System.out.println("draw blood...");
			}

			private void cleanPatientArea() {
				System.out.println("Clean patient area...");
			}

			// Doctors
			private void prescribeMedicine() {
				System.out.println("Prescribe medicine...");
			}

			private void diagnosePatients() {
				System.out.println("Diagnose Patients...");
			}
		}

		public class EmergencyRoomProcess {
			public static void main(String[] args) {
				HospitalManagement ERDirector = new HospitalManagement();
				Employee peggy = new Nurse(1, "Peggy", "emergency", true);
				ERDirector.callUpon(peggy);
				Employee suzan = new Doctor(2, "Suzan", "emergency", true);
				ERDirector.callUpon(suzan);
			}
		}

	1. Employee behaviour should be in Employee object
	2. Violates OCP - needs modification to support other employees doing work in the hospital
	3. Solution:

			public abstract class Employe {
				...
				public abstract void performDuties();
			} 

			public class Nurse extends Employee {
				public Nurse(int id, String name, String department, boolean working) {
					super(id, name, department, working);
					System.out.println("Nurse in action...");
				}

				private void checkVitalSigns() {
					System.out.println("Checking Vitals");
				}

				private void drawBlood() {
					System.out.println("draw blood...");
				}

				private void cleanPatientArea() {
					System.out.println("clean patient area...");
				}

				public void performDuties() {
					checkVitalSigns();
					drawBlood();
					cleanPatientArea();
				}
			}

			public class Doctor extends Employee {
				public Doctor(int id, String name, String department, boolean working) {
					super(id, name, department, working);
					System.out.println("Doctor in action...");
				}

				private void prescribeMedicines() {
					System.out.println("Prescribe medicines...");
				}

				private void diagnosePatients() {
					System.out.println("Diagnosing Patients...");
				}

				public void performDuties() {
					diagnosePatients();
					prescribeMedicines();
				}
			}

			public class HospitalManagement {
				public void callUpon(Employee employee) {
					employee.performDuties(); // will never change when new employees are added
				}
			}

		1. Another way:
			1. Interface `EmployeeWork` has `performDuties`
		2. Strategy pattern: Algorithm varies at runtime
		3. Unit tests for HospitalManagement will not change

### Open Closed Principle - Homework ###
1. Programming a Remote Control:
	1. Model Home Entertainment system
		1. Single remote control: used by user to control multiple digital devices such as TV or sound system
		2. One controller: connects to multiple devices (singleton design pattern)
	2. Tasks:
		1. RemoteControl class with 3 methods
			1. Choosing device to connect to (static method)
			2. Turn on the device
			3. Turn off the device
		2. Projector class (based on one interface)
		3. TV class (based on same interface)
		4. SurroungSoundSystem (based on same interface)
		5. Person class (user of home entertainment system)
			1. Main method: initialize devices, connect to the devices, turn on of off
	3. Open Closed principle: Remote control must not be modified to add more devices
	

### Quiz 5: Quiz on the Open Closed Principle ###
### Dependency Inversion + TEMPLATE Pattern ###
1. World confirms to DIP:
	1. Violation of DIP: When higher level modules depend on lower level ones susceptible to change
		1. Dangers of coupling:
			1. Dependencies is created when Single responsiblity principle is applied (because one object may depend on the other)
		2. How level modules should not depend on low level modules
			1. Both should depend on abstractions (not depend on details but details should depend on abstraction)
	2. Why does it work?
		1. Abstract classes and interfaces don't change as often as concrete derivatives
		2. Abstract methods are contracts
		3. Design principle: Only depend on things that don't change often
2. Example: Device Manufacturing Factory - manufactures devices
	1. Steps for each:
		1. Assembly
		2. Testing
		3. Packaging
		4. Storage
	2. Design for Smartphones and Laptops
		1. GeneralManufacturingProcess - Abstract class
		2. should encapsulate the manufacturing flow in the correct order

### Dependency Inversion & Template pattern - Homework Solution ###
1. Think top down: abstract classes/ interfaces to detailed classes
2. Implementation:

		package processes;

		public abstract class GeneralManufacturingProcess {
			private String processName;
			public GeneralManufacturingProcess(String name) {
				this.processName = processName;
			}
			protected abstract void assembleDevice();
			protected abstract void testDevice();
			protected abstract void packageDevice();
			protected abstract void storeDevice();
			public void launchProcess() {
				if (processName != null && !processName.isEmpty()) {
					assembleDevice();
					testDevice();
					packageDevice();
					storeDevice();
				} else {
					System.out.println("no process name was specified");
				}
			}
		}

		package processes;

		public class SmartphoneManufacturingProcess extends GeneralManufacturingProcess {
			// constructor

			protected void assembleDevice() {
				System.out.println("Assemble Smartphone");
			}
			protected void testDevice() {
				System.out.println("Test Smartphone");
			}
			protected void packageDevice() {
				System.out.println("Package Smartphone");
			}
			protected void storeDevice() {
				System.out.println("Store Smartphone");
			}
		}

		package processes;

		public class LaptopManufacturingProcess extends GeneralManufacturingProcess {
			// constructor

			protected void assembleDevice() {
				System.out.println("Assemble Laptop");
			}
			protected void testDevice() {
				System.out.println("Test Laptop");
			}
			protected void packageDevice() {
				System.out.println("Package Laptop");
			}
			protected void storeDevice() {
				System.out.println("Store Laptop");
			}
		}

		package clients;
		
		public class DeviceFactory {
			public static void main(String[] args) {
				GeneralManufacturingProcess manufacturer = new SmartphoneManufacturingProcess("Iphone");
				manufacturer.launchProcess();
			}
		}

	1. Classes related should be packaged together (single responsiblity)
		1. Package should have a single feature

### UML Diagram - Dependency Inversion ###
### Quiz 6: Quiz on Dependency Inversion Principle ###
### Liskov Substitution Principle ###
1. Principle: Subtypes must be substitutable for their basetypes
	1. Dependencies can be substituted with subclasses without the dependent class knowing about the change
		1. Inheritance is based on `is a` relationship
2. Example:
	1. Teacher: `+teach()`, `-makeAnnouncements()`, `-takeAttendence()`, `-collectPaperWork()`, `-conductHallwayDuties()`, `+performOtherResponsibilities()`
		1. MathTeacher
			1. `+teach()`
		2. ScienceTeacher
			1. `+teach()`
		3. EnglishTeacher
			1. `+teach()`
		4. SubstituteTeacher: Does not teach (LSP violation)
			1. Does not belong here or else

					@Override
					public void teach() throws CannotTeachException { // illegal because we have to change Teacher
						// do nothing...
						throw new CannotTeachException();
					}
		
		5. Solution: Pull out SubstituteTeacher
			1. <<interface>> CourseInstructor: +teach()
		
					public interface CourseInstructor {
						public void teach();
					}

					public class SchoolStaff {
						private void makeAnnouncements() {

						}

						private void takeAttendence() {

						}

						private void collectPaperWork() {

						}

						private void conductHallwayDuties() {

						}

						public void performOtherResponsibilities() {
							makeAnnouncements();
							takeAttendence();
							collectPaperWork();
							conductHallwayDuties();
						}
					}

					public class ScienceTeacher extends SchoolStaff implements CourseInstructor {
						...
						@Override
						public void teach() {

						}
					}

					public class MathTeacher extends SchoolStaff implements CourseInstructor {
						...
						@Override
						public void teach() {

						}
					}

					public class EnglishTeacher extends SchoolStaff implements CourseInstructor {
						...
						@Override
						public void teach() {

						}
					}

### Liskov Substitution Princple UML ###
### Quiz 7: Quiz on Liskov Substitution Principle ###
### Interface Segregation Principle ###
1. No clients should be forced to depend on methods they don't use
	1. Fat class: Class with too many responsibilities
		1. Solution: break it into different interfaces
2. Example:
	1. CustomerTransaction:
		1. `getName()`
		2. `getDate()`
		3. `getProductBreakdown()`
		4. `prepareInvoice()`
		5. `chargeCustomer()`
	2. TransactionReportGenerator:
		1. Uses `getName()`, `getDate()`, `getProductBreakdown()`
	3. AccountsReceivable
		1. Uses `prepareInvoice()`, `chargeCustomer()`
	4. Problem: If `chargeCustomer()` is changed to `chargeCustomer(String arg)` - AccountsReceivable (which does not use it) needs to be recompiled and redeployed
	5. Solution: Define interfaces between the classes and put only those methods that are specific
3. Implementation:

		public class CustomerTransaction {
			private List<Product> products;
			private Customer customer;

			public CustomerTransaction(Customer customer, List<Product> products) {
				this.products = products;
				this.customer = customer;
			}

			// methods for reporting
			public String getName() {
				return "name";
			}

			public Date getDate() {
				return new Date();
			}

			public String productBreakDown() {
				String reportListing;
				for (Product product: products) {
					resportListing += product.getProductName();
				}
				return reportListing;
			}

			public void prepareInvoice() {
				System.out.println("Invoice prepare");
			}

			public void chargeCustomer() {
				System.out.println("Charge customer");
			}
		}

		public class AccountsReceivable {
			private Accounting transactionObject;

			public AccountsReceivable(Accoutning aTransaction) {
				transactionObject = aTransaction;
			}

			public void postPayment() {
				transactionObject.chargeCustomer();
			}

			public void sendInvoice() {
				transactionObject.prepareInvoice();
			}
		}

		public class ReportGenerator {
			private Reporting transactionObject;

			public void generateReport() {
				System.out.println(transactionObject.getName() + " " + transactionObject.productBreakDown() + " " + transactionObject.getDate());
			}
		}

		public interface Accounting {
			public void prepareInvoice();
			public void chargeCustomer();
		}

		public interface Reporting {
			public String getName();
			public Date getDate();
			public String productBreakDown();
		}

		public class Product {
			private int productId;
			private String productName;

			// getters and setters
		}

### UML Diagram - Interface Segregation ###
### Quiz 8: Quiz on Interface Segregation Principle ###

## Object Oriented Design Patterns in Practice ##
### Dependency Injection Part 1 ###
1. Object is a runtime concept
2. To provide different instances dynamically
3. DI:
	1. Separates construction from its use
	2. Objects should not instantiate each other because it leads to tight coupling
	3. Spring DI: Spring container handles this
		1. Config file: Instructions for constructing objects
4. Example:
	1. Engine

			public interface Engine {
				public void startEngine();
			}

			public class SmallEngine implements Engine {
				private int horsePower;

				public SmallEngine(int horsePower) {
					this.horsePower = horsePower;
				}

				@Override
				public void startEngine() {
					System.out.println("Started small " + horsePower + " hp engine");
				}
			}

			public class LargeEngine implements Engine {
				private int horsePower;

				public LargeEngine(int horsePower) {
					this.horsePower = horsePower;
				}

				@Override
				public void startEngine() {
					System.out.println("Started large " + horsePower + " hp engine");
				}
			}

			public class Vehicle {
				Engine racingEngine = new LargeEngine(500); // hardcoded dependency

				public void crankIgnition() {
					racingEngine.startEngine();
					System.out.println("Vehicle is running");
				}
			}

	2. Solution:

			public class Vehicle {
				Engine myEngine;

				public Vehicle(Engine anEngine) {
					myEngine = anEngine;
				}

				...
			}

			public static void main(String[] args) {
				Vehicle raceCar = new Vehicle(new LargeEngine(500)); // dependency is injected
				raceCar.crankIgnition();
			}

	3. Example: Vehicle

			public class Vehicle {
				Engine myEngine;
				Tyre[] tyres;
				...
			}

		1. Problem: Many dependencies have to be injected manually.
		2. Solution: Framework to handle DI

### Dependency Injection Part 2 (Using Spring) ###
1. Download Maven plugin in Eclipse
2. New Maven project
	1. Create a simple project
	2. fill out the attributes
	3. Copy Vehicle example to src/main/java
		1. vehicle.Vehicle
		2. parts.Engine, ...
		3. clients.App
	4. pom.xml (project.spring.io - simple project - dependency)
		
			<dependencies>
				<dependency>
					<groupId>org.springframework</groupId>
					<artifactId>spring-context</artifactId>
					<version>4.1.0.RELEASE</version>
				</dependency>
			</dependencies>

	5. applicationContext.xml

			<?xml ...?>
			<beans ...>
			
				<bean id="smallEngine" class="parts.SmallEngine">
					<constructor-arg value="150" />
				</bean>

				<bean id="largeEngine" class="parts.LargeEngine">
					<constructor-arg value="400" />
				</bean>
	
				<bean id="mrBeansCar" class="vehicles.Vehicle">
					<constructor-arg ref="smallEngine" />
				</bean>

			</beans>

	6. App

			public static void main(String[] args) {
				ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
				Vehicle aCar = (Vehicle) context.getBean("mrBeansCar"); // only get the bean, dependencies are instantiated automatically
				aCar.crankIgnition();
			}

### Observer Pattern ###
1. Formal definition: The observer pattern is a software design pattern in which an object, called the subject, maintains a list of dependents, called observers, and notifies them automatically of any state changes, usually by calling one of their methods.
	1. An object (observer) can register to another object (subject). If changes takes place, observer would be notified
	2. Used to notify objects of state changes
	3. Subject maintains a list of observers and calls observer's methods to notify them
2. Employee Management System: maintains employee information
	1. Subject: EmployeeManagementSystem
		1. Employee
		2. observerList
		3. notifyAllDepartments
	2. IObserver:
		1. HRDepartment
		2. PayrollDepartment

### Observer Pattern - Homework Solution ###
### UML Diagram - Observer Pattern ###
### Coffee Shop Assignment (another application of the observer pattern) ###


### Builder Pattern ###
1. Useful when a constructor has a large number of arguments

		public class User {
			private String userName; // mandatory
			private String emailAddress; // mandatory

			private String firstName; // optional
			private String lastName;
			private int phoneNumber;
			private String address;

			// constructor
			public User(String userName, String emailAddress) {
				this.userName = userName;
				this.emailAddress = emailAddress;
			}

			public User(String userName, String emailAddress, String firstName, String lastName) {
				// ...
			}

			// constructor with all fields
		}

		public class App {
			public static void main(String[] args) {
				
			}
		}

	1. Telescoping constructor anti-pattern - multiple overloaded functions
		1. A solution: default constructor with setters and getters (not threadsafe)
		2. Better solution: builder pattern

				// inner class
				public static class Builder {
					private String userName; // mandatory
					private String emailAddress; // mandatory

					private String firstName; // optional
					private String lastName;
					private int phoneNumber;
					private String address;

					public Builder(String userName, String email) {
						// ...
					}

					public Builder firstName(String value) {
						this.firstName = value;
						returns this;
					}

					public Builder lastName(String value) {
						this.lastName = value;
						returns this;
					}

					public User build() {
						return new User(this);
					}
				}
				...
				private User(Builder builder) {
					this.userName = builder.userName;
					this.emailAddress = builder.emailAddress;
					this.firstName = builder.firstName;
					this.lastName = builder.lastName;
					this.phoneNumber = builder.phoneNumber;
					this.address = builder.address;
				}


				public static void main(String[] args) {
					User websiteUser = new User.Builder("bobMax", "bobMax@gmail.com").firstName("bob").lastName("Max").build();
					System.out.println(websiteUser);
				}
	
2. HW: Vehicle object:

		Vehicle car = new Vehicle.Builder()
		.price(10300.76)
		.type("car")
		.make("Honda")
		.horsePower(150)
		.model("Accord")
		.color("red")
		.doors(4)
		.build();

### Factory Design Pattern ###
1. Why?
	1. Another class is used for creation of objects
	2. Clients don't have to know the details of how the objects are being created
	3. Client can deligate the responsibility of object creation to factory class
2. Example:
	1. Vehicle: Interface - startEngine()
		1. Bus:
		2. Truck
		3. Car
		4. ElectricCar
	2. VehicleFactory - getVehicle(String v)

			public class VehicleFactory {
				public static final String CAR = "car";
				public static final String TRUCK = "truck";
				public static final String BUS = "bus";
				public static final String ELECTRIC_CAR = "electric car";

				public Vehicle getVehicle(String vehicleType) {
					if (vehicleType.equalsIgnoreCase(VehicleFactory.CAR)) {
						return new Car();
					} else if (vehicleType.equalsIgnoreCase(VehicleFactory.TRUCK)) {
						return new Truck();
					} else if (vehicleType.equalsIgnoreCase(VehicleFactory.BUS)) {
						return new Bus();
					} else if (vehicleType.equalsIgnoreCase(VehicleFactory.ELECTRIC_CAR)) {
						return new ElectricCar();
					}
					return null;
				}
			}

			public class App {
				public static void main(String[] args) {
					VehicleFactory vehicleFactory = new VehicleFactory();

					Vehicle vehicle = vehicleFactory.getVehicle(VehicleFactory.ELECTRIC_VEHICLE);
					vehicle.startEngine();
				}
			}

	3. Enum Type:

			public enum VehicleType {
				TRUCK {
					public Vehicle getVehicle() {
						return new Truck();
					}
				},
				CAR {
					public Vehicle getCar() {
						return new Car();
					}
				},
				ELECTRIC {
					public Vehicle getVehicle() {
						return new ElectricCar();
					}
				};

				abstract Vehicle getVehicle();
			}

			...

			public Vehicle getVehicle(VehicleType vehicleType) {
				return vehicleType.getVehicle();
			}

### UML Diagram - Factory Pattern ###
### Singleton Design Pattern (Newly Added) ###
1. Singleton is instantiated exactly once
	1. Single stadium but several performances

			public class PerformanceStage {

				private static PerformanceStage INSTANCE = null;
				private static int counter;

				// private constructor for singleton
				private PerformanceStage() {
					counter++;
				}

				public synchronized static PerformanceStage getInstance() { // thread safe
					if(INSTANCE == null) {
						INSTANCE = new PerformanceStage();
					}
					return INSTANCE;
				}	

				public void turnOnLights() {
					System.out.println("turn on lights...");
				}	

				public int getCounter() {
					return counter;
				}		
			}

			public class App {
				public static void main(String[] args) {
					PerformanceStage stage = PerformanceStage.getInstance();
					stage.turnOnLights();
					System.out.println(stage.getCounter());

					PerformanceStage stage2 = PerformanceStage.getInstance();
					stage2.turnOnLights();
					System.out.println(stage2.getCounter());
				}
			}

### Real world Project - Create an API ###
1. (https://www.jobreadyprogrammer.com/blog/311318/oop-api-assignment)[https://www.jobreadyprogrammer.com/blog/311318/oop-api-assignment]

## Course Extras! ##
### Automatically generate UML diagrams from java code Tutorial ###
1. Tool: ObjectAid - Installation: URL, 
	1. Eclipse: Install New Software...
		1. Paste URL
		2. Select CheckAid Class Diagram (other diagrams may need license)
		3. Restart eclipse
2. Right click on project > New > Other > ObjectAid UML
	1. Name: FactoryDiagram
	2. Copy the classes and put them in the file
3. Good for studying existing code 

### Final Comments from Instructor ###
1. [eliminatecodefear.com](eliminatecodefear.com) - weekly assignments

### Bonus Lecture: Lifetime Access to All My Courses ###
1. [CLICK HERE FOR THE DISCOUNT](http://www.eliminatecodefear.com/p/all-access-pass/?product_id=87071&coupon_code=100-OFF&preview=logged_out)

### 1-on-1 Skype Session with Mr. Imtiaz Ahmad ###
1. [1-on-1 Skype session with Mr. Imtiaz Ahmad - Appointment](https://squareup.com/appointments/book/YSHG9K5BWYCMB/skype-call-with-imtiaz-ahmad)