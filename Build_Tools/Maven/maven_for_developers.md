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
1. Project structure
	1. productservices
	2. standalone
	3. Unit Tests
	4. Business Logic Layer
		1. ProductBO
		2. ProductBOImpl
	5. Data Access Layer
		1. ProductDAO
		2. ProductDAOImpl
			1. create
			2. read
			3. update
			4. delete

### Implement the Data Access Layer ###
1. Eclipse:
	1. src/main/java
		1. com.bharath.product.dto.Product

				package com.bharath.product.dto;

				public class Product {
					private int id;
					private String name;
					private String description;
					private int price;

					// Getters and Setters
				}

	2. src/main/java
		1. com.bharath.product.dao.ProductDAO - interface

				public interface ProductDAO {
					void create(Product product);
					Product read(int id);
					void update(Product product);
					void delete(int id);
				}

		2. com.bharath.product.dao.ProductDAOImpl
			1. Implements ProductDAO

					Map<Integer, Product> products = new HashMap<>();
					
					@Override
					public void create(Product product) {
						products.put(product.getId(), product);
					}

					@Override
					public Product read(int id) {
						returns products.get(id);
					}

### Upgrading JUnit Version ###
1. pom.xml

		<dependencies>
			<dependency>
				<groupId>...</groupId>
				<artifactId>junit</artifactId>
				<version>4.4</version> <!-- Latest -->
			</dependency>
		</dependencies>

	1. Maven -> Update project

### Writing Unit Tests ###
1. Right click ProductDAOImpl > Junit Test Case
	1. Source: src/test/java
	2. Finish

			@Test
			public void createShouldInstantiateAProduct() {
				ProductDAO dao = new ProductDAOImpl();
				Product product = new Product();
				product.setId(1);
				product.setName("IPhone");
				product.setDescription("Its Awesome");
				product.setPrice(800);
				dao.create(product)
				Product result = dao.read(1);
				assertNotNull(result);
				assertEquals("IPhone", result.getName());
			}

### Building from the Command Line ###
1. productservices/
	1. `mvn install`

### Skipping Tests ###
1. `mvn install -DskipTests`

### Skipping Tests in Eclipse ###
1. Make test fail
2. Right click on project
	1. Run as
		1. Run configuration
			1. Maven Build
				1. Name: Product Services Build
				2. Goals: install 
				3. Check Skip Tests
			2. Apply
		2. Select base directory for project

### Creation of Business Object Layer ###
1. src/main/java/com.bharath.product.bo
	1. ProductBO

			public interface ProductBO {
				public void create(Product product);
				public void findProduct(int id);
			}

	2. ProductBOImpl

			public class ProductBOImpl implements ProductBO {
				ProductDAO dao;

				@Override
				public void create(Product product) {
					dao.create(product);
				}

				@Override
				public Product findProduct(int id) {
					return dao.read(id);
				}

				// setters and getters for dao
			}

### Spring Quick Start ###
1. Dependency Injection mechanism
	1. Spring injects instance of B and inject into A (through constructor of A or setter methods in A)
	2. Inversion of control container: taking responsibility of managing dependencies
2. Spring can wire UI, Services and DAO ...
	1. Autowiring is possible
3. Spring JDBC
4. Spring MVC
	1. Restful web services
5. Spring ORM Support
	1. Hibernate
	2. JPA
6. Spring Integration - JMS
7. Spring Web Services

### Adding Spring Dependencies ###
1. Maven respository spring context
	1. Copy to pom.xml
		2. spring.context

### Creation of Spring Configuration File ###
1. src/main/resources
	1. Maven update project
		1. src/main/resources/beans.xml

				<?xml version="1.0" encoding="UTF-8"?>
				<beans xmlns="http://www.springframework.org/schema/beans"
					xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:context="http://www.springframework.org/schema/context"
					xsi:schemaLocation="http://www.springframework.org/schema/beans
					http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
					http://www.springframework.org/schema/context
					http://www.springframework.org/schema/context/spring-context.xsd">

				</beans>	

### Dependency Management ###
1. scope:
	1. test - dependency is used only when compiling tests and running tests
	2. provided - excluded when bundled to war
		1. used during compilation but provided by container during runtime

### Wire the Beans using Spring ###
1. beans.xml

		<bean id="productdao" class="com.bharath.product.dao.ProductDAOImpl" />
		<bean id="productdo" class="com.bharath.product.bo.ProductBOImpl">
			<property name="dao" ref="productdao" />
		</bean>

### Build the Project ###
1. Run `maven clean install`

### Quiz 3: Maven in Eclipse ###

## Maven Web Application ##
### Introduction ###
1. Creation of Servlets
	1. Add product
	2. Display product
2. Add servlet dependency
3. HTML Page

