# Accessing Data Reactively with Redis #
1. Functional reactive application that uses Spring Data to interact with Redis using non-blocking Lettuce driver

## Project ##
1. [Spring Data Redis](https://projects.spring.io/spring-data-redis/) & [Project Reactor](https://projectreactor.io/) - to interact with Redis data store reactively
	1. `Coffee` object is stored and retrieved without blocking
2. Reactor's `Publisher` implementation is used which is based on **Reactive Streams spec**
	1. `Mono` - used for Publisher returning 0 or 1 value
	2. `Flux` - used for Publisher returning 0 to n values

## Construct a Domain Class ##
1. Coffee.java

		package hello;
		
		import lombok.AllArgsConstructor;
		import lombok.Data;
		import lombok.NoArgsConstructor;
		
		@Data
		@NoArgsConstructor
		@AllArgsConstructor
		public class Coffee {
			private String id;
			private String name;
		}
		
	1. Lombok: Used to eliminate boilerplate code and data class methods (accessors/mutators, `equals()`, `toString()`, `hashCode()`)

## Construct a Configuration Class with Spring Beans Supporting Reactive Redis Operations ##
1. CoffeeConfiguration.java

		@Configuration
		public class CoffeeConfiguration {
			@Bean
			ReactiveRedisOperations<String, Coffee> redisOperations(ReactiveRedisConnectionFactory factory) {
				Jackson2JsonRedisSerializer<Coffee> serializer = new Jackson2JsonRedisSerializer<>(Coffee.class);
				
				RedisSerializationContext.RedisSerializationContextBuilder<String, Coffee> builder = RedisSerializationContext.newSerializationContext(new StringRedisSerializer());
				
				RedisSerializationContext<String, Coffee> context = builder.value(serializer).build();
				
				return new ReactiveRedisTemplate<>(factory, context);
			}
		}

## Construct a Spring Bean to Load Some Sample Data to Our Application When We Start It ##
1. If we restart multiple times, we want to remove data that may exist from previous executions.
	1. We can run `flushAll()` (Redis) server command
2. After flushing out data, small `Flux` is defined
3. Each coffee name is mapped to `Coffee` object
4. Save it to reactive Redis repo
5. Query for values and display
6. CoffeeLoader

		@Component
		public class CoffeeLoader {
			private final ReactiveRedisConnectionFactory factory;
			private final ReactiveRedisOperations<String, Coffee> coffeeOps;
			
			public CoffeeLoader(ReactiveRedisConnectionFactory factory, ReactiveRedisOperations<String, Coffee> coffeeOps) {
				this.factory = factory;
				this.coffeeOps = coffeeOps;
			}
		
			@PostConstruct
			public void loadData() {
				factory.getReactiveConnection().serverCommands().flushAll().thenMany(
					Flux.just("Jet Black Redis", "Darth Redis", "Black Alert Redis")
						.map(name -> new Coffee(UUID.randomUUID().toString(), name))
						.flatMap(coffee -> coffeeOps.opsForValue().set(coffee.getId(), coffee)))
						.thenMany(coffeeOps.opsForValue()::get))
						.subscribe(System.out::println);
				)
			}
		}

## Construct a RestController to Provide an External Interface for Our Application ##
1. CoffeeController

		@RestController
		public class CoffeeController {
			private final ReactiveRedisOperations<String, Coffee> coffeeOps;
			
			CoffeeController(ReactiveRedisOperations<String, Coffee> coffeeOps) {
				this.coffeeOps = coffeeOps;
			}
			
			@GetMapping("/coffees")
			public Flux<Coffee> all() {
				return coffeeOps.keys("*")
							.flatMap(coffeeOps.opsForValue()::get);
			}
		}

## Make the Application Executable ##
1. [Netty](https://spring.io/understanding/Netty) - asynchronous container is used

## Test the Application ##
1. Open: http://localhost:8080/coffees