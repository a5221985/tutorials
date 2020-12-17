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
		2. Select filter from list of filters
		3. Click **Add**
		4. In Add Filter Mapping dialog box, select one of following dispatcher types
			1. **REQUEST** - Only when request comes directly from client
			2. **ASYNC** - Only when asynchronous request comes from client
			3. **FORWARD** - Only when request has been forwarded to a component ([Transferring Control to Another Web Component](https://docs.oracle.com/javaee/7/tutorial/servlets007.htm#BNAGK))
			4. **INCLUDE** - Only when request is being processed by a component that has been included ([Including Control to Another Web Component](https://docs.oracle.com/javaee/7/tutorial/servlets007.htm#BNAGJ))
			5. **ERROR** - Only when request is being processed with error page mechanism ([Handling Servlet Errors](https://docs.oracle.com/javaee/7/tutorial/servlets002.htm#BNAFN))
		5. We can direct filter to be applied to any combinations of preceding situations by selecting multiple dispatcher types
			1. Defautl is **REQUEST** if no types are specified

## Invoking Other Web Resources ##
1. Web components can invoke other web resources directly and indirectly
2. Indirect method:
	1. Web compoenent indirectly invokes another web resource by embedding URL that points to another web component in content returned to client
3. Direct method:
	1. While a web component is executing, it directly invokes another resource by either including content of another resource or forwarding a request to another resource
4. To invoke resource available on server that is running web component:
	1. First obtain `RequestDispatcher` object by using `getRequestDispatcher("URL")` method
		1. It can be obtained either from:
			1. Request or
			2. Web context
		2. The two methods have slightly different behaviour
		3. Method takes path to requested resource as an argument
			1. Request can take relative path
				1. That does not begin with `/`
					1. But Web context - requires absolute path
	2. If resource is not available, or if server has not implemented `RequestDispatcher` object for the type of resource, `getRequestDispatcher` will return `null`
		1. Serlvet should deal with this condition

### Including Other Resources in the Response ###
1. It is often useful to include another web resource (such as banner content or copyright info) in response returned from web component
	1. How to do that?
		1. Invoke the following method of `RequestDispatcher`

				include(request, response);
				
2. If resource is static: `include` method enables programmatic server-side includes
3. If resource is web component: effect of the method is to
	1. Send request to included web component
	2. Execute web component
	3. Include result of execution in response from containing servlet
4. Included web component has access to request object but is limited in what it can do with response object
	1. It can write to body of response and commit a response
	2. It cannot set headers or call any method that affects headers of response
		1. `setCookie` say

### Transferring Control to Another Web Component ###
1. In certain applications, we might want to have
	1. One web component do preliminary processing of request
	2. Another component generate response
2. Example: We want to partially process a request and then transfer to another component (depending on nature of request)
3. To transfer control to another web component, invoke `forward` of `RequestDispatcher`
	1. Request URL is set to the path of forwarded page
	2. Original URI and it's parts are saved as following request attributes:
	
			javax.servlet.forward.request_uri
			javax.servlet.forward.context_path
			javax.servlet.forward.servlet_path
			javax.servlet.forward.path_info
			javax.servlet.forward.query_string
			
		1. `forward` method should be used to given another resource responsibility for replying to user
			1. If `ServletOutputStream` or `PrintWriter` have already been accessed in servlet, we cannot use this method
				1. `IllegalStateException` will get thrown

## Accessing the Web Context ##
1. Context in which web components execute is an object that implements `ServletContext` interface
	1. Web context is retrieved using `getServletContext` method
	2. Web context:
		1. Provides methods for accessing
			1. Initialization parameters
			2. Resources associated with the web context (?)
			3. Object-valued attributes
			4. Logging capabilities
2. Counter's access methods are synchronized to prevent incompatible operations by servlets running concurrently
	1. Filter retrieves counter object by using context's `getAttribute` method
	2. Incremented value of counter is recorded in log

## Maintaining Client State ##
1. Applications may require series of requests from client be associated with one another
	1. Example: Web application can save state of user's shopping cart across requests
		1. Application is responsible for maintaining such state called **sesion** (Since HTTP is stateless)
			1. To support apps that need to maintain state, Java Servlet technology provides API for managing sessions & allows mechanisms for implementing sessions

### Accessing a Session ###
1. Sessions are represented by `HttpSession` object
	1. A session is accessed by calling `getSession` method of request object
		1. Method returns current session associated with the request
		2. or
		3. If request does not have a session, a session is created

### Associating Objects with a Session ###
1. If attribute values are objects, they can be associated with a session by name
	1. The attributes are accessible by any web component that belongs to same web context and is handling request that is part of same session
	2. Application can notify web context and session listener objects of servlet lifecycle events
		1. [Handling Servlet Lifecycle Events](https://docs.oracle.com/javaee/7/tutorial/servlets002.htm#BNAFJ)
	3. Objects can also be notified of certain events which is related to their association with session
		1. When object is added or removed from session:
			1. The object must implement `javax.servlet.http.httpSessionBindingListener` interface
		2. When session to which object is attached is passivated or activated:
			1. Passivation or activation occurs when object is moved between virtual machines
			2. Passivation or activation occurs when object is saved to or restored from persistent storage
			3. Object must implement `javax.servlet.http.HttpSessionActivationListener` interface to receive notifications

### Session Management ###
1. HTTP client has no way to signal that it no longer needs a session,
	1. Each session has an associated timeout (to reclaim the resources)
2. Timeout period can be accessed using session's
	1. `getMaxInactiveInterval`
	2. `setMaxInactiveInterval`
3. Notes:
	1. To ensure an active session is not timed out, periodically access the session by using service methods
		1. This resets session's time-to-live counter
	2. When particular client interaction is finished, use session's `invalidate` method to invalidate a session on server side and remove session data

#### To Set the Timeout Period Using NetBeans IDE ####
1. In deployment descriptor:
	1. Open project if not already opened
	2. Expand node of your project in **Projects** tab
	3. Expand **Web Pages** and **WEB-INF** nodes under project node
	4. Double click `web.xml`
	5. Click **General** at top of editor
	6. In **Session Timeout** field, enter an integer value
		1. It represents number of minutes of inacitivity that must pass before session times out

### Session Tracking ###
1. Several methods can a web container use to associate a session with user
	1. All methods involve passing an identifier between client and server
		1. Identifier can be:
			1. Maintained by client as a cookie
			2. includes by web component in every URL that is returend to client
2. If application uses session objects
	1. We must ensure that session tracking is enabled by having application rewrite URLs whenever client turns off cookies
		1. Done by calling response's `encodeURL(url)` method on all URLs returned by servlet
			1. `encodeURL(url)` - includes session ID in URL if cookies are disabled or else, returns URL unchanged

## Finalizing a Servlet ##
1. Web container may determine that servlet should be removed from service
	1. Example: 
		1. When container wants to reclaim memory resources
		2. When container is being shut down
2. Container calls `destroy` method of `Servlet` interface
	1. In this method, we release resources servlet is using and save persistent state
		1. Releases database object constructed in `init` method
3. Servlet's service methods should be complete when servlet is removed
	1. Server tries to ensure this by calling `destroy` only after all service requests have returned or after server-specific grace period (whichever comes first)	
		1. If servlet has operations that may run longer than server's grace period, operations could still be running when `destroy` is called
			1. Ensure threads still handling client requests complete
4. Next: How to do the following:
	1. Keep track of how many threads are currently running `service` method
	2. Provide clean shutdown by having `destroy` method notify long-running threads of shutdown and wait for them to complete
	3. Have long-running methods poll periodically to check for shutdown and, if necessary, stop working, clean up, and return

### Tracking Service Requests ###
1. To track service requests:
	1. Include in servlet class a field that counts number of service methods running
		1. The field should have synchronized access methods to increment, decrement and return its value
2. Implementation

		public class ShutdownExample extends HttpServlet {
			private int serviceCounter = 0;
			...
			// Access methods for serviceCounter
			protected synchronized void enteringServiceMethod() {
				serviceCounter++;
			}
			
			protected synchronized void leavingServiceMethod() {
				serviceCounter--;
			}
			
			protected synchronized int numServices() {
				return serviceCounter;
			}
		}
		
3. `service` method should increment service counter each time method is entered and should decrement counter each time method returns
	1. This is one time `HttpServlet` subclass should override `service` method
	2. New method should call `super.service` to preserve functionality of original `service` method
4. Implementation:

		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			enteringServiceMethod();
			try {
				super.service(req, resp);
			} finally {
				leavingServiceMethod();
			}
		}

### Notifying Methods to Shut Down ###
1. To ensure clean shutdown, `destroy` method should not release shared resources until all service requests have completed
	1. A part of doing this is to check service counter
	2. Another part is to notify long-running methods that it is time to shutdown
		1. For this another field is required
			1. The field should have the usual access methods
2. Example:

		public class ShutdownExample extends HttpServlet {
			private boolean shuttingDown;
			...
			// Access methods for shuttingDown
			protected synchronized void setShuttingDown(boolean flag) {
				shuttingDown = flag;
			}
			
			protected synchronized boolean isShuttingDown() {
				return shuttingDown;
			}
		}
		
3. Exmaple: `destroy`

		public void destroy() {
			/* Check to see whether there are still service methods */
			/* running, and if there are, tell them to stop. */
			if (numServices() > 0) {
				setShuttingDown(true);
			}
			
			/* Wait for the service methods to stop. */
			while (numServices() > 0) {
				try {
					Thread.sleep(interval);
				} catch (InterruptedException e) {
				}
			}
		}	

### Constructing Polite Long-Running Methods ###
1. Last step in providing clean shutdown:
	1. Make long-running methods behave politely
		1. Methods should check value of the field that notifies them of shutdowns and should interrupt their work, if necessary
2. Example:

		public void doPost(...) {
			...
			for (i = 0; ((i < lotsOfStuffToDo) && !isShuttingDown()); i++) {
				try {
					partOfLongRunningOperation(i);
				} catch (InterruptedException e) {
					...
				}
			}
		}

## Uploading Files with Java Servlet Technology ##
1. In prior versions of Servlet spec, implementing file uploads required use of external libraries or complex input processing
2. Java Servlet spec now has viable solution to problem in generic and portable way
	1. It supports file uploads out of the box
		1. Any web container that implements the spec can parse multipart requests and make mime attachments available through
			1. `HttpServletRequest` object
3. New annotation: `javax.servlet.annotation.MultipartConfig` - used to indicate that servlet on which it is declared expects requests to be ade using `multipart/form-data` MIME type

### The @MultipartConfig Annotation ###

### The getParts and getPart Methods ###

## Asynchronous Processing ##
1. Web containers in app servers usually use a server thread per client request
	1. If there is heavy load, containers need large amount of threads to serve all client requests

## Nonblocking I/O ##
## Protocol Upgrade Processing ##
## The mood Example Application ##
## The fileupload Example Application ##
## The dukeetf Example Application ##
## Further Information about Java Servlet Technology ##