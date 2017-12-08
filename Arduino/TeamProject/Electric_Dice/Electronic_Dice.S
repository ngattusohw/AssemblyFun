#define __SFR_OFFSET 0

#include "avr/io.h"
#include <avr/portpins.h>

.text
.global setup
.global loop

setup:
  clr r17
  ser r18
  ldi r19, 0
  out DDRB, r18
  out PORTB, r17
  out DDRD, r17
  out PORTD, r17

loop:
  cpi r19, 5
  breq resetRandom
  inc r19
  sbis PIND, 2
  jmp loop
  jmp number
 
number:
  cpi r19, 0
  breq one
  cpi r19, 1
  breq two
  cpi r19, 2
  breq three
  cpi r19, 3
  breq four
  cpi r19, 4
  breq five
  cpi r19, 5
  breq six
  
one:
  ldi r20,0b00001000
  out PORTB,r20
  ret

two:
  ldi r20,0b00010000
  out PORTB,r20
  ret

three:
  ldi r20,0b00101000
  out PORTB, r20
  ret

four:
  ldi r20,0b00101000
  out PORTB,r20
  ret

five:
  ldi r20,0b00111000
  out PORTB,r20
  ret

six:
  ldi r20,0b00110100
  out PORTB,r20
  ret

resetRandom:
  ldi r19, 0
  jmp loop

