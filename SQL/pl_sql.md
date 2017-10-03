# PL/SQL #
## PL/SQL - Home ##
1. PL/SQL is a combination of SQL and procedural features of programming language
2. It is embedded in Oracle Database along with SQL and Java

### Audience ###
1. For Software Professionals
2. Takes upto intermediate level of expertise

### Prerequisites ###
1. Concepts:
	1. Database
	2. Source code
	3. Text editor
	4. Execution of programs
2. SQL
3. A programming language

## PL/SQL - Overview ##
### Features of PL/SQL ###
### Advantages of PL/SQL ###

## PL/SQL - Environment ##
1. Enrioment setup of PL/SQL
2. PL/SQL is not standalone programming language but a tool within Oracle programming environment
3. SQL* Plus - interactive tool to type SQL and PL/SQL statements at command prompt
	1. Commands are sent to Database for processing
	2. Results are sent back and displayed on screen
4. Pre-requisites:
	1. Oracle RDBMS Server
		1. Recent version: 11g
			1. [Download Oracle 11g Express Edition](https://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html)
		2. Unzip in single directory `database`
		3. Steps:
			1. Launch Oracle Database Installer using setup file
				1. Provide email ID and check checkbox
			2. Uncheck checkbox and continue
			3. Check **Create and Configure Database**
				1. Click **Next**
			4. Select **Desktop Class** - for learning and on PC or Laptop
			5. Provide location where to install Oracle Server
				1. Modify **Oracle Base**
					1. other locations will set automatically
				2. Provide a password (Used by System DBA)
				3. Click **Next**
			6. Click **Next**
			7. Click **Finish**
				1. Server should be installed
			8. Oracle performs configuration
			9. Oracle will copy required config files
			10. Click **OK**
			11. Verify installation:
				1. `sqlplus "/ as sysdba"`
					1. Opens SQL prompt

### Text Editor ###
1. Editors:
	1. Notepad
	2. Notepad++
	3. EditPlus
2. Save file as .sql in home directory
3. Goto directory where .sql file is saved
4. Type `@file_name` at SQL*Plus command prompt to execute the program
5. If executing code directly:
	1. Paste code in SQL prompt
	2. Press enter (If not already executed)

## PL/SQL - Basic Syntax ##
### The 'Hello World' Example ###
### The PL/SQL Identifiers ###
### The PL/SQL Delimiters ###
### The PL/SQL Comments ###
### PL/SQL Program Units ###

## PL/SQL - Data Types ##
### PL/SQL Scalar Data Types and Subtypes ###
### PL/SQL Numeric Data Types and Subtypes ###
### PL/SQL Character Data Types and Subtypes ###
### PL/SQL Boolean Data Types ###
### PL/SQL Datetime and Interval Types ###
### PL/SQL Large Object (LOB) Data Types ###
### PL/SQL User-Defined Subtypes ###
### NULLs in PL/SQL ###

## PL/SQL - Variables ##
### Variable Declaration in PL/SQL ###
### Initializing Variables in PL/SQL ###
### Variable Scope in PL/SQL ###
### Assigning SQL Query Results to PL/SQL Variables ###

## PL/SQL - Constants and Literals ##
### Declaring a Constant ###
### The PL/SQL Literals ###

## PL/SQL - Operators ##
### Arithmetic Operators ###
### Relational Operators ###
### Comparison Operators ###
### Logical Operators ###
### PL/SQL Operator Precedence ###

## PL/SQL - Conditions ##

## PL/SQL - Loops ##
### Labeling a PL/SQL Loop ###
### The Loop Control Statements ###

## PL/SQL - Strings ##
### Declaring String Variables ###
### PL/SQL String Functions and Operators ###

## PL/SQL - Arrays ##
### Creation of Varray Type ###

## PL/SQL - Procedures ##
### Parts of a PL/SQL Subprogram ###
### Creation of a Procedure ###
### Executing a Standalone Procedure ###
### Deleting a Standalone Procedure ###
### Parameter Modes in PL/SQL Subprograms ###
### Methods for Passing Parameters ###

## PL/SQL - Functions ##
### Creation of a Function ###
### Calling a Function ###
### PL/SQL Recursive Functions ###

## PL/SQL - Cursors ##
### Implicit Cursors ###
### Explicit Cursors ###
### Declaring the Cursor ###
### Opening the Cursor ###
### Fetching the Cursor ###
### Closing the Cursor ###

## PL/SQL - Records ##
### Table-Based Records ###
### Cursor-Based Records ###
### User-Defined Records ###

## PL/SQL - Exceptions ##
### Syntax for Exception Handling ###
### Raising Exceptions ###
### User-defined Exceptions ###
### Pre-defined Exceptions ###

## PL/SQL - Triggers ##
### Creation of Triggers ###
### Triggering a Trigger ###

## PL/SQL - Packages ##
1. Packages: Schema objects that groups logically related PL/SQL types, variables and subprograms
	1. It has two mandatory parts
		1. Package specification
		2. Package body or definition

### Package Specification ###
1. Specification: Interface to the package
	1. It declares types, variables, constants, exceptions, cursors, and subprograms that can be referenced from outside the package
	2. It contains all info about contents of package but excludes code for subprograms
2. All objects placed in specification are called public objects
	1. Any subprogram not in package specification but coded in package body is called private object
3. Example: Code snippet with package specification having single procedure
	1. We can have global variables defined
	2. We can have multiple procedures or functions inside a package

			CREATE PACKAGE cust_sal AS
				PROCEDURE find_sal(c_id customers.id%type);
			END cust_sal;
			/

		1. Execution procudes `Package created.`

### Package Body ###
1. Package body:
	1. Has codes for methods declared in package specification
	2. Has other private declarations (hidden from code outside package)
2. `CREATE PACKAGE BODY`: used for creation of package body
3. Example: CUSTOMERS table exists

		CREATE OR REPLACE PACKAGE BODY cust_sal AS
			PROCEDURE find_sal(c_id customers.id%TYPE) IS
			c_sal customers.salary%TYPE;
			BEGIN
				SELECT salary INTO c_sal
				FROM customers
				WHERE id = c_id;
				dbms_output.put_line('Salary: ' || c_sal);
			END find_sal;
		END cust_sal;
		/

	1. Executing produces `Package body created.`

### Using the Package Elements ###
1. Following syntax is used to access package elements (variables, procedures or functions)

		package_name.element_name;

2. Example:

		DECLARE
			code sutomers.id%type := &cc_id;
		BEGIN
			cust_sal.find_sal(code);
		END:
		/

	1. Execution:
		
			Enter value for cc_id: 1
			Salary: 3000

			PL/SQL procedure successfully completed.

#### Example ####
1. CUSTOMERS table:

		Select * from customers;

#### The Package Specification ####
1. Example:

		CREATE OR REPLACE PACKAGE c_package AS
			-- Adds a customer
			PROCEDURE addCustomer(c_id customers.id%type,
			c_name customers.name%type,
			c_age customers.age%type,
			c_addr customers.address%type,
			c_sal customers.salary%type);

			-- Removes a customer
			PROCEDURE delCustomer(c_id customers.id%type);

			-- Lists all customers
			PROCEDURE listCustomer;

		END c_package;
		/

#### Creation of Package Body ####
1. Example:

		CREATE OR REPLACE PACKAGE BODY c_package AS
			PROCEDURE addCustomer(c_id customers.id%type,
				c_name customers.age%type,
				c_addr customers.address%type,
				c_sal customers.salary%type)
			IS
			BEGIN
				INSERT INTO customers (id, name, age, address, salary)
					VALUES (c_id, c_name, c_age, c_addr, c_sal);
			END addCustomer;

			PROCEDURE delCustomer(c_id customers.id%type) IS
			BEGIN
				DELETE FROM customers
				WHERE id = c_id;
			END delCustomer;

			PROCEDURE listCustomer IS
			CURSOR c_customers is
				SELECT name FROM customers;
			TYPE c_list is TABLE OF customers.name%type;
			name_list c_list := c_list();
			counter integer := 0;
			BEGIN
				FOR n IN c_customers LOOP
				counter := counter + 1;
				name_list.extend;
				name_list(counter) := n.name;
				dbms_output.put_line('Customer(' || counter || ')' || name_list(counter));
				END LOOP;
			END listCustomer;
		END c_package;
		/

	1. Uses nested table

#### Using the Package ####
1. Program that uses `c_package`

		DECLARE
			code customers.id%type := 8;
		BEGIN
			c_package.addcustomer(7, 'Rajnish', 25, 'Chennai', 3500);
			c_package.addcustomer(8, 'Subham', 32, 'Delhi', 7500);
			c_package.listcustomer;
			c_package.delcustomer(code);
			c_package.listcustomer;
		END;
		/

## PL/SQL - Collections ##
### Index-By Table ###
### Nested Tables ###
### Collection Methods ###
### Collection Exceptions ###

## PL/SQL - Transactions ##
### Starting and Ending a Transaction ###
### Committing a Transaction ###
### Rolling Back Transactions ###
### Automatic Transaction Control ###

## PL/SQL - Date & Time ##
### Field Values for Datetime and Interval Data Types ###
### The Datetime Data Types and Functions ###
### The Interval Data Types and Functions ###

## PL/SQL - DBMS Output ##
### DBMS_OUTPUT Subprograms ###

## PL/SQL - Object Oriented ##
### Instantiating an Object ###
### Member Methods ###
### Using Map method ###
### Using Order method ###
### Inheritance for PL/SQL Objects ###
### Abstract Objects in PL/SQL ###

## PL/SQL - Questions and Answers ##
## PL/SQL - Useful Resources ##
### Useful Books on PL/SQL ###

## PL/SQL - Discussion ##
1. PL/SQL is a combination of SQL along with procedural features of programming language.
2. It is embedded in Oracle database along with SQL and Java.