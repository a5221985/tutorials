# How to Build a Drone #
## Introduction ##
### Course Overview ###
1. Sections:
	1. **Hardware Theory:** Learn about the list of drone parts that are required for flight
	2. **Design Theory:** Learn now to spec out/choose - parts to design your own drone
	3. **Building:** Put together a Linux based Raspberry Pi drone (Follow along with the parts, or just see how the build process works)
	4. **Flight Basics:** Learn how to fly, basics of the ArduPilot firmware that runs the drone, connecting a drone to Mission Planner etc
	5. **Coding:** SSH into your drone, compile and install your own firmware, write python scripts to perform simple automated drone missions
2. Hardware: Functions of different parts and units associated with the parts
	1. Motors
	2. Electronic Speed Controllers (ESCs)
	3. Batteries
	4. Frames
	5. Flight Controllers
	6. RC/ Telemetry
7. Design: Learn how to select the parts to build your own drone:
	1. Estimating Weight of your desired drone
		1. Frame type
	2. Choosing a Thrust-to-Weight Ratio
	3. How prop, motor and battery selections define current draw and thrust estimates (Thrust and current draw are functions of those three things)
	4. The 3 different methods for estimating thrust given your selected parts
8. Building: process
	1. Soldering ESCs to a power distribution board
	2. Choosing where your various parts should fit
	3. How to fix your Flight controller to your drone
	4. How to determine the right spin direction of your motors
	5. Calibrating accelerometers, ESCs, RC endpoints, magnetometers etc
9. Flight Basics/ Setup
	1. Flight modes in ArduPilot
	2. Manual flying for beginners (Yaw, Throttle, Pitch and Roll on the RC controller and how those control the drone)
	3. Connecting your drone to Ground Control Stations
	4. How to safely charge LiPo batteries
	5. Flash OS image to micro SD card
	6. Connect your Raspberry Pi to the internet (Then your drone is connected to the internet)
10. Coding/ Technical
	1. SSH into your drone from your desktop computer/ laptop
	2. Download ArduPilot source code to your drone
	3. Compile ArduPilot firmware right from your drone (You could even be flying your drone while it is compiling new firmware!)
	4. Install your newly compiled firmware to run on your drone
	5. Write a python script for an automatic mission to make drone takeoff into the air and land (WITHOUT A CONTROLLER!)
	6. Write a python script to send velocity commands to your drone
11. Theory, engineering and design, implementation, testing, coding
	1. Starting point for other complex projects

### Different Methods of Taking this Course ###
1. Three methods
	1. Study theory and don't want to build a drone
	2. Build a drone but don't want to build the exact drone in this course
		1. Parts to build own drone (Design section)
		2. Tools
	3. Build drone along with instructor
		1. Easy help (to diagnose issues)
		2. To build the drone section

### Parts List for Course Drone ###
#### Parts List for Course Drone ####
1. If you are wanting to build the drone as seen in the lectures in this course, here are the items that are used. Items are optional if you already posses some of the parts or tools at home. Estimated cost for the drone build: ~$450-500.
2. Again, this course is still valuable if you choose not to build along with the lectures. You could also select to learn from the 'Design' section of this course, and select your own parts for a build of your own design, the choice is yours :) !

