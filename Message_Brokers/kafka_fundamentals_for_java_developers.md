# Kafka Fundamentals for Java Developers #
## Section 1: Introduction ##
### Introduction ###
1. Fundamentals:
	1. What is kafka
	2. Why do we need it
	3. Use-cases where it is used
	4. Who is using it
2. Kafka architectural components
	1. Records
	2. Topics
	3. Partitions
	4. Consumer groups
	5. ...
3. Kafka broker
4. Kafka cli
	1. Creation of brokers
	2. Send and receive messages
5. Kafka client API
	1. For producers and consumers
6. Simple and custom serializers and deserializers
	1. Object type records or events
7. Avro: Framework to send and receive data in a language neutral fashion
	1. Confluent schema registry
	2. Avro schema
	3. Generate stubs from schema (maven avro plugin)
8. Producers
	1. Partitioner classes
	2. Advanced properties
9. Consumers
	1. Consumer groups
	2. Rebalancing
	3. Offset commits
	4. Advanced properties
10. Stream processing
	1. Kafka streaming API
	2. Applications
11. Spring and Spring Boot with Kafka

### How to make the best of this course ###
1. Lectures
2. Quiz
3. Assignments
4. Pre-requisites
	1. Software Setup
	2. IntelliJ or STS
5. Kafka setup
6. Kafka CLI
7. Confluent Platform

### Completed projects on GitHub ###
1. github.com/bharaththippireddy

### Slides Used in the Course ###
### Download Assignment Solutions ###

## Section 2: The Fundamentals ##
### What is Kafka ###
1. Kafka is a distributed commit log
	1. Microservice applications put events onto a log
		1. Term for log is topic
	2. Kafka stores events in orderly fashion and writes events to disk (replicated disks - ensure that events are not lost)
2. Microservices exchange messages through topics or streams in realtime
	1. We can process data as soon as they are produced, we can have real-time analytics
		1. We can give recommendations based on the analytics
	2. Each service can define it's own computational logic
		1. Solution: **Streaming API** (the following operations can be done)
			1. Grouping
			2. Aggregating
			3. Filtering
			4. Joining
3. Data in external services/data bases
	1. Solution: Kafka connect
		1. Open source and commercial Kafka connectors (to fetch data into Kafka or send data to other sources)

### Why Kafka ###
1. Advantages
	1. Multiple producers and consumers
		1. Multiple producers can write to a **single** topic at the same time
		2. Multiple consumers can subscribe and consume messages from the same topic
		3. Kafka retains message and multiple consumers can read the message and process at any time
		4. Kafka supports consumer groups and partitions
			1. We can have parallel consumers running which can be part of a consumer group
		5. Topic is divided into multiple partitions
			1. Messages from producers will go across the partitions to enable parallel processing
			2. Kafka ensures that within a consumer group, the message is **consumed only once**
				1. Only one consumer in the group will be able to consume a particular message
					1. No duplication
			3. Enables multiple applications to process the same message but within an application, parallelism is allowed through consumer group
		6. Disk Based Persistence
			1. If a consumer is down due to restart or a crash, when it comes up, Kafka would have retained the message in a disk storage for configurable amount of time
		7. Scalability
			1. As the load on Kafka broker increases, the brokers can be easily scaled
				1. We can have **multiple brokers** (in cluster mode)
					1. If one broker goes down, another broker will take over (availability)
		8. Performance
			1. Through the above mechanism

### Usecases ###
1. Pub-Sub
	1. Used to exchange messages across micro-services
		1. One micro-service can send notification to a kafka topic and another micro-service will subscribe and consume the notification
	2. Producer-Consumer pattern can be implemented
		1. Order processing
		2. Shipment
		3. ...
2. Activity Tracking
	1. Used to track user activity and fed to a topic
	2. The events are read by an ML algorithm which can be used to give recommendations to the user
	3. Browser application can read the recommendations and push them to the user
		1. Example: Amazon, Netflix, ...
3. Metrics and Log Aggregation
	1. As applications produce metrics on a regular basis, all of them can be aggregated and stored in a **permanent storage** to do analysis
		1. Real-time
			1. Permanent storage:
				1. Elasticsearch
				2. ...
		2. Analysis
			1. Security threats
			2. Unwanted activities
