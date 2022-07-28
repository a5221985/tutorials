# What is a Column Database #
## What are Columnar Databases ##
1. AKA column-oriented DBMS or columnar dbms
2. DBMS stores data in columns instead of rows
3. RDBMS
	1. data is stored in rows
	2. properties are column headers
4. Both RDBMS and Columnar DBs use SQL
5. Prformance: Column DB can perform better
	1. Example: List all names from a table based on ID
		1. Just access single column
6. Characteristics of column data store
	1. **Keyspace** is used (like schema in RDBMS)
	2. **Column family**
		1. It is like a **table**
		2. **Keyspace** contains **column families**
		3. Contains **multiple rows**
			1. **Each row has a unique key** (**Row key**)
				1. It is **unique id for the row**
	3. Each **column** has **Name**, **Value**, and **TimeStamp**
	4. Each **row** can have **different columns** and **different number of columns**
	5. Each **column** can have multiple **rows**
		1. Rows don't need to have same **data type** or **size**

## Keyspace ##
1. It is like **schema** in RDBMS
2. It contains all column families
3. Example:
	1. CMS DB - it can store user profiles, documents, documents metadata

## Column Family ##
1. It is like table in RDBMS
2. Multiple **column families** can exist in a single **keyspace**
	1. Exmaple: Column families
		1. AuthorProfile
		2. MemberProfile
		3. Article
		4. Blog
		5. Question

## Row Key ##
1. Column family contains **multiple rows**
	1. First item: Unique key (row key)
		1. To identify a row

## Column ##
1. Each row can have multiple columns and different number of columns
	1. Columns contain actual values
		1. Data is stored as **key/value** pair with **timestamp**

## AuthorProfile ##
1. Example:
	1. Muhammed (row key)
		1. Gender (column name)
			1. Male (column value)
			2. 930384094 (timestamp)
		2. Expertise (column name)
			1. ADO.NET, C#, GDI+ (column value)
			2. 093840938 (timestamp)
		3. Rank (column name)
			1. 102 (column value)
			2. 093489833 (timestamp)
	2. David (row key)
		1. Gender (column name)
			1. Male (column value)
			2. 0393849384 (timestamp)
		2. Book (column name)
			1. AWS Developer's Guide
			2. 3849348394 (timestamp)
	3. Allen (row key)
		1. City (column name)
			1. London (column value)
			2. 9384938493 (timestamp)
		2. Book (column name)
			1. Azure Quickstart (column value)
			2. 0340343408 (timestamp)

## Key Benefits of Column Store Databases ##
1. **Faster performance on**
	1. **Load**
	2. **Search**
	3. **Aggregation**
2. **Scalabile** and can read **billions** of records in seconds
3. Efficient in **data compression** and **partitioning**

## Popular Column Databases ##
1. List:
	1. Bigtable
	2. Cassandra
	3. HBase
	4. Druid
	5. Hypertable
	6. MariaDB
	7. Azure SQL Data Warehouse
	8. Google BigQuery
	9. IBM Db2
	10. MemSQL
	11. SQL Server
	12. SAP HANA

## Bigtable ##
1. Petabyte scale, fully managed NoSQL DB service for **large analytical** and **operational** workloads
2. Key features:
	1. Low latency, massively scalable NoSQL
	2. Consistent sub-10ms latency
	3. Replication provides:
		1. Higher availability
		2. Higher durability (?)
		3. Resilience in face of zonal failures
	4. Ideal for Ad Tech, Fintech, and IoT
	5. Storage engine for machine learning applications
	6. Easy integration with open source big data tools

## Cassandra ##
1. Highly scalable & highly available & performant
	1. Linear scalability
	2. Fault tolerant
	3. Multiple data centre replication
		1. Lower latency for local users
		2. Can survive regional outages
2. Use Cases:
	1. Mission critical data

## HBase ##
1. Apache HBase
	1. Open source
	2. Distributed
	3. Scalable
	4. NoSQL
	5. Big data
		1. Billions of rows access in seconds (**read**)
2. Key features include:
	1. Linear and **modular scalability** (?)
	2. **Consistent reads & writes**
	3. Automatic & configurable **sharding** of tables
	4. Automatic failover support between RegionServers
	5. Convenient **Base Classes** (?) for backing Hadoop MapReduce jobs with Apache HBase tables
	6. **Java API** for client access
	7. **Block Cache** and **Bloom Filters** for **real-time queries**
		1. **Bloom filters**
			1. [Bloom Filters - Introduction and Implementation](https://www.geeksforgeeks.org/bloom-filters-introduction-and-python-implementation/)
				1. A hash function that allows collisions (can return false positives but no false negatives)
	8. **Query predicate push down via server-side filters** (?)
	9. **Thrift gateway** and REST-ful Web service that supports XML, Protobuf, and binary data encoding options
		1. **Thrift service**
			1. Apache Thrift - scalable cross-language services development
				1. It combines **software stack** with **code generateion engine** to build **services** that work **efficiently** and **seamlessly** between C++, Java, Python, PHP, Ruby, Erlang, Perl, Haskell, C#, Cocoa, JavaScript, Node.js, Smalltalk, OCaml, and Delphi, ...
	10. Extensible jruby-based (JIRB) shell