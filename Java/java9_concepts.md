# Java 9 Concepts #
## Jlink ##
1. New command line tool for building customized JRE
	1. Problem: Consider Test.java

			public class Test {
				public static void main(String[] args) {
					System.out.println("Hello World");
				}
			}

		1. We only need to run the following classes
			1. Test.class
			2. String.class
			3. System.class
			4. Object.class
		2. Default JRE: contains 4300+ predefined Java .class files
			1. All these will be executed with the program (performance hit)
			2. Size: ~203 MB (+ 1 KB for code) (waste of memory)
			3. Not good for microservices, IOT
	2. Solution: Customized JRE (contains only relevant classes)
		1. Not wastage of memory
		2. Better performance
2. Working principle of jlink:
	1. To link only sets of required modules to build runtime image
3. Example: Support the program is in demoModule module

		javac -module-source-path src -d out -m demoModule
		java -module-path out -m demoModule/knoldus.Test

	1. Only two modules are required to run the program
		1. java.base
		2. DemoModule
	2. Build customized jre with these modules
		1. Copy java.base module to `java\jdk-9\jmods` folder that has `Test.class` file
		2. Build JRE using the following command:

				jlink -module-path out -add-modules demoModule,java.base -output myjre

			1. `myjre` folder gets generated
				1. Execute the program as follows
				
						cd myjre
						cd bin
						java -m demoModule/knoldus.Test