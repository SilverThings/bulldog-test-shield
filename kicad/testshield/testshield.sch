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
LIBS:testshield-cache
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
L ATMEGA328P-PU U1
U 1 1 5A97DCFD
P 3950 3350
F 0 "U1" H 3200 4600 50  0000 L BNN
F 1 "ATMEGA328P-PU" H 4350 1950 50  0000 L BNN
F 2 "ATMEGA328P-AU:QFP80P900X900X120-32N" H 3950 3350 50  0001 C CIN
F 3 "" H 3950 3350 50  0001 C CNN
	1    3950 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 3700 5500 3700
$Comp
L SW_Push SW1
U 1 1 5A97E0CF
P 5700 3700
F 0 "SW1" H 5750 3800 50  0000 L CNN
F 1 "SW_Push" H 5700 3640 50  0000 C CNN
F 2 "Buttons_Switches_SMD:SW_SPST_B3S-1000" H 5700 3900 50  0001 C CNN
F 3 "" H 5700 3900 50  0001 C CNN
	1    5700 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 3700 6700 3700
Wire Wire Line
	6700 3700 6700 3850
$Comp
L GNDD #PWR01
U 1 1 5A97E11B
P 6700 3850
F 0 "#PWR01" H 6700 3600 50  0001 C CNN
F 1 "GNDD" H 6700 3725 50  0000 C CNN
F 2 "" H 6700 3850 50  0001 C CNN
F 3 "" H 6700 3850 50  0001 C CNN
	1    6700 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 3400 6050 3700
Connection ~ 6050 3700
$Comp
L R R1
U 1 1 5A97E166
P 6050 3250
F 0 "R1" V 6130 3250 50  0000 C CNN
F 1 "10k" V 6050 3250 50  0000 C CNN
F 2 "Resistors_SMD:R_2010" V 5980 3250 50  0001 C CNN
F 3 "" H 6050 3250 50  0001 C CNN
	1    6050 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 2600 6050 3100
$Comp
L Conn_02x03_Odd_Even J1
U 1 1 5A97EBC4
P 6750 2050
F 0 "J1" H 6800 2250 50  0000 C CNN
F 1 "ISP header" H 6800 1850 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03_Pitch2.54mm" H 6750 2050 50  0001 C CNN
F 3 "" H 6750 2050 50  0001 C CNN
	1    6750 2050
	1    0    0    -1  
$EndComp
Connection ~ 6050 3000
Wire Wire Line
	4950 2650 5350 2650
Wire Wire Line
	5350 2650 5350 1950
Wire Wire Line
	5350 1950 6550 1950
Wire Wire Line
	4950 2750 5450 2750
Wire Wire Line
	5450 2750 5450 2050
Wire Wire Line
	5450 2050 6550 2050
Wire Wire Line
	6050 3500 6300 3500
Wire Wire Line
	6300 3500 6300 2150
Wire Wire Line
	6300 2150 6550 2150
Connection ~ 6050 3500
$Comp
L +3V3 #PWR02
U 1 1 5A97EE7F
P 6050 2600
F 0 "#PWR02" H 6050 2450 50  0001 C CNN
F 1 "+3V3" H 6050 2740 50  0000 C CNN
F 2 "" H 6050 2600 50  0001 C CNN
F 3 "" H 6050 2600 50  0001 C CNN
	1    6050 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 2550 5250 2550
Wire Wire Line
	5250 2550 5250 1650
Wire Wire Line
	5250 1650 7400 1650
Wire Wire Line
	7400 1650 7400 2050
Wire Wire Line
	7400 2050 7050 2050
Wire Wire Line
	7050 1950 7550 1950
Wire Wire Line
	7550 1950 7550 3000
Wire Wire Line
	7550 3000 6050 3000
Wire Wire Line
	7050 2150 7400 2150
Wire Wire Line
	7400 2150 7400 2550
$Comp
L GNDD #PWR03
U 1 1 5A97EF0D
P 7400 2550
F 0 "#PWR03" H 7400 2300 50  0001 C CNN
F 1 "GNDD" H 7400 2425 50  0000 C CNN
F 2 "" H 7400 2550 50  0001 C CNN
F 3 "" H 7400 2550 50  0001 C CNN
	1    7400 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 2850 3050 2850
Wire Wire Line
	2700 1950 2700 3500
Wire Wire Line
	2700 2550 3050 2550
Wire Wire Line
	2700 2250 3050 2250
Connection ~ 2700 2550
Connection ~ 2700 2250
$Comp
L +3V3 #PWR04
U 1 1 5A97F0C6
P 2700 1950
F 0 "#PWR04" H 2700 1800 50  0001 C CNN
F 1 "+3V3" H 2700 2090 50  0000 C CNN
F 2 "" H 2700 1950 50  0001 C CNN
F 3 "" H 2700 1950 50  0001 C CNN
	1    2700 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 4450 2700 4450
Wire Wire Line
	2700 3800 2700 5000
Wire Wire Line
	3050 4550 2700 4550
Connection ~ 2700 4550
$Comp
L GNDD #PWR05
U 1 1 5A97F13B
P 2700 5000
F 0 "#PWR05" H 2700 4750 50  0001 C CNN
F 1 "GNDD" H 2700 4875 50  0000 C CNN
F 2 "" H 2700 5000 50  0001 C CNN
F 3 "" H 2700 5000 50  0001 C CNN
	1    2700 5000
	1    0    0    -1  
$EndComp
Connection ~ 2700 2850
$Comp
L CP1 C1
U 1 1 5A97F20D
P 2700 3650
F 0 "C1" H 2725 3750 50  0000 L CNN
F 1 "0.1u" H 2725 3550 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_3x5.3" H 2700 3650 50  0001 C CNN
F 3 "" H 2700 3650 50  0001 C CNN
	1    2700 3650
	1    0    0    -1  
$EndComp
Connection ~ 2700 4450
$Comp
L Conn_02x20_Odd_Even J2
U 1 1 5A97F783
P 6000 5550
F 0 "J2" H 6050 6550 50  0000 C CNN
F 1 "Raspiheader" H 6050 4450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x20_Pitch2.54mm" H 6000 5550 50  0001 C CNN
F 3 "" H 6000 5550 50  0001 C CNN
	1    6000 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 4450 5800 4650
$Comp
L +3V3 #PWR06
U 1 1 5A97F8F8
P 5800 4450
F 0 "#PWR06" H 5800 4300 50  0001 C CNN
F 1 "+3V3" H 5800 4590 50  0000 C CNN
F 2 "" H 5800 4450 50  0001 C CNN
F 3 "" H 5800 4450 50  0001 C CNN
	1    5800 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 4750 5500 4750
Wire Wire Line
	5500 4750 5500 3500
Wire Wire Line
	5500 3500 4950 3500
Wire Wire Line
	4950 3600 5400 3600
Wire Wire Line
	5400 3600 5400 4850
Wire Wire Line
	5400 4850 5800 4850
Wire Wire Line
	6300 4850 6700 4850
Wire Wire Line
	6700 4850 6700 5000
$Comp
L GNDD #PWR07
U 1 1 5A97F9CB
P 6700 5000
F 0 "#PWR07" H 6700 4750 50  0001 C CNN
F 1 "GNDD" H 6700 4875 50  0000 C CNN
F 2 "" H 6700 5000 50  0001 C CNN
F 3 "" H 6700 5000 50  0001 C CNN
	1    6700 5000
	1    0    0    -1  
$EndComp
$EndSCHEMATC
