# Database Design #

## Keys ##
### Introduction to Keys ###
1. Keys in db: **keeps everything unique**
2. Example: User

		User:
		user_name, first_name, last_name, password, email
		
		email:
		123@xxx.xxx
		abc@xxx.xxx
		xyz@xxx.xxx
		
	1. A key separates each frow the other rows
		1. When we sign up for website - email can be unique
			1. Example of a key
				1. Does not require defining another column for a key
		2. If a website allows using email more than once - it cannot be a good key
	2. Key is always unique - cannot repeat in the table
3. If website allows multiple emails
	1. password - can repeat (if not, hackers can get a clue that it is used and try with other accounts to open them)
	2. first_name - can repeat
	3. last_name - can repeat
	4. user_name - it is unique
		1. first_name, last_name, password, email - point to the user_name (key)
			1. the fields are there for the user with the user_name (key)
4. **Key should never change**
	1. Everything points to the key - depend on the key
	2. If we can change this - it violates integrity of the database
		1. If we are connecting two tables, if we change the key, then the connection needs to be updated (not efficient to change for thousands or millions of records)
5. **Never Null** - no value is not allowed

### Primary Key Index ###
1. Index - Book
	1. Index at the back
		1. A list of topics and if any topic is interesting, the page number is given to which we can go to.
	2. Phonebook - data is already sorted and we can go to the name quickly to find the phone number
2. Index - DB
	1. Example: 6 Billion rows - find everyone with name "Caleb"
		1. DB server may have to go through every row to find all the rows that match the criteria (takes too much time)
		2. Solution: Index
			1. Once case: Re-order data (sort) - it is faster to find (binary search)
			2. Example:

					SELECT * 
					FROM users
					WHERE first_name = 'Caleb';
					
				1. View: User + Comments
					1. Join - uses key (primary key) - user_name
					2. ID - can be used as key
		3. Key - a type of index (there are other types)

