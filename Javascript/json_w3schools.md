# JS JSON #
## JSON Intro ##
1. JSON: JavaScript Object Notation
2. JSON is a syntax for storing and exchanging data
3. JSON is text, written with JavaScript object notation

### Exchanging Data ###
1. Data exchanged between browser and server can only be text
	1. JSON is text
		1. Any JS object can be converted into JSON
		2. Any JSON can be converted to JS object
2. JSON doesn't require parsing and translations

### Sending Data ###
1. Example:

		var myObj = { "name": "John", "age": 31, "city": "New York" };
		var myJSON = JSON.stringify(myObj);
		window.location = "demo_json.php?x=" + myJSON;

### Receiving Data ###
1. JSON format data can be converted into JavaScript object

		var myJSON = '{ "name": "John", "age": 31, "city": "New York" }';
		var myObj = JSON.parse(myJSON);
		document.getElementById("demo").innerHTML = myObj.name;

### Storing Data ###
1. text is a format to store data
2. Example:

		//Storing data:
		myObj = { "name": "John", "age": 31, "city": "New York" };
		myJSON = JSON.stringify(myObj);
		localStorage.setItem("testJSON", myJSON);

		//Retrieving data:
		text = localStorage.getItem("testJSON");
		obj = JSON.parse(text);

### What is JSON? ###
1. JSON stands for JavaScript Object Notation
2. JSON is a lighweight data-interchange format
3. JSON is "self-describing" and easy to understand
4. JSON is language independent *
	1. JSON uses JavaScript syntax, but JSON format is text only. Text can be used as data by any programming language

### Why use JSON? ###
1. Text can be sent to or from a server
2. Text can be used as data format by any programming language
3. `JSON.parse()`: converts string to a JavaScript object
	1. Enables us to use JSON as JavaScript object without much effort

## JSON Syntax ##
1. It is subset of JavaScript syntax

### JSON Syntax Rules ###
1. Derived from JavaScript object notation
	1. Data is in name/value pairs
	2. Data is separated by commas
	3. Curly braces hold objects
	4. Square brackets hold arrays

### JSON Data - A Name and a Value ###
1. JSON data is written as name/value pairs
2. name/value

		"name":"John"

	1. JSON names require double quotes but JavaScript names don't require

### JSON - Evaluates to JavaScript Objects ###
1. JSON is almost identical to JavaScript objects
	1. keys must be strings (with double quotes)
	
			{ "name": "John" }

	2. JavaScript: keys can be strings, numbers or identifier names

			{ name: "John" }

### JSON Values ###
1. Values can be
	1. a string
	2. a number
	3. an object (JSON object)
	4. an array
	5. a boolean
	6. null
2. JavaScript values can be
	1. All of the above
	2. function
	3. undefined
3. Example: `{ "name": "John" }` - double quotes only
	1. `{ name: 'John' }` - can have single quotes

### JSON Uses JavaScript Syntax ###
1. JSON is derived from JavaScript object notation
	1. Very little additional software is required to work with JSON within JavaScript
	2. We can assign data to object

			var person = { "name": "John", "age": 31, "city": "New York" };
			// returns John
			person.name;
			// or
			person['name'];

	3. Modification

			person.name = 'Gilbert';
			person['name'] = 'Gilbert';

### JavaScript Arrays as JSON ###
1. JavaScript arrays can be used as JSON

### JSON Files ###
1. File type: `.json`
2. MIME type for JSON text is "application/json"

## JSON vs XML ##
1. JSON and XML can be used to retrieve data from web server
2. Examples:

		{"employees": [
			{ "firstName": "John", "lastName": "Doe" },
			{ "firstName": "Anna", "lastName": "Smith" },
			{ "firstName": "Peter", "lastName": "Jones" }
		]}

		<employees>
			<employee>
				<firstName>John</firstName>
				<lastName>Doe</lastName>
			</employee>
			<employee>
				<firstName>Anna</firstName>
				<lastName>Smith</lastName>
			</employee>
			<employee>
				<firstName>Peter</firstName>
				<lastName>Jones</lastName>
			</employee>
		</employees>

### JSON is Like XML Because ###
1. Both JSON and XML are "self describing" (human readable)
2. Both JSON and XML are hierarchical (values within values)
3. Both JSON and XML can be parsed and used by lots of programming languages
4. Both JSON and XML can be fetched with an XMLHttpRequest

### JSON is Unline XML Because ###
1. JSON doesn't use end tag
2. JSON is shorter
3. JSON is quicker to read and write
4. JSON can use arrays
5. XML has to be parsed with XML parse. JSON can be parsed by a standard JavaScript function

