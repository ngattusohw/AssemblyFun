#include "avr/io.h"


.global loop
.global setup
.global timer
.global again
.global Time

timer:
L1: LDI R18, 255
    nop
    nop
    dec r18
    brne L1
jmp Time

setup:
  ldi r16, 1
  sts DDRB, r16

loop:
  ldi r17, 1
  sts PORTB, r17
Time: jmp timer
  ldi r17, 0b00000000
  sts PORTB, r17
  call timer
  jmp loop
