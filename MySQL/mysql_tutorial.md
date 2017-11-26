# MySQL Tutorial #
## Introduction ##
### What is MySQL ###
### Install MySQL database server ###
### MySQL Tutorial for Developers ###
1. Manage MySQL databases
2. Manipulate data using SQL queries
3. MySQL stored procedures
4. Database views
5. Triggers

## Basic MySQL Tutorial ##
1. Querying data, updating data, managing databases and creation of tables
2. MySQL dialect

### Getting started with MySQL ###
1. Installing MySQL, downloading [sample data](http://www.mysqltutorial.org/mysql-sample-database.aspx), loading data into MySQL server

#### Installing MySQL database server ####
#### Downloading MySQL sample database ####
1. `classicmodels` - database
	1. Retailer of scale models of classic cars database
	2. Contains following business data
		1. Customers
		2. Products
		3. Sales Orders
		4. Sales Order Line Items
2. [MySQL Sample Database](http://www.mysqltutorial.org/download/2)
3. [how to load sample database into MySQL database server tutorial](http://www.mysqltutorial.org/how-to-load-sample-database-into-mysql-database-server.aspx)
	1. Test
	
			USE classicmodels;
			SELECT * FROM customers;

4. MySQL Sample Database Schema
	1. **Customers**: stores customer's data
	2. **Products**: stores a list of scale model cars
	3. **ProductLines**: stores a list of product line categories
	4. **Orders**: stores sales orders placed by customers
	5. **OrderDetails**: stores sales order line items for each sales order
	6. **Payments**: stores payments made to customers based on their accounts
	7. **Employees**: stores all employee information as well as the organization structure such as who reports to whom
	8. **Offices**: stores sales office data

#### Loading the sample database into your own MySQL database server ####
1. [how to load sample database into MySQL database server tutorial](http://www.mysqltutorial.org/how-to-load-sample-database-into-mysql-database-server.aspx)

### Querying data ###
#### SELECT ####
##### SELECT DISTINCT ####

### Filtering data ###
#### WHERE ####
#### AND ####
#### OR ####
#### IN ####
#### BETWEEN ####
#### LIKE ####
#### **LIMIT** ####
#### **IS NULL** ####

### Sorting data ###
#### **ORDER BY** ####
#### Natural sorting using ORDER BY clause ####

### Joining tables ###
#### MySQL alias ####
#### MySQL Join ####
#### INNER JOIN ####
#### LEFT JOIN ####
#### RIGHT JOIN ####
#### **CROSS JOIN** ####
#### **Self-join** ####

### Grouping data ###
#### **GROUP BY** clause ####
#### **HAVING** ####

### MySQL subquery, derived table, and CTE ###
#### **MySQL subquery** ####
#### **MySQL derived table** ####
#### **MySQL CTE** ####
#### **Recursive CTE** ####

### Using Set operators ###
#### **UNION** and **UNION ALL** ####
#### **INTERSECT** ####
#### **MINUS** ####

### Modifying data in MySQL ###
#### INSERT ####
#### **INSERT IGNORE** ####
#### UPDATE ####
#### **UPDATE JOIN** ####
#### DELETE ####
#### **ON DELETE CASCADE** ####
#### **DELETE JOIN** ####
#### **REPLACE** ####
#### **Prepared Statement** ####

### MySQL transaction ###
#### **MySQL transaction** ####
#### **MySQL table locking** ####

### Managing MySQL databases and tables ###
#### **Managing database in MySQL** ####
#### **Understanding MySQL Table Types** ####
#### CREATE TABLE ####
#### **MySQL sequence** ####
#### ALTER TABLE ####
#### **Renaming table** ####
#### Removing a column from a table ####
#### Adding a new column to a table ####
#### DROP TABLE ####
#### **MySQL temporary table** ####
#### **TRUNCATE TABLE** ####

### MySQL indexes ###
#### **Managing MySQL database indexes** ####
#### **UNIQUE index** ####

### MySQL data types ###
#### MySQL data types ####
#### INT ####
#### **DECIMAL** ####
#### **BIT** ####
#### BOOLEAN ####
#### CHAR ####
#### VARCHAR ####
#### TEXT ####
#### DATE ####
#### TIME ####
#### **DATETIME** ####
#### **TIMESTAMP** ####
#### **JSON** ####
#### **ENUM** ####

### MySQL constraints ###
#### NOT NULL constaint ####
#### Primary key constraint ####
#### Foreign key constraint ####
#### UNIQUE constraint ####
#### **CHECK** constraint ####

### MySQL globalization ###
#### **MySQL character set** ####
#### **MySQL collation** ####

### MySQL import & export ###
#### **Import CSV File Into MySQL Table** ####
#### **MySQL Export Table to CSV** ####

## MySQL Stored Procedure ##
### Introduction to MySQL Stored Procedures ###
### Getting Started with MySQL Stored Procedures ###
### MySQL Stored Procedure Variables ###
### MySQL Stored Procedure Parameters ###
### MySQL Stored Procedures That Return Multiple Values ###
### MySQL IF Statement ###
### MySQL CASE Statement ###
### Hints for Choosing Between IF and CASE Statements ###
### MySQL Loop in Stored Procedures ###
### MySQL Cursor ###
### Listing Stored Procedures in a MySQL Database ###
### MySQL Error Handling in Stored Procedures ###
### Raising Error Conditions with MySQL SIGNAL/ RESIGNAL Statements ###
### MySQL Stored Function ###

## MySQL Triggers ##
### Introduction to SQL Trigger ###
### MySQL Triggers Implementation ###
### Creation of Trigger in MySQL ###
### Creation of Multiple Triggers For The Same Trigger Event And Action Time ###
### Managing Triggers in MySQL ###
### Working with MySQL Scheduled Event ###
### Modifying MySQL Events ###

## MySQL Views ##
### Introduction to Database View ###
### Views in MySQL ###
### Creation of Views in MySQL ###
### Creation of MySQL Updatable Views ###
### Ensuring Views Consistency Using WITH CHECK OPTION Clause ###
### Understanding LOCAL & CASCADED in WITH CHECK OPTION Clause ###
### Managing Views in MySQL ###

## MySQL Functions ##
### MySQL aggregate functions ###
### MySQL string functions ###
### MySQL control flow functions ###
### MySQL date and time functions ###
### MySQL comparison functions ###
### Other MySQL functions ###

## MySQL Node.js ##
### Connecting to the MySQL Database Server from Node.js ###
### Creation of Tables in MySQL from Node.js ###
### Inserting Rows Into a Table from Node.js ###
### Querying Data in MySQL Database from Node.js ###
### Updating Data in MySQL Database from Node.js ###
### Deleting Data in MySQL from Node.js ###
### Calling MySQL Stored Procedures from Node.js ###

## Python MySQL Tutorial ##
1. Use MySQL connector/Python to access MySQL databases
2. How to connect to MySQL database
3. Perform common database operations
	1. SELECT
	2. INSERT
	3. UPDATE
	4. DELETE
4. How to call MySQL stored procedure from Python
5. How to work with MySQL BLOB data

### Getting Started with MySQL Python Connector ###
1. MySQL Python connector's features
2. How to install MySQL Connector/Python in local system

#### Introcution to MySQL Python connector ####
1. We need database driver to access MySQL database from Python
	1. MySQL connector/Python - standard database driver
		1. Supports almost all features of v 5.7
		2. Allows conversion of parameter values between Python and MySQL datatypes
			1. Python datetime and MySQL DATETIME
		3. Supports MySQL extensions to standard SQL (LIMIT clause)
		4. Allows compression of data stream between Python and MySQL database server using protocol compression.
			1. Supports TCP/IP socket and secure TCP/IP connection using SSL
		5. It is API implemented using pure Python
			1. No need for client library or module but only standard library
	2. Supported versions of Python 2.6, 2.7, and 3.3

#### Download MySQL Python connector ####
1. [download](http://dev.mysql.com/downloads/connector/python/2.0.html)
	1. Install

#### Installing MySQL Python connector ####
1. Unzip/Untar
2. Goto directory
3. Run `python setup.py install`

#### Verifying MySQL Connector/Python installation ####
1. Open Python3 command line
2. Run the following:

		import mysql.connector

		mysql.connector.connect(host='localhost', database='mysql', user='root', password='')

	1. Output: `<mysql.connector.connection.MySQLConnection object at xxxxx>`

### Python Connecting to MySQL Databases ###
#### Preparing a sample database ####
1. New database: `python_mysql`
	1. In workbench
	2. MySQL client

			CREATE DATABASE python_mysql;
2. Load Sample data: [Python MySQL Sample Database](http://www.mysqltutorial.org/download/16)

#### Connecting to MySQL databse using connect() function ####
1. `python_mysql_connect1.py`

		import mysql.connector
		from mysql.connector import Error

		def connect():
			""" Connect to MySQL database """
			try:
				conn = mysql.connector.connect(host='localhost', database='python_mysql', user='root', password='secret')
				if conn.is_connected():
					print('Connected to MySQL database')
			except Error as e:
				print(e)
			finally:
				conn.close()

		if __name__ == '__main__':
			connect()

	1. `mysql.connector` and `Error` objects are imported from MySQL Connector/Python package
	2. `connect()` accepts parameters host, database, user, password.
		1. Establishes connection to `python_mysql` database and returns `MySQLConnection` object
	3. `is_connected()` is used to check connection to MySQL database
	4. `Error` exception is raised if eg:
		1. database server is not available
		2. database does not exist
		3. invalid user name or password
	5. `close()` method of `MySQLConnection` closes database connection
2. Testing:

		python python_mysql_connect1.py

#### Connecting to MySQL Database using MySQL Connection object ####
1. A database configuration file `config.ini`

		[mysql]
		host = localhost
		database = python_mysql
		user = root
		password = 

2. New module `python_mysql_dbconfig.py` reads database configuration from `config.ini` and returns dictionary

		from ConfigParser import ConfigParser

		def read_db_config(filename='config.ini', section='mysql'):
			""" Read database configuration file and return a dictionary object
			:param filename: name of the configuration file
			:param section: section of database configuration
			:return: a dictionary of database parameters
			"""
			# creation of parser and read ini configuration file
			parser = ConfigParser()
			parser.read(filename)
			
			# get section, default to mysql
			db = {}
			if parser.has_section(section):
				items = parser.items(section)
				for item in items:
					db[item[0]] = item[1]
			else:
				raise Exception('{0} not found in the {1} file'.format(section, filename))
			return db

	1. `ConfigureParser` - Used to read configuration file
	2. Testing:

			from python_mysql_dbconfig import read_db_config
			read_db_config()

3. New module `python_mysql_connect2.py` which uses `MySQLConnection` object to connect to `python_mysql`

		from mysql.connector import MySQLConnection, Error
		from python_mydql_dbconfig import read_db_config

		def connect():
			""" Connect to MySQL database """

			db_config = read_db_config()

			try:
				print('Connecting to MySQL database...')
				conn = MySQLConnection(**db_config)

				if conn.is_connected():
					print('connection established.')
				else:
					print('connection failed.')

			except Error as error:
				print(error)

			finally:
				conn.close()
				print('Connection closed.')

		if __name__ == '__main__':
			connect()

	1. `MySQLConnection`, `Error` are imported from MySQL Connector/Python package
	2. `read_db_config` is imported from `python_mysql_dbconfig` module
	3. `connect()` is used to read database configuration
4. Testing:

		python python_mysql_connect2.py

### Python MySQL Query ###
1. To query data using MySQL Connector/Python API
	1. `fetchone()`
	2. `fetchmany()`
	3. `fetchall()`
2. Steps:
	1. Connect to MySQL database and you get `MySQLConnection` object
	2. Instantiate `MySQLCursor` object from `MySQLConnection` object
	3. Use cursor to execute a query by calling its `execute()` method
	4. Use `fetchone()`, `fetchmany()` or `fetchall()` method to fetch data from result set
	5. Close the cursor as well as database connection by calling `close()` method of corresponding object

#### Querying data with fetchone ####
1. Example:

		from mysql.connector import MySQLConnection, Error
		from python_mysql_dbconfig import read_db_config

		def query_with_fetchone():
			try:
				dbconfig = read_db_config()
				conn = MySQLConnection(**dbconfig)
				cursor = conn.cursor()
				cursor.execute('SELECT * FROM books')

				row = cursor.fetchone()

				while row is not None:
					print(row)
					row = cursor.fetchone()

			except Error as e:
				print(e)

			finally:
				cursor.close()
				conn.close()

		if __name__ == '__main__':
			query_with_getchone()

	1. Connected to db using `MySQLConnection` object
	2. Instantiated new `MySQLCursor` object from `MySQLConnection` object
	3. Executed query that selects all rows from `books` table
	4. Called `fetchone()` to fetch next row in result set
	5. Closed connection object by invoking `close()` method of corresponding object

#### Querying data with fetchall ####
1. `fetchall()` usually used if number of rows is small
	1. Fetches all rows from database

			from mysql.connector import MySQLConnection
			from python_mysql_dbconfig import read_db_config

			def query_with_fetchall():
				try:
					dbconfig = read_db_config()
					conn = MySQLConnection(**dbconfig)
					cursor = conn.cursor()
					cursor.execute('SELECT * FROM books')
					rows = cursor.fetchAll()
	
					print('Total rows(s):', cursor.rowcount)
					for row in rows:
						print(row)

				except Error as e:
					print(e)

				finally:
					cursor.close()
					conn.close()

			if __name__ == '__main__':
				query_with_fetchall()

		1. All rows are fetched into memory

#### Querying data with fetchmany ####
1. `fetchmany()` returns next number of rows (n) of result set - allows balance between time and space

		def iter_row(cursor, size=10):
			while True:
				rows = cursor.fetchmany(size)
				if not rows:
					break
				for row in rows:
					yield row

		def query_with_fetchmany():
			try:
				dbconfig = read_db_config()
				conn = MySQLConnection(**dbconfig)
				cursor = conn.cursor()

				cursor.execute('SELECT * FROM books')

				for row in iter_row(cursor, 10):
					print(row)

			except Error as e:
				print(e)

			finally:
				cursor.close()
				conn.close()

### Python MySQL Insert Data ###
1. Steps to insert rows:
	1. Connect to MySQL database server by instantiating `MySQLConnection` object
	2. Initiate `MySQLCursor` object from `MySQLConnection` object
	3. Execute `INSERT` statement to insert data into intended table
	4. Close database connection
2. We can insert one or many rows at a time

#### Insert one row into a table ####
1. Example: New book into books table

		from mysql.connector import MySQLConnection, Error
		from python_mysql_dbconfig import read_db_config

		def insert_book(title, isbn):
			query = 'INSERT INTO books (title, isbn) ' \
					'VALUES (%s, %s)'
			args = (title, isbn)

			try:
				db_config = read_db_config()
				conn = MySQLConnection(**db_config)

				cursor = conn.cursor()
				cursor.execute(query, args)

				if cursor.lastrowid:
					print('last insert id', cursor.lastrowid)
				else:
					print('last insert id not found')

				conn.commit()
			except Error as error:
				print(error)

			finally:
				cursor.close()
				conn.close()

		def main():
			insert_book('A Sudden Light', '9781439187036')

		if __name__ == '__main__':
			main()

	1. `insert_book()` accepts title and isbn
		1. We prepare `INSERT` statement (query) and data (args)
			1. Data is passed as a tuple
	2. `commit()` - called explicitly to make changes to database
	3. `lastrowid` - gets the last insert id of AUTO_INCREMENT column
	4. Call `insert_book()` and pass `title` and `isbn`

#### Insert multiple rows into a table ####

### Python MySQL Update Data ###
### Python MySQL Delete Data ###
### Calling MySQL Stored Procedures in Python ###
### Working with MySQL BLOB in Python ###

## Perl MySQL Tutorial ##
### Perl MySQL Connect ###
### Perl MySQL Creation of Table ###
### Perl MySQL Insert Data ###
### Perl MySQL Transaction ###
### Perl MySQL Select Data ###
### Perl MySQL Update Data ###
### Perl MySQL Delete Data ###

## MySQL Books ##
1. High Performance MySQL: Optimization, Backups, and Replication
2. MySQL Administrator's Bible
3. MySQL High Availability: Tools for Building Robust Data Centers
4. Effective MySQL Optimizing SQL Statements (Oracle Press)
5. Understanding MySQL Internals
6. Effective MySQL Backup and Recovery (Oracle Press) (Oracle (McGraw-Hill))
7. Head First PHP & MySQL
8. MySQL Stored Procedure Programming