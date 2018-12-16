## Web Services ##
### Introduction to Web Services ###
1. Java EE 7 web services technologies
	1. Java API for XML Web Services (JAX-WS)
	2. Java API for RESTful Web Services (JAX-RS)

#### What Are Web Services? ####
1. Web services: Client and server apps that communicate over World Wide Web's (WWW) HyperText Transfer Protocol (HTTP).
2. W3C description:
	1. Web services is the standard means of interoperating between software apps running on different platforms and frameworks
3. Web services are
	1. Interoperable
	2. Enstensible
	3. Good machine-processible descriptions (using XML)
4. Web services can combine in a loosely coupled way to achieve complex operations
	1. Programs which provide simple services can interact with each other to deliver sophisticated added-value services.

#### Types of Web Services ####
1. Service: It is a software component provided through network-accessible endpoint
	1. Service consumer and Service provider use messages to exchange invocation requests and response info in the form of self-contained documents
		1. Very few assumptions are made about technological capabilities of receiver.
2. Implementation of web services:
	1. Two types:
		1. Big web services
		2. RESTful web services

##### Big Web Services #####
1. Uses XML messages that follow Simple Object Access Protocol (SOAP) standard.
	1. SOAP: It is an XML language defining message architecture and message formats
	2. WSDL: Web Services Description Language
		1. It is a language used to write machine-readable description of the operations offered by the service (Can be used to define interfaces syntactically)
2. SOAP-based desing must include the following:
	1. Format contract be established to describe the interface that web service offers.
		1. WSDL can be used to describe details of the contract (messages, operations, bindings, location of web service)
			1. SOAP messages can be processed in JAX-WS service without publishing WSDL
		2. Architecture must address complex nonfunctional requirements.
			1. Web services specs usually address such requirements and establish common vocabulary for them
			2. Examples: transactions, security, addressing, trust, coordination, ...
		3. Architecture must handle asynchronous processing and invocation.
			1. Infrastructure such as Web Services Reliable Messaging (WSRM), API (JAX-WS) along with client-side asynchronous invocation support.
				1. WSRM: Describes protocol that allows messages to be transferred reliably between nodes implementing the protocol in the presence of software component, system, network failures.
					1. Protocol is transport independent which can be implemented using different network technologies
					2. Defines SOAP binding for interoperability

##### RESTful Web Services #####
1. JAX-RS provides functionality for Representational State Transfer (RESTful) web services.
	1. REST: good for ad hoc integration scenarios
		1. Better integration with HTTP than SOAP
		2. Does not require XML messages or WSDL service-API definitions
2. Project **Jersey**: Production-ready implementation for JAX-RS spec
	1. Supports annotations defiend in JAX-RS spec
3. Developing RESTful web services is inexpensive (minimal tooling used to build them) and has low barrier for adoption.
4. Conditions that must be met for RESTful design:
	1. Web services are completely stateless. (Can interaction survice server restart?)
	2. Caching infrastructure can be leveraged for performance.
		1. If data is not dynamically generated and can be cached.
		2. Limitation: Caches are limited to HTTP GET method for most servers
	3. Service producer and service consumer must have mutual understanding of context and content passed.
		1. There is no formal way to describe web services interface (No WSDL)
		2. Most commercial apps who expose services as RESTful implementations also distribute value-added toolkits that describe interfaces to developers in programming languages.
	4. Bandwidth needs to be limited.
		1. REST is good for limited profile devices like PDAs and mobile phones (overhead of headers and additional layers of SOAP on XML payload is restricted)
	5. Web service delivery or aggregation into existing websites can be enabled easily using RESTful style.
		1. JAX-RS, asynchronous JavaScript and XML (Ajax), Direct Web Remoting (DWR) ... can be used to consume services.
		2. Services can be exposed with XML and consumed by HTML pages 

#### Deciding Which Type of Web Service to Use ####
1. Use RESTful web services and big web services in enterprise apps which have QoS (Quality of Service) requirements.
2. **JAX-WS**:
	1. Addresses advanced QoS requirements (for enterprise computing)
	2. Makes it easier to supports WS-* protocols (as compared to JAX-RS) (provides standards for security, reliability, ... and interoperability with other WS-* conforming clients and servers)
