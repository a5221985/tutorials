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
	2. `curl http://localhost:8080/movies/1`
		1. Takes string as ID
3. BootstrapCLR.java

		...
		.map(title -> new Movie(title))
		.flatMap(...)
		.subscription(...)
		...
		
	1. Movie.java

			@RequiredArgsConstructor
			...
			
4. File > Invalidate Caches/ Restart... (if cache is stale - Lombok say)
5. Run the application
6. Events:

		http://localhost:8080/movies/<id>/events
		
	1. Hangs
	2. No termination
		1. `curl` problem - not getting proper types
			1. Buffering things up
		2. Solution:

				@GetMapping(value = "/{id}/events", produces = MediaType.TEST_EVENT_STREAM_VALUE)
				...
				
		3. Re-run
			1. Runs indefinitely

### Conclusion ###
1. Emitting events indefinitely is difficult with traditional Java

## Section 4: Introduction to Functional Programming in Java ##
### Introduction ###
1. Key features of Functional programming
2. Good to know for streaming
3. Concepts are important
4. This section: Fundamentals of functional programming

### What is Functional Programming? ###
1. It is a paradigm shift - needs patience
2. Within objects we do procedural programming
3. Imperative programming:
	1. In computer science, imperative programming is a programming paradigm that uses statements that change a program's state. In much the same way that the imperative mood in natural languages expresses commands, an imperative program consists of commands for the computer to perform." Source: Wikipedia
		1. Series of statements to do multiple things
4. Example:

		@Test
		public void countDogsWithEightCharactersImpd() throws Exception {
			/*
			Get count of dogs with 6 charactes in name
			*/
			
			List<String> dogs = Arrays.asList("Vizsla", "Lab", "Golden", "GSP", "Poodle", "Yorkie", "Mutt");
			
			int dogCount = 0;
			
			for (String dog : dogs) {
				if (dog.length() == 6) {
					dogCount++;
				}
			}
			
			System.out.println(dogCount);
		}
		
5. Functional Programming:
	1. "In computer science, functional programming is a programming paradigm - a style of building the structure and elements of computer programs - that treats computation as the evaluation of mathematical functions and avoids **changing-state and mutable data.**" Source: Wikipedia
	2. Functional example:

			@Test
			public void countDogsWithEightCharactersDecd() throws Exception {
				/*
				Get count of dogs with 6 characters in name
				*/
				
				List<String> dogs = Arrays.asList("Vizsla", "Lab", "Golden", "GSP", "Poodle", "Yorkie", "Mutt");
				
				System.out.println(dogs
										.stream()
										.filter(dog -> dog.length() == 6)
										.collect(Collectors.toList())
										.size());
			}
			
6. Imperative vs Declarative
	1. Imperative
		1. We say how to do it
		2. Mutable
		3. Has side effects
		4. Pass Objects
		5. Hard to Compose
		6. Not Threadsafe
			1. Need to take care of synchronization
	2. Declarative
		1. We say what to do
		2. Immutable (Transforms)
		3. No side effects
		4. Can also pass functions
		5. Functions Composition
		6. Threadsafe (for free)
7. Mutability
	1. Mutabile - objects that can change

			dogCount = 0;
			...
			dogCount++;
	
	2. Immutable - objects that do not change
8. Mutability vs Immutability
	1. Mutable objects are error prone and hard to understand
	2. Immutable objects are easier to use
	3. Immutable objects are thread safe
	4. Mutable objects open the door to concurrency problems
9. Final variables in Java
	1. Final variables in Java can still be mutated
	2. Once initialized, the variable cannot be re-assigned
	3. BUT - state of the object can change, if properties are not final
10. Good programming habbit - Spring community

		@Service
		public class MovieServiceImpl implements MovieService {
			private final MovieRepository movieRepository; // reference will never change
			
			public MovieServiceImpl(MovieRepository movieRepository) {
				this.movieRepository = movieRepository;
			}
		}
		
11. Pure Functional vs Functional Style
	1. Pure functional languages will not allow any mutability
		1. Haskel is an example
	2. Functional style languages will encourage immutability
	3. BUT immutability is not strictly enforced
		1. Java is a Functianal Style Language
			1. It is not 100%
12. Functions
	1. Can be passed objects
	2. Can construct object
	3. Can return objects
