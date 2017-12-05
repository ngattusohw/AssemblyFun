#define __SFR_OFFEST 0

#include "avr/io.h"
#include <avr/portpins.h>

.text
.global setup
.global loop
.global one
.global two

setup:
  ldi r16, 0b11111111
  ldi r17, 0b00000000
  ldi r18, 0b01000000

  out DDRB, r16
  out DDRD, r17

loop:
  out PORTB, r18

one:
  lds r20, PORTD
  cpi r20, 0x00
  brne two
  out PORTB, r17
  jmp one
  
two: out PORTB, 16

jmp one
