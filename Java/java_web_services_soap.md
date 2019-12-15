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
### Import the Legacy Project ###
### Mark the Beans with JAXB Annotations ###
### Mark the Endpoint with JAX-WS Annotations ###
### Publish the Endpoint ###
### Run the Application ###
### Test Using SoapUI ###
### SOAPUI Assignment ###
### Section Summary ###

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
