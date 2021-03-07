# Defining Asynchronous Methods #
1. Asynchronous queries to GitHub.
	1. Feature that can be used when scaling services

## Project ##
1. Lookup service queries GitHub user info and retrieves data through GitHub's API
	1. `CompletableFuture` interface
		1. Expensive jobs can be run using this interface in the background and wait for results
		2. `Future` - `CompletableFuture` has evolved from `Future`
		3. It makes it easy to pipeline multiple asynchronous operations and merge them into single asynchronous computation

## Starting with Spring Initializr ##
1. Dependency: Spring Web

## Construct a Representation of a GitHub User ##
1. Resource representation class - to model user representation
2. User.java

		@JsonIgnoreProperties(ignoreUnknown = true)
		public class User {
			private String name;
			private String blog;
			
			public String getName() {
				return name;
			}
			
			public void setName(String name) {
				this.name = name;
			}
			
			public String getBlog(String blog) {
				return blog;
			}
			
			public void setBlog(String blog) {
				this.blog = blog;
			}
			
			@Override
			public String toString() {
				return "User [name=" + name + ", blog=" + blog + "]";
			}
		}
		
	1. `Jackson JSON` library - GitHub's JSON response into `User` object
	2. `@JsonIgnoreProperties` - tells Spring to ignore attributes not listed in class
		1. The technique is used to make REST calls and produce domain objects
		2. `name` and `blog` URL are the only properties grabbed

## Construct a GitHub Lookup Service ##
1. GitHubLookupService.java

		@Service
		public class GitHubLookupService {
			private static final Logger logger = LoggerFactory.getLogger(GitHubLookupService.class);
			
			private final RestTemplate restTemplate;
			
			public GitHubLookupService(RestTemplateBuilder restTemplateBuilder) {
				this.restTemplate = restTemplateBuilder.build();
			}
			
			@Async // **(M)**
			public CompletableFuture<User> findUser(String user) throws InterrupedException {
				logger.info("Looking up " + user);
				String url = String.format("https://api.github.com/users/%s", user);
				User results = restTemplate.getForObject(url, User.class);
				// Artificial delay of 1s for demonstration purposes
				Thread.sleep(1000L);
				return CompletableFuture.completedFuture(results);
			}
		}
		
	1. `RestTemplate` - used to invoke remote REST endpoint (api.github.com/users/) & convert answer into `User` object.
		1. `RestTemplateBuilder` - provided by Spring Boot
			1. It customizes auto-configuration bits (`MessageConverter`)
	2. `@Service` - makes class a candidate for component scan to detect and add to application context
	3. `@Async` - Indicates that `findUser` should run on a separate thread
		1. Return type of method is `CompletableFuture<User>` (requirement of async methods)
		2. The method returns `CompletableFuture` that is already completed with result of the GitHub query
	4. `GitHubLookupService` - to allow `findUser` method to run asynchronously, it must be created in `@Configuration` class or picked up by `@ComponentScan`

## Make the Application Executable ##
1. `@Async` works with web applications as it is
	1. If web container is not desired, the following configuration can be used:
2. AsyncMethodApplication.java

		@SpringBootApplication
		@EnableAsync
		public class AsyncMethodApplication {
			public static void main(String[] args) {
				// close the application context to shut down the custom ExecutorService
				SpringApplication.run(AsyncMethodApplication.class, args).close();
			}
			
			@Bean
			public Executor taskExecutor() {
				ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
				executor.setCorePoolSize(2);
				executor.setMaxPoolSize(2);
				executor.setQueueCapacity(500);
				executor.setThreadNamePrefix("GithubLookup-");
				executor.initialize();
				return executor;
			}
		}
		
	1. `@EnableAsync` - Enables Spring to run `@Async` methods in background thread pool
	2. `taskExecutor` - customizes `Executor` by defining a bean (this is the specific method name that Spring searches)
		1. [Other things that can be tuned](https://docs.spring.io/spring-framework/docs/current/spring-framework-reference/integration.html#scheduling-task-executor)
		2. If `Executor` bean is not defined:
			1. Spring defines `SimpleAsyncTaskExecutor` and uses it
3. AppRunner.java - `CommandLineRunner` that injects `GitHubLookupService` and calls the service three times to demo method is executed asynchronously

		@Component
		public class AppRunner implements CommandLineRunner {
			private static final Logger logger = LoggerFactory.getLogger(AppRunner.class);
			
			private final GitHubLookupService gitHubLookupService;
			
			public AppRunner(GitHubLookupService gitHubLookupService) {
				this.gitHubLookupService = gitHubLookupService;
			}
			
			@Override
			public void run(String... args) throws Exception {
				// Start the clock
				long start = System.currentTimeMillis();
				
				// Kick off multiple, asynchronous lookups
				CompletableFuture<User> page1 = gitHubLookupService.findUser("PivotalSoftware");
				CompletableFuture<User> page2 = gitHubLookupService.findUser("CloudFoundry");
				CompletableFuture<User> page3 = gitHubLookupService.findUser("Spring-Projects");
				
				// Wait until they are all done
				CompletableFuture.allOf(page1, page2, page3).join(); // **(M)**
				// Print results, including elapsed time
				logger.info("Elapsed time: " + (System.currentTimeMillis() - start));
				logger.info("--> " + page1.get());
				logger.info("--> " + page2.get());
				logger.info("--> " + page3.get());
			}
		}
		
	1. `allOf` - An array of `CompletableFuture` objects are created
	2. `join` - to wait for completion of all `CompletableFuture` objects
	3. The calls happen in seperate threads `GithubLookup-1` and `GithubLookup-2`
		1. Third one is parked (until one of the two threads becomes available)
	4. `Executor` can also be tuned to increase `corePoolSize`
4. When to use `CompletableFuture`?
	1. The longer the task takes and the more tasks are invoked simultaneously
	2. Trade-off - `CompletableFuture` adds a layer of indirection (not dealing directly with results)