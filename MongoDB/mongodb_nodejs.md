# MongoDB Node.js #
## MongoDB Get Started ##
1. Node.js can be used in DB applications
2. Popular NoSQL db is MongoDB

### MongoDB ###
1. Download MongoDB database at [https://www.mongodb.com](https://www.mongodb.com/)

### Install MongoDB Driver ###
1. `npm install mongodb` **(M)**
2. Use module in Node.js

		var mongo = require('mongodb');

## MongoDB Creation of Database ##
### Creation of a Database ###
1. First get `MongoClient` **(M)** object
2. Specify connection URL with correct ip and name of database
	1. If database does not exist, MongoDB builds one and make a connection
3. Example:

		var MongoClient = require('mongodb').MongoClient;
		var URL = 'mongodb://localhost:27017/mydb';

		MongoClient.connect(url, function (err, db) {
			if (err) throw err;
			console.log('Database created!');
			db.close();
		});

4. Run the file:

		node mongodb_nodejs_sample_1.js

## MongoDB Creation of Collection ##
### Creation of a Collection ###
1. Use `createCollection()` on `db` object
2. Example:

		var MongoClient = require('mongodb').MongoClient;
		var url = 'mongodb://localhost:27017/mydb';

		MongoClient.connect(url, function (err, db) {
			if (err) throw err;
			db.createCollection('customers', function (err, res) {
				if (err) throw err;
				console.log('Collection created!');
				db.close();
			});
		});

3. Run the file

		node mongodb_nodejs_sample_2.js

## MongoDB Insert ##
### Insert Into Collection ###
1. `insertOne()` on collection to insert a document into a collection
2. Parameters:
	1. Object containing name/value pairs of each field in document
	2. callback function for working with error or result
3. Example:

		var MongoClient = require('mongodb').MongoClient;
		var url = 'mongodb://localhost:27017/mydb';

		MongoClient.connect(url, function (err, db) {
			if (err) throw err;
			var myobj = { name: 'Company Inc', address: 'Highway 37' };
			db.collection('customers').insertOne(myobj, function (err, res {
				if (err) throw err;
				console.log('1 document inserted');
				db.close();
			}));
		});

### Insert Multiple Documents ###
1. Use `insertMany()` on collection to insert many documents at once
	1. First parameter - array of objects
	2. Callback function - to work with error and/or result
2. Example:

		var MongoClient = require('mongodb').MongoClient;
		var url = 'mongodb://localhost:27017/mydb';

		MongoClient.connect(url, function (err, db) {
			if (err) throw err;
			var myobj = [
				{ name: 'John', address: 'Highway 71' },
				{ name: 'Peter', address: 'Lowstreet 4' },
				{ name: 'Amy', address: 'Apple st 652' },
				{ name: 'Hannah', address: 'Mountain 21' },
				{ name: 'Michael', address: 'Valley 345' },
				{ name: 'Sandy', address: 'Ocean blvd 2' },
				{ name: 'Betty', address: 'Green Grass 1' },
				{ name: 'Richard', address: 'Sky st 331' },
				{ name: 'Susan', address: 'One way 98' },
				{ name: 'Vicky', address: 'Yellow Garden 2' },
				{ name: 'Ben', address: 'Park Lane 38' },
				{ name: 'William', address: 'Central st 954' },
				{ name: 'Chuck', address: 'Main Road 989' },
				{ name: 'Viola', address: 'Sideway 1633' }
			];
			db.collection('customers').insertMany(myobj, function (err, res) {
				if (err) throw err;
				console.log('Number of documents inserted: ' + res.insertedCount);
				db.close();
			});
		});

### The Result Object ###
1. `res` object has information about how insertion affected the db

### The _id Field ###
1. If `_id` is not specified, MongoDB automatically adds one and assigns a unique id for each document
2. If `_id` is assigned, each value must be unique for each document

		var MongoClient = require('mongodb').MongoClient;
		var url = 'mongodb://localhost:27017/mydb';

		MongoClient.connect(url, function (err, db) {
			if (err) throw err;
			var myobj = [
				{ _id: 154, name: 'Chocolate' },
				{ _id: 155, name: 'Tasty Lemon' },
				{ _id: 156, name: 'Vanilla Dream' }
			];
			db.collection('products').insertMany(myobj, function (err, res) {
				if (err) throw err;
				console.log(res);
				db.close();
			});
		});

## MongoDB Find ##
### Find One ###
1. `find()`, `findOne()` - to find data in collection
	1. `findOne()` - returns first occurrence in collection

			var MongoClient = require('mongodb').MongoClient;
			var url = 'mongodb://localhost:27017/mydb';

			MongoClient.connect(url, function (err, db) {
				if (err) throw err;
				db.collection('customers').findOne({}, function (err, result) {
					if (err) throw err;
					console.log(result.name);
					db.close();
				});
			});

### Find All ###
1. `find()` - returns all occurrences in selection
	1. First parameter: query object
2. Example:

		var MongoClient = require('mongodb').MongoClient;
		var url = 'mongodb://localhost:27017/mydb';

		MongoClient.connect(url, function (err, db) {
			if (err) throw err;

			db.collection('customers').find({}).toArray(function (err, result) {
				if (err) throw err;
				console.log(result);
				
			});
		});

### Find Some ###
1. Second parameter in `find()` - which fields to include in result
2. Example:

		var MongoClient = require('mongodb').MongoClient;
		var url = 'mongodb://localhost:27017/mydb';

		MongoClient.connect(url, function (err, db) {
			if (err) throw err;
			db.collection('customers').find({}, { _id: false, name: true, address: true }).toArray(function (err, result) {
				if (err) throw err;
				console.log(result);
				db.close();
			});
		});

3. Specifying fields we do not need in result:

		var MongoClient = require('mongodb').MongoClient;
		var url = 'mongodb://localhost:27017/mydb';

		MongoClient.connect(url, function (err, db) {
			if (err) throw err;

			db.collection('customers').find({}, { _id: false }).toArray(function (err, result) {
				if (err) throw err;

				console.log(result);
				db.close();
			});
		});

### The Result Object ###
1. To return a specific field:
	1. Example:

			console.log(result[2].address);

## MongoDB Query ##
### Filter the Result ###
1. We can filter results using query object to limit search
2. Example:

		var MongoClient = require('mongodb').MongoClient;
		var url = 'mongodb://localhost:27017/mydb';

		MongoClient.connect(url, function (err, db) {
			if (err) throw err;

			var query = { address: 'Park Lane 38' };

			db.collection('customers').find(query).toArray(function (err, result) {
				if (err) throw err;

				console.log(result);
				db.close();
			});
		});

### Filter With Regular Expressions ###
1. Regular expressions can only be used to query strings
2. Example: To find documents with address starting with `S`

		var MongoClient = require('mongodb').MongoClient;
		var url = 'mongodb://localhost:27017/mydb';

		MongoClient.connect(url, function (err, db) {
			if (err) throw err;
			var query = { address: /^S/ };
			db.collection('customers').find(query).toArray(function (err, result) {
				if (err) throw err;
				console.log(result);
				db.close();
			});
		});

## MongoDB Sort ##
### Sort the Result ###
1. `sort()` **(M)** - used to sort in ascending or descending order
2. Example:

		var MongoClient = require('mongodb').MongoClient;
		var url = 'mongodb://localhost:27017/mydb';

		MongoClient.connect(url, function (err, db) {
			if (err) throw err;
			var mysort = { name: 1 };

			db.collection('customers').find().sort(mysort).toArray(function (err, result)) {
				if (err) throw err;
				console.log(result);
				db.close();
			}
		});

### Sort Descending ###
1. Use `{ name: -1 }` for descending order
2. Example:

		var MongoClient = require('mongodb').MongoClient;
		var url = 'mongodb://localhost:27017/mydb';

		MongoClient.connect(url, function (err, db) {
			if (err) throw err;
			var mysort = { name: -1 };

			db.collection('customers').find().sort(mysort).toArray(function (err, result) {
				if (err) throw err;
				console.log(result);
				db.close();
			});
		});

## MongoDB Delete ##
### Delete Document ###
1. `deleteOne()` **(M)**
	1. First parameter - query object defining which document to delete
2. Example:

		var MongoClient = require('mongodb').MongoClient;
		var url = 'mongodb://localhost:27017/mydb';

		MongoClient.connect(url, function (err, db) {
			if (err) throw err;
			var myquery = { address: 'Mountain 21' };
			db.collection('customers').deleteOne(myquery, function (err, obj) {
				if (err) throw err;
				console.log('1 document deleted');
				db.close();
			});
		});

### Delete Many ###
1. `deleteMany()` **(M)**
	1. First parameter: query object defining which documents to delete
2. Example:

		var MongoClient = require('mongodb').MongoClient;
		var url = 'mongodb://localhost:27017/mydb';

		MongoClient.connect(url, function (err, db) {
			if (err) throw err;
			var myquery = { address: /^O/ };
			db.collection('customers').deleteMany(myquery, function (err, obj) {
				if (err) throw err;
				console.log(obj.result.n + ' document(s) deleted');
				db.close();
			});
		});

### The Result Object ###
1. `deleteMany()` returns an object which contains information about how execution affected the database
	1. `result` object tells us if execution went OK and how many documents were affected

			{ n: 1, ok: 1 }

		1. Use the object to return number of deleted documents:

				console.log(obj.result.n);

## MongoDB Drop Collection ##
### Drop Collection ###
1. `drop()` **(M)** drops a collection
	1. takes callback function containing error object and result parameter (true if collection was dropped successfully otherwise false)
	
			var MongoClient = require('mongodb').MongoClient;
			var url = 'mongodb://localhost:27017/mydb';

			MongoClient.connect(url, function (err, db) {
				if (err) throw err;
				db.collection('customers').drop(function (err, delOk) {
					if (err) throw err;
					if (delOK) console.log('Collection deleted');
					db.close();
				});
			});

### db.dropCollection ###
1. `dropCollection()` takes two parameters
	1. name of collection
	2. callback function
2. Example:

		var MongoClient = require('mongodb').MongoClient;
		var url = 'mongodb://localhost:27017/mydb';

		MongoClient.connect(url, function (err, db) {
			if (err) throw err;
			db.dropCollection('customers', function (err, delOK) {
				if (err) throw err;
				if (delOK) console.log('Collection deleted');
				db.close();
			});
		});

## MongoDB Update ##
### Update Document ###
1. `updateOne()`
	1. first parameter - query object defining which document to update
		1. Only first occurrence is updated
	2. second parameter - object defining new values of document
		1. All fields get updated by default except `_id`
			1. All field values must be set or else other values will be empty
2. Example:

		var MongoClient = require('mongodb').MongoClient;
		var url = 'mongodb://127.0.0.1:27017/mydb';

		MongoClient.connect(url, function (err, db) {
			if (err) throw err;
			var myquery = { address: 'Valley 345' };
			var newValues = { name: 'Mickey', address: 'Canyon 123' };
			db.collection('customers').updateOne(myquery, newvalues, function (err, res) {
				if (err) throw err;
				console.log('1 document updated');
				db.close();
			});
		});

### Update Only Specific Fields ###
1. `$set` operator is used to update only specific fields
2. Example:

		...
		var myquery = { address: 'Valley 345' };
		var newvalues = { $set: { address: 'Canyon 123' } };
		db.collection('customers').updateOne(myquery, newvalues, function (err, res) {
		...})
		...

### Update Many Documents ###
1. `updateMany()` **(M)**
2. Example:

		var MongoClient = require('mongodb').MongoClient;
		var url = 'mongodb://localhost:127.0.0.1:27017/mydb';

		MongoClient.connect(url, function (err, db) {
			if (err) throw err;
			var myquery = { address: /^S/ };
			var newvalues = { $set: {name: 'Minnie' } };
			db.collection('customers').updateMany(myquery, newvalues, function (err, res) {
				if (err) throw err;
				console.log(res.result.nModified + ' document(s) udpated');
				db.close();
			});
		});

### The Result Object ###
1. `updateOne()` and `updateMany()` return an object that contains information such as `result` which tells if execution went OK and how many documents were affected

		{ n: 1, nModified: 2, ok: 1 }

	1. Using the object:

			console.log(res.result.nModified);

## MongoDB Limit ##
### Limit the Result ###
1. `limit()` - limits result of MongoDB
	1. parameter - number (defines number of documents)
2. Example:

		var MongoClient = require('mongodb').MongoClient;
		var url = 'mongodb://localhost:27017/mydb';

		MongoClient.connect(url, function (err, db) {
			if (err) throw err;

			db.collection('customers').find().limit(5).toArray(function (err, result) {
				if (err) throw err;
				console.log(result);
				db.close();
			});
		});

## MongoDB Join ##
### Join Collections ###
1. We can perform left outer join using `$lookup` stage
	1. `$lookup` lets us specify which collection we want to join with current collection and which fields should match
2. Example: Consider `orders` collection and `products` collection

		[
			{ _id: 1, product_id: 154, status: 1 }
		]

		[
			{ _id: 154, name: 'Chocolate' },
			{ _id: 155, name: 'Tasty Lemons' },
			{ _id: 156, name: 'Vanilla Dreams' }
		]

	1. Joining products to orders collection

			var MongoClient = require('mongodb').MongoClient;
			var url = 'mongodb://localhost:27017/mydb';

			MongoClient.connect(url, function (err, db) {
				if (err) throw err;
				db.collection('orders').aggregate([
					{ $lookup:
						{
							from: 'products',
							localField: 'product_id',
							foreignField: '_id',
							as: 'orderdetails'
						}
					}
				], function (err, res) {
					if (err) throw err;
					console.log(JSON.stringify(res));
					db.close();
				});
			});
