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
13. Control Register: I2C_CR2
	1. Fields
		1. Reserved: 15 to 13
		2. LAST (rw)
		3. DMEAN (rw)
		4. ITBUFEN (rw)
			1. **Used to enable interrupt**
				1. Receive buffer not empty (Flag: RxNE)
				2. Transmit buffer empty (Flag: TxE)
				3. Start bit sent (Master) (Flag: SB)
				4. Address sent (Master) or Address matched (Slave)
		5. ITEVFEN (rw)
			1. **Used to enable interrupt**
				1. The following interrupts will get enabled:
					1. Start bit sent (Master) (Flag: SB)
					2. Address sent (Master) or Address matched (Slave) (Flag: ADDR)
					3. 10-bit header sent (Master) (Flag: ADD10)
					4. Stop received (Slave) (Flag: STOPF)
					5. Data byte transfer finished (BTF)
		6. ITERREN (rw)
			1. **Used to enable interrupt**
				1. The following interrupts will get enabled:
					1. Bus error (Flag: BERR)
					2. Arbitration loss (Master) (Flag: ARLO)
					3. Acknowledge failure (Flag: AF)
					4. Overrun/Underrun (Flag: OVR)
					5. PEC error (Flag: PECERR)
					6. Timeout/Tlow error (Flag: TIMEOUT)
					7. SMBus Alert (Flag: SMBALERT)
		7. Reserved: 7, 6
		8. FREQ: 5 to 0 (rw - all)
14. Status Register: I2C_SR1
	1. Fields:
		1. SMB ALERT (rc_w0)
		2. TIME OUT (rc_W0)
		3. Res
		4. PEC ERR (rc_w0)
		5. OVR (rc_w0)
		6. AF (rc_w0)
		7. ARLO(rc_w0)
		8. BERR (rc_w0)
		9. TxE (r)
			1. Set if data buffer is empty (during data transmission)
			2. Not set during address phase
		10. RxNE (r)
			1. Set if data buffer is not empty
				1. Firmware can read the new data
			2. Not set during address phase
		11. Res
		12. STOPF (r)
			1. Checked by master to know the status of stop bit (success/failure) (if it is set in slave)
		13. ADD10 (r)
			1. Checked by master to know the status of address bit (success/failure)
		14. BTF (r)
		15. ADDR (r)
			1. Checked by master to know the status of address bit (success/failure)
				1. If it is set in slave node, the address is successfully matched
		16. SB (r)
			1. Checked by master to know the status of start bit (success/failure)
15. Clock Register: I2C_CCR:
	1. Fields
		1. F/S
		2. DUTY
		3. Reserved
		4. CCR[11:0] (rw)
			1. Used to program the clock for I2C communication
			2. Formula to calculate the value:
				1. T_high = CCR * T_PCLK (peripheral clock: 1/10 MHz = 0.1 us)
					1. T_PCLK = 0.1 micro sec
					2. T_SCL = 1/f_SCL = 1/100 khz = 10 micro sec
						1. T_SCL = T_high + T_low = 10 micro sec
					2. Duty cycle = 1:1
						1. T_high = 10/2 = 5 micro sec
						2. CCR = T_high/T_PCLK = 5/0.1 = 50 or 0x32
16. Steps for APIs
	1. Required for both Master & Slave:
		1. Set communication mode: Standard or Fast
		2. Set communication speed by setting CCR
		3. Set duty cycle
		4. Select Pin-packs
		5. Enable interrupts: Event, Buffer, Error
			1. **Only if interrupt is used instead of polling**
		6. Enable Byte ACK
		7. Enable I2C Peripheral
	2. Only for Slave:
		1. Set I2C slave address
		2. Enable clock stretching (if required)
