### General Design Patterns
##### Abstract Factory Pattern

![abstractfactory_pattern_uml_diagram](abstractfactory_pattern_uml_diagram.jpg)

1. Introduction
	1. Super factory is used to create other factories
	2. It is a creational pattern
	3. Interface is used for creating factory of related objects without specifying classes
2. Implementation
	1. Shape: *Interface*
	2. Color: *Interface*
	3. AbstractFactory: *Abstract Factory Class*
	4. ShapeFactory: Extends AbstractFactory
	5. FactoryProducer: Return AbstractFactory object
	5. AbstractFactoryPatternDemo: Uses FactoryProducer to get AbstractFactory object
3. `Shape.java`

		public interface Shape {
			void draw();
		}
		
4. `Rectangle.java`

		public class Rectangle implements Shape {
			@Override
			public void draw() {
				System.out.println("Inside Rectangle::draw() method.");
			}
		}
		
5. `Square.java`

		public class Square implements Shape {
			@Override
			public void draw() {
				System.out.println("Inside Square::draw() method.");
			}
		}
		
6. `Circle.java`

		public class Circle implements Shape {
			@Override
			public void draw() {
				System.out.println("Inside Circle::draw() method.");
			}
		}
		
7. `Color.java`

		public interface Color {
			void fill();
		}
		
8. `Green.java`

		public class Green implements Color {
			@Override
			public void fill() {
				System.out.println("Inside Green::fill() method.");
			}
		}
		
9. `Blue.java`

		public class Blue implements Color {
			@Override
			public void fill() {
				System.out.println("Inside Blue::fill() method.");
			}
		}
		
10. Abstract class to get factories for `Color` and `Shape`

		public abstract class AbstractFactory {
			abstract Color getColor(String color);
			abstract Shape getShape(String shape);
		}
		
11. Factory classes which extend AbstractFactory for Shape type objects and Color type objects

		public class ShapeFactory extends AbstractFactory {
			@Override
			public Shape getShape(String shapeType) {
				if(shapeType == null) {
					return null;
				}		
				
				if(shapeType.equalsIgnoreCase("CIRCLE")) {
					return new Circle();
				} else if(shapeType.equalsIgnoreCase("RECTANGLE")) {
					return new Rectangle();
				} else if(shapeType.equalsIgnoreCase("SQUARE")) {
					return new Square();
				}
				
				return null;
			}
			
			@Override
			Color getColor(String color) {
				return null;
			}
		}
		
		public class ColorFactory extends AbstractFactory {
			@Override
			public shape getShape(String shapeType) {
				return null;
			}
			
			@Override
			Color getColor(String color) {
				if(color == null) {
					return null;
				}
				
				if(color.equalsIgnoreCase("RED")) {
					return new Red();
				} else if(color.equalsIgnoreCase("GREEN")) {
					return new Green();
				} else if(color.equalsIgnoreCase("BLUE")) {
					return new Blue();
				}
				
				return null;
			}
		}
		
12. FactoryProducer that produces Factory based on Shape or Color

		public class FactoryProducer {
			public static AbstractFactory getFactory(String choice) {
				if(choice.equalsIgnoreCase("SHAPE")) {
					return new ShapeFactory();
				} else if(choice.equalsIgnoreCase("COLOR")) {
					return new ColorFactory();
				}
				
				return null;
			}
		}

13. AbstractFactoryPatternDemo.java

		public class AbstractFactoryPatternDemo {
			public static void main(String[] args) {
				//get shape factory
				AbstractFactory shapeFactory = FactoryProducer.getFactory("SHAPE");
				
				//get an object of Shape Circle
				Shape shape1 = shapeFactory.getShape("CIRCLE");
				
				//call draw method of Shape Circle
				shape1.draw();
				
				//get an object of Shape Rectangle
				Shape shape2 = shapeFactory.getShape("RECTANGLE");
				
				//call draw method of Shape Rectangle
				shape2.draw();
				
				//get an object of Shape Square
				Shape shape3 = shapeFactory.getShape("SQUARE");
				
				//call draw method of Shape Square
				shape3.draw();
				
				//get color factory
				AbstractFactory colorFactory.getFactory("COLOR");
				
				//get an object of Color Red
				Color color1 = colorFactory.getColor("RED");
				
				//call fill method of Red
				color1.fill();
				
				//get an object of Color Green
				Color color2 = colorFactory.getColor("GREEN");
				
				//call fill method of Green
				color2.fill();
				
				//get an object of Color Blue
				Color color3 = colorFactory.getColor("BLUE");
				
				//call fill method of Color Blue
				color3.fill();
			}
		}
		
##### Singleton Pattern

![singleton_pattern_uml_diagram](singleton_pattern_uml_diagram.jpg)

1. Introduction
	1. It is a creational pattern
	2. A single class used to create object and makes sure only one object is created.
	3. We can access the class's only object without explicit instantiation
2. Implementation
	1. `SingleObject`: has a static method that provides its own static instance.
3. Steps:
	1. `SingleObject.java`
	
			public class SingleObject {
				//creation of an object of SingleObjet
				private static SingleObject instance = new SingleObject();
				
				//make the constructor private so that this class cannot be
				//instantiated
				private SingleObject() {}
				
				//Get the only object available
				public static SingleObject getInstance() {
					return instance;
				}
				
				public void showMessage() {
					System.out.println("Hello World!");
				} 
			
			}
			
	2. `SingletonPatternDemo.java`
	
			public class SingletonPatternDemo {
				public static void main(String[] args) {
					//illegal construct
					//Compile Time Error: The constructor SingleObject() is not visible
					//SingleObject object = new SingleObject();
					
					//Get the only object available
					SingleObject object = SingleObject.getInstance();
					
					//show the message
					object.showMessage();
				}
			}
			
##### Builder Pattern

![](builder_pattern_uml_diagram.jpg)

