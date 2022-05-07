# React in Easy Steps With Node and Java Backend #
## Introduction ##
### Course and Instructor Introduction ###
1. What is SPA?
2. What is React?
3. Why is React popular for SPA?
4. Software Setup
	1. Install Node
	2. VS Code
	3. MySQL and Workbench
5. React Script
	1. Include libaries
	2. ReactDOM - to render JSX or HTML onto web browser
	2. Apply Styles
6. React Components - heart of React Apps - reusable UI widgets
	1. How to construct components
	2. How to add attributes to the components
	3. Complex components - they can render different types of HTML onto the browser using JS ES6 for of loops, map methods, ...
	4. Event Handling (user events)
		1. Form submissions
		2. Click of buttons
		3. ...
		4. How to access HTML dom from event handler functions
	5. State management
		1. Initialize state
		2. Update state
		3. How react automatically renders the state when it is updated (onto UI)
	6. Styling
		1. CSS
		2. Object oriented styling
	7. JSX
		1. Syntax
7. `create-react-app` - from scratch
	1. No boierplate coding required
8. Project Structure
	1. Config
	2. Source code
	3. ...
9. Axios
	1. Ajax calls using this library
10. ExpressJS
	1. REST API
		1. CRUD against MySQL
11. React Client - to consume REST API
12. React Routing
	1. Navigation through app by configuring REACT routing
13. Flight Reservation and Checkin
	1. Java Backend REST API (Reservation & Checkin services)
	2. Flight Reservation App (customers can book a flight)
	3. Flight CheckIn App (Passenger can checkin to flight once he has reservation)

### How to Make the Best of This Course ###
1. How to use the course
	1. Lectures - sections
		1. Quiz at the end (evaluate knowledge)
	2. Assignments
		1. We must work on them (brush up of concepts)
	3. Easy setup
		1. Node
		2. VS Code
		3. MySQL and Work Bench
	4. Tiny little libraries will need to be installed as required
2. Personal Message
3. Questions (they might already be answered)
	1. Answer other student's questions if possible
4. To become an expert on React
	1. Work on
		1. Hands On + Assignments = EXPERT
			1. Can be submitted
5. Updates and Upgrades

### Download the Completed Projects ###
1. Download from resources section of the lecture
	1. React_Projects.zip
		1. React projects

### Notes from Theory Lectures ###
1. Download from resources section of the lecture
	1. React_JS_course
		1. Notes for theory lectures (helps with revision for interview)

### What are Single Page Applications ###
1. SPAs
	1. They are web applications that run **entirely** in a browser
	2. They do not need any re-loads (loaded only once)
		1. Traditional: User request causes creation of a new HTML page on the server side and sent back to user
			1. Results in page refresh
		2. If a request is sent to backend, backend only sends data
			1. Frontend **dynamically updates HTML DOM without refreshing the entire page**
	3. Advantages:
		1. Great user experience
			1. User might feel that the entire application is running on his machine
		2. Fast
			1. Data once fetched is available and doesn't need re-fetching
		3. Easy Development
			1. We can separate out frontend from the backend
			2. We can use same backend with multiple frontends (web and mobile say)
		4. Work Offline
			1. Once all data is fetched, we can go offline and use can use the application
				1. Only if create or update operations are required, he needs to connect to the backend
	4. Disadvantages
		1. Less secure
			1. We need to enable cross-site scripting
				1. Enables attackers to inject client side scripts that can crash our web app
		2. Memory leaks
			1. JS memory leaks in browser
				1. Or else, the application might slow down and provide bad user experience 
	4. Example:
		1. Facebook
		2. Gmail

### Three Problems with SPAs ###
1. State Managmement
	1. Most of the time, in SPA, time is spent keeping UI in sync with data
	
			User --> App --> Backend
			
		1. If user loads data by connecting to backend, then
			1. Decide what in UI needs to be cleared
			2. Which of the fields need to be made visible
			3. Which of the fields need to be destroyed
