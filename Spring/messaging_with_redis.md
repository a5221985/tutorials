# Messaging with Redis #
1. Using Spring Data Redis to publish and subscribe to messages sent with Redis

## Project ##
1. App will use `StringRedisTemplate` - used to publish string message
2. `MessageListenerAdapter` - POJO uses this class to subscribe to message
3. Redis provides
	1. NoSQL data store
	2. Messaging system

## Standing up a Redis Server ##
1. Redis - open source, BSD-licensed, key-value data store + messaging system
	1. Download: [https://redis.io/download](https://redis.io/download)
	2. Mac: `brew install redis`
		1. Launching: `redis-server` **(M)**

## Starting with Spring Initializr ##
1. Dependencies:
	1. Spring Data Redis

## Construct a Redis Message Receiver ##
1. Message receiver needs a method to respond to messages

		public class Receiver {
			private static final Logger LOGGER = LoggerFactory.getLogger(Receiver.class);
			
			private AtomicInteger counter = new AtomicInteger();
			
			public void receiveMessage(String message) {
				LOGGER.info("Received <" + message + ">");
				counter.incrementAndGet();
			}
			
			public int getCount() {
				return counter.get();
			}
		}
		
	1. When we register `Receiver` as a message listener, message handler can be named whatever we want
	2. Counter: Used to signal that it has received a message

## Register the Listener and Send a Message ##
1. Spring Data Redis - has all components to send and receive messages
	1. To configure:
		1. Connection factory
		2. Message listener container
		3. Redis template
	2. `Receiver` needs to be registered with message listener container to receive messages
	3. Connection factory: drives template and message listener container to let them connect to Redis server
2. `RedisConnectionFactory` - It is an instance of `JedisConnectionFactory` based on `Jedis`: [https://github.com/xetorthio/jedis](https://github.com/xetorthio/jedis) Redis library
	1. It is injected into:
		1. Message listener container
		2. Redis template
3. `MessagingRedisApplication`

		@SpringBootApplication
		public class MessagingRedisApplication {
			private static final Logger LOGGER = LoggerFactory.getLogger(MessagingRedisApplication.class);
			
			@Bean
			RedisMessageListenerContainer container(RedisConnectionFactory connectionFactory, MessageListenerAdapter listenerAdapter) {
				RedisMessageListenerContainer container = new RedisMessageListenerContainer();
				
				container.setConnectionFactory(connectionFactory);
				container.addMessageListener(listenerAdapter, new PatternTopic("chat"));
				return container;
			}
			
			@Bean
			MessageListenerAdapter listenerAdapter(Receiver receiver) {
				return new MessageListenerAdapter(receiver, "receiveMessage");
			}
			
			@Bean
			Receiver receiver() {
				return new Receiver();
			}
			
			@Bean
			StringRedisTemplate template(RedisConnectionFactory connectionFactory) {
				return new StringRedisTemplate(connectionFactory);
			}
			
			public static void main(String[] args) throws InterruptedException {
				ApplicationContext ctx = SpringApplication.run(MessagingRedisApplication.class, args);
				
				StringRedisTemplate template = ctx.getBean(StringRedisRemplate.class);
				Receiver receiver = ctx.getBean(Receiver.class);
				
				while (receiver.getCount() == 0) {
					LOGGER.info("Sending message...");
					template.convertAndSend("chat", "Hello from Redis!");
					Thread.sleep(500L);
				}
				
				System.exit(0);
			}
		}
		
	1. `listenerAdapter` - The bean is registered as a message listener in message listener container defined in `Container`
		1. It will listen for messages on `chat` topic
	2. `Receiver` is wrapped in message listener adapter that implements `MessageListener` interface because it is a POJO
		1. Message listener adapter is configured to call `receiveMessage()` on `Receiver` when message arrives
4. `StringRedisTemplate` - needed to send messages
	1. It implements `RedisTemplate` interface (for common use of Redis - key-value pair are strings respectively)
5. `main()` method starts message listener container (which starts listening for messages)
6. `StringRedisTemplate` - it is used to send message on `chat` topic

## Summary ##