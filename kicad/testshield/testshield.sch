EESchema Schematic File Version 2
LIBS:testshield-rescue
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
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
L Conn_02x03_Odd_Even J1
U 1 1 5AABCDCB
P 5750 1450
F 0 "J1" H 5800 1650 50  0000 C CNN
F 1 "ISP/PDI" H 5800 1250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03_Pitch2.54mm" H 5750 1450 50  0001 C CNN
F 3 "" H 5750 1450 50  0001 C CNN
	1    5750 1450
	1    0    0    -1  
$EndComp
$Comp
L SW_Push SW1
U 1 1 5AABD4EC
P 7050 5600
F 0 "SW1" H 7100 5700 50  0000 L CNN
F 1 "Reset" H 7050 5540 50  0000 C CNN
F 2 "Buttons_Switches_SMD:SW_SPST_B3U-1000P" H 7050 5800 50  0001 C CNN
F 3 "" H 7050 5800 50  0001 C CNN
	1    7050 5600
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5AABD690
P 7550 5600
F 0 "R2" V 7630 5600 50  0000 C CNN
F 1 "330" V 7550 5600 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 7480 5600 50  0001 C CNN
F 3 "" H 7550 5600 50  0001 C CNN
	1    7550 5600
	0    1    1    0   
$EndComp
$Comp
L LED-RESCUE-testshield D1
U 1 1 5AB25771
P 2200 3650
F 0 "D1" H 2200 3750 50  0000 C CNN
F 1 "LED1" H 2200 3550 50  0000 C CNN
F 2 "LEDs:LED_0603" H 2200 3650 50  0001 C CNN
F 3 "" H 2200 3650 50  0001 C CNN
	1    2200 3650
	0    -1   -1   0   
$EndComp
$Comp
L R R1
U 1 1 5AB2586A
P 2200 3000
F 0 "R1" V 2280 3000 50  0000 C CNN
F 1 "1k" V 2200 3000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 2130 3000 50  0001 C CNN
F 3 "" H 2200 3000 50  0001 C CNN
	1    2200 3000
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5AB25DAD
P 6700 5450
F 0 "R4" V 6780 5450 50  0000 C CNN
F 1 "10k" V 6700 5450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 6630 5450 50  0001 C CNN
F 3 "" H 6700 5450 50  0001 C CNN
	1    6700 5450
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5AB261E6
P 4950 5600
F 0 "R3" V 5030 5600 50  0000 C CNN
F 1 "330" V 4950 5600 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 4880 5600 50  0001 C CNN
F 3 "" H 4950 5600 50  0001 C CNN
	1    4950 5600
	0    -1   -1   0   
$EndComp
$Comp
L LED-RESCUE-testshield D2
U 1 1 5AB262A6
P 5400 5600
F 0 "D2" H 5400 5700 50  0000 C CNN
F 1 "LED2" H 5400 5500 50  0000 C CNN
F 2 "LEDs:LED_0603" H 5400 5600 50  0001 C CNN
F 3 "" H 5400 5600 50  0001 C CNN
	1    5400 5600
	-1   0    0    1   
$EndComp
Text Label 5300 3500 2    60   ~ 0
SDA
Text Label 5300 3600 2    60   ~ 0
SCL
Text Label 6750 2700 0    60   ~ 0
SCL
Text Label 6750 2600 0    60   ~ 0
SDA
Text Label 6750 2500 0    60   ~ 0
3V3
Text Label 6750 2900 0    60   ~ 0
GND
Text Label 7650 2700 2    60   ~ 0
GND
Text Label 7650 3100 2    60   ~ 0
GND
Text Label 7650 3400 2    60   ~ 0
GND
Wire Wire Line
	2700 2850 3050 2850
Wire Wire Line
	2700 1950 2700 3500
Wire Wire Line
	2700 2550 3050 2550
Wire Wire Line
	2200 2250 3050 2250
Connection ~ 2700 2550
Connection ~ 2700 2250
Wire Wire Line
	3050 4450 2700 4450
