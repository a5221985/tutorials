# Networking Fundamentals: Hands on Training for Beginners #
## Network Basics ##
### Introduction ###
1. Topics
	1. Network Basics
		1. Definition
		2. Types of Networks
		3. Network Topologies
		4. Summary
	2. Network Models & Protocols
		1. OSI Model
		2. TCP/IP Model
		3. Comparison
		4. Summary
	3. Layer-2 Networks & Switching (broadcast domains, collision domains)
		1. Layer-2 Networks
		2. MAC Addressing
		3. Layer-2 Switches & Functions
		4. VLANs
		5. Summary
	4. Layer-3 Networks & Routing
		1. IP Addressing & Subnetting
		2. Basic Routing
		3. Routing Protocols
		4. Summary
	5. Important Concepts
		1. DHCP
		2. TCP & UDP
		3. ARP
		4. DNS
		5. NAT - Network Address Translation
		6. VPN - Virtual Private Network
		7. Summary
	6. Bonus Section
		1. How to make career in Networks
			1. For certifications
			2. For career
			3. For basics
2. Not advanced topics
	1. Comptia Network+ course
	2. CCNA course

### Network Basics ###
1. Topics:
	1. What are networks
	2. Types of networks
	3. Journey and growth of technologies
	4. Different network topologies
2. What is Network?
	1. Network is a group of two or more computing or digital devices connected together via communication channel or medium
		1. For sharing data or info
	2. Media
		1. Copper
		2. Wireless
		3. Bluetooth
		4. Satellites
3. Evolution (to understand the need)
	1. 1960s
		1. Big large systems
		2. Operating in isolation
		3. Manual data sharing
			1. even to machines within organization
				1. It is called sneaker network
		4. Requirement of business
			1. Data & Resource's sharing
			2. Performance
			3. Efficiency
		5. Solution
			1. LAN
				1. Local Area Network
					1. Interconnection of multiple computer systems which are in close proximity
						1. To share data sources and data
			2. LANs were not sufficient for geographically distributed computers (need of interconnecting beyond boundaries)
				1. Solutions
					1. MAN - Metropolitan Area Network
					2. WAN - Wide Area Network
					3. Internetwork (internet)
			3. The solutions could be used to connect computer systems across the globe
				1. This caused revolution in the business world
4. Types of Networks
	1. PAN - Personal Area Network
		1. Limited in terms of coverage area (Private network)
			1. Accessibility is limited to one or few users
		2. Exmples:
			1. Bluetooth (between cell and other bluetooth enabled device, mouse, keyboard, ...)
	2. LAN - Local Area Network
		1. It is usually owned and administratively controlled by a single body
			1. Spread across
				1. Campus area
				2. Building
				3. Office
		2. For close proximity
			1. All end users in an office can be interconnected (cells, ...)
			2. Examples:
				1. Printers
				2. IP Phones
				3. Fax machines
				4. Scanners
				5. PCs
				6. Servers
		3. Networking devices used for LAN
			1. Routers
			2. Switches
			3. Hubs
			4. Firewalls
		4. Media
			1. Copper
			2. UTP
			3. Wifi
			4. Hybrid
				1. Combination of two or more types of media
					1. Wifi + Wired (for printers)
			5. Cables
	3. MAN - Metropolitan Area Network
		1. Expands across a city
			1. Cable TV network
		2. Use-case
			1. Organization looking to connect it's offices across the city
	4. Internetwork
		1. Network of networks
			1. Example: Internet
				1. It is the largest network on the plannet
		2. It is a larger network of smaller networks interconnected using some communication channels and protocols
			1. Protocol: It is a set of rules and policies defined to control and govern the data communication over a network
		3. Types of Internetworks
			1. Intranet
				1. Internal network (of an organization)
					1. private (to an organization)
				2. For it's own employees say
					1. To connect to
						1. HR System
						2. Payroll system
						3. Accounts
						4. Leave management system
					2. Services are provided by organisations through their private network
						1. No external users can access their services
			2. Extranet
				1. It is an extension of the intranet

						Extranet (vendors, partners, business associates)
							^
							|
							v
						Intranet (internal network)
						
					1. External access to intranet but
						1. Limited access and control
							1. Vendors might need access
			3. Internet
				1. It is a public network (network of networks)

						Internet (Public network)
							^
							|
							v
						Extranet (vendors, partners, business associates)
							^
							|
							v
						Intranet (internal network)

