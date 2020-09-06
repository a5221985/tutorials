# Reactive Programming with Spring Framework #
## Section 1: Introduction to Reactive Programming with Spring Framework 5 ##
### Introduction to Reactive Programming with Spring Framework 5 ###
1. Reactive programming - API spec
	1. Java 9 - included
	2. Java 8 - Project reactor, reactive streams
2. Reactive streams - streaming events
3. Functional programming
4. New capabilities

### Instructor Introduction - John Thompson, Spring Framework Guru ###

### Free 120 Day IntelliJ Trial! ###
1. [https://springframework.guru/udemy-90-day-trial-license-intellij-spring-5-reactive-programming/](https://springframework.guru/udemy-90-day-trial-license-intellij-spring-5-reactive-programming/)

### Using GitHub ###
1. All source code examples in GitHub

### Code Examples in GitHub ###
1. Beginning and ending source code
2. Right click and commit directory

## Section 2: Introduction to Reactive Programming ##
### Introduction ###
1. What is reactive programming
2. Common terminologies
3. New paradigm but old concepts

### Reactive Manifesto ###
1. Published in 2013
2. Available at [www.reactivemanifesto.org](www.reactivemanifesto.org)
3. Authors: Jonas Boner (Akka founder), Dave Farley, Roland Kuhn, and Martin Thompson
	1. For big scale systems
4. The term "Reactive" is getting a bit overloaded in the IT community
5. Reactive:
	1. Reactive systems - architecture and design pattern (arch level)
		1. ie. Cloud native
		2. Cloud based apps
		3. Large scale self healing
		4. Amazon
	2. Rective programming - more granular (code level)
		1. Generally event based
		2. Async non-blocking programming technique
		3. Even can be within reactive system
	3. Functional Reactive Programming (FRP)
		1. Often confused with Reactive Programming
6. Reactive Manifesto
	1. Responsive
		1. The system responds in a timely manner
		2. Responsiveness is the cornerstone of usability and utility (cornerstone for building - first stone)
		3. Responsiveness also means problems may be detected quickly and dealt with effectively - self healing
		4. Responsive systems provide rapid and consistent response times
		5. Consistent behaviour simplifies error handling, builds end user confidence, and encourages further interaction - bad connection cannot keep it consistent 
	2. Elastic
		1. The system stays responsive under varying workload
		2. Reactive systems can react to changes in the input rate by increasing or decreasing resources allocated to service inputs
		3. Reactive systems achieve elasticity in a cost effective way on commodity hardware and software platforms
		4. Example: amazon.com
			1. Cheaper servers are used
			2. Kubernetes automatically scales up and down
	3. Resilient
		1. System stays responsive in the face of failure
		2. Resilience is achieved by replication, containment, isolation, and delegation
		3. Failures are contained within each component - single part should not take down entire system
		4. Parts of the system can fail, without compromising the system as a whole
		5. Recovery of each component is delegated to another - redundancy
		6. High-availability is ensured by replication where necessary - microservices load balancing say, rabitmq
	4. Message Driven
		1. Reactive systems rely on asynchronous message passing to establish a boundary between components
			1. This ensures loose coupling, isolation, and location transparency
		2. Message passing enables load management, elasticity, and flow control - distributed systems say (JMS, webservice call, ...)
		3. Location transparent messaging makes management of failures possible - not concerned about specific servers
		4. Non-blocking communication allows recipients to only consume resources while active, leading to less system overhead
5. Spring cloud native
	1. Netflix|OSS + Spring Boot + Docker
		1. Kubernetes
		2. Docker swarm
		3. Zuul
		4. Eureka
	2. When a microservice starts, it registers iteself with jHipster registry and gets its config from Spring Cloud Config and registers itself with Eureka
		1. Zuul proxy can route to microservice
		2. If microservice goes down, another one comes and registers
	3. Logstash and Kibana
		1. Collection of logs from multiple nodes
6. Reactive programming with reactive systems
	1. Reactive programming is a useful implementation technique
	2. Reactive programming focuses on non-blocking, asynchronous execution - a key characteristic of reactive systems
	3. Reactive programming is just one tool in building reactive systems

### What is Reactive Programming? ###
1. Reactive programming
	1. Reactive programming is an asynchronous programming paradigm focused on streams of data
	2. "Reactive programs also maintain a continuous interaction with their environment, but at a speed which is determined by the environment, not the program itself. Interactive programs work at their own pace and mostly deal with communication, while reactive programs only work in response to external demands and mostly deal with accurate interrupt handling. Real-time programs are usually reactive" - Gerad Berry, French Computer Scientist
		1. Mainly processing events or stream of events
2. Common use cases
	1. External service calls
	2. Highly concurrent message consumers - batch processing can be done - batch of data (efficency)
	3. Spreadsheets
	4. Abstraction over asynchronous processing
		1. Abstract whether or not your program is synchronous or asynchronous - programmer is usually kept away from details
3. Features of Reactive Programming
	1. Data streams
	2. Asynchronous
	3. Non-blocking
	4. Backpressure
	5. Failures as Messages
4. Data streams
	1. Data streams can be just about anything
	2. Types of messages
		1. Mouse clicks, or other user interactions
		2. JMS messages, RESTful service calls, Twitter feed, Stock trades, list of data from a database
	4. A stream is a sequence of events ordered in time
	5. Events you want to listen to
5. Asynchronous
	1. Events are captured asynchronously
	2. A function is defined to execute when an event is emitted
	3. Another function is defined if an error event is emitted
	4. Another function is defined when complete event is emitted
6. GoF Observer Pattern
	1. Subject
		1. It changes and notifies obeservers
	2. Observer
		1. Takes action
7. ReactiveX Observable
	1. If for some reason observable terminates abnormally, with an error, the vertical line is replaced by an X
8. Non-Blocking
	1. The concept of using non-blocking is important
	2. In blocking, the code will stop and wait for more data (ie reading from disk, network, etc)
	3. Non-blocking in contrast, will process available data, ask to be notified when more is available, then continue
		1. Thread goeas on to something else
9. Example:
	1. JSON parsing blocks
	2. Database takes time
10. Back pressure
	1. The ability of subscriber to throttle data
		1. Give 10 records or 1000 records ...
			1. It allows communication between subscriber and publisher
				1. If client is getting overwhelmed, we want to back it down
11. Failures as Messages
	1. Exceptions are not thrown in a traditional sense
		1. Would break processing of stream
	2. Exceptions are processed by a handler function
		1. Handled gracefully
12. Key take aways
	1. Reactive programming focuses on processing streams of data (don't overuse this)
	2. Traditional CRUD applications are still alive and well

### Reactive Streams ###
1. Reactive Streams API
	1. Goal is to construct a standard for asynchronous stream processing with non-blocking back pressure
	2. Reactive Streams started in 2013 by engineers from Netflix, Pivotal, Lightbend (formerly Typesafe - Rod Johnson - founder of Spring has worked in board of directors, Lightbend supports Scala), Red Hat, Twitter, and Oracle
	3. Reactive Streams is a set of 4 interfaces which defines the API
2. Reactive streams
	1. Under JEP-266 - Reactive streams is now part of Java 8 JDK
	2. Adoption: Akka streams, MongoDB, Ratpack, Reactive Rabbit, Project Reactor (Spring 5), RxJava (Netflix), Slick 3.0, Vert.x 3.0, Cassandra, ElasticSearch, Kafka, Play
3. Interfaces
	1. Publisher
		1. Unbounded number of elements
	2. Subscriber
		1. Consumes from publisher
	3. Subscription
		1. Request, cancel
	4. Processor
4. Reactive strams with backpressure
	1. Demand (BP)
	2. Subscription <-> Subscriber
	3. Subscription <-> Publisher
	4. Publisher <-Events-> Subscriber
		1. Publisher publishes events which are consumed by subscriber
		2. Subscription is used by subscriber to give feedback on demand (back pressure)
5. Spring MVC and Spring WebFlux
	1. `@Controller`/ `@RequestMapping`
	2. spring-webmvc
	3. Router functions
	4. spring-webflux
	5. Servlet API - traditional is not reactive
	6. HTTP/ Reactive Streams
	7. Servlet Container
	8. Tomcat, Jetty, Netty, Undertow - reactive implementations
		1. Netty is robust
		2. Tomcat is simpler and widely used
6. Spring Reactive Types
	1. Two new reactive types are introduced with Spring Framework 5
	2. 'Mono' is a publisher with zero or one elements in data stream
	3. 'Flux' is a publisher with zero or MANY eleemnts in the data stream
	4. Both types implement the Reactive Streams Publisher interface
7. Inside spring we can probably work with many publishers
8. We can leverage the reactive types when using controllers

### Reactive Programming Examples with Spring ###
1. Example:

		@Data
		@NoArgsConstructor
		@AllArgsConstructor
		public class Person {
			private String firstName;
			private String lastName;
			
			public String sayMyName() {
				return "My Name is " + firstName + " " + lastName + ".";
			}
		}
		
		@Data
		@NoArgsConstructor
		@AllArgsConstructor
		public class PersonCommand {
			public PersonCommand(Person person) {
				this.firstName = person.getFirstName();
				this.lastName = person.getLastName();
			}
			
			private String firstName;
			private String lastName;
			
			public String sayMyName() {
				return "My Name is " + firstName + " " + lastName + ".";	
			}
		}
		
		@Sl4j
		public class ReactiveExamplesTest {
			@Test
			public void monoTest() throws Exception {
				//Create new person mono
				Mono<Person> personMono = Mono.just(michael); // mono object from given object
				
				// get person object from mono publisher
				Person person = personMono.block(); // returns the actual object
				
				// output name
				log.info(person.sayMyName());
			}
			
			@Test
			public void monoTransform() throws Exception {
				// Construct new person mono
				Mono<Person> personMono = Mono.just(fioma);
				
				PersonCommand command = personMono.map(person -> { // type transformation
					return new PersonCommand(person);
				}).block(); // block doesn't execute unless somthing blocks on it
				
				log.info(command.sayMyName());
			}
			
			@Test(expected = NullPointerException.class)
			public void monoFilter() throws Exception {
				Mono<Person> personMono = Mono.just(sam);
				
				// filter example
				Person samAxe = personMono
									.filter(person -> person.getFirstName().equalsIgnoreCase("foo"))
									.block();
									
				log.info(samAxe.sayMyName()); // throws NPE
			}
			
			@Test
			public void fluxTest() throws Exception {
				Flux<Person> people = Flux.just(michael, fiona, sam, jessie); // 0 or many
				people.subscribe(person -> log.info(person.sayMyName());
			}
			
			@Test
			public void fluxTestFilter() throws Exception {
				Flux<Person> people = Flux.just(micheal, fiona, sam, jessie);
				people.filter(person -> person.getFirstName().equals(fiona.getFirstName()))
							.subscribe(person -> log.info(person.sayMyName()));
			}
			
			@Test
			public void fluxTestDelayNoOutput() throws Exception {
				Flux<Person> people = Flux.just(micheal, fiona, sam, jessie);
				people.delayElements(Duration.ofSeconds(1))
						.subscribe(person -> log.info(person.sayMyName())); // emits every second but test terminates before that
			}
			
			@Test
			public void fluxTestDelay() throws Exception {
				CountDownLatch countDownLatch = new CountDownLatch(1);
				
				Flux<Person> people = Flux.just(micheal, fiona, sam, jessie);
				people.delayElements(Duration.ofSeconds(1))
						.doOnComplete(countDownLatch::countDown)
						.subscribe(person -> log.info(person.sayMyName())); // emits every second but test terminates before that
				countDownLatch.await(); // waits here because countDown value is 1 but when it becomes 0, it passes through
			}
			
			@Test
			public void fluxTestFilterDelay() throws Exception {
				CountDownLatch countDownLatch = new CountDownLatch(1);
				
				Flux<Person> people = Flux.just(micheal, fiona, sam, jessie);
				people.delayElements(Duration.ofSeconds(1))
						.filter(person -> person.getFirstName().contains("i"))
						.doOnComplete(countDownLatch::countDown)
						.subscribe(person -> log.info(person.sayMyName())); // emits every second but test terminates before that
				countDownLatch.await();
			}
		}

### Conclusion ###
1. Reactive deals with streams of data
2. Future is passed on and all logic is triggered at once

## Section 3: Netflux Example Spring Reactive Application ##
### Introduction ###
1. Netflux example
2. MongoDB and reactive driver with mongodb
3. Return movies from Netflux
4. Josh's presentation is good

### Create a New Spring Boot Project ###
1. New Project - Spring Boot Initializer
2. netflux-example
3. Lombok, MongoDB, Reactive MongoDB, Embdded MongoDB
4. New folder: netflux-example
5. Gradle project
6. Use default gradle wrapper
7. compile dependency: `...flapdoodle.embed.mongo`
8. Settings > Build, Execution, Deployment > Compiler > Annotation Processors (for Project Lonbok)
	1. Enable Annotation processing

### Create Domain Model ###
1. Entity: `model.Movie` object
2. Github branch: domain

		@Document
		@Data // Getters, setters, requiredArgsConstructor, toString, equals, hashCode
		@NoArgsConstructor
		public class Movie {
			private String id;
			
			@NonNull
			private String title;
		}
		
3. `model.MovieEvent`

		@Data
		@NoArgsConstructor
		public class MovieEvent {
			private String movieId;
			private Date date;
		}

### Creating Spring Data Reactive Repositories ###
1. `ReactiveMongoRepository<I, ID>` - uses Mono, Flux
2. New package - `repositories`
3. New class - `MovieRepository`

		public interface MovieRepository extends ReactiveMongoRepository<Movie, String> {
		}

### Initializing Data With Spring Boot Command Line Runner ###
1. Another Lombok annotation

		@AllArgsConstructor
		...
		
2. Another dependency: WebFlux dependency
3. `CommandLineRunner` - executes `run` method when Spring Boot application starts

		@Component
		public class BootstrapCLR implements CommandLineRunner {
			private final MovieRepository movieRepository;
			
			public BootstrapCLR(MovieRepository movieRepository) {
				this.movieRepository = movieRepository;
			}
			
			@Override
			public void run(String... args) throws Exception {
				// clear old data
				movieRepository.deleteAll().block(); // returns mono publisher
				
				Flux.just("Silence of the Lombok", "AEon Flux", "Enter the Mono<Void>", "The Fluxxinator",
							"Back to the Future", "Meet the Fluxes", "Lord of the Fluxes")
							.map(title -> new Movie(title, UUID.randomUUID().toString()))
							.flatMap(movieRepositories::save)
							.subscribe(null, null, () -> {
								movieRepository.findAll().subscribe(System.out::println);
							});
			}
		}
		
	1. Another way:

			movieRepository.deleteAll().thenMany(
				Flux.just("Silence of the Lombok", "AEon Flux", "Enter the Mono<Void>", "The Fluxxinator",
							"Back to the Future", "Meet the Fluxes", "Lord of the Fluxes")
							.map(title -> new Movie(title, UUID.randomUUID().toString()))
							.flatMap(movieRepositories::save)
							.subscribe(null, null, () -> {
								movieRepository.findAll().subscribe(System.out::println);
							});
			); // returns mono publisher

### Create Service Layer ###
1. `MovieService` interface

		public interface MovieService {
			Flux<MovieEvent> events(String movieId);
			Mono<Movie> byMovieById(String id);
			Flux<Movie> getAllMovies();
		}
		
2. Implement the interface:

		public class MovieServiceImpl implements MovieService {
			private final MovieRepository;
			
			public MovieServiceImpl(MovieRepository movieRepository) {
				this.movieRepository = movieRepository;
			}
			
			@Override
			public Flux<MovieEvent> events(String movieId) { // generates events for processing
				return Flux.<MovieEvent>generate(movieEventSynchronousSink -> { // it is async operation that generates objects for us
					movieEventSynchronousSink.next(new MovieEvent(movieId, new Data());
				}).delayElements(Duration.ofSeconds(1)); // generates every one second
			}
			
			@Override
			public Mono<Movie> getMovieById(String id) {
				return this.movieRepository.findById();
			}
			
			@Override
			public Flux<Movie> getAllMovies() {
				return this.movieRepository.findAll();
			}
		}

### Create Rest Endpoint ###
1. Rest controller

		@RestController
		@ReqestMapping("/movies")
		public class MovieController {
			private final MovieService movieService;
			
			public MovieController(MovieService movieService) {
				this.movieService = movieService;
			}
			
			@GetMapping(value = "/{id}/events")
			Flux<MovieEvent> streamMovieEvents(@PathVariable String id) {
				return movieService.events(id);
			}
			
			@GetMapping(value = "/{id}")
			Mono<Movie> getMovieById(@PathVariable String id) { // 0 or 1 instance
				return movieService.getMovieById(id);
			}
			
			@GetMapping
			Flux<Movie> getAllMovies() { // 0 or many instances
				return movieService.getAllMovies();
			}
		}

### Running The Reactive Spring Boot Application ###
1. Problem:
2. Terminal:
	1. `curl http://localhost:8080/movies`
	2. `curl http://localhost:8080/movies/

### Conclusion ###

## Section 4: Introduction to Functional Programming in Java ##
### Introduction ###
### What is Functional Programming? ###
### Functional Programming Examples ###
### Closures, Effectively Final and Lazy Evaluation ###
### Conclusion ###

## Section 5: Using Java Streams ##
### Introduction ###
### Introduction to Java Streams ###
### Java 8 Streams Examples ###
### Spring Framework Reactive Streams Examples ###
### Conclusion ###

## Section 6: Spring WebFlux Quote Service ##
### Introduction to Spring WebFlux ###
### Initial Spring Boot Project Creation ###
### Quote Object ###
### Quote Generator Service ###
### Spring WebFlux Quote Handler ###
### Spring WebFlux Quote Router ###
### Steaming Quotes ###
### Testing Quote Service ###
### Spring WebFlux Quote Service on GitHub ###
### Conclusion ###

## Section 7: Reactive MongoDB Quote Application ##
### Introduction ###
### Introduction to MongoDB ###
### Data Model ###
### 

## Section 8: Appendix A - Using GitHub ##