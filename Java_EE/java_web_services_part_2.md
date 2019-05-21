## Start Here ##
### Instructor and Course Introduction ###
1. SOAP Web Service using Java First approach
2. Client for the Web service
	1. SumWS Client
	2. SumWS Provider
3. SOAP WS Standards
	1. WS Security
		1. Authentication
		2. Confidentiality
		3. Integrity
		4. Non Repudiation
4. Username Token Profile Authentication
	1. Provider
	2. Client
5. Encryption and Decryption
	1. Ensures data is safe
	2. Two types of encryption
	3. Keytool - to generate keys and certificates
		1. To implement encryption
		2. To implement signatures
6. What is message integrity
	1. How to use signatures to maintain integrity
		1. Avoid message tampering
7. What are replay attacks?
	1. How to prevent them using timestamps
8. Following agile approach
9. Advanced SOAP and REST

### How to Make the Best of this Course ###
1. How to use the course?
	1. Softwares
		1. Java
		2. Eclipse
		3. Apache Tomcat
2. Work hands on
3. Updates and Upgrades is expected to be done

### Troubleshooting Maven Projects ###
1. Go to User directory
	1. .m2
		1. repository -> Delete it
2. Right click on project
	1. Maven - Update Project
		1. Latest dependencies should get pulled

## SOAP Web Service Creation ##
### Simple Usecase ###
1. Using Java first approach
	1. Client will send two numbers and Provider will send the sum
		1. Goal is to implement security

### Create the Project ###
1. Goto Eclipse
	1. File > New Maven Project
		1. Next
		2. `maven-architype-webapp`
		3. Next
		4. Group Id: com.bharath.trainings.ws
		5. Arifact Id: sumws
		6. Finish
	2. Expand src
		1. index.jsp
			1. Adding servlet dependency (not recommended)
			2. Right click on project
				1. Properties
					1. Search `targeted runtime`
					2. Select Tomcat
					3. Ok
2. Right click > new > other > folder > src/main/java

### Add Maven Dependencies ###
1. Update pom.xml
	1. Copy whole thing from description:

			<properties>
				<cxf.version>3.1.9</cxf.version>
			</properties>
			<build>
				<plugins>
					<plugin>
						<groupId>org.apache.maven.plugins</groupId>
						<artifactId>maven-compiler-plugin</artifactId>
						<version>3.2</version>
						<configuration>
							<source>1.8</source>
							<target>1.8</target>
						</configuration>
					</plugin>
					<plugin>
						<artifactId>maven-war-plugin</artifactId> <!-- maven uses default if this is not specified - optional -->
						<version>2.1</version>
						<configuration>
							<webXml>src/main/webapp/WEB-INF/web.xml</webXml>
						</configuration>
					</plugin>
				</plugins>	
				<finalName>sumws</finalName>
			</build>
			<dependencies>
				<dependency>
					<groupId>org.apache.cxf</groupId>
					<artifactId>cxf-rt-frontend-jaxws</artifactId>
					<version>${cxf.version}</version>
				</dependency>
				<dependency>
					<groupId>org.apache.cxf</groupId>
					<artifactId>cxf-rt-transports-http</artifactId>
					<version>${cxf.version}</version>
				</dependency>	
				<dependency>
					<groupId>org.springframework</groupId>
					<artifactId>spring-core</artifactId>
					<version>3.2.0.RELEASE</version>
				</dependency>	
				<dependency>
					<groupId>org.springframework</groupId>
					<artifactId>spring-context</artifactId>
					<version>3.2.0.RELEASE</version>
				</dependency>	
				<dependency>
					<groupId>org.springframework</groupId>
					<artifactId>spring-web</artifactId>
					<version>3.2.0.RELEASE</version>
				</dependency>		
			</dependencies>

		1. Right click > Maven > Update Project
		2. 

### Creation of the WS Endpoint ###
1. Eclipse
	1. DTOs
		1. `com.bharath.trainings.ws.dto.SumRequest`
		
				private int num1;
				private int num2;

				// Getters and Setters

		2. `com.bharath.trainings.ws.dto.SumResponse`

				private int result;

				// Getters and Setters

	2. New > Interface
		1. `com.bharath.trainings.ws.SumWS`

				SumResponse calculateSum(SumRequest request);

	3. New > Class
		1. `com.bharath.trainings.ws.SumWSImpl`
			1. Implement `SumWS`

					@Override
					public SumResponse calculateSum(SumRequest request) {
						int result = request.getNum1() + request.getNum2();
						SumResponse response = new SumResponse();
						response.setResult(result);
						return response;
					}

