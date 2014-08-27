EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
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
LIBS:LT3060board-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "27 aug 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_3 K1
U 1 1 53DBB569
P 4500 4450
F 0 "K1" V 4450 4450 50  0000 C CNN
F 1 "CONN_3" V 4550 4450 40  0000 C CNN
F 2 "" H 4500 4450 60  0000 C CNN
F 3 "" H 4500 4450 60  0000 C CNN
	1    4500 4450
	0    1    1    0   
$EndComp
$Comp
L GND #PWR01
U 1 1 53DBB588
P 4600 3600
F 0 "#PWR01" H 4600 3600 30  0001 C CNN
F 1 "GND" H 4600 3530 30  0001 C CNN
F 2 "" H 4600 3600 60  0000 C CNN
F 3 "" H 4600 3600 60  0000 C CNN
	1    4600 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3500 4600 3500
Wire Wire Line
	4500 3400 4500 4100
Wire Wire Line
	4600 3400 4600 3600
Connection ~ 4600 3500
Wire Wire Line
	4400 3400 4400 3500
Connection ~ 4500 3500
Wire Wire Line
	4400 4100 4400 3750
Wire Wire Line
	4400 3750 3750 3750
Wire Wire Line
	3750 3750 3750 2450
Wire Wire Line
	3550 2500 3900 2500
Wire Wire Line
	3900 2900 3750 2900
Connection ~ 3750 2900
Wire Wire Line
	4600 4100 4600 4000
Wire Wire Line
	4600 4000 6500 4000
Wire Wire Line
	6500 4000 6500 2500
Wire Wire Line
	6500 2500 5300 2500
$Comp
L C C2
U 1 1 53DBB623
P 4800 3650
F 0 "C2" H 4800 3750 40  0000 L CNN
F 1 "10nF" H 4806 3565 40  0000 L CNN
F 2 "0603" H 4838 3500 30  0000 C CNN
F 3 "http://www.samsungsem.com/servlet/FileDownload?type=spec&file=CL10B822KB8NNNC.pdf" H 4800 3650 60 0001 C CNN ""
F 4 "50V" H 4800 3650 60  0001 C CNN "Voltage"
F 5 "30%" H 4800 3650 60  0001 C CNN "Tolerance"
F 6 "1276-2119-1-ND" H 4800 3650 60 0001 C CNN "Digi-Key Part Number"
F 7 "CL10B822KB8NNNC" H 4800 3650 60 0001 C CNN "Manufacturer Part Number"
F 8 "1.000000e-001" H 4800 3650 60 0001 C CNN "Price"
	1    4800 3650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 53DBB632
P 4800 3900
F 0 "#PWR02" H 4800 3900 30  0001 C CNN
F 1 "GND" H 4800 3830 30  0001 C CNN
F 2 "" H 4800 3900 60  0000 C CNN
F 3 "" H 4800 3900 60  0000 C CNN
	1    4800 3900
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 53DBB63F
P 5550 2750
F 0 "C3" H 5550 2850 40  0000 L CNN
F 1 "10nF" H 5556 2665 40  0000 L CNN
F 2 "0603" H 5588 2600 30  0000 C CNN
F 3 "http://www.samsungsem.com/servlet/FileDownload?type=spec&file=CL10B822KB8NNNC.pdf" H 5550 2750 60 0001 C CNN ""
F 4 "50V" H 5550 2750 60  0001 C CNN "Voltage"
F 5 "30%" H 5550 2750 60  0001 C CNN "Tolerance"
F 6 "1276-2119-1-ND" H 5550 2750 60 0001 C CNN "Digi-Key Part Number"
F 7 "CL10B822KB8NNNC" H 5550 2750 60 0001 C CNN "Manufacturer Part Number"
F 8 "1.000000e-001" H 5550 2750 60 0001 C CNN "Price"
	1    5550 2750
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 53DBB648
P 5850 2750
F 0 "C4" H 5850 2850 40  0000 L CNN
F 1 "10uF" H 5856 2665 40  0000 L CNN
F 2 "1210" H 5888 2600 30  0000 C CNN
F 3 "http://www.samsungsem.com/servlet/FileDownload?type=spec&file=CL32B106KBJNFNE.pdf" H 5850 2750 60 0001 C CNN ""
F 4 "50V" H 5850 2750 60  0001 C CNN "Voltage"
F 5 "30%" H 5850 2750 60  0001 C CNN "Tolerance"
F 6 "1276-3386-1-ND" H 5850 2750 60 0001 C CNN "Digi-Key Part Number"
F 7 "CL32B106KBJNFNE" H 5850 2750 60 0001 C CNN "Manufacturer Part Number"
F 8 "1.030000e+000" H 5850 2750 60 0001 C CNN "Price"
	1    5850 2750
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 53DBB64E
P 3550 2950
F 0 "C1" H 3550 3050 40  0000 L CNN
F 1 "1uF" H 3556 2865 40  0000 L CNN
F 2 "0805" H 3588 2800 30  0000 C CNN
F 3 "http://www.samsungsem.com/servlet/FileDownload?type=spec&file=CL21B105KBFNNNE.pdf" H 3550 2950 60 0001 C CNN ""
F 4 "50V" H 3550 2950 60  0001 C CNN "Voltage"
F 5 "30%" H 3550 2950 60  0001 C CNN "Tolerance"
F 6 "1276-1029-1-ND" H 3550 2950 60 0001 C CNN "Digi-Key Part Number"
F 7 "CL21B105KBFNNNE" H 3550 2950 60 0001 C CNN "Manufacturer Part Number"
F 8 "1.000000e-001" H 3550 2950 60 0001 C CNN "Price"
	1    3550 2950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 53DBB65C
