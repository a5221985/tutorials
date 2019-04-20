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