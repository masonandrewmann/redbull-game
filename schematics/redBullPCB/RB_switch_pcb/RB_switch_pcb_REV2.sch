EESchema Schematic File Version 4
LIBS:RB_switch_pcb_REV2-cache
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
P 2300 6300
F 0 "J4" H 2380 6292 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 2380 6201 50  0000 L CNN
F 2 "Connector_Phoenix_GMSTB:PhoenixContact_GMSTBA_2,5_2-G_1x02_P7.50mm_Horizontal" H 2300 6300 50  0001 C CNN
F 3 "~" H 2300 6300 50  0001 C CNN
	1    2300 6300
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_SPST SW1
U 1 1 5FEDC7C5
P 2750 6200
F 0 "SW1" H 2750 6435 50  0000 C CNN
F 1 "SW_SPST" H 2750 6344 50  0000 C CNN
F 2 "digikey-footprints:Toggle_Switch_100SP1T1B4M2QE" H 2750 6200 50  0001 C CNN
F 3 "~" H 2750 6200 50  0001 C CNN
	1    2750 6200
	-1   0    0    1   
$EndComp
Text GLabel 6400 4200 0    50   Input ~ 0
UP
Text GLabel 6400 4300 0    50   Input ~ 0
DOWN
Text GLabel 6400 4400 0    50   Input ~ 0
LEFT
Text GLabel 6400 4500 0    50   Input ~ 0
RIGHT
Text GLabel 6400 4600 0    50   Input ~ 0
Top1
Text GLabel 6400 4700 0    50   Input ~ 0
Top2
Text GLabel 6400 4800 0    50   Input ~ 0
Top3
Text GLabel 6400 4900 0    50   Input ~ 0
Bottom1
Text GLabel 6900 4800 2    50   Input ~ 0
Bottom3
Text GLabel 6900 4700 2    50   Input ~ 0
Extra1
Text GLabel 6900 4600 2    50   Input ~ 0
Extra2
Text GLabel 6900 4900 2    50   Input ~ 0
Bottom2
$Comp
L Connector_Generic:Conn_02x08_Odd_Even J2
U 1 1 60587750
P 6600 4500
F 0 "J2" H 6650 5015 50  0000 C CNN
F 1 "Conn_02x08_Top_Bottom_Shielded" H 6650 4924 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x08_P2.54mm_Vertical" H 6600 4500 50  0001 C CNN
F 3 "~" H 6600 4500 50  0001 C CNN
	1    6600 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 605BF686
P 6900 4200
F 0 "#PWR0113" H 6900 3950 50  0001 C CNN
F 1 "GND" H 6905 4027 50  0000 C CNN
F 2 "" H 6900 4200 50  0001 C CNN
F 3 "" H 6900 4200 50  0001 C CNN
	1    6900 4200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5FEDD38A
P 4150 6950
F 0 "#PWR0120" H 4150 6700 50  0001 C CNN
F 1 "GND" H 4155 6777 50  0000 C CNN
F 2 "" H 4150 6950 50  0001 C CNN
F 3 "" H 4150 6950 50  0001 C CNN
	1    4150 6950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 60744910
P 3850 5100
F 0 "J3" H 3930 5092 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 3930 5001 50  0000 L CNN
F 2 "Connector_Phoenix_GMSTB:PhoenixContact_GMSTBA_2,5_2-G_1x02_P7.50mm_Horizontal" H 3850 5100 50  0001 C CNN
F 3 "~" H 3850 5100 50  0001 C CNN
	1    3850 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 5200 3650 5200
$Comp
L power:GND #PWR0124
U 1 1 6051A232
P 2150 5000
F 0 "#PWR0124" H 2150 4750 50  0001 C CNN
F 1 "GND" H 2155 4827 50  0000 C CNN
F 2 "" H 2150 5000 50  0001 C CNN
F 3 "" H 2150 5000 50  0001 C CNN
	1    2150 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 5200 2150 5200
Text GLabel 1650 5200 0    50   Input ~ 0
RelayOut
$Comp
L power:+5V #PWR0125
U 1 1 60584AE6
P 2650 4500
F 0 "#PWR0125" H 2650 4350 50  0001 C CNN
F 1 "+5V" H 2665 4673 50  0000 C CNN
F 2 "" H 2650 4500 50  0001 C CNN
F 3 "" H 2650 4500 50  0001 C CNN
	1    2650 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 4500 2650 4850
