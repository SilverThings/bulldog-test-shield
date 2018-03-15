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
	4950 2650 5550 2650
Wire Wire Line
	4950 2750 5450 2750
Wire Wire Line
	4950 2550 5650 2550
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
L +3V3 #PWR01
U 1 1 5A97F0C6
P 2700 1950
F 0 "#PWR01" H 2700 1800 50  0001 C CNN
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
L GNDD #PWR02
U 1 1 5A97F13B
P 2700 5000
F 0 "#PWR02" H 2700 4750 50  0001 C CNN
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
P 7150 3400
F 0 "J2" H 7200 4400 50  0000 C CNN
F 1 "Raspiheader" H 7200 2300 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x20_Pitch2.54mm" H 7150 3400 50  0001 C CNN
F 3 "" H 7150 3400 50  0001 C CNN
	1    7150 3400
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR03
U 1 1 5A97F8F8
P 6500 2000
F 0 "#PWR03" H 6500 1850 50  0001 C CNN
F 1 "+3V3" H 6500 2140 50  0000 C CNN
F 2 "" H 6500 2000 50  0001 C CNN
F 3 "" H 6500 2000 50  0001 C CNN
	1    6500 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 3100 8450 3550
$Comp
L GNDD #PWR04
U 1 1 5A97F9CB
P 8450 3550
F 0 "#PWR04" H 8450 3300 50  0001 C CNN
F 1 "GNDD" H 8450 3425 50  0000 C CNN
F 2 "" H 8450 3550 50  0001 C CNN
F 3 "" H 8450 3550 50  0001 C CNN
	1    8450 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 3500 6000 3500
Wire Wire Line
	6000 3500 6000 2600
Wire Wire Line
	6000 2600 6950 2600
Wire Wire Line
	4950 3600 6100 3600
Wire Wire Line
	6100 3600 6100 2700
Wire Wire Line
	6100 2700 6950 2700
Wire Wire Line
	4950 3700 6500 3700
Wire Wire Line
	6500 3700 6500 4700
Wire Wire Line
	6950 3600 6200 3600
Wire Wire Line
	6200 3600 6200 3050
Wire Wire Line
	6200 3050 5450 3050
Wire Wire Line
	5450 3050 5450 2750
Wire Wire Line
	5550 2650 5550 2950
Wire Wire Line
	5550 2950 6300 2950
Wire Wire Line
	6300 2950 6300 3500
Wire Wire Line
	6300 3500 6950 3500
Wire Wire Line
	5650 2550 5650 2850
Wire Wire Line
	5650 2850 6400 2850
Wire Wire Line
	6400 2850 6400 3400
Wire Wire Line
	6400 3400 6950 3400
Wire Wire Line
	6950 3300 6500 3300
Wire Wire Line
	6500 3300 6500 2000
Wire Wire Line
	6950 3000 6600 3000
Wire Wire Line
	6600 3000 6600 3200
Wire Wire Line
	6600 3200 5450 3200
Wire Wire Line
	5450 3200 5450 3400
Wire Wire Line
	5450 3400 4950 3400
Wire Wire Line
	4950 3850 6400 3850
Wire Wire Line
	6400 3850 6400 4800
Wire Wire Line
	6400 4800 7900 4800
Wire Wire Line
	4950 3950 6300 3950
Wire Wire Line
	6300 3950 6300 4900
Wire Wire Line
	6300 4900 8000 4900
Wire Wire Line
	6500 4700 7800 4700
Wire Wire Line
	7800 4700 7800 3700
Wire Wire Line
	7800 3700 7450 3700
Wire Wire Line
	4950 2450 6200 2450
Wire Wire Line
	6200 2450 6200 2150
Wire Wire Line
	6200 2150 8100 2150
Wire Wire Line
	8100 2150 8100 3600
Wire Wire Line
	8100 3600 7450 3600
Wire Wire Line
	7900 4800 7900 2800
Wire Wire Line
	7900 2800 7450 2800
Wire Wire Line
	8000 4900 8000 2900
Wire Wire Line
	8000 2900 7450 2900
Wire Wire Line
	7450 3100 8450 3100
Wire Wire Line
	7450 4000 7700 4000
Wire Wire Line
	7700 4000 7700 4600
Wire Wire Line
	7700 4600 6600 4600
Wire Wire Line
	6600 4600 6600 4150
Wire Wire Line
	6600 4150 4950 4150
Wire Wire Line
	6950 3700 6750 3700
Wire Wire Line
	6750 2900 6750 3900
$Comp
L GNDD #PWR05
U 1 1 5AAA769E
P 6750 3900
F 0 "#PWR05" H 6750 3650 50  0001 C CNN
F 1 "GNDD" H 6750 3775 50  0000 C CNN
F 2 "" H 6750 3900 50  0001 C CNN
F 3 "" H 6750 3900 50  0001 C CNN
	1    6750 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 4100 8300 4100
Wire Wire Line
	8300 4100 8300 3100
Connection ~ 8300 3100
Wire Wire Line
	7450 3900 8200 3900
Wire Wire Line
	8200 3900 8200 3100
Connection ~ 8200 3100
Wire Wire Line
	7450 3400 7550 3400
Wire Wire Line
	7550 3400 7550 3100
Connection ~ 7550 3100
Wire Wire Line
	7450 2700 7650 2700
Wire Wire Line
	7650 2700 7650 3100
Connection ~ 7650 3100
Wire Wire Line
	6950 4400 6900 4400
Wire Wire Line
	6900 4400 6900 3700
Connection ~ 6900 3700
Wire Wire Line
	6950 2900 6750 2900
Connection ~ 6750 3700
$EndSCHEMATC
