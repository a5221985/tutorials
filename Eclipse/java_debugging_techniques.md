# Eclipse and Java: Using the Debugger #
![https://www.youtube.com/watch?v=pYvYSOLPoPE&list=PLv6UtFrA7VEseulz-SE4chKcEU2CEbBeu](https://www.youtube.com/watch?v=pYvYSOLPoPE&list=PLv6UtFrA7VEseulz-SE4chKcEU2CEbBeu)

## Lesson 1 ##
1. Fix programming mistakes or learn inner workings of Java
2. Pre-requisites
	1. "Eclipse and Java for Total Beginners" tutorial (optional)
	2. "Eclipse and Java: Introducing Persistence" (optional)
	3. Eclipse and Java
3. Test Driven Development
4. Tools
	1. Eclipse >= 3.3
	2. "debugger_tutorial_project.zip"
	3. PDF tutorial companion ([website](http://eclipsetutorial.sourceforge.net/))
5. Basics & Advanced features
6. What is a debugger:
	1. Set of tools that allow us to
		1. Pause a running program at any point
		2. Examine cotents of a variables
7. Why use a debugger?
	1. Debug code (Why isn't it working)
	2. Get familiar with new program
	3. Get better understanding of java and OOP
		1. See inside Virtual machine
8. Required debugging skills
	1. how to step through a program (pausing)
	2. Learn how to examine contents of program variables
9. Example:
	1. Import project: Existing projets > Archive Files > zip file
	2. Display line numbers: Window > preferences > General > Editors > Text Editors > Show line numbers
10. Steps:
	1. Tell program where to pause
		1. In main method put break point (to pause at this point)
	2. Run program in debug mode
		1. Run as "Debug as" > Java Application > Confirm Perspective Switch (Remember my decision)
		2. Switch perspectives: Window > Open perspectives > Java / Debug
	3. Views:
		1. Debug view
			1. Class being run
				1. Thread(s)
					1. Stack frame (has pause symbol)
		2. Source code
			1. Stops at first executable line (if breakpoint is on method)
		3. Outline:
			1. Method where we are gets highlighted
		4. Variables view, Breakpoints view
	4. Execution:
		1. Resume button: Resumes up to next breakpoint or finishes execution (if no breakpoints found)
		2. Terminate button: Stops debug session
		3. Step into button:
			1. If a call to a method exists, takes to the method body
				1. Debug view:
					1. Another stack frame gets added on top
				2. Outline view:
					1. Shows new method in new Class (if so)
		4. Step over button:
			1. Executes current line of code and stops at the next line
		5. Step return button:
			1. Goes back up to the previous level (finishes the current method and goes to next line of code in the caller)

## Lesson 2 ##
1. Topics
	1. Step over, step into, step return
	2. Variable content
2. Steps:
	1. Step into constructor
		1. New stackframes (work behind the scenes)
			1. Step return (removes one stack frame at a time until we reach)
	2. Step into constructor again
		1. New stackframe for the new constructor
	3. Step return
	4. Step over
	5. Step into (goes into the constructor directly) - Book class is loaded
3. We want debugger to step through the program and not library classes
	1. Right click in debug window
	2. Select Edit Step Filters
	3. Use step filters
	4. Select java.*
		1. Step filters button is toggled on
			1. Goes right into constructor without going into housekeeping code
4. Step into acts as step over if there is no method to get into
5. Step into (F5), step over (F6) or step return (F7) takes us back to caller at the end of the method
6. Going to a specific line
	1. Set debug point and resume
	2. Use run-to-line command (no breakpoint)
		1. Click on line > Run > Run to line
		2. Right click on line > Run to line
		3. Ctrl + R
7. Examining value of variables
	1. Each stack frame provides context for variables
		1. Certain variables are in scope
			1. `this`: refers to the current object
				1. Expand to see properties
			2. Step over to change properties (highlighted in yellow if it has changed)
		2. For constructor, line is partially executed when we return from constructor
			1. No entry for object reference
			2. Inspect a line to know the value of the expression (ctrl + Shift + i)
				1. Highlight the expression
				2. Right click > Inspect
	2. If we select another stack frame
		1. Variables of the frame are shown
		2. Java editor view goes back to line in the caller (lighter highlighting - not currently active)
	3. Select a variable in Variables view
		1. Details are shown (toString() output)
	4. Menu > Layout
		1. Menu > Java (what java members to display and how to display)

## Lesson 3 ##
1. Learn how to use watch expressions and how to run code snippets at any point in a program
2. Debug example class
3. To get a value of a complex expression
	1. Watch expresson (cannot use content assist - Window > Show View > Display - type java expressiion (code assist) - highlight > Inspect > Ctrl + Shift + I (moved to expressions view))
		1. Window > Show View > Expressions
		2. Right click on Expressions view
		3. Type expression
			1. `sue.getName()`
	2. Watch expression - changes if program runs
	3. Watch expression snapshot - does not change
		1. Select > Right click > Convert to watch expression
4. Display view:
	1. We can type any java expression and execute
		
			System.out.println("testLibrary: " + testLibrary.toString())

		1. Highlight > Right Click > Execute
5. Debug and fix issues
	1. Right click on AllTests.class > Run > Run As > JUnit tests
	2. Run MyLibraryTest
		1. Failure Trace > NullPointerException
			1. StackTrace (looks like frames in debug view)
				1. Snapshot of stack when error occured
				2. At the top, the line in the class where error occurred
6. We can run JUnit tests in debug mode
	1. Put breakpoint on the failing line
	2. Eclipse allows running multiple debug sessions
	3. Run > Run As > Debug JUnit Test
		1. Check Stack trace in Debug view
	4. Check variables
	5. Watch expression
		1. Must be valid expression
			1. Click > ALT + SHIFT + Up arrow (highlights innermost expression) and continue
				1. Down arrow to reverse the process

## Lesson 4 ##
1. Plan
	1. Using exception breakpoints
	2. Continue debugging
	3. Cool debugging features
2. Example:
	1. Open MyLibraryTest.java -> Run AllTests.java in debug mode
	2. Another way to find the line
		1. Open Breakpoints view (add, toggle, delete)
			1. Toggle all off
			2. Run > Add Java Exception Breakpoint
				1. NullPointerException
					1. Re-run debug session
						1. Right click in debug view > Terminate and Relaunch (breakpoint is not required)
		2. Right click on beakpoint, click on Properties > Uncheck Caught Exception (It is uncaught exception in our code)
	3. Delete all breakpoints
		1. Terminate and re-run debug session (once again we stop at 111)
			1. Window > Preferences > Debug
				1. Suspend execution on uncaught exception (JUnit catches it)
	4. Add back NullPointerException breakpoint
		1. Fix: Add a check for null in if condition
			1. Change the code in the middle of debug session

					if ((aBook.getPerson() != null) && ...)

				1. When we save, debug pointer goes one line up
				2. Resume
	5. Double click the failure
		1. Breakpoint at line
		2. Right click on method in JUnit view > Debug (only that test)
	6. Hover over variables gives value
3. Repeat the execution of lines
	1. Click on a previous line
	2. Press drop to frame button
4. Changing value of variables in the middle of program
	1. Variables view
	2. Right click on variable
	3. Change Value

## Lesson 5 ##
1. Additional feautures
	1. Hit counts + Conditional breakpoints
	2. Class breakpoints and Watchpoints
	3. Stop in Main
	4. Suspend command
	5. Step into selection
2. Makes debugging more effective and efficient
3. Hit counts + Conditional breakpoints
	1. Open MyLibrary.java
	2. goto Line 90 and put a breakpoint
		1. If looping
	3. Run MyLibraryTest.java in debug mode
	4. Right Click on breakpoint > Properties
		1. Hit count > 3 - not suspend until 3rd time we hit breakpoint
4. Conditional statement
	1. Watch `this.getBooksForPerson(p1).size()`
		1. To suspend when value is not 0
		2. Right click on breakpoint > Enable Condition

				this.getBooksForPerson(p1).size() > 0

	2. Watchpoints: associating breakpoint to field
		1. Double click on breakpoint > Watchpoint
			1. Breakpoint > Right click > Properties
				1. Suspend on
					1. Field access
					2. Field modification
		2. Breaks at every line where field is accessed or changed
5. Break when class is loaded for the first time
	1. Set breakpoint on class
	2. Right click on class breakpoint > Properties
		1. Suspended when class is loaded for the first time (constructor)
6. Another type of breakpoint
	1. Select Run > Open Debug Dialog
		1. Java Application > MyLibrary
			1. Check Stop in Main (start from first line of code)
7. To suspend a long running program
	1. Suspend debugging session
		1. MyUtilities.java > longLoop()
		2. MyUtilitiesTest.java > Uncomment @Test
			1. Run in debug mode and click suspend
8. Step into selection
	1. MyLibraryTest.java > Method entry breakpoint
	2. Step into a line later on
		1. Ctrl + Alt + Click (steps into that method)
	3. F3 to open source code for currently selected class (Ctrl + click)
		1. Press Back or Alt <- to got back

## Lesson 6 ##
1. Plan:
	1. Step into Java system classes
	2. Debug to learn about object references and equals methods
2. Debugging into Java System Classes
	1. Attaching source code allows us to browse source code but not debug into source code
	2. To debug into Java classes, need special version of Java Runtime Engine (JRE)
	3. Included with JDK 6 download (`jdk1.6.0\jre`)
	4. Need to configure Eclipse to use this special JRE (Which is in JDK)
		1. Windows > Preferences > Java > Installed JRE > Add JRE
			1. Browse > jdk1.6.0/jre
		2. Add debug jre to project
			1. Right click on project > Properties > Java Build Path > Libraries > Add Library > JRE System Library > Alternate JRE > Debug JRE
			2. Remove standard JRE (click on standard jre and select remove)
		3. We cannot see local variable values in compiled classes (Disable use step filters to step into, over, return)
3. Difference between primitive types and objects on heap
	1. Put breakpoint on primitive type

## Lesson 7 ##
1. Use debugger to look at recursive method
2. Recursive method: calls itself
	1. Something should be changing inside otherwise we may loop infinitely
3. Steps:
	1. Put method breakpoint
	2. Debug FactorialTest.java
	3. Watch parameters
	4. Look at the stack frames
4. Recursion process:
	1. Add stack frames for each method call until method stops calling itself
	2. Return result from top frame to one below. remove top stack, and continue returning results until back to original calling method.
5. Drop to frame:
	1. We can select a stack frame and click drop to frame (we lose top frames)