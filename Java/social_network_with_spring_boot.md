# Social Network with Spring Boot #
## Maven Spring Boot Project ##
1. Open Eclipse for EE
2. Maven plugin config:
	1. Eclipse > Preferences > Maven
	2. Check **Download repository index updates on startup**
	3. Check **Update maven projects on startup**
	4. Okay
	5. Restart Eclipse
3. File > New > Other > Maven > Maven Project
	1. Click **Create a simple project**
	2. Fill the form:
		1. Group Id: com.caveofprogramming
		2. Artifact Id: spring-boot-tutorial
		3. Parent Project
			1. Group Id: org.springframework.boot
			2. Artifact Id: spring-boot-starter-parent
			3. Verson: 1.3.5.RELEASE
		4. Click Finish
4. Open **pom.xml**
	1. Add dependencies:
		1. Goto Dependencies tab
		2. Click Add
		3. Search for: spring-boot-starter-web
			1. Select managed version that eclipse suggests
		4. Search for: tomcat-embed-jasper
			1. Select managed version
	2. Click Save All

## Basic Web App ##
1. In pom.xml

		<properties>
			<java-version>1.8</java-version>
		</properties>
2. Right click on the project
	1. Maven > Update project ...
3. New class
	1. New > Class
	2. App
	3. Check **public static void main(String[] args)**
	4. Package: com.caveofprogramming

## Template Engines ##
1. Engines:
	1. JSP (widely used)
		1. Few issues with deployment
	2. FreeMarker (less popular)

## Adding a JSP ##
1. Src/Main/Java > New > Other > General > Folder
2. Select **src/main**
3. Name: **webapp** (standard)
4. Under **webapp**
	1. New > Other > General > Folder
	2. **WEB-INF** (secured from website)
		1. Right click
		2. New > Other > General > Folder
		3. jsps
			1. New > Other > JSP
			2. home.jsp
5. Content:
	
		<body>
			Hello World JSP!
		</body>
5. Open **localhost:8080** in browser
6. Changing Jsp file does not need server restart but just page refresh.

## Packaging the App ##
1. Example commandline commands:
	1. `mvn archetype:generate`
		1. specify archetype (template project)
			1. `maven-archetype-quickstart`
				1. Returns the number (1)
				2. `1`
		2. Choose version:
			1. `6`
		3. Specify group id:
			1. `com.caveofprogramming`
		4. Specify archetype id:
			1. `spring-boot-test`
		5. Specify verison:
			1. `1.0`
		6. Specify package:
			1. `com.caveofprogramming`
	2. Goto `spring-boot-test`
		1. Look at the structure
2. Packaging:
	1. Open `pom.xml`
	2. Change package to `war`
	3. Add maven plugin
		
			<build>
				<plugins>
					<plugin>
						<groupId>org.springframework.boot</groupId>
						<artifactId>spring-boot-maven-plugin</artifactId>
						<configuration>
							<executable>true</executable>
						</configuration>
					</pluign>
				</plugins>
			</build>		

		1. `<executable>true</executable>`: executable war is created
	4. Package using mvn
		1. `mvn package`
		2. Goto `target`
			1. `spring-boot-tutorial-1.0.war`
	5. Run the project using mvn
		1. `mvn spring-boot:run` **(M)**

## Building with Eclipse ##
1. Run configuration:
	1. Click down arrow beside `Run`
		1. Click **Maven Build**
			1. Click New launch configuration
				1. Give a name: Spring Boot Build
				2. Base directory:
					1. Browse and choose the project
				3. Goals: package
				4. Click apply
			2. Click Eclipse > Preferences
				1. Goto **RunDebug**
				2. Click **Launching**
				3. Select **Launch the previously launched application**
					1. Each Run uses the previously configured Run configuration
			3. Click **Run Configuration**
				1. Select **Spring Boot Build**
	2. Multiple goals
		1. `package spring-boot:run`