### Network Topologies ###
1. Types of network topologies
	1. Physical Topology
		1. Physical layout: How devices are connected physically (wifi, cables, ...)
	2. Logical Topology
		1. How data flows in the network (travel network)
	3. Network may have different physical and logical topology
2. Physical Topologies
	1. Bus topology
		1. What is this? Simplest
			1. All Nodes are connected to single main backbone cable
				1. Advantages:
					1. Low cost
					2. Easy to understand
					3. Suitable for small networks
					4. Easy to expand
						1. Single cable
							1. Just add a device to the end of the cable
				2. Disadvantages:
					1. Only one node can transmit at the same time (what about multiplexing?)
						1. If two more ore devices try to transmit data at the same time, collisions may occur
							1. Collision: Signals colliding
								1. More devices can increase the chances of collision
									1. It can bring down the network
									2. Network storm - high collisions that can bring down the network
	2. Ring topology
		1. Better than Bus topology
			1. Backbone connects to itself
			2. How does it work?
				1. Token goes around in the ring (reduces traffic)
				2. Token checks at each node, if it has anything to transmit
		2. Low collisions
		3. May slow down the network
			1. If many nodes want to transmit
				1. Token gives access to only one node at a time (all the other nodes have to wait until the tramission is completed)
					1. One node at a time
						1. Might not be possible to use the network due to slowness
		4. Difficult to troubleshoot (?)
		5. If one node fails
				1. The whole network might see the impact
	3. Star toplogy
		1. All devices are connected to a central device (switch - in most cases)
		2. Widely used in LAN networks
			1. switch is central device
			2. All devices are connected to the switch
		3. Easy to troubleshoot
			1. Different link is used (independent of other links)
		4. Single point of failure
			1. If switch fails, it brings down the whole network
	4. Mesh topology
		1. Two types
			1. Full mesh
				1. High redundancy
					1. If a node goes down, there are other links to communicate (another path can exist)
				2. High cost
					1. Every node is connected to every other node
				3. Mostly used in WAN networks
			2. Partial mesh
				1. Low cost than full mesh
				2. Not fully redundant
					1. A few extra links
3. Logical Topology
	1. How data flows in the network
		1. Consider star network
			1. Central box can provide the function of bus topology
				1. Data flows like a bus topology
			2. Central bos can provide the function of ring topology
4. Other topologies:
	1. Point-to-point
		1. No intermediate nodes
			1. One device is connected to another device directly
	2. Point-to-multipoint - generally used in WAN networks
		1. Central node (hub node say)
			1. It is connected to other nodes (branch nodes)
				1. No interconnection between branch nodes directly
				2. If branch node wants to communicate with another branch node, it has to go through the hub node
			
						node1 -> node2
							^
							|
							v
						node2
									
## Network Reference Models ##
### OSI Model Part-1 ###
1. Network reference models
	1. What are those?
	2. Why were they needed?
2. Evolution of technologies
	1. 1970 - increase of demand (to connect offices)
		1. No standard in place
	2. Challenges: (not standardised)
		1. Connecting multivendor, different networks
			1. Difficult to work together
			2. Difficult to connect together
		2. Different network protocols
		3. Reliability
			1. Because of incompatibility
		4. Decentralized network management
			1. Each vendor had a way to manage their networks
			2. Topologies were not consistent
		5. Inconsistent security policies
		6. Flexibility
	3. Solution: Standardization (OSI, TCP/IP models)
		1. Consistencies
		2. Standard protocols
		3. Standard designs
	4. Models
		1. They define how the end systems can communicate across network
		2. Reference model
			1. Defines how data communication can be established
