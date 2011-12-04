BBv2Serial - use your Bus Blaster V2 as a USB to 3.3V (or less!) serial adapter

## Purpose
BBv2Serial allows you to reconfigure a [Bus Blaster V2](http://dangerousprototypes.com/docs/Bus_Blaster_v2_design_overview) for serial, and easily change it back to the default configuration (BBv2-JTAGkey-v1.3.svf).

## Pins
The serial signals are configured for JP2 - `IO9` is **TX**, `IO10` is **RX**. While this configuration requires that you solder a header to the board, it reduces the chance of sending serial signals to a JTAG port or vice versa.

## Requirements
* A recent version of `Urjtag` (some older versions don't support the FT2232H fully)
* The `ftdi_eeprom` utility

## Using
Both scripts remove modules ftdi_sio and usbserial; both depend upon urjtag and ftdi_eeprom.

### bbv2serial.sh
This erases the FTDI config EEPROM and configures the CPLD with bbv2serial.svf, which was created from the *.vhd and *.ucf files.

### bbv2jtag.sh
Programs the FTDI config EEPROM and configures the CPLD with bbv2jtag.svf.

## Caveats
This has only been tested with 3.3V. According to the schematic, the pins I use are part of Bank 2, the same bank as the JTAG port. This means that the voltage jumper (JP4) affects them. If it is open, Bank 2 can be powered from an external source between 1.2 and 3.3V. Note that you must use the VTG pin on the JTAG header to supply this voltage - JP2 pin 1 remains powered at 3.3 volts!

If you wish to make changes to the logic (bbv2serial.vhd) or pinout (bbv2serial.ucf) file, you will need a compatible version of Xilinx ISE.

## License
BSD
