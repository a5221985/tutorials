# TDD - By Uncle Bob #
1. TDD is a discipline
2. It has arbitrary parts
3. Three laws: Arbitrary
	1. You are not allowed to write any production code unless it is to make a failing unit test pass
		1. First write unit test and it must fail before writing production code
	2. You are not allowed to write any more of a unit test than is sufficient to fail; and compilation failures are filures
		1. Stop writing as soon as it fails
			1. Even if a character causes failure
	3. You are not allowed to write any more production code than is sufficient to pass the one failing unit test
4. Puts you in cycle
	1. May be 5 s long
5. Debugging is limited if something stopped working a minute ago
	1. ctrl+d works
6. Don't want to be good at the debugger
	1. Don't spend time debugging
		1. Spend time on coding
	2. Don't use it as part of daily coding exercise
		1. Setting breakpoint on test is okay
7. Third-party package
	1. If PDF manual exists
		1. Appendix has code examples say
			1. We go right to the end and learn
				1. Unit tests a small snippets that explains how the system works
	2. Unit tests are independent units of code which exercise limited parts of the system
		1. Tells how to exercise the system
	3. Documentation written in a formal language we are familiar with
		1. It is a low level documentation for development team
8. If we write unit tests after the fact
	1. It is not a lot of fun
		1. We already know the code works
		2. It is waste of time
	2. We may come across code that is hard to test
		1. Effort required to make it testable seems to be hard
			1. If we skip this, we leave a hole in test suite
				1. If test suite passes it does not tell that system works
					1. If it fails, it may tell something
9. It is fun to write test first
	1. We can make something work if not working
10. Test first makes it hard to write function that is hard to test
	1. Reason it is easy to test because it is decoupled from rest of the system
	2. We can produce a decoupled system
	3. **This is real reason!**
11. TDD makes tests pass means system works!
	1. When test suite runs, it tells that system is deployable
12. Why did we write bad code?
	1. We are in a rush to meet deadlines
		1. We write something that slows us down
	2. It is difficult to write good first at first
		1. We are focussed on getting the problem solved leaving a mess
		2. We don't go back and clean it up
		3. Why?
			1. Takes time
			2. If we touch bad code, we might break it and it becomes ours
				1. It will get worse and worse over time because no one wants to clean it
				2. We fix bugs to preserve our safety
				3. May require whole thing to be redesigned
13. We must clean messy code!
	1. If we change something keeping test suite, it gives confidence that system runs as it was originally written
14. 