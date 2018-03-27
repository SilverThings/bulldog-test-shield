EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:FT232RL
LIBS:kicad1-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L FT232RL IC1
U 1 1 5A8400E6
P 5700 3700
F 0 "IC1" H 5199 2824 50  0000 L BNN
F 1 "FT232RL" H 5700 3700 50  0001 L BNN
F 2 "FT232RL:SSOP28-LD" H 5700 3700 50  0001 L BNN
F 3 "6.96 USD" H 5700 3700 50  0001 L BNN
F 4 "FT232RL" H 5700 3700 50  0001 L BNN "Field4"
F 5 "USB-to-UART 1-CH 256Byte FIFO 5V 28-Pin SSOP" H 5700 3700 50  0001 L BNN "Field5"
F 6 "Good" H 5700 3700 50  0001 L BNN "Field6"
F 7 "None" H 5700 3700 50  0001 L BNN "Field7"
F 8 "FTDI" H 5700 3700 50  0001 L BNN "Field8"
	1    5700 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3000 5100 3000
Wire Wire Line
	3500 2900 5100 2900
Wire Wire Line
	5100 2900 5100 3100
Wire Wire Line
	3200 3300 3200 3800
$Comp
L Earth #PWR1
U 1 1 5A8403AA
P 3200 3800
F 0 "#PWR1" H 3200 3550 50  0001 C CNN
F 1 "Earth" H 3200 3650 50  0001 C CNN
F 2 "" H 3200 3800 50  0001 C CNN
F 3 "" H 3200 3800 50  0001 C CNN
	1    3200 3800
	1    0    0    -1  
$EndComp
$Comp
L Polyfuse 500mA1
U 1 1 5A8404D2
P 3650 2700
F 0 "500mA1" V 3550 2700 50  0000 C CNN
F 1 "Polyfuse" V 3750 2700 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_0805to1206_RM10_HandSoldering" H 3700 2500 50  0001 L CNN
F 3 "" H 3650 2700 50  0001 C CNN
	1    3650 2700
	0    -1   -1   0   
$EndComp
$Comp
L USB_A J1
U 1 1 5A8406CE
P 3200 2900
F 0 "J1" H 3000 3350 50  0000 L CNN
F 1 "USB_A" H 3000 3250 50  0000 L CNN
F 2 "Connectors:USB_Micro-B" H 3350 2850 50  0001 C CNN
F 3 "" H 3350 2850 50  0001 C CNN
	1    3200 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 4000 5000 4000
Wire Wire Line
	5000 4000 5000 4600
Wire Wire Line
	5100 4400 5000 4400
Connection ~ 5000 4400
Wire Wire Line
	5100 4300 5000 4300
Connection ~ 5000 4300
Wire Wire Line
	5100 4200 5000 4200
Connection ~ 5000 4200
Wire Wire Line
	5100 4100 5000 4100
Connection ~ 5000 4100
$Comp
L Earth #PWR5
U 1 1 5A8409E3
P 5000 4600
F 0 "#PWR5" H 5000 4350 50  0001 C CNN
F 1 "Earth" H 5000 4450 50  0001 C CNN
F 2 "" H 5000 4600 50  0001 C CNN
F 3 "" H 5000 4600 50  0001 C CNN
	1    5000 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 3500 5100 3500
Wire Wire Line
	4750 2600 4750 3600
Wire Wire Line
	5100 3400 4750 3400
Connection ~ 4750 3400
Connection ~ 4750 3500
$Comp
L C_Small C1
U 1 1 5A841482
P 4750 3700
F 0 "C1" H 4760 3770 50  0000 L CNN
F 1 "0.1uF" H 4760 3620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0201" H 4750 3700 50  0001 C CNN
F 3 "" H 4750 3700 50  0001 C CNN
	1    4750 3700
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR4
U 1 1 5A84163F
P 4750 3800
F 0 "#PWR4" H 4750 3550 50  0001 C CNN
F 1 "Earth" H 4750 3650 50  0001 C CNN
F 2 "" H 4750 3800 50  0001 C CNN
F 3 "" H 4750 3800 50  0001 C CNN
	1    4750 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 2700 5000 2700
Wire Wire Line
	5000 2700 5000 3300
Wire Wire Line
	5000 3300 5100 3300
Wire Wire Line
	4350 2700 4350 3600
Connection ~ 4350 2700
Wire Wire Line
	4000 2700 4000 3600
Connection ~ 4000 2700
$Comp
L C_Small C2
U 1 1 5A8417A4
P 4000 3700
F 0 "C2" H 4010 3770 50  0000 L CNN
F 1 "0.1uF" H 4010 3620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0201" H 4000 3700 50  0001 C CNN
F 3 "" H 4000 3700 50  0001 C CNN
	1    4000 3700
	1    0    0    -1  
$EndComp
$Comp
L CP1_Small C5
U 1 1 5A8417DF
P 4350 3700
F 0 "C5" H 4360 3770 50  0000 L CNN
F 1 "10uF" H 4360 3620 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_3x5.3" H 4350 3700 50  0001 C CNN
F 3 "" H 4350 3700 50  0001 C CNN
	1    4350 3700
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR2
U 1 1 5A841806
P 4000 3800
F 0 "#PWR2" H 4000 3550 50  0001 C CNN
F 1 "Earth" H 4000 3650 50  0001 C CNN
F 2 "" H 4000 3800 50  0001 C CNN
F 3 "" H 4000 3800 50  0001 C CNN
	1    4000 3800
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR3
U 1 1 5A841826
P 4350 3800
F 0 "#PWR3" H 4350 3550 50  0001 C CNN
F 1 "Earth" H 4350 3650 50  0001 C CNN
F 2 "" H 4350 3800 50  0001 C CNN
F 3 "" H 4350 3800 50  0001 C CNN
	1    4350 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 3000 6850 3000
Wire Wire Line
	6300 3100 6950 3100
Wire Wire Line
	6300 3300 6650 3300
Wire Wire Line
	6300 3500 7050 3500
Wire Wire Line
	7050 3500 7050 2300
Wire Wire Line
	6950 3100 6950 2300
Wire Wire Line
	6850 3000 6850 2300
Wire Wire Line
	4750 2600 6750 2600
Wire Wire Line
	6750 2600 6750 2300
Wire Wire Line
	6650 3300 6650 2300
Wire Wire Line
	6550 2300 6550 2750
$Comp
L Earth #PWR6
U 1 1 5A841BAF
P 6550 2750
F 0 "#PWR6" H 6550 2500 50  0001 C CNN
F 1 "Earth" H 6550 2600 50  0001 C CNN
F 2 "" H 6550 2750 50  0001 C CNN
F 3 "" H 6550 2750 50  0001 C CNN
	1    6550 2750
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x06_Male J2
U 1 1 5A843BC3
P 6850 2100
F 0 "J2" V 6850 2400 50  0000 C CNN
F 1 "Conn_01x06_Male" H 6850 1700 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x06_Pitch2.54mm" H 6850 2100 50  0001 C CNN
F 3 "" H 6850 2100 50  0001 C CNN
	1    6850 2100
	0    1    1    0   
$EndComp
$EndSCHEMATC
