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

#### Inclucing other pages in a JSP
1. include directive
	1. `<%@ include file="<file-path>" %>`: like inline copy paste
	2. `<jsp:include page="<file-path>" />`: included only at runtime (variables will not be avialable at compile time)
		
			<% 
			String id = request.getParameter("id"); 
			%>
