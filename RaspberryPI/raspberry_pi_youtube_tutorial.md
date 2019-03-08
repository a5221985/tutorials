# Raspberry PI Tutorials #
## An Introduction ##
1. Everything that we need to know to get this up and running
2. What is it?
	1. It is a small single board computer
		1. Helps people learn programming and and how computer works
	2. CPU - System on a chip
		1. Pairs arm processor (used by embedded systems, smart phones) and GPU
3. Specification:
	1. Raspberry PI - Model B Specs
		1. CPU: ARM1176JZF-S 700 MHz
		2. GPU: VideoCore IV
			1. Fairly powerful graphics processor (1080P HD video)
		3. RAM: 256 megabytes
			1. Sparse
				1. Shared by CPU and GPU
	2. Ports
		1. USB 2.0 x 2
		2. HDMI
		3. RCA Video Out
		4. Stereo Audio Out
		5. Ethernet 10/100 - cable required
		6. GPIO Header
			1. For more advanced users
		7. Micro USB (Power Only) 5v
		8. SD/SDHC Slot
4. B Model:
	1. Will be adding probably arduino accessory boards and cables for communicating with other hardware devices
		1. Robotics
		2. Sensors
5. Why is it cool?
	1. Fairly complete computer
	2. Small and cheap
	3. Runs on low computer
6. What can I do with it?
	1. Raspbian - Debian based
		1. Has basic tools for programming
			1. Python
			2. Java
			3. Perl
			4. Php
			5. ...
	2. Media PC
		1. Openelec OS: Backend for XBox media center
			1. Can stream media content to High def TV

## Hardware Accessories ##
1. Bare necessities
	1. Power
		1. PI is picky about it's power source
		2. 5 V - 4.75V - 5.25V
		3. >= 1500 mA to 2000 mA is recommended
		4. Power issues:
			1. cell phone cable causes fluctuation
			2. 5 v 2000mA adapter + 6 foot USB to micro-usb cable - Didn't work
			3. Test power drawn:
				1. set multimeter to 20 - use contacts TP1 (red) and TP2 (black)
					1. Voltage dropping below 4.5v and something below 4.3v
			4. micro usb cable must be of very high quality (should keep >= 4.75v) - 3 foot better
	2. SD Card
		1. Used to store OS and files
			1. atleast class 4, class 6 or class 10 is good
		2. Card reader: to transfer OS image downloaded onto the SD card
		3. OS pre-installed cards are available
		4. Keep a card for each OS
2. How to interact with PI?
	1. Headless over a network
		1. Cat5 or cat6 to connect to router
		2. USB Wifi option (wifi dongle - EDIMAX)
			1. EW-7811Un (150 Mbps Wireless IEEE802.11b/g/n nano USB Adapter)
				1. Complies with wireless 802.11b/g/n standards with data rate up to 150 Mbps
				2. Green Power Saving: Supports smart transmit power control and auto-idle state adjustment
				3. Increases wireless coverage 3 times further
				4. Includes multi-language EZmax setup wizard
				5. Supports 64/128-bit WEP, WPA, WPA2 encryption and WPS-compatible
				6. Supports QoS - WMM, WMM - Power Save mode
	2. Keyboard and mouse and monitor
	3. Both
3. Logon from desktop
	1. `ssh -i pi 192.168.0.246`
		1. default password
		2. Login to router to know what IP address is assigned
		3. If local: `ifconfig`
4. Wireless keyboard and mouse device
5. Connecting to monitor
	1. HDMI cable
	2. HDMI to DVI cable
		1. Adapter
		2. Sound coming out is ignored
6. RCA/Out - to connect to older standard definition televisions
	1. HD videos do not down convert (only sounds)
7. SSH is enough for most of the setup
8. Optional: Get a case (protects the board)
	1. Adafruit clear case

## Installing an OS (SSE NEWER METHOD 1st!!) ##
1. Goal:
	1. Learning
	2. Programming
	3. Quick and cheap home theatre
2. General purpose:
	1. Raspbian (learning, programming) - latest version
3. Home theatre:
	1. OpenElec
	2. RaspBMC
