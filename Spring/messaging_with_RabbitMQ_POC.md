# Messaging with RabbitMQ #
## Project ##
1. App that publishes a message using Spring AMQP's `RabbitTemplate` and subscribes to message on POJO using `MessageListenerAdapter`

## Set up the RabbitMQ Broker ##
1. [Download RabbitMQ](https://www.rabbitmq.com/download.html)
2. Or `brew install rabbitmq` **(M)**
3. Launch using default settings:
	1. `rabbitmq-server`
4. Launching using Docker compose:
	1. `docker-compose.yml`

			rabbitmq:
				image: rabbitmq:management
				ports:
					- "5672:5672"
					- "15672:15672"

		1. Run: `docker-compose up`

## Starting with Spring Initializr ##
1. Spring Starter Project (In STS)
	1. Dependencies:
		1. Spring for RabbitMQ

## Constructing a RabbitMQ Message Receiver ##
1. A Receiver to respond to published messages
2. `src/main/java/com.example.messagingrabbitmq/Receiver.java`

		package com.example.messagingrabbitmq;
		
		import java.util.concurrent.CountDownLatch;
		import org.springframework.steriotype.Component;
		
		@Component
		public class Receiver {
			private CounDownLatch latch = new CountDownLatch(1);
			
		public void receiveMessage(String message) {
				System.out.println("Received <" + message + ">");
				latch.countDown(); // Signals that message is received (not for production apps)
			}
			
			public CountDownLatch getLatch() {
				return latch;
			}
		}

## Register the Listener and Send a Message ##
1. `RabbitTemplate`
	1. Can be used to send and receive messages with RabbitMQ
	2. Configuration:
		1. Configure message listener container
		2. Declare queue, exchange, binding between queue and exchange
		3. Configure component to send messages (to test listener)
2. Automation: The following are automatically created
	1. Connection factory
	2. `RabbitTempalate`
3. `Receiver` needs to be registered with listener container (to receive messages)
	1. Connection factory drivers both letting them to connect to RabbitMQ Server
		1. Sending messages
		2. Listener receiving messages
2. Application class: `src/main/java/com.example.messagingrabbitmq/MessaginRabbitApplication.java`

		@SpringBootApplication
		public class MessagingRabbitmqApplication {
			static final String topicExchangeName = "spring-boot-exchange";
			
			static final String queueName = "spring-boot";
			
			@Bean
			Queue queue() {
				return new Queue(queueName, false);
			}
			
			@Bean
			TopicExchange exchange() {
				return new TopicExchange(topicExchangeName);
			}
			
			@Bean
			Binding binding(Queue queue, TopicExchange exchange) {
				return BindingBuilder.bind(queue).to(exchange).with("foo.bar.#");
			}
			
			@Bean
			SimpleMessageListenerContainer container(ConectionFactory connectionFactory, MessageListenerAdapter listenerAdapter) {
				SimpleMessageListenerContainer container = new SimpleMessageListenerContainer();
				container.setConnectionFactory(connectionFactory);
				container.setQueueNames(queueName);
				container.setMessageListener(listenerAdapter);
				return container;
			}
			
			@Bean
			MessageListenerAdapter listenerAdapter(Receive receiver) {
				return new MessageListenerAdapter(receiver, "receiveMessage");
			}
			
			public static main(String[] args) throws InterruptedException {
				SpringApplication.run(MessagingRabbitmqApplication.class, args).close();
			}
		}
		
	1. `@SpringBootApplication` adds
		1. `@Configuration` - Marks the class to be a source of bean definitions for application context
		2. `@EnableAutoConfiguration` - Tells Boot to add beans based on
			1. Classpath settings
				1. Example: If `spring-webmvc` is on classpath, the annotation flags application as web application and activates key behaviours such as setting up `DispatcherServlet`
			2. Other beans
			3. Property settings
		3. `@ComponentScan` - Tells Boot to look for components, configurations, services in `com/example` package (to allow it to find controllers)
	2. `SpringApplication.run()` - Used to launch the application
	3. `listenerAdapter()` - The bean in the method is registered as message listener in container (`container()`)
		1. The adapter listens for messages in `spring-boot` queue
		2. `MessageListenerAdapter` wraps `Receiver` since it is a POJO.
			1. `"receiveMessage"` - this method is invoked for receiving messages

## Send a Test Message ##
1. `CommandLineRunner` **(M)** is used:

		@Component
		public class Runner implements CommandLineRunner {
			private final RabbitTemplate rabbitTemplate;
			private final Receiver receiver;
			
			// @Autowired - not required anymore for constructor injection
			public Runner(Receiver receiver, RabbitTemplate rabbitTemplate) {
				this.receiver = receiver;
				this.rabbitTemplate = rabbitTemplate;
			}
			
			@Override
			public void run(String... args) throws Exception {
				System.out.println("Sending message...");
				
				rabbitTemplate.convertAndSend(MessagingRabbitmqApplication.topicExchangeName, "foo.bar.baz", "Hello from RabbitMQ!");
				receiver.getLatch().await(10000, TimeUnit.MILLISECONDS);
			}
		}
	
	1. Differences between JMS queues and AMQP queues
		1. Semantics:
			1. JMS sends queued messages to only one consumer
			2. AMQP queues do the same thing but AMQP producers do not send messages directly to queues
				1. Message is sent to exchange
				2. Message can then go to single queue or fan out to multiple queues
					1. Emulates the concept of JMS topic
	2. `queue()` - generates and AMQP queue
	3. `exchange()` - generates a topic exchange
	4. `binding()` - binds `queue` and `exchange` together
	5. `Queue`, `TopicExchange` and `Binding` need to be defined as top-level beans for Spring AMQP to setup properly
	6. `foo.bar.#` - Routing key
		1. Messages sent with routing key that begins with `foo.bar.` are routed to this queue

## Run the Application ##
1. `Runner` bean is automatically run
	1. It retrieves `RabbitTemplate` from application context and sends `Hello from RabbitMQ!` on `spring-boot` queue

## Build an Executable JAR ##
1. `./mvnw spring-boot:run`
2. `./mvnw clean package`
	1. `java -jar target/gs-messaging-rabbitmq-0.1.0.jar`

## Summary ##
1. [Spring and RabbitMQ - More](https://docs.spring.io/spring-amqp/reference/#_introduction)