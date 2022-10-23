; filament specific config; this file will run whenever the job file calls M703

M302 S190 R190         ; do not allow extrusion(s) below 190 or retraction(r) below 190
M207 S0.40 F2100 T2100 ; set h/w retract values for G10/G11 command
M290 S0.00             ; babystep the head up 0.00 mm
M572 D0 S0.08          ; set pressure advance