3. **JAX-RS**:
	1. Makes easier to write web apps
	2. Induces
		1. Loose coupling (existing server can be evolved without breaking existing clients)
		2. Scalability (start small and grow)
		3. Architectural simplicity (usage of off-the-shelf components (proxies, HTTP routers))
	3. Easier for many types of clients to consume RESTful web services
	4. Clients can consume some or all aspects of service and mash it up with other web-based services.

### Building Web Services with JAX-WS ###
1. JAX-WS: Java API for XML Web Services
	1. Technology used to build web services and clients that communicate using XML
	2. Developers can write message-oriented and RPC oriented web services
2. Operation invocation is using XML-based protocol such as SOAP
	1. SOAP: defines envelope structure, encoding rules, conventions for representing service invocation and responses. (Transmitted as SOAP messages over HTTP)
3. JAX-WS hides complexity of SOAP messages from developer
4. Server side: web service operations are specified by methods in interface
	1. Classes implement the methods
5. Client side: client constructs a proxy (local object that represents the service) and invokes methods on the proxy.
6. JAX-WS runtime converts API calls and responses to SOAP messages
7. Advantage:
	1. Platform independence of Java
	2. A JAX-WS client can access a web service not running on Java platform and vice versa (Because of use of technologies defined by W3C: HTTP, SOAP, WSDL)
		1. WSDL: specifies XML format that describes a service as a set of endpoints operating on messages

#### Creation of Simple Web Service and Clients with JAX-WS ####
1. Example: Building and deploying simple web service and application client and web client.
2. Communication between JAX-WS Web service and a Client

	![jeett_dt_019](jeett_dt_019.png)

3. Start with a Java class annotated with `javax.jws.WebService` annotation (`@WebService`: defines class as web-service end point)
4. Service endpoint interface/service endpoint implementation: It is a Java interface/class that declares methods that client can invoke on service.
	1. Interface is not needed when building JAX-WS endpoint (web service implementation class defines SEI)
	2. Interface may be explicitly specified by adding `endpointInterface` element to `@WebService`
		1. Provide an interface that defines public methods available in the endpoint class
5. Steps for constructing a web service and client:
	1. Code implementation class
	2. Compile implementation class
	3. Package files into WAR file
	4. Deploy WAR file. (Web service artifacts used to communicate with clients are generated by GlassFish Server during deployment)
	5. Code client class
	6. Use `wsimport` Maven goal to generate and compile web service artifacts needed to connect to service
	7. Compile client class
	8. Run client