#### TO BUILD THE DRONE IN THIS COURSE: ####
1. (Optional if you already have these materials):
	1. Raspberry Pi: https://amzn.to/2HpCEBq
	2. NAVIO Kit (Need Power module, wires and GPS): https://store.emlid.com/product/navio2/?wpam_id=3
	3. ESCs 4 PACK: https://amzn.to/2F1yLAT
	4. Motors 4 PACK: https://amzn.to/2CcLVsO
	5. RC Controller: https://amzn.to/2EMCEbK
	6. Frame: https://amzn.to/2F0yeiH
	7. Props: https://amzn.to/2Cd5K3s
	8. Battery: https://amzn.to/2NTMDjx
	9. Battery Charger: https://amzn.to/2tYTsHy
	10. Telemetry: https://amzn.to/2F15LcI
	11. LiPo Fire-proof Case: https://amzn.to/2XIjBYJ
	12. PPM Encoder: https://amzn.to/2HoM0gy
	13. Micro SD Card: https://amzn.to/2CbBeGY
	14. Micro SD to USB: https://amzn.to/2SXD8R6
	15. Battery Connector: https://amzn.to/2SWv9DP or https://amzn.to/2SXmcdP
	16. GPS Mount: https://amzn.to/2SUzTtP
	17. Velcro Straps: https://amzn.to/2CfmGGC
	18. Scotch Mounting Tape: https://amzn.to/2NQpkHc
	19. Zip Ties: https://amzn.to/2NTNnVR
2. TOOLS (Optional if you already have these materials):
	1. Soldering Iron Kit: https://amzn.to/2tXe7vp
	2. Helping Hands: https://amzn.to/2NQq7b8
	3. Allen Wrench: https://amzn.to/2HpBXbk
	4. Electrical Tape: https://amzn.to/2CczbT7
3. IFF WANTING TO SECURE Raspberry Pi to Drone with Screws to Frame: (Instead of super sticky tape. If preferred to secure with sticky tape, all you need is the
	1. $5 scotch sticky tape linked above) (Optional if you already have these materials)
	2. Spacer Kit: https://amzn.to/2NTIyeY
	3. Drill and Drill Bits: https://amzn.to/2SQrZBK

## Hardware ##
### Motors ###
1. Drone Anatomy 101:
2. Motors:
	1. Different sizes and colors
	2. Spec is necessary
3. Overview:
	1. Cheap walmart drones use brushed motors. Higher quality drones use brushless motors and that is what we will be covering.
	2. Typically 3-phase motors
		1. 3 out of phase voltages are fed into the motor
	3. Main tradeoff: Rotational Speed vs Torque
		1. Either spin faster or get more torque
	4. Main current draw from battery pack
		1. Motors are biggest sources
	5. Have 3 leads that connect to the Electronic Speed Controller
		1. ESC has 3 outputs
	6. ESC produce three outputs that make the motor spin
4. Motor Anatomy:
	1. **Stator:** The part on the right. The stator does not move. (Think stator stays). Current runs through the wires to produce magnetic fields that spin the rotor (foreshadowing)
		1. Fixed component
		2. Coils get energized when current flows (alternating three phase voltages) that produce magnetic fields
	2. **Rotor:** The part on the left is the rotor. This is the part that moves. It has permanent magnets attached to it that try to align with the induced magnetic fields of the stator.
		1. Cage and shaft
		2. Cage:
			1. fixed magnets
5. KV Rating
	1. NOT TO BE CONFUSED WITH Kilo-Volts (RPMS/volt of input to motor)
	2. -KV rating tells you how fast the shaft will spin per volt with no load (no prop)
	3. 3100KV=3100 rpm/v (with no load)
	4. So if we supplied 1 volt to this motor, we would get it to spin 3100 times every minute
	5. Higher KV means the motor will spin faster. Lower KV means you have more torque (to apply more force to air)
6. 1306.. What the heck is that?
	1. All drone motors will have a 4 digit number attached to it, but what does it mean? 1306
		1. First two digits are width of motor in milli-meters (motor has 13 mm wide rotor cage (outer))
			1. Bigger the diameter, more the torque we get (radius times force)
		2. Last two digits are height of the rotor in mm (6 mm tall rotor cage (outer))

### LiPo Batteries Part 1 ###
1. Overview:
	1. LiPo stands for "Lithium-Polymer"
	2. Essentially same thing as Lithium-ion battery
		1. Packaging of cells
			1. Soft packaging
			2. Very close to individual cells (easy to puncuture)
		2. Lithium-ion are enclosed in metal or plastic casing (much safer)
			1. More heavy
	3. Li-ion batteries with polymer cases are optimized for very high current output - Robotics and RCs demand this
	4. They have very high energy density (Energy / mass)
	5. They are flammable!!!
		1. Flame proof case
	6. Full charge voltage of lipo cell: 4.2 volts
	7. Rest voltage of depleted lipo cell: 3.7 vols (nominal voltage)
	8. Voltage displayed on the outside is the summation of nominal voltages of the individual cells
	9. Battery connects to the power distribution board to provide power
