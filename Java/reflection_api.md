# Reflection #
## Introduction ##
## Trail: The Reflection API ##
### Uses of Reflection ###
1. Uses of reflection:
	1. If a program needs the ability to examine or modify the runtime behavior of an app running in JVM
	2. Pre-requisite: strong grasp of fundamentals of the language
	3. Very powerful and can allow us to perform operations which would otherwise be impossible

#### Extensibility Features ####
1. Extensibility objects instances can be constructed using fully qualified names of user-defined classes (?)

#### Class Browsers and Visual Development Environments ####
1. Class browser can enumerate members of classes
2. Visual development environments - can make use of type info available in reflection to aid developer in writing correct code

#### Debuggers and Test Tools ####
1. Can examine private members on classes
2. Test harness - can use reflection to systematically call discoverable set APIs defined on a class
	1. Insures high level of code coverage in test suite

### Drawbacks of Reflection ###
1. It cannot be used indiscriminately
	1. Avoid it if we can perform an operation without using reflection
2. Following are the concerns

#### Performance Overhead ####
1. Involves types that are dynamically resolved
	1. Certain JVM optimizations cannot be performed
	2. Results in slower performance than non-reflective counterparts
		1. Avoid in sections of code called frequently in performance-sensitive applications

#### Security Restrictions ####
1. Requires runtime permission (may not be present when running under security manager)
	1. Important if running in restricted security context
		1. Applet

#### Exposure of Internals ####
1. May perform illegal operations as compared to non-reflective code
	1. accessing `private` fields and methods
2. May result in un-expected side effects
	1. May render code dysfunctional and may destroy portability
3. Breaks abstractions and may change behavior with upgrades of platform

### Trail Lessons ###
1. Common uses of reflection for accessing and manipulating:
	1. Classes
	2. Fields
	3. Methods
	4. Constructors
2. Code examples
3. Tips
4. Troubleshooting information

#### Classes ####
1. Shows how to obtain a class object and use to examine properties of a class
	1. Declarations and contents
2. Type
	1. Reference
		1. Class
			1. `java.lang.String`
			2. Wrappers
				1. `java.lang.Integer`
				2. `java.lang.Long`
				3. ...
		2. Interface
			1. `java.io.Serializable`
		3. Enums
			1. `javax.swing.SortOrder`
		4. Arrays
			1. Inherits from `Object` as well
	2. Primitive
		1. `boolean`
		2. `byte`
		3. `short`
		4. `char`
		5. `int`
		6. `long`
		7. `float`
		8. `double`
3. `java.lang.Class` - for every object, JVM instantiates an immutable instance of this class
	1. This has methods to examine the runtime properties of the object
		1. Members
		2. Type info
	2. Gives ability for creation of new classes and objects
	3. It is the entry point for all reflection APIs
4. Commonly used reflection operations involving classes
	1. Retrieving Class Objects - describes ways to get a `Class`
	2. Examining Class Modifiers and Types - shows how to access class declaration info
	3. Discovering Class Members - how to list
		1. constructors
		2. fields
		3. methods
		4. nested classes
	4. Troubleshooting - common errors encountered when using `Class`

##### Retrieving Class Objects #####
1. `java.lang.Class` - entry point for all reflection operations
2. All classes (except `java.lang.reflect.ReflectPermission`) in `java.lang.reflect` have public constructors
	1. We need to invoke appropriate methods in `Class` to get to those classes
		1. Ways to get a `Class` object
			1. Depends on whether:
				1. Code has access to an object
				2. Code has access to name of class
				3. Code has access to a type
				4. Code has access to an existing `Class`
3. `Object.getClass()`
	1. If an instance is available
		1. Invoke `Object.getClass()`
			1. Assuming `Object` inhertis from `Object` class
			2. Examples:

					Class c = "foo".getClass();

				1. Returns `Class` object for `String`

						Class c = System.console().getClass();

					1. `console()` - returns a unique console associated with the VM
				2. `getClass()` - returns `Class` corresponding to `java.io.Console`

						enum E { A, B }
						Class c = A.getClass();

					1. `A` - instance of enum `E`
						1. `getClass()` - returns `Class` object corresponding to enum `E`

								byte[] bytes = new byte[1024];

##### Examining Class Modifiers and Types #####
##### Discovering Class Members #####
##### Troubleshooting #####

#### Members ####
1. Using reflection APIs to find fields, methods, and constructors of a class
2. Setting and getting field values
3. Invoking methods
4. New instances of objects using specific constructors

#### Arrays and Enumerated Types ####
1. Two special types of classes
	1. Arrays
		1. Generated at runtime
	2. Enum
		1. Unique named object instances
2. Retrieving component type for array
3. How to set and get fields with array or enum types