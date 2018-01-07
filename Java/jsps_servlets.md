## JSPs Servlets
#### Prerequisites
1. JDK
2. Tomcat
3. Eclipse Java EE
	1. Goto Workbench
	2. New server wizard
	3. Select Tomcat 9
	4. Select JDK
	5. Give location of <tomcat-installation-directory>
	6. Start Tomcat (Stop the previously running tomcat as a prerequisite)

#### Hello World Servlet
1. File
2. New
3. Dynamic Web Project
4. Give name as Hello World
5. Context root: HelloWorld
6. Finish
7. Under Java Resources
8. Right click > Servlet
9. If there are errors, download and add `javax.servlet.jar` to Classpath.
10. Run
	1. Choose the Server as Tomcat
	
#### Folder structure
1. WebContent:
	1. Has Web content like html, jsp
2. Adding a JSP
	1. Right click on WebContent
	2. New > JSP
	3. Finish
	4. Content:
	
			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
			<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www/w3.org/TR/html4/loose.dtd">
			<html>
			<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<title>Insert title here</title>
			</head>
			<body>
			<%=
				new java.util.Date()
			%>
			</body>
			</html>
			
	5. Scriptlets:
		1. Example 1:
			
				<%
				java.util.Date today = new java.util.Date();
				String text = "Today's date is: " + today;
				%>
				<%=
					text
				%>
				
		2. Example 2:
		
				<%
				String text = "Today's date is: ";
				out.println(text);
				%>
				<%=
					new java.util.Date()
				%>
				
#### Deployment Descriptor
1. `web.xml`
	1. Servlet class: `demo.Test`
			
			<servlet>
				<servlet-name>Test</servlet-name>
				<servlet-class>demo.Test</servlet-class>
			</servlet>
			<servlet-mapping>
				<servlet-name>Test</servlet-name>
				<url-pattern>/Hello</url-pattern>
			</servlet-mapping>
		
	2. JSP file: `login.jsp`
	
			<servlet>
				<servlet-name>Login</servlet-name>
				<jsp-file>/login.jsp</jsp-file>
			</servlet>
			<servlet-mapping>
				<servlet-name>login</servlet-name>
				<url-pattern>/login</url-pattern>
			</servlet-mapping>
			
#### Deploying web-app to tomcat:
1. Right click on project
2. Export
3. Select **WAR file**
4. Wizard:
	1. Browse for location
	2. workspace/servlets2/Deployment
	3. Click Finish
5. Copy the war file and paste it in Tomcat `webapps` folder
6. Stop Tomcat instance in Eclipse
7. Restart tomcat

#### Deploying to Cloud
1. [OpenShift](https://www.openshift.com)
2. [Google App Engine](https://console.cloud.google.com/projectselector/appengine?src=ac)

## Nuts and Bolts ##
#### Passing Parameters
1. `http://localhost:8080/Scriptlets/index.jsp?name=bla&id=123456`
2. URLParams.java

		public class URLParams extends HttpServlet {
			public void doGet(HttpRequest request, HttpResponse response) {
				String name = request.getParam("name");
				String id = request.getParam("id");

				PrintWriter out = response.getWriter();
				out.println("Name is: " + name);
				out.println("id id: " + id);
			}
		}

3. parameters.jsp

		<%@ page language="java" contentType="text/html;charset=UTF-8"%>
		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www/w3.org/TR/html4/loose.dtd">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
				<title>Insert title here</title>
			</head>
			<body>
				<%
					String name = request.getParam("name");
					String id = request.getParam("id");

					out.println("Name is: " + name);
					out.println("id is: " + id);
				%>
			</body>
		</html>

#### Generating HTML using JSPs
1. New Jsp
	1. manipulations.jsp

			<%@ page language="java" contentType="text/html;charset=UTF-8"%>
			<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www/w3.org/TR/html4/loose.dtd">
			<html>
				<head>
					<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
					<title>Insert title here</title>
				</head>
				<body>
					<% for(int i = 0; i < 5; i++) { %>
						<p>This is run in a scriptlet loop: <%= i %></p>
					<% } %>

					<%
						String id = request.getParameter("id");
						
							
					%>
				</body>
			</html>

#### Including other pages in a JSP
1. include directive
	1. `<%@ include file="<file-path>" %>`: like inline copy paste
	2. `<jsp:include page="<file-path>" />`: included only at runtime (variables will not be avialable at compile time)
		
			<% 
			String id = request.getParameter("id"); 
			%>

2. Including headers, footers (reusable)
	1. New JSP includes.jsp

			<body>
				<%@ include file="copyright.txt" %> <!-- including during translation of JSP into servlet -->
			</body>

	2. New file > copyright.txt

			Copyright caveofprogramming.com

		2. `include` if file doesn't change very often
		3. Run
	3. Dynamic include: New file > updates.txt

			Today's weather is: sunny (changes frequently)

		1. includes.jsp

				<body>
					<p>
						<!-- Dynamic include: content changes a lot -->
						<jsp:include page="updates.txt" /> <!-- when jsp is served, browser sends another request for this -->
					</p>
				</body>

3. New JSP: variables.jsp

		<%
		String name = "Sue";	
		%>

	1. To include this use `<%@ include ...>` for variables (Java code) to be accessible

			<%@ include file="variables.jsp" %> <!-- like copy and paste -->
			<%= name %>

### Forwarding and Redirecting ###
### The Declaration Tag ###
### JSP Tags Summary ###
### Model 1 vs. Model 2 Architecture ###
### Using External APIs in Web Applications ###
### The Servlet Lifecycle ###

## Beans and Forms ##
### JSP Beans ###
### Beans and Scope ###
### Setting Bean Properties Using Parameters ###
### Forms ###
### HTTP Posts ###
### Using Beans to Store Form Data ###
### Adding Validation to Beans ###
### Self-Validating Forms ###
### Validating Forms Using MVC Architecture ###

## Some Useful Objects ##
### The Session Object ###
### URL Rewriting: Supporting Sessions Without Cookies ###
### The Servlet Context Object ###
### Getting Initialisation Parameters from web.xml ###
### Scoped Objects Review ###
### Cookies ###

## Databases ##
### Connecting to a Database ###
### Setting Up a JNDI Data Source ###
### Querying Databases ###
### Inserting Data Into Databases ###

## Sending Emails ##
### Sending Emails: Prerequisites ###
### Sending Emails with the Mail API ###

## Simplify Your Code With JSTL ##
### Beginning JSTL: Hello World JSTL ###
### Accessing Bean Values in JSTL ###
### Getting URL Parameters in JSTL ###
### The JSTL "if" Statement ###
### The Choose Tag in JSTL ###
### The foreach loop in JSTL ###
### Referencing Java Objects in JSTL ###
### JSTL Implicit Objects ###
### Using Maps in EL ###
### Outputting Variables: The c:out Tag vs. Using EL Directly ###
### forEach: Iterating Through Lists ###
### Using External Files: Graphics, CSS, etc ###
### Reusable Fragments Using JSTL c:import ###
### SQL Queries with JSTL ###
### Setting Variables in JSTL ###
### Expressions in EL ###
### Creation of URLs With JSTL ###
### Wildcards and Getting a Single Row in JSTL ###
### JSTL Functions ###
### SQL Updates and Transactions in JSTL ###
### Formatting Using JSTL ###
### Custom Tags ###

## Source Code ##
### Source Code ###

## Where Now? ##
### Some Final Worlds ... ###

## Extra! ##
### Uploading Files: Allowing the User to Upload Images and Other STuff ###