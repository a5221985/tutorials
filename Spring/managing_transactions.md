# Managing Transactions #
1. Wrapping DB operations with non-intrusive transactions

## Project ##
1. JDBC application where you make db operations transactional without having to write specialized JDBC code

## Starting with Spring Initializr ##
1. Dependencies:
	1. Data JDBC
	2. H2 Database

## Defining a Booking Service ##
1. `BookingService` - Used to book people into system by name

		@Component
		public class BookingService {
			private final static Logger logger = LoggerFactory.getLogger(BookingService.class);
			
			private final JdbcTemplate jdbcTemplate;
			
			public BookingService(JdbcTemplate jdbcTemplate) {
				this.jdbcTemplate = jdbcTemplate;
			}
			
			@Transactional
			public void book(String... persons) {
				for (String person : persons) {
					logger.info("Booking " + person + " in a seat...");
					jdbcTemplate.update("insert into Bookings(FIRST_NAME) values (?)", person);
				}
			}
			
			public List<String> findAllBookings() {
				return jdbcTemplate.query("select FIRST_NAME from BOOKINGS", (rs, rowNum) -> rs.getString("FIRST_NAME"));
			}
		}
		
	1. `JdbcTemplate` **(M)** - Used to do database interactions
	2. `book` - used to book multiple people
		1. Loops through list of people:
			1. For each person, inserts the person into `BOOKINGS` table using `JdbcTemplate`
		2. `@Transactional` - any failure causes entire operation to roll back to its previous state and to re-throw original exception
			1. => None of the people are added to `BOOKINGS` if one person fails to be added
	3. `findAllBookings` - used to query database
		1. Each row fetched is converted to a `String`
		2. All rows are assembled into a `List<String>`

## Build an Application ##
1. Spring boot detects `spring-jdbc` and `h2` on classpath and automatically constructs `DataSource` and `JdbcTemplate`	1. `DataSourceTransactionManager` is also created
		1. This component intercepts method annotated with `@Transactional` (`book`)
2. `BookingService` is detected by classpath scanning
3. Initializing schema on startup:
	1. `src/main/resources/schema.sql`

			drop table BOOKINGS if exists;
			create table BOOKINGS(ID serial, FIRST_NAME varchar(5) NOT NULL);
			
	2. `CommandLineRunner` injects `BookingService` and showcases various transactional use cases
4. AppRunner.java

		@Component
		class AppRunner implements CommandLineRunner {
			private final static Logger logger = LoggerFactory.getLogger(AppRunner.class);
			
			private final BookingService bookingService;
			
			public AppRunner(BookingService bookingService) {
				this.bookingService = bookingService;
			}
			
			@Override
			public void run(String... args) throws Exception {
				bookingService.book("Alice", "Bob", "Carol");
				Assert.isTrue(bookingService.findAllBookings().size() == 3, "First booking should work with no problem");
				logger.info("Alice, Bob and Carol have been booked");
				try {
					bookingService.book("Chris", "Samuel");
				} catch (RuntimeException e) {
					logger.info("v--- The following exception is expected because 'Samuel' is too " +
						"big for the DB ---v");
					logger.error(e.getMessage());
				}
				
				for (String person : bookingService.findAllBookings()) {
					logger.info("So far, " + person + " is booked.");
				}
				logger.info("You shouldn't see Chris or Samuel. Samuel violated DB constraints, " +
					"and Chris was rolled back in the same TX");
				Assert.isTrue(bookingService.findAllBookings().size() == 3, "'Samuel' should have triggered a rollback");
				
				try {
					bookingService.book("Buddy", null);
				} catch (RuntimeException e) {
					logger.info("v--- The following exception is expected because null is not " + 
						"valid for the DB ---v");
					logger.error(e.getMessage());
				}
				
				for (String person : bookingService.findAllBookings()) {
					logger.info("So far, " + person + " is booked.");
				}
				logger.info("You shouldn't see Buddy or null. null violated DB constraints, and " +
					"Buddy was rolled back in the same TX");
				Assert.isTrue(bookingService.findAllBookings().size() == 3,
					"'null' should have triggered a rollback");
			}
		}
		
	1. `BOOKINGS` - table that has two constraints on `first_name`
		1. Names cannot be longer than five characters
		2. Names cannot be null

## Summary ##