13. Higher Order Functions
	1. Can be passed objects and functions
	2. Can construct objects and functions
	3. Can return objects and functions
	4. Java supports higher order functions

### Functional Programming Examples ###
1. Example:
	1. 4 properties of a function
		1. name
		2. return type
		3. parameter list
		4. body
2. Example:

		@Test
		public void functionWith4Things() throws Exception {
			Thread t1 = new Thread(new Runnable () {
				@Override
				public void run() {
					System.out.println("In thread 1");
				}
			});
			
			t1.start();
			
			System.out.println("In Main test");
		}
		
		@Test
		public void lambdaExpression() throws Exception {
			/*
			// lambda expression
			// (parameter list) -> body
				* 1. name: anonymous
			* 2. retuurn type can be inferred
			* 3. parameter list
			* 4. body
			*/
			Thread t1 = new Thread(() -> System.out.println("Silence of the lambdas"));
			// ^ Constructor is a higher order function,
			// function is a first class citizen
			
			t1.start();
			System.out.println("In Main Test");
		}
		
		@Test
		public void listIteratorHighCeremony() throws Exception {
			List<String> dogs = Arrays.asList("Vizsla", "Lab", "Golden", "GSP", "Poodle", "Yorkie", "Mutt");
			
			for (int i = 0; i < dogs.size(); i++) {
				System.out.println(dogs.get(i));
			}
			
			// very complex, requires a log of knowledge of code, a lot to go wrong
		}
		
		@Test
		public void listIteratorLessCeremonyExternalIter() throws Exception {
			List<String> dogs = Arrays.asList("Vizsla", "Lab", "Golden", "GSP", "Poodle", "Yorkie", "Mutt");
			
			for (String dog : dogs) {
				System.out.println(dog);
			}
		}
		
		@Test
		public void listInternalIterConsumer() throws Exception {
			List<String> dogs = Arrays.asList("Vizsla", "Lab", "Golden", "GSP", "Poodle", "Yorkie", "Mutt");
			
			dogs.forEach(new Consumer<String>() {
				@Override
				public void accept(String s) {
					System.out.println(s);
				}
			});
		}
		
		@Test
		public void listInternalIterLambdaMethod() {
			List<String> dogs = Arrays.asList("Vizsla", "Lab", "Golden", "GSP", "Poodle", "Yorkie", "Mutt");
			dogs.forEach((String s) -> System.out.println(s));
		}
		
3. Functional interface:

		@FunctionalInterface
		public interface Consumer<T> {
			//...
		}
		
4. Further cleanup:

		@Test
		public void listInternalIterLambdaMethodTpyeInference() throws Exception {
			...
			dogs.forEach(s -> System.out.println(s));
		}
		
		@Test
		public void listINtervalIterLambdaMethodTypeJavaMethodRef {
			dogs.forEach(System.out::println); // Compiler can interpret
		}
		
		@Test
		public void countDogsWithEightCharactersDec() throws Exception {
			List<String> dogs = Arrays.asList("Vizsla", "Lab", "Golden", "GSP", "Poodle", "Yorkie", "Mutt");
			
			System.out.println(dogs.stream()
									.filter(dog -> dog.length() == 6)
									.collect(Collectors.toList())
									.size()); // nothing is mutating
		}
		

### Closures, Effectively Final and Lazy Evaluation ###
1. Example:

		@Test
		public void lambdaExample() throws Exception {
			List<String> numbers = Arrays.asList(1, 2, 3, 4, 5, 6);
			
			numbers.stream()
					.map(number -> number * 2)
					.forEach(System.out::println);
		}
		
		@Test
		public void closureExample() throws Exception {
			List<String> numbers = Arrays.asList(1, 2, 3, 4, 5, 6);
			
			Integer multiplier = 2; // lexical scope (this is effectively final)
			
			//final Integer multiplier = 2; // lexical scope (this is effectively final)
			
			numbers.stream()
					.map(number -> number * multiplier)
					// lambda 'closes over' variable in lexical scope
					// i.e. 'closure'
					.forEach(System.out::println);
					
			// multiplier = 3; // cannot change this
		}
		
		@Test
		public void breakingFinal() throws Exception {
			List<String> numbers = Arrays.asList(1, 2, 3, 4, 5, 6);
			
			final Integer[] multiplier = {2}; // lexical scope (this is effectively final)
			
			Stream<Integer> numberStream = numbers.stream()
					.map(number -> number * multiplier[0]);
					
			// multiplier[0] = 3; // This is legal - this value will be used instead of 2, lazy evaluation - map function is called when forEach is invoked next
			
			numberStream.forEach(System.out::println);
		}
		
	1. All streams are lazily evaluated in Java 8

