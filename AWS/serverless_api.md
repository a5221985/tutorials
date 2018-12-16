# Serverless Lambda Functions #
## AWS Lambda Functions ##
1. Netlify Functions (Powered by AWS Lambda)
2. Serverless:
	1. We don't manage server
	2. We can run server side tasks
		1. Much more manageable
3. Building, testing and deploying Lambda functions
	1. More security with token and secret
4. Code:
	1. `npm init -y`
	2. `npm i netlify-lambda`
	3. Script

			"scripts": {
				"lambda-serve": "netlify-lambda server functions",
				"lambda-build": "netlify-lambda build functions"
			}

	4. functions
		1. getusers.js

				exports.handler = function (event, context, callback) {
					callback(null, {
						statusCode: 200,
						body: 'Hello World'
					});
				}

	5. netlify.toml

			[build]
				functions = "lambda"

5. `npm run lambda-serve`
	1. lambda folder is created
		1. minified
6. Open PostMan

		http://localhost:9000/getusers

7. POST

		POST: http://localhost:9000/getusers

		header: Content-Type: application/json
		body:

			{
				"name": "Brad"
			}

	1. function

			...
			const { name } = JSON.parse(event.body);

			callback(...
				...
				body: 'Hello ' + name
			});
			...