17. How master transmits a Byte?
	1. Step 1: Update BUSY Flag to Busy
	2. Step 2: Generate START condition
	3. Step 3: Wait until successful START sent event. (SB-bit)
	4. Step 4: Write SLAVE address in data buffer
	5. Step 5: Wait until successful address sent event. (ADDR bit)
	6. Step 6: Wait until ACK bit not received. (with some timeout)
	7. Step 7: Write DATA in data buffer
	8. Step 8: Wait until ACK bit not received. (with some timeout)
	9. Step 9: Generate STOP condition
	10. Step 10: Update BUSY Flag to Free
18. How Master Receives a Byte?
	1. Step 1: Update BUSY Flag to Busy
	2. Step 2: Generate START condition
	3. Step 3: Wait until successful START sent event. (SB bit)
	4. Step 4: Write SLAVE address in data buffer
	5. Step 5: Wait until successful address sent event. (ADDR bit)
	6. Step 6: Wait until ACK bit not received. (with some timeout)
	7. Step 7: Wait for Buffer interrupt
	8. Step 8: Read data from DATA buffer
	9. Step 9: Generate STOP condition
	10. Step 10: Update BUSY Flag to Free

## SPI - Driver Development ##
1. Topics
	1. How SPI Hardware works?
	2. What are Shift Registers?
	3. SPI Control & Status register
	4. How to configure?
	5. Transmit & Receive Handler
2. Serial Peripheral Interface
	1. **Full-Duplex**, **Serial** Communication Protocol
	2. **Synchronous** Communication Protocol
	3. **Four Wire** Communication Protocol
	4. **Single**-Master **Multi**-slave
	5. Widely used for short-distance communication, primarily in Embedded Systems
3. Master:
	1. Clock (SCLK) is configured with frequency supported by the slave device
	2. GPIOi pin is pulled to 0 to select a slave
	3. To stop communication
		1. Master stops the clock signal
		2. Master pulls GPIOi pin to 1 to de-select the slave
4. Communication:
	1. Shift registers are used to communicate from master to slave and slave to master
		1. Shift register (Master has one and slave has one)
			1. On each clock signal, master shifts a bit from Master Shift register to Slave shift register over MOSI line
				1. A bit shift also occurs from Slave shift register to Master shift register over MISO line
			2. At 8th clock cycle, the data of master and slave are swapped
		2. Advantages:
			1. Communication is cheap and easy using shift register is easy as compared to UART and I2C
	2. CPOL (Clock Polarity) (needs to be configured for both master and slave)
		1. CPOL = 0 - Non-inverted (active state = 1)
		2. CPOL = 1 - Inverted (active state = 0)
	3. CPHASE (Clock Phase)
		1. When data has to be toggled
		2. When data has to be sampled
			1. CPHASE = 0 - Data is sampled at leading edge of the clock
			2. CPHASE = 1 - Data is sampled at trailing edge of the clock
			3. There are 4 modes:
				1. Mode 0: 0 (CPOL), 0 (CPHASE)
				2. Mode 1: 0, 1
				3. Mode 2: 1, 0
				4. Mode 3: 1, 1
