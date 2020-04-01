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
	5. Master can stop at any time by generating:
		1. 1 stop bit (lines are held high for other masters to take over)
6. Start condition: master brings SDA from high to low (precondition - SCL must be high)
7. Stop condition: master brings SDA from low to high (precondition - SCL must be high)
8. Other cases: While transmitting address, data or ACK, SDA transition takes place (high to low or low to high) when SCL is low
9. I2C Driver API Requirements:
	1. Initialization of I2C Peripheral
		1. For:
			1. Master
			2. Slave
		2. Configuration steps:
			1. Configure I2C Mode
			2. Device address
			3. Clock settings
			4. ...
	2. API to handle transmission and reception of data:
		1. TX Handler (for master and slave)
		2. RX Handler (for master and slave)
	3. Event interrupt handler (for I2C TX and RX)
	4. Error Interrupt handler (handle during communication)
10. Reference: STM uC (Use Reference manual/ datasheet)
	1. I2C Main features:
		1. Standard mode: (up to 100 kHz)
		2. Fast mode: (up to 400 kHz)
	2. I2C Master: features:
		1. Clock generation
		2. Start condition generation
		3. Stop condition generation
	3. I2C Slave: features:
		1. Programmable I2C address detection mechanism
		2. Stop condition detection mechanism
	4. 2 Interrupt vectors: handlers
		1. 1 for successful address/data communication
		2. 1 for error condition
	5. ACK generation and detection mechanism for both master and slave nodes
11. Functional Block diagram of STM32F4 uC
	1. Only one buffer available for transmission and reception
		1. Only one data register is available
		2. Only one data shift register is available
	2. Address registers to slave I2C slave register
		1. Own address register
		2. Dual address register
		3. Address phase:
			1. When address is received, it is compared with the stored address and if it matches, an interrupt is generated
			2. Then the following registers are used to control and configure I2C engine
				1. Clock control Register (CCR)
				2. Control registers (CR1 & CR2)
				3. Status registers (SR1 & SR2)
12. Control Register: I2C_CR1
	1. Fields
		1. SW/RST (rw)
		2. Res
		3. ALERT (rw)
		4. PEC (rw)
		5. POS (rw)
		6. ACK (rw)
			1. **Used to generate ACK bit after each byte**
		6. STOP (rw)
			1. **Used to generate stop condition by master node**
		7. START (rw)
			1. **Used to generate start condition by master node**
		8. NO STRETCH (rw)
			1. Clock stretching is enabled by default
				1. Enable = 0, Disable = 1
			2. **Disable it for master node**
		9. ENGC (rw)
		10. ENPEC (rw)
		11. ENARP (rw)
		12. SMP TYPE (rw)
		13. Res
		14. SMBUS (rw)
		15. PE (rw) (Peripheral enable)
			1. **Must be set to 1 during initialization**
13. 
	
	