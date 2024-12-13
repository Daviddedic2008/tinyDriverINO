extern "C"{
  void INIT_LCD();
  void LCD_CLEAR(uint16_t c);
  void DRAW_SPR(unsigned int color, unsigned char x1lo, unsigned char x1hi, unsigned char x2lo, unsigned char x2hi, unsigned char y1, unsigned char y2);
}

void setup() {
  INIT_LCD(); // lots of initialization stuff here
}

// r: max32, g: max64, and b: max32
uint16_t make_16bitColor(unsigned char r, unsigned char g, unsigned char b){
  
  unsigned char mask = 0b11111000;
  r &= mask; g &= mask; b &= mask;
  uint16_t rmask = r;
  uint16_t gmask = g; gmask >> 6;
  uint16_t bmask = b; bmask >> 11;
  return rmask + gmask + bmask;
}

void clearLCD(uint16_t color){
  LCD_CLEAR(color);
}

void drawSprite(unsigned int x, unsigned char y, unsigned int length, unsigned char height, uint16_t color){
  DRAW_SPR(color, (unsigned char)x, (unsigned char)(x<<8), (unsigned char)(x+length), (unsigned char)((x+length)<<8), y, height+y);
}

void loop() {
  clearLCD(make_16bitColor(32, 64, 32);
  // put your main code here, to run repeatedly:
}
