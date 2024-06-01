1. Reference:
- Connect raspberry pi 3 B+ with Ubuntu using wifi/ethernet - 2022 : https://www.youtube.com/watch?v=YXA66QXrH1c
- HOW TO control the GPIO Pins: https://www.youtube.com/watch?v=0zaawzBxGcY
- Full tutorial control PI - Embedded : https://www.youtube.com/watch?v=1WDagiA8fdU&list=PLGs0VKk2DiYxdMjCJmcP6jt4Yw6OHK85O
2. In this project :
I used Raspberry 4 model B to add the OS inside, you can choose whatever you want but recommended with reduce time to stay with choosing OS
we can choose the avaible in rpi-imager by install the rpi-imager package in Ubuntu.
Attention! Don't forget to attach your SD card in to your PC/laptop.
> sudo apt-get install rpi-imager
> rpi-imager

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
- Set local time
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
> ssh username@hostname.local
- First time connect, it will ask the security, just type "yes".
- Then it asks the pi's password.
Tara you succeed to connect with Pi.

3. Control GPIO of PI
- Tons of tutorials to control PI u can check in Youtube but basically, all GPIO is inside folder /sys/class/gpio/
- For example, you want to control GPIO1 :
> cd /sys/class/gpio
> echo 1 > export
> ls
- You will see gpio1 now export as a file inside folder.
- > echo out/in > gpio1/direction #choose direction for GPIO1
- > echo 1 > gpio1/value #make output is high
- > echo 0 > gpio1/value #make output is low

- That is basic control for PI GPIO.
