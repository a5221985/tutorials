# Writing Good C++14 #
1. C++17 is very good
2. Easier to write, easier to maintain, runs faster with less code
3. Simplify the code, maintain efficiency and don't limit what we can say
4. Coding guidelines
	1. Guidelines support library (GSL)
	2. Supported by analysis tools
5. Clang, Microsoft, GCC
6. Microsoft analysis tool
7. Herb Sutter: Writing Good C++14
	1. Others talks
8. Coding guidelines: avoids accidents (for novices)
	1. Sets of restrictions
9. Good guidelines:
	1. Comprehensive
	2. Browsable
	3. Supported by tools (from many sources)
	4. Sutiable for gradual adoption
	5. High-level rules
		1. For writing Conceptual framework
			1. for humans (comments)
		2. Many can't be checked completely or consistently
			1. Express ideas directly in code
			2. Write in ISO Standard C++
			3. Express intent
			4. Ideally, a program should be statically type safe
			5. Prefer compile-time checking to run-time checking
			6. What cannot be checked at compile time should be checkable at run time
			7. Catch run-time errors early
			8. Don't leak any resource
			9. Don't waste time or space
	6. Low level rules
		1. Provide enforcement
			1. Some complete
			2. Some heuristics
			3. Many rely on static analysis
			4. Some beyond current tools
			5. Often easy to check "mechanically"
		2. Primarily for tools
			1. To provide specific feedback to programmer
		3. Help to unify style
			1. If standard string is used, every programmer knows how it is behind the scenes by reading the manual (even once)
		4. Not minimal or orthogonal
			1. Use T* or owner<T*> to designate a single object
			2. Prefer initialization to assignment in constructors
			3. Always initialize an object
		5. Structure of a rule
			1. Rationale
			2. Example
			3. Alternative
			4. Reference number
			5. Exception
			6. Enforcement (how to check mechanically)
			7. See also
			8. Note
			9. Discussion
		6. Subset of superset
			1. Need libraries which used low level code
				1. We need superset
			2. use STL
			3. Add small library (GSL)
				1. Hides low level stuff
		7. Rules rely on libraries
			1. ISO C++ standard library
				1. vector<T> and unique_ptr<T>
			2. Guideline support library
				1. array_view<T> and not_null<T>
		8. Rules using GSL
			1. Never transfer ownership by a raw pointer (T*)
				1. Use ownership pointer (unique_ptr<T> or owner<T*>)
			2. Declare pointer that may not be nullptr as not_null
				1. `not_null<int*>`
			3. Do not pass array as single pointer
				1. Use handle type `vector<T>` or `array_view<T>`
10. Effects
	1. Double productivity
	2. Eliminate classes of errors
	3. Simplify
		1. Simplicity aids maintenance
		2. Consistent style speeds up learning
		3. Guide people away from obscure corners and exotic technique
		4. Emphasis on avoiding waste improves performance
		5. Separate rules for exceptional needs
	4. Do not compromise performance
11. Eliminate resource leaks
12. Eliminate dangling pointers
13. Eliminate out-of-range access
14. Tool support is essential
	1. Static analysis
	2. Support library (tiny)
	3. Reinforce the type system
15. Core rules
	1. Gradual adoption will be very common
		1. Follow all rules for new projects
	2. No leaks
	3. No dangling pointers
	4. No type violations through pointers
16. No resource leaks
	1. Root every object in scope
		1. vector<T>
		2. string
		3. ifstream
		4. unique_ptr<T>
		5. shared_ptr<T>
	2. RAII
		1. No naked "new"
		2. No naked "delete"
17. Dangling pointers
	1. pointer is passed to function and function deletes it
	2. Use pointer later on
	3. Eliminate dangling pointers
		1. type safety is compromised
		2. memory safety is compromised
		3. resource safety is compromised
	4. Elimination by a combination of rules
		1. Distinguish owners from non-owners
		2. Assume raw pointers to be non-owners
		3. Catch all attempts for a pointer to "escape" into a scope enclosing its owner's scope
			1. `return`, `throw`, out-parameters, long-lived containers, ...
		4. Something that holds an owner is an owner
			1. `vector<owner<int*>>`, `owner<int*>[]`, ...