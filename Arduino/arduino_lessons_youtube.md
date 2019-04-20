# Arduino Lessons #
## Simple Introduction to the Arduino ##
1. Sparkfun inventor kit - 10 - 15 projects possible
	1. Sensors
	2. Actuators
2. Softwares:
	1. arduino.cc/en/guide/windows
		1. Quick overview
			1. Download Arduino environment - download page
		2. Connect the board
		3. Show the arduino where the drivers
			1. Device manager > Right click on serial port > select software for the drivers
	2. Launch the environment
		1. `void setup()` - for initial setup - one time
		2. `void loop()` - loops over the logic - over and over
	3. Tell the board that we have:
		1. Tools > Board > Arduino Uno
	2. Tell which serial port
		1. Tools > Port > COMx
			1. Unplug and plug it back to know COM port
3. Pins
	1. 13 pins on one side
		1. M0 - M13
			1. Pin 13 has led hooked up
4. Example: Turn LED 13 on
	1. Set pin mode

			void setup() {
				pinMode(13, OUTPUT); // set pin mode input/output
			}

			void loop() {
				digitalWrite(13, HIGH); // 5v signal to pin 13
			}

		1. Compile
		2. Upload
	2. Upload button: Compiles and writes to Arduino
	3. Turning it off

			digitalWrite(13, LOW);

	4. Global variables:

			int LEDPin = 13;

			void setup() {
				pinMode(LEDPin, OUTPUT);
			}

			void loop() {
				digitalWrite(LEDPin, HIGH);
			}

	5. Blink light:
	
			digitalWrite(LEDPin, HIGH); // it is too fast if no delay
			delay(1000); // it is in milliseconds
			digitalWrite(LEDPin, LOW);
			delay(1000);

	6. New variable

			int waitTime = 1000;
			...
			delay(waitTime);

		1. `waitTime = 250; // blinks faster`
		2. `waitTimeOn = 100;`
		3. `waitTimeOff = 900;`

## Simple Arduino Breadboard Tutorial ##
1. Circuit:
	1. 5V, 330 ohms, LED
	2. Breadboard - neetly organized circuit
		1. Along a column are connected together
			1. Used to connect components together
		2. Trench separates connections
		3. Holes along rows are not connected
		4. Top two rows are connected together respectively - used for voltage supply
		5. Bottom two rows are connected together respectively - used for voltage supply
		6. Labels are just convenience
2. We can use any pin from 0 to 13
	1. Pin 9 to resistor
	2. Other end of resistor is connected to Positive lead of LED (long leg)
		1. Orange-Orange-Brown
	3. Negative lead of LED is connected to GND
3. Using variables is a good practice
	1. Normally we want to use local variables (Globals must be minimum)

			int redLED = 9;
			int onTime = 500;
			int offTime = 500;

			void setup() {
				pinMode(redLED, OUTPUT);
			}

			void loop() {
				digitalWrite(redLED, HIGH);
				delay(onTime);
				digitalWrite(redLED, LOW);
				delay(offTime);
			}

## Arduino For Loops and LED Circuit ##
1. Blinking two LEDs
	1. Arduino Uno
	2. 330 ohm resistors
2. Establish a ground rail
	1. All grounds to be hooked together

## Printing Over the Arduino Serial Port ##
1. Get good at debugging (software) and troubleshooting (hardware)
2. Serial ports: USB connection
	1. Turn on:

			Serial.begin(9600); // 9600 - baud rate (how fast it is going to be talking and listening to the serial port)

	2. How to send over serial port
		1. `Serial.print`
		2. `Serial.println` - goes to next line
		3. Example:

				Serial.println(j);
				...
				Serial.println(" ");

	3. Open serial monitor (top right corner)	
		1. Serial monitor must be set the same (otherwise they cannot talk to each other)
			1. Otherwise we have to change in program as well

## Working with Strings in Arduino ##
1. `int` takes less memory
	1. we can run out of memory in Arduino
