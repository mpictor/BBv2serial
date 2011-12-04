#!/bin/sh

read -p "Press any key when ready to re-configure with BBv2-JTAGkey-v1.3.svf (or CTRL-C to cancel)"
echo "Loading previous USB config data to EEPROM..."
#this loads the file named in the cfg
ftdi_eeprom --flash-eeprom bbv2.conf || echo "********* ftdi_eeprom failed! *********"; exit
echo "Config EEPROM loaded from 2232eeprom.out"
echo
echo "Unplug your Bus Blaster, then plug it back in."

echo -n "Removing modules ftdi_sio and usbserial..."
sudo rmmod ftdi_sio usbserial 2>&1|grep -ve does\ not\ exist -e not\ currently\ loaded
echo "done."

jtag -nq write_jtag.ur || echo "********* urjtag failed! *********"; exit

echo "********* Success! *********"