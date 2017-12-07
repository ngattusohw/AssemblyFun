#define __SFR_OFFSET 0

#include "avr/io.h"
#include <avr/portpins.h>

.text
.global setup
.global loop


;;;this is basic code to just simply toggle the light on a button switch
setup:
  ldi r16, 0b11111111
  ldi r17, 0b00000000
  ldi r18, 0b00100000
  out DDRB, r16
  out DDRD, r17
  out PORTD, r17

loop:
  out PORTB, r16

one:
  sbis PIND, 2
  jmp two
  out PORTB, r17
  jmp one

two: 
  out PORTB, r16

jmp one