### Mark with JAXB Annotations ###
1. `SumRequest`

		@XmlType(name = "SumRequest")
		@XmlAccessorType(XmlAccessType.FIELD)
		public class SumRequest {
			
			@XmlElement(name = "num1")
			private int num1;

			@XmlElement(name = "num2")
			private int num2;

			...
		}

2. `SumResponse`

		@XmlType(name = "SumResponse")
		@XmlAccessorType(XmlAccessType.FIELD)
		public class SumResponse {
			
			@XmlElement(name = "response") // optional and need not be marked
			private int response;

			...
		}

### Mark with JAX-WS Annotations ###
1. `SumWS`

		@WebService(name = "SumWS")
		public interface SumWS {
			@WebResult(name="response") // optional
			SumResponse calculateSum(@WebParam SumRequest request); // optional
		}

### Configure the Endpoint ###
1. What is the endpoint and when it should be invoked
2. Eclipse
	1. WEB-INF
		1. Right click > New > Other > XML File
			1. cxf-servlet.xml (cxf will look this file in classpath)

					<?xml version="1.0" encoding="UTF-8"?>
					<beans xmlns="http://www.springframework.org/schema/beans"
						xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:jaxws="http://cxf.apache.org/jaxws"
						xmlns:cxf="http://cxf.apache.org/core" xmlns:soap="http://cxf.apache.org/bindings/soap"
						xsi:schemaLocation="http://cxf.apache.org/core http://cxf.apache.org/schemas/core.xsd http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd http://cxf.apache.org/bindings/soap http://cxf.apache.org/schemas/configuration/soap.xsd http://cxf.apache.org/jaxws http://cxf.apache.org/schemas/jaxws.xsd">
					
						<jaxws:server id="sumService" serviceClass="com.bharath.trainings.ws.SumWS" address="/sumService">
							<jaxws:serviceBean>
								<bean class="com.bharath.trainings.ws.SumWSImpl"/>
							</jaxws:serviceBean>
						</jaxws:server>
					</beans>