$Comp
L power:GND #PWR0126
U 1 1 6058C485
P 2650 5500
F 0 "#PWR0126" H 2650 5250 50  0001 C CNN
F 1 "GND" H 2655 5327 50  0000 C CNN
F 2 "" H 2650 5500 50  0001 C CNN
F 3 "" H 2650 5500 50  0001 C CNN
	1    2650 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 5500 2650 5350
$Comp
L power:GND #PWR0101
U 1 1 616EBA00
P 1350 1250
F 0 "#PWR0101" H 1350 1000 50  0001 C CNN
F 1 "GND" H 1355 1077 50  0000 C CNN
F 2 "" H 1350 1250 50  0001 C CNN
F 3 "" H 1350 1250 50  0001 C CNN
	1    1350 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 1250 1550 1250
$Comp
L power:+5V #PWR0102
U 1 1 616FF859
P 3750 3550
F 0 "#PWR0102" H 3750 3400 50  0001 C CNN
F 1 "+5V" H 3765 3723 50  0000 C CNN
F 2 "" H 3750 3550 50  0001 C CNN
F 3 "" H 3750 3550 50  0001 C CNN
	1    3750 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 3550 3550 3550
$Comp
L power:GND #PWR0103
U 1 1 61703BC5
P 3750 2750
F 0 "#PWR0103" H 3750 2500 50  0001 C CNN
F 1 "GND" H 3755 2577 50  0000 C CNN
F 2 "" H 3750 2750 50  0001 C CNN
F 3 "" H 3750 2750 50  0001 C CNN
	1    3750 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 2750 3550 2750
$Comp
L power:+5V #PWR0104
U 1 1 6170ADE3
P 4150 6200
F 0 "#PWR0104" H 4150 6050 50  0001 C CNN
F 1 "+5V" H 4165 6373 50  0000 C CNN
F 2 "" H 4150 6200 50  0001 C CNN
F 3 "" H 4150 6200 50  0001 C CNN
	1    4150 6200
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_B J1
U 1 1 6170F876
P 5600 1300
F 0 "J1" V 5611 1630 50  0000 L CNN
F 1 "USB_B" V 5702 1630 50  0000 L CNN
F 2 "Connector_USB:USB_B_TE_5787834_Vertical" H 5750 1250 50  0001 C CNN
F 3 " ~" H 5750 1250 50  0001 C CNN
	1    5600 1300
	-1   0    0    1   
$EndComp
$Comp
L Device:Fuse F1
U 1 1 616ECB05
P 3500 6200
F 0 "F1" V 3303 6200 50  0000 C CNN
F 1 "Fuse" V 3394 6200 50  0000 C CNN
F 2 "Fuse:Fuseholder_Cylinder-6.3x32mm_Schurter_0031-8002_Horizontal_Open" V 3430 6200 50  0001 C CNN
F 3 "~" H 3500 6200 50  0001 C CNN
	1    3500 6200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3350 6200 3250 6200
$Comp
L teensy:Teensy3.2 U1
U 1 1 616F5909
P 2550 2600
F 0 "U1" H 2550 4237 60  0000 C CNN
F 1 "Teensy3.2" H 2550 4131 60  0000 C CNN
F 2 "teensy:Teensy30_31_32_LC" H 2550 1850 60  0001 C CNN
F 3 "" H 2550 1850 60  0000 C CNN
	1    2550 2600
	1    0    0    -1  
$EndComp
Text GLabel 1550 2550 0    50   Input ~ 0
UP
Text GLabel 1550 2450 0    50   Input ~ 0
DOWN
Text GLabel 1550 2350 0    50   Input ~ 0
LEFT
Text GLabel 1550 2250 0    50   Input ~ 0
RIGHT
Text GLabel 1550 2150 0    50   Input ~ 0
Top1
Text GLabel 1550 2050 0    50   Input ~ 0
Top2
Text GLabel 1550 1950 0    50   Input ~ 0
Top3
Text GLabel 1550 1850 0    50   Input ~ 0
Bottom1
Text GLabel 1550 1650 0    50   Input ~ 0
Bottom3
Text GLabel 1550 1550 0    50   Input ~ 0
Extra1
Text GLabel 1550 3250 0    50   Input ~ 0
Extra2
Text GLabel 1550 1750 0    50   Input ~ 0
Bottom2
$Comp
L 74xx_IEEE:74125 U2
U 1 1 60518F6B
P 2650 5100
F 0 "U2" H 2650 5566 50  0000 C CNN
F 1 "74125" H 2650 5475 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 2650 5100 50  0001 C CNN
F 3 "" H 2650 5100 50  0001 C CNN
	1    2650 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R1
