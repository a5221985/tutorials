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


### Assignment ###
### Flow and the Service Provider Mechanism ###
### Section Summary ###