Wire Wire Line
	2700 3800 2700 5000
Wire Wire Line
	2200 4550 3050 4550
Connection ~ 2700 4550
Connection ~ 2700 2850
Connection ~ 2700 4450
Wire Wire Line
	6950 3000 6650 3000
Wire Wire Line
	5300 3400 4950 3400
Wire Wire Line
	7700 5600 7950 5600
Wire Wire Line
	7400 5600 7250 5600
Wire Wire Line
	2200 3500 2200 3150
Wire Wire Line
	2200 2850 2200 2250
Wire Wire Line
	2200 3800 2200 4550
Wire Wire Line
	5100 5600 5250 5600
Wire Wire Line
	4950 3500 5300 3500
Wire Wire Line
	4950 3600 5300 3600
Wire Wire Line
	6950 2600 6750 2600
Wire Wire Line
	6950 2700 6750 2700
Wire Wire Line
	6950 2900 6750 2900
Wire Wire Line
	7450 2700 7650 2700
Wire Wire Line
	7450 3100 7650 3100
Wire Wire Line
	7450 3400 7650 3400
Wire Wire Line
	6950 2500 6750 2500
Wire Wire Line
	7450 3900 7650 3900
Wire Wire Line
	7450 4100 7650 4100
Text Label 7650 3900 2    60   ~ 0
GND
Text Label 7650 4100 2    60   ~ 0
GND
Wire Wire Line
	6950 3700 6750 3700
Wire Wire Line
	6950 4400 6750 4400
Text Label 6750 3700 0    60   ~ 0
GND
Text Label 6750 4400 0    60   ~ 0
GND
Wire Wire Line
	5550 1350 5350 1350
Text Label 5350 1350 0    60   ~ 0
MISO
Text Label 5350 1450 0    60   ~ 0
SCK
Wire Wire Line
	5550 1450 5350 1450
Wire Wire Line
	5550 1550 5350 1550
Text Label 5350 1550 0    60   ~ 0
RST
Wire Wire Line
	6050 1350 6300 1350
Wire Wire Line
	6050 1450 6300 1450
Wire Wire Line
	6050 1550 6300 1550
Text Label 6300 1350 2    60   ~ 0
3V3
Text Label 6300 1450 2    60   ~ 0
MOSI
Text Label 6300 1550 2    60   ~ 0
GND
Wire Wire Line
	6950 3300 6750 3300
Text Label 6750 3300 0    60   ~ 0
3V3
Text Label 7650 3600 2    60   ~ 0
SS
Wire Wire Line
	7650 3600 7450 3600
Text Label 5300 2450 2    60   ~ 0
SS
Wire Wire Line
	5300 2450 4950 2450
Wire Wire Line
	6700 5050 6700 5300
Wire Wire Line
	6250 5600 6850 5600
Connection ~ 6700 5600
Text Label 6250 5600 0    60   ~ 0
RST
Text Label 5300 3700 2    60   ~ 0
RST
Text Label 7650 3700 2    60   ~ 0
RST
Wire Wire Line
	7650 3700 7450 3700
Wire Wire Line
	5300 3700 4950 3700
Wire Wire Line
	4950 2750 5300 2750
Text Label 5300 2750 2    60   ~ 0
SCK
Wire Wire Line
	4800 5600 4550 5600
Text Label 4550 5600 0    60   ~ 0
SCK
Wire Wire Line
	6950 3600 6750 3600
Text Label 6750 3600 0    60   ~ 0
SCK
Text Label 5300 2550 2    60   ~ 0
MOSI
Text Label 5300 2650 2    60   ~ 0
MISO
Wire Wire Line
	4950 2650 5300 2650
Wire Wire Line
	5300 2550 4950 2550
Wire Wire Line
	6950 3400 6750 3400
Wire Wire Line
	6950 3500 6750 3500
