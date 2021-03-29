EESchema Schematic File Version 4
LIBS:RB_switch_pcb-cache
EELAYER 30 0
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
L Connector:Screw_Terminal_01x02 J4
U 1 1 5FED84E1
P 10300 5150
F 0 "J4" H 10380 5142 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 10380 5051 50  0000 L CNN
F 2 "Connector_Phoenix_GMSTB:PhoenixContact_GMSTBA_2,5_2-G_1x02_P7.50mm_Horizontal" H 10300 5150 50  0001 C CNN
F 3 "~" H 10300 5150 50  0001 C CNN
	1    10300 5150
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW1
U 1 1 5FEDC7C5
P 9550 5150
F 0 "SW1" H 9550 5385 50  0000 C CNN
F 1 "SW_SPST" H 9550 5294 50  0000 C CNN
F 2 "digikey-footprints:Toggle_Switch_100SP1T1B4M2QE" H 9550 5150 50  0001 C CNN
F 3 "~" H 9550 5150 50  0001 C CNN
	1    9550 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 5250 9850 5250
Wire Wire Line
	10100 5150 9750 5150
Wire Wire Line
	8900 5150 8900 5050
$Comp
L power:+5V #PWR0101
U 1 1 5FFE3341
P 1750 5050
F 0 "#PWR0101" H 1750 4900 50  0001 C CNN
F 1 "+5V" H 1765 5223 50  0000 C CNN
F 2 "" H 1750 5050 50  0001 C CNN
F 3 "" H 1750 5050 50  0001 C CNN
	1    1750 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R1
U 1 1 5FED1088
P 1750 5350
F 0 "R1" H 1818 5396 50  0000 L CNN
F 1 "10K" H 1818 5305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P20.32mm_Horizontal" V 1790 5340 50  0001 C CNN
F 3 "~" H 1750 5350 50  0001 C CNN
	1    1750 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 5050 1750 5200
$Comp
L power:+5V #PWR0102
U 1 1 60513217
P 2150 5050
F 0 "#PWR0102" H 2150 4900 50  0001 C CNN
F 1 "+5V" H 2165 5223 50  0000 C CNN
F 2 "" H 2150 5050 50  0001 C CNN
F 3 "" H 2150 5050 50  0001 C CNN
	1    2150 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R2
U 1 1 60513229
P 2150 5350
F 0 "R2" H 2218 5396 50  0000 L CNN
F 1 "10K" H 2218 5305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P20.32mm_Horizontal" V 2190 5340 50  0001 C CNN
F 3 "~" H 2150 5350 50  0001 C CNN
	1    2150 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 5050 2150 5200
$Comp
L power:+5V #PWR0103
U 1 1 60513D06
P 2500 5050
F 0 "#PWR0103" H 2500 4900 50  0001 C CNN
F 1 "+5V" H 2515 5223 50  0000 C CNN
F 2 "" H 2500 5050 50  0001 C CNN
F 3 "" H 2500 5050 50  0001 C CNN
	1    2500 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R3
U 1 1 60513D18
P 2500 5350
F 0 "R3" H 2568 5396 50  0000 L CNN
F 1 "10K" H 2568 5305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P20.32mm_Horizontal" V 2540 5340 50  0001 C CNN
F 3 "~" H 2500 5350 50  0001 C CNN
	1    2500 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 5050 2500 5200
$Comp
L power:+5V #PWR0104
U 1 1 6051501B
P 2850 5050
F 0 "#PWR0104" H 2850 4900 50  0001 C CNN
F 1 "+5V" H 2865 5223 50  0000 C CNN
F 2 "" H 2850 5050 50  0001 C CNN
F 3 "" H 2850 5050 50  0001 C CNN
	1    2850 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R4
U 1 1 6051502D
P 2850 5350
F 0 "R4" H 2918 5396 50  0000 L CNN
F 1 "10K" H 2918 5305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P20.32mm_Horizontal" V 2890 5340 50  0001 C CNN
F 3 "~" H 2850 5350 50  0001 C CNN
	1    2850 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 5050 2850 5200
