# Mongoose JS #

## Quickstart ##
1. Prerequisites:
	1. MongoDB
	2. NodeJS
2. Installation:

		npm install mongoose

3. Requirement:
	1. Record every fuzzy kitten we ever meet in MongoDB
4. Steps:
	1. Include mongoose in the project

			// getting-started.js
			var mongoose = require('mongoose');

	2. Open a connection to `test` database on local running instance of MongoDB

			mongoose.connect('mongodb://localhost/test');

	3. We have pending connection to `test` database running on localhost. We need notification if we have successfully connection or if an error has occured

			var db = mongoose.connection;
			db.on('error', console.error.bind(console, 'connection error:'));
			db.once('open', function () {
				// we're connected!
			});

		1. Callback is called once connection is opened
	4. Add the following code inside the callback
		1. Define a schema and get a reference to it

				var kittySchema = mongoose.Schema({
					name: String
				});

			1. Schema with property `name` of type `String`
		2. Compile schema into model

				var Kitten = mongoose.model('Kitten', kittySchema);

			1. Model: Class with which we construct documents
			2. Each document should be a kitten with properties and behaviors as declared in schema.
		3. New kitten

				var silence = new Kitten({ name: 'Silence' });
				console.log(silence.name);	// 'Silence'

		4. Kittens can meow so we can add speak function

				// NOTE: methods must be added to the schema before compiling it with mongoose.
				kittySchema.methods.speak = function () {
					var greeting = this.name ? "Meow name is " + this.name: "I don't have a name";
					console.log(greeting);
				}

				var Kitten = mongoose.model('Kitten', kittySchema);

		5. Functions added to `methods` property in schema get compiled into `Model` prototype and exposed on each document instance

				var fluffy = new Kitten({ name: 'fluffy' });
				fluffy.speak();	// "Meow name is fluffy"

		6. Each document can be saved to mongodb using it's `save` method. First argument is error if any occured

				fluffy.save(function (err, fluffy) {
					if (err) return console.error(err);
					fluffy.speak();
				});

		7. Display all kittens using Kitten model

				Kitten.find(function (err, kittens) {
					if (err) return console.error(err);
					console.log(kittens);
				});

		8. To filter kittens by name, use querying syntax

				Kitten.find({ name: /^fluff/ }, callback);
	
			1. Returns as an array of kittens