### Look up Table ###
1. Example: Membership db, users table

		membership:
		1	gold
		2	silver
		3	platinum
		...
		
		members: (one-to-many) - put key from one table to many table
		..., membership
		     1 (refers to id of membership table)
		     1
		     1
		     3
		     2
		     2
		     3
		     ...
		     
	1. Foreign key:
		1. Helps protect the integrity of the DB
			1. Only x possibilities (from common table)
				1. If someone tries to add an unknown foreign key, it results in an error
			2. We can restrict to non-empty values
			3. The description can be changed without affecting the referring table (silver -> diamond)
				1. Only one change
					1. One doesn't have to change 6000 rows in the referring table (minimal changes - less maintenance)
		2. Foreign key constraint:
			1. Relations (tables) are connected (using keys)
				1. Keys:
					1. Uses:
						1. Protects integrity
							1. How? duplicates don't need to be updated
						2. Unique (id gives unique row)
							1. Even if membership id is repeated in the main table, we are talking about only one membership type (unique) 
								1. If row data is repeated, then uniqueness is lost
						3. Improves functionality (of db)
							1. Speed
						4. Less work (only one row is updated)
						5. Allows for added complexity
			2. Example:

					Members:
					
					Membership: (lookup table)
					id, name
					
				1. We can add new column (price - allows for added complexity)
					1. Suppose we did not have membership table

							Members:
							id, user_name, membership_id, name
							
						1. Data is repeated many times (wasting space, updates are costly and might compromise integrity of data (a few rows are updated and others are not)
					2. We can add more columns and the referring table does not get affected
2. Use cases: Whenever there are set number of options
	1. A new table is created with id and name of the option
		1. Countries
		2. Gender
		3. Cities
		4. Membership Types

### Superkey and Candidate Key ###
1. 

### Primary Key and Alternate Key ###
1. Primary Key:
	1. Candidate Keys
		1. List of possibilities
			1. Example: user_name, email, fn + ln + address + dob
				1. One of the candidate keys can be picked as primary key
					1. Rules:
						1. Unique
						2. Never changing
						3. Never null
			2. **username** - all rules are satisfied (good pk)
			3. email - unique, might change or not (update is possible), possible - it is possible to be a pk
			4. fn + ln + address + dob - almost impossible to clash
				1. middle name - might not exist
					1. Cannot be a primary key
	2. **username** - is a good pk
		1. can be used to connect the tables (from user table)
2. primary key can be index
	1. Can be used in select statements
3. Alternate key:
	1. All the candidate keys that were not selected as a primary key
	2. We don't have to define any alternate key in a database
		1. We may want to define
			1. Use case - search
				1. Index on alternate key is possible
					1. Example: select data by email
		2. Cons: DB has to maintain the index (even for alternate keys)
			1. If alternate keys are updated, then index needs to be updated

### Surrogate Key and natural Key ###
1. Category of primary keys - this is design terminology
2. Surrogate Key
	1. Made up keys (not in the business requirements)
3. Natural Key
	1. Something naturally in the table
		1. `user_name`
		2. `email`
	2. We may not have a natural key
4. It is better not to mix up both types of keys in the same database (confusing)
5. Problems with natural keys:
	1. They have real world value
		1. Meaning of the keys might adapt
6. Surrogate keys
	1. Just added
		1. ID - column
			1. Example:

					user_id
					sale_id
					comment_id
					
				1. ID - has autoincrement feature
				2. If rows are deleted, it does not matter because they don't have real-world significance
					1. They are just random numbers
	2. Surrogate keys are generally kept private
		1. Only people working on the DB know about them
			1. Doesn't have real world meaning (if that is given out - it becomes a natural key - since it has real world meaning)
7. If we are struggling to find a good natural key, we can add surrogate key
	1. Problem: We must try to make everything naturally unique
		1. `user_name`
			1. Can be used to index (useful for search)
				1. It will not be used to make connections between tables (since surrogate key is the key if it exists) 

### Should I use Surrogate Keys or Natural Keys? ###
1. Surrogate Keys vs Natural Keys
	1. Surrogate Keys
		1. Added keys - user_id, car_id, credit_card_id, comment_id (no real world meaning)
		2. Cons: Adding additional column to table
			1. If natural key already exists in the table, then we might unnecessarily be adding a new column
		3. Pros: Typically numbers (natural keys can be words or anything more complex)
			1. Numbers could be easy to work with in many cases
				1. user_id - can be used across all tables
					1. It is good to have a good column name to avoid confusion
	2. Natural Keys
		1. They are natural to the table
		2. Lesser storage required
		3. Cons: Difficult to find a good natural key (challenging and time consuming to find)
			1. Difficult to find column(s) that satisfy
				1. Uniqueness
				2. Never Changing
				3. Never Null
		4. Example: comments: user, date_time, web_page (combination)
		5. They have real world meaning
			1. The real-world meaning can change over time
			2. The values can change
			3. If so, we need to update all connections in the db
				1. Server resource usage is high
2. Which one to use?
	1. Surrogate key: Every table should get an id
		1. keep one or the other
		2. Surrogate key can be simple (single column)
	2. Student id: Is not a surrogate key (it is a natural key)
	3. There are minor performance differences
	4. Look up - on the internet to know more

### Foreign Key ###
1. It is a reference
	1. It references a primary key
		1. It can be in the same table
		2. It can be in a different table
2. Example: Class table

		Class:
		class_id, instructor_id, building_id, ...
		
	1. primary key: `class_id`
	2. `instructor_id` and `building_id` are not related to the `Class` table
	
			Instructor:
			instructor_id, ...
			
			Building:
			building_id, name, ...
			7            legit
			
			class_id, instructor_id, Building_id, name
			7         63             16           Biology
			8         63             17           Chemistry
			
		1. Columns have column rules - requirements
			1. Every value in `instructor_id` and `building_id` must refer to a value in `Instructor` and `Building` tables
			2. Foreign keys can have multiple columns but each column can have only one reference

### NOT NULL Foreign Key ###
1. `NOT NULL` - value is mandatory in the column
	1. Example: `fax_no`
		1. Everyone doesn't have Fax no - it must not be `NOT NULL`
2. Whether or not a relationship is required?
	1. Example: If we had `NOT NULL`
		1. If anyone who doesn't have a value for this column, they are restricted from putting any information in the table
			1. If it is a foreign key - then every row must have a relationship with another table
	2. Foreign key can be empty if it is not mandatory to have the relationship
		1. One can define or update the relationship (which might not be desirable)
			1. We don't want primary key values to change
			2. We could have foreign key references to change

					Car:
					car_id, name 
					6       ...  (we don't want the car_id to change)
					10      ...
					
					User:
					... car_id, ...
					    6				(can be changed to 10)
					    
3. Primary key constraints
	1. Always `NOT NULL`
4. Foreign key constraints
	1. It can be NULL (optional) - not required

			class:
			class_id, instructor_id, name
			7         8              math
			
			instructor:
			instructor_id, name
			16             Jake
			8              Caleb
			
		1. If `NOT NULL` is added, the `class` table row must have an `instructor_id`
			1. Bad:
				1. If instructor is not yet assigned
				2. If instructor has left and need to find another one
		2. Example:

				card:
				card_id, person_id
				
				person:
				person_id
				
			1. Scenarios:
				1. New cards - no owner
				2. card has expired and owner removed

### Foreign Key Constraints ###
1. **Referential Integrity** - To protect the integrity of the database
2. MySQL - DBMS Specific keywords

### Simple Key, Composite Key, Compound Key ###
### Review of Keys and Key Points ###

## Introduction to Database Normalization ##
### Introduction to Database Normalization ###
1. Process - We go through database plan and correct things that may cause data integrity problems, repeating data, ...
2. Normal forms:
	1. Checklist to follow - Result is good database 
	2. 1NF
	3. 2NF
	4. 3NF
3. 3 steps of normalization
	1. More steps can be added
4. Why do we have these?
	1. Gives a systematic way to produce a well structured database
		1. Everything needs to atomic
		2. Data depending on other data
5. Primary key: 608
	1. 608 - Caleb - depends on primary key
	2. 609 - Boaz (a new entity)
6. Dependency
7. 1NF is pre-requisite for 2NF
8. 2NF is pre-requisite for 1NF
9. If in 3NF, we are already in 1NF and 2NF

### 1NF ###
1. Atomicity
	1. Example:
		1. Address column - not atomic (we have multiple types of values)
			1. We can break it up into multiple columns to get atomicity
		2. email column - has multiple values
			1. We can convert to multiple rows

					user_id	fn	ln	email
					5			A	M	a@m.com
					5			A	M	b@m.com
					
				1. We cannot have duplicate keys (which is not allowed)
				2. If we change fn in one row and leave the other unchanged, then we have conflicting data (data integrity violation)
2. Solution:
	1. User table:

			user:
			user_id (pk)	fn	ln	country	street
			5				A	M	I			S
			
			email:
			email_id	email		user_id (fk)
			1			a@m.com	5
			2			b@m.com	5

### 2NF ###
1. Partial dependency - column depends on part of the primary key
	1. primary key - composite key (multiple columns)
2. Example:
	1. person_id - name, phone, email
		1. name, phone, email depend upon person_id (dependency)
	2. car_id - name has no dependency on car_id
		1. car_color has dependency on the car_id
3. What is partial dependency?
	1. Surrogate keys (?) - for many to many relationship - has an intermediate table
		1. Books vs Authors (many-to-many)
			1. One book can be written by many authors
			2. One author can write many books
		2. Example:

				author
				author_id	fn	ln	birthdate
				
				book_author
				book_id	author_id (both are key together)
				author_position (main author)
					1. book_id - 1
					2. author_id - 17
					3. author_position - 1
				
				book
				book_id	isbn	publisher
				
			1. Suppose isbn is added to book_author table
				1. It only has dependency on the book_id but not on the author_id (partial dependency)
					1. How to fix it?
						1. Put it in Book table
			2. In general: If there is a column that partially depends on primary key
				1. Pull both column and partial primary key into another table
				2. Reference the new table using foreign key

### 3NF ###
1. Transitive dependency - one column depends on another column which depends on primary key (pre-requisites: 1NF, 2NF)
	1. Example: Review table
		1. Shopping website
			1. Book or Car
		2. Video review
		3. Book review

				review:
				review_id
				review
				star
				star_meaning
				user_id (fk)
				
			1. star_meaning depends on star
				1. if star becomes 4 from 5, then star_meaning changes to "very good" from "excellant"
			2. star depends on review_id
				1. If we change review_id, then star will change
	2. There could be multiple transitive dependencies
2. Fix: Remove columns and put them in separate table and refer to the table using foreign key

		review:
		review_id
		review
		star_id (fk)
		user_id (fk)
		
		star:
		star_id
		star
		star_meaning
		
	1. Example:

			star_id	star	star_meaning
			1			1		bad
			2			2		below average
			3			3		average
			4			4		good
			5			5		excellant

### Indexes ###
1. Book - back has indexes
	1. If we look up a word
	2. We can get the page number for the content
	3. We can go to the page number directly
2. Index: List of where certain data points are
3. Phone book:
	1. Sorted in alphabetical order and we can efficiently search for the name and then get the phone number(s)
4. Non Clustered Index: First example
	1. Sorts data points (not actual data) and gives location of the actual data (points to the data)
	2. We can have multiple non-clustered indexes
		1. We can have different lists organised differently for the same data organisation
5. Clustered Index: Re-organises actual data so that it is easy to use (organises actual data)
	1. We can have only one clustered index
		1. The actually data is organized (and there is only one way it is organised)
			1. If we organise phone book by phone number (0000000001 to 9999999999) - this is another clustered index
6. Non-clustered index for phone numbers:
	1. 0000000001 - page 764
	2. 0000000002 - page 254
7. Database:
	1. Certain columns will be used frequently
		1. Access to those columns should be fast
			1. Index is created
	2. If database is not indexed, it must do a table scan (if millions of rows, it takes a long time)
		1. If there is an index: We can do index seek (where to go to directly to access that data)
			1. cons: If we update table, index must also be updated
				1. Book: If new pages are added or content is changed, the index at the back needs to be updated
	3. Example:

			select first_name, last_name, phone_no, email from user where user_id = 72;
			
		1. primary_key - used as clustered index (sorted data) - it can be any other column as well
			1. Binary search or fast algorithm can be used to find the record
		2. Non-clustered index
			1. first_names and last_names are sorted and stored in the index which point to the location of the record (if first_name and last_name are going to be used a lot)
	4. In `where` clause, we can use an indexed column (or columns) to speed up search
	5. To increase speedup of joins
		1. Example: user table, comment table

				user:
				user_id
				first_name
				last_name
				...
				
				comment:
				comment_id
				comment
				
			1. join: easier to read (populating with first_name, last_name) - we get new table

					select u.first_name, u.last_name, c.comment from user u, comment c where u.user_id = c.user_id;
					
				1. `user_id` needs to be indexed (connecting column(s))
	6. Composite index:
		1. Two or more columns
			1. first_name and last_name
				1. We need to do both
					1. Exception: MySQL
						1. index on last_name and then on first_name (say)
						
								select * from user where last_name = 'john' - works
								
								select * from user where last_name = 'john' and first_name = 'paul' - works
								
								slect * from user where first_name = 'paul' - does not work (not setup)
								
							1. It should be on the left
		2. If index is setup for a composite, it is better to use the composite in `where` clause (instead of a fewer columns - because different dbs setup indexes differently) 

### Data Types ###
1. Every value in column must have a data type
	1. Desigining - data type can be defined
2. Three categories of data types (may vary with DBMS)
	1. Date
		1. Date - stores a date (22:05:1998 - might vary with DBMS)
		2. Time - stores time (12:30:32)
		3. DateTime - combination of date and time
		4. Timestamp - records time at which something was done
			1. Could be milliseconds
			2. Month, day, hour, minutes, seconds, milliseconds (combination)
			3. Use cases:
				1. Creation
				2. Updation
	2. Numeric
		1. sub category:
			1. `decimal` - base 10
			2. `float` - binary (presented as decimal)
				1. Not easy to get `0.1` in binary
					1. We need combination which can get very close but not exact
					
							0.0101 = 1/4 + 1/16 = 5/16 = 0.3125
							
						1. decimal - stores differently
			3. Integer - stores only whole numbers without decimals
			4. Unsigned or signed
				1. signed numbers have different range as compared to unsigned
	3. String
		1. characters
			1. Put in quotes: "Hey", "3"
		2. `char` or `varchar`
			1. `char` - length doesn't change - `char(8)` (8 chars - if 6 chars are entered, 2 chars are blank)
			2. `varchar` - variable length strings
				1. `varchar(8)` - size can vary from 0 to 8 characters
		3. Sub data type: `text` - for large strings (comments, messages)
