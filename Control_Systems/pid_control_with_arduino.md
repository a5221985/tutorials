# PID Control with Arduino #
## Introduction to Feedback Systems and PID Control ##
1. Process: System (control realm) takes input and generates an output
	1. Example: Vehicle
		1. Parts:
			1. Throttle actuator
			2. Engine + Transmission
		2. Input: gas pedal angle (theta)
		3. Output: velocity v
		4. This is open loop commanding
2. Closed loop:
	1. Example: Cruise control
		1. Velocity is measured by speedometer (sensor)
		2. Sensed velocity is compared with a setpoint or desired velocity to generate an error term
		3. Error is fed into Controller
		4. Controller generates an actuation signal
		5. Actuation signal is fed into Throttle actuator
	2. If speed is 70 and set point is 75
	3. Speed is increased to bring down error to 0
	4. If speed is 80 and set point is 75
	5. Speed is decreased to bring down error to 0
3. Controller:
	1. Inputs:
		1. Setpoint
		2. Sensed output
	2. Output: control signal
	3. Famous Controller:
		1. PID - Proportional, Integral and Derivative controller
			1. Takes error
			2. Computes three mathematical operations on the error
				1. Kp e(t)
				2. Ki integral e(t)dt
				3. Kd de(t)/dt
			3. Adds the three values to generate control signal

					u(t) = Kpe(t) + Ki integral e(t) dt + Kd de(t)/dt
					
				1. Kp, Ki, Kd: constants called tuning constants
					1. Poor tuning can cause
						1. Ringing or overshoots
						2. Long settling time
						3. Instability or oscillations

## Proportional (P) Control ##
1. See how closed loop performs with proportional control
	1. Fixed Kp value:
		1. error = setpoint - sensed output
		2. control signal = error * Kp
	2. If error is large -> control signal is large
	3. If error is small -> control signal is small
2. Example:
	1. Room temperature
		1. Input: 80 deg, Kp is 10
3. Main disadvantage of P-only control:
	1. Error is never driven to zero automatically (process never reaches setpoint)
4. Possible changes:
	1. Kp is large:
		1. Output overshoots and could be bad for certain systems
		2. There will still be residual error and we can never bring it to zero
	2. Workaround: Put bias in the output
		1. control signal = error * Kp + U_bias
		2. Problem: For every set point, we need to manually change the bias
5. Advantage:
	1. Easy to implement and can drive the process close to the desired setpoint
6. Disadvantage:
	1. We cannot eliminate steady-state error automatically

## Proportional-Integral (PI) Control ##
1. Main idea: Errors should accumulate over time
	1. control signal = Ki integral e(t) dt
		1. Control accumulates for +error
		2. Control dissipates for -error
	2. Eliminates steady state error completely

## Proportional-Integral-Derivative (PID) Control ##
## Implementing the PID Control Algorithm (Code Attached) ##
## Demonstration of PID Control (Propeller Arm Example) ##
## PID Tuning (Ziegler-Nichols Method) ##