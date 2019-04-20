# Gaps in Knowledge #
1. How to connect Arduino to Raspberry PI?
	1. [https://www.instructables.com/id/The-Raspberry-Pi-Arduino-Connection/](https://www.instructables.com/id/The-Raspberry-Pi-Arduino-Connection/)
	2. [https://conoroneill.net/2013/06/05/connecting-an-arduino-to-raspberry-pi-for-the-best-of-both-worlds/](https://conoroneill.net/2013/06/05/connecting-an-arduino-to-raspberry-pi-for-the-best-of-both-worlds/)
2. How to read/write from Arduino to Raspberry PI?
	1. [https://www.instructables.com/id/The-Raspberry-Pi-Arduino-Connection/](https://www.instructables.com/id/The-Raspberry-Pi-Arduino-Connection/)
3. How to read/write analog data from/to Raspberry PI?
	1. There is no ADC in RPI
		1. Workaround: (Too much circuitry)
			1. [https://www.allaboutcircuits.com/projects/building-raspberry-pi-controllers-part-5-reading-analog-data-with-an-rpi/](https://www.allaboutcircuits.com/projects/building-raspberry-pi-controllers-part-5-reading-analog-data-with-an-rpi/)
4. How to read/write to/from serial port?
	1. [https://www.instructables.com/id/The-Raspberry-Pi-Arduino-Connection/](https://www.instructables.com/id/The-Raspberry-Pi-Arduino-Connection/)
5. How to power the RaspberryPI?
	1. [https://www.youtube.com/watch?v=9LAtu39xpR8](https://www.youtube.com/watch?v=9LAtu39xpR8)
		1. Three ways:
			1. Micro USB cable
				1. PI1 - any cable okay
				2. PI2 - additional power (official is required)
				3. PI3 - official power supply (5.2V, 2.5A)
			2. GPIO pins:
				1. Header (5V, GND)
			3. Banana PI: Separate 5V, GND pins (we can solder)
				1. RPI: micro usb pins
	2. [https://raspberrypi.stackexchange.com/questions/7913/powering-a-pi-from-12v](https://raspberrypi.stackexchange.com/questions/7913/powering-a-pi-from-12v)
	3. [https://www.dx.com/p/hobbywing-5v-6v-3a-switch-mode-ultimate-bec-ubec-2005844#.XIHo-igzY2w](https://www.dx.com/p/hobbywing-5v-6v-3a-switch-mode-ultimate-bec-ubec-2005844#.XIHo-igzY2w)
	4. [https://pihw.wordpress.com/meltwaters-pi-hardware-kits/power-supply-kit/](https://pihw.wordpress.com/meltwaters-pi-hardware-kits/power-supply-kit/)
6. How to power the Arduino?
	1. [https://www.open-electronics.org/the-power-of-arduino-this-unknown/](https://www.open-electronics.org/the-power-of-arduino-this-unknown/)
7. How to drive drone using RaspberryPI?
	1. [https://www.instructables.com/id/The-Drone-Pi/](https://www.instructables.com/id/The-Drone-Pi/)
8. How to drive drone using Arduino?
	1. [https://www.instructables.com/id/DIY-Follow-Me-Drone-With-Camera-Arduino-Based/](https://www.instructables.com/id/DIY-Follow-Me-Drone-With-Camera-Arduino-Based/)	
9. How to drive drone's rudder?
	1. Yaw - Points the front of the copter in different directions and helps in changing directions while flying - turns clockwise or counter clockwise
		1. [https://uavcoach.com/how-to-fly-a-quadcopter-guide/](https://uavcoach.com/how-to-fly-a-quadcopter-guide/)
10. How to use tensorflow for face detection?
	1. [Face recognition](https://hackernoon.com/building-a-facial-recognition-pipeline-with-deep-learning-in-tensorflow-66e7645015b8)
	2. [RPI-Tensorflow Object Detection](https://www.youtube.com/watch?v=npZ-8Nj1YwY)
		1. [https://github.com/EdjeElectronics/TensorFlow-Object-Detection-on-the-Raspberry-Pi&redir_token=qntwZewX4TIOv00-WZYk6wnH91p8MTU1MjEwNTA5OEAxNTUyMDE4Njk4](https://github.com/EdjeElectronics/TensorFlow-Object-Detection-on-the-Raspberry-Pi&redir_token=qntwZewX4TIOv00-WZYk6wnH91p8MTU1MjEwNTA5OEAxNTUyMDE4Njk4)
		2. Need the following:
			1. Tensorflow
			2. OpenCV
11. How to use tensorflow for human body detection?
	1. [RPI-Tensorflow Object Detection](https://www.youtube.com/watch?v=npZ-8Nj1YwY)
	2. [https://www.youtube.com/watch?v=4eIBisqx9_g](https://www.youtube.com/watch?v=4eIBisqx9_g) - YOLO by Siraj
12. How to integrate gyro sensor?
	1. [https://playground.arduino.cc/Main/MPU-6050](https://playground.arduino.cc/Main/MPU-6050)
13. How to integrate electromagnet module with Arduino?
	1. [https://www.instructables.com/id/How-to-Control-an-Electromagnet-with-an-Arduino/](https://www.instructables.com/id/How-to-Control-an-Electromagnet-with-an-Arduino/)