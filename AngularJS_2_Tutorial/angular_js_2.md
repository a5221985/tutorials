# Angular JS 2 #
## What is TypeScript ##
1. Superset to JS
2. Adds new features
	1. Classes
	2. Modules
3. Slightly different syntax to JS
4. Compiled to JS
	1. TypeScript transpiler checks types
5. Provides strong typing
6. Next gen JS features can be used
	1. Classes, Imports/Exports, ...
7. It has missing JS features
	1. Interfaces, Generics, ...

### Angular 2 specific ###
1. There is good documentation and support for TypeScript
2. Angular team chose TypeScript for Angular2

## Installing TypeScript Globally ##
1. `sudo npm install typescript -g` **(M)**

## Understanding TypeScript ##
1. Files: `*.ts` **(M)**
2. We can write JS code in TypeScript file
3. Example:

		import { Component } from '@angular/core';
		@Component({
			selector: 'app-root',
			templateUrl: 'app.component.html',
			styleUrls: ['app.component.css']
		})
		export class AppComponent {
			title = 'I changed it!';
		}

4. Imports:
	1. Used to import code from another module
		1. `@angalar`: angular 2 module
	2. module?
		1. anything that is exported is a module
		2. Do not add file extension
	3. Example: Importing from own file
		1. `import { MyOtherComponent } from 'myother.component';`
5. Decorators: `@Component`
	1. Functions that get attached to other code (class say)
	2. Specifies code that is executed in the background
	3. `@Component` takes a JS object and adds a metadata to the class in background which makes the class a component
6. class:
	1. A blueprint for JS objects
	2. Angular 2 takes care of instantating objects based on classes for us usually
7. Types:
	1. Are used to assing Types to properties, variables ...
	2. Example:
		1. `someProperty: string = 'Hello';` **(M)** (Only string values can be assigned to properties)

## @Component ##
1. `selector`: defines an element
	1. `selector: 'app-root'`: `<app-root></app-root>`
	2. `selector: '#app-root'`: `<div id="app-root"></div>`

## How does Angular Get Started ##
1. Scripts are added to final source code automatically
	1. `main.bundle.js`: contains our code, angular code and third party code.
		1. starts angular app
		2. First starts `main.ts`
			1. `main.ts`: boostraps angular app (appmodule)
2. Angular does not load all components at once
	1. `appmodule.ts`: bootstrap `AppComponent` (root component)
3. `AppComponent` recognizes `app-root` and then finds it in `index.html` and renders it

## app.module.js ##
1. `@NgModule`: imported from `@angular/core`
	1. Defines the parts of our app
	2. `declarations`: directives and components used
	3. `imports`: which other modules do we use
		1. `BrowserModule`: built in directives
		2. `FormsModule`: form related things
		3. `HppModule`: for HTTP requests
	4. `providers`: for app wide services

## HTML Template ##
1. Inline template:
	
		template: `
			<h1>Inline Template</h1>
		`
		styles: [`
			h1 {
				color: red;
			}
		`]

2. Rule of thumb:
	1. If template is <= 3 lines, use inline templates

## New Components ##
1. `ng generate component other`
2. The following changes will take place
	1. `other` directory will get created under `app` directory with the following files
		1. `other.component.ts`
		2. `other.component.html`
		3. `other.component.css`
		4. `other.component.spec.ts`
	2. `app.module.js` gets modified as follows:
		1. `import { OtherComponent } from './other/other.component'`
		2. Component gets added to declarations

				declarations: [
					...
					OtherComponent
				]

## Selectors ##
1. They must be unique (use prefixes)

## Multiple Components ##
1. `cd src/app/other`
2. `ng generate component another --flat --inline-styles --inline-template`
	1. `ng g c another --flast -is -it`
	2. `--flat`: do not generate another folder but generate files in the same folder

## View Encapsulation ##
1. Shadow dom (only few browsers support):
	1. An html element has separate dom behind the scenes
2. Angular support for old

		<h1 _ngcontent-pax-1>Hello there!</h1>

	1. Cryptical attribute: angular recognizes
	2. Adds a new style as follows:

			<style>h1[_ngcontent-qed-1] {
				color: red;
			}</style>

## Inserting Content ##
1. Adding a border:

		template: `
			<article>
				Text
			</article>
		`,
		styles: [`
			article {
				border: 1px solid black
			}	
		`]
2. Passing other HTML code into a component
	
		<app-other>
			<div>
				<h2>Hello!</h2>
				<p>World!</p>
			</div>
		</app-other>

		
		template: `
			<ng-content></ng-content>
		`
	1. The code is retained

## Data Binding ##
1. Communication: logic interacts with component template by passing data and listening to events
2. Types:
	1. String interpolation: `{{ Expression resolving to a string }}`
	2. Property binding: `<button [disabled]="expression resolving to required value type">`
	3. Event Binding: `<button (click)="expression handling the event">`
	4. Two way data binding: `<input [(ngModel)]="bound model (e.g. object)">` (property and event binding)
		1. If text is entered in input, associated model gets updated and if model is updated, the text in input gets updated
3. Example component
	1. `ng g c databinding`
	2. `first-app.component.ts`

			import { DatabindingComponent } from './databinding';

			...

			@Component({
				...
				template: `
					<fa-databinding></fa-databinding>
				`,
				directives: [DatabindingComponent]
			})
			export class FirstAppAppComponent {
			}

## Property & Event Binding ##
1. Where are they available?
	1. DOM properties: (existing)
		1. `<img [src]="...">`
		2. `<img (click)="...">`
	2. Directive Properties
		1. `<div [ngClass]="...">`: css classes to element
		2. `<div (ngSubmit)="...">`: event occuring on submit
	3. Component Properties
		1. `<cmp [initObj]="...">`
		2. `<cmp (rndEvent)="...">`: emit events
2. Custom Bindings
	1. Property binding: `@Input() propertyName: string;` **(M)**
	2. Event Binding: `@Output() eventName = new EventEmitter();` **(M)**

