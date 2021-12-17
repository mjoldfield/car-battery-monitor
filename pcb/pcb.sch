EESchema Schematic File Version 4
LIBS:pcb-cache
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
L Device:Varistor RV1
U 1 1 61974F81
P 3400 2350
F 0 "RV1" H 3503 2396 50  0000 L CNN
F 1 "Varistor" H 3503 2305 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.42x2.65mm_HandSolder" V 3330 2350 50  0001 C CNN
F 3 "~" H 3400 2350 50  0001 C CNN
	1    3400 2350
	1    0    0    -1  
$EndComp
$Comp
L Diode:B250 D1
U 1 1 619759AB
P 2500 2000
F 0 "D1" H 2500 1784 50  0000 C CNN
F 1 "B250" H 2500 1875 50  0000 C CNN
F 2 "Diode_SMD:D_SMB" H 2500 1825 50  0001 C CNN
F 3 "http://www.jameco.com/Jameco/Products/ProdDS/1538777.pdf" H 2500 2000 50  0001 C CNN
	1    2500 2000
	-1   0    0    1   
$EndComp
$Comp
L Device:Polyfuse F1
U 1 1 61978160
P 3050 2000
F 0 "F1" V 2825 2000 50  0000 C CNN
F 1 "Polyfuse" V 2916 2000 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3100 1800 50  0001 L CNN
F 3 "~" H 3050 2000 50  0001 C CNN
	1    3050 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	2650 2000 2900 2000
Wire Wire Line
	3200 2000 3400 2000
Wire Wire Line
	3400 2000 3400 2200
Wire Wire Line
	3400 2500 3400 2800
Wire Wire Line
	3400 2800 4250 2800
$Comp
L local:PololuDCDC600 U1
U 1 1 6197BB9B
P 4250 2000
F 0 "U1" H 4250 2242 50  0000 C CNN
F 1 "PololuDCDC600" H 4250 2151 50  0000 C CNN
F 2 "pcb:PololuDCDC4" H 4275 1850 50  0001 L CIN
F 3 "" H 4250 1950 50  0001 C CNN
	1    4250 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2000 3650 2000
Connection ~ 3400 2000
Wire Wire Line
	4250 2400 4250 2800
Wire Wire Line
	3400 2800 2350 2800
Connection ~ 3400 2800
Wire Wire Line
	4250 2800 4650 2800
Connection ~ 4250 2800
Text GLabel 4750 2800 2    50   Input ~ 0
GND
Text GLabel 4750 2000 2    50   Input ~ 0
3V3
Wire Wire Line
	4550 2000 4650 2000
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 6197D42F
P 2150 2450
F 0 "J1" H 2068 2125 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 2068 2216 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 2150 2450 50  0001 C CNN
F 3 "~" H 2150 2450 50  0001 C CNN
	1    2150 2450
	-1   0    0    1   
$EndComp
Wire Wire Line
	2350 2000 2350 2350
Wire Wire Line
	2350 2450 2350 2800
Text GLabel 4750 1650 2    50   Input ~ 0
BATT
Wire Wire Line
	4750 1650 3650 1650
Wire Wire Line
	3650 1650 3650 2000
Connection ~ 3650 2000
Wire Wire Line
	3650 2000 3400 2000
Wire Notes Line
	1600 1400 1600 3050
Wire Notes Line
	1600 3050 5150 3050
Wire Notes Line
	5150 3050 5150 1400
Wire Notes Line
	5150 1400 1600 1400
Text Notes 1650 1350 0    50   ~ 0
POWER SUPPLY\n
Wire Notes Line
	1600 3350 5150 3350
Wire Notes Line
	5150 3350 5150 4700
Wire Notes Line
	5150 4700 1600 4700
Wire Notes Line
	1600 4700 1600 3350
Text Notes 1650 3400 0    50   ~ 0
VOLTAGE SENSE\n\n
Text GLabel 1950 3550 0    50   Input ~ 0
BATT
Text GLabel 1950 4500 0    50   Input ~ 0
GND
$Comp
L Device:R R1
U 1 1 61981109
P 2300 3750
F 0 "R1" H 2370 3796 50  0000 L CNN
F 1 "R" H 2370 3705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2230 3750 50  0001 C CNN
F 3 "~" H 2300 3750 50  0001 C CNN
	1    2300 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 619819BE
P 2300 4200
F 0 "R2" H 2370 4246 50  0000 L CNN
F 1 "R" H 2370 4155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2230 4200 50  0001 C CNN
F 3 "~" H 2300 4200 50  0001 C CNN
	1    2300 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 61982081
