## React JS ##
### Development Environment Setup
1. `npm init`
2. `npm install react react-dom --save`
3. `npm install babel-loader babel-core babel-preset-es2015 babel-preset-react`
	1. Prerequisites: (`npm intall babel webpack webpack-dev-server -g`)
		1. Babel
		2. Webpack
		3. Webpack dev server
4. `touch index.html App.js main.js webpack.config.js`
	1. `App.js`
	2. `main.js`
	3. `webpack.config.js`: compiles javascript
	4. `webpack.config.js`
		
			module.exports = {
				entry: './main.js',
				output: {
					path: './',
					filename: 'index.js'
				},
				devServer: {
					inline: true,
					port: 3333
				},
				module: {
					loaders: {
						test: /\.js$/,
						exclude: /node_modules/,
						loader: 'babel',
						query: {
							presets: ['es2015', 'react']
						}
					}
				}
			}

	5. `index.html`
		
			<!DOCTYPE html>
			<html lang="en">
			<head>
				<meta charset="UTF-8">
				<title>Setup</title>
			</head> 
			<body>
				<div id="app"></div>
				<script src="index.js"></script>
			</body>
			</html>

	6. `App.js`

			import React from 'react';
			class App extends React.Component {
				render() {
					return <div>Hello</div>
				}
			}

			export default App

	7. `main.js`

			import React from 'react';
			import ReactDOM from 'react-dom';
			import App from './App';
			ReactDOM.render(<App/>, document.getElementById('app'))

	8. `package.json`

			{
				"name": "es6-react-setup",
				"version": "1.0.0",
				"description": "",
				"main": "index.js",
				"scripts": {
					"start": "webpack-dev-server"
				},
				"author": "",
				"license": "ISC",
				"dependencies": {
					"react": "^0.14.3",
					"react-dom": "^0.14.3"
				}
			
5. `npm start`
	