4. [https://www.raspberrypi.org/downloads/raspbian/](https://www.raspberrypi.org/downloads/raspbian/)
	1. Direct Download
		1. raspbian.zip
		2. occidentalis - educational
		3. Openelelec
		4. openelfc
	2. Unzip
		1. *.img
	3. Download win32 disk imager (windows)
		1. run it
		2. tell the location of image
		3. tell the drive letter to write to (SD card)
			1. blank SD card
	4. Open new shell (Mac OSX/Unix/Linux)
		1. `df`
			1. devices and folders where they are mounted
		2. Plug SD card reader with SD card
		3. `df`
			1. `/dev/disk3s1` say
		4. Unmount SD card (disk utility)
			1. `sudo diskutil umount /dev/disk3si`
		5. `dd`
		
				dd bs=1m if=<*.img> of=/dev/rdisk3 (mac)
				
				dd .... /dev/sdc (linux)

			1. bs: block size
			2. if: in file
			3. of: out file

### Installing Berry Boot ###
1. Boot loader: Berry Boot
	1. Used to manage multiple OSes
		1. Select the OS, wait for it to download and then boot
2. Get blank SD card (MS Dos format)
3. Go to sourceforge.com/projects/berryboot
	1. unzip
	2. copy the files to (not the root folder) to SD card
	3. Safely eject the card
4. Put the card and start
	1. Do you see green borders? yes (disable overscan) or no
	2. ...
	3. select drive (same)
		1. ext4 (no trim/discard)
	4. Choose OS interested in
	5. Exit
		1. Reboots and runs the OS chosen

## First Boot of Raspbian & OpenElec ##
1. Plug keyboard
2. Plug mouse
3. Plug lan cable
4. Plug hdmi cable
5. Plug micro usb
6. login
	1. username: pi
	2. password: raspberry
7. `startx` to start desktop interface
8. Tools:
	1. Python
	2. Light weight web browser
	3. Terminal
		1. `perl --help`
9. Shutdown
	1. `sudo space halt`
	2. switch off
	3. swap the card

## Getting Around in the Unix Command Line Interface ##
1. Linux: directory hierarchy
	1. `/home/pi`
		1. `cd ~`
	2. `pwd` - print working directory (abbrev most commands)
	3. `cd /`
	4. `cd /etc` - system config files
		1. `ls`
		2. `ls -a`
		3. `ls -l`
		4. `ls -p`
		5. `ls --color`
		6. `ls -lap`
	5. `cd ../..`
	6. `cd .`
2. `/bin` - commands and binaries
3. `/sbin` - system and admin commands
4. `/usr` - user related stuff
	1. `bin`, `sbin`
5. `/var` - variable
	1. `/var/log` - troubleshoot problems
6. `/home` - user directories
7. `/mnt` - mount
	1. External drives, directories
8. `/dev` - device interfaces to the hardware
9. `/lib` - program libraries
10. `mkdir dir1`
11. `touch test`
12. `rm -rf <dir>`
	1. -r: recursively
	2. -f: force
13. `cp file1 file2`
14. `mv file1 file2`
15. `mkdir dir1`
16. `cp -R dir1 dir2`
17. `man mv`

## Running Programs, File Permissions & Environment Variables ##
1. `cd /bin`
	1. `whereis cd` - built into commandline shell
	2. `whereis pwd`
2. `PATH` variable - `whereis` looks here
	1. Environment variables (when we login)
	2. `env`
3. `./myfirstprogram` (need to give current directory to PATH if ./ is not required)
	1. `chmod 755 myfirstprogram`
	2. `./myfirstprogram`
	3. `/home/.../myfirstprogram` 
4. `echo $PATH` - lists contents of PATH variable
	1. file case and spelling is important
	2. `echo $USER`
	3. `echo $HOME`
	4. `export PATH=$PATH:/home/pi/code` : is delimiter
5. Persistence across login: user profile
6. `chmod`: change mode
	1. read/write/execute to users/groups/others
		1. `755`: 7 - owner, 5 - group, 5 - all other users on the system
			1. 4 - read
			2. 2 - write
			3. 1 - execute
	2. wikipedia - chmod
	3. `chmod u+rwx,go+rx myfirstprogram`

## Editing Files, Root Access Using Sudo, Installing with Apt-Get ##
1. pico - pine composer
2. nano
	1. `apt-get install nano`
3. pico myprogram
	1. ctrl+x
	2. Y
	3. ctrl+w (search)
	4. ctrl+y,v (page up/page down)
	5. shift+insert (paste)
	6. ctrl+g
	7. man pico
4. `#` - back comment
5. Superuser:
	1. `sudo ...`
	2. `sudo -i` - root login
		1. full permission
			1. `whoami`
6. `.profile`

		## Our Stuff
		alias ls='ls -ap'

	1. `. .profile`
7. `clear`
8. commands are stored in history file
	1. `history -c` - clears history
9. Package manager - `apt` - need to be root
	1. `sudo -i`
	2. `apt-get update`
	3. `apt-get install mc`
		1. midnights commander file manager
	4. `mc`
		1. `exit`
	5. `apt-get remove mc`

## Mounting Drives ##
1. External drive (windows - automatic)
	1. Linux: `/dev` - audo, video, ...
	2. `df` - shows mount points
2. Find device name:
	1. Monitoring system messages
		1. `tail -f /var/log/messages` - messages file
		2. Use usb hub if required
			1. `/dev/sda1`
		2. ctrl + c
	2. `sudo fdist -l` - connected device
3. Mounting:
	1. `/mnt` or `/media`
	
			cd /mnt
			sudo mkdir usbstick
			sudo mount /dev/sda1 /mnt/usbstick (only available to root)
			sudo mount -t vfat -o uid=pi,gid=pi /dev/sda1 /mnt/usbstick

		1. -o - options
			1. uid, gid for pi are used for file permissions
		2. -t - file type
4. `cd /mnt`
	1. `sudo umount /mnt/usbstick`
5. Windows drives - ntfs-3g (probably)
6. Mac - hfsplus (probably)
	1. may need to add packages
		1. `sudo apt-get install hfsplus hfsutils hfsprogs`

## Partitioning & Formatting Drives I ##
1. New harddrive or thumbdrive
	1. partitioning
2. `man fdisk` - advanced
	1. `sudo fdisk -l`
3. `sudo fdisk /dev/sda`
	1. `m`
	2. `p` - partition table
	3. `d` - delete partition (prompts for multiple)
	4. `n` - new partition
		1. `p` - primary
		2. `1` - partition
		3. `2048` - default
		4. `+4G`
	5. `p` - new linux partition
	6. `n`
		1. `p` - primary
		2. `2` - partition number
		3. hit enter for last sector
	7. `w` - write to partition table
	8. `sudo fdisk -l` - 2 partitions created
4. `sudo mkfs -t ext4 /dev/sda1` - make filesystem
5. `sudo mkfs -t ext4 /dev/sda2`
6. Mounting:
	1. `cd /mnt`
	2. `sudo mkdir part1 part2`
	3. `sudo mount /dev/sda1 /mnt/part1`
	4. `sudo mount /dev/sda2 /mnt/part2`
7. `cd part1`
8. `sudo touch test1`
9. `cd part2`
10. `sudo touch test2`
	1. `touch`: updates timestamps or new file is created

## Partitioning & Formatting Drives II ##
1. Desktop GUI
2. `sudo umount /dev/sda1`
3. `sudo umount /dev/sda2`
4. `sudo fdisk /dev/sda`
	1. `d`
	2. `2`
	3. `d`
	4. enter (only 1 partition left)
5. `n`
	1. `p`
	2. `1`
	3. enter
6. `p`
7. `l` - lists types of drives
8. `t` - changes type
	1. `b` - FAT32
9. `w` - writes
10. Formatting:
	1. `sudo apt-get install dosfstools`
	2. `sudo mkfs -t vfat /dev/sda1`
11. Connecting a lot of devices may drop voltage to too low so PI might become unstable
	1. Using powered USB hub is better (draws it's own power supply)
12. `startx`
	1. `sudo apt-get update` - updates package information
	2. `sudo apt-get install gparted`
	3. `sudo gparted`
	4. Plug in sd card into powered usb hub
13. Partitioning and formatting
	1. Click apply after
14. If we want a drive to be read by both windows and linux, then use ntfs
	1. Install ntfs package (ntfs-3g)

## How to Install Minecraft - Pi Edition ##
1. Installation:
	1. Connect keyboard, mouse, lan, monitor (locally)
	2. `startx`
	3. Open terminal
	4. `wget https://s3.amazonaws.com/assets.minecraft.net/pi/minecraft-pi-0.1.1.tar.gz`
	5. `tar -zxvf minecraft-pi-0.1.1.tar.gz`
	6. `cd mcpi`
	7. `./minecraft-pi`

## Installing a Webserver (Nginx, PHP, Perl) ##
1. Nginx - seems to be best for Raspberry PI
	1. `sudo -i` - interactive mode
	2. `apt-get update`
	3. `apt-get install nginx php5-fpm php5-cgi php5-cli php5-common libfcgi-perl`
2. `service nginx start`
	1. `ifconfig`
	2. `<ip>` in browser
	3. `cd /etc/nginx`
	4. `cd sites-available`
	5. `pico default`
		1. Find `php` section
		2. Uncomment

				index index.php index.cgi ...
				...
				location ~ \.php$ {
						...
						...
				}
				...
				location ~ /\.ht {
					...
				}

		3. `service nginx restart`
		4. `cd /usr/share/nginx/www`
			1. `pico index.php`

					print("Hello World! This is our PHP test file.");

				1. `<ip>/index.php` - default page
3. Perl:
	1. `sites-available/default`
	
			location ~ \.pl|cgi$ {
				try_files $uri =404;
				gzip off;
				fastcgi_pass	127.0.0.1:8999;
				fastcgi_index	index.pl;
				fastcgi_param	SCRIPT_FILENAME	$document_root$fastcgi_script_name;
				include fastcgi_params;
			}

	2. Fast cgi wrapper script (nginxlibrary.com)
		1. `wget http://nginxlibrary.com/downloads/perl-fcgi/fastcgi-wrapper.pl -o /usr/bin/fastcgi-wrapper.pl`
		2. `wget http://nginxlibrary.com/downloads/perl-fcgi -o /etc/init.d/perl-fcgi`
		3. `chmod +x /usr/bin/fastcgi-wrapper.pl`
		4. `chmod +x /etc/init.d/perl-fcgi`
		5. `update-rc.d perl-fcgi defaults`
		6. `insserv perl-fcgi`
		7. `service nginx restart`
		8. `/etc/init.d/perl-fcgi start`
		9. `cd /usr/share/nginx/www`
			1. `pico index.cgi`

					#!/usr/bin/perl

					print "Content-type:text/html\n\n";
					print <<EndOfHTML;
					<html><head><title>Perl Environment Variables</title></head>
					<body>
					<h1>Perl Environment Variables</h1>
					EndOfHTML

					foreach $key (sort(keys %ENV)) {
						print "%key = $ENV{$key}<br>\n"
					}

					print "</body></html>";

				1. `chmod 755 index.cgi`
		10. `<ip>/index.cgi`
		11. Index files will get loaded in the priority order listed in the default file

## Networking - How to Configure a Static IP Address & Setup Wifi ##
1. Wired and wireless
2. Static IP address - to host (paid colocation - edis (host pi completely free))
3. Wifi: Miniature WiFi (802.11b/g/n) Module: For Raspberry Pi and more
4. When connected to router, IP address is assigned by DHCP (Dynamic Host Configuration Protocol)
	1. No 2 devices in local network can have the same IP address
		1. Static IP: If PI is used as server, we can configure router to forward requests to PI
5. `cd /etc/network`
	1. `ifconfig`
		1. `192.168...` - non routable address space - for local networks only - no public machines can have
			1. `10.10...` is also used as a choice
		2. Router does Network Address Translation (NAT) to get local devices connected to the internet
			1. NAT: Internet provider gives one IP address assigned to modem/router (public IP) - usually dynamic
			2. Local device request is received, then sent using public IP assigned by ISP
			3. When response comes, router knows how to send the response back to the local device
			4. For outside world, we only only one IP (assigned to modem/router)
	2. `sudo pico interfaces`

			iface eth0 inet static (remove dhcp)
				address 192.168.0.210
				netmask 255.255.255.0
				network 192.168.0.0
				broadcast 192.168.0.255
				gateway 192.168.0.101 (may be different)

	3. `sudo reboot`
	4. Or
		1. `sudo ifconfig eth0 down`
		2. `sudo ifconfig eth0 up`
	5. We can login from any machine from the network using the static IP address
		1. `ssh -l pi 192.168.0.210`
			1. password: raspberry
6. PuTTY from Windows
7. Use cases:
	1. Web traffic
	2. Remote login
8. DNS: Looks up what IP address a server has (like phone book)
	1. We can define
	2. `ping google.com`
	3. `cd /etc`
		1. `sudo pico resolv.conf`
		
				nameserver 192.168.0.101

			1. router's ip address
				1. Router serves DNS requests which is then forwarded to ISP's DNS servers
			2. We can specify other DNS servers (Google's)

					nameserver 8.8.8.8
					nameserver 8.8.4.4
9. If we have trouble getting outbound connections to the internet
	1. Set default Gateway:
		1. `sudo route add default gw <router's-ip-address> eth0`
	2. See routing info:
		1. `route` 
10. Hostname:
	1. `sudo pico /etc/hostname`
11. Wifi:
	1. `cd /etc/network`
	2. `sudo pico interfaces`

			allow-hotplug wlan0
			auto wlan0
			iface wlan inet dhcp
				wpa-ssid "YOURSSID"
				wap-psk "YOURWIFIPASSWORD"

	3. Reboot: `sudo reboot`
	4. Static IP:

			allow-hostplug wlan0
			auto wlan0
			iface wlan0 inet static
				address 192.160.0.211
				netmask 255.255.255.0
				network 192.168.0.0
				broadcast 192.168.0.255
				gateway 192.168.0.101
				wpa-ssid "YOURSSID"
				wpa-psk "YOURWIFIPASSWORD"

	5. Reboot: Both interfaces will work
		1. If we remove lan cable, wifi may not work
			1. Bring down eth0 first
				1. `sudo ifconfig eth0 down`
				2. We can remove the cable and wifi should word

## Working with LEDs and GPIO (see description for notes!) ##
1. Hardware:
	1. Breadboard
	2. GPIO Cobbler
		1. Adafruit - I/O connector
	3. Wiring Kit
	4. LED 5mm - Red
		1. 2Vf @ 20mA (f: forward voltage)
	5. LED 5mm - Yellow
	6. LED 5mm - Green
	7. 270 Ohm 1/2w 2% Resistors
		1. Anything above 100 ohms is fine
			1. Apply Ohm's law
				1. E = I * R
					1. Voltage = Amperes * Ohms
						1. GPIO pin is supplying 3.3V
						
								3.3V - 2V = 1.3v

								1.3 V/0.02 A = 65 ohms minimum
				
						2. GPIO pin is supplying 5V

								5 - 2 = 3

								3/0.02 = 150 ohms minimum

		2. 2% (variance)
			1. 264 - 275 ohms
2. GPIO pins
	1. GND
		1. Wire GND to - in breadboard
	2. #4
	3. #17
	4. #22
3. Take red led and put short leg (nagative) to 18 of - in breadboard and long leg to A,18
4. Take 220 ohm resister and put one leg in row 18 column B and other leg in row 26 column B
5. Plug a wire to C,26 and #4 (J, 6)
6. Software
	1. Start PI
	2. `sudo apt-get install python-dev`
	3. `sudo apt-get install python-pip`
	4. `sudo pip install RPi.GPIO`
	5. `sudo -i` - to get access to hardware with python
	6. `python`

			import RPi.GPIO as GPIO
			GPIO.setmode(GPIO.BCM) # access broadcom chip
			GPIO.setup(4, GPIO.OUT)
			GPIO.output(4, True) # turn on led
			GPIO.output(4, False) # turn off led
			GPIO.output(4, 1) # on
			GPIO.output(4, 0) # off

## Working with LEDs and GPIO ##
1. Yellow led under red in row 21
2. Green led under yellow in row 24
3. resistor one end with bands lined towards the longer lead and other end on - in breadboard
4. yellow wire for yellow led, green wire for green led
	1. yellow: row 28 and #17 (row 8)
	2. green: row 30 and #22 (row 10)
5. Software:
	
		import time;
		GPIO.setup(17, GPIO.OUT)
		GPIO.setup(22, GPIO.OUT)
		while True:
			GPIO.output(22, True)
			time.sleep(5)
			GPIO.output(22, False)
			GPIO.output(17, True)
			time.sleep(2)
			GPIO.output(17, False)
			GPIO.output(4, True)
			time.sleep(5)
			GPIO.output(4, False)

	1. pico rapidblink.py
		1. Copy all of the above (decrease sleeps)
		2. `python rapidblink.py`
	2. pico ledoff.py

			import RPi.GPIO as GPIO
			GPIO.setwarning(False)
			GPIO.setmode(GPIO.BCM)
			GPIO.setup(4, GPIO.OUT)
			GPIO.setup(17, GPIO.OUT)
			GPIO.setup(22, GPIO.OUT)
			GPIO.output(4, False)
			GPIO.output(17, False)
			GPIO.output(22, False)