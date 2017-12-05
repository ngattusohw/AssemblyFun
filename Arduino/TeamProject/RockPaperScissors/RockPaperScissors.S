#include "avr/io.h"
.text
.global setup
.global loop
.global one
.global two

setup:
ldi r16, 0b11000000
sts DDRD, r16
ldi r16, 0b11111111
sts DDRB, r16
ldi r17, 0b00000000


loop:
  one: lds r20, PORTD
  cpi r20, 0x00
  breq two
  sts PORTB, r17
  jmp  one
  
  two: sts PORTB,r16
  jmp  one
