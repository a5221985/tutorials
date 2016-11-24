# Internet of Things #
## What is IOT? ##
1. Examples:
	1. Fan connected to Cloud
	2. Motor connected to cloud
	3. Refrigerator connected to cloud
2. Topics:
	1. Ecosystem
	2. Basics of IOT
	3. Layers
	4. Prototocols
	5. Hardware (Arduino)
		1. Arduino
			1. IDE
			2. Language
				1. Syntax
			3. Download and install drivers
		1. Sensors
			1. feel motions vir
			2. LDR
			3. Relay
			4. Temp
			5. Sound
		2. Displays
			1. LED
			2. Keypads
		3. Internet connecting devices
			1. Ethernet shield
			2. ECP8266
			3. MCU dev kit
				1. ECP8266 + GPU pins + friendly environment for developers
	6. Software (Arduino IDE, ...)
	7. Connect to a cloud platform
		1. Carriots
		2. Thinkspeak
		3. Thinger.io
		4. data.sparkfun.com
			1. Service to persist data on cloud
		5. Temboo
			1. Prebuilt code for us
		6. Blink
			1. Virtualize device and control it using Android app
		7. Triggers
			1. IoT Application is a Graph
3. Example Products to be Built:
	1. Virtually control two devices using mobile apps
		1. App to sense light and swith on and off two devices
	2. Motion detection with email notification (for building safety)
		1. Carriots
	3. Panic Alarm for elderly - Healthcare Industry
		1. One click can send multiple triggers say to Ambulence, authorities, ...
4. Electronic stuff:
	1. Circuit diagram
	2. Layout to print
		1. Contract manufacturers 
	3. Certification
	4. Angels: venture capitalists
	5. Kickstarter: Initial funding
	6. Project GRAD

## Projects ##
### List of components ###
#### MCU and Internet Sheilds ####
1. Arduino UNO - 1
2. Arduino NANO - 1
3. NodeMCU 1.0 - 3
4. Arduino Ethernet Shield - 1
5. ESP8266 - 1