P 5850 3000
F 0 "#PWR03" H 5850 3000 30  0001 C CNN
F 1 "GND" H 5850 2930 30  0001 C CNN
F 2 "" H 5850 3000 60  0000 C CNN
F 3 "" H 5850 3000 60  0000 C CNN
	1    5850 3000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 53DBB662
P 3550 3200
F 0 "#PWR04" H 3550 3200 30  0001 C CNN
F 1 "GND" H 3550 3130 30  0001 C CNN
F 2 "" H 3550 3200 60  0000 C CNN
F 3 "" H 3550 3200 60  0000 C CNN
	1    3550 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 2550 5550 2500
Connection ~ 5550 2500
Wire Wire Line
	5850 2450 5850 2550
Connection ~ 5850 2500
Wire Wire Line
	5850 2950 5850 3000
Wire Wire Line
	5550 2950 5550 3000
Wire Wire Line
	5550 3000 5350 3000
Wire Wire Line
	5350 3000 5350 2900
Wire Wire Line
	5350 2900 5300 2900
Wire Wire Line
	3550 2750 3550 2500
Connection ~ 3750 2500
Wire Wire Line
	3550 3150 3550 3200
Wire Wire Line
	4800 3400 4800 3450
Wire Wire Line
	4800 3850 4800 3900
$Comp
L PWR_FLAG #FLG05
U 1 1 53DBCC7F
P 5850 2450
F 0 "#FLG05" H 5850 2545 30  0001 C CNN
F 1 "PWR_FLAG" H 5850 2630 30  0000 C CNN
F 2 "" H 5850 2450 60  0000 C CNN
F 3 "" H 5850 2450 60  0000 C CNN
	1    5850 2450
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG06
U 1 1 53DBCC8C
P 3750 2450
F 0 "#FLG06" H 3750 2545 30  0001 C CNN
F 1 "PWR_FLAG" H 3750 2630 30  0000 C CNN
F 2 "" H 3750 2450 60  0000 C CNN
F 3 "" H 3750 2450 60  0000 C CNN
	1    3750 2450
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG07
U 1 1 53DBCC92
P 4200 3600
F 0 "#FLG07" H 4200 3695 30  0001 C CNN
F 1 "PWR_FLAG" H 4200 3780 30  0000 C CNN
F 2 "" H 4200 3600 60  0000 C CNN
F 3 "" H 4200 3600 60  0000 C CNN
	1    4200 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 3600 4200 3650
Wire Wire Line
	3900 3650 4500 3650
Connection ~ 4500 3650
Text Label 3550 2500 0    60   ~ 0
Vin
Text Label 5950 2500 0    60   ~ 0
Vout
$Comp
L LT3060-TSOT IC1
U 1 1 53DBE0F4
P 4600 2800
F 0 "IC1" H 4100 3330 50  0000 L BNN
F 1 "LT3060-TSOT" H 4850 2950 50  0000 R BNN
F 2 "tsot23-8" H 4400 2850 50  0000 L CNN
F 3 "http://cds.linear.com/docs/en/datasheet/3060fb.pdf" H 4600 2800 60  0001 C CNN
F 4 "3,3V" H 4600 2800 60  0001 C CNN "Voltage"
F 5 "LT3060ETS8-3.3#TRMPBFCT-ND" H 4600 2800 60  0001 C CNN "Digi-Key Part Number"
F 6 "LT3060ETS8-3.3#TRMPBF" H 4600 2800 60  0001 C CNN "Manufacturer Part Number"
	1    4600 2800
	1    0    0    -1  
