# Node.js With Passport Authentication | Full Project #
1. Devmountain - Bootcamp
2. Passport: Authentication of all types
	1. Strategies
		1. Local strategy
			1. Dealing with database directly - MongoDB
		2. OAuth
			1. Google
			2. Facebook
			3. Twitter
			4. ...
		3. JWT
			1. For react or view
3. We use EJS to display templates
4. Using Bootstrap
5. [www.mogodb.com](www.mongodb.com)
	1. Register
	2. Login
	3. Cluster - 1 free
		1. Build new cluster
		2. AWS
		3. Region
		4. Free for ever
		5. Cluster name
		6. Create cluster
		7. Security tab
			1. Add new user
				1. username
				2. password
				3. read and write to any database
			2. IP Whitelist
				1. Add own IP address
				2. Or 0.0.0.0
		8. Click connect
			1. Short SRV
6. Open VSCode
	1. `npm init -p`
	2. `npm i express bcryptjs passport passport-local ejs express-ejs-layouts mongoose connect-flash express-session` - local strategy
		1. connect-flash for flash messaging
		2. bcrypt for encryption
	3. `npm i -D nodemon`
		1. dev dependency
	4. Scripts

			"main": "app.js",
			"scripts": {
				"start": "node app.js",
				"dev": 'nodemon app.js"
			}

	5. app.js

			const express = require('express');
			const app = express();

			const PORT = process.env.PORT || 5000;

			app.listen(PORT, console.log(`Server started on port ${PORT}`));