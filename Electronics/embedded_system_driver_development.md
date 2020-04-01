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
	
	