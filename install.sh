#!/bin/bash
sudo apt-get install espeak
sudo cp ./add-remainder-gui.sh /usr/bin/add-remainder-gui.sh
sudo chmod 777 /usr/bin/add-remainder-gui.sh
sudo cp ./timer.sh /usr/bin/timer.sh
sudo chmod 777 /usr/bin/timer.sh
sudo cp ./remainder.sh /usr/bin/remainder.sh
sudo chmod 777 /usr/bin/remainder.sh
sudo mkdir /tmp/.remainder/
sudo chmod 777 /tmp/.remainder/
sudo cp ./timer_remainder.sh /usr/bin/timer_remainder.sh
sudo chmod 777 /usr/bin/timer_remainder.sh

#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "* * * * * eval "export $(egrep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u $LOGNAME gnome-session)/environ)" && timer_remainder.sh
" >> mycron
#install new cron file
crontab mycron
rm mycron
