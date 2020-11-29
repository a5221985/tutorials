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
1. 

## Constructing and Initializing a Servlet ##
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