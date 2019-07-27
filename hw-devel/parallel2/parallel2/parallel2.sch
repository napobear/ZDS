EESchema Schematic File Version 4
LIBS:parallel2-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Parallela PC 2"
Date "2019-06-01"
Rev "2.3"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x24 JPB1
U 1 1 535944CA
P 800 5300
F 0 "JPB1" H 550 6525 50  0000 L BNN
F 1 "PINHD-1X24" H 550 3900 50  0000 L BNN
F 2 "Pin_Headers:Pin_Header_Angled_1x24" H 800 5450 50  0001 C CNN
F 3 "" H 800 5300 60  0000 C CNN
	1    800  5300
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x24 JPA1
U 1 1 5359460E
P 800 2150
F 0 "JPA1" H 550 3375 50  0000 L BNN
F 1 "PINHD-1X24" H 550 750 50  0000 L BNN
F 2 "Pin_Headers:Pin_Header_Angled_1x24" H 800 2300 50  0001 C CNN
F 3 "" H 800 2150 60  0000 C CNN
	1    800  2150
	-1   0    0    -1  
$EndComp
Text GLabel 1200 5800 2    60   BiDi ~ 0
B_D7
Text GLabel 1200 5900 2    60   BiDi ~ 0
B_D6
Text GLabel 1200 6000 2    60   BiDi ~ 0
B_D5
Text GLabel 1200 6100 2    60   BiDi ~ 0
B_D4
Text GLabel 1200 6200 2    60   BiDi ~ 0
B_D3
Text GLabel 1200 6300 2    60   BiDi ~ 0
B_D2
Text GLabel 1200 6400 2    60   BiDi ~ 0
B_D1
Text GLabel 1200 6500 2    60   BiDi ~ 0
B_D0
NoConn ~ 1250 1050
NoConn ~ 1250 1150
$Comp
L power:-12V #PWR07
U 1 1 535A7B8F
P 1600 2650
F 0 "#PWR07" H 1600 2780 20  0001 C CNN
F 1 "-12V" H 1600 2750 30  0000 C CNN
F 2 "" H 1600 2650 60  0000 C CNN
F 3 "" H 1600 2650 60  0000 C CNN
	1    1600 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 535A7BFD
P 1350 2250
F 0 "#PWR01" H 1350 2340 20  0001 C CNN
F 1 "+5V" H 1350 2340 30  0000 C CNN
F 2 "" H 1350 2250 60  0000 C CNN
F 3 "" H 1350 2250 60  0000 C CNN
	1    1350 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 535A7C0C
P 1350 2400
F 0 "#PWR02" H 1350 2400 30  0001 C CNN
F 1 "GND" H 1350 2330 30  0001 C CNN
F 2 "" H 1350 2400 60  0000 C CNN
F 3 "" H 1350 2400 60  0000 C CNN
	1    1350 2400
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR03
U 1 1 535A8003
P 1450 2550
F 0 "#PWR03" H 1450 2500 20  0001 C CNN
F 1 "+12V" H 1450 2650 30  0000 C CNN
F 2 "" H 1450 2550 60  0000 C CNN
F 3 "" H 1450 2550 60  0000 C CNN
	1    1450 2550
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR06
U 1 1 535A94C5
P 1500 2250
F 0 "#PWR06" H 1500 2350 30  0001 C CNN
F 1 "VCC" H 1500 2350 30  0000 C CNN
F 2 "" H 1500 2250 60  0000 C CNN
F 3 "" H 1500 2250 60  0000 C CNN
	1    1500 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  5800 1000 5800
Wire Wire Line
	900  5900 1000 5900
Wire Wire Line
	900  6000 1000 6000
Wire Wire Line
	900  6100 1000 6100
Wire Wire Line
	900  6200 1000 6200
Wire Wire Line
	900  6300 1000 6300
Wire Wire Line
	900  6400 1000 6400
Wire Wire Line
	900  6500 1000 6500
Wire Wire Line
	900  5700 1000 5700
Wire Wire Line
	900  5600 1000 5600
Wire Wire Line
	900  5500 1000 5500
Wire Wire Line
	900  5400 1000 5400
Wire Wire Line
	900  5300 1000 5300
Wire Wire Line
	900  5200 1000 5200
Wire Wire Line
	900  5100 1000 5100
Wire Wire Line
	900  1050 1000 1050
Wire Wire Line
	900  1150 1000 1150
Wire Wire Line
	900  1250 1000 1250
Wire Wire Line
	900  1350 1000 1350
Wire Wire Line
	900  2350 1000 2350
Wire Wire Line
	900  2450 1000 2450
Wire Wire Line
	1250 2450 1250 2350
Wire Wire Line
	1350 2350 1350 2400
Connection ~ 1250 2350
Wire Wire Line
	900  2150 1000 2150
Wire Wire Line
	1250 2150 1250 2250
Wire Wire Line
	900  2250 1000 2250
Connection ~ 1250 2250
Wire Wire Line
	900  2950 1000 2950
Wire Wire Line
	900  2050 1000 2050
Wire Wire Line
	900  1850 1000 1850
Wire Wire Line
	900  1750 1000 1750
Wire Wire Line
	900  1650 1000 1650
Wire Wire Line
	900  1950 1000 1950
Wire Wire Line
	1450 2550 1000 2550
Wire Wire Line
	1250 2350 1350 2350
Wire Wire Line
	900  1550 1000 1550
Wire Wire Line
	900  3350 1000 3350
Wire Wire Line
	900  1450 1000 1450
Wire Wire Line
	900  5000 1000 5000
Text GLabel 1200 3250 2    60   Input ~ 0
B_CLK
Text GLabel 1200 2950 2    60   Input ~ 0
B_/WR
Text GLabel 1200 3050 2    60   Input ~ 0
B_/M1
Text GLabel 1200 3150 2    60   Input ~ 0
B_/IORQ
Text GLabel 1200 3350 2    60   Input ~ 0
B_/MREQ
Text GLabel 1200 5700 2    60   Input ~ 0
B_A15
Text GLabel 1200 5600 2    60   Input ~ 0
B_A14
Text GLabel 1200 5500 2    60   Input ~ 0
B_A13
Text GLabel 1200 5400 2    60   Input ~ 0
B_A12
Text GLabel 1200 5300 2    60   Input ~ 0
B_A11
Text GLabel 1200 5200 2    60   Input ~ 0
B_A10
Text GLabel 1200 5100 2    60   Input ~ 0
B_A9
Text GLabel 1200 5000 2    60   Input ~ 0
B_A8
Text GLabel 1200 4900 2    60   Input ~ 0
B_A7
Text GLabel 1200 4800 2    60   Input ~ 0
B_A6
Text GLabel 1200 4700 2    60   Input ~ 0
B_A5
Text GLabel 1200 4600 2    60   Input ~ 0
B_A4
Text GLabel 1200 4500 2    60   Input ~ 0
B_A3
Text GLabel 1200 4400 2    60   Input ~ 0
B_A2
Text GLabel 1200 4300 2    60   Input ~ 0
B_A1
Text GLabel 1200 4200 2    60   Input ~ 0
B_A0
Wire Wire Line
	900  3250 1000 3250
