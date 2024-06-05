1. Reference:
- Connect raspberry pi 3 B+ with Ubuntu using wifi/ethernet - 2022 : https://www.youtube.com/watch?v=YXA66QXrH1c
- HOW TO control the GPIO Pins: https://www.youtube.com/watch?v=0zaawzBxGcY
- Full tutorial control PI - Embedded : https://www.youtube.com/watch?v=1WDagiA8fdU&list=PLGs0VKk2DiYxdMjCJmcP6jt4Yw6OHK85O
2. In this project :
I used Raspberry 4 model B to add the OS inside, you can choose whatever you want but recommended with reduce time to stay with choosing OS
we can choose the avaible in rpi-imager by install the rpi-imager package in Ubuntu.
Attention! Don't forget to attach your SD card in to your PC/laptop.
```
sudo apt-get install rpi-imager
rpi-imager
```
#rpi-imager tool
 
  ![Screenshot from 2024-05-31 13-28-54](https://github.com/angerpro1411/TECTONIC/assets/166725219/54429c6e-4fed-42f6-a928-fad5de534ece)

2.1. Pick to choose OS.
- You can choose, so many OS, but i did choose an OS Lite in Raspberry Pi OS(other) without desktop envriroment(GNU - GNOME), more lightweight and our purpose is only 
control GPIO, not to display hdmi to screen. You can choose RaspDebian 64 without OS. In Storage, remember to choose your SD card, not other.


![Screenshot from 2024-05-31 13-48-48](https://github.com/angerpro1411/TECTONIC/assets/166725219/ada67c87-951e-4e82-a76d-4206bac72a9a)

2.2. Setting OS:
- Click to setting OS in the right-down corner before click "Write" to setting OS.
- ![Screenshot from 2024-06-01 12-18-57](https://github.com/angerpro1411/TECTONIC/assets/166725219/2b5f6ee4-d309-4e40-8010-44167e3b099c)

- Don't forget to take a photo or write-back your setting because you will need it to connect with PC/Laptop.
- Set hostname.
- Enable SSH (to connect Ethernet with PC/Laptop)
- Set username/password.
- Configure wireless LAN.
- Set local time.
- -> Save
- Then click Write and wait the OS done in your SD card.
- After finsihed, put your SD card to Raspberry Pi.

2.3. Connect Pi and PC/Laptop through Ethernet Port.
- In your OS(Ubuntu/Linux) go to Setting/Network.
- ![image](https://github.com/angerpro1411/TECTONIC/assets/166725219/64b23ccd-64fc-4c14-9950-896b9bbe6a18)
- Change only the name of new profil - NOT others
- Click to tab IPv4 then change IPv4 method to "Shared to other computers" -> ADD
- Now when you connect your PC/Laptop and Pi through Ethernet cable, you will see Wired/Pi connected/On
2.4. Connect and Control Pi through SSH.
- Time to use your username and hostname that you used to set-up for RaspBerry Pi
```
ssh username@hostname.local
```
- First time connect, it will ask the security, just type "yes".
- Then it asks the pi's password.
Tara you succeed to connect with Pi.

3. Control GPIO of PI
- Tons of tutorials to control PI u can check in Youtube but basically, all GPIO is inside folder /sys/class/gpio/
- For example, you want to control GPIO1 :
```
cd /sys/class/gpio
echo 1 > export
ls
```
- You will see gpio1 now export as a file inside folder.
```
echo out/in > gpio1/direction #choose direction for GPIO1
echo 1 > gpio1/value #make output is high
echo 0 > gpio1/value #make output is low
```
- That is basic control for PI GPIO.

4.GPIO Raspberry Pi hardware
- GPIO and the 40-pin header
![image](https://github.com/angerpro1411/TECTONIC/assets/166725219/fca7d860-8ef7-4212-b2bf-42014924a250)



A powerful feature of the Raspberry Pi is the row of GPIO (general-purpose input/output) pins along the top edge of the board. A 40-pin GPIO header is found on all current Raspberry Pi boards, although it is unpopulated on Raspberry Pi Zero, Raspberry Pi Zero W, and Raspberry Pi Zero 2 W. The GPIO headers on all boards have a 0.1in (2.54mm) pin pitch.
- GPIO pins

Any of the GPIO pins can be designated in software as an input or output pin and used for a wide range of purposes.
GPIO layout
Note
	The GPIO pin numbering scheme is not in numerical order. GPIO pins 0 and 1 are present on the board (physical pins 27 and 28), but are reserved for advanced use.
- Voltages

Two 5V pins and two 3.3V pins are present on the board, as well as a number of ground pins (GND), which can not be reconfigured. The remaining pins are all general-purpose 3.3V pins, meaning outputs are set to 3.3V and inputs are 3.3V-tolerant.
- Outputs

A GPIO pin designated as an output pin can be set to high (3.3V) or low (0V).
- Inputs

A GPIO pin designated as an input pin can be read as high (3.3V) or low (0V). This is made easier with the use of internal pull-up or pull-down resistors. Pins GPIO2 and GPIO3 have fixed pull-up resistors, but for other pins this can be configured in software.
Other GPIO functions

As well as simple input and output devices, the GPIO pins can be used with a variety of alternative functions. Some functions are available on all pins, others on specific pins:

    PWM (pulse-width modulation)

        Software PWM available on all pins

        Hardware PWM available on GPIO12, GPIO13, GPIO18, GPIO19

    SPI

        SPI0: MOSI (GPIO10); MISO (GPIO9); SCLK (GPIO11); CE0 (GPIO8), CE1 (GPIO7)

        SPI1: MOSI (GPIO20); MISO (GPIO19); SCLK (GPIO21); CE0 (GPIO18); CE1 (GPIO17); CE2 (GPIO16)

    I2C

        Data: (GPIO2); Clock (GPIO3)

        EEPROM Data: (GPIO0); EEPROM Clock (GPIO1)

    Serial

        TX (GPIO14); RX (GPIO15)