1. Introduction
	1. Used to build complex objects from simple objects step by step
	2. It is a creational pattern
	3. Builder class is used to build object step by step
	4. Builder class is independent of other objects
2. Implementation
	1. Example: 
		1. Consider a meal in fast food restaurant which is burger and cold drink.
		2. Burger can be veg or Chicken and is packed by a wrapper
		3. Cold drink is coke or pepsi and will be packed in bottle
		4. Implementation:
			1. Item: Interface which represents food item (burger or cold drink)
			2. Packing: Interface which represents packing for food item
			3. Meal: Class having ArrayList of Item
			4. MealBuilder: Class to build different types of Meal objects by combining Item
			5. BuilderPatternDemo: Demo class that used MealBuilder to build Meal
		5. Actual Classes:
			1. Item.java
			
					public interface Item {
						public String name();
						public Packing packing();
						public float price();
					}
					
			2. Packing.java
				
					public interface Packing {
						public String pack();
					}
			
			3. Wrapper.java
			
					public class Wrapper implements Packing {
						@Override
						public String pack() {
							return "Wrapper";
						}
					}
					
			4. Bottle.java
			
					public class Bottle implements Packing {
						@Override
						public String pack() {
							return "Bottle";
						}
					}
			
			5. Burger.java
			
					public abstract class Burger implements Item {
						@Override
						public Packing packing() {
							return new Wrapper();
						}
						
						//forces subclasses to provide an implementation for price()
						@Override
						public abstract float price();
					}
					
			6. ColdDrink.java
			
					public abstract class ColdDrink implements Item {
						@Override
						public Packing packing() {
							return new Bottle();
						}
						
						@Override
						public abstract float price();
					}
					
			7. VegBurger.java
			
					public class VegBurger extends Burger {
						@Override
						public float price() {
							return 25.0f;
						}
						
						@Override
						public String name() {
							return "Veg Burger";
						}
					}
					
			8. ChickenBurger.java
			
					public class ChickenBurger extends Burger {
						@Override
						public float price() {
							return 50.0f;
						}
						
						@Override
						public String name() {
							return "Chicken Burger";
						}
					}
					
			9. Coke.java
			
					public class Coke extends ColdDrink {
						@Override
						public float price() {
							return 30.0f;
						}
						
						@Override
						public String name() {
							return "Coke";
						}
					}
					
			10. Pepsi.java
			
					public class Pepsi extends ColdDrink {
						@Override
						public float price() {
							return 35.0f;
						}
						
						@Override
						public String name() {
							return "Pepsi";
						}
					}
					
			11. Meal.java
			
					import java.util.ArrayList;
					import java.util.List;
					
					public class Meal {
						private List<Item> items = new ArrayList<Item>();
						
						public void addItem(Item item) {
							items.add(item);
						}
						
						public float getCost() {
							float cost = 0.0f;
							for(Item item: items) {
								cost += item.price();
							}
							
							return cost;
						}
						
						public void showItems() {
							for(Item item: items) {
								System.out.println("Item: " + item.name());
								System.out.println(", Packing: " + item.packing().pack());
								System.out.println(", Price: " + item.price());
							}
						}
					}
					
			12. MealBuilder.java
			
					public class MealBuilder {
						public Meal prepareVegMeal() {
							Meal meal = new Meal();
							meal.addItem(new VegBurger());
							meal.addItem(new Coke());
							return meal
						}
						
						public Meal prepareNonVegMeal() {
							Meal meal = new Meal();
							meal.addItem(new ChickenBurger());
							meal.addItem(new Pepsi());
							return meal;
						}
					} 
					
			13. BuilderPatternDemo.java
			
					public class BuilderPatternDemo {
						public static void main(String[] args) {
							MealBuilder mealBuilder = new MealBuilder();
							
							Meal vegMeal = mealBuilder.prepareVegMeal();
							System.out.println("Veg Meal");
							vegMeal.showItems();
							System.out.println("Total Cost: " + vegMeal.getCost());
							
							Meal nonVegMeal = mealBuilder.prepareNonVegMeal();
							System.out.println("\n\nNon-Veg Meal");
							nonVegMeal.showItems();
							System.out.println("Total Cost: " + nonVegMeal.getCost());
						}
					}
					
##### Prototype Pattern
![prototype_pattern_uml_diagram](prototype_pattern_uml_diagram.jpg)

1. Introduction
	1. Creation of duplicate objects taking care of performance.
	2. It is a creational pattern
	3. Prototype interface: used for creating a clone of existing object.
	4. Purpose: Creation of objects is costly (time consuming)
	5. Example:
		1. Consider a costly database operation.
		2. The object can be cached and a clone of the object can be returned on next request.
		3. Database is updated when needed (reduces database calls)