### Why JSON is Better Than XML ###
1. XML is much more difficult to parse than JSON
2. JSON can be parsed readily to JavaScript object
3. Ajax:
	1. JSON is faster and easier than XML
	2. XML:
		1. fetch XML doc
		2. Use XML DOM to loop through doc
		3. Extract values and store in variables
	3. JSON
		1. Fetch JSON string
		2. JSON.parse the JSON string

## JSON Data Types ##
### Valid Data Types ###
1. JSON values can be of types:
	1. string
	2. number
	3. JSON object
	4. array
	5. boolean
	6. null
2. JSON values cannot be:
	1. function
	2. date
	3. undefined

### JSON Strings ###
1. Written in double quotes

		{ "name": "John" }

### JSON Numbers ###
1. Must be integer or floating point

		{ "age": 31 }
		{ "salary": 25678.45 }

### JSON Objects ###
1. JSON object `{ ... }`

		{
			"employee": {
				"name": "John",
				"age": 30,
				"city": "New York"
			}
		}

	1. Object values have the same rules as JSON objects

### JSON Arrays ###
1. Arrays

		{
			"employees": [
				"John",
				"Anna",
				"Peter"	
			]
		}

### JSON Booleans ###
1. Values can be `true` or `false`

		{ "sale": true }

### JSON `null` ###
1. Value can be `null`

		{ "middlename": null }

## JSON Objects ##
### Object Syntax ###
1. Surrounded by curly braces `{}`
2. Written in key/value pairs
3. keys: string
4. values: any JSON data type (string, array, object, number, boolean, null)
5. key and value separator is `:`
6. Each key/value pair separated by `,`

### Accessing Object Values ###
1. Use `.` to access values

		myObj = { "name": "John", "age": 30, "car": null };
		x = myObj.name;

		// another way
		myObj = { "name": "John", "age": 30, "car": null };
		x = myObj['name'];

### Looping an Object ###
1. for-in loop can be used to loop through properties

		myObj = { "name": "John", "age": 30, "car": null };
		for (x in myObj) {
			document.getElementById("demo").innerHTML += x;
		}

### Nested JSON Objects ###
1. Values in one JSON object can be another JSON object

		myObj = {
			"name": "John",
			"age": 30,
			"cars": {
				"car1": "Ford",
				"car2": "BMW",
				"car3": "Fiat"
			}
		}

2. Accessing nested JSON objects

		x = myObj.cars.car2;
		// or:
		x = myObj.cars['car2'];

### Modify Values ###
1. dot notation can be used:

		myObj.cars.car2 = "Mercedes";
		// or
		myObj.cars['car2'] = "Mercedes";

### Delete Object Properties ###
1. `delete` keyword can be used

		delete myObj.cars.car2;

## JSON Arrays ##
### Arrays as JSON Objects ###
1. Example:

		[ "Ford", "BMW", "Fiat" ]

2. Similar to arrays in JS
3. Values can be string, number, object, array, boolean, null
	1. In JS, values can be all of the above + JS expressions (functions, dates, undefined)

### Arrays in JSON Objects ###
1. Can be values of an object property

		{
			"name": "John",
			"age": 30,
			"cars": [ "Ford", "BMW", "Fiat" ]
		}

### Accessing Array Values ###
1. Using index number

		x = myObj.cars[0];

### Looping Through an Array ###
1. Using for-in loop

		for (i in myObj.cars) {
			x += myObj.cars[i];
		}

### Nested Arrays in JSON Objects ###
1. Example:

		myObj = {
			"name": "John",
			"age": 30,
			"cars": [
				{
					"name": "Ford",
					"models": [
						"Fiesta",
						"Focus",
						"Mustang"
					]
				},
				{
					"name": "BMW",
					"models": [
						"320",
						"X3",
						"X5"
					]
				},
				{
					"name": "Fiat",
					"models": [
						"500",
						"Panda"
					]
				}
			]
		}

	1. To access:

			for (i in myObj.cars) {
				x += "<h1>" + myObj.cars[i].name + "</h1>";
				for (j in myObj.cars[i].models) {
					x += myObj.cars[i].models[j];
				}
			}

### Modify Array Values ###
1. Use index value:

		myObj.cars[i] = "Mercedes";

### Delete Array Items ###
1. Use `delete` keyword

		delete myObj.cars[i];

## JSON Parse ##
### `JSON.parse()` ###
1. JSON: used to exchange data to/from web server
	1. When receiving data, data is string
