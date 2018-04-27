EESchema Schematic File Version 2
LIBS:testshield-rescue
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
L +3V3 #PWR01
U 1 1 5A97F0C6
P 2800 1900
F 0 "#PWR01" H 2800 1750 50  0001 C CNN
F 1 "+3V3" H 2800 2040 50  0000 C CNN
F 2 "" H 2800 1900 50  0001 C CNN
F 3 "" H 2800 1900 50  0001 C CNN
	1    2800 1900
	1    0    0    -1  
$EndComp
$Comp
L GNDD #PWR02
U 1 1 5A97F13B
P 2950 4750
F 0 "#PWR02" H 2950 4500 50  0001 C CNN
F 1 "GNDD" H 2950 4625 50  0000 C CNN
F 2 "" H 2950 4750 50  0001 C CNN
F 3 "" H 2950 4750 50  0001 C CNN
	1    2950 4750
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x20_Odd_Even J2
U 1 1 5A97F783
P 7150 3400
F 0 "J2" H 7200 4400 50  0000 C CNN
F 1 "Raspiheader" H 7200 2300 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x20" H 7150 3400 50  0001 C CNN
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
F 2 "Pin_Headers:Pin_Header_Straight_2x03" H 5750 1450 50  0001 C CNN
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
F 2 "Buttons_Switches_SMD:SW_SPST_B3S-1000" H 7050 5800 50  0001 C CNN
F 3 "" H 7050 5800 50  0001 C CNN
	1    7050 5600
	1    0    0    -1  
$EndComp
$Comp
L LED-RESCUE-testshield D1
U 1 1 5AB25771
P 3950 7250
F 0 "D1" H 3950 7350 50  0000 C CNN
F 1 "LED1" H 3950 7150 50  0000 C CNN
F 2 "LEDs:LED_0805_HandSoldering" H 3950 7250 50  0001 C CNN
F 3 "" H 3950 7250 50  0001 C CNN
	1    3950 7250
	0    -1   -1   0   
$EndComp
$Comp
L R R1
U 1 1 5AB2586A
P 3950 6900
F 0 "R1" V 4030 6900 50  0000 C CNN
F 1 "68" V 3950 6900 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3880 6900 50  0001 C CNN
F 3 "" H 3950 6900 50  0001 C CNN
	1    3950 6900
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5AB25DAD
P 6700 5450
F 0 "R4" V 6780 5450 50  0000 C CNN
F 1 "10k" V 6700 5450 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6630 5450 50  0001 C CNN
F 3 "" H 6700 5450 50  0001 C CNN
	1    6700 5450
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5AB261E6
P 4950 5600
F 0 "R2" V 5030 5600 50  0000 C CNN
F 1 "68" V 4950 5600 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4880 5600 50  0001 C CNN
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
F 2 "LEDs:LED_0805_HandSoldering" H 5400 5600 50  0001 C CNN
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
Text Label 7650 3900 2    60   ~ 0
GND
Text Label 7650 4100 2    60   ~ 0
GND
Text Label 6750 3700 0    60   ~ 0
GND
Text Label 6750 4400 0    60   ~ 0
GND
Text Label 5350 1350 0    60   ~ 0
MISO
Text Label 5350 1450 0    60   ~ 0
SCK
Text Label 5350 1550 0    60   ~ 0
RST
Text Label 6300 1350 2    60   ~ 0
3V3
Text Label 6300 1450 2    60   ~ 0
MOSI
Text Label 6300 1550 2    60   ~ 0
GND
Text Label 6750 3300 0    60   ~ 0
3V3
Text Label 7650 3600 2    60   ~ 0
SS
Text Label 5300 2450 2    60   ~ 0
SS
Text Label 6250 5600 0    60   ~ 0
RST
Text Label 5300 3700 2    60   ~ 0
RST
Text Label 7650 3700 2    60   ~ 0
RST
Text Label 5300 2750 2    60   ~ 0
SCK
Text Label 4550 5600 0    60   ~ 0
SCK
Text Label 6250 3600 0    60   ~ 0
SCK
Text Label 5300 2550 2    60   ~ 0
MOSI
Text Label 5300 2650 2    60   ~ 0
MISO
Text Label 6250 3400 0    60   ~ 0
MOSI
Text Label 6250 3500 0    60   ~ 0
MISO
Text Label 7650 2800 2    60   ~ 0
TX
Text Label 7650 2900 2    60   ~ 0
RX
Text Label 5300 3850 2    60   ~ 0
TX
Text Label 5300 3950 2    60   ~ 0
RX
Text Label 7650 3000 2    60   ~ 0
PWMp
Text Label 9100 3400 0    60   ~ 0
3V3
Text Label 9100 3800 0    60   ~ 0
GND
$Comp
L GNDD #PWR03
U 1 1 5ACE0E6A
P 9400 4000
F 0 "#PWR03" H 9400 3750 50  0001 C CNN
F 1 "GNDD" H 9400 3850 50  0000 C CNN
F 2 "" H 9400 4000 50  0000 C CNN
F 3 "" H 9400 4000 50  0000 C CNN
	1    9400 4000
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR04
U 1 1 5ACE0E94
P 9400 3200
F 0 "#PWR04" H 9400 3050 50  0001 C CNN
F 1 "+3V3" H 9400 3340 50  0000 C CNN
F 2 "" H 9400 3200 50  0000 C CNN
F 3 "" H 9400 3200 50  0000 C CNN
	1    9400 3200
	1    0    0    -1  
