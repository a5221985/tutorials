# NoSQL Databases #
1. It is umbrella term
	1. Describe alternative system to SQL databases
2. They use data models that have a different structure than traditional row-and-column table model (as in relational database management systems (RDBMSs))
3. They are different from each other types as well
4. Scope:
	1. 4 main types of NoSQL databases and their uses

## What NoSQL Databases Have in Common ##
1. [When to Use NoSQL Databases](https://www.mongodb.com/scale/when-to-use-nosql-database)
	1. They are developed in response to inability of SQL databases to address the needs of **web scale applications** that handle **huge amounts of data and traffic**
2. Companies are finding that they can apply NoSQL technology to growing list of use cases
	1. They can also save money in comparison to operating relational database (?)
		1. Because NoSQL DBs have flexible schema model **designed to scale horizontally across many servers**
			1. Good for **large data volumes** and **application loads** that exceed **capacity of single server**
3. Reasons for popularity of NoSQL DBs:
	1. Pace of development is faster as compared to with SQL database
	2. Structures of quite a few forms of data are easily handled and evolced with NoSQL DBs as compared to SQL DBs
	3. Large amount of data in quite a few applications cannot be served by SQL DB
	4. Large scale of traffic with zero downtime cannot be handled by SQL
	5. Newer application paradigms are more easily supported

## Understanding Differences in the Four Types of NoSQL Databases ##
1. 4 Main Types:
	1. Document Databases
	2. Key-Value Stores
	3. Column-Oriented Databases
	4. Graph Databases

## Document Databases ##
1. It stores data in JSON, BSON, or XML
	1. Not word docs or google docs, ...
2. Documents can be nested
	1. Elements can be **indexed** for **faster querying**
3. **Docs can be stored and retrieved in a form closer to data objects in apps**
	1. **Less translation required**
		1. SQL data needs assembling and disassembling when moving between app and storage
4. **Developers get the flexibility to reword on their document structures as needed to suit the app**
	1. Allows re-shaping data structures as their app requirements change over time
		1. Data becomes like code which is under the control of developers
			1. SQL DBs need intervention by DB admins to change the structure of DB
5. **Most widely adopted DBs are implemented with scale-out architecture**
	1. This provides the clear path to scalability of data volumes as well as traffic
6. Use cases:
	1. E-Commerce platforms
	2. Tracing platforms
	3. Mobile apps
7. [Comparing MongoDB vs PostgreSQL](https://www.mongodb.com/compare/mongodb-postgresql)
	1. Detailed analysis

## Key-Value Stores ##
1. Simplest type of NoSQL DB
2. Every data is stored as **key:value** pair
	1. Key: attribute name
	2. Value: attribute value
3. **It is like an RDBMS with only two columns**
4. Use cases:
	1. Shopping carts
	2. User preferences
	3. User profiles

## Column-Oriented Databases ##
1. Column store is organized as a set of columns
	1. **Useful to run analytics on small number of columns**
		1. We can read **only those columns** directly
			1. Does not waste memory with unnecessary data
2. Columns are **usually** of same type
	1. Efficient compression can be applied
		1. **Reads can become faster**
3. Allows for quick aggregation of values of a given column
	1. Example: Adding up sales for the year
4. Use Cases:
	1. Analytics
5. Drawbacks
	1. Writes: Strong consistency can be difficult to implement (Because of the way data is written)
		1. **Writes of all columns (for a given full row say) may need multiple write events on disk**
			1. **RDBMS** does not suffer from this because row data is **written contiguously on disk**

## Graph Databases ##
1. Focus is on **relationship** between data elements
2. Each element is stored as **node**
	1. Example: person in social media graph
3. Connections between elements: links or relationships
	1. **connections are first class elements** of this database
		1. These are stored directly
			1. In RDBMS the links are implied (indirectly) through data (to express relationships)
4. **graph database is optimized to capture and search connections between data elements**
	1. Overhead associated with JOINs on multiple tables in SQL is overcome
5. Real-world business systems can survive totally on graph queries
	1. These are used alongside other traditional databases
6. Use Cases:
	1. Fraud detection
	2. Social networks
	3. Knowledge graphs

## Related Resources ##
1. [What is NoSQL? NoSQL Databases Explained](https://www.mongodb.com/nosql-explained)
2. [What are the main differences between NoSQL and SQL?](https://www.mongodb.com/nosql-explained/nosql-vs-sql)
3. [When should we use NoSQL database?](https://www.mongodb.com/nosql-explained/when-to-use-nosql)
4. [What are the advantages of NoSQL Databases?](https://www.mongodb.com/nosql-explained/advantages)
5. [NoSQL data modeling and schema design](https://www.mongodb.com/nosql-explained/data-modeling)
6. [Exploring NoSQL database examples](https://www.mongodb.com/nosql-explained/examples)

# Top 3 NoSQL Databases #
1. MontoDB - Document Database
2. Apache Cassandra - Scalability and Availability (when scaling app)
3. Neo4J - Graph based

# Top 3 Cloud Databases #
1. MS SQL DB
	1. Relational and transactional
	2. ACID
2. Amazon Aurora
	1. Scalable
	2. Relational and transactional
	3. ACID
3. Google Cloud SQL
	1. Relational and transactional
	2. ACID
	3. Scalable