5. STM32F4:
	1. MOSI line
	2. MISO line
	3. SCK line
	4. NSS line (for chip select)
	5. Rx buffer (connected to shift register)
	6. Tx buffer (connected to shift register)
	7. Control registers - 2 (configure SPI communication)
		1. CR1:
			1. Fields (all are rw)
				1. BIDI MODE
				2. BIDI OE
				3. CRC EN
				4. CRC NEXT
				5. DFF
				6. RX ONLY
				7. SSM
				8. SSI
				9. LSB FIRST
				10. SPE - enables SPI peripheral
				11. BR [2:0] - clock config (should not be changed when communication is ongoing) - not used in I2S mode
					1. 000: fPCLK/2 (fPCLK = 16 Mhz say)
					2. 001: fPCLK/4
					3. 010: fPCLK/8
					4. 011: fPCLK/16
					5. 100: fPCLK/32
					6. 101: fPCLK/64
					7. 110: fPCLK/128
					8. 111: fPCLK/256
				12. MSTR - 1 - master, 0 - slave
				13. CPOL (need to configure) - 0 - default
				14. CPHA (need to configure) - 0 - default
		2. CR2:
			1. Fields
				1. Reserved: [15:8]
				2. TXEIE (rw) - set for interrupt 
				3. RXNEIE (rw) - set for interrupt
				4. ERRIE (rw)
				5. FRF (rw)
				6. Res
				7. SSOE (rw)
				8. TXDMAEN (rw)
				9. RXDMAEN (rw)
	8. Status register (status of verious events)
		1. SPI_SR:
			1. Fields
				1. Reserved: [15:9]
				2. FRE (r) - set if there is communication error
				3. BSY (r) - set if there is communication error
				4. OVR (r) - set if there is communication error
					1. Over-run
				5. MODF (r) - set if there is communication error
				6. CRC ERR (rc_w0) - set if there is communication error
					1. CRC mismatch
				7. UDR (r) - set if there is communication error
					1. Under-run
				8. CHSIDE (r) - set if there is communication error
				9. TXE (r) - when Tx buffer is empty, this gets set when data is successfully transmitted
				10. RXNE (r) - when Rx buffer is not empty, this get set when data is successfully received
	9. SPI Driver API Requirements:
		1. Initialization: Master and Slave
			1. Configuring SPI mode
			2. Clock setting
			3. ...
		2. API for transmission and reception of data
			1. Tx handler
			2. Rx handler
		3. Event interrupt handler to handle master and slave interrupts
	10. Init API
		1. Steps:
			1. Master or Slave: MSTR bit
			2. Set communication mode: COPL, CPHASE
			3. Set communication speed
			4. Data size: 8 or 16 bit
			5. Direction: LSB or MSB
			6. Select Pin-packs
			7. Enable interrupts
			8. Enable SPI Peripheral
	11. How Master transmits n Bytes?
		1. Step 1: Update BUSY Flag to Busy
		2. Step 2: Copy data into Data buffer
		3. Step 3: Update Length information (global buffer)
		4. Step 4: Reset SLAVE select GPIO (selects a slave)
		6. Step 6: Enable Transmit Interrupt
	12. How Master receives n Bytes?
		1. Step 1: Update BUSY Flag to Busy
		2. Step 2: Copy Dummy data into Data buffer
		3. Step 3: Update Length information (global buffer)
		4. Step 4: Reset SLAVE select GPIO (selects a slave)
		5. Step 5: Enable Receive interrupt
		6. Step 6: Enable Transmit Interrupt

## GPIO Output Configuration ##
1. Push-Pull config:
	1. Default config
	2. Connection:
		1. Input is connected to an inverter
		2. Inverter output is connected to PMOS and NMOS Gates
		3. +VCC is connected to Source of PMOS
		4. Drain of PMOS is connected to NMOS
		5. Source of NMOS is grounded
		6. Drain is connected to current limiting resistor
		7. Other end of resistor is connected to Anode of LED
		8. Cathode of LED is grounded
	3. If Input is 1, PMOS gate is 1 (gate is opened)
		1. PMOS will conduct and LED is turned on (pushed to +VCC)
	4. If Input is 0, PMOS gate is 0 and NMOS gate is 1
		1. NMOS is on and PMOS is off so LED is turned off (pulled to ground)	
2. Open Drain config
	1. Only NMOS is active (PMOS is not in picture)
	2. If Input is 0, NMOS gate is 1 and turned on then output is 0
	3. If Input is 1, NMOS gate is 0 and output is floating
3. Open Drain with Pull-up resistor:
	1. +VCC is connected across resistor to NMOS
		1. Two configs
			1. Internal Pull-up resistor
				1. Configured using GPIO control register (activation)
			2. External Pull-up resistor
	2. Operation:
		1. If Input is 1: NMOS is turned off
			1. Output is pulled to VCC
				1. LED is turned on
		2. If Input is 0: NMOS is turned on
			1. Current flows through NMOS
				1. Output is pulled down to 0
					1. LED is turned off

