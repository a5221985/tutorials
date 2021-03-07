# Integrating Data #
1. App to
	1. Retrieve data from RSS Feed (Spring Blog)
	2. Manipulate data
	3. Write data to a file
2. Spring Integration XML config is used (traditional)
3. Java config can also be used
4. DSL can also be used (with and without Lambda expressions)

## Project ##
1. Flow with Spring integration using traditional XML config

## Starting with Spring Initializr ##
1. Dependency required: Spring Integration

## Add to the Build Files ##
1. Two dependencies required:
	1. `spring-integration-feed`
	2. `spring-integration-file`

			<dependency>
				<groupId>org.springframework.integration</groupId>
				<artifactId>spring-integration-feed</artifactId>
			</dependency>
			<dependency>
				<groupId>org.springframework.integration</groupId>
				<artifactId>spring-integration-file</artifactId>
			</dependency>

## Define an Integration Flow ##
1. Actions:
	1. Reads blog posts from the RSS feed at spring.io
	2. Transforms them into an easily readable `String` consisting of the post title and URL for the post
	3. Appends that `String` to the end of a file `/tmp/si/SpringBlog`
2. Spring XML config (containing Spring Integration's XML namespaces)
	1. Namespaces available:
		1. core
		2. feed (dependency added to get this)
		3. file (dependency added to get this)
3. `src/main/resources/integration/integration.xml`

		<?xml version="1.0" encoding="UTF-8"?>
		<beans xmlns="http://www.springframework.org/schema/beans"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xmlns:int="http://www.springframework.org/schema/integration"
			xmlns:file="http://www.springframework.org/schema/integration/file"
			xmlns:feed="http://www.springframework.org/schema/integration/feed"
			xsi:schemaLocation="http://www.springframework.org/schema/integration/feed https://www.springframework.org/schema/integration/feed/spring-integration-feed.xsd
				http://www.springframework.org/schema/beans https://www.springframework.org/schema/beans/spring-beans.xsd
				http://www.springframework.org/schema/integration/file https://www.springframework.org/schema/integration/file/spring-integration-file.xsd
				http://www.springframework.org/schema/integration https://www.springframework.org/schema/integration/spring-integration.xsd">
				<feed:inbound-channel-adapter id="news" url="https://spring.io/blog/atom" auto-startup="${auto.startup:true}">
					<int:poller fixed-rate="5000"/>
				</feed:inbound-channel-adapter>
				
				<int:transformer
					input-channel="news"
					expression="payload.title + ' @ ' + payload.link + '#{systemProperties['line.separator']}'"
					output-channel="file"/>
					
				<file:outbount-channel-adapter id="file"
					mode="APPEND"
					charset="UTF-8"
					directory="/tmp/si"
					filename-generator-expression="'${feed.file.name:SpringBlog}'"/>
		</beans>
		
	1. Three integration elements:
		1. `<feed:inbound-channel-adapter>` - inbound adapter that retrieves posts (one per poll)
			1. Polls every five seconds
			2. Posts are placed into channel called `news` (adapter ID specifies it)
		2. `<int:transformer>` - transforms entries `com.rometools.rome.feed.synd.SyndEntry` in `news` channel
			1. Extracts:
				1. `payload.title`
				2. `payload.link`
			2. Concatenates both into readable `String`
			3. Adds a newline
			4. `String` is sent to output channel
		2. `<file:outbound-channel-adapter>` - Outbound channel adapter writes content from its channel (`file`) to a file
			1. Appends anything in `file` channel to a file at `/tmp/si/SpringBlog`
		3. `auto-startup` - discussed next
			1. `true` - Posts are fetched when application starts
		4. `filename-generator-express="'{feed.file.name:SpringBlog}'"`
			1. `SpringBlog` - default
			2. `feed.file.name` - default can be overridden

## Make the Application Executable ##
1. IntegrationApplication.java

		@SpringBootApplication
		@ImportResource("/integration/integration.xml")
		public class IntegrationApplication {
			public static void main(String[] args) throws Exception {
				ConfigurableApplicationContext ctx = new SpringApplication(IntegrationApplication.class).run(args);
				System.out.println("Hit Enter to terminate");
				System.in.read();
				ctx.close();
			}
		}

## Run the Application ##
1. `/tmp/si/SpringBlog` will get populated
	1. `tail -f /tmp/si/SpringBlog`

## Testing ##
1. FlowTests.java

		@SpringBootTest({ "auto.startup=false", // we don't want to start the real feed
							"feed.file.name=Test" }) // use a different file
		public class FlowTests {
			@Autowired
			private SourcePollingChannelAdapter newsAdapter;
			
			@Autowired
			private MessageChannel news;
			
			@Test
			public void test() throws Exception {
				assertThat(this.newsAdapter.isRunning()).isFalse();
				SyndEntryImpl syndEntry = new SyndEntryImpl();
				syndEntry.setTitle("Test Title");
				syndEntry.setLink("http://characters/frodo");
				File out = new File("/tmp/si/Test");
				out.delete();
				assertThat(out.exists()).isFalse();
				
				this.news.send(MessageBuilder.withPayload(syndEntry).build());
				assertThat(out.exists()).isTrue();
				BufferedReader br = new BufferedReader(new FileReader(out));
				String line = br.readLine();
				assertThat(line).isEqualTo("Test Title & http://characters/frodo");
				br.close();
				out.delete();
			}
		}
		
	1. `auto.startup` is set to `false`
		1. Since it is not a good idea to rely on network connection for tests (CI environment especially)
			1. Feed adapter is stopped with this property
			2. `SyndEntry` is injected for processing by rest of the flow
		2. `feed.file.name` is set to `test` (different file)
		3. Then:
			1. Verifies that adapter is stopped
			2. Constructs a test `SyndEntry`
			3. Deletes test output file (if it is present)
			4. Sends message
			5. Verifies that file exists
			6. Reads file and verifies that data is as expected