Refactored drivers for 2.8in Elegoo TFT display. Written for the Arduino Uno R3.

Support:
- raw read/writes to LCD RAM
- filling pixels
- drawing rectangles
- filling screen
- loading arrays of colors into desired locations

Runs anywhere from 0-50% faster than stock drivers that arrive with the LCD unit


Notes:
- WRITE_RAM is used to fill pixels with a desired color, while WRITE_PIXEL is only used to set pixels to on/off.
