# Arduino C Programming #
## Topics ##
1. C programming with Arduino
2. Kit link
3. Arduino Uno
	1. Connect it with USB
## Prerequisite ##
1. Arduino IDE
2. VS Code

## Connection ##
1. Serial monitor: Icon is in Top Right Corner
2. Tools > Board > Arduino Uno
3. Tools > Ports > Select a port

## Code ##

		const int ledPin = 13; // pin referenced -32000 - 32000, global variable and accessible to all the functions
		
		void setup() {
			// put your setup code here, to run once:
			Serial.begin(9600); // opens port and 960 characters per second
			pinMode(ledPin, OUTPUT);
		}
		
		void loop() {
			// put your main code here, to run repeatedly:
			int delayPeriod = 100;
			digitalWrite(ledPin, HIGH);
			delay(delayPeriod);
			digitalWrite(ledPin, LOW);
			delay(delayPeriod);
		}