## CAN Protocol ##
1. CAN: Controller Area Network (CAN bus)
2. No host required
3. CAN bus is a broadcast type of bus
	1. Each node can listen to the messages in the network
	2. Node:
		1. IO device
		2. Sensor
		3. Embedded controller
		4. General purpose computer (can communicate over USB or ethernet)
4. It is a message based protocol
	1. message has id
	2. priority of message is decided
	3. Node identification is not required
	4. Easy to add or remove nodes
5. It is based on serial half-duplex asynchronous communication
	1. No need of clock signal to synchronize data between two nodes
6. It uses differential two wired communication
	1. Twisted pair
	2. 120 ohm characteristic impedence
		1. Connected at each end
7. Originally designed for automobiles
	1. Now it is used for others
8. It is one of the five protocol used in on board diagnostics
9. Why CAN?
	1. Due to increase in Electronic Control Units (ECUs)
	2. 70+ ECUs in modern vehicle
		1. Engine control unit
		2. Ignition
		3. Power window
		4. transmission
		5. Mirror adjustment
		6. Airbag
		7. ABS
		8. Doors
		9. Dashboard
	3. If all communicating nodes are connected one to one, speed of communication is high but complexity, number of connectors and cost is also high.
		1. Solution: CAN Bus
			1. Two wires:
				1. CAN high
				2. CAN low
			2. Advantages
				1. Low cost (only two wires)
				2. Efficient
				3. Flexible (nodes can be added and removed)
				4. Centralized
	4. Applications:
		1. Automotive (Passenger vehicles, trucks, buses)
		2. Electronic equipment for aviation and navigation
		3. Industrial automation and mechanical control
		4. Elevators & escalators
		5. Building automation
		6. Medical instruments and equipment
		7. Marine, Military, Industrial, Medical
10. Topics:
	1. Architecture
	2. Standards
	3. Versions
11. OSI model
	1. Open System Interconnection model
		1. Application
		2. Presentation
		3. Session
		4. Transport
		5. Network
		6. Data Link
		7. Physical
	2. CAN defines two layers
		1. Data Link (for node to node data transfer) - defines protocol to establish and terminate the connection, detect and correct errors that might have occurred at physical layer
			1. LLC - Logical Link Control
				1. Frame acceptance filtering
				2. Overload notification
				3. Recovery management
			2. MAC - Medium Access Control (defines now devices get access to the medium)
				1. Medium access
				2. Encapsulation/Decapsulation
				3. Error detection
				4. Signalling
		2. Physical (responsible for transmission and reception of raw data)
			1. PLS - Physical Layer Signalling
			2. PMA - Physical Medium Attachment
			3. PMS - Physical Medium Specification
				1. Voltage
				2. Timing
				3. Data rates
				4. connector
			4. MDI - Medium Dependent Interface
		3. CAN spec defines
			1. CAN Protocol (Data Link)
				1. ISO 11898-1 (part 1)
					1. spec for DLL (LLC, MAC)
					2. spec for PLS (signalling in physical layer)
			2. CAN Physical Layer (Physical layer)
				1. ISO 11898-2 (part 2) - (PMA & PMS) - for high speed
					1. Upto 1 Mbps (usually used in power drain and chasis area of the vehicle)
				2. ISO 11898-3 (part 3) - (PMA & PMS) - for low speed
					1. Upto 125 kbps (if communication speed is not critical)
			3. CiA DS-102 (MDI - Physical layer) - CAN in Automation
				1. Defines spec for CAN connector
		4. Implementation:
			1. CAN Controller (Covers ISO 11898-1)
				1. Implemented in software (with the help of application, OS and network management functions)
			2. CAN Transceiver (Covers ISO 11898-2 or 3)
				1. Implemented in software (with the help of application, OS and network management functions)
			3. CAN Bus Medium (Covers ISO 11898-2 or 3)
12. CAN Versions:
	1. CAN 2.0 (1991)
		1. CAN 2.0 A
			1. This part is for standard format (11 bit identifier included)
		2. CAN 2.0 B
			1. This part is for extended format (29 bit identifier included)
