# Java Web Services #
## Software Setup and Troubleshooting ##
### Install Java ###
### Spring Tool Suite Installation ###
### Configuring JDK in Spring Tool Suite ###
### Install Postman ###
### Download the completed projects ###
### Install SoapUI ###
1. Free open source tool to test SOAP webservices
	1. Download soapui (free version)
2. Open SOAPUI

### Troubleshooting ###
1. Maven related errors
	1. goto `.m2` folder
2. Run `mvn clean`
3. `mvn install` should install all dependencies afresh
4. Run Maven > Update Project in Eclipse

### Lecture Notes for download ###
1. Download Java Web Services

### If you want to Skip to REST Web Services ###
1. Order for only RESTFul web services
	1. Software Setup
	2. Install everything except SOAPUI
	3. XML and XML Schema Definition Crash Course (optional)
	4. Apache CXF
	5. Section 16 to the end

## Web Services - The Big Picture ##
### Course Introduction ###
1. Refresh by refering to lectures once a week

### Web Services Introduction ###
1. Topics:
	1. What are web services?
	2. Two types of web services
	3. Java Standards for the types
2. What?
	1. Web services are client server/ consumer provider apps that communicate over the network through HTTP protocol and exchange messages/data in various formats
	2. Advantages:
		1. Interoperability: Software apps developed in different programming languages can communicate with each other (even if running on different platforms)
		2. Loosely Coupled: Two or more apps can communicate in loosely coupled fashion
			1. Any app can replace the other if the web services standard is maintained
		3. Extensibility: We can integrate different apps easily
			1. Web service producers can expose services, and consumers can come up with logic to consume the services
		4. Mashups: Mashup apps can consume web services from multiple applications
3. Types:
	1. SOAP
		1. XML based messages over HTTP POST request
	2. RESTFul:
		1. All HTTP methods can be used
		2. Multiple data formats are supported
4. Tools for SOAP and RESTFul web services:
	1. JAX-WS: SOAP web services API
	2. JAX-RS: RESTFul web services API
		1. Java API for RESTFul web services

### SOA and Web Services ###
1. Topics:
	1. What is SOA?
		1. Collection of architectural principles to design and implement software apps in such a way that they are composed of several software services that have simple well defined interfaces and that can use each other in a loosely coupled manner
		2. Maintained by W3C and OASIS (architectural principles)
			1. We can use them in Web services
		3. SOA has two roles
			1. Consumer
			2. Provider
				1. Can be consumer of another service
		4. Example:
			1. SOA definition:
				1. Service: Implementation of business logic that operates in independence of state of another service
			2. Appointment management consumes Patient service and Doctor Service
			3. Doctor service consumes Clinical service
			4. Clinical service consumes Patient service
			5. Patient service consumes Bed management service
		5. Contract should be intect
			1. SOAP: WSDL
			2. REST: WADL
		6. SOA data format:
			1. XML: It has data + metadata (what to do with that data)
	2. Who uses SOA?
	3. Why SOA?
	4. Why Web Services? Implements SOA principles
2. Advantages of SOA:
	1. Platform independence
	2. Focussed developer roles (per service)
	3. Loosely coupled
	4. Reusability (google mail, drive, docs)
		1. Cost reduction
	5. Scalability
		1. If user base grows, we can deploy the services in multiple servers
	6. Availability
		1. More reliable because a server going down does not bring down services
	7. Interoperability

### Section Summary ###
1. Web services are consumer and provider applications that can be written in multiple languages running on different platforms which can communicate with each other
	1. HTTP
	2. XML
2. Advantages:
	1. Interoperability
	2. Loosely Coupled
	3. Extensibility
	4. Mashups
3. Two types of Web services:
	1. SOAP
		1. JAX-WS
	2. REST
		1. JAX-RS
4. SOA: Architectural principles
	1. Service: Implementation of business logic that operates on its own
	2. Web services is one of ways in which SOA can be implemented

## XML and XML Schema Definition Crash Course ##
### Introduction ###
### What is XML? ###
### Why XML? ###
### When to use XML? ###
### What is XSD? ###
### When to use XSD? ###
### Namespaces ###
### XML Schema Hands On Usecase ###
### XML Schema Hands On ###
### Creation of Simple Types ###
### Controlling the Order of Elements ###
### Controlling the number of Elements ###
### Meaning of the elementFormDefault attribute ###
### Defining Attributes ###
### Section Summary ###

## SOAP Web Services Concepts ##
### Introduction ###
### SOAP Web Services Overview ###
### SOAP Web Services Advantages and Disadvantages ###
### When to use SOAP Web Services? ###
### SOAP ###
### WSDL File Explained ###
### WSDL Binding Styles ###
### Section Summary ###

## SOAP Web Services Design and Implementation ##
### Introduction ###
### SOAP Web Services Design Approaches ###
### Section Summary ###

## JAX-WS AND JAXB ##
### JAX-WS ###
### JAXB Introduction ###
### Generating java classes from xml schema ###
### Marshalling and Unmarshalling ###
### JAXWS Summary ###
### JAXB Summary ###

## Apache CXF ##
### Introduction ###
1. Tools used to develop web services
	1. Java Stacks:
		1. Apache CXF (popular)
		2. Apache AXIS
		3. METRO
		4. WebLogic
		5. Web Sphere
	2. .Net Stacks:
		1. WCF