4. Commit Log
	1. As and when DB changes happen, the changes can be streamed onto kafka topic
		1. Used to replicate database if required
		2. Used to analyse what is going on with the DB
			1. To check threads of unwanted activity
5. Stream Processing (custom use cases are supported)
	1. **Data Pipelines**
		1. As data flows through different stages of the pipeline, we can have transformations and computational logic (at each step)
			1. Big data tools like hadoop, storm, ... can be part of the stream processing

### Where is Kafka Being Used ###
1. Data platforms
2. Micro-service applications
3. Monitoring Trucks, Cars, ... (in realtime)
4. Factories
	1. To analyse IoT device data - to make decisions on the fly
5. Financial transactions
	1. To process banking and stock exchange transactions
6. Hospitals
	1. Patient info can be tracked and monitored (any changes in condition can also be tracked to treat him better)
7. Retail, Hotel, and Travel
	1. Kafka can be used to gather and react to customer interactions and recommendations can be shown

### Who is Using Kafka ###
1. Twitter
	1. Mobile app performance management and analytics
		1. 5 Billion sessions/day
2. Uber
	1. > 1 Trillion events per day
		1. Log aggregation
		2. DB change
		3. Log maintenance
		4. Other even streaming use-cases
	2. uReplicator (contribution)
		1. Cluster replication solution to the open-source world
3. Netflix
	1. Messaging backbone
		1. 4000 kafka brokers in cloud handling 7 Billion events per day
4. Yahoo
	1. Real-Time analytics
		1. 20 GB data/second
5. Pinterest
	1. Real Time Ads
		1. 2k brokers - handling 8B events per day

### Kafka Architectural Components ###
1. Kafka Architecture
	1. Broker
		1. Kafka **cluster** is a collection of **Kafka brokers** (aka **Kafka servers** or **Kafka nodes**)
		2. **It is used to exchange messages between producer and consumer**
		3. Broker ensures that
			1. Producer and consumer are decoupled
			2. Messages are persisted and durable
		4. Broker is a **Java process**
		5. We can increase the brokers to provide scalability and durability of messages
		6. **One of the brokers will be elected as cluster leader or cluster controller**
			1. Other brokers will follow the leader
			2. **Leader**
				1. Responsible for managing
					1. Partitions
					2. Replicas
					3. Other administrative operations
	2. ZooKeeper
		1. Responsible for electing a **cluster controller** or **leader**
			1. All broker nodes will register with ZooKeeper component (when they come up)
			2. Zookeeper will elect one of the brokers as leader
				1. If that leader goes down, it will pick up another broker as the leader
		2. Maintain state of the cluster (metadata of leader and followers)
			1. States
			2. Quotas
			3. Access Control List
		3. ZooKeeper is an Apache project of its own
			1. **Kafka comes bundled with ZooKeeper**
				1. Can get replaced with Kafka's own component in the future
	3. Producers
		1. Produce data
		2. Communicate using TCP protocol
		3. They connect directly with the brokers and start sending messages to topics
		4. **Producer can send messages to multiple topics and a topic can receive messages from multiple producers**
	4. Consumers
		1. Consumes from one or more topics (data or records) and processes
		2. **They coordinate among themselves to balance the load**
		3. **They track each other's progress**

### Kafka Records ###
1. Record
	1. Producer constructs and exchanges data using **record**
	2. 7 attributes of record
		1. Topic
			1. Topic to which the record needs to be written to
		2. Partition
			1. 0 based index to which the record should be written
				1. **A record is associated only with one partition**
			2. Number can be set by producer
				1. If not set, the number is calculated based on **Key** the producer provides
					1. Hash value is calculated and result is used to identify the partition
		3. Offset
			1. 64 bit signed integer
			2. Used to locate the record within a partition
		4. Timestamp
			1. Set by producer or if not set, producer api sets it internally to current time
		5. Key
			1. Optional non-unique value
			2. Array of bytes
				1. It is used to calculate partition number
			3. If this value is not set, Kafka will decide partition number in a round robin fashion (can change in the future)
			4. **If same key is set for multiple records, all those records will end up in the same partition**
				1. **To uniquely identify a record, use the following as composite key:**
					1. **partition number**
					2. **offset**
		6. Headers
			1. Optional key-value pair
				1. Just like HTTP headers
			2. Used to pass meta-data
		7. Value
			1. Payload
			2. Array of bytes
				1. Contains business data
			3. It is optional (but no value makes no sense)
