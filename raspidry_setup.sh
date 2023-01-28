#!/bin/bash
#
# RasPiDry Setup Script
# 
# type the following commands:
# chmod +x raspidry_setup.sh
# sudo ./raspidry_setup.sh
# sudo reboot
#

while true; do
    read -p "Do you wish to run apt-get update & apt-get upgrade?" yn
    case $yn in
        [Yy]* ) apt-get -y update; apt-get -y upgrade; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

#Install pip (package installer):
apt-get -y install python-setuptools
easy_install pip

#Install PySerial
pip install pyserial

#Install Python i2c and smbus
apt-get -y install python-smbus

#Install Flask
apt-get -y install python-dev
apt-get -y install libpcre3-dev
pip install Flask

while true; do
    read -p "Do you wish to automatically boot RasPiDry?" yn
    case $yn in
        [Yy]* ) cp ./dryonboot /etc/init.d;
		chmod 755 /etc/init.d/dryonboot;
		update-rc.d dryonboot defaults;
		break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

while true; do
    read -p "Reboot to complete installation?" yn
    case $yn in
        [Yy]* ) reboot; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done


