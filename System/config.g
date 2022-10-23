; General preferences
M575 P1 S1 B57600                       ; enable support for PanelDue
G90                                     ; send absolute coordinates...
M83                                     ; ...but relative extruder moves
M550 P"vcore3"                        	; set printer name
M669 K1                                 ; CoreXY
G21	                                    ; Set Units to Millimeters
G4 S2									; Wait for the toolboard to come online

; Drives
M569 P0.0 S1 D3                         ; physical drive Z1 goes forwards
M569 P0.1 S1 D3                         ; physical drive Z2 goes forwards
M569 P0.2 S1 D3                         ; physical drive Z3 goes forwards
M569 P121.0 S1 D3                       ; physical drive Extruder goes forwards
M569 P0.3 S0 D3                         ; physical drive X goes forwards
M569 P0.4 S0 D3                         ; physical drive Y goes forwards
M584 X0.3 Y0.4 Z0.1:0.0:0.2 E121.0     ; set drive mapping
M350 X16 Y16 Z16 E16 I1                 ; configure microstepping with interpolation

M92 X80.00 Y80.00 Z800.00 E400          ; set steps per mm
M906 X1200 Y1200 Z1400 E600 I50         ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                 ; Set idle timeout

M98 P"0:/sys/setspeeds.g"               ; Set speed and acceleration

; Axis Limits
M208 X0 Y0 Z0 S1                               ; set axis minimum
M208 X510 Y500 Z500 S0                         ; set axis maximum

; Endstops
M574 Y2 S1 P"io1.in"                           	; configure active y endstop
M574 X1 S1 P"121.io1.in"						; configure active x endstop

M671 X-4.5:250:504.5 Y-4.52:505:-4.52 S15      ; define positions of Z leadscrews or bed levelling screws
M557 X30:470 Y30:470 P7                        ; define 5x5 mesh grid

; Heaters
M308 S0 P"temp0" Y"thermistor" T100000 B3950 A"Bed"    ; configure sensor 0 as thermistor on pin temp0
M950 H0 C"out0" T0 Q10                                 ; create bed heater output on out0 and map it to sensor 0
M307 H0 B0 S1.00                                       ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                                ; map heated bed to heater 0
M143 H0 S130                                           ; set temperature limit for heater 0 to 110C

M308 S1 P"121.temp0" Y"thermistor" T100000 B4267 A"Hotend"   ; configure sensor 1 as thermistor on pin 121.temp0
M950 H1 C"121.out0" T1         						   		 ; create nozzle heater output on out2 and map it to sensor 1
M307 H1 B0 S1.00           							   		 ; disable bang-bang mode for heater and set PWM limit
M143 H1 S350              							   		 ; set the maximum temperature in C for heater

M307 H0 R0.479 K0.250:0.000 D3.55 E1.35 S1.00 B0	   ; Bed PID Tuning
M307 H1 R2.124 K0.496:0.000 D4.92 E1.35 S1.00 B0 V24   ; Heater PID Tuning

; Fans
M950 F0 C"!121.out1+out1.tach" Q25000
;M950 F0 C"121.out1" Q150                              ; create fan 0 on pin 121.out1 and set its frequency
M106 P0 S0 H-1 C"Layer Fan"                           ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"121.out2" Q150                              ; create fan 1 on pin 121.out2 and set its frequency
M106 P1 S1 H1 T45 C"Heater Fan"                       ; set fan 1 value. Thermostatic control is turned on

; Tools
M563 P0 S"MosquitoM" D0 H1 F0           ; define tool 0
G10 P0 X0 Y0 Z0            				; set tool 0 axis offsets
G10 P0 R0 S0               				; set initial tool 0 active and standby temperatures to 0C

;; Run Heater PID Tune!! 
;; M307 H1 A751.5 C196.6 D4.7 S1.00 V23.9 B0

; Z-Probe
;; BLTouch
M950 S0 C"121.io0.out"                     ; Create a servo pin on io0
M558 P9 C"121.io0.in" H5 F240 T10800 A5    ; set Z probe type to unmodulated and the dive height + speeds
G31 P25 X-28.00 Y-13.00 Z3.05          	   ; set Z probe trigger value, offset and trigger height, more Z means closer to the bed

; Accelerometer
M955 P121.0 I12							   ; Set the Accelerometer to the toolboard and set the mounting orientation
;M593 P"mzv" F25							   ; Set the ringing configuration. Using ZVD at 32Hz

M501
T0
