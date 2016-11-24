# Backbone JS #
## What is a web application ##
1. Static
2. Server based
3. JavaScript assisted
	1. JQuery
		1. Used to easily manipulate DOM
		2. Avoid cross browser issue
		3. Take advantage of AJAX
	2. Backbone
		1. Transfers control from server to client
		2. Can build thick client (simple page application)
		3. Suitable for large data-driven web applications
4. Why Backbone?
	1. Full user asset control (seperation of concers)
		1. UI team is responsible for Javascript, HTML, CSS ...
			1. Backbone makes UI team less dependent on Server team and vice versa through standard API
	2. True OO support
		1. Makes Javascript similar to Java
	3. Enhanced performance and speed
		1. Client downloads the entire page and its assets for the first time and then subsequent requests only renders
		2. First request may download the entire html page and subsequent requests may retrieve only the json data that needs to be inserted into the html page

## Download and Install Backbone.js ##
1. backbonejs.org
	1. Dependencies:
		1. JQuery (jquery.com)
		2. Underscore (underscorejs.org)

## Example Backbone JS Application ##
1. Make a project directory
2. Place `jquery-3.1.1.min.js`, `underscore-min.js` and `backbone-min.js` into the directory.
3. Add a new `index.html` file with the following code

		<html>
			<head>
				<title>Sample Backbone.js application</title>
			</head>
			<body>
				<script src="jquery-3.1.1.min.js"></script>
				<script src="underscore-min.js"></script>
				<script src="backbone-min.js"></script>
			</body>
		</html>
4. Open `index.html` in a browser
5. Open console (Chrome)
6. Type `Backbone` and hit enter

## Backbone Model ##
1. Every backbone app should begin with a model definition
	1. Model: where data resides
		1. Break problem domain into individual elements and describe each element as a model
		2. Model is created by extending backbone's base `Model` class
		3. Constructor of model is `initialize` function
		4. Models must have default attributes
			1. default values
2. Example:
	1. Consider a bookstore full of books. Then a single book is a model (contains attributes/properties)
		1. Book can have the following attributes: title, author, publishing year, ...

## Example app ##
1. Add a new file `app.js` in the project directory
2. Add the following content:

		var myBook = Backbone.Model.extend({
			initialize: function () {
				console.log("The book model is initialized");
			},
			Title: "No Title",
			Author: "No one",
			Year: "No year"
		});

		var newBook = new myBook({
			Title: "Parallel Worlds",
			Author: "Michio Kaku",
			Year: "2006"
		});

		console.log("The title of new book is: " + newBook.get("Title"));

		newBook.set("Year", 2005);
		
		console.log("The publishing year of newbook is " + newBook.get("Year"));

## Model Attributes ##
1. Represents data that the model holds (key value pairs)
2. Retrieval is by using `.get` **(M)** model function
3. Set by using `.set` **(M)** model funtion
4. Deleted using `.unset` **(M)** model function
5. Attributes are passed to model during creation
6. Attributes can be listed using `.attributes` **(M)** model property
7. Check existence of attribute using `.has` **(M)** model function

### Example Usage of Attributes ###

		var myBook = Backbone.model.extend({
			initialize: function () {
				console.log("The book model is initialized");
			},
			Title: "No Title",
			Author: "No one",
			Year: "No year"
		});

		var newBook = new myBook({
			Title: "Parallel Worlds",
			Author: "Michio Kaku",
			Year: "2006"
		});

		console.log("The title of new book is: " + newBook.get("Title"));

		newBook.set("Year", 2005);
		
		console.log("The publishing year of newbook is " + newBook.get("Year"));

		newBook.unset("Year");

		console.log("The publishing year of new book is: " + newBook.get("Year"));

## Models Change Event ##
1. Change event: Important event
2. change event is usually added in initialize constructor function
3. configuration done using `.on` function
4. Arguments: first argument is "change"
	1. `change`
	2. `change:attributeName` (tracks change on specific attribute)
5. Event does not fire when silent parameter is used with set model function
	1. `silent: true`

### Example usage of events ###

		var myBook = Backbone.Model.extend({
			initialize: function() {
				console.log("The book model is initialized.");
				this.on("change", function () {
					console.log("The model has changed");
				});
			},
			Title: "No title",
			Author: "No author",
			Year: "No year"
		});

		var newBook = new myBook({
			Title: "Parallel Worlds",
			Author: "Michio Kaku",
			Year: "2006"
		});

		newBook.set("Year", "2005");
		newBook.set({"Year": 2004"}, {silent: true});

### Other Function for Change Event ###
1. To know what has changed:
	1. `.hasChanged(attributeName)` **(M)**: tells whether the `attributeName` has changed or not (tracks only the last change)
	2. `.changed` **(M)** returns a list of attributes that have changed as a JSON object
		1. `JSON.stringify` **(M)**: displays the object as a JSON string
	3. `.previous(attributeName)` **(M)**: method returns previous value of attribute

#### Example Usage ####

		var myBook = Backbone.Model.extend({
			initialize: function () {
				this.on("change", function(model, error) {
				console.log("The model has changed");
			});
			},
			Title: "No title",
			Author: "No author",
			Year: "No year"
		});

		var newBook = new myBook({
			Title: "Parallel Worlds",
			Author: "Michio Kaku",
			Year: "2004"
		});

		newBook.set("Year", "2006");

		if (newBook.hasChanged("Year")) {
			console.log("The year of the book has changed");
		}

		console.log(JSON.stringify(newBook.changed));
		