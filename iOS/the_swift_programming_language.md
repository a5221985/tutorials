# Welcome to Swift #
## About Swift ##
## Version Compatibility ##
## A Swift Tour ##
1. Hello World program

		print("Hello, world!")
		// Prints "Hello, world!"

	1. The line is a complete program
	2. No import required for I/O or String handling
	3. Global scope code is the entry point of the program
		1. No `main()` function required
	4. No `;` required
2. The tour give info to start writing code in Swift
3. [Download Playground](https://docs.swift.org/swift-book/GuidedTour/GuidedTour.playground.zip)

### Simple Values ###
1. `let` - to define a constant
	1. It names a value which is determined only once but used in many places
2. `var` - to define a variable

		var myVariable = 42
		myVariable = 50
		let myConstant = 42

	1. Constant or variable must have same type as the value you want to assign to it
		1. When value is provided when constant or variable is created, the type is inferred
			1. `myVariable` is an integer
	2. To explicitly specify type separate with `:`

			let explicitDouble: Double = 70
			let explicitFloat: Float = 4

		1. If we want to convert a value to a different type, explicitly define an instance of the desired type

				let label = "The width is "
				let width = 94
				let withLabel = label = String(width)

			1. A simpler way to include values in strings
				1. Define using `\(...)`

						let apples = 3
						let oranges = 5
						let appleSummary = "I have \(apples) apples."
						let fruitSummary = "I have \(apples + oranges) pieces of fruit."

	3. Three quotation marks (`"""`) for strings that take up multiple lines
		1. Indentation at the start of each quoted line is removed (if matching indentation exists at closing quotation marks)

				let quotation = """
				I said "I have \(apples) apples."
				And then I said "I have \(apples + oranges) pieces of fruit."
				"""

	4. Arrays and dictionaries using brackets (`[]`)
		1. Access elements using index or key in brackets
		2. A comma is allowed after last element
		
				var shoppingList = ["catfish", "water", "tulips"]
				shoppingList[1] = "bottle of water"

				var occupations = [
					"Malcolm": "Captain",
					"Kaylee": "Mechanic",
				]
				occupations["Jayne"] = "Public Relations"

			1. Arrays automatically grow as you add elements
			
					shoppingList.append("blue paint")
					print(shoppingList)

				1. For empty array or dictionary use initializer syntax
				
						let emptyArray = [String]()
						let emptyDictionary = [String: Float]()

					1. If type info can be inferred, write empty array as `[]` and empty dictionary as `[:]`
					
							shoppingList = []
							occupations = [:]

### Control Flow ###
1. Use `if` and `switch` to construct conditionals
2. Use `for-in`, `while` and `repeat-while` for loops
3. Parantheses around condition or loop variable are optional
4. Braces around body are required

		let individualScores = [75, 43, 103, 87, 12]
		var teamScore = 0
		for score in individualScores {
			if score > 50 {
				teamScore += 3
			} else {
				teamScore += 1
			}
		}	
		print(teamScore)
		// Prints "11"

	1. Conditional must be a boolean expression
		1. `if score { ... }` is an error (no implicit comparison to zero)
	2. Use `if` and `let` together to work with values that might be missing (such values are represented as optionals)
		1. Optional: It contains a value or `nil` (indicating the value is missing)
		2. To indicate that value is optional, write `?` after it's type
		
				var optionalString: String? = "Hello"
				print(optionalString == nil)
				// Prints "false"

				var optionalName: String? = "John Appleseed"
				var greeting = "Hello!"
				if let name = optionalName {
					greeting = "Hello, \(name)"
				}

			1. If optional value is `nil`, conditional is `false` and code in braces gets skipped
			2. If optional value is not `nil`, the value in the optional is unwrapped and assigned to constant after `let`
				1. The unwrapped value is made available in code
		3. Another way to handle optional is to provide default value using `??` operator
			1. If optional value is missing, default value is used

					let nickName: String? = nil
					let fullName: String = "John Appleseed"
					let informalGreeting = "Hi \(nickName ?? fullName)"

	3. Switches support any kind of data and a variety of comparison operations (not just integers and tests for equality)

			let vegetables = "red pepper"
			switch vegetable {
			case "celery":
				print("Add some raisins and make ants on a log.")
			case "cucumber, "watercress":
				print("That would make a good tea sandwitch.")
			case let x where x.hasSuffix("pepper"):
				print("Is it a spicy \(x)?")
			default:
				print("Everything tastes good in soup.")
			}
			// Prints "Is it a spicy red pepper?"

		1. `let` is used to assign a value that matched the pattern to a constant
		2. Execution does not continue to the next case (no need to explicitly break out of the switch)
	4. `for-in` is used to iterate over items in a dictionary
		1. pair of names are used for key-value pair
		2. Iteration is in arbitrary order

				let interestingNumbers = [
					"Prime": [2, 3, 5, 7, 11, 13],
					"Fibonacci": [1, 1, 2, 3, 5, 8],
					"Square": [1, 4, 9, 16, 25],
				]
				var largest = 0
				var type = "Prime"
				for (kind, numbers) in interestingNumbers {
					for number in numbers {
						if number > largest {
							largest = number
							type = kind
						}
					}
				}
				print(type)
				// Prints "Square"
				print(largest)
				// Prints "25"

			1. Use `while` to repeat a block of code until condition changes
			2. Condition can be at the end

					var n = 2
					while n < 100 {
						n *= 2
					}
					print(n)
					// Prints "128"

					var m = 2
					repeat {
						m *= 2
					} while m < 100
					print(m)
					// Prints "128"

# Language Guide #
## The Basics ##
## Basic Operators ##
## Strings and Characters ##
## Collection Types ##
## Control Flow ##
## Functions ##
## Closures ##
## Enumeration ##
## Structures and Classes ##
## Properties ##
## Methods ##
## Subscripts ##
## Inheritance ##
## Initialization ##
## Deinitialization ##
## Optional Chaining ##
## Error Handling ##
## Type Casting ##
## Nested Types ##
## Extensions ##
## Protocols ##
## Generics ##
## Opaque Types ##
## Automatic Reference Counting ##
## Memory Safety ##
## Access Control ##
## Advanced Operators ##

# Language Reference #
## About the Language Reference ##
## Lexical Structure ##
## Types ##
## Expressions ##
## Statements ##
## Declarations ##
## Attributes ##
## Patterns ##
## Generic Parameters and Arguments ##
## Summary of the Grammar ##

 