$EndComp
Text Label 5300 3300 2    60   ~ 0
PWMp
Text Label 5300 3400 2    60   ~ 0
GPIO17
Text Label 6650 3000 0    60   ~ 0
GPIO17
Text Label 7800 3200 2    60   ~ 0
PWMa
Text Notes 8500 2250 2    60   ~ 0
TX / RX based on Raspberry Pi pins
Text Label 1550 6250 0    60   ~ 0
SDA
Text Label 1550 6700 0    60   ~ 0
SCL
$Comp
L R R5
U 1 1 5ACE28B0
P 2050 6250
F 0 "R5" V 2130 6250 50  0000 C CNN
F 1 "2K7" V 2050 6250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1980 6250 50  0001 C CNN
F 3 "" H 2050 6250 50  0000 C CNN
	1    2050 6250
	0    1    1    0   
$EndComp
$Comp
L R R6
U 1 1 5ACE28ED
P 2050 6700
F 0 "R6" V 2130 6700 50  0000 C CNN
F 1 "2K7" V 2050 6700 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1980 6700 50  0001 C CNN
F 3 "" H 2050 6700 50  0000 C CNN
	1    2050 6700
	0    1    1    0   
$EndComp
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
Text Notes 7200 5950 0    60   ~ 0
Reset button
Text Notes 4950 5900 0    60   ~ 0
Notification led
$Comp
L R R7
U 1 1 5AD601DC
P 6600 3400
F 0 "R7" V 6650 3250 50  0000 C CNN
F 1 "330" V 6600 3400 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6530 3400 50  0001 C CNN
F 3 "" H 6600 3400 50  0001 C CNN
	1    6600 3400
	0    -1   -1   0   
$EndComp
$Comp
L R R8
U 1 1 5AD60317
P 6600 3500
F 0 "R8" V 6550 3650 50  0000 C CNN
F 1 "330" V 6600 3500 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6530 3500 50  0001 C CNN
F 3 "" H 6600 3500 50  0001 C CNN
	1    6600 3500
	0    1    1    0   
$EndComp
$Comp
L R R9
U 1 1 5AD60827
P 6600 3600
F 0 "R9" V 6550 3750 50  0000 C CNN
F 1 "330" V 6600 3600 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6530 3600 50  0001 C CNN
F 3 "" H 6600 3600 50  0001 C CNN
	1    6600 3600
	0    1    1    0   
$EndComp
$Comp
L ATMEGA328P-AU U1
U 1 1 5AD60B03
P 3950 3350
F 0 "U1" H 3200 4600 50  0000 L BNN
F 1 "ATMEGA328P-AU" H 4350 1950 50  0000 L BNN
F 2 "Housings_QFP:TQFP-32_7x7mm_Pitch0.8mm" H 3950 3350 50  0001 C CIN
F 3 "" H 3950 3350 50  0001 C CNN
	1    3950 3350
	1    0    0    -1  
$EndComp
$Comp
L C_Small C5
U 1 1 5AD618FB
P 3000 3000
F 0 "C5" H 3010 3070 50  0000 L CNN
F 1 "100nF" H 3010 2920 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3000 3000 50  0001 C CNN
F 3 "" H 3000 3000 50  0001 C CNN
	1    3000 3000
	-1   0    0    1   
$EndComp
$Comp
L GNDD #PWR05
U 1 1 5AD61A45
P 3000 3200
F 0 "#PWR05" H 3000 2950 50  0001 C CNN
F 1 "GNDD" H 3000 3075 50  0000 C CNN
F 2 "" H 3000 3200 50  0001 C CNN
F 3 "" H 3000 3200 50  0001 C CNN
	1    3000 3200
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR06
U 1 1 5AD635D5
P 6700 5050
F 0 "#PWR06" H 6700 4900 50  0001 C CNN
F 1 "+3V3" H 6700 5190 50  0000 C CNN
F 2 "" H 6700 5050 50  0001 C CNN
F 3 "" H 6700 5050 50  0001 C CNN
	1    6700 5050
	1    0    0    -1  