## Executable Wars ##
1. `java -jar spring-boot-test.war` (runs embedded tomcat)
2. `./spring-boot-test.war` (launches spring app directly)

### Ways of Deploying Executable Wars ###
1. Methods:
	1. Install a web package as a program (search)
	2. Deploy to existing installation of Tomcat (may require restart)
	3. OpenShift.com, Heroku.com (PaaS)
		1. Not easy to upload war file

## Deploying to Exisiting Tomcat ##
1. Changes to App
	1. Add a dependency
		1. `spring-boot-starter-tomcat`
		2. Open pom.xml
			
				<dependency>
					<groupId>org.springframework.boot</groupId>
					<artifactId>spring-boot-starter-tomcat</artifactId>
					<scope>provided</scope>
				</dependency>

	2. Change App.java
		
			public class App extends SpringBootServletInitializer {
				...
				@Override
				protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
					return application.sources(App.class);		
				}
				...
			}

2. Start Tomcat:
	1. `cd apache-tomcat-9.0.0.M9/conf`
	2. `vi tomcat-users.xml`
	3. Add the following towards the end

			<role rolename="manager-gui"/>
  			<user username="tomcat" password="s3cret" roles="manager-gui"/>

	4. `cd ../bin`
	5. `sudo startup.sh`
3. Goto `localhost:8080`
4. Click **Manager App**
5. Under **WAR file to deploy**
	1. Click **Choose File**
		1. Select the *.war file
	2. Click **Deploy**
6. Click `/spring-boot-tutorial-0.0.1-SNAPSHOT` link

## Multiple Pages and Controllers ##
1. App.java

		@RequestMapping("/about")
		String about() {
			return "about";
		}

2. src/main/webapp/WEB-INF/jsps
	1. New JSP file
	2. about
	
			<body>
				About
			</body>
3. `http://localhost:8080/about`

### Logical grouping of pages ###
1. Using separate controllers
	1. New class `com.caveofprogramming.controllers.PageController`
	2. Content:

			@Controller
			public class PageController {

				@RequestMapping("/")
				String home() {
					return "home";
				}

				@RequestMapping("/about")
				String about() {
					return "about";
				}

			}

	3. App.java

			@EnableAutoConfiguration
			@ComponentScan **(M)**
			public class App extends SpringBootServletInitializer {

				public static void main(String[] args) {
					SpringApplication.run(App.class, args);
				}

				@Override
				protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
					return application.sources(App.class);
				}

			}

2. AuthController
	1. New `com.caveofprogramming.controllers.AuthController`

			@Controller
			public class AuthController {

				@RequestMapping("/admin")
				String admin() {
					return "admin";
				}

			}
	2. App.java (Replace `@EnableAutoConfiguration` and `@ComponentScan` with `@SpringBootApplication` (Three annotations in one) **(M)**)

## Setting up Apache Tiles ##
1. Used to specify layout of site in a single config file
2. Add dependencies:
	1. `tiles-core` **(M)** (add latest)
	2. `tiles-jsp` **(M)** (add same version)
	3. `jstl` **(M)** (add managed)
		1. tag library for displaying data
3. Add property to pom.xml

		<properties>
			...
			<tiles.version>3.0.5</tiles.version>
		</properties>

			...
		<dependency>
			...
			<version>${tiles.version}</version>
		</dependency>
4. App.java

		@Bean
		public TilesConfigurer tilesConfigurer() {
			TilesConfigurer tilesConfigurer = new TilesConfigurer();
			String[] defs = {"/WEB-INF/tiles.xml"};
			tilesConfigurer.setDefinition(defs)
			return tilesConfigurer;
		}

		@Bean
		public UrlBasedViewResolver tilesViewResolver() {
			UrlBasedViewResolver tilesViewResolver = new UrlBasedViewResolver();
			tilesViewResolver.serViewClass(TilesView.class);
			return tilesViewResolver;
		}