Wire Wire Line
	900  2850 1000 2850
Wire Wire Line
	900  2750 1000 2750
Wire Wire Line
	900  3150 1000 3150
Wire Wire Line
	900  3050 1000 3050
Wire Wire Line
	900  2650 1000 2650
Wire Wire Line
	1200 4500 1000 4500
Wire Wire Line
	900  4900 1000 4900
Wire Wire Line
	900  4200 1000 4200
Wire Wire Line
	900  4600 1000 4600
Wire Wire Line
	900  4300 1000 4300
Wire Wire Line
	900  4700 1000 4700
Wire Wire Line
	900  4400 1000 4400
Wire Wire Line
	900  4800 1000 4800
Text GLabel 1200 2850 2    60   Input ~ 0
B_/RD
Text GLabel 1200 2750 2    60   Input ~ 0
B_/RESET
Text GLabel 1200 1650 2    60   Input ~ 0
B_*INT
Text GLabel 1200 1350 2    60   Input ~ 0
B_/RFH
Text GLabel 1200 1250 2    60   Input ~ 0
B_/HLT
Text GLabel 1200 2050 2    60   Input ~ 0
B_/BUSREQ
Text GLabel 1200 1950 2    60   Input ~ 0
B_/BUSAK
Text GLabel 1200 1850 2    60   Input ~ 0
B_/NMI
Text GLabel 1200 1750 2    60   Input ~ 0
B_/WAIT
Text GLabel 1200 1550 2    60   Input ~ 0
B_/IEO
Text GLabel 1200 1450 2    60   Input ~ 0
B_/IEI
Wire Wire Line
	1250 2250 1350 2250
Connection ~ 1000 1050
Wire Wire Line
	1000 1050 1250 1050
Connection ~ 1000 1150
Wire Wire Line
	1000 1150 1250 1150
Connection ~ 1000 1250
Wire Wire Line
	1000 1250 1200 1250
Connection ~ 1000 1350
Wire Wire Line
	1000 1350 1200 1350
Connection ~ 1000 1450
Wire Wire Line
	1000 1450 1200 1450
Connection ~ 1000 1550
Wire Wire Line
	1000 1550 1200 1550
Connection ~ 1000 1650
Wire Wire Line
	1000 1650 1200 1650
Connection ~ 1000 1750
Wire Wire Line
	1000 1750 1200 1750
Connection ~ 1000 1850
Wire Wire Line
	1000 1850 1200 1850
Connection ~ 1000 1950
Wire Wire Line
	1000 1950 1200 1950
Connection ~ 1000 2050
Wire Wire Line
	1000 2050 1200 2050
Connection ~ 1000 2150
Wire Wire Line
	1000 2150 1250 2150
Connection ~ 1000 2250
Wire Wire Line
	1000 2250 1250 2250
Connection ~ 1000 2350
Wire Wire Line
	1000 2350 1250 2350
Connection ~ 1000 2450
Wire Wire Line
	1000 2450 1250 2450
Connection ~ 1000 2550
Wire Wire Line
	1000 2550 900  2550
Connection ~ 1000 2650
Wire Wire Line
	1000 2650 1600 2650
Connection ~ 1000 2750
Wire Wire Line
	1000 2750 1200 2750
Connection ~ 1000 2850
Wire Wire Line
	1000 2850 1200 2850
Connection ~ 1000 2950
Wire Wire Line
	1000 2950 1200 2950
Connection ~ 1000 3050
Wire Wire Line
	1000 3050 1200 3050
Connection ~ 1000 3150
Wire Wire Line
	1000 3150 1200 3150
Connection ~ 1000 3250
Wire Wire Line
	1000 3250 1200 3250
Connection ~ 1000 3350
Wire Wire Line
	1000 3350 1200 3350
Connection ~ 1000 4200
Wire Wire Line
	1000 4200 1200 4200
Connection ~ 1000 4300
Wire Wire Line
	1000 4300 1200 4300
Connection ~ 1000 4400
Wire Wire Line
	1000 4400 1200 4400
Connection ~ 1000 4500
Wire Wire Line
	1000 4500 900  4500
Connection ~ 1000 4600
Wire Wire Line
	1000 4600 1200 4600
Connection ~ 1000 4700
Wire Wire Line
	1000 4700 1200 4700
Connection ~ 1000 4800
Wire Wire Line
	1000 4800 1200 4800
Connection ~ 1000 4900
Wire Wire Line
	1000 4900 1200 4900
Connection ~ 1000 5000
Wire Wire Line
	1000 5000 1200 5000
Connection ~ 1000 5100
Wire Wire Line
	1000 5100 1200 5100
Connection ~ 1000 5200
Wire Wire Line
	1000 5200 1200 5200
Connection ~ 1000 5300
Wire Wire Line
	1000 5300 1200 5300
Connection ~ 1000 5400
Wire Wire Line
	1000 5400 1200 5400
Connection ~ 1000 5500
Wire Wire Line
	1000 5500 1200 5500
Connection ~ 1000 5600
Wire Wire Line
	1000 5600 1200 5600
Connection ~ 1000 5700
Wire Wire Line
	1000 5700 1200 5700
Connection ~ 1000 5800
Wire Wire Line
	1000 5800 1200 5800
Connection ~ 1000 5900
Wire Wire Line
	1000 5900 1200 5900
Connection ~ 1000 6000
Wire Wire Line
	1000 6000 1200 6000
Connection ~ 1000 6100
Wire Wire Line
	1000 6100 1200 6100
Connection ~ 1000 6200
Wire Wire Line
	1000 6200 1200 6200
Connection ~ 1000 6300
Wire Wire Line
	1000 6300 1200 6300
Connection ~ 1000 6400
Wire Wire Line
	1000 6400 1200 6400
Connection ~ 1000 6500
Wire Wire Line
	1000 6500 1200 6500
Connection ~ 1350 2250
Wire Wire Line
	1350 2250 1500 2250
$Comp
L o_zilog:Z80-PIO U2
U 1 1 5BEF0C67
P 7800 5150
F 0 "U2" H 7800 6498 60  0000 C CNN
F 1 "Z80-PIO" H 7800 6392 60  0000 C CNN
F 2 "" H 7800 5150 50  0001 C CNN
F 3 "" H 7800 5150 50  0001 C CNN
	1    7800 5150
	1    0    0    -1  
