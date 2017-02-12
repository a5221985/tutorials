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