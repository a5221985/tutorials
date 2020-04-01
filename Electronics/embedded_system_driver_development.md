# Embedded System Driver Development #
## I2C - Driver Development ##
1. Steps:
	1. Initialize
	2. Configure
	3. Tx Rx interrupts
2. Master and slave nodes
3. Inter-Integrated Circuit
	1. Invented in 1989 by Philips Semiconductors
	2. **Half-Duplex**, **Serial** Communication protocol
		1. Only one data line so half-duplex
	3. **Synchronous** communication protocol
	4. **Two wire** communication protocol
		1. Data line
		2. Clock line
	5. **Multi**-master **Multi**-slave
	6. Widely used for short-distance, intra-board communication
		1. Microcontrollers
		2. Sensors
		3. EEPROMs
4. I2C Node
	1. Vcc - connected to C ends of darlington pair across two resistors
	2. B terminals of darlington are inputs
	3. E termals are ground
	4. First transistor is SCL
	5. Second transistor is SDA
5. Case 1: Master wants to write 1 Byte
	1. First Byte from Master:
		1. Start condition: 1 bit is to get control of slave
		2. 7 or 10 bits: slave address
		3. R/W bit: Write(0), Read(1)
		4. This is address phase
	2. If slave is available: the following data is sent
		1. 1 ACK bit
	3. Second Byte from Master:
		1. Data byte
	4. Slave response for the byte:
		1. 1 ACK bit
			1. For each packet from master, Slave will respond with 1 ACK bit
	5. 
	
	