$EndComp
$Comp
L o_ttl:74HCT688 U1
U 1 1 5BEF527C
P 4900 1800
F 0 "U1" H 4900 3048 60  0000 C CNN
F 1 "74HCT688" H 4900 2942 60  0000 C CNN
F 2 "" H 4900 1800 50  0001 C CNN
F 3 "" H 4900 1800 50  0001 C CNN
	1    4900 1800
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x06 SW1
U 1 1 5BEF539D
P 2650 1050
F 0 "SW1" H 2650 550 50  0000 C CNN
F 1 "SW_DIP_x06" H 2600 650 50  0000 C CNN
F 2 "" H 2650 1050 50  0001 C CNN
F 3 "" H 2650 1050 50  0001 C CNN
	1    2650 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 1000 4300 1000
$Comp
L power:GND #PWR012
U 1 1 5BF06D9B
P 4100 2700
F 0 "#PWR012" H 4100 2450 50  0001 C CNN
F 1 "GND" H 4105 2527 50  0000 C CNN
F 2 "" H 4100 2700 50  0001 C CNN
F 3 "" H 4100 2700 50  0001 C CNN
	1    4100 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 1100 3600 1100
Text Label 3600 1100 0    50   ~ 0
B_A2
Wire Wire Line
	4300 1200 3600 1200
Text Label 3600 1200 0    50   ~ 0
B_A3
Wire Wire Line
	4300 1300 3600 1300
Text Label 3600 1300 0    50   ~ 0
B_A4
Wire Wire Line
	4300 1400 3600 1400
Text Label 3600 1400 0    50   ~ 0
B_A5
Wire Wire Line
	4300 1500 3600 1500
Text Label 3600 1500 0    50   ~ 0
B_A6
Wire Wire Line
	4300 1600 3600 1600
Text Label 3600 1600 0    50   ~ 0
B_A7
$Comp
L power:+5V #PWR010
U 1 1 5BF770CB
P 2250 2850
F 0 "#PWR010" H 2250 2700 50  0001 C CNN
F 1 "+5V" H 2265 3023 50  0000 C CNN
F 2 "" H 2250 2850 50  0001 C CNN
F 3 "" H 2250 2850 50  0001 C CNN
	1    2250 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 2700 4100 2700
Wire Wire Line
	4100 1000 4100 1800
Text Label 8750 4150 0    50   ~ 0
D_D0
Text Label 8750 4250 0    50   ~ 0
D_D1
Text Label 8750 4350 0    50   ~ 0
D_D2
Text Label 8750 4450 0    50   ~ 0
D_D3
Text Label 8750 4550 0    50   ~ 0
D_D4
Text Label 8750 4650 0    50   ~ 0
D_D5
Text Label 8750 4750 0    50   ~ 0
D_D6
Text Label 8750 4850 0    50   ~ 0
D_D7
Text Label 6150 5050 0    50   ~ 0
*PINT
Text Label 5150 5250 0    50   ~ 0
B_/IEO
Text Label 8750 5250 0    50   ~ 0
RESET_INIT
Text Label 8750 5350 0    50   ~ 0
BUSY
Text Label 8750 5450 0    50   ~ 0
STROBE
Text Label 8750 5550 0    50   ~ 0
ACK
Wire Wire Line
	6850 5550 6150 5550
Wire Wire Line
	6850 5650 6150 5650
Wire Wire Line
	6850 5850 6150 5850
Wire Wire Line
	6850 5950 6150 5950
Text Label 2600 3200 2    50   ~ 0
B_/RESET
Text Label 2600 3300 2    50   ~ 0
B_/M1
$Comp
L power:GND #PWR08
U 1 1 5C04EF24
P 2000 6700
F 0 "#PWR08" H 2000 6450 50  0001 C CNN
F 1 "GND" H 2005 6527 50  0000 C CNN
F 2 "" H 2000 6700 50  0001 C CNN
F 3 "" H 2000 6700 50  0001 C CNN
	1    2000 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5C04F238
P 1450 7250
F 0 "C1" H 1565 7296 50  0000 L CNN
F 1 ".1" H 1565 7205 50  0000 L CNN
F 2 "" H 1488 7100 50  0001 C CNN
F 3 "~" H 1450 7250 50  0001 C CNN
	1    1450 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5C04F2B2
P 1800 7250
F 0 "C2" H 1915 7296 50  0000 L CNN
F 1 ".1" H 1915 7205 50  0000 L CNN
F 2 "" H 1838 7100 50  0001 C CNN
F 3 "~" H 1800 7250 50  0001 C CNN
	1    1800 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5C04F313
P 2150 7250
F 0 "C3" H 2265 7296 50  0000 L CNN
F 1 ".1" H 2265 7205 50  0000 L CNN
F 2 "" H 2188 7100 50  0001 C CNN
F 3 "~" H 2150 7250 50  0001 C CNN
	1    2150 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C6
U 1 1 5C04F40F
P 3200 7250
F 0 "C6" H 3318 7296 50  0000 L CNN
F 1 "10uF" H 3318 7205 50  0000 L CNN
F 2 "" H 3238 7100 50  0001 C CNN
F 3 "~" H 3200 7250 50  0001 C CNN
	1    3200 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 7100 2850 7100
Wire Wire Line
	1450 7100 1450 6950
Wire Wire Line
	1800 7100 1450 7100
Wire Wire Line
	2150 7100 1800 7100
$Comp
L power:+5V #PWR04
U 1 1 5C05D44B
P 1450 6950
F 0 "#PWR04" H 1450 6800 50  0001 C CNN
F 1 "+5V" H 1465 7123 50  0000 C CNN
F 2 "" H 1450 6950 50  0001 C CNN
F 3 "" H 1450 6950 50  0001 C CNN
	1    1450 6950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5C05D474
P 1450 7500
F 0 "#PWR05" H 1450 7250 50  0001 C CNN
F 1 "GND" H 1455 7327 50  0000 C CNN
F 2 "" H 1450 7500 50  0001 C CNN
F 3 "" H 1450 7500 50  0001 C CNN
	1    1450 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 7500 1450 7400
Wire Wire Line
	1450 7400 1800 7400
Wire Wire Line
	1800 7400 2150 7400
Wire Wire Line
	2850 7400 3200 7400
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5BE944F9
P 5600 5550
F 0 "J1" V 5566 5362 50  0000 R CNN
F 1 "DISABLE M2" V 5600 6150 50  0000 R CNN
F 2 "" H 5600 5550 50  0001 C CNN
F 3 "~" H 5600 5550 50  0001 C CNN
	1    5600 5550
	0    -1   1    0   
