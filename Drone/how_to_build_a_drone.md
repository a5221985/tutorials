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
9. PPM Encoder:
	1. Most setups may use PPM encoder to connect to RC receiver to drone's FC
	2. Takes multiple inputs, representative of each individual channel (Ex: Orange wire = Throttle = 1500 PWM, Blue = Yaw = 1302 PWM etc) and has 1 output
	3. Single output uses a protocol to communicate all channel/value pairs on one wire to simplify wiring

#### Telemetry ####
1. Ground station is USB based connected to computer
2. Drone site is UART based (4 - 5 wires)
	1. Connects to UART port of FC
3. Used by ground control stations to communicate with airborne drones (Ground control stations are basically off-drone computers that have a communication link with the drone via telemetry)
	1. Ground control station:
		1. Can gather info from drones (location, speed, battery voltage, system health, flight mode etc) - realtime
		2. Can set variables (settings flight modes say)
		3. Can control drone (Move to this waypoint)

### Propellers ###
1. Props:
	1. Overview:
		1. Selecting props should be done with motor and battery selection in mind
			1. Pick props with battery and motor together
		2. Different prop specs can produce drastically different current draws and thrust
2. Props: Diameter
	1. Specs are provided in 4 digits of numbers.
		1. Ex: 1045
		2. First two digits: diameter in inches
		3. Second two digits: Pitch of prop
			1. Flat knife - 0 pitch
			2. More aggressive pitch has more aggressive angle on the blade
				1. Scooping more air as we spin the prop
		4. Imagine a screw turning into wood
			1. The more aggressive the pitch, farther the screw will turn into the wood in one turn
		5. 4.5 inches in one complete turn if it were able to turn into a solid medium
			1. Higher the pitch, more the torque you will generate
3. Props: Current Draw
	1. Different types of props can drastically affect the current draw of the setup
		1. Holding lipo battery and motors constant, using 1045 props will draw much more current than 8045 props
			1. 3S lipo
			2. 930 kv motor
			3. 8045 props
		2. 1045 props will also produce more lift
	2. Be careful not to over spec the props you are using
		1. Make sure motors/escs can handle the amount of current the motors will draw with props being used
	3. Most motors will tell suggested prop dimensions to use with their model

### Frames ###
1. Overview
	1. There are many different types of frames/ drone types
		1. Frames can alter in motor counts, and different arm configurations for the same number of motors
			1. X frame
			2. Dead cat frame
			3. H frame
	3. Generally, having more motors means more lift (able to have heavier payloads)
		1. Multirotor=multiple motors. Tri-copoter (3 motors), quadcopter (4), hexacopter (6), octocopter (8) ...