2. Place the battery to as close to the center of mass as possible
	1. Avoiding inertia

### LiPo Batteries Part 2 ###
1. Lipo spec
	1. Capacity:
		1. Capacity is a measure of the amount of electric charge (Coulombs) that is stored within the battery
		2. Units: mAh, Ah
			1. A = Amp = Coulomb/second = C/s
		3. mAh = milli-Amp hour
			1. mAh = (1/1000)(C/s)(1 hour)(3600 s/1 hour)
			2. mAh = 3.6 Coulombs
		4. mAh or Ah is the amount of Coulombs that are in battery
	2. C-Rating (qualitative number that tells the amount of current that we can draw from the battery continuously and safely)
		1. The C-Rating gives the knowledge of maximum current draw that the battery can safely endure
		2. Units of C are inverse hours (1/hour)
			1. Example: 1500 mAh = 1.5 Ah
				1. Max current = (1.5 Ah) (50C) = 75 A
	3. Lipo Cells:
		1. Lipo battery packs are composed of multiple individual lipo cells
		2. Full charge Voltage of lipo cell: 4.2 V
		3. Nominal voltage (depleted): 3.7 V
		4. S and P on battery packs: S means "Series" and P means "Parallel"
			1. Number before S or P indicates number of cells
			2. Voltage add if in Series
		5. Full charge voltage is:
			1. (number of cells) * (full charge voltage)
				1. 4 * 4.2 = 16.8 V
		6. Depleted voltage:
			1. (number of cells) * (depleted charge voltage)
				1. 4 * 3.7 = 14.8 V
			2. Big red black wires
		7. Balance lead:
			1. Gives access to nodes in between lipo cells
			2. If there is voltage difference between lipo cells, then a current is generated between the cells
				1. We don't want this inside the battery
				2. We want current to flow through the entire pack instead of between cells (we cannot capture this current)
			3. Used to balance voltages between cells (such that the cells have same voltage) - no internal current

### Battery Connector Converters ###
1. Overview:
	1. Many types of battery connectors
	2. All have 1 female end and 1 male end
	3. Connectors have maximum current ratings
		1. Don't have to worry about the current rating of the connector, sincle lipos come pre-soldered with connector on it
2. Dean's Connector
	1. Max current draw: ~60A
		1. Depends on authenticity (40A - 100A)
			1. More authentic, higher the current
	2. Female end typically on lipo battery side
3. XT-60 Connector
	1. Max continuous current rating: 60A
	2. Male end typically on lipo battery side
4. XT-90 Connector
	1. Max continous current rating: 90A
	2. Male end typically on the lipo battery side
5. 4mm bullet connectors
	1. Max continous current rating: ~80A
6. What if PDB has a different connector?
	1. Converters (Dean to XT-60)
		1. Can modify any battery's connector
		2. Be aware of max current rating

### Flight Controllers Part 1 ###
1. FC
	1. Many types
		1. Distinctions
		2. Unifying principles
			1. FCs are control center of drone
			2. Central hub that all electronics connect to (motors/ESCs, GPS, Telemetry, RCin)
			3. Drone's firmware runs here (ArduPilot or PX4 for example)
				1. Firmware - code that interacts with and commands hardware
			4. Two basic kinds: Pixhawk=Microcontroller based, Navio2=Linux based
				1. Microcontroller based FCs: have companion computers that are linux based. (microcontroller board for advanced functionality)
					1. Raspberry Pi performing computer vision communicating with a Pixhawk
	2. Anatory: FC is in center (equidistant from wires, reducing moment of inertia)

