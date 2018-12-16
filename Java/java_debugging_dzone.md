# Java Debugging Guidelines #
1. Do not be afraid to read code (especially of others)
	1. Go as deep as possible to understand what is really happening under the hood
2. Do not blame JDK or libraries
	1. 99% of the time, the bug is in something written by you
3. Make assumptions, but do not trust yourself
	1. We might leave blind spots
4. Walk away from the problem and come back fresh
	1. Take a break
5. Do not write code without knowing what is being done
6. Check JDK [javadoc](https://docs.oracle.com/javase/8/docs/technotes/tools/windows/javadoc.html) when not sure how a Java feature works
7. Use proper log levels (info, warn, error, debug)
8. Use breakpoints to have full view of program on particular point of application
	1. Conditions on breakpoints are important when debugging loop with thousands of values
9. Use tools such as [JMeter](https://jmeter.apache.org/) for load testing or [jstack](https://docs.oracle.com/javase/7/docs/technotes/tools/share/jstack.html) to capture thread dumps
10. Have remote debugger for apps deployed on dev and pre-prod environments
11. If any of the previous guidelines don't work
	1. Start eliminating code
	2. Check environment
	3. Check libraries