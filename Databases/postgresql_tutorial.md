# PostgreSQL Tutorial #
1. [https://www.postgresqltutorial.com/postgresql-getting-started/](https://www.postgresqltutorial.com/postgresql-getting-started/)
2. The tutorial helps understand PostgreSQL quickly
2. Many practical examples are given
3. How to solve the examples innovatively
4. Who is this course for?
	1. If looking to learn PostgreSQL fast and easily
	2. If we want to develop applications using PostgreSQL as a back-end database management system
	3. Migrating from other dbms such as MySQL, Oracle, Microsoft SQL Server to PostgreSQL
5. Tutorial demonstrates unique features of PostgreSQL (most advanced open-source database management system?)

## Getting Started ##
1. Introduction:
	1. How to install PostgreSQL on Windows, Linux, MacOS
	2. How to connect using psql tool
	3. How to load sample database into PostgreSQL for practicing
2. Topics
	1. How to install PostgreSQL on Windows, Linux and macOS
	2. How to connect to PostgreSQL using `psql` tool
	3. How to load sample database into PostgreSQL for practicing
3. Getting Started
	1. [What is PostgreSQL](https://www.postgresqltutorial.com/what-is-postgresql/) - Introduces PostgreSQL and it's applications in software stack
	2. [Introduction to PostgreSQL Sample Database](https://www.postgresqltutorial.com/postgresql-sample-database/) - dvdrental
4. PostgreSQL on Windows
5. PostgreSQL on Linux
6. PostgreSQL on MacOS
	1. [Install PostgreSQL on MacOS](https://www.postgresqltutorial.com/install-postgresql-macos/) - how to download, how to install, how to restore sample database into PostgreSQL database server
		1. [Download Installer](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)
	2. Launch wizard
	3. Select directory where it must be installed (`/Library/PostgreSQL/12`)
	4. Select components to install (uncheck stack builder)
	5. Specify directory where PostgreSQL stores data (`/Library/PostgreSQL/12/data`)
	6. Enter password for user account (keep it)
	7. Specify port: 5432
	8. Select locale (locale of current OS by default)
	9. Install
	10. Load sample database
		1. Launch **pgAdmin**
		2. Enter password
		3. Right click on PostgreSQL 12 and select **Create** > **Database..**
		4. Enter **dvdrental** as database
		5. Enter **postgres** as owner
		6. Click save 
	11. [Download sample database](https://www.postgresqltutorial.com/postgresql-sample-database/)
	12. Unzip it
	13. Right click on **dvdrental** and select **Restore...**
	14. Select directory as Format (1)
	15. Select directory that contains sample database as Filename (2)
	16. Enter role as **postgres**
	17. Click **Restore**

### What is PostgreSQL ###
1. It is advanced, enterprise-class open-source relational database system
2. It supports the following querying options
	1. SQL (relational)
	2. JSON (non-relational)
3. It is highly stable db backed by 20 years of development by open-source community
4. Use cases:
	1. Web applications
	2. Mobile applications
	3. Analytics applications

### Common Use Cases of PostgreSQL ###
1. Robust database in LAPP stack
	1. Linux, Apache, PostgreSQL, PHP (or Python and Perl)
	2. Usually used as robust back-end database
2. General purpose transaction database
	1. Primary database in many applications
3. Geospatial database
	1. [PostGIS extension](https://postgis.net/) - extension supports geospatial databases for geographpic information systems (GIS)
4. Language support
	1. Popular programming languages
		1. Python
		2. Java
		3. C#
		4. C/C++
		5. Ruby
		6. JavaScript (Node.js)
		7. Perl
		8. Go
		9. Tcl

### PostgreSQL Feature Highlights ###
1. Similar to the ones offered by enterprise-class database management systems:
	1. User-defined types (?)
	2. Table inheritance (?)
	3. Sophisticated locking mechanism
	4. [Foreign key referential integrity](https://www.postgresqltutorial.com/postgresql-foreign-key/)
	5. [Views](https://www.postgresqltutorial.com/postgresql-views/), rules, [Subquery](https://www.postgresqltutorial.com/postgresql-subquery/)
	6. Nested transactions (savepoints)
	7. Multi-version concurrency control (MVCC)
	8. Asynchronous replication
2. Recent versions support
	1. Native Microsoft Windows Server version
	2. Tablespaces
	3. Point-in-time recovery
3. PostgreSQL is designed to be extensible
	1. It allows user to define
		1. Own data types
		2. Own index types
		3. Own functional languages
		4. ...
	2. A custom plugin can be developed (to replace parts that we don't like)
		1. Example: adding new optimizer

### Who Uses PostgreSQL ###
1. Apple
2. Fujitsu
3. Red Hat
4. Cisco
5. Juniper Networks
6. Instagram
7. ...

### PostgreSQL Sample Database ###
1. DVD Rental Database (of a DVD rental store)
2. Objects
	1. 15 tables
		1. actor - stores actors data including first name, last name
		2. film - stores film data such as title, release year, length, rating, etc...
		3. film_actor - stores the relationships between films and actors
		4. category - stores film's categories data
		5. film_category - stores relationships between films and categories
		6. store - contains store data including manager staff and address
		7. inventory - stores inventory data
		8. rental - stores rental data
		9. payment - stores customer's payments
		10. staff - stores staff data
		11. customer - stores customer data
		12. address - stores address data for staff and customers
		13. city - stores city names
		14. country - stores country names
	2. 1 trigger
	3. 7 views
	4. 8 functions
	5. 1 domain
	6. 13 sequences

### Basic PostgreSQL Tutorial ###
1. Querying data from single table using basic data selection
	1. Selecting columns
	2. Sorting result sets
	3. filtering rows
2. Joining multiple tables
	1. Using set operations
	2. Constructing subquery
3. Managing database tables
	1. Creation of new table
	2. Modification of existing tables

## Section 1: Querying Data ##
1. [Select](https://www.postgresqltutorial.com/postgresql-select/) - show how to query data from single table
2. [Column aliases](https://www.postgresqltutorial.com/postgresql-column-alias/) - assigning temporary names to columns or **expressions** in query
3. [Order By](https://www.postgresqltutorial.com/postgresql-order-by/) - How to sort result set returned from query
4. [Select Distinct](https://www.postgresqltutorial.com/postgresql-select-distinct/) - Define clauses that remove duplicate rows in result set

### PostgreSQL Select ###
1. Summary: How to use basic PostgreSQL select statement to query from single table
	1. [Connecting to PostgreSQL database tutorial](https://www.postgresqltutorial.com/connect-to-postgresql-database/)
2. SELECT - statement is one of most complex statements in PostgreSQL
	1. It has many clauses to form a flexible query
3. SELECT is broken down into shorter easy-to-understand tutorials (covering the clauses)
4. Clauses of SELECT
	1. [DISTINCT](https://www.postgresqltutorial.com/postgresql-select-distinct/) - used to select distinct rows
	2. [ORDER BY](https://www.postgresqltutorial.com/postgresql-order-by/) - used to sort rows
	3. [WHERE](https://www.postgresqltutorial.com/postgresql-where/) - Filter rows using this clause
	4. [LIMIT](https://www.postgresqltutorial.com/postgresql-limit/), [FETCH](https://www.postgresqltutorial.com/postgresql-fetch/) - used to select subset of rows from table
	5. [GROUP BY](https://www.postgresqltutorial.com/postgresql-group-by/) - Group rows into groups
	6. [HAVING](https://www.postgresqltutorial.com/postgresql-having/) - Filter groups using this clause
	7. [INNER JOIN](https://www.postgresqltutorial.com/postgresql-inner-join/), [LEFT JOIN](https://www.postgresqltutorial.com/postgresql-left-join/), [FULL OUTER JOIN](https://www.postgresqltutorial.com/postgresql-full-outer-join/), [CROSS JOIN](https://www.postgresqltutorial.com/postgresql-cross-join/) - used to join tables using [joins](https://www.postgresqltutorial.com/postgresql-joins/)
	8. [UNION](https://www.postgresqltutorial.com/postgresql-union/), [INTERSECT](https://www.postgresqltutorial.com/postgresql-intersect/), [EXCEPT](https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-except/) - used to perform set operations

## Section 2: Filtering Data ##

## Section 3: Joining Multiple Tables ##

## Section 4: Grouping Data ##

## Section 5: Set Operations ##

## Section 6: Grouping Sets, Cube, and Rollup ##

## Section 7: Subquery ##

## Section 8: Common Table Extensions ##

## Section 9: Modifying Data ##

## Section 10: Transactions ##

## Section 11: Import & Export Data ##

## Section 12: Managing Tables ##

## Section 13: Understanding PostgreSQL Constraints ##

## Section 14: PostgreSQL Data Types in Depth ##

## Section 15: Conditional Expressions & Operations ##

## Section 16: PostgreSQL Utilities ##

## Section 17: PostgreSQL Recipes ##

## Advanced PostgreSQL Tutorial ##
### PostgreSQL PL/pgSQL ###
### PostgreSQL Triggers ###
### PostgreSQL Views ###
### PostgreSQL Indexes ###
### PostgreSQL Administration ###