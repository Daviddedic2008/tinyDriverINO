# tinyDriverINO
Lightweight, small, simple drivers for the Elegoo TFT 2.8 inch LCD Shield for the Arduino Uno R3. 

## Metrics
  Raw data transmit rate between screen and arduino is improved over stock drivers.
  The screen clears ~15-30% faster, indicative of a reduction in overhead.
  Written in mostly AVR asm, with a bit of AVRC mixed in

## Functionality
  Supports screen-wide color sets, area color sets, and horizontal/vertical line color sets.
  Diagonal lines were implemented in a previous build, but were removed due to being too slow(The UNO lacks a FPU)
  Supports direct reads/writes to or from LCD memory
  **READS AREN'T SUPPORTED ON ALL LCD MODULES. THEY ONLY WORK ON CERTAIN ONES WITH READ PINS CONNECTED.**

This project was my introduction into embedded systems, and it paved the way for my small STM32F407 OS I wrote 2 years later.

**SIDENOTE**: this repo is the condensed and tested version. There exists a version with >2K lines of assembly, but it is a little buggy and untested :)

