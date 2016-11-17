# Hibernate Tutorial #
## Introduction ##
1. Hibernate is a high performance Object/Relational persistence and query service
2. It is open source GNU Lesser General Public License (LGPL) licensed
3. Hibernate maps Java classes to db tables and from Java data types to SQL data types
4. Hibernate provides data query and retrieval facilities
5. Tutorial:
	1. Teaches how to develop db based web apps using Hibernate

### Audience ###
1. Java programmers who want to reach moderate level of expertise in Hibernate

### Prerequisites ###
1. Java
2. Relational db
3. JDBC
4. SQL

## ORM - Overview ##

### What is ORM? ###
1. Object Relational Mapping (ORM) - programming technique for converting dat a between relational db and object oriented programming languages
2. Advantages:
	1. Allows business code to access objects instead of DB tables
	2. Hides SQL queries from OO logic
	3. It is based on JDBC (under the hood)
	4. We don't have to deal with db implementation
	5. Entities are based on business concepts rather than db structure
	6. Transaction management, automatic key generation
	7. Fast development of app
3. 4 entities in ORM solution
	1. API to perform CRUD operations on objects of persistent classes
	2. API to specify queries referring to classes and properties of classes
	3. Configurable facility to specify mapping metadata
	4. Technique to interact with transactional objects for
		1. Dirty checking
		2. Lazy association fetching
		3. Optimization functions

### ORM Frameworks ###
1. Persistent Framework: It is an ORM service that stores and retrieves objects into RDB
2. Persistent frameworks:
	1. Enterprise JavaBeans Entity Beans
	2. Java Data Objects
	3. Castor
	4. TopLink
	5. Spring DAO
	6. Hibernate
	7. ...

## Hibernate - Overview ##

### Description ###
1. Hibernate is ORM solution for Java
2. Programmed by Gavin King in 2001
3. It is powerful, high performance OR Persistence and Query service for Java
4. Maps Java classes to db tables
5. Maps Java data types to SQL data types
6. Reduces 95% of data persistence related tasks for programmers

![hibernate_position](hibernate_position.jpg)

### Advantages ###
1. Uses XML to map Java classes to db tables without any code (?)
2. Provides API to store and retrieve objects into and from DB
3. If there are db changes, then update only the XML file properties
4. Additional app server is not required to operate Hibernate
5. Manipulates complex associations of objects of DB
6. Minimizes db access with smart fetching strategies
7. Simple querying for data

### Databases Supported ###
1. List of a few
	1. HSQL Database Engine
	2. DB2/NT
	3. MySQL
	4. PostgreSQL
	5. FrontBase
	6. Oracle
	7. Microsoft SQL Server Database
	8. Sybase SQL Server
	9. Informix Dynamic Server

### Supported Technologies ###
1. XDoclet Spring
2. J2EE
3. Eclipse plug-ins
4. Maven

## Hibernate - Architecture ##
### Description ###
1. Layered to isolate programmer from underlying APIs
2. Uses DB and configuration data to provide persistence services

3. High level view of Hibernate Architecture

![hibernate_high_level](hibernate_high_level.jpg)

4. Detailed overview of Hibernate Application Architecture with important core classes

![hibernate_architecture](hibernate_architecture.jpg)

	
	1. Hibernate uses the following existing API
		1. JDBC
			1. Rudimentary level of abstraction.
			2. Any db with JDBC driver is supported by Hibernate
		2. Java Transaction API (JTA)
			1. Lets Hibernate integrate with J2EE app servers
		3. Java Naming and Directory Interface (JNDI)
			1. Lets Hibernate integrate with J2EE app servers

### Configuration Object ###
1. Firt Hibernate object created in an app
2. Usually created only once during app initialization.
3. It represents properties file of hibernate
4. Key components provided
	1. **Database Connection**
		1. Handled using configuration files such as **hibernate.properties** and **hibernate.cfg.xml**
	3. **Class Mapping Setup**
		1. For connecting Java classes to db tables

### SessionFactory Object ###
1. `Configuration` object is used for creation of `SessionFactory` object
2. `SessionFactory` object 
	1. Configures Hibernate using app configuration file 
	2. Used for instantiating `Session` object
3. It is a thread safe object and can be used by multiple threads of an action
4. It is a heavy weight object
	1. It is better created during app startup and kept for later use
5. One `SessionFactory` object must be created per db (using its own configuration file)

### Session Object ###
1. It is used to get physical connection with db
2. It is lightweight
	1. Instantiated each time interaction with db is required
