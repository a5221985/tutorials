# XML Tutorial Videos #
## Introduction to XML/WebServices ##
1. WebServices vs WebApplication
	1. WebServices
		1. Way of communicating or technology which allows us to develop interoperable distributed applications
			1. Interoperability: Platform independent and language independent distributed applications
				1. Need: 
					1. BankApp -> PaymentGateway Service (Java App say)
					2. OnlineShopping App (Snapdeal) (.Net App say) -Request-> PaymentGateway Service -Response-> ...
					3. OnlineReservation App (IRCTC) (Java say) -Request-> PaymentGateway Service
					4. flipcart (php say)
				2. Webservice provides communication between applications of any languages and/or technologies
			2. Distributed application: It exposes objects over the network
				1. Payment Gateway services are exposed
				2. Exchanges data over network
		2. Only provides services to another application (not to the end user)
	2. Differences:
		1. Web-app:
			1. Server side application
			2. Communicates with end user directly (client - end user)
			3. Technologies:
				1. Servlets, JSP (Java)
				2. Asp (.Net)
	3. Distributed applications using Java
		1. Distributes APIs:
			1. Socket programming API
			2. CORBA
			3. RMI
			4. EJB
	4. WS-I: WebServices Interoperability: Webservices specification (common to virtually all programming languages and technologies)
		1. Open community which has software vendors as associated members
	5. Request and response are in XML
		1. XML: Interoperable language

## Java Distributed APIs and Need of Web Services ##
1. Distributed API (Drawbacks)
	1. SocketProgramming
	2. CORBA:
		1. Common Object Request Brocker Architecture (Givem by OMG - Object Management Group)
		2. Common to all programming languages (Interoperable distributed apps)
		3. Exposes language independent objects over the network
		4. Uses IDL (Interface Definition Language) - scripting language (Problem: difficult to learn)
			1. First this is written
			2. IDL file is given to CORBA compiler
			3. CORBA compiler generates language specific class
			4. Developer writes business logic in the language specific class
			5. Classes are deployed to CORBA server - which exposes language independent objects (MOM (Message Oriented Middleware) server)
				1. Expensive (problem)
		5. Advantages of Webservers
			1. Can be deployed on any server
			2. Not using scripting language
	3. RMI: By Sun
		1. Remote Method Invocation: Distributed API given by Sun microsystems
		2. Exposes language dependent objects over the network (problem)
		3. Open Source server
		4. By default coming with JDK software
		5. Developer works only with Java language (No IDL)
		6. Procedure:
			1. Business class is written with business logic
			2. Required middleware services (Security, Transactions, logging ...)
			3. Business class is given to RMI compiler (why? No network spec config which are provided by RMI compiler)
			4. RMI compiler generates Stub (has network configurations and exposure configuration) and Skeleton
			5. RMI developer deploys business class and skeleton into RMI server (open source, comes with JDK) and exposes the objects
		8. Problems:
			1. Java app to Java app only
			2. Middleware services are not provided by RMI server
		9. Stub: (Webservices also has this)
			1. Two objects are running in JVM
				1. One object knows about another object (direct communication)
			2. If two objects are running in different JVMs
				1. JVM1 - obj1, JVM2 - obj2
				2. Client app, Server app
			3. For client objects to communicate with server objects, mediator objects are required - Stubs and Skeletons
				1. Skeleton: Server side helper object (resides in server system)
				2. Stub: Client side helper object (resides in client system but derived from server object)
					1. Client request is sent to stub
					2. Stub communicates with Skeleton on the network
					3. Skeleton sends request to object
					4. ...
			4. Stub and Skeleton are proxy objects
				1. It is not a real object
				2. It is working in place of real object
			5. Example: ATM is not a bank but working in place of Bank
		10. Webservice (SOAP) is also generating stub and skeleton (?)
	4. EJB
		1. Enterprise Java Beans
		2. Distributed API - to develop distributed apps (To overcome drawbacks of RMI)
			1. RMI: Not providing any middleware services for business objects
		3. Just write Java Class with required business logic
			1. Just deploy it in EJB container - exposes Java object as distributed object
			2. EJB container will provide middleware services
			3. App servers provide EJB containers - JBoss, WebLogic
		4. Problems:
			1. Exposes only language dependent objects over the network (Only Java apps can access them)
	5. Webservices:
		1. Language independent services over the network
		2. Given by WS-I (WebServices Interoperability) organization
			1. Gives WS specs
				1. In the form of BasicProfile documents
					1. BP - 1.0
					2. BP - 1.1
					3. BP - 1.2
					4. BP - 2.0
			2. Using Specs - Languages designed APIs
				1. Java Tech -> 
					1. JAXRPC API (SOAP)
					2. JAXWS API (SOAP)
					3. JAXRS API (RESTful)
			3. WS-I - two types of WebServices
				1. SOAP Based WS
				2. RESTful WS
		3. XML/WebServices
			1. JAXP - Java API for XML processing (Parser Softwares - DOM, SAX, STAX)
			2. JAXB - Java Architecture for XML Binding (to convert XML data into Java objects and Java objects into XML data)
			3. SAAJ - SOAP Attachment API for Java (to build XML based messages - Only for WebServices)
			4. JAXM - Java API for XML Messaging (to build XML based messages - only for WebServices)
			5. JAXRPC - Java API for XML Remote Procedure Call
			6. JAXWS - Java API for XML WebServices (Renaming of JAXRPC)
			7. JAXRS - Java API for XML RESTful Services