2. Assignment:
	1. Search for Kafka producer record
		1. https://kafka.apache.org/23/javadoc/org/apache/kafka/clients/producer/ProducerRecord.html

### Topics Partitions Offsets and Replication ###
1. Topic
	1. Messages are sent to a topic
	2. Each topic can be divided into one or more partitions
		1. Partition is a single log of records
	3. Messages are appended to the end of a partition as they come in
	4. Each partition gets a unique number
	5. Each message inside a partition gets an offset value
		1. It is like array index and starts from 0
			1. Partition number + offset => uniquely identifies a record
		2. Kafka stores partition & offset values inside a record or message
	6. **Messaging order across partitions is not guaranteed but order within a partition is maintained**
	7. If producer specifies partition number, Kafka puts that message into that partition with that partition number
	8. If producer does not specify partition number, Kafka will calculate a hash if key is specified, that is the partition number
	9. If producer does not specify a partition number or key, Kafka puts the message into one of the partitions as per round robin algorithm
	10. Partitions give the property of scalability & availability
		1. The partitions can be scaled across brokers
			1. **Instead of putting all partitions in one broker, we can scale them across brokers**
	11. Partitions support replication/duplication
		1. Gives high availability
		2. Example:
			1. Partition 0 - can be present in broker 0 and broker 1
				1. If one broker goes down, another broker will take over
					1. Which broker processes?
						1. Leader & follower decide
							1. Each partition has a leader and a follower
								1. Broker 0
									1. Partition 0 (L)
									2. Partition 1 (L)
									3. Partition 3 (F)
								2. Broker 1
									1. Partition 2 (L)
									2. Partition 0 (F)
									3. Partition 1 (F)
								3. Broker 2
									1. Partition 3 (L)
									2. Partition 2 (F)
							2. Only if **leader goes down**, **follower will take over**
							3. **We can specify replication using the replication factor we want**
								1. 1 - no duplication
								2. 2 - one L, one F
								3. 3 - one L, two F
							4. Replication factor configuration:
								1. Can be specified when defining a topic
								2. Can be specified when constructing a cluster

### Consumer Groups ###
1. Consumer group
	1. It is a set of consumers working together to consume a topic
	2. It ensures that **each partition is consumed by only one consumer**
		1. A consumer can consume from multiple partitions as well
	3. Assigning a consumer to a partition is called the ownership of partition by consumer
	4. **Consumers can be horizontally scaled**
		1. If load on a consumer is increasing, a consumer can be created which will take over a partition
	5. If a consumer fails:
		1. Remaining consumers can coordinate among themselves and take over the partitions that the failed consumer was working with

### Batching ###
1. KafkaProducer:
	1. Does not send only one message to the broker
		1. They batch them to the topic and partition that they have to go to
		
				Topic 1
				Partition 0
				- Batch 0
				- Batch 1
				- Batch 2
				
				Topic 2
				Partition 1
				- Batch 0
				- Batch 1
				- Batch 2
				
		2. **Batch**
			1. It is a collection of **messages** all of which must be written to the **same topic** and **same partition**
			2. Reduces network round-trips (by avoiding sending each message across network to broker)
				1. Larger the batch size, more messages can be processed in a given timeframe
			3. Each batch is **compressed** providing more efficient data transfer and storage
				1. Trade-off: processing time
			4. Trade-off: 
				1. If batch size is too big, there might be more delay before sending the message
				2. If batch size is too small, there are more network round-trips

### Quiz 1: The Fundamentals ###

## Section 3: Kafka in Action ##
### Introduction ###
1. Kafka up and running on local machine (Windows and Mac)
2. Kafka cli to construct and manage kafka topics
3. Kafka producers and consumers

### Java Version ###
1. Kafka is happy usually happy with any Java version
2. Scond method:
	1. Download Confluent Platform & launch Kafka
		1. Launches several other useful tools like **Schema Registry**
			1. Confluent needs Java 8 and Java 11 (not higher version)
				1. Code can be written in a higher version of Java
					1. Don't add higher version of Java to path for Confluence

### Install on Windows ###
1. `java -version`
2. Search for **kafka download**
	1. Download binary latest version
		1. `.tgz` file (windows and linux)
	2. `bin`
		1. All binaries
			1. `.sh` - linux
			2. `windows` - windows
				1. zookeeper server start and stop
				2. kafka server start and stop
		2. Add `bin\windows` to PATH in Windows
	3. `config`
		1. Zookeeper properties
		2. Kafka properties
