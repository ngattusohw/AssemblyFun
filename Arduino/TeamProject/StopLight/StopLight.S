;Matthew Poltorak & Nick Gattuso
;StopLight

#include "avr/io.h"


.global loop
.global setup
.global timer
.global again
.global Time

REDtimer:
  ldi r17, 250
L4: LDI R18, 250
L5: ldi r19, 250
L6: ldi r20, 250
L7:
    nop
    nop
    dec r19
    brne L7
    dec r18
    brne L5
    dec r17
    brne L4
ret

YELLOWtimer:
  ldi r17, 250
L1: LDI R18, 250
L2: ldi r19, 100
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

GREENtimer:
  ldi r17, 250
L8: LDI R18, 250
L9: ldi r19, 170
L10:
    nop
    nop
    dec r19
    brne L10
    dec r18
    brne L9
    dec r17
    brne L8
ret


red:
  ldi r17, 0b00100000
  sts PORTB, r17
  call REDtimer
  call REDtimer
  ldi r17, 0b00000000
  sts PORTB, r17
ret

yellow:
  ldi r17, 0b00001000
  sts PORTB, r17
  call YELLOWtimer
  ldi r17, 0b00000000
  sts PORTB, r17
ret

green:
  ldi r17, 0b00000010
  sts PORTB, r17
  call GREENtimer
  call GREENtimer
  ldi r17, 0b00000000
  sts PORTB, r17
ret
  
setup:
  ldi r16, 0b00100000
  sts DDRB, r16

loop:
  call green
  call yellow
  call red
  
  
  jmp loop
