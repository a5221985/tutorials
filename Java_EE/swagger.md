# Swagger #
## What to learn ##
1. Provide documentation for REST-API
2. Access API with browser using Swagger UI
3. Generate client code for accessing API
4. Get a nice picture of API services and models
## What is Swagger ##
1. Language-agnostic interface to REST APIs
2. Allows to discover and understand capabilities of a service
3. Swagger removes guesswork in calling the service
4. Swagger renders the API docs in JSON syntax
5. It is a standardized way to describe an API in JSON syntax
6. [https://github.com/swagger-api/swagger-spec](https://github.com/swagger-api/swagger-spec)

## Technology stack ##
1. Spring
	1. Spring Boot for fast start
	2. Also possible for Spring REST apps
2. Springfox
	1. For providing the dynamic api-docs
3. Swagger UI
	1. For accessing the api using a browser
4. Swagger Codegen
	1. For generating client code stubs

## Big Picture ##
1. REST-API
	1. Springfox (/v2/api-docs/) - add it to application and documentation is automatically generated
		1. Swagger-UI (/swagger/index.html) - uses API docs for generating html
		2. Swagger-Codegen - uses API docs for generating stub code
			1. Client-Code (Java, PHP, C#, Ruby, nodejs, Objective-C, ...)
2. Springfox
	1. Provide complete api-docs for every @RESTController
		1. Services
		2. Supported Verbs (GET/POST/...)
		3. Request parameters/body
		4. Response codes + body
	2. Many customization options (hide attributes, custom data types, ...)
3. Swagger UI
	1. JavaScript app for accessing complete REST API using browser
	2. Lists all services directly from (dynamic) api-docs
	3. Always consistent with your API!
		1. Don't have to generate API docs again and again, it is up to date
4. Swagger Codegen
	1. Commandline program to generate Client code stubs
	2. Generates client stubs (customizable)
	3. Supported languages
		1. Java, C#, Dart, Flash, Groovy, JaxRS, NodeJS, Objective-C, Perl, PHP, Python, Ruby, Scala, ...

## Why generate client code? ##
1. Ensure consistency of client code with the API!
2. Makes code completion possible
	1. For service methods & model classes
3. Allows developers to read description for your operations and models in the IDE (if description is added)
4. You get compilation errors if the API breaks with newer versions!
	1. Immediate notification if API changes

## Demo ##
1. Add dependencies
	1. `springfox-swagger2`
2. `@EnableSwagger2` on ApplicationClass
3. Open `http://localhost:8080/v2/api-docs`