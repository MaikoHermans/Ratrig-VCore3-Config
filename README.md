# V-Core 3.1 500
This contains the config files for RatRig V-Core 3.1, specifically the 500mm version.
Contains config/macros for filaments/tuning

**RRF Version:** 3.4

## Hardware
**Hotend:** Slice Engineering Mosquito Magnum
**Extruder:** Bondtech LGX
**Board:** Duet3D 6HC
**Toolboard:** Duet Toolboard 1LC V1.2
**Layer fan:** Sanyo 4028
**Screen:** Duet paneldue 7i
**Z probe:** Antlabs BLTouch V1.3

## Files
Under this section you can find what file is used for what exactly

### System

|File|Purpose  |
|--|--|
| bed.g | Being ran when using true bed leveling (G32) |
| config.g | All general configuration settings are done here. File is ran every time the printer gets booted  |
| config-override.g | This file contains values that override the default settings from the `config.g` file. Values in here are being set from macros |
| cancel.g | The file is being ran when a print is cancelled |
| deployprobe.g | Used for deploying BLTouch probe |
| end.g | The file is being ran when a print ended. I run `cancel.g` from here since I think they are the same in the end |
| filament-change.g | used when `M600` is executed. This allows me to change filaments mid print or pause it mid print to insert magnets in the print for instance |
| homeall.g | Used for homing X Y Z |
| homex.g | Used for homing X only |
| homey.g | Used for homing Y only |
| homez.g | Used for homing Z only |
| retractprobe.g | Used for retracting BLTouch probe |
| setspeeds.g | Used to set the speed limits of the machine from one spot, this is refered to from other files |
| start.g | Used when the print is started, I use this in combination with the slicers custom start g-code |
| stop.g | Used when the print is stopped, This calls `cancel.g` | 

## Macros
### Filament
| File | Purpose |
|--|--|
| load | This command is used to load filaments it takes 2 parameters `F` the text to display during loading and `T` for the temperature that should be used for loading |
| unload | This command is used to unload filaments it takes 2 parameters `F` the text to display during loading and `T` for the temperature that should be used for unloading |

### Printing
| File | Purpose |
|--|--|
| primeNozzle | Used to prime the nozzle. This is called from the slicer custom start gcode |
| setCompensation | Set bed heightmap if none has been set, called from the slicer custom start gcode. Can be usefull if G29 fails for whatever reason but a heightmap was previously set |
| setHomeIfNeeded | Check if machine is homed if not make sure to home all axis. Refered to from other scripts |

### Tunes
This directory contains tunes that can be played from the Duet 6HC, use them whenever and wherever you would like

### Tuning
| File | Purpose |
|--|--|
| AccelYMax | This is an experimental file to try and find the max acceleration for Y, can be ran as is |
| captureAccelerometerData | Grab details from the accelerometer for input shaping. Details are visible under `Settings -> Machine-Specific -> Accelerometer`, can be ran as is |
| PID Tune Bed 100 | Run PID tuning with 100 degrees for the bed. Result is stored in `config-override.g` |
| PID Tune HotEnd 240 | Run PID tuning with 240 degrees for the hotend. Result is stored in `config-override.g` |
| PID Tune HotEnd 290 | Run PID tuning with 290 degrees for the hotend. Result is stored in `config-override.g` |
| Auto_Z_offset | Use for calibrating the BLTouch. By running this you can set the Z offset by using the interface |

## Filaments

This contains settings for specific filaments. Currently each filament has 4 specific things that are being set for it. These values are being set for the filament that is loaded when `M703` is called

1. The allowed extrusion/retraction temperature
2. The extrusion/retracting length and speeds
3. Babystepping offset
4. Pressure advance 

## Slicer
This directory contains gcode that must be entered in the `start of print` and `end of print` gcode sections of the slicer. I'm using `SuperSlicer` where you can find these sections under `Printer Settings -> Custom G-Code`
| File | Purpose |
|--|--|
| Start G-Code | This code is used in the Start G-Code section |
| End G-Code | This code is used in the End G-Code section |