3. Reference Models:
	1. A reference model defines:
		1. How information from a software application in one system moves through a network medium to a software application in another system
		2. Defines the functions of communication software in a generalized and structured manner
			1. Which helps to carry out the network product development activities.
	2. A network model must consider:
		1. Underlying communication hardware
		2. Network medium and/or type of channel
		3. Application programs
	3. Two popular reference models
		1. OSI reference model (by ISO - International Standard organization)
		2. TCP/IP (by DoD - Department of Defence)
	4. OSI Model
		1. In 1984
		2. It provides vendors with standards
			1. It ensures greater compatibility and interoperability between network technologies (produced by different vendors globally)
		3. Benefits - with layered approach
			1. Manageable (easier)
			2. Standardizes interfaces
			3. Ensures interoperability
				1. Different vendors can co-exist in the same network
					1. The vendors could use the same standard
			4. Promotes modular engineering
			5. Reduces devlopment cycle
				1. Each layer can be developed independently (and in parallel)
			6. Reduces complexity
				1. Responsibilities were divided between layers and communication between layers were standardized
		4. Layers:

				Application
				Presentation
				Session
				Transport
				Network
				Data Link
				Physical
				
			1. All people seems to need donut pepsi
		5. Application
			1. Network processes to applications
				1. Provides network services to application processes (such as electronic mail, file transfer, and terminal emulation (telnet))
					1. Handles
						1. Network transparency
						2. Resource allocation
			2. This is not an application but performs functions required for applications to work with each other (to the end users)
		6. Presentation
			1. Data representation (syntax and semantics of data exchanged between two systems)
				1. Ensure data is readable by receiving system
				2. Format of data
				3. Data structures
				4. Negotiates data transfer syntax for application layer
			2. It is like a data translator
		7. Session
			1. Interhost communication
				1. It establishes, manages and terminates sessions between applications
				2. It also handles synchronization of communication between two systems

### OSI Model Part-2 ###
1. Transport - it ensures that data is delivered reliably and in order between two systems
	1. End-to-end connections
		1. Concerned with transportation issues between hosts
		2. Data transport reliability
		3. Establish, maintain, terminate virtual circuits
		4. Fault detection and recovery
		5. Information flow control
			1. **Uses windowing method**
	2. It also receives data from upper layers and converts them into smaller units called **segments** (chunks)
	3. It is a host to host layer
		1. Provides point to point connection between two end-systems
3. Network - It handles routing and forwarding (?)
	1. Address and Best Path
		1. Provides connectivity and path selection between two end systems
		2. Domain of routing
	2. It handles logical addressing
		1. IP addressing
	3. It tracks devices in the network and provides best path to move from any source to any destination
		1. Based on
			1. Bandwidth
			2. Network condition
			3. Latency
			4. ...
	4. It also encapsulates segments received from transport layer into data units called packets
		1. It adds additional iformation
			1. Source IP
			2. Destination IP
4. Data Link - Responsible for reliable transfer of data across media
	1. Access to media
		1. Provides reliable transfer of data across media (not like Transport layer which provides reliability between two hosts)
		2. Physical addressing, network topology, error notification, flow control
	2. Sub-layers
		1. MAC - Media Access Control
			1. Provides access to physical media
		2. LLC - Logical Link Control
			1. It is an interface between the upper layers and data link layer
	3. It also encapsulates packets into frames
		1. Adds layer 2 info
			1. Data link header
			2. Data link tail
	4. It also handles physical addressing (MAC accress)
5. Physical layer
	1. Layer 1
	2. It is responsible to transmit raw data as signals on media
		1. The following specs are defined for this layer
			1. Mechanical specs
			2. Electrical specs
			3. Network interface specs
