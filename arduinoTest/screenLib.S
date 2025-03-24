
/*
 * screenLib.S
 *
 * Created: 3/10/2025 8:23:28 PM
 *  Author: david
 */ 

 .macro WRITE_DATA
;r21 is the input
push r19
push r20
push r21
sbi 0x08, 2
in r19, 0x0B  ; port D
andi r19, 0b00000011
andi r21, 0b11111100
or r19, r21
out 0x0B, r19
pop r21
in r19, 0x05  ; port B
andi r19, 0b11111100
andi r21, 0b00000011
or r19, r21
out 0x05, r19
cbi 0x08, 1 ; PORTA
sbi 0x08, 1 ; PORTA
pop r20
pop r19
.endm

.macro WRITE_COMMAND
;r21 is the input
push r19
push r20
push r21
cbi 0x08, 2
in r19, 0x0B  ; port D
andi r19, 0b00000011
andi r21, 0b11111100
or r19, r21
out 0x0B, r19
pop r21
in r19, 0x05  ; port B
andi r19, 0b11111100
andi r21, 0b00000011
or r19, r21
out 0x05, r19
cbi 0x08, 1 ; PORTA
sbi 0x08, 1 ; PORTA
pop r20
pop r19
.endm

.macro READ_DATA
; y-start in r24
; x-start in r25-26

; column(y) set
ldi r21, 0x2a
WRITE_COMMAND

mov r21, r24
WRITE_DATA

ldi r21, 0
WRITE_DATA

inc r24

mov r21, r24
WRITE_DATA

ldi r21, 0
WRITE_DATA


;page(x) set
ldi r21, 0x2b
WRITE_COMMAND

mov r21, r26
WRITE_DATA

mov r21, r25
WRITE_DATA

ldi r30, 1
add r25, r30
ldi r30, 0
adc r26, r30

mov r21, r26
WRITE_DATA

mov r21, r25
WRITE_DATA
; now we actually read whatever we wanted to :)
; returns result in r19
cbi 0x08, 0
in r19, 0x0B ; returns first 6 bits of color. only useful to see if pixel is filled
sbi 0x08, 0
.endm

.macro READ_DATA_SEQUENTIAL

; now we actually read whatever we wanted to :)
; returns result in r19
cbi 0x08, 0
in r19, 0x0B ; returns first 6 bits of color. only useful to see if pixel is filled
sbi 0x08, 0

.endm

.global SEQUENTIAL_READ_RAM

SEQUENTIAL_READ_RAM:
	READ_DATA_SEQUENTIAL
	ret

.global dl

dl:
  push r17
  push r18
  push r19
  clr r17
  clr r18
  ldi r19, 0b11111111
  loop1:
  clr r18
  cp r17, r19
  breq end
  loop2:
  inc r18
  cp r18, r19
  brne loop2
  inc r17
  rjmp loop1
  end:
  pop r19
  pop r18
  pop r17
  ret

