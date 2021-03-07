# Scheduling Tasks #
1. Scheduling tasks with Spring

## Project ##
1. App that prints current time every 5 seconds using `@Scheduled`

## Starting with Spring Initializr ##
1. No dependencies

### Adding the `awaitility` Dependency ###

		<dependency>
			<groupId>org.awaitility</groupId>
			<artifactId>awaitility</artifactId>
			<version>3.1.2</version> <!-- latest version doesn't work for this tutorial -->
			<scope>test</scope>
		</dependency>

## Construct a Scheduled Task ##
1. ScheduledTasks

		@Component
		public class ScheduledTasks {
			private static final Logger log = LoggerFactory.getLogger(ScheduledTasks.class);
			
			private static final SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
			
			@Scheduled(fixedRate = 5000)
			public void reportCurrentTime() {
				log.info("The time is now {}", dateFormat.format(new Date()));
			}
		}
		
	1. `Scheduled` - annotation
		1. It defines when a particular method runs
		2. `fixedRate` - interval between method invocations (from start time of each invocation)
			1. [Other options](https://docs.spring.io/spring/docs/current/spring-framework-reference/html/scheduling.html#scheduling-annotation-support-scheduled)
				1. `fixedDelay` - interval from completion of the task
			2. `@Scheduled(cron="...")` - for more sophistication

## Enable Scheduling ##
1. Main class:

		@SpringBootApplication
		@EnableScheduling // **(M)**
		public class SchedulingTasksApplication {
			public static void main(String[] args) {
				SpringApplication.run(SchedulingTasksApplication.class);
			}
		}
		
	1. `@EnableScheduling` - Ensures that a background task executor is created (required for scheduling)