# Spring Framework 5 #
## Introduction ##
### Course Introduction ###
### Instructor Introduction ###
### Setting up your Development Environment ###
1. Prerequisites:
	1. Java JDK 1.8 or higher
	2. Maven 3.2.5 or higher
		1. Ideally for commandline use
	3. Gradle 3.4.1 or higher installed
		1. `sdk install gradle 4.1` - Mac
2. IDE: IntelliJ IDEA - 2017.2
	1. EAP is available
	2. Ultimate Edition Recomended
	3. Community Edition does not have Spring Support
	4. Free 30 Day Evaluation
	5. Students/ Open Source developers can apply for a free license
3. Other IDEs: (not checking in IDE specific files)
	1. STS
	2. Eclipse
	3. Netbeans
	4. JDeveloper
4. Verify:
	1. `java -version` - Runtime 
	2. `javac -version` - JDK (Oracle or Open JDK)
	3. `mvn -v`
	4. `gradle -v`

### What's New in Spring Framework 5? ###
1. First major release after 4 in December 2013
2. Now it is RC3 in July 18th 2017 - final release to first GA (General Availability)
3. Features:
	1. JDK baseline update
	2. Core framework revision
	3. Core container updates
	4. **Functional programming with Kotlin**
	5. **Reactive Programming Model**
	6. Testing improvements
	7. Library support
	8. Discontinued support
4. Codebase runs on Java 8
	1. Minimum requirement is Java 8
	2. Java 9 is expected in September 2017

#### Core Framework Revision ####
1. Use of new features of Java 8
	1. Java 8 reflection enhancement - Method parameters in Spring framework 5 can be efficiently accessed
	2. Spring framework interfaces provide selective declarations built on Java 8 default methods
	3. `@Nullable` and `@NotNull` annotations - mark nullable arguments and return values.
		1. Deals with null values at compile time and not throwing `NullPointerException` at runtime
2. Logging:
	1. Out of the box Commons Logging bridge module - spring-jcl (instead of standard Commons Logging)
	2. It will auto detect Log4j 2.x, SLF4J, JUL (java.util.logging) without extra bridges
3. Resource abastraction - isFile indicator for thegetFile method

#### Core Container Updates ####
1. Support for candidate component index - an alternative to classpath scanning
	1. shortcut for candidate component identification step in classpath scanner
2. App build task can define its own META-INF/spring.components file for current project.
	1. During compilation, source model is introspected and JPA entities and Spring Components are flagged
