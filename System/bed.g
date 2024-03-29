M290 R0 S0    ;  clear baby stepping
M561          ;  reset all bed adjustments
M400          ;  flush move queue
 
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
  echo "not all axes homed, homing axes first"
  G28
 
 
while true
  if iterations = 5
    abort "Auto calibration repeated attempts ended, final deviation", move.calibration.final.deviation ^ "mm"
  G30 P0 X30 Y30 Z-99999 ; probe near a leadscrew
  if result != 0
    continue
  G30 P1 X245 Y470 Z-99999 ; probe near a leadscrew
  if result != 0
    continue
  G30 P2 X460 Y30 Z-99999 S3 ; probe near a leadscrew and calibrate 3 motors
  if result != 0
    continue
  if move.calibration.initial.deviation <= 0.01
    break
  echo "Repeating calibration because deviation is too high (" ^ move.calibration.initial.deviation ^ "mm)"
; end loop

echo "Auto calibration successful, deviation", move.calibration.final.deviation ^ "mm"
G0 X250 Y250 Z10 F9000

; rehome Z as the absolute height of the z plane may have shifted
G28 Z
