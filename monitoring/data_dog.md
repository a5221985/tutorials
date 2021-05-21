# Data Dog #
## Overview ##
1. Navigation:
	1. Sidebar
		1. Expanded or minimized or hidden
2. Event stream
	1. Most recent updates to environment
	2. Search box
		1. time period selection
	3. Aggregation view
		1. What is trending
	4. Central section
		1. Event stream
3. Dashboards
	1. What colleagues defined
	2. Integrations (on the right)
	3. Can be starred to keep them on top
	4. Own dashboard
		1. Two types
			1. TimeBoard
				1. Good for troubleshooting & corelation
				2. For triage and investigation
				3. Can be defined ahead of time or adhoc to troubleshoot an issue
					1. The graphs are in sync
						1. They allow us to diagnose and pinpoint what is happening across metrics and services
			2. ScreenBoard
				1. General status boards we might want to display on TV or monitor
				2. For overall health or status of application (overall health)
				3. Widgets
					1. Graphs
					2. Query values
					3. Images
					4. ...
					5. Visual ques
						1. Healthy threshold
						2. Un-healthy threshold
	5. Hostmap
		1. Higher level view of infrastructure
		2. Each hexagon represents a host
		3. We can group and filter hosts however we want
		4. We can modify their appearance using different metrics
			1. Color
			2. Size
		5. Zoom in to hosts of most interest say
		6. If we find hosts of importance, we can go into details
			1. Detail pane is shown below (with more integrations)
			2. Click on any integration
				1. We get detailed dashboard
					1. Click on dashboard (it expands)
		7. We can save hostmaps
		8. More info
			1. http://dtdg.co/hostmapblog
			2. http://dtdg.co/hostmapdocs
		9. Details of specific host
			1. Search for infrastructure list (quicker): docker redis (say)
			2. Click on inspect - more detail
	6. Monitors
		1. Alerts & notifications (and more)
	7. Metrics
		1. Allows viewing metrics at a glance without constructing a full dashboard
		2. We can see which metrics are available in the environment
			1. Listed alphabetically
		3. If we click on the metric, we get summary of the metric
			1. Includes: Which hosts are reporting the metric
		4. Tags
		5. General info about the metric
		6. Metadata
			1. Description
			2. Unit
			3. Metric Type
			4. Ingegration
			5. Interval
		7. The info is viewable by anyone in the organization
	8. Integrations
		1. We can turn on and configure any of the integrations
		2. We can filter or scroll to find
			1. Ones currently used appear first
			2. Click
				1. Three tabs
					1. Overview - of integration
					2. Configuration - instructions to install the integration
					3. Metrics
						1. Lists all metrics avaialable for the integration
	9. API Keys
		1. APIs tab
			1. List of API keys and App keys used in the organization
		2. Event emails
			1. Email addresses used to submit events to datadog
			2. Refer to following: http://dtdg.co/ddeventsemail
	10. Agent Installation
		1. Instructions to install agents of different types in the environment
	11. Embeds
		1. We can embed dashboard graph in any webpage using iframes
		2. Any embed defined is listed here
	12. Help
		1. Docs and resources
	13. Team page
		1. Who is on our team and add other members to the team
	14. Settings page
		1. We can switch to multiple organizations if we are part of

## Collection ##
1. 

## Dashboards ##
## Functions ##
## Aggregation ##
## Notifications ##