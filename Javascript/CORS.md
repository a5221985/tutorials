# CORS #
## Introduction ##
1. Corss-domain requests are limited to techniques like 
	1. [JSON-P](http://en.wikipedia.org/wiki/JSONP) - limited use due to security concerns
	2. Custom Proxy - pain to set up and maintain
2. [Cross Origin Resource Sharing](http://www.w3.org/TR/cors/) - (CORS) is W3C specification.
	1. It allows cross-domain communication from the browser.
	2. It builds on top of `XMLHttpRequest` object
	3. Allows us to work with same idioms as same-domain requests
3. Use case -
	1. A site `alice.com` has some data that site `bob.com` wants to access
	2. It is not allowed traditionally due to browser's [same origin policy](http://en.wikipedia.org/wiki/Same_origin_policy)
	3. `bob.com` can add a few special response headers that allows `alice.com` to access data
		1. This requires coordination between server and client
4. We can see how:
	1. Client can make cross-origin requests
	2. Servers can configure themselves to support CORS

## Making a CORS Request ##
1. We can see how to make cross-domain request in JS

## Creation of the XMLHttpRequest Object ##
1. CORS is supported in:
	1. Chrome 3+
	2. Firefox 3.5+
	3. Opera 12+
	4. Safari 4+
	5. Internet Explorer 8+
2. Chrome, Firefox, Opera and Safari use [XMLHttpRequest2 object](http://www.html5rocks.com/en/tutorials/file/xhr2/)
3. IE uses `XDomainRequest` object which works similar to `XMLHttpRequest` but adds additional [security precautions](http://blogs.msdn.com/b/ieinternals/archive/2010/05/13/xdomainrequest-restrictions-limitations-and-workarounds.aspx)
4. Helper method to sort out browser differences:

		function createCORSRequest(method, url) {
			var xhr = new XMLHttpRequest();
			if ("withCredentials" in xhr) {
				// Check if the XMLHttpRequest object has a "withCredentials" property.
				// "withCredentials" only exists on XMLHttpRequest2 objects.
				xhr.open(method, url, true);
			} else if (typeof XDomainRequest != "undefined") {
				// Otherwise, check if XDomainRequest.
				// XDomainRequest only exists in IE, and is IE's way of making CORS requests.
				xhr = new XDomainRequest();
				xhr.open(method, url);
			} else {
				// Otherwise, CORS is not supported by the browser.
				xhr = null;
			}
			return xhr;
		}

		var xhr = createCORSRequest('GET', url);
		if (!xhr) {
			throw new Error('CORS not supported');
		}

## Event Handlers ##
1. Original `XMLHttpRequest` had only one event handler `onreadystatechange` which handles all responses.
2. `XMLHttpRequest2` introduces new event handlers along with it.
	1. `onloadstart` (No IE support) - When the request starts
	2. `onprogress` - While loading and sending data
	3. `onabort` (No IE support) - When request has been oborted. For instance, by invoking `abort()` method
	4. `onerror` - When request has failed
	5. `onload` - When request has successfully completed
	6. `ontimeout` - When author specified timeout has passed before request could complete
	7. `onloadend` (No IE support) - When request has completed (either in success or failure)
3. We want to handle atleast `onload` and `onerror` events

		xhr.onload = function () {
			var responseText = xhr.responseText;
			console.log(responseText);
			// process the response.
		};

		xhr.onerror = function () {
			console.log('There was an error!');
		};

	1. Browsers usually do not report errors properly.
		1. Firefox reports status of 0 and empty `statusText` for all errors
		2. Error messages printed onto console log are not accessible in JS
		3. `onerror` lets us know an error occurred and that is all

## `withCredentials` ##
1. Standard CORS do not send or set any cookies by default
2. To include cookies as part of request, set `XMLHttpRequest`'s `.withCredentials` property to `true`

		xhr.withCredentials = true;

	1. For above to work, server must enable credentials by setting `Access-Control-Allow-Credentials` response header to `true`.
		1. [Server Section](https://www.html5rocks.com/en/tutorials/cors/#toc-adding-cors-support-to-the-server)
	2. `.withCredentials` property will include any cookies from remote domain in request and it will also set cookies from remote domain
		1. Cookies honor same origin policies so JS cannot access cookies from `document.cookie` or response headers
		2. The cookies can only be controlled by remote domain

## Making the Request ##
1. Call `send()` method

		xhr.send();

2. If server is properly configured to respond to CORS requests, `onload` handler will fire with response just like standard same-domain XHR

## Example ##

		// Helper method to parse the title tag from the response.
		function getTitle(text) {
			return text.match('<title>(.*)?</title>')[1];
		}

		// Make the actual CORS request.
		function makeCorsRequest() {
			// This is a simple server that supports CORS.
			var url = 'http://html5rocks-cors.s3-website-us-east-1.amazonaws.com/index.html';

			var xhr = createCORSRequest('GET', url);
			if (!xhr) {
				alert('CORS not supported');
				return;
			}

			// Response handlers.
			xhr.onload = function () {
				var text = xhr.responseText;
				var title = getTitle(text);
				alert('Response from CORS request to ' + url + ': ' + title);
			};

			xhr.onerror = function () {
				alert('Woops, there was an error making the request.');
			};

			xhr.send();
		}

## Adding CORS Support to the Server ##
1. Browser adds a few additional headers and sometimes makes additional requests during CORS request on behalf of client.
	1. The additions are hidden from client
		1. These can yet be discovered using packet analyzer such as [Wireshark](https://www.wireshark.org/)

	![cors_flow](cors_flow.png)

## Types of CORS Requests ##
1. Cross-origin requests come in two flavors
	1. simple requests
	2. "not-so-simple" requests
2. Simple requests meet the following criteria
	1. HTTP Method matches (case-sensitive) one of:
		1. HEAD
		2. GET
		3. POST
	2. HTTP Headers matches (case-insensitive)
		1. Accept
		2. Accept-Language
		3. Content-Language
		4. Last-Event-ID
		5. Content-Type, but only if value is one of
			1. application/x-www-form-urlencoded
			2. multipart/form-data
			3. text/plain
3. Characteristics:
	1. Simple requests can be made without using CORS
		1. `JSON-P` request can issue cross-domain GET request
		2. HTML can be used to do a form POST
4. Any other type of request is not-so-simple request (that does not meet the criteria)
	1. This requires extra communication between browser and server (preflight request)

## Handling a Simple Request ##
1. Simple JS request:

		var url = 'http://api.alice.com/cors';
		var xhr = createCORSRequest('GET', url);
		xhr.send();

	1. Actual HTTP request:

			GET /cors HTTP/1.1
			Origin: http://api.bob.com
			Host: api.alice.com
			Accept-Language: en-US
			Connection: keep-alive
			User-Agent: Mozilla/5.0...

		1. Valid CORS request always contains `Origin` header
		2. [Origin header](http://tools.ietf.org/html/draft-abarth-origin-09) is added by browser and cannot be controlled by user
			1. Value: Scheme (http), domain (bob.com) and port (included if not default port) from which request originates
			2. Presence of Origin does not mean cross origin request
				1. Firefox does not include Origin header on same-origin requests
				2. Chrome and Safari include Origin header on same-origin requests POST/PUT/DELETE but not GET
					1. Example:

							POST /cors HTTP/1.1
							Origin: http://api.bob.com
							Host: api.bob.com
		
2. Browser's don't expect CORS response headers on same-origin requests
	1. Response to same-origin request is sent to user regardless of whether it has CORS headers or not
		1. But if server code returns error if Origin doesn't match a list of allowed domains, include origin the request comes from
			1. Valid server response:

					Access-Control-Allow-Origin: http://api.bob.com
					Access-Control-Allow-Credentials: true
					Access-Control-Expose-Headers: FooBar
					Content-Type: text/html; charset=utf-8

				1. CORS related headers are prefixed with `Access-control-`
				2. `Access-Control-Allow-Origin` (required) - Must be included in all valid CORS responses
					1. If omitted, CORS request will fail
					2. Value: Original request header or be a '*' to allow requests from any origin
						1. '*': Allows any site to access the data
						2. Finer control can be exercised
				3. `Access-Control-Allow-Credentials` (optional) - By default, cookies are not included in CORS requests.
					1. `true`: Only valid value. Cookies will be included in CORS requests
					2. Header is not included if cookies are not required
					3. Works in conjunction with `withCredentials` property on `XMLHttpRequest2` object
						1. Both must be set to true in order for CORS request to succeed
						2. Do not set unless we need cookies
				4. `Access-Control-Expose-Headers` (optional) - `XMLHttpRequest2` object has `getResponseHeader()` method that returns the value of particular response Header. It accesses simple response headers.
					1. Simple response headers:
						1. Cache-Control
						2. Content-Language
						3. Content-Type
						4. Expires
						5. Last-Modified
						6. Pragma
					2. Other headers to be made accessible to clients, define `Access-Control-Expose-Headers`
						1. Value: Comma separated list of response headers we want to expose to client

## Handling a Not-So-Simple Request ##
1. Not-so-simple request:
	1. Supporting PUT, DELETE, ...
	2. Supporting JSON using `Content-Type: application/json`
2. Not-so-simple request:
	1. Consists of two requests under the hood
		1. First preflight request
		2. Server grants permission (preflight response)
			1. Can be cached to not be issued in every request
		3. Next actual request
3. Example:

		var url = 'http://api.alice.com/cors';
		var xhr = createCORSRequest('PUT', url);
		xhr.setRequestHeader('X-Custom-Header', 'value');
		xhr.send();

	1. Preflight request:

			OPTIONS /cors HTTP/1.1
			Origin: http://api.bob.com
			Access-Control-Request-Method: PUT
			Access-Control-Request-Headers: X-Custom-Header
			Host: api.alice.com
			Accept-Language: en-US
			Connection: keep-alive
			User-Agent: Mozilla/5.0...

		1. Browser adds `Origin` header in preflight and actual request
		2. HTTP OPTIONS request - server must be able to respond to this
		3. Additional headers:
			1. `Access-Control-Request-Method` - HTTP method of actual request.
				1. Always included even for simple HTTP method (GET, POST, HEAD)
			2. `Access-Control-Request-Headers` - Comma delimited list of non-simple headers included in request
		4. It is a way of asking permission to make actual request
			1. Server must inspect the two headers to verify that both HTTP method and requested headers are valid and accepted
				1. If valid, server must respond with:

						Access-Control-Allow-Origin: http://api.bob.com
						Access-Control-Allow-Methods: GET, POST, PUT
						Access-Control-Allow-Headers: X-Custom-Header
						Content-Type: text/html; charset=utf-8

					1. `Access-Control-Allow-Origin` (required) - Like simple response, preflight response must include the header
					2. `Access-Control-Allow-Methods` (required) - Comma-delimited list of supported HTTP methods.
						1. Even if preflight request asks permissions for single HTTP method, response header can include list of all supported HTTP methods
							1. Useful because if preflight response is cached, it can be used for multiple request types
					3. `Access-Control-Allow-Headers` (required if request has an `Access-Control-Request-Headers` header) - Comma-delimited list of supported request headers.
						1. It can list all headers supported by server (not only those requested in preflight request)
					4. `Access-Control-Allow-Credentials` (optional) - same as simple request
					5. `Access-Control-Max-Age` (optional) - Making preflight request on every request becomes expensive (since browser is making two requests per client request)
						1. The value of the header allows preflight response to be cached for specified number of seconds
4. Actual request: Looks like simple request

		PUT /cors HTTP/1.1
		Origin: http://api.bob.com
		Host: api.alice.com
		X-Custom-Header: value
		Accept-Language: en-US
		Connection: keep-alive
		User-Agent: Mozilla/5.0...

5. Actual Response:

		Access-Control-Allow-Origin: http://api.bob.com
		Content-Type: text/html; charset=utf-8

6. If server wants to deny CORS request, it returns generic response (like HTTP 200) without CORS headers.
	1. Denied if
		1. HTTP method requested in preflight is not valid
		2. Headers requested in preflight are not valid
	2. Browser asssumes request is invalid and defers from making actual request
		1. Preflight response

				// ERROR - No CORS headers, this is an invalid request!
				Content-Type: text/html; charset=utf-8

		2. Browser will fire `onerror` event handler and print the following error in console log
		
				XMLHttpRequest cannot load http://api.alice.com. Origin http://api.bob.com is not allowed by Access-Control-Allow-Origin.

## A Word About Security ##
1. CORS headers are not substitute for security practices
2. Use another security mechanism for additional security restrictions such as
	1. Cookies
	2. [OAuth2](http://oauth.net/2/)

## CORS From JQuery ##
1. [$.ajax()](http://api.jquery.com/jQuery.ajax/)
	1. Used to make both regular XHR as well as CORS requests
		1. Doesn't support IE's XDomainRequest object.
			1. JQuery plugins enable it [http://bugs.jquey.com/ticket/8283]
		2. `$.support.cors` boolean is set to true if browser supports CORS (returns `false` in IE)
			1. This mechanism can be used to check CORS support
2. Example:

		$.ajax({
			// The 'type' property sets the HTTP method.
			// A value of 'PUT' or 'DELETE' will trigger a preflight request.
			type: 'GET',

			// The URL to make the request to.
			url: 'http://html5rocks-cors.s3-website-us-east-1.amazonaws.com/index.html',

			// The 'contentType' property sets the 'Content-Type' header.
			// The JQuery default for this property is
			// 'application/x-www-form-urlencoded; charset=UTF-8', which does not trigger
			// a preflight. It you set this value to anything other than
			// application/x-www-form-urlencoded, multipart/form-data, or text/plain,
			// you will trigger a preflight request.
			contentType: 'text/plain',

			xhrFields: {
				// The 'xhrFields' property sets additional fields on the XMLHttpRequest.
				// This can be used to set the 'withCredentials' property.
				// Set the value to 'true' if you'd like to pass cookies to the server.
				// If this is enabled, your server must respond with the header
				// 'Access-Control-Allow-Credentials: true'.
				withCredentials: false
			},

			headers: {
				// Set any custom headers here.
				// If you set any non-simple headers, your server must include these
				// headers in the 'Access-Control-Allow-Headers' response header.
			},

			success: function () {
				// Here's where you handle a successful response.
			},

			error: function () {
				// Here's where you handle an error response.
				// Note that if the error was due to a CORS issue,
				// this function will still fire, but there won't be any additional
				// information about the error.
			}
		});

## Cross-Domain from Chrome Extensions ##
1. Chrome extensions support cross-domain requests in two different ways:
	1. Include domain in manifest.json - Chrome extensions can make cross-domain requests to any domain if the domain is included in "permissions" section of manifest.json file:

			"permissions": ["http://*.html5rocks.com"]

		2. Server does not need to include any CORS headers or do any additional work
	2. CORS request - If domain is not in manifest.json file, Chrome extension makes standard CORS request.
		1. Value of origin header is "chrome-extension://[CHROME EXTENSION ID]".
			1. Means requests from Chrome extensions are subject to same CORS rules

## Known Issues ##
1. No error iformation provided to onerror handler - When the onerror handler is fired, the status code is 0, and there is no statusText. This may be by desing, but it can be confusing when trying to debug why CORS requests are failing

## CORS Server Flowchart ##
1. Shows how server should make decisions as to which headers to add to CORS response

	![cors_server_flowchart](cors_server_flowchart.png)

## CORS w/ Images ##
1. In Canvas and WebGL, cross origin images can pose big problems
	1. Solution:
		1. Use `crossOrigin` attribute on image element
			1. [Chromium Blog: Using Cross-domain images in WebGL](http://blog.chromium.org/2011/07/using-cross-domain-images-in-webgl-and.html)
			2. [Mozilla Hacks: Using CORS to load WebGL textures from cross-domain images](https://hacks.mozilla.org/2011/11/using-cors-to-load-webgl-textures-from-cross-domain-images/)
			3. [CORS-enabled Image](https://developer.mozilla.org/en-US/docs/HTML/CORS_Enabled_Image)

## Resources ##
1. [The CORS Spec](http://www.w3.org/TR/cors/)
2. [Good Intro](http://www.nczonline.net/blog/2010/05/25/cross-domain-ajax-with-cross-origin-resource-sharing/)
3. [enable-cors.org](http://enable-cors.org/) - how to enable CORS on server
	1. Server needs to add following header to its response for simple CORS requests:

			Access-Control-Allow-Origin: *

	2. Other headers are required for other verbs than GET/POST, custom headers or authentication.
		1. For TL;DR version, take a look at [flowchart for implementing CORS support](http://www.html5rocks.com/static/images/cors_server_flowchart.png)
		2. CORS for a specific platform:
			1. [Apache](https://enable-cors.org/server_apache.html)
				1. Add following line inside either `<Directory>`, `<Location>`, `<Files>` or `<VirtualHost>` sections of server config (*.conf file such as httpd.conf or apache.conf) or within `.htaccess`

						Header set Access-Control-Allow-Origin "*"

				2. Use the following to ensure changes are correct

						apachectl -t - checks config changes for errors

				3. Reload Apache to make sure changes are applied by running

						sudo service apache2 reload
						or
						apachectl -k graceful

				4. Needs `mod_headers` for altering headers which is enabled by default.
				
						a2enmod headers - ensures it is enabled

			2. [App Engine](https://enable-cors.org/server_appengine.html)
			3. [ASP.NET](https://enable-cors.org/server_aspnet.html)
			4. [AWS API Gateway](https://enable-cors.org/server_awsapigateway.html)
			5. [Caddy](https://enable-cors.org/server_caddy.html)
			6. [CGI Scripts](https://enable-cors.org/server_cgi.html)
			7. [ExpressJS](https://enable-cors.org/server_expressjs.html)
				1. Example:
				
						app.use(function (req, res, next) {
							res.header("Access-Control-Allow-Origin", "*");
							res.header("Access-Control-Allow-Headers", "Origin, X-Request-With, Content-Type, Accept");
							next();
						});

						app.get('/', function (req, res, next) {
							// Handle the get for this route
						});

						app.post('/', function (req, res, next) {
							// Handle the post for this route
						});
				
			8. [IIS6](https://enable-cors.org/server_iis6.html)
			9. [IIS7](https://enable-cors.org/server_iis7.html)
			10. [Spring Boot Applications in Kotlin](https://enable-cors.org/server_spring-boot_kotlin.html)
			11. [Meteor](https://enable-cors.org/server_meteor.html)
			12. [nginx](https://enable-cors.org/server_nginx.html)
			13. [Perl](https://enable-cors.org/server_perl.html)
				1. [Plack::Middleware::CrossOrigin](https://metacpan.org/module/Plack::Middleware::CrossOrigin) provides complete CORS server side implementation.
				2. Add the following to allow request from any location

						enable 'CrossOrigin', origins => '*';

					1. Also available as `libplack-middleware-crossorigin-perl` in Debian and Ubuntu
			14. [PHP](https://enable-cors.org/server_php.html)
			15. [ColdFusion](https://enable-cors.org/server_coldfusion.html)
			16. [Tomcat](https://enable-cors.org/server_tomcat.html)
				1. Includes support for CORS starting from v 7.0.41 [http://tomcat.apache.org/tomcat-7.0-doc/config/filter.html#CORS_Filter](http://tomcat.apache.org/tomcat-7.0-doc/config/filter.html#CORS_Filter)
				2. Minimal CORS configuration is:

						<filter>
							<filter-name>CorsFilter</filter-name>
							<filter-class>org.apache.catalina.filters.CorsFilter</filter-class>
						</filter>
						<filter-mapping>
							<filter-name>CorsFilter</filter-name>
							<url-pattern>/*</url-pattern>
						</filter-mapping>

			17. [Virtuoso](https://enable-cors.org/server_virtuoso.html)
			18. [WCF](https://enable-cors.org/server_wcf.html)