##### Requirements of a JAX-WS Endpoint #####
1. JAX-WS endpoints must follow the following requirements:
	1. Implementation class must be annotated with either
		1. `javax.jws.WebService`
		2. `javax.jws.WebServiceProvider`
	2. Implementing class can reference SEI through `endpointInterface` element of `@WebService`. If not, SEI is implicitly defined
	3. Business methods must be public (not static or final)
	4. Business methods exposed to web service clients must be annotated with `javax.jws.WebMethod`
	5. Business methods exposed must have JAXB-compatible parameters and return types.
		1. See [Types Supported by JAX-WS](https://docs.oracle.com/javaee/7/tutorial/jaxws002.htm#BNAZC)
	6. Implementing class must not be final or abstract
	7. Implementing class must have a default public constructor
	8. Implementing class must not define the `finalize` method
	9. Implementing class may use `javax.annotation.PostConstruct` or `javax.annotation.PreDestroy` annotations on its methods for lifecycle event callbacks
	10. `@PostConstruct` method is called by container before implementing class begins responding to web service clients
	11. `@PreDestroy` method is called by container before endpoint is removed from operation

##### Coding the Service Endpoint Implementation Class #####
1. `Hello` implementation class is annotated with `@WebService` annotation.
2. It has a single method `sayHello` annotated with `@WebMethod` (this exposes the method to web service clients)
3. `sayHello` returns a greeting to client using name passed to it
4. `Hello` also defines a default public constructor

		package javaeetutorial.helloservice;

		import javax.jws.WebService;
		import javax.jws.WebMethod;

		@WebService
		public class Hello {
			private final String message = "Hello, ";

			public Hello() {
			}

			@WebMethod
			public String sayHello(String name) {
				return message + name + ".";
			}
		}

##### Building, Packaging, and Deploying the Service #####
1. Use either NetBeans IDE or Maven

###### To Build, Package, and Deploy the Service Using NetBeans IDE ######
1. Start GlassFish Server if not started ([Starting and Stopping GlassFish Server](https://docs.oracle.com/javaee/7/tutorial/usingexamples002.htm#BNADI))
2. **File** > **Open Project**
3. In the dialog, navigate to

		tut-install/examples/jaxws

4. Select `helloservice-war` folder
5. Click **Open Project**
6. In **Projects** tab, right-click the `helloservice-war` project and select **Run**
	1. WAR file gets generated `helloservice-war.war` (in `tut-install/examples/jaxws/helloservice-war/target/`) and deploys the WAR to GlashFish Server. Also open web service test interface at a URL [To Test the Service without a Client](https://docs.oracle.com/javaee/7/tutorial/jaxws001.htm#BNAYW).
7. **Next Steps**
	1. View WSDL file of deployed service at `http://localhost:8080/helloservice-war/HelloService?wsdl`

###### To Build, Package, and Deploy the Service Using Maven ######
1. Start GlassFish server if not started [Starting and Stopping GlassFish Server](https://docs.oracle.com/javaee/7/tutorial/usingexamples002.htm#BNADI)
2. Go to the following in a terminal:

		tut-install/examples/jaxws/hellowservice-war/

3. Enter the following:

		mvn install

	1. Builds and packages application into WAR file `helloservice-war.war` located in `target` directory and deploys the WAR to GlassFish Server.
4. **Next Steps**
	1. View WSDL file of deployed service at `http://localhost:8080/helloservice-war/HelloService?wsdl`

##### Testing the Methods of a Web Service Endpoint #####
1. GlassFish allows testing of web service endpoint

###### To Test the Service without a Client ######
1. To test `sayHello` method
	1. Open web service test interface
	
			http://localhost:8080/helloservice-war/HelloService?Tester

	2. Under **Methods**, enter a name as parameter to `sayHello`
	3. Click **sayHello**
		1. Takes to `sayHello` invocation page
		2. Under **Method returned**, see response from the endpoint

##### A Simple JAX-WS Application Client #####
1. `HelloAppClient` is standalone client that accesses `sayHello` method in `HelloService`.
2. Call is made through a port (local object that acts as proxy for remote service)
	1. Port gets constructed at development time by `wsimport` Maven goal which generates JAX-WS portable artifacts based on WSDL.

###### Coding the Application Client ######
1. When invoking remote methods on port, client performs the following:
	1. Uses generated `helloservice.endpoint.HelloService` class (which represents service at URI of deployed service's WSDL file)

			import javaeetutorial.helloservice.endpoint.HelloService;
			import javax.xml.ws.WebServiceRef;

			public class HelloAppClient {
				@WebServiceRef(wsdlLocation = "http://localhost:8080/helloservice-war/HelloService?WSDL") 
				private static HelloService service;

	2. Retrieves a proxy to the service (port) by invoking `getHelloPort` on service

			javaeetutorial.helloservice.endpoint.Hello port = service.getHelloPort();
		
		1. Port implements SEI defined by service
	3. It invokes port's `sayHello` method passing a string to service:

			return port.sayHello(arg0);

2. Full source: (located at `tut-install/examples/jaxws/hello-appclient/src/main/java/javaeetutorial/hello/appclient/` directory)

		package javaeetutorial.hello.appclient;

		import javaeetutorial.helloservice.endpoint.HelloService;
		import javax.xml.ws.WebServiceRef;

		public class HelloAppClient {
			@WebServiceRef(wsdlLocation = "http://localhost:8080/helloservice-war/HelloService?WSDL")
			private static HelloService service;

			/**
			* @param args the command line arguments
			*/
			public static void main(String[] args) {
				System.out.println(sayHello("world"));
			}

			public static String sayHello(java.lang.String arg0) {
				javaeetutorial.helloservice.endpoint.Hello port = service.getHelloPort();
				return port.sayHello(arg0);
			}
		}

###### Running the Application Client ######
1. Prerequisite: `helloservice-war` must be deployed first
2. To run Client Using NetBeans IDE
	1. **File** > **Open Project**
	2. Navigate to `tut-install/examples/jaxws`
	3. Select `hello-appclient` folder
	4. Click **Open Project**
	5. In **Projects** tab, right click `hello-appclient` project and select **Build**
		1. runs `wsimport` goal, builds, packages, and runs client.
	6. Output: **hello-appclient** output tab
3. To run app client using maven:
	1. In terminal window, go to:
		
			tut-install/examples/jaxws/hello-appclient/

	2. Enter the following:

			mvn install

		1. Runs `wsimport` goal, builds, packages, runs client.

##### A Simple JAX-WS Web Client #####
1. Calls `sayHello` of web service (makes the call through port)

###### Coding the Servlet ######
1. Client performs the following steps:
	1. Import `HelloService` endpoint and `WebServiceRef` annotation:

			import javaeetutorial.helloservice.endpoint.HelloService;
			...
			import javax.xml.ws.WebServiceRef;

	2. Defines reference to web service by specifying WSDL location:

			@WebServiceRef(wsdlLocation = "http://localhost:8080/helloservice-war/HelloService?WSDL")

	3. Declares web service, then defines private method that calls `sayHello` on port

			private HelloService service;
			...
			private String sayHello(java.lang.String arg0) {
				javaeetutorial.helloservice.endpoint.Hello port = service.getHelloPort();
				return port.sayHello(arg0);
			}

	4. In the servlet, it calls the private method

			out.println("<p>" + sayHello("world") + "</p>");

2. Significant parts of the code is as follows (located at `tut-install/examples/jaxws/hello-webclient/src/java/javaeetutorial/hello/webclient/`)
	
		package javaeetutorial.hello.webclient;

		import javaeetutorial.helloservice.endpoint.HelloService;
		import java.io.IOException;
		import java.io.PrintWriter;
		import javax.servlet.ServletException;
		import javax.servlet.annotation.WebServlet;
		import javax.servlet.http.HttpServlet;
		import javax.servlet.http.HttpServletRequest;
		import javax.servlet.http.HttpServletResponse;
		import javax.xml.ws.WebServiceRef;

		@WebServlet(name="HelloServlet", urlPattern={"/HelloServlet"})
		public class HelloServlet extends HttpServlet {
			@WebServiceRef(wsdlLocation = "http://localhost:8080/helloservice-war/HelloService?WSDL")
			private HelloService service;

			/**
			* Processes requests for both HTTP <code>GET</code>
			* and <code>POST</code> methods.
			* @param request servlet request
			* @param response servlet response
			* @throws ServletException if a servlet-specific error occurs
			* @throws IOException if an I/O error occurs
			*/
			protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				response.setContentType("text/html;charset=UTF-8");
				try (PrintWriter out = response.getWriter()) {
					out.println("<html lang=\"en\">");
					out.println("<head>");
					out.println("</head>");
					out.println("<body>");
					out.println("<h1>Servlet HelloServlet at " +
						request.getContextPath() + "</h1>");
					out.println("<p>" + sayHello("world") + "</p>");
					out.println("</body>");
					out.println("</html>");
				}
			}

			// doGet and doPost methods, which call processRequest, and
			// getServletInfo method
	
			private String sayHello(java.lang.String arg0) {
				javaeetutorial.helloservice.endpoint.Hello port = service.getHelloPort();
				return port.sayHello(arg0);
			}
		}

###### Running the Web Client ######
1. Prerequisite: Deploy `helloservice-war`
2. Run Web Client Using NetBeans IDE:
	1. **File** > **Open Project**
	2. Navigate to:

			tut-install/examples/jaxws

	3. Select `hello-webclient` folder
	4. Click **Open Project**
	5. In **Projects** tab, right click `hello-webclient` project and select **Build**
		1. Runs `wsimport` goal, builds, packages app into WAR file `hello-webclient.war` (in `target` directory) and deploys to GlassFish Server
	6. In web browser, enter
	
			http://localhost:8080/hello-webclient/HelloServlet

3. To run using Maven:
	1. Go to

			tut-install/examples/jaxws/hello-webclient/

	2. Enter the following:

			mvn install

		1. runs `wsimport` goal, builds, packages app into WAR file `hello-webclient.war` (in `target` directory) and deploys to GlassFish Server
	3. In web browser, enter

			http://localhost:8080/hello-webclient/HelloServlet

#### Types Supported by JAX-WS ####
1. Not every class can be used as a method parameter or return type in JAX-WS
2. JAX-WS delegates mapping of types to XML definitions to JAX-B

##### Schema-to-Java Mapping #####
1. Mapping of XML data types to Java data types in JAXB
	1. `xsd:string` - `java.lang.String`
	2. `xsd:integer` - `java.math.BigInteger`
	3. `xsd:int` - `int`
	4. `xsd:long` - `long`
	5. `xsd:short` - `short`
	6. `xsd:decimal` - `java.math.BigDecimal`
	7. `xsd:float` - `float`
	8. `xsd:double` - `double`
	9. `xsd:boolean` - `boolean`
	10. `xsd:byte` - `byte`
	11. `xsd:QName` - `javax.xml.namespace.QName`
	12. `xsd:dateTime` - `javax.xml.datatype.XMLGregorianCalendar`
	13. `xsd:base64Binary` - `byte[]`
	14. `xsd:hexBinary` - `byte[]`
	15. `xsd:unsignedInt` - `long`
	16. `xsd:unsignedShort` - `int`
	17. `xsd:unsignedByte` - `short`
	18. `xsd:time` - `javax.xml.datatype.XMLGregorianCalendar`
	19. `xsd:date` - `javax.xml.datatype.XMLGregorianCalendar`
	20. `xsd:g` - `javax.xml.datatype.XMLGregorianCalendar`
	21. `xsd:anySimpleType` - `java.lang.Object`
	22. `xsd:duration` - `javax.xml.datatype.Duration`
	23. `xsd:NOTATION` - `javax.xml.namespace.QName`

##### Java-to-Schema Mapping #####
1. Default mapping of classes to XML data types (in JAXB)
	1. `java.lang.String` - `xs:string`
	2. `java.math.BigInteger` - `xs:integer`
	3. `java.util.Calendar` - `xs:dateTime`
	4. `java.util.Date` - `xs:dateTime`
	5. `java.xml.namespace.QName` - `xs:QName`
	6. `java.net.URI` - `xs:string`
	7. `java.xml.datatype.XMLGregorianCalendar` - `xs:anySimpleType`
	8. `java.xml.datetype.Duration` - `xs:duration`
	9. `java.lang.Object` - `xs:anyType`
	10. `java.awt.Image` - `xs:base64Binary`
	11. `javax.activation.DataHandler` - `xs:base64Binary`
	12. `javax.xml.transform.Source` - `xs:base64Binary`
	13. `java.util.UUID` - `xs:string`

#### Web Services Interoperability and JAX-WS ####
1. JAX-WS supports Web Services Interoperability (WS-1) Basic Profile Version 1.1.
	1. Document that clarifies SOAP 1.1 and WSDL 1.1 specs to promote SOAP interoperability. [Further Information about JAX-WS](https://docs.oracle.com/javaee/7/tutorial/jaxws004.htm#BNAZE)
2. JAX-WS runtime supports doc/literal and rpc/literal encodings for services, static ports, dynamic proxies, Dynamic invocation Interface (DII)

#### Further Information about JAX-WS ####
1. [Java API for XML Web Services 2.2 specification](http://jcp.org/en/jsr/detail?id=224)
2. [JAX-WS home](https://jax-ws.java.net/)
3. [Simple Object Access Protocol (SOAP) 1.2 W3C Note:](http://www.w3.org/TR/soap/)
4. [Web Services Description Language (WSDL) 1.1 W3C Note:](http://www.w3.org/TR/wsdl)
5. [WS-1 Basic Profile 1.2 and 2.0](http://www.ws-i.org/)