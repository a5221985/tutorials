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
	3. 

### Battery Specifications and Performance ###
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