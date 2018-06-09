# Stored Procedures with Hibernate #
## Overview ##
1. Stored procedures: Sets of compiled SQL statements residing in the database
	1. Encapsulate logic and share with other programs
	2. Takes benefit of database-specific features like index hints or specific keywords
2. Use Hibernate to call stored procedure in MySQL database

## Stored Procedure in MySQL ##
1. Stored procedure to get all records from a foo table

		DELIMITER //
			CREATE PROCEDURE GetAllFoos()
				LANGUAGE SQL
				DETERMINISTIC
				SQL SECURITY DEFINER
				BEGIN
					SELECT * FROM foo;
				END //
		DELIMITER ;

	1. Before `BEGIN` are optional statements
		1. [MySQL Documentation](http://dev.mysql.com/doc/refman/5.7/en/create-procedure.html)
	2. Execution: `CALL GetAllFoos();`

## Call a Stored Procedure with Hibernate ##
1. We can use raw SQL statements including stored procedures to query a database

### Configuration ###
1. Maven dependencies
2. MySQL configuration
3. Hibernate configuration
4. Session factory instantiation [Hibernate article](http://www.baeldung.com/hibernate-4-spring)

### Call a Stored Procedure Using the `CreateNativeSQL` Method ###
1. We can express queries in native SQL format

		Query query = session.createSQLQuery("CALL GetAllFoos()").addEntity(Foo.class);
		List<Foo> allFoos = query.list();

	1. Each element is a Foo object
	2. `addEntity()` - used to get entity objects from native SQL query
		1. Or else `ClassCastException` if stored procedure returns non-raw value

### Call a Stored Procedure Using `@NamedNativeQueries` ###
1. Another way `@NamedNativeQueries` - used to specify an array of native SQL named queries **scoped to the persistence unit**

### Call a Stored Procedure Using `@NamedStoredProcedureQuery` ###

## Stored Procedures with Parameters ##
## Conclusion ##