2. Implementation 
	1. `Shape.java`: abstract class implementing `Cloneable` interface
	
			public abstract class Shape implements Cloneable {
				private String id;
				protected String type;
				
				abstract void draw();
				
				public String getType() {
					return type;
				}
				
				public String getId() {
					return id;
				}
				
				public void setId(int id) {
					this.id = id;
				}
				
				public Object clone() {
					Object clone = null;
					
					try {
						clone = super.clone();
					} catch(CloneNotSupportedException e) {
						e.printStackTrace();
					}
					
					return clone;
				}
			} 
			
	2. `Rectangle.java`
	
			public class Rectangle extends Shape {
				public Rectangle() {
					type = "Rectangle";
				}
				
				@Override
				public void draw() {
					System.out.println("Inside Rectangle::draw() method.");
				}
			}
			
	3. `Square.java`
	
			public class Square extends Shape {
				public Square() {
					tepe = "Square";
				}
				
				@Override
				public void draw() {
					System.out.println("Inside Square::draw() method.");
				}
			}
			
	4. `Circle.java`
	
			public class Circle extends Shape {
				public Circle() {
					type = "Circle";
				}
				
				@Override
				public void draw() {
					System.out.println("Inside Circle::draw() method.");
				}
			}
			
	5. `ShapeCache.java`: Class to get concrete classes from database and story them in Hashtable
	
			import java.util.Hashtable;
			
			public class ShapeCache {
				private static Hashtable<String, String> shapeMap = new Hashtable<String, Shape>();
				
				public static Shape getShape(String shapeId) {
					Shape cachedShape = shapeMap.get(shapeId);
					return (Shape) cachedShape.clone();
				}
				
				// for each shape run database query and create shape
				// shapeMap.put(shapeKey, shape);
				// for example, we are adding three shapes
				
				public static void loadCache() {
					Circle circle = new Circle();
					circle.setId("1");
					shapeMap.put(circle.getId(), circle);
					
					Square square = new Square();
					square.setId("2");
					shapeMap.put(square.getId(), square);
					
					Rectangle rectangle = new Rectangle();
					rectangle.setId("3");
					shapeMap.put(rectangle.getId(), rectangle);
				}
			}
			
	6. PrototypePatternDemo.java
	
			public class PrototypePatternDemo {
				public static void main(String[] args) {
					ShapeCache.loadCache();
					
					Shape clonedShape = (Shape) ShapeCache.getShape("1");
					System.out.println("Shape: " + clonedShape.getType());
				}
				
					Shape clonedShape2 = (Shape) ShapeCache.getShape("2");
					System.out.println("Shape: " + clonedShape2.getType());
					
					Shape clonedShape3 = (Shape) ShapeCache.getShape("3");
					System.out.println("Shape: " + clonedShape3.getType());
			}
			
##### Adapter Pattern

![adapter_pattern_uml_diagram](adapter_pattern_uml_diagram.jpg)

1. Introduction
	1. It is a bridge between two incompatible interfaces.
	2. It is a structural pattern
	3. A single class combines functionalities of independent/incompatible interfaces.
	4. Example: Card reader is adapter between memory card and laptop
2. Implementation
	1. MediaPlayer: Interface
	2. AudioPlayer: Implements MediaPlayer.
		1. It can play mp3 format audio files by default
	3. AdvancedMediaPlayer: Interface.
	4. Concrete class of AdvancedMediaPlayer: Can play mp4, vlc format
	5. Requirement: Make AudioPlayer to play other formats.
	6. MediaAdaper: implements MediaPlayer interface and uses AdvancedMediaPlayer objects to play the required format.
	7. AudioPlayer passes desired audio type to MediaAdapter (does not know the type of class that can play it)
3. Example implementation
	1. `MediaPlayer.java`
	
			public interface MediaPlayer {
				public void play(String audioType, String fileName);
			}
			
	2. `AdvancedMediaPlayer.java`
	
			public interface AdvancedMediaPlayer {
				public void playVlc(String fileName);
				public void playMp4(String fileName);
			}
			
	3. `VlcPlayer.java`
	
			public class VlcPlayer implements AdvancedMediaPlayer {
				@Override
				public void playVlc(String fileName) {
					System.out.println("Playing vlc file. Name: " + fileName);
				}
				
				@Override
				public void playMp4(String fileName) {
					//do nothing
				}
			}
			
	4. `Mp4Player.java`
	
			public class Mp4Player implements AdvancedMediaPlayer {
				@Override
				public void playVlc(String fileName) {
					//do nothing
				}
				
				@Override
				public void playMp4(String fileName) {
					System.out.println("Playing mp4 file. Name: " + fileName);
				}
			}
			
	5. `MediaPlayer.java`
	
			public class MediaAdapter implements MediaPlayer {
				AdvancedMediaPlayer advancedMusicPlayer;
				
				public MediaAdapter(String audioType) {
					if(audioType.equalsIgnoreCase("vlc")) {
						advancedMusicPlayer = new VlcPlayer();
					} else if(audioType.equalsIgnoreCase("mp4")) {
						advancedMusicPlayer = new Mp4Player();
					}
				}
				
				@Override
				public void play(String audioType, String fileName) {
					if(audoType.equalsIgnoreCase("vlc")) {
						advancedMusicPlayer.playVlc(fileName);
					}
					else if(audioType.equalsIgnoreCase("mp4")) {
						advancedMusicPlayer.playMp4(fileName);
					}
				}
			}
			
	6. `AudioPlayer.java`
	
			public class AudioPlayer implements MediaPlayer {
				MediaAdapter mediaAdapter;
				
				@Override
				public void play(String audioType, String fileName) {
					
					//inbuilt support to play mp3 music files
					if(audioType.equalsIgnoreCase("mp3")) {
						System.out.println("Playing mp3 file. Name: " + fileName);
					}
					
					//mediaAdapter is providing support to play other file formats
					else if(audioType.equalsIgnoreCase("vlc") || audioType.equalsIgnoreCase("mp4")) {
						mediaAdapter = new MediaAdapter(audioType);
						mediaAdapter.play(audioType, fileName);
					}
					
					else {
						System.out.println("Invalid media. " + audioType + " format not supported.");
					}
				}
			}
			
	7. `AdpaterPatternDemo.java`
	
			public class void main(String[] args) {
				AudioPlayer audioPlayer = new AudioPlayer();
				
				audioPlayer.play("mp3", "beyong the horizon.mp3");
				audioPlayer.play("mp4", "alone.mp4");
				audioPlayer.play("vlc", "far far away.vlc");
				audioPlayer.play("avi", "mind me.avi");
			}
			
##### Bridge Pattern
![bridge_pattern_uml_diagram](bridge_pattern_uml_diagram.jpg)

![Bridge_UML_class_diagram](Bridge_UML_class_diagram.svg)
1. Introduction
	1. Used to decouple abstraction from its implementation (two can vary independently).
	2. It is a structural pattern.
	3. A bridge structure is provided between abstract class and implementation class.
		1. Interface is the bridge.
		2. Interface implemnter classes are independent of concrete classes
	4. It is used when class and what it can do vary often.
		1. Class: abstraction
		2. What class can do: implementation
	5. It is two layers of abstraction