2. JSON parsed using `JSON.parse()` becomes an JS object

### Example - Parsing JSON ###
1. Example: `{ "name": "John", "age": 30, "city": "New York" }`

		var obj = JSON.parse('{ "name": "John", "age": 30, "city": "New York" }'); // value must be json

2. Use JS object in the page

		<p id="demo"></p>

		<script>
			document.getElementById("demo").innerHTML = obj.name + ", " + obj.age;
		</script>

### JSON From the Server ###
1. AJAX request can fetch JSON from server
2. Example:

		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var myObj = JSON.parse(this.responseText);
				document.getElementById("demo").innerHTML = myObj.name;
			}
		};
		xmlhttp.open("GET", "json_demo.txt", true);
		xmlhttp.send();

### Array as JSON ###
1. `JSON.parse()` will return an array instead of object if JSON is an array

		var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var myArr = JSON.parse(this.responseText);
                document.getElementById("demo").innerHTML = myArr[0];
            }
        };
		xmlhttp.open("GET", "json_demo_array.txt", true);
		xmlhttp.send();

### Exceptions ###
#### Parsing Dates ####
1. Date objects are not allowed in JSON
	1. Write it as string (can be converted back and forth)
2. Example:

		var text = '{ "name": "John", "birth": "1986-12-14", "city": "New York" }';
		var obj = JSON.parse(text);
		obj.birth = new Date(obj.birth);

		document.getElementById("demo").innerHTML = obj.name + ", " + obj.birth;

3. We can use second parameter of `JSON.parse()` - reviver
	1. reviver - function that checks each property before returning the value

			var text = '{ "name": "John", "birth": "1986-12-14", "city": "New York" }';
			var obj = JSON.parse(text, function (key, value) {
				if (key == "birth") {
					return new Date(value);
				} else {
					return value;
				}
			});

			document.getElementById("demo").innerHTML = obj.name + ", " + obj.birth;

#### Parsing Functions ####
1. Functions are not allowed in JSON
	1. If needed, write it as a string (it can be converted back)
2. Example: Using `eval`

		var text = '{ "name": "John", "birth": "1986-12-14", "city": "New York" }';
		var obj = JSON.parse(text);
		obj.age = eval("(" + obj.age + ")");

		document.getElementById("demo").innerHTML = obj.name + ", " + obj.age;

	1. Avoid using functions in JSON

### Browser Support ###
1. `JSON.parse()` included in major browsers and it is in latest ECMAScript standard.
	1. Firefox 3.5
	2. Internet Explorer 8
	3. Chrome
	4. Opera 10
	5. Safari 4
