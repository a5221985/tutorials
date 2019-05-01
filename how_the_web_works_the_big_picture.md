# How the Web Works - The Big Picture #
1. User -> Browser -> Website
	1. Website: Stored on the server
		1. Code is stored
		2. Generated dynamically on the server
		3. Returned back to browser
	2. How does the server know that it is addressed?
		1. Official address of each server is IP address
			1. Domain: Browser contacts DNS (Domain Name System server)
				1. Huge dictionary - translates domain to IP
					1. IP address is given to browser
					2. Browser makes the actual request to server
	3. Request: Browser makes request for this page
		1. Package of data
			1. Types of request (GET, POST, PUT, DELETE, ...)
			2. Data
			3. Meta-data: Headers
				1. content-type
				2. ...
	4. Response:
		1. HTML code that needs to be rendered
			1. What we see in browser is a combination of HTML, CSS and JS
		2. HTML: HyperText Markup Language - browser might generate this dynamically (based on context)
			1. Defines structure of the web page
				1. Header
				2. Paragraph
				3. Input
				4. Button
		3. CSS: Cascading Style Sheets - make it look good
		4. JS: Logic and dynamic things - after page has loaded
			1. drop down
			2. sliding in
			3. overlay
			4. ...
	5. HTTP: Hipertext transfer protocol (s - secure)
		1. s - encrypted end to end
		2. Standard how request and responses should look like
	6. Server side: Node.js, Php, Python
		1. Frameworks - makes writing code easier (boilerplate is taken care of and we can write only business logic)
			1. Express.js
			2. Laravel
			3. Django
	7. Client side: Frameworks - packages of utility functions - nicer user experience (don't have to fetch new pages always), we can make changes when user is on the page (how the change happens is taken care by framework, we just need to specify when the change should happen and heavy lifting is done by the framework)
		1. Angular
		2. React
		3. Vue
	8. Mobile app:
		1. Content stored in the internet
			1. only data is exchanged
			2. Source code knows how to parse that data
		2. Advanced tech
			1. Real-time communication
				1. Server pushes notifications to client (using web-sockets)