$Comp
L power:+5V #PWR0105
U 1 1 605162FC
P 3200 5050
F 0 "#PWR0105" H 3200 4900 50  0001 C CNN
F 1 "+5V" H 3215 5223 50  0000 C CNN
F 2 "" H 3200 5050 50  0001 C CNN
F 3 "" H 3200 5050 50  0001 C CNN
	1    3200 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R5
U 1 1 6051630E
P 3200 5350
F 0 "R5" H 3268 5396 50  0000 L CNN
F 1 "10K" H 3268 5305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P20.32mm_Horizontal" V 3240 5340 50  0001 C CNN
F 3 "~" H 3200 5350 50  0001 C CNN
	1    3200 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 5050 3200 5200
$Comp
L power:+5V #PWR0106
U 1 1 60517389
P 3550 5050
F 0 "#PWR0106" H 3550 4900 50  0001 C CNN
F 1 "+5V" H 3565 5223 50  0000 C CNN
F 2 "" H 3550 5050 50  0001 C CNN
F 3 "" H 3550 5050 50  0001 C CNN
	1    3550 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R6
U 1 1 6051739B
P 3550 5350
F 0 "R6" H 3618 5396 50  0000 L CNN
F 1 "10K" H 3618 5305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P20.32mm_Horizontal" V 3590 5340 50  0001 C CNN
F 3 "~" H 3550 5350 50  0001 C CNN
	1    3550 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 5850 3550 5800
Wire Wire Line
	3550 5050 3550 5200
$Comp
L power:+5V #PWR0107
U 1 1 60518360
P 3900 5050
F 0 "#PWR0107" H 3900 4900 50  0001 C CNN
F 1 "+5V" H 3915 5223 50  0000 C CNN
F 2 "" H 3900 5050 50  0001 C CNN
F 3 "" H 3900 5050 50  0001 C CNN
	1    3900 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R7
U 1 1 60518372
P 3900 5350
F 0 "R7" H 3968 5396 50  0000 L CNN
F 1 "10K" H 3968 5305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P20.32mm_Horizontal" V 3940 5340 50  0001 C CNN
F 3 "~" H 3900 5350 50  0001 C CNN
	1    3900 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 5050 3900 5200
$Comp
L power:+5V #PWR0108
U 1 1 60518BC8
P 4250 5050
F 0 "#PWR0108" H 4250 4900 50  0001 C CNN
F 1 "+5V" H 4265 5223 50  0000 C CNN
F 2 "" H 4250 5050 50  0001 C CNN
F 3 "" H 4250 5050 50  0001 C CNN
	1    4250 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R10
U 1 1 60518BDA
P 4250 5350
F 0 "R10" H 4318 5396 50  0000 L CNN
F 1 "10K" H 4318 5305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P20.32mm_Horizontal" V 4290 5340 50  0001 C CNN
F 3 "~" H 4250 5350 50  0001 C CNN
	1    4250 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 5050 4250 5200
$Comp
L power:+5V #PWR0109
U 1 1 6051A511
P 4600 5050
F 0 "#PWR0109" H 4600 4900 50  0001 C CNN
F 1 "+5V" H 4615 5223 50  0000 C CNN
F 2 "" H 4600 5050 50  0001 C CNN
F 3 "" H 4600 5050 50  0001 C CNN
	1    4600 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R11
U 1 1 6051A523
P 4600 5350
F 0 "R11" H 4668 5396 50  0000 L CNN
F 1 "10K" H 4668 5305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P20.32mm_Horizontal" V 4640 5340 50  0001 C CNN
F 3 "~" H 4600 5350 50  0001 C CNN
	1    4600 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 5050 4600 5200
$Comp
L power:+5V #PWR0110
U 1 1 6051B911
P 4950 5050
F 0 "#PWR0110" H 4950 4900 50  0001 C CNN
F 1 "+5V" H 4965 5223 50  0000 C CNN
F 2 "" H 4950 5050 50  0001 C CNN
F 3 "" H 4950 5050 50  0001 C CNN
	1    4950 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R12