### Configure the cxf Servlet ###
1. WEB-INF/web.xml

		<display-name>Sum Service</display-name>

		<servlet>
			<servlet-name>cxf</servlet-name>
			<servlet-class>org.apache.cxf.transport.servlet.CXFServlet</servlet-class>
			<load-on-startup>1</load-on-startup> <!-- We want the webservice to start listening to requests as soon as tomcat starts -->
		</servlet>
		<servlet-mapping>
			<servlet-name>cxf</servlet-name>
			<url-pattern>/services/*</url-pattern> <!-- any request coming to this endpoint must be forwarded to the class above -->
		</servlet-mapping>

### Deploy and Run ###
1. Right click on project > Run as > Maven clean
2. Right click > Run as > Maven install
3. Right click > Run as > Run on Server > Tomcat
4. Open `http://localhost:8080/sumws/services`
	1. Click on the link
		1. WSDL file is shown
5. `src/main/webapp/index.jsp`

		<html>
			<body>
				<h2>Sum Service - <a href="services">Available Services</a></h2>
			</body>
		</html>

6. Refresh browser and go to `http://localhost:8080`

## SOAP Web Service Client Creation ##
### Create the Client Project ###
1. Eclipse > File > New > Maven Project > maven-archetype-quickstart
	1. com.bharath.trainings.ws
	2. SumWSClient
2. New folder > src > src/main/resources
	1. Open WSDL file
		1. File > Save page as > sumService.wsdl
		2. Copy the wsdl and paste it under src/main/resources

### Generate the Stubs ###
1. Codegen plugin
	1. pom.xml
		1. Delete dependencies:
		2. Copy and paste the following:

				<properties>
					<cxf.version>3.1.9</cxf.version>			
				</properties>		
				<build>				
					<plugins>					
						<plugin>						
							<groupId>org.apache.maven.plugins</groupId>
							<artifactId>maven-compiler-plugin</artifactId>	
							<version>3.2</version>
							<configuration>							
								<source>1.8</source>						
								<target>1.8</target>				
							</configuration>		
						</plugin>	
						<plugin>
							<groupId>org.apache.cxf</groupId>
							<artifactId>cxf-codegen-plugin</artifactId>
							<version>${cxf.version}</version>
							<executions>							
								<execution>								
									<id>generate-sources</id>				
									<phase>generate-sources</phase>			
									<configuration>		
										<sourceRoot>${basedir}/src/generated</sourceRoot> <!-- stubs are generated here -->
										<wsdlOptions>	
											<wsdlOption>
											<wsdl>${basedir}/src/main/resources/sumService.wsdl</wsdl> <!-- used to generate the stubs -->
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
					<finalName>sumwsclient</finalName>
				</build>
				<dependencies>
					<dependency>
						<groupId>org.apache.cxf</groupId>
						<artifactId>cxf-rt-frontend-jaxws</artifactId>
						<version>${cxf.version}</version>
					</dependency>
					<dependency>
						<groupId>org.apache.cxf</groupId>
						<artifactId>cxf-rt-transports-http</artifactId>
						<version>${cxf.version}</version>
					</dependency>
					<dependency>
						<groupId>org.springframework</groupId>
						<artifactId>spring-core</artifactId>
						<version>3.2.0.RELEASE</version>
					</dependency>
					<dependency>
						<groupId>org.apache.cxf</groupId>
						<artifactId>cxf-rt-ws-security</artifactId>
						<version>${cxf.version}</version>
					</dependency>
					<dependency>
						<groupId>commons-httpclient</groupId>
						<artifactId>commons-httpclient</artifactId>
						<version>3.1</version>
					</dependency>
					<dependency>
						<groupId>commons-codec</groupId>
						<artifactId>commons-codec</artifactId>
						<version>1.9</version>
					</dependency>
					<dependency>
						<groupId>org.springframework</groupId>
						<artifactId>spring-context</artifactId>
						<version>3.2.0.RELEASE</version>
					</dependency>
					<dependency>
						<groupId>junit</groupId>
						<artifactId>junit</artifactId>
						<version>4.4</version>
					</dependency>
				</dependencies>

			1. Right click on project > Maven > Update Project
			2. Right click run as > Maven clean
			3. Right click run as > Maven install
				1. Go to `src/generated

### Creation of the Stubs ###
### Creation of the Client and Test ###
1. src/test/java
	1. `com.bharath.trainings.ws.sumwsclient.SumWSTest` (JUnit 4)

			@Test
			public void calculateSumShouldReturnAValidResult() {
				try {
					SumWSService service = new SumWSService(new URL("http://localhost:8080/sumws/services/sumService?wsdl"));
					SumWS port = service.getSumWSPort();
					SumRequest request = new SumRequest();
					request.setNum1(10);
					request.setNum2(20);
					SumResponse response = port.calculateSum(request);
					assertNotNull(response);
					assertEquals(30, response.getResult());
				} catch (MalformedURLException e) {
					e.printStackTrace();
				}
			}

### Enable CXF Logging ###
1. src/main/webapp/WEB-INF/cxf-servlet.xml

		<cxf:bus>
			<cxf:features>
				<cxf:logging/>
			</cxf:features>
		</cxf:bus>

	1. Run the JUnit Test
		1. On Tomcat console - requests and responses

## SOAP WS Standards Concepts ##
### Why WS Standards ###
1. WS Standards
	1. Patient CheckIn App
		1. Gathers insurance information from patient and checks him into the hospital
		2. It checks the insurance with insurance application (provided by insurance provider)
		3. Insurance Application asks for authentication (valid username and password)
			1. WS-Standards is required here to put the authentication information

### SOAP WS Security Introduction ###
1. WS-Security
	1. Authentication
	2. Confidentiality
	3. Integrity
	4. Non-Repudiation
2. Authentication:
	1. Use Case:
		1. EMart calls into Payment Gateway
		2. Bank will ask EMart to provide authentication information
		3. Bank will respond if it is authentic
	2. Standards provides 3 ways:
		1. Username Token Profile
		2. X 509 Certificates
		3. SAML - Single Sign-On
4. Confidentiality:
	1. SSN
	2. Credit Card Info
	3. Hackers should not misuse this information
	4. Solution: Encryption & Decryption
5. Integrity:
	1. Message sent by client application is the same
	2. Hacker can include random info and then crash server or get access to server or corrupt the actual message
	3. Solution: Signatures
		1. Hash is calculated
		2. Hash is sent along with the message
		3. Server re-calculates the hash and compares and they should match
6. Non-Repudiation:
	1. Replay attack
	2. Hacker captures message and re-sends the message many times to crash the application
	3. Solution: Timestamp

### WS Security and Apache CXF ###
1. WSS4J: Apache WSS4J - Web Service Security for Java
	1. [http://ws.apache.org/wss4j/](http://ws.apache.org/wss4j/)
		1. Complete implementation of WSS4J
			1. Apache cxf uses WSS4J internally to implement security
2. Configuration
	1. WS Client -> CXF WSS4J In/Out Interceptors -> WSS4J <- CXF WSS4J In/Out Interceptors -> WS Provider
		1. Interceptors invoke libraries of WSS4J
			1. WSS4J has the following support
				1. Authentication
				2. Encryption/Decryption
				3. Signature
				4. Timestamp
				5. ...
	2. Spring configuration: approaches
		1. Adding xml elements
		2. Programmatically (client side)
			1. Interceptor is created
			2. Give it properties (what actions to do, what information is required to perform the actions)
				1. Actions:
					1. UsernameToken
					2. Encrypt
					3. Signature
					4. Timestamp
				2. Properties
					1. `passwordCallbackRef`
					2. `decryptionPropFile`
					3. `signaturePropFile`

## WS Security - Authentication ##
### What is Username Token Profile? ###
### Steps to Configure Username Token Profile ###
### Update the Maven Dependencies ###
### Configure User Name Token Profile ###
### Creation and Configure the PasswordCallbackHandler ###
### Run the Application on the Server ###
### Update Client Maven Dependencies ###
### Retrieve the CXF Client Proxy ###
### Creation of WSSJ Interceptors Programmatically ###
### Configure the Properties ###
### Run the Test ###
### Quiz 2: WS Security - Authentication ###

## Encryption and Decryption Concepts ##
### Confidentiality Introduction ###
### The Java Keytool ###
### Generate a Key Pair using the Keytool ###
### Export the Public Certificate ###
### Quiz 3: Encryption and Decryption Concepts  ###

## WS Security - Confidentiality (Encryption/ Decryption) ##
### Steps to Enable Encryption ###
### Creation of the Key Pairs ###
### Export the Public Keys ###
### Import the Certificates ###
### The Trustcacerts Flag ###
### Copy the Keystores to Projects ###
### Configure Encryption Action and Properties ###
### Creation of the Property File ###
### Update the PasswordCallbackHandler ###
### Add Decryption Action ###
### Creation of the Property File ###
### Update the PasswordCallbackHandler ###
### Test Encryption and Decryption ###
### Enable Encryption on the Server ###
### Enable Decryption on the Client ###

## WS Security - Integrity (Signatures) ##
### What are Signatures? ###
### Configure Signature on the Client ###
### Run the Test and Verify the Signature ###
### Configure to Check for Signature on the Server ###
### Sign the Message on the Server ###
### Verify the Signature on the Client ###
### Quiz 4: Integrity ###

## WS Security - Non Repudiation (Timestamp) ##
### What is Timestamp? ###
### Enable Timestamp on the Client and Provider ###
### Run a Test ###
### Time to Live ###
### Quiz 5: Timestamp ###

## Securing Parts of the Message ##
### Introduction ###
### Encrypt the Signature Part on the Client ###
### Enrrypt the Signature Part on the Provider and Test ###
### use Timestamp Part in the Signature ###
### Download the Complicated Projects ###

## Implement OAuth 2 Security for REST Using Spring Boot ##
### OAUTH Concepts ###
### OAUTH in REST ###
### What are you going to create? ###
### Install Spring Tool Suite ###
### Configure JDK in STS ###
### Install Postman ###

## Creation of Spring Boot REST Application ##
### Completed Project for Your Reference ###
### Creation of REST Project ###
### Creation of the Controllers ###
### Run the Application ###

## Loading Users and Roles ##
### Creation of the User and Role Entities ###
### Mark Entities with JPA Annotations ###
### Define the JPA Relationships ###
### Implement the GrantAuthority Interface ###
### Creation of the UserRepository ###

## Creation of the Authorization Server and Resource Server ##
### Creation of the WebSecurityConfiguration ###
### Creation and User of the UserDetailsService ###
### Expose the AuthenticationManager Bean ###
### Creation of the AuthorizationServerConfiguration ###
### Configure the Services ###
### Creation and Exposure of the TokenServices Bean ###
### Configure the ResourceId ###
### Creation of the ResourceServerConfiguration ###
### Map the Roles to REST URIs ###
### Change the Spring Security Filter Order ###
### Some Refactoring ###

## Test the Application ##
### Creaetion of Users and Roles ###
### Launch the Application ###
### Authenticate and Receive the Token ###
### Access the REST Endpoints ###
### Debug and Step Through the Application ###

## Swagger Quick Start ##
### Introduction ###
### CXF Swagger Feature ###
### Swagger Java Annotations ###
### Download and Import the Project ###
### Step 1 - Add Maven Dependency ###
### Step 2 - Configure the Swagger CXF Feature ###
### Step 3 - Use the Swagger API ###
### Swagger in Action ###
### Enable Swagger UI ###
### CRUD Using Swagger UI ###

## Wrap Up ##
### Discounts on my Other Courses ###