2. For older browsers, use: [https://github.com/douglascrockford/JSON-js](https://github.com/douglascrockford/JSON-js)

## JSON Stringify ##
### `JSON.stringify()` ###
1. When passing data to server, it must be in string format so convert object into string using `JSON.stringify()`

### Stringify a JavaScript Object ###
1. Example:

		var obj = {
			name: "John",
			age: 30,
			city: "New York"
		};

		var myJSON = JSON.stringify(obj); // result is a string
		document.getElementById("demo").innerHTML = myJSON;

### Stringify a JavaScript Array ###
1. Example: `var arr = [ "John", "Peter", "Sally", "Jane" ];`

		var myJSON = JSON.stringify(arr); // converts array to JSON string

### Exceptions ###
#### Stringify Dates ####
1. `JSON.stringify()` converts any dates into strings

		var obj = { "name": "John", "today": new Date(), "city": "New York" };
		var myJSON = JSON.stringify(obj);
		document.getElementById("demo").innerHTML = myJSON;

#### Stringify Functions ####
1. `JSON.stringify()` removes all functions including key and value

		var obj = {
			name: "John",
			age: function () {
				return 30;
			},
			city: "New York"
		};
		var myJSON = JSON.stringify(obj);

		document.getElementById("demo").innerHTML = myJSON;

2. This can be overcome by converting function to strings before running `JSON.stringify()`

		var obj = {
			name: "John",
			age: function () {
				return 30;
			},
			city: "New York"
		};
		var myJSON = JSON.stringify(obj);
		document.getElementById("demo").innerHTML = myJSON;

### Browser Support ###
1. Included in all major browsers and in latest ES standard
	1. Firefox 3.5
	2. IE 8
	3. Chrome
	4. Opera 10
	5. Safari 4

## JSON PHP ##
1. Exchanging data between client and PHP server

### The PHP File ###
1. PHP has built in functions to handle JSON
	1. Objects can be converted to JSON using `json_encode()`
2. Example:

		<?php
		$myObj->name = "John";
		$myObj->age = 30;
		$myObj->city = "New York";

		$myJSON = json_encode($myObj);

		echo $myJSON;
		?>

### The Client JavaScript ###
1. Example:

		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function () {
			if (this.readyState == 4 && this.status == 200) {
				var myObj = JSON.parse(this.responseText);
				document.getElementById("demo").innerHTML = myObj.name;
			}
		};
		xmlhttp.open("GET", "demo_file.php", true);
		xmlhttp.send();

### PHP Array ###
1. Example:

		<?php
		$myArr = array("John", "Mary", "Peter", "Sally");

		$myJSON = json_encode($myArr);

		echo $myJSON;
		?>

### The Client JavaScript ###
1. Example:

		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function () {
			if (this.readyState == 4 && this.status == 200) {
				var myObj = JSON.parse(this.responseText);
				document.getElementById("demo").innerHTML = myObj[2];
			}
		};
		xmlhttp.open("GET", "demo_file_array.php", true);
		xmlhttp.send();

### PHP Database ###
1. Database operations must be performed on server side (not on client side)
2. Consider a database with customers, products and suppliers
	1. Getting first 10 records in "customers" table

			obj = { "table": "customers", "limit": 10 };
			dbParam = JSON.stringify(obj);
			xmlhttp = new XMLHttpRequest();
			xmlhttp.onreadystatechange = function () {
				if (this.readyState == 4 && this.status == 200) {
					document.getElementById("demo").innerHTML = this.responseText;
				}
			};
			xmlhttp.open("GET", "json_demo_db.php?x=" + dbParam, true);
			xmlhttp.send();

		1. Object containing table property and limit property
		2. Convert object into JSON string
		3. Send request to PHP file, with JSON string as a parameter
		4. Wait until request returns with result (as JSON)
		5. Display result received from PHP file
3. PHP file:

		<?php
		header("Content-Type: application/json; charset=utf-8");
		$obj = json_decode($_GET["x"], false);
		
		$conn = new mysqli("myServer", "myUser", "myPassword", "Northwind");
		$result = $conn->query("SELECT name FROM ".$obj->table." LIMIT ".$obj-limit);
		$outp = array();
		$outp = $result->fetch_all(MYSQLI_ASSOC);

		echo json_encode($outp);
		?>

	1. Convert request into object using PHP function `json_decode()`
	2. Access database and fill an array with requested data
	3. Add array to an object and return object as JSON using `json_encode()`

### Loop Through the Result ###
1. Example:

		...
		xmlhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				myObj = JSON.parse(this.responseText);
				for (x in myObj) {
					txt += myObj[x].name + "<br>";
				}
				document.getElementById("demo").innerHTML = text;
			}
		};
		...

### PHP Method = POST ###
1. Specify POST as the method and specify the header properly

		obj = {
			table: "customers",
			limit: 10
		};
		dbParam = JSON.stringify(obj);
		xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function () {
			if (this.readyState == 4 && this.status == 200) {
				myObj = JSON.parse(this.responseText);
				for (x in myObj) {
					txt += myObj[x].name + "<br>";
				}
				document.getElementById("demo").innerHTML = txt;
			}
		};
		xmlhttp.open("POST", "json_demo_db_post.php", true);
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xmlhttp.send("x=" + dbParam);

2. PHP: Only difference is the method

		<?php
		header("Content-Type: application/json; charset=UTF-8");
		$obj = json_decode($_POST["x"], false);

		$conn = new mysqli("myServer", "myUser", "myPassword", "Northwind");
		$result = $conn->query("SELECT name FROM ".$obj->table." LIMIT ".$obj->limit);
		$outp = array();
		$outp = $result->fetch_all(MYSQLI_ASSOC);
		
		echo json_encode($outp);
		?>

## JSON HTML ##
1. JSON can be translated to JavaScript with ease
	1. JSON along with JavaScript can be used to build HTML in the web pages

### HTML Table ###
1. Example: JSON + HTML

		obj = {
			table: "customers",
			limit: 20
		};
		dbParam = JSON.stringify(obj);
		xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function () {
			if (this.readyState == 4 && this.status == 200) {
				myObj = JSON.parse(this.responseText);
				txt += "<table border='1'>"
				for (x in myObj) {
					txt += "<tr><td>" + myObj[x].name + "</td></tr>";
				}
				txt += "</table>";
				document.getElementById("demo").innerHTML = txt;
			}
		}
		xmlhttp.open("POST", "json_demo_db_post.php", true);
		xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xmlhttp.send("x=" + dbParam);

