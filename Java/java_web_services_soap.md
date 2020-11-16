## Developing Top Down Web Services ##
### Usecase ###
1. CustomersOrderService - Construct, Read
2. Steps:
	1. WSDL:
	2. Generate Stubs
	3. Implement the endpoint
	4. Configure the cf-servlet.xml (spring config file for apache cxf)

### Steps to Construct WSDL First Web Service ###
1. Steps:
	1. Construct the Project
		1. Construct the WSDL
		2. Generate the Stubs
	2. Construct the endpoint
	3. Construct the config class
	4. Run the application

### Construct the WSDL First Project ###
1. New > Spring Starter Project
	1. wsdlfirstws
	2. Description: WSDL First
	3. Finish
2. Dependency:

		<dependency>
			<groupId>org.apache.cxf</groupId>
			<artifactId>cxf-spring-boot-starter-jaxws</artifactId>
			<version>3.2.1</version>
		</dependency>
		
3. `application.properties`

		server.context-path=/wsdlfirstws
		cxf.path=/ # /services is default

### WSDL Construction ###
1. WSDL - xml document
2. Root: wsdl definitions element - namespaces to be used
	1. `targetNamespace` - our own namespace. Applicable to all the requests and responses in our application
		1. Usually domain name
	2. `name="CustomerOrderService"` - unique name for our service
	3. `schema` - all request and response types

			<wsdl:types>
				<xs:schema xmlns="http://www.w3.org/2001/XML_Schema"
					xmlns:tns="http://trainings.ws.bharath.com/" elementFormDefault="unqualified"
					targetNamespace="http://trainings.ws.bharath.com/" version="1.0">
					<xs:complexType name="order">
						<xs:sequence>
							<xs:element name="id" type="xs:integer" />
							<xs:element maxOccurs="unbounded" name="product" type="tns:product" />
						</xs:sequence>
					</xs:complexType>
					
					<xs:complexType name="product">
						<xs:sequence>
							<xs:element minOccurs="0" name="id" type="xs:string" />
							<xs:element minOccurs="0" name="description" type="xs:string" />
							<xs:element minOccurs="0" name="quantity" type="xs:integer" />
						</xs:sequence>
					</xs:complexType>
					
					<xs:complexType name="getOrdersRequest">
						<xs:sequence>
							<xs:element minOccurs="0" name="customerId" type="xs:integer" />
						</xs:sequence>
					</xs:complexType>
					
					<xs:complexType name="getOrdersResponse">
						<xs:sequence>
							<xs:element minOccurs="0" maxOccurs="unbounded" name="order" type="tns:order" />
						</xs:sequence>
					</xs:complexType>
					
					<xs:complexType name="createOrdersRequest">
						<xs:sequence>
							<xs:element name="customerId" type="xs:integer" />
							<xs:element name="order" type="tns:order" />
						</xs:sequence>
					</xs:complexType>
					
					<xs:complexType name="createOrdersResponse">
						<xs:sequence>
							<xs:element name="result" type="xs:boolean" />
						</xs:sequence>
					</xs:complexType>
					
					<xs:element name="getOrdersRequest" type="tns:getOrdersRequest" /> <!-- element definition -->
					
					<xs:element name="getOrdersResponse" type="tns:getOrdersResponse" />
					
					<xs:element name="createOrdersRequest" type="tns:createOrdersRequest" />
					
					<xs:element name="createOrdersResponse" type="tns:createOrdersResponse" />
			</wsdl:types>
			
			<wsdl:message name="getOrdersRequest"> <!-- Analogous to input params to Java methods and outputs -->
				<wsdl:port element="tns:getOrdersRequest" name="parameters"/>
				</wsdl:port>
			</wsdl:message>
			
			<wsdl:message name="getOrdersResponse"> <!-- Analogous to input params to Java methods and outputs -->
				<wsdl:port element="tns:getOrdersResponse" name="parameters"/>
				</wsdl:port>
			</wsdl:message>
			
			<wsdl:message name="createOrdersRequest"> <!-- Analogous to input params to Java methods and outputs -->
				<wsdl:port element="tns:createOrdersRequest" name="parameters"/>
				</wsdl:port>
			</wsdl:message>
			
			<wsdl:message name="createOrdersResponse"> <!-- Analogous to input params to Java methods and outputs -->
				<wsdl:port element="tns:createOrdersResponse" name="parameters"/>
				</wsdl:port>
			</wsdl:message>
			
			<wsdl:portType name="CustomerOrdersPortType"> <!-- operations are grouped here - abstract portion -->
				<wsdl:operation name="getOrders"> <!-- operation -->
					<wsdl:input message="tns:getOrdersRequest" name="getOrdersRequest">
					</wsdl:input>
					<wsdl:output message="tns:getOrdersResponse" name="getOrdersResponse">
					</wsdl:output>
				</wsdl:operation>
				<wsdl:operation name="createOrders"> <!-- operation -->
					<wsdl:input message="tns:createOrdersRequest" name="createOrdersRequest">
					</wsdl:input>
					<wsdl:output message="tns:createOrdersResponse" name="createOrdersResponse">
					</wsdl:output>
				</wsdl:operation>
			</wsdl:portType>
			
			<wsdl:binding name="CustomerOrdersServiceSoapBinding"
				type="tns:CustomerOrdersPortType"> <!-- links the abstract and physical portions -->
				<soap:binding style="document"
					transport="http://schemas.xmlsoap.org/soap/http" />
				<wsdl:operation name="getOrders">
					<soap:operation soapAction="" style="document" />
					<wsdl:input name="getOrdersRequest">
						<soap:body use="literal" /> <!-- binding recommended - entire messages are validated by soap engine -->
					</wsdl:input>
					<wsdl:output name="getOrdersResponse">
						<soap:body use="literal" />
					</wsdl:output>
				</wsdl:operation>
				<wsdl:operation name="createOrders">
					<soap:operation soapAction="" style="document" />
					<wsdl:input name="createOrdersRequest">
						<soap:body use="literal" /> <!-- binding recommended - entire messages are validated by soap engine -->
					</wsdl:input>
					<wsdl:output name="createOrdersResponse">
						<soap:body use="literal" />
					</wsdl:output>
				</wsdl:operation>
				
				<wsdl:service name="CustomerOrdersService"> <!-- Defines how to consume the web service -->
					<wsdl:port binding="tns:CustomerOrdersServiceSoapBinding" name="CustomerOrdersPort">
						<soap:address
							location="http://localhost:8080/wsdlfirstws/services/customerOrdersService" /> <!-- dynamically changed by cxf with ip address of the server -->
					</wsdl:port>
				</wsdl:service>
			</wsdl:binding>
			
