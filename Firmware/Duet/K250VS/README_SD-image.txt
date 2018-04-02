Notes on Duet WiFi Beta Test SD Image files (T3P3 20160613)

1. The default /gcodes and /sys folders are for a Mini Kossel as used for testing the board. Unless you have a Mini Kossel or similar you should delete the gcode files and the/sys folder and rename the most appropriate of the other /sys folders to /sys to suit your printer.

2. Although taken from the https://github.com/dc42/RepRapFirmware SD-image files, all the config.g files have been modified as follows:

- Remove ethernet networking lines and replace with

;M552 S1     ; Enable WiFi

Note that it is commented out and must be specifically enable over USB in Pronterface to activate the WiFi network when setting up your board. Once neworking is well-established you can uncomment the M552 line.

- Added line to set microstepping of TMC2660 stepper drivers:

M350 X16 Y16 E16 I1    ; Set 16x microstepping with interpolation