13. CAN Frame Format:
	1. Standard Data Format
	2. Extended Data Format
14. CAN Framing:
	1. Standard Data Frame:
		1. Fields
			1. SOF - Start of Frame bit
			2. Arbitration Field (message identifier)
				1. Identifier - sets the priority of the data frame - 11 bits
					1. Used for arbitration
				2. RTR - Remote Transmission Request defines frame type (data frame or remote frame) - 1 bit
			3. Control Field (user defined functions)
				1. IDE - Identifier Extension
					1. Dominant IDE bit indicates 11 bit standard frame identifier
						1. Fields of Standard frame identifier:
							1. Identifier
							2. RTR
					2. Resessive IDE bit indicates 29 bit extended frame identifier
						1. Fields of Extended frame identifier:
							1. Base Identifier
							2. SRR
							3. IDE
							4. Extended Identifier
							5. RTR
				2. r
				3. DLC - Data Length Code (4 bits)
					1. Defines length of data in data field
						1. 0 to 8 bytes
							1. DLC3 | DLC2 | DLC1 | DLC0
							2. 0 | 0 | 0 | 0 - 0 bytes
							3. 0001 - 1 byte
							4. 0010 - 2 bytes
							5. 0011 - 3 bytes
							6. 0100 - 4 bytes
							7. 0101 - 5 bytes
							8. 0110 - 6 bytes
							9. 0111 - 7 bytes
							10. 1000 - 8 bytes
			4. Data Field (actual data)
			5. CRC Field - Cyclic Redundancy Check for Error (Data corruption) detection - 15 bits - Sender computes and sends, then receiver computes again and if it does not match, receiver sends an error frame
				1. CRC Sequence
				2. DEL
			6. ACK Field - Acknowledgement - interesting mechanism
				1. ACK
				2. DEL
			7. EOF - End of Frame bit - End of Frame (7 bits - resessive)
		2. Other Fields
			1. ITM 
15. Topics
	1. CAN Electrical Characteristics
		1. Dominant
		2. Recessive
	2. CAN Node elements
		1. Host - uP or uC (running application to do a specific job)
			1. Decides what received message means and what it wants to send next
		2. CAN Controller
			1. Deals with communication functions prescribed by the CAN protocol
			2. Triggers interrupt upon transmission or reception of messages
		3. CAN Transceiver
			1. Responsible for transmission and reception of Data on the CAN bus
				1. Converts CAN signal collected from the Bus into stream of data which can be understood by the CAN controller
	3. Unshielded twisted line is used to transmit and receive Data (Can BUS)
		1. CANH - CAN High line
		2. CANL - CAN Low line
	4. Transmission:
		1. Occurs by applying differential voltage to the lines
			1. Twisted pair?
				1. In automobile, the environment can cause a lot of data loss or corruption due to noise
					1. Ignition system
					2. Motors
					3. ...
				2. Twisting of lines reduces magnetic field
				3. Bus is terminated with 120 ohm resistance at each end
		2. Logic 0 - dominant
		3. Logic 1 - recessive
			1. If both CANH and CANL are applied with 2.5 V, the differential voltage is 0 - read by transceiver as logic 1
				1. Ideal state of the bus
				2. Not possible for any other node to drive the logic to recessive when one node drives it to dominant
					1. dominant state dominates recessive state
			2. If CANH is pulled high to 3.5 V and CANL is pulled down to 1.5 V, the differential voltage is 2 V - read by transceiver as logic 0
