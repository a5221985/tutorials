# Pattern: Monolithic Architecture #
## Resulting context ##
1. Benefits
	1. Simple to develop
		1. Current development tools and IDEs support development of monolithic applications very well
	2. Simple to deploy
		1. Simply deploy war file (or jar file or directory hierarchy) on appropriate runtime (Tomcat, Weblogic, ...)
	3. Simple to scale
		1. Can be scaled by running multiple copies of the application behind a load balancer
3. Drawbacks (If application becomes large & team grows in size)
	1. Application can be difficult to understand and/or modify (especially to new developers)
		1. May cause development to slow down
			1. Modularity may break down over time because there are no hard module boundaries
		2. Quality of code may decline over time because it can be difficult to understand how to correctly implement a change
			1. The problem may get worse over time
	2. Overloaded IDE
		1. Large code base can slow down the IDE which may make developers less productive
	3. Overloaded web container
		1. Larger the application, the longer it can take to start up
			1. This can impact developer productivity (time wasted for application to start)
			2. Also impacts deployment
	4. Continuous deployment is difficult
		1. Large monolithic app can be an obstacle to frequent deployemnts
			1. To update one component, we have to re-deploy the entire app
			2. Interrupts background tasks
				1. Quartz jobs in Java app (say)
				2. Even though the change has no relationship with the background tasks
			3. There is a possibility that components not related to change may fail to start correctly
				1. Risk with re-deployment increases
					1. Hence frequent updates get discouraged
						1. Very impactful for UI developers
							1. They usually need to iterate rapidly and redeploy frequently
	5. Scaling application can be difficult
		1. Monolith can scale only in one dimension
			1. 