### Flight Controllers Part 2 ###
1. Microcontroller vs Linux FC Comparison
	1. NAVIO2 - With Raspberry PI
		1. Pros:
			1. Drone's firmware runs on familiar linux environment
			2. Unites uC FC functionality with companion computer functionality into one entity
				1. uC functionality: real time dependability of linux board
					1. If process needs to be done in 10 us, it will take care of getting it done in that time
			3. Easy to setup and interact with (can SSH into your drone while its flying!) - fixing problem can be done on the fly
			4. Can update the drone's firmware wirelessly (if by WiFi) - connects to internet and update firmware on the fly
		2. Cons:
			1. Drone's require real-time computing (very dependable computing), and uC FCs are more dependable - not optimized for RTAs
			2. Normal linux distributions are not real time, but can achieve it with the PREEMPT RT patch (relativly new development)
			3. Very new and not widely seen in industrial applications
	2. Pixhawk - Microcontroller
		1. Pros:
			1. Much faster computational speed
			2. More dependable (if process must be done in 10 micro-seconds, uC FCs can consistently achieve this)
			3. Designed for real-time applications (uCs are optimized for RTAs)
				1. Processes running on uC are time sensitive (they must be done within a particular window) - PWM running motors (if process does not run on time, drone may crash)
			4. Dedicated computing power for flight control firmware - power is not shared (computing and power)
			5. Can be supplemented with external computing power (like with R PI)
			6. Mature technology (using uC for real time applications) - dependable and trust worthy
		2. Cons:
			1. Higher learning barrier of entry
			2. Not as simple to switch firmware versions (linux boards are easier)
			3. Have to manually setup companion computer <-> uC communication - relative to linux based
			4. uC boards are more difficult to interact with (no simple SSH)

### Electronic Speed Controllers (ESCs) ###
1. Drone Anatomy: ESC
	1. Different types and qualities
		1. Low quality - buy one extra (more prone to fail)
2. Overview:
	1. Red and black wires connect to power distribution board
		1. Draws current directly from lipo battery
	2. Signal wire connects to the flight controller (FC)
	3. Flight controller will output a PWM signal to the ESC (servo type)
	4. ESC then electronically digests the PWM sent from the FC output and produces an ESC output that will drive the motor's stator and spin the props - pwm values are between 1000 and 2000
	5. Three output wires connected to motor
		1. Alternating magnetic fields are caused - rotor cage is forced to align with it
3. 4 pwm out pins from FCs connect to the 4 ESCs
	1. Separate pwms can be sent to each ESC
4. Special Units/Info
	1. Specs
		1. Voltage rating
			1. ESCs specs will tell you what types of LiPos you can use with them (2-4S) - 2S, 3S or 4S lipos (cells - 7.4V to 14.8V safely)
	2. Current rating:
		1. ESCs can only handle so much current running through them
		2. 30A - make sure motor does not draw more than 30A
			1. Select ESC that has 20% higher current rating than max expected current draw of motor 

### RC and Telemetry ###
1. RC transmitter
2. RC receiver
3. Telemetry:
	1. Ground control station
	2. Drone site

#### Overview ####
1. RC and Telemetry are used to communicate info wirelessly with drone
	1. Telemetry is bi-directional - send info to and receive from drone
	2. RC - unidirectional - send commands from RC transmitter and RC receiver receives
2. Telemetry communication is bi-directional, RC communication is unidirectional (from RC controller to receiver)
3. RC typically uses the 2.4 GHz band
4. Telemetry typically uses 915 MHz band in US and 433 MHz band in Europe (different bands are regulated differently based on where we live)
5. RC and Telemetry involve two pieces of hardware that are paired. One piece is drone-side, and the other is not (RC controller is off drone, and RC module is drone-side)

#### RC ####
1. Output of receiver can be 6 channel PWM
	1. PPM encoder receives the 6 channel inputs and conglomorates and sends one input to flight controller
