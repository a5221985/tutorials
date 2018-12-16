# Docker for Professionals #

## Introduction ##
1. Installing software for testing
2. Possible modification of the machine while uninstalling the software
3. If software caused damage to the system
4. Solutions:
	1. Virtualization software
		1. Consumes lot of CPU, hard disk, resources
		2. An entire machine is required for testing nginx and web app
	2. Docker:
		1. A completely isolated container inside which software would run. When it is not required, a simple command will remove the container from the system.
5. What are you going to know?
	1. Use docker in daily development/testing activities
	2. Ins and outs of apps
		1. How to pull docker image and run a container from it
		2. How to interact with container and customize it to fit your needs
		3. How to make the host communicate with container (network, storage etc...)
			1. share files between host and container
		4. How to build own container and different ways to publish
6. What do I need?
	1. Windows or Mac OSX, Ubuntu 16.04
	2. Linux background (simple commands)
	3. Virtualization

## Introduction to DevOps ##
1. DevOps:
	1. Software devleopment methodologies:
		1. In order to develop a piece of software application, team must follow a set of rules that guarantee an easy and successful development process
		2. Examples: Waterfall, Prototyping, Spiral, Rapid, Agile, ...
		3. Choice depends on the type of project
	2. Agile:
		1. Most popular
		2. Waterfall:
			1. Requirements are gathered from client which gets added to "Product Requirements Document"
			2. Analysis, Design: The requirements are analyzed, models and business rules are defined
			3. Developers write code for build, test and integration
			4. Test: discovery and debugging of flaws
			5. Operations: deployment, (installation/migration), support and maintenance of application is carried out
		3. Problems: difficult to return back to previous one
		4. Agile approach:
			1. Project is built throught multiple, short iterations (a week or a month cycle)
			2. Several versions of end product are built (from least functional to the most functional)
			3. Changes, customer feedback, additional requirements are accepted and adopted in any stage (another iteration is necessary)
			4. When end product does not require any more changes, it is released to market
			5. Suits modern project requirements
		5. Cycle:
			1. Develop > Integrate & test > Demo Release > Client's feedback > Make changes > Test > All functionality complete? (yes - done/no - repeat)
	3. Agile approach needs quick feedback
		1. Product is coded in sprints - requires multiple environments created quickly and easily
			1. Before: 1 hardware server, operations team procures hardware and software.
			2. Then came: virtualization: 1 machine hosts many virtual machines each having it's set of resources. quicker in provisioning multiple environment
				1. Drawbacks: hardware procurement is reduced but OS, Lincenses, supporting software, ... needs to be procured and maintained.
		
### Inroduction to DevOps ###
### Infrastructure Needs for Agile Development ###
### DevOps Misconceptions ###

## Hello Docker! ##
### What is it? ###
### Common Docker Use Cases ###
### A Docker Example ###

## Using Docker Containers ##
### Getting Assistance on Docker Command Line ###
### LAB: Creation of a Service Monitor ###
### The PID Namespace ###
### Problems with Multiple Containers ###
### Docker Human-Friendly Names - Part A ###
### Docker Human-Friendly Names - Part B ###
### Bundling Environment Variables ###
### Recovering from Failures - Restarting ###
### Process Manager ###
### Container's Entry Point ###

## Using Docker in Software Installations ##
### Using Docker in Software Installations ###
### Docker Hub ###
### Building Your Own Image ###

## Persistent Storage ##
### Persistent Storage ###
### How to Use Volumes? ###
### LAB: Using Volumes for Creation of Persistent Data ###
### The "Bind Mount" Volume Type ###
### LAB: Creation of a Python Script Image for Parsing a CSV File ###
### Sharing Volumes - The Host-Dependent Way ###
### Generalized Volume Sharing ###

## Networking in Docker ##
### Networking in Docker ###
### Docker Network Model - Illustration ###
### Closed Container ###
### Containers' Name Resolution - Part A ###
### Controlling Connections to the Container ###
### Joined Containers ###
### How do Containers "Know" About Each Other? ###

## Using Isolation to Mitigate Risks ##
### Security and Isolation ###
### CPU Allowance ###
### Assigning a CPU Set to the Container ###
### Docker Users ###
### LAB - Handling Permissions ###

## Packaging Software in Images ##
### Software Packaging ###
### Determining Changes ###
### The Commit Command Options ###
### The Commit Command and UFS ###
### Image Layer Sizes and Limits ###
### Working with Flat File Systems ###

## Build Automation and Advanced Image Consideration ##
### Build Automation ###
### Understanding Build Automation - An Explanation ###
### LAB02: A Python Base Image ###
### Exploring Base.df File ###
### The ONBUILD Instruction ###

## Public and Private Software Distribution ##
### Distributing Your Image ###
### LAB01: Using a Hosted Registry ###
### Different Methods to Distribute Your Image Using Docker ###
### LAB02: Creation of a Hosted Repository Using an Automated Build ###
### Publishing to Private Resistries ###
### Manual Image Publishing ###
### LAB05: Using GitHub as a Sole Means of Distribution ###

## Final Project ##
### Final Project Part A ###
### Final Project Part B ###

## Summary ##
### Summary ###