.global INIT_LCD
INIT_LCD:
  ldi r17, 0b11111111
  out 0x0A, r17
  sbi 0x04, 0
  sbi 0x04, 1
  sbi 0x04, 2
  sbi 0x07, 0
  sbi 0x07, 1
  sbi 0x07, 2
  sbi 0x07, 3
  sbi 0x07, 4
  sbi 0x08, 0
  sbi 0x08, 1
  sbi 0x08, 2
  sbi 0x08, 3
  sbi 0x08, 4
  sbi 0x08, 4; porta
  call dl
  cbi 0x08, 4
  call dl
  sbi 0x08, 4
  call dl

  sbi 0x08, 3
  sbi 0x08, 1
  cbi 0x08, 3

  ldi r21, 0xB5
  WRITE_COMMAND
  ;ldi r21, 0b00111111
  ldi r21, 1
  WRITE_DATA
  ;ldi r21, 0b01
  ldi r21, 1
  WRITE_DATA
  ldi r21, 0
  WRITE_DATA
  ldi r21, 0
  WRITE_DATA


  ldi r21, 0xCB
 
  WRITE_COMMAND

  ldi r21, 0x39

  WRITE_DATA

  ldi r21, 0x2c

  WRITE_DATA

  ldi r21, 0x00

  WRITE_DATA

  ldi r21, 0x34
 
  WRITE_DATA

  ldi r21, 0x02
 
  WRITE_DATA

  ldi r21, 0xCF
 
  WRITE_COMMAND

  ldi r21, 0x00
 
  WRITE_DATA

  ldi r21, 0xC1
 
  WRITE_DATA

  ldi r21, 0x30
 
  WRITE_DATA


  ldi r21, 0xE8
 
  WRITE_COMMAND

  ldi r21, 0x85
 
  WRITE_DATA

  ldi r21, 0x00
 
  WRITE_DATA

  ldi r21, 0x78
 
  WRITE_DATA


  ldi r21, 0xEA
 
  WRITE_COMMAND

  ldi r21, 0x00
 
  WRITE_DATA

  ldi r21, 0x00
 
  WRITE_DATA


  ldi r21, 0xED
 
  WRITE_COMMAND

  ldi r21, 0x64
 
  WRITE_DATA

  ldi r21, 0x03
 
  WRITE_DATA

  ldi r21, 0x12
 
  WRITE_DATA

  ldi r21, 0x81
 
  WRITE_DATA

  ldi r21, 0xF7
 
  WRITE_DATA

  ldi r21, 0x20
 
  WRITE_DATA


  ldi r21, 0xC0
 
  WRITE_COMMAND

  ldi r21, 0x23
 
  WRITE_DATA


  ldi r21, 0xC1
 
  WRITE_COMMAND

  ldi r21, 0x10
 
  WRITE_DATA

  ldi r21, 0xC5
 
  WRITE_COMMAND

  ldi r21, 0x3e
 
  WRITE_DATA

  ldi r21, 0x28
 
  WRITE_DATA

  ldi r21, 0xC7
 
  WRITE_COMMAND

  ldi r21, 0x86

  WRITE_DATA

  ldi r21, 0x36
 
  WRITE_COMMAND

  ldi r21, 0x48
 
  WRITE_DATA


  ldi r21, 0x3A
 
  WRITE_COMMAND

  ldi r21, 0x55
 
  WRITE_DATA

  ldi r21, 0xB1
 
  WRITE_COMMAND

  ldi r21, 0x00
 
  WRITE_DATA

  ldi r21, 0x18
 
  WRITE_DATA

  ldi r21, 0xB6
 
  WRITE_COMMAND

  ldi r21, 0x08
 
  WRITE_DATA

  ldi r21, 0x82
 
  WRITE_DATA

  ldi r21, 0x27
 
  WRITE_DATA
  
  ldi r21, 0x11
 
  WRITE_COMMAND

  ldi r21, 8
  ms:
  call dl
  dec r21
  brne ms
  ldi r21, 0x29
 
  WRITE_COMMAND

  ldi r21, 0x2c
 
  WRITE_COMMAND

  ret


.global LCD_CLEAR
  LCD_CLEAR:
  ; args r17 hi8 r18 lo8
  ; color for lcd clear is arg
  push r17
  push r18
  mov r17, r24
  mov r18, r25
  push r19
  push r20
  push r21

  ldi r21, 0x2a
 
  WRITE_COMMAND

  ldi r21, 0
  WRITE_DATA
  ldi r21, 0
  WRITE_DATA
  ldi r21, 0
  WRITE_DATA
  ldi r21, 240
  WRITE_DATA


  ldi r21, 0x2b
  WRITE_COMMAND

  ldi r21, 0
  WRITE_DATA
  ldi r21, 0
  WRITE_DATA
  ldi r21, 1
  WRITE_DATA
  ldi r21, 64
  WRITE_DATA
  ldi r21, 0x2c
 
  WRITE_COMMAND

 
  ldi r24, 160
  loop9:
  ldi r25, 240
  loop10:
  mov r21, r17
 
  WRITE_DATA

  mov r21, r18
 
  WRITE_DATA

  dec r25
  brne loop10
  dec r24
  brne loop9

  clr r24
  loop5:
  clr r25
  loop6:
  mov r21, r17
 
  WRITE_DATA

  mov r21, r18
 
  WRITE_DATA

  inc r25
  cpi r25, 240
  brne loop6
  inc r24
  cpi r24, 160
  brne loop5
  pop r21
  pop r20
  pop r19
  pop r18
  pop r17
  ret


