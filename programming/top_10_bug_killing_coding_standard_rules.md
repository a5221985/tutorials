# Why Adopt a Coding Standard? #
1. Several good reasons engineers talk about...
	1. Readability, when all of the code looks a certain way
		1. This results when there is a focus on stylistic rules
	2. Portability, when C's inconsistencies are managed
		1. When hardware changes say
2. An even better reason is not talked about enough...
	1. Certain coding standard rules can keep bugs out!
		1. Finding bugs is hard and time-consuming
3. Where bugs come from
	1. The original programmer(s)
		1. Programming is the step of "buggin" the code
	2. Maintenance programmer(s)
		1. By breaking assumptions of the original programmer
		2. By misunderstanding the original programmer's intent
	3. Both tyeps of bugs can be reduced...
		1. ...by following a set of bug-reducing coding rules!
	4. Solution: Document the rules
4. MISRA-C Guidelines (medical devices, avionics, ...)
	1. Guidelines for use of the C language
		1. in critical systems
	2. A carefully-rationalized _subset_ of C (used to increase safety and reliability of code)
		1. We highly recommend following it
		2. But MISRA-C is a set of guidelines
			1. _NOT_ a coding standard
				1. Style is not addressed at all
	3. Barr Group's standard is compatible with MISRA-C
5. Coding standard enforcement
	1. To be effective, coding standards must be both:
		1. Enforceable
			1. Favor objective, enforceable rules over unenforceable ones (by tool for instance)
			2. Enforce automatically with tools whenever possible
		2. And Enforced
			1. By the entire team, and its standard processes
			2. Few, if any, exceptions allowed (and documented)
6. Rule: Braces ({}) shall always surround the blocks of code (also known as compound statements) following if, else, switch, while, do, and for keywords.
	1. Single statements and empty statements following these keywords shall also always be surrounded by braces