### Creation of Web Application ###
1. Web application
	1. Maven project
		1. maven-archetype-webapp
			1. groupId: com.bharath.product
			2. artificatId: productweb
			3. Package: com.bharath.product
2. pom.xml
	1. packaging: war
	2. finalname: overrides default name (default: artifactId + version)
3. webapp/WEB-INF
	1. web.xml
4. Servlet dependencies:
	1. Right click on Project
	2. Properties
	3. Search: Targetted Runtimes
		1. Apache Tomcat ...
5. Build: `mvn install`

### Creation of Servlets ###
1. productweb
	1. creation
	2. display
2. web layer: servlets
3. business layer: pojo
4. dao layer: Spring
5. src/main/resources
	1. src/main/java (new folder)
		1. Refresh in eclipse
	2. src/main/java -> Servlet
		1. Java package: com.bharath.product.servlets
		2. Class name: CreateProductServlet
		3. URL Mapping: default
		4. `doPost` only
	3. Remove constructor and comments
6. `@WebServlet` or web.xml entry is automatically added
7. Servlet: DisplayProductDetailsServlet
	1. doGet

### Add the Servlet Dependency ###
1. Servlet dependencies:
	1. servlet geronimo maven dependency
		1. Servlet 3.0
	2. Paste in pom.xml
2. `mvn clean install`

### Creation of Product HTML ###
1. src/main/webapp/product.html

		<title>Create Product</title>
		...
		<body>
			<form method="post" action="/CreateProductServlet">
				<input name="id" />
				<input name="name" />
				<input name="description" />
				<input name="price" />
				<input type="submit" value="submit" />
			</form>

### Section Summary ###

## Multi Module Project Creation ##
### Introduction ###
1. Parent POM
	1. Change chilc POMs
2. Code the Servlets
3. Spring in WEB.XML
4. Build and Run

### Creation of Parent POM ###
1. parent pom.xml
	1. workspace (parent folder)
		2. copy pom.xml from productweb

				<artifactId>productparent</artifiactId>
				<version>1.0</version>
				<packaging>pom</packaging>

				<name>productparent</name>
				...
				<!-- Remove spring-context dependency -->
				<!-- Remove build -->
				<modules>
					<module>productservices</module>
					<module>productweb</module>
				</modules>

### Update the Child POMs ###
1. producteservices/pom.xml

		<parent>
			<groupId>com.bharath.product</groupId>
			<artifactId>productparent</artifactId>
			<version>1.0</version>
		</parent>
		<artifactId>productservices</artifactId>
		<pacakging>jar</packaging>

2. productweb/pom.xml

		<parent>
			<groupId>com.bharath.product</groupId>
			<artifactId>productparent</artifactId>
			<version>1.0</version>
		</parent>
		<artifactId>productweb</artifactId>
		<pacakging>war</packaging>

### Build the Multi Module Project ###
1. Execute maven command from parent directory
	1. `mvn clean install`
	2. Maven puts the projects in reactor:
		1. Defines build order (dependency checks are automatically done)

### Add the productservices dependency ###
1. productweb/pom.xml

		<dependency>
			<groupId>com.bharath.product</groupId>
			<artifactId>productservices</artifactId>
			<version>1.0</version>
		</dependency>

### Add the Spring Web Dependency ###
1. productweb/pom.xml
	1. spring web maven dependency (4.3.3 RELEASE)
		1. paste in pom.xml
2. Maven update project

### Creation of Product Servlet - Read Request Parameter ###
1. CreateProductServlet

		protected void doPost(...) {
			Integer id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String description = request.getParameter("description");
			Integer price = Integer.parseInt(request.getParameter("price"));

			Product product = new Product(); // dependency is resolved
			product.setId(id);
			product.setName(name);
			product.setDescription(description);
			product.setPrice(price);
		}

### Creation of Product Servlet - Invoke the BO Method ###
1. CreateProductServlet

		...
		WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletContext());
		ProductBO bean = (ProductBO) context.getBean("productbo");
		bo.create(product);

		PrintWriter out = response.getWriter();
		out.println("Product created!!");