U 1 1 6171457C
P 3250 5100
F 0 "R1" V 3045 5100 50  0000 C CNN
F 1 "220" V 3136 5100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 3250 5100 50  0001 C CNN
F 3 "~" H 3250 5100 50  0001 C CNN
	1    3250 5100
	0    1    1    0   
$EndComp
Text GLabel 1550 3350 0    50   Input ~ 0
RelayOut
$Comp
L power:GND #PWR0105
U 1 1 6171E2DD
P 5600 900
F 0 "#PWR0105" H 5600 650 50  0001 C CNN
F 1 "GND" H 5605 727 50  0000 C CNN
F 2 "" H 5600 900 50  0001 C CNN
F 3 "" H 5600 900 50  0001 C CNN
	1    5600 900 
	-1   0    0    1   
$EndComp
Wire Wire Line
	3350 5100 3650 5100
$Comp
L power:GND #PWR0106
U 1 1 617307C8
P 3450 5200
F 0 "#PWR0106" H 3450 4950 50  0001 C CNN
F 1 "GND" H 3455 5027 50  0000 C CNN
F 2 "" H 3450 5200 50  0001 C CNN
F 3 "" H 3450 5200 50  0001 C CNN
	1    3450 5200
	1    0    0    -1  
$EndComp
Text Notes 3600 4950 0    50   ~ 10
TO RELAY MODULE
$Comp
L dk_Transistors-Bipolar-BJT-Single:TIP142 Q1
U 1 1 61736C67
P 4050 6650
F 0 "Q1" H 4238 6703 60  0000 L CNN
F 1 "TIP142" H 4238 6597 60  0000 L CNN
F 2 "digikey-footprints:TO-247-3" H 4250 6850 60  0001 L CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/ec/61/1c/fd/4c/fe/48/b5/CD00000914.pdf/files/CD00000914.pdf/jcr:content/translations/en.CD00000914.pdf" H 4250 6950 60  0001 L CNN
F 4 "497-2541-5-ND" H 4250 7050 60  0001 L CNN "Digi-Key_PN"
F 5 "TIP142" H 4250 7150 60  0001 L CNN "MPN"
F 6 "Discrete Semiconductor Products" H 4250 7250 60  0001 L CNN "Category"
F 7 "Transistors - Bipolar (BJT) - Single" H 4250 7350 60  0001 L CNN "Family"
F 8 "http://www.st.com/content/ccc/resource/technical/document/datasheet/ec/61/1c/fd/4c/fe/48/b5/CD00000914.pdf/files/CD00000914.pdf/jcr:content/translations/en.CD00000914.pdf" H 4250 7450 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/stmicroelectronics/TIP142/497-2541-5-ND/603566" H 4250 7550 60  0001 L CNN "DK_Detail_Page"
F 10 "TRANS NPN DARL 100V 10A TO-247" H 4250 7650 60  0001 L CNN "Description"
F 11 "STMicroelectronics" H 4250 7750 60  0001 L CNN "Manufacturer"
F 12 "Active" H 4250 7850 60  0001 L CNN "Status"
	1    4050 6650
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener D2
U 1 1 61747EC6
P 3700 6450
F 0 "D2" V 3654 6529 50  0000 L CNN
F 1 "D_Zener" V 3745 6529 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P10.16mm_Horizontal" H 3700 6450 50  0001 C CNN
F 3 "~" H 3700 6450 50  0001 C CNN
	1    3700 6450
	0    1    1    0   
$EndComp
Wire Wire Line
	3650 6200 3700 6200
Wire Wire Line
	4150 6200 4150 6350
Wire Wire Line
	3700 6650 3700 6600
Wire Wire Line
	3700 6300 3700 6200
