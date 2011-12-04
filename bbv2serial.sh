#!/bin/sh

# Configure bus blaster for serial comms on JP2

echo -n "Removing modules ftdi_sio and usbserial..."
sudo rmmod ftdi_sio usbserial 2>&1|grep -ve does\ not\ exist -e not\ currently\ loaded
echo "done."
echo
echo "Requires urjtag and ftdi_eeprom."
echo
echo "WARNING: this will ERASE your Bus Blaster V2 CPLD. Only continue if you have an .svf file to restore it to JTAG functionality!"
echo
read -p "Press Ctrl-C to cancel"

jtag -nq write_serial.ur || echo "********* urjtag failed! *********"; exit

echo "If you get errors in the next step, edit bbv2.conf to contain the correct data. See ftdi_eeprom man page for info."
echo "Saving old USB config EEPROM..."
#this writes to the file named in the cfg
ftdi_eeprom --erase-eeprom bbv2.conf || echo "********* ftdi_eeprom failed! *********"; exit
echo "Config EEPROM contents saved to 2232eeprom.out"
echo
echo "********* Success! *********"
echo "Unplug your Bus Blaster, then plug it back in."