2. String variables:

		String redMessage = "The RED LED is blinking.";
		...
		Serial.println(redMessage);

		String wm3; // declaration
		wm3 = wm1 + wm2; // concatenation

## Reading Data from Arduino Serial Monitor ##
1. Reading values:

		void loop() {
			Serial.println("How many times do you want the RED LED to blink?");
			while (Serial.available() == 0) {
				// Twiddle Your Thumbs Until Unser Inputs Data
			}
			numRedBlinks = Serial.parseInt();
		}

	1. `Serial.available()`: 0 - no input, 1 - input is available
	2. `Serial.parseFloat()`
	3. `Serial.readString()`

## Using While Loops with Arduino ##

		int j = 1;
		while (j < 10) {
			Serial.println(j);
			delay(200);
			j = j + 1;
		}

## Write Analog Voltages on the Arduino ##
1. We want in between voltages

		analogWrite(redLEDPin, x);

	1. 0 (0V) <= x <= 255 (5V)
		1. m = (y2 - y1)/(x2 - x1) = 255/5 = 51
		2. y = 51x
			1. y: write value
			2. x: desired voltage

## Ohm's Law and Potentiometers with Arduino ##
1. Read values from circuit into arduino
	1. Sense brightness
	2. Sense pressure
	3. Sense temperature