Connection ~ 3700 6200
Wire Wire Line
	3700 6200 4150 6200
$Comp
L Device:R_Small_US R2
U 1 1 6175B8A5
P 3700 6850
F 0 "R2" V 3495 6850 50  0000 C CNN
F 1 "220" V 3586 6850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 3700 6850 50  0001 C CNN
F 3 "~" H 3700 6850 50  0001 C CNN
	1    3700 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 6750 3700 6650
Connection ~ 3700 6650
Wire Wire Line
	3700 6950 4150 6950
Connection ~ 4150 6200
Connection ~ 4150 6950
Text Notes 1200 6100 0    50   ~ 10
Meanwell 5v 3a power supply\nLPV-20-5\n
$Comp
L power:GND #PWR0107
U 1 1 616F664A
P 2600 6350
F 0 "#PWR0107" H 2600 6100 50  0001 C CNN
F 1 "GND" H 2605 6177 50  0000 C CNN
F 2 "" H 2600 6350 50  0001 C CNN
F 3 "" H 2600 6350 50  0001 C CNN
	1    2600 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 6350 2600 6300
Wire Wire Line
	2600 6300 2500 6300
$Comp
L Device:D_Schottky D1
U 1 1 61700992
P 3100 6200
F 0 "D1" H 3100 5984 50  0000 C CNN
F 1 "D_Schottky" H 3100 6075 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P10.16mm_Horizontal" H 3100 6200 50  0001 C CNN
F 3 "~" H 3100 6200 50  0001 C CNN
	1    3100 6200
	-1   0    0    1   
$EndComp
Wire Wire Line
	2550 6200 2500 6200
$Comp
L power:GND #PWR0108
U 1 1 6173B758
P 5700 900
F 0 "#PWR0108" H 5700 650 50  0001 C CNN
F 1 "GND" H 5705 727 50  0000 C CNN
F 2 "" H 5700 900 50  0001 C CNN
F 3 "" H 5700 900 50  0001 C CNN
	1    5700 900 
	-1   0    0    1   
$EndComp
$Comp
L Connector:USB_A J5
U 1 1 61711A57
P 4700 1300
F 0 "J5" H 4471 1197 50  0000 R CNN
F 1 "USB_A" H 4471 1288 50  0000 R CNN
F 2 "Connector_USB:USB_A_Stewart_SS-52100-001_Horizontal" H 4850 1250 50  0001 C CNN
F 3 " ~" H 4850 1250 50  0001 C CNN
	1    4700 1300
	1    0    0    1   
$EndComp
Wire Wire Line
	5000 1200 5300 1200
Wire Wire Line
	5000 1300 5300 1300
$Comp
L power:GND #PWR0109
U 1 1 61714177
P 4600 900
F 0 "#PWR0109" H 4600 650 50  0001 C CNN
F 1 "GND" H 4605 727 50  0000 C CNN
F 2 "" H 4600 900 50  0001 C CNN
F 3 "" H 4600 900 50  0001 C CNN
	1    4600 900 
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 6171417D
P 4700 900
F 0 "#PWR0110" H 4700 650 50  0001 C CNN
F 1 "GND" H 4705 727 50  0000 C CNN
F 2 "" H 4700 900 50  0001 C CNN
F 3 "" H 4700 900 50  0001 C CNN
	1    4700 900 
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 6172B24A
P 6900 4300
F 0 "#PWR0111" H 6900 4050 50  0001 C CNN
F 1 "GND" H 6905 4127 50  0000 C CNN
F 2 "" H 6900 4300 50  0001 C CNN
F 3 "" H 6900 4300 50  0001 C CNN
	1    6900 4300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 6172B56C
P 6900 4400
F 0 "#PWR0112" H 6900 4150 50  0001 C CNN
F 1 "GND" H 6905 4227 50  0000 C CNN
F 2 "" H 6900 4400 50  0001 C CNN
F 3 "" H 6900 4400 50  0001 C CNN
	1    6900 4400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 6172B8BD
P 6900 4500
F 0 "#PWR0114" H 6900 4250 50  0001 C CNN
F 1 "GND" H 6905 4327 50  0000 C CNN
F 2 "" H 6900 4500 50  0001 C CNN
F 3 "" H 6900 4500 50  0001 C CNN
	1    6900 4500
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