3. Open new CMD
	1. Start zookeeper:
	
			zookeeper-server-start C:\<path>\config\zookeeper.properties
			
4. Open new CMD
	1. Start kafka broker:
	
			kafka-server-start C:\<path>\config\server.properties

### Install on Mac ###
1. Using homebrew

		brew install kafka
		
	1. cmd + shift + g (from terminal)
		1. Copy `/usr/local/Cellar/kafka/2.8.0/`
			1. Has binaries
			
	2. `/usr/local/etc/kafka`
		1. Has configuration files
			1. Kafka assumes zookeeper is running on localhost:2181
2. Start zookeeper

		zookeeper-server-start /usr/local/etc/kafka/zookeeper.properties
		
3. Start kafka

		kafka-server-start /usr/local/etc/kafka/server.properties

### Kafka Commandline ###
1. Using kafka commandline
2. Download txt from resources
3. Commands:

		kafka-topics --list --bootstrap-server localhost:9092 # **(M)**
		
		# shows default topic - __consumer_offsets (used to store offset details)
		
		kafka-topics --create --replication-factor 1 --partitions 1 --topic first-topic --bootstrap-server localhost:9092
		
		# Run the list command to see the new topic
		
		kafka-topics --describe --topic first-topic --bootstrap-server localhost:9092
		
		# Topic name, id, config info, replicas, replication factor, ...
		
		kafka-console-consumer --bootstrap-server localhost:9092 --topic first-topic
		
		# starts polling the topic
		
		kafka-console-producer --broker-list localhost:9092 --topic first-topic
		
		> kafka is easy
		
		# consumer displays the message
		
		# ctrl + c to stop
		
		kafka-topics --delete --bootstrap-server localhost:9092 --topic first-topic
		
		# list the topics and you don't see the deleted topic
		# If delete is not working set the following in server.properties
		
		delete.topic.enable=true

### Kafka APIs ###
1. Kafka gives 5 APIs (in Java and Scala)
	1. Python also has support
2. APIs
	1. Admin API
		1. Used to manage
			1. Topics
			2. Brokers
			3. Other objects
		2. KafkaDrop: GUI based tool makes use of Admin API and give us browser based access to Kafka cluster
	2. Producer API and Consumer API
		1. Producer API: Used to publish stream of
			1. Events
			2. Records
			3. Messages
		2. Consumer API: Used to read the messages
		3. Producer API
			1. They take care of:
				1. Serialization
				2. Partition assignment
				3. ...
		4. Consumer API
			1. They take care of:
				1. DeSerialization
				2. Rebalancing
				3. ...
	3. Streams API
		1. Allows us to implement stream processing applications
			1. Allows to process event streams and apply transformations and maintain state...
		2. We read from a topic, apply tranformation and write to another topic
	4. Connect API
		1. To build and run re-usable data import and export connectors
		2. They allow us to import and export data from other systems to integrate with Kafka
			1. There are ready to use connectors
				1. MySQL
				2. PostgreSQL
				3. Elasticsearch
				4. ...
			2. The connectors are used to fetch data from the sources or push data to the sources

### Documentation ###
1. To learn more:
	1. Search for kafka documentation
		1. Apache kafka website
			1. Read the docs
				1. Examples
		2. Confluent Documentation
			1. Tutorials
			2. It is a cloud based implementation of Apache opensource Kafka
				1. Comes with ecosystem of products (not just Kafka)
					1. Confluent CLI
					2. KsqlDB
					3. Schema Registry
			3. Also gives platform to run locally or on a server
			4. Click on Clients
				1. Producer and Consumer APIs
				2. More examples and wrappers
	2. Search for **confluent kafka tutorial**

### Quiz 2: Kafka in action ###