U 1 1 6051B923
P 4950 5350
F 0 "R12" H 5018 5396 50  0000 L CNN
F 1 "10K" H 5018 5305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P20.32mm_Horizontal" V 4990 5340 50  0001 C CNN
F 3 "~" H 4950 5350 50  0001 C CNN
	1    4950 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 5050 4950 5200
$Comp
L power:+5V #PWR0111
U 1 1 6051CD54
P 5300 5050
F 0 "#PWR0111" H 5300 4900 50  0001 C CNN
F 1 "+5V" H 5315 5223 50  0000 C CNN
F 2 "" H 5300 5050 50  0001 C CNN
F 3 "" H 5300 5050 50  0001 C CNN
	1    5300 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R13
U 1 1 6051CD66
P 5300 5350
F 0 "R13" H 5368 5396 50  0000 L CNN
F 1 "10K" H 5368 5305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P20.32mm_Horizontal" V 5340 5340 50  0001 C CNN
F 3 "~" H 5300 5350 50  0001 C CNN
	1    5300 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 5050 5300 5200
$Comp
L power:+5V #PWR0112
U 1 1 6051E453
P 5650 5050
F 0 "#PWR0112" H 5650 4900 50  0001 C CNN
F 1 "+5V" H 5665 5223 50  0000 C CNN
F 2 "" H 5650 5050 50  0001 C CNN
F 3 "" H 5650 5050 50  0001 C CNN
	1    5650 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R14
U 1 1 6051E465
P 5650 5350
F 0 "R14" H 5718 5396 50  0000 L CNN
F 1 "10K" H 5718 5305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P20.32mm_Horizontal" V 5690 5340 50  0001 C CNN
F 3 "~" H 5650 5350 50  0001 C CNN
	1    5650 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 5050 5650 5200
Text GLabel 800  5550 0    50   Input ~ 0
UP
Text GLabel 800  5650 0    50   Input ~ 0
DOWN
Text GLabel 800  5750 0    50   Input ~ 0
LEFT
Text GLabel 800  5850 0    50   Input ~ 0
RIGHT
Wire Wire Line
	800  5550 1650 5550
Wire Wire Line
	1650 5550 1650 5500
Wire Wire Line
	1650 5500 1750 5500
Connection ~ 1750 5500
Wire Wire Line
	800  5650 850  5650
Wire Wire Line
	850  5650 850  5600
Wire Wire Line
	850  5600 2150 5600
Connection ~ 2150 5600
Wire Wire Line
	2150 5600 2150 5500
Wire Wire Line
	800  5750 900  5750
Wire Wire Line
	900  5750 900  5650
Wire Wire Line
	900  5650 2500 5650
Connection ~ 2500 5650
Wire Wire Line
	2500 5650 2500 5500
Wire Wire Line
	800  5850 950  5850
Wire Wire Line
	950  5850 950  5700
Wire Wire Line
	950  5700 2850 5700
Connection ~ 2850 5700
Wire Wire Line
	2850 5700 2850 5500
Text GLabel 800  5950 0    50   Input ~ 0
Top1
Text GLabel 800  6050 0    50   Input ~ 0
Top2
Text GLabel 6100 6000 2    50   Input ~ 0
Top3
Wire Wire Line
	800  5950 1000 5950
Wire Wire Line
	1000 5950 1000 5750
Wire Wire Line
	1000 5750 3200 5750
Connection ~ 3200 5750
Wire Wire Line
	3200 5750 3200 5500
Wire Wire Line
	800  6050 1050 6050
Wire Wire Line
	1050 6050 1050 5800
Wire Wire Line
	1050 5800 3550 5800
Connection ~ 3550 5800
Wire Wire Line
	3550 5800 3550 5500
Text GLabel 6100 5900 2    50   Input ~ 0
Bottom1
Text GLabel 6100 5700 2    50   Input ~ 0
Bottom3
Text GLabel 6100 5600 2    50   Input ~ 0
Extra1
Text GLabel 6100 5500 2    50   Input ~ 0
Extra2
Wire Wire Line
	6100 5500 5650 5500
Connection ~ 5650 5500
Wire Wire Line
	6100 5600 6000 5600
