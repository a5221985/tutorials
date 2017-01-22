# TypeScript #
## Why learn typescript? ##
1. It is similar to JS
2. Well supported [www.typescript.org]() - open source library by Microsoft
3. Can integrate typescript into JavaScript project
4. Used in WinJS and ANgularJS
	1. WinJS - for windows phone, windows 10 apps
		1. Written in TypeScript
	2. AngularJS2
5. Purpose
	1. Prevent bugs
		1. lock variables to specific types (type checking)
	2. Has powerful features (classes, modules)
	3. It can be integrated with Grunt and Gulp
		1. Task runners
		2. Grunt:
			1. Manage flow of projects
			2. Automatically compile typescript to JS
		3. Gulp
			1. Automatically compile typescript to JS
6. For large projects (10000 lines or more)
7. Long term maintenance is possible (type checking exists and powerful features)

## Course Breakdown ##
1. Installing and basic compiling
2. Basic TypeScript beginer features
	1. Types and interfaces
	2. Classes and inheritance
	3. Modules (for sharing code between ts files)
3. Questions? Comments?
	1. Open a discussion on course page
		1. TypeScript sometimes behave differently on different platforms
	2. Send a message
	3. Help others
4. Prerquisites
	1. PC or Mac is recommended
	2. Chrome, NodeJS

## Installing Typescript ##
1. Compiling?
	1. TS -> JS
2. Open terminal
3. Install node
4. Install typescript
	1. `npm install -g typescript` **(M)**
	2. `tsc` **(M)**

## Compiling First Typescript App ##
1. New directory `helloWrold`
2. New File in folder `helloWorld.ts`
	1. Any Javascript is typescript
3. Open the file
	
		console.log("Hello world!");

4. Compile
	1. `tsc helloWorld.ts` (generates `helloWorld.js`)
5. Bit of typescript

		function hello(string : String) {
			console.log("Hello " + string);
		}

		hello("Jon");

6. Run
	1. `node helloWorld.js`
7. Compile
	1. `tsc helloWorld.ts`
8. Run
	1. `node helloWorld.js`
9. If we pass number, we get a message when we compile

## Understanding Typescript ##
1. `: String` - typescript annotation
2. Error:
	1. Filename, line number
	2. Troubleshoot:
		1. Look at quotes
3. Compilation errors help us pin point bugs quickly

## The type system ##
1. Javascript + Types = TypeScript
2. [Typescript handbook](www.typescriptlang.org/Handbook#basic-types)
	1. Default types in typescript
3. New directory
4. New document `types.ts`
5. Open the document

		var n : Number = 1;
6. Compile
	1. `tsc types.ts`
7. Give new value

		n = "Robb"; // Compiler warning but still generates js file
8. Any type

		var n : any = 1; // **(M)**

## Basic Types ##
1. Types:
	1. Boolean:
		
			var isWinter : boolean = false;
			isWinter = 123; // Compiler warning
	2. Number:
	
			var count : Number = 5;
	
	3. String:

			var name : String = "Bran"; // Capital or lowercase

	4. Array:

			var names : string[] = ["Jon", "Rickon", "Arya"]; // **(M)**
			var names : any[] =  ["Jon", "Rickon", "Arya", 5];

	5. Enum:

			enum Starks {Jon, Bran, Eddard, Catlyn}; // enum <Name> {<value1>, <value2>, ...};
			var cat : Starks = Starks.Catlyn; // var <name> : <Enum-Type> = <Enum-Type>.<valuei>;

	6. Void:
		
			function printName() : void {
				console.log("Hello");
			} 

			function getName() : string {
				return "name";
			}

## Interfaces ##
1. Open `types.ts`

		function printName(stark) {
			console.log(stark.name);
		}

		printName({name: "Eddard"});
		printName({label: "Joe"});	//Error when we run not when we compile

2. How to avoid it?
	1. Defining interface

			interface Stark {
				name: string;
				age: number;
			}

			function printName(stark: Stark) {
				console.log(stark.name);
			}

			printName({name: "Eddard"});
			printName({label:"Joe"}); // Compile time error

	2. Optional parameters

			interface Stark {
				name: string;
				age?: number;
			}

## Classes ##
1. Used for new objects
2. `types.ts`

		class Stark {
			name: string;
		}

		var ned = new Stark();

3. `tsc types.ts`
4. Open `types.js`

		var Stark = (function() {
			function Stark() {
			}
			return Stark;
		})();
		var ned = new Stark();

5. More code

		class Stark {
			name: string;
			saying: string;
		}

		ned.saying = "Winter is coming";

6. Constructor:

		class Stark {
			name: string = "Brendon";
			static castle: string = "Winterfell";

			constructor() {
				this.saying = "Winterfell!";
			}
			
			hello(person : string) {
				console.log("Hello, " + person);
			}
		}

		console.log(Stark.castle);
		ned.hello("Robert");

## Inheritance ##
1. `types.ts`

		class Person {
			name: string;
			constructor(name: string) {
				this.name = name;
			}
			dance() {
				console.log(this.name + " is dancing say!");
			}
		}

		var bran = new Person("Bran");
		bran.dance();

		class AwesomePerson extends Person {
			dance() {
				console.log("SO AWESOME!");
				super.dance();
			}
		}

		var robb = new AwesomePerson("Robb");
		robb.dance();

## Modules ##
1. To share code between files
2. `timesTwo.ts`

		function timesTwo(n : number) {
			n * 2;
		}

3. `util.ts`

		console.log(timesTwo(9));

4. `tsc util.ts` - error
5. Make `timesTwo.ts` as a module

		module Utility {
			export class useful {
				timesTwo(n : number) {
					return n * 2;
				}
			}
		}

		module <Name> {
			export class <Class-name> {
				...
			}
		}	// **(M)**

6. Add reference

		/// <reference path="timesTwo.ts" />
		var use = new Utility.useful();
		console.log(use.timesTwo());

7. Combine files

		tsc util.ts timesTwo.ts --out util.js

8. Run

		node util.js

## Automatically Compile using Grunt ##
1. Gruntfile
2. Plugins
	1. gruntjs.com/plugins
	2. Search for typescript
		1. Select `ts` plugin
3. Look at stars and Issues to select plugin in Github
4. Open new folder
5. Open terminal
6. `npm init`
	1. Select defaults
7. Install npm modules
	1. `npm install typescript --save` (saves it in package.json)
	2. `npm install grunt --save`
	3. `npm install grunt-cli --save`
	4. `npm install grunt-ts --save`
8. `gruntfile.js` **(M)**

		module.exports = function(grunt) {
			grunt.loadNpmTasks('grunt-ts');

			grunt.initConfig({
				ts: {
					main: {
						src: ['typescript/main.ts'],
						dest: 'javascript/'
					}
				}
			});

			grunt.registerTask('default', ['ts']);
		}

9. New folder `typescript`
10. New file in `typescript`
	1. `main.ts`

			console.log("Hello world");

11. New ts file `helper.ts`

		module Helper {
			export class Language {
				static Greeting: string = "Bonjour";
			}
		}

12. `main.ts`

		/// <reference path="helper.ts" />
		console.log(Helper.Language.Greeting + " world");

13. Replace `main.ts` to `*.ts`
14. Combinging files
	1. Remove `dest` and add `out` in `gruntfile.js`

			out: 'javascript/main.js';

15. `node javascript/main.js`

### Resources ###
1. TypeScript handbook
2. TypeScript Github page [https://github.com/Microsoft/TypeScript](https://github.com/Microsoft/TypeScript)
3. Use TypeScript 
		