3. Arbitration:
	1. If two or more nodes sends messages at the same time
		1. Which node should be given priority?
			1. Wired-AND Logic is used:
				1. Sender 1:0 1 0 1 0 1 0 1
				2. Sender 2:0 0 1 1 0 0 1 1
				3. Sender 3:0 0 0 0 1 1 1 1
				4. CAN Bus :0 0 0 0 0 0 0 1
			2. If Different senders send dominant and recessive simultaneously, then BUS remains dominant
			3. If All senders send recessive simultaneously, then BUS is recessive
		2. Implementation of AND logic
			1. Using open collector circuit
		3. Smaller the message ID, higher the priority (can be decided during design time)
			1. Examples:
				1. Flow chart:
					1. Wish to send a message
					2. Bus is monitored (until it is free)
					3. If can bus is idle, send SOF (dominant bit to take bus access)
					4. Then send next ID bit (MSB)
						1. If node detects dominant bit while it has sent a recessive bit, (if bus level != sent level)
							1. Node has lost the arbitration and stops sending further bits
							2. Waits until bus is free again
			2. Example:
				1. CAN Node
					1. 1 - 0x7F3 - 11111110011
					2. 2 - 0x6B3 - 11010110011
					3. 3 - 0x6D9 - 11011011001
				2. Suppose all three are transmitting at once
					1. First bit is recessive
						1. First bit - all are recessive
						2. Second bit - all are recessive
						3. Third bit - 2 & 3 send dominant bits (1 has lost arbitration)
						4. Fourth bit - 2 & 3 send recessive bits
						5. Fifth bit - 2 sends dominant bit (3 has lost arbitration)
						6. Henceforth 2 continues to hold the bus and complete
4. Topics
	1. Data Frame
	2. Remote Frame
	3. Differences
5. CAN Framing:
	1. Differences
		1. Data frame - consists of actual data
		2. Remote frame - is a request message from any other node - no data field
		3. Example:
			1. If say Node C wants temperature, it sends a remote frame (request) with same message id
			2. If say Node A is responsible for sending the information, it sends the data
	2. Another difference: RTR
		1. For Data frame - RTR is dominant (takes precedence over remote)
		2. For Remote frame - RTR is recessive (loses arbitration if Data frame is available on the bus)

## UART ##
1. Universal **Asynchronous** Receiver-Transmitter
	1. Asynchronous: No clock signal required to synchornize or validate the data from transmitter
	2. Synchronous: Clock signal is shared between tramsitter and receiver to synchronize the data
2. **Serial** communication protocol
	1. Parallel - multiple wires are used to conver binary info simultaneously (8 bits ...)
		1. Higher speed of data transmission
	2. Serial - only single bit at a time
		1. Bits are sent sequentially over single wire
			1. Channel size and cost is reduced
3. **Two wires** required for communication
4. Data **format** & transmission **speed** are configurable
5. How does work?
	1. TX pin of device 1 (transmitter) is connected to RX pin of device 2 (receiver)
	2. RX pin of device 1 (transmitter) is connected to TX pin of device 2 (receiver)
	3. GND of both devices are connected to common ground
	4. How does reciever know when to read the data if there is no clock signal?
		1. Data synchronization in UART:
			1. Baud rate: timing parameters must be agreed by both
			2. Start & Stop bits: used to to mark the beginning and end or each data byte respectively
	5. Baud Rate:
		1. Baud rate is a measure of the speed of data transfer, expressed in bits per second (bps)
			1. 2400 bps
			2. 4800 bps
			3. 9600 bps
			4. ...
			5. 256000 bps
		2. Needs to be configured in both the devices
6. UART Data frame:
	1. Idle - high voltage (line is held is high) - shows line and transmitter are not damaged
	2. Start bit - 0
	3. Stop bit - 1 or more (logic high state) - signals characters are completed
	4. Data bits
		1. 5 - 9 bits (depends on config)
	5. Parity bit (optional) (after data bits)
7. Transmission:
	1. All characters will be send from transmitter to receiver in the same format
	2. Parity bit:
		1. Used by receiver for error detection - to check if data has got corrupted during transmission
8. UART Configuration:
	1. Three ways
		1. Simplex: One way communication (no tramission from reciever to sender)
		2. Half duplex: Can happen in both direction but not at the same time
		3. Full duplex: Can happen in both direction and at the same time
9. Advantages:
	1. Only uses two wires
	2. No clock signal is necessary
	3. Provide error detection by Parity bit check
	4. Cost & size will be much lesser compared to the parallel communication
