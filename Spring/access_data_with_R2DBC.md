# Access Data with R2DBC #
## Project ##
## Pre-Requisites ##
## Starting with Spring Initializr ##
1. Dependencies:
	1. R2DBC
	2. H2

## Define a Schema ##
1. `Customer` objects
	1. `src/main/resources/schema.sql`

			CREATE TABLE customer (id SERIAL PRIMARY KEY, first_name VARCHAR(255), last_name VARCHAR(255));
			
		1. `ConnectionFactoryInitializer` - This needs to be registered to pich up `schema.sql` file during app startup to initialize database schema
		2. H2 driver will be on the classpath & connection URL is not specified, so Spring Boot starts embedded H2 database

## Define a Simple Entity ##
1. `src/main/java/com/example/accessingdatar2dbc/Customer.java`

		package com.example.accessingdatar2dbc;
		
		import org.springframework.data.annotation.Id;
		
		public class Customer {
			@Id
			private Long id;
			
			private final String firstName;
			
			private final String lastName;
			
			public Customer(String firstName, String lastName) {
				this.firstName = firstName;
				this.lastName = lastName;
			}
			
			public Long getId() {
				return this.id;
			}
			
			public void setId(Long id) {
				this.id = id;
			}
			
			public String getFirstName() {
				return this.firstName;
			}
			
			public String getLastName() {
				return this.lastName;
			}
			
			@Override
			public String toString() {
				return String.format(
					"Customer[id=%d, firstName='%s', lastName='%s']",
					id, firstName, lastName);
			}
		}
		
	1. `@Id`: Used by R2DBC to identify the field as a primary key
		1. Primary key generation: By default, assumed that they are generated by database on `INSERT`
	2. `firstName` & `lastName` - un-annotated => column names are the same

## Construct Simple Queries ##
1. Compelling feature:
	1. Ability to construct repo implementations at runtime for repo interface
2. `src/main/java/com/example/accessingdatar2dbc/CustomerRepository.java`

		package com.example.accessingdatar2dbc;
		
		import org.springframework.data.r2dbc.repository.Query;
		import org.springframework.data.repository.reactive.ReactiveCrudRepository;
		
		import reactor.core.publisher.Flux;
		
		public interface CustomerRepository extends ReactiveCrudRepository<Customer, Long> { // **(M)**
			@Query("SELECT * FROM customer WHERE last_name = :lastname")
			Flux<Customer> findByLastName(String lastName);
		}
		
	1. Several methods from `ReactiveCrudRepository` are inherited (saving, deleting, finding `Customer` entities using reactive types)
	2. `@Query` - Other queries can be defined

## Construct an Application Class ##

		@SpringBootApplication
		public class AccessingDataR2dbcApplication {
			private static final Logger log = LoggerFactory.getLogger(AccessingDataR2dbcApplication.class);
			
			public static void main(STring[] args) {
				// ...
			}
			
			@Bean
			ConnectionFactoryInitializer initializer(ConnectionFactory connectionFactory) {
				ConnectionFactoryInitializer initializer = new ConnectionFactoryInitializer();
				initializer.setConnectionFactory(connectionFactory);
				initializer.setDatabasePopulator(new ResourceDatabasePopulator(new ClassPathResource("schema.sql")));
				return initializer;
			}
			
			@Bean
			public CommandLineRunner demo(CustomerRepository repository) {
				return (args) -> {
					// save a few cutomers
					repository.saveAll(Arrays.asList(new Customer("Jack", "Bauer"),
						new Customer("Chloe", "O'Biran"),
						new Customer("Kim", "Bauer"),
						new Customer("David", "Palmer"),
						new Customer("Michelle", "Dessler")))
						.blockLast(Duration.ofSeconds(10));
						
					// fetch all customers
					log.info("Customers found with findAll():");
					log.info("-------------------------------");
					repository.findAll().doOnNext(customer -> {
						log.info(customer.toString());
					}).blockLast(Duration.ofSeconds(10));
					
					// fetch an individual customer by ID
					repository.findById(1L).doOnNext(customer -> {
						log.info("Customer found with findById(1L):");
						log.info("---------------------------------");
						log.info(customer.toString());
						log.info("");
					}).block(Duration.ofSeconds(10));
					
					// fetch customers by last name
					log.info("Customer found with findByLastName('Bauer'):");
					log.info("--------------------------------------");
					repository.findByLastName("Bauer").doOnNext(bauer -> {
						log.info(bauer.toString());
					}).blockLast(Duration.ofSeconds(10));
					log.info("");
				};
			}
		}

1. We are synchronizing each call with a variant of `block(...)`
	1. In a reactive application:
		1. `Mono` or `Flux` represents a pipeline of operators that is handed back to 
			1. Web controller or
			2. Event processor
		2. The web controller or event processor subscribes to reactive sequence without blocking calling thread.
2. By default - Spring Boot enables R2DBC repo support and looks in package (and subpackages) wehre `@SpringBootApplication` is located
	1. If R2DBC repo interface is in a package that is not visible, then define the alternative package using:

			@EnableR2dbcRepositories
			
		1. And the following parameter

				basePackageClasses=MyRepository.class

## Build an Executable JAR ##
## Summary ##