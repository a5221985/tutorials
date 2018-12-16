# Java EE Made Easy - Patterns, Architecture and Frameworks #
## Introduction ##
1. Architecture, patterns and jargons
2. A lot of frameworks exist in Java EE
3. Simplifying Java EE
4. Topics
	1. Model 1
	2. Model 2
	3. MVC
	4. Coupling
	5. Cohesion
	6. Patterns
	7. Front controller
	8. Caching
	9. DI
5. Examples:
	1. [https://github.com/in28minutes/SpringMvcStepByStep](https://github.com/in28minutes/SpringMvcStepByStep)
	2. [https://github.com/in28minutes/JavaWebApplicationStepByStep](https://github.com/in28minutes/JavaWebApplicationStepByStep)
	3. [https://github.com/in28minutes/Struts2StepByStep](https://github.com/in28minutes/Struts2StepByStep)
	4. [https://github.com/in28minutes/JavaObjectOrientedProgramming](https://github.com/in28minutes/JavaObjectOrientedProgramming)
6. Prerequisites:
	1. Some experience in Java, Java EE

## High Level Architecture ##
### Congratulations ###
1. Spend atleast 28 minutes everyday with this course for next week
2. Have patience

### Model 1 Architecture ###
1. Model 1: Old
	1. No servlets
		1. Browser -request-> JSPX -request->Model
		2. Model -response-> JSPX -response->Browser
	2. JSP compiles to a servlet (unmaintainable)
		1. Handled view logic
		2. Handled business logic

### Model 2 MVC Architecture ###
1. Model 2: MVC architecture
	1. Browser -Request-> ServletX (Controller) -Generates-> Model
	2. Model -available-> View
	3. View -response-> Browser
2. Model is shared by multiple servlets
	1. View - JSPs, Velocity template
3. Controller:
	1. Controlls generation of model
	2. Controlls which view to show
4. Example:

		package com.in28minutes.todo;

		import java.io.IOException;

		@WebServlet(urlPattern = "/list-todos.do")
		public class ListTodoServlet extends HttpServlet {
			private TodoService todoService = new TodoService();

			protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setAttribute("todos", todoService.retrieveTodos());
				request.getRequestDispatcher("/WEB-INF/views/list-todos.jsp").forward(request, response);
			}
		} 

	1. request - model
	2. list-todos.jsp

			<tbody>
				<c:forEach items="${todos}" var="todo">
					<tr>
						<td>${todo.name}</td>
						<td>${todo.category}</td>
						<td>&nbsp;&nbsp;<a class="btn btn-danger" href="/delete-todo.do?todo=${todo.name}&cat"
					</tr>
				</c:forEach>
			</tbody>

		1. `todos` - model

	3. `RequestDispatcher`: interface
		1. dispatches request to another resource (html, jsp, servlet)
		2. We can also include content of another resource
		3. Methods:
			1. `forward(ServletRequest request, ServletResponse response) throws ServletException, java.io.IOException` - forwards request from the servlet to another resource on the server

				![forward](forward.JPG)

			2. `include(ServletRequest request, ServletResponse response) throws ServletException, java.io.Exception` - includes content of a resource (servlet, JSP, HTML) in response

				![include](include.JPG)
		
			3. `public RequestDispatcher getRequestDispatcher(String resource);`

### Modified MVC Architecture - Front Controller ###
1. Model 2 - all java code is in Servlet
	1. View is separate
2. Front controller:
	1. Browser -Request->FrontController (single servlet)
	2. FrontController (decides which Controller to invoke) -Request-> ControllerX
	3. Controller -Generates-> Model
	3. Controller -Model, View Information-> FrontController
	4. FrontController -Redirects to-> View
	5. View -> FrontController
		1. FrontController executes View passing the model to it and generates HTML
	6. FrontController -Response-> Browser
3. Example:
	1. `org.springframework.web.servlet.DispatcherServlet` - Extends `HTTPServlet`
		1. Front controller
		2. It is the only one configured
4. DispatcherServlet
	1. Decides which controller to invoke (handler)
	2. Which view to redirect to
	3. How to identify the view
		1. Controller
	4. Provides internationalization
	5. Theme resolution - 
	6. Exception handling

### Need For Multiple Layers ###
1. Business layer
	1. Example:

			@RequestMapping(value = "/list-todos", method = RequestMethod.GET)
			public String listTodos(ModelMap model) {
				model.addAttributes("todos", service.retrieveTodos(retrieveLoggedinUserName()));
				return "list-todos";
			}

		1. `service` - business service - used to get the model ready			1. Controller calls the business layer service
2. Different layers in a web application
	1. Web layer - Controllers (decide which business object to call, which view to show, how to get the model ready, handle request and send response)
	2. Business layer - Adds logic on top of data layer
		1. How many of todos are related to Spring MVC
		2. How many of todos are pending in the next week
	3. Data layer - How to get data from database (list of todos), Update database
		1. Uses JDBC or JPA or Hibernate
	4. Integration layer
3. Multiple layers - separation of concerns
	1. Data layer is concerned about talking to a database
	2. Web layer is concerned about handling request and response
	3. Business layer is concerned about handling business logic
	4. Integration layer is concerned about talking to a another application
		1. Talking to a web service
			1. MQ - putting message and getting response

### Big Picture: Layers, Frameworks and Specifications ###
1. Different frameworks and terminologies
	1. Web - Servlet, JSP
		1. Pattern: MVC
			1. Spring MVC
			2. Struts (Filter pattern)
		2. View technologies:
			1. Velocity
			2. JSF
			3. Freemarker
			4. JSP/EL/JSTL
		3. Other frameworks
			1. AngularJS, Spring REST
			2. WebServices
	2. Business
		1. EJB
		2. Spring (reduced complexity of EJB)
		3. Other funcitionalies:
			1. Transactions
			2. Caching
			3. Auditing
	3. Data
		1. JDBC
		2. Spring Data (JDBC)
			1. Removed boilerplate code from JDBC
		3. iBatis - enhancement on top of Spring JDBC
			1. Maps queries to result set (model)
		4. Hibernate (Implementation of JPA)
	4. Integration
		1. Web Services
		2. MQ
			1. JMS

### What is a Distributed System? ###
1. The different layers may be in different machines
2. Selling point of EJB - ease of distributing business layer
3. Advantages:
	1. Many consumers for Business services (web, mobile)

### What is Coupling? ###
1. Coupling: How much a component depends on another component
	1. Class depending on another class
2. Example:

		class ShoppingCartEntry {
			public float price;
			public int quanity;
		}

		class shoppingCart {
			public ShoppingCartEntry[] items;
		}
		class Order {
			private ShoppingCart cart;
			private float salesTax;

			public Order(ShoppingCart cart, float salesTax) {
				this.cart = cart;
				this.salesTax = salesTax;
			}

			public float orderTotalPrice() { // If any other class changes, this code changes
				float cartTotalPrice = 0;
				for (int i = 0; i < cart.items.length; i++) {
					cartTotalPrice += cart.items[i].price * cart.items[i].quantity; // tight coupling
				}
				cartTotalPrice += cartTotalPrice * salesTax;				return cartTotalPrice;
			}
		}

	1. Problem: If something in a layer changes other layers - tight coupling
	2. Solution:
		1. Example:

				class ShoppingCartEntry {
					public float pricedummy;
					public int quanity;

					public float getTotalPrice() {
						return pricedummy * quantity;
					}
				}

				class CartContents {
					ShoppingCartEntry[] items;

					public float getTotalPrice() {
						float totalPrice = 0;
						for (ShoppingCartEntry item: items) {
							totalPrice += item.getTotalPrice();
						}
						return totalPrice;
					}
				}
				
				class Order {
					private CartContents cart;
					private float salesTax;

					public Order(CartContents cart, float salesTax) {
						this.cart = cart;
						this.salesTax = salesTax;
					}

					public flaot totalPrice() {
						return cart.getTotalPrice() * (1.0f + salesTax);
					}
				}

			1. Logic is distributed which is a decoupled implementation

### What is Cohesion? ###
1. Cohesion: How related the responsibilities of a class/component are
2. Example:

		package com.in28minuts.java.oops.cohesion.solution;

		class InternetDownloader {
			public void downloadFromInternet() {

			}
		}

		class DataParser {
			public void parseData(String content) {
		
			}
		}

		class DatabaseStorer {
			public void storeIntoDatabase(String data) {
			}
		}

		class DownloadAndStore {
			void doEverything() {
				new InternetDownloader().downloadFromInternet();
				new DataParser().parseData("");
				new DatabaseStorer().storeIntoDatabase("");
			}
		}

		public class CohessionExampleSolution {

		}

	1. Responsibilities are distributed and responsibilities of each class are more focused
		1. High cohesion

2. Example 2:

		package com.in28minutes.java.oops.cohesion.problem;

		class DownloadAndStore {
			void downloadFromInternet() {

			}

			void parseData() {

			}

			void storeIntoDatabase() {

			}

			void doEverything() {
				downloadFromInternet();
				parseData();
				storeIntoDatabase();
			}
		}

		public class CohessionExampleProblem {

		}

	1. Class is responsible for downloading, parsing, storing data
		1. A lot of responsibilities: reuse reduces drastically
			1. Low cohesion
3. Layers: Reason is high cohesion
	1. Web - responsible for only controlling and handling requests
		1. All controllers in this layer do similar kind of thing
	2. Business - business logic only
	3. Data - only talks to database
4. Similar components must do similar things
5. Components:
	1. Data - each component must be reusable in Data layer
6. Tip: Each class or layer ... must have simple responsibilities which are related only

### What are Cross Cutting Concerns? ###
1. Cross cutting concerns: Things related to all the layers (or components) and not restricted to a specific layer
	1. Ex: logging - log in each layer
	2. Ex: Authentication - (distributed system) BO needs
	3. Ex: Performance tracing mechanism - how much time is spent in each layer
2. Implementation: Aspect Oriented Programming

## Web Layer ##
### Introduction to Scriptlets, JSTL and EL ###
1. Web: Techologies: Scriptlets, JSTL, EL
	1. Example:

			<c:forEach items="${todos}" var="todo">
				<tr>
					<td>${todo.name}</td>
					<td>${todo.category}</td>
					<td>&nbsp;&nbsp;<a class="btn btn-danger" href="/delete-todo.do?todo=${todo.name}&cat"
				</tr>
			</c:forEach>

		1. Example: Scriptlet (Java code inside JSP) - bad practice - don't write business logic inside JSP - unmaintainable

				<%
					List<Todo> todos = (List<Todo>)request.getAttribute("todo");
					for (Todo todo: todos) {
						out.println(todo.getName());
						out.println(todo.getCategory());
					}
				%>
		
			1. Can be disabled
		2. Velocity - almost does not allow Java code
		3. JSTL - programming constructs are provided (looping. switch, internationalization, manipulating XML documents (Business logic - avoid), tags for accessing databases (avoid), commonly used function)
			1. JSP standard tag library
				1. Look at tld (tag library description) for details
					1. ctrl + click the tag
					2. JSTL oracle documentation
				2. JSTL encapsulates core functionality common to many JSP applications
		4. EL - expression language - `"${todos}"`
			1. To get values from session or request
				1. `todo` is a bean
			2. EL internally translates to a method call
	2. Example: JSP from spring mvc project
		
			<form:form method="post" commandName="todo">
				<form:hidden path="id" />

				<fieldset class="form-group">
					<form:label path="desc">Description</form:label>
					<form:input path="desc" type="text" class="form-control" required="required" />
					<form:errors path="desc" cssClass="text-warning" />
				</fieldset>

		1. tags are from spring form tag library
	3. Struts tag library:

			<%@ include file="../common/header.jspf"%>
			<%@ include file="../common/navigation.jspf"%>
			<div class="container">
				<s:form action="edit-todo" cssClass="table table-stripped table-...">
					<s:hidden name="todo.id" />
					<s:textfield label="Description" name="todo.desc" />
					<s:textfield label="Target Date" name="todo.targetDate" />
					<s:submit class="btn btn-success" />
				</s:form>
			</div>

		1. struts-tags.tld

### Front Controller and Application Controller Patterns ###
1. Web layer patterns:
	1. Front controller
		1. Accepts all requests from browser
		2. Sends requests to aplication controller
	2. Application controller
		1. Todo controller
		2. Welcome controller
		3. Function: Calls business logic layer and generates model
			1. Todos are fetched from database into model
			2. controller indicates to frontcontroller the view to show
2. Example:

		<servlet>
			<servlet-name>dispatcher</servlet-name>
			<servlet-class>
				org.springframework.web.servlet.DispatcherServlet
			</servlet-class>
			<init-form>
				<param-name>contextConfigLocation</param-name>
				<param-value>/WEB-INF/todo-servlet.xml</param-value>
			</init-form>
		</servlet>
		<servlet-mapping>
			<servlet-name>dispatcher</servlet-name>
			<url-pattern>/</url-pattern>
		</servlet-mapping>

	1. WelcomeController.java

			@Controller
			public class WelcomeController {
				@RequestMapping(value = "/", method = ...)
				public String showLoginPage(Model model) {
					model.put("name", "in28Minutes");
					return "welcome";
				}
			}

	2. LogoutController.java

			@Controller
			public class LogoutController {
				@RequestMapping(value = "/logout", method = RequestMethod.GET)
				public String logout(HttpServletRequest request, HttpServletResponse response) {
					Authentication auth = SecurityContextHolder.getContext().getAuthentication();

					if (auth != null) {
						new SecurityContextLogoutHandler().logout(request, response);
						request.getSession().invalidate();
					}
				}
			}

	3. TodoController.java

			@Controller
			public class TodoController {
				...
				@RequestMapping(value = "/list-todos", method = RequestMethod.GET)
				public String listTodos(ModelMap model) { // model
					model.addAttribute("todos", service.retrieveTodos(retrieveLoggedinUserName())); // calling business service
					return "list-todos"; // translates to WEB-INF/list-todos.jsp
				}
			}

### View Helper - Java EE Pattern ###
1. Business logic:
	1. Calculating the amount of discount after all items are present in shopping cart
2. View logic:
	1. How to format date
	2. How to display currency to a user (based on country)
	3. How to show list of items
	4. How to validate fields
4. View helpers: tag libraries - help bind data to java objects, loop through
	1. JSTL
		1. Formatting tags say:

				<fmt:formatDate pattern="dd/MM/yyyy" value="${todo.targetDate}" />

	2. Spring Tags
	3. makes it easier to write views

### Composite View - Java EE Pattern ###
1. Responsive web apps
	1. Layout may change with size
2. Composite view pattern
	1. Separating the layout from actual content
	2. Example:
		1. Single page - composed of Header, footer, content, navigation
			1. Each component can be dynamically modified
		2. Implementation:
			
				<%@ include file="common/header.jspf"%>
				<%@ include file="common/navigation.jspf"%>

				...
				<%@ include file="common/footer.jspf"%>

			1. Conditions to render them can be incorporated
			2. To handle this
				1. Tiles - takes care of layout
	3. Composite pattern:
		1. Page would just have the content
		2. Layout will be taken care of by frameworks like tiles
		3. Separates management of content from the layout

### Context Object - Java EE Pattern ###
1. Context object web pattern:
	1. Decouples software component from protocol specific implementation
		1. HTTP Reqeusts:
			2. Servlet API: If Controller is tied to the servlet API (which handles HTTP requests), we cannot use the Servlet for say mobile requests
				1. Android: Protocol may be different
	2. It avoids tight coupling between presentation layer and servlet API
2. Example:

		@RequestMapping(value = "/add-todo", method = RequestMethod.POST)
		public String addTodo(ModelMap model, @Valid Todo todo, BindingResult...)
			if (result.hasErrors()) {
				return "todo";
			}
			service.addTodo(retrieveLoggedinUserName(), todo.getDesc(), new ..., false);
			model.clear();
			return "redirect:list-todos";
		}

	1. HTTP request comes to Dispatcher Servlet
		1. Converts to and binds to `todo` model object
	2. Context object: `todo`
	3. Response is not directly put into `response` object but put into `model` (not tied to session or response object)
3. Context objects Examples:
	1. Command Object - to bind forms
	2. ModelMap - binds controllers to views

### Intercepting Filter - Java EE Pattern ###
1. Filter pattern:
	1. Example: For allowing only authenticated users
		1. Requests are intercepted using filters to check if user is authenticated
			1. If user is authenticated, filter would allow or else user is redirected to login page
	2. Struts is based on intercepting filter
	3. Spring security implemented using filter
2. Example:

		<filter>
			<filter-name>springSecurityFilterChain</filter-name>
			<filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
		</filter>

		<filter-mapping> <!-- Every request should be intercepted by this -->
			<filter-name>springSecurityFilterChain</filter-name>
			<url-pattern>/*</url-pattern>
		</filter-mapping>

3. Example: Java Servlets and JSP (used instead of in web.xml)

		@WebFilter(urlPatterns = "*.do") // intercepts any requests that ends with do
		public class LoginRequiredFilter implements Filter {
			...
			@Override
			public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
				HttpServletRequest request = (HttpServletRequest) servletRequest...
				
				if (request.getSession().getAttribute("name") != null) {
					chain.doFilter(servletRequest, servletResponse);
				} else {
					request.getRequestDispatcher("/login.do").forward(servletRequest, servletResponse);
				}
			}
		}

4. Example: Struts:
	
		<display-name>To do List</display-name>

		<filter>
			<filter-name>struts2</filter-name>
			<filter-class>org.apache.struts2.dispatcher.ng.filter.Struts.filter.StrutsPrepareAndExecuteFilter</filter-class>
		</filter>

5. Very frequently used pattern (to pre-process and redirect requests)

## Business Layer ##
### Domain Model ###
1. Technologies used:
	1. Domain Model
		1. Helps build a common language between different stake holders in a web app development
		2. Stake holders: Business, architects, BAs, Testers, Developers
		3. All stake holders must use the same language
		4. Good object oriented practice
		5. Implementation:
			1. Relationships between different objects are represented
			2. Business logic is directly present in the domain model
		6. Example: 
			
				class Order {
					private CartContents cart;
					private float salesTax;
					...
				}

			1. Order has logic about cart and sales tax
			2. Order has logic to apply sales tax on the total price of cart
			3. Cart decides the total price of the cart
				1. It has list of cart items
				2. Returns total price
			4. ShoppingCartEntry has price and quantity and calcualtes it's own price
		7. Domain model consists of objects and their relationships
			1. Business logic associated with the object is present in the object itself
				1. low coupling

### EJB ###
1. EJB
	1. Distributed Components
		1. Business layer can be deployed as a separate component on a different system (say)
		2. EJB3 - EJBs are simpler now
		3. Spring though is most popular but EJB is still used
		4. EJBs are POJOs
	2. EJB takes over transaction management
		1. If say update to service fails, I have to revert changes made to the database

### JTA ###
1. JTA
	1. Java Transaction API
		1. Multiple steps are executed as an atomic operation or not at all
	2. We can specify boundary of a transaction
	3. Today: EJB (for distributed systems) or Spring with AOP
2. Patterns used:

### Facade - Java EE Pattern ###
1. Facade
	1. If a business layer is on a distributed system it may mean multiple round trips
		1. Account details
		2. User details
	2. Facade - on top of business layer which kinds of gets all the information that a screen needs, combines it and sends it as one object
		1. Better performance
		2. Reduces coupling
			1. If no facade: If there is a change in business layer, web layer is impacted
					1. Just change the facade
		3. It can act as a transaction boundary around facade
			1. If something fails we can revert everything that facade did
	
### DTO VO - Java EE Pattern ###
2. DTO/VO
	1. DTO - Data Transfer Object
		1. Object returned by Facade (summary of data needed by the view)
		2. No business logic
		3. Only transfers information
	2. VO - Value Object (DTO)

### Service Locator - Java EE Pattern ###
1. Service location: Used to identify a distributed resourse or JNDI resourse
	1. Business layer or Data layer use this service
2. Modern implementation: Spring looks up and wires it up using DI

## Data & Integration Layers ##
### JMS, JAX-WS, JAX-RS and JAXB ###
1. Terminologies:
	1. JAXB
	2. JAX-RS
	3. JAX-WS
	4. JMS
	5. JNDI
	6. JDBC
	7. ORM
	8. JPA
2. Two kinds of things
	1. Talking to Database
	2. Talking to External system
		1. Queue
			1. JMS (Java Messaging Service) - API that defines how we can communicate over a queue
		2. HTTP Web services
			1. Using XML
				1. JAXB:
					1. Objects are converted to XML
					2. XML are converted to Objects
				2. JAX-WS
					1. For developing XML web service
					2. Java API for XML Web Services: Exposes XML web service 
			2. Using JSON
				1. JAX-RS
					1. Java API for RESTful Web Services
					2. Also specifies how a consumer can be defined

### JNDI, JDBC, ORM and JPA ###
1. JNDI - Java Naming and Directory Interface
	1. To connect to a database
		1. JNDI provides a way to give a name to the resource and look it up
			1. `jdbc/mydatabaseconnection` - not directly coupled to database
		2. JNDI looks up the object based on the name and returns it
	2. For queues as well
2. JDBC:
	1. Run query and get results and map it to Java Object
3. ORM:
	1. Object Relational Mapping
		1. Relations are tables
		2. Java has objects
		3. ORM maps objects to Relations and vice-versa
	2. Example:
		1. Hibernate
	3. Reason? Java programmers don't have to know Database specific queries
		1. Java developers just have to work with objects and the ORM framework takes care of mapping and manipulating the database
4. JPA: Java Persistence API
	1. Specification for ORM API
	2. JPQL: Java Persistence Query Language
		1. Criteria API: Just Java code instead of queries
	3. Hibernate is an implementation of JPA
	4. Helps us switch to other implementations

### Data Access Object - Java EE Pattern ###
1. DAO: Pattern
	1. Responsible for
		1. Lookup on database (Uses service provider or is connection is injected into DAO (Spring))
		2. How to do query
			1. How to map results back to objects
		3. DAO is simple in JPA
2. Example: Using Spring JDBC

		class TodoMapper implements RowMapper<Todo> {
			public Todo mapRow(ResultSet rs, int rowNum) throws SQLException {
				Todo todo = new Todo();
				todo.setId(rs.getInt(1));
				todo.setDescription(rs.getString(2));
				todo.setDone(rs.getBoolean(3));
				return todo;
			}
		}
	
		public class TodoDataServiceSpringJdbc {
			private static final String SELECT_ALL_TODOS = "SELECT * FROM TODO";
			private static final String INSERT_TODO_QUERY = "INSERT INTO TODO(DESCRIPTION, IS_DONE) VALUES (?, ?)";
			private static final String DELETE_TODO_QUERY = "DELETE FROM TODO WHERE ID=?";

			HsqlDatabase db = new HsqlDatabase();
			JdbcTemplate jdbcTemplate = new JdbcTemplate(new SingleConnectionDataSource(db.conn, false));
			public static Logger logger = logManager.getLogger(TodoDataServiceSpringJdbc.class);
			
			public void insertTodos(List<Todo> todos) {
				for (Todo todo: todos) {
					insertTodo(todo);
				}
			}

			private void insertTodo(Todo todo) {
				jdbcTemplate.update(INSERT_TODO_QUERY, todo.getDescription(), todo.isDone());
			}
			...
			public List<Todo> retrieveAllTodos() throws SQLException {
				return jdbcTemplate.query(SELECT_ALL_TODOS, new TodoMapper());
			}
		}

## Data & Integration Layers ##
### Data Access Object ###
1. Example: JPA

		@Repository
		public class StudentRepository {

			@PersistenceContext
			private EntityManager entityManager;

			public Student getStudent(final long id) {
				return entityManager.find(Student.class, id);
			}

			public Student insertStudent(Student student) {
				if (student.getPassport() != null) {
					entityManager.merge(student.getPassport());
				}
				return entityManager.merge(student);
			}

			public Student udpateStudent(Student student) {
				entityManager.merge(student);
				return student;
			}

			public Student retrieveStudentFrom(String string) {
				return null;
			}

			public List<Student> getAllStudents() {
				Query query = entityManager.createNamedQuery("find all students");
				return query.getResultList();
			}
		}

	1. `entityManager`, JPA calls are important
2. Example: Actual Mapping

		@Entity
		@Table(name = "Student")
		@NamedQuery(query = "select s from Student s", name = "find all students")
		public class Student {
			@Id
			@GeneratedValue(strategy = GenerationType.IDENTITY)
			private long id;

			private String name;

			@OneToOne
			private Passport passport;

			private String email;

			public long getId() {
				return id;
			}

			public void setId(long id) {
				this.id = id;
			}
			...
		}

3. DAO: Simple class which enables easy communication with database
	1. Queries, updates
	2. Input: What data we want to store in database

### Service Activator - Java EE Pattern ###
1. Long running tasks can be run asynchronously
	1. Service Activator pattern:
		1. Kicks off a job
		2. Ones job completes, notification is sent
2. Implementations:
	1. Threads
	2. JMS
	3. Job form: Pool of threads look at pending jobs and run them and put the result back
		1. Database table is entered with job

## Other Significant Things You would need to Know ##
### Overview ###
1. AOP
2. DI
3. Caching

### Caching ###
1. Caching:
	1. Caching information in user session
	2. Cache something returned from Business layer
	3. Cache in Data layer (Hibernate cache)
	4. Distributed cache: Database results
2. Cache stores data
	1. In future, if we need data, we can get it from cache
	2. Improves performance
		1. Depends on how frequently data is changed
			1. Ex: List of states in a country do not usually change
	3. Hibernate cache:
		1. First level cache
		2. Second level cache
		3. EH cache
		4. Terrakota: Distributed cache
3. Example: Cluster of systems
	1. Distributed cache
		1. Looked up first for data (from all the systems)
		2. If not found, real source is looked for

### Aspect Oriented Programming (AOP) ###
1. AOP: Aspect Oriented Programming
	1. Used for cross cutting concerns
		1. Logging
		2. Performance monitoring
		3. Security
2. Aspect (What to implement)
	1. Logging
3. Advice (What specifically to do)
	1. Actual activity of logging
4. Pointcut (Which methods to intercept)
5. Example:

		@Configuration
		@EnableAspectJAutoProxy
		@ComponentScan(basePackage = { "com.in28mintes.example.spring.business.aop" })
		class SpringContextAOP {
		}

		@Aspect
		@Component
		class MyAspect {

			// Before method is called
			@Before("execution(* com.in28mintes.example.spring.business.aop.HiByeService.*(..))")
			public void before(JoinPoint joinPoint) {
				System.out.print("Before ");
				System.out.print(joinPoint.getSignature().getName() + " called with ");
				System.out.println(Arrays.toString(joinPoint.getArgs()));
			}

			// After method returns
			@AfterReturning(pointcut = "execution(* com.in28mintes.example.spring.business.aop.HiByeService.*(..))", returning = "result")
			public void after(JoinPoint joinPoint, Object result) {
				System.out.print("After ");
				System.out.print(joinPoint.getSignature().getName());
				System.out.println(" result is " + result);
			}
		}

1. Increases modularity by separating cross cutting concerns from business logic
	1. AOP implemented as a separate module

### Dependency Injection ###
1. Framework provides what we need
2. Example:

		@Controller
		@SessionAttributes("name")
		public class TodoController {

			private Log logger = LogFactory.getLog(ExceptionController.class ...)
	
			@Autowired	// Spring framework injects service
			TodoService service;
			...

	1. Spring can inject any implementation of `TodoService`
3. Example: DAO

		@PersistenceContext	// Injected by Spring and JPA
		private EntityManager entityManager;

	1. Flexibility: Real database or in memory database, the above code works
4. Contexts and Dependency Injection
	1. Without using Spring framework

## Congratulations ##
### Bonus Lecture: Our Best Selling Courses ###
1. [http://eepurl.com/bOjulL](http://eepurl.com/bOJulL)

### Next Steps ###
