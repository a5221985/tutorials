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
	3. If Ki is high, the control signal is steaper (more aggressive control)
2. Example: Header + Room
	1. guides the error to 0
3. Main advantage of Integral Control:
	1. Elimination of Steady-State Error!
4. Ki:
	1. If it is too low: Steady state is reached after long time (slow response)
		1. Bad if
			1. Rejecting disturbances
			2. Constant changes in setpoint
	2. Ideally:
		1. There will be a small amount of overshoot and the steady state is reached
	3. If it is too large: Steady state is reached after large overshoots and oscillations
		1. This should be avoided
5. Problem:
	1. We want to eliminate overshooting or undershooting - Derivative is required

## Proportional-Integral-Derivative (PID) Control ##
1. Control signal: Takes rate of change of its error as the control signal
	1. We get a spike in the control signal for a step signal
		1. For step changes in setpoint or sudden disturbances, control signal reacts quickly and aggressively
	2. Since overshoots are sinusoidal (approximately), control signal for derivates is also sinusoidal (and 90 deg offset)
		1. Before error goes up, control goes up
		2. Before error goes down, control is already down
	3. Control signal acts like a predictor of the pattern and takes action before hand before the overshoot occurs
2. Overshoots are subsided to keep to minimum possible (may be completely eliminate them)
3. Summary:
	1. Kp e(t) - proportional term - decreases rise time
	2. Kd integral e(t) dt - Integral term - Eliminates steady-state error
	3. Ki de(t)/dt - Derivative term - reduces overshoots or ringing
2. Control theory - not applied (intuitive approach is taken)
	1. Involves laplacian tranforms and solving for constants

## Implementing the PID Control Algorithm (Code Attached) ##
1. Domain:
	1. Control signal is expressed in continuous domain (analog domain)
		1. Easier to understand what is going on
	2. Nowadays controllers are implemented digitally in software
		1. This requires converting to discrete-time (digital domain)

				u[n] = Kp * e[n] + Ki * sigma_k=0 to n e[k] T + Kd * (e[n] - e[n - 1]) / T
				
			1. Each error term is a descrete sample
	3. T = sample time or the time interval the PID function gets called
		1. T ~ dt

				void loop() {
					every T interval {
						u[n] = Kp * e[n] + Ki * sigma_k=0 to n e[k] T + Kd * (e[n] - e[n - 1]) / T
					}
				}
				
2. Data types for contants is double - more precision
3. PID_Control()

		unsigned long current_time = millis(); // returns the number of milliseconds past since the Arduino started
		int delta_time = current_time - last_time;
		
		if (delta_time >= T) {
			double error = setpoint - sensed_output;
			total_error += error; // accumulates the error - integral term
			double delta_error = error - last_error; // difference of error for derivative term
			
			control_signal = Kp * error + Ki * T * total_error + (Kd / T) * delta_error; // PID control compute
			
			last_error = error;
			last_time = current_time;
		}	

4. Cooling fan:
	1. Hardware:
		1. Arduino
		2. Motor driver
		3. Analog temperature sensor
		4. Cooling fan
	2. Working principle
		1. Motor driver receives PWM signal from Arduino
		2. Analog temperature sensor sends analog voltage level to Analog pin of Arduino
		3. Motor driver drives the cooling fan
	3. Controller
		1. T = 50 ms (We can select the right sample time and there is a procedure)
		2. Conver voltage to temperature
		3. Setpoint is set to desired temperature
		4. `PID_Control()` outputs a value in [0, 255]
			1. This is the duty cycle of PWM in the output pin
		5. Caution: `analogWrite()` can write values in the range [0, 255] only
			1. If value is outside the range, 
				1. If val > 255 -> val <- 255
				2. If val < 0 -> val <- 0
5. Integral wind up:
	1. If setpoint suddenly drops to another value, there is a lag before output starts responding (lag)
		1. Because contron_signal goes beyond 255 and it slowly drops until it reaches 255 and below (lag is because of the delay in drop to 255)	

## Demonstration of PID Control (Propeller Arm Example) ##
1. Self stabilizing propeller arm system
	1. Brushless motor is attached to one side of an arm
	2. Arm is mounted in the middle to a vertical stationary pillar
2. Process model:
	1. Input: speed control signal c(t)
	2. Output: Angle theta
	3. Instruments:
		1. IMU: Accelerometer - to measure angle
		2. Arduino - Controller
		3. Arduino generates c(t)
		4. ESC - receives c(t)
		5. Protocol - I2C
	4. Sample time - 10 ms (100Hz)
		1. It should be atleast 10 times faster the time constant of the system
			1. Time constant - it represents the speed a particular system takes to reach 63% of it's final value
				1. If input is a step change, time it takes to reach 63% of it's final value is the constant
				2. Example: Time constant for the system is 0.5 seconds or 2Hz
					1. Sample time - atleast 10 * Time constant

## PID Tuning (Ziegler-Nichols Method) ##
1. Table:
	
		Parameters, Rise Time, Overshoots, Steady-State Error, Stability
		Kp, Decreases, Increases, Decreases, Degrades
		Ki, Decreases, Increases, Eliminates, Degrades
		Kd, Minor Change, Decreases, No Effect, Improves if Kd is small
		
	1. Try to be sparing with derivative gain
		1. If it is set too high, it can cause output to jitter (very sensitive for very small errors)
2. Ziegler-Nichols Closed-Loop tuning Method:
	1. Set all the gain terms (Kp, Ki, & Kd) to zero
	2. Increase the Kp gain (iteratively) until the output begins to oscillate upon a step change or disturbance (steady oscillation - Kp_osc = Ku (ultimate gain))
		1. Tu - period of oscillation (**for disturbance, it should oscillate persistently**)
			1. Used serial plotter to get estimate
		2. Example: Ku = 3.4, Tu ~ 1.2 seconds
			1. Kp = 0.6 * Ku = 2.04
			2. Ki = (2 * Kp) / Tu = 3.41
			3. Kd = (Kp * Tu) / 8 = 0.306
	3. Further tuning can be done from this starting point to make it more stable