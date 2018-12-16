# Java XML #
## Java XML Tutorial ##
### Java XML Home ###
1. XML (Extensible Markup Language) is text based language generally used for communication between different apps
	1. Standard means to transport and store data
2. Java has rich set of libraries to parse, modify or inquire XML docs
3. Topics
	1. Basic XML concepts
	2. Usage of Java based XML parsers
4. Pre-requisites
	1. Basic concepts

### Java XML Overview ###
#### What is XML? ####
1. It is text based language designed to store and transport data in plain text format
2. Salient features
	1. XML is a markup language
	2. XML is tag based language like HTML
	3. XML tags are not predefined like HTML
	4. We can define own tags (extensible)
	5. XML tags are self-descriptive
	6. XML is W3C reccomendation for data storage and data transfer
3. Example:

		<?xml version="1.0"?>
		<Class>
			<Name>First</Name>
			<Sections>
				<Section>
					<Name>A</Name>
					<Students>
						<Student>Rohan</Student>
						<Student>Mohan</Student>
						<Student>Sohan</Student>
						<Student>Lalit</Student>
						<Student>Vinay</Student>
					</Students>
				</Section>

				<Section>
					<Name>B</Name>
					<Students>
						<Student>Robert</Student>
						<Student>Julie</Student>
						<Student>Kalie</Student>
						<Student>Michael</Student>
					</Students>
				</Section>
			</Sections>
		</Class>

#### Advantages ####
1. **Technology agnostic**: It is plain text, technology independent
	1. Can be used by any technology for data storage
2. **Human readable**
3. **Extensible**: Custom tags can be created and used easily
4. **Allow Validation**: XSD, DTD validation

#### Disadvantages ####
1. **Redundant Syntax**: Usually contains lot of repititive terms
2. **Verbose**: file size increases transmission and storage costs

### Java XML Parsers ###
1. Parsing: Going through XML document to access or modify data

#### What is XML Parser? ####
1. Types of parsers commonly used to parse XML documents:
	1. **Dom Parser**: Parses by loading complete contents of document into complete hierarchical tree in memory
	2. **SAX Parser**: Parses XML document on event-based triggers
		1. Does not load complete document into memory
	3. **JDOM Parser**: Similar to DOM parser but in easier way
	4. **StAX Parser**: Similar to SAX parser but in more efficient way
	5. **XPath Parser**: Parsing based on expression and is usually used in conjunction with XSLT
	6. **DOM4J Parser**: Parse XML, XPath and XSLT using Java Collections framework
		1. Supports DOM, SAX and JAXP
	7. **JAXB** and **XSLT** APIs are available to handle XML parsing in object-oriented way

## Java DOM Parser ##
1. DOM is official recommendation of W3C
	1. Defines an interface that enables programs to access and update style, structure, and contents of XML docs
	2. XML parsers that support DOM implement the interface

#### When to Use? ####
1. Need to know a log about the structure of the document
2. Need to move parts of XML document around
	1. Sorting certain elements
	2. ...
3. Need to use information in XML document more than once

#### What You Get? ####
1. A tree structure that contains all elements of your document. DOM has functions which can be used to examine contents and structure of document.

#### Advantages ####
1. Java code written for one DOM-compliant parser should run on any other DOM-compliant parser without having to do any modifications

#### DOM Interfaces ####
1. Different DOM interfaces:
	1. Node: base datatype of DOM
	2. Element: Vast majority of objects
	3. Attr: Represents attribute of element
	4. Text: Actual content of element or attr
	5. Document: Represents entire XML document
		1. Referred to as DOM tree

#### Common DOM Methods ####
1. Methods:
	1. **Document.getDocumentElement()** - Returns root element of document
	2. **Node.getFirstChild()** - Returns first child of given Node
	3. **Node.getLastChild()** - Returns last child of given Node
	4. **Node.getPreviousSibling()** - Methods return previous sibling of given Node
	5. **Node.getAttribute(attrName)** - For given node, returns attribute with requested name

### Java DOM Parser ###
### Parse XML Document ###
#### Steps to Using JDOM ####
1. Steps
	1. Import XML-related packages
	2. Construct a SAXBuilder
	3. Construct a Document from a file or stream
	4. Extract the root element
	5. Examine attributes
	6. Examine sub-elements

##### Import XML-related packages #####

		import org.w3c.dom.*;
		import javax.xml.parsers.*;
		import java.io.*;

##### Creation of a DocumentBuilder #####

		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();

##### Creation of a Document from a file or stream #####

		StringBuilder xmlStringBuilder = new StringBuilder();
		xmlStringBuilder.append("<?xml version="

##### Extract the root element #####
##### Examine attributes #####
##### Examine sub-elements #####
#### Demo Example ####
##### DomParserDemo.java #####

### Query XML Document ###
### Create XML Document ###
### Modify XML Document ###

## Java SAX Parser ##
### Java SAX Parser ###
### Parse XML Document ###
### Query XML Document ###
### Create XML Document ###
### Modify XML Document ###

## JDOM XML Parser ##
### JDOM XML Parser ###
### Parse XML Document ###
### Query XML Document ###
### Create XML Document ###
### Modify XML Document ###

## Java StAX Parser ##
### Java StAX Parser ###
### Parse XML Document ###
### Query XML Document ###
### Create XML Document ###
### Modify XML Document ###

## Java XPath Parser ##
### Java XPath Parser ###
### Parse XML Document ###
### Query XML Document ###
### Create XML Document ###
### Modify XML Document ###

## Java DOM4J Parser ##
### Java DOM4J Parser ###
### Parse XML Document ###
### Query XML Document ###
### Create XML Document ###
### Modify XML Document ###

## Java XML Useful Resources ##
### Java XML - Questions and Answers ###
### Java XML - Quick Guide ###
### Java XML - Useful Resources ###
### Java XML - Discussion ###