#### Components/Sensors/Sensor Shields ####
1. LED (Green - 3, Red - 3, Yello - 1)
2. LDR - 1
3. Temperature Sensor (LM35 or TMP36) - 1
4. 4 digit 7 segment display
5. 4x4 Universal 16 key switch keyboard Fit for Arduino - 1
6. PIR Motion Sensor - 1
7. Sound Sensor Board - 1
8. 12V1A\5V1A fully isolated switching power supply/ AC-DC modules/ 220V switch 12v 5v lose-lose (C4B1) - 2
9. 2 channel relay module with upto isolation supports high and low trigger 5V - 2
10. Generic PCB with bus lines - 2
11. Casing - 3 (one example): [http://www.budind.com/view/NEMA+Boxes/Blue+Transparent+NEMA+4X](http://www.budind.com/view/NEMA+Boxes/Blue+Transparent+NEMA+4X)

#### Accessories ####
1. Soldering KIT
2. 220 ohm resistor (Color bands: REDREDBROWN) x 10
3. 10k resistor (Color bands: BROWNBLACKORANGE) x 10
4. RJ45 cable - 1
5. Breadboard - 1
6. USB cable (to connect Arduino UNO to PC) - 1
7. Micro USB (to connect NodeMCU to PC) - 1
8. Breadboard wires (male to male 40, male to female 40, female to female 40)

### Learning Phase ###
#### Product 1 ####
1. NodeMCU, Relay, Power supply, Generic PCB, LDR, casing

#### Product 2 ####
1. NodeMCU, Relay, Power Supply, Generic PCB, PIR sensor, casing

#### Product 3 ####
1. NodeMCU, LED, Battery pack (4.5v), casing

## Projects ##
### Swithing on Lights ###
1. Hardware
	1. µ controllers
	2. Shields
	3. Electrical comp
	4. Electronic comp
	5. Semiconductors
	6. Electro-Mechanical
2. Software
	1. IDE
	2. Drivers
	3. Libraries
		1. Device makers
		2. Other programmers
	4. Data base (Cloud)
	5. Programming language
3. Skills
	1. Imagination
	2. Ingenuity
	3. Integration skills
	4. Desiging
	5. Setup
	6. Soldering
	7. Trouble shooting

### IoT Devices and Levels ###
1. IoT + sensors + actuators + data store + port to communicate (browser, cloud)
2. Cloud platform
	1. Can store data
	2. Can run programs
	3. Generate analytics
	4. Trigger a workflow (actions involving triggering a complex network of IoT devices)
3. Levels:
	1. Level 1:
		1. IoT
		2. Sensors
		3. Actuators
		4. Talk to browser
		5. Talk to phone
	2. Level 2:
		1. IoT
		2. Sensors
		3. Actuators
		4. Talk to browser
		5. Talk to Cloud
		6. Talk to phone
	3. Level 3:
		1. IoT
		2. Talk to other IoT divices (indirectly)
		3. Sensors
		4. Talk to cloud
		5. Talk to browser
		6. Talk to phone
	4. Level 4
		1. Level 3 + coordinator (coordinates with the IoT devices and is connected to cloud)

## Protocols ##
1. TCP IP Stack
	1. Application Layer: HTTP, MQTT, Web sockets
		1. Presentation layer + Session layers
		2. Convert info into request format of the protocol type
		3. Port address:
			1. SSH: 22
			2. HTTP: 80
		4. HTTP:
			1. GET, POST, PUT, DELETE
		5. MQTT:
			1. Light weight mechanism
			2. Uses client server architecture
			3. Uses Publish subscribe model
				1. One client can connect to server and publish on a particular topic
				2. Another client can connect to server and subscribe to a partuclar topic
		6. Web socket: Dedicated full duplex channel
			1. Opens TCP connection between the devices until it is explicitly closed (unlike other protocols where connection is opened and closed with every message)
	2. Transport Layer: TCP, UDP (for reliability)
		1. End to end message transport capability
		2. Independent of underlying network (IPV4, IPV6, 803.3 or 802.11)
		3. Confirms or makes sure it has reached the destination (TCP has and UDP does not have)
		4. Error control (TCP has and UDP does not have)
		5. Flow control
		6. Takes care of congestion
	3. Network Layer: IPV4, IPV6, 6Lowpass
		1. Data grams:
			1. Source IP and Destination IP are used to transport packets
		2. IPV4: 
			1. 32 bit address
		3. IPV6:
			2. 128 bit address
		4. There is no error checking or confirming if packets were sent
	4. Link Layer: 802.3, 2G/3G/4G/LTE, 802.11
		1. Physical layer:
			1. 802.3: Ethernet protocol (coaxial cable)
				1. 802.3.i 10BASE-T Ethernet copper twisted pair
				2. 802.3.ae Ethernet Fiber 10 Gbit/s
			2. 802.11: Wifi
				1. 802.11 a 5 GHz
				2. 802.11 b/g 2.4 GHz
			3. 2G/3G/4G/LTE: Cellular communication
				1. Difference is amount of data that can be sent
					1. 2G: 9+ Kb/s
					2. 4G: 100MB/s

### Internet ###
1. Layers
	1. Arduino + Eth/Wifi sheild
	2. Application Layer
	3. TCP/IP
		1. Private IP
	4. MAC (48 bit hexadecimal)
		1. Physical address
2. Connect device to Router using Ethernet RJ45 cable or Wifi
	1. has MAC address
3. Connect Router to ISP (ISP provides public IP)
4. ISP is connected to Internet

### Hardware ###
1. Arduino UNO
2. Arduino NANO
	1. Smaller than UNO
	2. USB power supply
	3. 4 layer board
3. Wifi Sheild
	1. Extends the pins of Arduino UNO
	2. Smaller chips
		1. MCU (Arduino + Wifi shield)
			1. Has a wifi chip
			2. Has a microcontroller
		2. ESP8266:
			1. Sifi shield for Arduino NANO
			2. Use FTDI to convert serial to USB
			3. Pins
				1. TX
				2. RX
				3. VCC
				4. GND
				5. GPIO 1 and 2
4. For two arduinos to talk to each other
	1. Use RF Trans receiver 2.4 GHZ (Transmitter and receiver)

### Software ###
1. Arduino IDE
	1. Supports other ports and makers as well
2. Drivers
	1. If we connect a shield and plugin to computer using USB cable, they get automatically downloaded most of the time
3. Choosing the board:
	1. From IDE

### Hardware and Software ###
1. Breadboard:

	![breadboard](breadboard.jpg)
			