### Download Skeleton WSDL ###
1. [https://www.udemy.com/course/java-web-services/learn/lecture/20280735#content](https://www.udemy.com/course/java-web-services/learn/lecture/20280735#content)
2. Change the name to `CustomerOrders.wsdl`
3. Paste it in `src/main/resources/wsdl`
4. Eclipse has support for wsdl (not STS)

### Generate the Stubs ###
1. Search for `cxf codegen plugin` - `cxf-codegen-plugin`
	1. Apache CXF - link

			<plugin>
				<groupId>org.apache.cxf</groupId>
				<artifactId>cxf-codegen-plugin</artifactId>
				<version>3.2.1</version>
				<executions>
					<execution>
						<id>generate-sources</id>
						<phase>generate-sources</phase>
						<configuration>
							<sourceRoot>${project.build.directory}/generated/cxf</sourceRoot> <!-- generated stubs are copied here - in target directory -->
							<wsdlOptions>
								<wsdlOption>
									<wsdl>${basedir}/src/main/resources/wsdl/CustomerOrders.wsdl</wsdl> <!-- basedir - src/main/resources/wsdl -->
									<wsdlLocation>classpath:CustomerOrders.wsdl</wsdlLocation> <!-- above or this can be used -->
								</wsdlOption>
							</wsdlOptions>
						</configuration>
						<goals>
							<goal>wsdl2java</goal>
						</goals>
					</execution>
				</executions>
			</plugin>
			
		1. Paste in `pom.xml` at the end
		2. Right click - maven > update project
			1. Stubs are generated

### Construct the CustomerOrders Service ###
1. Generates both JAXB and JAXWS classes
	1. Request and Response classes
	2. PortType class - wraps the operations

			@WebService
			...
			
	3. Service class - 
	4. Order - pojo (JAXB)
	5. ObjectFactory - meta data used to construct the objects
2. Endpoint creation:
	1. Right click > New > Class
		1. CustomerOrdersWsImpl
		2. Add: CustomerOrdersPortType (Interface)
			1. We don't have to mark the class with any annotations (annotations are present in the interface)

### Implement the init Method ###
1. CustomerOrdersWsImpl

		Map<BigInteger, List<Order>> customerOrders = new HashMap<>();
		int currentId;
		
		public CustomerOrderWsImpl() {
			init();
		}
		
		public void init() {
			List<Order> orders = new ArrayList<>();
			Order order = new Order();
			order.setId(BigInteger.valueOf(1)); // default for stubs
			
			Product product = new Product();
			product.setId("1");
			product.setDescription("IPhone");
			product.setQuantity(BigInteger.valueOf(3));
			order.getProduct().add(product);
			orders.add(order);
			
			customerOrders.put(BigInteger.valueOf((++currentId), orders);
		}
		

### Implement the getOrders Method ###

		@Override
		public GetOrdersResponse getOrders(GetOrdersRequest request) {
			BigInteger customerId = request.getCustomerId();
			List<Order> orders = customerOrders.get(customerId);
			GetOrdersResponse orders = new GetOrdersResponse();
			response.getOrder().addAll(orders); // response has empty list
			return orders;
		}

### Implement the constructOrders Method ###

		@Override
		public CreateOrdersResponse createOrders(CreateOrdersRequest request) {
			BigInteger customerId = request.getCustomerId();
			Order order = request.getOrder();
			
			List<Order> orders = customerOrders.get(customerId);
			orders.add(order);
			
			CreateOrderResponse response = new CreateOrderResponse();
			response.setResult(true);
			
			return response;
		}


### Publish the Endpoint ###
1. src/main/java/com.bharath.ws.soap.config.WebServiceConfig.java

		@Bean
		public Endpoint endpoint() {
			Endpoint endpoint = new EndpointImpl(bus, new CustomerOrdersService());
			...
		}

### Enable Logging Feature ###
1. Enable logging:

		@Features(features = "org.apache.cxf.feature.LoggingFeature")
		public class CustomerOrdersWsImpl implements CustomerOrdersPortType {
			...
		}

### Run the Application ###
1. Run as Spring Boot Application
2. http://localhost:8080/wsdlfirstws
	1. Click on the wsdl link

### Testing using SoapUI ###
1. Copy the URL from browser
2. New SOAP Project:
	1. Name: customerordersservice
	2. Wsdl: url
	3. Test Suit enabled
3. getOrders - test case
	1. Customer ID: 1
4. createOrders - test case
	1. Customer ID: 1
	2. Order ID: 2
	3. Product ID: 2
	4. Description: Mac BOOK RPO

### WSDL First Web Service Assignment ###
1. Delete orders method starting with WSDL file
	1. Change WSDL
		1. Modify xml schema if required
		2. Add Message
		3. Add Operation under port types
		4. Add Binding 

### Section Summary ###
1. Order processing WSDL first WS
	1. WSDL File
	2. Generate Stubs (wsdl2java codegen plugin) (pom.xml)
	3. Implement the endpoint (interface generated is used)
	4. Publish the endpoint

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
2. Annotate
3. Publish the Endpoints
4. SoapUI Testing

## WS Standards ##
### Introduction ###
1. Security can be configured out of the box
2. UT - User Token
3. MTOM - to exchange files
4. Encryption and Decryption

### WS Standards Overview ###
1. Why WS.*?
2. Two components need to communicate with each other seamlessly so we need WS standards
3. When? Why? and How? to use the standards
4. Why?
	1. Example: Online Shopping Application
		1. Credit card info is sent to Banks Payment Gateway Web Service
		2. Bank will ask us to authenticate
		3. SOAP message should contain it
			1. WS security is used:
				1. Username and Password is passed
	2. WS-Security:
		1. 3 important issues
			1. Authentication - Each of them know about each other
				1. User Name Token Profile - username and password
				2. X 508 Certificates
				3. SAML - Single Sign On
					1. If we sign on to one web service, we can use any other web service
			2. Confidentiality - make sure hacker does not read the messages
				1. Encryption and Decryption - public key cryptography
			3. Integrity - messages must not get changed or tampered
				1. XML Signature - included in the message
					1. Consumer calculates signature and compares
		2. MTOM - For exchange files
			1. Any kind of files - word, text, images
				1. X-Rays
		3. WS-Addressing - Asynchronous Callbacks
			1. If WS is taking a lot of time, consumers can give a URL to call back once the processing is done
				1. Headers can be used
			2. Redirect WS response to another server instead of consumer
		4. WS-Policy- Assert and mandate certain rules to consume our web services
			1. Say ensure all consumers to use https to call web service
			2. CXF ensures policies are followed
		5. WS-SecureConversation - Improve Performance while encrypting and decrypting by negotiating a private key at the beginning
			1. Instead of for each request and response
		6. WS-SecurityPolicy - Assert WS-Security requirements
			1. Combination of WS security and WS policy
				1. Assures certain WS security standards are followed by the Web Services consumer in an easier way
					1. For example, consumer must encrypt message before sending
5. CXF implements these standards which can be used without doing much work at our end
	1. Refer to documentation
6. Wrap Up:
	1. There are other standards as well
	2. WS-Security - application security
	3. MTOM - file exchange
	4. WS-Addressing - asynchronous callback, redirect to different server
	5. WS-Policy - Rules for consumer
	6. WS-SecurityPolicy
	7. WS-SecureConversation

### Username Token Authentication Steps ###
1. Steps:
	1. Add Security Dependency
	2. Configure the WSS4J Interceptors - WebServices Security for Java
		1. They handle security - need to configure
	3. Construct the Password Callback class - provides password so that WSS4J interceptors can intercept incoming message and validate against password
	4. Run and Test

### Add Maven Dependency ###
1. Search for cxf jaxws security dependency
2. Maven repository: `cxf-rt-ws-security`

		<!-- https://mvnrepository.com/artifact/org.apache.cxf/cxf-rt-ws-security -->
		<dependency>
		    <groupId>org.apache.cxf</groupId>
		    <artifactId>cxf-rt-ws-security</artifactId>
		    <version>3.3.4</version>
		</dependency>

### Configure the Interceptors ###
1. Open `WebServicesConfig`

		public Endpoint endpoint() {
			EndpointImpl ...;
			new HashMap<String, Object> hashMap = new HashMap<>();
			WSS4JInInterceptor wssIn = new WSS4JInInterceptor(hashMap); // in interceptor used for incoming requests, out interceptor is used for outgoing responses
			endpoint.getInInterceptors().add(wssIn);
			...
		}

### Provide the Interceptor Properties ###
1. Properties

		Map<String, Object> inProps = new HashMap<>();
		inProps.put(ConfigurationConstants.ACTION, ConfigurationConstants.USERNAME_TOKEN);
		inProps.put(CongirutationConstants.PASSWORD_TYPE, WSConstants.PW_TEXT);
		inProps.put(ConfigurationConstants.PW_CALLBACK_CLASS, UTPasswordCallback.class.getName());
		
	1. Generate the class

			com.bharath.ws.soap.config.UTPasswordCallback
			
		1. Implement: CallbackHandler - javax.security.auth.callback

### Setup an in Memory Database ###
1. UTPasswordCallback

		private Map<String, String> passwords = new HashMap<>();
		
		public void UTPasswordCallback() {
			passwords.put("bharath", "bharath");
			passwords.put("cxf", "cxf");
		}
		
		@Override
		public void handle(...) {
		
		}
		
	1. Passwords can be obtained from database or from LDAP

### Implement the Handle Method ###
1. Handle gets callback array - callback has username as parameter

		for(Callback callback : callbacks) {
			WSPasswordCallback passwordCallback = (WSPasswordCallback) callback;
			String password = passwords.get(passwordCallback.getIdentifier()); // returns username
			
			if (password != null) {
				passwordCallback.setPassword(password);
				return;
			}
		}

### Run the Application ###
1. Summary:
	1. Interceptor
		1. What it needs to do - action
		2. password type
		3. callback
	2. Callback handler
		1. returns password to WSS4J
2. Re-start application
3. Run the request in SoapUI - security error

### Test ###
1. Download the text file:

		 <soapenv:Header>
		 	<wsse:Security xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" soapenv:mustUnderstand="1">
		 		<wsse:UsernameToken xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
		 			<wsse:Username xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">Bharath</wsse:Username>
		 			<wsse:Password xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" Type="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText">Bharath</wsse:Password>
		 		</wsse:UsernameToken>
		 	</wsse:Security>
		 </soapenv:Header>
		 
	1. SoapUI: 

			Paste in Header section
			
	2. Example:

			<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:soap="http://soap.ws.bharath.com/">
			   <soapenv:Header>
			 	<wsse:Security xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" soapenv:mustUnderstand="1">
			 	  <wsse:UsernameToken xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
			 	    <wsse:Username xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">bharath</wsse:Username>
			 	    <wsse:Password xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" Type="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText">bharath</wsse:Password>
			 	  </wsse:UsernameToken>
			     </wsse:Security>
			   </soapenv:Header>
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
			
### Section Summary ###
1. WS-Standards
	1. Why?
		1. Open bodies worked on standards such as WS-Security
			1. Authentication
			2. Confidentiality
			3. Integrity
2. MTOM
3. WS-Addressing - Async communication, redirection
4. WS-Policy - SSL, user name token profile, ...
5. User Name Token Profile
	1. Callback
	2. `cxf-serlet.xml`

## User Name Token Profile Client ##
### Construct the Project ###
1. New Spring Starter Project - UTClient
2. Finish
3. `pom.xml`
	1. Copy cxf dependencies
	2. spring - 1.5.9
4. Generate stubs
	1. Copy plugin

			<build>
				<plugins>
					<plugin>
						<groupId>org.springframework.boot</groupId>
						<artifactId>spring-boot-maven-plugin</artifactId>
					</plugin>
					<plugin>
						<groupId>org.apache.cxf</groupId>
						<artifactId>cxf-codegen-plugin</artifactId>
						<version>3.2.1</version>
						<executions>
							<execution>
								<id>generate-sources</id>
								<phase>generate-sources</phase>
								<configuration>
									<sourceRoot>${project.build.directory}/generated/cxf</sourceRoot>
									<wsdlOptions>
										<wsdlOption>
											<wsdl>${basedir}/src/main/resources/wsdl/CustomerOrders.wsdl</wsdl>
											<wsdlLocation>classpath:wsdl/paymentProcessor.wsdl</wsdlLocation>
										</wsdlOption>
									</wsdlOptions>
								</configuration>
								<goals>
									<goal>wsdl2java</goal>
								</goals>
							</execution>
						</executions>
					</plugin>
				</plugins>
			</build>

### Generate the Stubs ###
1. Right click on `javafirstws` - run it
	1. Open wsdl in browser `http://localhost:8080/javafirstws`
	2. Command+S: paymentProcessor.wsdl (select All Files)
	3. Copy the file to `src/main/resources` - New folder: `wsdl`
	4. Change to `paymentProcessor.wsdl` everywhere
	5. Run as Spring Boot Application
2. Stub classes get generated

### Code the Client ###
1. Right click on `src/main/java` - Other - Class - `com.bharath.trainings.ws.client.PaymentWSClient`

		PaymentProcessor_Service service = new PaymentProcessor_Service(new URL("http://localhost:8080/javafirstwsut/services/paymentProcessor?wsdl"));
		PamentProcessor port = service.getPaymentProcessorPort();
		PaymentProcessorResponse response = port.processPayment(new PaymentProcessorRequest());
		System.out.println(response.isResult());

### CXF Low Level Client API ###
1. Run as Java Application
2. Error - Security error
3. CXF specific way:
4. PaymentWSClient

		Client client = ClientProxy.getClient(port);
		Endpoint endpoint = client.getEndpoint();
		
		Map<String, Object> props = new HashMap<>();
		WSS4JOutInterceptor wssOut = new WSS4JOutInterceptor(props);
		endpoint.getOutInterceptors().add(wssOut);
		
		PaymentProcessorResponse ...

### Configure Properties ###

		props = new HashMap<>();
		props.put(WSHandlerConstants.ACTION, WSHandlerConstants.USENAME_TOKEN);
		props.put(WSHandlerConstants.USER, "cxf");
		props.put(WSHandlerConstants.PASSWORD_TYPE, WSConstants.PW_TEXT);

### Construct a Callback Handler ###
1. New Class - UTPasswordCallback - Implements - CallbackHandler

		handle(...) {
			for (int i = 0; i < callbacks.length; i++) {
				WSPasswordCallback wpc = (WSPasswordCallback) callbacks[i];
				if (wpc.getIdentifier().equals("cxf")) {
					wpc.setPassword("cxf"); // can be read from a properties file
					return;
				}
			}
		}
		
2. `PaymentWSClient`

		props.put(WSHandlerConstants.PW_CALLBACK_CLASS, UTPasswordCallback.class.getName());

### UT in Action ###
1. Right click - Run as Java Application
2. Server side shows full request

## MTOM ##
### Introduction ###
1. MTOM - Message Transmission and Optimization Mechanism - Standard from SOAP
2. Standard mechanism to compress messages (best way) - WS-Attachments is a legacy
3. cxf, weblogic, websphere have this
4. Datatype: DataHandler attachinfo; // incoming file is read and set into this data handler
	1. used to return response as well
	2. `binding.setMTOMEnabled(true);` - by default it is not enabled
5. Setup:

		FileWs
			| upload
			| download
		FileWsImpl

### Construct the MTOM Project ###
1. File > New > Spring Starter Project > mtom
	1. Description: MTOM
2. Copy the section: cxf dependency from pom.xml and paste
	1. Spring version: 1.5.9
3. Right click on project > Maven Update Project
4. `src/main/resources/application.properties`
	1. Paste the following:

			server.context-path=/mtom
			cxf.path=/

### Construct the FileWs Interface ###
1. `src/main/java` - New Interface - `FileWs`

		@WebService
		public interface FileWs {
			void upload(@WebParam(name = "file") DataHandler attachment); // cxf grabs attachment and converts to DataHandler
			DataHandler download(); // cxf writes attachment back to client
		}

### Construct the FileWsImpl ###
1. `src/main/java/FileWsImpl` implements `FileWs`

		public class FileWsImpl implements FileWs {
			@Override
			public void upload(DataHandler attachment) {
				InputStream inputStream = null;
				OutputStream outputStream = null;
				try {
					inputStream = attachment.getInputStream();
					OutputStream outputStream = new FileOutputStream(new File("/Users/bharaththippireddy/Desktop/files/uploaded/test.jpg"));
					byte[] b = new byte[100000];
					int bytesRead = 0;
					
					while ((bytesRead = inputStream.read(b) != -1) {
						outputStream.write(b, 0, bytesRead);
					}
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					try {
						inputStream.close();
						outputStream.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}

### Implement the Download Method ###
1. FileWsImpl

		@Override DataHandler download() {
			return new DataHandler(new FileDataSource(new File("/Users/bharaththippireddy/Desktop/files/uploaded/test.jpg")));
		}

### Publish the Endpoint ###
1. `WebServicesConfig.java`

		@Bean
		public Endpoint endpoint() {
			Endpoint endpoint = new EndpointImpl(bus, new FileWsImpl());
			endpoint.publish("/fields");
			
			SOAPBinding binding = (SOAPBinding) endpoint.getBinding(); // javax.xml.ws.soap
			binding.setMTOMEnabled(true);
			
			return endpoint;
		}

### Test Using SoapUI ###
1. Run as Spring Boot App

		localhost:8080/mtom
		
	1. Click on wsdl link and copy the link
2. In SoapUI, New SOAP Project:
	1. Project Name: fileWs
	2. Initial WSDL: paste the link
3. Open upload request:
	1. Attachment has content id:
		1. Click on Attchments at button
		2. Click on + button
		3. Select `sky-div.jpg`
		4. Don't cache
	2. Click on Part: Select the content id
4. Hit play
5. To Download:
	1. Open download request
	2. Hit play
		1. Includes cid:
	3. Click on Attachments tab at the bottom:
		1. File is seen
		2. Click on the file to open to save it

## JAX-WS Handlers ##
### Introduction ###
1. What? Why and When to use the Jax-WS handlers
2. Lower level API to implement handlers
3. Cross-cutting concerns: - across ws endpoints or across clients
	1. Handlers are used for this
		1. Classes we develop by implementing interfaces
4. Called when WS-Client invokes a request to CXF (in between)
5. Called when cxf sends request to WS-Endpoing (in between)
6. And also when response flows through
7. They are similar to servlet filters but can be applied on client and server side
8. Handlers are used for:
	1. Custom authentication defition (own soap headers)
		1. We can manipulate here
	2. Caching - caches responses (same request or not)
	3. Maintaining different versions of WS-Endpoint
		1. We may have to decide which web service will serve the request (dispatched to specific endpoints)
9. We can do on eithe server or client side or both

### Two Types of JAX-WS Handlers ###
1. SOAP Handlers: A type of handler
	1. They have access to entire message (soap headers, body, ...)
2. Logical Handlers: Another type of handler
	1. Just the payload information
3. Implementation: `SOAPHandler<SOAPMessageContext>` interface is implemented
	1. Methods to override:
		1. `handleMessage`
		2. `handleFault`
		3. `getHeaders`
		4. `close`
4. `handleMessage`, `getHeaders`: Called on the way in and way out (twice)
5. `handleFault`: Called only when there is a fault
6. `close`: On the way out at the end of entire flow (cleanup code can be put here - closing resources)
7. Implementation: `LogicalHandler<LogicalMessageContext>`:
	1. Methods to override:
		1. `handleMessage`
		2. `handleFault`
		3. `close`
		4. No `getHeaders`

### Usecase ###
1. `SiteName` - `SiteHandler` is used to extract site name

### Steps ###
1. Design the handler chain (we can have multiple handlers) - servlets filter pattern
2. Construct the handlers
3. Configure the handlers
4. Run and Test

### Construct the Handler Class ###
1. 	wsdlFirstws - New Class > com.bharath.trainings.ws.handlers.SiteHandler implements SOAPHandler (javax.xml.ws.handler.soap.SOAPHandler)

		public class SiteHandler implements SOAPHandler<SOAPMessageContext> {
			...
			@Override
			public boolean handleMessage(SOAPMessageContext context) {
				return false;
			}
			...
		}

### Implement the `handleMessage` Method ###
1. Steps:
	1. Configure for request message only

			@Override
			public boolean handleMessage(SOAPMessageContext context) {
				Boolean isResponse = (Boolean) context.get(MessageContext.MESSAGE_OUTBOUND_PROPERTY);
				if (!isResponse) {
					SOAPMessage soapMsg = context.getMessage();
					try {
						SOAPEnvelope envelope = soapMsg.getSOAPPart().getEnvelope();
						SOAPHeader header = envelope.getHeader();
						Iterator childElements = header.getChildElements();
					} catch (SOAPException e) {
						e.printStackTrace();
					}
				} else {
					System.out.println("Response on the way");
				}
				return false;
			}

### Extract the Header ###

		System.out.println("HandleMessage");
		
		...
		
		while (childElements.hasNext()) {
			Node eachNode = (Node) childElements.next(); // javax.xml.soap.Node
			String name = eachNode.getLocalName();
			if (name != null && name.equals("SiteName")) {
				System.out.println("Site Name is =====> " + eachNode.getValue());
			}
		}
		...
		return true; // or else this handler will not be called
		
		@Override
		public boolean handleFault(SOAPMessageContext context) {
			System.out.println("handleFault");
			return false;
		}

### Configure the Handler ###
1. `WebServiceConfig.xml`

		@Bean
		public Endpoint endpoint() {
			...
			SOAPBinding binding = (SOAPBinding) endpoint.getBinding();
			ArrayList<Handler> handlerChain = new ArrayList<>();
			handlerChain.add(new SiteHandler());
			binding.setHandlerChain(handlerChain);
			
			return endpoint;

### SoapUI Test ###
1. Start application
2. Access wsdl file
3. Paste in SOAP-UI
4. Project Name: SiteHandlerTest
	1. Request:
		1. CustomerID: 1
		2. id: 1234
		3. description: iPhone
		4. quantity: 1000
	2. Add headers

			<soapenv:Header>
				<SiteName>Amazon</SiteName>
			</soapenv:Header>
			
		1. Console prints the handler message

### The Handler Flow ###
1. First method called: `getHeaders` - on the way in
2. Second: `handleMessage` - on the way in
3. Third: `getHeaders` - on the way out
4. Fourth: `handleMessage` - on the way out
3. Third: `close` - at the end before ending

### `getHeaders` Explained ###
1. Assignment: implement it
2. `mustUnderstand` attribute
	1. It takes two values: 
		1. 1 - shoud be processed by the web services provider
			1. Code on should handle soap header
		2. 0 - optional
	2. Example:

			<SiteName mustUnderstand="1">Amazon</SiteName>
			
		1. Server:

				@Override
				public Set<QName> getHeaders() {
					System.out.println("getHeaders");
					return null; // put SiteName in the Set and return it for cxf to know that we have handled it
				}
				
			1. Should be implemented if `mustUnderstand="1"` attribute is set

## SOAP Faults ##
### Introduction ###
1. Soap services should handle errors

		<SOAP-ENV:Envelope>
			<SOAP-ENV:Body>
				<SOAP-ENV:Fault>
				
	1. Four child elements:
		1. `<faulCode>` : Indicates what has gone wrong
			1. `SOAP-ENV:VersionMismatch` - if soap envelope namespace is not what the server is expecting
			2. `SOAP-ENV:MustUnderstand` - Used when `mustUnderstand` flag is set to 1 in soap header
				1. If provider does not handle the child element of the header, then this error occurs
			3. `SOAP-ENV:Client` - message was not formed well (wrong info or incorrect message)
			4. `SOAP-ENV:Server` - server fault
		2. `<faultString>`: Message that explains the error
		3. `<faultActor>`: If message is going through multiple nodes, we want to know at which node the error occurred
		4. `<detail>`: More information about the error
			1. If multiple errors, we can indicate here

### Usecase and Project ###
1. Run application: javafirstws
2. Test using SOAP UI

### Constructing a SOAP Fault ###
1. Example:

		public class PaymentProcessorImpl implements PaymentProcessor {
			public PaymentProcessorResponse processPayment(PaymentProcessorRequest paymentProcessorRequest) {
				...
				if (paymentProcessorRequest.getCreditCardInfo().getCardNumber() == null || paymentProcessorRequest.getCreditCardInfo().getCardNumber().length() == 0) {
					throw new RuntimeException("Invalid Card Number");
				}
			}
		}
		
	1. Remove the number and run

			<faultcode>soap:Server</faultcode>
			<faultstring>Invalid Card Number</faultstring>
			
		1. wsdl does not have any fault elements
			1. We are throwing runtime exception and not checked exception

### Construct and Throw a Custom Exception ###
1. Making soap fault part of contract
2. Example:

		@WebService(name = "PaymentProcessor")
		public interface PaymentProcessor {
			public @WebResult(name = "response") PaymentProcessorResponse processPayment(@WebParam(name = "paymentProcessorRequest") PaymentProcessorRequest paymentProcessorRequest) throws Exception;
		}
		
	1. WSDL has fault element
	2. Custom exception:

			... throws ServiceException
			
		1. Class

				public class ServiceException extends Exception {
					public ServiceException(String message) {
						super(message);
					}
				}
				
			1. `PaymentProcessorImpl`

					... throws ServiceException {
						...
						throws new ServiceException("Invalid Card Number");
					}
					
				1. Detail:

						<detail>
							<...ServiceException>
						</detail>
						
## CRUD Operations Using SOAP ##
### Usecase ###
1. CRUD on products
	1. Product:
		1. id
		2. description
		3. ...
2. Spring Data JPA
3. Hibernate
4. Classes
	1. ProductRepository
	2. Product
	3. ProducWs
	4. ProductWsImpl
5. Steps:
	1. Download MySQL and MySQL Workbench
	2. Install (choose Workbench)
	3. Configure (enter Root password)

### Install MySQL and MySQL workbench ###
1. MySQL Workbench - client for MySQL
2. Steps:
	1. Download installer
	2. Install MySQL & MySQL workbench (choose Workbench option)
	3. Configure MySQL (enter root password)
3. Link: search for mysql install: [https://corlewsolutions.com/](https://corlewsolutions.com/)
4. Configuration:
	1. Open MySQL.prefPane
	2. Select **Configuration** tab
	3. Click **Select** against **Configuration File** option
		1. Select `/private/etc/my.cnf`
		2. In `/etc/my.cnf` add the following:

				[mysqld]
				skip-grant-tables
				
		3. Restart mysqld as follows:
			1. `ps aux | grep mysql`
			2. `kill -9 <pid1> <pid2> ...` (grab pids of all mysql related processes)
		4. MySQLD gets restarted automatically
		5. Run the following to connect:

				/usr/local/mysql-8.0.16-macos10.14-x86_64/bin/mysql -uroot -ppassword

### Launch MySQL workbench and Construct a Database ###
1. Launch MySQL workbench
	1. MySQL COnnections +
	2. Username: root
	3. Connection Name: Local
	4. Test Connection: Enter password
	5. Double click on icon
	6. New > Query Tab
2. SQL

		create database mydb
		
	1. Click on lightning icon

### Construct DB Table ###
1. SQL:

		use mydb;

		create table product (id int, name varchar(20), description varchar(20), price int);
		
		select * from product;

### Construct the Project ###
1. Go to STS
2. New starter project:
	1. name: productcrud
	2. group: com.bharath.soap
	3. Description: Product CRUD Operations
	4. Dependencies:
		1. JPA (Hibernate is JPA provider my default)
		2. MySQL
		3. Search of cxf spring boot jaxws dependency (Google)

				<dependency>
					<groupId>org.apache.cxf</groupId>
					<artifactId>cxf-spring-boot-starter-jaxws</artifactId>
					<version>3.2.6</version>
				</dependency>

### Construct the Data Access Layer ###
1. Goto STS
2. New Class:
	1. com.bharath.ws.soap.entities.Product

			@Entity
			public class Product {
				@Id
				private int id;
				private String name;
				private String description;
				private int price;
				
				// Getters and setters
			}

3. New Interface:
	1. com.bharath.ws.soap.repos.ProductRepository

			public interface ProductRepository extends JpaRepository<Product, Integer> {
			}

### Construct the Web Services Layer ###
1. New Interface:
	1. com.bharath.ws.soap.ProductWs

			public interface ProductWs {
				
				List<Product> getProducts();
				
				Product getProduct(int id);
				
				Product constructProduct(Product product);
				
				Product updateProduct(Product product);
				
				// delete
			}
			
	2. com.bharath.ws.soap.ProductWsImpl

			public class ProductWsImpl implements ProductWs {
				
				@Override
				List<Product> getProducts() {
				
				}
				
				@Override
				Product getProduct(int id) {
				
				}
				
				@Override
				Product constructProduct(Product product) {
				
				}
				
				@Override
				Product updateProduct(Product product) {
				
				}
				
				// delete
			}

### Implement the Endpoint Methods ###
1. Implementation:

		@Service
		public class ProductWsImpl implements ProductWs {
		
			@Autowired
			private ProductRepository productRepos;
				
			@Override
			List<Product> getProducts() {
				retrurn productRepo.findAll();
			}
			
			@Override
			Product getProduct(int id) {
				return productRepo.findById(id).get(); // Optional product
			}
			
			@Override
			Product constructProduct(Product product) {
				return productRepo.save(product);
			}
			
			@Override
			Product updateProduct(Product product) {
				return productRepo.save(product); // checks if object exists
			}
			
			// delete
			
			// Getters and setters
		}

### Mark the Endpoint with jax-ws Annotations ###
1. ProductWS

		@WebService
		public interface ProductWs {
			@WebMethod
			List<Product> getProducts();
			
			@WebMethod
			Product getProduct(int id);
			
			@WebMethod
			Product createProduct(Product product);
			
			@WebMethod
			Product updateProduct(Product product);
		}

### Publish the Endpoint ###
1. Goto hellowebservice: Grab WebServiceConfig.java

		@Configuration
		public class WebServiceConfig {
			@Autowired
			private Bus bus;
			
			@Autowired
			private ProductWs productService;
			
			@Bean
			public Endpoint endpoint() {
				Endpoint endpoint = new EndpointImpl(bus, productService);
				endpoint.publish("/products");
				return endpoint;
			}
		}

### Configure the Properties ###
1. application.properties

		server.servlet.context-path=/productcrud
		cxf.path=/
		
		spring.datasource.url=jdbc:mysql://localhost:3306/mydb
		spring.datasource.username=root
		spring.datasource.password=test

### Run and Access the wsdl ###
1. Run as > Spring Boot App
2. http://localhost:8080/productcrud/
3. Copy the wsdl link

### Test Using SoapUI ###
1. Copy wsdl link and paste in SoapUI
2. Open Request 1
	1. Enter values
	2. Submit
3. Check database