2. Typically by reading voltages
3. Ohm's law:
	1. V = I * R
		1. EMF: Voltage
			1. How much pressure (in water circuit)
				1. Battery is like pump with tap closed
			2. Water moving is like current
				1. Current is flow of electrons
		2. Electrons flow from -ve to +ve terminal
			1. Positive current is in the opposite direction of electron flow
	2. Not blow components? don't overload with too much current
		1. I = 5 / 330 ~ 0.015 A ~ 15 mA (A is too high)
	3. LED diode has turn on voltage of about 2 V
		1. Red: 2V
		2. Blue: higher
	4. Circuit equation:

			5 = V(diode) + V(R)
				2 + V(R)
				V(R) = 3V

			I = V(R)/R = 3/330 ~ 0.009A ~ 9mA

		1. < 10 mA is better (1/2 below it's spec)
	5. Potentiometer: We can change the ratio of resistance
		1. R1/R2
			1. Middle leg (divider) gives the voltage (Vout)
				1. Total is R1 + R2 (R - constant)
			2. Between outside leads: 10000 ohm
		
					Vout = R2/Rp * Vin

## Reading Analog Voltages with Arduino ##
1. 5V connect to breadboard
2. Center pin of potentiometer to Analog pin 0 (A0)
3. Lower leg to ground rail of breadboard
4. ground rail is connected to GND of Arduino
5. Values will be between 0 - 1023
6. Sketch:

		int potPen = A0; // Recognizes pin names - assigning potPen to A0
		int readValue; // Declaring our readValue variable

		void setup() {
			pinMode(potPen, INPUT);
			Serial.begin(9600);
		}

		void loop() {
			readValue = analogRead(potPen);
			Serial.println(readValue);
			delay(250);
		}

	1. Voltage calculation:

			y = 5 / 1023 * x

	2. sketch:

			float voltage;
			...
			voltage = (5.0/1023.0) * readValue; // calcualting the real world voltage
			Serial.println(voltage);

	3. This is used to control using knobs

## Using Arduino to Create Dimmable LED ##
1. Potentiometer controls brightness of LED
	1. Sparkfun kit (good to have)
2. Corresponding write values:

		y = 255/1023 * x

3. Sketch:

		int LEDPin = 9; // declare LEDPin to arduino pin 9
		int potPin = A0; // declare potPin to be analog pin A0
		int readValue;
		int writeValue;
		
		void setup() {
			Serial.begin(9600);
			pinMode(potPin, INPUT);
			pinMode(LEDPin, OUTPUT);
		}

		void loop() {
			readValue = analogRead(potPin);
			writeValue = (255./1023.) * readValue;
			analogWrite(LEDPin, writeValue);
			Serial.println(writeValue);
		}

## Simple and Easy Way to Read Strings Floats and Ints Over Arduino Serial Port ##
1. Int, Float, String
	1. Int are less memory hungry than Float
		1. Preferred if decimals don't exist
2. Sketch:

		String name;
		int age;
		float height;

		void setup() {
			Serial.begin(9600);
		}

		void loop() {
			Serial.println("Please enter your name:");
			while (Serial.available() == 0) {}
			name = Serial.readString();

			Serial.println("Please enter your age:");
			while (Serial.available() == 0) {}
			age = Serial.parseInt();

			Serial.println("Please enter your height:");
			while (Serial.avaialable() == 0) {}
			height = Serial.parseFloat();

			Serial.println("");
			Serial.print("Hello ");
			Serial.print(name);
			Serial.print(", you are ");
			Serial.print(age);
			Serial.println(" years old, ");
			Serial.print("and you are ");
			Serial.print(height);
			Serial.println(" feet tall.");
			Serial.println("");
		}

## Controlling an RGB LED with Arduino ##
1. RGB LED:
	1. R -> GND
	2. G -> GND
	3. B -> GND
2. Longest lead - GND
3. Next is Green
4. Next is Red
5. Shortest is Blue
6. Three resistors are required

## Arduino If Statements and Conditionals ##
1. Sketch

		int redPin = 9;
		int greenPin = 10;
		int bluePin = 11;
		int redValue = 0;
		int blueValue = 0;
		int greenValue = 0;

		void setup() {
			Serial.begin(9600);
			pinMode(redPin, OUTPUT);
			pinMode(greenPin, OUTPUT);
			pinMode(bluePin, OUTPUT);
		}

		void loop() {
			Serial.println("Please input your color choice (red, green or blue");
			while (Serial.available() == 0) {}
			
			if (colorChoice == "red") {
				analogWrite(redPin, brightness);
				analogWrite(greenPin, 0);
				analogWrite(bluePin, 0);
			} else if (colorChoice == "green") {
				analogWrite(redPin, 0);
				analogWrite(greenPin, brightness);
				analogWrite(bluePin, 0);
			} else if (colorChoice == "blue") {
				analogWrite(redPin, 0);
				analogWrite(greenPin, 0);
				analogWrite(bluePin, brightness);
			} else {
				Serial.println("Please enter red, green or blue");
			}
		}

## Arduino Color Sensor Project and RGB LED ##
1. Color sensor
	1. Read sensor values and change LED color to reflect that color
2. Objective:
	1. Color sensor: reads color
		1. virtuobotix color sensor
	2. Connections:
		1. S0 - GND
		2. S1 - 5V
		3. S2 - pin 7
		4. S3 - pin 8
		5. OUT - pin 4
		6. VCC - 5V
		7. GND - GND
3. We have to read 3 components
	1. S2: LOW, S3: LOW - written to read Red
	2. S2: LOW, S3: HIGH - written to read Blue
	3. S2: HIGH, S3: HIGH - written to read Green
4. We measure a `pulseWidth`

		pulseWidth = pulseIn(outPin, LOW); // length of a low pulse at pin outPin - width of the pulse it sees in microseconds - depends on how strong the color is that we are reading

	1. If both S2 and S3 are low, then it is RED
		1. Longer the pulse, weeker the measurement
		2. Shorter the pulse, stronger the measurement
	2. To read RED, we write low,low to S2 and S3 and then read the pulse width
		1. This is repeated for other combinations
			1. Number between 0 and 102400 (unsigned int can be used)
				1. Scale it down to 0 - 255
					1. rColorStrength = (255 - rColorStrength);

## Controlling a Servo with Arduino ## 
1. Servo: We can control the motion
	1. it is not motor
	2. It can only turn to a range
	3. Small one can be driven directly by Arduino
2. Pins
	1. Red: Power
	2. Black: Ground
	3. White: Control
3. Servo can draw a lot of power
4. Ground must be shared
5. Servos may not work properly
	1. They may not go the full range
	2. If we are trying to push further, it may draw too much current and damage the Arduino or servo
	3. Don't drive by hand
6. Project:
	1. Potentiometer to servo
		1. Analog write is from swiggly line
7. Libraries:
	1. For servo - simpler to work
		1. Higher level programming
	2. Load library

			#include <Servo.h> // loading the servo library

		1. Another way
			1. Import Library > Servo library
	3. Setup:
		
			#include <Servo.h>
			int pos = 0;
			int servoPin = 9;
			int servoDelay = 25;

			Servo myPointer; // servo object

			void setup() {
				Serial.begin(9600);
				myPointer.attach(servoPin); // servo attached to Arduino pin 9
			}

			void loop() {
				Serial.println("Where would you like to position the servo?");
				while (Serial.available() == 0) {}
				pos = Serial.parseInt();

				myPointer.write(pos);
			}

		1. 15 - 170
			1. expensive servers give more accurate range
	4. Smooth swivel

			for (pos = 15; pos <= 170; pos++) {
				myPointer.write(pos);
				delay(25);
			}

			for (pos = 170; pos >= 15; pos--) {
				myPointer.write(pos);
				delay(25);
			}

	5. `y = (155./1023.) * x + 15`

			pos = (155./1023.) * potReading + 15;
			myPointer.write(pos);

## Measure Speed of Sound with Arduino and Ultrasonic Sensor ##
1. Speed of sound ~ 331.4 + 0.6Tc m/s
	1. Ultrasonic sensor: It sends a ping and bounces off things at the front and sensor receives it
		1. Measures how long it took
		2. Pins:
			1. left: VCC - 5V on arduino
			2. Trig - 13 on arduino (sends signal)
			3. Echo - 11 on arduino (receiver)
			4. Ground - GND on arduino
	2. Working principle:
		1. Trigger pin - digital write low then pause then write high then pause then write low
		2. Echo pin - returns a pulse (microseconds)
			1. Travel time of ping in microseconds
2. Mathematics:

		Distance = rate * time

	1. Time: use pulseIn
3. Sketch

		int trigPin = 13;
		int echoPin = 11;
		float pingTime;
		float speedOfSound;
		float distance = 6;

		void setup() {
			Serial.begin(9600);
			pinMode(trigPin, OUTPUT);
			pinMode(echoPin, INPUT);
		}

		void loop() {
			digitalWrite(trigPin, LOW);
			delayMicroseconds(2000);
			digitalWrite(trigPin, HIGH);
			delayMicroseconds(10);
			digitalWrite(trigPin, LOW);

			pingTime = pulseIn(echoPin, HIGH); // measure ping travel time in microseconds

			speedOfSound = 2 * targetDistance / pingTime; // inches / microseconds

			speedOfSound = speedOfSound / 63360 * 1000000 * 3600;

			Serial.print("The speed of sound is: ");
			Serial.println(" miles per hour.");
			delay(3000);
		}

## Measure Distance with Arduino and Ultrasonic Sensor ##
1. Get distance and show it with servo
	1. 3 1/4 inches is minimum
	2. 3' is max

## Using LCD Display with Arduino ##
1. LCD: Breaks free from monitor
	1. Mobile
	2. From sparkfun inventor kit
		1. 16 (columns) x 2 (rows)
	3. 16 pins
		1. VSS - GND
		2. VDD - 5V
		3. V0 - Pot Center Pin - sets contrast
		4. RS - 10
		5. RW - GND
		6. E - 9
		7. DB0 - NOT CONNECTED
		8. DB1 - NOT CONNECTED
		9. DB2 - NOT CONNECTED
		10. DB3 - NOT CONNECTED
		11. DB4 - Pin5
		12. DB5 - Pin4
		13. DB6 - Pin3
		14. DB7 - Pin2
		15. Backlight LED +V - 5V
		16. Backlight LED GND - GND
2. Sketch

		#include <LiquidCrystal.h>
		LiquidCrystal LCD(10, 9, 5, 4, 3, 2); // Creation of a liquid crystal object named LCD, (RS, E, DB4, DB4, DB5, DB7)
		int myCounter = 0; // declare your variable myCounter

		void setup() {
			LCD.begin(16, 2); // columns x rows
			LCD.setCursor(0, 0); // set LCD cursor to upper left corner of display
			LCD.print("My Timer: "); // Print our first line
		}

		void loop() {
			for (myCounter = 1; myCounter <= 10; myCounter++) {
				LCD.setCursor(0, 1);
				LCD.print("                ");

				LCD.setCursor(0, 1); // first column, second row
				LCD.print(myCounter);
				LCD.print(" Seconds");
				delay(1000);
			}

			for (myCounter = 10; myCounter >= 0; myCounter--) {
				LCD.setCursor(0, 1);
				LCD.print("                ");

				LCD.setCursor(0, 1); // first column, second row
				LCD.print(myCounter);
				LCD.print(" Seconds");
				delay(1000);
			}
		}

## Ultrasonic Sensor and LCD on Arduino for Distance ##
1. Ultrasonic - upto 15 feet (if there is a wall)
	1. 4 feet is possible
2. Sketch:

		#include <LiquidCrystal.h>
		LiquidCrystal LCD(10, 9, 5, 4, 3, 2);

		int trigPin = 13;
		int echoPin = 11;

## Data Logging from Arduino to SD Card ##
1. Virtuobotix SD card module
	1. Adafruit BMP 180 pressure sensor
		1. Vin - 5V
		2. GND - GND
		3. SCL - A5
		4. SDA - A4
2. Sketch

		#include <SD.h>
		#include <SPI.h>

		#include "Wire.h" // imports the wire library for talking over I2C
		#include "Adafruit_BMP085.h" // import the Pressure Sensor Library
		Adafruit_BMP085 mySensor; // create sensor object called mySensor

		float tempC; // variable for holding temp in C
		float tempF; // variable for holding temp in F
		float pressure; // variable for holding pressure reading

		int chipSelect = 4; // Set chipSelect = 4 in Arduino
		File mySensorData; // variable for working with our file object

		void setup() {
			Serial.begin(9600);
			mySensor.being();
			
			// Need to hold pin 10
			pinMode(10, OUTPUT); // Reserve pin and don't use it for other parts of circuit
			SD.begin(chipSelect); // initialize the SD card with chipSelect connected to 4
		}

		void loop() {
			tempC = mySensor.readTemperatur();
			tempF = tempC * 1.8 + 32.;
			pressure = mySensor.readPressure();

			mySensorData = SD.open("PTData.txt", FILE_WRITE); // short names work, new or append data

			if (mySensorData) {
				Serial.print("The Temp is: ");
				Serial.print(tempF);
				Serial.println(" degrees F");
				Serial.print("The Pressure is: ");
				Serial.print(pressure);
				Serial.println(" Ps.");
				Serial.println("");
				delay(250); 

				mySensorData.print(tempF);
				mySensorData.print(",");
				mySensorData.println(pressure);
				mySensorData.close(); // close the file
			}
		}

	1. Connecting SD Card Reader:
		1. GND - GND (Common ground)
		2. 3.3V - (Not used) - 
		3. +5 - 5V (Power)
		4. CS - 4 (Chip Select)
		5. MOSI - 11 (SPI Data)
		6. SCK - 13 (Clock)
		7. MISO - 12 (SPI Data)
		8. GND - GND (Common ground)
	2. MOSI/MISO - protocol
		1. Microcontroller can talk to advanced components
		2. MOSI - Input serial interface
		3. MISO - Output serial interface
	3. Plug the SD card to computer and open the file
		1. Plot graph

## Build an Arduino GPS Tracker ##
1. Adafruit: Ultimate GPS breakout
	1. Most GPS stop working above 60000 ft
	2. Misread govt regulation (it is turned off usually)
		1. Adafruit makes it working above on slow moving objects
2. Library download:
	1. www.toptechboy.com
		1. Lesson 22
			1. Adafruit GPS Library
	2. Download ZIP
	3. File > Preferences > Sketch book library folder
		1. Open the sketch folder
		2. Drop it inside the library folder
	4. Re-open fresh one
3. As soon as it is turned on, it streams data
	1. Vin - 5V
	2. GND - GND
	3. RX - Pin2
		1. Pin0 
	4. TX - Pin3
		1. Pin1
4. NMEA sentences
	1. Various data that is useful
		1. Time
		2. Latitute
		3. Longitude
		4. Altitude
		5. Do you have a fix
		6. How many satellites can we see
		7. Quality of the fix
		8. Velocity
		9. ...
	2. In room we cannot get a fix
		1. #GPRMC
		2. #GPGCA
	3. Serial buffer may have stale data
5. Sketch

		#include <Adafruit_GPS.h>
		#include <SoftwareSerial.h> // load software serial library - new serial ports on other pins
		SoftwareSerial mySerial(3, 2); // Initialize the software serial port
		Adafruit_GPS GPS(&mySerial); // GPS object
		
		String NMEA1; // Variable for first NMEA sentence
		String NMEA2; // Variable for second NMEA sentence
		char c; // to read characters coming from the GPS
		
		void setup() {
		  Serial.begin(115200); // Turn on serial monitor
		  GPS.begin(9600); // Turn on GPS at 9600 baud
		  GPS.sendCommand("$PGDMD,33,0*6D"); // turn off antenna update data
		  GPS.sendCommand(PMTK_SET_NMEA_UPDATE_10HZ); // Set update rate to 10 hz
		  GPS.sendCommand(PMTK_SET_NMEA_OUTPUT_RMCGGA); // we want RMC and GGA sentences only
		  delay(1000);
		}
		
		void loop() {
		  readGPS();
		  delay(250);
		}
		
		void readGPS() {
		  clearGPS();
		
		  while (!GPS.newNMEAreceived()) {
		    c = GPS.read();
		  } // drops out when we have one of the sentences
		
		  GPS.parse(GPS.lastNMEA()); // Parse that last good NMEA sentence
		  NMEA1 = GPS.lastNMEA();
		
		  while (!GPS.newNMEAreceived()) {
		    c = GPS.read();
		  } // drops out when we have one of the sentences
		
		  GPS.parse(GPS.lastNMEA()); // Parse that last good NMEA sentence
		  NMEA2 = GPS.lastNMEA();
		
		  Serial.println(NMEA1);
		  Serial.println(NMEA2);
		  Serial.println("");
		}
		
		void clearGPS() { // clear old and corrupted data from serial port
		  while (!GPS.newNMEAreceived()) {
		    c = GPS.read();
		  } // drops out when we have one of the sentences
		  GPS.parse(GPS.lastNMEA()); // Parse that last good NMEA
		
		  while (!GPS.newNMEAreceived()) {
		    c = GPS.read();
		  } // drops out when we have one of the sentences
		  GPS.parse(GPS.lastNMEA()); // Parse that last good NMEA
		
		  while (!GPS.newNMEAreceived()) {
		    c = GPS.read();
		  } // drops out when we have one of the sentences
		  GPS.parse(GPS.lastNMEA()); // Parse that last good NMEA
		}

	1. Using the data in google earth
		1. put space after degrees (before minutes)
			1. 30 51.xxxxN, 100 36.xxxxW

## Understanding GPS NMEA Sentences ##
1. Types of NMEA sentences
	1. GPRMC
	2. GPVTG
	3. GPGGA
2. If GPS has a fix, GPS sentences should be like below:
	1. $GPGGA...
	2. $GPRMC...
3. $GPRMC,194530.000,A,3051.8007,N,10035.9989,W,1.49,111.67,310714...A*74
	1. 19:45:30
	2. A - everything is good
	3. 30 deg 51.8007 minutes - latitude
		1. Two to left of decimal is minutes
	4. N - Northern hemisphere
	5. ..
	6. 1.49 speed in naughts
	7. 111.67 - track angle (google it)
	8. 31/07/2014
	9. ...
	10. A*74 - checks if it is self calibrating etc...
11. KML file:
	1. decimal digress
		1. 60 digrees in a minute
			1. 51.007 / 60 ~ 0.8501
				1. 30.8501 degress
	2. N,E positive
	3. S,W negative
	4. Longitude first and latitude second
12. $GPGGA:
	1. 19:45:30
	2. ...
	3. 1 - fix quality (we have a fix)
	4. 4 - how many satellites (more the better)
	5. 2.18 - horizontal dilutional position (google it)
	6. 746.4 - altitude above mean sea level in meters
	7. M - meters
	8. -22.2 - where is mean sea level wrt elipsoid earth (high precision)
	9. ,, - magnetic info
	10. *68 - checksum

## Displaying GPS NMEA Data in Google Earth ##
1. GPS tracker
	1. Display on google earth
2. Sketch:

		float deg;
		float degWhole;
		float degDec;
		...
		void loop() {
			...
			
		}

	1. float(int(x / 100))  - degree part
	2. (x - (deg * 100)) - minutes
		1. above / 60 - decimal part of degree


				degWhole = float(int(GPS.longitude/100));
				degDecimal = (GPS.longitude - degWhole * 100) / 60;
				deg = degWhole + degDecimal;
	
				if (GPS.lon == 'W')
					deg = (-1) * deg;

				mySensorData.print(deg, 4);

				degWhole = float(int(GPS.latitude/100));
				degDecimal = (GPS.latitude - degWhole * 100) / 60;
				deg = degWhole + degDecimal;
	
				if (GPS.lon == 'W')
					deg = (-1) * deg;

				mySensorData.print(deg, 4);

				mySensorData.print(GPS.altitude);
				mySensorData.print(" "); // Google earth accepts space separated values

		1. Put a wrapper around the data:
			1. www.toptechboy.com
				1. Lesson 25
					1. copy the xml
					2. copy coordinates and paste between `<coordinates>`...`</coordinates>`
			2. Open the file with google earth (right click)
			3. Save the file with extension *.klm
3. Arduino Nano:
	1. Plug it into PCB
	2. Wiring:
		1. wire wrapping (packaging)
			1. 3D robot
			2. Quadcopter
			3. Unmanned Airial Drone
				
## Wire Wrapping ##
1. Better connections are required for UAD...
2. Wire wrapping:
	1. Lesson 26
		1. Need a wire wrap tool
		2. Need a wire wrap wire
		3. Prototyping board
3. Plug arduino nano
4. Plug GPS
5. Wire should be 2" longer than required
	1. Put the wire into the notch
	2. Put the lead into the wire wrap tool
	3. Rotate the tool

## Arduino Based Instrument Package ##
1. Breadboard to perfboard

## Tutorial for Programming Software Interrupts on Arduino ##
1. Paralelly blinking two leds!!!
	1. Harder
		1. Serial execution
2. Software interrupt
	1. Little part running in background
		1. Run main program then it interrupts and moves to the other program and comes
	2. Software interrupt
	3. Download zip file: 
		1. [http://www.toptechboy.com/arduino/arduino-lesson-28-tutorial-for-programming-software-interrupts/](http://www.toptechboy.com/arduino/arduino-lesson-28-tutorial-for-programming-software-interrupts/)
		2. TimerOner11.zip
		3. Unzip
	4. Open Arduino > Perferences > select location
		1. Open the location
		2. Libraries
			1. New folder > TimerOne
				1. copy all the files from the zip file here
	5. New empty sketch

			#include <TimeOne.h>

			String LEDStatus = "OFF";
			int yellowLED = 10;
			int redLED = 9;

			void setup() {
				pinMode(yellowLED, OUTPUT);
				pinMode(redLED, OUTPUT);

				Timer1.initialize(1000000); // interrupt will run once a second - like an alarm
				Timer1.attachInterrupt(blinkYellow);
			}

			void loop() {
				digitalWrite(redLED, HIGH);
				delay(250);
				digitalWrite(redLED, ON);
				delay(250);
			}

			void blinkYellow() {
				if (LEDStatus == "ON") {
					digitalWrite(YellowLED, LOW)
					LEDStatus = "OFF";
					return;
				}
				if (LEDStatus == "OFF") {
					digitalWrite(YellowLED, HIGH);
					LEDStatus = "ON";
					return;
				}
			}

## Dos and Don'ts for Arduino Software Interrupts ##
1. We have to go off for minimum possible amount of time and come back
	1. Or else timing problems
2. Do something simple (in and out quickly)
3. Do not use delay in interrupt
	1. Ignores delay
4. Don't do printing in interrupt
5. Don't messing with serial port (it is slow)
	1. Don't do serial functions
6. Don't ask user for input in interrupt

## Advanced Software Interrupt Techniques for Reading Serial Data on Arduino ##
1. GPS - spits it out serial data (it just talks)
	1. Overflows buffer if we don't read
	2. Sends burst of data and pauses
2. [https://github.com/PaulStoffregen/TimerOne](https://github.com/PaulStoffregen/TimerOne)
	1. Download zip
	2. Open arduino library folder
	3. Replace old timerone library and put these there
3. Open fresh sketch
	
		#include <TimerOne.h>
		#include <SoftwareSerial.h>
		
		int flag = 0;
		int RedLED = 9;
		long tmr;
		String NMEA = "";
		char c;
		String UPDATE_10_SEC = "$PMTK220,10000*2F\r\n"; // send every 10 seconds
		String GPRMC_ONLY = "$PMTK314,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0*29\r\n";
		SoftwareSerial GPSSerial(2,3);

		void setup() {
			pinMode(RedLED, OUTPUT);
			GPSSerial.begin(9600);
			Serial.begin(115200);
			delay(100);
			GPSSerial.print(GPRMC_ONLY);
			delay(100);
			GPSSerial.print(UPDATE_10_SEC);
			Timer1.initialize(1000); // every milli second
			Timer1.attachInterrupt(readGPS);
		}

		void loop() {
			digitalWrite(RedLED, HIGH);
			delay(1000);
			digitalWrite(RedLED, LOW);
			delay(1000);

			if (flag == 1) {
				Timer1.stop();
				NMEA.trim();
				Serial.println(NMEA);
				NMEA = "";
				flag = 0;
				Timer1.restart();
			}
		}

		void readGPS() {
			if (GPSSerial.available() > 0) {
				c = GPSSerial.read();
				NMEA.concat(c);
			}
			if (c == '\r') {
				flag = 1;
			}
		}

## Understanding Arduino Arrays ##
1. Arrays:

		float grades[25];
		int numGrades;
		float av;
		int i;
		float sumGrades = 0;

		void setup() {
			Serial.begin(9600);
		}

		void loop() {
			Serial.println("How Many Grades? ");
			while (Serial.available() == 0) {
			}
			numGrades = Serial.parseInt();

			for (i = 0; i < numGrades; i++) {
				Serial.println("Please input your grade: ");
				while (Serial.available() == 0) {
				}
				grades[i] = Serial.parseFloat(); 
			}

			for (i = 0; i < numGrades; i++) {
				sumGrades += grades[i];
			}

			av = sumGrades / numGrades;

			Serial.print("Your average is ");
			Serial.print(av);
			Serial.println("");	
		}

## Understanding Arduino Functions ##
## Understanding Arduino Local and Global Variables ##
## Return a Variable Value from a Function in Arduino ##
## Passing Parameters and Variables by Reference in Arduino Functions ##
1. Best practice is to use local variables
2. Declaration

		tally(a, b, c, d);
		...
		void tally(float firstNum, float secondNum, float &sum, float &difference) {
			sum = firstNum + secondNum;
			difference = firstNum - secondNum;
			Serial.println(sum);
			Serial.println(difference);
		}