2. Different types of Quad-copters
	1. Quad = 4
	2. Quadcopters have 4 motors
	3. 3 main types of quad-copter frames
		1. Deadcat frame - front two are wide open but back two are narrow
			1. Pros:
				1. It has a lot of mounting points on the frame
					1. makes it easier to place all necessary components
			2. Cons:
				1. it is not optimized for aerodynamics
					1. Little less efficient (lose in terms of flight time)
				2. It wights more than other quadframe counterparts
		2. H frame - Looks like H
			1. Pros:
				1. Simple configuration
				2. Easy to make from scratch
					1. DIY is possible
				3. More aerodynamic than dead cat frames
			2. Cons:
				1. Mostly ligher than dead-cat frames, but heavier than X frames
		3. X Frame
			1. Pros:
				1. Very aerodynamic
				2. Lightest of the quadframes
			2. Cons:
				1. Less space for mounting drone components (like GPS, flight controller, battery etc
3. Other drone types
	1. Tri-Copters
		1. Not very popular frame of multi-rotor but exist
		2. Lightweight
		3. No redundancy. If one motor fails, the tri-copter crashes
4. Hexa and Octo copters
	1. Hexa = 6 motors
	2. Octo = 8 motors
	3. More motors, more lift
		1. more lift it can generate, heavier the potential payload
			1. Applications that require heavy payloads should use higher motor multirotors
				1. Package handling
				2. Agricultural crop sprinkler (liquid is heavy)

### GPS and Optical Flow ###
1. Overview
	1. For autonomous drone missions, we need a way for drone to determine position in 3D space
		1. Many different ways exist but following are two
			1. GPS
			2. Optical flow (With a height sensor)
	2. In reality determining position in 3D space is very difficult process
		1. It involves more than just GPS or an optical flow sensor
			1. Many different sensors needed to be involved and many calculations
				1. kalman filters more more complete overview
					1. [Kalman filters](http://ardupilot.org/copter/docs/common-apm-navigation-extended-kalman-filter-overview.html)
2. Basic required sensors for flight
	1. We can fly using
		1. Accelerometer
		2. Gyroscope
	2. This is practical for manual flight.
		1. For autonomous missions, we need to combine the sensors with more robust methods and sensors for determining 3D space
		2. The drone doesn't need to know where it is in 3D space because pilot is there to guide it
3. For autonomous missions
	1. GPS
		1. Used in conjunction with magnetometer (to determine YAW operation)
		2. Drone knows where it is in 3D space
			1. To travel to another location, simply travel from known current position to target waypoint
			2. Drone trajectory to waypoint is INDEPENDENT of the path traveled
				1. Path can be erratic but will reach the position
		3. Pros:
			1. Self-adjusts it's errors (if a gust of wind blows the drone off course, a new reading will simply show where the new location of the drone is in 3D space)
			2. Cheap
		4. Cons:
			1. Needs to be outside to access satellites
				1. Indoor readings do not match
			2. Can produce faulty readings from large structures (like if too close to a building)
	2. Optical flow sensors
		1. Used in conjunction with height determining sensors (sonar or barometer. This sensor is using sonar)
		2. The drone does not know where it is in the 3D space
			1. To travel to another location, drone has to measure how far it has traveled
				1. It can tavel relative to were it currently is (good for indoors for both ground vehicles and flying vehicles)
			2. Drone trajectory to waypoint is DEPENDENT of the path taveled
		3. Pros:
			1. Can fly indoors and by large structures
				1. Not external communication
		2. Cons:
			1. Expensive
				1. Newer technology
			2. Does NOT self-adjust its errors (if a gust of wind blows the drone off course, the drone way may have lost where it was in 3D space)

## Designing a Drone Build ##
### Thrust to Weight Ratios ###
1. Theory
	1. AKS: TWR or T/W
	2. It is fundamental to being able to design drones
	3. If you get this wrong, the drone won't fly or parts wont be efficient
	4. What are thrust and weight?
		1. T - F_g = m a_y
2. Forces
	1. Thrust and weight are forces
		1. Unit for force is Newtons (N) in metric system
	2. Forces can cancel out each other
		1. If car is push forward with 10N and someone pushes backward with 10N, car won't move
			1. Force balance
3. Weight
	1. Particular kind of force
	2. Weight of an object is its mass (grams) times gravity (9.81 m/s2 on earth)
		1. Downward force
			1. Drone must overcome its force in weight in the opposite direction in order to fly
		2. Example: 800 g drone is
			1. W = (0.8 kg) * (9.81 m/s2) = 7.9 N
4. Force Units in Drone Communities
	1. Force is measured in N
	2. N is a little less intuitive a unit compared to grams. Since gravity is constant on earch (or can be modeled as such for simplicity), the drone community discards it and uses mass and force as interchangeable.

			F = m * g -> F = m
			F =(N) -> F =(g)

	3. While this is technically incorrect, it is more intuitive
	4. If we have a weight of 800 g, you know you need an upward force that could lift more than 800 g to lift off.
5. Thrust
	1. For drone applications, you could think of thrust as the amount of mass that the motor/prop would be able to lift into the air
6. Revisiting TWR
	1. TWR ratio is just the maximum thrust of a drone divided by the weight
	2. So if we could produce 3000 g of thrust with a drone weighing 1000 g, we would have a TWR ratio of D: TWR = 3000/1000 = 3:1
7. Common TWR Ratios
	1. For FPV/Racing multirotors, you want very high TWR ratios, typical ratios: 4:1 to 11:1
	2. For most normal drones, having a TWR of 2:1 is a good number to aim for
	3. You can still fly comfortably with a 1.5:1 ratio, but this leaves little room for additional payload should the need arise
		1. If we want to add a camera? Then drone may not fly
8. TWR Starting Point
	1. You won't know what your Thrust will be until you select a motor/battery/prop combo, but you don't know how much thrust you need until you know how heavy your drone is
		1. First step is designing/spec'ing out parts for a drone build is to estimate the weight of the drone
	2. Then we seek out motor/prop/battery combinations that get us close to our TWR goals.

### Estimating Weight of Drones Part 1 ###
1. Steps in the Design Process
	1. Estimate Weight of Drone (DOES NOT HAVE TO BE PERFECT!)
		1. +/- 20% of actual weight
	2. Have a TWR goal
		1. 2 say
	3. Find Motor/Prop/Battery combinations to provide the required thrust to meet your TWR goal
2. Steps in the Design Process
	1. Estimate Weight of Drone (DOES NOT HAVE TO BE PERFECT!)
		1. Start with the frame you would like to use
			1. Frame manufacturer will usually provide a list of parts specs used with that frame (typically)
				1. Example: 3S, 20 ESCs, 900 KV motors
		2. Start from suggested part specs provided by the frame manufacturer
		3. Add weights of the estimated parts to get total estimated weight of drone
			1. Of all the parts
	2. Note:
		1. If your estimate is for a part that you do not end up using like (ESCs), difference in weight between your estimated part and the final part is most likely minimal
			1. Contradiction: Battery selection
				1. Batteries can vary greatly in weight (3000mAh to 5000 mAh drone)

### Estimating Weight of Drones Part 2 ###
1. Table:
	1. Part
		1. Motor - 4 (multiplier) - 55 g (Unit Weight) - 220 g (Weight)
		2. ESC - 4 - 28 g - 112 g
		3. Frame - 1 - 272 g - 272 g
		4. RC Receiver - 1 - 20 g - 20 g
		5. Battery - 1 - 266 g - 266 g
		6. Props - 4 - (1045 props) 10 g - 40 g
		7. Telemetry - 1 - 20 g - 20 g
		8. FC - 1 - 50 g - 50 g
		9. PDB - 1 - 20 g - 20 g
		10. PPM Encoder - 1 - 10 g - 10 g
		11. GPS - 1 - 20 g - 20 g
		12. Misc - 1 - 20 g - 20 g
	2. Total weight: 1070
	3. TWR Goal: 2
	4. Required Thrust (g): **2140**

### Drive-Train of Drones: Props+Motors+Batteries ###
1. Find Motor/Prop/Battery combinations to provide the required thrust to meet your TWR goal
2. Overview
	1. Thrust and current draw are functions of prop, motor and battery selection:
		1. Thrust(prop, motor, battery) = Grams Thrust
		2. CurrentDraw(prop, motor, battery) = Amps
	2. If we change any one of the three variables of thrust and current, we will get different Thrust and Current draws
3. Example 1:
	1. 8045 prop, 935 KV motor, 3S battery
		1. Max Thrust: 490 g
		2. Max Current Draw: 7.1 A
	2. 1045 prop, 935 KV motor, 3S battery
		1. Max Thrust: 670 g
		2. Max Current Draw: 9.6 A
	3. 5045 prop, 2300 KV motor, 3S battery
		1. Max Thrust: 712 g
		2. Max Current Draw: 20.7
	4. 5045 prop, 2300 KV motor, 4S battery
		1. Max Thrust: 1024 g
		2. Max Current Draw: 30 A
			1. ESCs may get blown off

### Estimating Thrust and Current Draw ###
1. Drone Drivetrain:
	1. For simplicity, defining drone drivetrain to be a given selection of prop/motor/battery
		1. **Drivetrain = {prop, motor, battery}**
		2. Example:
			1. Drivetrain = {1045, 2212 1000KV, 3S}
			2. Drivetrain = {8045, 2212 2300KV, 4S}
2. Overview
	1. Three main ways to determine thrust and current draw of your setup
		1. Buy the prop/motor/battery and bench test yourself
		2. Triangulate similar setups from other people's bench tests online
		3. Empirical data from manufacturer (my favorite)
3. Method 1: Bench Testing
	1. Method:
		1. flip the props so that motor presses down
		2. Put the motor on top of wooden block
		3. Put the whole setup on top of a weighing machine
		4. Turn motor at full speed
		5. Reading is the grams of thrust the motor can produce
	1. Pros: confidence in data you acquire
		1. If motors are already there at home
	2. Cons: Buy the components before you know if hardware will work with the drone
		1. Not time efficient
			1. Not worth if others have already done this
2. Method 2: Triangulate Others Results
	1. Method is based on theoretical assumption
	2. **Motors of similar size, KV rating and stator configuration should theoretically produce the same thrust for a given prop and battery choice**
		1. 2212 920 KV motor from EMAX should perform very similar to any othe r2212 920 KV motor
			1. We can **estimate** thrust/current draw by comparing confirmed thrust/current draws from similar motors
	3. Check in google
		1. Check 2 bench tests and triangulate
	4. Not accurate but it is just estimate
3. Method 3: Empirical Data from Manufacturer (best method)
	1. Bench tests by manufacturer
		1. Thrust table
			1. EMAX1045 - 9.6 A, 670 g, 106 W, 6.3 G/W, 6530 RPM
				1. 4 motors: 38.4 A, 2680 g of thrust, 424 W, ...
	2. Pros:
		1. Convencience of estimating thrust/current draw before buying from **Thrust tables**
		2. Empirical test data for your specific motor
	3. Cons:
		1. Empirical data may not reflect acutal results seen on your finished vehicle

### Choosing ESCs ###
1. Steps in the Selection Process
	1. Determine the Prop Size/Motor/Battery combination to be used
	2. Determine the maximum current draw given the choice from 1
	3. Select an ESC with a maximum current rating that is ~20% more than the maximum theoretical current draw from 2
2. ESC is a function of maximum current draw
	1. Choose with 20% more current than max current draw of motor
		1. ESC are sensitive and can handle only so much current
			1. Motors should draw lesser current than ESC can support
3. Example:
	1. 10x45 Props
	2. 3S Battery
	3. 935KV/2213 Motor
	4. Estimated Max current Draw
		1. ~15 A
		2. Calculate 20% more than 15 A
			1. 15 A * (1.2) = 18 A - ~20 A rounded
				1. ESC should support atleast 18 A maximum current rating
4. Over Spec'ing ESCs
	1. Means selecting ESCs that have a much larger max AMP rating than required for setup
		1. Pros:
			1. Can dissipate heat more effieciently (escessive heat is one of the main causes for ESCs to fail)
			2. Can be re-purposed for higher current builds
		2. Cons:
			1. Heavier and thus reduce the amount of flight time available
5. Maximum theoretical current draw: 15A
6. Maximum ESC Amp rating: 30A
7. 100% larger ESC ap rating than expected on drone build
8. Comparison
	1. 30A ESC
		1. Output: Continuous 30A, Burst 40A up to 10 Secs
		2. Input Voltage: 2-4 cells lithium battery or 5-12 cells NiCd/MiMh battery
		3. BEC: 2A/5V (Linear mode)
		4. Max Speed: 210,000 rpm for 2 Poles BLM, 70,000 rpm for 6 poles BLM, 35,000 rpm for 12
		5. poles BLM
			1. (BLM: BrushLess Motor)
		6. Size: 45mm (L) * 24mm (W) * 11mm (H)
			1. 25g * 4 = 100g (**60 g heavier than 20A ESC**)
	2. 20A ESC
		1. Programe: BLheli, support oneshot 125
		2. Continuous Current: 20A
		3. Burst Current (10S): 30A
		4. BED: 5V/1A
		5. Lipo Cells: 2-45
		6. Weight: 10g
		7. Size (excluding plugs): 28 x 15 x 6 mm
		8. Typical applications (for reference): 330-550 Multi-rotor
			1. 10g * 4 = 40g

### Summary of Course Drone Build ###
1. Overview:
	1. Motors: 935 Kv 2213
	2. Battery: 3S 3000 mAh
	3. Props: 1045
	4. Estimated Current Draw: 15A
	5. ESC: 30A (Double the maximum estimated current, so we could probably use a 4S battery and still be fine)
	6. FC: NAVIO2+Raspberry Pi
	7. Estimated Weight: ~1070 g
	8. Target TWR: 2
	9. Estimated Thrust ~ 2500 g
	10. Estimated TWR: 2.5

## How to Build a Drone ##
### Part Placement Planning ###
1. Plan where to place things
	1. Bottom plate:
		1. Corner electrodes - solder ESCs
		2. Center - solder Battery
	2. Flight controller
		1. Raspberry PI + Navio Shield
			1. Put it on top and center of gravity
	3. Bottom plate:
		1. Long side vertical (front and back)
	4. Battery:
		1. Horizontal (sideways)
			1. Leave the longer sides
	5. ESCs
		1. Bottom of the arm and zip tie
	6. RC input:
		1. Place at the back (red side on bottom plate)
	7. PPM module (the two are closer)
		1. Place on top plat close to pin of navio
	8. GPS:
		1. Close to center on an arm

### Soldering Bullet Connectors to ESCs ###
1. Solder female bullet connectors to ESC blue wires
	1. Expose some metal of ESC wires
	2. Heat soldering iron
	3. Clamp bullet connector to a hands free facing hole to the top
	4. Place soldering iron on the smaller end
	5. Push solder through the hole and fill up the hole
	6. Let it dry
	7. Push blue wire into the hole
	8. Heat the solder through the smaller hole
2. Repeat the above steps for all 4 ESCs

### Soldering ESCs to PDB ###
1. Soldering:
	1. Soldering iron
	2. Solder
	3. Damp sponge
	4. Helping hand
2. ESC should be in the bottom and text facing down	1. Red to +
	2. Black to -
	3. Procedure:
		1. Place soldering iron tip on electrode
		2. Feed in some solder
		3. Place wire on top and press down with soldering iron

### Soldering Battery Connector to PDB ###
1. Guage wire on battery connector should match the guage wire on battery
	1. Ex: 12 guage
	2. If connectors don't match, use adapters
	3. Trim off some wire to expose enough of the wire
	4. Tin the exposed part of the wire (combine strands of wire)
		1. Automatically distributes to the whole tip
		2. Solder should completely melt (slowly melt it)

### Attatching Legs to Frame ###
1. Parts:
	1. Alen kit
	2. Screws
2. Put PDB upside down with leg
3. Use Alen key to fasten the legs (colored at the front is better)
	1. Longer side of PDB to the front is better

### Installing Motors on Frame ###
1. Red nuts - counter clockwise rotation
2. Black nuts - clockwise rotation
3. If a nut does not tighten on a motor, it is incorrect nut
4. If we spin the motors in opposite direction to intended direction, the nuts get loosened
5. How to select the direction?
	1. Props and motors spin towards the north south line (to hit it)
		1. Top-left - clockwise
		2. Top-right - counter clockwise
		3. Bottom-left - counter clockwise
		4. Bottom-right - clockwise
	2. Long screws are required to tighten the motors
	3. Wires should face the length of the arm

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