## Property Binding ##
1. databinding.component.html
	
		<h1>String Interpolation</h1>
		<p>
			{{stringInterpolation}} | {{numberInterpolation}}
		</p>
		<hr>
		<h1>Property Binding</h1>
		<input type="text" [value]="stringInterpolation"/>
2. Binding to directive properties:
	
		<p [ngClass]="{redBorder: true}">Is this styled?</p> **(M)**
	
	1. inside "" write js code but new, multiline code is not allowed.
	2. databinding.component.css
		
			.redBorder {
				border: 1px solid red;
			}

	3. Return value as property value

			<p [ngClass]="{redBorder: onTest()">Is this styled?</p>

	4. databinding.component.ts

			onTest() {
				return true;
			}

3. `ngStyle`

		<p [ngStyle]="{color: 'green'}">Is this styled?</p> 

## Binding Custom Properties ##
1. `cd databinding/`
2. `ng g c property-binding --flat -it -is`
3. property-binding.component.ts

		template: `
			{{result}}
		`
		...

		export class PropertyBindingComponent {
			@Input() result: number = 0;
		}

	1. Binding from outside is possible
4. Databinding.component.html

		<fa-property-binding [result]="10"></fa-property-binding>

## Event Binding ##
1. `ng g c event-binding --flat -it -is`
2. event-binding.component.ts

		template: `
			<button (click)="onClick()">Click Me!</button>
		`

3. databinding.component.html

		<app-event-binding></fa-event-binding>

