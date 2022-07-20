; filament specific config; this file will run whenever the job file calls M703

M302 S210 R210         ; do not allow extrusion(s) below 230 or retraction(r) below 230
M207 S0.70 F2400 T2400 ; set h/w retract values for G10/G11 command
M290 S0.00             ; babystep the head up 0.02 mm
M572 D0 S0.04          ; set pressure advance