$EndComp
Wire Wire Line
	6850 6150 6150 6150
Text Label 6150 6150 0    50   ~ 0
B_CLK
Text Label 6150 5950 0    50   ~ 0
B_A0
Text Label 6150 5850 0    50   ~ 0
B_A1
Text Label 6150 5650 0    50   ~ 0
B_/IORQ
Text Label 6150 5550 0    50   ~ 0
B_/RD
Wire Wire Line
	4300 1800 4100 1800
Connection ~ 4100 1800
Wire Wire Line
	4100 1800 4100 2700
$Comp
L 74xx:74LS06 U4
U 1 1 5BEA6068
P 5200 6500
F 0 "U4" H 5200 6817 50  0000 C CNN
F 1 "74LS06" H 5200 6726 50  0000 C CNN
F 2 "" H 5200 6500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS06" H 5200 6500 50  0001 C CNN
	1    5200 6500
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74LS06 U4
U 2 1 5BEA6142
P 5200 6850
F 0 "U4" H 4900 7000 50  0000 C CNN
F 1 "74LS06" H 5550 7000 50  0000 C CNN
F 2 "" H 5200 6850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS06" H 5200 6850 50  0001 C CNN
	2    5200 6850
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74LS06 U4
U 3 1 5BEA61AD
P 5200 7200
F 0 "U4" H 4900 7300 50  0000 C CNN
F 1 "74LS06" H 5500 7350 50  0000 C CNN
F 2 "" H 5200 7200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS06" H 5200 7200 50  0001 C CNN
	3    5200 7200
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74LS06 U4
U 4 1 5BEB5DD7
P 5200 7550
F 0 "U4" H 4900 7700 50  0000 C CNN
F 1 "74LS06" H 5500 7700 50  0000 C CNN
F 2 "" H 5200 7550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS06" H 5200 7550 50  0001 C CNN
	4    5200 7550
	-1   0    0    -1  
$EndComp
Text Label 5500 7550 0    50   ~ 0
ACK
Text Label 5500 7200 0    50   ~ 0
STROBE
Text Label 5500 6850 0    50   ~ 0
BUSY
Text Label 5500 6500 0    50   ~ 0
INIT
$Comp
L Device:R R1
U 1 1 5BEF5EB4
P 4300 6500
F 0 "R1" V 4093 6500 50  0000 C CNN
F 1 "220" V 4184 6500 50  0000 C CNN
F 2 "" V 4230 6500 50  0001 C CNN
F 3 "~" H 4300 6500 50  0001 C CNN
	1    4300 6500
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5BF05B6E
P 4300 6850
F 0 "R2" V 4093 6850 50  0000 C CNN
F 1 "220" V 4184 6850 50  0000 C CNN
F 2 "" V 4230 6850 50  0001 C CNN
F 3 "~" H 4300 6850 50  0001 C CNN
	1    4300 6850
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5BF05BB8
P 4300 7200
F 0 "R3" V 4093 7200 50  0000 C CNN
F 1 "220" V 4184 7200 50  0000 C CNN
F 2 "" V 4230 7200 50  0001 C CNN
F 3 "~" H 4300 7200 50  0001 C CNN
	1    4300 7200
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5BF05C00
P 4300 7550
F 0 "R4" V 4093 7550 50  0000 C CNN
F 1 "220" V 4184 7550 50  0000 C CNN
F 2 "" V 4230 7550 50  0001 C CNN
F 3 "~" H 4300 7550 50  0001 C CNN
	1    4300 7550
	0    1    1    0   
$EndComp
Wire Wire Line
	4450 6500 4600 6500
Wire Wire Line
	4450 6850 4600 6850
Wire Wire Line
	4450 7200 4600 7200
Wire Wire Line
	4450 7550 4600 7550
$Comp
L Device:LED_ALT D1
U 1 1 5BF57248
P 4750 6500
F 0 "D1" H 4650 6600 50  0000 C CNN
F 1 " " H 4741 6625 50  0000 C CNN
F 2 "" H 4750 6500 50  0001 C CNN
F 3 "~" H 4750 6500 50  0001 C CNN
	1    4750 6500
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ALT D2
U 1 1 5BF89007
P 4750 6850
F 0 "D2" H 4650 6950 50  0000 C CNN
F 1 " " H 4741 6975 50  0000 C CNN
F 2 "" H 4750 6850 50  0001 C CNN
F 3 "~" H 4750 6850 50  0001 C CNN
	1    4750 6850
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ALT D3
U 1 1 5BF89059
P 4750 7200
F 0 "D3" H 4650 7300 50  0000 C CNN
F 1 " " H 4741 7325 50  0000 C CNN
F 2 "" H 4750 7200 50  0001 C CNN
F 3 "~" H 4750 7200 50  0001 C CNN
	1    4750 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ALT D4
U 1 1 5BF890BB
P 4750 7550
F 0 "D4" H 4650 7650 50  0000 C CNN
F 1 " " H 4741 7675 50  0000 C CNN
F 2 "" H 4750 7550 50  0001 C CNN
F 3 "~" H 4750 7550 50  0001 C CNN
	1    4750 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 6500 4050 6500
Wire Wire Line
	4050 7550 4150 7550
Wire Wire Line
	4050 6500 4050 6850
Wire Wire Line
	4150 7200 4050 7200
Connection ~ 4050 7200
Wire Wire Line
	4050 7200 4050 7550
Wire Wire Line
	4150 6850 4050 6850
Connection ~ 4050 6850
Wire Wire Line
	4050 6850 4050 7200
Connection ~ 4050 6500
$Comp
L power:+5V #PWR011
U 1 1 5BFEF367
P 3300 5800
F 0 "#PWR011" H 3300 5650 50  0001 C CNN
F 1 "+5V" H 3315 5973 50  0000 C CNN
F 2 "" H 3300 5800 50  0001 C CNN
F 3 "" H 3300 5800 50  0001 C CNN
	1    3300 5800
	1    0    0    -1  
$EndComp
$Comp
L o_ttl:74HCT245 U5
U 1 1 5C016B65
P 4750 4650
F 0 "U5" H 4250 5450 60  0000 C CNN
F 1 "74HCT245" H 4300 5350 60  0000 C CNN
F 2 "" H 4750 4650 50  0001 C CNN
F 3 "" H 4750 4650 50  0001 C CNN
	1    4750 4650
	1    0    0    -1  
