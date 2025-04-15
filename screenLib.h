/*
 * lcdlib.h
 *
 * Created: 3/11/2025 9:41:54 AM
 *  Author: david
 */ 

#ifndef LCDLIB_H_
#define LCDLIB_H_

#include <avr/io.h>

#include "colors.h"

void INIT_LCD();

void LCD_CLEAR(int16_t color);

unsigned char READ_PIXEL(unsigned char y, uint16_t x); // returns 0 if pixel is white/close to white, 1 if it is black

void WRITE_PIXEL(unsigned char y, uint16_t x); // colors pixel in black

void WRITE_RAM(uint32_t pointer, uint16_t value); // writes 16 bit val to memory location at pointer

void SET_BOUNDS(unsigned char y1, uint16_t x1, unsigned char y2, uint16_t x2); // not to be used with other functions. low-level screen functionality

void SEQUENTIAL_WRITE_COLOR(uint16_t color); // not to be used with other functions. low-level screen functionality

void SEQUENTIAL_READ_RAM(); // not to be used with other functions. low-level screen functionality

extern void WRITE_ARR(unsigned char y1, uint16_t x1, unsigned char y2, unsigned char hy, uint16_t x2, uint16_t* colors, uint16_t num_colors); // writes an arr of colors to screen

#endif /* LCDLIB_H_ */