Wire Wire Line
	6000 5600 6000 5550
Wire Wire Line
	6000 5550 5300 5550
Connection ~ 5300 5550
Wire Wire Line
	5300 5550 5300 5500
Text GLabel 6100 5800 2    50   Input ~ 0
Bottom2
Wire Wire Line
	6100 5700 5950 5700
Wire Wire Line
	5950 5700 5950 5600
Wire Wire Line
	5950 5600 4950 5600
Connection ~ 4950 5600
Wire Wire Line
	4950 5600 4950 5500
Wire Wire Line
	6100 5800 5900 5800
Wire Wire Line
	5900 5800 5900 5650
Wire Wire Line
	5900 5650 4600 5650
Connection ~ 4600 5650
Wire Wire Line
	4600 5650 4600 5500
Wire Wire Line
	6100 5900 6000 5900
Wire Wire Line
	6000 5900 6000 5850
Wire Wire Line
	6000 5850 5850 5850
Wire Wire Line
	5850 5850 5850 5700
Wire Wire Line
	5850 5700 4250 5700
Connection ~ 4250 5700
Wire Wire Line
	4250 5700 4250 5500
Wire Wire Line
	6100 6000 5800 6000
Wire Wire Line
	5800 6000 5800 5750
Wire Wire Line
	5800 5750 3900 5750
Connection ~ 3900 5750
Wire Wire Line
	3900 5750 3900 5500
$Comp
L Connector_Generic:Conn_02x08_Odd_Even J2
U 1 1 60587750
P 3650 6400
F 0 "J2" H 3700 6915 50  0000 C CNN
F 1 "Conn_02x08_Top_Bottom_Shielded" H 3700 6824 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x08_P2.54mm_Vertical" H 3650 6400 50  0001 C CNN
F 3 "~" H 3650 6400 50  0001 C CNN
	1    3650 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 6100 3450 6100
Wire Wire Line
	1750 5500 1750 6100
Wire Wire Line
	2150 6200 3450 6200
Wire Wire Line
	2150 5600 2150 6200
Wire Wire Line
	2500 6300 3450 6300
Wire Wire Line
	2500 5650 2500 6300
Wire Wire Line
	2850 6400 3450 6400
Wire Wire Line
	2850 5700 2850 6400
Wire Wire Line
	3200 6500 3450 6500
Wire Wire Line
	3200 5750 3200 6500
Wire Wire Line
	3550 5850 3250 5850
Wire Wire Line
	3250 5850 3250 6600
Wire Wire Line
	3250 6600 3450 6600
Wire Wire Line
	3900 5900 3300 5900
Wire Wire Line
	3300 5900 3300 6700
Wire Wire Line
	3300 6700 3450 6700
Wire Wire Line
	3900 5750 3900 5900
Wire Wire Line
	4250 6000 3350 6000
Wire Wire Line
	3350 6000 3350 6800
Wire Wire Line
	3350 6800 3450 6800
Wire Wire Line
	4250 5700 4250 6000
Wire Wire Line
	4600 6100 3950 6100
Wire Wire Line
	4600 5650 4600 6100
Wire Wire Line
	4950 6200 3950 6200
Wire Wire Line
	4950 5600 4950 6200
Wire Wire Line
	5300 6250 3950 6250
Wire Wire Line
	3950 6250 3950 6300
Wire Wire Line
	5300 5550 5300 6250
Wire Wire Line
	5650 6400 3950 6400
Wire Wire Line
	5650 5500 5650 6400
$Comp
L power:GND #PWR0113
U 1 1 605BF686
P 4000 6950
F 0 "#PWR0113" H 4000 6700 50  0001 C CNN
F 1 "GND" H 4005 6777 50  0000 C CNN
F 2 "" H 4000 6950 50  0001 C CNN
F 3 "" H 4000 6950 50  0001 C CNN
	1    4000 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 6800 4000 6800
Wire Wire Line
	4000 6800 4000 6950
