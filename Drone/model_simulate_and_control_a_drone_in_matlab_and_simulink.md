# Model, Simulate and Control a Drone in Matlab and Simulink #

## Section 1: Mathematical and Physical Modelling #
### DJI Mavic Pro Design Brief ###
1. Objective of the course
	1. Establish mathematical model and physics behind four propeller drone modelled after DJI Mavic Pro
	2. Design a SIMULINK model simulating the complete dynamics of drone as well as impact of location and gusts
	3. Design and implement a PID controller to control the position and attitude of our drone
2. Simplified version of Mavic Pro (angles and shapes are simpler) - mavic pro website
	1. Diagonal length: 335 mm
	2. Weight: 0.743 kg
	3. Frontal Area: 0.0197 m^2
	4. Motor KV: 1400 rpm/V
	5. Battery Capacity: 3830 mAh
	6. Voltage: 11.4 V
	7. Max Discharge Current: 20C/77A
	8. Propeller Size: 8 x 4 inches (diameter by pitch)
9. What are we modeling?
	1. Motor, Propellers and battery performance
		1. How they work together (to make the drone fly, to go where we want it to go, power in proportion)
	2. Drone physics and dynamics
		1. How it moves
		2. How it reacts to different forces and moments
	3. Sensors and control
		1. Act on data to control the drone
10. Forces at play
	1. Motor's thrust
	2. Drag and Gusts
	3. Gravity
	4. Motors/Propellers Torque
11. Model Diagram
	1. Input -> Controller
	2. Controller -> DC Motors
	3. DC Motors -> Propellers
	4. Battery Performance -> DC Motors
	5. Propellers -> Thrust Vector
	6. Thrust Vector -> Drone Dynamics
	7. Disturbances -> Drone Dynamics
	8. Drone Dynamics -> Position, Velocity, Acceleration, Attitude, Altitude
	9. Position, Velocity, Acceleration, Attitude, Altitude -> Controller

### Battery Specifications and Performance ###
1. It has impact on the drone
2. DJI Mavic Pro Battery
	1. Mavic Pro's battery consists in three high discharge capacity Lithium-Polymer cells mounted in series
	2. Each cell has an average capacity of 3830 mAh and nominal voltage of 3.8 V
	3. Total capacity is 43.6 Wh for a weight of 240 g
3. Battery Performance
	1. In a circuit mounted in series, voltage of circuit is sum of voltages of its components but current remains constant
	2. In a circuit mounted in parallel, voltage of circuit is same throughout but current is sum of current going through all its components mounted in parallel
	3. Nominal voltage: 

			3.8 * 3 = 11.4 V
	
	4. Max discharge capacity is 20C (staying conservative) (20 times the capacity of the battery)
	
			I = 3.830 * 20 = 77 A
			
4. Motor Limits
	1. This battery analysis gave us our max operating voltage which we will take as 11.4 V to consider an average over one battery discharge and a max current of 77 A
	2. The characteristics will allow to limit performance of motors to realistic values by limiting energy they are allowed to extract from battery

### Empirical Modelling of DC Motors ###
### Empirical Modelling of Propeller's Behaviour and Performance ###
### Linear and Rotaional Drone Dynamics ###
### Actuation: Moments and Disturbances ###
### Actuation: Thrust Vectors and Linear Forces ###

## Section 2: Creation of the Open Look Simulink Model ##
### SIMULINK and the Motors/ Propellers Block ###
### Implementing the Rotational Dynamics Block ###
### Implementing the Linear Dynamics Block ###
### Converting Gusts to Drag Disturbances ###
### Converting Throttle and Attitude Inputs to Motor Voltage Signals ###
### Running and Debugging the Open Loop Drone Model (Direct Online ###
### 3D Motion Visualization from SIMULINK to MATLAB ###

## Closing the Loop and Implementing PID Feedback Control ##
### Automated Altitude PID Control ###
### Quadcopter PID Control ###