# Java Docs #
## Core Libraries ##
1. Consists of classes used by many portions of JDK
2. Include functionality close to VM (not explicitly included in other areas - security)

## Topics ##
### Serialization Filtering ###
1. We can use it to help prevent deserialization vulnerabilities
	1. Filter types
		1. Pattern based filters
		2. Custom filters
#### Topics ####
##### Addressing Deserialization Vulnerabilities #####
1. If an application accepts untrusted data and deserializes it - it is vulnerable to attacks
	1. Solution:
		1. Filters can be constructed to screen incoming streams of serialized objects before deserialization
2. Serialization: Convertion of object to byte stream
	1. Stream can be sent to
		1. File
		2. Database
		3. Network
	2. Java object is serializable if its class or superclass implements
		1. `java.io.Serializable` interface
		2. `java.io.Externalizable` sub-interface
	3. Where is Serialization used?
		1. In JDK
			1. Remote Method Invocation (RMI)
			2. Custom RMI for IPC (Interprocess Communication) protocols (Spring HTTP Invoker)
			3. Java Management Extensions (JMX)
			4. Java Messaging Service (JMS)
3. Deserialization:
	1. Convertion of serialized form to copy of object
	2. **Security of this conversion is important**
		1. Deserialization involves code execution
			1. `readObject` method of class being deserialized can contain custom code
				1. Serializable classes ("gadget classes") can do arbitrary reflective actions - construction of classes and invocation of methods on the classes
					1. If application deserializes the classes, they can cause
						1. DoS (Denial of Service)
						2. Remote code execution
	3. Solution: Filters
		1. Used to specify which classes are acceptable to application and which should be rejected
		2. We can control object graph size and complexity during deserialization
			1. Object graph may not exceed reasonable limits
		3. Implementation:
			1. Configured as properties
			2. Implemented programmatically
	4. Other Solutions:
		1. Do not deserialize untrusted data
		2. Use SSL to encrypt and authenticate the connections between applications
		3. Validate field values before assignment
			1. Checking object invariants by using `readObject` method
	5. NOTE:
		1. Built-in-filters are provided for RMI
			1. They are starting points only
				1. Configure blacklists
				2. Extend whitelist to add additional protection for application that uses RMI
					1. [Built-in Filters](https://docs.oracle.com/en/java/javase/13/core/serialization-filtering1.html#GUID-80AD4DA1-6AA3-42C0-8172-DECF8FB8A841)
		2. [Secure Coding Guidelines for Java SE](http://www.oracle.com/technetwork/java/seccodeguide-139067.html) - Other strategies

##### Java Serialization Filters #####
##### Whitelists and Blacklists #####
##### Creation of Pattern-Based Filters #####
##### Creation of Custom Filters #####
##### Built-in Filters #####
##### Logging Filter Actions #####

### Enhanced Deprecation ###
### XML Catalog API ###
### Creation of Unmodifiable List, Sets, and Maps ###
### Process API ###
### Preferences API ###
### Java Logging Overview ###

## Other Core Libraries Guides ##
### Internationalization Overview in Java Platform, Standard Edition Internationalization Guide ###

## Security Related Topics ##
### Serialization Filtering ###
### RMI ###
#### RMI Security Recommendations in Java Platform ####

### JAXP ###
#### JAXP Processing Limits in Java Tutorials ####
#### External Access Restriction Properties in Java Tutorials ####