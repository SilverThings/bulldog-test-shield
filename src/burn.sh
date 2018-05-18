#!/bin/sh
#script for programming hex file to atmega328p through ISP
#requires avrdude
#you can change the pins at the end of avrdudegpio.conf

#TODO add errror checking

#script directory
mydir="${0%/*}"

#set fuses
#TODO check fuses and set only when needed
sudo avrdude -p atmega328p -C "${mydir}"/avrdudegpio.conf -c pi_1 -U lfuse:w:0xe2:m -U hfuse:w:0xd9:m -U efuse:w:0xff:m

#burn hexfile
sudo avrdude -p atmega328p -C "${mydir}"/avrdudegpio.conf -c pi_1 -v -U flash:w:"${mydir}"/build-pro328/src.hex:i