$EndComp
$Comp
L GNDD #PWR07
U 1 1 5AD63671
P 5900 5700
F 0 "#PWR07" H 5900 5450 50  0001 C CNN
F 1 "GNDD" H 5900 5575 50  0000 C CNN
F 2 "" H 5900 5700 50  0001 C CNN
F 3 "" H 5900 5700 50  0001 C CNN
	1    5900 5700
	1    0    0    -1  
$EndComp
$Comp
L GNDD #PWR08
U 1 1 5AD6354A
P 7950 5700
F 0 "#PWR08" H 7950 5450 50  0001 C CNN
F 1 "GNDD" H 7950 5575 50  0000 C CNN
F 2 "" H 7950 5700 50  0001 C CNN
F 3 "" H 7950 5700 50  0001 C CNN
	1    7950 5700
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR09
U 1 1 5AD64EB2
P 3950 6600
F 0 "#PWR09" H 3950 6450 50  0001 C CNN
F 1 "+3V3" H 3950 6740 50  0000 C CNN
F 2 "" H 3950 6600 50  0001 C CNN
F 3 "" H 3950 6600 50  0001 C CNN
	1    3950 6600
	1    0    0    -1  
$EndComp
$Comp
L GNDD #PWR010
U 1 1 5AD64FE8
P 3950 7500
F 0 "#PWR010" H 3950 7250 50  0001 C CNN
F 1 "GNDD" H 3950 7375 50  0000 C CNN
F 2 "" H 3950 7500 50  0001 C CNN
F 3 "" H 3950 7500 50  0001 C CNN
	1    3950 7500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C2
U 1 1 5AD6534F
P 2000 2400
F 0 "C2" H 2010 2470 50  0000 L CNN
F 1 "100nF" H 2010 2320 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2000 2400 50  0001 C CNN
F 3 "" H 2000 2400 50  0001 C CNN
	1    2000 2400
	-1   0    0    1   
$EndComp
$Comp
L C_Small C3
U 1 1 5AD65388
P 2350 2500
F 0 "C3" H 2360 2570 50  0000 L CNN
F 1 "100nF" H 2360 2420 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2350 2500 50  0001 C CNN
F 3 "" H 2350 2500 50  0001 C CNN
	1    2350 2500
	-1   0    0    1   
$EndComp
$Comp
L C_Small C4
U 1 1 5AD6530C
P 2650 2700
F 0 "C4" H 2660 2770 50  0000 L CNN
F 1 "100nF" H 2660 2620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2650 2700 50  0001 C CNN
F 3 "" H 2650 2700 50  0001 C CNN
	1    2650 2700
	-1   0    0    1   
$EndComp
Wire Wire Line
	2650 2550 3050 2550
Wire Wire Line
	3050 4450 2950 4450
Wire Wire Line
	2950 4550 3050 4550
Connection ~ 2950 4550
Connection ~ 2950 4450
Wire Wire Line
	6950 3000 6650 3000
Wire Wire Line
	5300 3400 4950 3400
Wire Wire Line
	7250 5600 7950 5600
Wire Wire Line
	3950 7100 3950 7050
Wire Wire Line
	3950 6750 3950 6600
Wire Wire Line
	3950 7400 3950 7500
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
Wire Wire Line
	6950 3700 6750 3700
Wire Wire Line
	6950 4400 6750 4400
Wire Wire Line
	5550 1350 5350 1350
Wire Wire Line
	5550 1450 5350 1450
Wire Wire Line
	5550 1550 5350 1550
Wire Wire Line
	6050 1350 6300 1350
Wire Wire Line
	6050 1450 6300 1450
Wire Wire Line
	6050 1550 6300 1550
Wire Wire Line
	6950 3300 6750 3300
Wire Wire Line
	7650 3600 7450 3600
Wire Wire Line
	5300 2450 4950 2450
Wire Wire Line
	6700 5050 6700 5300
Wire Wire Line
	6250 5600 6850 5600
Connection ~ 6700 5600
Wire Wire Line
	7650 3700 7450 3700
Wire Wire Line
	5300 3700 4950 3700
Wire Wire Line
	4950 2750 5300 2750
Wire Wire Line
	4800 5600 4550 5600
Wire Wire Line
	4950 2650 5300 2650
Wire Wire Line
	5300 2550 4950 2550
Wire Wire Line
	6950 3400 6750 3400
Wire Wire Line
	6750 3500 6950 3500
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
Wire Wire Line
	5550 5600 5900 5600
Wire Wire Line
	9100 3400 9400 3400
