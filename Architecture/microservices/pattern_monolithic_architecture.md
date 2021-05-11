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
			1. It can scale with increasing transaction volume by running more copies
			2. It cannot scale with an increase in data volume
				1. Each copy will access all of the data
					1. Makes caching ineffective
					2. Increases memory consumption and I/O traffic
		2. Different components have different resource requirements
			1. One might be CPU intensive
			2. One might be memory intensive
		3. Each component cannot be scaled independently
	6. Obstacle to scaling development
		1. Once app gets to a certain size, its useful to divide up engineering organization into teams that focus on specific functional areas
			1. Example: UI team, accounting team, inventory team, ...
		2. Monolith prevents team from working independently
			1. Teams must coordinate their development efforts and redeployments
				1. Difficult for teams to make a change and update production
	7. Requires long-term commitment to technology stack
		1. It can be difficult to incrementally adopt newer technology (or newer version)
		2. Other languages and frameworks cannot be used along with the main stack (Such as C++ with JVM ...)
		3. If platform framework becomes obsolete, it can be challenging to incrementally migrate to newer better framework
			1. It may demand re-writing the entire application (at once)
				1. This can be a risky undertaking