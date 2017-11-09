#include "avr/io.h"


.global loop
.global setup
.global timer
.global again
.global Time

timer:
  ldi r17, 5
L1: LDI R18, 100
L2: ldi r19, 250
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

setup:
  ldi r16, 0b00100000
  sts DDRB, r16

loop:
  ldi r17, 0b00100000
  sts PORTB, r17
  call timer
  ldi r17, 0b00000000
  sts PORTB, r17
  call timer
  jmp loop