3. Reading entities from index (rather than classpath scan) does not have significant differences for small projects with less than 200 classes.
4. Loading component index is cheap.
	1. Startup time with index remains constant as number of classes increases. (but for component scan startup time increases significantly)
	2. Startup time for app is reduced significantly
	3. [Spring's Jira](https://jira.spring.io/browse/SPR-11890)
5. `@Nullable` - indicators for optional injection points
	1. Consumers must prepare for a value to be null
	2. Previously - Achieved using Android's Nullable, Checker Framework's Nullable, JSR 305's Nullable
6. Other features:
	1. Implementation of functional programming style in `GenericApplicationContext` and `AnnotationConfigApplicationContext`
	2. Consistent detection of transaction, caching, async annotations on interface methods
	3. XML configuration namespaces streamlined towards unversioned schemas

#### Functional Programming with Kotlin ####
1. Support for JetBrains Kotlin language
	1. Kotlin - Object oriented language supporting functional programming style
		1. Runs on JVM but not limited to it
	2. Functional spring programming in Spring (functional web endpoints, bean registration)
2. Example: Web functional API

		{
			("/movie" and accept(TEXT_HTML)).nest {
				GET("/", movieHandler::findAllView)
				GET("/{card}", movieHandler::findOneView)
			}
			("/api/movie" and accept(APPLICATION_JSON)).nest {
				GET("/", movieApiHandler::findAll)
				GET("/{id}", movieApiHandler::findOne)
			}
		}

3. Example: Bean registration

		val context = GenericApplicationContext {
			registerBean()
			retisterBean { Cinema(it.getBean()) }
		}

#### Reactive Programming Model ####
1. Reactive stack Web framework
	1. Fully reactive and non-blocking - for event-loop style processing that can scale with small number of threads
2. [Reactive Streams](http://springframework.guru/reactive-streams-in-java/) - API specification developed by engineers from Netflix, Pivotal, Typesafe, Red Hat, Oracle, Twitter and Spray.io
	1. Common API for reactive programming implementations (Like JPA for Hibernate)
	2. It is officially part of Java 9
		1. In Java 8, we need to include dependency for Reactive Streams API specification
	3. Streaming support is built upon [Project Reactor](https://projectreactor.io/) - implementation of Reactive Streams API specification
3. New Spring-webflux module that supports reactive HTTP and WebSocket clients.
4. Support for reactive web apps running on servers which includes REST, HTML, WebSocket style interactions
5. [Reactive Streams](http://springframework.guru/reactive-streams-in-java/)
6. Two distinct programming models on server-side in spring-webflux
	1. Annotation-based with `@Controller` and other annotations of Spring MVC
	2. Functional style routing and handling with Java 8 lambda
7. Webclient can be created which is reactive and non-blocking as an alternative to RestTemplate
	1. Example: WebClient implementation of REST endpoint

			WebClient webClient = WebClient.create();
			Mono person = webClient.get()
				.uri("http://localhost:8080/movie/42")
				.accept(MediaType.APPLICATION_JSON)
				.exchange()
				.then(response -> response.bodyToMono(Movie.class));

8. Traditional Spring MVC is fully supported

#### Testing Improvements ####
1. Support for Junit 5 Jupiter
	1. Jupiter subproject provides test engine to run Jupiter based tests on Spring
2. Parallel test execution in Spring TestContext framework.
3. For reactive programming:
	1. spring-test includes WebTestClient for integration of test support for WebFlux
		1. Does not need a running server
		2. Mock request and response can bind directly to WebFlux server infrastructure
4. [Enhancements in TestContext framework](https://github.com/spring-projects/spring-framework/wiki/What%27s-New-in-the-Spring-Framework#testing-improvements)
5. Full support for Junit 4

#### Library Support ####
1. Upgraded libraries:
	1. Jackson 2.6+
	2. EhCache 2.10+ /3.0 GA
	3. Hibernate 5.0+
	4. JDBC 4.0+
	5. XmlUnit 2.x+
	6. OkHttp 3.x+
	7. Netty 4.1+

#### Discontinuted Support ####
1. Discontinued support for following packages:
	1. beans.factory.access
	2. jdbc.support.nativejdbc
	3. mock.staticmock of spring-aspects module
	4. web.view.tiles2M. Now Tiles 3 is minimum requirement
	5. orm.hibernate3 and orm.hibernate4. Now Hibernate 5 is supported
2. Discontinued support for following libraries:
	1. Portlet
	2. Velocity
	3. JapserReports
	4. XMLBeans
	5. JDO
	6. Guava

#### Summary ####
1. Highlight:
	1. Reactive programming
		1. Child projects may implement reactive features
		2. Features may be added to Spring Data, Spring Security, Spring Integaration ...
		3. Implemented reactive support for MongoDB and Redis
		4. No reactive support for JDBC because JDBC is blocking yet
		5. Downstream technologies must provide reactive support
		6. Spring Framework 5 uses Reactor (Reactive Streams compliant implementation)
		7. [Reactive Streams Specification](http://springframework.guru/reactive-streams-in-java/)

## Building a Spring Boot Web App ##
### Introduction ###
1. Simple Spring Application
2. Tomcat setup
3. Database

### Spring Initializr ###
1. Download pre-configured spring application
	1. `start.spring.io`
		1. Generate a: Maven Project
		2. with Spring Boot: 2.0.0 (SNAPSHOT)
		3. Group: guru.springframework
		4. Artifact: spring5webapp
		5. Web
			1. Web
		6. SQL
			1. JPA
			2. H2
		7. Template Engine
			1. Thymeleaf
		8. Ops
			1. Actuator
	2. Generate Project: Downloads a zip file

### Open Project in IntelliJ ###
1. Unzip the file in working directory
	1. `Documents/springframeworkguru/spring5/<file>`
		1. `mvnw` - wrapper to execute maven (mvn is not required)
		2. `src` - standard Java project
			1. ... resources -> application.properties
2. File -> New -> Project from Existing Sources
	1. Select spring5webapp
	2. Select Maven
	3. Import Maven projects automatically
	4. Profile:
		1. may be selected
	5. SDK - 1.8
	6. Finish
3. `pom.xml`
	1. parent: `spring-boot-starter-parent`
		1. Inherits version information
	2. Dependency tree
		1. Dependencies
4. Running the app
	1. Terminal
		1. `./mvnw spring-boot:run`

### Using JPA Entities ###
1. JPA: Java Persistence API
2. JPA is official API for working with relational data in Java
3. JPA is only a spec
	1. JPA is not a concrete implementation
4. JPA is a bridge from Java's object world to how data is stored in relational databases
5. ORM - Object Relational Mapping
6. JPA offers Java developers database independence
7. One API will support many relational databases
8. JPA 2.0
	1. Java Community Process as JSR 317
	2. Approved in December 2009
	3. Added support for embedded objects and ordered lists
	4. Added criteria query API
	5. Added SQL Hints
	6. Added Validation
9. JPA 2.1
	1. JSR 338
	2. Approved in December 2013
	3. Added custom type converters
	4. Criteria Update/Delete for bulk updates & deletes
	5. Schema Generation
	6. Queries against stored procedures
10. Databases supported by Hibernate
	1. Oracle 11g
	2. DB2 9.7
	3. Microsoft SQL Server 2008
	4. Sybase ASE 15.5
	5. MySQL 5.1, 5.5
	6. PostgreSQL 8.4, 9.1
	7. Others: Apache Derby, Informix, MS Access, H2, Oracle 12c
11. Hibernate 5
	1. Released in September 2015
	2. Commercial support avaialable from Red Hat
	3. Adopted by Spring Framework in version 4.2 (July 2015)
	4. Adopted by Spring Boot in version 1.4 (January 2016)
	5. Has extension to API
12. Implementation
	1. spring5webapp > model > Author

			@Entity
			public class Author {

				@Id
				@GeneratedValue(strategy = GenerationType.AUTO)
				private Long id; // Leakage from ORM into Java world
				private String firstName;
				private String lastName;
				
				@ManyToMany
				private Set<Book> books = new HashSet<>();

				public Author() {
				}

				public Author(String firstName, String lastName) {
					this.firstName = firstName;
					this.lastName = lastName;
				}

				public Author(String firstName, String lastName, Set<Book> books) {
					this.firstName = firstName;
					this.lastName = lastName;
					this.books = books;
				}

				// Getter and setter for id

				public String getFirstName() { return firstName; }
				public void setFirstName(String firstName) { this.firstName = firstName; }
				public String getLastName() { return lastName; }
				public void setLastName(String lastName) { this.lastName = lastName; }
				public Set<Book> getBooks() { return books; }
				public void setBooks(Set<Book> books) { this.books = books; }
			}

	2. spring5webapp > model > Book

			@Entity
			public class Book {

				@Id
				@GeneratedValue(strategy = GenerationType.AUTO)
				private Long id;
				private String title;
				private String isbn;
				private String publisher;

				@ManyToMany
				private Set<Author> authors = new HashSet<>();

				public Book() {
				}

				public Book(String title, String isbn, String publisher) {
					this.title = title;
					this.isbn = isbn;
					this.publisher = publisher;
				}

				public Book(String title, String isbn, String publisher, Set<Author> authors) {
					this.title = title;
					this.isbn = isbn;
					this.publisher = publisher;
					this.authors = authors;
				}
	
				// Getters and Setters
			}

13. Open database console: `http://localhost:8080/h2-console/`
	1. Enable console
		1. `application.properties`
		
				spring.h2.console.enabled=true

	2. Form inputs:
		1. Driver class: `org.h2.Driver`
		2. JDBC URL: `jdbc:h2:mem:testdb`
		3. User Name: sa
		4. Password: empty
14. Changing schema:
	1. Author

			@ManyToMany(mappedBy = "authors")

		1. If association is bidirectional, one side has to be the owner and one side has to be the inverse end (i.e it will be ignored when updating the relationship values in the association table)
		2. Side which has `mappedBy` is inverse side
		3. Side which does not have `mappedBy` is owner
			1. This side is looked at by Hibernate to know which association exists
			2. If we add a Foo to the set of Foos of a Bar, new row will be inserted by Hibernate in the table but if we add a Bar to the set of bars of a Foo, nothing will be done
		4. `@ManyToMany` - the entity owns its ManyToMany relationship

	2. Book

			@ManyToMany()
			@JoinTable(name = "author_book", joinColumns = @JoinColumn(name = "book_id"), inverseJoinColumns = @JoinColumn(name = "author_id"))
			...

		1. Example:

				@JoinTable(
					name = "MY_JT",
					joinColumns = @JoinColumn(
						name = "PROJ_ID",
						referencedColumnName = "PID"
					),
					inverseJoinColumns = @JoinColumn(
						name = "TASK_ID",
						referencedColumnName = "TID"
					)
				)

			1. Third table name: MY_JT
				1. Column: PROJ_ID --> PID (in PROJECT)
				2. Column: TASK_ID --> TID (in TASK)

### Using GitHub ###
1. For Git and GitHub
2. GitHub for open source development
	1. Collaboration
	2. Be proficient
3. Video: What is GitHub?
	1. Social coding
	2. fork
4. Video: GitHub and Git Foundations - YouTube Playlist

### Code Examples in GitHub ###
1. Track the project in GitHub

### Spring Data JPA Repositories ###
1. What is Spring Data JPA?
	1. Spring Data Repositories:
		1. Provides an Implementation of the Repository Pattern
		2. Concept is originally from Evic Evan's book Domain Driven Design
		3. A repository has methods for retrieving domain objects should delegate to a specialized Repository object such that alternative storage implementations may be interchanged
		4. This is important. It allows us to easily substitute the persistence layer.
			1. SQL to NoSQL
	2. Spring Data JPA
		1. Spring Data JPA is part of a larger family of Spring Data projects
		2. Uses Hibernate for persistence to supported RDBS systems
			1. Just about any major relational database
		3. You extend a Java Repository Interface
		4. Spring Data JPA provides implementation at run time
		5. No SQL Required!
2. We don't have to write
	1. Transaction management
	2. SQL
	3. Database connections
3. Spring framework manages the above
4. Simply extend Spring Repository Interface
	1. It has crud operations (Just give entity type)
		1. find object
		2. save object
		3. search object
		4. get all objects
5. Give entity type
6. Spring Data JPA gives implementation at runtime
	1. It does Transaction management, connections, uses Hibernate
7. Implementation:
	1. New package > repositories
	2. New Java class > AuthorRepository
	
			public interface AuthorRepository extends CrudRepository<Author, Long> {
			}

	3. New Java class > BookRepository

			public interface BookRepository extends CrudRepository<Book, Long> {
			}

### Initializing Data with Spring ###
1. Bootstrap class to populate data in database
2. New package > DevBootstrap
	1. New class > DevBootstrap

			@Component // Becomes spring bean
			public class DevBootstrap implements ApplicationListener<ContextRefreshedEvent> { // event that we want

				private AuthorRepository authorRepository;
				private BookRepository bookRepository;

				public DevBootstrap(AuthorRepository authorRepository, BookRepository bookRepository) {
					this.authorRepository = authorRepository;
					this.bookRepository = bookRepository;
				}

				@Override
				public void onApplicationEvent(ContextFreshedEvent contextRefreshedEvent) {
					initData();
				}

				private void initData() {
					// Eric
					Author eric = new Author("Eric", "Evans");
					Book ddd = new Book(title: "Domain Driven Disign", isbn: "1234", publisher: "Harper Collins");
					eric.getBooks().add(ddd);
					ddd.getAuthors().add(ddd);
					
					authorRepository.save(eric);
					bookReposiroty.save(ddd);
					
					// Rod
					Author rod = new Author("Rod", "Johnson");
					Book noEJB = new Book(title: "J2EE Development without EJB", isbn: "23444", publisher: "Worx");
					rod.getBooks().add(noEJB);

					authorRepository.save(rod);
					bookRepository.save(noEJB);
				}
			}

1. Good for local development

### Assignment - Add Publisher Entity ###
1. Add a new entity 'Publisher', with name and address attributes
2. Remove publisher string from Book entity. Add Publisher use a `@OneToOne` relationship
3. Add Publisher repository
4. Modify DevBootstrap to populate publisher/book entity
5. Inspect DB in H2 Console

### Assignment Review of Add Publisher Entity ###
### Introduction to Spring MVC ###
1. What is MVC
	1. MVC is a common design pattern for GUI and Web Applications
		1. M = Model
		2. V = View
		3. C = Controller
2. Working
	1. Client (Request) -> Controller -gets-> Model -given-to-> View (renders view to client)
3. Spring MVC
	1. Client sends a request to Dispatcher Servlet (Front controller)
	2. Dispatcher servlet refers to Handler Mapping
	3. Handler Mapping determines the Controller
	4. Dispatcher servlet refers to Controller
	5. Controller is wired up to a Service layer
	6. Service layer gets Data and returns back to Controller
	7. Controller sends Model (POJO) to Dispatcher Servlet
	8. Dispatcher Servlet sends the Model to View (JSP, Velocity, Thymeleaf)
	9. HTML is rendered back to client

### Configuring Spring Controllers ###


### Thymeleaf Templates ###
### Assignment - Display List of Authors ###
### Assignment Review - Display List of Authors ###
### Conclusion ###

## Dependency Injection with Spring ##
### Introduction ###
### SOLID Principles of OOP ###
### Creation of Spring DI Example Project ###
### The Spring Context ###
### Basics of DI ###
### Dependency Injection without Spring ###
### Dependency Injection using Spring Framework ###
### Using Qualifiers ###
### Primary Beans ###
### Spring Profiles ###
### Default Profile ###
### Spring Bean Life Cycle ###
### Dependency Injection Assignment ###
### Dependency Injection Assignment Review ###
### Spring Bean Life Cycle Demo ###
### Flashcards ###
### Single Responsibility Principle ###
### Open Closed Principle ###
### Liskov Substitution Principle ###
### Interface Segragation Principle ###
### Dependency Inversion Principle ###
### Conclusion ###

## Building A Spring Boot Jokes App ##
### Introduction ###
### Assignment - Build a Spring Boot Jokes App ###
### Creation of Spring Boot Project ###
### Adding Maven Dependencies ###
### Creation of Spring Service Layer ###
### Creation of Spring MVC Controller ###
### Creation of View Layer ###
### Tips and Tricks - Custom Banner ###
### Conclusion ###

## Spring Configuration ##
### Introduction ###
### Spring Configuration Options ###
### Spring Stereotypes ###
### Component Scan ###
### Java Configuration Example ###
### Spring XML Configuration Example ###
### Using Factory Beans ###
### Spring Boot Configuration ###
### Spring Boot Configuration Demo ###
### Spring Bean Scope ###
### Flashcards ###
### Conclusion ###

## External Properties ##
### Section Overview ###
### Property Source ###
### Spring Environment Properties ###
### Multiple Property Files ###
### Spring Boot Application.properties ###
### Introduction to YAML ###
### Spring Boot YAML Properties ###
### Property Hiararchy ###
### Spring Boot Profile Properties ###
### Conclusion ###

## Web Development with Spring MVC ##
### Introduction ###
### Assignment: Creation of Recipe Project ###
### Assignment Review - Creation of Recipe Project ###
### Creation of Index Page ###
### HTTP Protocol ###
### HTTP Request Methods ###
### Chrome Developer Tools ###
### Firefox Firebug ###
### Fierfox Developer Edition ###
### Safari Web Inspector ###
### Axis TCPMon ###
### Spring Boot Development Tools ###
### IntelliJ Compiler Configuration ###
### Conclusion ###

## JPA Data Modeling with Spring and Hibernate ##
### Introduction ###
### JPA Entity Relationships ###
### Recipe Data Model ###
### Forking in GitHub ###
### One To One JPA Relationships ###
### One to Many JPA Relationships ###
### Assignment - Creation of One to One Relationship ###
### Assignment - Review ###
### JPA Enumerations ###
### Many To Many JPA Relationships ###
### Creation of Spring Data Repositories ###
### Database Initialization with Spring ###
### Spring Data JPA Query Methods ###
### Assignment: Display List of Recipes on Index Page ###
### Assignment Review: Display List of Recipes ###
### Pro-Tips - Using Setters for JPA Bidirectional Relationships ###
### Flashcards ###
### Conclusion ###

## Project Lombok ##
### Introduction to Project Lombok ###
### Project Lombok Features ###
### Adding Project Lombok and IDE Configuration ###
### Using Project Lombok ###
### Assignment - Complete Refactoring with Project Lombok ###
### Assignment Review ###
### Gotchas with Project Lombok ###

## Testing Spring Applications ##
### Introduction ###
### Using Bootstrap CSS ###
### Introduction to Testing Spring ###
### Creation of JUnit Test ###
### Using Mockito Mocks ###
### Assignment - Write Test for IndexController ###
### Assignment Review ###
### Mockito Argument Capture ###
### Introduction to Spring MockMVC ###
### Spring Integration Test ###
### Maven Failsafe Plugin ###
### Continuous Integration Testing with Circle CI ###
### Conclusion ###

## CRUD Operations with Spring MVC ##
### Introduction ###
### Using WebJars with Spring Boot ###
### Display a Recipe by ID ###
### Assignment Review - Display Remaining Recipe Properties ###
### Assignment - Display remaining recipe properties ###
### Processing Form Posts with Spring MVC ###
### Creation of Command Object and Type Conversions in Spring ###
### Creation of Recipe ###
### Update a Recipe ###
### Delete a Recipe ###
### View Ingredients ###
### Show Ingredient ###
### Update Ingredient ###
### Creation of an Ingredient ###
### Assignment - Delete an Ingredient ###
### Assignment Review - Delete Ingredient ###
### Enumeration Dropdowns with Spring MVC and Thymeleaf ###
### Using the Debugger ###
### Uploading Images with Spring MVC ###
### Persisting Images to Database ###
### Displaying Images from Database ###
### Conclusion ###

## Validation and Constraints with Spring MVC ##
### Introduction ###
### Overview of Exception Handling ###
### Using Spring MVC Annotation `@ResponseStatus` ###
### Spring MVC Exception Handler ###
### Showing Error Data on 404 Error Page ###
### Assignment: Handle Number Format Exception ###
### Assignment Review: Handle Number Format Exception ###
### Spring MVC Controller Advice ###
### Data Validation with JSR-303 ###
### Data Validation with Spring MVC ###
### Displaying Validation Errors with Thymeleaf ###
### Customizing Error Messages with Message Source ###
### Conclusion ###

## Introduction to Docker ##
### Course Extra - Docker ###
### Discussion about Docker with Rob A ###
### Introduction ###
### What is Docker ###
### Docker Editions ###
### Installing Docker ###
### Hello World with Docker ###
### Docker Hub ###
### Introducing KiteMatic ###
### Assignment - Run Hello World Nginx ###
### Conclusion ###

## Working with Containers and Images ##
### Introduction ###
### Running Mongo DB Docker Container ###
### Assignment - download and run Spring Boot Project ###
### Assignment Review ###
### Docker Images ###
### Docker Files ###
### Non Persistent Container Storage ###
### Assigning Storage ###
### Assignment - Run Rabbit MQ Container ###
### Assignment Review ###
### Assignment - Run MySQL in a Container ###
### Assignment Review ###
### Docker House Keeping ###
### Flash Cards ###
### Conclusion ###

## Running Spring Boot in a Centos Image ##
### Introduction ###
### Preparing CentOS for Java development ###
### Sample Spring Boot Application ###
### Running Spring Boot from Docker ###
### Assignment: Run Your Own Spring Boot App ###
### Assignment - Fix Dockerfile ###
### Interview with James Labocki of Red Hat ###
### Conclusion ###
### Docker Section Conclusion ###

## Troubleshooting Spring ##
### Debugging Thymeleaf ###
### Problems with Spring Security and H2 Database Console ###
### Configuring Spring Sec DAO Provider ###
### Troubleshooting Spring MVC Request Mapping ###
### H2 Database Connection Timeouts ###

## Spring Boot Cookbook ##
### Spring Boot Cookbook Introduction ###
### Spring Boot Mongo DB ###
### Spring Boot MySQL ###
### Spring Boot Postgres Example ###
### Spring Boot Maria DB Example ###
### Spring Boot DB2 Express Example ###
### Spring Boot Oracle Database Example ###
### Spring Boot Redis Example ###
### Spring Boot Neo4J Example ###
### Spring Boot Cassandra Example ###
### Spring Boot Active MQ Example ###
### Spring Boot RabbitMQ Example ###
### Bonus Lecture: Get My Other Udemy Courses! ###