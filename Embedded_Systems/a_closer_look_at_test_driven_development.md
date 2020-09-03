## A Closer Look at Test Driven Development ##
1. Solution to problem:
	1. Problem: Programmers tend to make mistakes
	2. Solution: TDD helps us prevent mistakes
		1. Against debug later programming
2. Try to define behavior of code one at a time and implement it one at a time (growing the software in steps)
3. Embedded software:
	1. If hardware and software are tightly coupled
		1. Structure the code to be testable
			1. Isolate the code that is tightly coupled to hardware
				1. specific uc features are exploited say in this code (registers ...)
				2. Provide abstraction layer
					1. Build complex behavior on top of it
			2. Check which code needs to know about the processor environment and which code need not
				1. There could be pieces common across different platfroms - separte them
4. TDD - Test harness separates code from hardware
	1. First get the code working without the hardware
	2. Then test the code with the hardware
5. TDD related to code analysis?
	1. Orthogonality there
		1. Pair programming is good for TDD
			1. We find problems much quicker
	2. TDD is dynamic analysis
		1. What does code do?
	3. Static analysis solves a different problem
		1. Gives warnings to developers who are violating good practices or unsafe code
	4. We need both
		1. All of those things are important for good quality code
6. TDD path:
	1. Problems it helps with:
		1. Defect prevention - demonstrate the technique
		2. There are other benefits
	2. Show what problems it is solving