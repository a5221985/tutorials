# Java Servlet Technology #
1. Servlet - provides dynamic, user-oriented content in web apps using request-response programming model

## What is a Servlet? ##
1. Servlet - Java class
	1. It is used to extend capabilities of servers that host applications accessed by means of request-response programming model
	2. They are commonly used to extend apps hosted by web servers (but can respond to any type of request)
		1. HTTP Specific servlet classes are defined for HTTP requests
2. `javax.servlet` and `javax.servlet.http`
	1. Packages have interfaces & classes for writing servlets
	2. All servlets must implement `Servlet` interface
		1. `Servlet` interface defines lifecycle methods
	3. If generic service needs to be implemented, use or extend `GenericServlet` class (provided with Java Servlet API)
	4. `HTTPServlet` class provides methods for handling HTTP-specific services
		1. `doGet`
		2. `doPost`

## Servlet Lifecycle ##
1. Lifecycle of servlet is controlled by container (in which servlet is deployed)
2. When request is mapped to servlet, container performs following steps
	1. If an instance of the servlet does not exist, the web container
		1. Loads the servlet class
		2. Constructs an instance of the servlet class
		3. Initializes servlet instance by calling `init` method (initialization is covered in [Constructing and Initializing a Servlet](https://docs.oracle.com/javaee/7/tutorial/servlets004.htm#BNAFU)
	2. Container invokes `service` method
		1. Request and response objects are passed
		2. [Writing Service Methods](https://docs.oracle.com/javaee/7/tutorial/servlets005.htm#BNAFV)
	3. If container needs to remove servlet, it finalizes servlet by calling servlet's `destroy` method.
		1. [Finalizing a Servlet](https://docs.oracle.com/javaee/7/tutorial/servlets010.htm#BNAGS)

### Handling Servlet Lifecycle Events ###
1. One can monitor and react to events in servlet's lifecycle by defining listener objects whose methods get invoked when lifecycle events occur.
	1. To use listener objects,
		1. Define and specify listener class

#### Defining the Listener Class ####
1. Defined by implementing a listener interface
	1. Events that can be monitored for:
		1. Web context object - Initialization and destruction - `javax.servlet.ServletContextListener` and `ServletContextEvent`
		2. Web context object - Attribute added, removed, or replaced - `javax.servlet.ServletContextAttributeListener` and `ServletContextAttributeEvent`
		3. Session object - Creation, invalidation, activation, passivation, and timeout - `javax.servlet.http.HttpSessionListener`, `javax.servlet.http.HttpSessionActivationListener`, `HttpSessionEvent`
		4. Session object - Atribute added, removed, or replaced - `javax.servlet.http.HttpSessionAttributeListener` and `HttpSessionBindingEvent`
		5. Request object - A servlet request has started being processed by web components - `javax.servlet.ServletRequestListener` and `ServletRequestEvent`
		6. Request object - Attribute added, removed, or replaced - `javax.servlet.ServletRequestAttributeListener` and `ServletRequestAttributeEvent`
2. `@WebListener` - used to define listener to get events for operations on particuler web application context
	1. Classes annotated with `@WebListener` **(M)**

			javax.servlet.ServletContextListener
			javax.servlet.ServletContextAttributeListener
			javax.servlet.ServletRequestListener
			javax.servlet.ServletRequestAttributeListener
			javax.servlet.http.HttpSessionListener
			javax.servlet.http.HttpSessionAttributeListener
			
3. Example: Following code implements two of the listeners

		import javax.servlet.ServletContextAttributeListener;
		import javax.servlet.ServletContextListener;
		import javax.servlet.annotation.WebListener;
		
		@WebListener()
		public class SimpleServletListener implements ServletContextListener, ServletContextAttributeListener {
			// ...
		}

### Handling Servlet Errors ###
1. Exceptions can occur when servlet executes
2. The following page gets shown when exception occurs

		A Servlet Exception Has Occurred
		
	1. This can be overridden by specifying error page for given exception

## Sharing Information ##
1. Web components (like other objects) work with other objects (usually) to accomplish their tasks
2. Web components can do so by doing the following:
	1. Using private helper objects (example: JavaBeans components)
	2. Sharing objects that are attributes of public scope
	3. Using database
	4. Invoking other web resources
		1. [Invoking Other Web Resources](https://docs.oracle.com/javaee/7/tutorial/servlets007.htm#BNAGI)

### Using Scope Objects ###
1. Collaborating web components share info by means of objects maintained as attributes of four scope objects
	1. Using `getAttribute` & `setAttribute` methods of the class representing scope
		1. Web context scope object - `javax.servlet.ServletContext` - Accessible from web components within a web context. [Accessing the Web Context](https://docs.oracle.com/javaee/7/tutorial/servlets008.htm#BNAGL)
		2. Session scope object - `javax.servlet.http.HttpSession` - Accessed by web components handling request that belongs to session. [Maintaining Client State](https://docs.oracle.com/javaee/7/tutorial/servlets009.htm#BNAGM)
		3. Request scope object - Subtype of `javax.servlet.ServletRequest` - Accessed by web components handling the request
		4. Page scope object - `javax.servlet.jsp.JspContext` - JSP page that constructs the object

### Controlling Concurrent Access to Shared Resources ###
1. In multithreaded server, shared resources can be accessed concurrently
2. (In addition to scope object attributes) shared resources include
	1. in-memory data
		1. Instance or class variables
		2. External objects (files, database connections, network connections)
3. Concurrent access can arise in many situations
	1. Multiple web components accessing objects stored in web context
	2. Multiple web components accessing objects stored in a session
	3. Multiple threads within a web component accessing instance variables.
		1. **Web container typically constructs a thread to handle each request**
			1. To ensure servlet instance handles only one request at a time?
				1. Servlet can implement `SingleThreadModel` **(M)** interface
					1. No two threads can execute concurrently in servlet's service method
					2. Implementation: Web container synchronizes access to single instance of servlet or by maintaining a pool of web component instances and dispatching each new request to free instance
				2. Caveat: The interface does not prevent synchronization problems that result from web components accessing shared resources
					1. Static class variables
					2. External objects
4. If resources are accessed concurrently, they can be used in inconsistent fashion
	1. Solution: [Synchronization using threads](http://docs.oracle.com/javase/tutorial/essential/concurrency/)

## Constructing and Initializing a Servlet ##
1. `@WebServlet` **(M)** is used to define servlet component in web application
	1. The annotation is specified on a class
	2. It contains metadata about servlet declared
		1. Must declare at least one URL pattern
			1. Two ways to do it:
				1. `urlPatterns` attribute (when other attributes are also used)
				2. `value` attribute (when it is the only attribute)
2. Classes annotated with `@WebServlet` must extend: `javax.servlet.http.HttpServlet`
	1. Example:

			import javax.servlet.annotation.WebServlet;
			import javax.servlet.http.HttpServlet;
			
			@WebServlet("/report")
			public class MoodServlet extends HttpServlet {
				...
			}
			
		1. Web container initializes servlet after loading and instantiating servlet class and before delivering requests from clients
		2. Customization of the process:
			1. To allow servlet to read persistent config data, initialize resources, perform any other one-time activities:
				1. Override `init` method of `Servlet` interface or
				2. Specify `initParams` attribute of `@WebServlet` annotation
					1. It contains `@WebInitParams` annotation
		3. If servlet cannot complete initialization process, it throws `UnavailableException`
3. Use init parameter to provide data needed to a particular serlvet
4. A context parameter provides data available to all components of web application

## Writing Service Methods ##
1. Service provided by servlet is
	1. In `service` method of `GenericServlet`
	2. In `do`*Method* methods (*Method* can be `Get`, `Delete`, `Options`, `Post`, `Put`, or `Trace`) of `HttpServlet` object (or any other protocol-specific methods defined by class that implements `Servlet` interface)
2. **service method** is used for any method in servlet class that provides service to client
3. General pattern of service method:
	1. Extract info from request
	2. Access external resources
	3. Populate response (based on info)
4. HTTP Servlets - procedure to populate response
	1. Retrieve an output stream from response
	2. Fill in response headers
	3. Write body content to output stream
5. Response headers must be set before the response is committed
	1. Web container will ignore attempt to set or add headers after response has been committed
6. Next: How to get info from requests and generate responses

### Getting Information from Requests ###
1. Request contains data passed between client and servlet
	1. All requests implement - `ServletRequest` interface
		1. `ServletRequest` - has methods for accessing following info
			1. Parameters - typically used to convey info between clients and servlets
			2. Object-valued attributes - typically used to pass info between web container and servlet or between collaborating servlets
			3. Info about protocol used to communicate request & about client and server involved in request (?)
			4. Info relevant to localization
	2. An input stream can be retrieved and data be manually parsed
		1. `BufferedReader` - for character data
			1. Returned by request's `getReader` method
		2. `ServletInputStream` **(M)** - to read binary data
			1. Returned by `getInputStream`
2. HTTP servlets are passed HTTP request object - `HttpServletRequest`
	1. It contains
		1. Request URL
		2. HTTP headers
		3. Query string
		4. ...
	2. HTTP request URL has following parts

			http://[host]:[port][request-path]?[query-string]
			
		1. Request path is composed of:
			1. **Context path** - concatenation of `/` with context root of servlet's web application
			2. **Servlet path** - Path section that corresponds to **component alias** that activated this request (?)
				1. Path starts with `/`
			3. **Path info** - Part of request path that is not part of context path or servlet path
		2. `getContextPath` - to access context path
		3. `getServletPath` - to access servlet path
		4. `getPathInfo` - to get other parts
3. URI always has the three parts
	1. Irrespective of encoding differences between request URI and path parts
4. Query strings
	1. Composed of set of params and values
		1. Individual params are retrieved using `getParameter` method
	2. Two ways to generate query strings
		1. query string can explicitly appear in web page
		2. query string is appended to URL when form with `GET` HTTP method is submitted

### Constructing Responses ###
1. Response contains data passed between server and client
	1. All responses implement `ServletResponse` interface. The interface defines methods to do:
		1. Retrieve output stream to use to send data to client
			1. `PrintWriter` - to send character data
				1. Returned by `getWriter` method
			2. `ServletOutputStream` - to send binary data in Multipurpose Internet Mail Extensions (MIME) body response
				1. Returned by `getOutputStream`
			2. To mix binary and text data (as multipart response)
				1. Use `ServletOutputStream`
					1. Need to manage character sections manually
		2. Indicate content type (example: `text/html`) being returned by response with `setContentType(String)`
			1. Method must be called before response is committed
			2. Registry of content type names: [Internet Assigned Numbers Authority (IANA)](http://www.iana.org/assignments/media-types/)
		3. Indicate whether to buffer output with `setBufferSize(int)`
			1. Default behaviour:
				1. Any content written to output stream is immediately sent to client
			2. Buffering:
				1. Content is written first before sending anything back to client
					1. Use case: gives servlet more time to set appropriate status codes and headers or forward to another web resource
						1. *Partially written content?*
			3. Method must be called before any content is written or before response is committed
		4. Set localization information:
			1. Locale
			2. Character encoding
				1. [Internationalizing and Localizing Web Applications](https://docs.oracle.com/javaee/7/tutorial/webi18n.htm#BNAXU)
2. `javax.servlet.http.HttpServletResponse` - has fields representing HTTP headers
	1. Status codes
		1. Used to indicate reason a request is not satisfied or that request has been redirected
	2. Cookies
		1. Used to store application-specific information at client
		2. User session: Cookies can be used to track id information of a user session
			1. [Session Tracking](https://docs.oracle.com/javaee/7/tutorial/servlets009.htm#BNAGR)

## Filtering Requests and Responses ##
1. **filter** - It is an object that can transform header and content (or both) of request or response
	1. Difference as compared to web components:
		1. usually do not themselves construct response
		2. It has functionality that can be attached to any kind of web resource
			1. It should not have any dependency on a web resource (for which it is a filter)
				1. It can be composed with more than one type of web resource
2. Tasks performed by a filter:
	1. Query request and act accordingly
	2. Block request-and-response pair from passing any further
	3. Modify request headers and data
		1. Done by providing customized version of request
	4. Modify response headers and data
		1. Done by providing customized version of response
3. Applications of filters:
	1. Authentication
	2. Logging
	3. Image conversion
	4. Data compression
	5. Encryption
	6. Tokenizing streams
	7. XML transformations
	8. ...
4. A web resource can be configured to be filtered by a chain of - zero, one, or more filters in specific order
	1. Chain is specified when web application containing component is deployed and instantiated when web container loads component

### Programming Filters ###
1. API is defined by: `Filter`, `FilterChain`, `FilterConfig` interfaces in `javax.servlet` package
	1. `Filter` - used to implement filter
		1. `@WebFilter` annotation is used to define a filter in web application
			1. It is specified on a class & contains metadata about filter being declared
			2. It must specify atleast one URL pattern
				1. `urlPatterns` - used to define url patterns (used if other attributes are also used)
				2. `value` - used to define single url pattern (used if it is the only attribute)
			3. Other attributes are optional (they have default settings)
2. Classes annotated with `@WebFilter` must implement `Filter` interface
3. `initParams` is used to add config data to filter in `@WebFilter`
	1. Contains `@WebInitParam` annotation **(M)**
	2. Example: Specifying initialization parameter

			import javax.servlet.Filter;
			import javax.servlet.annotation.WebFilter;
			import javax.servlet.annotation.WebInitParam;
			
			@WebFilter(filterName = "TimeOfDayFilter",
			urlPatterns = {"/*"},
			initParams = {
				@WebInitParam(name = "mood", value ="awake")
			})
			public class TimeOfDayFilter implements Filter {
				...
			
4. Most important method in `Filter` interface is `doFilter`
	1. The method is passed request, response, filter chain objects
	2. The method can perform the following:
		1. Examine request headers
		2. Customize request object if fiter wishes to modify request headers or data
		3. Customize response object if filter wishes to modify response headers or data
		4. Invoke next entity in filter chain
			1. If current filter is last filter in chain that ends with target web component or static resource
				1. Next entity is **resource** at the end of chain (forwarded to web component or static resource)
			2. Else
				1. It is next filter that was configured in WAR
			3. Filter invokes next entity by calling `doFilter` on chain object
				1. Request and response are passed that the original filter was called with (or wrapped versions that it might have instantiated)
				2. Alternatively:
					1. Filter can choose to block request by not making call to invoke next entity
						1. In this case:
							1. Filter is responsible for filling up the response
		5. Examine response headers after invoking next filter in chain
		6. Throw exception to indicate error in processing
5. `init` and `destroy` must be imlemented in addition to `doFilter`
	1. `init` - called by container when filter is instantiated
		1. If initialization parameters need to be passed to filter:
			1. Retrieve them from `FilterConfig` object passed to `init`

### Programming Customized Requests and Responses ###
1. There are many ways for filter to modify request or response
	1. Example: Filter can add attribute to request or can insert data in response
		1. Filter that needs to modify response must capture response before it is returned to client
			1. Procedure to do that:
				1. Pass stand-in stream to serlvet (that generates response)
					1. stand-in stream prevents servlet from closing original response stream when it completes
						1. This allows filter to modify servlet's response
2. How to pass stand-in stream to servlet?
	1. Filter constructs a response wrapper that overrides `getWriter` or `getOutputStream` to return the stand-in stream
		1. Wrapper is passed to `doFilter` method of filter chain
		2. Wrapper methods default to calling through to wrapped request or response object
			1. To override request methods
				1. Wrap request in object that extends either
					1. `ServletRequestWrapper` **(M)** or
					2. `HttpServletRequestWrapper`
			2. To override response methods
				1. Wrap response in object that extends either
					1. `ServletResponseWrapper` or
					2. `HttpServletResponseWrapper`

### Specifying Filter Mappings ###
1. Web container uses filter mappings to decide how to apply filters to web resources
	1. Filter mapping
		1. Matches filter to web component **by name** or to web resource by **URL pattern**
		2. Filters are invoked in order in which filter mappings appear in filter mapping list or WAR
			1. Filter mapping list:
				1. Specified in deployment descriptor
					1. Using NetBeans IDE
					2. Coding list in XML
2. Example: To log every request to a web application
	1. Map hit counter filter to URL pattern `/*`
3. A filter can be mapped to one or more web resources
4. More than one filter can be mapped to a web resource (Many-to-Many)

	![filter_to_servlet_mapping](filter_to_servlet_mapping.png)
	
	1. F1 is mapped to S1, S2, S3
	2. F2 is mapped to S2
	3. F3 is mapped to S1, S2
5. Filter chain:
	1. It is one of the objects passed to `doFilter` method of filter
	2. Chain is formed indirectly by means of filter mappings
		1. Order of filters in chain is same as order in which filter mappings appear in web app deployment descriptor
6. Invocation:
	1. When filter is mapped to servlet S1, web container invokes `doFilter` of F1
	2. `doFilter` method of each filter in S1's filter chain is invoked by preceding filter in chain by means of `chain.doFilter` method
	3. F1's call to `chain.doFilter` invokdes `doFilter` of F3 (F3 follows F1)
	4. When F3's `doFilter` completes, control returns to F1's `doFilter`

#### To Specify Filter Mappings Using NetBeans IDE ####
1. Steps:
	1. Expand application's project node in **Project** tab
	2. Expand **Web Pages** and **WEB-INF** nodes under project node
	3. Double click **web.xml**
	4. Click **Filters** at the top of editor window
	5. Expand **Servlet Filters** node in editor window
	6. Click **Add Filter Element** to map filter to web resource by name or by URL pattern
	7. In Add Servlet Filter dialog box, enter name of filter in **Filter Name** field
	8. Click **Browse** to locate servlet class to which filter applies
		1. We can include wildcard characters so that you can apply filter to more than one servlet
	9. Click **OK**
	10. To constrain how filter is applied to requests follow the steps below:
		1. Expand **Filter Mappings** node

## Invoking Other Web Resources ##
## Accessing the Web Context ##
## Maintaining Client State ##
## Finalizing a Servlet ##
## Uploading Files with Java Servlet Technology ##
## Asynchronous Processing ##
## Nonblocking I/O ##
## Protocol Upgrade Processing ##
## The mood Example Application ##
## The fileupload Example Application ##
## The dukeetf Example Application ##
## Further Information about Java Servlet Technology ##