2. Implementation
	1. DrawAPI: bridge
		1. RedCircle: Concrete class
		2. GreenCircle: Concrete class
	2. Shape: Abstract class. Uses DrawAPI object.
	3. BridgePatternDemo
	4. Implementation Steps:
		1. `DrawAPI.java`
		
				public interface DrawAPI {
					public void drawCircle(int radius, int x, int y);
				}
				
		2. `RedCircle.java`
			
				public class RedCircle implements DrawAPI {
					@Override
					public void drawCircle(int radius, int x, int y) {
						System.out.println("Draw Circle[ color: red, radius: " + radius + ", x: " + x + ", " + y + "]");
					}
				}
				
		3. `GreenCircle.java`
			
				public class GreenCircle implements DrawAPI {
					@Override
					public void drawCircle(int radius, int x, int y) {
						System.out.println("Drawing Circle[ color: green, radius: " + radius + ", x: " + x + ", " + y + "]");
					}
				}
				
		4. `Shape.java`
		
				public abstract class Shape {
					protected DrawAPI drawAPI;
					
					protected Shape(DrawAPI drawAPI) {
						this.drawAPI = drawAPI;
					}
					
					public abstract void draw();
				}
			
		5. `Circle.java`
		
				public class Circle extends Shape {
					private int x, y, radius;
					
					public Circle(int x, int y, int radius, DrawAPI drawAPI) {
						super(drawAPI);
						this.x = x;
						this.y = y;
						this.radius = radius;
					}
					
					public void draw() {
						drawAPI.drawCircle(radius, x, y);
					}
				}
				
		6. `BridgePatternDemo.java`
		
				public class BridgePatternDemo {
					public static void main(String[] args) {
						Shape redCircle = new Circle(100, 100, 10, new RedCircle());
						Shape greenCircle = new Circle(100, 100, 10, new GreenCircle());
						
						redCircle.draw();
						greenCircle.draw();
					}
				}
				
##### Filter Pattern

![filter_pattern_uml_diagram](filter_pattern_uml_diagram.jpg)

1. Introduction
	1. Also called criteria pattern
	2. Used to filter objects using certain criteria.
	3. Filters are chained using logical operations.
	4. It is a structural pattern. (combines multiple patterns to obtain a single pattern)
2. Implementation
	1. Person: Object on which Criteria is applied
	2. Criteria: Interface to list of persons
	3. Implementation classes: Implement Criteria
	4. Steps:
		1. `Person.java`
		
				public class Person {
					private String name;
					private String gender;
					private String maritalStatus;
					
					public Person(String name, String gender, String maritalStatus) {
						this.name = name;
						this.gender = gender;
						this.maritalStatus = maritalStatus;
					}
					
					public String getName() {
						return name;
					}
					
					public String getGender() {
						return gender;
					}
					
					public String getMaritalStatus() {
						return maritalStatus;
					}
				}
	
		2. `Criteria.java`
		
				import java.util.List;
				
				public interface Criteria {
					public List<Person> meetCriteria(List<Person> persons);
				}
				
		3. `CriteraMale.java`
		
				import java.util.ArrayList;
				import java.util.List;
		
				public class CriteriaMale implements Criteria {
					@Override
					public List<Person> meetCriteria(List<Person> persons) {
						List<Person> malePersons = new ArrayList<Person>();
						
						for(Person person: persons) {
							if(person.getGender().equalsIgnoreCase("MALE")) {
								malePersons.add(person);
							}
						}
						
						return malePersons;
					}
				}
				
		4. `CriteriaFemale.java`
		
				import java.util.ArrayList;
				import java.util.List;
		
				public class CriteriaFemale implements Criteria {
					@Override
					public List<Person> meetCriteria(List<Person> persons) {
						List<Person> femalePersons = new ArrayList<Person>();
						
						for(Person person: persons) {
							if(person.getGender().equalsIgnoreCase("FEMALE")) {
								femalePersons.add(person);
							}
						}
						
						return femalePersons;
					}
				}
				
		5. `CriteriaSingle.java`
		
				import java.util.ArrayList;
				import java.util.List;
				
				public class CriteriaSingle implements Criteria {
					@Override
					public List<Person> meetCriteria(List<Person> persons) {
						List<Person> singlePersons = new ArrayList<Person>();
						
						for(Person person: persons) {
							if(person.getMaritalStatus().equalsIgnoreCase("SINGLE")) {
								singlePersons.add(person);
							}
						}
						
						return singlePersons;
					}
				}
				
		6. `AndCriteria.java`
		
				import java.util.List;
				
				public class AndCriteria implements Criteria {
					private Criteria criteria;
					private Criteria otherCriteria;
					
					public AndCriteria(Criteria criteria, Criteria otherCriteria) {
						this.criteria = criteria;
						this.otherCriteria = otherCriteria; 
					}
					
					@Override
					public List<Person> meetCriteria(List<Person> persons) {
						List<Person> firstCriteriaPersons = critiria.meetCriteria(persons);
						return otherCriteria.meetCriteria(firstCriteriaPersons);
					}
				}
				
		7. `OrCriteria.java`
		
				import java.util.List;
				
				public class OrCriteria implements Criteria {
					private Criteria criteria;
					private Criteria otherCriteria;
					
					public OrCriteria(Criteria criteria, Criteria otherCriteria) {
						this.criteria = criteria;
						this.otherCriteria = otherCriteria;
					}
					
					@Override
					public List<Person> meetCriteria(List<Person> persons) {
						List<Person> firstCriteriaItems = criteria.meetCriteria(persons);
						List<Person> otherCriteriaItems = otherCriteria.meetCriteria(persons);
						
						for(Person person: otherCriteriaItems) {
							if(!firstCriteriaItems.contains(person)) {
								firstCriteriaItems.add(person);
							}
						}
						
						return firstCriteriaItems;
					}
				}
				
		8. `CriteriaPatternDemo.java`
		
				public class CriteriaPatternDemo {
					public static void main(String[] args) {
						List<Person> persons = new ArrayList<Person>();
						
						persons.add(new Person("Robert", "Male", "Single"));
						persons.add(new Person("John", "Male", "Married"));
						persons.add(new Person("Laura", "Female", "Married"));
						persons.add("Diana", "Female", "Single");
						persons.add(new Person("Mike", "Male", "Single"));
						persons.add(new Person("Bobby", "Male", "Single"));
						
						Criteria male = new Criteria();
						Criteria female = new CriteriaFemale();
						Criteria single = new CriteriaSingle();
						Criteria singleMale = new AndCriteria(single, male);
						Criteria singleOrFemale = new OrCriteria(single, female);
						
						System.out.println("Males: ");
						printPersons(male.meetCriteria(persons));
						System.out.println("\nFemales: ");
						printPersons(female.meetCriteria(persons));
						
						System.out.println("\nSingle Males: ");
						printPersons(singleMale.meetCriteria(persons));
						
						System.out.println("\nSingle Or Females: ");
						printPersons(singleOrFemale.meetCriteria(persons));
					}
					
					public static void printPersons(List<Person> persons) {
						for(Person person: persons) {
							System.out.println("Person : [ Name: " + person.getName() + ", Gender : " + person.getGender() + ", Marital Status : " + person.getMaritalStatus() + " ]");
						}
					}
				}
				
