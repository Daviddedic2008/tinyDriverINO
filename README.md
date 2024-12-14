This driver is meant to be a light replacement for the stock ones. Programmed in >90% AVR asm, it is faster than the stock drivers. the driver has simple functionality:
- can clear screen with 565 color format(the LCD color order is strange, not typical 565)
- can draw "sprites"(rectangles) of different colors

Not working fully yet:
- diagonal lines are implemented on an unreleased version, but are buggy due to register conflicts between the ino compiled code and the raw asm subroutine
- 3d wireframe rendering is in the works but requires a trigonometric lookup table, something that must be pre-loaded onto arduino

PICTURES COMING SOON