### Code the Display Product Servlet ###
1. DisplayProductServlet:

		WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletContext());
		ProductBO bean = (ProductBO) context.getBean("productbo");
		Product product = bo.findProduct(Integer.parseInt(request.getParameter("id"));

		PrintWriter out = response.getWriter();
		out.print("Product Details");
		out.print("Product ID: " + product.getId());
		out.print("Product Name: " + product.getName());
		out.print("Product Description: " + product.getDescription());
		out.print("Product Price: " + product.getPrice());

### Configure the Spring Listener in WEB XML ###
1. webapp/WEB-INF/web.xml
	1. Spring provides a listener that will load and wire all beans together in a webapp
		1. Define the listener

				<display-name>...
				<context-param>
					<param-name>contextConfigLocation</param-name>
					<param-value>classpath:/beans.xml</param-value> <!-- searched in classpath for bean declaration -->
				</context-param>
				<listener>
					<listener-class>org.springframework.web.context.ContextLoaderListener</listener>
				</listener>

			1. 	When web app is loaded into web container, the listener will listen and load all beans	

### Build the Final Project ###
1. productweb: `mvn clean install`
	1. Unzip productweb.web
		1. WEB-INF
			1. lib:
				1. All dependencies which project needs
					1. productservices-1.0.jar

### Run the Application ###
1. product.html

		<h3>Enter Product Details</h3>
		Product Id: ... <br />
		Product Name: ... <br />
		Product Description: ... <br />
		Product Price: ... <br />

2. Right click on product.html
	1. Run as
		1. Run on Server > Tomcat
		2. Restart
	2. Refresh for cash refresh
3. product.html

		<form ... action="CreateProductServlet">
			...

	1. Submit the form
4. Right click on DisplayProductDetailsServlet
	2. Run on Server > Tomcat
	3. Append `?id=1`
5. Steps:
	1. When app gets started, web.xml is loaded
	2. Spring listener is invoked
	3. Spring listener will instantiate all beans

### Quiz 4: Multi Module Project Creation ###
### Assignment ###
1. Multi-module project
	1. User creation and display user details
		1. User
			1. id
			2. name
			3. email
		2. UserDao
			1. void create(User u); (in memory map)
			2. User read(int id);
		3. UserDaoImpl
		4. Unit tests
	2. userweb project
		1. AddUserServlet
		2. DisplayUserServlet
2. userparent pom.xml
	1. userservices pom.xml
	2. userweb pom.xml
3. mvn install

## Organizing the Multi Module Project ##
### Move the Projects to a Parent Folder ###
1. productparent
	1. productservices
	2. productweb
2. Delete projects in eclipse
	1. Not from workspace
3. New folder productparent
	1. productservices
	2. productweb
	3. pom.xml
4. cd productparent
	1. `mvn clean install`

### Import the Projects in to Eclipse ###
1. File > Import
	1. Search for Maven > Existing maven project
	2. Browse
		1. productservices
		2. productweb

### Import all the Projects at Once ###
1. Delete the projects from Eclipse
2. import > Existing maven project
	1. parentparent
	2. Finish

## Scopes ##
### The Six Scopes ###
1. `<scope>`: when the dependency is available during maven build lifecycle
	1. compile - build (source, test), test (compile), run (source, tests) (default)
	2. provided - build, test and run (but not exported with the package)
		1. war file does not contain it
		2. Web containers will have (servlet-api)
	3. runtime - run test, run app (not for compile)
	4. test - compile tests, run tests (junit)
	5. system - similar to provided but dependency is provided at system level
		1. `<systemPath>`: `${basedir}\war\WEB-INF\lib\extDependency.jar`
		2. Not provided by web container
		3. Not in maven repo
	6. import - for pom based projects

### Scopes in our projects ###
1. junit - `<scope>test</scope>`
2. spring-context - `<scope>compile</scope>`
3. gerenimo-servlet_... - `<scope>provided</scope>`

## Wrap Up ##
### Download the Completed Projects ###
### My Other Courses and Discussions ###
1. Discount coupons:
	1. [Micro Services REST APIs using Spring Data REST](http://https//www.udemy.com/microservices-rest-apis-using-spring-data-rest/?couponCode=SPRINGDATAREST%E2%80%8B)
	2. [Java Web Services](https://www.udemy.com/java-web-services/?couponCode=WSDISCOUNT4ALL)
	3. [Java Web Services Part 2](https://www.udemy.com/javawebservicespart2/?couponCode=WSPART2FORALL)
	4. [Core Java Made Easy](https://www.udemy.com/corejavamadeeasy/?couponCode=COREJAVAFORALL)
	5. [Junit and Mockito Crash Course](https://www.udemy.com/junitandmockitocrashcourse/?couponCode=JUNITFORALL)
	6. [JDBC Servlets and JSP](https://www.udemy.com/jdbcservletsandjsp/?couponCode=JAVAWEBFORALL)
	7. [XML and XML Schema in easy steps](https://www.udemy.com/xml-and-xml-schema-definition-in-easy-steps/?couponCode=XMLANDXSDFORALL)
	8. [XSLT XPATH and XQuery Fundamentals](https://www.udemy.com/xslt-xpath-and-xquery-fundamentals/?couponCode=XSLTXPATHANDXQUERY)
	9. [Maven Crash Course](https://www.udemy.com/mavencrashcourse)
	10. [Free Java Script Fundamentals](https://www.udemy.com/javascriptfundamentals/?couponCode=JAVASCRIPTFORALL)