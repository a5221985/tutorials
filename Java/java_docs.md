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
		1. `java.io.Serializable`
		2. `java.io.Externalizable`

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