## Java Distributed API's Part-2 and XML/WebServices API's Introduction ##
## Introduction to XML Part-1 ##
1. XML - Extensable Markup Language
	1. Markup: Enclosing textual information between two tags

			<empName>Raja</empName>
			<empSalary>9000</empSalary>

		1. Opening tag and closing tag
	2. XML tags are user defined tags (functionality is defined by user)
		1. Tags can be extended as per the requirements
			1. HTML - tags are pre-defined
	3. Language: Consider client and server apps
		1. To exchange data, we can use XML (mediator between two apps of different languages and/or technologies) - language used by the two ends
2. Differences between XML and HTML
	1. XML:
		1. User defined tags
		2. XML tags functionality is user defined and extensible
		3. Case sensitive tags
		4. Used to describe data
		5. For every opening tag, we need a closing tag
		6. Given by W3C (Common language for any language or technology)
	2. HTML:
		1. Predefined tags
		2. tags functionality is predefined
		3. Case insensitive tags
		4. Used to display data
		5. Closing tags are optional
3. Version: 1.0
4. Uses
	1. Describe data
	2. XML documents can be maintained as text-base databases
	3. To transport data from one language app to another language app
5. Example:

		<employee>
			<empNo>1001</empNo>
			<empName>Rama</empName>
			<empSalary>9000</empSalary>
		</employee>

6. It is text based document with .xml extension
7. First statement: prologe (automatically generated by browser)
	1. Represents version of xml

## Introduction to XML Part-2 ##
1. Contents:
	1. Elements:
			
			<employee>
				<empNo>101</empNo>
				<name>rama</name>
				<salary>9000</salary>
			</employee>

		1. Opening tag to closing tag `<employee>...</employee>`
		2. Content
			1. Child elements
			2. Attributes
			3. TextData
			4. Mix of all
	2. Attributes
		1. Example:

				<employee empNo="101" name="rama">
				</employee>

			1. Used to give additional info about an element
			2. Attribute values must be enclosed with single quotes or double quotes
			3. Attribute names are unique for an element - duplicate attributes are not allowed in an element
			4. Attribute order is not important
	3. EntityReferences:
		1. Example:

				<person>
					<name>Rama</name>
					<age> the person's age is < 18 </age>
				</person>

			1. Special characters have specific meanings
				1. change `<` to `&lt;` - `lt` is entity reference
		2. 5 Predefined entity references
			1. `&lt;` - syntactically illegal
			2. `&gt;`
			3. `&amp;` - syntactaically illegal
			4. `&apos;`
			5. `&quot;`
		3. Custome entity references
			1. `copyright@naresh_it2016` - entity reference can be used instead of this (Using DTD)
2. XSD: Used to define document structure
	1. Well formed document: 
		1. It must begin with prologue
		2. Must maintain a unique root element
		3. Must maintain closing tags for all the opening tags
		4. All the xml elements must be written with proper case because xml elements are case sensitive
		5. All the attribute values can be enclosed with either single quotes or double quotes
		6. In the place of special characters, we can use entity references

