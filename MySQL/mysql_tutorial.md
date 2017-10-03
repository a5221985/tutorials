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
### Getting started with MySQL ###
### Querying data ###
### Filtering data ###
### Sorting data ###
### Joining tables ###
### Grouping data ###
### MySQL subquery, derived table, and CTE ###
### Using Set operators ###
### Modifying data in MySQL ###
### MySQL transaction ###
### Managing MySQL databases and tables ###
### MySQL indexes ###
### MySQL data types ###
### MySQL constraints ###
### MySQL globalization ###
### MySQL import & export ###

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

		from configparser import ConfigParser

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
### Python MySQL Insert Data ###
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