##### Composite Pattern

![composite_pattern_uml_diagram](composite_pattern_uml_diagram.jpg)

1. Introduction
	1. Group of objects are treated as single object.
	2. Composite pattern composes of objects as tree structure.
	3. It is a structural pattern (tree structure)
	4. Class contains group of its own objects. Class has methods to modify its group of objects
2. Implementation
	1. Employee: composite pettern actor class
	2. CompositePatternDemo: uses Employee to add department level hierarchy
	3. Steps:
		
			import java.util.ArrayList;
			import java.util.List;
			
			public class Employee {
				private String name;
				private String dept;
				private int salary;
				private List<Employee> subordinates;
				
				// constructor
				public Employee(String name, String dept, int salary) {
					this.name = name;
					this.dept = dept;
					this.salary = salary;
					subordinates = new ArrayList<Employee>();
				}
				
				public void add(Employee employee) {
					subordinates.add(employee);
				}
				
				public void remove(Employee employee) {
					subordinates.remove(employee);
				}
				
				public List<Employee> getSubordinates() {
					return subordinates;
				}
				
				public String toString() {
					return ("Employee :[ Name: " + name + ", dept : " + dept + ", salary : " + salary + " ]");
				}
			}
			
	4. CompositePatternDemo:
	
			public class CompositePatternDemo {
				public static void main(String[] args) {
					Employee CEO = new Employee("John", "CEO", 30000);
					
					Employee headSales = new Employee("Robert", "Head Sales", 20000);
					Employee headMarketing = new Employee("Michel", "Head Marketing", 20000);
					
					Employee clerk1 = new Employee("Laura", "Marketing", 10000);
					Employee clerk2 = new Employee("Bob", "Marketing", 10000);
					
					Emploee salesExecutive1 = new Employee("Richard", "Sales", 10000);
					Employee salesExecutive2 = new Employee("Rob", "Sales", 10000);
					
					CEO.add(headSales);
					CEO.add(headMarketing);
					
					headSales.add(salesExecutive1);
					headSales.add(salesExecutive2);
					
					headMarketing.add(clerk1);
					headMarketing.add(clark2);
					
					//print all employee of the organization
					System.out.println(CEO);
					
					for(Employee headEmployee : CEO.getSubordinates()) {
						System.out.println(headEmployee);
						
						for(Employee employee : headEmployee.getSubordinates()) {
							System.out.println(employee);
						}
					}
				}
			}
			
##### Decorator Pattern
![decorator_pattern_uml_diagram](decorator_pattern_uml_diagram.jpg)

1. Introduction
	1. Adds new functionality to existing object without altering its structure.
	2. It is a structural pattern
	3. It is a wrapper to existing class.
	4. Keeps class methods signature intact
2. Implementation
	1. `Shape`: Interface
	2. `ShapeDecorator`: abstract decorator class. Implements `Shape` interface.
		1. `Shape`: instance variable
	3. `RedShapeDecorator`: Implements `ShapeDecorator`
	4. `DecoratorPatternDemo`: demo class
	5. Steps:
		1. `Shape.java`
		
				public interface Shape {
					void draw();
				}
				
		2. `Rectangle.java`
		
				public class Rectangle implements Shape {
					@Override
					public void draw() {
						System.out.println("Shape: Rectangle");
					}
				}
				
		3. `Circle.java`
		
				public class Circle implements Shape {
					@Override
					public void draw() {
						System.out.println("Shape: Circle");
					}
				}
				
		4. `ShapeDecorator.java`
		
				public abstract class ShapeDecorator implements Shape {
					protected Shape decoratedShape;
				
					public ShapeDecorator(Shape decoratedShape) {
						this.decoratedShape = decoratedShape;
					}
					
					public void draw() {
						decoratedShape.draw();
					}
				}
				
		5. `RedShapeDecorator.java`
		
				public class RedShapeDecorator extends ShapeDecorator {
					public RedShapeDecorator(Shape decoratedShape) {
						super(decoratedShape);
					}
					
					@Override
					public void draw() {
						decoratedShape.draw();
						setRedBorder(decoratedShape);
					}
					
					private void setRedBorder(Shape decoratedShape) {
						System.out.println("Border Color: Red");
					}
				}
				
		6. `DecoratorPatternDemo.java`
			
				public class DecoratorPatternDemo {
					public static void main(String[] args) {
						Shape circle = new Circle();
						
						Shape redCircle = new RedShapeDecorator(new Circle());
						System.out.println("Circle with normal border");
						circle.draw();
						
						System.out.println("\nCircle of red border");
						redCircle.draw();
						
						System.out.println("\nRectangle of red border");
						redRectangle.draw();
						
					}
				}
				