## Tiles Definition ##
1. New `/WEB-INF/layouts`
2. New `/WEB-INF/layouts/default.jsp`
	
		<%@ page ... %>
		<%@ taglib url="http://tiles.apache.org/tags-tiles" prefix="tiles"%>		
		...

		<body>
			<tiles:insertAttribute name="content" />
		</body>

3. New `/WEB-INF/tiles`
4. New `/WEB-INF/tiles/home.jsp`

		<%@ page ... %>

		Hello World tiles!
5. New `WEB-INF/tiles.xml`

		<?xml version="1.0" encoding="ISO-8859-1" ?>
		<!DOCTYPE tiles-definitions PUBLIC
       		"-//Apache Software Foundation//DTD Tiles Configuration 3.0//EN"
       		"http://tiles.apache.org/dtds/tiles-config_3_0.dtd">
		<tiles-definitions>
  			<definition name="app.homepage" template="/WEB-INF/layouts/default.jsp">
    			<put-attribute name="content" value="/WEB-INF/tiles/home.jsp" />
  			</definition>
		</tiles-definitions>

6. Change `@RequestMapping("/")` method to return tiles definition

		@RequestMapping
		String home() {
			return "app.homepage";
		}

## Adding and Extending Tiles Definitions ##
1. tiles.xml

		<put-attribute name="title" value="Spring Boot Demo" />

2. default.jsp

		<head>
			<title><tiles:insertAttribute name="title" /></title>
		</head>

3. Extending definition

		<definition name="app.default" template="/WEB-INF/layouts/default.jsp">
			<put-attribute name="title" value="Spring Boot Demo" />
		</definition>

		<definition name="app.homepage" extends="app.default">
			<put-attribute name="content" value="/WEB-INF/tiles/home.jsp" />
		</definition>

		<definition name="app.about" extends="app.default">
			<put-attribute name="about" value="/WEB-INF/tiles/about.jsp" />
		</definition>

4. Remove `jsps` folder
5. about.jsp

		<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

		This page has content about the site!

6. App.java

		@RequestMapping("/about")
		String about() {
			return "app.about";
		}

## Static Resources - Bootstrap ##
1. `webapp/css`
2. `webapp/js`
3. `webapp/img`
4. Download bootstrap
	1. Search in google and download latest
5. Extract
6. Copy `bootstrap.min.css.map` and `bootstrap.min.css` to `webapp/css`
7. Copy `bootstrap.min.js` to `webapp/js`
8. `default.jsp`

		<head>
			<meta ...>
			<meta ...>
			<meta ...>
			<title>...</title>

			<!-- Bootstrap -->
					...
			<![endif] -->
		</head>
		<body>
			<!-- JQuery ... -->
			...
			<!-- Include ... -->
			...
		</body>

9. Checking
	1. View source and click on links and they should be accessible

## Adding a Bootstrap Navbar ##
1. search for bootstrap navbar (makes sure version matches bootstrap version)
2. View and copy the entire source code inside body
3. Change the following:
	1. Project Name to Spring Boot Tutorial
	2. Remove drop down menu
	3. Remove right side links but one
	4. Leave about and change link to /about
	5. Leave home and change link to /home
	6. Change link of Project to /

## Styling the Navbar ##
1. `webapp/css/main.css`

		.navbar {
			background-color: orange;
			border-color: orange;
		}		

		.nabvar > .container > div > .navbar-nav > li > a {
			background: none;
			color: white;
			font-weight: bold;
		}

		.nabvar > .container > div > .navbar-nav > li > a:hover {
			background: none;
			color: yellow;
			font-weight: bold;
		}

		.navbar > .container > .navbar-header > a {
			background: none;
			color: white;
			font-weight: bold;
		}

		.navbar > .container > .navbar-header > a:hover {
			background: none;
			color: yellow;
			font-weight: bold;
		}

2. `default.jsp`

		<link href="/css/main.css" ref="stylesheet"> **(M)**
		
	
		
