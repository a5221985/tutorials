## Java EE Design Patterns Architecture
1. Architecture
2. Patterns
3. Jargons

#### Introduction
1. Cross Section
2. Model 1 Architecture
3. Model 2 MVC
4. Architecture
	1. Why apps have multiple layers
	2. Distributed
5. Design
	1. Coupling
	2. Cohession
	3. Cross cutting concerns
6. Web
	1. Terminologies
		1. Scriptlets
		2. JSTL
		3. EL
	2. Patterns
		1. Front Controller
		2. Application Controller
		3. View Helper
		4. Context Object
		5. Composite View
		6. Intercepting Filter 
7. Business
8. Integration
	1. Terminologies
		1. JAXB
		2. JAX-RS
		3. JAX-WS
		4. JMS
		5. JNDI
		6. JDBC
		7. ORM
		8. JPA
	2. Patterns
		1. Data Access Object
		2. Service Activator
9. Others
	1. AOP
	2. DI
	3. Caching
	
#### Model 1 Architecture
1. Browser -> JSP -> Model
2. JSP: View logic + Business Logic

### Model 2 Architecture
1. Model View Controller architecture
2. Model:
3. View: JSP, Free Marker, JSF, Velocity templates
4. Controller: Servlet (generates model and selects view)
	1. Browser -request-> Servlet
	2. Servlet -makes-> Model
	3. Model -made available-> View -sends HTML-> Browser
5. Example:
	
		package com.in28minutes.todo;

		import javax.servlet.http.HttpServlet;
		import javax.servlet.http.HttpServletRequest;
		import javax.servlet.http.HttpServletResponse;
		import javax.servlet.annotation.WebServlet;

		@WebServlet(urlPatterns = "/list-todos.do")
		public class ListTodoServlet extends HttpServlet {
			private TodoService todoService = new TodoService();
	
			protected void doGet(HttpServletRequest request, HttpServletResponse response) {
				request.setAttribute("todos", todoService.retrieveTodos());
				request.getRequestDispatcher("/WEB-INF/views/list-todos.jsp");		
			}
		}
		
### Modified Model 2 Architecture
1. FrontController: 	
	1. Takes requests from browser
	2. Redirects requests to a specific controller
	3. Controller gets model and comes back to front controller and selects view
	4. FrontController executes view sends html back to controller which will display in browser
	5. Example:
		1. DispatcherServlet in Spring MVC
			1. Decides handler
			2. Decides view
			3. Adds exception handling
			4. Internationalization

### Business Layer

	