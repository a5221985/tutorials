## Java Language Updates ##
### Java Language Changes ###
1. Section summarizes updated language features in Java SE 9 and subsequent releases

#### Java Language Changes for Java SE 14 ####
1. `instanceof` operator: pattern matching can be used
	1. If result is `true`, object tested is automatically assigned to variable previously declared
		1. [Pattern Matching for the instanceof Operator](https://docs.oracle.com/en/java/javase/14/language/pattern-matching-instanceof-operator.html#GUID-843060B5-240C-4F47-A7B0-95C42E5B08A7)
		2. Records: a kind of type declaration that is ideal for "plain data carriers"
			1. Classes containing data not meant to be altered but have fundamental methods such as constructors and accessors
			2. [Records](https://docs.oracle.com/en/java/javase/14/language/records.html#GUID-6699E26F-4A9B-4393-A08B-1E47D4B2D263)
2. [Programmer's Guide to Text Blocks](http://www.oracle.com/pls/topic/lookup?ctx=javase14&id=text_blocks)
3. [Switch Expressions](https://docs.oracle.com/en/java/javase/14/language/switch-expressions.html#GUID-BA4F63E3-4823-43C6-A5F3-BAA4A2EF3ADC)

#### Java Language Changes for Java SE 13 ####
1. Text blocks:
	1. Multiline string literals that don't require common escape sequences
2. `switch` expressions
	1. `yeild` statement instead of `break`
		1. [Switch expressions](http://www.oracle.com/pls/topic/lookup?ctx=javase13&id=JSLAN-GUID-BA4F63E3-4823-43C6-A5F3-BAA4A2EF3ADC#GUID-BA4F63E3-4823-43C6-A5F3-BAA4A2EF3ADC)

#### Java Language Changes for Java SE 12 ####
1. `switch` expressions
2. `case` label that prevents fall through
3. [Switch Expressions](http://www.oracle.com/pls/topic/lookup?ctx=javase12&id=JSLAN-GUID-BA4F63E3-4823-43C6-A5F3-BAA4A2EF3ADC)

#### Java Language Changes for Java SE 11 ####
1. `var` - identifier
	1. [Local Variable Type Instance](https://docs.oracle.com/en/java/javase/14/language/local-variable-type-inference.html#GUID-D2C58FE6-1065-4B50-9326-57DD8EC358AC)

#### Java Language Changes for Java SE 10 ####
1. Inferring type of local variables from context
2. This makes code more readable and reduces amount of required boilerplate code

#### Java Language Changes for Java SE 9 ####
1. Module system
	1. It is named self-describing collection of code and data
	2. Code is organized as a set of packages containing
		1. Types
			1. Java classes
			2. Java interfaces
		2. Data
			1. Resources
			2. Static info
2. Modules can export or encapsulate packages
	1. They can express dependencies on other modules explicitly
	2. [Project Jigsaw](http://openjdk.java.net/projects/jigsaw/)
3. [More Concise try-with-resources Statements](https://docs.oracle.com/en/java/javase/14/language/try-resources.html#GUID-A920DB06-0FD1-4F9C-8A9A-15FC979D5DA3)
4. [Small language Changes in Java SE 9](https://docs.oracle.com/en/java/javase/14/language/small-language-changes.html#GUID-16A5183A-DC0D-4A96-B9D8-AAC9671222DD)