Wire Wire Line
	9400 3200 9400 3500
Wire Wire Line
	9100 3800 9400 3800
Wire Wire Line
	9400 3700 9400 4000
Wire Wire Line
	7450 3200 7800 3200
Wire Wire Line
	1550 6250 1900 6250
Wire Wire Line
	1550 6700 1900 6700
Wire Wire Line
	2200 6250 2450 6250
Wire Wire Line
	2200 6700 2450 6700
Wire Wire Line
	6450 3400 6250 3400
Wire Wire Line
	6450 3500 6250 3500
Wire Wire Line
	6750 3600 6950 3600
Wire Wire Line
	6450 3600 6250 3600
Wire Wire Line
	2350 2350 3050 2350
Wire Wire Line
	3050 4350 2950 4350
Wire Wire Line
	2950 4350 2950 4750
Wire Wire Line
	5900 5600 5900 5700
Wire Wire Line
	7950 5600 7950 5700
Wire Wire Line
	2000 2250 3050 2250
Wire Wire Line
	3000 2900 3000 2850
Wire Wire Line
	3000 2850 3050 2850
Wire Wire Line
	3000 3100 3000 3200
Wire Wire Line
	2650 3000 2650 2800
Wire Wire Line
	2350 2350 2350 2400
Wire Wire Line
	2000 2300 2000 2250
Wire Wire Line
	2650 2600 2650 2550
Wire Wire Line
	2800 1900 2800 2550
Connection ~ 2800 2550
Wire Wire Line
	2900 2050 2900 2250
Wire Wire Line
	2700 2050 2900 2050
Connection ~ 2800 2050
Connection ~ 2900 2250
Wire Wire Line
	2700 2350 2700 2050
Connection ~ 2700 2350
Wire Wire Line
	2000 2500 2000 3000
Wire Wire Line
	2000 3000 2650 3000
Wire Wire Line
	2350 2600 2350 3200
Connection ~ 2350 3000
$Comp
L GNDD #PWR011
U 1 1 5AD6715E
P 2350 3200
F 0 "#PWR011" H 2350 2950 50  0001 C CNN
F 1 "GNDD" H 2350 3075 50  0000 C CNN
F 2 "" H 2350 3200 50  0001 C CNN
F 3 "" H 2350 3200 50  0001 C CNN
	1    2350 3200
	1    0    0    -1  
$EndComp
$Comp
L CP1_Small C1
U 1 1 5AD675C9
P 9400 3600
F 0 "C1" H 9410 3670 50  0000 L CNN
F 1 "100uF" H 9410 3520 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-D_EIA-7343-31_Hand" H 9400 3600 50  0001 C CNN
F 3 "" H 9400 3600 50  0001 C CNN
	1    9400 3600
	1    0    0    -1  
$EndComp
Connection ~ 9400 3400
Connection ~ 9400 3800
Wire Wire Line
	4950 2250 5300 2250
Text Label 5300 2250 2    60   ~ 0
LED
$Comp
L R R3
U 1 1 5AD6827D
P 4950 6500
F 0 "R3" V 5030 6500 50  0000 C CNN
F 1 "68" V 4950 6500 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4880 6500 50  0001 C CNN
F 3 "" H 4950 6500 50  0001 C CNN
	1    4950 6500
	0    -1   -1   0   
$EndComp
$Comp
L LED-RESCUE-testshield D3
U 1 1 5AD68283
P 5400 6500
F 0 "D3" H 5400 6600 50  0000 C CNN
F 1 "LED3" H 5400 6400 50  0000 C CNN
F 2 "LEDs:LED_0805_HandSoldering" H 5400 6500 50  0001 C CNN
F 3 "" H 5400 6500 50  0001 C CNN
	1    5400 6500
	-1   0    0    1   
$EndComp
Text Label 4550 6500 0    60   ~ 0
LED
Text Notes 4950 6800 0    60   ~ 0
Notification led
$Comp
L GNDD #PWR012
U 1 1 5AD6828B
P 5900 6600
F 0 "#PWR012" H 5900 6350 50  0001 C CNN
F 1 "GNDD" H 5900 6475 50  0000 C CNN
F 2 "" H 5900 6600 50  0001 C CNN
F 3 "" H 5900 6600 50  0001 C CNN
	1    5900 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 6500 5250 6500
Wire Wire Line
	4800 6500 4550 6500
Wire Wire Line
	5550 6500 5900 6500
Wire Wire Line
	5900 6500 5900 6600
Wire Wire Line
	4950 4150 5300 4150
Text Label 5300 4150 2    60   ~ 0
PWMa
Wire Wire Line
	4950 3300 5300 3300
$EndSCHEMATC