2. Used to control the drone when in a manual flight mode (that requies a pilot. There are autonomous flight modes that do NOT require an RC controller to fly drones)
3. Price increases exponentially with the amount of channels RC setup has
	1. 6 channels - $50
	2. 8 channels - $120
4. Minimum amount of channels for most drone applications: 6 channels
	1. 1 channel - pitch (right stick)
	2. 1 channel - roll (right stick)
	3. 1 channel - throttle (left stick)
	4. 1 channel - yaw (left stick)
	5. 1 channel - potentiometer (flight mode)
	6. 1 channel - control actuator like gripper (up/down switch)
5. 4 channels are dedicated to Roll/Pitch/Yaw/Throttle
6. Remaining channels can be used to control various things on the drone
7. Channel 5 typically dedicated to switch flight modes of drone
8. PWM:
	1. RC controllers use PWM for communication
	2. 1000 is lowest and 2000 is highest
		1. stick all the way up is 2000 PWM
		2. stick all the way down is 1000 PWM

#### Telemetry ####
1. Ground station is USB based connected to computer
2. Drone site is UART based (4 - 5 wires)
	1. Connects to UART port of FC

### Propellers ###
### Frames ###
### GPS and Optical Flow ###

## Designing a Drone Build ##
### Thrust to Weight Ratios ###
### Estimating Weight of Drones Part 1 ###
### Estimating Weight of Drones Part 2 ###
### Drive-Train of Drones: Props+Motors+Batteries ###
### Estimating Thrust and Current Draw ###
### Choosing ESCs ###
### Summary of Course Drone Build ###

## How to Build a Drone ##
### Part Placement Planning ###
### Soldering Bullet Connectors to ESCs ###
### Soldering ESCs to PDB ###
### Soldering Battery Connector to PDB ###
### Attaching Legs to Frame ###
### Installing Motors on Frame ###
### Securing Raspberry Pi to Top Plate (Method 1) ###
### Securing Raspberry Pi to Top Plate (Method 2) ###
### Installing Top Plate to Drone Frame ###
### Fixing ESCs to Drone Arms ###
### Bind Receiver and Transmitter ###
### Calibrate ESCs ###
### Correct Motor Spin Direction ###
### Fix PPM Encoder and RC Receiver to Frame ###
### Wiring the ESC PWM Lines to Flight Controller ###
### Install Telemetry Module to Drone ###
### GPS Mount Assembly ###
### Securing GPS to Frame ###
### Velcro-ing Battery to Drone ###
### Fixing Power Module to Frame ###
### Securing Propellers to Motors ###

## Initial Setup of Drone ##
### Download and Flash OS Image to SD Card ###
### Configure RPi to Connect to the Internet ###
### SSH into RPi ###
### Configure ArduPilot on RPi ###
### Install Mission Planner and Connect to Drone ###
### Mission Planner Sensor Calibration and ArduPilot Setup ###
### Setting Up the RC Controller ###
### Charging LiPo Batteries ###
### Leashing Your Drone ###

## Flying the Drone ##
### Flashing Light on Drone Flight Controller ###
### Diagnosing Your Drone's Problems ###
### Downloading Flight Logs and Requesting Help on ArduPilot Forum ###
### RC Sticks and What they Control ###
### Flight Modes in ArduPilot ###
### Setting Up Flight Modes ###
### First Time Flying Drills/Advice ###
### Flying in ALT-HOLD Mode ###
### Flying in LOITER Mode ###
### Using the LAND Mode ###
### Using the RTL Mode ###

## Using the Linux Feature of the Drone ##
### Downloading ArduPilot Source Code ###
### Compile ArduPilot Source Code ###
### Changing Firmware in NAVIO Image ###
### Installing DroneKit ###
### Script for Autonomous Mission: Takeoff and Land ###
### Script for Autonomous Mission: Velocity Commands ###

## Conclusion ##
### Contratulations! ###
### Next Steps: Learn about Open Source Drone Software? ###