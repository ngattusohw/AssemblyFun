#include "avr/io.h"


.global loop
.global setup
.global timer
.global again
.global Time

datimer:
  ldi r17, 50
L4: LDI R18, 250
L5: ldi r19, 50
L6:
    nop
    nop
    dec r19
    brne L6
    dec r18
    brne L5
    dec r17
    brne L4
ret

timer:
  ldi r17, 250
L1: LDI R18, 250
L2: ldi r19, 50
L3:
    nop
    nop
    dec r19
    brne L3
    dec r18
    brne L2
    dec r17
    brne L1
ret


dit:
  ldi r17, 0b00100000
  sts PORTB, r17
  call datimer
  ldi r17, 0b00000000
  sts PORTB, r17
  call datimer
ret

da:
  ldi r17, 0b00100000
  sts PORTB, r17
  call timer
  ldi r17, 0b00000000
  sts PORTB, r17
  call timer
ret

  
setup:
  ldi r16, 0b00100000
  sts DDRB, r16

loop:
  call dit
  call dit
  call dit

  call da
  call da
  call da

  call dit
  call dit
  call dit

  call timer
  call timer
  
  jmp loop