3. Persistent objects are saved and retrieved using `Session` object
4. These objects are not thread safe so do not keep them for a long time
5. They are created only when needed and  then destroyed

### Transaction Object ###
1. It is a single unit of work on db (most RDBMS support transaction)
2. Transactions in Hibernate are handled by underlying transaction manager and transaction (JDBC or JTA)
3. This object is optional (apps may manage transactions on their own instead)

### Query Object ###
1. `Query` objects use SQL or Hibernate Query Language (HQL) strings to retrieve data from db and for creation of objects
2. It can be used to 
	1. Bind query parameters
	2. Limit number of results returned
	3. Execute query

### Criteria Object ###
1. Used for creation and execution of object oriented criteria queries (?) for retrieving objects

## Hibernate - Environment ##
1. How to install Hibernate + associated packages for preparing dev environment
2. MySQL db is used
	1. Install from *.dpg

### Download Hibernate ###
1. Pre-requisites: Java
2. Steps:
	1. Download *.tz file for Unix or *.zip file for Windows from [http://www.hibernate.org/downloads](http://www.hibernate.org/downloads)
	2. Extract the archive

### Installing Hibernate ###
1. Copy all library files from `/lib` into `CLASSPATH`
2. Change `CLASSPATH` variable to include all JARs
3. Copy `hibernate3.jar` file into `CLASSPATH` from root directory of the installation (this is a primary jar)

### Hibernate Prerequisites ###
1. Packages needed before starting to use Hibernate.
2. Copy the following library files from `/lib` to `CLASSPATH`
	1. **dom4j**: XML parsing [www.dom4j.org](www.dom4j.org)
	2. **Xalan**: XSLT Processor [http://xml.apache.org/xalan-j/](http://xml.apache.org/xalan-j/)
	3. **Xerces**: The Xerces Java Parser [http://xml.apache.org/xerces-j/](http://xml.apache.org/xerces-j/)
	4. **cglib**: Appropriate changes to Java classes at runtime [http://cglib.sourceforge.net](http://cglib.sourceforge.net)
	5. **log4j**: Logging Framework [http://logging.apache.org/log4j](http://logging.apache.org/log4j)
	6. **Commons**: Logging, Email etc. [http://jakarta.apache.org/commons](http://jakarta.apache.org/commons)
	7. **SLF4J**: Logging Facade for Java [http://www.slf4j.org](http://www.slf4j.org)

## Hibernate - Configuration ##
1. We need to define mapping information of Java classes to database tables in advance for Hibernate
2. Configuration settings related to db
	1. `hibernate.properties`: standard Java properties file OR
	2. `hibernate.cfg.xml`: XML file
3. Most properties take default values
4. Keep the properties file in the root directory

### Hibernate Properties ###
1. Important properties
	1. `hibernate.dialect`: lets hibernate generate appropriate SQL for the chosen db
	2. `hibernate.connection.driver_class`: JDBC driver class
	3. `hibernate.connection.url`: JDBC URL to db instance
	4. `hibernate.connection.username`: db username
	5. `hibernate.connection.password`: db password
	6. `hibernate.connection.pool_size`: Limits number of connections waiting in Hibernate db connection pool
	7. `hibernate.connection.autocommit`: allows autocommit mode to be used for JDBC connection
2. If DB is used with an app server and JNDI, configure the following:
	1. `hibernate.connection.datasource`: JNDI name defined in app server context used for the app
	2. `hibernate.jndi.class`: InitialContext class for JNDI
	3. `hibernate.jndi.<JNDIpropertyname>`: Any JNDI property for JNDI IntialContext (?)
	4. `hibernate.jndi.url`: URL for JNDI
	5. `hibernate.connection.username`: db username
	6. `hibernate.connection.password`: db password

### Hibernate with MySQL Database ###
1. Creation of **hibernate.cfg.xml**
	1. **testdb**: database in MySQL
	2. **test**: user who can access **testdb**
2. **hibernate.cfg.xml**

		<?xml version="1.0" encoding="UTF-8"?>
		<!DOCTYPE hibernate-configuration SYSTEM "http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd">
		<hibernate-configuration>
			<session-factory>
				<property name="hibernate.dialect">
					org.hibernate.dialect.MySQLDialect
				</property>
				<property name="hibernate.connection.driver_class">
					com.mysql.jdbc.Driver
				</property>

				<!-- Assume test is the database name -->
				<property name="hibernate.connection.url">
					jdbc:mysql://localhost/test
				</property>
				<property name="hibernate.connection.username">
					root
				</property>
				<property name="hibernate.connection.password">
					password
				</property>

				<!-- List of XML mapping files -->
				<mapping resource="Employee.hbm.xml"/>
			</session-factory>
		</hibernate-configuration>

	1. `<mapping>`: hibernate mapping file
3. Database dielects:
	1. DB2: `org.hibernate.dialecct.DB2Dialect`
	2. HSQLDB: `org.hibernate.dialect.HSQLDialect`
	3. HypersonicSQL: `org.hibernate.dialect.HSQLDialect`
	4. Informix: `org.hibernate.dialect.InformixDialect`
	5. Interbase: `org.hibernate.dialect.InterbaseDialect`
	6. Microsoft SQL Server 2000: `org.hibernate.dialect.SQLServerDialect`
	7. Microsoft SQL Server 2005: `org.hibernate.dialect.SQLServer2005Dialect`
	8. Microsoft SQL Server 2008: `org.hibernate.dialect.SQLServer2008Dialect`
	9. MySQL: `org.hibernate.dialect.MySQLDialect`
	10. Oracle (any version): `org.hibernate.dialect.OracleDialect`
	11. Oracle 11g: `org.hibernate.dialect.Oracle10gDialect`
	12. Oracle 10g: `org.hibernate.dialect.Oracle10gDialect`
	13. Oracle 9i: `org.hibernate.dialect.Oracle9iDialect`
	14. PostgreSQL: `org.hibernate.dialect.PostgreSQLDialect`
	15. Progress: `org.hibernate.dialect.ProgressDialect`
	16. SAP DB: `org.hibernate.dialect.SAPDBDialect`
	17. Sybase: `org.hibernate.dialect.SybaseDialect`
	18. Sybase Anywhere: `org.hibernate.dialect.SybaseAnywhereDialect`

## Hibernate - Sessions ##
1. Session is used to get physical connection with db.
2. Session object is light weight
3. It can be instantiated each time an interaction is needed with the db.
4. Persistent objects are saved and retrieved using Session object
5. Session objects are not thread safe
6. Function:
	1. Create, read, delete operations for instances of mapped entity class
7. States of instances
	1. **transient**: new instance of a persistent class which is not yet associated with a Session and which has no representation in the db, it has no id value
	2. **persistent**: A transient instance can be made persistent by associating it with a session. Persistent instance has a representation in db, it has an id value which is associated with session
	3. **detached**: When a Hibernate session is closed, persistent instance will become detached instance
8. If persistent classes are serializable, the Session instance is serializable.
9. Transaction example:

		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			// do work
			// ...
			tx.commit();
		} catch (Exception e) {
			if (tx != null) tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

10. If Session throws, exception, roll back the transaction and discard the session

### Session Interface Methods ###
1. Important methods:
	1. `Transaction beginTransaction()`: beging a unit of work associated with Transaction object
	2. `void cancelQuery()`: cancel execution of current query
	3. `void clear()`: clear the session
	4. `Connection close()`: End the session by releasing JDBC connection and cleaning up.
	5. `Criteria createCriteria(Class persistentClass)`: Creates new Criteria instance, for a given entity class, a superclass of entity class (?)
	6. `Criteria createCriteria(String entityName)`: New Criteria instance, for given entity name
	7. `Serializable getIdentifier(Object object)`: Returns id value of a given entity associated with this session.
	8. `Query createFilter(Object collection, String queryString)`: New instance of Query for given collection and filter string (?)
	9. `Query createQuery(String queryString)`: New instance of Query for given HQL query string
	10. `SQLQuery createSQLQuery(String queryString)`: New instance of SQLQuery for given SQL query string.
	11. `void delete(Object object)`: Removes persistent instance from database
	12. `void delete(String entityName, Object object)`: Removes persistent instance from db
	13. `Session get(String entityName, Serializable id)`: Return persistent instance of given named entity with given id, or null if there is no such pesistent instance
	14. `SessionFactory getSessionFactory()`: returns a session factory which is used to create session
	15. `void refresh(Object object)`: Re-read state of given instance from underlying db
	16. `Transaction getTransaction()`: Returs Transaction instance associated with a session
	17. `boolean isConnected()`: Is session currently connected?
	18. `boolean isDirty()`: Does the session contain any changes which needs to be synchronized with the db?
	19. `boolean isOpen()`: Is session still open?
	20. `Serializable save(Object object)`: Persist given transient instance (first assigns a generated id)
	21. `void saveOrUpdate(Object object)`: Either save or update the given instance
	22. `void update(Object object)`: Updates persistent instance with id of detached instance (?)
	23. `void update(String entityName, Object object)`: Updates persistent instance with id of given detached instance (?)


## Hibernate - Persistent Class ##
1. Hibernate takes values from a java class attributes and persists them to db tables.
2. Mapping document helps Hibernate determine how to pull values from classes and map.
3. Persistent classes: Java classes whose objects/instances will be stored in db tables.
	1. Rules Persistent classes must follow (not hard requirement):
		1. It should be a POJO
		2. All persistent classes must have a default constructor.
		3. All persistent classes should have an ID (to allow easy identification of objects)
			1. The ID property maps to primary key column of db table
		4. All attributes which need to be persisted must be delared `private` and should have `getXXX` and `setXXX` methods in JavaBean style (?)
		5. Hibernate depends upon persistent class that is either non-final or implements an interface that declares all public methods
		6. Classes should not implement specialized classes and interfaces of EJB framework
4. Example:

		public class Employee {
			private int id;
			private String firstName;
			private String lastName;
			private int salary;
	
			public Employee() {}
			public Employee(String fname, String lname, int salary) {
				this.firstName = fname;
				this.lastName = lname;
				this.salary = salary;
			}
			public int getId() {
				return id;
			}
			public void setId(int id) {
				this.id = id;
			}
			public String getFirstName() {
				return firstName;
			}
			public setFirstName(String first_name) {
				this.firstName = first_name;
			}
			public String getLastName() {
				return lastName;
			}
			public void setLastName(String last_name) {
				this.lastName = last_name;
			}
			public int getSalary() {
				return salary;
			}
			public void setSalary(int salary) {
				this.salary = salary;
			}
		}

## Hibernate - Mapping Files ##
1. Object/relational mappings are defined in XML document.
2. The mapping file lets Hibernate know how to map defined class or classes to db tables
3. We can write the mapping file by hand but there are tools to generate the mapping file for advanced hibernate users
	1. **XDoclet**
	2. **Middlegen**
	3. **AndoMDA**
4. There should be one table corresponding to each object to be persisted
5. Consider the following table in which the object needs to be persisted
	
		create table EMPLOYEE (
			id INT NOT NULL auto_increment,
			first_name VARCHAR(20) default NULL,
			last_name VARCHAR(20) default NULL,
			salary INT default NULL,
			PRIMARY KEY (id)
		);

6. The following mapping file can be used to instruct Hibernate how to map class to db table

		<?xml version="1.0" encoding="utf-8"?>
		<!DOCTYPE hibernate-mapping PUBLIC "-//Hibernate/Hibernate Mapping DTD//EN" "http://www.hibernate.org/dtd/hibernate-mapping-3.0.dtd">
		
		<hibernate-mapping>
			<class name="Employee" table"EMPLOYEE">
				<meta attribute="class-description">
					This class contains the employee details.
				</meta>
				<id name="id" type="int" column="id">
					<generator class="native"/>
				</id>
				<property name="firstName" column="first_name" type="string"/>
				<property name="lastName" column="last_name" type="string"/>
				<property name="salary" column="salary" type="int"/>
			</class>
		</hibernate-mapping>
	1. Save the mapping file with the name `<classname>.hbm.xml` (`Employee.hbm.xml`)
	2. Explanation:
		1. `<hibernate-mapping>`: root element. It contains all `<class>` elements
		2. `<class>`: maps Java class to db tables. Class name is specified using `name` attribute and db table name is specified using `table` attribute
		3. `<meta>`: optional. For creation of class description
		4. `<id>`: maps unique ID attribute in class to primary key of db table.
			1. `name` attribute refers to property in class and
			2. `column` attribute refers to column in db table
			3. `type` attribute holds hibernate mapping type (mapping types will convert from Java to SQL data type)
		5. `<generator>`: used inside `<id>` element. This is used to automatically generate primary key values
			1. `class` attribute: `native`: lets hibernate select either `identity`, `sequence` or `hilo` algorithm for creating primary key (depends on underlying db)
		6. `<property>`: Maps Java class property to column in db.
			1. `name` attribute: refers to property in class
			2. `column` attribute: refers to column in db table.
			3. `type` attribute: converts from Java to SQL data type
7. There are other attributes and elements

## Hibernate - Mapping Types ##
1. `type` attribute declared is not Java data type, and not SQL data type but they are Hibernate mapping types which are used to translate from Java to SQL data types and vice versa

### Primitive types: ###
1. `integer`: maps `int` or `java.lang.Integer` to SQL `INTEGER` type
2. `long`: maps `long` or `java.lang.Long` to SQL `BIGINT` type
3. `short`: maps `short` or `java.lang.Short` to SQL `SMALLINT` type
4. `float`: maps `float` or `java.lang.Float` to SQL `FLOAT`
5. `double`: maps `double` or `java.lang.Double` to SQL `DOUBLE`
6. `big_decimal`: maps `java.math.BigDecimal` to SQL `NUMERIC`
7. `character`: maps `java.lang.String` to SQL `CHAR(1)`
8. `string`: maps `java.lang.String` to SQL `VARCHAR`
9. `byte`: maps `byte` or `java.lang.Byte` to `TINYINT`
10. `boolean`: maps `boolean` or `java.lang.Boolean` to SQL `BIT`
11. `yes/no`: maps `boolean` or `java.lang.Boolean` to SQL `CHAR(1)` ('Y' or 'N')
12. `true/false`: maps `boolean` or `java.lang.Boolean` to SQL `CHAR(1)` ('T' or 'F')

### Date and time types ###
1. `date`: maps `java.util.Date` or `java.sql.Date` to SQL `DATE`
2. `time`: maps `java.util.Date` or `java.sql.Time` to SQL `TIME`
3. `timestamp`: maps `java.util.Date` or `java.sql.Timestamp` to SQL `TIMESTAMP`
4. `calendar`: maps `java.util.Calendar` to SQL `TIMESTAMP`
5. `calendar_date`: maps `java.util.Calendar` to SQL `DATE`

### Binary and large object types: ###
1. `binary`: maps `byte[]` to SQL `VARBINARY` or `BLOB`
2. `text`: maps `java.lang.String` to SQL `CLOB`
3. `serializable`: maps any Java class that implements `java.io.Serializable` to SQL `VARBINARY` or `BLOB`
4. `clob`: maps `java.sql.Clob` to SQL `CLOB`
5. `blob`: maps `java.sql.Blob` to SQL `BLOB`

### JDK-related types: ###
1. `class`: maps `java.lang.Class` to SQL `VARCHAR`
2. `locale`: maps `java.util.Locale` to SQL `VARCHAR`
3. `timezone`: maps `java.util.TimeZone` to SQL `VARCHAR`
4. `currency`: maps `java.util.Currency` to SQL `VARCHAR`

## Hibernate - Examples ##
1. Consider a standalone application

### Creation of POJO Classes ###
1. Class should be JavaBeans compliant and include `id` attibute as index

### Creation of Database Tables ###
1. One table per persistent class

### Creation of Mapping Configuration File: ###
1. File that maps class to db table

### Creation of Application Class: ###
1. App class with main method
2. Let us save a few `Employee`'s records and then apply CRUD operations on records

		import java.util.List;
		import java.util.Date;
		import java.util.Iterator;

		import org.hibernate.HibernateException;
		import org.hibernate.Session;
		import org.hibernate.Transaction;
		import org.hibernate.SessionFactory;
		import org.hibernate.cfg.Configuration;

		public class ManageEmployee {
			private static SessionFactory factory;
			public static void main(String[] args) {
				try {
					factory = new Configuration().configure().buildSessionFactory();
				} catch (Throwable ex) {
					System.err.println("Failed to create sessionFactory object." + ex);
					throw new ExceptionInInitializerError(ex);
				}
				ManageEmployee ME = new ManageEmployee();
			
				/* Add few employee records in database */
				Integer empID1 = ME.addEmployee("Zara", "Ali", 1000);
				Integer empID2 = ME.addEmployee("Daisy", "Das", 5000);
				Integer empID3 = ME.addEmployee("John", "Paul", 10000);
				
				/* List down all the employees */
				ME.listEmployees();
		
### Testing ###
1. Run the app and test if EMPLOYEE table is populated with records
		
## Hibernate - O/R Mappings ##
1. There are three important mapping topics
	1. Mapping of collections
	2. Mapping of associations between entity classes
	3. Component Mappings

### Collections Mappings: ###
1. If a class has collection of values for a variable, then map the values using collction interfaces in java
2. Mappings
	1. [`java.util.Set`](https://www.tutorialspoint.com/hibernate/hibernate_set_mapping.htm) maps with `<set>` element and initialized with `java.util.HashSet`
	2. [`java.util.SortedSet`](https://www.tutorialspoint.com/hibernate/hibernate_sortedset_mapping.htm) maps with `<set>` element and initialized with `java.util.TreeSet`
	3. [`java.util.List`](https://www.tutorialspoint.com/hibernate/hibernate_list_mapping.htm) maps with `<List>` element and initialized with `java.util.ArrayList`
	4. [`java.util.Collection`](https://www.tutorialspoint.com/hibernate/hibernate_bag_mapping.htm) mapped with `<bag>` or `<ibag>` element and initialized with `java.util.ArrayList`
	5. [`java.util.Map`](https://www.tutorialspoint.com/hibernate/hibernate_map_mapping.htm) mapped with `<map>` element and initalized with `java.util.HashMap`
	6. [`java.util.SortedMap`](https://www.tutorialspoint.com/hibernate/hibernate_sortedmap_mapping.htm) mapped with `<map>` element and initialized with `java.util.TreeMap`. `sort` attribute can be set to either comparator or natural ordering.
3. Arrays are supported by 
	1. `<primitive-array>` for primitive value types
	2. `<array>` for everything else.
4. For user defined collection interfaces not supported by Hibernate:
	1. Tell Hibernate about the semantics of custom collections (not recommended)

### Association Mappings ###
1. Mapping of associations between entity classes and relationships between tables is soul of ORM.
2. Four ways of expressing cardinality
3. Association can be unidirectional or bidirectional
4. Mappings
	1. [**Many-to-One**](https://www.tutorialspoint.com/hibernate/hibernate_many_to_one_mapping.htm): Mapping many-to-one relationship
	2. [**One-to-One**](https://www.tutorialspoint.com/hibernate/hibernate_one_to_one_mapping.htm): Mapping one-to-one relationship
	3. [**One-to-Many**](https://www.tutorialspoint.com/hibernate/hibernate_one_to_many_mapping.htm): Mapping one-to-many relationship
	4. [**Many-to-Many**](https://www.tutorialspoint.com/hibernate/hibernate_many_to_many_mapping.htm): Mapping many-to-many relationship

### Component Mappings ###
1. If an entity class has a reference to another class as a member variable.
2. If the referred class does not have it's own lifecycle and completely depends on the life cycle of owning entity class, the referred class is called as a component class.
3. Mapping of a collection of Components
	1. [**Component Mappings**](https://www.tutorialspoint.com/hibernate/hibernate_component_mappings.htm) is a mapping for a class having a reference to another class as a member variable

## Hibernate - Annotations ##
1. Newer way to define mappings without using XML file.
	1. It can be comibined with XML file
	2. It can replace XML file
2. Metadata is clubbed into POJO java file.
3. Annotations are used to make application portable to EJB 3 compiant ORM apps

### Environmnet Setup for Hibernate Annotation ###
1. >= JDK 5.0
2. >= Hibernate 3.x annotations distribution package
	1. `hibernate-annotations.jar`
	2. `libe/hibernate-commons-annotations.jar`
	3. `lib/ejb3-persistence.jar`

### Annotated Class Example ###
1. Example

		import javax.persistence.*;

		@Entity
		@Table(name = "EMPLOYEE")
		public class Employee {
			@Id @GeneratedValue
			@Column(name = "id")
			private int id;

			@Column(name = "first_name")
			private String firstName;

			@Column(name = "last_name")
			private String lastName;

			@Column(name = "salary")
			private int salary;

			public Employee() {}
			public int getId() {
				return id;
			}

			public void setId(int id) {
				this.id = id;
			}

			public String getFirstName() {
				return firstName;
			}

			public void setFirstName(String first_name) {
				this.firstName = first_name;
			}

			public String getLastName() {
				return lastName;
			}

			public void setLastName(String last_name) {
				this.lastName = last_name;
			}

			public int getSalary() {
				return salary;
			}

			public void setSalary(int salary) {
				this.salary = salary;
			}
		}

	1. `@Id` annotation: It is on a field and it must access properties on an object directly through fields at runtime.
		1. If `@Id` is placed on `getId()` then enable access to properties through getter and setter methods.

### @Entity Annotation ###
### @Table Annotation ###
### @Id and @GeneratedValue 


## Hibernate - Query Language ##
## Hibernate - Criteria Queries ##
## Hibernate - Native SQL ##
## Hibernate - Caching ##
## Hibernate - Batch Processing ##
## Hibernate - Interceptors ##
## Hibernate - Q & A ##
## Hibernate - Quick Guide ##
## Hibernate - Useful Resources ##
## Hibernate - Discussion ##