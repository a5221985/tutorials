# Maven #
## Introduction ##
### Instructor and course Introduction ###
### Course Guide ###
### What is Maven ###
1. Project management tool
2. Build:
	1. Compile
	2. Run Tests
	3. Package Jar/War
	4. Deploy to Server
3. Uses Convention over Configuration
	1. We follow a project structure
		1. src/main/java
		2. src/main/resources
		3. src/test/java
		4. src/test/resources
4. `mvn install`:
	1. Compiles
	2. Runs tests
	3. Packages
	4. Deploy
5. Maven provides Archetypes:
	1. Generates folder structure for us
		1. Standalone
		2. Webapp
		3. ear
6. IDEs come with support for archetypes
	1. We can build and execute within them

### Why Maven? ###
1. Advantages:
	1. Common interface for developers
		1. `mvn clean install` (standard)
	2. Dependencies are managed:
	3. Repositories:
		1. Artifacts and plugins are downloaded on the fly from repository/ies
	4. Reuse:
		1. Maven is lightweight when we install
		2. Downloads plugins on demand
			1. Compile
			2. surefire
			3. wsimport

## Simple Software Setup ##
### Introduction ###
1. JDK 1.8
2. Eclipse Java EE (Maven plugin is builtin)
3. Configure JDK in Eclipse
4. Tomcat
5. Maven

### Install Java ###
1. Download Java 8
2. Install

### Install Eclipse ###
1. Download Eclipse for Java EE Developers
2. Install it 

### Configure JDK in Eclipse ###
1. Open Eclipse
2. Eclipse > Preferences
	1. type jre
	2. Installed JREs
	3. Remove JRE
	4. Click Add
	5. Standard VM
	6. Select JDK folder
		1. `JDK-version-../contents/home` on MAC

### Install Tomcat ###
1. Download Tomcat download
2. Unzip the folder anywhere

### Configure Tomcat in Eclipse ###
1. Goto Servers view (Window > Show View > Servers)
2. Click on link
3. Apache > Tomcat v8.0
4. Installation directory: choose
5. Select JDK
6. Finish
7. Right click and click Start
	1. Console

### Maven Installation and Setup ###
1. Download Maven
2. Unzip the file
3. Open `~/.bashrc`
	1. Add the following:

			export M2_HOME=/path/to/maven
			export PATH=$M2_HOME/bin:$PATH

### Maven Installation Details ###
1. Goto Maven Installation:
	1. Open LICENSE
	2. Open NOTICE (copyright)
	3. README: how to setup and verify
	4. `bin`: scripts to execute maven
	5. `boot`: jar file which has a class loader inside which it executes
	6. `conf`: settings.xml
		1. Put it under `~/.m2`
	7. `lib`: maven core classes and dependencies

## Maven Project Creation and Key Concepts ##
### A Simple Java Project ###
1. Sample project generation:

		mvn archetype:generate -DgroupId=com.bharath -DartifactId=hellomaven -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

2. Project name: `hellomaven` (artifactId)
3. `pom.xml`
4. `src/main/java`
	1. Source code `com/bharath/App.java`
5. `src/test/java`
	1. Test code `com/bharath/AppTest.java`

### POM XML ###
1. `mvn` looks for `pom.xml`
	1. `<packaging>`
	2. `<name>`
	3. `<url>http://www.bharaththippireddy.com</url>`
	4. Maven coordinates
	5. `<dependencies>` (libraries)

### Building the Project from CommandLine ###
1. `cd hellomaven`
	1. `mvn install` (compiles, package, run tests and install)
2. `target`:
	1. Compiled classes
	2. Jar file
3. Run: `java -cp target/hellomaven-1.0-SNAPSHOT.jar com.bharath.App`

### Plugin ###
1. Plugins and Goals
	1. Plugin: Collection of one or more goals
		1. `install:install`
	2. Goal: Task run independently or part of bigger build
		1. `compile`: compiles
		2. `test`: runs surefire plugin
		3. Can take parameters:
2. `pluginId:goalId`
3. Maven uses plugins to build and deploy

### Life Cycle Phases ###
1. `mvn install`: install is lifecycle phase
	1. process-resources (resources:resources)
	2. compile (compiler:compiler)
	3. test (surefile:test)
	4. package (runs all prior phases) (jar:jar or war:war)
2. Each lifecycle phase is associated with one or more goals