## Custom Events ##
1. event-binding.component.ts
		
		import { Component, EventEmitter, Output } from '@angular/core'; 

		export class EventBindingComponent {
			@Output() clicked = new EventEmitter<string>();

			onClicked() {
				this.clicked.emit('It works!);
			}
		}

2. databinding.component.html

		<app-event-binding (clicked)="onClicked($event)"></app-event-binding> **(M)**

3. databinding.component.ts

		export class DatabindingComponent {
			...
			onClicked(value: string) {
				alert(value);
			}
		}

## More on Event and Property binding ##
1. Giving different name for event to the outside world

		@Output('clickable') clicked = new EventEmitter(); **(M)**

		...

		<app-event-binding (clickable)="onClicked($event)"></app-event-binding>
2. Using an array of Inputs instead of using `@Input()` decorator

		@Component({
			...
			inputs: ['result'] 
		})
		export class PropertyBindingComponent {
			result: number = 0;
		}

## ngModel and AppModules ##
1. Import `FormsModule` in `AppModule` for `ngModel` to work when using `AppModules(NgModules)` (for RC5 or higher)

		import { NgModule } from '@angular/core';
		import { BrowserModule } from '@angular/platform-browser';
		import { FormsModule } from '@angular/forms';
		import { AppComponent } from './app.component';

		@NgModule({
			declarations: [AppComponent],
			imports: [BrowserModule, FormsModule],
			bootstrap: [AppComponent]
		})
		export class AppModule {}

## Two-Way Binding ##
1. It is slow and other problems
2. `ng g c two-way-binding --flat -it -is`
3. `two-way-binding-component.ts`

		import { Component } from '@angular/core';

		@Component({
			moduleId: module.id,
			selector: 'fa-two-way-binding',
			template: `
				<input type="text" [(ngModel)] = "person.name">
				<input type="text" [(ngModel)] = "person.name">
				<br/>
			`
		})
		export class TwoWayBindingComponent {
			person = {
				name: 'Max',
				age: 27
			};
		}

4. `databinding.component.ts`

		import { TwoWayBinding } from './two-way-binding.component'
		...
		directives: [..., TwoWayBindingComponent]

5. `databinding.component.html`

		<h1>Two-Way Binding</h1>
		<fa-two-way-binding></fa-two-way-binding>

## The Component Lifecycle ##
1. Lifecyle Hooks:
	1. ngOnChanges: Before #2 and when data-bound Property Value changes
		1. If property changes, angular 2 detects for rerendering UI
		2. Used to do something whenever a property changes
		3. Runs many times
	2. ngOnInit: On component initialization, after first ngOneChanges - only once
	3. ngDoCheck: During every Angular 2 Change Detection Cycle
		1. Even if no changes occur, this hook is called
	4. ngAfterContentInit: After content is inserted (using <ng-content> directive)
		1. After content is initialized
	5. ngAfterContentChecked: After every Check of Inserted Content
		1. After content is checked
		2. On change detection on inserted content
	6. ngAfterViewInit: After initializing the component's views/child views
		1. Like after HTML templates are initialized
	7. ngAfterViewChecked: After every check of the component's views/child views (native templates)
	8. ngOnDestroy: Just before Angular 2 destroys the Directive/ Component
2. Examples:
	1. `ng g c lifecycle --flat -it -is`
	2. Change import to LifecycleComponent and directives
	3. Implementation

			import { ..., OnInit, OnChanges, DoCheck, AfterContentInit, AfterContentChecked, AfterViewInit, AfterViewChecked, OnDestroy }

			...

			export class LifecycleComponent implements OnChanges, OnInit, DoCheck, AfterContentInit, AfterContentChecked, AfterViewInit, AfterViewChecked, OnDestroy {
				ngOnChanges() {
					this.log('ngOnChanges')
				}

				ngOnInit() {
					this.log('ngOnChanges')
				}

				ngDoCheck() {
					this.log('ngOnChanges')
				}

				ngAfterContentInit() {
					this.log('ngOnChanges')
				}

				ngAfterContentChecked() {
					this.log('ngOnChanges')
				}

				ngAfterViewInit() {
					this.log('ngOnChanges')
				}

				ngAfterViewChecked() {
					this.log('ngOnChanges')
				}

				ngOnDestroy() {
					this.log('ngOnChanges')
				}

				log(hook: String) {
					Console.log(hook)
				}
			}

	4. Destroy hook
		
			<fa-lifecycle *ngIf="!delete"></fa-lifecycle>			<button (click) = "delete = true">Click to Delete</button>	

## Component Lifecycle Usage Examples ##
1. Content:

		<fa-lifecycle *ngIf="!delete">
			<p>{{test}}</p>
		</fa-lifecycle>
		<button ...>
		<button (click) = "test = 'Changed value'">Click to Change</button>

2. lifecycle.component.ts

		template: `
			<ng-content></ng-content>
		`
	1. ...

## Template Access with Local References, ViewChild and ContentChild ##
1. ng-content: putting data from outside into my component
2. References

		<p #boundParagraph>{{bindable}}</p>
		<p>{{boundPragraph.textContent}}</p>

	1. References can be used to get properties ...
	2. Local variable inside template
3. How to use it in code

		@ViewChild('boundPragraph')
		boundParagraph: HTMLElement;

		...

		ngAfterViewInit() {
			log(this.boundParagraph);
		}

4. How to use reference in another template?
	1. first-app.component.ts

			template:`
				<fa-lifecyle *ngIf="!delete" [bindable] = "boundValue">
					<p #boundContent>{{test}}</p>
				</fa-lifecycle>
			`
	2. lifecycle.component.ts

			@ContentChild('boundContent')
			boundContent: HTMLElement;

			...

			ngAfterContentInit() {
				log(this.boundContent);
			}

## Course Project - Components & Databinding ##
### Project Setup ###
1. `ng new recipe-book --prefix rb` **(M)**
2. Remove spec and css files
3. Remove styleURLs in app.component.ts
4. Get Bootstrap:
	1. index.html
			
			<head>
				...
				<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
			</head>

	2. Remove everything in `app.component.html`

### IMPORTANT: Required Changes ###
1. Don't add directives but add it to declarations
2. app.component.ts will be recipe-book.component.ts

### Course Project: Creation of Header Component ###
1. `cd src/app`
2. `ng g c header --flat`
3. Remove test file and style file
4. html
	1. Get navbar code from Bootstrap
	2. Remove Buttons
	3. Change:

			<div class="navbar-header">
				<a class="navbar-brand" href="#">Recipe Book</a>
			</div>

			<ul class="nav navbar-nav">
				<li><a href="#">Recipe</a></li>
				<li><a href="#">Shopping List</a></li>
			</ul>

	4. Remove form
	5. Remove `<li><a href="#">Link</a></li>`
	6. Remove `data-toggle="dropdown"`
	7. Change `Dropdown` to `User`
	8. Links

			<ul class="dropdown-menu">
				<li><a href="#">Login</a></li>
				<li><a href="#">Other</a></li>
				<li role="seperator" class="divider"></li>
				<li><a href="#">Logout</a></li>
			</ul>
	9. In `app.component.html` add
	
			<rb-header></rb-header>
			Recipes

### Course Project: Creation of Recipes Component ###
1. `ng g c recipes`
2. Remove test and css and styles
3. recipes.component.html

		<div class="row">
			<div class="col-md-5">
				Recipe List
			</div>
			<div class="col-md-7">
				Recipe Detail
			</div>
		</div>

4. app.component.ts

		...
		<div class="container">
			<rb-recipes></rb-recipes>
		</div>

### Course Project: Creation of Recipe Model & List Component ###
1. Recipe list
	1. `cd app/recipes`
	2. `ng g c recipe-list`
			
2. Recipe Item
	1. `cd app/recipes/recipe-list`
	2. `ng g c recipe-item --flat`
	3. recipe-item.component.html

			<a href="#" class="list-group-item clearfix">
				<div class="pull-left">
					<h4 class="list-group-item-heading">{{recipe.name}}</h4>
					<p class="list-group-item-text">{{recipe.description}}</p>
				</div>
				<span class="pull-right">
					<img class="img-responsive"
						src="{{recipe.imagePath}}"
						style="max-height: 50px;"/>
				</span>
			</a>

	4. recipe-item.component.ts

			import { ..., Input} ...

			export class ... {
				@Input() recipe: Recipe;
				recipeId: number;
				...
			}

	5. recipe-list.component.ts

			export class RecipeListComponent implements OnInit {
				recipes: Recipe[];
			}

3. Recipe class
	1. `cd app/recipes`
	2. `ng g cl recipe`
	
			export class Recipe {
				constructor(public name: string, public description: string, public imagePath: string) {}
			}
4. Import Recipe Class
	1. recipe-item.component.ts

			import { Recipe } from '../recipe';

5. Html
	1. recipe-list.component.html

			<div class="row">
				<div class="col-xs-12">
					<a class="btn btn-success">New Recipe</a>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<ul class="list-group">
						<rb-recipe-item [recipe]="recipe"></rb-recipe-item>
					</ul>
				</div>
			</div>

6. Dummy recipe
	1. recipe-list.component.ts

			recipe = new Recipe('Dummy', 'Dummy', 'https://www.google.co.in/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=0ahUKEwiklP75hJLSAhUGvRoKHZljAHwQjRwIBw&url=http%3A%2F%2Fwww.dailymail.co.uk%2Ffemail%2Farticle-3194442%2FHow-cure-four-year-old-s-addiction-dummy-Harper-Beckham-photographed-one-mouth-JILL-FOSTER-speaks-mums-children-use-soother-past-age-one.html&bvm=bv.147134024,d.d2s&psig=AFQjCNEpjMHkUsG3cq3KGwz8A2aCEbr77w&ust=1487245855323402')

7. recipe.component.html

		<div ...>
			<div ...>
				<rb-recipe-list></rb-recipe-list>
			</div>
			...

### Course Project: Recipe Detail & Databinding ###
1. `cd app/recipes`
2. `ng g c recipe-detail`
3. recipe-detail.component.html

		<div class="row">
			<div class="col-xs-12">
				<img src="{{selectedRecipe?.imagePath}}" alt="" class="img-responsive">
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<h1>{{selectedRecipe?.name}}</h1>
			</div>
			<div class="col-xs-12">
				<button class="btn btn-success">To Shopping List</button>
				<button class="btn btn-primary">Edit</button>
				<button class="btn btn-danger">Delete</button>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-xs-12">
				<p>{{selectedRecipe?.description}}</p>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				Ingredients
			</div>
		</div>

3. recipe-detail.component.ts

		import {..., Input, EventEmitter } ...

		@Input() selectedRecipe: Recipe;

4. recipe-list.component.ts

		@Output() recipeSelected = new EventEmitter<Recipe>();

		onSelected(recipe: Recipe) {
			this.recipeSelected.emit(recipe);
		}

4. recipe-list.component.html

		<rb-recipe-item ... (click) = "onSelected(recipe)"></rb-recipe-item>
		
5. recipe.component.html
		
		<div class="col-md-5">
			<rb-recipe-list (recipeSelected) = "selectedRecipe = $event"></rb-recipe-list>
		</div>
		<div class="col-md-7">
			<rb-recipe-detail [selectedRecipe] = "selectedRecipe"></rb-recipe-detail>
		</div>

	1. `$event`: refers to data emitted by `EventEmitter` in angular 2

6. recipes.component.ts

		import { Recipe } from './recipe';

		...

		selectedRecipe: Recipe;


### Course Project: Shopping List Component ###
1. `cd app`
2. `ng g c shopping-list`
3. shopping-list.component.html

		<div class="row">
			<div class="col-xs-10">
				<hr>
				<ul class="list-group">
					<a class="list-group-item" style="cursor: pointer"></a>
				</ul>
			</div>
		</div>

4. shopping list add form
	1. `cd shopping-list`
	2. `ng g c shopping-list-add --flat`
	3. shopping-list-add.component.html

			<div class="row">
				<div class="col-xs-12">
					<form id="shopping-list-add">
						<div class="row">
							<div class="col-sm-5 form-group">
								<label for="item-name">Name</label>
								<input type="text" id="item-name" required class="form-control">
							</div>

							<div class="col-sm-2 form-group">
								<label for="item-amount">Amount</label>
								<input type="text" id="item-amount" required class="form-control">
							</div>
							<div class="row">
								<div class="col-xs-12">
									<button class="btn btn-success" type="submit">Add</button>
									<button class="btn btn-danger" type="button">Delete Item</button>
									<button class="btn btn-primary" type="button">Clear</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>

5. shopping-list.component.html

		<div class="row">
			<div class="col-xs-10">
				<rb-shopping-list-add></rb-shopping-list-add>
				<hr>
				<ul class="list-group">
					<a class="list-group-item" style="..."></a>
				</ul>
			</div>
		</div>

6. recipe-book.component.html

		<div class="container">
			...
			<rb-shopping-list></rb-shopping-list>
		</div>

## Directive ##
### What are Directives? ###
1. Directives are core of each application
2. Directives are instructions
	1. Example:

			<div>
				<ul>
					<li *ngFor = "let item of items">{{ item }}</li>
				</ul>
			</div>

		1. Loop through all items and, in each iteration, assign the current element to a variable called item. Also replicate the <li> element for each iteration
	2. Example 2:

			<div>
				<my-component></my-component>
			</div>

		1. Creation of a component of the selected type and render the view (template) of the component into this space.
3. Attribute directives
	1. Attribute directives interact with the Element to which they are applied to (e.g. change the style)
		1. Examples: `ngClass`, `ngStyle`
	2. They are called so because they are applied like HTML element attribute (`<input [ngClass]>`)
4. Structural directives:
	1. Interact with current view container and change the structure of the DOM/HTML code
	2. Examples: `*ngIf` (attaches or detaches an element), `*ngFor`
		1. `<div *ngIf="...">`

### Attribute Directives ###
1. New Project
	1. `ng new directives --directory 02-directives --prefix dir`
2. directives.component.html
	
		<h1>Attribute Directives</h1>
		<h2>ngClass / ngStyle</h2>
		<div [ngClass] = "{border: false, background: true}"></div>
		<!-- div [class.border] = "true"></div> -->

3. directives.component.css

		.border {
			border: 3px solid blue;
		}

		.background {
			background-color: green;
		}

		div {
			width: 100px;
			height: 100px;
		}
	
	1. Since `border: false`, `.border` will not get applied

4. directives.component.html

		<div [ngStyle] = "{'background-color': 'red'}"></div>

### READ FIRST: Angular 2 Router Version & Changes ###
1. `RouterModule.forRoot` -> new
2. Don't use `ROUTER_PROVIDERS`
3. Don't use `ROUTER_DIRECTIVES`

### Building a Custom Attribute Directive ###
1. directives.component.html

		<h2>Custom Attribute Directive</h2>

2. `cd 02-directives`
3. `ng g d highlight`
4. Difference between component and directive
	1. Component is a directive with a view
	2. directive does not have a view
5. Code

		import { Directive } from '@angular/core';

		@Directive({
			selector: '[highlight]'
		})
		export class Highlight {
			constructor() {}
		}

	1. `selector`: similar to css selector which satisfy the given condition
		1. `[highlight]`: condition - all elements which have the attribute `highlight`
		2. `highlight`: condition - all elements which have the tag name `highlight`
		3. `.highlight`: condition - all elements which have the class name `highlight`

6. directives.component.html

		<div highlight>Some Text</div> <!-- no effect -->

7. Add the directive in `declarations[]` in `app.module.ts`
8. highlight.directive.ts

		import { ... ElementRef, Renderer } from '@angular/core';

		...

		private elementRef: ElementRef;
		constructor(elementRef: ElementRef) {
			this.elementRef = elementRef;
		}

		OR

		constructor(private elementRef: ElementRef, private renderer: Renderer) {
			<-- this.elementRef.nativeElement.style.backgroundColor = 'green'; not recommended because angular allows us to write for different environments -->
			this.renderer.setElementStyle(this.elementRef.nativeElement, 'background-color', 'green');
		}

	1. `elementRef` is injected by angular 2
	 

### Element Interaction with HostListener & HostBinding ###
1. highlight.directive.ts
		
		import { ..., HostListener, HostBinding } from '@angular/core';

		@HostListener('mouseenter') mouseover() {
			this.backgroundColor = 'green';
		};

		@HostBinding('style.backgroundColor') get setColor() {
			return this.backgroundColor;
		};

		@HostListener('mouseleave') mouseover() {
			this.backgroundColor = 'white';
		};

		private backgroundColor = 'white';

		OR

		@HostListener('mouseenter') mouseover() {
			...
			this.renderer.setElementStyle(this.elementRef.nativeElement, 'background-color', 'green');
		}

	1. `@HostListener`: define an event on the element hosting this directive which will trigger a method specified
	2. `@HostBinding`: bind the value of setColor to `style.backgroundColor` attribute
	3. `get`: makes property read only (getter)
	4. `setColor()`: is a property but not a function

### HostListener: Passing Data ###
1. How to pass event object to method handling event

		@HostListener('click', ['$event']) onClick(event) {
			console.log("Event Target" + event.target);
		}
	1. `'click'` - event
	2. `['$event']` - event object passed as argument
	3. `onClick(event)` - method to which passed event is fetched
		1. `event` - name can be anything

### Directive Property Binding ###
1. Configurability of code
	1. Setting green and white from outside
	
			@HostListener('mouseover') mouseover() {
				this.backgroundColor = this.highlightColor;
			}

			@HostListener('mouseleave') mouseleave() {
				this.backgroundColor = this.defaultColor;
			}

			...

			@Input() defaultColor = 'white';
			@Input('highlight') highlightColor = 'green';
			private backgroundColor: string;

			ngOnInit() {
				this.backgroundColor = this.defaultColor;
			}

		1. `@Input('highlight')`: property can be bound from outside
			1. `highlight`: name of property outside
				1. If not renamed then

						<div hightlight [highlightColor] = "'blue'" [defaultColor] = "'red'">Some Text</div>

				2. If name is used
	
						<div [highlight] = "'blue'" [defaultColor] = "'red'">Some Text</div>
					1. Setting directive itself with color (shortcut) - key feature

### *ngIf ###
1. Structural directive:
	1. html

			<hr>
			<h1>Structural Directives</h1>
			<h2>*ngIf</h2>
			<div *ngIf = "switch">Conditional Text</div>
			<button (click)="onSwitch()">Switch</button>
			<br/><br/>

	2. highlight.directive.ts

			export class DirectivesAppComponent {
				private switch = true;
				onSwitch() {
					this.switch = !this.switch;
				}
			}
			

### *ngFor ###
1. html

		<hr>
		<h2>*ngFor</h2>
		<ul>
			<li *ngFor = "let item of items; let i = index">{{item}}, (index = {{i}})</li>
		</ul>

	1. `item`: local variable
	2. `items`: property defined in typescript file
	3. `index`: keyword that gives index of the current iteration

2. typescript

		private items = [1, 2, 3, 4, 5];

### ngSwitch ###
1. html

		<hr>
		<h2>ngSwitch</h2>
		<div [ngSwitch] = "value">
			<p *ngSwitchCase = "10">10</p>
			<p *ngSwitchCase = "100">100</p>
			<p *ngSwitchDefault>Default</p>
		</div>
		<br/>

2. typescript

		private value = 100;

### Angular 2's De-Sugaring Mechanism ###
1. For *ngIf, *ngFor, angular makes it less beautiful
	1. *ngIf is similar to [ngIf] (angular transforms 1 to 2)

			<template [ngIf] = "switch">
				<div>

				</div>
			</template>

	2. ngSwitch

			<p [ngSwitch] = "value">
				<template [ngSwitchCase] = "10">10</template>
				<template [ngSwitchCase] = "100">100</template>
				<template ngSwitchDefault>Default</template>
			</p>

		1. Takes one value and destroys other templates

### Building a Custom Structural Directive ###
1. `cd 02-directives`
2. `ng g d unless`
3. unless.directive.ts

		import { Directive, TemplateRef, ViewContainerRef, Input } from '@angular/core';

		@Directive({
			selector: '[unless]'
		})
		export class UnlessDirective {

			@Input() set unless(condition: boolean) {
				if (!condition) {
					this.vcRef.createEmbeddedView(this.templateRef);
				} else {
					this.vcRef.clear();
				}
			} 

			constructor(private templateRef: TemplateRef<any>, private vcRef: ViewContainerRef) {}

		}

	1. * is not part of selector
	2. We need reference to template and container of the template (To know where to position the template)
	3. `TemplateRef`: reference to the template where the directive sits
	4. `ViewContainerRef`: reference to the view container holding our template
	5. `this.vcRef`: reference to view container
	6. `createEmbeddedView`: replaces content of view container which is template (template reference is passed) with view that is embedded in the template
	7. `clear()`: clears the view container

4. html

		<h2>UnlessDirective</h2>
		<div *unless = "switch">Conditional Text</div>

### Using NgModules ###
1. Add directives to app.module.ts

## Course Project - Directives ##
### Course Project: Ingredients List with *ngFor ###
1. recipe-list.component.ts
	1. Remove `recipe`
	2. Add recipes

			recipes: Recipes[] = [
				new Recipe('Schnitzel', 'Very tasty', 'https://s-media-cache-ak0.pinimg.com/originals/a2/cf/d1/a2cfd1150d65401fd34b3fac322e73ac.jpg', []),
				new Recipe('Summer Salad', 'Okayish', 'http://images.media-allrecipes.com/images/59094.jpg', [])
			];

2. Ingredient class
	1. `cd shared`
	2. `ng g cl ingredient`

			export class Ingredient {
				constructor(public name: string, public amount: number) {}
			}

3. Recipe.ts

		import { Ingredient } from "../shared";

		constructor(..., public ingredients: Ingredient[]) {}

4. recipe-list.component.html

		<rb-recipe-item *ngFor = "let recipe of recipes" ...></rb-recipe-item>

	1. `recipe`: local variable which can be passed as input

5. shopping-list.component.html

		<a ... *ngFor = "let item of items"></a>

6. shopping-list.component.ts

		items: Ingredient[] = [];

### Course Project: Custom Dropdown Directive ###
1. `cd app`
2. `ng g d dropdown`
3. dropdown.directive.ts
	1. Remove constructor
	2. code

			import { ..., HostBinding, HostListener } ...

			selector: '[rbDropdown]'
			...
	
			@HostBinding('class.open') get opened() {
				return this.isOpen;
			}

			@HostListener('click') open() {
				this.isOpen = true;
			}

			@HostListener('mouseleave') close() {
				this.isOpen = false;
			}

			private isOpen = false;

		1. `class.open`: bootstrap css class

3. header.component.html

		<li class ... rbDropdown>
			...

## Debugging an Angular 2 Application ##
### Introduction ###
1. Tools for finding errors to fix them

### Chrome Debugger & Sourcemaps ###
1. New project `debugging`
	1. Array:

			testData: string[] = [];

			ngOnInit() {
				for (let i = 0; i < 5; i++) {
					this.testData.push('New Item: ' + i);
				}
			}

	2. html

			<ul>
				<li *ngFor = "let item of testData">{{item}}</li>
			</ul>

2. To debug
	1. To add breakpoints
		1. Open Developer Tools
		2. Sources
		3. app > app.component.js (not my code)
		4. Orange folder > app.component.ts
		5. Click on the left side bar to place a break point
			1. Go through the code using tools on the right side panel
			2. Also shows intermediate values

### If you don't find the TypeScript Sourcemaps ###
1. If using latest CLI
2. webpack:// > Users/... > src > app > ...

### Augury ###
1. To see connections between component
	1. [https://augury.angular.io](https://augury.angular.io)
2. Open Developer tools
	1. Augury
		1. Component Tree
	2. Click on component
		1. Properties
		2. Directives
		3. Change Detection
		4. State
			1. We can change values
		5. Children
	3. Injector Graph
		1. Connections

## Services & Dependency Injection ##
### What are Services? ###
1. Example: Renderer
2. Solves DRY problem
3. if component1, component2, component3 have doSomething() method
	1. Solution: Outsource doSomething() to service
		1. Inject the service into component
4. Common service tasks
	1. Provide, store and interact with Data (database say)
		1. local data store
	2. Provide communication channel for components/ classes
		1. emit and listen to events
	3. Business logic access from various places in application

### Example: Logging Service ###
1. `ng new services`
2. `ng g c service`
2. `ng g s log`
3. log.service.ts
	1. Remove `@Injectable`

			export class LogService {
				writeToLog(logMessage: string) {
					console.log(logMessage);
				}
			}

4. `cd app/service` 
5. `ng g c cmp-a --flat -it -is`
6. `ng g c cmp-b --flat -it -is`
7. cmp-a.component.ts

		<div>
			<input type="text" #input>
			<button (click) = "onLog(input.value)">Log</button>
			<button (click) = "onStore()">Store</button>
			<button (click) = "onSend()">Send</button>
		</div>
		<hr>
		<div>
			<button (click) = "onGet()">Refresh Storage</button>
			<h3>Storage</h3>
			<ul>
				<li></li>
			</ul>
			<h3>Received Value</h3>
			<p>{{value}}</p>
		</div>

		...

		value = '';

	1. `#input`: element reference
		1. `value`: a property of the element

### What is Dependency Injection? ###
1. Instances provided to developer by angular 2
2. Service / Any Class needed by Components, Directives, Any Class
	1. `constructor(argument: Service) {}`
	2. Plan that must be given to angular 2 on how to instantiate the service
		1. `provide: [Service]` - 
			1. in each component (for different instances)
			2. provide in parent component which is shared by children
		2. `bootstrap(AppComponent, [Service])`: highest level
		

### Example: Injecting the Logging Service ###
1. cmp-a.component.ts

		import { LogService } from './log.service';

		...
		providers: [LogService]
		...

		constructor (private logService: LogService) {}

		onLog(value: string) {
			this.logService.writeToLog(value);
		}

2. cmp-b.component.ts
	1. html

			<div>
				<input type="text">
				<button (click) = "onLog()">Log</button>
				<button (click) = "onStore()">Store</button>
				<button (click) = "onSend()">Send</button>
			</div>
			<hr>
			<div>
				<button (click) = "onGet()">Refresh Storage</button>
				<h3>Storage</h3>
				<ul>
					<li></li>
				</ul>
				<h3>Received Value</h3>
				<p>{{value}}</p>
			</div>

			...

			prividers: [LogService]
			
			...

			value = '';

			constructor(private logService: LogService) {
			}

			onLog(value: string) {
				this.logService.writeToLog(value);
			}

	1. Constructor tells angular 2 to get an instance of type `LogService` and bind it to `logService` property
	2. providers: tells angular 2 which objects that we want to use in the body of the component

3. service.component.ts

		<si-cmp-a></si-cmp-a>
		<si-cmp-b></si-cmp-b>


### Multiple Instances vs One Instance ###
1. `cd services/service`
2. `ng g s data`
3. data.service.ts

		export class DataService {
			private data: string[] = [];

			addData(input: string) {
				this.data.push(input);
			}

			getData() {
				return this.data;
			}
		}

4. cmp-a.component.ts

		providers: [..., DataService]
		...
		<button ... "onStore(input.value)">Store</button>
		...
		<ul>
			<li *ngFor = "let item of items">{{item}}</li>
		</ul>
		...
		items: string[] = [];
		constructor(..., private dataService: DataService) {}
		...
		onStore(value: string) {
			this.dataService.addData(value);
		}

		onGet() {
			this.items = this.dataService.getData().slice(0);
		}

5. cmp-b.component.ts
	1. Repeat the above

6. service.component.ts
		
		import { DataService } from './data.service';

		providers: [DataService]
		

### Services & AppModules ###
1. Bootstrap method changed
	1. To add service, don't add to bootstrap but add it to `app.module` providers array.
		1. One instance will be made available to all components, directives ...

### Injecting Services into Services ###
1. To inject log service in Data Service
2. data.service.ts

		import { LogService } from './log.service';

		@Injectable()
		export class DataService {

			constructor(private logService: LogService) {}
			...
			addData(...) {
				...
				this.logService.writeToLog('Saved item: ' + input);
			}	

		}

	1. We can inject anything to a class using metadata
	2. `@Injectable()`: only if the service receives another service
3. app.module.ts
	1. Remove providers from other components

			providers: [LogService]

### Using Services for Cross-Component Interaction ###
1. data.service.ts

		import {..., EventEmitter} from '@angular/core';

		pushedData: new EventEmitter();

		...

		pushData(value: string) {
			this.pushedData.emit(value);
		}

2. com-a.component.ts

		<button ... onSend(input.value)>Send</button>
		...
		onSend(value: string) {
			this.dataService.pushData(value);
		}

3. cmp-b.component.ts
	1. Remove `<button (click) = onSend()>Send</button>`
	2. OnInit

			ngOnInit() {
				this.dataService.pushedData.subscribe(
					data => this.value = data;
				);
			}

## Course Project - Services & Dependency Injection ##
### Course Project: Creation of Recipe Service ###
1. `cd app/recipes`
2. `ng g s recipe`
3. recipe.service.ts

		export class RecipeService {
			private recipe: Recipe[] = [
				// copy from other ts file
			];

			constructor() {}

			getRecipes() {
				return this.recipes;
			}
		}

4. recipe-list.component.ts

		recipes: Recipe[] = [];

		constructor(private recipeService: RecipeService) {}

		ngOnInit() {
			this.recipe = this.recipeService.getRecipes();
		}

5. recipe-book.component.ts

		import from { RecipeService } from 'recipes/recipe.service';

		prividers: [RecipeService]

### Course Project: Creation of the Shopping List Service ###
1. `cd shopping-list`
2. `ng g s shopping-list`
3. shopping-list.service.ts

		export class ShoppingListService {
			private items: Ingredient[] = [];

			constructor() {}

			getItems() {
				return this.items;
			}

			addItems(items: Ingredient[]) {
				Array.prototype.push.apply(this.items, items);
			}
		}

	1. `apply`: apply on each item
	2. `Array.prototype`:
		1. Property
		2. Represents prototype of an array constructor
		3. Used to add new properties and methods to all Array() object
			1. Example:

					// If JavaScript doesn't provide a first() method natively,
					// add a new method returning the first element of an array.

					if (!Array.prototype.first) {
						Array.prototype.first = function() {
							return this[0];
						}
					}
		4. All Array instances inherit from `Array.prototype`
		5. We can use it to make changes to all Array instances by changing the constructor's prototype object.
		6. Mutator methods:
			1. `Array.prototype.push()`: adds one or more elements to end of an array and returns new length.
		7. Example:

				Array.prototype.myUcase = function() {
					for (i = 0; i < this.length; i++) {
						this[i] = this[i].toUpperCase();
					}
				}

				var fruits = ["Banana", "Orange", "Apple", "Mango"];
				fruits.myUcase();

		8. `Array.prototype` represents `Array()` object itself
		9. `Array.prototype.push(obj, items)`: Usually used if obj is not an instance of Array() object but is Array like object which has `length` property
4. shopping-list.component.ts

		items: Ingredient[] = [];

		constructor(private sls: ShoppingListService) {}

		ngOnInit() {
			this.items = this.sls.getItems();
		}

5. main.ts

		import { ShoppingListService } from './app/shopping-list';

		bootstrap(..., [ShoppingListService]);

6. If required add to app.module.ts

### Course Project: Cross-Service Communication ###
1. recipe.service.ts

		new Recipe(... [
			new Ingredient['French Fries', 2],
			new Ingredient['Beaf Meat', 1]
		]),
		...


### Course Project: Cleanup ###

## Routing ##
### Introduction to Angular 2 Router ###
### Setting up Routes ###
### Loading Components ###
### Navigation with Links ###
### Understanding Navigation Paths ###
### Imperative Routing (Triggered in Code) ###
### Route Parameters ###
### Extracting Route Parameters ###
### Query Parameters ###
### Query Params Changes in Latest Router Version ###
### Extracting Query Params ###
### Query Parameters and the routerLink Directive ###
### Passing Fragments and Preserving Query Params/ Fragments ###
### Extracting Fragments in Code ###
### Child Routes ###
### Redirecting Request ###
### Styling Active Route Links ###
### Using Guards with AppModules ###
### Guards: CanActivate ###
### Guards: CanDeactivate ###
### Location Strategies ###

## Course Project - Routing ##
### Introduction ###
### Setting up the Main Routes ###
### Adding Links to Navigate ###
### Using Child Routes in the Recipe Section ###
### Navigating between Child Routes ###
### Extracting Recipe Data from Route Params ###
### Styling the Active Recipe ###
### Wiring "Edit" and "Delete" up ###
### Finishing Touches and some Cleanup ###

## Forms ##
### Introuction to Forms in Angular 2 ###
### Template-Driven Approach Basics ###
### Add FormsModule to your AppModule ###
### Registering Controls (Template-Driven) ###
### Submitting a Form and Using the Output (Template-Driven) ###
### Form Properties ###
### Input Validation (Template-Driven) ###
### Form State & CSS Classes (Template-Driven) ###
### Default Values with ngModel (Template-Driven) ###
### Two-Way Binding with ngModel (Template-Driven) ###
### Form Groups (Template-Driven) ###
### Radio Button Controls (Template-Driven) ###
### Using the Form State/ Providing a better UX (Template-Driven) ###
### The Data-Driven (Reactive) Approach (Intro) ###
### Cration of Form (Data-Driven) ###
### Important Changes with AppModules ###
### Synchronizing HTML and the Angular2 Form (Data-Driven) ###
### Submitting a Form and Using the Output (Data-Driven) ###
### Intput Validation (Data-Driven) ###
### Built-in Validators ###
### Working with the State of the Form ###
### Form Groups (Data-Driven) ###
### Radio Buttons (Data-Driven) ###
### Form Arrays/ Arrays of Control (Data-Driven) ###
### Creation of a form with the FormBuilder (Data-Driven) ###
### Custom Asynchronous Validators (Data-Driven) ###
### Listening to Status & Value Changes ###
### Resetting Forms ###

## Course Project - Forms ##
### READ FIRST: Angular 2 Forms Usage ###
### Shopping List Form HTML Setup (Template-Driven) ###
### Adding & Editing Mode ###
### Submitting the Shopping List Form ###
### Selecting Items & Property Binding ###
### Displaying Data with ngModel ###
### Editing Items ###
### Deleting Items & Clearing the Form ###
### Editing & Adding Recipes (Intro) ###
### Recipe Form - Preparation - Fetching the Active Recipe ###
### Creation of the Recipe Form with the Data-Driven Approach ###
### Synchronizing the HTML Code with the Form ###
### Submitting the Form and Editing Recipes ###
### Managing Recipe Ingredients ###

## Pipes ##
### What are Pipes? ###
### Using Pipes ###
### Parameterizing Pipes ###
### Pipe Documentation ###
### Chaining Pipes ###
### Custom Pipes ###
### Important Adjustments: Just use "args" ###
### Example: Creation of Filter Pipe ###
### Using NgModules ###
### "Pure" Pipe Limitations ###
### "Impure" Pipes ###
### The Async Pipe ###

## Http ##
### Required Adjustments in this Module ###
### Http & Observables ###
### Demo Data Source: Firebase Setup ###
### Sending a GET Request ###
### Using MgModules ###
### The Power of Observables Operators - Map (ping Data) ###
### Sending a POST Request ###
### Retieving and Transforming Data with Observables ###
### Using the Async Pipe ###
### Error Handling with Observables ###
### Wrap Up ###

## Course Project - Http ##
### Http Intro & Setup ###
### Storing Recipes on the Server (POST) ###
### Getting and Changing Recipes (GET and PUT) ###
### Finishing Touches & Bugfixes ###

## Changes since the Recording of this Course ##
### Differences between Course Videos and Angular 2 Release Version/ updated CLI ###
### Updating the SystemJS CLI (beta.10) ###
### NgModule Overview ###

## Authentication & Route Protection ##
### Required Adjustments in this Module ###
### Introduction ###
### Project Setup ###
### Setting up Routes ###
### Backen (Firebase) Setup ###
### User Signup ###
### User Signin & Managing the User State ###
### User Logout ###
### Protecting a Route from Unauthorized Access ###
### Finishing Touches ###
### How it looks using Angular 2.0 Final ###
### Enhancing the App with Observables Magic! ###

## Optimizing an Angular 2 Application (for bigger Projects) ##
### Introduction ###
### Using Feature Modules ###
### Creation of a Feature Module ###
### Creation of a Feature Module for Child Routes ###
### Lazy Loading of Routes ###
### Implementing Lazy Loading ###
### Using Lazy Loading to Load the ShoppingListModule ###
### Using Shared Modules ###
### Using a Core Module ###
### Understanding Module Ecapsulation ###
### When to use which Module ###
### Diving Deeper into Modules ###
### Adding Ahead-of-time Compilation to your Workflow ###
### Source Code ###

## Angular 2 Animations ##
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

## Deploying an Angular 2 Application ##
### VIEW FIRST: About this Section ###
### About the New Project Structure (same Video as in Custom Project Module) ###
### Intro & What to Deploy ###
### Setting up an App for Deployment ###
### Deploying to Github Pages with the Angular 2 CLI ###
### Deploying to Github Pages Manually ###
### Deploying to AWS S3 ###
### Deployment - Cheat Sheet ###

## Angular 2 CLI ##
### Intro ###
### Installation ###
### New Project: ng new and ng init ###
### Building your Project: ng build & ng server ###
### Understanding the Project Structure ###
### Linting your Code: ng lint ###
### Unit Tests: ng test ###
### Managing Project Content: ng generate & ng destroy ###
### Putting it into Production: ng build -prd and ng github-pages:deploy ###
### Using Third-Party packages with the CLI ###
### Learning More: ng --help and Wrap Up ###

## Custom Project & Workflow Setup ##
### Introduction ###
### Creation of the Project ###
### Setting up the Angular 2 App ###
### Adding Development Dependencies and Types ###
### Setting up TypeScript Compilation (tsconfig) and the Basic Webpack Config ###
### Creation of a Development Workflow & Script ###
### Adding Routing ###
### Enabling Lazy Loading ###
### Adding Ahead-of-Time Compilation ###
### Setting up a Webpack Production Configuration ###
### Final Touches & Finishing the Production Workflow ###
### AoT Bugfixing ###

## A Basic Introduction to Unit Testing in Angular 2 Apps ##
### About this Section ###
### Introduction ###
### Why Unit Tests? ###
### Analyzing the Testing Setup (as built by the CLI) ###
### Running Tests (with the CLI) ###
### Adding a Component and some fitting Tests ###
### Testing Dependencies: Components and Services ###
### Simulating Async Tasks ###
### Using "fakeAsync" and "tick" ###
### Isolated vs Non-Isolated Tests ###
### Further Resources & Where to Go Next ###

## Course Roundup ##
### Course Roundup ###

## Bonus: TypeScript Introduction (for Angular 2 Usage) ##
### Introduction ###
### Using Types ###
### Classes ###
### Interfaces ###
### Generics ###
### Wrap up & Modules ###
### Deep Dive into TypeScript ###
 