## Section 4: Construct Producers and Consumers ##
### Kafka Producer ###
1. Workflow:
	
		ProducerRecord <-------------|
		  | send()                   |
		  v                          |
		Serializer                   |
		  |                          |
		  v                          |
		Partitioner                  |
		 |         |                 |
		 v         v                 |
		Topic 1    Topic 2           |
		Partion 0  Partition 1       |
		 Batch 0    Batch 0         Throw Exception
		 Batch 1    Batch 1          |
		 Batch 2    Batch 2  <----|  |
		 |          |             |  |    ^
		 v          v             |  |    |
		 Kafka Broker - Fail? -> Retry?   |
            |- Success? Return Metadata --|		 
			
	1. Record:
		1. We can set topic & value
	2. Send() - Producer hands over record to a Serializer
		1. Serializer converts Java type into byte array (using **key** and **value**)
			1. Kafka has inbuilt serializers that can work with common types
				1. Custom serializers can be written
					1. Avro can be used as well
	3. Serializer hands the record over to a partitioner
		1. Partitioner checks if the record has a partition number
		2. If partition number exists, it will use it, or else, it will use value of key and hashing algorithm to calculate partition number. If both don't exist, it will assign using round robin
		3. Partitioner knows to which partition the record must go to
			1. It adds the record to a batch of a particular topic and partition
	4. A separate thread picks up batch and sends to kafka broker
	5. If broker receives the message and writes it to Kafka, we get **record metadata** back
	6. If write fails, we get failure back
		1. Producer can retry again to send back to that partition. If it fails after retry, it will throw an exception

### Producer API Walkthrough ###
1. Construct an instance of `KafkaProducer<String, Integer>` class (constructor takes properties)
	1. Key
	2. Value
2. `Properties`
	1. Mandatory properties
	
			props.setProperty("bootstrap.servers", "localhost:9092"); // list of brokers, the producer should connect to
			props.setProperty("key.serializer", "org.apache.kafka.common.serialization.StringSerializer"); // Serializer is used to convert simple types to byte array (comes with kafka client library)
			props.setProperty("value.serializer", "org.apache.kafka.common.serialization.IntegerSerializer"); // converts value into byte array
			
			KafkaProducer<String, Integer> producer = new KafkaProducer<String, Integer>(props);
			ProducerRecord<String, Integer> record = new ProducerRecord<>("OrderTopic", "Mac Book Pro", 10); // Topic, Key, Value
			
			try {
				producer.send(record, new OrderCallback()); // fire and forget manner - don't handle response
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				producer.close();
			}
			
		1. Serializers implement `Serializer` interface from Kafka
		2. To receive response:
		
				Future<RecordMetadata> send = producer.send(record);
				RecordMetadata recordMetadata = send.get(); // waits until response is obtained
				
		3. Asynchronous: Passing callback

### Construct a Producer Project ###
1. Construct Maven project
	1. Search for: `archetype-quickstart`
		1. Group ID: org.bharath.kafka
		2. Artifact: orderproducer
	2. Remove the entire build section if it exists
	3. Specify Java version
2. Search for kafka clients maven dependency
	1. Latest version
		1. `kafka-clients`

### Construct a Producer ###
1. OrderProducer class with main method

		Properties props = new Properties();
		props.setProperty("bootstrap.servers", "localhost:9092");
		props.setProperty("key.serializer", "org.apache.kafka.common.serialization.StringSerializer"); // ctrl+shift+t
		props.setProperty("value.serializer", "org.apache.kafka.common.serialization.IntegerSerializer"); // ctrl+shift+t
		
		KafkaProducer<String, Integer> producer = new KafkaProducer<String, Integer>(props);
		ProducerRecord<String, Integer> record = ProducerRecord<>("OrderTopic", "Mac Book Pro", 10);
		
		try {
			producer.send(record);
			System.out.println("Message Sent Successfully");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			producer.close();
		}

### Sync Send ###
1. `Future<RecordMetadata> future = producer.send(record);`

		RecordMetadata recordMetadata = producer.send(record).get();
		System.out.println(recordMetadata.partition());
		System.out.println(recordMetadata.offset());

### Async Send ###
1. Callback

		producer.send(record, new OrderCallback());
		
	1. Callback
	
			import org.apache.kafka.clients.producer.Callback;
			
			public class OrderCallback implements Callback {
				@Override
				public void onCompletion(RecordMetadata metadata, Exception exception) {
					System.out.println(metadata.partition());
					System.out.println(metadata.offset());
					if (exception != null) {
						exception.printStackTrace();
					}
				}
			}

