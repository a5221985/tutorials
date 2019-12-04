# Java Performance Tools: Nine Types of Tools You Need to Know! #
## Introduction ##
1. Challenge: 
	1. Managing application performance: keeping it in good condition
	2. Java: Garbage collection
		1. Too many collections has toll on performance
		2. Keeping track of performance

## Java Profilers ##
1. CPU and memory consumption hotspots
2. Setup Apache JMeter job to hit an endpoint a few thousand times while linking to a profiler
	1. Specs out memory and CPU requirements for production
	2. Visual VM
3. Pros: we can track memory leaks
	1. running garbage collection and review memory consumption
		1. we can detect classes and processes that are holding on to memory in error
4. Cons: Requires direct connection to monitored JVM
	1. Limits usage to development environments in most cases
		1. there are profilers that work off thread and memory dumps in limited fashion
5. Popular tools:
	1. VisualVM
	2. JProfiler
	3. YourKit
	4. Java Mission Control

## Tracing Java Web Requests and Transactions ##
1. Focus is on individual web requests or transactions
2. Prefix: provides deep level performance details about app
	1. ORM calls with generated SQL
	2. SOAP/REST API calls
	3. trace details of most commonly used third-party libraries and frameworks
3. XRebel: Uses Java Agent on web app's container
	1. An overlay on application that gives details about current request
4. Prefix: Tool that gives very detailed traces of what code is doing
5. Pros: 
	1. Well formatted reporting of vast data given by JVM profiler
	2. Tracing what methods are responsible for response time
6. Cons:
	1. Designed for development cycle only
	2. QA and Production environments will require APM solution 

## Java Application Performance Management (APM) ##
1. APM - Application Performance Management
	1. Tools
	2. For tracking all requests on production system
2. The tools provide right info in smart way so as not to impact production performance
	1. Done by aggregating timing statistics and sampling traces
	2. Gives method level visibility to your code running in production
3. Pros:
	1. ability to monitor most critical environment
		1. Prod
	2. Identify issues before going to production in QA/Staging
	3. Debug production lives by analyzing traces and exceptions
	4. Summaries to see highly used requests to help focus dev time
4. Cons:
	1. Expensive to run on all servers (QA, Stage, Prod)
	2. Some tools do not support async queries (or not tuned properly and slow down app)
5. Tools:
	1. New Relic
	2. Microsoft
	3. Stackify (free trial)
	4. AppDynamics
	5. Dynatrace
	6. ...

## Real User Monitoring (RUM) ##
1. Interactive experience may need good deal of dependencies (JS framework, CSS framework, web fonts, images)
2. RUM - provides insight into application's dependencies by giving visibility to 
	1. asset download
	2. page rendering time
3. Google PageSpeed - standalone product

## JVM Performance Metrics ##
1. JVM provides info such as
	1. Garbage collection
	2. Memory usage
	3. Thread count
2. JMX can access the data
3. Stackify Retrace:
	1. Provides JVM metric monitoring via 
		1. App Monitors
	2. Applies smart defaults (based on type of application)
4. Pros:
	1. Available to apps running on JVM
	2. It can connect to apps such as JConsole

## Web Server (Apache/Nginx) Access Logs ##
1. Proxying requests through Apache or Nginx to Java app server can be monitored using access logs
	1. Tells how long requests are taking
2. Access logs can be aggregated to see most
	1. popular endpoints
	2. fastest endpoints
	3. slowest endpoints
3. Apache Viewer:
	1. for small data sets
4. Hosted logging solution:
	1. For stage and production
5. 

## Tracking All Java Exceptions ##
## Monitoring Java Exceptions ##
## Memory Analysis ##
