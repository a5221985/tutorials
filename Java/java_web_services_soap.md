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
						<groupId>org.springframework.boot</groupId>
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
