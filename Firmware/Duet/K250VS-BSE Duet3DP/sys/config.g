; Configuration file for Kossel250

; Communication and general
M111 S0					; Debug off
M550 K250VS-BSE				; Machine name and Netbios name (can be anything you like)
M551 gr8ful				; Machine password (used for FTP)
M540 P0xBE:0xEF:0xDE:0xAD:0xFE:0xAA	; MAC Address
;*** Adjust the IP address and gateway in the following 2 lines to suit your network
M552 P192.168.20.7			; IP address (0 = use DHCP)  P192.168.1.201	
M554 P192.168.20.1			; Gateway P192.168.1.200	
M553 P255.255.255.0			; Netmask P255.255.255.0    
M555 P2                             	; Set output to look like Marlin
G21                                 	; Work in millimetres
G90                                 	; Send absolute coordinates...
M83                                 	; ...but relative extruder moves

M575 P1 B57600 S1                   	; Set auxiliary serial port baud rate and require checksum (for PanelDue)

; Axis and motor configuration
M569 P0 S1							; Drive 0 goes forwards
M569 P1 S1							; Drive 1 goes forwards
M569 P2 S1							; Drive 2 goes forwards
M569 P3 S1							; Drive 3 (extruder) goes backards
M569 P4 S1							; Drive 4 goes forwards
M574 X2 Y2 Z2 S1					; set endstop configuration (all endstops at high end, active high)
;*** The homed height is deliberately set too high in the following - you will adjust it during calibration
M665 R171.68 L290.81 B105 H225.80 X-0.06 Y-0.22 Z0.00			; R170.63 L288.27 B105 H232.37 set delta radius, diagonal rod length, printable radius and homed height
M666 X-0.52 Y-0.22 Z0.74			; put your endstop adjustments here, or let auto calibration find them
M92 X200 Y200 Z200			; Set axis steps/mm
M906 X1000 Y1000 Z1000 E500		; Set motor currents (mA)
M201 X1000 Y1000 Z1000 E1000		; Accelerations (mm/s^2)
M203 X20000 Y20000 Z20000 E3600		; Maximum speeds (mm/min)
M566 X1200 Y1200 Z1200 E1200		; Maximum instant speed changes mm/minute

; setup fan to be thermostatically controlled
M106 P1 T50 S255 H1

; Thermistors
;*** If you have a Duet board stickered "4.7K", change R1000 to R4700 to the following M305 commands
M305 P0 T100000 B3950 R4700 L54 H-97	; Put your own H and/or L values here to set the bed thermistor ADC correction
M305 P1 T100000 B4388 R4700 L54 H-97	; Put your own H and/or L values here to set the first nozzle thermistor ADC correction
M305 P2 T100000 B4388 R4700 H0 L0	; Put your own H and/or L values here to set the second nozzle thermistor ADC correction
M570 S180							; Hot end may be a little slow to heat up so allow it 180 seconds

; PID
; Bed
M301 H0 P-1							; negative P means use bang-bang control
; Heater 1
M301 H1 P60 I1 D125 T1.0 S1 W300 B30

; Tool definitions
M563 P0 D0 H1                       ; Define tool 0
G10 P0 S0 R0                        ; Set tool 0 operating and standby temperatures
;*** If you have a dual-nozzle build, un-comment the next 2 lines
;M563 P1 D1 H2                      ; Define tool 1
;G10 P1 S0 R0                       ; Set tool 1 operating and standby temperatures
M92 E494:494                       	; Set extruder steps per mm

; Z probe and compensation definition
;*** If you have an IR zprobe instead of a switch, change P4 to P1 in the following M558 command
M558 P4 X0 Y0 Z0 H3 				; Z probe is a switch and is not used for homing any axes
G31 X0 Y0 Z-.05 P500				; Set the zprobe height and threshold (put your own values here)

;*** If you are using axis compensation, put the figures in the following command
M556 S78 X0 Y0 Z0                   ; Axis compensation here

M208 S1 Z-0.2						; set minimum Z
;
T0									; select first hot end