2. Slow DOM Manipulation
	1. We need to query the elements in DOM and update those elements in the dom (slow and painful)
		1. This needs to be done a lot in SPA
3. View through HTML Templates
	1. Working with HTML template engines like Mustache is painful
		1. If user navigates through HTML, we will be dealing with tiny little pieces of HTML that will be rendered to UI at a time
			1. The syntax might become complicated for sophisticated UIs (Templates)

### What and Why React? ###
1. React
	1. Popular & quickly growing
2. Why?
	1. Automatic UI State Management
		1. Keeping track of UI and managing state can be complex and time consuming
			1. Here the end-state is more important than intermittent steps taken by user
	2. Lightning fast DOM Manipulation
		1. Traditional SPAs - DOM manipulation is time consuming
			1. React provides **virtual dom**
				1. working with **virtual dom** is fast
				2. React will update original dom as and when needed
					1. Figures out diffs between virtual dom and original dom and makes least amount fo changes required to keep the UI in sync
						1. The process is called **reconciliation**
	3. APIs
		1. React give easy to use API to construct re-usable React widgets
			1. We can break down the UI into small chunks (instead of having one single html)
		2. React gives APIs to combine the components into complex components
	4. View through JavaScript
		1. React gives the full power of JS
			1. Views will be fully defined in JS
			
					ReactDOM.render(
						<h1>React is Awesome!</h1>
						<p>React is cool!</p>
					);
					
		2. We can use HTML like syntax inside JS code
			1. Called JSX
	5. React is View in MVC (can connect to any backend)
		1. M & C - Backend

### JSX ###
1. React uses JSX
	1 JavaScript XML
	
			<Hello name="Bharath">
			
		1. Hello - own UI element
	2. JSX allows us to mix JS and HTML
	
			for (var course of courses) {
				liElements.push(<li>{course}</li>);
			}
			
2. Two ways to translate JSX into HTML and JS
	1. babel.min.js - transpiles JSX into HTML and JS (Browser understandable)
	2. Node + create-react-app (cli) - converts JSX into HTML and JS
		1. Stored on disk automatically
		2. When client requests, it is sent to web browser

## React in Action ##
### Construct the HTML Template ###
1. First Reaction
	1. Construct HTML
	2. Include React Scripts
	3. Include Babel Script (converts JSX into JS)
	4. Use React API (to do something meaningful)
2. Open Notpad++
	1. New html and save in React_Scripts/firstReaction.html
		
			<!DOCTYPE html>
			<html>
				<head>
					<title>First Reaction</title>
				</head>
				<body>
					<script type="text/javascript">
					</script>
				</body>
			</html>
			
	2. React library:
		1. Search "cdn react links"
		2. Click on CDN links
			1. Grab first two scripts
		3. Paste in <head> block
			1. For react dom
	3. Babel
		1. Search "cdn babel standalone" (babel with node js is another option)
		2. Click on first link
		3. Grab babel.min.js
		4. Script:
		
				<script src="<link>"></script>

### Babel Encoding ###
1. Babel version might cause errors in browser (6.26.0 works)
	1. Fix:
		1. Add following in <body>
		
				<script charset="utf-8">
				</script>

### Use React ###
1. Task: 

		<body>
			<script type="text/babel"> <!-- for Babel to transpile -->
				ReactDOM.render(<h1>First Reat</h1>, document.body); // JSX, dom element in which we want the JSX want to be rendered in
			</script>
		</body>
		
2. Open the script in browser

### Change the Container Element ###
1. Rendering markup inside `document.body` is not a good practice (later)
	1. We can pass any DOM element to render
