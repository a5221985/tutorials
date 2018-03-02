# Java Web Services #
## Software Setup and Troubleshooting ##
### Installing Java, Eclipse and Tomcat ###
### Configuring Tomcat in Eclipse ###
### Testing Tools Setup ###
### Downloading Projects from Lecture Contents ###
### Importing and Running Projects ###
### Troubleshooting ###

## Web Services - The Big Picture ##
### Course Introduction ###
### Web Services Introduction ###
### SOA and Web Services ###
### Section Summary ###

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
### Apache CXF Overview ###
### Creation of CXF Web Service Project from Scratch ###
### CXF Maven Web Application Project Structure and Components ###
### Section Summary ###

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
			Passenger addPassenger();
		}

3. com.bharath.restws.PassengerServiceImpl

### Implement the REST layer ###


### Test the Passenger Service ###
### Use @QueryParam ###
### Use @FormParam ###
### Use @HeaderParam ###
### Use @Context ###
### Read Cookies ###
### Section Summary ###

## Asynchronous REST ##
### Introduction ###
### Creation of the Async REST project ###
### Creation of the Java classes ###
### Implement the Async method ###
### Use Threads ###
### Creation of the client project ###
### Creation of the client class ###
### Run the Test ###
### Throwing Exceptions ###
### Handling exceptions in the client ###
### Section Summary ###

## Securing REST Web Services ##
### HTTP Basic Authentiction ###

## REST and Spring Security ##
### Introduction ###
### Project Setup ###
### Implementing REST Resources ###
### Publishing the Endpoint ###
### Test REST ###
### Spring Security Introduction ###
### Add the filter to Web.xml ###
### Configure Spring Security ###
### Annotate the Resources ###
### Testing Security ###
### Creating an Exception Mapper ###
### Summary and Flow ###
### Section Summary ###

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
### Project Configuration ###
### Creation of a REST Resource ###
### Creation of a REST Client ###

## REST Using Spring MVC Quick Start ##
### Introduction ###
### Spring MVC Flow ###
### Project Configuration ###
### Hello Spring REST ###
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