Text Label 6750 3400 0    60   ~ 0
MOSI
Text Label 6750 3500 0    60   ~ 0
MISO
Text Label 7650 2800 2    60   ~ 0
TX
Text Label 7650 2900 2    60   ~ 0
RX
Text Label 5300 3850 2    60   ~ 0
TX
Text Label 5300 3950 2    60   ~ 0
RX
Wire Wire Line
	5300 3950 4950 3950
Wire Wire Line
	5300 3850 4950 3850
Wire Wire Line
	7650 2800 7450 2800
Wire Wire Line
	7650 2900 7450 2900
Wire Wire Line
	7450 3000 7650 3000
Text Label 7650 3000 2    60   ~ 0
PWM
Wire Wire Line
	5550 5600 5900 5600
Text Label 5900 5600 2    60   ~ 0
GND
Text Label 7950 5600 2    60   ~ 0
GND
Text Label 6700 5050 3    60   ~ 0
3V3
Wire Wire Line
	9100 3400 9400 3400
Wire Wire Line
	9400 3400 9400 3200
Wire Wire Line
	9100 3650 9400 3650
Wire Wire Line
	9400 3650 9400 3850
Text Label 9100 3400 0    60   ~ 0
3V3
Text Label 9100 3650 0    60   ~ 0
GND
$Comp
L GNDD #PWR?
U 1 1 5ACE0E6A
P 9400 3850
F 0 "#PWR?" H 9400 3600 50  0001 C CNN
F 1 "GNDD" H 9400 3700 50  0000 C CNN
F 2 "" H 9400 3850 50  0000 C CNN
F 3 "" H 9400 3850 50  0000 C CNN
	1    9400 3850
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR?
U 1 1 5ACE0E94
P 9400 3200
F 0 "#PWR?" H 9400 3050 50  0001 C CNN
F 1 "+3V3" H 9400 3340 50  0000 C CNN
F 2 "" H 9400 3200 50  0000 C CNN
F 3 "" H 9400 3200 50  0000 C CNN
	1    9400 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 3200 5300 3200
Text Label 5300 3200 2    60   ~ 0
PWM
Text Label 5300 3400 2    60   ~ 0
GPIO17
Text Label 6650 3000 0    60   ~ 0
GPIO17
Text Label 7800 3200 2    60   ~ 0
GPIO23
Text Label 5300 3300 2    60   ~ 0
GPIO23
Wire Wire Line
	7450 3200 7800 3200
Wire Wire Line
	4950 3300 5300 3300
Text Notes 8500 2250 2    60   ~ 0
TX / RX based on Raspberry Pi pins
Wire Wire Line
	1550 6250 1900 6250
Wire Wire Line
	1550 6700 1900 6700
Text Label 1550 6250 0    60   ~ 0
SDA
Text Label 1550 6700 0    60   ~ 0
SCL
$Comp
L R R?
U 1 1 5ACE28B0
P 2050 6250
F 0 "R?" V 2130 6250 50  0000 C CNN
F 1 "2K7" V 2050 6250 50  0000 C CNN
F 2 "" V 1980 6250 50  0000 C CNN
F 3 "" H 2050 6250 50  0000 C CNN
	1    2050 6250
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5ACE28ED
P 2050 6700
F 0 "R?" V 2130 6700 50  0000 C CNN
F 1 "2K7" V 2050 6700 50  0000 C CNN
F 2 "" V 1980 6700 50  0000 C CNN
F 3 "" H 2050 6700 50  0000 C CNN
	1    2050 6700
	0    1    1    0   
$EndComp
Wire Wire Line
	2200 6250 2450 6250
Wire Wire Line
	2200 6700 2450 6700
Text Label 2450 6250 2    60   ~ 0
3V3
Text Label 2450 6700 2    60   ~ 0
3V3
Text Notes 1300 6000 0    60   ~ 0
Pull-up resistors for i2c lines\n
Text Notes 5350 1100 0    60   ~ 0
Programming header
Text Notes 9150 2900 0    60   ~ 0
Power
$EndSCHEMATC