### Apache CXF Overview ###
1. Popular Webservices stack in Java
	1. Web services stack/engine provides with various tools to build and run web services
		1. Developers can focus on business logic
	2. CXF:
		1. Implements both JAX-WS and JAX-RS standards
		2. Can be used build producers and consumers
		3. Comes with SOAP/REST Engine
			1. Serializes and De-Serializes messages back and forth to Java objects
			2. Publishes and dispatches request to service endpoint
				1. XML <- SOAP/REST Engine -> Java Object <-> WS Endpoint Method
		4. Implements almost all web service standards (just configuration is required using configuration files)
			1. WS-Security
			2. WS-Policy
			3. WS-Transactions
			4. ...
		5. Tools
			1. `wsdl2java` - generates code from WSDL code
				1. Used to generate WS client using stubs generated
			2. `java2wsdl` - code first development
		6. Plugins for ant and maven
			1. Include tools as ant tasks or maven plugin
		7. Uses Spring Configuration to configure web services endpoints and other features
			1. Annotations or config file
		8. Interceptors or Handlers can be used to extend CXF (custom code)
		9. Documentation and Samples
		10. [http://cxf.apache.org/](http://cxf.apache.org/)

### CXF and Spring Boot ###
1. Add cxf spring boot dependency
	1. When project gets created
		1. `cxf-spring-boot-starter-jaxrs`
			1. other jar files for RESTFul services and SOAP services are installed
	2. Publishing RESTFul endpoints very easy
		1. `application.properties`

				cxf.jaxrs.component-scan=true
				
			1. Endpoints are automatically discovered and published
			2. Web application context

					server.context-path=/restws

### Spring Boot ###
1. Easy way to build Java apps
	1. [Spring Framework in Easy Steps](https://www.udemy.com/springframeworkineasysteps/): Section 25

### Creation of SOAP Project ###
1. Open STS
	1. Name: hellowebservice
	2. Group: com.bharath.ws.soap
	3. Description: Hello SOAP Service
	4. Package: same as Groupname
2. `pom.xml`
	1. Search for `cxf spring boot jax ws maven dependency`
	2. Pick latest version
	3. Copy to `<dependencies>` section

### Creation of Endpoint ###
1. Right click on Package > New > Class
	1. `HelloWS`


			@WebService
			public class HelloWS {	
			
				@WebMethod
				public String hello() {
					return "hello";
				}
				
			}

### Creation of Configuration Class ###
1. New Java Class > `com.bharath.ws.soap.config.WebServiceConfig`

		import javax.xml.ws.Endpoint;
		
		import org.apache.cxf.Bus;
		import org.apache.cxf.jaxws.EndpointImpl;
		import org.springframework.context.annotation.Configuration;

		@Configuration
		public class WebServiceConfig {
		
			@Autowired
			private Bus bus;
		
			@Bean
			public Endpoint endpoint() {
				Endpoint endpoint = new EndpointImpl(bus, new HelloWS()); // bus - CXF runtime
				endpoint.publish("/hello");
				return endpoint;
			}
		}

### Run the Application ###
1. Right click on project > Run as > Spring Boot Application
2. Open **http://localhost:8080/services** (cxf feature - services are exposed here)
	1. Click on link to open WSDL

### Change the Web Application Context ###
1. Webservices name configuration
	1. `application.properties`

			server.servlet.context-path=/hellows
			cxf.path=/ # don't use /services

2. Open **http://localhost:8080/hellows**

### Test using SOAP UI ###
1. Open SoapUI
2. File > New Soap Project
	1. Initial WSDL: Paste WSDL URL
	2. Project Name: hellows
3. Open and double click the request
4. Hit play button

### Enable Logging Feature ###
1. CXF has logging feature to log in coming SOAP requests and outgoing SOAP responses to log file or console
2. One `HelloWS` class

		@Features(featurs = "org.apache.cxf.feature.LoggingFeature")
		public class HelloWS {
			...

3. Run as Spring boot application
4. Re-run test in SOAP UI

### Using Spring Boot 2.x ###
1. Spring Boot version: 2.x
2. CXF: 3.2.4
3. Search for `spring boot 2 starter maven` in Google
	1. Copy the version and paste in spring starter version
	2. Change to 3.2.4
4. Open `.m2` and remove `repositories` folder
5. Run `mvn clean`
6. Run `mvn install`
7. Run Maven > Update Project

### Change the Context Property ###
1. Open `application.properties`
	1. Use `server.servlet.context-path` instead for `server.context-path`

### Section Summary ###
1. CXF implements JAX-WS and JAX-RS
2. Code first web services
3. SOAP Engine to serialize and desarialize requests
4. Dispatches requests to appropriate methods
5. WS-* standards are implemented
	1. Security
	2. Attachments
	3. ...
6. It has huge user base, docs and samples

## Developing Top Down Web Services ##
### Usecase ###
### WSDL Creation ###
### Generating the Stubs ###
### Implementing the Web Service Endpoint ###
### Publishing the Web Service ###
### WS Provider Application Flow ###
### WSDL First Web Service Assignment ###
### Section Summary ###

## Java SOAP Client ##
### Introduction ###
### Project Setup ###
### Generate the stubs ###
### Creation of Java Client ###
### Flow and the Service Provider Mechanism ###
### Section Summary ###

## Developing Bottom Up Web Services ##
### Payment Gateway Legacy Application Use Case ###
### The Project Setup ###
### Annotating the Beans ###
### Step 2 - Annotating the Endpoint ###
### Step 3 - Publishing the Endpoint ###
### Step 4 - Accessing the WSDL file ###
### Testing Using SoapUI and Application Flow ###
### SOAPUI Assignment ###
### Section Summary ###

## WS Standards ##
### Introduction ###
### WS Standards Overview ###
### User Name Token Profile Authentication ###
### Exchanging Files using MTOM ###
### Section Summary ###

## User Name Token Profile Client ##
### Project Setup ###
### Code the client ###
### CXF Low Level Client API ###
### Configure Properties ###
### Create a Callback Handler ###
### UT in Action ###

## JAX-WS Handlers ##
### Introduction ###
### Two types of JAX-WS handlers ###
### Use Case and Project ###
### 4 Steps ###
### Creation of the Handler Class ###
### Implement the handleMessage method ###
### Extract the Header ###
### Configure the Handler ###
### The Handler Flow ###
### getHeaders Explained ###
### Configuring the JAX-WS Way ###

## SOAP Faults ##
### Introduction ###
### Project Configuration ###
### Creation of a SOAP Fault ###
### Creation and throwing of a custom exception ###

## REST Web Services Concepts ##
### Introcution ###
1. Advantages of RESTFul Web Services and when to use them

### REST Overview ###
1. REST?
	1. Representational State Transfer
	2. WEB Browser -HTTP GET-> WEB SITE -VIDEO-> WEB BROWSER
2. Princiles:
	1. Creation, Read, Update, Delete: Single interface to do them
		1. HTTP provides method POST, GET, PUT, DELETE
		2. URI is provided for each resource
			1. POST /patients

					<patient>
						<name>john</name>
					<patient>

			2. 200 OK

					<id>1</id>

			3. GET /patients/123
			4. 200 OK

					<patient>
						<id>123</id>
						<name>john</name>
					</patient>

			5. PUT /patients

					<patient>
						<id>123</id>
						<name>john smith</name>
					</patient>

			6. 200 OK
			7. DELETE /patients/123
			8. 200 OK

3. Since HTTP supports multiple data formats, REST can consume and provide data in multiple formats (XML, JSON, ...)
	1. XML: .Net App to Java
	2. JSON: Javascript
	3. Text: images ...
4. REST: Stateless
	1. Exchange of respresentational state between provider and consumer
		1. Session is not stored in Server
5. Key principles
	1. Single HTTP interface
	2. Easy to access: URIs
	3. Multiple representations
	4. Scalability - can be deployed on several servers

### WHY RESTFul? - The Advantages ###
1. Softwares offer CRUD operations: REST provides methods that are generic
	1. `http://www.hospital.com/patients`
	2. `/patients/{id}`
	3. `/prescriptions`
	4. `/prescriptions/{id}`
2. Interoperability:
	1. Any app written in any language or running on any platform can communicate with any other app in many data formats
		1. REST client (HTML/JavaScript) -JSON-> REST Provider (Java)
		2. REST client (.NET) -XML-> REST Provider (Java)
		3. REST client (Python) -CSV-> REST Provider (Java)
3. Statelessness
	1. State of user maintained on client
		1. Browser can maintain state (Using JavaScript)
4. Scalability: Because of statelessness provides idempotency
	1. Multiple servers can serve at the same time using load balancer and caching

### When to use RESTFul Web Services? ###
1. When consumer and producer have a mutual understanding (well defined contract)
	1. Unline SOAP - which has WSDL
		1. REST does not have a way to express contract (handled with documentation and examples)
2. Multiple data formats: if many formats are to be supported (SOAP supports only XML)
3. Bandwidth and Memory is limited: (Handheld devices) No SOAP overhead, JSON instead of XML
4. Stateless apps: If app survives server restart
5. Caching is possible: responses can be cached (performance boost)
6. Existing logic can be exposed easily using REST - new interfaces can consume them (Developer productivity) - reusability of business logic

### Section Summary ###
1. Standard interface
2. Single interface
3. easy to access (URI)
4. Multiple data formats at the same time
5. Stateless (session managed by client) - survives server restart
6. No formal contract
7. No overhead (lighweight)

## REST Software Setup ##
### Spring Tool Suite Installation ###
1. Download STS for the platform and install

### Configure JDK in Spring Tool Suite ###
1. Preferences > JRE > Installed JREs > Select JDK folder

### Install Postman ###

## RESTFul Design and Implementation ##
### Introduction ###
1. Patient management system
2. Chrome REST Plugin
3. RESTFul client
	1. Java
	2. JavaScript

### REST Design ###
1. Patient management system
	1. ADD, READ, DELETE, UPDATE patient information
2. Steps:
	1. Identify the resources (exposed as rest resources)
	2. Build URIs to access resources
	3. Assign HTTP methods for CRUD operations
	4. Choose data format
3. System
	1. DTOs:
		1. Patient can have multiple Prescriptions
		2. Each Prescription can have multiple Medicnes
	2. Service:
		1. PatientService:
			1. getPatient
			2. updatePatient
			3. addPatient
			4. deletePatient
			5. getPrescription
4. Steps Implementation:
	1. Nouns in the System become the RESTFul resources
		1. Patients
		2. Prescriptions
		3. Medicines
	2. URIs:
		1. Creation of Patient:
			1. `/patients`
		2. Read a Patient
			1. `/patients/{id}`
		3. Update a Patient
			2. `/patients` (data should have id)
		4. Remove a Patient
			3. `/patients/{id}`
				1. `/patients` - for removing all patients
	3. Methods
		1. GET: Read operations (idempotent)
		2. POST: Creations operations (non-idempotent - multiple changes state of the system)
		3. PUT: Update operations (idempotent)
		4. DELETE: Delete operations
	4. Data formats:
		1. XML: popular
		2. JSON
		3. Actual data:
			1. Read: GET /patient/123

					<Patient>
						<id>123</id>
						<name>Bharath</name>
					</Patient>

			2. Creation: POST /patient

					<Patient>
						<name>Bharath</name>
					</Patient>

					<Patient>
						<id>123</id>
						<name>Bharath</name>
					</Patient>

			3. Update: PUT /patient

					<Patient>
						<id>123</id>
						<name>Bharath</name>
					</Patient>

					HTTP1.1 200 OK

			4. Delete: DELETE /patient/123

					HTTP/1.1 200 OK

	5. Real app: Schema is given to client to understand what data is being transferred

### JAX-RS ###
1. JAX-RS: Java API for XML based REST Services: API
	1. It has Spec and API
		1. Spec: For web service engines and stacks (Set of rules and guidelines)
			1. Apache CXF
			2. Jersey
		2. API: For developers
			1. Annotations: `import javax.ws.rs.*`

					@Path("/users/{username}") // maps relative uris to class or method
			
				1. username: pathparam - bound to java parameters
			2. HTTP Methods:
			
					@GET // method is marked for GET requests

			3. Data formats:

					@Consumes("text/plain")
					
					@Produces({"application/json", "application/xml"})

				1. HTTP MIME types: application/json, applicaction/xml
			4. Parameter values:

					@PathParam

					@QueryParam
	
					@FormParam (during form submission to a Java object)

			5. Exception Mappers:

					@Provider // for custom exception mappers (map Java Exceptions to HTTP error codes)

### CXF and Spring Boot ###
1. Apache CXF: Add cxf spring boot dependency
	1. `cxf-spring-boot-starter-jaxrs` - jars required are transitively added
2. application.properties (automatic discovery of endpoints - no config file)

		cxf.jaxrs.component-scan=true
		server.context-path=/restws

### Creation of the Project ###
1. Steps:
	1. Spring Boot Project:
		1. File > New Spring Starter Project
			1. Name: restws
			2. group: com.bharath.restws
			3. Artifact: restws
			4. Version: 0.0.1-SNAPSHOT
			5. Description: Patient REST Services
			6. Package: com.bharath.restws
		2. Dependencies: cxf - Apache CXS (JAX-RS)

### Creation of the classes and annotate them ###
1. Patient model class:
2. Endpoint
3. Mark with JAXB and JAX-RS annotations
4. Steps:
	1. com.bharath.restws.model.Patient

			@XmlRootElement(name = "Patient")
			public class Patient {
				private long id;
				private String name;

				// getters and setters
			}

	2. com.bharath.restws.PatientService (Interface)

			@Path("/patientservice")
			public interface PatientService {

			}

	3. com.bharath.restws.PatientServiceImpl

			@Service // to discover at runtime
			public Class PatientServiceImpl implements PatientService {

			}

### Implement the init method ###
1. PatientServiceImpl

		@Service
		//@Component - if @Service does not work
		public class PatientServiceImpl implements PatientService {
			Map<Long, Patient> patients = new HashMap<>(); // since singleton is returned each time, this is persistent
			Long currentId = 123;

			public PatientServiceImpl() {
				init();
			}

			void init() {
				Patient patient = new Patient();
				patient.setId(currentId);
				patient.setName("John");
				patients.put(patient.getId(), patient);
			}
		}

### Implement the GET all patients method ###
1. Methods:
	1. GET, POST, PUT: http://localhost:8080/patientweb/services/patientservice/patients
	2. GET One Patient or DELETE one Patient: http://localhost:8080/patientweb/services/patientservice/patients/123
2. Code:

		public interface PatientService {

			@Path("/patients")
			@GET
			List<Patient> getPatients();
		}

	1. Implement the method

			@Override
			public List<Patient> getPatients() {
				Collection<Patient> results = patients.values();
				List<Patient> response = new ArrayList<>(results);
				return response;
			}

### Publish the endpoint ###
1. Configure: application.properties

		# cxf.path=/services - http://localhost:8080/restws/services/patientservice/patients
		cxf.jaxrs.component-scan=true
		server.context-path=/restws

	1. `http://localhost:8080/restws/patientservice/patients`

### Test GET All ###
1. Run as SpringBootApp (launches embedded tomcat)
2. Launch PostMan
	1. Select GET
	2. `localhost:8080/restws/patientservice/patients` (cxf exposes)

### GET simple patient ###
1. New method

		@Path("/patients/{id}")
		@GET
		Patient getPatient(@PathParam(value = "id") Long id);

2. Implement method

		@Override
		public Patient getPatient(Long id) {
			return patients.get(id);
		}

3. Relaunch app
4. Test in Postman:
	1. GET localhost:8080/restws/services/patientservice/patients/123

### Creation of a Patient ###
1. New method

		@Path("/patients")
		@POST
		Response createPatient(Patient patient);

2. Implement method

		@Override
		public Response createPatient(Patient patient) {
			patient.setId(++currentId);
			patients.put(patient.getId(), patient);
			return Response.ok(patient).build();
		}

### Test Creation ###
1. `localhost:8080/restws/services/patientservice/patients`
2. Select raw

		<Patient>
			<name>Bharath</name>
		</Patient>

	1. Change Text to XML (application/xml)
3. One more
4. Test other methods

### Update Patient ###
1. New method

		@Path("/patients")
		@PUT
		Response updatePatient(Patient patient);

2. Implement method

		@Override
		public Response updatePatient(Patient patient) {
			Patient currentPatient = patients.get(patient.getId());
			Response response;
			if (currentPatient != null) {
				patients.put(patient.getId(), patient);
				response = Response.ok().build();
			} else {
				response = Response.notModified().build();
			}
			return response;
		}

### Delete a Patient ###
1. Test Update:
	1. Restart app
	2. PUT `localhost:8080/.../patients`
	3. Body > Raw
	4. Text XML(text/xml)

			<Patient>
				<id>125</id>
				<name>Bob</name>
			</Patient>

		1. 304 - not modified
	5. Add and test again

### Delete a Patient ###
1. New method

		@Path("/patients/{id}")
		@DELETE
		Response deletPatient(@PathParam("id") Long id);

2. Implement method

		@Override
		public Response deletePatient(Long id) {
			Patient patient = patients.get(id);

			Response response;
			if (patient != null) {
				patients.remove(patient.getId());
				response = Response.ok().build();
			} else {
				response = Response.notModified().build();
			}
			return response;
		}

3. Test: Restart app
	1. DELETE localhost:8080/.../patients/123;
	2. Test and run GET
	3. Try to delete again: 304 - not modified

## Configuring JSON Support ##
### 2-Steps to configure JSON Support ###
1. Steps:
	1. Add Jackson Dependencies (serializes and de-serializes)
		1. jackson-jaxrs
		2. jackson-xc (xml compatability dependency)
	2. Change the configuration
	3. @Consumes and @Produces

### Add Jackson dependencies ###
1. jackson-jaxrs maven
	1. latest version
	2. Paste both in dependencies section

### Configure the jackson classes ###
1. application.properties (tells apache-cxf about jackson to be used as the provider)
	1. Remove cxf.jaxrs.component-scan=true
	2. Add

			cxf.jaxrs.classes-scan=true
			cxf.jaxrs.classes-scan-packages=org.codehaus.jackson.jaxrs, com.bharath.restws #base package is enough

### Use @Consumes and @Produces ###
1. PatientService.java

		@Consumes("application/xml,application/json")
		@Produces("application/xml,application/json") // interface, class, method
		...
		public interface PatientService {

### Test JSON Support ###
1. Restart app
2. Goto Postman
	1. Tell explicitly that client needs xml
		1. Headers
			1. `Accept`: `application/json`
		2. Creation: JSON (application/json)

### REST Design and Implementation Summary ###
1. Identify resources (nouns)
2. URIs for resources
3. Assign HTTP Methods
4. Choose data formats
5. JAX-RS - Specification, API
6. Annotations
	1. URI Mapping
	2. HTTP Methods
	3. Data Format
	4. Exception Mapping
	5. Parameters

## REST Error Handling ##
### Introduction ###
1. Success codes: 200 to 399
	1. 200 OK
2. Failure codes: 400 to 599
	1. Types:
		1. Standard Errors: Across REST apps (wrong URI, wrong datatype ...)
		2. Application Errors: Specific to app

### Using JAXRS Exceptions ###
1. Returning standard error codes to client
	1. WebApplicationException(Response.Status.NOT_FOUND) - throw an instance of this class
		1. Response.Status - has standard error codes
		2. Specific exceptions (instead of an instance of above class)
			1. `BadRequestException` - 400
			2. `NotAuthorizedException` - 401
			3. `ForbiddenException` - 403
			4. `InternalServerException` - 500
			5. `ServiceUnavailableException` - 503 - if server is down temporarily
2. Example:

		public Patient getPatient(Long id) {
			if (patients.get(id) == null)
				throw new WebApplicationException(Response.Status.NOT_FOUND);
			...
		}

	1. Or

			throw new NotFoundException();

### Throw custom exception ###
1. We deal with multiple layers
	1. Integration layer (REST WS)
	2. Service Layer (business logic)
	3. Data Access Layer
2. If an exception occurs in Integration layer, Service layer or Data access layer, we must handle that in integration layer and send a useful message to client
	1. Exception Mappers can be used
3. Example:

		public Response updatePatient(Patient patient) {
			...
			} else {
				throw new PatientBusinessException();
			}
		}

		public PatientBusinessException extends RuntimeException {
			...
		}

	1. Does not send user friendly exception

### Creation of ExceptionMapper ###
1. com.bharath.restws.PatientBusinessExceptionMapper

		@Provider // tells cxf that this is runtime component
		public class PatientBusinessExceptionMapper implements ExceptionMapper<PatientBusinessException> {

			@Override
			public Response toResponse(PatientBusinessException e) {
				return Response.status(404).build();
			}
		}

### Using a custom error message ###
1. JSON Response

		toResponse(...)
			StringBuilder sb = new StringBuilder();
			sb.append("{");
			sb.append("\"status\":\"error\"");
			sb.append(",");
			sb.append("\"message\":\"Try again later\"");
			sb.append("}");

			return Response.serverError().entity(sb.toString()).type(MediaType.APPLICATION_JSON).build();

### Section Summary ###
1. Two types:
	1. Standard errors: General
	2. Application errors: specific to business

## JAX-RS Client API - Creation of Java REST Clients ##
### Introduction ###
1. Apache HTTPClient lib
2. JAX-RS Client API (Oracle) - CXF (Vendor)

### JAX RS CLIENT API ###
1. `ClientBuilder` **(M)**: Allows creation of an instance of `Client`
2. `Client` **(M)**: Communication channel between RESTFul client and RESTFul resources
	1. Used for creation of `WebTarget`
3. `WebTarget` **(M)**: Points to unique RESTFul resource
4. `Invoker.Builder` **(M)**: Used for invocation of methods
5. `Entity` **(M)**: Represents data (with datatype)
	1. Serialization is taken care of

### Creation of the Project ###
1. Standalone Spring Boot project
	1. New > Spring Starter Project
		1. Name: restwsclient
		2. Description: Patient REST Client
2. pom.xml
	1. search for cxf rest client
		1. cxf-rt-rs-client latest
		2. Paste after spring-boot-starter

### Retrieve the Patient by ID ###
1. RESTFul Client
	1. DTO - com.bharath.restwsclient.model.Patient.java

			@XMLRootElement(name = "Patient")
			...

	2. com.bharath.restwsclient.PatientWSClient

			Client client = ClientBuilder.newClient();
			WebTarget target = client.target("http://localhost:8080/restws/patientservice/patients/123");
			Builder request = target.request();

			Response response = request.get();
			System.out.println(response.getStatus());

			Patient patient = request.get(Patient.class);
			System.out.println(patient.getId());
			System.out.println(patient.getName());

### Pass parameters dynamically ###
1. Dynamically pass parameters

		priavet static final String PATIENT_SERVICE_URL = "http://.../patientservice";
		public static void main(String[] args) {
			...
			WebTarget target = client.target(PATIENT_SERVICE_URL).path("/patients").path("/{id}");
			target.resolveTemplate("id", 123);
			...
		}

### Update the Patient ###
1. Code

		patient.setName("Bharath");
		WebTarget putTarget = client.target(PATIENT_SERVICE_URL).path("/patients");
		Response updateResponse = putTarget.request().put(Entity.entity(patient, MediaType.APPLICATION_XML))
		System.out.println(updateResponse.getStatus());

### Creation of Patient ###
1. Code

		Patient newPatient = new Patient();
		newPatient.setName("Bob");

		WebTarget postTarget = client.target(PATIENT_SERVICE_URL).path(PATIENTS);
		Patient createdPatient = postTarget.request().post(Entity.entity(patient, MediaType.APPLICATION_XML), Patient.class); // second arg: Response type
		System.out.println("Created Patient ID: " + createdPatient.getId());

### Clean Up Resources ###
1. Client and Response needs to be closed

		updateResponse.close(); // socket resources will not be held up
		client.close();

	1. Don't wait for garbage collection

### Delete Assignment ###
1. Delete a patient

### Section Summary ###
1. ClientBuilder
2. Client
3. WebTarget
4. Entity: wraps request and response objects
5. Invoker.Builder

## JAX-RS Injection ##
### Introduction ###
1. `@PathParam("id") int id` -> `/Patient/123`
2. Others
	1. `@QueryParam`
	2. `@FormParam`
	3. `@HeaderParam`
	4. `@CookieParam`
	5. ...

### REST Injection UseCase and Project Creation ###
1. Airline Reservation System:
	1. PassengerService
		1. getPassengers
		2. addPassengers
2. New Project > Spring Starter Project > PassengerService
	1. Apache CXF JaxRS - dependency

### Creation of the Passenger Model and Service Classes ###
1. com.bharath.restws.model.Passenger.java

		public class Passenger {
			private int id;
			private String name;

			// Getters and setters
		}

2. com.bharath.restws.PassengerService

		public interface PassengerService {
			List<Passenger> getPassengers();
			Passenger addPassenger(Passenger passenger);
		}

3. com.bharath.restws.PassengerServiceImpl

### Implement the REST layer ###
1. Implementation

		@Service // Spring
		public class PassengerServiceImpl implements PassengerService {
			List<Passenger> passengers = new ArrayList<>();
			int currentId = 123;

			@Override
			public List<Passenger> getPassengers() {
				return passengers;
			}

			@Override
			public Passenger addPassenger(Passenger passenger) {
				passenger.setId(currentId++);
				passengers.add(passenger);
				return passenger;
			}
		}

2. Passenger.java

		@XMLRootElement
		public class Passenger {

		}

3. PassengerService

		@Path("/passengerservice")
		@Produces("application/xml")
		@Consumes("application/xml")
		public interface PassengerService {
			@Path("/passengers")
			@GET
			List<Passenger> getPassengers();

			@Path("/passengers")
			@POST
			Passenger addPassenger(Passenger passenger);
		}

### Test the Passenger Service ###
1. Example:

		GET localhost:8080/restinjection/services/passengerservice/passengers

	1. application.properties

			cxf.jaxrs.component-scan=true
	
			server.context.path=/restinjection

2. Example: Add passenger

		POST localhost:8080/restinjection/services/passengerservice/passengers - application/xml

		<passenger>
			<name>Bob</name>
		</passenger>

		GET localhost:8080/restinjection/services/passengerservice/passengers

### Use @QueryParam ###
1. Paging:

		@Override
		public List<Passenger> getPassengers(int start, int size) {
			// ...
		}

2. Interface

		List<Passenger> getPassengers(@QueryParam("start") int start, QueryParam("size") int size);

3. Example:

		localhost:8080/restinjection/services/passengerservice/passengers?start=1&size=25

### Use @FormParam ###
1. Example:

		Override
		public void addPassenger(String firstName, String lastName) {
			// ...
			System.out.println(firstName);
			System.out.println(lastName);
		}

	1. Interface

			@Consumes("application/xml, application/x-www-form-urlencoded")
			...

			void addPassenger(@formParam("firstName") String firstName, @formParam("lastName") String lastName)

2. Testing

		localhost:8080/restinjection/services/passengerservice/passengers?start=1&size=25

		x-www-form-urlencoded

		firstName: Bharath
		lastName: Thippireddy

### Use @HeaderParam ###
1. Example: agent

		void addPassenger(..., @HeaderParam("agent") String agent);

		public void addPassenger(..., String agent) {
			// ...
			System.out.println(agent);
		} 

2. Testing:

		Headers:
		agent: United Airlines

### Use @Context ###
1. We can read all the fields coming at once using `HttpHeaders`

		void addPassenger(..., @Context HttpHeaders headers);

		void addPassenger(..., @Context HttpHeaders headers) {
			// ...
			MultivalueMap<String, String> allHeaders = headers.getRequestHeaders();
			Set<String> headerKeys = allHeaders.keySet();
			for (String key: headerKeys) {
				System.out.println(key);
				System.out.println(headers.getHeaderString(key));
			}
		}

### Read Cookies ###
1. HttpHeaders object has the cookies

		Map<String, Cookie> cookies = headers.getCookies();
		Set<String> cookieKeys = cookies.keySet();
		for (String eachCookieKey: cookieKeys) {
			System.out.println("---------- Cookies ----------");
			System.out.println(eachCookiesKey);
			System.out.println(cookies.get(eachCookiesKey).getValue());
		}

2. PostMan:
	1. Cookies
	2. Add Cookie
	3. New key-value pair

### Section Summary ###
1. `@PathParam` - to retrieve value of URI
2. `@QueryParam`
3. `@HeaderParam`
4. `@CookieParam` - cookie injection
5. `@FormParam`

## Asynchronous REST ##
### Introduction ###
1. Synchronous:
	1. Client sends request
	2. Client waits for response
	3. Server sends 200 response
	4. Client processes the response
2. Asynchronous:
	1. Example: ATM, Bank Teller, Account Holder Mobile, Check Processor
		1. Bank Teller sends checks to Check Processor (for processing) - asynchronous (by spawning multiple threads)
			1. Immediately Check processor sends 202 (acceptance of request)
			2. Check processor sends 200 response to client
	2. Asynchronous RESTful Provider/Server
	3. Asynchronous RESTful Client API
		1. Method:
			1. Polling - checks frequently if request has been processed
			2. Callback - methods will be called when response comes (JAX-RS 2.0) back
3. Implementation of Provider:
	1. `@javax.ws.rs.container.Suspended`
	2. `javax.ws.rs.container.AsyncResponse`
4. Implementation of Client
	1. `javax.ws.rs.client.AsyncInvoker`
	2. `java.util.concurrent.Future` - to process response asynchronously
	3. `javax.ws.rs.client.InvocationCallback` - to implement callback on client side

### Creation of the Async REST project ###
1. New spring starter project: restwsasync
	1. Description: Patient REST Async Services
	2. `Apache CXF JaxRS`
2. application.properties

		cxf.jaxrs.component-scan = true
		server.context-path=/restwsasync

### Creation of the Java classes ###
1. Model class: `Check` (`com.bharath.restws.model`)

		public class Check {
			private String checkNumber;
			private String accountNumber;
			private Double amount;

			// getters and setters
		}

2. Interface: CheckProcessor

		@Path("/checkprocessingservice")
		public interface CheckProcessor {
			@POST
			@Path("/checks")
			public Boolean processChecks(ChecksList checksList);
		}

		package com.bharath.restws.model;

		public class ChecksList { // Wrapper Class
			private List<Check> checks;

			// getter and setter
		}

		pubic class CheckProcessorImpl implements CheckProcessor {
			@Override
			public class CheckProcessorImpl implements CheckProcessor {
				return null;
			}
		}

		@XMLRootElement
		public class ChecksList {
			// ...
		}

### Implement the Async method ###
1. CheckProcessorImpl.java

		@Override
		public void processChecks(AsyncResponse response, ChecksList checksList) {
			// logic
			response.resume(true); // returns asynchronously
		}

		public void processChecks(@Suspended AsyncResponse response, ...); // the method should be asynchronous - CXF finds it out

### Use Threads ###
1. Multiple threads

		@Override
		public void processChecks(AsyncResponse response, ChecksList checksList) {
			// logic
			new Thread() {
				public void run() {
					// processing
					response.resume(true);
				}
			}.start();
		}

### Creation of the client project ###
1. New Spring startup project
	1. pom.xml

			<dependency>
				<groupId>org.apache.cxf</groupId>
				<artifactId>cxf-rt-rs-client</artifactId>
				<version>3.2.1</version>
			</dependency>

### Creation of the client class ###
1. com.bharath.restws.client.CheckProcessingClient

		public static void main(String[] args) {
			Client client = ClientBuilder.newClient();
			WebTarget target = client.target("http://localhost:8080/restwsasync/services/checkprocessingservice/checks");
			AsyncInvoker invoker = target.request().async();

			Future<Boolean> post = invoker.post(Enity.entity(new ChecksList(), MediaType.APPLICATION_XML), Boolean.class); // polls service for response to come back
			try {
				System.out.println(response.get()); // polls and waits
			} catch (InterruptedException e) {
				e.printStackTrace();
			} catch (ExecutionException e) {
				e.printStackTrace();
			}
			
		}

### Run the Test ###
1. CheckProcessorImpl.java

		@Service
		public class CheckProsessorImpl implements CheckProcessor {
			// ...
		}

### Throwing Exceptions ###
1. CheckProcessorImpl.java

		if (checksList == null || checksList.getChecks() == null || checksList.getChecks().size() == 0) {
			response.resume(new BadRequestException()); // asynchronously throws exception
		}

### Handling exceptions in the client ###
1. CheckProcessingClient.java

		} catch (ExecutionException e) {
			if (e.getCause() instanceof BadRequestException) {
				BadRequestException bre = (BadRequestException) e.getCause();
				System.out.println("Please send a valid list of checks");
			}
		}

### Section Summary ###
1. Client sends a request
2. Provider sends 202 header
3. Provider sends 200 response or 4xx response
4. JAX-RS 2.0 provides Provider and Client
	1. Client: Polling or Callback
		1. `AsyncInvoker` - used to do polling
		2. `InvocationCallback` - write our own callback
		3. `Future` - used to handle async response
	2. Provider: `@Suspended` - used to mark object of type `AsyncResponse` (used to send asynchronous response back to client)
	

## Securing REST Web Services ##
### HTTP Basic Authentication ###
1. It is part of HTTP standard (used by client and server to exchange authentication information in headers in a standard manner)
	1. Works across platforms and languages
2. Configuration: Refer to configuring-Basic-Security.rtf
	1. Configuring security constraint
		1. open `web.xml` under `WEB-INF`
		2. Paste `<security-constraint>` and `<login-config>`
			1. Security constraint: Used to specify constraints we want
				1. `/*` - any uri pattern should be secure
					1. `/*.html` - secures only html pages
				2. `<http-method>` - to which method the security is applicable (`GET`, `PUT`, `POST`, `DELETE`)
				3. `<auth-constraint>` - defines the role which use must have to access the endpoint(s)
					1. Role: Defined in Tomcat's `tomcat-users.xml` (`conf` directory)
						1. `<role rolename="tomcat"/>`
						2. `<user username="tomcat" password="tomcat" roles="tomcat"/>`
			2. `<login-config>` - what method of authentication are we using - `BASIC`
	2. Run the app:
		1. As soon as web app launches, browser prompts for basic authentication (browser also implements basic authentication)
		2. If browser is closed and cache cleared, browser prompts again for basic authentication

## REST and Spring Security ##
### Introduction ###
1. RESTful e-commerce website - handles products for customers
	1. `getProducts` - user
	2. `addProduct` - admin

			/products

			@GET
			@POST

2. Spring security
	1. Authentication
	2. Authorization

### Project Setup ###
1. Download the sample project and open in eclipse
	1. `spring-security-config` - dependency in pom
	2. `spring-security-web` - dependency in pom
2. Open **src/main/webapp/WEB-INF/web.xml**
	
		<context-param>
			<param-name>ContextConfigLocation</param-name>
			<param-value>
				WEB-INF/beans.xml
				WEB-INF/security.xml
			</param-value>
		</context-param>
		<listener>
			<listener-class>
				org.springframework.web.context.ContextLoaderListener
			</listener-class>
		</listener>
		
3. Important files: **src/main/webapp/WEB-INF/beans.xml** and **src/main/webapp/WEB-INF/security.xml**

### Implementing REST Resources ###
1. Open `ProductServiceImpl` class

		public List<Product> getProducts() {
			return products;
		}
		
		public int addProduct(Product product) {
			product.setId(++productId);
			products.add(product);
			return productId;
		}
		
2. Open `ProductService` interface

		@GET
		@Path("/products")
		List<Product> getProducts();
		
		@POST
		@Path("/products")
		int addProduct(Product product);

### Publishing the Endpoint ###
1. Open **beans.xml**

		<jaxrs:server id="productws" address="/productService">
			<jaxrs:serviceBeans>
				<ref bean="productService" /> <!-- for CXF -->
			</jaxrs:serviceBeans>
		</jaxrs:server>

		<bean id="productService" class="com.bharaththippireddy.tranings.jaxrs.ProductServiceImpl" />

### Test REST ###
1. Run As > Maven Clean
2. Run As > Maven Install
3. Run As > Run on Server (Tomcat)
4. Install Advanced REST client in Chrome
	1. Drop down
	2. Extensions
	3. Advanced REST client
	4. Options
	5. Request
5. Goto HOWTO.txt in project
	1. Paste URL in Chrome
		1. Send GET request
		2. Send POST request

### Spring Security Introduction ###
1. Spring provides following services
	1. Authentication
	2. Authorization
2. Spring provides security at the following levels
	1. URL level
	2. Method level
	3. Object level
3. Steps:
	1. Add dependencies in `pom.xml`
		1. `spring-security-core`
		2. `spring-security-config`
		3. `spring-security-web`
	2. Add Filter: Spring uses Filter Servlet (`DelegatingFilterProxy`)
		1. In `web.xml`
	3. `SpringConfiguration.xml`

			<global-method-security /> <!-- for enabling security annotations -->
			<http /> <!-- what type of security -->
			<AuthenticationManger /> <!-- For users and roles -->
			
	4. `@Security("ROLE_NAME")`
		1. `ROLE_NAME`: That can access RESTful methods

### Add the filter to Web.xml ###
1. Open Eclipse
2. Open `pom.xml`

		spring-security-core
		spring-security-config
		spring-security-web
		
		spring-security-taglib (for MVC)
		
3. web.xml

		<filter>
			<filter-name>springSecurityFilterChain</filter-name> <!-- This name is used by spring to kick in the default security framework - always used this name -->
			<filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
		</filter>
		<filter-mapping>
			<filter-name>springSecurityFilterChain</filter-name>
			<url-pattern>/*</url-pattern> <!-- Secure entire web app -->
		</filter-mapping>

### Configure Spring Security ###
1. **security.xml**

		<security:global-method-security secured-annotations="enable" /> <!-- Enables spring security annotations on method level -->
		
		<security:http>
			<security:http-basic /> <!-- Enables basic security -->
		</security:http>
		
		<security:authentication-manager>
			<security:authentication-provider>
				<security:user-service> <!-- One of the services, others LDAP, JDBC ... -->
					<security:user name="customer" password="customer" authorities="ROLE_CUSTOMER" />
					<security:user name="admin" password="admin" authorities="ROLE_CUSTOMER,ROLE_ADMIN" />
				</security:user-service>
			</security:authentication-provider>
		</security:authentication-manager>

### Annotate the Resources ###
1. `ProductService`

		@Secured("ROLE_CUSTOMER")
		@GET
		@Path("...")
		...

		@Secured("ROLE_ADMIN")
		@POST
		@Path("...")
		...

### Testing Security ###
1. Right click on project
	1. `mvn clean`
	2. `mvn install`
2. Right click and Run on Server
3. Open `http://localhost:8080/springsecurity/services` in browser
	1. **wadl** url exists
4. Open Advanced REST Client in chrome
	1. Open HOWTO.txt and paste URL
	2. Login using customer/customer credentials
5. Select POST and paste

		<Product>
			<description>Hibernate</description>
		</Product>
		
	1. Change to `application/xml`
	2. `403` forbidden exception
		1. Console throws `Access is denied` exception

6. Another way to authenticate
	1. Open **Form** in Chrome

			Authorization (click on construct link)
			
		1. Enter credentials (basic authentication header is generated)

### Creating an Exception Mapper ###
1. Right click on package: New > Class
	1. Name: `SecurityExceptionMapper`
	2. Implements: `ExceptionMapper`

			import org.springframework.security.access.AccessDeniedException;

			public class ... ExceptionMapper<AccessDeniedException> {
				@Override
				public Response toResponse(AccessDeiniedException arg0) {
					return Response.status(Response.Status.FORBIDDEN).build();
				}
			}
			
2. **beans.xml**

		<jaxrs:server ...>
			<jaxrs:providers>
				<bean class="com.bharaththippireddy.trainings.jaxrs.SecurityExceptionMapper" />
			</jaxrs:providers>
		</jaxrs:server>
		
3. Test adding product using customer credentials
	1. Customer error message can be sent in body

### Summary and Flow ###
1. Publish Endpoints
2. Configure Spring Security
	1. Configure dependencies
	2. Configure delegating proxy filter (loaded when we start server because they are context parameters - loaded even before the servlets)
	3. Enable security annotations
	4. Configure Basic authentication and authorization
	5. Define roles, usernames and passwords
	6. Map methods to the roles
3. Test in Chrome REST plugin

### Section Summary ###
1. Configured method level security

## OAuth Concepts ##
### What is OAuth ###
1. Authentication and Authorization
	1. Application verifies identity
	2. Application allows access only to authorized services (permissions)
2. OAuth: Authentication and authorization standard
	1. Allows User to access service without knowing user id and password
3. Scenario:
	1. User is using app A
	2. A wants data from B (User does not want to share credentials of B with A)
	3. A redirects User to B
	4. User logs into B
	5. B shares a security token with A
	6. A gets data from B using the token
4. Example:
	1. **Federated authentication**: One app uses another app for login
	2. **Delegated authorization**: Authorization process is delegated to another app
		1. Tax Site redirects to Google Login for Google Drive
		2. User logs into Google
		3. Tas Site gets token from Google
		4. Using the token, Tax site saves the tax documents in Google drive
5. OAuth allows an app to perform actions on user's behalf (with the permission of the user) with the authorization given by the user
6. [oauth.net/2/](oauth.net/2/)

### Why, When and When Not to Use OAuth ###
1. Why?
	1. Example: Job portals redirects to LinkedIn
	2. Reasons:
		1. Trust
		2. Stealing (if username and password given to Job portals - abuse)
		3. Unlimited access (if username and password given to Job portals - get authorized to all the services and resources)
		4. Revocation (not possible if username and password are given)
2. When?
	1. If user wants app1 to use services of app2 but does not want to give credentials to app2
3. When not?
	1. Not for simple apps
		1. Use HTTP basic over SSL
		2. Form based authentication over SSL

### OAuth Workflow - How ###
1. Example:
	1. End User is accessing JavaWorld.com
	2. If End User wants to comment on an article
	3. JavaWorld.com asks us to login to Google
	4. JavaWorld.com uses oauth to communicate with google and gets authentication information
2. Steps:
	1. JavaWorld.com registers with Google and gets a client ID
	2. JavaWorld.com redirects to [http://googleapis.com/oauth?client_id=javaworld&state=1234567890&redirect_uri=http%3A%2F%2Fjavaworld.com](http://googleapis.com/oauth?client_id=javaworld&state=1234567890&redirect_uri=http%3A%2F%2Fjavaworld.com)
		1. state: current session state of user (when user gets back to JavaWorld.com after authentication, he is put into this state)
		2. redirect_uri: link to which google should redirect to once authentication is successful
	3. User logs in
	4. Google authenticates and redirects to [http://javaworld.com/state=1234567890&code=0002222](http://javaworld.com/state=1234567890&code=0002222)
		1. code: unique generated by google
	5. JavaWorld takes code and sends to Google
	6. Google gives back a unique token to JavaWorld (2b325245341bc23423423523423412abc)
	7. JavaWorld uses the token to communicate with Google to get any kind of information (authorized only) from Google (using Google API)

	![google_oauth_webflow](google_oauth_webflow.png)
3. Roles in OAuth:
	1. Resource server: server that hosts user resources and protected by OAuth
	2. Resource Owner: End user say
	3. Client: App that wants to access resources of an End User on the Resource Server
	4. Authorization Server: Server that generates unique code and token
4. Google, Facebook, Twitter: Do not use OAuth as it is
	1. OAuth has guidelines but not protocol (does not define how user must authenticate or what parameters need to be sent)
5. OAuth with Java:
	1. Libraries available to convert apps to Client or Resource Server
	2. Goto about OAuth in oauth.net/2/: Look for Java implementation
	3. Search for Apache CXF oauth: JAX-RS Auth - how to implement oauth for the app

### OAuth Google Play Ground ###
1. Google oauth playground:
	1. Search for it
	2. Sample app that allows us to access RESTFul services and support OAuth
	3. Use Contacts REST service
	4. Check and Authorize
	5. Gives authorization code
	6. Click on Exchange authrorization code for token
	7. Call operations: List contacts

### Section Summary ###
1. Same example

## REST Attachments ##
### Introduction ###
1. Use case: Uploading resume to Job portal, client app consumes a file from REST app
	1. Use POST method to send file
	2. Use GET for download
2. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<meta charset="UTF-8">
				<title>File Upload</title>
			</head>
			<body>
				<form action="services/fileService/upload" method="post" enctype="multipart/form-data"> <!-- split into multiple parts -->
					<p> File location: <input type="file" name="photo"></p>
					<input type="submit"/>
				</form>
			</body>
		</html>

4. Apache CXF, Jersey can represent file content as Java Object called Attachment (Apache CXF object type)
5. To download: use `java.util.File`

### Method and URI Design ###
1. POST: /fileService/upload
2. GET: /fileService/download

### Creation of the Project ###
1. Project:
	1. STS: restattachments
		1. Select Apache CXF JAX-RS dependency
	2. application.properties
		
			cxf.jars.component-scan=true
			server.context-path=/restattachments
	
	3. src/main/resource/static/fileupload.html (served by spring at runtime)

### Code the Upload endpoint ###
1. src/main/java/com.bharath.restws/FileService.java

		import org.apache.cxf.jaxrs.ext.multipart.Attachment;

		@Path("/fileService")
		public class FileService {
			private static final String FILE_PATH = "/Users/bharaththippireddy/Documents/Images/uploaded/uploaded.jpg";
	
			@Path("/upload")
			@POST
			public void upload(List<Attachment> attachments) throws FileNotFoundException, IOException {
				for (Attachment attachment: attachments) {
					copyFile(attachment.getDataHandler().getInputStream());
				}
			}
			...
		}

### Test upload using HTML ###
1. Service

		...
		@Service
		public class FileService {
			...
		}

### Creation of the Client Project ###


### Code the Java client ###
### Test upload using java client ###
### Code the Download REST endpoint ###
### Test the download ###

## Jersey Quick Start ##
### Introduction ###
1. Jersey is open source stack from Oracle
	1. Official reference implementation of JAX-RS API
	2. Similar to CXF
	3. Uses SERVLET implementation
	4. Implementation of JAX-RS Client API
	5. Custom tools
		1. Security
			1. OAuth
			2. ...
		2. Wadl generation
		3. Bean validation
		4. ...
2. [jersey.java.net](jersey.java.net)

### Project Configuration ###
1. Import project
2. **pom.xml**

		<dependencyManagement>
			<dependencies>
				<dependency> <!-- Manages versions -->
					<groupId>org.glassfish.jersey</groupId>
					<artifactId>jersey-pom</artifactId>
					<version>${jersey-version}</version>
					<type>pom</type>
					<scope>import</scope>
				</dependency>
			</dependencies>
		</dependencyManagement>
		
		<dependencies>
			<dependency>
				<groupId>org.glassfish.jersey.containers</groupId>
				<artifactId>jersey-container-servlet-core</artifactId>
			</dependency>
		</dependencies>
		
3. **web.xml**

		<servlet>
			<servlet-name>Jersey Web Application</servlet-name>
			<servlet-class>org.glassfish.jersey.servlet.ServletContainer</servlet-class>
			<init-param>
				<param-name>jersey.config.server.provider.packages</param-name>
				<param-value>todo</param-value> <!-- scanned by jersey for endpoints -->
			</init-param>
			<load-on-startup>1</load-on-startup>
		</servlet>
		<servlet-mapping>
			<servlet-name>Jersey Web Application</servlet-name>
			<url-pattern>/restapi/*</url-pattern>
		</servlet-mapping>

### Creation of REST Resource ###
1. New class: `com.bharath.trainings.jersey.MyResource`

		@Path("/myresource")
		public class MyResource {
		
			@GET
			public String hello() {
				return "Hello Jersey";
			}
			
		}
		
2. Tell Jersey about the package name to scan
	1. **web.xml**

			<init-param>
				<param-name>jersey.config.server.provider.packages</param-name> <!-- tells jersey the end points -->
				<param-value>com.bharath.trainings.jersey</param-value>
			</init-param>
			
3. `mvn clean install`
4. Run as > Run on Server

### Creation of REST Client ###
1. Consuming REST Service
2. New package: `com.bharath.trainings.jersey.client`
3. New class: `com.bharath.trainings.jersey.client.MyClient`

		public static void main(String[] args) {
			Client newClient = ClientBuilder.newClient();
			String result = client.target("http://localhost:8080/jerseyws/restapi/myresource").request().get(String.class);
			System.out.println(result);
		}

## REST Using Spring MVC Quick Start ##
### Introduction ###
1. Features:
	1. Spring JDBC
	2. Spring Messaging
	3. Spring ORM
	4. Spring MVC
	5. Spring REST
		1. Does not use JAX-RS but its own standards
			1. `@RequestMapping` instead of `@Path`
			2. `@PathVariable` instead of `@PathParam`
2. App with JSON Response using Spring 4.0

### Spring MVC Flow ###
1. Client sends HTTP Request
2. Front Controller (Dispatcher Servlet) receives the request
3. Front Controller reads Handler Mappings or scans through all controller classes
4. Controllers return JSON response to Client
	1. If Web app, controller returns view name to Dispatcher servlet and Dispatcher servlet invokes view resolver to return view
	2. In RESTful app, the above step is skipped

### Project Configuration ###
1. Download springrest app and import into Eclipse
2. **pom.xml**

		spring-webmvc
		jackson-core
		jackson-annotations
		jackson-databind
		
3. **web.xml**

		<servlet>
			<servlet-name>rest</servlet-name>
			<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
		</servlet>
		
		<servlet-mapping>
			<servlet-name>rest</servlet-name>
			<url-pattern>/*</url-pattern>
		</servlet-mapping>
		
4. **rest-servlet.xml** (`<servlet-name>-servlet.xml`) - automatically searches by default
	1. Alternative: provide context path

### Hello Spring REST ###
1. New class: `com.bharathtippireddy.trainings.controller.MyController`

		@RestController // 4.x version, @Controller in 3.x
		@RequestMapping("/greeting")
		public class MyController {
		
			@RequestMapping(value = "/{name}", method = RequestMethod.GET)
			public String sayHello(@PathVariable String name) { // @ResponseBody is required for 3.x
				return "Hello" + name;
			}
		}
		
2. `rest-servlet.xml`

		<context:component-scan base-package="com.bharaththippireddy.trainings.controller" />
		<mvc:annotation-driven /> <!-- spring looks for annotations -->
		
3. `mvn clean install`
4. Run As >  

### Returning JSON Response ###

## Interview Help and Wrap Up ##
### SOAP VS REST ###
### Interview Questions (Updated Frequently) ###
### Slides used in the course ###
### My Other Courses and Discounts ###

## Extras ##
### JSON Introduction ###
### JSON Hands On ###
### JSON Parsing ###

## WSDL Creation ##
### Usecase ###
### Creation of the WSDL ###
### Define Schema Types ###
### Get Orders Request and Response ###
### Creation of Order Request and Response ###
### The Four Elements ###
### Define Messages ###
### Define Operations ###
### Define Binding ###
### Define Service ###
### Resolve Errors ###

## Database CRUD using REST ##
### Usecase ###
### Project and pom.xml ###
### Creation of data access layer ###
### Implement Creation Update and Delete Methods ###
### Implement the find method ###
### Wire the DAO Beans ###
### Creation of the REST Interface ###
### Annotate the beans ###
### Implement the REST Service ###
### Implement the READ Method ###
### Wire the beans ###
### web.xml ###
### Deploy the application ###
### Test Read and Create ###
### Test Update and Delete ###