P 2600 4200
F 0 "C1" H 2715 4246 50  0000 L CNN
F 1 "C" H 2715 4155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2638 4050 50  0001 C CNN
F 3 "~" H 2600 4200 50  0001 C CNN
	1    2600 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 3600 2300 3550
Wire Wire Line
	2300 3550 1950 3550
Wire Wire Line
	2300 3900 2300 4000
Wire Wire Line
	1950 4500 2300 4500
Wire Wire Line
	2300 4500 2300 4350
Wire Wire Line
	2300 4500 2600 4500
Wire Wire Line
	2600 4500 2600 4350
Connection ~ 2300 4500
Wire Wire Line
	2300 4000 2600 4000
Wire Wire Line
	2600 4000 2600 4050
Connection ~ 2300 4000
Wire Wire Line
	2300 4000 2300 4050
Text GLabel 3000 4000 2    50   Input ~ 0
ADC
Wire Wire Line
	2600 4000 2850 4000
Connection ~ 2600 4000
Wire Notes Line
	5350 1400 5350 4700
Wire Notes Line
	5350 4700 8250 4700
Wire Notes Line
	8250 4700 8250 1400
Wire Notes Line
	8250 1400 5350 1400
Text Notes 5400 1350 0    50   ~ 0
TINYS2\n
$Comp
L local:TINYS2 U2
U 1 1 61985481
P 6300 2600
F 0 "U2" H 6800 2867 50  0000 C CNN
F 1 "TINYS2" H 6800 2776 50  0000 C CNN
F 2 "pcb:TINYS2" H 6300 2600 50  0001 C CNN
F 3 "" H 6300 2600 50  0001 C CNN
	1    6300 2600
	1    0    0    -1  
$EndComp
Text GLabel 6300 3500 0    50   Input ~ 0
GND
Text GLabel 7300 2700 2    50   Input ~ 0
GND
Text GLabel 7300 2900 2    50   Input ~ 0
3V3
NoConn ~ 7300 2600
NoConn ~ 7300 2800
$Comp
L Connector:TestPoint TP16
U 1 1 6198996B
P 7650 3100
F 0 "TP16" V 7650 3288 50  0000 L CNN
F 1 "TestPoint" V 7695 3288 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 7850 3100 50  0001 C CNN
F 3 "~" H 7850 3100 50  0001 C CNN
	1    7650 3100
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP17
U 1 1 6198A866
P 7650 3200
F 0 "TP17" V 7650 3388 50  0000 L CNN
F 1 "TestPoint" V 7695 3388 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 7850 3200 50  0001 C CNN
F 3 "~" H 7850 3200 50  0001 C CNN
	1    7650 3200
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP18
U 1 1 6198AB76
P 7650 3300
F 0 "TP18" V 7650 3488 50  0000 L CNN
F 1 "TestPoint" V 7695 3488 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 7850 3300 50  0001 C CNN
F 3 "~" H 7850 3300 50  0001 C CNN
	1    7650 3300
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP19
U 1 1 6198B067
P 7650 3400
F 0 "TP19" V 7650 3588 50  0000 L CNN
F 1 "TestPoint" V 7695 3588 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 7850 3400 50  0001 C CNN
F 3 "~" H 7850 3400 50  0001 C CNN
	1    7650 3400
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP14
U 1 1 6198B63A
P 5950 3700
F 0 "TP14" V 5950 3950 50  0000 C CNN
F 1 "TestPoint" V 6054 3772 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 6150 3700 50  0001 C CNN
F 3 "~" H 6150 3700 50  0001 C CNN
	1    5950 3700
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP13
U 1 1 6198BD7E
P 5950 3600
F 0 "TP13" V 5950 3850 50  0000 C CNN
F 1 "TestPoint" V 6054 3672 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 6150 3600 50  0001 C CNN
F 3 "~" H 6150 3600 50  0001 C CNN
	1    5950 3600
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP11
U 1 1 6198BEA1
P 5950 3300
F 0 "TP11" V 5950 3550 50  0000 C CNN
F 1 "TestPoint" V 6054 3372 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 6150 3300 50  0001 C CNN
F 3 "~" H 6150 3300 50  0001 C CNN
	1    5950 3300
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP10
U 1 1 6198C4BD
P 5950 3200
F 0 "TP10" V 5950 3450 50  0000 C CNN
F 1 "TestPoint" V 6054 3272 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 6150 3200 50  0001 C CNN
F 3 "~" H 6150 3200 50  0001 C CNN
	1    5950 3200
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP9
U 1 1 6198C749
P 5950 3100
F 0 "TP9" V 5950 3350 50  0000 C CNN
F 1 "TestPoint" V 6054 3172 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 6150 3100 50  0001 C CNN
F 3 "~" H 6150 3100 50  0001 C CNN
	1    5950 3100
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP8
U 1 1 6198C892
P 5950 3000
F 0 "TP8" V 5950 3250 50  0000 C CNN
F 1 "TestPoint" V 6054 3072 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 6150 3000 50  0001 C CNN
F 3 "~" H 6150 3000 50  0001 C CNN
	1    5950 3000
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP7
U 1 1 6198CA01
P 5950 2900
F 0 "TP7" V 5950 3150 50  0000 C CNN
F 1 "TestPoint" V 6054 2972 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 6150 2900 50  0001 C CNN
F 3 "~" H 6150 2900 50  0001 C CNN
	1    5950 2900
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP6
U 1 1 6198CBF5
P 5950 2800
F 0 "TP6" V 5950 3050 50  0000 C CNN
F 1 "TestPoint" V 6054 2872 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 6150 2800 50  0001 C CNN
F 3 "~" H 6150 2800 50  0001 C CNN
	1    5950 2800
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP5
U 1 1 6198D15C
P 5950 2700
F 0 "TP5" V 5950 2950 50  0000 C CNN
F 1 "TestPoint" V 6054 2772 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 6150 2700 50  0001 C CNN
F 3 "~" H 6150 2700 50  0001 C CNN
	1    5950 2700
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 6198D3D5
P 5950 2600
F 0 "TP4" V 5950 2850 50  0000 C CNN
F 1 "TestPoint" V 6054 2672 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 6150 2600 50  0001 C CNN
F 3 "~" H 6150 2600 50  0001 C CNN
	1    5950 2600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5950 2600 6300 2600
