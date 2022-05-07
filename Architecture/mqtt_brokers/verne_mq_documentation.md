# VerneMQ #
## What is VerneMQ ##
1. It is:
	1. **High performance**
	2. **Distributed
		1. MQTT Broker
2. **Scales horizontally** (on commodity hardware)
3. **Scales vertically** (on commodity hardware)
4. Supports **high number of concurrent publishers and consumers** and **maintains low latency** and **fault tolerance**
5. Use case: IoT platform, smart products

## What is MQTT ##
1. It is open industry standard (developed by OASIS)
2. It is light weight publish-subscribe messaging protocol
3. Use cases: large-scale IoT apps and high performance mobile messaging

## VerneMQ - The Big Picture ##

	Mobile & Embedded:
	Android
	Window Mobile
	Apple
	Blackberry
	RaspberryPI
	Arduino
	Intel
		|
	  MQTT
		|
		v
	VerneMQ
		|
	  MQTT
		|
		v
	Busines:
	Device Mgmt
	Big Data
	Monitoring
	Analytics
	Remote Control
	Rule Engine

## VerneMQ is Perfect for ... ##
### Mobile Messaging ###
1. Mobile messaging services with smaller overhead than XMPP (?)
2. Low latency bi-directional communication

### Connecting IoT Field Devices ###
1. Monitor and control all devices you have in the field
2. Connect devices to:
	1. Data centers
	2. Backend services
	3. Smartphone apps

### Smart Infrastructure ###
1. Cities, homes, transportation
2. Mobile assets (?)
3. From small labs to industrial deployment

### Your Use Case ###
1. Ask VerneMQ team if it is good for our usecase

## Frequently Asked Questions ##
1. How does VerneMQ handle over a million connections?
	1. It is based on Erlang OTP
		1. OTP: best technology currently available to build highly scalable messaging systems
			1. It enables VerneMQ to scale horizontally and vertically by:
				1. Utilizing **multicore architecture**

2. Do I need to know Erlang to run a VerneMQ cluster?
	1. No
	2. Alternatives:
		1. CLI tools
		2. Integration APIs
		3. Plugins

3. Are customizations required to run VerneMQ?
	1. No
	2. VerneMQ comes with built in plugins for simple file-based authentication and authorization
		1. **But if usecase requires DB lookup for verifying client credentials, custom pluging might be needed**
	3. VerneMQ is simple and easy to extend

4. Do I need to know Erlang to implement a custom plugin?
	1. Not necessary
		1. Most use cases can use built-in Lua scripting engine that comes with database drivers for
			1. Postgres
			2. MySQL
			3. MongoDB
			4. Redis
			5. Memcached
		2. **Another approach: Webhook**
			1. **Build pluging in programming language of our choice**

5. How does VerneMQ compare to RabbitMQ and EMQ?
	1. All those brokers are built using Erlang (similar runtime characteristics)
		1. VerneMQ was built to tolerate network failures
		2. VerneMQ provides fine-grained control over availability and consistency behavior
		3. VerneMQ important features: 
			1. Underlying distributed data storage features
			2. Automatic conflict resolution
			3. Automatic recovery from netsplits

6. How does VerneMQ compare to HiveMQ and MessageSight?
	1. Both are high performance but closed source brokers running on Java VM
	2. Both brokers are clusterable
		1. But lack docuemntation of failure modes during network failures

7. How to support VerneMQ?
	1. Assistance during evaluation, customization, operations