### Dynamic HTML Table ###
1. Table based on value of drop down menu:

		<select id="myselect" onchange="change_myselect(this.value)">
			<option value="">Choose an option:</option>
			<option value="customers">Customers</option>
			<option value="products">Products</option>
			<option value="suppliers">Suppliers</option>
		</select>

		<script>
			function change_myselect(sel) {
				var obj, dbParam, xmlhttp, myobj, x, txt = "";
				obj = {
					table: sel,
					limit: 20
				};
				xmlhttp = new XMLHttpRequest();
				xmlhttp.onreadystatechange = function () {
					if (this.readyState == 4 && this.status == 200) {
						myObj = JSON.parse(this.responseText);
						txt += "<table border='1'>";
						for (x in myObj) {
							txt += "<tr><td>" + myObj[x].name + "</td></tr>";
						}
						txt += "</table>";
						document.getElementById("demo").innerHTML = txt;
					}
				};
				xmlhttp.open("POST", "json_demo_db_post.php", true);
				xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				xmlhttp.send("x=" + dbParam);
			}
		</script>

### HTML Drop Down List ###
1. Example: Drop down list based on JSON returned

		obj = {
			table: "customers",
			limit: 20
		};
		dbParam = JSON.stringify(obj);
		xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function () {
			if (this.readyState == 4 && this.status == 200) {
				myObj = JSON.parse(this.responseText);
				txt += "<select>";
				for (x in myObj) {
					txt += "<option>" + myObj[x].name + "</option>";
				}
				txt += "</select>";
				document.getElementById("demo").innerHTML = txt;
			}
		};
		xmlhttp.open("POST", "json_demo_db_post.php", true);
		xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xmlhttp.send("x=", dbParam);

## JSON JSONP ##
1. JSONP: It is a method to send JSON without worrying about cross-domain issues
2. JSONP does not use `XMLHttpRequest` object
3. JSONP uses `<script>`

### JSONP Intro ###
1. JSONP - JSON with Padding
	1. Requesting a file from another domain may cause cross-domain problems
	2. Requesting script from another domain does not have any problems
2. JSONP requests files using `<script>` tag instead of `XMLHttpRequest`

		<script src="demo_jsonp.php">

### The Server File ###
1. File wraps result inside a function call

		<?php
		$myJSON = '{ "name": "John", "age": 30, "city": "New York" }';

		echo "myFunc(".$myJSON.")";
		?>

	1. Result returns a call to a function named `myFunc` with JSON data as argument
		1. The function must exist on the client side

### The JavaScript function ###
1. `myFunc` on the client side:

		function myFunc(myObj) {
			document.getElementById("demo").innerHTML = myObj.name;
		}

### Creation of Dynamic Script Tag ###
1. To build a script tag only when it is needed:

		function clickButton() {
			var s = document.createElement("script");
			s.src = "demo_jsonp.php";
			document.body.appendChild(s);
		}

### Dynamic JSONP Result ###
1. PHP file can return JSON object based on the information it gets:

		<?php
		header("Content-Type: application/json; charset=UTF-8");
		$obj = json_decode($_GET["x"], false);

		$conn = new mysqli("myServer", "myUser", "myPassword", "Northwind");
		$result = $conn->query("SELECT name FROM ".$obj->$table." LIMIT ".$obj->$limit);
		$outp = array();
		$outp = $result->fetch_all(MYSQLI_ASSOC);

		echo "myFunc(".json_encode($outp).")";
		?>

	1. `json_decode()` - converts request into an object
	2. Access database and fill an array with requested data
	3. Add array to object
	4. Convert array into JSON using `json_encode()`
	5. Wrap `myFunc()` around return object
2. Example:

		function clickButton() {
			var obj, s;
			obj = {
				table: "products",
				limit: 10
			};
			s = document.createElement("script");
			s.src = "jsonp_demo_db.php?x=" + JSON.stringify(obj);
			document.body.appendChild(s);
		}

		function myFunc(myObj) {
			var x, txt = "";
			for (x in myObj) {
				txt += myObj[x].name + "<br>";
			}
			document.getElementById("demo").innerHTML = txt;
		}

### Callback Function ###
1. Making server file call the correct function:

		function clickButton() {
			var s = document.createElement("script");
			s.src = "jsonp_demo_db.php?callback=myDisplayFunction";
			document.body.appendChild(s);
		}
