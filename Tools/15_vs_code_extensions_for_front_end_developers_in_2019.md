# 15 VS Code Extensions for Front-End Developers in 2019 #
1. Liver Server:
	1. Little dev server
		1. HTML websites - run from vs code
		2. Live reload (on save)
	2. `dist`
		1. index.html

				<body>
					<h1>Sample App</h1>
				</body>

			1. Right click and open with live server (opens in a browser)
2. Live SASS Compiler
	1. Settings: SASS
		1. Live SASS Compiler
			
				"liveSassCompile.settings.formats": {
					"format": "compressed"
					"extensionName": ".min.css",
					"savePath": "/dist/css"
				}
				"liveSassCompile.settings.generateMap": false,
				...
	
		2. main.scss

				$color: red;
		
				body {
					background: $color;
				}

			1. Watch sass
				1. Button
				2. `main.min.css` can be used directly
	2. Right click and say stop live server
3. HTML CSS Support
	1. If we add a class, the new class gets popped up in html
	2. settings.json

			"css.remoteStyleSheets": [
				"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
			]

		1. bootstrap classes get popped up in html
4. Auto Renaming Tag
	1. Beginning tag changes ending tag
5. Prettier - Code formatter
	1. settings > format on save
		1. check
		2. Rules
			1. single quotes
				1. JSX
				2. ...
			2. Semi colons
			3. Tab width
			4. Trailing commas
	2. `js/main.js`

			const name = 'Brad';

			function name() {
				console.log(test);
			}

6. JavaScript (ES6) code snippets
	1. destructuring
	2. console logging

			clg + enter

7. Turbo Console log
	1. Fast console logging - debugging
		1. select variable and cntrl + alt + L
		2. settings
			1. "OUTPUT"
		3. option + shift + c (comment all logs) u (un-comment all)
8. Indent Rainbow
	1. Indents more readable (shade or color)
9. Bracket Pair Colorizer:
	1. different block braces can have different colors
10. Code Spell Checker
	1. Word mis-spelled is highlighted
11. REST Client
	1. Works like PostMan
		1. `requests/api.http`

				GET https://jsonplaceholder.typicode.com/posts

				###
				
				POST https://jsonplaceholder.typicode.com/posts
				Content-Type: application/json

				{
					"title": "My Post",
					"body": "This is my post"
				}

			1. Click `Send Request`
12. GitLens - Git supercharged
	1. Lens into repository
		1. shows branches, contributors, ..., prints in code (who updated what and when)
	2. Example:
		1. `git init`
		2. `git add . && git commit -m 'Initial commit'`
		3. Point on a line (tells who did the change)
		4. Shows what has not been comitted
		5. Hit check
13. Auto-Open Markdown Preview
	1. README.md
		1. Immediate preview
14. ES7 React/Redux/GraphQL/React-Native snippets
	1. Generate components
	2. Generate arrow functions
	3. Generate regular functions
	4. Exports, imports
15. Vetur - Vue JS
	1. Snippets
	2. Linting
	3. Emmet
	4. Syntax highlighting
16. Aungular v7 Snippets