.global READ_PIXEL
READ_PIXEL:
	READ_DATA
	clr r24
	cpi r19, 0x0
	brne skpcolorread
	ldi r24, 1
	skpcolorread:
	ret


.global WRITE_PIXEL
WRITE_PIXEL:
	; y-start in r24
	; x-start in r25-26
	; colors pixel in black
	; column(y) set
	ldi r21, 0x2a
	WRITE_COMMAND

	mov r21, 0
	WRITE_DATA

	mov r21, r24
	WRITE_DATA

	inc r24

	ldi r21, 0
	WRITE_DATA

	mov r21, r24
	WRITE_DATA

	;page(x) set
	ldi r21, 0x2b
	WRITE_COMMAND

	mov r21, r26
	WRITE_DATA

	mov r21, r25
	WRITE_DATA

	ldi r30, 1
	add r25, r30
	ldi r30, 0
	adc r26, r30

	mov r21, r26
	WRITE_DATA

	mov r21, r25
	WRITE_DATA
	; now we can write colors

	ldi r21, 0x2c
	WRITE_COMMAND
	ldi r21, 0x0
	WRITE_DATA
	ldi r21, 0x0
	WRITE_DATA

	ret

.global WRITE_RAM
WRITE_RAM:
	; y-start in r24
	; x-start in r25-26
	; colors pixel in black
	; column(y) set
	push r21
	ldi r21, 0x2a
	WRITE_COMMAND

	mov r21, r24
	WRITE_DATA

	ldi r21, 0
	WRITE_DATA

	inc r24

	mov r21, r24
	WRITE_DATA

	ldi r21, 0
	WRITE_DATA


	;page(x) set
	ldi r21, 0x2b
	WRITE_COMMAND

	mov r21, r26
	WRITE_DATA

	mov r21, r25
	WRITE_DATA

	ldi r30, 1
	add r25, r30
	ldi r30, 0
	adc r26, r30

	mov r21, r26
	WRITE_DATA

	mov r21, r25
	WRITE_DATA
	; now we can write to RAM

	ldi r21, 0x2c
	WRITE_COMMAND
	mov r21, r28
	WRITE_DATA
	mov r21, r27
	WRITE_DATA

	ret

.global SET_BOUNDS

SET_BOUNDS:
	; y-start in r24
	; x-start in r25-26

	; column(y) set
	push r21
	ldi r21, 0x2a
	WRITE_COMMAND

	mov r21, r24
	WRITE_DATA

	ldi r21, 0
	WRITE_DATA

	inc r24

	mov r21, r24
	WRITE_DATA

	ldi r21, 0
	WRITE_DATA


	;page(x) set
	ldi r21, 0x2b
	WRITE_COMMAND

	mov r21, r26
	WRITE_DATA

	mov r21, r25
	WRITE_DATA

	ldi r30, 1
	add r25, r30
	ldi r30, 0
	adc r26, r30

	mov r21, r26
	WRITE_DATA

	mov r21, r25
	WRITE_DATA
	ret

.global SEQUENTIAL_COLOR_SET

SEQUENTIAL_COLOR_SET:
	ldi r21, 0x2c
	WRITE_COMMAND
	mov r21, r25
	WRITE_DATA
	mov r21, r24
	WRITE_DATA