$Comp
L Connector:Raspberry_Pi_2_3 J1
U 1 1 605C768D
P 2850 2350
F 0 "J1" H 2850 3831 50  0000 C CNN
F 1 "Raspberry_Pi_2_3" H 2850 3740 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x20_P2.54mm_Vertical" H 2850 2350 50  0001 C CNN
F 3 "https://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/rpi_SCH_3bplus_1p0_reduced.pdf" H 2850 2350 50  0001 C CNN
	1    2850 2350
	1    0    0    -1  
$EndComp
$Comp
L williamCustomLib:GROKStepDown U1
U 1 1 605CEC0B
P 8550 6100
F 0 "U1" H 8778 6088 50  0000 L CNN
F 1 "GROKStepDown" H 8778 5997 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 8250 6550 50  0001 C CNN
F 3 "" H 8250 6550 50  0001 C CNN
	1    8550 6100
	-1   0    0    1   
$EndComp
$Comp
L Device:D D2
U 1 1 605D3FDE
P 9200 5150
F 0 "D2" H 9200 5366 50  0000 C CNN
F 1 "D" H 9200 5275 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P10.16mm_Horizontal" H 9200 5150 50  0001 C CNN
F 3 "~" H 9200 5150 50  0001 C CNN
	1    9200 5150
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0114
U 1 1 605DC221
P 8900 5050
F 0 "#PWR0114" H 8900 4900 50  0001 C CNN
F 1 "+12V" H 8915 5223 50  0000 C CNN
F 2 "" H 8900 5050 50  0001 C CNN
F 3 "" H 8900 5050 50  0001 C CNN
	1    8900 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 5150 9050 5150
$Comp
L power:GND #PWR0115
U 1 1 605EC1A7
P 8600 5800
F 0 "#PWR0115" H 8600 5550 50  0001 C CNN
F 1 "GND" H 8605 5627 50  0000 C CNN
F 2 "" H 8600 5800 50  0001 C CNN
F 3 "" H 8600 5800 50  0001 C CNN
	1    8600 5800
	-1   0    0    1   
$EndComp
Wire Wire Line
	8600 5850 8600 5800
$Comp
L power:+12V #PWR0116
U 1 1 605F89C5
P 8500 5650
F 0 "#PWR0116" H 8500 5500 50  0001 C CNN
F 1 "+12V" H 8515 5823 50  0000 C CNN
F 2 "" H 8500 5650 50  0001 C CNN
F 3 "" H 8500 5650 50  0001 C CNN
	1    8500 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 5650 8500 5850
$Comp
L power:+5V #PWR0117
U 1 1 60603587
P 8700 5650
F 0 "#PWR0117" H 8700 5500 50  0001 C CNN
F 1 "+5V" H 8715 5823 50  0000 C CNN
F 2 "" H 8700 5650 50  0001 C CNN
F 3 "" H 8700 5650 50  0001 C CNN
	1    8700 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 5650 8700 5850
Wire Wire Line
	2850 3650 2850 3700
$Comp
L power:GND #PWR0118
U 1 1 60615191
P 2850 3700
F 0 "#PWR0118" H 2850 3450 50  0001 C CNN
F 1 "GND" H 2855 3527 50  0000 C CNN
F 2 "" H 2850 3700 50  0001 C CNN
F 3 "" H 2850 3700 50  0001 C CNN
	1    2850 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 3650 2550 3650
Connection ~ 2550 3650
Wire Wire Line
	2550 3650 2650 3650
Connection ~ 2650 3650
Wire Wire Line
	2650 3650 2750 3650
Connection ~ 2750 3650
Wire Wire Line
	2750 3650 2850 3650
Connection ~ 2850 3650
Wire Wire Line
	2850 3650 2950 3650
Connection ~ 2950 3650
Wire Wire Line
	2950 3650 3050 3650
Connection ~ 3050 3650
Wire Wire Line
	3050 3650 3150 3650
$Comp
L power:+5V #PWR0119
U 1 1 60636611
P 2650 850
F 0 "#PWR0119" H 2650 700 50  0001 C CNN
F 1 "+5V" H 2665 1023 50  0000 C CNN
F 2 "" H 2650 850 50  0001 C CNN
F 3 "" H 2650 850 50  0001 C CNN
	1    2650 850 
	1    0    0    -1  
