# Stored Procedures with Hibernate #
## Overview ##
1. Stored procedures are compiled SQL statements in database
2. Benefits:
	1. DB specific features
		1. Index hints
		2. Specific keywords
3. Topic:
	1. Calling stored procedure from MySQL DB

## Stored Procedures in MySQL ##
1. Stored procedure example:
	1. Getting all records from foo table

			DELIMITER //
				CREATE PROCEDURE GetAllFoos()
					LANGUAGE SQL
					DETERMINISTIC
					SQL SECURITY DEFINER
					BEGIN
						SELECT * FROM foo;
					END //
			DELIMIER;

2. Statements before `BEGIN` are optional statements
3. `CALL` to execute:

		CALL GetAllFoos();

## Call a Stored Procedure with Hibernate ##
1. We can use raw SQL statement with stored procedures

### Configuration ###
1. [Hibernate article](https://www.baeldung.com/hibernate-4-spring)

### Call a Stored Procedure Using the CreateNativeSQL Method ###
1. Native query:

		Query query = session.createSQLQuery("CALL GetAllFoos()").addEntity(Foo.class);
		List<Foo> allFoos = query.list();

	1. The result is a list of `Foo` objects
	2. `addEntity()` - helps in getting entity objects from SQL query
		1. Or else `ClassCastException` will be thrown if stored procedure returns non-raw value

### Call a Stored Procedure Using @NamedNativeQueries ###
1. `@NamedNativeQueries`
	1. Used to specify an array of native SQL named queries **scoped to the persistence unit**

			@NamedNativeQueries({
				@NamedNativeQuery(
					name = "callGetAllFoos",
					query = "CALL GetAllFoos()",
					resultClass = Foo.class
				)
			})
			@Entity
			public class Foo implements Serializable {
				// Model definition
			}

		1. `name` - name of query
		2. `resultClass` - `Foo` entity

				Query query = session.getNamedQuery("callGetAllFoos");
				List<Foo> allFoos = query.list();

			1. `resultClass` - sames role as `addEntity()`
				1. The approaches can be used interchangeably

### Call a Stored Procedure Using @NamedStoredProcedureQuery ###
1. From JAP 2.1
	1. If using Hibernate implementation of `EntityManagerFactory` and `EntityManager`
		1. `@NamedStoredProcedureQuery` can be used

				@NamedStoredProcedureQuery(
					name = "GetAllFoos",
					procedureName = "GetAllFoos",
					resultClasses = { Foo.class }
				)
				@Entity
				public class Foo implements Serializable {
					// Model Definition
				}

			1. To call

					StoredProcedureQuery spQuery = entityManager.createNamedStoredProcedureQuery("getAllFoos");

				1. `StoredProcedureQuery` object's `execute()` can be called to get `Foo` entities

## Stored Procedures with Parameters ##
1. Example:

		DELIMITER //
			CREATE PROCEDURE GetFoosByName(IN fooName VARCHAR(255))
				LANGUAGE SQL
				DETERMINISTIC
				SQL SECURITY DEFINER
				BEGIN
					SELECT * FROM foo WHERE name = fooName;
				END //
		DELIMITER;

	1. To call

			Query query = session.createSQLQuery("CALL GetFoosByName(:fooName)")
				.addEntity(Foo.class)
				.setParameter("fooName", "New Foo");

2. With `@NamedNativeQuery` **(M)**

		@NamedNativeQuery(
			name = "callGetFoosByName",
			query = "CALL GetFoosByName(:fooName)",
			resultClass = Foo.class
		)

	1. Calling

			Query query = session.getNamedQuery("callGetFoosByName")
							.setParameter("fooName", "New Foo");

3. With `@NamedStoredProcedureQuery` **(M)**

		@NamedStoredProcedureQuery(
			name = "GetFoosByName",
			procedureName = "GetFoosByName",
			resultClasses = { Foo.class },
			parameters = {
				@StoredProcedureParameter(name = "fooName", type = String.class, mode = ParameterMode.IN)
			}
		)

	1. Calling:

			StoredProcedureQuery spQuery = entityManager.createNamedStoredProcedureQuery("GetFoosByName")
			.registerStoredProcedureParameter(
				"New Foo",
				String.class,
				ParameterMode.IN
			);

## Conclusion ##