$EndComp
Text Label 4150 4150 2    50   ~ 0
B_D0
Text Label 4150 4250 2    50   ~ 0
B_D1
Text Label 4150 4350 2    50   ~ 0
B_D2
Text Label 4150 4450 2    50   ~ 0
B_D3
Text Label 4150 4550 2    50   ~ 0
B_D4
Text Label 4150 4650 2    50   ~ 0
B_D5
Text Label 4150 4750 2    50   ~ 0
B_D6
Text Label 4150 4850 2    50   ~ 0
B_D7
$Comp
L power:GND #PWR013
U 1 1 5C02B2C6
P 4150 5450
F 0 "#PWR013" H 4150 5200 50  0001 C CNN
F 1 "GND" H 4155 5277 50  0000 C CNN
F 2 "" H 4150 5450 50  0001 C CNN
F 3 "" H 4150 5450 50  0001 C CNN
	1    4150 5450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR014
U 1 1 5C03D20C
P 4750 3950
F 0 "#PWR014" H 4750 3800 50  0001 C CNN
F 1 "+5V" H 4765 4123 50  0000 C CNN
F 2 "" H 4750 3950 50  0001 C CNN
F 3 "" H 4750 3950 50  0001 C CNN
	1    4750 3950
	1    0    0    -1  
$EndComp
Connection ~ 1450 7400
Connection ~ 1450 7100
$Comp
L Device:C C4
U 1 1 5C074958
P 2500 7250
F 0 "C4" H 2615 7296 50  0000 L CNN
F 1 ".1" H 2615 7205 50  0000 L CNN
F 2 "" H 2538 7100 50  0001 C CNN
F 3 "~" H 2500 7250 50  0001 C CNN
	1    2500 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5C0749BA
P 2850 7250
F 0 "C5" H 2965 7296 50  0000 L CNN
F 1 ".1" H 2965 7205 50  0000 L CNN
F 2 "" H 2888 7100 50  0001 C CNN
F 3 "~" H 2850 7250 50  0001 C CNN
	1    2850 7250
	1    0    0    -1  
$EndComp
Connection ~ 2150 7100
Wire Wire Line
	2150 7100 2500 7100
Wire Wire Line
	2500 7100 2850 7100
Wire Wire Line
	2150 7400 2500 7400
Connection ~ 2150 7400
Wire Wire Line
	2500 7400 2850 7400
Text Label 6600 2350 2    50   ~ 0
D_D0
Text Label 6600 2450 2    50   ~ 0
D_D1
Text Label 6600 2550 2    50   ~ 0
D_D2
Text Label 6600 2650 2    50   ~ 0
D_D3
Text Label 6600 2750 2    50   ~ 0
D_D4
Text Label 6600 2850 2    50   ~ 0
D_D5
Text Label 6600 2950 2    50   ~ 0
D_D6
Text Label 6600 3050 2    50   ~ 0
D_D7
$Comp
L Device:LED_ALT D5
U 1 1 5C0DCCAE
P 9550 5600
F 0 "D5" H 9450 5700 50  0000 C CNN
F 1 " " H 9541 5725 50  0000 C CNN
F 2 "" H 9550 5600 50  0001 C CNN
F 3 "~" H 9550 5600 50  0001 C CNN
	1    9550 5600
	0    1    1    0   
$EndComp
$Comp
L Device:LED_ALT D6
U 1 1 5C0DCDCB
P 10250 5600
F 0 "D6" H 10150 5700 50  0000 C CNN
F 1 " " H 10241 5725 50  0000 C CNN
F 2 "" H 10250 5600 50  0001 C CNN
F 3 "~" H 10250 5600 50  0001 C CNN
	1    10250 5600
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 5C0DD392
P 9550 5300
F 0 "R5" H 9480 5254 50  0000 R CNN
F 1 "220" H 9480 5345 50  0000 R CNN
F 2 "" V 9480 5300 50  0001 C CNN
F 3 "~" H 9550 5300 50  0001 C CNN
	1    9550 5300
	-1   0    0    1   
$EndComp
$Comp
L Device:R R6
U 1 1 5C0DD4F8
P 10250 5300
F 0 "R6" H 10180 5254 50  0000 R CNN
F 1 "220" H 10180 5345 50  0000 R CNN
F 2 "" V 10180 5300 50  0001 C CNN
F 3 "~" H 10250 5300 50  0001 C CNN
	1    10250 5300
	-1   0    0    1   
$EndComp
Wire Wire Line
	9550 5150 10250 5150
Wire Wire Line
	10250 5150 10500 5150
$Comp
L power:+5V #PWR019
U 1 1 5C13B47D
P 10500 5150
F 0 "#PWR019" H 10500 5000 50  0001 C CNN
F 1 "+5V" H 10515 5323 50  0000 C CNN
F 2 "" H 10500 5150 50  0001 C CNN
F 3 "" H 10500 5150 50  0001 C CNN
	1    10500 5150
	1    0    0    -1  
$EndComp
Text Label 8750 5650 0    50   ~ 0
TXRX
Text Label 9550 5100 0    50   ~ 0
TX
Text Label 10250 5100 0    50   ~ 0
RX
Wire Wire Line
	2350 750  2350 850 
Connection ~ 2350 850 
Wire Wire Line
	2350 850  2350 950 
Connection ~ 2350 950 
Wire Wire Line
	2350 950  2350 1050
Connection ~ 2350 1050
Wire Wire Line
	2350 1050 2350 1150
Connection ~ 2350 1150
Wire Wire Line
	2350 1150 2350 1250
$Comp
L Device:R_Network08 RN1
U 1 1 5BEF5433
P 2500 2450
F 0 "RN1" H 1850 2300 50  0000 L CNN
F 1 "8x10K" H 1800 2400 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 2975 2450 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 2500 2450 50  0001 C CNN
	1    2500 2450
	1    0    0    1   
$EndComp
Connection ~ 4300 1800
Wire Wire Line
	4300 1800 4300 1900
Wire Wire Line
	4300 1000 4300 900 
Connection ~ 4300 1000
Wire Wire Line
	2950 1250 2950 2250
Wire Wire Line
	2950 2500 4300 2500
Wire Wire Line
	2950 1150 3050 1150
Wire Wire Line
	3050 1150 3050 2150
Wire Wire Line
	3050 2400 4300 2400
Wire Wire Line
	2950 1050 3150 1050
Wire Wire Line
	3150 1050 3150 2050
Wire Wire Line
	3150 2300 4300 2300
Wire Wire Line
	3250 2200 4300 2200
Wire Wire Line
	2950 950  3250 950 
Wire Wire Line
	3250 950  3250 1950
Wire Wire Line
	2950 850  3350 850 
Wire Wire Line
	3350 850  3350 1850
