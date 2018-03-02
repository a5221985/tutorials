# Hibernate Logging #
## pom.xml ##

		<dependencies>
			...
			<!-- https://mvnrepository.com/artifact/org.slf4j/slf4j-log4j12 -->
			<dependency>
				<groupId>org.slf4j</groupId>
				<artifactId>slf4j-log4j12</artifactId>
				<version>1.7.25</version>
				<scope>test</scope>
			</dependency>
			<!-- https://mvnrepository.com/artifact/log4j/log4j -->
			<dependency>
				<groupId>log4j</groupId>
				<artifactId>log4j</artifactId>
				<version>1.2.17</version>
			</dependency>
		</dependencies>

## log4j.properties ##
1. `src/main/resources/log4j.properties`

		log4j.appender.stdout=org.apache.log4j.ConsoleAppender
		log4j.appender.stdout.Target=System.out
		log4j.appender.stdout.layout=org.apache.log4j.PatternLayout
		log4j.appender.stdout.layout.ConversionPattern=%d{HH:mm:ss,SSS} %-5p [%c] - %m%n
		
		log4j.rootLogger=info, stdout
		
		# basic log level for all messages
		log4j.logger.org.hibernate=info

		# SQL statements and parameters
		log4j.logger.org.hibernate.SQL=debug
		log4j.logger.org.hibernate.type.descriptor.sql=trace

## Logger ##

		public class Main {
			...
			private static final Logger logger = Logger.getLogger(Main.class);

			public static void main(String[] args) {
				...
				logger.info(...);
				logger.error(...);
				logger.debug(...);
				...
			}

## Output ##
1. Console
2. C:

		