### Coordinates ###
1. groupId, artifactId, version, packaging
	1. `groupId:artifactId:packaging:version`
		1. name is decided
		2. Where to store is found
2. groupId: reverse url
	1. `com.oracle`
3. artifactId: to name project (final jar or war file name)
4. version: `1.0-SNAPSHOT`
	1. `1.0`
5. Packaging: jar, war

### Repositories ###
1. Maven downloads required plugins and jars from central repository
	1. `http://repo.maven.apache.org/maven2/`
2. Artifacts are stored using a folder structure:
	1. `http://repo.maven.apache.org/maven2/junit/junit/3.8.1`
3. Need enterprise repository if artifact is not available in central repository
	1. We can push local artifacts to it
4. Maven uses local repository
	1. `~/.m2/repository`

### Assignment ###
1. Sum of two numbers
	1. mvn archetype
	2. Command line Arguments and display sum
	3. mvn install
	4. `jar -cp`

### Quiz 2: Maven Project Creation and Key Concepts ###

## Maven in Eclipse ##
### Introduction ###
1. Maven project in Eclipse
	1. usecase
	2. A standalone project
	3. Customize the settings
	4. Implement Data and Business Layers
	5. Add dependencies
	6. Build the project

### Usecase ###
1. Product Web App
	1. Productweb
		1. Creation
		2. Display
	2. Layers:
		1. web layer (servlets)
		2. business layer (pojo + spring)
		3. dao layer (pojo + spring)
2. Project:
	1. productservices
		1. Data access layer
			1. ProductDAO
			2. ProductDAOImpl
				1. Creation
				2. Read
				3. Update
				4. Delete
		2. Business Logic Layer
			1. ProductBO
			2. ProductBOImpl
		3. Unit tests
	2. productweb (war)
		1. CreateProductServlet
		2. DisplayProductServlet

### Creation of Maven Project in Eclipse ###
1. File > New > Maven Project
2. Next
3. Select archetype: maven-archetype-quickstart
4. Fill:
	1. group Id: com.bharath.product
	2. Artifact Id: productservices
	3. Version: 0.0.1-SNAPSHOT
	4. Package: com.bharath.product
5. Open pom.xml
6. Right click on project > Run As > Maven install
7. Click on App.java > Run as > Java Application

### Customize the Compiler Settings ###
1. Change JDK:
	1. Open Effective pom
		1. Search for `compiler` (old compiler)
2. Copy the following build setting into pom.xml (under `dependencies`)

		<build>
			<plugins>
				<plugin>
					<groupId>org.apache.maven.plugins</groupId>
					<artifactId>maven-compiler-plugin</artifactId>
					<version>3.2</version>
					<configuration>
						<source>1.8</source>
						<target>1.8</target>
					</configuration>
				</plugin>
			</plugins>
		</build>

	1. `source`: The source code
	2. `target`: The bytecode
3. Right click on project > Maven > Update Project

### Creation of Data Access Layer ###


### Implement the Data Access Layer ###
### Upgrading JUnit Version ###
### Writing Unit Tests ###
### Building from the Command Line ###
### Skipping Tests ###
### Skipping Tests in Eclipse ###
### Creation of Business Object Layer ###
### Spring Quick Start ###
### Adding Spring Dependencies ###
### Creation of Spring Configuration File ###
### Dependency Management ###
### Wire the Beans using Spring ###
### Build the Project ###
### Quiz 3: Maven in Eclipse ###

## Maven Web Application ##
### Introduction ###
### Creation of Web Application ###
### Creation of Servlets ###
### Add the Servlet Dependency ###
### Creation of Product HTML ###
### Section Summary ###

## Multi Module Project Creation ##
### Introduction ###
### Creation of Parent POM ###
### Update the Child POMs ###
### Build the Multi Module Project ###
### Add the Spring Web Dependency ###
### Creation of Product Servlet - Read Request Parameter ###
### Creation of Product Servlet - Invoke the BO Method ###
### Code the Display Product Servlet ###
### Configure the Spring Listener in WEB XML ###
### Build the Final Project ###
### Run the Application ###
### Quiz 4: Multi Module Project Creation ###
### Assignment ###

## Organizing the Multi Module Project ##
### Move the Projects to a Parent Folder ###
### Import the Projects in to Eclipse ###
### Import all the Project at Once ###

## Wrap Up ##
### Download the Completed Projects ###
### My Other Courses and Discussions ###