Wire Wire Line
	3350 2100 4300 2100
Wire Wire Line
	2950 750  3450 750 
Wire Wire Line
	3450 750  3450 1750
Wire Wire Line
	3450 2000 4300 2000
Wire Wire Line
	2800 2250 2950 2250
Connection ~ 2950 2250
Wire Wire Line
	2950 2250 2950 2500
Wire Wire Line
	2700 2250 2700 2150
Wire Wire Line
	2700 2150 3050 2150
Connection ~ 3050 2150
Wire Wire Line
	3050 2150 3050 2400
Wire Wire Line
	2600 2250 2600 2050
Wire Wire Line
	2600 2050 3150 2050
Connection ~ 3150 2050
Wire Wire Line
	3150 2050 3150 2300
Wire Wire Line
	2500 2250 2500 1950
Wire Wire Line
	2500 1950 3250 1950
Connection ~ 3250 1950
Wire Wire Line
	3250 1950 3250 2200
Wire Wire Line
	2400 2250 2400 1850
Wire Wire Line
	2400 1850 3350 1850
Connection ~ 3350 1850
Wire Wire Line
	3350 1850 3350 2100
Wire Wire Line
	2300 2250 2300 1750
Wire Wire Line
	2300 1750 3450 1750
Connection ~ 3450 1750
Wire Wire Line
	3450 1750 3450 2000
Connection ~ 4100 2700
Text Label 5900 900  0    50   ~ 0
CE
$Comp
L Connector_Generic:Conn_02x10_Odd_Even J2
U 1 1 5BE8D002
P 9300 2650
F 0 "J2" H 9350 3267 50  0000 C CNN
F 1 "PARPORT" H 9350 3176 50  0000 C CNN
F 2 "" H 9300 2650 50  0001 C CNN
F 3 "~" H 9300 2650 50  0001 C CNN
	1    9300 2650
	-1   0    0    -1  
$EndComp
$Comp
L o_ttl:74HCT245 U6
U 1 1 5BF3E3B4
P 7200 2850
F 0 "U6" H 6700 3650 60  0000 C CNN
F 1 "74HCT245" H 6750 3550 60  0000 C CNN
F 2 "" H 7200 2850 50  0001 C CNN
F 3 "" H 7200 2850 50  0001 C CNN
	1    7200 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 5150 5700 5150
Wire Wire Line
	5150 5250 5600 5250
Wire Wire Line
	5700 5350 5700 5150
Connection ~ 5700 5150
Wire Wire Line
	5700 5150 5800 5150
Wire Wire Line
	5600 5350 5600 5250
Connection ~ 5600 5250
Wire Wire Line
	5600 5250 6850 5250
Text Label 6850 5450 0    50   ~ 0
CE
Wire Wire Line
	6150 5050 6850 5050
Wire Wire Line
	3450 3250 3600 3250
Wire Wire Line
	3600 3250 3600 5750
Wire Wire Line
	3600 5750 6850 5750
Wire Wire Line
	4150 5150 3800 5150
Wire Wire Line
	4750 5350 4150 5350
Connection ~ 4150 5350
Wire Wire Line
	4150 5350 4150 5450
Wire Wire Line
	4150 5050 4150 5350
Wire Wire Line
	5350 4150 6850 4150
Wire Wire Line
	5350 4250 6850 4250
Wire Wire Line
	5350 4350 6850 4350
Wire Wire Line
	5350 4450 6850 4450
Wire Wire Line
	5350 4550 6850 4550
Wire Wire Line
	5350 4650 6850 4650
Wire Wire Line
	5350 4750 6850 4750
Wire Wire Line
	5350 4850 6850 4850
Text Label 6600 3350 2    50   ~ 0
TXRX
$Comp
L power:GND #PWR015
U 1 1 5C1ED912
P 6350 3550
F 0 "#PWR015" H 6350 3300 50  0001 C CNN
F 1 "GND" H 6355 3377 50  0000 C CNN
F 2 "" H 6350 3550 50  0001 C CNN
F 3 "" H 6350 3550 50  0001 C CNN
	1    6350 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 3550 7200 3550
Wire Wire Line
	6600 3250 6350 3250
Wire Wire Line
	6350 3250 6350 3550
Connection ~ 6350 3550
$Comp
L power:+5V #PWR016
U 1 1 5C2088B5
P 6850 2150
F 0 "#PWR016" H 6850 2000 50  0001 C CNN
F 1 "+5V" H 6865 2323 50  0000 C CNN
F 2 "" H 6850 2150 50  0001 C CNN
F 3 "" H 6850 2150 50  0001 C CNN
	1    6850 2150
	1    0    0    -1  
$EndComp
$Comp
L 74ls-sergey:74LS07 U7
U 1 1 5BEDD1D3
P 8000 850
F 0 "U7" H 8000 1138 60  0000 C CNN
F 1 "74LS07" H 8000 1032 60  0000 C CNN
F 2 "" H 8000 850 50  0001 C CNN
F 3 "" H 8000 850 50  0001 C CNN
	1    8000 850 
	1    0    0    -1  
$EndComp
$Comp
L 74ls-sergey:74LS07 U7
U 2 1 5BEF92A5
P 8000 1750
F 0 "U7" H 8200 1650 60  0000 C CNN
F 1 "74LS07" H 8150 1550 60  0000 C CNN
F 2 "" H 8000 1750 50  0001 C CNN
F 3 "" H 8000 1750 50  0001 C CNN
	2    8000 1750
	1    0    0    -1  
$EndComp
$Comp
L 74ls-sergey:74LS07 U7
U 3 1 5BEF938C
P 8000 1450
F 0 "U7" H 7700 1650 60  0000 C CNN
F 1 "74LS07" H 7700 1550 60  0000 C CNN
F 2 "" H 8000 1450 50  0001 C CNN
F 3 "" H 8000 1450 50  0001 C CNN
	3    8000 1450
	-1   0    0    -1  
$EndComp
$Comp
L 74ls-sergey:74LS07 U7
U 4 1 5BEF9478
P 8000 1150
F 0 "U7" H 7700 1350 60  0000 C CNN
F 1 "74LS07" H 7700 1250 60  0000 C CNN
F 2 "" H 8000 1150 50  0001 C CNN
F 3 "" H 8000 1150 50  0001 C CNN
	4    8000 1150
	-1   0    0    -1  
$EndComp
Text Label 7600 850  2    50   ~ 0
BUSY
Text Label 7600 1750 2    50   ~ 0
ACK
Text Label 7600 1450 2    50   ~ 0
RESET_INIT
Text Label 7600 1150 2    50   ~ 0
STROBE
NoConn ~ 8750 4950
NoConn ~ 8750 5150
NoConn ~ 8750 6050
NoConn ~ 8750 6150
Wire Wire Line
	9500 2650 9650 2650
