# Refactoring #
## Code Refactoring ##
1. Bad smells
2. What is refactoring?
	1. Software fails if it no longer can provide additional features while remaining error free
	2. Refactoring makes code understandable and easy to extend
		1. Improves code design
		2. Refactor to make the code more extensible
	3. Refactoring makes it quicker to construct complicated systems
3. Why should you refactor?
	1. You remove excess code so it is easier to understand & modify
		1. Less code is easier to understand to modify
	2. By refactoring code you can better understand others code
		1. Better understanding of system
		2. Easier to find bugs
		3. Non re-factored code may require us to go back and waste time understanding the code, fix bugs, ...
		4. Easier to read
		5. Minimizes complex conditional logic
		6. We need to pull in or pull away design patterns
	3. You eliminate the having to remember what old code does
	4. You can write code quicker
4. What are Bad smells?
	1. Bad smells are common design problems
	2. Bad design is normally unclear, complicated or duplicated
5. Examples of bad smells?
	1. Duplicated code
	2. Long methods
		1. small methods are easier to understand (<= 10 lines, ~ 5 lines average)
	3. Complex conditional statements
		1. Hard to understand
		2. Hard to extend
		3. Hard to re-use
	4. Primitive Obsession
		1. Constantly using primitives instead of objects
		2. Cleaner
		3. More extensible
	5. Indecent Exposure
		1. Classes and methods are exposed but they should be kept private
	6. Solution Sprawl
		1. Solution is sprawled across many classes instead of keeping it in one
	7. Alternative Classes with Different Interfaces
		1. Interfaces of classes are different but the classes are same
			1. Refactor different interfaces into one
	8. Lazy Classes
		1. The different classes do not do much on their own so they must be consolidated
	9. Large Classes
		1. If we move too much from lazy classes into another class
		2. Class has too many responsibilities
			1. If we are using too many instances of the class to solve many different problems
	10. Switch Statements
		1. Eliminated if they make system restrictive
			1. Replace it with an object polymorphic solution
	11. Combinatorial Explosions
		1. Many methods to perform actions which could be done with one method
			1. Example: One method for each db query rather than one method for different queries
	12. Oddball Solutions
		1. Solving same problem in many different ways (use the best one and delete the others)
6. Creation Problem
	1. Creation method
	2. Replace constructors with creation methods
		1. Which constructor should be called?
		2. Wish constructors had descriptive names?
		3. Constructors can't have the same attribute signatures

## Code Refactoring 2 ##
## Code Refactoring 3 ##
## Code Refactoring 4 ##
## Code Refactoring 5 ##
## Code Refactoring 6 ##
## Code Refactoring 7 ##
## Code Refactoring 8 ##
## Code Refactoring 9 ##
## Code Refactoring 10 ##
## Code Refactoring 11 ##
## Code Refactoring 12 ##
## Code Refactoring 13 ##
## Code Refactoring 14 ##
## Code Refactoring 15 ##
## Code Refactoring 16 ##
## Code Refactoring 17 ##
## Code Refactoring 18 ##