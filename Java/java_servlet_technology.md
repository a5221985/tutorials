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

## Writing Service Methods ##
## Filtering Requests and Responses ##
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