Wire Wire Line
	9650 2650 9650 2550
Wire Wire Line
	9500 2550 9650 2550
Connection ~ 9650 2550
Wire Wire Line
	9650 2550 9650 2450
Wire Wire Line
	9500 2450 9650 2450
Connection ~ 9650 2450
Wire Wire Line
	9650 2450 9650 2250
Wire Wire Line
	9500 2250 9650 2250
NoConn ~ 9500 2350
NoConn ~ 9000 2350
Wire Wire Line
	9000 3150 8850 3150
Wire Wire Line
	8850 3150 8850 2450
Wire Wire Line
	9000 2450 8850 2450
Connection ~ 2500 7400
Connection ~ 2500 7100
Connection ~ 2850 7400
Connection ~ 2850 7100
Connection ~ 1800 7400
Connection ~ 1800 7100
$Comp
L Device:C C8
U 1 1 5C35639E
P 1150 7250
F 0 "C8" H 1265 7296 50  0000 L CNN
F 1 ".1" H 1265 7205 50  0000 L CNN
F 2 "" H 1188 7100 50  0001 C CNN
F 3 "~" H 1150 7250 50  0001 C CNN
	1    1150 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5C35640C
P 850 7250
F 0 "C7" H 965 7296 50  0000 L CNN
F 1 ".1" H 965 7205 50  0000 L CNN
F 2 "" H 888 7100 50  0001 C CNN
F 3 "~" H 850 7250 50  0001 C CNN
	1    850  7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  7100 1150 7100
Connection ~ 1150 7100
Wire Wire Line
	1150 7100 1450 7100
Wire Wire Line
	850  7400 1150 7400
Connection ~ 1150 7400
Wire Wire Line
	1150 7400 1450 7400
Wire Wire Line
	9650 2650 9650 3300
Connection ~ 9650 2650
$Comp
L power:GND #PWR017
U 1 1 5C42F8F8
P 9650 3350
F 0 "#PWR017" H 9650 3100 50  0001 C CNN
F 1 "GND" H 9655 3177 50  0000 C CNN
F 2 "" H 9650 3350 50  0001 C CNN
F 3 "" H 9650 3350 50  0001 C CNN
	1    9650 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 3150 8850 3300
Wire Wire Line
	8850 3300 9650 3300
Connection ~ 8850 3150
Connection ~ 9650 3300
Wire Wire Line
	9650 3300 9650 3350
Wire Wire Line
	9000 2250 9000 850 
Wire Wire Line
	9000 850  8400 850 
Wire Wire Line
	8400 1150 8750 1150
Wire Wire Line
	8750 1150 8750 2550
Wire Wire Line
	8750 2550 9000 2550
Wire Wire Line
	8400 1750 8650 1750
Wire Wire Line
	8650 1750 8650 3050
Wire Wire Line
	8650 3050 9000 3050
Wire Wire Line
	8400 1450 9900 1450
Wire Wire Line
	9900 1450 9900 3150
Wire Wire Line
	9900 3150 9500 3150
Text Label 9000 2650 2    50   ~ 0
PD0
Text Label 9000 2750 2    50   ~ 0
PD2
Text Label 9000 2850 2    50   ~ 0
PD4
Text Label 9000 2950 2    50   ~ 0
PD6
Text Label 7800 2350 0    50   ~ 0
PD0
Text Label 7800 2550 0    50   ~ 0
PD2
Text Label 7800 2750 0    50   ~ 0
PD4
Text Label 7800 2950 0    50   ~ 0
PD6
Text Label 9500 2750 0    50   ~ 0
PD1
Text Label 9500 2850 0    50   ~ 0
PD3
Text Label 9500 2950 0    50   ~ 0
PD5
Text Label 9500 3050 0    50   ~ 0
PD7
Text Label 7800 2450 0    50   ~ 0
PD1
Text Label 7800 2650 0    50   ~ 0
PD3
Text Label 7800 2850 0    50   ~ 0
PD5
Text Label 7800 3050 0    50   ~ 0
PD7
NoConn ~ 8750 5950
$Comp
L 74ls-sergey:74LS07 U7
U 5 1 5C549AC0
P 9150 5750
F 0 "U7" H 9150 6038 60  0000 C CNN
F 1 "74LS07" H 9150 5932 60  0000 C CNN
F 2 "" H 9150 5750 50  0001 C CNN
F 3 "" H 9150 5750 50  0001 C CNN
	5    9150 5750
	1    0    0    -1  
$EndComp
$Comp
L 74ls-sergey:74LS07 U7
U 6 1 5C549C54
P 9850 5950
F 0 "U7" H 9850 6238 60  0000 C CNN
F 1 "74LS07" H 9850 6132 60  0000 C CNN
F 2 "" H 9850 5950 50  0001 C CNN
F 3 "" H 9850 5950 50  0001 C CNN
	6    9850 5950
	1    0    0    -1  
$EndComp
$Comp
L 74ls-sergey:74LS08 U3
U 1 1 5BF5D00D
P 3000 3250
F 0 "U3" H 3025 3547 60  0000 C CNN
F 1 "74LS08" H 3025 3441 60  0000 C CNN
F 2 "" H 3000 3250 50  0001 C CNN
F 3 "" H 3000 3250 50  0001 C CNN
	1    3000 3250
	1    0    0    -1  
$EndComp
$Comp
L 74ls-sergey:74LS32 U8
U 1 1 5BFB1455
P 2400 5100
F 0 "U8" H 2700 5250 60  0000 C CNN
F 1 "74LS32" H 2425 5291 60  0000 C CNN
F 2 "" H 2400 5100 50  0001 C CNN
F 3 "" H 2400 5100 50  0001 C CNN
	1    2400 5100
	1    0    0    -1  
$EndComp
$Comp
L 74ls-sergey:74LS08 U3
U 2 1 5BFB19FF
P 2450 3650
F 0 "U3" H 2750 3800 60  0000 C CNN
F 1 "74LS08" H 2475 3841 60  0000 C CNN
F 2 "" H 2450 3650 50  0001 C CNN
F 3 "" H 2450 3650 50  0001 C CNN
	2    2450 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 3650 3800 3650
Wire Wire Line
	3800 3650 3800 5150
Text Label 2000 5050 2    50   ~ 0
B_/IORQ
Text Label 2000 5150 2    50   ~ 0
B_/M1
Text Label 2850 5100 0    50   ~ 0
/INTACK
$Comp
L 74ls-sergey:74LS08 U3
U 3 1 5C05B34F
P 2400 6450
F 0 "U3" H 2700 6600 60  0000 C CNN
F 1 "74LS08" H 2425 6641 60  0000 C CNN
F 2 "" H 2400 6450 50  0001 C CNN
F 3 "" H 2400 6450 50  0001 C CNN
	3    2400 6450
	1    0    0    -1  
