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
	3. Multicast - Where a destination address is a specific group of devices or clients
		1. One to many
	4. Collision - it is a situation that occurs when 2 or more systems propagate data at the same time in the same network
		1. Signals will interfere (collision)
	5. Collision domains - are connected physical network segments where collision can occur
		1. Each switch port is separate collision domain (multiple devices can be connected to a switch port)
			1. Whatever device is connected to the switch port is part of the same collision domain
	6. Broadcast domain - is a group of collision domains that are connected by Layer-2 devices (which does not have a vlan)
	7. Broadcasts
		1. Are forwarded by layer-2 devices and if excessive, can reduce efficiency of entire LAN
		2. Controlled by layer-3 devices
			1. layer-1 & layer-2 devices cannot control broadcasts (directly)
				1. We need to configure vlan for layer-2 device to control broadcast
2. Single collision domain with single broadcast domain
	1. Layer-1 device - hub
		1. It just forwards data (doesn't look at data) - on all ports
			1. It forms a single collision domain
		2. Single broadcast domain
			1. If data is received, it is broadcast to all other systems connected to hub
3. Multiple collision domain with single broadcast domain
	1. Layer-2 device - switch
		1. Each port is a separate collision domain
	2. Broadcast domain is still single (?)
4. VLAN
	1. It is used to segregate broadcast domains
		1. Example:

				Cisco router -fast ethernet-> switch -> server (floor 1)
								-fast ethernet-> switch -> server (floor 2)
								-fast ethernet-> switch -> server (floor 3)
								
			1. All servers belong to Engineering VLAN (Virtual LAN)
		2. Segregation might be based on teams or departments in an organisation (data can be kept separate)
			1. Engineering department (VLAN1)
			2. Marketing department (VLAN2)
			3. HR (VLAN3)
			4. Payrol (VLAN4)
		3. Each VLAN does not reach out to other VLANs unless we configure them to do so
	2. VLANs are logically separated segments
		1. It can span multiple switches
			1. Suppose systems attached to switch are in different VLANs
				1. Hence the systems are part of 
					1. Multiple collision domains (part of separate port)
					2. Multiple broadcast domains (part of separate VLAN)
5. Next: How switch works and how is it useful

### How Switch Works ###
1. If switch receives a frame on any port, it checks what to do with the frame
2. How does switch work?
	1. mac address table

			show mac address-table
			
			Vlan	Mac Address	Type		Ports
			1		1.2.3.4		Dynamic	Gi0/1
			1		5.6.7.8		Dynamic	Gi0/3
			
			Total Mac addresses for this criterion: 2
			
		1. Switch has 4 ports: Gi0/1, Gi0/2, Gi0/3, Gi0/4
	2. Working principle
		1. If switch receives a frame with unknown destination address,
			1. Switch will forward the frame to all ports except the port on which it received
		2. The which ever system knows the mac address will respond back to switch
		3. Switch will update it's mac table
			1. To the port
3. Case - 1
	1. Source MAC address - 1.2.3.4, Destination MAC Address - FFFF:FFFF:FFFF (all Fs is broadcast address)
	2. Frame will be forwarded to all ports except the port on which it was received
4. Case - 2
	1. If destination is unicast and the address is in MAC address table and the associated ports is not the port on which frame was received, it will be forwarded to destination port
	2. Source MAC address - 1.2.3.4, Destination MAC address - 5.6.7.8
5. Case - 3
	1. If destination is unicast and the address is in the address table
		1. It will be forwarded to all ports except the port on which it was received
	2. Source MAC address - 1.2.3.4, Destination MAC Address - 10.11.12.13
6. Case - 4
	1. Otherwise, frame will be dropped
		1. Example
			1. Source and destination are same and MAC address table is showing the frame received on port which is the destination port as well
	2. Source MAC address - 1.2.3.4, Destination MAC address - 1.2.3.4
7. How switch works
	1. A frame is received
	2. If destination is a broadcast, forward it on all ports except the port on which it was received
	3. If destination is a unicast and the address is in MAC address table and the associated port is not the port on which frame was received, it will be forwarded to destination port
	4. If destination is a unicast and the address is not in address table, ti will be forwarded to all ports except the port on which it was received
	5. Otherwise, frame will be dropped
8. Benefits of Layer-2 networks
	1. Number of collisions is reduced
		1. Each switch port is part of a separate collision domain
	2. Simultaneous multiple communications
		1. Collision domains are separate (parallel communications are possible)
	3. High-speed uplinks
		1. Multiple collision domains increased parallelism
	4. Improved network response
		1. Performance improvement
	5. Increased User productivity
		1. Due to higher performance

## Layer 3 Networks ##
### IP Address ###
1. Topics
	1. Routing
	2. IP addressing
	3. Classes of IP addresses
	4. Functions of Layer-3 device (router)
2. Layer-3 Networks
	1. Responsible for navigating the data through the network
	2. Provide the best path through the network
	3. Layer-3 uses network layer addressing (IP addresses)
	4. Router's operate at layer-3
3. IP addressing - logical addressing
	1. MAC address is hard code but IP address is dynamically generated
	2. It is 32 (4 bytes) in length
		1. Street, house analogy
	3. Decimal format: example - 203.104.76.5
4. Classes:
	1. Class A: Byte1 (network), Byte2 (Host), Byte3 (Host), Byte4 (Host)
		1. Range: 1.0.0.0 - 127.255.255.255.255 (01.00.00.00 - 7F.FF.FF.FF)
	2. Class B: Byte1 (network), Byte2 (Network), Byte3 (Host), Byte4 (Host)
		1. Range: 128.0.0 - 191.255.255.255 (80.00.00.00 - BF.FF.FF.FF)
	3. Class C: Byte1 (network), Byte2 (Network), Byte3 (Network), Byte4 (Host)
		1. Range: 192.0.0.0 - 223.255.255.255 (C0.00.00.00 - DF.FF.FF.FF)
	4. Class D: MULTICAST Range 224.0.0.0 (E0.00.00.00) to 239.255.255.255 (EF.00.00.00)
	5. Class E: Reserved range
		1. For research and development
5. Network part - identifies the network it is part of
6. Host part - identifies the end host in the network
	1. Range tells how many hosts can be acommodated in the network
7. Analogy
	1. Network address - street address (identifies the area)
		1. Tells which network in network of networks is the host in 
	2. Host address - house address (required after reaching area)
8. Two categories (Due to limit on number of ip addresses)
	1. Public IP address range - routable to internet
		1. Public IP addresses are reachable from anywhere on the internet
			1. Managed by ICANN (INA (Internet Numbers Authority) is part of ICAN - allocates and manages public IP addresses)
				1. ICANN - Internet Corporation of Assigned Names and Numbers
					1. Manages autonomous system numbers and DNS domains
		2. Address range:
			1. Class A: 1.0.0.0 - 9.255.255.255, 11.0.0.0 - 126.255.255.255 (10 is missing)
			2. Class B: 128.0.0.0 - 172.15.255.255, 172.32.0.0 - 191.255.255.255 (partial 172 range is missing)
			3. Class C: 192.0.0.0 - 192.167.255.255, 192.169.0.0 - 223.255.255.255 (partial 192 range is missing)
			4. Missing address range is covered in private ip address range
	2. Private IP address range - non-routable to internet
		1. Class A: 10.0.0.0 - 10.255.255.255 (missing range)
		2. Class B: 172.16.0.0 - 172.31.255.255
		3. Class C: 192.168.0.0 - 192.168.255.255
		4. The range can be used by onyone inside a network
			1. It cannot be used for routing
				1. If we try to use this range for public IP, ISPs will have policies to drop this IP
9. Example:

		IPv4 address....: 192.168.29.158 (Preferred) (private range)
		...
		Default Gateway...: 192.168.29.1 (broadband router at the place)
			(it acts as DHCP server)
			
	1. Open whatismyipaddress.com

			122.171.68.7

### Subnet ###
1. Topics
	1. Segmentation
	2. Subneting
2. CIDR/VLSM
	1. CIDR - Classless InterDomain Routing
	2. VLSM - Variable Length Subnet Masking
3. Example - Public block - 203.140.11.0/24
	1. 2 x Subnets (2 blocks of equal length here)
		1. 203.140.11.0/25
		2. 203.140.11.128/25
	2. Single block might be difficult to manage
		1. If bigger block, it might be more difficult to manage
7. Subnetting - used to move away from classful boundaries
	1. classes - not very efficient
		1. Solution - CIDR/VLSM
			1. We can use subnetting (range of any class)
	2. Advantages:
		1. Subnetting might break down the broadcast domain (for efficiency)
		2. If there are different teams with different functions
			1. Each team needs certain routing policies to be applied (which might be different)
				1. Flat network might impact all users because same policies might need to be applied to the entire block
	3. Example:
		1. Highway system
			1. As population grows, number of vehicles might increase
		2. Similarly, if network devices grow, the amount of traffic might also grow
			1. A solution: increase bandwidth
			2. A solution: Break the large network into small subnets
				1. We can control the flow of traffic
					1. Eases burden
8. Router - Cisco
	1. Ethernet ports
	2. Power supply
	3. Function
		1. It's main job are routing and forwarding
			1. If the router recieves a packet, it should be able to route it to the appropriate output link (outgoing interface)
			2. Forwarding
				1. To appropriate output link
	4. Information
		1. It is a layer-3 device
		2. Router is a network layer device
		3. It forwards data packet from one logical network segment to another using layer-3 address (IP address)
		4. Two important tasks of a router
			1. Forwarding
				1. An arriving packet must be forwarded to the appropriate output link
			2. Routing
				1. Must determine the appropriate path that must be taken by the packet from source to destination
					1. Finds optimal path
						1. Many factors are considered to make a decision
							1. Bandwidth
							2. Latency
							3. Network condition
							4. Stability
						2. It depends on the routing protocols used
							1. Different protocols use different parameters and different factors
		5. Each router maintains a forwarding table also known as the **routing table**
	5. Example:

			172.10.10.0/24 <-> router <-> 199.100.50.0/24
							Gi0/1			Gi0/2
							
		1. Gi0/x - interface
		2. If router knows the destination (subnet mask)
			1. It simply forwards the packet to the destination

### Routing ###
1. Different types of routing
	1. Static
		1. It is based on static table route entries (manually updated)
		2. Manually constructed and updated
		3. Suitable for small networks
		4. Can be used generally when no alternate path available towards destination
	2. Dynamic
		1. Also called adaptive routing
			1. Adapts to changes in network
		2. Routing tables entries gets populated automatically
		3. Routing entries get updated automatically in case there is
			1. Any link failure
			2. Network topology changes
			3. Traffic load and congestion
2. Aotonomous system
	1. An autonomous system is a network or group of networks managed and owned by a single administrative body or organization
	2. It is a numeric number assigned by IANA (globally unique)
		1. IANA - manages public IP addresses and ASN as well
			1. ASN can be public or private
				1. It was 16 bit
				2. New ASNs are 32 bit (backward compatible with 16 bit)
	3. Key concept for internet
	4. AS can have its own routing mechanism to allow internal communication
		
			ASN						Bits	Purpose
			23457 - 64534			16		Public ASN's
			64512 - 65534			16		Reserved for Private Use
			131072 - 4199999999	32		Public 32-bit ASN's
			4200000000 -
				4294967294		32		Reserved for Private Use
	
	5. Small organizations may not require ASN
		1. ISPs ASN is sufficient
	6. If two ISPs want to pair with each other, they might possibly have own public ASN
		1. BGP routing protocol uses this
			1. Type of EGP - Exterior Gateway Protocol
	7. Each AS can have it's own routing machanism for internal communication
		1. For routing between two ASs, we need EGP
			1. Example: BGP - Border Gateway Protocol
		2. Internal routing - IGP - Interior Gateway Protocol (Also called Intra Gateway Protocol)
			1. Example: REP, REPv2, EIGRP (Cisco), IGRP (Cisco), OSPF
	8. Static routing can also be used for intra-domain routing
	9. ASN Table
		1. 16 bit - old range
			1. public & private
		2. 32 bit - new range (backwards compatible)
			1. public & private
3. IGP - Interior Gateway Protocol
	1. Intra domain routing protocol
	2. Used within an AS
	3. Examples: RIP, RIPv2, IGRP, EIGRP and OSPF
4. EGP - Exterior Gateway Protocol
	1. Inter domain routing protocol
	2. Used to route traffic among different ASs
	3. Example - BGP (Border Gateway Protocol)
5. Sample Routing Table
	1. First column: single char
		1. type of route
			1. S - Static route
				1. 10.1.1.0/27 [1/1] via 100.11.11.9
					1. It is reachable via 100.11.11.9
						1. **If traffic comes to router with destination 10.1.1.0/27 then it is known destination and next hop 100.11.11.9 is used to forward**
			2. C - Connected route - if subnet is configured on the router itself
				1. 10.1.1.32/27 is directly connected, Ethernet0/2
					1. IP address is configured on the interface Ethernet0/2
			3. L - Loopback
			4. O - OSPF
				1. O E1 - a type of route
				2. O E2 - a type of route
6. Benefits of Routing
	1. Broadcast control
		1. L3 device does this
	2. Multicast control
		1. L3 device does this
	3. Optimal path determination
		1. Main function - best path for any destination is provided
	4. Traffic management
		1. QoS policies can be implemented and we can prioritise or de-prioritise the data depending upon type of data and criticality
	5. Logical addressing
		1. Classes
			1. Private and public ranges
	6. Layer 3 security
		1. ACS - Access Control Lists - to limit or restric access

#### Summary ####
1. Function of Layer-3
2. IP Addressing
3. Different classes of IP addressing
4. Public and Private IP addresses
5. Subnetting
6. Router and how router works
7. Autonomous Systems
8. Static Routing
9. Dynamic Routing

## Key Concepts ##
### Key Networking Concepts Part-1 ###
1. Topics
	1. DHCP
	2. TCP
	3. UDP
	4. DNS
	5. R
	6. Network Address Translation (NAT)
	7. VPN

#### DHCP ####
1. DHCP - Dynamic Host Configuration Protocol (commonly and widely used in lan and wireless networks)
	1. It dynamically assigns IP address to client and provides required details
		1. If we visit a cafe or launge, we have free wifi access there
			1. We provide SSID and password and it connects (no config)
				1. DHCP is the protocol that assigns IP and provides required details to the client to communicate and connect to the network
					1. Required details?
						1. IP address
						2. Subnet mask
						3. Gateway
						4. DNS server details
	2. How does DHCP work?
		1. When new client comes online, it sends a broadcast message
			1. To check if there is any DHCP server around to assign new IP address
		2. When DHCP server (if any) receives the message, it responds with an acknowledgement
		3. Then DHCP provides details to the client
		4. The client uses the details to connect to the network

#### TCP & UDP ####
1. TCP - Transmission Control Protocol (Transport Layer)
	1. It is a connected oriented protocol
	2. It is reliable
	3. It is a bit slow
		1. It has to first establish connection with the other end
	4. Error detection and correction
	5. Flow control
		1. Windowing feature
	6. Example: FTP, SSH
2. UDP - User Datagram Protocol (Transport Layer)
	1. It is a connection less protocol
	2. It is un-reliable
		1. Best effort delivery, no guarantee
	3. It is fast
	4. Error detection only (no correction)
	5. No flow control
	6. Example: TFTP, DNS
3. Purpose - Transfer data across a network
4. Depending on type of application, TCP or UDP is used

#### DNS ####
1. DNS - Domain Name System
	1. It translates domain name to it's IP address
		1. Network understands IP address and MAC address
	2. DNS is always active
		1. Without DNS it is difficult to remember IP addresses
	3. DNS domains are managed by ICANN
	4. It is a hierarchical system

			Root DNS Server (.com, .org, .net, ...) # Top level domains are managed by this (TLD)
	
2. TLD Server (Top Level Domain)
3. Name Server
	1. Manages domain names - translates domain name to IP

4. FQDN - Fully Qualified Domain Name

		support.microsoft.com
		
	1. TLD - com
	2. Second level domain - microsoft
	3. Sub-domain - support

5. Top Level Domain - com
6. Second Level Domain - microsoft
7. Sub-domain - support
8. Example - support.microsoft.com

##### DNS Records #####
1. **A Record**
	1. DNS has database of domain name ip address mappings
	2. It maps domain names to IP address
2. **CNAME Records** (Canonical Name - it is an alias for any domain)
	1. Example: yahoo.com (www.yahoo.com)
		1. yahoo.com points to www.yahoo.com
			1. If user opens yahoo.com, it gets converted to www.yahoo.com
3. **MX Records**
	1. Point to mail exchange servers for the domain
		1. Used to deliver and receive emails for the domain
4. **PTR Records**
	1. They are reverse of **A Records**
		1. Maps IP address to domain names
5. There are other records
	1. **TXT Records** - various features and security purposes
5. Exercise
	1. Use NSLOOKUP to check what are you getting when trying to resolve microsoft.com or google.com

			> nslookup microsoft.com
			
			Server:		192.168.1.1
			Address:	192.168.1.1#53
			
			Non-authoritative answer:
			Name:	microsoft.com
			Address: 104.215.148.63
			Name:	microsoft.com
			Address: 40.76.4.15
			Name:	microsoft.com
			Address: 40.112.72.205
			Name:	microsoft.com
			Address: 40.113.200.201
			Name:	microsoft.com
			Address: 13.77.161.179
			
6. ARP - Address Resolution Protocol
	1. Communication between two end-points happens using Layer-2 MAC addresses
	2. ARP resolves Layer-3 IP address to its corresponding MAC address
	3. Devices maintain ARP table that contains IP address to MAC address mapping for known IP addresses
7. **RARP - Reverse ARP to resolve MAC address to corresponding IP address**
8. Working principle - ARP
	1. Network device receives a packet (it has IP address)
	2. It looks at the ARP table
		1. If table does not have the mapping between IP and MAC
			1. It will send special broadcast request to all routes (it might include destination)
	3. When destination receives the broadcast request, it knows that it belongs to it
		1. It returns MAC address
	4. Source will update ARP table
	5. Source will send it to the destination
9. Working principle - RARP
	1. Resolves MAC addresses to IP addresses
10. Next:
	1. NAT
	2. VPN

### Key Networking Concepts Part-2 ###
1. NAT - Network Address Translation
	1. NAT translates one or many IP addresses to another IP address (private to public, public to public, public to private, private to private)
		1. It can be 
			1. one to one
			2. many to one
			3. many to many
	2. Most widely used use case - private internal IP range gets translated to public ip address
	3. Example:

			192.168.1.10 -> Firewall (NAT) -> 203.106.150.2 (public IP)
			(private IP)
			
		1. Other functions: Port address translation
2. VPN - Virtual Private Network
	1. It is a private network connection over public network (internet)
		1. Many VPN technologies are used
	2. Protocols used:
		1. IPsec widely uses VPN protocol
			1. It is a secure protocol
				1. Used to build a VPN tunnel between between two locations over public network
	3. Types of VPN networks
		1. Intranet
		2. Extranet
		3. Remote Access
3. Example:

		Headquarters (datacentre) ----> Internet ---> Remote Branch
		
	1. A vpn tunnel can be built using VPN technology between headquarters and remote branch
		1. It is called Site to Site VPN (**Intranet VPN**)
4. Example:

		Headquarters (datacentre) --> Internet --> Remote User
		
	1. Remote user can use VPN client software and dial into VPN server (at data centre)
		1. It is called **Remote Access Services (RAS)**
5. Example:

		Headquarters (datacentre) --> Internet --> Business Partner
		
	1. To provide limited access to external uses
		1. VPN tunnel can be built between data centre and business partner
			1. This is called **Extranet VPN**
6. Protocols:

		Application layer (protocols and services offered to users)
			Telnet, rlogin
			TFTP, FTP
			SMTP
			HTTP, HTTPS
			SNMP
			DNS
			
		Presentation Layer (formats, syntax, semantics are defined here)
			RTF
			MIDI
			Quick Time Movies (format)
			MPEG
			JPEG
			
		Session Layer (establish session between end hosts)
			Xwindow
			NTFS
			SQL
			RPC
			
		Transport Layer (transmission protocols)
			TCP e.g. FTP, SSH
			UDP e.g. TFTP, DNS
			
		Network Layer
			IP - backbone of internet
			ICMP
			ARP
			RARP
			
		Data Link Layer (technology and protocols)
			Ethernet - widely used
			HDLC
			PPP
			Frame Relay
			
		Physical Layer (standards)
			EIA/TIA-449
			EIA-530
			V35
			HSSI

## Career Options ##
### Career Options in Networking ###
1. Technical paths and certification paths
	1. Technical areas
		1. Networks is the base
			1. System administration needs it
				1. Also needs
					1. Cloud technologies
					2. Network security
					3. Cyber security
		2. Certifications
			1. Top paying certifications - 2019
				1. Google Certified Professional Cloud Architect - network
				2. PMP - Project Management Professional
				3. Certified Scrum Master
				4. AWS Certified Solutions Architect - Associate - network
				5. **AWS Certified Developer - Associate** - network
				6. Microsoft Certified Solutions Expert (MCSE): Server Infrastructure - network
				7. ITIL Foundation
				8. CISM - Certified Information Security Manager
				9. CRISC - Certified in Risk and Information Systems Control
				10. CISSP - Certified Information Systems Security Professional - network
				11. CEH - Certified Ethical Hacker - network
				12. Citrix Certified Associate - Virtualization (CCA-V) - network
				13. CompTIA Security+ - network
					1. Basic level
				14. CompTIA Network+ - network
					1. Basic level
				15. Cisco Certified Networking Professional (CCNP) Routing and Switching - network
2. Levels
	1. Foundation Level Certifications
		1. CompTia Network+
		2. CompTia Security+
	2. Entry Level Certifications
		1. CEH - Certified Ethical Hacker (cyber security)
		2. Cisco
			1. CCENT (Cisco)
			2. CCNA (Cisco)
		3. Sys admin
			1. MCSA (Sys admin)
			2. RHCSA (Sys admin)
			3. Citrix Certified Associate
			4. VMWare VCA
		4. Cloud
			1. AWS Certified Associate
			2. Microsoft Azure Administrator
			3. Google Cloud Certified Associate
	3. Professional Level & Higher Certifications
		1. Offensive Security Certified Professional (OSCP)
			1. Penetration testing
		2. Cisco
			1. CISSP
			2. CCNP, CCIE (Cisco)
		3. Sys admin
			1. MCSE
			2. VCP, VCAP
		4. Cloud
			1. Professional & Cloud
			2. Architect Certifications
3. Summary
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
	3. Layer-2 Networks & Switching
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
		1. How to make career in Netowrks