##### Facade Pattern

![facade_pattern_uml_diagram](facade_pattern_uml_diagram.jpg)

1. Introduction
	1. Facade pattern provides simple interface to a system by hiding the complexities.
	2. It is a structural pattern (adds interface to existing system)
	3. Single class provides simplified methods. The methods dedicate calls to existing system classes.
2. Implementation
	1. Steps:
		1. `Shape`:
		
				public interface Shape {
					public void draw();
				}
				
		2. `Circle`:
				
				public class Circle extends Shape {
					@Override
					public void draw() {
						System.out.println("Circle::draw()");
					}
				}
				
		3. `Rectangle`:
		
				public class Rectangle extends Shape {
					@Override
					public void draw() {
						System.out.println("Rectangle::draw()");
					}
				}
				
		4. `Square`:
		
				public class Square extends Shape {
					@Override
					public void draw() {
						System.out.println("Square::draw()");
					}
				}
				
		5. `ShapeMaker`:
		
				public class ShapeMaker {
					private Circle circle;
					private Rectangle rectangle;
					private Square square;
					
					public ShapeMaker() {
						circle = new Circle();
						rectangle = new Rectangle();
						square = new Square();
					}
					
					public void drawCircle() {
						circle.draw();
					}
					
					public void drawRectangle {
						rectangle.draw();
					}
					
					public void drawSquare {
						square.draw();
					}
				}
				
		6. `FacadePatternDemo`:
		
				public class FacadePatternDemo {
					public static void main(String[] args) {
						ShapeMaker shapeMaker = new ShapeMaker();
						
						shapeMaker.drawCircle();
						shapeMaker.drawRectangle();
						shapeMaker.drawSquare();
					}
				}
				
##### Flyweight Pattern
![flyweight_pattern_uml_diagram](flyweight_pattern_uml_diagram.jpg)

1. Introduction
	1. Purpose: reduce number of objects thus decrease memory footprint and increase performance (?).
	2. It is a structural patern (improves object structure of app).
	3. Strategy:
		1. If similar object is exists then reuse it else object is initalized and used.
		2. Example: Draw 20 circles with only five objects. Each object represents a particular color out of five colors.
2. Implementation
	1. `Shape`: Interface
	2. `Circle`: Concrete class
	3. `ShapeFactory`: Factory class:
		1. If a request comes for creation of Circle, it checks HashMap. If object of Circle is found, returns it or else new object gets created, stored in HashMap and returned.
	4. `FlyweightPatternDemo`:
		1. Uses `ShapeFactory` to get `Shape` object.
		2. Passes color as input out of: red/green/blue/black/white to `ShapeFactory`
	5. Steps:
		1. `Shape.java`
		
				public interface Shape {
					void draw();
				}
				
		2. `Circle.java`
		
				public class Circle implements Shape {
					private String color;
					private int x;
					private int y;
					private int radius;
					
					public Circle(String color) {
						this.color = color;
					}
					
					public void setX(int x) {
						this.x = x;
					}
					
					public void setY(int y) {
						this.y = y;
					}
					
					public void setRadius(int radius) {
						this.radius = radius;
					}
					
					@Override
					public void draw() {
						System.out.println("Circle: Draw() [Color : " + color + ", x : " + x + ", y : " + y + ", radius :" + radius);
					}
				}
				
		3. `ShapeFactory.java`
			
				import java.util.HashMap;
				
				public class ShapeFactory {
					private static final HashMap<String, Shape> circleMap = new HashMap();
					public static Shape getCircle(String color) {
						Circle circle = (Circle)circleMap.get(color);
						
						if(circle == null) {
							circle = new Circle(color);
							circleMap.put(color, circle);
							System.out.println("Creation of Circle of color: " + color);
						}
						return circle;
					}
				}
				
		4. `FlyweightPatternDemo.java`:
		
				public class FlyweightPatternDemo {
					private static final String colors[] = {"Red", "Green", "Blue", "White", "Black"};
					public static void main(String[] args) {
						for(int i = 0; i < 20; i++) {
							Circle circle = (Circle)ShapeFactory.getCircle(getRandomColor());
							circle.setX(getRandomX());
							circle.setY(getRandomY());
							circle.setRadius(100);
							circle.draw();
						}
					}
					
					private static String getRandomColor() {
						return colors[(int)(Math.random()*colors.length)];
					}
					
					private static int getRandomX() {
						return (int)(Math.random()*100);
					}
					
					private static int getRandomY() {
						return (int)(Math.random()*100);
					}
				}
				
##### Proxy Pattern
![proxy_pattern_uml_diagram](proxy_pattern_uml_diagram.jpg)

1. Introduction
	1. A class represents functionality of another class
	2. It is a structural pattern
2. Implementation
	1. `Image`: interface
	2. `ProxyImage`: proxy class. Reduces memory footprint.
	3. `RealImage`: Real class
	4. `ProxyPatternDemo`: demo class which used `ProxyImage` to get `Image` object
	5. Steps:
		1. `Image.java`:
		
				public interface Image {
					public void display();
				}
				
		2. `RealImage.java`:
			
				public class RealImage implements Image {
					private String fileName;
					
					public RealImage(String fileName) {
						this.fileName = fileName;
						loadFromDisk(fileName);
					}
					
					@Override
					public void display() {
						System.out.println("Displaying " + fileName);
					}
					
					private void loadFromDisk(String fileName) {
						System.out.println("Loading " + fileName);
					}
				}
				
		3. `ProxyImage.java`:
		
				public class ProxyImage implements Image {
					private RealImage realImage;
					private String fileName;
					
					public ProxyImage(String fileName) {
						this.fileName = fileName;
					}
					
					@Override
					public void display() {
						if(realImage == null) {
							realImage = new RealImage(fileName);
						}
						realImage.display();
					}
				}
				
		4. `ProxyPatternDemo.java`:
		
				public class ProxyPatternDemo {
					public static void main(String[] args) {
						Image image = new ProxyImage("test_10mb.jpg");
						
						//image will be loaded from disk
						image.display();
						System.out.println("");
						
						//image will not be loaded from disk
						image.display();
					}
				}
				
