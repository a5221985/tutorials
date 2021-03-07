# Messaging with JMS #
1. Publishing and subscribing to messages using JMS broker

## Project ##
1. `JmsTemplate` - used to post single message
2. `@JmsListener` - used to subscribe to the message

## Construct a Message Receiver ##
1. Messages can be published to a POJO
2. Messages can be sent over a JMS message broker
3. Email.java

		public class Email {
			private String to;
			private String body;
			
			public Email() {}
			
			public Email(String to, String body) {
				this.to = to;
				this.body = body;
			}
			
			// getters and setters & toString
		}
		
4. Message receiver:

		@Component
		public class Receiver {
			@JmsListener(destination = "mailbox", containerFactory = "myFactory")
			public void receiveMessage(Email email) {
				System.out.println("Received <" + email + ">");
			}
		}
		
	1. `JmsListener` - defines
		1. `Destination` - name of destination, the method should listen to
		2. `JmsListenerContainerFactory` - reference to this which is used to construct message listener container
			1. Optional
				1. Used to customize container (Spring boot registers a default factory)

## Send and Receive JMS Messages with Spring ##
1. Application.java

		@SpringBootApplication
		@EnableJms
		public class Application {
			@Bean
			public JmsListenerContainerFactory<?> myFactory(ConnectionFactory connectionFactory, DefaultJmsListenerContainerFactoryConfigurer configurer) {
				DefaultJmsListenerContainerFactory factory = new DefaultJmsListenerContainerFactory();
				// This provides all boot's default to this factory, including the message converter
				configurer.configure(factory, connectionFactory);
				// You could still override some of Boot's default if necessary.
				return factory;
			}
			
			@Bean // Serialize message content to json using TextMessage
			public MessageConverter jacksonJmsMessageConverter() {
				MappingJackson2MessageConverter converter = new MappingJackson2MessageConverter();
				converter.setTargetType(MessageType.TEXT);
				converter.setTypeIdPropertyName("_type");
				return converter;
			}
			
			public static void main(String[] args) {
				// Launch the application
				ConfigurableApplicationContext context = SpringApplication.run(Application.class, args);
				
				JmsTemplate jmsTemplate = context.getBean(JmsTemplate.class);
				
				// Send a message with a POJO - the template reuses the message converter
				System.out.println("Sending an email message.");
				jmsTemplate.convertAndSend("mailbox", new Email("info@example.com", "Hello"));
			}
		}
		
	1. `@EnableJms` **(M)**
		1. Triggers discovery of methods annotated with `@JmsListener` **(M)**
	2. `DefaultJmsListenerContainerFactoryConfigurer` - provided by boot
		1. `JmsMessageListenerContainer` - will be identical to the one boot constructs by default
	3. `MessageConverter` - it can convert only basic types (`String`, `Map`, `Serialize`)
		1. `Email` is not made serializable
			1. We want to use Jackson and serialize content to json in text format `TextMessage`
		2. Spring boot will detect default `MessageConverter` and associates it to `JmsTemplate` and `JmsListenerContainerFactory` constructed by `DefaultJmsListenerContainerFactoryConfigurer`
		3. `JmsTemplate` - simplifies sending messages to a Jms destination
			1. A POJO (`Email`) object can be sent which is converted using `MessageConverter` automatically which converts it to json document
	4. `JmsTempalte` and `ConnectionFactory` - not explicitly defined
		1. Generated automatically by Spring boot
		2. **ActiveMQ broker runs embedded** - by default
		3. Messages are transmitted to queues by having **pubSubDomain** set to false
			1. `JmsMessageListenerContainer` - is configured the same
			2. Customization: `spring.jms.isPubSubDomain=true` in application.properties or environment variable
				1. Receiving container should also have the same settings
2. Note:
	1. `JmsTemplate` - it can receive messages through its `receive` method
		1. But it is synchronous (it blocks)
			1. Solution: `DefaultMessageListenerContainer` with cache-based connection factory
				1. Messages can be consumed asynchronously with max connection efficiency

## Summary ##