### Conclusion ###
1. Powerful toolset
2. It is a paradigm shift

## Section 5: Using Java Streams ##
### Introduction ###
1. Functional APIs and Streams
2. Collection handling is easy with the Streams
3. Examples

### Introduction to Java Streams ###
1. What is a stream?
	1. At the simplext, a stream is a sequence of elements
	2. A 'stream' is not a collection
	3. Collections are in-memory data structures
	4. Collections are eagerly computed
	5. Streams can operate on collections
	6. Streams are lazily evaluated
		1. Computed at runtime
		2. The entire stream is evaluated only when someone asks for the result
	7. Sources of streams can be Collections, Arrays, and I/O resources
	8. Java collections include: Set, SortedSet, List, Map, SortedMap, and Deque
	9. Implementing classes include: LinkedList, ArrayList, HashSet, LinkedHashSet, TreeSet, HashMap, TreeMap, WeakHashMap, LinkedHashMap, IdentityHashMap
2. Types of Streams
	1. Stream - provides sequential stream of elements
	2. ParallelStream - enables a multithreaded stream
		1. Use with caution (JVM determines the parameters but it can be tuned)
		2. Not an automatic performance improvement
		3. Likely to slow down processing of smaller data sets
			1. Good for 1000s or 10s of 1000s of elements
			2. Try and benchmark it
			3. Web services in production work with multiple threads
3. Stream operations
	1. forEach - execute operation on each element
	2. map - transform element
	3. filter - remove elements based on given criteria
	4. limit - limit the number of elements processed (s number of elements)
	5. sorted - sort the stream
4. Stream Collectors
	1. Streams can be 'collected' to Java collections
		1. `toList`, `toMap`, `toSet`
	2. Collecting 'And Then - allows collection of result, then operation on result
	3. joining() - String operations
	4. counting() - return count of operations
5. Stream Collectors - Numbers
	1. Applies to Java Numbers - Double, Long, Int - (xx)
	2. SummarizingXX - returns statistical information object containing
		1. average
		2. count
		3. min
		4. max
		5. sum
	6. averagingXX - returns average
	7. summingXX - returns sum
	8. minBy/ maxBy - returns min or max
6. Stream Collectors - Map Results
	1. `groupingBy()` - returns map grouped by criteria given
	2. `portioningBy()` - returns map of true / false elements matching/ not matching given perdicates
7. Custom Collectors
	1. Custom Stream Collectors can be constructed by implementing the interface 'Collector'

### Java 8 Streams Examples ###
1. Examples:

		@Test
		...
			List<String> dogs = Arrays.asList(...);
			
			dogs.stream()
					.forEach(System.out::println);
					
		@Test
		...
			List<String> dogs = ...
			
			dogs.stream()
					.map(String::length)
					.forEach(System.out::println);
					
		@Test
		...
			dogs.stream()
					.filter(s -> s.length() == 6)
					.forEach(System.out::println);
					
		@Test
		...
			dogs.stream()
					.filter(s -> s.length() == 6)
					.limit(2)
					.forEach(System.out::println);
					
		@Test
		...
			dogs.stream()
					.filter(s -> s.length() == 6)
					.sorted()
					.forEach(System.out::println);
					
		@Test
		...
			dogs.stream()
					.filter(s -> s.length() == 6)
					.sorted()
					.collect(Collectors.joining(", "));
					
			System.outprintln(dogString);
			
		@Test
		...
			dogs.stream()
					.filter(s -> s.length() == 6)
					.limit(3)
					.map(String::toUpper())
					.sorted()
					.collect(Collectors.joining(", "));
					
			System.outprintln(dogString);
			
		@Test
		...
			List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5, 6);
			
			IntSummaryStatistics statistics = numbers.stream()
					.mapToInt(x -> x) // simple operation
					.summaryStatistics();
					
			System.outprintln(statistics);
			
		@Test
		...
			List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5, 6);
			
			OptionalInt max = numbers.stream()
					.mapToInt(x -> x) // simple operation
					.max();
					
			System.outprintln(max.getAsInt());
			
		@Test
		...
			List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5, 6);
			
			int sum = numbers.stream()
					.mapToInt(x -> x) // simple operation
					.sum();
					
			System.outprintln(sum);
			
		@Test
		...
			List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5, 6);
			
			Integer numbersSum = numbers.stream()
					.collect(Collectors.summingInt(value -> value));
					
			System.outprintln(numbersSum);
			
		@Test
		...
			List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5, 6);
			
			Map<Integer, Set<String>> groupedMap = dogs.stream()
					.collect(Collectors.groupingBy(String::length, Collectors.toSet()));
					
			groupedMap.entrySet().stream()
					.forEach(System.out::println);
					
		@Test
		...
			List<List<Integer>> listOfLists = Arrays.asList(Arrays.asList(1, 2, 3), Arrays.asList(4, 5, 6));
			
			List<Integer> numbers = listOfLists.stream()
											.flatMap(Collection::stream) // stream numbers of each list, "flattening" stream
											.collect(Collectors.toList());
					
			number.forEach(System.out::println);
			
		@Test
		...
			List<String> dogs = Arrays.asList(...);
			
			String reducedString = dogs.stream()
												.reduce((a, b) -> a + " - " + b) // returns Optional
												.get();
					
			System.out.println(reducedString);