10. Disadvantages:
	1. Size of data frame is limited to a max of 9 bits
	2. Doesn't support multiple slaves or multiple master systems
	3. Limited speed is the bottlenect for the application which requires higher data transmission rate
11. Configuration:
	1. UART functional block
	2. Control, Data & Status Register
	3. Configuration of Start & Stop bit
	4. Significance of Parity Bit
	5. UART Baud Rate Calculation
12. STM32F4: Support synchronous and asynchronous
	1. Since UART supports full duplex:
		1. There are two sets of registers:
			1. Transmit data register (TDR)
			2. Transmit Shift Register
			3. Receive data register (RDR)
			4. Receive Shift Register
		2. 3 Control registers
		3. 1 Status register
		4. Baud rate generation block
	2. Control register 2 (USART_CR2)
		1. Fields
			1. Res
			2. LINEN (rw)
			3. **STOP[1:0] (rw, rw)**
				1. 00: 1 stop bit
				2. 01: 0.5 stop bit (not available for UART4 & 5)
				3. 10: 2 stop bits (for higher baud rate)
				4. 11: 1.5 stop bit (not available for UART4 & 5)
			4. CLKEN (rw)
			5. CPOL (rw)
			6. CPHA (rw)
			7. LBCL (rw)
			8. Res
			9. LBDIE (rw)
			10. LBDL (rw)
			11. Res (rw)
			12. ADD[3:0] (rw - all)
	3. Parity bit, is bit added to string of binary code to ensure that the total number of 1-bits in string is even or odd
		1. Simplest method of error detection
	4. Two variants of parity bits:
		1. Even parity: results in even number of 1s (number of 1s including the parity bit is even)
			1. 0x55 - 01010101 - 4 1s (even) - parity bit is 0
			2. 0x54 - 01010100 - 3 1s (odd) - parity bit is 1
		2. Odd parity: (number of 1s including parity bit is odd)
			1. 0x55 - parity bit is 1
			2. 0x54 - parity bit is 0
	5. Control register 1: (USART_CR1)
		1. Fields: (rw - all)
			1. OVER8
			2. Reserved
			3. **UE**
			4. **M** - 8 or 9 bits word length
			5. WAKE
			6. **PCE** (parity control)
			7. **PS** (parity control)
			8. PEIE
			9. **TXEIE** (Transmit interrupt enable)
			10. **TCIE** (Transmit interrupt enable)
			11. **RXNEIE** (Transmit/Receive interrupt enable) - if interrupt is used instead of polling
			12. IDLEIE
			13. **TE**
			14. **RE**
			15. RWU
			16. SBK
	6. Status register (USART_SR) - set by the hardware
		1. Fields
			1. Reserved [31:26]
			2. CTS (rc_w0)
			3. LBD (rc_w0)
			4. **TXE** (r) (on successful transmission)
			5. TC (rc_w0)
			6. **RXNE** (rc_w0) (on successful reception)
			7. IDLE (r)
			8. ORE (r)
			9. NF (r)
			10. FE (r)
			11. PE (r)
	7. USART_BRR (register for baud rate)
		1. Value:
			1. DIV_Mantissa
			2. DIV_Fraction
		2. Calculation: f_PCLKx(x=1,2) - UART peripheral clock can be used to calculate baud rate value
	8. Fractional baud rate generation:
		1. Tx/Rx baud = f_CK/(8 x (2 - OVER8) x USARTDIV)
			1. f_pCLK (UART Peripheral Clock) = 16 MHz
				1. Baud rate: 9600 bps
				2. OVER8 = 0 (Oversampling by 16)
			2. USARTDIV = 16M/(8 x 2 x 9600) = 104.17
			3. After correcting the UART error = 104.1875
				1. Mantissa - 12 bits
					1. 104 * 104 = 0x68
				2. Fraction - 4 bits
					1. 0.1875 * 16 = 0x3
			4. USART_BRR = 0x683