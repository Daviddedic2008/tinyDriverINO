.global writbus
writbus:
  ; r21 is the byte being written to 8-bit bus
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  ret

.macro WRITE_DATA
;r21 is the input
push r19
push r20
sbi 0x08, 2
mov r20, r21
in r19, 0x0B  ; port D
andi r19, 0b00000011
andi r20, 0b11111100
or r19, r20
out 0x0B, r19
mov r20, r21
in r19, 0x05  ; port B
andi r19, 0b11111100
andi r20, 0b00000011
or r19, r20
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
cbi 0x08, 2
mov r20, r21
in r19, 0x0B  ; port D
andi r19, 0b00000011
andi r20, 0b11111100
or r19, r20
out 0x0B, r19
mov r20, r21
in r19, 0x05  ; port B
andi r19, 0b11111100
andi r20, 0b00000011
or r19, r20
out 0x05, r19
cbi 0x08, 1 ; PORTA
sbi 0x08, 1 ; PORTA
pop r20
pop r19
.endm

writdata:
  ;r21 is the input
  push r19
  push r20
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19
  ret

.global writcom
writcom:
  ;r21 is the input
  push r19
  push r20
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19
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
  call writcom
  ;ldi r21, 0b00111111
  ldi r21, 1
  call writdata
  ;ldi r21, 0b01
  ldi r21, 1
  call writdata
  ldi r21, 0
  call writdata
  ldi r21, 0
  call writdata


  ldi r21, 0xCB
 
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x39

  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x2c

  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x00

  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x34
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x02
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0xCF
 
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x00
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0xC1
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x30
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA


  ldi r21, 0xE8
 
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x85
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x00
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x78
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA


  ldi r21, 0xEA
 
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x00
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x00
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA


  ldi r21, 0xED
 
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x64
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x03
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x12
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x81
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA


  ldi r21, 0xF7
 
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x20
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA


  ldi r21, 0xC0
 
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x23
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA


  ldi r21, 0xC1
 
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x10
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA


  ldi r21, 0xC5
 
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x3e
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x28
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA


  ldi r21, 0xC7
 
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x86
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA


  ldi r21, 0x36
 
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x48
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA


  ldi r21, 0x3A
 
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x55
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA


  ldi r21, 0xB1
 
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x00
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x18
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA


  ldi r21, 0xB6
 
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x08
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x82
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x27
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA


  ldi r21, 0x11
 
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 8
  ms:
  call dl
  dec r21
  brne ms
  ldi r21, 0x29
 
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0x2c
 
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ret

.global LCD_CLEAR
  LCD_CLEAR:
  ; args r17 hi8 r18 lo8
  push r17
  push r18
  mov r17, r24
  mov r18, r25
  push r19
  push r20
  push r21

  ldi r21, 0x2a
 
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0
  call writdata
ldi r21, 0
  call writdata
ldi r21, 0
  call writdata
ldi r21, 240
  call writdata
  ldi r21, 0x2b
 
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  ldi r21, 0
  call writdata
  ldi r21, 0
  call writdata
ldi r21, 1
  call writdata
ldi r21, 64
  call writdata
  ldi r21, 0x2c
 
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

 
  ldi r24, 160
  loop9:
  ldi r25, 240
  loop10:
  mov r21, r17
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  mov r21, r18
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  dec r25
  brne loop10
  dec r24
  brne loop9

  clr r24
  loop5:
  clr r25
  loop6:
  mov r21, r17
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

  mov r21, r18
 
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA

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

.global DRAW_SPR
DRAW_SPR:
  ; sprite x1 hi r16
  ; sprite x1 lo r17
  ; sprite y1 r18
  ; sprite x2 hi r19
  ; sprite x2 lo r20
  ; sprite y2 r22
  ; r23 r24 color
 pop r24
 pop r23
 pop r22
 pop r20
 pop r19
 pop r18
 pop r17
 pop r16

  ldi r21, 0x2a
 
  push r19
  push r20
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19

  mov r21, r16
 
  push r19
  push r20
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19

mov r21, r17
 
  push r19
  push r20
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19

mov r21, r19
 
  push r19
  push r20
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19

mov r21, r20
 
  push r19
  push r20
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19


  ldi r21, 0x2b
 
  push r19
  push r20
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19

  ldi r21, 0
 
  push r19
  push r20
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19

  mov r21, r18
 
  push r19
  push r20
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19

ldi r21, 0
 
  push r19
  push r20
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19

mov r21, r22
 
  push r19
  push r20
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19

 
  ldi r21, 0x2c
 
  push r19
  push r20
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19

 
  sub r20, r17
  sbc r19, r16
  sub r22, r18
  mov r25, r22





  ldi r30, 0
  sdl:
  mov r25, r22
  sdl2:
  mov r21, r23
 
  push r19
  push r20
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19

  mov r21, r24
 
  push r19
  push r20
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19

  dec r25
  brne sdl2
  subi r20, 1
  sbc r19, r30
  cpi r19, 0
  brne sdl
  cpi r20, 0
  brne sdl

  ret


  .global ds
ds:
  ; sprite x1 hi r16
  ; sprite x1 lo r17
  ; sprite y1 r18
  ; sprite x2 hi r19
  ; sprite x2 lo r20
  ; sprite y2 r22
  ; r23 r24 color
  mov r17, r18
  mov r16, r19
  mov r18, r22
  mov r19, r21
  mov r22, r23
  mov r23, r25

 

  ldi r21, 0x2a
 
  push r19
  push r20
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19

  mov r21, r16
 
  push r19
  push r20
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19

mov r21, r17
 
  push r19
  push r20
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19

mov r21, r19
 
  push r19
  push r20
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19

mov r21, r20
 
  push r19
  push r20
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19


  ldi r21, 0x2b
 
  push r19
  push r20
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19

  ldi r21, 0
 
  push r19
  push r20
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19

  mov r21, r18
 
  push r19
  push r20
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19

ldi r21, 0
 
  push r19
  push r20
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19

mov r21, r22
 
  push r19
  push r20
  sbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19

 
  ldi r21, 0x2c
 
  push r19
  push r20
  cbi 0x08, 2
  mov r20, r21
  in r19, 0x0B  ; port D
  andi r19, 0b00000011
  andi r20, 0b11111100
  or r19, r20
  out 0x0B, r19
  mov r20, r21
  in r19, 0x05  ; port B
  andi r19, 0b11111100
  andi r20, 0b00000011
  or r19, r20
  out 0x05, r19
  cbi 0x08, 1 ; PORTA
  sbi 0x08, 1 ; PORTA
  pop r20
  pop r19

 
  sub r20, r17
  sbc r19, r16
  sub r22, r18
  mov r25, r22





  ldi r30, 0
  ret