# Startup in Spring #
## Introduction ##
1. How to run logic at startup of a Spring application

## Running Logic On Startup ##
1. Note: We need to renounce partial control over the application's flow to the container
	1. Do not include logic in bean's constructors or call methods after instantiation of any object (this is controlled by Spring)
2. Example:

		@Component
		public class InvalidInitExampleBean {
			@Autowired
			private Environment env;

			public InvalidInitExampleBean() {
				env.getActiveProfiles(); // do not do this
			}
		}

	1. `autowired` field is accessed in constructor when constructor is called, Spring bean is not yet fully initialized (results in `NullPointerException`)

### The `@PostConstruct` Annotation ###
1. `@PostConstruct` - used to annotate a method that should be run **once immediately after the bean's initialization**
	1. Executed even if there is nothing to inject

			@Component
			public class PostConstructExampleBean {
				private static final logger LOG = Logger.getLogger(PostConstructExampleBean.class);

				@Autowired
				private Environment environment;

				@PostConstruct
				public void init() {
					LOG.info(Arrays.asList(environment.getDefaultProfiles()));
				}
			}

		1. `environment` is safely injected before calling `init`

### The `InitializingBean` Interface ###
1. Similar to previous one but with implementation of interface and implementation of `afterPropertiesSet()` method

		@Component
		public class InitializingBeanExampleBean implements InitializingBean {
			private static final Logger LOG = Logger.getLogger(InitializingBeanExampleBean.class);

			@Autowired
			private Environment environment;

			@Override
			public void afterPropertiesSet() throws Exception {
				LOG.info(Arrays.asList(environment.getDefaultProfiles()));
			}
		}

### An `ApplicationListener` ###
1. Used to **run logic after the Spring context has been initialized**
	1. Note: Waits until all the beans are initialized
2. Construct a bean that implements `ApplicationListener<ContextRefreshedEvent>` interface

		@Component
		public class StartupApplicationListenerExample implements ApplicationListener<ContextRefreshedEvent> {
			private static final Logger LOG = Logger.getLogger(StartupApplicationListenerExample.class);

			public static int counter;

			@Override
			public void onApplicationEvent(ContextRefreshedEvent event) {
				LOG.info("Increment counter");
				counter++;
			}
		}

3. It can also be achieved with `@EventListener` annotation

		@Component
		public class EventListenerExampleBean {
			private static final Logger LOG = Logger.getLogger(EventListenerExampleBean.class);

			public static int counter;

			@EventListener
			public void onApplicationEvent(ContextRefreshedEvent event) {
				LOG.info("Increment counter");
				counter++;
			}
		}

	1. `ContextRefreshedEvent` is one of many other events

### The XML `init-method` ###
1. Example: XML way

		public class InitMethodExampleBean {
			private static final Logger LOG = Logger.getLogger(InitMethodExampleBean.class);

			@Autowired
			private Environment environment;

			public void init() {
				LOG.info(Arrays.asList(environment.getDefaultProfiles()));
			}
		}

		<bean id="initMethodExampleBean" class="org.baeldung.startup.InitMethodExampleBean" init-method="init">
		</bean>

### Constructor Injection ###
1. If injecting fields using constructor injection, include the logic in constructor

		@Component
		public class LogicInConstructorExampleBean {
			private static final Logger LOG = Logger.getLogger(LogicInConstructorExampleBean.class);

			private final Environment environment;

			@Autowired
			public LogicInConstructorExampleBean(Environment environment) {
				this.environment = environment;
				LOG.info(Arrays.asList(environment.getDefaultProfiles()));
			}
		}

## Combining Mechanisms ##
1. Combinging above mechanisms
2. Order of executions
	1. The constructor
	2. the `@PostConstruct` annotated methods
	3. the `InitializingBean`'s `afterPropertiesSet()` method
	4. the initialization method specified as `init-method` in XML
3. Example:

		@Component
		@Scope(value = "prototype")
		public class AllStrategiesExampleBean implements InitializingBean {
			private static final Logger LOG = Logger.getLogger(AllStrategiesExampleBean.class);

			public AllStrategiesExampleBean() {
				LOG.info("Constructor");
			}

			@Override
			public void afterPropertiesSet() throws Exception {
				LOG.info("InitializingBean");
			}

			@PostConstruct
			public void postConstruct() {
				LOG.info("PostConstruct");
			}

			public void init() {
				LOG.info("init-method");
			}
		}

## Conclusion ##
1. [Code samples](https://github.com/eugenp/tutorials/tree/master/spring-all)