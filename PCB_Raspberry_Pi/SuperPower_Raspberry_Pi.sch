EESchema Schematic File Version 4
LIBS:SuperPower_Raspberry_Pi-cache
EELAYER 26 0
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
L SuperPower_Library:Raspberry_Pi_GPIO_Header J1
U 1 1 5C3DC065
P 6050 4200
F 0 "J1" H 6050 5300 60  0000 C CNN
F 1 "RPi_GPIO" H 6050 3000 60  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x20_P2.54mm_Vertical" H 7200 4200 60  0001 C CNN
F 3 "" H 6050 4200 60  0000 C CNN
	1    6050 4200
	1    0    0    -1  
$EndComp
Text GLabel 5400 3400 0    50   Input ~ 0
SDA
Text GLabel 5400 3500 0    50   Input ~ 0
SCL
Wire Wire Line
	5400 3400 5600 3400
Wire Wire Line
	5400 3500 5600 3500
$Comp
L power:+3.3V #PWR0106
U 1 1 5C3DD62D
P 4950 3200
F 0 "#PWR0106" H 4950 3050 50  0001 C CNN
F 1 "+3.3V" H 4965 3373 50  0000 C CNN
F 2 "" H 4950 3200 50  0001 C CNN
F 3 "" H 4950 3200 50  0001 C CNN
	1    4950 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 3300 4950 3300
Wire Wire Line
	4950 3300 4950 3200
$Comp
L power:GND #PWR0108
U 1 1 5C3DDE65
P 4750 3850
F 0 "#PWR0108" H 4750 3600 50  0001 C CNN
F 1 "GND" H 4755 3677 50  0000 C CNN
F 2 "" H 4750 3850 50  0001 C CNN
F 3 "" H 4750 3850 50  0001 C CNN
	1    4750 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 3700 4750 3700
Wire Wire Line
	4750 3700 4750 3850
$Comp
L power:GND #PWR0107
U 1 1 5CDAA9DB
P 5300 4550
F 0 "#PWR0107" H 5300 4300 50  0001 C CNN
F 1 "GND" H 5305 4377 50  0000 C CNN
F 2 "" H 5300 4550 50  0001 C CNN
F 3 "" H 5300 4550 50  0001 C CNN
	1    5300 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 4500 5300 4500
Wire Wire Line
	5300 4500 5300 4550
$Comp
L power:+5V #PWR0114
U 1 1 5CE134C5
P 6650 3100
F 0 "#PWR0114" H 6650 2950 50  0001 C CNN
F 1 "+5V" H 6665 3273 50  0000 C CNN
F 2 "" H 6650 3100 50  0001 C CNN
F 3 "" H 6650 3100 50  0001 C CNN
	1    6650 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 3100 6650 3300
Wire Wire Line
	6650 3400 6500 3400
Wire Wire Line
	6500 3300 6650 3300
Connection ~ 6650 3300
Wire Wire Line
	6650 3300 6650 3400
Wire Wire Line
	5600 4900 5550 4900
$Comp
L Mechanical:MountingHole H?
U 1 1 5F4EFF6E
P 600 7650
F 0 "H?" H 700 7696 50  0000 L CNN
F 1 "MountingHole" H 700 7605 50  0000 L CNN
F 2 "" H 600 7650 50  0001 C CNN
F 3 "~" H 600 7650 50  0001 C CNN
	1    600  7650
	1    0    0    -1  
$EndComp
$EndSCHEMATC