$EndComp
$Comp
L 74ls-sergey:74LS08 U3
U 4 1 5C05B438
P 2400 6100
F 0 "U3" H 2700 6250 60  0000 C CNN
F 1 "74LS08" H 2425 6291 60  0000 C CNN
F 2 "" H 2400 6100 50  0001 C CNN
F 3 "" H 2400 6100 50  0001 C CNN
	4    2400 6100
	1    0    0    -1  
$EndComp
$Comp
L 74ls-sergey:74LS32 U8
U 2 1 5C06D71E
P 5600 2500
F 0 "U8" H 5900 2650 60  0000 C CNN
F 1 "74LS32" H 5625 2691 60  0000 C CNN
F 2 "" H 5600 2500 50  0001 C CNN
F 3 "" H 5600 2500 50  0001 C CNN
	2    5600 2500
	0    1    1    0   
$EndComp
$Comp
L 74ls-sergey:74LS32 U8
U 3 1 5C06DD72
P 2150 4600
F 0 "U8" H 2450 4750 60  0000 C CNN
F 1 "74LS32" H 2175 4791 60  0000 C CNN
F 2 "" H 2150 4600 50  0001 C CNN
F 3 "" H 2150 4600 50  0001 C CNN
	3    2150 4600
	-1   0    0    -1  
$EndComp
$Comp
L 74ls-sergey:74LS32 U8
U 4 1 5C07F638
P 5550 1650
F 0 "U8" H 5850 1800 60  0000 C CNN
F 1 "74LS32" H 5575 1841 60  0000 C CNN
F 2 "" H 5550 1650 50  0001 C CNN
F 3 "" H 5550 1650 50  0001 C CNN
	4    5550 1650
	0    1    1    0   
$EndComp
Wire Wire Line
	2000 6050 2000 6150
Connection ~ 2000 6150
Wire Wire Line
	2000 6150 2000 6400
Connection ~ 2000 6400
Wire Wire Line
	2000 6400 2000 6500
Connection ~ 2000 6500
Wire Wire Line
	2000 6500 2000 6700
NoConn ~ 7000 1700
NoConn ~ 2850 6100
NoConn ~ 2850 6450
NoConn ~ 900  7250
$Comp
L Device:C C9
U 1 1 5C111596
P 600 7250
F 0 "C9" H 715 7296 50  0000 L CNN
F 1 ".1" H 715 7205 50  0000 L CNN
F 2 "" H 638 7100 50  0001 C CNN
F 3 "~" H 600 7250 50  0001 C CNN
	1    600  7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	600  7100 850  7100
Connection ~ 850  7100
Wire Wire Line
	600  7400 850  7400
Connection ~ 850  7400
Wire Wire Line
	5500 900  5500 1250
Wire Wire Line
	5500 900  5900 900 
Connection ~ 5500 900 
Text Label 5900 1250 0    50   ~ 0
B_/RD
Wire Wire Line
	5600 1250 5900 1250
Wire Wire Line
	2050 3600 2050 3400
Wire Wire Line
	2550 4650 2550 4800
Wire Wire Line
	2550 4800 2850 4800
Wire Wire Line
	2850 4800 2850 5100
Wire Wire Line
	1700 4600 1700 3700
Wire Wire Line
	1700 3700 2050 3700
Text Label 5150 5150 0    50   ~ 0
B_/IEI
$Comp
L 74xx:74LS06 U4
U 6 1 5BFF0620
P 10200 4450
F 0 "U4" H 10200 4150 50  0000 C CNN
F 1 "74LS06" H 10200 4250 50  0000 C CNN
F 2 "" H 10200 4450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS06" H 10200 4450 50  0001 C CNN
	6    10200 4450
	1    0    0    -1  
$EndComp
Connection ~ 10250 5150
Wire Wire Line
	10250 5750 10250 5950
Wire Wire Line
	8750 5850 8950 5850
Wire Wire Line
	8950 5850 8950 5950
Wire Wire Line
	8950 5950 9450 5950
Wire Wire Line
	10700 4450 10500 4450
Wire Wire Line
	5600 3400 5600 2950
Wire Wire Line
	2050 3400 5600 3400
Wire Wire Line
	5650 2100 5950 2100
Text Label 5950 2100 2    50   ~ 0
B_/IORQ
$Comp
L power:GND #PWR09
U 1 1 5CDAC11B
P 2200 1450
F 0 "#PWR09" H 2200 1200 50  0001 C CNN
F 1 "GND" H 2205 1277 50  0000 C CNN
F 2 "" H 2200 1450 50  0001 C CNN
F 3 "" H 2200 1450 50  0001 C CNN
	1    2200 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 1250 2350 1450
Wire Wire Line
	2350 1450 2200 1450
Connection ~ 2350 1250
Wire Wire Line
	2100 2650 2100 2850
Wire Wire Line
	2100 2850 2250 2850
$Comp
L 74xx:74LS06 U4
U 5 1 5CF3CC38
P 10200 3950
F 0 "U4" H 10100 4250 50  0000 C CNN
F 1 "74LS06" H 10100 4150 50  0000 C CNN
F 2 "" H 10200 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS06" H 10200 3950 50  0001 C CNN
	5    10200 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 3950 10500 3950
Text Label 2550 4550 0    50   ~ 0
*PINT
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 5CFA9A57
P 5700 6050
F 0 "J3" V 5666 5862 50  0000 R CNN
F 1 "FIRST" V 5700 6400 50  0000 R CNN
F 2 "" H 5700 6050 50  0001 C CNN
F 3 "~" H 5700 6050 50  0001 C CNN
	1    5700 6050
	0    -1   1    0   
$EndComp
Wire Wire Line
	3300 5800 3300 5850
Wire Wire Line
	3300 5850 4050 5850
Wire Wire Line
	4050 5850 4050 6500
Connection ~ 4050 5850
Wire Wire Line
	4050 5850 5700 5850
Wire Wire Line
	5800 5850 5800 5150
Connection ~ 5800 5150
Wire Wire Line
	5800 5150 6850 5150
Text Label 9900 4450 2    50   ~ 0
*PINT
Wire Wire Line
	9900 3950 9900 4200
Wire Wire Line
	9900 4200 10700 4200
Wire Wire Line
	10700 4200 10700 4450
Text Label 10700 3950 0    50   ~ 0
B_*INT
$EndSCHEMATC
