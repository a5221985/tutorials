# ESC Calibration #

1. Calibrating ESC throttle ranges is an important part of setting up a multicopter, as it insures that the ESCs all respond the same way to the Flight Controller.

## To calibrate an ESC, follow this procedure: ##
1. Unplug everything from your receiver (Rx).
2. Plug the ESC into the receiver Throttle channel.
3. Turn on your transmitter (Tx), and move the throttle stick to the top.
4. Power up your ESC with a motor attached (but without a prop!)
5. The ESC will beep a few times, then stop. How many times, and for how long, depends on the make and model.That means it has set the Throttle Max value.
6. After the ESC has stopped beeping, move your throttle on your Tx to zero. The ESC will then beep again, confirming that it has set the Throttle Min value.
7. Repeat this procedure for all your ESCs.
8. To make the procedure quicker, you can make up a harness connecting all the ESCs in parallel. This can be done either with servo extension leads, or with strip board and pin headers. This is well worth doing, as it makes the process much quicker, and sets the same range on all ESCs.