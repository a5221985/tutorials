# Angular 4 #
## Getting Started ##
### Course Introduction ###
### What is Angular? ###
1. Angular is a JavaScript Framework which allows you to develop reactive Single-Page-Application (SPAs)
	1. Single-Page-Application: One HTML file and JavaScript code
		1. Every change is rendered in the browser (does not reach out to server for every change)

### Angular vs Angular 2 vs Angular 4 ###
1. Angular 1: First version
2. Angular 2: Complete rewrite of Angular 1 and the future of Angular
3. Angular 4: Update to Angular 2 (not complete rewrite of Angular 2)

### Project Setup and First App ###
1. Angular CLI: Toolset for creation, management and building angular apps simple
	1. Commands
	2. Why use CLI? because we need mechanism for transpiling TypeScript into JavaScript which can be automated
2. Dependencies:
	1. Node.js
		1. Latest current version
	2. Install Node.js
3. Install CLI:
	1. `sudo npm install -g @angular/cli`
4. Navigate to folder
	1. `ng new my-first-app`
		1. Installs dependencies
5. Navigate into app: `cd my-first-app/`
6. Run the project: `ng serve`
	1. Server is used because Angular needs to load dependencies dynamically 

### CLI Deep Dive & Troubleshooting ###
1. [Documentation](https://github.com/angular/angular-cli/wiki)
2. Problems installing and running? Use latest versions of NodeJS, npm and CLI
3. Updating NodeJS:
	1. Download latest version
	2. Uninstalled previously installed versions
	3. Re-install lastest version
4. Updating npm: `sudo npm install -g npm`
5. Updating the CLI:
	1. `sudo npm uninstall -g angular/cli @angular/cli`
	2. `sudo npm cache clean`
	3. `sudo npm install -g @angular/cli`
6. Common issues and solutions:
	1. Creation of project takes a very long time: Windows problem so try running as administrator
	2. EADDR error (Address already in use): `ng serve --port ANOTHERPORT` or quit the previous `ng serve`
	3. Changes are not reflected in browser (App is not compiling): check if `ng serve` displays an error. If not make sure latest CLI is installed and restart CLI 

### Editing the First App ###
1. Editors:
	1. Microsoft Visual Studio Code (Great Angular support)
	2. Sublime Text
	3. Atom
2. Folder structure:
	1. `e2e`: folder for end to end testing
	2. `src`: Our files that get created
		1. `index.html`: single page that app would serve
		2. `assets`: folder for storing static assets
		3. `environments`: environment variables
		4. `app`: folder that has app files
			1. `app.component.ts`
				1. Change the title and it changes
3. Angular changes HTML code into DOM at runtime:
	1. Page source does not show the actual content
4. `app.component.html`

		<input type="text" [(ngModel)]="name">
		<p>{{ name }}</p>

5. `app.component.ts`

		export class AppComponent {
			name = '';
		}

6. Enter name and it changes dynamically

### The Course Structure ###
1. Getting Started
2. The Basics
3. Components & Databinding
4. Directives
5. Services & Dependency Injection
6. Routing
7. Observables: for asynchronous code
8. Forms
9. Pipes: for transforming output
10. Http: Used to connect to server
11. Authentication
12. Optimization & NgModules
13. Deployment
14. Animations & Testing

### How to get the Most out of the Course ###
1. Watch the Videos
2. Do the Assignments
3. Do the Course Project
	1. Try on your own first
	2. Try to expand the project
4. Ask in Q&A
5. Try to answer Q&A (most learning)
6. Docs + Google

### What is TypeScript? ###
1. More features than vanilla JS (Types, Classes, Interfaces, ...)
2. Compiled to JS (it does not run directly)
	1. CLI can be used for it

### A Basic Project Setup using Bootstrap for Styling ###
1. Empty HTML file
2. Adding Bootstrap:
	1. Navigate into project folder `npm install --save bootstrap`
	2. `.angular-cli.json`
		
			"styles": [
				"../node_modules/bootstrap/dist/css/bootstrap.min.css",
				styles.css
			]

3. `ng serve`

### Where to find the Course Source Code ###
1. Last lecture of a section:

## The Basics ##
### Module Introduction ###
1. See how angular works

### How an Angular App gets Loaded and Started ###
1. Goto `app.component.html`:

		<h3>I'm in the AppComponent!</h3>
2. `index.html` is served by server
	1. `<app-root>Loading...</app-root>` is in the file
		1. It is our root component
3. `app.component.ts`:
	1. `selector: 'app-root'`: replaces this element with contents
4. `<script>`s are injected automatically into `index.html`
	1. `ng serve` generates js bundles and adds them to `index.html`
		1. `main.ts`: first code that gets executed
			1. bootstraps angular app by passing `AppModule` method
				1. `app.module.ts`: Has `bootstrap: [AppComponent]` - App component is referenced

### Components are Important! ###
1. Angular overrides static HTML `index.html`
2. Components: Application can be divied into several components
	1. Header
	2. Buttons on header
	3. Main area
	4. Sidebar
3. Components are reusable

### Creation of a New Component ###
1. `app.component.ts`: it is root component (holds entire app)
2. Add subfolder `app/server`
	1. Add server component `server.component.ts`
	2. Add code

			import { Component } from '@angular/core';

			@Component({
				selector: 'app-server',
				templateUrl: './server.component.html'
			})
			export class ServerComponent {
				
			}

3. Add html file `app/server/server.component.html`

### Understanding the Role of AppModule and Component Declaration ###
1. `app.module.ts`:
	1. module bundles different pieces into packages
		1. This module is one module
		2. Big projects may need multiple modules
	2. `@NgModule`: declarations, imports, providers, bootstrap (which component should be invoked when app starts)
2. Register the new component with `app.module.ts`

		import { ServerComponent } from './server/server.component';

		declarations: [
			...
			ServerComponent
		],

	1. extension is added by webpack
3. `imports`: we can add multiple modules to this module
	1. `BrowserModule`: base functionality to start the app

### Using Custom Components ###
1. `app.component.html`

		...
		<hr>
		<app-server></app-server>

### Creation of Components with the CLI & Nesting Components ###
1. CLI command to generate a component:

		ng generate component servers
		or
		ng g c servers
	
	1. New folder gets created
2. `servers.component.html`

		<app-server></app-server>

3. CLI automatically adds the new component to `app.module.ts`
4. `app.component.html`

		<app-servers></app-servers>

### Working with Component Templates ###
1. Inline template
	1. `servers.component.ts`

			template: '<app-server></app-server><app-server></app-server>', /* no wrapping*/

		1. Multiline html code

				template: `
					<app-server></app-server>
					<app-server></app-server>
				`

			1. Good for small amount of code (upto 3 lines)

### Working with Component Styles ###
1. Bootstrap css styling:
	1. `app.component.html`

			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<h3>I'm in the AppComponent!</h3>
						<hr>
						<app-servers></app-servers>
					</div>
				</div>
			</div>

2. Angular styling:
	1. `app.component.css`

			h3 {
				color: darkblue;
			}

		1. `styleUrls: [...]`: multiple css files can be added
	2. Inline style

			styles: [`
				h3 {
					color: dodgerblue;
				}
			`]

### Fully Understanding the Component Selector ###
1. `selector`: unique and should not override other components
	1. We can use the following:
		1. `selector: '[app-servers]`: `app-servers` is an attribute
			1. `app.component.html`

					<div app-servers></div>
			
		2. `selector: '.app-servers'`: `.app-servers` is classname
			1. `app.component.html`

					<div class="app-servers"></div>

### Assignment 1: Practicing Components ###
1. Two new components: WarningAlert and SuccessAlert
2. Output them beneath each other in `AppComponent`
3. Output a warning or success message in the Components
4. Style the Components appropriately (maybe some red/green text?)
5. Use external or internal templates and styles
6. Feel free to add more components, nest them into each other or play around with different types of selectors

### What is Databinding? ###
1. Databinding is communication
	1. Between TypeScript Code (Business Logic) and Template (HTML)
	2. Types:
		1. Output Data (to Template)
			1. String interpolation [{{ data }}]
			2. Property Binding ([property] = "data")
		2. React to User Events
			1. Event Binding ((event) = "expression")
		3. Two-Way-Binding ([(ngModel)])

### String Interpolation ###
1. `server.component.html`

		<p>{{ 'Server' }} with ID {{ serverId }} is {{ getServerStatus() }}</p>

	1. `{{}}` can contain typescript expression that outputs a string or something that can be converted to a string (number say) (only single line)

2. `server.component.ts`

		export class ServerComponent {
			serverId: number = 10;
			serverStatus: string = 'offline';

			getServerStatus() {
				return this.serverStatus;
			}
		}

### Property Binding ###
1. `server.component.html`

		<button class="btn btn-primary" [disabled]="!allowNewServer">Add Server</button>

	1. the value of `allowNewServer` is dynamically bound (changes if property changes) to the property `disabled`

2. `servers.component.ts`

		allowNewServer = false;

		constructor() {
			setTimeout(() => {
				this.allowNewServer = true;
			} ,2000);
		}

### Property Binding vs String Interpolation ###
1. String interpolation:
	1. `server.component.html`
		
			<p>{{ allowNewServer }}</p>

2. Property binding

		<p [innerText]="allowNewServer"></p>

3. Do not mix property binding and string interpolation:
	1. The following is invalid

			[disabled]="{{!allowNewServer}}"

### Event Binding ###
1. `servers.component.ts`

		serverCreationStatus = 'No server was created';
		...
		onCreateServer() {
			this.serverCreationStatus = 'Server was created!';
		}

2. `servers.component.html`

		<button
			...
			(click)="onCreateServer()">Add Server</button>
		
	1. We can directly add code between `"..."`

### Bindable Properties and Events ###
1. `console.log()` element to see which properties and events it offers
2. For events, remove `on`
	1. `click` in place of `onClick`
3. Mozilla Developer Network (MDN) offers a good list of all properties and events element your're interested in.
	1. Google the following:
		1. `YOUR_ELEMENT properties`
		2. `YOUR_ELEMENT events`

### Passing and Using Data with Event Binding ###
1. `servers.component.html`

		<label>Server Name</label>
		<input 
			type="text" 
			class="form-control"
			(input)="onUpdateServerName($event)">
		<p>{{ serverName }}</p>

	1. `$event`: data emitted with the event
2. `servers.component.ts`

		serverName = '';
		...

		onUpdateServerName(event: any) {
			console.log(event);
			this.serverName = (<HTMLInputElement>event.target).value;
		}

### Two-Way-Databinding ###
1. `servers.component.html`

		<input
			type="text"
			class="..."
			[(ngModel)]="serverName">

	1. Add `FormsModule` from `@anguler/forms` to `imports[]` array in `AppModule`
	2. `ngModel`: 
		1. trigger on input event and update the value of `serverName`
		2. If we change `serverName` somewhere else, it will change in the `input`
2. `servers.component.ts`

		serverName = 'TestServer';

### Important: FormsModule is Required for Two-Way-Binding! ###
1. Need to enable `ngModel` directive
	1. Add `FormsModule` to `imports[]` array in `AppModule`
2. Add import from `@angular/forms` in `app.module.ts`

		import { FormsModule } from '@angular/forms';

### Combining all Forms of Databinding ###
1. `servers.component.html`

		<!-- <p>{{ serverName }}</p> -->

2. `servers.component.ts`

		onCreateServer() {
			this.serverCreationStatus = 'Server was created! Name is ' + this.serverName;
		}

### Assignment 2: Practicing Databinding ###
1. Add an input field which updates a property ('username') via Two-Way-Binding
2. Output the username property via String interpolation (in a paragraph below the input)
3. Add a button which may only be clicked if the username is NOT an empty string
4. Upon clicking the button, the username should be reset to an empty string

### Understanding Directives ###
1. Directives are instructions in the DOM
	1. Components are a kind of instructions (selectors are resolved)
2. There can be directives without a template
	1. Example:

			<p appTurnGreen>Receives a green background!</p>

			@Directive({
				selector: '[appTurnGreen]'
			})
			export class TurnGreenDirective {
				...
			}

### Using ngIf to Output Data Conditionally ###
1. `ngIf`
	1. `servers.component.html`

			<p *ngIf="serverCreated">Server was created, server name is {{ serverName }}</p>

		1. `*` is used because it is a structural directive (it changes the structure of DOM. It adds the element or does not add it)
	2. `servers.component.ts`

			serverCreated = false;
			...
			onCreateServer() {
				this.serverCreated = true;
			}

### Enhancing ngIf with an Else Condition ###
1. `servers.component.html`

		<p *ngIf="serverCreated; else noServer"> ...</p>
		<ng-template #noServer>
			<p>No server was created!</p>
		</ng-tempalate>

	1. `#noServer` a local reference
	2. `ng-template` defines a template

### Styling Elements Dynamically with ngStyle ###
1. `server.component.ts`

		constructor() {
			this.serverStatus = Math.random() > 0.5 ? 'online': 'offline;
		}
		...
		getColor() {
			return this.serverStatus === 'online' ? 'green': 'red';
		}

2. `server.component.html`

		<p [ngStyle]="{'background-color': getColor()}">...</p>
	
		or

		<p [ngStyle]="{backgroundColor: getColor()}">...</p>

	1. `[]` are not part of directive name but property binding `ngStyle`

2. Attribute directives:
	1. They only change element they were placed on.
3. `ngStyle` can be used to dynamically update the style

### Applying CSS Classes Dynamically with ngClass ###
1. `ngClass`: dynamically add and remove css classes
2. `server.component.ts`:
		
		styles: [`
			.online {
				color: white;
			}
		`]

3. `server.component.html`

		<p
			...
			[ngClass]="{online: serverStatus === 'online'}">
			...

	1. object: contains key value pair
		1. key: classname
		2. value: condition whether class should be attached or not (could be expression that gives boolean value)

### Outputting Lists with ngFor ###
1. `ngFor`
2. `servers.component.ts`

		servers = ['TestServer', 'TestServer 2'];
		...
		onCreateServer() {
			...
			this.servers.push(this.serverName);
		}

3. `servers.component.html`

		<app-server *ngFor="let server of servers"></app-server>

	1. `server` will be used to set content

### Assignment 3: Practicing Directives ###
1. Add a button which says 'Display Details'
2. Add a paragraph with any content of your choice (e.g. 'Secret Password = tuna')
3. Toggle the displaying of that paragraph with the button created in the first step
4. Log all button clicks in an array and output that array below the secret paragraph (mybe log a timestamp or simply an incrementing number)
5. Starting at the 5th log item, give all future log items a blue background (via ngStyle) and white color (ngClass)

### Getting the Index when using ngFor ###
1. `app.component.ts`

		this.log.push(new Date());

2. `app.component.html`

		*ngFor="let logItem of log; let i = index"
			[ngStyle]="{backgroundColor: i >= 4? 'blue' : 'transparent'}"
			[ngClass]="{'white-text}: i >= 5"

## Course Project - The Basics ##
### Project Introduction ###
1. Recipe book and shopping list app

### Planning the App ###
1. Features:
	1. Shopping List
	2. Recipe Book
2. Components:
	1. Root component
	2. Header (to navigate between the tow features)
	3. Shopping List
		1. Shopping List
		2. Shopping List Edit
	4. Recipe Book
		1. Recipe List
		2. Recipe Item
		3. Recipe Detail
		4. RecipesComponent
3. Model: (put data in its own class)
	1. Shopping List
		1. Ingredient
	2. Recipe Book
		1. Recipe
3. Approach: 

### Setting up the Application ###
1. `ng new`
2. Add bootstrap framework
	1. Goto project folder

			npm install --save bootstrap

	2. Goto `.angular-cli.json`

			"styles": [
				"../node_modules/bootstrap/dist/css/bootstrap.min.css",
				...
			],

		1. Path is relative to `index.html` which is in `src`
3. Clear `app.component.html`
4. `ng serve`
5. `app.component.html`

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2>I am working!</h2>
				</div>
			</div>
		</div>

### Creation of the Components ###
1. `header/header.component.ts`

		import { Component } from '@angular/core';

		@Component({
			selector: 'app-header',
			templateUrl: './header.component.html'
		})
		export class HeaderComponent {

		}

2. `header/header.component.html`

		<h1>The Header</h1>

3. `app.component.html`

		<app-header></app-header>

4. `app.module.ts`

		import { HeaderComponent } from './header/header.component';

		declarations: [
			...
			HeaderComponent
		]

5. `ng g c recipes --spec false`
6. `ng g c recipes/recipe-list --spec false`
7. `ng g c recipes/recipe-detail --spec false`
8. `ng g c recipes-list/recipe-item --spec false`
9. `ng g c shopping-list --spec false`
10. `ng g c shopping-list/shopiing-edit --spec false`

### Using the Components ###
1. `app.component.html`

		<div class="col-md-12">
			<app-recipes></app-recipes>
			<app-shopping-list></app-shopping-list>
		</div>

2. `recipes.component.html`

		<div class="row">
			<div class="col-md-5">
				<app-recipe-list></app-recipe-list>
			</div>
			<div class="col-md-7">
				<app-recipe-detail></app-recipe-detail>
			</div>
		</div>

3. `recipe-list.component.html`

		<app-recipe-item></app-recipe-item>

4. `shopping-list.component.html`

		<div class="row">
			<div class="col-xs-10">
				<app-shopping-edit></app-shopping-edit>
				<hr />
				<p>The list</p>
			</div>
		</div>

### Adding a Navigation Bar ###
1. `header.component.html`

		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a href="#" class="navbar-brand">Recipe Book</a>
				</div>

				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="#">Recipes</a></li>
						<li><a href="#">Shopping List</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" role="button">Manage <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Save Data</a></li>
								<li><a href="#">Fetch Data</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>

### Alternative Non-Collapsable Navigation Bar ###
1. Replace `collapse navbar-collapse` with `navbar-default` for hamburger menu

### Creation of a "Recipe" Model ###


### Adding Content to the Recipes Components ###
### Outputting a List of Recipes with ngFor ###
### Displaying Recipe Details ###
### Working on the ShoppingListComponent ###
### Creation of an "Ingredient" Model ###
### Creation of and Outputting the Shopping List ###
### Adding a Shopping List Edit Section ###
### Wrap Up & Next Steps ###

## Debugging ##
### Understanding Angular Error Messages ###
### Debugging Code in the Browser Using Sourcemaps ###
### Using Augury to Dive into Angular Apps ###

## Components & Databinding Deep Dive ##
### Module Introduction ###
### Splitting Apps into Components ###
### Property & Event Binding Overview ###
### Binding to Custom Properties ###
### Assigning an Alias to Custom Properties ###
### Binding to Custom Events ###
### Assigning an Alias to Custom Events ###
### Custom Property and Event Binding Summary ###
### Understanding View Encapsulation ###
### More on View Encapsulation ###
### Using Local References in Templates ###
### Getting Access to the Template & DOM with `@ViewChild` ###
### Projecting Content into Components with ng-content ###
### Understanding the Component Lifecycle ###
### Seeing Lifecycle Hooks in Action ###
### Lifecycle Hooks and Template Access ###
### Getting Access to `ng-content` with `@ContentChild` ###
### Wrap Up ###
### Assignment 4: Practicing Property & Event Binding and View Encapsulation ###

## Course Project - Components & Databinding ##
### Introduction ###
### Adding Navigation with Event Binding and ngIf ###
### Passing Recipe Data with Property Binding ###
### Passing Data with Event and Property Binding (Combined) ###
### Allowing the User to Add Ingredients to the Shopping List ###

## Directives Deep Dive ##
### Module Introduction ###
### `ngFor` and `ngIf` Recap ###
### `ngClass` and `ngStyle` Recap ###
### Creation of Basic Attribute Directive ###
### Using the Renderer to Build a Better Attribute Directive ###
### More about the Renderer ###
### Using HostListener to Listen to Host Events ###
### Using HostBinding to Bind to Host Properties ###
### Binding to Directive Properties ###
### What Happens behind the Scenes on Structural Directives ###
### Building a Structural Directive ###
### Understanding `ngSwitch` ###

## Course Project - Directives ##
### Building and Using a Dropdown Directive ###

## Using Services & Dependency Injection ##
### Module Introduction ###
### Why would you Need Services? ###
### Creation of Logging Service ###
### Injecting the Logging Service into Components ###
### Creation of Data Service ###
### Understanding the Hierarchical Injector ###
### How many Instances of Service Should It Be? ###
### Injecting Services into Services ###
### Using Services for Cross-Component Communication ###
### Assignment 5: Practicing Services ###

## Course Project - Services & Dependency Injection ##
### Introduction ###
### Setting up the Services ###
### Managing Recipes in a Recipe Service ###
### Using a Service for Cross-Component Communication ###
### Adding the Shopping List Service ###
### Using Services for "Push Notifications" ###
### Adding Ingredients to Recipes ###
### Passing Ingredients from Recipes to the Shopping List (via a Service) ###

## Changing Pages with Routing ##
### Module Introduction ###
### Why do we need a Router? ###
### Understanding the Example Project ###
### Setting up and Loading Routes ###
### Navigating with Router Links ###
### Understanding Navigation Links ###
### Styling Active Router Links ###
### Navigating Programmatically ###
### Using Relative Paths in Programmatic Navigation ###
### Passing Parameters to Routes ###
### Fetching Route Parameters ###
### Fetching Route Parameters Reactively ###
### An Important Note about Route Observables ###
### Passing Query Parameters and Fragments ###
### Practicing and some Common Gotchas ###
### Setting up Child (Nested) Routes ###
### Using Query Parameters - Practice ###
### Configuring the Handling of Query Parameters ###
### Redirecting and Wildcard Routes ###
### Important: Redirection Path Matching ###
### Outsourcing the Route Configuration ###
### An Introduction to Guards ###
### Protecting Routes with `canActivate` ###
### Protecting Child (Nested) Routes with `canActivateChild` ###
### Using a Fake Auth Service ###
### Controlling Navigation with `canDeactivate` ###
### Passing Static Data to a Route ###
### Resolving Dynamic Data with the resolve Guard ###
### Understanding Location Strategies ###
### Wrap Up ###

## Course Project - Routing ##
### Planning the General Structure ###
### Setting Up Routes ###
### Adding Navigation to the App ###
### Marking Active Routes ###
### Fixing Page Reload Issues ###
### Child Routes: Challenge ###
### Adding Child Routing Together ###
### Configuring Route Parameters ###
### Passing Dynamic Parameters to Links ###
### Styling Active Recipe Items ###
### Adding Editing Routes ###
### Retrieving Route Parameters ###
### Programmatic Navigation to the Edit Page ###
### One Note about Route Observables ###
### Project Cleanup ###

## Understanding Observables ##
### Module Introduction ###
### Analyzing a Built-in Angular Observables ###
### Building & Using a Fist Simple Observable ###
### Building & Using a Custom Observable from Scratch ###
### Unsubscribe! ###
### Where to learn more ###
### Using Subjects to Pass AND Listen to Data ###
### Understanding Observable Operators ###
### Wrap Up ###

## Course Project - Observables ##
### Improving the Reactive Service with Observables (Subjects) ###

## Handling Forms in Angular Apps ##
### Module Introduction ###
### Why do we Need Angular's Help? ###
### Template-Driven (TD) vs Reactive Approach ###
### An Example Form ###
### TD: Creation of the Form and Registering the Controls ###
### TD: Submitting and Using the Form ###
### TD: Understanding Form State ###
### TD: Accessing the Form with `@ViewChild` ###
### TD: Adding Validation to Check User Input ###
### Built-in Validators & Using HTML5 Validation ###
### TD: Using the Form State ###
### TD: Outputting Validation Error Messages ###
### TD: Set Default Values with `ngModel` Property Binding ###
### TD: Using `ngModel` with Two-Way-Binding ###
### TD: Grouping Form Controls ###
### TD: Handling Radio Buttons ###
### TD: Setting and Patching Form Values ###
### TD: Using Form Data ###
### TD: Resetting Forms ###
### Assignment 6: Practicing Template-Driven Forms ###
### Introduction to the Reactive Approach ###
### Reactive: Setup ###
### Reactive: Creation of a Form in Code ###
### Reactive: Syncing HTML and Form ###
### Reactive: Submitting the Form ###
### Reactive: Adding Validation ###
### Reactive: Getting Access to Controls ###
### Reactive: Grouping Controls ###
### Reactive: Arrays of Form Controls (FormArray) ###
### Reactive: Creation of Custom Validators ###
### Reactive: Using Error Codes ###
### Reactive: Creation of Custom Async Validator ###
### Reactive: Reacting to Status or Value Changes ###
### Reactive: Setting and Patching Values ###
### Assignment 7: Practicing Reactive Forms ###

## Course Project - Forms ##
### Introdcution ###
### TD: Adding the Shopping List Form ###
### Adding Validation to the Form ###
### Allowing the Selection of Items in the List ###
### Loading the Shopping List Items into the Form ###
### Updating existing Items ###
### Resetting the Form ###
### Allowing the User to Clear (Cancel) the Form ###
### Allowing the Deletion of Shopping List Items ###
### Creation of Template for teh (Reactive) Recipe Edit Form ###
### Creation of Form For Editing Recipes ###
### Syncing HTML with the Form ###
### Adding Ingredient Controls to a Form Array ###
### Adding new Ingredient Controls ###
### Validating User Input ###
### Submitting the Recipe Edit Form ###
### Adding a Delete and Clear (Cancel) Functionality ###
### Redirecting the User (after Deleting a Recipe) ###
### Adding an Image Preview ###
### Providing the Recipe Service Correctly ###
### Deleting Ingredients and Some Finishing Touches ###

## Using Pipes to Transform Output ##
### Introduction & Why Pipes are Useful ###
### Using Pipes ###
### Parameterizing Pipes ###
### Where to learn more about Pipes ###
### Chaining Multiple Pipes ###
### Creation of Custom Pipes ###
### Parameterizing a Custom Pipe ###
### Example: Creation of Filter Pipe ###
### Pure and Impure Pipes (or: How to "fix" the Filter Pipe) ###
### Understanding the "async" Pipe ###
### Assignment 8: Practicing Pipes ###

## Making Http Requests ##
### Introduction & How Http Requests Work in SPAs ###
### Example App & Backend Setup ###
### Sending Requests (Example: POST Request) ###
### Adjusting Request Headers ###
### Sending GET Requests ###
### Sending a PUT Request ###
### Transform Responses Easily with Observable Operators (`map()`) ###
### Using the Returned Data ###
### Catching Http Errors ###
### Using the "async" Pipe with Http Requests ###

## Course Project - Http ##
### Introduction ###
### Setting up Firebase as a Dummy Backend ###
### Sending PUT Requests to Save Data ###
### GETting Back the Recipes ###
### Transforming Response Data to Prefent Errors ###

## Authentication & Route Protection in Angular Apps ##
### Module Introduction ###
### How Authentication Works in Single-Page-Applications ###
### More about JWT ###
### Creation of Signup Page and Route ###
### Setting up the Firebase SDK ###
### Signing Users Up ###
### Signing Users In ###
### Requiring a Token (on the Backend) ###
### Sending the Token ###
### Checking and Using Authentication Status ###
### Adding a Logout Button ###
### Route Protection and Redirection Example ###
### Wrap Up ###
### Possible Improvements ###

## Using Angular Modules & Optimizing Apps ##
### Module Introduction ###
### The Idea behind Modules ###
### Understanding the App Module ###
### Understanding Feature Modules ###
### Creation of Recipe Feature Module ###
### Registering Routes in a Feature Module ###
### Understanding Shared Modules ###
### Creation of Shared Module ###
### Creation of a Shopping List Feature Module ###
### Loading Components via Selectors vs Routing ###
### A Common Gotcha ###
### Creation of Auth Feature Module ###
### Understanding Lazy Loading ###
### Adding Lazy Loading to the Recipes Module ###
### Protecting Lazy Loaded Routes with `canLoad` ###
### How Modules and Services Work Together ###
### Understanding the Core Module ###
### Creation of a Basic Core Module ###
### Restructuring Services to use the Child Injector ###
### Using Ahead-of-Time Compilation ###
### How to use AoT Compilation with the CLI ###
### Preloading Lazy Loaded Routes ###
### Wrap Up ###

## Deploying an Angular App ##
### Module Introduction ###
### Deployment Preparations and Important Steps ###
### Example: Deploying to AWS S3 ###

## Angular Animations ##
### Making Animations Work with Angular 4 ###
### Introduction ###
### Setting up the Starting Project ###
### Animations Triggers and State ###
### Switching between States ###
### Transitions ###
### Advanced Transitions ###
### Transition Phases ###
### The "void" State ###
### Using Keyframes for Animations ###
### Grouping Transitions ###
### Using Animation Callbacks ###

## A Basic Introduction to Unit Testing in Angualar Apps ##
### About this Section ###
### Introduction ###
### Why Unit Tests? ###
### Analyzing the Testing Setup (as created by the CLI) ###
### Running Tests (with the CLI) ###
### Adding a Component and some fitting Tests ###
### Testing Dependencies: Components and Services ###
### Simulating Async Tasks ###
### Using "fakeAsync" and "tick" ###
### Isolated vs Non-Isolated Tests ###
### Further Resources & Where to Go Next ###

## Course Roundup ##
### Course Roundup ###

## About the Course Update & Angular 4 ##
### What Changed with Angular 4? ###

## Custom Project & Workflow Setup ##
### Introduction ###
### Initializing the Project ###
### Setting up the Basic Project Files ###
### Installing the Core Dependencies ###
### Filling the Project Files with Some Life ###
### `index.html` & Polyfills ###
### Installing Development Dependencies ###
### Setting up a Development Workflow ###
### Finishing & Using the Development Workflow ###
### Setting up a Production Workflow ###
### Adding Types & Fixing Bugs ###
### Finishing Touches ###

## Bonus: TypeScript Introduction (for Angular 2 Usage) ##
### Introduction ###
### Using Types ###
### Classes ###
### Interfaces ###
### Generics ###
### Wrap up & Modules ###
### Deep dive into TypeScript ###