$EndComp
$Comp
L TVS D2
U 1 1 53FE1CF8
P 4550 1950
F 0 "D2" H 4500 2050 50  0000 C CNN
F 1 "TVS" H 4500 1850 40  0000 C CNN
F 2 "" H 4650 1950 60  0000 C CNN
F 3 "http://www.littelfuse.com/~/media/electronics/datasheets/tvs_diodes/littelfuse_tvs_diode_smdj_datasheet.pdf.pdf" H 4650 1950 60 0001 C CNN ""
F 4 "33" H 4550 1950 60  0001 C CNN "Breakdown Voltage"
F 5 "1" H 4550 1950 60  0001 C CNN "Bidirectional Channels"
F 6 "-" H 4550 1950 60  0001 C CNN "Unidirectional Channels"
F 7 "SMDJ30CACT-ND" H 4550 1950 60 0001 C CNN "Digi-Key Part Number"
F 8 "SMDJ30CA" H 4550 1950 60 0001 C CNN "Manufacturer Part Number"
F 9 "1.290000e+000" H 4550 1950 60 0001 C CNN "Price"
	1    4550 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 2500 3850 2350
Wire Wire Line
	3850 2350 4000 2350
Wire Wire Line
	4000 2350 4000 1950
Wire Wire Line
	4000 1950 4300 1950
Connection ~ 3850 2500
Wire Wire Line
	4800 1950 5350 1950
Wire Wire Line
	5350 1950 5350 2500
Connection ~ 5350 2500
$Comp
L TVS D1
U 1 1 53FE1D92
P 3900 3250
F 0 "D1" H 3850 3350 50  0000 C CNN
F 1 "TVS" H 3850 3150 40  0000 C CNN
F 2 "" H 4000 3250 60  0000 C CNN
F 3 "http://www.littelfuse.com/~/media/electronics/datasheets/tvs_diodes/littelfuse_tvs_diode_smdj_datasheet.pdf.pdf" H 4000 3250 60 0001 C CNN ""
F 4 "33" H 3900 3250 60  0001 C CNN "Breakdown Voltage"
F 5 "1" H 3900 3250 60  0001 C CNN "Bidirectional Channels"
F 6 "-" H 3900 3250 60  0001 C CNN "Unidirectional Channels"
F 7 "SMDJ30CACT-ND" H 3900 3250 60 0001 C CNN "Digi-Key Part Number"
F 8 "SMDJ30CA" H 3900 3250 60 0001 C CNN "Manufacturer Part Number"
F 9 "1.290000e+000" H 3900 3250 60 0001 C CNN "Price"
	1    3900 3250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3900 3000 3750 3000
Connection ~ 3750 3000
Wire Wire Line
	3900 3500 3900 3650
Connection ~ 4200 3650
$Comp
L TVS D3
U 1 1 53FE1E08
P 6250 2800
F 0 "D3" H 6200 2900 50  0000 C CNN
F 1 "TVS" H 6200 2700 40  0000 C CNN
F 2 "" H 6350 2800 60  0000 C CNN
F 3 "http://www.littelfuse.com/~/media/electronics/datasheets/tvs_diodes/littelfuse_tvs_diode_smdj_datasheet.pdf.pdf" H 6350 2800 60 0001 C CNN ""
F 4 "33" H 6250 2800 60  0001 C CNN "Breakdown Voltage"
F 5 "1" H 6250 2800 60  0001 C CNN "Bidirectional Channels"
F 6 "-" H 6250 2800 60  0001 C CNN "Unidirectional Channels"
F 7 "SMDJ30CACT-ND" H 6250 2800 60 0001 C CNN "Digi-Key Part Number"
F 8 "SMDJ30CA" H 6250 2800 60 0001 C CNN "Manufacturer Part Number"
F 9 "1.290000e+000" H 6250 2800 60 0001 C CNN "Price"
	1    6250 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6250 2550 6250 2500
Wire Wire Line
	6250 2500 6300 2500
Connection ~ 6300 2500
$Comp
L GND #PWR08
U 1 1 53FE1E4A
P 6250 3150
F 0 "#PWR08" H 6250 3150 30  0001 C CNN
F 1 "GND" H 6250 3080 30  0001 C CNN
F 2 "" H 6250 3150 60  0000 C CNN
F 3 "" H 6250 3150 60  0000 C CNN
	1    6250 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 3050 6250 3150
$EndSCHEMATC
