# MySQL Node.js #
## Connecting to the MySQL Database Server from Node.js ##
### Installing node.js driver for MySQL ###
1. Driver: `mysqljs/mysql`
	1. `node-mysql`: folder for mysql app
	2. `npm init` - constructs package.json
	3. `npm install --save mysql` - installs MySQL package
2. `connect.js` - code that connects to MySQL database server
3. Database:
	1. `CREATE DATABASE todoapp;`

### Connecting to MySQL database server from node.js ###
1. Import mysql module

		let mysql = require('mysql');

2. Connection to MySQL database calling `createConnection()`

		let connection = mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'todoapp'
		});

3. Call `connect()` on `connection` object to connect to MySQL database server

		connection.connect(function (err) {
			if (err) {
				return console.error('error: ' + err.message);
			}

			console.log('Connected to the MySQL server.');
		});

	1. Methods which we invoke on `connection` are queued and executed in sequence

### Closing database connection ###
1. `end()` - closes connection after executing all remaining queries

		connection.end(function (err) {
			if (err) {
				return console.log('error:' + err.message);
			}

			console.log('Close the database connection.');
		});

2. `destroy()` - closes connection immediately

### Pooling connections ###
1. Example: we want connection pool with 5 connections

		var pool = mysql.createPool({
			connectionLimit: 5,
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'todoapp'
		});

2. `getConnection()` - returns connection from pool

		pool.getConnection(function (err, connection) {
			// execute query
			// ...
		});

3. `connection.release()` - returns connection to pool which is then available in pool to be used again

		pool.getConnection(function (err, connection) {
			// execute query
			// ...
			connection.release();
		});

4. `connection.destroy()` - closes connection and removes it from the pool
	1. New connection gets created the next time it is needed
	2. Connections are created lazily
		1. If only two connections are used out of five, only 2 are created
5. `end()` - closes all connections in the pool

		pool.end(function (err) {
			if (err) {
				return console.log(err.message);
			}

			// close all connections
		}); 

## Creation of Tables in MySQL from Node.js ##
1. Steps:
	1. Connect to MySQL database server
	2. Call `query()` method on `connection` object to execute `CREATE TABLE`
	3. Close database connection
2. Example:

		let mysql = require('mysql');
		let connection = mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: 'password',
			database: 'todoapp'
		});

		// connect to the MySQL server
		connection.connect(function (err) {
			if (err) {
				return console.error('error: ' + err.message);
			}

			let createTodos = `create table if not exists todos (
									id int primary key auto_increment,
									title varchar(255) not null,
									completed tinyint(1) not null default 0
								)`;

			connection.query(createTodos, function (err, results, fields) {
				if (err) {
					console.log(err.message);
				}
			});
		});

		connection.end(function (err) {
			if (err) {
				console.error(err.message);
			}
		});

	1. results: results of query
	2. fields: results fields information if any

## Inserting Rows Into a Table from Node.js ##
1. Steps:
	1. Connect to MySQL database
	2. Execute `INSERT` statement by calling `query()` method of `connection` object
	3. Close the database connection
2. Example:

		let mysql = require('mysql');
		let connection = mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: 'password',
			database: 'todoapp'
		});

		connection.connect(function (err) {
			if (err) {
				console.log(err.message);
			}

			let insertIntoTodos = `insert into todos (
										title,
										completed
									)
									values (
										'Send post',
										0
									)`;

			connection.query(insertIntoTodos, function (err, result, fields) {
				if (err) {
					console.log(err.message);
				}

				connection.end(function (err) {
					if (err) {
						console.log(err.message);
					}
				});
			});
		});

3. Example:
	1. `config.js`

			let config = {
				host: 'localhost',
				user: 'root',
				password: 'password',
				database: 'todoapp'
			};

			module.exports = config;

### Insert one row into a table ###
2. `insert.js`

		let mysql = require('mysql');
		let config = require('./config');
		let connection = mysql.createConnection(config);

		// insert statement
		let sql = `INSERT INTO TODOS (title, completed)
					VALUES ('Learn how to insert a new row', true)`;

		// execute the insert statement
		connnection.query(sql);

		connection.end();

### Inserting a row and return the inserted id ###
1. insert2.js

		let mysql = require('mysql');
		let config = require('./config.js');
		let connection = mysql.createConnection(config);

		let stmt = `INSERT INTO todos(title, completed) VALUES (?,?)`;

		let todo = ['Insert a new row with placeholders', false];

		// execute the insert statement
		connection.query(stmt, todo, (err, result, fields) => {
			if (err) {
				return console.error(err.message);
			}

			// get inserted id
			console.log('Todo Id:' + results.insertId);
		});

		connection.end();

	1. `?`: placeholder