2. Open Browser:
	1. ctrl + shift + i or alt + cmd + i
		1. Rendering components directly inside document.body is discouraged
			1. Its children are often manipulated by third-party scripts and browser extensions. This may lead to subtle reconciliation issues
				1. Try rendering into container element constructed for the app
	2. Fix:
	
			<body>
				<div id="root"></div>
				<script ...>
					ReactDOM.render(..., document.getElementById("root")/>
				</script>
			</body>
			
3. Inspect HTML and JS:
	1. Go to <head><script>
	
			ReactDOM.render(React.createElement(
				"h1",
				null,
				"First React"
			), document.getElementById("root");
			
		1. Babel transpiled JSX into plain JS code
4. JSX syntax is very strict as compared to HTML
	1. Openings have to be closed mandatorily

### Apply Styles ###
1. We can use CSS styles directly in the React code

		<head>
			<style>
				#root {
					background-color: brown;
				}
				#root h1 {
					font-size: 30px;
					color: red;
				}
			</style>
		</head>

### Quiz 1: React in Action ###
### Assignment 1: React in Action ###
1. Wrap the following text inside `h1`: "You are the chooser of your destiny!"
2. It must be child of `<div id="root">...</div>`
3. Apply CSS (bgColor, font)

## Components ##
### Introduction ###
1. A key feature of React using which we construct our own HTML like elements

		<navbar>
		<mymenu>
		<footer>
		
	1. They have their own look and behavior
	2. They generate HTML via JSX
2. Open ebay.com
	1. Header
	2. Search bar
	3. Menu
	4. Carousal
	5. Footer
3. React is a bunch of components that can talk to each other or use each other
4. Creation of component
	1. `class` is created extending `React.Component` and override `render` method

### Construct a React Component ###
1. 

### Using the React Component ###
### Using Properties or Attributes ###
### Child Elements ###
### UPDATE - Constructing Functional Components ###
### Quiz 2: Components ###

## Complex Components ##
### Display Customer Details ###
### Display Address Details ###
### CustomerDetails Component Summary ###
### Construct a Logic Component ###
### Construcing Unordered Lists ###
### Use Array and For Loop ###
### Use the Map Method ###
### Construct Static Table ###
### Construct Table Dynamically ###
### Construct a RowCreator Child Component ###
### Assignment 2: Complex Components ###
### Assignment 3: Components ###

## Events ##
### Handle Login Event ###
### Reacts SyntheticEvent and Its Properties ###
### this Object Reference ###
### Quiz 4: Events ###
### Assignment 4: Events ###

## State ##
### Initialize State ###
### State in Action ###
### Update the State ###
### Add State to the ListStudent Component ###
### Add the Filter and the Handler Method ###
### Implement the Handler ###
### Clone the Object ###
### Quiz 5: State ###
### Assignment 5: State ###

## Styling and More About JSX ##
### Construct the TEXT Component ##
### Apply Classic Styling ###
### React Way of Styling ###
### Customize Styles ###
### JSX Tip 1 - Only One Root Element ###
### JSX Tip 2 - Inline Styles are not Allowed ###
### JSX Tip 3 - Comments ###
### JSX - Comments ###
### JSX - Component Names and Reusability ###
### Quiz 6: Styling and More About JSX ###
### Assignment 6: Styling ###

## Software Setup ##
### Install Node ###
### Install Yarn ###
### Install Visual Studio Code ###
### Install MySQL and MySQL Workbench ###
### Launch MySQL Workbench and Construct a Database ###
### Windows Only - Install MySQL ###
### Windoes Only - Install MySQL Workbench ###

## Constructing a React Project ##
### Install CREATE-REACT-APP CLI ###
### UPDATE - Using Functional Components ###
### Construct the Project ###
### Project Structure ###
### Behind the Scenes ###
### Other Commands ###

## AJAX Calls Using Axios ##
### Links to Rest Services ###
### Construct the Project ###
### Add axios Dependency ###
### Use GET ###
### Use POST ###

## Component Lifecycle ##
### Introduction ###
### UseCase and First Few Lifecycle Methods ###
### didMount and didUpdate ###
### shouldComponentUpdate ###
### Documentation Reference ###
### React Hooks Introduction ###
### UPDATE - Functional Components useState ###
### UPDATE - Functional Components useEffect ###

