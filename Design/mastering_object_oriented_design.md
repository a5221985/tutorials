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

### Java Behind The Scenes ###
### Class Inheritence (Optional Prerequisite) ###
### Quiz 2: Application Runtime Quiz ###
### Interfaces and Abstracts (Optional Prerequisite) ###
### Abstract Classes (Optional Prerequisite) ###
### Quiz 3: Interfaces and Abstract Classes ###
### Message From the Instructor ###

## Object Oriented Design Principles (SOLID) ##
### Objects, Messages and Dependencies ###
### Forming Associations Between Objects ###
### Overview of Software Design ###
### Single Responsibility Principle ###
### UML Diagram - Single Responsibility ###
### Quiz 4: Quiz on Single Responsibility Pinciple ###
### Open Closed Principle & STRATEGY Pattern ###
### Open Closed Principle - Homework ###
### Quiz 5: Quiz on the Open Closed Principle ###
### Dependency Inversion + TEMPLATE Pattern ###
### Dependency Inversion & Template pattern - Homework Solution ###
### UML Diagram - Dependency Inversion ###
### Quiz 6: Quiz on Dependency Inversion Principle ###
### Liskov Substitution Principle ###
### Liskov Substitution Princple UML ###
### Quiz 7: Quiz on Liskov Substitution Principle ###
### Interface Segregation Principle ###
### UML Diagram - Interface Segregation ###
### Quiz 8: Quiz on Interface Segregation Principle ###

## Object Oriented Design Patterns in Practice ##
### Dependency Injection Part 1 ###
### Dependency Injection Part 2 (Using Spring) ###
### Observer Pattern ###
### Observer Pattern - Homework Solution ###
### UML Diagram - Observer Pattern ###
### Coffee Shop Assignment (another application of the observer pattern) ###
### Builder Pattern ###
### Factory Design Pattern ###
### UML Diagram - Factory Pattern ###
### Singleton Design Pattern (Newly Added) ###
### Real world Project - Create an API ###

## Course Extras! ##
### Automatically generate UML diagrams from java code Tutorial ###
### Final Comments from Instructor ###
### Bonus Lecture: Lifetime Access to All My Courses ###
### 1-on-1 Skype Session with Mr. Imtiaz Ahmad ###