$EndComp
Text GLabel 3650 2050 2    50   Input ~ 0
UP
Text GLabel 3650 2150 2    50   Input ~ 0
DOWN
Text GLabel 3650 2250 2    50   Input ~ 0
LEFT
Text GLabel 3650 3050 2    50   Input ~ 0
RIGHT
Text GLabel 3650 3150 2    50   Input ~ 0
Top1
Text GLabel 2050 1750 0    50   Input ~ 0
Top2
Text GLabel 2050 1850 0    50   Input ~ 0
Top3
Text GLabel 2050 2750 0    50   Input ~ 0
Bottom3
Text GLabel 2050 2650 0    50   Input ~ 0
Bottom2
Text GLabel 2050 2550 0    50   Input ~ 0
Bottom1
Text GLabel 2050 2850 0    50   Input ~ 0
Extra1
Text GLabel 2050 2950 0    50   Input ~ 0
Extra2
Text GLabel 7450 2700 2    50   Input ~ 0
RelayOut
Wire Wire Line
	2650 850  2650 1050
Wire Wire Line
	2650 1050 2750 1050
Connection ~ 2650 1050
Wire Wire Line
	9850 5250 9850 5450
$Comp
L power:GND #PWR0120
U 1 1 5FEDD38A
P 9850 5450
F 0 "#PWR0120" H 9850 5200 50  0001 C CNN
F 1 "GND" H 9855 5277 50  0000 C CNN
F 2 "" H 9850 5450 50  0001 C CNN
F 3 "" H 9850 5450 50  0001 C CNN
	1    9850 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDS Q1
U 1 1 606EF366
P 7100 3000
F 0 "Q1" H 7306 3046 50  0000 L CNN
F 1 "Q_NMOS_GDS" H 7306 2955 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 7300 3100 50  0001 C CNN
F 3 "~" H 7100 3000 50  0001 C CNN
	1    7100 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R8
U 1 1 606F1656
P 6450 3000
F 0 "R8" V 6245 3000 50  0000 C CNN
F 1 "220" V 6336 3000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P20.32mm_Horizontal" V 6490 2990 50  0001 C CNN
F 3 "~" H 6450 3000 50  0001 C CNN
	1    6450 3000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 606F6EEF
P 7200 3450
F 0 "#PWR0121" H 7200 3200 50  0001 C CNN
F 1 "GND" H 7205 3277 50  0000 C CNN
F 2 "" H 7200 3450 50  0001 C CNN
F 3 "" H 7200 3450 50  0001 C CNN
	1    7200 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 3450 7200 3200
Wire Wire Line
	6600 3000 6700 3000
$Comp
L Device:R_US R9
U 1 1 6070F3CF
P 6700 3250
F 0 "R9" H 6632 3204 50  0000 R CNN
F 1 "10k" H 6632 3295 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P20.32mm_Horizontal" V 6740 3240 50  0001 C CNN
F 3 "~" H 6700 3250 50  0001 C CNN
	1    6700 3250
	-1   0    0    1   
$EndComp
Wire Wire Line
	6700 3100 6700 3000
Connection ~ 6700 3000
Wire Wire Line
	6700 3000 6900 3000
Wire Wire Line
	6700 3400 6700 3450
Wire Wire Line
	6700 3450 7200 3450
Connection ~ 7200 3450
$Comp
L Device:D D1
U 1 1 6071A181
P 7200 2550
F 0 "D1" V 7154 2629 50  0000 L CNN
F 1 "D" V 7245 2629 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P10.16mm_Horizontal" H 7200 2550 50  0001 C CNN
F 3 "~" H 7200 2550 50  0001 C CNN
	1    7200 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	7450 2700 7200 2700
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 60744910
P 10300 4600
F 0 "J3" H 10380 4592 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 10380 4501 50  0000 L CNN
F 2 "Connector_Phoenix_GMSTB:PhoenixContact_GMSTBA_2,5_2-G_1x02_P7.50mm_Horizontal" H 10300 4600 50  0001 C CNN
F 3 "~" H 10300 4600 50  0001 C CNN
	1    10300 4600
	1    0    0    -1  