### API Walkthrough ###
1. OrderConsumer

		Properties props = new Properties();
		props.setProperty("bootstrap.servers", "localhost:9092");
		props.setProperty("key.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
		props.setProperty("value.deserializer", "org.apache.kafka.common.serialization.IntegerDeserializer");
		props.setProperty("group.id", "OrderGroup"); // consumer belongs to a group (not producer)
		
		KafkaConsumer<String, Integer> consumer = new KafkaConsumer<>(props);
		consumer.subscribe(Collections.singletonList("OrderTopic")); // consumer can subscribe to multiple topics - even using regex
		
		ConsumerRecords<String, Integer> orders = consumer.poll(Duration.ofSeconds(20)); // Consumer polls for messages with timeout
		for (ConsumerRecord<String, Integer> order : orders) {
			System.out.println("Product Name " + order.key());
			System.out.println("Quantity " + order.value());
		}
		consumer.close();
		
	1. `poll` - does many things behind the scenes
		1. Partition re-balancing
		2. Checks heart beats
		3. Data fetching

### Construct a Consumer Project ###
1. 

### Consume Messages ###
### Quiz 3: Construct Producers and Consumers ###
### Assignment 1: Construct Consumers and Producers ###

## Section 5: Use Custom Serializers and Deserializers ##
### Introduction ###
### Construct a Serilizer ###
### Construct a Deserializer ###
### Quiz 4: Use Custom Serializers and Deserializers ###
### Assignment 2: Use Custom Serializers and Deserializers ###

## Section 6: Use Avro ##
### Introduction ###
### Schema Registry ###
### The Behind the Scenes ###
### Launch Confluent Schema Registry ###
### Construct Avro Schema ###
### API Walkthrough ###
### Configure Maven Avro Plugin ###
### Construct Producer ###
### Construct Consumer ###
### Test ###
### GenericRecord Type ###
### Construct a GenericRecord Producer ###
### Construct a Consumer ###
### Schema Evolution ###
### Schema Compatibility ###
### Consumers in Real Time ###
### Stop Confluent Platform ###
### Quiz 5: Use Avro ###
### Assignment 3: Use Avro ###

## Section 7: More About Producers ##
### Introduction ###
### Construct a Topic ###
### Construct Custom Partitioner ###
### Assignment 4: Construct Custom Partitioner Class ###
### ProducerConfig Class ###
### Acknowledgements and More ###
### Three More Properties ###
### Quiz 6: More About Producers ###

## Section 8: Message Delivery and Transactions ##
### Introduction ###
### Message Delivery Semantics ###
### Transactions ###
### Use a Transaction ###
### Few Pointers About Transactions ###
### Quiz 7: Message Delivery and Transactions ###

## Section 9: More About Consumers ##
### Introduction ###
### Consumer Groups ###
### Consumer Group Rebalancing ###
### How Rebalancing Works ###
### Offset Commits ###
### Auto Commit ###
### Sync Commit ###
### Async Commit ###
### Commit Custom Offset ###
### Construct a RebalanceListener ###
### Commit Last Offset Processed ###
### Using ConsumerConfig Class ###
### Min Fetch Size and Timeouts ###
### Four More Properties ###
### Partition Assignor Strategy ###
### Quiz 8: More About Consumers ###

## Section 10: Construct a Simple Consumer ##
### Introduction ###
### Construct a Simple Consumer ###
### Construct a Producer and Test ###
### Few Important Points ###

## Section 11: Stream Processing ##
### Introduction ###
### Usecase and API ###
### Construct Topics ###
### Construct Project ###
### Step 1 - Configure Properties ###
### Step 2 - Construct Topology ###
### Step 3 - Start and Stop Stream ###
### Test ###
### Describe Topology ###
### Write to Output Topic ###
### Use Filter Method ###
### Use Map Methods ###
### Assignment 5: Streaming Basics ###
### Word Count Usecase ###
### KTable ###
### Construct Topics ###
### Implement Word Count ###
### Aggregate Using groupBy and Count ###
### Test ###
### Quiz 9: Stream Processing ###

## Section 12: Spring Boot and Kafka ##
### Introduction ###
### API Walkthrough ###
### Construct Producer Project ###
### Construct the Producer Service ###
### Construct the REST Endpoint ###
### Construct the Consumer ###
### Configure ###
### Test ###
### Use Object Type ###
### Configure JsonDeserlizer ###
### Test ###
### Quiz 10: Spring Boot and Kafka ###
### Assignment 6: Spring Boot and Kafka ###

## Section 13: Wrap Up ##
### Quiz 11: Final Quiz ###
### Bonus Lecture ###