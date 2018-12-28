# Build a Basic App with Spring Boot and JPA using PostgreSQL #
## Introduction ##
1. Okta: Professionally maintained OAuth and JWT technologies integrated into Spring Boot using Spring Security
2. Project:
	1. Resource server using Spring Boot & Spring Data JPA
	2. Group based authentication and authorization layer using OAuth 2.0
3. Background:
	1. **Resource Server**: Programmatic access point for server's functions and data (API server and/or possibly REST server)
	2. **JPA**: Java Persistence API
		1. Spec for managing relational databases using Java
		2. Describes abstraction layer between Java classes and a relational database
	3. **Spring Data JPA**: Wrapper around JPA providers such as Hibernate
		1. Add some annotations and a simple repository interface
		2. We can switch database implementation without change to code
			1. Only dependencies may need to be changed

## Install PostgreSQL for JPA Persistence ##
1. [their downloads page](https://www.postgresql.org/download/) and install it
2. Postgres user and database for project
	1. CLI
		1. `psql -v`

## Create a PostgreSQL Database for Your JPA Entities ##
1. Pre-requisites
	1. User for app
		1. `jpatutorial`
	2. Password for user
	3. Database for app
		1. `springbootjpa`
	4. Grant privileges on database for user
2. Type `psql` to enter postgres shell

### Creation of User ###

		create user jpatutorial;

	1. Response:
		1. `CREATE ROLE`

### Give the user a password ###

		alert user jpatutorial with encrypted password '<your realyy secure password>';

	1. Response
		1. `ALTER ROLE`

### Creation of database ###

		create database springbootjpa;

	1. Response
		1. `CREATE DATABASE`

### Grant Privileges ###

		grant all privileges on database springbootjpa to jpatutorial;

	1. Response
		1. `GRANT`
	2. `\q`: Quit shell
		1. [Postgres' docs](https://www.postgresql.org/docs/9.2/app-psql.html)

## Build a Spring Boot Resource Server ##
1. Clone starter project

		git clone -b start
		https://github.com/oktadeveloper/okta-spring-boot-jpa-example.git

1. Has little bit of Postgres-specific config
	1. `build.gradle`
		1. PostgreSQL JPA connector dependency
	2. `src/main/resources/hibernate.properties`
	3. `src/main/resources/application.yml`
		1. Pre-filled properties
2. Open `application.yml` and fill in password

		spring:
			jpa:
				hibernate:
					ddl-auto: create
				database-platform: org.hibernate.dialect.PostgreSQLDialect
				datasource:
					url: "jdbc:postgresql://localhost:5432/springbootjpa"
					username: jpatutorial
					password: <your-password>

	1. `ddl-auto`: specifies hibernate's behavior upon loading
		1. `validate`: validates schema but does not make any changes
		2. `update`: updates schema
		3. `create`: creates schema, destroying any previous data
			1. New database is created starting with fresh tables and data
		4. `create-drop`: like create, but also drops schema when session closes (useful for testing)
2. `database-platform`: unnecesary
	1. Spring Data/Hibernate can auto detect
		1. If Postgres server is not started and if this property is missing, unimportant error
		2. Needed for auto-detection
3. Run the app:

		`gradlew bootRun`

## Add a Domain Class with Spring Data and JPA ##
1. Domain/model:
	1. Programmatic representation of data being stored
	2. Spring Data and JPA can take Java class and turn it into database table
	3. Auto-generates load and save methods
		1. Database independent
2. Switching database requires changing properties files
	1. `build.gradle`
	2. `application.yml`
3. `com.okta.springbootjpa.Kayak.java`

		package com.okta.springbootjpa;

		import lombok.Data;

		import javax.persistence.Entity;
		import javax.persistence.GeneratedValue;
		import javax.persistence.GeneratedType;
		import javax.persistence.Id;

		@Entity // This tells Hibernate to make a table out of this class
		@Data // Lombok: adds getters and setters
		public class Kayak {
			public Kayak(String name, String owner, Number value, String makeModel) {
				this.name = name;
				this.owner = owner;
				this.value = value;
				this.makeModel = makeModel;
			}

			@Id
			@GeneratedValue(strategy = GeneratedType.AUTO)
			private Integer id;
	
			private final String name;

			private Number value;

			private String makeModel;
		}

## Implement a CRUD Repository with Spring Data JPA ##
1. Adding a resource server

		package com.okta.springbootjpa;

		import org.springframework.data.repository.CrudRepository;
		import org.springframework.data.rest.core.annotation.RepositoryRestResource;

		@RepositoryRestResource
		public interface KayakRepository extends CrudRepository<Kayak, Integer> {
		}

	1. Add `init()` to `SpringBootJpaApplication` class

			package com.okta.springbootjpa;

			import org.springframework.boot.ApplicationRunner;
			import org.springframework.boot.SpringApplication;
			import org.springframework.boot.autoconfigure.SpringBootApplication;
			import org.springframework.context.annotation.Bean;
			import java.text.NumberFormat;
			import java.text.ParserException;
			import java.util.stream.Stream;

			@SpringBootApplication
			public class SpringBootJpaApplication {
				public static void main(String[] args) {
					SpringApplication.run(SpringBootJpaApplication.class, args);
				}

				@Bean
				ApplicationRunner init(KayakRepository repository) {
					String[][] data = {
						{ "sea", "Andrew", "300.12", "NDK" },
						{ "creak", "Andrew", "100.75", "Piranha" },
						{ "loaner", "Andrew", "75", "Necky" }
					};

					return args -> {
						Stream.of(data).forEach(array -> {
							try {	
								Kayak kayak = new Kayak(
									array[0],
									array[1],
									NumberFormat.getInstance().parse(array[2]),
									array[3]
								);
								repository.save(kayak);
							} catch (ParseException e) {
								e.printStackTrace();
							}
						});
						repository.findAll().forEach(System.out::println);
					};
				}
			}

		1. Runs when app starts
		2. Loads sample data into resource server

## Test Your Spring Boot Resource Server ##
1. HTTPie: CLI
	1. To run requests against resource server
	2. `brew install httpie`
	3. Make sure app is running
2. Run GET request

		http :8080/kayaks (shorthand)

3. Add new kayak

		http POST :8080/kayaks name="sea2" owner="Andrew" value="500" makeModel="P&H"

4. Delete kayak

		http DELETE :8080/kayaks/4

	1. Deletes kayak with ID=4

5. Verification

		psql
		\connect springbootjpa
		SELECT * FROM kayak;

	1. The data is erased and created fresh for every boot

## Set Up Authentication ##
1. Okta: software-as-service identity, authentication, and authorization provider
2. Challenges:
	1. Online security is hard
	2. Vulnerabilities are found and servers must be updated quickly
	3. Changes can give rise to new vulnerabilities

## Configure Your Spring Boot Resource Server for Token Authentication ##

## Test the Protected Spring Boot Server ##

## Generate an Access Token ##

## Use the Access Token ##

## Add Group-based Authorization ##

## Test the Admin User in Your Spring Boot App ##

## Define a Non-Admin User ##

## Test Group-based Authorization in Your Spring Boot App ##

## Learn More about Spring Boot, Spring Security, and Secure Authentication ##

