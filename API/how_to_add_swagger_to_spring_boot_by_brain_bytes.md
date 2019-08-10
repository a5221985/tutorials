# How to Add Swagger to Spring Boot - Brain Bytes #
1. What is swagger
2. How to use it?
3. Integratin swagger to a Spring Boot application

## What is Swagger? ##
1. It has tools to:
	1. Develop APIs
	2. Interact with APIs
	3. Document APIs (very good)
		1. Swagger UI

## Documenting APIs ##
1. API Consumer:
	1. What are the end points
	2. What are the response codes
	3. What is the payload structure
	4. What are the error conditions
2. API Developer:
	1. Generate documentation for the API
3. SOAP: Has WSDL for documentation
4. REST: no formal documentation is spec
	1. Swagger is used for this

## How does Swagger Generate Documentation ##
1. Swagger generates documentation based on metadata in the code
	1. API
	2. Notes
2. Formats
	1. JSON
	2. XML
	3. HTML
	4. ...
3. Swagger automatically updates documentation on change

## Adding Swagger to Spring Boot ##
1. Getting the Swagger 2 Spring Dependency
	1. Swagger is a spec and Spring has an implementation
2. Enabling Swagger in your code
3. Configuring Swagger
	1. Specific APIs
4. Adding details as annotations to APIs
	1. Adding notes
		1. More information (model objects, annotations)

## Spring Boot Project ##
1. `pom.xml`
	1. `spring-boot-starter-web`
2. Address book API

		@RestController
		public class AddressBookResource {
			
			ConcurrentMap<String, Contact> contacts = new ConcurrentHashMap<>();
			
			@GetMapping("/{id}")
			public Contact getContact(@PathVariable String id) {
				return contacts.get(id);
			}
			
			@GetMapping("/")
			public List<Contact> getAllContacts() {
				return new ArrayList<Contact>(contacts.values());
			}
			
			@PostMapping("/")
			public Contact addContact(@RequestBody Contact contact) {
				contacts.put(contact.getId(), contact);
				return contact;
			}
		}
		
		public class Contact {
			private String id;
			private String name;
			private String phone;
			// getters and setters
		}
		
3. Postman

		localhost:8080
		
			Bodies:
			
			{
				"id": "foo",
				"name":"Mr. Foo",
				"phone","123-123-1234"
			}
			
			{
				"id": "bar",
				"name":"Mr. Bar",
				"phone","999-123-1234"
			}

			Headers:
			
					Content-Type: application/json
					
		localhost:8080/foo
		
4. Adding Swagger dependency
	1. 	`springfox-swagger2` - version - 2.9

			<depencency>
				<groupId>io.springfox</groupId>
				<artifactId>springfox-swagger2</artifactId>
				<version>2.9.2</version>
			</dependency>
			
5. Enabling Swagger 2

		@SpringBootApplication
		@EnableSwagger2
		...
		
	1. Use Config class instead of in root class if actual application
6. Restart Application

		http://localhost:8080/v2/api-docs
		
7. Springfox-swagger-UI

		<dependency>
			<groupId>io.springfox</groupId>
			<artifactId>springfox-swagger-ui</artifactId>
			<version>2.9.2</version>
		</dependency>
		
	1. Take API out of the root - allows swagger UI handling the root URL

			@RequestMapping("/api")
			
		1. localhost:8000/swagger-ui.html
			1. Try it out
				1. JSON autofilling of template
		2. Basic error controller - comes with Spring MVC (error end-points)
		3. Models
			1. Contacts