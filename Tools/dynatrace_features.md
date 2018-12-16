# DynaTrace #
## Features ##
### Application Monitoring ###
#### Identify problems in your application ####
1. Capabilities:
	1. AppMon:
		1. Scenario: Transaction
			1. Provides different views for transaction flow (topological view (a map of components), Transaction response time view (shows response times to check for bottlenecks in the system))
			2. Helps identify if the problems were caused by application or by the infrastructure
			3. Displaying following statistics about the application:
				1. Throughput
				2. Failure rate
				3. Response time
				4. System health
		2. Specific features offered to arrive at the root cause:
			1. Open detailed view of the problematic business transaction
			2. Response time hot spot view to identify API causing high repsonse time
			3. Method time hot spot view to identify methods causing high response time
			4. Transaction flow view which help to identify the following:
				1. certain tier causing performance problem
				2. Identify if too much time is spent between tiers
				3. Identify if too much traffic is flowing into database
				4. Identify performance problems with third party applications

#### Regression Analysis ####
1. Capabilities:
	1. Records pre-deployment regression session
	2. Records post-deployment regression session
	3. Analyses differences between performances before and after deployment

#### Out of memory errors ####
1. Capabilities:
	1. Shows trend of memory usage (with and without load)
		1. Can be used identify if too much memory is being consumed by application or probable thrash of Garbage collection
	2. Shows detailed view of hot stops (causing memory usage)

#### Analyze exceptions and log messages ####
1. Capabilities:
	1. AppMon:
		1. Captures "out of memory" errors and displays in dashboard
		2. Detailed view of the errors

#### Analyzing a slow transaction ####
1. Capabilities:
	1. AppMon:
		1. Shows response times
			1. Can be used to identify tiers and APIs causing slowness
			2. Shows executed SQL statements

#### Automating reporting tasks with server-side reporting ####
1. Capabilities:
	1. Automated reporting with accumulated statistics to stakeholders
		1. Through email
		2. Can give daily KPI

### Business Transaction Management ###
#### How to use Business Transactions ####
#### Follow your transactions with Transaction Flow ####
#### Creation of a splitting Business Transaction ####
#### Defining custom locations in the world map ####

### Infrastructure Monitoring ###
#### Setting up infrastructure monitoring ####
#### Setting up application availability monitoring ####
#### Using process and host health monitoring ####
#### Using host and hostgroups for large system monitoring ####
#### Using custom JMX and PMI measures in charts ####
#### How to retrieve performance metrics with Windows Performance Monitor ####

### Test Automation ###
#### Integrate web API performance monitoring in JMeter ####
#### Integrate web API performance monitoring in SoapUI ####

### REST Interfaces ###
#### Incident downtime based on Business Hours (REST) ####
#### Monitor creation (REST) ####
#### User management (REST) ####