Wire Wire Line
	5950 2700 6300 2700
Wire Wire Line
	5950 2800 6300 2800
Wire Wire Line
	5950 2900 6300 2900
Wire Wire Line
	5950 3000 6300 3000
Wire Wire Line
	5950 3100 6300 3100
Wire Wire Line
	5950 3200 6300 3200
Wire Wire Line
	5950 3300 6300 3300
Wire Wire Line
	5950 3600 6300 3600
Wire Wire Line
	5950 3700 6300 3700
Wire Wire Line
	7650 3100 7300 3100
Wire Wire Line
	7650 3200 7300 3200
Wire Wire Line
	7650 3300 7300 3300
Wire Wire Line
	7650 3400 7300 3400
Text GLabel 7300 3500 2    50   Input ~ 0
ADC
$Comp
L Connector:TestPoint TP15
U 1 1 619B72E1
P 7650 3000
F 0 "TP15" V 7650 3188 50  0000 L CNN
F 1 "TestPoint" V 7695 3188 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 7850 3000 50  0001 C CNN
F 3 "~" H 7850 3000 50  0001 C CNN
	1    7650 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 3000 7650 3000
$Comp
L Connector:TestPoint TP2
U 1 1 619775AF
P 4750 2200
F 0 "TP2" V 4750 2450 50  0000 C CNN
F 1 "TestPoint" V 4854 2272 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 4950 2200 50  0001 C CNN
F 3 "~" H 4950 2200 50  0001 C CNN
	1    4750 2200
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 61977EEA
P 4750 2600
F 0 "TP3" V 4750 2850 50  0000 C CNN
F 1 "TestPoint" V 4854 2672 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 4950 2600 50  0001 C CNN
F 3 "~" H 4950 2600 50  0001 C CNN
	1    4750 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	4650 2000 4650 2200
Wire Wire Line
	4650 2200 4750 2200
Connection ~ 4650 2000
Wire Wire Line
	4650 2000 4750 2000
Wire Wire Line
	4750 2600 4650 2600
Wire Wire Line
	4650 2600 4650 2800
Connection ~ 4650 2800
Wire Wire Line
	4650 2800 4750 2800
$Comp
L Connector:TestPoint TP12
U 1 1 619799C6
P 5950 3400
F 0 "TP12" V 5950 3650 50  0000 C CNN
F 1 "TestPoint" V 6054 3472 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 6150 3400 50  0001 C CNN
F 3 "~" H 6150 3400 50  0001 C CNN
	1    5950 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5950 3400 6300 3400
$Comp
L Connector:TestPoint TP1
U 1 1 61977D3A
P 2950 3750
F 0 "TP1" V 2950 4000 50  0000 C CNN
F 1 "TestPoint" V 3054 3822 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 3150 3750 50  0001 C CNN
F 3 "~" H 3150 3750 50  0001 C CNN
	1    2950 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	2950 3750 2850 3750
Wire Wire Line
	2850 3750 2850 4000
Connection ~ 2850 4000
Wire Wire Line
	2850 4000 3000 4000
NoConn ~ 7300 3600
NoConn ~ -1950 2850
$EndSCHEMATC
