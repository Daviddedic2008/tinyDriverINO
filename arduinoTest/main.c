/*
 * arduinoTest.c
 *
 * Created: 3/10/2025 8:17:41 PM
 * Author : david
 */ 

#include "screenLib.h"

int main(void)
{	
	INIT_LCD();
	LCD_CLEAR(WHITE);
	for(int x = 0; x < 10; x++){
		WRITE_PIXEL(10, x);
	}

	if(READ_PIXEL(10, 1)){
		LCD_CLEAR(RED);
	}

    while (1) 
    {
		
    }
}

