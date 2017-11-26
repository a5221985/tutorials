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