### Spring Framework Reactive Streams Examples ###
1. Overlap exists between Spring Reactive Streams and Java Reactive streams
2. Example:

		@Test
		public void simpleStreamExample() throws Exception {
			Flux<String> dogs = Flux.just("Vizsla", "Lab", "Golden", "GSP", "Poodle", "Yorkie", "Mutt");
			
			dogs.toStream() // toStream: subscribes to Publisher and gets all values out of it
					.forEach(System.out::println);
		}
		
		@Test
		public void simpleStreamExample2() throws Exception {
			Flux<String> dogs = Flux.just(...);
			
			dogs.subscribe(System.out::println);
		}
		
		@Test
		public void simpleStreamExample2() throws Exception {
			Flux<String> dogs = Flux.just(...);
			
			dogs.doOnEach(dog -> System.out.println(dog.get()))).subscribe(); // subscribe is required to invoke the stream and get the output - prints null at the end because we do not have when done
		}
		
		@Test
		public void simpleStreamExample2() throws Exception {
			Flux<String> dogs = Flux.just(...);
			
			dogs.subscribe((s) -> {System.out.println(s);}), null, (() -> {System.out::println("Woot! all Done");})); // consumer for each element, error consumer, when done
		}
		
		@Test
		...
			Flux<String> dogs = Flux.just(...);
			
			// subscriber lambda
			Consumer<String> println = System.out::println;
			
			// error handler
			Consumer<String> errorHandler = e -> System.out.println("Some Error Occurred");
			
			// runnable upon complete
			Runnable allDone = () -> System.out.println("Woot! All Done!");
			
			// trigger subscription
			dogs.subscribe(println, errorHandler, allDone);
			
		@Test
		...
			Flux<String> dogs = Flux.just(...);
			dogs.map(String::length)
					.doOnEach(System.out::println) // signal object `onNext()`
					.subscribe();
					
		@Test
		...
			Flux<String> dogs = Flux.just(...);
			
			dogs.filter(s -> s.length() == 6) // similar to Java streams
					.subscribe(System.out::println);
					
		@Test
		...
			dogs.filter(s -> s.length() == 6)
					.take(2) // limit elements
					.subscribe(System.out::println);
					
		@Test
		...
			dogs.filter(s -> s.length() == 6)
					.take(2)
					.sort()
					.subscribe(System.out::println);
					
		@Test
		...
			dogs.filter(s -> s.length() == 6)
					.take(2)
					.sort()
					.collect(Collectors.joining(", ")) // converts from Flux to Mono<String>
					.subscribe(System.out::println);
					
		@Test
		...
			listFlux.flatMap(list -> Flux.fromIterable(list))
						.flatMap(lists -> Flux.fromIterable(lists))
						.subscribe(System.out::println);
						
		@Test
		...
			listFlux.flatMap(list -> Flux.fromIterable(
							list.stream()
									.flatMap(Collection::stream) // mixing reactive stream and Java stream
						.collect(Collectors.toList())
						.subscribe(System.out::println);
						
		@Test
		...
			Flux<String> dogs = ...
			
			dogs.reduce((a, b) -> a + " - " + b).subscribe(System.out::println);

### Conclusion ###
1. With streams, we need to ask for output (in some way) to get the results
	1. `subscribe` - reactive

## Section 6: Spring WebFlux Quote Service ##
### Introduction to Spring WebFlux ###
1. Class - for stock quotes
2. 10 stock quotes
3. Prices on quotes
4. Timestamp
5. Stream of quotes - coming out of it
6. Spring WebFlux
7. Endpoints
	1. x stock quotes
	2. Stream of stock quotes for ever
8. **Routers**
9. Consuming - other courses may be

### Initial Spring Boot Project Creation ###
1. Spring Initalizer - jdk
2. guru.springframework
3. webflux-stock-quote-service
4. Java - 1.8
5. Maven
6. MS - milestone
7. Reactive Web, Lombok
8. Select directory
9. Project:

### Quote Object ###
@Data
		@NoArgsConstructor
		public class Quote {
			private static final MathContext MATH_CONTEXT = new MathContext(2);
			
			private String ticker;
			private BigDecimal price;
			private Instant instant;
			
			public Quote(String ticker, BigDecimal price) {
				this.ticker = ticker;
				this.price = price;
			}
			
			public Quote(String ticker, Double price) {
				this.ticker = ticker;
				this.price = new BigDecimal(price, MATH_CONTEXT);
			}
		}
		
	1. Enable annotation processing for lombok
	2. Decompile - lombok adds methods

### Quote Generator Service ###
1. Interface:

		public interface QuoteGeneratorService {
			Flux<Quote> fetchQuoteStream(Duration period);
		}
		
2. Implementation:

		@Service
		public classs QuoteGeneratorServiceImpl implements QuoteGeneratorService {
			private final MathContext mathContext = new MathContext(2);
			private final Random random = new Random();
			private final List<Quote> prices = new ArrayList<>();
			
			public QuoteGeneratorServiceImpl() {
				this.prices.add(new Quote("AAPL", 160.16));
				this.prices.add(new Quote("MFST", 77.74));
				this.prices.add(new Quote("GOOG", 847.24));
				this.prices.add(new Quote("ORCL", 49.51));
				this.prices.add(new Quote("IBM", 159.34));
				this.prices.add(new Quote("INTC", 39.29));
				this.prices.add(new Quote("RHT", 84.29));
				this.prices.add(new Quote("VMW", 92.21));
			}
			
			@Override
			public Flux<Quote> fetchQuoteStream(Duration period) {
				// We use here Flux.generate to construct quotes
				// iterating on each stock starting at index 0
				return Flux.generate(() -> 0,
											(BiFunction<Integer, SynchronousSink<Quote>, Integer>) (index, sink) -> { // Synchronous sink - to synchronize across calls
												Quote updatedQuote = updatedQuote(this.prices.get(index));
												sink.next(updatedQuote);
												return ++index % this.prices.size(); // mutating data but not good practice
											})
											// We want to emit them with a specific period:
											// to do so, we zip that Flux with a Flux.interval
											.zipWith(Flux.interval(period).map(t -> t.getT1()) //emitted at a rate
											// Because values are generated in batches,
											// we need to set their timestamp after their creation
											.map(quote -> {
												quote.setInstant(Instant.now());
												return quote;
											})
											.log("guru.springframework.service.QuoteGenerator");
			}
			
			private Quote updateQuote(Quote quote) {
				BigDecimal priceChange = quote.getPrice()
												.multiply(new BigDecimal(0.05 * this.random.nextDouble()), this.mathContext);
				return new Quote(quote.getTicker(), quote.getPrice().add(priceChange));
			}
		}
		
		public class QuoteGeneratorServiceImplTest {
			QuoteGeneratorServiceImpl quoteGeneratorService = new QuoteGeneratorServiceImpl();
			
			@Before
			public void setUp() throws Exception {
			}
			
			@Test
			public void fetchQuoteStream() throws Exception {
				// get quoteFlux of quotes
				Flux<Quote> quoteFlux = quoteGeneratorService.fetchQuoteStream(Duration.ofMillis(1L));
				
				quoteFlux.take(220000)
							.subscribe(System.out::println);
							
				
			}	
			
			@Test
			public void fetchQuoteStreamCountDown() throws Exception {
				//get quoteFlux of quotes
				Flux<Quote> quoteFlux = quoteGeneratorService.fetchQuoteStream(Duration.ofMillis(100L));
				
				//subscriber lambda
				Consumer<Quote> println = System.out::println;
				
				//error handler
				Consumer<Throwable> errorHandler = e -> System.out.println("Some Error Occurred");
				
				//set Countdown latch to 1
				CountDownLatch countDownLatch = new CountDownLatch(1);
				
				//runnable called upon complete, countdown latch
				Runnable allDone = () -> countDownLatch.countDown();
				
				quoteFlux.take(10)
							.subscribe(println, errorHandler, allDone);
							
				countDownLatch.await();
			}
		}

### Spring WebFlux Quote Handler ###
1. Handler
	1. `web.QuoteHandler`

			@Component
			public class QuoteHandler {
				private final QuoteGeneratorService quoteGeneratorService;
				
				public QuoteHandler(QuoteGeneratorService quoteGeneratorService) {
					this.quoteGeneratorService = quoteGeneratorService;
				}
				
				public Mono<ServerResponse> fetchQuote(ServerRequest request) {
					int size = Integer.parseInt(request.queryParam("size").orElse("10"));
					return ok().contentType(MediaType.APPLICATION_JSON)
									.body(this.quoteGeneratorService.fetchQUoteStream(Duration.ofMillis(100))
									.take(size), Quote.class);
				} 
			}

### Spring WebFlux Quote Router ###
1. Router

		@Configuration
		public class QuoteRouter {
		
			@Bean
			public RouterFunction<ServerResponse> route(QuoteHandler handler) {
				return RouterFunctions.route(GET("/quotes")
												.and(accept(MediaType.APPLICATION_JSON)), handler::fetchQuotes);
			}
		}

### Steaming Quotes ###
1. QuoteHandler

		...
		public Mono<ServerResponse> streamQuotes(ServerRequest request) {
			return ok().contentType(MediaType.APPLICATION_STREAM_JSON)
						.body(this.quoteGeneratorService.fetchQuoteStream(Duration.ofMillis(200)), Quote.class);
		}
		
2. QuoteRouter

		...
		RouterFunctions
		.route(...)
		.andRoute(GET("/quotes").and(accept(MediaType.APPLICATION_STREAM_JSON)), handler::streamQuotes);

### Testing Quote Service ###
1. Integration test:

		@RunWith(SpringRunner.class)
		@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
		public class webfluxStockQuoteServiceApplicationTest {
			@Autowired
			private WebTestClient webTestClient; // pre-configued by Spring framework - ready to go web test client
			
			@Test
			public void testFetchQuotes() {
				webTestClient
							.get()
							.uri("/quotes?size=20") // set size = 20
							.accept(MediaType.APPLICATION_JSON)
							.exchange()
							.expectStatus().isOk()
							.expectHeader().contentType(MediaType.APPLICATION_JSON)
							.expectBodyList(Quote.class)
							.hasSize(20)
							.consumeWith(allQuotes -> {
								assertThat(allQuotes.getResponseBody()).hasSize(20);
							});
			}
			
			@Test
			public void testStreamQuotes() throws InterruptedException {
				//set Countdown latch to 10
				CountDownLatch countDownLatch = new CountDownLatch();
				
				webTestClient
							.get()
							.uri("/quotes")
							.accept(MediaType.APPLICATION_STREAM_JSON)
							.exchange()
							.returnResult(Quote.class)
							.getResponseBody()
							.take(10)
							.subscribe(quote -> {
								assertThat(quote.getPrice()).isPositive();
								countDownLatch.countDown();
							});
							
				countDownLatch.await();
				System.out.println("Test complete");
			}
		}

### Spring WebFlux Quote Service on GitHub ###
1. Github code
2. Docker containers

### Conclusion ###
1. Coming up:
2. Consumer in next part
3. Reactive MongoDB

## Section 7: Reactive MongoDB Quote Application ##
### Introduction ###
1. Spring Data MongoDB - Reactive streaming support exists
2. Other DBs have reactive types

### Introduction to MongoDB ###
1. About MongoDB
	1. MongoDB is a document oriented database
	2. The work Mongo is defived from Humongous
	3. Developed in C++
	4. MongoDB is a NoSQL database
	5. MongoDB documents are stored in BSON
		1. Binary JSON
2. History
	1. 10gen developed
	2. MongoDB - changed name
	3. Originally PaaS
3. Why use MongoDB?
	1. MongoDB is great for high insert systems
		1. Such as sensor readings, social media systems, advertising systems
	2. Good when you need schema flexibility
	3. Can also support a high number of reads per second
4. It is sclalable	
	1. It can run on minimum hardware
	2. It can be replicated
5. Why avoid mongodb?
	1. MongoDB has no concept of transactions
		1. No ACID
		2. No locking for transactional support, hence faster inserts
	2. Not good for concurrent updates
	3. Lots of jokes about MongoDB losing data
		1. If we have multiple updates on same record, then MongoDB is not good
			1. Losing one or two likes on facebook is no big deal
			2. Losing numbers in bank transactions is a big deal
6. MongoDB Terminology
	1. RDBMS
		1. Database
		2. Table
		3. Row
		4. Column
		5. Table Join
		6. Primary Key
		7. Aggregation
	2. MongoDB
		1. Database
		2. Collection
		3. Document
		4. Field
		5. Embedded Documents (similar to table joins - reference of docs)
		6. Primary Key
		7. Aggregation Pipeline
7. Spring Data: MongoDB makes is easy
	1. Don't have to modify schema to add property - DB migration is simpler

### Initial Spring Boot Project Creation ###
1. New project:
	1. guru.springframework
	2. mongodb-reactive-stock-quote-service
	3. maven
	4. Description: MogoDB for Reactive Stock Quote Service
	5. Latest stable release of Spring Boot
	6. Lombok, Reactive Web, Reactive MongoDB, Embedded MongoDB
	7. Select directory
	8. Finish
	9. Enable Annotation Processing

### Data Model ###
1. `domain.Quote`

		@Data
		@Document
		public class Quote {
		
			@Id
			private String id;
			private String ticker;
			private BigDecimal price;
			private Instant instant;
		}
		
2. `repositories.QuoteRepository`

		public interface QuoteRepository extends ReactiveMongoRepository<Quote, String> {
		}

### Spring WebFlux Client ###
1. `client.StockQuoteClient`

		@Data
		@Component
		@ConfigurationProperties("guru")
		public class StockQuoteClient {
			private String host;
			private String port;
			private String path;
			
			public Flux<Quote> getQuoteStream() {
				Strung url = "http://" + host + ":" + port;
			
				log.debug("Url Set is: " + url);
				
				return WebClient.builder()
							.baseUrl(url)
							.build()
							.get()
							.uri(path)
							.accept(MediaType.APPLICATION_STREAM_JSON)
							.retrieve()
							.bodyToFlux(Quote.class); // Streams forever
			}
		}
		
2. `application.properties`

		guru.host = localhost
		guru.port = 8081
		guru.path = /quotes
		
		logging.level.guru.springframework = debug

### Running Stock Quote Microservice ###
1. Running Quote Service on 8081

		server.port = 8081
		
	1. Run the Quote service

### Running MongoDB ###
1. How to run it from docker
	1. Docker for Java developers
2. `docker run -p 27017:27017 -d mongo`
	1. `-d` - run in background
	2. Gets latest if no tag
	3. `docker ps`
		1. Gives interesting name if not specified
3. It automatically connected
	1. **Robo 3T** - MongoDB client
		1. Available for multiple OSs

### QuoteRunner ###
1. QuoteRunner

		@Component // comment it out for not streaming quotes
		public class QuoteRunner implements CommandLineRunner {
			private final StockQuoteClient stockQuoteClient;
			
			public QuoteRunner(StockQuoteClient stockQuoteClient) {
				this.stockQuoteClient = stockQuoteClient;
			}
			
			@Override
			public void run(String... args) throws Exception {
				Flux<Quote> quoteFlux = stockQuoteClient.getQuoteStream();
				
				quoteFlux.subscribe(System.out::println);
			}
		}

### QuoteMonitorService ###
1. `service.QuoteMonitorService`

		@Service
		public class QuoteMonitorService implements ApplicationListener<ContextRefreshedEvent> { // Pure Spring and not Spring Boot - old school way
			private final StockQuoteClient stockQuoteClient;
			private final QuoteRepository quoteRepository;
			
			public QuoteMonitorService(StockQuoteClient stockQuoteClient, QuoteRepository quoteRepository) {
				this.stockQuoteClient = stockQuoteClient;
				this.quoteRepository = quoteRepository;
			}
			
			@Override
			public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
				stockQuoteClient.getQuoteStream()
									.log("quote-montior-service")
									.subscribe(quote -> {
										Mono<Quote> savedQuote = quoteRepository.save(quote);
										System.out.println("I saved a quote! Id: " + savedQuote.block().getId());
									});
			}
		}
		
	1. Restart Spring Boot
	2. Open Robo3T

### Constructing Capped Collections in MongoDB ###
1. Reactive mongo
	1. We can open cursor and stream data out of mongo collection (based on what is inserted)
2. It works only on capped collection
	1. Drop the collection
	2. Construct new collection
		1. Quote
		2. Advanced:
			1. Maximum size in bytes: 100,000
			2. Cap: 1000 docs (capped collection)

### Tailable Cursors with MongoDB ###
1. Implementing tailable collection
	1. Watch when inserted and receive a copy of that
2. Example:

		public interface QuoteRepository extends ReactiveMongoRepository<Quote, String> {
			@Tailable
			Flux<Quote> findWithTailableCursorBy();
		}
		
3. QuoteRunner

		@Override
		public void run(String... args) throws Exception { // listening to insert action of mongo and gets them here
			Flux<Quote> quoteFlux = repository.findWithTailableCursorBy();
			
			Disposable disposable = quoteFlux.subscribe(quote -> {
				System.out.println("Id: " + quote.getId());
			});
			
			disposable.dispose(); // imporatant - closing connection or else it may fall through
		}
		
4. Tailable cursor is buggy or may be due to max size in mongo

## Section 8: Appendix A - Using GitHub ##
1. [GitHub](https://www.youtube.com/watch?v=w3jLJU7DT5E)
2. Operations:
	1. [Checkout](https://www.youtube.com/watch?v=HwrPhOp6-aM&t=10s&list=PL0lo9MOBetEHhfG9vJzVCTiDYcbhAiEqL&index=2)
	2. [Branch](https://www.youtube.com/watch?v=H5GJfcp3p4Q&list=PL0lo9MOBetEHhfG9vJzVCTiDYcbhAiEqL&index=2)
	3. [Ignore](https://www.youtube.com/watch?v=4VBG9FlyiOw&t=0s&list=PL0lo9MOBetEHhfG9vJzVCTiDYcbhAiEqL&index=4)
	4. [Move](https://www.youtube.com/watch?v=ipdgyfPq8FE&t=0s&list=PL0lo9MOBetEHhfG9vJzVCTiDYcbhAiEqL&index=5)
	5. [Remove](https://www.youtube.com/watch?v=jtuHOIlfS2Q&t=0s&list=PL0lo9MOBetEHhfG9vJzVCTiDYcbhAiEqL&index=6)
	6. [Log](https://www.youtube.com/watch?v=Ew8HQsFyVHo&t=0s&list=PL0lo9MOBetEHhfG9vJzVCTiDYcbhAiEqL&index=7)
	7. [Diff](https://www.youtube.com/watch?v=RXSriVcoI70&t=0s&list=PL0lo9MOBetEHhfG9vJzVCTiDYcbhAiEqL&index=8)
	8. [Init](https://www.youtube.com/watch?v=WxMFZncm12s&t=0s&list=PL0lo9MOBetEHhfG9vJzVCTiDYcbhAiEqL&index=10)
	9. [Config](https://www.youtube.com/watch?v=ZChtKFLiaNw&t=0s&list=PL0lo9MOBetEHhfG9vJzVCTiDYcbhAiEqL&index=11)
	10. [Setup](https://www.youtube.com/watch?v=7Inc0G0wutk&t=0s&list=PL0lo9MOBetEHhfG9vJzVCTiDYcbhAiEqL&index=12)
	11. [Merge](https://www.youtube.com/watch?v=yyLiplDQtf0&t=0s&list=PL0lo9MOBetEHhfG9vJzVCTiDYcbhAiEqL&index=13)