### Insert multiple rows at a time ###
1. `insert3.js`

		let mysql = require('mysql');
		let config = require('./config');
		let connection = mysql.createConnection(config);

		let stmt = `INSERT INTO todos (title, completed)
		VALUES ?`;

		let todos = [
			['Insert multiple rows at a time', false],
			['It should work perfectly', true]
		];

		// execute the insert statement
		connection.query(stmt, [todos], (err, results, fields) => {
			if (err) {
				return console.error(err.message);
			}

			// get inserted rows
			console.log('Row inserted:' + results.affectedRows);
		});

		// close the database connection
		connection.end();

	1. Only one `?` is used

## Querying Data in MySQL Database from Node.js ##
1. Steps:
	1. Establish connection to MySQL database server
	2. Execute `SELECT` statement and process result set
	3. Close database connection

### Executing a simple query ###
1. Example:

		let mysql = require('mysql');
		let config = require('./config');

		let connection = mysql.createConnection(config);

		let sql = `SELECT * FROM todos`;
		connection.query(sql, (error, results, fields) => {
			if (error) {
				console.error(error.message);
				return;
			}
			console.log(results);
		});

		connection.end();

### Passing data to the query ###
1. select2.js

		let mysql = require('mysql');
		let config = require('./config');

		let connection = mysql.createConnection(config);

		let sql = `SELECT * FROM todos WHERE completed=?`;
		connection.query(sql, [true], (error, results, fields) => {
			if (error) {
				return console.error(error.message);
			}

			console.log(results);
		});

		connection.end();

	1. Placeholders will be substituted by values of array in sequence

### Preventing SQL injection ###
1. Example:

		let mysql = require('mysql');
		let config = require('./config);

		let connection = mysql.createConnection(config);

		let id = process.argv[2];	// pass argument to query
		let sql = `SELECT * FROM todos WHERE id = ` + id;

		connection.query(sql, (error, results, fields) => {
			if (error) {
				console.error(error.message);
				return;
			}

			console.log(results);
		});

		connection.end();

	1. Suspecious use may insert SQL statements
	2. Solution:
		1. Use `?`
		2. Use `mysql.escape()` **(M)**

				let sql = `SELECT * FROM todos WHERE id = ` + mysql.escape(id);

## Updating Data in MySQL Database from Node.js ##
1. Steps
	1. Connect to MySQL database server
	2. Execute `UPDATE` statement by calling `query()` method on `connection` object
	3. Close database connection
2. config.js

		let config = {
			host: 'localhost',
			user: 'root',
			password: 'password',
			database: 'todoapp'
		};

		module.exports = config;

### Updating data example ###
1. udpate.js

		let mysql = require('mysql');
		let config = require('./config');

		let connection = mysql.createConnection(config);

		// update statement
		let sql = `UPDATE todos SET completed = ? WHERE id = ?`;

		let data = [false, 1];

		// execute the UPDATE statement
		connection.query(sql, data, (err, results, fields) => {
			if (err) {
				console.error(error.message);
			}

			console.log('Rows affected: ' + results.affectedRows);
		});

		connection.end();

## Deleting Data in MySQL from Node.js ##
1. Steps:
	1. Establish a connection to MySQL database
	2. Execute a `DELETE` statement by calling `query()` method on `connection` object
	3. Disconnect from MySQL database server

### Deleting data example ###
1. delete.js

		let mysql = require('mysql');
		let config = require('./config');

		let connection = mysql.createConnection(config);

		// DELETE statement
		let sql = `DELETE FROM todos WHERE id = ?`;

		// delete a row with id 1
		connection.query(sql, 1, (error, results, fields) => {
			if (error) {
				console.error(error.message);
			}

			console.log('Deleted Row(s): ' + results.affectedRows);
		});

		connection.end();

	1. Array is passed for multiple data

## Calling MySQL Stored Procedures from Node.js ##
1. Steps:
	1. Connect to MySQL database server
	2. Call stored procedure by executing `CALL spName` statement. `spName` is name of stored procedure
	3. Close database connection

### Calling a MySQL stored procedure example ###
1. Stored procedure `filterTodo` - queries rows based on `completed` field

		DELIMITER $$

		CREATE PROCEDURE `filterTodo`(IN done BOOLEAN)
		BEGIN
			SELECT * FROM todos WHERE completed = done;
		END$$

		DELIMITER ;

	1. Test:

			CALL filterTodos(true);

2. storedproc.js

		let mysql = require('mysql');
		let config = require('./config');

		let connection = mysql.createConnection(config);

		let sql = `CALL filterTodos(?)`;

		connection.query(sql, true, (error, results, fields) => {
			if (error) {
				console.error(error.message);
				return;
			}

			console.log(results);
		});

		connection.end();