$EndComp
Text GLabel 10050 4600 0    50   Input ~ 0
RelayOut
Wire Wire Line
	10050 4600 10100 4600
$Comp
L power:+12V #PWR0122
U 1 1 6074A5C1
P 9900 4700
F 0 "#PWR0122" H 9900 4550 50  0001 C CNN
F 1 "+12V" V 9915 4828 50  0000 L CNN
F 2 "" H 9900 4700 50  0001 C CNN
F 3 "" H 9900 4700 50  0001 C CNN
	1    9900 4700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9900 4700 10100 4700
$Comp
L power:+12V #PWR0123
U 1 1 60755DC2
P 7200 2400
F 0 "#PWR0123" H 7200 2250 50  0001 C CNN
F 1 "+12V" H 7215 2573 50  0000 C CNN
F 2 "" H 7200 2400 50  0001 C CNN
F 3 "" H 7200 2400 50  0001 C CNN
	1    7200 2400
	1    0    0    -1  
$EndComp
Connection ~ 7200 2700
Wire Wire Line
	7200 2700 7200 2800
$Comp
L 74xx_IEEE:74125 U2
U 1 1 60518F6B
P 5800 3000
F 0 "U2" H 5800 3466 50  0000 C CNN
F 1 "74125" H 5800 3375 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 5800 3000 50  0001 C CNN
F 3 "" H 5800 3000 50  0001 C CNN
	1    5800 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 6051A232
P 5300 2900
F 0 "#PWR0124" H 5300 2650 50  0001 C CNN
F 1 "GND" H 5305 2727 50  0000 C CNN
F 2 "" H 5300 2900 50  0001 C CNN
F 3 "" H 5300 2900 50  0001 C CNN
	1    5300 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 3100 5300 3100
Text GLabel 2050 3050 0    50   Input ~ 0
RelayOut
Text GLabel 4800 3100 0    50   Input ~ 0
RelayOut
$Comp
L power:+5V #PWR0125
U 1 1 60584AE6
P 5800 2400
F 0 "#PWR0125" H 5800 2250 50  0001 C CNN
F 1 "+5V" H 5815 2573 50  0000 C CNN
F 2 "" H 5800 2400 50  0001 C CNN
F 3 "" H 5800 2400 50  0001 C CNN
	1    5800 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 2400 5800 2750
$Comp
L power:GND #PWR0126
U 1 1 6058C485
P 5800 3400
F 0 "#PWR0126" H 5800 3150 50  0001 C CNN
F 1 "GND" H 5805 3227 50  0000 C CNN
F 2 "" H 5800 3400 50  0001 C CNN
F 3 "" H 5800 3400 50  0001 C CNN
	1    5800 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 3400 5800 3250
$Comp
L Connector:Screw_Terminal_01x02 J5
U 1 1 6059AC6A
P 10300 4050
F 0 "J5" H 10380 4042 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 10380 3951 50  0000 L CNN
F 2 "Connector_Phoenix_GMSTB:PhoenixContact_GMSTBA_2,5_2-G_1x02_P7.50mm_Horizontal" H 10300 4050 50  0001 C CNN
F 3 "~" H 10300 4050 50  0001 C CNN
	1    10300 4050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0127
U 1 1 6059B18B
P 10100 4050
F 0 "#PWR0127" H 10100 3900 50  0001 C CNN
F 1 "+5V" H 10115 4223 50  0000 C CNN
F 2 "" H 10100 4050 50  0001 C CNN
F 3 "" H 10100 4050 50  0001 C CNN
	1    10100 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0128
U 1 1 6059BB95
P 10100 4150
F 0 "#PWR0128" H 10100 3900 50  0001 C CNN
F 1 "GND" H 10105 3977 50  0000 C CNN
F 2 "" H 10100 4150 50  0001 C CNN
F 3 "" H 10100 4150 50  0001 C CNN
	1    10100 4150
	1    0    0    -1  
$EndComp
$EndSCHEMATC