## Guide ##
### Schemas ###
1. Defining schema
	1. Each schema maps to a mongodb collection and defines shape of objects in the collection

			var mongoose = require('mongoose');
			var Schema = mongoose.Schema;

			var blogSchema = new Schema({
				title: String,
				author: String,
				body: String,
				comments: [{ body: String, date: Date }],
				date: { type: Date, default: Date.now },
				hidden: Boolean,
				meta: {
					votes: Number,
					favs: Number
				}
			});

		1. Each key in the schema defines a property in document
		2. Casting is with associated SchemaType
			1. `title` will be cast to `String` SchemaType
			2. `date` will be case to `Date` SchemaType
		3. Keys can be assigned nested objects containing key/type definitions
	2. Permitted SchemaTypes
		1. String
		2. Number
		3. Date
		4. Buffer
		5. Boolean
		6. Mixed
		7. ObjectId
		8. Array
	3. Schemas can also defined:
		1. Instance methods
		2. Static [Model methods](http://mongoosejs.com/docs/guide.html#statics)
		3. [Compound indexes](http://mongoosejs.com/docs/guide.html#indexes)
		4. Document lifecycle hooks called [Middleware](http://mongoosejs.com/docs/middleware.html)

2. Creation of a model
	1. Need to convert `blogSchema` into a `Model`.

			var Blog = mongoose.model('Blog', blogSchema);

3. Instance methods
	1. Instances of models are documents.
	2. Documents have many built in instance methods
	3. We can define custom document instance methods too
	4. Example:

			var animalSchema = new Schema({ name: String, type: String });

			// assign a function to the "methods" object of our animalSchema
			animalSchema.methods.findSimilarTypes = function (cb) {
				return this.model('Animal').find({ type: this.type }, cb);
			};

		1. All animal instances have the method

				var Animal = mongoose.model('Animal', animalSchema);
				var dog = new Animal({ type: 'dog' });
			
				dog.findSimilarTypes(function (err, dogs) {
					console.log(dogs);	// woof
				});

			1. Do not overwrite default methods
			2. Do not declare methods using ES6 arrow functions `=>`
				1. They prevent binding `this` - method will not have access to document

4. Statics
	1. Adding static methods to model
	
			// assign a function to the "statics" object of our animalSchema
			animalSchema.statics.findByName = function(name, cb) {
				return this.find({ name: new RegExp(name, 'i') }, cb);
			};

			var Animal = mongoose.model('Animal', animalSchema);
			Animal.findByName('fido', function(err, animals) {
				console.log(animals);
			});

		1. Do not declare statics using ES6 arrow functions `=>`
			1. Prevent's binding `this`
		
5. Query Helpers
	1. Query helper functions are like instance methods but for mongoose queries.
		1. Helps to extend mongoose's [chainable query builder API](http://mongoosejs.com/docs/queries.html)
	2. Example:

			animalSchema.query.byName = function (name) {
				return this.find({ name: new RegExp(name, 'i') });
			};

			var Animal = mongoose.model('Animal', animalSchema);
			Animal.find().byName('fido').exec(function (err, animals) {
				console.log(animals);
			});

6. Indexes
	1. MongoDB supports [secondary indexes](http://docs.mongodb.org/manual/indexes/)
		1. Mongoose is used to define indexes within Schema at path level or at schema level
			1. Schema level indexes: compound indexes

					var animalSchema = new Schema({
						name: String,
						type: String,
						tags: { type: [String], index: true }  // field level
					});

					animalSchema.index({ name: 1, type: -1 });  // schema level

				1. When app starts, Mongoose automatically calls `ensureIndex` for each defined index in schema.
				2. Mongoose will call `ensureIndex` for each index sequentially, and emit 'index' event on model when all `ensureIndex` calls succeeded or when there was an error.
				3. Not recommended for production since index creation can cause significant performance impact.
					1. Disable by setting `autoIndex` of schema to `false` or globally on connection by setting `config.autoIndex` to `false`

							mongoose.connect('mongodb://user:pass@localhost:port/database', { config: { autoIndex: false } });
							// or
							mongoose.createConnection('mongodb://user:pass@localhost:port/database', { config: { autoIndex: false } });
							// or
							animalSchema.set('autoIndex', false);
							// or
							new Schema({..}, { autoIndex: false });

	2. Sparse indexes: Indexes that contain entires for documents that have indexed field, even if index field contains null value.
		1. Skips document that does not have indexed field
		2. It does not include all documents of a collection

				// Will cause an error because mongodb has an _id index by default that
				// is not sparse
				animalSchema.index({ _id: 1 }, { sparse: true });
				var Animal = mongoose.model('Animal', animalSchema);

				Animal.on('index', function (error) {
					// "_id index cannot be sparse"
					console.log(error.message);
				}); 

7. Virtuals
	1. Document properties that we can get and set but do not get persisted to MongoDB.
		1. Getters: for formatting or combining fields
		2. Setters: de-composing a single value into multiple values for storage
	2. Example:

			// define a schema
			var personSchema = new Schema({
				name: {
					first: String,
					last: String
				}
			});

			// compile our model
			var Person = mongoose.model('Person', personSchema);

			// creation of a document
			var axl = new Person({
				name: {first: 'Axl', last: 'Rose' }
			});

		1. Concatenating first and last name every time can be cumbersome.
		2. If we want to do some extra processing like removing diacritics
		3. Example:

				personSchema.virtual('fullName').get(function () {
					return this.name.first + ' ' + this.name.last;
				});

			1. When `fullName` property is accessed, mongoose will call getter function

					console.log(axl.fullName);

	3. If `toJSON()` or `toObject()` or `JSON.stringify()` are called on mongoose documents, virtuals are not included by default. To include virtuals, Pass `{ virtuals: true }` to either `toObject()` or `toJSON()`
	4. Custom setter:
		1. Setting first name and last name via `fullName`

				personSchema.virtual('fullName').
					get(function () { return this.name.first + ' ' + this.name.last; }).
					set(function (v) {
						this.name.first = v.substr(0, v.indexOf(' '));
						this.name.last = v.substr(v.indexOf(' ') + 1);
					});

				axl.fullName = 'William Rose';	// Now `axl.name.first` os "William"

			1. setters are applied before other validation
			2. We cannot query with virtuals because they are not stored in MongoDB
	5. Alias: A type of virtual where getter and setter seemlessly get and set another property
		1. Saves network bandwidth - we can convert short property name stored in database into longer name for code readability

				var personSchema = new Schema({
					n: {
						type: String,
						// Now accessing `name` will get you the value of `n`, and setting `name` will set the value of `n`
						alias: 'name'
					}
				});

				// Setting `name` will propagate to `n`
				var person = new Person({ name: 'Val' });
				console.log(person);	// { n: 'Val' }
				console.log(person.toObject({ virtuals: true }));  // { n: 'Val', name: 'Val' }
				console.log(person.name);	// "Val"

				person.name = 'Not Val';
				console.log(person);	// { n: 'Not Val' }

8. Options
	1. Schemas have configurable options which can be passed to the constructor or `set`

			new Schema({..}, options);

			// or

			var schema = new Schema({..});
			schema.set(option, value);

	2. Valid options:
		1. `autoIndex`:
			1. At app startup, Mongoose sends `ensureIndex` command for each index declared in `Schema`.
			2. Indexes are created in background by default
			3. To manually handle when indexes are created, set `Schema`s `autoIndex` to `false` and use `ensureIndexes` method on model

					var schema = new Schema({..}, { autoIndex: false });
					var Clock = mongoose.model('Clock', schema);
					Clock.ensureIndexes(callback);
					
		2. `bufferCommands`:
			1. By default Mongoose buffers commands when connection goes down until driver manages to reconnect.
			2. To disable buffering set `bufferCommands` to `false`

					var schema = new Schema({..}, { bufferCommands: false });

		3. `capped`:
			1. Mongoose supports MongoDBs capped collections
			2. If MongoDB collection needs to be capped, set `capped` to maximum size of the collection in bytes

					new Schema({..}, { capped: 1024 });

			3. `capped` can be set to an object if additional options need to be passed

					new Schema({..}, { capped: { size: 1024, max: 1000, autoIndexId: true } });
			
		4. `collection`:
			1. Mongoose by default produces collection name by passing model name to `utils.toCollectionName` method. It pluralizes the name.
			2. The option `collection` is set if we want a different name for the collection

					var dataSchema = new Schema({..}, { collection: 'data' });

		5. `emitIndexErrors`
			1. By default, mongoose will build indexes specified in schema and emit `index` event on model when index build either succeeds or errors out.

					MyModel.on('index', function (error) {
						/* If error is truthy, index build failed */
					});

				1. Catching errors when index build fails is tricky. `emitIndexErrors` option makes seeing when index build fails simpler.
				2. `error` event is emitted on model when index build fails

						MyModel.schema.options.emitIndexErrors;
						MyModel.on('error', function (error) {
							// gets an error whenever index build fails
						});

					1. If there is no listener, Node.js build-in event emitter throws exception. Fail fast can be implemented

		6. `id`:
			1. `id` virtual getter is assigned by default which returns `_id` field cast to a String or `hexString` in case of ObjectIds.
			2. If `id` getter must not be present, set `id` to `false`

					// default behavior
					var schema = new Schema({ name: String });
					var Page = mongoose.model('Page', schema);
					var p = new Page({ name: 'mongodb.org' });
					console.log(p.id);  // '50341373e894ad16347efe01' example

					// disabled id
					var schema = new Schema({ name: String }, { id: false });
					var Page = mongoose.model('Page', schema);
					var p = new Page({ name: 'mongodb.org' });
					console.log(p.id);	// undefined

		7. `_id`:
			1. Each schema is assigned an `_id` field by default if one is not passed into Schema constructor
			2. Type is ObjectId (MongoDB's default behavior)
			3. Disable this behavior by assigning `_id` the value of `false`
			4. This option can only be used on sub-documents (an error is thrown otherwise)
			
					// default behavior
					var schema = new Schema({ name: String });
					var Page = mongoose.model('Page', schema);
					var p = new Page({ name: 'mongodb.org' });
					console.log(p);		// { _id: '50341373e894ad16347efe01', name: 'mongodb.org' }
					
					// disabled _id
					var childSchema = new Schema({ name: String }, { _id: false });
					var parentSchema = new Schema({ children: [childSchema] });

					var Model = mongoose.model('Model', parentSchema);
					Model.create({ children: [{ name: 'Luke' }] }, function (error, doc) {
						// doc.children[0]._id will be undefined
					});

		8. `minimize`:
			1. By default, Mongoose minimizes schemas by removing empty objects

					var schema = new Schema({ name: String, inventory: {} });
					var Character = mongoose.model('Character', schema);

					// will store `inventory` field if it is not empty
					var frodo = new Character({ name: 'Frodo', inventory: { ringOfPower: 1 }});
					Character.findOne({ name: 'Frodo' }, function (err, character) {
						console.log(character);		// { name: 'Frodo', inventory: { ringOfPower: 1 }}
					});

					// will not store `inventory` field if it is empty
					var sam = new Character({ name: 'Sam', inventory: {} });
					Character.findOne({ name: 'Sam' }, function (err, character) {
						console.log(character);		// { name: 'Sam' }
					});

				1. The behavior can be overridden by setting minimize option to false

						var schema = new Schema({ name: String, inventory: {} }, { minimize: false });
						var Character = mongoose.model('Character', schema);

						// will store `inventory` if empty
						var sam = new Character({ name: 'Sam', inventory: {} });
						Character.findOne({ name: 'Sam' }, function (err, character) {
							console.log(character);		// { name: 'Sam', inventory: {} }
						});

		9. `read`:
			1. Provides a way to set [ReadPreferences](http://docs.mongodb.org/manual/applications/replication/#replica-set-read-preference) to all queries derived from model.

					var schema = new Schema({..}, { read: 'primary' });		// also aliased as 'p'
					var schema = new Schema({..}, { read: 'primaryPreferred' });		// aliased as 'pp'
					var schema = new Schema({..}, { read: 'secondary' });		// aliased as 's'
					var schema = new Schema({..}, { read: 'secondaryPreferred' });		// aliased as 'sp'
					var schema = new Schema({..}, { read: 'nearest' });		// aliased as 'n'

			1. We can also specify tag sets (tells driver from which members of replica-set it should attempt to read)
			2. Can also specify driver read pref strategy option when connecting

					// pings the replset members periodically to track network latency
					var options = { replset: { strategy: 'ping' }};
					mongoose.connect(uri, options);

					var schema = new Schema({..}, { read: ['nearest', { disk: 'ssd' }] });
					mongoose.model('JellyBean', schema);

		10. `safe`:
			1. Passed with all operations to MongoDB
			2. Specifies if errors should be returned to callbacks
			3. Tunes write behavior

					var safe = true;
					new Schema({ .. }, { safe: safe });

				1. Default: true - for all schemas
					1. Guarantees that errors get passed back to callback
				2. If `safe` is set to `{ j: 1, w: 2, wtimeout: 10000 }` - guarantees that write was committed to MongoDB journal (j: 1), at least 2 replicas (w: 2) and write will timeout if it takes longer that 10 seconds (wtimeout: 10000)
					1. Errors are still passed to callback
				3. Turn verioning off in 3.6.x and it is disabled in 3.7.x automatically when safe is set to `false`
				4. Overrides settings specified by passing options during connection creation
			4. Other write concerns:

					var safe = { w: "majority", wtimeout: 10000 };
					new Schema({ .. }, { safe: safe }); 

		11. `shardKey`: It is used when we have sharted MongoDB architecture
			1. Each sharded collection has a shard key
				1. Must be present in each insert/update operations
			2. Set option `shardKey` to same shard key

					new Schema({ .. }, { shardKey: { tag: 1, name: 1 }});

			3. Shards must be configured ourselves.
				1. Mongoose does not send `shardCollection` command

		12. `strict`: enabled by default
			1. Values passed to model constructor not specified in schema do not get saved to db
				
					var thingSchema = new Schema({..});
					var Thing = mongoose.model('Thing', thingSchema);
					var thing = new Thing({ iAmNotInTheSchema: true });
					thing.save();	// iAmNotInTheSchema is not saved to the db

					// set to false..
					var thingSchema = new Schema({..}, { strict: false });
					var thing = new Thing({ iAmNotInTheSchema: true });
					thing.save();	// iAmNotInTheSchema is now saved to the db!!
				
		13. `toJSON`
		14. `toObject`
		15. `typeKey`
		16. `validateBeforeSave`
		17. `versionKey`
		18. `skipVersioning`
		19. `timestamps`
		20. `retainKeyOrder`

9. Pluggable

#### Types ####
#### Custom ####
#### Advanced Usage ####

### Models ###
### Documents ###
#### Sub Docs ####
#### Defaults ####

### Queries ###
### Validation ###
### Middleware ###
### Population ###
### Connections ###
### Plugins ###
### Promises ###
### Discriminators ###
### Contributing ###
### ES2015 Integration ###
### Schemas in the Browser ###
### MongoDB Version Compatibility ###

## API Docs ##