##### Command Pattern
![command_pattern_uml_diagram](command_pattern_uml_diagram.jpg)

1. Introduction
	1. Data driven design pattern
	2. It is behavioral pattern
	3. Request is wrapped as command in an object and passed to invoker object. Invoker object looks for an object that can handle the command and passes the command to corresponding object.
2. Implementation
	1. `Order`: Interface that acts as command.
	2. `Stock`: request object
	3. `BuyStock`, `SellStock`: command classes that implement `Order`. These classes do actual command processing.
	4. `Broker`: Invoker object. It takes orders and places orders.
	5. Steps:
		1. `Order.java`:
		
				public interface Order {
					public void execute();
				}
				
		2. `Stock.java`: Request class
		
				public class Stock {
					private String name = "ABC";
					private int quantity = 10;
					
					public void buy() {
						System.out.println("Stock [ Name: " + name + ", Quatity: " + quantity + "] bought");
					}
					
					public void sell() {
						System.out.println("Stock [ Name: " + name + ", Quantity: " + quantity + "] sold");
					}
				}
				
		3. `BuyStock.java`:
		
				public class BuyStock implements Order {
					private Stock abcStock;
					
					public BuyStock(Stock abcStock) {
						this.abcStock = abcStock;
					}
					
					public void execute() {
						abcStock.buy();
					}
				}
				
		4. `SellStock.java`:
		
				public class SellStock implements Order {
					private Stock abcStock;
					public SellStock(Stock abcStock) {
						this.abcStock = abcStock;
					}
					
					public void execute() {
						abcStock.sell();
					}
				}
				
		
##### Interpreter Pattern
![interpreter_pattern_uml_diagram](interpreter_pattern_uml_diagram.jpg)

1. Introduction
	1. It is used to evaluate language grammar/ expression.
	2. It is behavioral pattern
	3. Uses:
		1. SQL Parsing, symbol processing engine
2. Implementation
	1. `Expression`: Interface
	2. `TerminalExpression`: main interpreter of context
	3. `OrExpression`, `AndExpression`: used for creation of combinational expressions
	4. `InterpreterPatternDemo`: Uses `Expression` class for creation of rules, parsing expressions.
	5. Steps:
		1. `Expression.java`
		
				public interface Expression {
					public boolean interpret(String context);
				}
				
		2. `TerminalExpression.java`
		
				public class TerminalExpression implements Expression {
					private String data;
					
					public TerminalExpression(String data) {
						this.data = data;
					}
					
					@Override
					public boolean interpret(String context) {
						if(context.contains(data)) {
							return true;
						}
						return false;
					}
				}
				
		3. `OrExpression.java`
		
				public class OrExpression implements Expression {
					private Expression expr1 = null;
					private Expression expr2 = null;
					
					public OrExpression(Expression expr1, Expression expr2) {
						this.expr1 = expr1;
						this.expr2 = expr2;
					}
					
					@Override
					public boolean interpret(String context) {
						return expr1.interpret(context) || expr2.interpret(context);
					}
				}
				
		4. `AndExpression.java`
		
				public class AndExpression implements Expression {
					private Expression expr1 = null;
					private Expression expr2 = null;
					
					public AndExpression(Expression expr1, Expression expr2) {
						this.expr1 = expr1;
						this.expr2 = expr2;
					}
					
					@Override
					public boolean interpret(String context) {
						return expr1.interpret(context) && expr2.interpret(context);
					}
				}
				
		5. `InterpreterPatternDemo.java`
			
				public class InterpreterPatternDemo {
					//Rule: Robert and John are male
					public static Expression getMaleExpression() {
						Expression robert = new TerminalExpression("Robert");
						Expression john = new TerminalExpression("John");
						return new OrExpression(robert, john);
					}
					
					//Rule: Julie is a married women
					public static Expression getMarriedWomanExpression() {
						Expression julie = new TerminalExpression("Julie");
						Expression married = new TerminalExpression("Married");
						return new AndExpression(jilie, married);
					}
					
					public static void main(String[] args) {
						Expression isMale = getMaleExpression();
						Expression isMarriedWoman = getMarriedWomanExpression();
						
						System.out.println("John is a male? " + isMale.interpret("John"));
						System.out.println("Julie is a married woman? " + isMarriedWoman.interpret("Married Julie"));
					}
				}
				
##### Iterator Pattern
![iterator_pattern_uml_diagram](iterator_pattern_uml_diagram.jpg)

1. Introduction
	1. Used to access elements of a collection in sequential manner without knowing the underlying representation.
	2. It is a behavioral pattern
2. Implementation
	1. `Iterator`: Interface. Gives a navigation method.
	2. `Container`: Interface. Returns an `Iterator`
	3. Concrete classes of `Container`: Implement `Iterator` and use it.
	4. `IteratorPatternDemo`: Uses `NamesRepository` to print names stored as a collection.
	5. Steps:
		1. `Iterator.java`
		
				public interface Iterator {
					public boolean hasNext();
					public Object next();
				}
				
		2. `Container.java`
		
				public interface Container {
					public Iterator getIterator();
				}
				
		3. `NameRepository.java`: 
		
				public class NameRepository implements Container {
					public String names[] = {"Robert", "John", "Julie", "Lora"};
				
					@Override
					public Iterator getIterator() {
						return new NameIterator();
					}
					
					private class NameIterator implements Iterator() {
						int index;
						
						@Override
						public boolean hasNext() {
							if(index < names.length) {
								return true;
							}
							return false;
						}
						
						@Override
						public Object next() {
							if(this.hasNext()) {
								return names[index++];
							}
							return null;
						}
					}
				}
		
		4. `IteratorPatternDemo.java`
		
				public class IteratorPatternDemo {
					public static void main(String[] args) {
						NameRepository namesRepository = new NameRepository();
						
						for(Iterator iter = namesRepository.getIterator(); iter.hasNext();) {
							String name = (String)iter.next();
							System.out.println("Name: " + name);
						}
					}
				}
				
