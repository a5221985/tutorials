## Java SOAP Client ##
### Introduction ###
1. Steps
	1. Creation of a Project
		1. Add apache cxf
	2. Retrieve WSDL
		1. Save
		2. Copy to project
	3. Generate stubs
	4. Creation of client
	5. Run application

### Creation of the Java Client Project ###
1. New Spring starter project
	1. Name: javasoapclient
	2. Finish
2. pom.xml

		<dependency>
			<groupId>org.apache.cxf</groupId>
			<artefactId>cxf-spring-boot-starter-jaxws</artefactId>
			<version>3.2.1</version>
		</dependency>

3. Copy to src/main/resources/wsdl/CustomerOrders.wsdl

### Retrieve the WSDL ###
1. Open customer orders service wsdl file
	1. save page as CustomerOrders.wsdl
		1. Copy to src/main/resources/wsdl/CustomerOrders.wsdl

### Generate the Stubs ###
1. pom.xml
	1. Copy codegen plugin
		1. cxf-codegen-plugin

### Implement the Client ###
1. `com.bharath.ws.soap.CustomerOrderWsClient.java`

		public class CustomerOrderWsClient {
			public static void main(String[] args) throws MalformedURLException {
				CustomerOrderWsImplService service = new CustomerOrderWsImplService(new URL("http://localhost:8080/wsdlfirstws/customerdersservice?wsdl"));
				CustomerOrdersPortType customerOrdersWsImplPort = service.getCustomerOrderWsImplPort();// wraps all the operations
				GetOrdersRequest request = customerOrdersWsImplPort.getOrders(new GetOrdersRequest());
				request.setCustomerId(BigInteger.valueOf(1);
				GetOrdersResponse response = customerOrdersWsImplPort.getOrders(request);
				List<Order> orders = response.getOrder();
				
				System.out.println("Number of orders for the customer are: " + orders.get(0));
			}
		}
		
	1. Right click on the class and Run as Java Application

### Assignment ###
1. CreateRequest:
	1. Pass it to create Orders method

### Flow and the Service Provider Mechanism ###
1. What is going on behind the scenes:
	1. Creation of customer order service:
		1. `Service` class constructor

				delegate = Provider.provider().createServiceDelegate(...);
				
			1. Uses service provider mechanism
				1. Searches for `Provider` class in jar files (`javax.xml.ws.spi.Provider`)
					1. `ProviderImpl`
			2. `delegate` is responsible for generating client dynamically at runtime
				1. `delegate` is used to construct a port on the fly (uses proxy pattern may be)

### Section Summary ###
1. `pom.xml` - maven dependencies
2. Generate stubs - using maven codegen plugin of cxf
3. Standalone client
4. Service provider mechanism (Java 6) - used to discover who is the provider on the client side
	1. Which is apache cxf
		1. Generates ports, serializes and deserializes messages

## Developing Bottom Up Web Services ##
### Payment Gateway Legacy Application Use Case ###
1. Context
	1. Bank - Amazon wants to process payments using our gateway
	2. User calls Amazom
		1. Web layer
		2. Business layer
		3. Data access
		4. DB
	3. For eBay, Flipkart, ...
		1. Instead of re-writing
			1. Business layer is marked as Java Web Service using Payment Gateway
			2. Payment Gateway is added to connect to Business layer
			3. eBay calls Business layer through Payment Gateway to make payments
				1. PG Web Service
2. This approach is used when the legacy application already exists and we want to expose legacy service as a web-service for other applications

### Import the Legacy Project ###
1. Steps:
	1. Construct teh Project
	2. Construct the Endpoint
	3. Mark with JAXB annotations
	4. Mark with JAX-WS annotations
	5. Construct the config class
	6. Run the application
2. Download the java first web services project from Resources
3. Import the project into STS
4. Open `pom.xml`

		cxf-spring-boot-starter-jaxws

### Mark the Beans with JAXB Annotations ###
1. Mark DTOs with JAXB - to serialize and deserialize
2. `PaymentProcessorRequest`

		@XmlType(name = "PaymentProcessorRequest") // name is optional
		@XmlAccessorType(XmlAccessType.FIELD) // fields are used for JAXB
		public class PaymentProcessorRequest {
			@XmlElement(name = "creditCardInfo", required = true)
			private CreditCardInfo creditCardInfo;
			@XmlElement(name = "Amount")
			private Double amount;	
		}

3. `CreditCardInfo`

		@XmlType
		public class CreditCardInfo {
			...
		}
		
4. `PaymentProcessorResponse`

		@XmlType
		public class PaymentProcessorResponse {
			...
		}

### Mark the Endpoint with JAX-WS Annotations ###
1. `PaymentProcessor` - interface is enough (cxf will take care of it)

		@WebService(name = "PaymentProcessor") // JaxWS API, name is optional
		public interface PaymentProcessor {
			//... @WebMethod is optional for method, @WebResult can be used to mark response and @WebParam(name="") can be used for parameters - optional
		}

### Publish the Endpoint ###
1. Copy WebServiceConfig.java

		package com.bharath.ws.soap.config;

		@Configuration
		public class WebServiceConfig {
			@Autowired
			private Bus bus;
			
			@Bean
			public Endpoint endpoint() {
				Endpoint endpoint = new EndpointImpl(bus, new PaymentProcessorImpl());
				endpoint.publish("/paymentProcessor");
				return endpoint;
			}
		}
		
2. `application.properties`

		server.context-path=/javafirstws
		cxf.path=/

### Run the Application ###
1. Open `http://localhost:8080/javafirstws`
	1. cxf scans packages and based on annotations, it will build a wsdl file

### Test Using SoapUI ###
1. Copy wsdl url and paste in SoapUI
	1. Single TestCase with one Request for each Operation
2. Example Request:

		<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:soap="http://soap.ws.bharath.com/">
		   <soapenv:Header/>
		   <soapenv:Body>
		      <soap:processPayment>
		         <!--Optional:-->
		         <arg0>
		            <!--Optional:-->
		            <creditCardInfo>
		               <!--Optional:-->
		               <address>TEST</address>
		               <!--Optional:-->
		               <cardNumber>123</cardNumber>
		               <!--Optional:-->
		               <expirtyDate>2021-09-24+06:00</expirtyDate>
		               <!--Optional:-->
		               <firstName>A</firstName>
		               <!--Optional:-->
		               <lastName>M</lastName>
		               <!--Optional:-->
		               <secCode>123</secCode>
		            </creditCardInfo>
		            <!--Optional:-->
		            <amount>1000</amount>
		         </arg0>
		      </soap:processPayment>
		   </soapenv:Body>
		</soapenv:Envelope>
		
3. Apache cxf de-serializes request into PaymentProcessorRequest and passes it on to PaymentProcessorImpl and then serializes response back from PaymentProcessorResponse

### SOAPUI Assignment ###
1. Run tests in SOAP UI and check responses

### Section Summary ###
1. Endpoint and Beans

## WS Standards ##
### Introduction ###
### WS Standards Overview ###
### Username Token Authentication Steps ###
### Add Maven Dependency ###
### Configure the Interceptors ###
### Provide the Interceptor Properties ###
### Setup an in Memory Database ###
### Implement the Handle Method ###
### Run the Application ###
### Test ###

## User Name Token Profile Client ##
### Construct the Project ###
### Generate the Stubs ###
### Code the Client ###
### CXF Low Level Client API ###
### Configure Properties ###
### Construct a Callback Handler ###
### UT in Action ###

## MTOM ##
### Introduction ###
### Construct the MTOM Project ###
### Construct the FileWs Interface ###
### Construct the FileWsImpl ###
### Implement the Download Method ###
### Publish the Endpoint ###
### Test Using SoapUI ###

## JAX-WS Handlers ##
### Introduction ###
### Two Types of JAX-WS Handlers ###
### Usecase ###
### Steps ###
### Construct the Handler Class ###
### Implement the `handleMessage` Method ###
### Extract the Header ###
### Configure the Handler ###
### SoapUI Test ###
### The Handler Flow ###
### `getHeaders` Explained ###

## SOAP Faults ##
### Introduction ###
### Usecase and Project ###
### Constructing a SOAP Fault ###
### Construct and Throw a Custom Exception ###
