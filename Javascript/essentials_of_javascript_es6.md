# Essentials in JavaScript ES6 - A Fun and Clear Introduction #
## Set Up Project and Webpack 4 ##

		mkdir es6
		cd es6
		npm init -y (skips interaction)
		npm i webpack@4.12.0 webpack-cli@3.0.3 --save-dev
		code . (visual studio code)
		mkdir src
			index.js

					console.log('hello webpack');

		package.json
			1. Remove "test"
			
					"start": "webpack --mode development",
					"build": "webpack --mode production"

		npm run start

			dist/
				main.js
					starter js code
					actual js code

		npm run build

			dist/
				main.js (optimized and minified for production)

## Configure Webpack and Development Server ##
1. webpack.config.js
	1. settings of how webpack will behave

			module.exports = {
				entry: 'app',
				output: {
					path: 'build',
					filename: 'bundle.js'
				}
			};

	2. npm run start (error and needs absolute path)


			const path = require('path');
			
			module.exports = {
				entry: path.resolve(__dirname, 'app'),
				output: {
					path: path.resolve(__dirname, 'build'),
					filename: 'bundle.js'
				}
			}

		1. outputs to build directory
	3. Webpack dev server module
	
			npm i webpack-dev-server@3.1.4 --save-dev

			...
				"start": "webpack-dev-server --mode development"

	4. index.html
	
			<!DOCTYPE html>
			<html>
				<body>
					<script src="bundle.js"></script>
				</body>
			</html>		

	5. webpack.config.js

			output: {
				...
			},
			devServer: {
				port: 3000,
				contentBase: path.resolve(__dirname, 'build') // directory to server content from
			}

	6. npm run start
		1. http://localhost:3000
	7. Add more statements in index.js
		1. App is reloaded automatically

## Set Up Babel with Webpack ##
1. Babel transpiles ES6 to ES5
2. Dependencies:
	
		npm i babel-core@6.26.3 babel-loader@7.1.4 babel-preset-env@1.7.0 --save-dev

	1. babel-core: transpiler
	2. babel-loader: used to load js files as their own components and models
	3. babel-preset-env: Adds to core by adding additional browser support
3. webpack.config.js

		...
		module: {
			rules: [
				{
					test: /\.js$/,
					exclude: /node_modules/,
					use: ['babel-loader']
				}
			]
		}

	1. .babelrc

			{
				"presets": ["env"]
			}

		1. npm run start