##### Mediator Pattern
![mediator_pattern_uml_diagram](mediator_pattern_uml_diagram.jpg)

1. Introduction
	1. Used to reduce communication complexity between multiple objects or classes.
	2. Mediator class handles communications between different classes. (Lose coupling)
	3. It is behavioral pattern category.
2. Implementation
	1. `ChatRoom`: used to share messages.
	2. `User`: Multiple users can send messages to `ChatRoom`.
	3. `MediatorPatternDemo`: Shows communication between different `User`s
	
##### Memento Pattern
![memento_pattern_uml_diagram](memento_pattern_uml_diagram.jpg)

1. Introduction
	1. Used to restore an object's state to previous state.
	2. It is a behavioral pattern.
2. Implementation
	1. Three actor classes are used.
		1. `Memento`: contains state of an object stored.
		2. `Originator`: Responsible for creation and storage of state into `Memento`
		3. `Caretaker`: Responsible for restoring object state from `Memento`
	2. `MementoPatternDemo`: Uses `CareTaker` and `Originator` to show restoration of objects.
	3. Steps:
		1. `Mememto.java`
		
				public class Memento {
					private String state;
					
					public Memento(String state) {
						this.state
					}
					
					public String getState() {
						return state;
					}
				}
				
		2. `Originator.class`
		
				public class Originator {
					private String state;
					
					public void setState(String state) {
						this.state = state;
					}
					
					public String getState() {
						return state;
					}
					
					public Memento saveStateToMemento() {
						return new Memento(state);
					}
					
					public void getStateFromMemento(Memento memento) {
						state = memento.getState();
					}
				}
				
		3. `CareTaker.java`
		
				import java.util.ArrayList;
				import java.util.List;
				
				public class CareTaker {
					private List<Memento> mementoList = new ArrayList<Memento>();
					
					public void add(Memento state) {
						mementoList.add(state);
					}
					
					public Memento get(int index) {
						return mementoList.get(index);
					}
				}
				
		4. `MementoPatternDemo.java`
		
				public class MementoPatternDemo {
					public static void main(String[] args) {
						Originator originator = new Originator();
						CareTaker careTaker = new CareTaker();
						
						originator.setState("State #1");
						originator.setState("State #2");
						careTaker.add(originator.saveStateToMemento());
						
						originator.setState("State #3");
						careTaker.add(originator.saveStateToMemento());
						
						originator.setState("Sate #4");
						System.out.println("Current State: " + originator.getState());
						
						originator.getStateFromMemento(careTaker.get(0));
						System.out.println("First saved State: " + originator.getState());
						originator.getStateFromMemento(careTaker.get(1));
						System.out.println("Second saved State: " + originator.getState());
					}
				}
				
##### Observer Pattern
![observer_pattern_uml_diagram](observer_pattern_uml_diagram.jpg)

1. Introduction
	1. Used if there is one-to-many relationship between objects
	2. If one object is modified, other  dependent objects must be notified
 automatically.
 	3. It is a behavioral pattern
2. Implementation
	1. Three actor classes:
		1. `Subject`: has methods to attach and detach observers to `Client`
		2. `Observer`: Abstract class
		3. `Client`: 
	2. `ObserverPatternDemo`: Uses `Subject` and concrete class object.
	3. `Subject.java`
	
			import java.util.ArrayList;
			import java.util.List;
			
			public class Subject {
				private List<Observer> observers = new ArrayList<Observer>();
				private int state;
				
				public int getState() {
					return state;
				}
				
				public void setState(int state) {
					this.state = state;
					notifyAllOberservers();
				}
				
				public void attach(Observer observer) {
					observers.add(observer);
				}
				
				public void notifyAllObservers() {
					for(Observer observer: observers) {
						observer.update();
					}
				}
			}
			
	4. `Observer.java`
	
			public abstract class Observer {
				protected Subject subject;
				public abstract void update();
			}
			
	5. `BinaryObserver.java`
	
			public class BinaryObserver extends Observer {
				public BinaryObserver(Subject subject) {
					this.subject = subject;
					this.subject.attach(this);
				}
				
				@Override
				public void update() {
					System.out.println("Binary String: " + Integer.toBinaryString(subject.getState()));
				}
			}
			
	6. `OctalObserver.java`
	
			public class OctalObserver extends Observer {
				public OctalObserver(Subject subject) {
					this.subject = subject;
					this.subject.attach(this);
				}
				
				@Override
				public void update() {
					System.out.println("Octal String: " + Integer.toOctalString(subject.getState()));
				}
			}
			
	7. `HexaObserver.java`
	
			public class HexaObserver extends Observer {
				public HexaObserver(Subject subject) {
					this.subject = subject;
					this.subject.attach(this);
				}
				
				@Override
				public void update() {
					System.out.println("Hex String: " + Integer.toHexString(subject.getState()).toUpperCase());
				}
			}
			
	8. `ObserverPatternDemo.java`
	
			public class ObserverPatternDemo {
				public static void main(String[] args) {
					Subject subject = new Subject();
					
					new HexaObserver(subject);
					new OctalObserver(subject);
					new BinaryObserver(subjet);
					
					System.out.println("First state change: 15");
					subject.setState(15);
					System.out.println("Second state change: 10");
					subject.setState(10);
				}
			}