6. OSI Model Architecture
	1. End host - could have all 7 OSI layers
	2. Intermediate switches and routers - could have layers 1-3

			Network
			Data Link
			Physical
			
	3. Data flow:
	
			Host1
				Application					Application
					|							^
					v							|
				Presentation					Presentation
					|							^
					v							|
				Session						Session
					|							^
					v							|
				Transport						Transport
					|							^
					v							|
				Network		Network		Network
					|				^	|		^
					v				|	v		|
				Data Link		Data Link		Data Link
					|				^	|		^
					v				|	v		|
				Physical	->	Physical	-> Physical
				
		1. The source and destination might be very far from each other
			1. There could be many devices in between
				1. Cloud of devices - Switches or Routers
7. Different data units exchanged

		Application		<->			Application
		Presentation		<->			Presentation
		Session			<->			Session
		Transport		<-Segment->	Transport
		Network		<-Packets->	Network
		Data Link		<-Frames ->	Data Link
		Physical		<-Bits   ->	Physical
		
8. DoD's TCP/IP Model

		Process/ Application (Application + Presentation + Session)
		Transport
		Internet
		Network Access (Data Link + Physical)
		
	1. TCP/IP stack vs. the DoD Model
		1. TCP/IP operation is defined in its own model:
			1. The DoD model
			2. DoD designed TCP/IP is designed for APRAnet
		2. It is similar to OSI Model but
			1. DoD model has only 4 layers
			2. Each DoD layer and its functions corresponds to 1 or more OSI layers and their functions
		3. It is a condensed version of OSI model

## Layer 2 Networks ##
### Switching Fundamentals ###
1. Topics:
	1. Concepts of switching
	2. Collision domains
	3. Broadcast domains
	4. Segregation of network into vlans
2. Switching is part of Data Link layer (L2)
3. Data link layer functions
	1. Reliable delivery and flow control
	2. Framing
		1. Encapsulation and decapsulation of network packets
			1. Source and destination MAC addresses
			2. Decapsulation - MAC addresses will be stripped off and the packet is handed over to the Network layer (for further routing and forwarding)
			3. Happens at each device on the path
	3. Error detection and correction
	4. Medium access
	5. Physical addressing or MAC addressing
4. Sub-layers
	1. LLL
		1. Communicate and interface with upper layers of OSI model
	2. MAC
		1. Controls media access for the network (controlled and governed)
		2. **How and who is going to access the media and at what time**
		3. CSMA/CD - Sub-protocol - Used for collision detection and prevention
			1. CSMA - Carier Sense Multiple Access
			2. CD - Collision Detection
5. MAC Address Format - called physical addressing
	1. It is 48 bits in length
		1. Organizational Unique Identifier (OUI) - 24 bits
			1. Cisco (say) - manufacturer of NICs
		2. Vendor Assigned (NIC cards, Interfaces) - 24 bits
			1. particular device
	2. The address is assigned to the NIC (We connect a cable)
6. What is the need for MAC address?
	1. Suppose there is a LAN
	2. Suppose there are 10 systems in the LAN
	3. Suppose MAC is not assigned
		1. How to identify the systems in the network?
			1. They don't have any identity or name
	4. MAC is a hard-coded unique ID on the NIC
	5. Layer-2 identifies any computer system available in the network
7. What is the need for IP addresses?
	1. MAC address is like a name
		1. Many people might have the same name
	2. IP address is like house number
8. Next
	1. Collision domain
	2. Segmentation of network into vlans
	3. How switch works (at layer 2)

### Unicast, Broadcast and Multicast ###
1. Terminology
	1. Unicast - communication where a frame is sent from one host addressed to a specific destination.
		1. There is one sender and one receiver
	2. Broadcast - when a frame is sent from one address to all other devices
		1. There is one sender and multiple receivers
			1. Receivers are connected clients or devices

### How Switch Works ###

## Layer 3 Networks ##
### IP Address ###
### Subnet ###
### Routing ###

## Key Concepts ##
### Key Networking Concepts Part-1 ###
### Key Networking Concepts Part-2 ###

## Career Options ##
### Career Options in Networking ###