## REST API Using ExpressJS ##
### Introduction ###
### Construct the Table ###
### Construct the Project ###
### Construct the DB Connection ###
### Construct a Controller ###
### Implement the READ endpoint ###
### Initialize REST Application ###
### Test READ ###
### Get Single Product ###
### Create ###
### Test and Troubleshoot Create ###
### Update ###
### Delete ###
### Quiz 7: ExpressJS ###

## React CRUD Client ##
### Construct the Project ###
### Get All Products ###
### Test Get All Products ###
### Get Single Product Part 1 ###
### Get Single Product Part 2 ###
### Test Get Single Product ###
### Create ###
### Test Create ###
### Update ###
### Delete Assignment ###

## Routing ##
### Introduction ###
### Routing in React ###
### Step 1 - Install Router ###
### Step 2 - Configure Routes ###
### Step 3 - Add and Use Links ###

## CRUD Client - Using Functional Components and React Hooks ##
### Get All ###
### GET Single Product ###
### Create ###

## Project Usecase ##
### Introduction ###
### Flight Reservation Usecase ###
### Flight CheckIn Usecase ###

## Construct the Java Backend ##
### Construct the DB Schema ###
### Install Java ###
### Install STS ###
### Download the Executable Java Application ###
### Download the Completed Source Code ###
### Construct the Project ###
### Construct the Entities ###
### Mark Then with JPA Annotations ###
### Define Relations ###
### Construct the Repositories ###
### findFlights API ###
### saveReservation API ###
### Implement saveReservation ###
### findReservation ###
### updateReservation ###
### Configure The Data Source and Run ###
### Add Flights ###
### Filter Flights ###
### Test Filter Flights using Postman ###
### Test Save and Find Reservation ###
### Test Update ###
### Construct and Test FindFlight ###
### Add Cross Site Origin Support ###
### Introduction ###

## Construct a Flight Reservation App ##
### Construct the Project ###
### Construct Components ###
### Configure Routing ###
### Implement findFlights ###
### Implement Display Flights ###
### Render Flights ###
### Select Flights ###
### Implement Passenger Details Component ###
### Capture Passenger Details ###
### Handle Reservation Save ###
### Show Reservation Confirmation ###
### Flight CheckIn Assignment ###

## Project 2 Usecase ##
### Patient Clinical Project UseCase and Requirements ###

## Construct the REST Backend ##
### Download the Completed Projects ###
### Setup the Database ###
### Executable Java Project ###
### Construct the Project ###
### Construct the Model Classes ###
### Define Entity Relationships ###
### Construct the Patient REST Controller ###
### Implement the GET and Save Patient Methods ###
### Test GET Methods ###
### Test Save Method ###
### Implement Save Clinical Data API ###
### Test Save Clinical Data ###
### Implement Analyze Method ###
### Calculate BMI ###
### Filter the Results ###
### Test Analyze Method ###
### Implement GET Clinical Data Method ###
### Reuse BMI Logic ###
### Test GET Clinical Data ###
### Add Cross Site Origin Support ###

## Frontend Development Using REACT ##
### Instantiate the Project ###
### Instantiate Components ###
### Configure Routing ###
### Start Implementing the Home Page ###
### Implement RowCreator ###
### Test Home Page ###
### Implement Add Patient ###
### Add Patient - Handle Submit ###
### Add Patient - Toastify ###
### Test Add Patient ###
### Implement the Add Clinical Data Component ###
### Construct the HTML Form ###
### Handle Submit ###
### Implement Analyze Component ###
### Construct the TableCreator Component ###
### Steps to Generate Graph ###
### Add Link ###
### Initialize Graph ###
### Generate Graph ###

## Wrap Up ##
### Final Quiz ###
### Bonus Lecture ###