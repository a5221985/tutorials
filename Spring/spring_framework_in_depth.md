# Spring Framework In Depth #
## Source ##

![Spring Framework](https://www.youtube.com/watch?v=WUqyoH_G4Ko&list=PLC97BDEFDCDD169D7&index=12)

## Using ApplicationContextAware ##
1. If a Bean needs the context (for getBean)
	1. Why?
		1. Example: Triangle (singleton)
			1. If Point(s) are prototypes (initialized when Triangle is created) - initialized only once!!!
			2. Solution:

					context.getBean("pointA"); // pointA is a prototype

2. Implement `ApplicationContextAware` by bean

		...
		private ApplicationContext context = null;
		...
		public Triangle implements ApplicationContextAware {
			@Override
			public void setApplicationContext(ApplicationContext context) throws BeansException {
				this.context = context;
			}
		}

3. Problem: Code is tied to Spring
4. Other `Aware` interfaces - give information about container to the bean
	1. `ApplicationEventPublisherAware`
	2. `BeanClassLoaderAware`
	3. `BeanNameAware` - to know the name of bean that has been configured

			public class Triangle implements ..., BeanNameAware {
				...
				@Override
				public void setBeanName(String beanName) {
					System.out.println("Bean name is: " + beanName); // called while bean is initialized
				}
			}

## Lifecycle Callbacks ##
1. Methods run when bean is being created and/or destroyed
2. Example: Closing a context (desktop app)

		AbstractApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");
		context.registerShutdownHook(); // destroy method is called for all beans
		...

3. Example: Triangle

		public class Triangle implements InitializingBean {
			...
			@Override
			public void afterPropertiesSet() throws Exception { // executed when bean has finished initialization
				System.out.println("InitializingBean init method called for Triangle");
			}
		}

4. Destroying: `DisposableBean`

		public class Triangle implements DisposableBean {
			...
			@Override
			public void destory() throws Exception {
				System.out.println("DisposableBean destroy method for the triangle");
			}
		}

5. Problems: Spring specific interfaces spilled into code
	1. Solution:

			public class Triangle {
				...
				public void myInit() {
					System.out.println("My init method called");
				}

				public void cleanUp() {
					System.out.println("Cleanup");
				}
			}

		1. spring.xml

				<bean id="triangle" class="org.startup.Triangle" autowire="byName" init-method="myInit" destroy-method="cleanUp">
				</bean>

		2. For all beans

				<beans default-init-method="myInit" default-destroy-method="cleanUp">
		
		3. Both interfaces and methods
			1. Order: InitializationBean, our init method, flow, DisposableBean, our cleanUp method

## Writing a BeanPostProcessor ##
1. Classes that tell spring that there is some processing after initializing the bean
	1. Code executed by spring after initializing every bean
	2. method runs for every initialization of every bean in xml
2. Seperate class exists
3. Usage: extend functionality of framework
4. Example: print bean name after each initialization

		public class DisplayNameBeanPostProcessor implements BeanPostProcessor {
			@Override
			public Object postProcessAfterInitialization(Object arg0, String arg1) throws BeansException { // called after initializing any bean, arg0 - bean object, arg1 - bean name
				// return null; // return the bean object back for continuing configuration
				System.out.println("In After Initialization method. Bean name is " + beanName);
				return bean;
			}

			@Override
			public Object postProcessBeforeInitialization(Object bean, String beanName) throws BeansException { // called before initializing any bean
				System.out.println("In Before Initialization method. Bean name is " + beanName);
				return bean;
			}
		}

	1. spring.xml

			<bean class="package.DisplayNameBeanPostProcessor" />

5. We can have many such classes
6. We can implement order for the classes

## Writing a BeanFactoryPostProcessor ##
1. To execute code when BeanFactory is initialized (own or out of the box ones)
2. Example: MyBeanFactoryPP

		public class MyBeanFactoryPP implement BeanFactoryPostProcessor {
			@Override
			public void postProcessBeanFactory(ConfigurableListableBeanFactory beanFactory) throws BeanException {
				System.out.println("My Bean Factory Post Processor is called");
			}
		}

	1. Run when bean factory is initialized
	2. Config

			<bean class="...MyBeanFactoryPP" />

	3. ApplicationContext is BeanFactory with additional functionality so the above is called
		1. MyBeanFactoryPP is called
		2. Singletons are initialized
3. Out of the box:
	1. `PropertyPlaceHolderConfigurer`: generates place holders for values
		1. Property values are in properties file
			1. Example:

					pointA.pointX = 0
					pointA.pointB = 0

				1. beans.xml

						value="${pointA.pointX}"
						value="${pointA.pointY}"

				
						<bean class="org.springframework.beans.factory.config.PropertyPlaceHolderConfigurer">
							<property name="locations" value="pointsconfig.properties" />
						</bean>

					1. BeanFactory will not see placeholders

## Coding to Interfaces ##
1. Example:

		public interface Shape {
			public void draw();
		}

		public class Triangle implements Shape {
			...
		}

		public class Circle implements Circle {
			private Point center;
			...
			// getters and setters
		}

		<bean id="triangle" class="...Triangle">
			<property name="pointA" ref="pointA"/>
			<property name="pointB" ref="pointB"/>
			<property name="pointC" ref="pointC"/>
		</bean>

		<bean id="shape" class="...Circle">
			<property name="center" ref="pointA"/>
		</bean>

		...

		Shape shape = (Shape) context.getBean("shape"); // loose coupling
		shape.draw();

	1. Useful if we switch to a different implementation of the dependency

## Using MessageSource To Get Text From Property Files ##
1. Properties file: mymessages.properties
		
		greeting=Hello!

	1. DrawingApp.java

			public static void main(String[] args) {
				...
				System.out.println(context.getMessage("greeting", null, "Default Greeting", null // locale)); // there are no parameters
			}

	2. beans.xml

			<bean id="messageSource" class="org.springframework.context.support.ResourceBundleMessageSource">
				<property name="basenames">
					<list>
						<value>mymessages</value>
					</list>
				</property>
			</bean>

	3. Injecting the bean

			@Autowired // by type
			private MessageSource messageSource;

			...
			public void setMessageSource(MessageSource messageSource) {
				this.messageSource = messageSource;
			}
			...
			public void draw() {
				...
				System.out.println(this.messageSource.getMessage("greeting", null, "Default Greeting", null // locale));
				...
			}

	4. Custom message

			drawing.point=Circle: Point is: ({0}, {1})

			...

			System.out.println(this.messageSource.getMessage("drawing.point", new Object[] {center.getX(), center.getY()}, "Default Point Message", null // locale));

## Event Handling in Spring ##
1. Three core entities
	1. Event publisher
	2. Event listener
	3. Event
2. Spring:
	1. `ApplicationListener` interface
	2. `ApplicationPublisher` interface
	3. `ApplicationEvent` interface
3. Example:
	
		@Component
		public class MyEventListener implements ApplicationListener {
			@Override
			public void onApplicationEvent(ApplicationEvent event) { // called on every event
				System.out.println(event.toString());	
			}
		}

		public class DrawEvent extends ApplicationEvent {
			public DrawEvent(Object source) {
				super(source);
				
			}

			public String toString() {
				return "Draw event occurred";
			}
		}

		public class Circle implements Shape, ApplicationEventPublisherAware // handler {
			...
			private ApplicationEventPublisher publisher;
			...
				DrawEvent drawEvent = new DrawEvent(this); // source
				publisher.publishEvent(drawEvent);

			public void setApplicationEventPublisher(ApplicationEventPublisher publisher) { // spring is going to call this method and provide the publisher (application context - implements ApplicationEventPublisher)
				this.publisher = publisher;
			}
		}