# Nested Classes #
## Introduction ##
1. Nested class - defining a class inside another class

		class OuterClass {
			...
			class NestedClass {
				...
			}
		}
		
	1. Terminology: Divided into two categories
		1. static: `static` nested classes
		2. non-static: non-static nested classes (inner classes)
2. Nested class is a member of it's enclosing class
3. Non-static nested classes (inner classes) have access to other members of enclosing class (even if declared private)
4. Static nested classes do not have access to other members of enclosing class
	1. It can be declared: `private`, `public`, `protected`, package private (default)
		1. Outer classes can be only: `public` or package private (default)

### Why Use Nested Classes? ###
1. A way of logically grouping classes that are only used in one place
	1. If a class is used in only one other class, then they can be grouped and kept together
	2. The package can be more streamlined (?)
2. Increases encapsulation:
	1. If A and B are two top level classes, where B needs access to members of A (which would be private):
		1. If we hide class B within class A, A's members can be declared private and B can access them
		2. B itself can be hidden from outside world (inner details)
3. It can lead to more readable and maintainable code
	1. Nesting small classes within top-level classes places the code closer to where it is used

### Static Nested Classes ###
1. It is associated with it's outer class
2. It cannot refer directly to:
	1. Instance variables of enclosing class
	2. Instance methods of enclosing class
3. The instance members can only be used through object reference
4. Note: static nested class interacts with instance members of its outer class (and other classes) just like any other top level class
	1. It is behaviorally a top-level class that is nested in another top-level class (for packaging convenience)
5. They are accessed using enclosing class name:

		OuterClass.StaticNestedClass
		
	1. To instantiate an object of static nested class:

			OuterClass.StaticNestedClass outerObject = new OuterClass.StaticNestedClass();

### Inner Classes ###
1. It is like instance methods and variables
	1. It is associated with an instance of enclosing class and has direct access to other object's methods and fields
	2. It cannot define any static members itself - because it is associated with an instance
2. Inner class objects can only reside instances of outer class

		class OuterClass {
			...
			class InnerClass {
				...
			}
		}
		
	1. Instance of `InnerClass` can exist only within instance of `OuterClass`
		1. It has direct access to methods and fields of its enclosing instance
	2. First instantiate outer class and then instantiate inner class (within outer object)

			OuterClass outerObject = new OuterClass();
			OuterClass.InnerClass innerObject = outerObject.new InnerClass();
			
		1. Special kinds of inner classes:
			1. [Local classes](https://docs.oracle.com/javase/tutorial/java/javaOO/localclasses.html)
			2. [Anonymous classes](https://docs.oracle.com/javase/tutorial/java/javaOO/anonymousclasses.html)

### Shadowing ###
1. If a declaration of a type (member variable or parameter name) in a scope (inner class or method definition) has same name as another declartion in enclosing scope, then declaration shadows declaration of enclosing scope
	1. Shadowed declaration cannot be accessed by name alone
2. Example:

		public class ShadowTest {
			public int x = 0;
			
			class FirstLevel {
				public int x = 1;
				
				void methodInFirstLevel(int x) {
					System.out.println("x = " + x);
					System.out.println("this.x = " + this.x);
					System.out.println("ShadowTest.this.x = " + ShadowTest.this.x);
				}
			}
			
			public static void main(String[] args) {
				ShadowTest st = new ShadowTest();
				ShadowTest.FirstLevel fl = st.new FirstLevel();
				fl.methodInFirstLevel(23);
			}
		}
		
	1. Output:
	
			x = 23
			this.x = 1
			ShadowTest.this.x = 0
			
	2. x (parameter) shadows variable of inner class FirstLevel
	3. `this` needs to be used to access member variable
	4. `<outer-classname>.this` is used to access outerclass member variable

### Serialization ###