/*
 * cdefslib.c
 *
 * Created: 3/11/2025 7:48:06 PM
 *  Author: david
 */ 
#include "screenLib.h"

void WRITE_ARR(unsigned char y1, uint16_t x1, unsigned char y2, unsigned char hy, uint16_t x2, uint16_t* colors, uint16_t num_colors){
	SET_BOUNDS(y1, x1, y2, x2);
	for(; x1 < x2; x1++){
		for(; y1 < y2; y1++){
			SEQUENTIAL_WRITE_COLOR(colors[x1 + hy * y1]);
		}
	}
}