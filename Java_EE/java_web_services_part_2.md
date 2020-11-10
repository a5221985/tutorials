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

### Download the Completed Projects ###
1. [Download the Completed Projects](https://www.udemy.com/course/javawebservicespart2/learn/lecture/6389730#overview)

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
1. UsernameToken profile:
	1. First way to authenticate in SOAP based webservices
	2. Defines standard to pass in username and password inside the header
	3. Root element in ws security standard

			<wsse:Security>

		1. Goes inside SOAP header
		2. Username token:

				<wsse:Security>
					<wsse:UsernameToken>
						<wsse:Username>myuser</wsse:Username>
						<wsse:Password>mypwd</wsse:Password>
					</wsse:UsernameToken>
				</wsse:Security>

			1. UsernameToken: Action

### Steps to Configure Username Token Profile ###
1. Steps to Configure UT:
	1. Configure the intercetors in the cxf-servlet.xml
	2. Define a password callback handler (interceptors will call into where we pass the password information)

### Update the Maven Dependencies ###
1. Apache CXF
	1. `pom.xml` - dependencies

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

	2. maven > update project

### Configure User Name Token Profile ###
1. WEB-INF/cxf-servlet.xml

		<jaxws:server ...>
			...
			<jaxws:inInterceptors> <!-- uses wss4j in interceptor when SOAP message comes in -->
				<bean class="org.apache.cxf.ws.security.wss4j.WSS4JInInterceptor">
					<constructor-arg>
						<map>
							<entry key="action" value="UsernameToken"/>
							<entry key="passwordType" value="PasswordText"/>
							<entry key="passwordCallabackRef" value-ref="myPasswordCallback"/>
						</map>
					</constructor-arg>
				</bean>
			</jaxws:inInterceptors>
		</jaxws:server>

### Creation and Configuration of the PasswordCallbackHandler ###
1. `com.bharath.trainings.ws.PasswordCallbackHandler` implements `javax.security.auth.callback.CallbackHandler`

		Map<String, String> passwords = new HashMap<>();

		public PasswordCallbackHandler() {
			passwords.put("someuser", "sumpass");
		}

		@Override
		public void handle(Callback[] callbacks) throws IOException, UnsupportedCallbackException { // provides password information at runtime, it should give the password for the given userid that comes in request
			for(Callback callback: callback) {
				WSPasswordCallback pc = (WsPasswordCallback) callback;
				String password = passwords.get(pc.getIdentifier()); // user id that came in request
				pc.setPassword(password);
				return;
			}
		}

2. Spring bean in cxf-servlet.xml

		<bean id="myPasswordCallback" class="com.bharath.trainings.ws.PasswordCallbackHandler"/> <!-- this bean is called -->

### Run the Application on the Server ###
1. Maven clean
2. Maven install
3. Run as > Run on Server > Restart the server
4. Open the website
	1. Get the wsdl and open it

### Update Client Maven Dependencies ###
1. Add security dependencies:
	1. pom.xml - copy all those from server side pom
2. Right click and maven > Update project

### Retrieve the CXF Client Proxy ###
1. Get access to client side endpoint instance

		@Test
		public void calculateSumShouldReturnValidResult() {
			// ...
			Client client = ClientProxy.getClient(port); // returns runtime proxy
			Endpoint endpoint = client.getEndpoint(); // needed to add interceptors
			// ...
		}

### Creation of WSS4J Interceptors Programmatically ###
1. Define WSS4J out (on outgoing message, we want to include the username token profile information)

		HashMap<String, Object> outProps = new HashMap<>();
		WSS4JOutInterceptor wssOut = new WSS4JOutInterceptor(outProps); // On the client side, when SOAP message is sent to server, this interceptor is invoked

		endpoint.getOutInterceptors().add(wssOut); // invoked when soap message is sent to the server
		

### Configure the Properties ###
1. Test class

		outProps.put(WSHandlerConstants.ACTION, "UsernameToken");
		outProps.put(WSHandlerConstants.PASSWORD_TYPE, WSConstants.PW_TEXT);
		outProps.put(WSHandlerConstants.PW_CALLBACK_CLASS, PasswordCallbackHandler.class.getName());

	1. PasswordCallbackHandler.java is copied to test package (invoked just before message is sent to the server)

### Run the Test ###
1. One more property:

		...
		outProps.put(WSHandlerConstants.USER, "sumUser");
		...

2. Run as > JUnit Test
	1. Incoming request - Client project > Create New File > result.xml
		1. Username and Password are in the request

### Quiz 2: WS Security - Authentication ###

## Encryption and Decryption Concepts ##
### Confidentiality Introduction ###
1. Confidentiality:
	
		EMart -------> Bharath Bank Payment Gateway
		
			Pirates of the Weberian (should not have access to actual message)
			
	1. Mathematical procedure is used to convert text to garbled text and back
		1. Algorithm takes key as input + data to produce encrypted data
			1. Even if algorithm is known, key is secret
2. Two types
	1. Symmetric encryption
		1. single key is used by both
			1. AES
			2. Blowfish
		2. Cons: If there are multiple users, a private key needs to be maintained per user (expensive)
	2. Asymmetric encryption (public key)
		1. public & private keys are generated (one pair on either side)
			1. Only server side can be used
		2. public key is used to encrypt
			1. Shared with public
		3. private key is used to decrypt
			1. Even if public key is known, private key is required to do the decryption
		4. Examples: RSA

### The Java Keytool ###
1. Keytool
	1. Key and certificate management utility
		1. keystore - public & private key are stored
			1. password protected
		2. For each private key we give an alias (username) and password
			1. To access private key, we provide alias and password
		3. public key can be exported into a certificate
		4. certificate can be distributed accross applications
			1. User can use public key and enrypt
			2. Signature: public key is used to verify if signature is from the user

### Generate a Key Pair using the Keytool ###
1. `keytool` - gives options
	1. jdk../bin path must be in PATH
2. Folder: `tempcerts`
	1. Get info an path
	2. `keytool`
		1. GOogle for java keytool (oracle docs is good)
		2. `keytool -genkeypair -alias mykey -keypass mykeypass -keystore mykeystore.jks -storepass mystorepass -validity 100 -dname "cn=bharath Thippireccy,ou=ws,o=Bharath Inc,c=US"` (days)
			1. `-dname` user friendly readable info that will be displayed in browser or by other tools
			2. `cn` - common name
			3. `ou` - organization unit
			4. `o` - organization
			5. `c` - country
3. `mykeystore.jks` file is generated

### Export the Public Certificate ###
1. `keytool -export -rfc -keystore mykeystore.jks -storepass mystorepass -alias mykey -file MyCert.cer`
	1. `rfc` - character stream (readable and not binary)
		1. It can be imported into server keystore (the above is client's keystore)

### Quiz 3: Encryption and Decryption Concepts  ###

## WS Security - Confidentiality (Encryption/ Decryption) ##
### Steps to Enable Encryption ###
1. Steps: Encryption and decryption
	1. Add enryption action and properties (wss 4j interceptors need)
	2. Creation of property file which has key store info
	3. Update the PasswordCallback (using new username and password)

### Creation of the Key Pairs ###
1. This step is required for both client side and service side
2. Steps for creation of keys:
	1. Generate the key pairs for the provider and client (private and public keys)
	2. Export the public keys in to certificate files
	3. Import the certificates in to alternate keystores
		1. Public key of provider into client keystore
		2. Public key of client into provider keystore
			1. provider encrypts using public key of client
			2. client decrypts using it's own private key
			3. ...
3. New folder
	1. `certs`
		1. Go to the folder
		2. `keytool -genkey -keyalg RSA -sigalg SHA1withRSA -validity 600 -alias myservicekey -keypass skpass -storepass sspass -keystore serviceKeystore.jks -dname "cn=Bharath"`
			1. Server side keystore
		3. `keytool -genkey -keyalg RSA -sigalg SHA1withRSA -validity 600 -alias myclientkey -keypass ckpass -storepass cspass -keystore clientKeystore.jks -dname "cn=Bharath"`

### Export the Public Keys ###
1. `keytool -export -rfc -keystore clientKeystore.jks -storepass cspass -alias myclientkey -file MyClient.cer`
2. `keytool -export -rfc -keystore serviceKeystore.jks -storepass sspass -alias myservicekey -file MyService.cer`

### Import the Certificates ###
1. `keytool -import -trustcacerts -keystore serviceKeystore.jks -storepass sspass -alias myclientkey -file MyClient.cer -noprompt`
	1. Certificate gets added
2. `keytool -import -trustcacerts -keystore clientKeystore.jks -storepass cspass -alias myservicekey -file MyService.cer -noprompt`

### The Trustcacerts Flag ###
1. `-trustcacerts` - needed because they are self signed
	1. if not used, self signed certificates are rejected by keytool
	2. flag tells - this certificate must be considered as a chain for certificates in `cacerts` of JDK (?)
		1. `cacerts` has verisign signed certificates
			1. Keytool checks cacerts which can be trusted and hence the import works

### Copy the Keystores to Projects ###
1. Certificates can be deleted (keystores already have them)
2. Project:
	1. src/main/resources/keystore
		1. paste server side keystore
	2. src/main/resources/keystore
		1. paste client side keystore

### Configure Encryption Action and Properties ###
1. SumWSTest.java

		outProps.put(WSHandlerConstants.ACTION, "UsernameToken Encrypt");
		...
		outProps.put(WSHandlerConstants.ENCRYPTION_USER, "myservicekey"); // interceptor is used to retrieve the server's public key from keystore
		outProps.put(WSHandlerConstants.ENC_PROP_FILE, "etc/clientKeyStore.properties"); // keystore info is stored here

### Creation of the Property File ###
1. src/main/resources/etc/clientKeyStore.properties (editable text configuration) - client side

		org.apache.ws.security.crypto.merlin.keystore.file=keystore/clientKeystore.jks
		org.apache.ws.security.crypto.merlin.keystore.password=cspass
		org.apache.ws.security.crypto.merlin.keystore.type=jks
		org.apache.ws.security.crypto.merlin.keystore.alias=myclientkey # used to retrieve private key of client
		
2. More properties: wss4j configuration (in Google)

### Update the PasswordCallbackHandler ###
1. PasswordCallbackHandler.java - on client side

		public PasswordCallbackHandler() {
			...
			passwords.put("myclientkey", "ckpass");
		}

### Add Decryption Action ###
1. On server side
2. sumws project
	1. cxf-servlet.xml

			<bean ...>
				<constructor-arg>
					<map>
						<entry key="action" value="UsernameToken Encrypt"/>
						...
						<entry key="decryptionPropFile" value="etc/serviceKeystore.properties"/>
						...

### Creation of the Property File ###
1. Copy folder `etc` from client project and paste it under src/main/resources
2. Rename it to serviceKeystore.properties

		org.apache.ws.security.crypto.merlin.keystore.file=keystore/serviceKeystore.jks
		org.apache.ws.security.crypto.merlin.keystore.password= sspass
		org.apache.ws.security.crypto.merlin.keystore.type=jks
		org.apache.ws.security.crypto.merlin.keystore.alias= myservicekey

### Update the PasswordCallbackHandler ###
1. Set password: PasswordCallbackHandler.java

		public PasswordCallbackHandler() {
			...
			passwords.put("myservicekey", "skpass");
		} 

### Test Encryption and Decryption ###
1. Run as maven install
2. Right click on sumws -> Run as > Run on server
	1. Launches default link
	2. Paste the link in browser
3. Run SumWsTest (client)
	1. Encrypts body of SOAP message
4. Go to Tomcat console
	1. Check inbound message
		1. Cypher value
		2. Key information

### What just happened? ###
1. Interceptor uses encryption user to fetch public key (using properties)
2. public key is used to encrypt
3. On server side ation Encrypt also does decryption
4. On server side, decryption
	1. Uses password to open keystore
	2. Gets private key and decrypts

### Enable Encryption on the Server ###
1. Same steps as in client
2. cxf-servlet.xml

		<jaxws:outInterceptors>
			<bean class="org.apache.cxf.ws.security.wss4j.WSS4JOutInterceptor">
				<constructor-arg>
					<map>
						<entry key="action" value="Encrypt"/>
						<entry key="passwordType" value="PasswordText"/>
						<entry key="passwordCallbackRef" value="myPasswordCallback"/> <!-- for keystore password info -->
						<entry key="encryptionProperties" value="etc/serviceKeystore.properties"/>
						<entry key="encryptionUser" value="myClientKey"/> <!-- client alias because we need public key of client -->
					</map>
				</constructor-arg>
			</bean>
		</jaxws:outInterceptors>

### Enable Decryption on the Client ###
1. Run server side application:
	1. `mvn install`
	2. Run as > Run on server
2. Run junit test on client SumWSTest
	1. Fails - client is not decrypting
3. Class (client)

		calculateSumShouldReturnAValidResult() {
			...
			
			HashMap<String, Object> inProps = new HashMap<>();
			inProps.put(WSHandlerConstants.ACTION, "Encrypt");
			inProps.put(WSHandlerConstants.DEC_PROP_FILE, "etc/clientKeyStore.properties");
			inProps.put(WSHandlerConstants.PW_CALLBACK_CLASS, PasswordCallbackHandler.class.getName()); // password is used to open keystore for private key
			
			WSS4JInInterceptor wssIn = new WSS4JInterceptor(inProps);
			
			endpoint.getInInterceptors().add(wssIn);
			
	1. Re-run test: It should pass

## WS Security - Integrity (Signatures) ##
### What are Signatures? ###
1. Integrity - 
	1. Data is not tampered on the way - done using signatures
		1. Fixed length value obtained from message by applying an algorithm on it
			1. Private key is used
				1. It calculated Hash - sent along with message

### Configure Signature on the Client ###
1. Steps:
	1. Add the action and properties
2. SumWsTest.java

		outProps.put(WSHandlerConstants.ACTION, "UsernameToken Encryption Signature");
		...
		outProps.put(WSHandlerConstants.SIGNATURE_USER, "myclientkey"); // private key is used
		outProps.put(WSHandlerConstants.SIG_PROP_FILE, "etc/clientKeyStore.properties"); // different store can be used than the one for encryption

### Run the Test and Verify the Signature ###
1. Server side:
2. cxf-servlet.xml

		<jaxws:inInterceptors>
			...
			<constructor-arg>
				<map>
					<entry key="action" value="UsernameToken Encrypt Signature"/>
					...
					<entry key="signaturePropFile" value="etc/serviceKeystore.properties"/>
				</map>
			</constructor-arg>
			...
		</jaxws:inInterceptors>

### Configure to Check for Signature on the Server ###
1. Right click on server: Restart
2. SumWsTest.java - Run the test
3. Go to tomcat console
	1. Open payload

			<wsse:Security
				...
				<ds:SignedInfo>
					...
					<ds:SignatureValue>signature</ds:SignatureValue>
					<ds:KeyInfo ...>

### Sign the Message on the Server ###
1. cxf-servlet.xml

		<jaxws:outInterceptor>
			...
			<entry key="action" value="Enrypt Signature"/>
			...
			<entry key="signaturePropFile" value="etc/serviceKeystore.properties"/>
			<entry key="signatureUser" value="myservicekey"/>

### Verify the Signature on the Client ###
1. SumWsTest.java

		inProps.put(WSHandlerConstants.ACTION, "Encrypt Signature");
		...
		inProps.put(WSHandlerConstants.SIG_PROP_FILE", "etc/clientKeyStore.properties"); // public key of server is pulled from here
2. Run the JUnit test
3. Copy outbound message	

### Quiz 4: Integrity ###

## WS Security - Non Repudiation (Timestamp) ##
### What is Timestamp? ###
1. Replay attack -
	1. Hacker gets hold of message
	2. Hacker replays as many times as he wants (used to crash)
2. Solution:
	1. Using timestamp in `<wsse:Security>`

			<wsse:Security>
				<wsu:Timestamp>
					<wsu:Created>2017-01-12T10:02:24.547Z</wsu:Created>
					<wsu:Expires>2017-01-12T10:02:54.547Z</wsu:Expires> <!-- Time to live is 30 seconds -->
				</wsu:Timestamp>
			</wsse:Security>
			
		1. If server receives the message after it is expired, server rejects it

### Enable Timestamp on the Client and Provider ###
1. SumWsTest.java (client side)

		outProps.put(..ACTION, "UsernamToken ... Timestamp");
		...
		inProps.put(..ACTION, "... Timestamp"); // for incoming messages
		
2. cxf-servlet.xml (server side)

		<jaxws:inInterceptors>
			...
			<entry key="action" value="... Timestamp"/>
			
		<jaxws:outInterceptors>
			...
			<entry key="action" value="... Timestamp"/> <!-- for protection of client -->

### Run a Test ###
1. Start the server
2. Run SumWsTest.java
	1. Switch to tomcat console
	2. Copy inbound soap message

			<wsse:Security>
				...
				<wsu:Timestamp ...>
					...

### Time to Live ###
1. SumWsTest.java

		outProps.put("timeToLive", "30"); // 30 seconds
		
	1. Run the test
		1. Copy the inbound message

### Quiz 5: Timestamp ###

## Securing Parts of the Message ##
### Introduction ###
1. Encryption and signature by default is done on SOAP body
2. Signature value is based on SOAP body only
	1. It can be tampered so that message is lost (mischief)

### Encrypt the Signature Part on the Client ###
1. SumWsTest.java

		outProps.put(WSHandlerConstants.ACTION, "UsernameToken Signature Encrypt Timestamp"); // switch Signature and Encrypt
		...
		outProps.put(WSHandlerConstants.ENCRYPTION_PARTS, "{Element}{http://www.w3.org/2000/09/xmldsig#}Signature;{Content}{http://schemas.xmlsoap.org/soap/envelope/}Body"); // which parts we want encrypted, seach of soap in soap:Body
		
	1. `Element`: an element
	2. `Content`: only content of element
	3. We have to provide complete namespace
	4. Only the items explicitly mentioned are encrypted (no default)

### Encrypt the Signature Part on the Provider and Test ###
1. Service side
2. cxf-servlet.xml

		<jaxws:outInterceptors>
			...
			<entry key="action" value="Signature Encrypt Timestamp"/>
			...
			<entry key="encryptionParts" value="{Element}{http://www.w3.org/2000/09/xmldsig#}Signature;{Content}{http://schemas.xmlsoap.org/soap/envelope/}Body"/>
			
	1. Restart server
3. Run `SumWsTest.java`
4. Go to Tomcat console: Check inbound and outbound messages
	1. Signature element is replaced with CipherValues
		1. For body <soap:Body ...> exists (only content is encrypted) 

### use Timestamp Part in the Signature ###
1. Signature signs body by default
2. Including timestamp (hacker can change the timestamp) - signing it will validate it
3. SumWsTest.java

		outProps.put(WSHandlerConstants.SIGNATURE_PARTS, "UsernameToken Timestamp Signature Encrypt"); // Order matters. Operations are applied in the order specified
		...
		outProps.put(WSHandlerConstants.SIGNATURE_PARTS, "{Element}{<wsu-namespace>}Timestamp;{Element}{<soap-namespace>}Body");
		
4. cxf-servlet.xml

		<jaxws:outInterceptors>
			...
			<entry key="signatureParts" value="Timestamp Signature Encrypt"/> <!-- Order matters! -->
			...
			<entry key="signatureParts" value="{Element}{<wsu-namespace>}Timestamp;{Element}{<soap-namespace>}Body"/>
			
5. Restart server
6. Run the test

## Implement OAuth 2 Security for REST Using Spring Boot ##
### OAUTH Concepts ###
1. Concepts:
	1. Java Web Services Part I - concepts are explained
		1. Why and when to and not to use oauth
		2. **Google oauth playground**

### OAUTH in REST ###
1. 

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
### Creation of Users and Roles ###
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