## XSD Elements Part-1 ##
1. XSD: XML Schema Definition
	1. Used to define structure of XML document
		1. DTD is an old technique and it is not powerful
		2. XSD is new technique and it is very powerful
	2. Differences
		1. DTD:
			1. XML technique used to define structure of XML document
			2. Very few datatypes to define restrictions for data
			3. Does not allow own datatypes
			4. Only 3 cardinality operators (0-N, 1-N, 0/1, 1 only)
			5. Does not support namespace
		2. XSD:
			1. XML technique used to define structure of XML document
			2. Many datatypes to define restrictions for data
			3. Allows own datatypes
			4. Many cardinality constants (0-5, 5-10, 10-15, ...)
			5. Supports namespace
				1. Java
		
						package com.it.service;
						public class AccountService {

						}

						class Test {
							p.s.v.main(String[] args) {
								com.it.service.AccountService a; // fully qualified name - avoids ambiguity
							}
						}

						class Test {
							p.s.v.main(String[] args) {
								java.util.Date d1;
								java.sql.Date d2;
							}
						}

				2. XSD: Namespace - we use fully qualified name for elements
					1. DTD does not support namespaces
					2. Contains
						1. Element declarations
						2. Attribute declarations
						3. EntityReference declarations
					3. Datatypes of XSD:
						1. DTD: PCDATA
						2. XSD: Datatypes for elements and attributes
							1. Simple Types
								1. Builtin types (44)
									1. Primitive types (19)
										1. String
										2. boolean
										3. decimal
										4. float
										5. double
										6. duration
										7. datetime
										8. time
										9. date
										10. gYearMonth
										11. gYear
										12. gMonthday
										13. gDay
										14. gMonth
										15. hexbinary
										16. base64Binary
										17. anyURI
										18. QName
										19. NOTATION
									2. Derived types (25)
										1. normalizedString
										2. token
										3. language
										4. NMTOKEN
										5. NMTOKENS
										6. Name
										7. NCName
										8. ID
										9. IDREF
										10. IDREFS
										11. ENTITY
										12. ENTITIES
										14. integer
										15. nonPositiveInteger
										16. negativeInteger
										17. long
										18. int
										19. short
										20. byte
										21. nonNegativeInteger
										22. unsignedLong
										23. unsignedInt
										24. unsignedShort
										25. unsignedByte
										26. positiveInteger
								2. User derived types
									1. Atomic types
									2. Non atomic types
							2. Complex Types
								1. Empty
								2. Simple Content
								3. Complex Content
									1. Sequence
									2. Choice
									3. All

## XSD Elements Part-2 ##
1. XSD elements:
	1. Simple elements: only text data, no attributes, no child elements
		1. Example:

				<empNo>101</empNo>
			
	2. Complex elements: has child elements, attributes or both
		1. Example:

				<employee>
					<empNo>101</empNo>
					<name>raja</name>
				</employee>

		2. Ways to build complex elements
			1. Elements with text-data and attributes
			2. elements with child elements and/or attributes
			3. Elements with empty content and attributes
			4. Elements with mixed content and/or attributes
2. Simple element

		<element name="element-name" type="datatype">
		</element>

	1. Example:

			<element name="empNo" type="int"/>
			<element name="name" type="string"/>

3. Complex element: 2 ways
	1. with child elements

			<element name="element-name">
				<complexType>
					<sequence>
						<element name="child1" type="dt"/>
						<element name="child2" type="dt"/>
					</sequence>
				</complexType>
			</element>

		1. EMPTY
		2. Simple Content
		3. Complex Content
			1. sequence
			2. choice
			3. all
	2. Example:

			<element name="employee">
				<complexType>
					<sequence>
						<element name="empNo" type="int"/>
						<element name="name" type="string"/>
						<element name="salary" type="decimal"/>
					</sequence>
				</complexType>
			</element>

		1. XML:

				<employee>
					<empNo>101</empNo>
					<name>raja</name>
					<salary>9000</salary>
				</employee>

	3. Schema: root element

			<schema>
				<element name="employee">
					<complexType>
						<sequence>
							<element name="empNo" type="int"/>
							<element name="name" type="string"/>
							<element name="salary" type="decimal"/>
						</sequence>
					</complexType>
				</element>
			</schema>

## XSD Attributes ##
1. Attributes
	1. Syntax:

			<attribute name="attribute-name" type="attribute-type"/>

		1. Example:

				<complexType>
					<attribute name="courseId" type="int"/>
					<attribute name="courseName" type="string"/>
					<attribute name="courseFee" type="decimal"/>
				</complexType>

			1. XML

					<course courseId="101" courseName="java" courseFee="2000"/>

	2. Mandatory attributes or optional attributes

			<attribute name="courseId" type="int" use="required"/> <!-- default is optional -->

	3. Default values or fixed values

			<attribute name="courseName" type="string" default="java"/> <!-- possible to override -->

			<attribute name="courseFee" type="decimal" fixed="1000"/>

	4. Simple type element: Only text data

## User Derived Data Types in XSD ##
## XSD NameSpace Concepts ##
## Mapping XML Documents with XSD ##
## Restrictions in XSD - Part 1 ##
## Restrictions in XSD - Part 2 ##

## JAXP API Part-1 ##
## Steps to Build DOM Parser by Using JAXP API ##

## JAX-B (Java Architecture for XML Binding) ##

## SOAP Webservices Introduction ##
## JAX-WS API Introduction ##
## SOAP WebServices Components ##
## Restful Web Services | Introduction to Jersey Implementation ##
## Restful Web Services Application Development by Using Jersey ##